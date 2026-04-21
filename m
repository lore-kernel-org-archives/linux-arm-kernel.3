Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71E9EF94CB6
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Apr 2026 22:52:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ANGrhBV2LcMNZY9HEi2YWokunc4kr3qHq5bEiF7UAk8=; b=aeCKa7uKCVr2Yr0vYmE6/sPnVi
	dSeSOU4J9NTggJARxWmR3x07noN5my9NkgM1r6ibMyt2AqNf7OrrU8K281kCssP9VKhFk/NaWYM3k
	TE9QpZ+6EyvmVhw52BoeaiMwv2YIUTS22ZMnR645gpvw9eFoOOPDRcf8jAwRpGmW9FH9pCRbs0XON
	2+wtL8cMNqNYl2K6btiKtyLNtc/aPxTtmMsFsCf7hHhEb7IL4PEZ1hv+RQe4KVh9XIGvzqg9UrevL
	AQrz0XogcFnylWK19s1Sx6LdRRSNTzW7iZQ4p9OfWpHsqOkXIW135eoCCiJtsiFiTrgEhUwXgmGUQ
	6swXDCdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFJx2-00000009NN3-1pX9;
	Tue, 21 Apr 2026 22:52:16 +0000
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFJx0-00000009NLa-22Ps
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Apr 2026 22:52:15 +0000
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-2b24a00d12cso48433505ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Apr 2026 15:52:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1776811933; x=1777416733; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ANGrhBV2LcMNZY9HEi2YWokunc4kr3qHq5bEiF7UAk8=;
        b=iQeApcKiHeBh/q0GNquciOR7NeYoalUZg2ilYnP42KVqnOp23TneQ7e+shcekE48jo
         434N324ehxXdYT+7Y5iDrAoEg/wmvv8P4H1kOwHWc9m4vE46fpnq0PDird5GlSLQjsdC
         IwnOYaNpWrNGddtwHbTpijRZdPzCu2Fc+TI5VrDS78a0X/3B3vcpCZgTVoOEpAWaBI2D
         ZAfMq/3zajJhPnKxd52jo1phLkaS5v+0T7a8iyJeDdrKGXM6UlgebJoC+AALEbUKMXBt
         zB5MmywFAM9pn+x3zy+x7QgjoeMGpwLnQxxM6JtyoQ0Ji61j0igX2Gm4iizjGacuuuBS
         sQuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776811933; x=1777416733;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ANGrhBV2LcMNZY9HEi2YWokunc4kr3qHq5bEiF7UAk8=;
        b=I2G8uEstyfNli4mhr6fi1T7cWFyHagxNRDN3sFNbcqD0eLHk9Tdj4QoTyfhDJJ5meM
         vZSFsF7GzYeExHUwnBVtbpqUAIS/5+ou7V9UB1X5vvJS93QSbEsDF9R1f7x43bYiDW1X
         jWwTMlzFFt5wusMs/Tr4zC08djT3XOZ4NHaEHV5uaR3olsHjCSuvKB/k/RG10O68EMwq
         mzWo1ufWWhDAjcOVnsaVaQP7JeoRrWZZa+Sfm4D2EhdoY+c2pgaiXNoc8FeCkoKO5i8t
         ayejvqcNIWPP0gq+dUKDVdCtWrku0NZVXrq5pNNH1CnnSEjoeRBnWnqV77x8C3W+DPmj
         sCxA==
X-Forwarded-Encrypted: i=1; AFNElJ8KHYfrruXRxgyN4CD89GfGeyiBQpjo7MnUl3XzcQXphUIn2oSwHw8at98fD74ndFaLnWgTf8lmnv0k2Prtcsie@lists.infradead.org
X-Gm-Message-State: AOJu0YxAjUDMJEgi352FbObalf47Bt7aPgo9qfaDOZFyR0g5bVNfQdL1
	m8iID92KwXN72WSR6eQU3E4KSr9TulTM9e09E+7cYZ2Az6M4jHF+Lf+YukS3ofmRE5zGL6fSwhb
	l41Oz+oeaeVJGO2dDqgZDsvtN/A==
X-Received: from plgb9.prod.google.com ([2002:a17:902:d509:b0:2b2:49fe:d6e9])
 (user=dylanbhatch job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:903:3c43:b0:2ae:6259:5aff with SMTP id d9443c01a7336-2b5f9e77400mr207036455ad.6.1776811933130;
 Tue, 21 Apr 2026 15:52:13 -0700 (PDT)
Date: Tue, 21 Apr 2026 22:51:54 +0000
In-Reply-To: <20260421225200.1198447-1-dylanbhatch@google.com>
Mime-Version: 1.0
References: <20260421225200.1198447-1-dylanbhatch@google.com>
X-Mailer: git-send-email 2.54.0.rc1.555.g9c883467ad-goog
Message-ID: <20260421225200.1198447-3-dylanbhatch@google.com>
Subject: [PATCH v4 2/8] arm64, unwind: build kernel with sframe V3 info
From: Dylan Hatch <dylanbhatch@google.com>
To: Roman Gushchin <roman.gushchin@linux.dev>, Weinan Liu <wnliu@google.com>, 
	Will Deacon <will@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Indu Bhagat <ibhagatgnu@gmail.com>, Peter Zijlstra <peterz@infradead.org>, 
	Steven Rostedt <rostedt@goodmis.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Jiri Kosina <jikos@kernel.org>, Jens Remus <jremus@linux.ibm.com>
Cc: Dylan Hatch <dylanbhatch@google.com>, Mark Rutland <mark.rutland@arm.com>, 
	Prasanna Kumar T S M <ptsm@linux.microsoft.com>, Puranjay Mohan <puranjay@kernel.org>, 
	Song Liu <song@kernel.org>, joe.lawrence@redhat.com, linux-toolchains@vger.kernel.org, 
	linux-kernel@vger.kernel.org, live-patching@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Randy Dunlap <rdunlap@infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260421_155214_558517_887D388E 
X-CRM114-Status: GOOD (  22.60  )
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

Build with -Wa,--gsframe-3 flags to generate a .sframe section. This
will be used for in-kernel reliable stacktrace in cases where the frame
pointer alone is insufficient.

Currently, the sframe format only supports arm64, x86_64 and s390x
architectures.

Signed-off-by: Weinan Liu <wnliu@google.com>
Reviewed-by: Prasanna Kumar T S M <ptsm@linux.microsoft.com>
Signed-off-by: Dylan Hatch <dylanbhatch@google.com>
---
 MAINTAINERS                            |  1 +
 Makefile                               |  8 ++++++++
 arch/Kconfig                           | 21 +++++++++++++++++++++
 arch/arm64/Kconfig                     |  1 +
 arch/arm64/include/asm/unwind_sframe.h |  8 ++++++++
 arch/arm64/kernel/vdso/Makefile        |  2 +-
 include/asm-generic/sections.h         |  4 ++++
 include/asm-generic/vmlinux.lds.h      | 15 +++++++++++++++
 8 files changed, 59 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm64/include/asm/unwind_sframe.h

diff --git a/MAINTAINERS b/MAINTAINERS
index cfc7dec88da4..a7d75f9cb5f4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -27561,6 +27561,7 @@ STACK UNWINDING
 M:	Josh Poimboeuf <jpoimboe@kernel.org>
 M:	Steven Rostedt <rostedt@goodmis.org>
 S:	Maintained
+F:	arch/*/include/asm/unwind_sframe.h
 F:	include/linux/sframe.h
 F:	include/linux/unwind*.h
 F:	kernel/unwind/
diff --git a/Makefile b/Makefile
index 2b15f0b4a0cb..6c94a5257679 100644
--- a/Makefile
+++ b/Makefile
@@ -1110,6 +1110,14 @@ endif
 # Ensure compilers do not transform certain loops into calls to wcslen()
 KBUILD_CFLAGS += -fno-builtin-wcslen
 
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
index d7caf2e245ce..8d27b3249e7a 100644
--- a/arch/Kconfig
+++ b/arch/Kconfig
@@ -520,6 +520,27 @@ config SFRAME_VALIDATION
 
 	  If unsure, say N.
 
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
+	  kernel stack traces. It uses unwind an table that is directly
+	  generated by the toolchain based on DWARF CFI information. In
+	  practice, this can provide more reliable stacktrace results than
+	  unwinding with frame pointers alone.
+
 config HAVE_PERF_REGS
 	bool
 	help
diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index 38dba5f7e4d2..f7ae8eaaadc4 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -112,6 +112,7 @@ config ARM64
 	select ARCH_SUPPORTS_SCHED_SMT
 	select ARCH_SUPPORTS_SCHED_CLUSTER
 	select ARCH_SUPPORTS_SCHED_MC
+	select ARCH_SUPPORTS_UNWIND_KERNEL_SFRAME
 	select ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH
 	select ARCH_WANT_COMPAT_IPC_PARSE_VERSION if COMPAT
 	select ARCH_WANT_DEFAULT_BPF_JIT
diff --git a/arch/arm64/include/asm/unwind_sframe.h b/arch/arm64/include/asm/unwind_sframe.h
new file mode 100644
index 000000000000..876412881196
--- /dev/null
+++ b/arch/arm64/include/asm/unwind_sframe.h
@@ -0,0 +1,8 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _ASM_ARM64_UNWIND_SFRAME_H
+#define _ASM_ARM64_UNWIND_SFRAME_H
+
+#define SFRAME_REG_SP	31
+#define SFRAME_REG_FP	29
+
+#endif /* _ASM_ARM64_UNWIND_SFRAME_H */
diff --git a/arch/arm64/kernel/vdso/Makefile b/arch/arm64/kernel/vdso/Makefile
index 7dec05dd33b7..c60ef921956f 100644
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
diff --git a/include/asm-generic/sections.h b/include/asm-generic/sections.h
index 0755bc39b0d8..336d27011a58 100644
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
index 1e1580febe4b..090da633db92 100644
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
@@ -911,6 +913,19 @@
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
2.54.0.rc1.555.g9c883467ad-goog


