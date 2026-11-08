ENTRY(boot)

SECTIONS {
    . = 0x80200000; /* Typical load address for RISC-V virt machine */

    .text : {
        KEEP(*(.text.boot))
        *(.text .text.*)
    }

    .rodata : {
        *(.rodata .rodata.*)
    }

    .data : {
        *(.data .data.*)
    }

    .bss : {
        __bss = .;
        *(.bss .bss.*)
        *(COMMON)
        __bss_end = .;
    }

    . = ALIGN(4);
    . += 128 * 1024; /* 128KB stack space */
    __stack_top = .;
}