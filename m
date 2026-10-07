Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA6B2CA5FFC
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Oct 2026 11:44:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HbXOOT9nl+uysOcJBeZgbpa3FnxAvhWN1MIEa8mVsQA=; b=K5kZ/KK4dohQmuVpTN2fLQFBFA
	9xpSVdj+YzSWgzwBPyXPrLEmGdVt3FVsyXqiUqTA/QimYjasYeIxc0+3fgoG3wBtSuSXOBFd2wd84
	LzWi3kcdSmcZk7nElOMnENVX0Kb4rYxoWujIaGuVoPY8eW9DNEN9D2IyRKsNVOgu8LhKczEtROaDq
	ixYpMAzHiYspAuoIvLv9r6eHaBK6uw1e/QWiKqeo8lNJLNGnZNFJDSLAbcMvVPQw9/eTWqXiP3nIi
	NvJsoHq+Ik3/x0oK/+kGbQ9goTKvIs+ip7cTaeE3j55IRC9nynMfqcQdjX5T7hwDpyzaSoAgJjMBx
	TmLd0HhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEQ3r-00000002Mi0-19j8;
	Wed, 07 Oct 2026 11:43:51 +0000
Received: from mail-pg1-x545.google.com ([2607:f8b0:4864:20::545])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEQ3o-00000002MgB-1b4O
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Oct 2026 11:43:49 +0000
Received: by mail-pg1-x545.google.com with SMTP id 41be03b00d2f7-cd0b795aa8cso467715a12.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 Oct 2026 04:43:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791373427; x=1791978227; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HbXOOT9nl+uysOcJBeZgbpa3FnxAvhWN1MIEa8mVsQA=;
        b=JS0Rc5F7HR1UqyUkX5RQ4L2EARp8/UQKht7hWqgJGrf124YLD6fEfxLgiNHMGviDap
         L8yrXKECa7wFeVthak3ZrN2yf//OqJ+CP5eeUdPXfHIkfkMa4f5XhKdyK3CzWQUXP6o8
         05oW8Age3X/1EK3VkPYBzWxCNlkd1ZCmZM6E93zmIhdEjIIRfd5lpglXJmfXBMnWoi2l
         Hr9cwikh15ud0ixBNn1ZYZC8h6hBvKHo3zcx3wTk7kFzCjTVERzGAErBLdmjusYeu1fk
         r2hrytLs0PAzpY/9O4dR04wVdMpeupk9cv687cS+aFpzS2k1j7W134/H+vCqbeTFeItx
         HVlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791373427; x=1791978227;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HbXOOT9nl+uysOcJBeZgbpa3FnxAvhWN1MIEa8mVsQA=;
        b=c1Y3PNcWn9whKJEvWzJ0c9Cal+5E/0Hd//yIdWuW3jxxTpGAt6Ga2aLSlFHfyMLQaF
         Dh1mWRwBfUon0GNN6GMkBr0v62HOhWtXSR3zRRuvnYDnz6ewoRJV9pR+eKdE7kSPoe8P
         wBus30caMpvGU4xmzoTpX+UAZzXlfKTcjvK5T151qCmI69ncOGhVe0T3s0NoMguEaqyN
         ffHgBuF41rlkfare+220qFoU8FUkPDKsvv8QWR6jvcmAWucjKGSSWRGTE0Z5UFE8G5g7
         D/Lm44muk4nxysOPVKqL9CHbdcmQr2IW2ByuttsTr5XojJ8yjzO2jN0zSoTwWZRndZwi
         sLzA==
X-Forwarded-Encrypted: i=1; AKwUvBzuu6vxDfE6beAyYEKlxxo1u5Cw/iOCE4lLddp9mf+MhOIM3qSrT0K6FchAeMZ69dFZiApkRn/NcPr6aJOzg0Yo@lists.infradead.org
X-Gm-Message-State: AFq9FYLaIVvEJLgxWwFKNYzu629iRAT017t4TxSjOFvh34VX53uOl/qe
	Lt5KkAt16IrvVGQI0YYxZsZo4T+NF6TNayeze3G9+ujhchbb0MC5itDuU27dVQp4/TUszV1cOil
	OzgIUpDlivvz+krJedZFK6m35Sw==
X-Received: from plbjb20.prod.google.com ([2002:a17:903:2594:b0:2e2:f517:75b])
 (user=dylanbhatch job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:ced1:b0:2e2:c94f:25f7 with SMTP id d9443c01a7336-2e5c4f13ec9mr34857265ad.5.1791373426997;
 Wed, 07 Oct 2026 04:43:46 -0700 (PDT)
Date: Wed,  7 Oct 2026 11:43:25 +0000
In-Reply-To: <20261007114335.440322-1-dylanbhatch@google.com>
Mime-Version: 1.0
References: <20261007114335.440322-1-dylanbhatch@google.com>
X-Mailer: git-send-email 2.56.0.360.g66cac248cb-goog
Message-ID: <20261007114335.440322-2-dylanbhatch@google.com>
Subject: [PATCH v8 01/11] arm64, unwind: build kernel with sframe V3 info
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
X-CRM114-CacheID: sfid-20261007_044348_437611_21F3C7A0 
X-CRM114-Status: GOOD (  20.73  )
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
index 65e8a4b5c90b1..36d7ee1f6ea5e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -28537,10 +28537,11 @@ F:	Documentation/driver-api/uio-howto.rst
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
index 7c855e6fe5448..5c2ca98a86786 100644
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
index cab741a695f52..b438d04044486 100644
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
index f6619e1cb2ce7..f6d1f59fb11c3 100644
--- a/arch/arm64/kernel/vdso/Makefile
+++ b/arch/arm64/kernel/vdso/Makefile
@@ -38,7 +38,7 @@ ccflags-y += -DDISABLE_BRANCH_PROFILING -DBUILD_VDSO
 CC_FLAGS_REMOVE_VDSO := $(CC_FLAGS_FTRACE) -Os $(CC_FLAGS_SCS) \
 			$(RANDSTRUCT_CFLAGS) $(KSTACK_ERASE_CFLAGS) \
 			$(GCC_PLUGINS_CFLAGS) \
-			$(CC_FLAGS_LTO) $(CC_FLAGS_CFI) \
+			$(CC_FLAGS_LTO) $(CC_FLAGS_CFI) $(CC_FLAGS_SFRAME) \
 			-Wmissing-prototypes -Wmissing-declarations
 
 CC_FLAGS_ADD_VDSO := -O2 -mcmodel=tiny -fasynchronous-unwind-tables $(CONFIG_CC_OPT_INLINE_MEMSET)
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
2.56.0.360.g66cac248cb-goog


