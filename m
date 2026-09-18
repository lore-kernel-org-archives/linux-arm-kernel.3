Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8079EC982D7
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 22:42:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7zP5Ezz25qs4uZUEMPLAi6N7kWIgKe5zo+xnDkfoqL8=; b=z+AEV3nGBNcJruPQwL5aaS9JYK
	1lju+FI7Il2eLWWUJS73jj3j80zhlnQNOELUOAmAn8+F+S9HJp+E4dqL3qVHqs7eGK2vix+LlrhHL
	HOkQjZMftMXxXu9GhHmK98P3HBKlNmciCBViPxWsYlpST9CRIpRXX8ZgNcFEoVLaNtaSOGIoWrSV5
	ZpnJt11deRGNM0LiMvQscLgVaYl9sL5Ptj9h+kGFet+bkUeCaiONSgUWpBN/A5Jn9SM+UEo8gL0hh
	n0pbP/DtYoyK5Fh4Kwr6QpMuCqSdf3BkguCbLuoTKtlQ1rgvly6v3CbJ2aw/zk4aRvPlkMvSsDtCX
	6l/WTALg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7hHa-0000000FdzD-26HS;
	Fri, 18 Sep 2026 22:42:14 +0000
Received: from mail-pg1-x546.google.com ([2607:f8b0:4864:20::546])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7hHS-0000000Fdu1-3kTs
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 22:42:08 +0000
Received: by mail-pg1-x546.google.com with SMTP id 41be03b00d2f7-cc1a439db36so1085155a12.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Sep 2026 15:42:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789771325; x=1790376125; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7zP5Ezz25qs4uZUEMPLAi6N7kWIgKe5zo+xnDkfoqL8=;
        b=V2JMrQgVFo+CvKZDOmh8aAqDo2JKBc2kA8bd5z3yihgKwu2lqGiuDhCz5KArj1WQMz
         0reBQcWci2M3epvBPVaV/miDtfDdc9lfIGyFkCk9KVV/CF2e58pBrbWZ/LYtykirYYQa
         XXG5lxaVm0v/Z3xlY4INaSy8aHffVncj0oOzy+6dd6ahxxM8xElbbu0z5yA1iQ2snGkc
         45sO/K//Cq0ZweFitioO1X6mLFvvZsQ4SbRA05bP5J9rT2CQiofK9l/+Tr81vMNBI4PX
         e5unvMRGVn1VMPl/pxNeWNZtnRk0XIDAbpJGJY06zgLu90KKb8khdMCPSiUZ49GJ29kz
         KXHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789771325; x=1790376125;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7zP5Ezz25qs4uZUEMPLAi6N7kWIgKe5zo+xnDkfoqL8=;
        b=SmjaTNfj6X2Y1CgHrb8eh1eYsNcMm+i+GfuzVIxCzIbbhshIqgdPx6J2zJkIl6EeYe
         3R0cvR0QQzou0utamcqlpTJAN79pXgxmffXIkcpmmITqaFC+iMg1B7/JSdiiq70zJBGo
         /w3mJUl/ms0I4MOekjn6iNDcDMz8i6cGXrmiXaQgEalkQXbZZPk3+CjHMZL9uP8aRSXK
         /0ZZaMiD216qcSo8LvN2NAcAjNb+jlQZA6vs1Jdb3i4fSEfR1fvPS3iFrFHhMZ+sJ0oc
         11ZiQ8OedgLoip06o7fbv0fsHCoyoOUhrpiZXX2jtkEVeeXnzVVoUQntcoGohpH6QJSS
         lzYQ==
X-Forwarded-Encrypted: i=1; AKwUvByfdURejGnfpcWYk59WTa9lOJ5p3XrZ5X/S+mu7JFZY+I4kCGOKNTz18UVgiYlw+5OZEl2KnnLV36lNas6AjNE8@lists.infradead.org
X-Gm-Message-State: AFuF++nbqkw5e4VylKnXfa+1W1nAcF93R4VfrXwjuo3k5m+ZMFd41MIy
	LeeDxgQE7xXKqv21hKUlY4wdRACw+BHuOHB6VFPbDncvbYtU1IN6YznppoQqV4dDmXhkGZJThwU
	/n/wvCt9ykEzjl+4RjcJHiYx3ZA==
X-Received: from pgbcm17.prod.google.com ([2002:a05:6a02:a11:b0:cc4:c7fa:81b0])
 (user=dylanbhatch job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a21:490d:b0:3cc:eea9:f757 with SMTP id adf61e73a8af0-3dd8c466ef5mr7989373637.16.1789771324995;
 Fri, 18 Sep 2026 15:42:04 -0700 (PDT)
Date: Fri, 18 Sep 2026 22:41:47 +0000
In-Reply-To: <20260918224157.1471085-1-dylanbhatch@google.com>
Mime-Version: 1.0
References: <20260918224157.1471085-1-dylanbhatch@google.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <20260918224157.1471085-2-dylanbhatch@google.com>
Subject: [PATCH v7 01/11] arm64, unwind: build kernel with sframe V3 info
From: Dylan Hatch <dylanbhatch@google.com>
To: Roman Gushchin <roman.gushchin@linux.dev>, Weinan Liu <wnliu@google.com>, 
	Will Deacon <will@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Indu Bhagat <ibhagatgnu@gmail.com>, Peter Zijlstra <peterz@infradead.org>, 
	Steven Rostedt <rostedt@goodmis.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Jiri Kosina <jikos@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Jens Remus <jremus@linux.ibm.com>
Cc: Dylan Hatch <dylanbhatch@google.com>, Prasanna Kumar T S M <ptsm@linux.microsoft.com>, 
	Puranjay Mohan <puranjay@kernel.org>, Song Liu <song@kernel.org>, joe.lawrence@redhat.com, 
	linux-toolchains@vger.kernel.org, linux-kernel@vger.kernel.org, 
	live-patching@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Randy Dunlap <rdunlap@infradead.org>, Mostafa Saleh <smostafa@google.com>, 
	Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_154206_990022_99A98ACE 
X-CRM114-Status: GOOD (  21.16  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

To generate a .sframe section, build with -Wa,--gsframe-3 flags. Also,
add unwind-table options to ensure the necessary CFI directives are
emitted by the compiler, but discard .eh_frame unless
CONFIG_UNWIND_TABLES is explicitly enabled.

This will be used for in-kernel reliable stacktrace in
cases where the frame pointer alone is insufficient.

Currently, the sframe format only supports arm64, x86_64 and s390x
architectures.

Co-developed-by: Weinan Liu <wnliu@google.com>
Signed-off-by: Weinan Liu <wnliu@google.com>
Reviewed-by: Prasanna Kumar T S M <ptsm@linux.microsoft.com>
Reviewed-by: Jens Remus <jremus@linux.ibm.com>
Signed-off-by: Dylan Hatch <dylanbhatch@google.com>

---

Changes since v6:
 - Moved to beginning of series
 - Squashed in AS_SFRAME, AS_SFRAME3, and UNWIND_SFRAME_LOOKUP config
   definitions.
 - Squashed in STACK UNWINDING change in MAINTAINERS file.
 - Dropped SFRAME_REG_SP / SFRAME_REG_FP definitions.
 - Added -fasynchronous-unwind-tables so CFI directives are emitted by
   compiler.
 - Discard .eh_frame sections when CONFIG_UNWIND_TABLES is not set.
---
 MAINTAINERS                         |  3 ++-
 Makefile                            |  8 ++++++++
 arch/Kconfig                        | 31 +++++++++++++++++++++++++++++
 arch/arm64/Kconfig                  |  1 +
 arch/arm64/Makefile                 |  2 +-
 arch/arm64/include/asm/module.lds.h |  2 ++
 arch/arm64/kernel/vdso/Makefile     |  2 +-
 arch/arm64/kernel/vmlinux.lds.S     | 12 +++++++++++
 include/asm-generic/sections.h      |  4 ++++
 include/asm-generic/vmlinux.lds.h   | 15 ++++++++++++++
 10 files changed, 77 insertions(+), 3 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index c2414447892c2..6c1c95979e437 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -28514,10 +28514,11 @@ F:	Documentation/driver-api/uio-howto.rst
 F:	drivers/uio/
 F:	include/linux/uio_driver.h
 
-USERSPACE STACK UNWINDING
+STACK UNWINDING
 M:	Josh Poimboeuf <jpoimboe@kernel.org>
 M:	Steven Rostedt <rostedt@goodmis.org>
 S:	Maintained
+F:	arch/*/include/asm/unwind_sframe.h
 F:	include/linux/unwind*.h
 F:	kernel/unwind/
 
diff --git a/Makefile b/Makefile
index 0f1b80100b479..5ed4a59e71aac 100644
--- a/Makefile
+++ b/Makefile
@@ -1197,6 +1197,14 @@ CFLAGS_GCOV	+= $(call try-run,\
 endif
 export CFLAGS_GCOV
 
+# build with sframe table
+ifdef CONFIG_HAVE_UNWIND_KERNEL_SFRAME
+CC_FLAGS_SFRAME := -Wa,--gsframe-3
+KBUILD_CFLAGS	+= $(CC_FLAGS_SFRAME)
+KBUILD_AFLAGS	+= $(CC_FLAGS_SFRAME)
+export CC_FLAGS_SFRAME
+endif
+
 # change __FILE__ to the relative path to the source directory
 ifdef building_out_of_srctree
 KBUILD_CPPFLAGS += -fmacro-prefix-map=$(srcroot)/=
diff --git a/arch/Kconfig b/arch/Kconfig
index 45c6577723623..cc59a5da80915 100644
--- a/arch/Kconfig
+++ b/arch/Kconfig
@@ -507,6 +507,37 @@ config HAVE_UNWIND_USER_FP
 	bool
 	select UNWIND_USER
 
+config AS_SFRAME
+	bool
+
+config AS_SFRAME3
+	def_bool $(as-instr,.cfi_startproc\n.cfi_endproc,-Wa$(comma)--gsframe-3)
+	select AS_SFRAME
+
+config UNWIND_SFRAME_LOOKUP
+	bool
+
+config ARCH_SUPPORTS_UNWIND_KERNEL_SFRAME
+	bool
+	help
+	  An architecture can select this if it enables the SFrame (Simple
+	  Frame) unwinder for unwinding kernel stack traces. It uses an unwind
+	  table that is directly generated by the toolchain based on DWARF CFI
+	  information.
+
+config HAVE_UNWIND_KERNEL_SFRAME
+	bool "Sframe unwinder"
+	depends on AS_SFRAME3
+	depends on 64BIT
+	depends on ARCH_SUPPORTS_UNWIND_KERNEL_SFRAME
+	select UNWIND_SFRAME_LOOKUP
+	help
+	  This option enables the SFrame (Simple Frame) unwinder for unwinding
+	  kernel stack traces. It uses an unwind table that is directly
+	  generated by the toolchain based on DWARF CFI information. In
+	  practice, this can provide more reliable stacktrace results than
+	  unwinding with frame pointers alone.
+
 config HAVE_PERF_REGS
 	bool
 	help
diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index b5a51b0ef9440..041de63a659d1 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -87,6 +87,7 @@ config ARM64
 	select ARCH_SUPPORTS_SCHED_SMT
 	select ARCH_SUPPORTS_SCHED_CLUSTER
 	select ARCH_SUPPORTS_SCHED_MC
+	select ARCH_SUPPORTS_UNWIND_KERNEL_SFRAME
 	select ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH
 	select ARCH_WANT_COMPAT_IPC_PARSE_VERSION if COMPAT
 	select ARCH_WANT_DEFAULT_BPF_JIT
diff --git a/arch/arm64/Makefile b/arch/arm64/Makefile
index 6b005c8fef706..ae1c23579ad2f 100644
--- a/arch/arm64/Makefile
+++ b/arch/arm64/Makefile
@@ -55,7 +55,7 @@ KBUILD_CFLAGS	+= $(call cc-option,-mabi=lp64)
 KBUILD_AFLAGS	+= $(call cc-option,-mabi=lp64)
 
 # Avoid generating .eh_frame* sections.
-ifneq ($(CONFIG_UNWIND_TABLES),y)
+ifeq ($(filter y, $(CONFIG_UNWIND_TABLES) $(CONFIG_HAVE_UNWIND_KERNEL_SFRAME)),)
 KBUILD_CFLAGS	+= -fno-asynchronous-unwind-tables -fno-unwind-tables
 KBUILD_AFLAGS	+= -fno-asynchronous-unwind-tables -fno-unwind-tables
 KBUILD_RUSTFLAGS += -Cforce-unwind-tables=n
diff --git a/arch/arm64/include/asm/module.lds.h b/arch/arm64/include/asm/module.lds.h
index 603f92a8a73ed..034cb635e8bcc 100644
--- a/arch/arm64/include/asm/module.lds.h
+++ b/arch/arm64/include/asm/module.lds.h
@@ -10,5 +10,7 @@ SECTIONS {
 	 * put it into the .init allocation.
 	 */
 	.init.eh_frame 0 : { *(.eh_frame) }
+#elif defined(CONFIG_HAVE_UNWIND_KERNEL_SFRAME)
+	/DISCARD/ : { *(.eh_frame) }
 #endif
 }
diff --git a/arch/arm64/kernel/vdso/Makefile b/arch/arm64/kernel/vdso/Makefile
index 7dec05dd33b70..c60ef921956fb 100644
--- a/arch/arm64/kernel/vdso/Makefile
+++ b/arch/arm64/kernel/vdso/Makefile
@@ -38,7 +38,7 @@ ccflags-y += -DDISABLE_BRANCH_PROFILING -DBUILD_VDSO
 CC_FLAGS_REMOVE_VDSO := $(CC_FLAGS_FTRACE) -Os $(CC_FLAGS_SCS) \
 			$(RANDSTRUCT_CFLAGS) $(KSTACK_ERASE_CFLAGS) \
 			$(GCC_PLUGINS_CFLAGS) \
-			$(CC_FLAGS_LTO) $(CC_FLAGS_CFI) \
+			$(CC_FLAGS_LTO) $(CC_FLAGS_CFI) $(CC_FLAGS_SFRAME) \
 			-Wmissing-prototypes -Wmissing-declarations
 
 CC_FLAGS_ADD_VDSO := -O2 -mcmodel=tiny -fasynchronous-unwind-tables
diff --git a/arch/arm64/kernel/vmlinux.lds.S b/arch/arm64/kernel/vmlinux.lds.S
index af1d720209764..eb1f54829503c 100644
--- a/arch/arm64/kernel/vmlinux.lds.S
+++ b/arch/arm64/kernel/vmlinux.lds.S
@@ -145,14 +145,25 @@ jiffies = jiffies_64;
 #endif
 
 #ifdef CONFIG_UNWIND_TABLES
+
 #define UNWIND_DATA_SECTIONS				\
 	.eh_frame : {					\
 		__pi___eh_frame_start = .;		\
 		*(.eh_frame)				\
 		__pi___eh_frame_end = .;		\
 	}
+#define SFRAME_DISCARDS
+
+#elif defined(CONFIG_HAVE_UNWIND_KERNEL_SFRAME)
+
+#define UNWIND_DATA_SECTIONS
+#define SFRAME_DISCARDS *(.eh_frame)
+
 #else
+
 #define UNWIND_DATA_SECTIONS
+#define SFRAME_DISCARDS
+
 #endif
 
 /*
@@ -184,6 +195,7 @@ SECTIONS
 		*(.interp .dynamic)
 		*(.dynsym .dynstr .hash .gnu.hash)
 		*(.ARM.attributes)
+		SFRAME_DISCARDS
 	}
 
 	. = KIMAGE_VADDR;
diff --git a/include/asm-generic/sections.h b/include/asm-generic/sections.h
index 0755bc39b0d80..336d27011a580 100644
--- a/include/asm-generic/sections.h
+++ b/include/asm-generic/sections.h
@@ -31,6 +31,7 @@
  *	__irqentry_text_start, __irqentry_text_end
  *	__softirqentry_text_start, __softirqentry_text_end
  *	__start_opd, __end_opd
+ *	__start_sframe, __end_sframe
  */
 extern char _text[], _stext[], _etext[];
 extern char _data[], _sdata[], _edata[];
@@ -53,6 +54,9 @@ extern char __ctors_start[], __ctors_end[];
 /* Start and end of .opd section - used for function descriptors. */
 extern char __start_opd[], __end_opd[];
 
+/* Start and end of .sframe section - used for stack unwinding. */
+extern char __start_sframe[], __end_sframe[];
+
 /* Start and end of instrumentation protected text section */
 extern char __noinstr_text_start[], __noinstr_text_end[];
 
diff --git a/include/asm-generic/vmlinux.lds.h b/include/asm-generic/vmlinux.lds.h
index b2988aa12f664..278f5764d990d 100644
--- a/include/asm-generic/vmlinux.lds.h
+++ b/include/asm-generic/vmlinux.lds.h
@@ -491,6 +491,8 @@
 		*(.rodata1)						\
 	}								\
 									\
+	SFRAME								\
+									\
 	/* PCI quirks */						\
 	.pci_fixup        : AT(ADDR(.pci_fixup) - LOAD_OFFSET) {	\
 		BOUNDED_SECTION_PRE_LABEL(.pci_fixup_early,  _pci_fixups_early,  __start, __end) \
@@ -912,6 +914,19 @@
 #define TRACEDATA
 #endif
 
+#ifdef CONFIG_HAVE_UNWIND_KERNEL_SFRAME
+#define SFRAME							\
+	/* sframe */						\
+	.sframe : AT(ADDR(.sframe) - LOAD_OFFSET) {		\
+		__start_sframe = .;			\
+		KEEP(*(.sframe))				\
+		KEEP(*(.init.sframe))				\
+		__end_sframe = .;			\
+	}
+#else
+#define SFRAME
+#endif
+
 #ifdef CONFIG_PRINTK_INDEX
 #define PRINTK_INDEX							\
 	.printk_index : AT(ADDR(.printk_index) - LOAD_OFFSET) {		\
-- 
2.55.0.1082.g2b9226bbc0-goog


