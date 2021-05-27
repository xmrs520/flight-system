TARGET = main
CC := gcc
LIB =libmy.a
LIBSO = libmy.so
SHARED = -fPIC -shared
DIRS = .
DIRLIB = -L ./ -lmy
CFLAGS = -I /mnt/hgfs/嵌入式/myXmrs/project_01
SRCS = $(foreach dir,$(DIRS),$(wildcard $(dir)/*c))
OBJ = $(patsubst %.c,%.o,$(SRCS))
AR := ar -cr

RMRF := rm -rf
# 打包静态库
# $(LIB):$(OBJ)
# 	$(AR) $@ $^
#静态库使用
# $(TARGET):$(LIB)
# 	$(CC) -o $@ $^
# 打包动态库
# $(LIBSO):$(SRCS)
# 	$(CC) $(SHARED) $^ -o $@
# 使用动态库
# $(TARGET):$(SRCS)
# 	$(CC) $^ -o $@ $(DIRLIB) $(CFLAGS)
.PHONY:
clear:
	$(RMRF) $(OBJ)
clearAll:
	$(RMRF) $(OBJ) $(TARGET)