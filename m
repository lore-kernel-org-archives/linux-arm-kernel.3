Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04CD6FF886D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 18:37:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MgLPe5eAKuVa5a2kQmP4Ur6cn6qfh4/sYx0yOH1k728=; b=iY2o1pMNtR+w7rj20njnR4swMa
	GNLTtYlMS7J7OcaSXvJ54ZSk5Zm0tGwP7nyiYxY8UQk/toQCZNKgTpmknt7o93+Ut7HQGOWb3vTpI
	2efmeZB2FtsqNK7vs4Fvtm3zYEAwCTN1VPu6BgWxxQq9RaHpuB1yqaP2HNwGVVf30yWH8GPJLhklj
	nS+W6OXiijvtwzpTUPsGIsXhSVglRTE+HUzUTH1uljOtl9+PzSA4vygXhptgkLlfIgxrTnzD1E87L
	9AmV6BoZj6ZMLAMHTazz309w4oKl28tQq4kx+5owYnJGVm/thB+G8EHJa1xSBKIOUN6kVqVkW2LxK
	4iOcjHcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHnJ6-000000026KO-2DGP;
	Tue, 28 Apr 2026 18:37:16 +0000
Received: from mail-pf1-x449.google.com ([2607:f8b0:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHnJ3-000000026Iu-1Gon
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Apr 2026 18:37:14 +0000
Received: by mail-pf1-x449.google.com with SMTP id d2e1a72fcca58-82f6e6a3a76so14159510b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Apr 2026 11:37:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777401432; x=1778006232; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=MgLPe5eAKuVa5a2kQmP4Ur6cn6qfh4/sYx0yOH1k728=;
        b=XtTbA3NhnNmRCXSlrZMSIPPHcMURfTiWvi7ScKqt/w7GWo19olpQGkpaH9UoI0I1Cj
         4jswzHUzIaEZpFGZ5muJ2d6lcVrnEBywINIvJjPSL6WTxXYFvU68AR3aNa4m92q7XMXf
         uKZoSP5/yG6WhZpZXEiI1GYtXjPSXJz6Im12T7Nxy2gI9yomB5GLtKGttggx/U2aQW2m
         aLz4cbBPVFehb9nXZ0Lty/Ec5v+AX9PyBWjGcoNMKhjV33lVEBfFv+nNA/5S92rvgQWd
         BCxJnWP5JlE28lDbR9xkUfzHVwafdD50kqgWrpCbQYTI5nQ74DjRcxU/vseS00Wg1iGr
         MTmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777401432; x=1778006232;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MgLPe5eAKuVa5a2kQmP4Ur6cn6qfh4/sYx0yOH1k728=;
        b=TwHw/qBXvWww8ytzQjpD7XYujeUMmgYOh6vjdd1PrYSz1L1XRC4oLb0EAVfRVkBXdI
         yFVcQoBwUR+W+kIq6lyh+vp36RVYrFp1vkRyvCwCd62mxm4/jzeCh61I2TsJtXo5pzKB
         otnnTcDM95elYPI0WfoXhm7TeFh21Dis7y7P6bENRaBlmwZdFrQlLZXL6OH/SMmk1MqV
         B9WULEJ1m6yQ8ppcWd7VtJuyj5j/Zhj5JRMqYGNLo7oRViTvYrtB70bqPtl1QLGzA007
         r3vnLK4+qigO1HzacM7EiOpA7BfUgGCpMbRKsfM2XCdzNOf27F5lsUTWXhr7XpHUuPlP
         f/+w==
X-Forwarded-Encrypted: i=1; AFNElJ/Zr/AhDRYXbPvcPaFhzIyDC3ONU6QK+rFysaicuqKbn8fKgmP2xa/ng19gtWh9MS9mRX0xcYIeNx2n0FIERKZY@lists.infradead.org
X-Gm-Message-State: AOJu0YyjR9YCF70mZqghv0TmbTm58FoNJbY0TTI99em+AfikXITDciRK
	4LhYWEVKSxmWT/z4O+x0gECtQkv37VokwoMUWSN4H2CyVNzjtxFFT9c3VnuYxGFR+v3HRAp5+e7
	gXHZiVE2iTZvovi1wfosDwZ8Cng==
X-Received: from pfnw4.prod.google.com ([2002:aa7:8584:0:b0:82f:473b:a2d5])
 (user=dylanbhatch job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:340c:b0:82d:2086:de2a with SMTP id d2e1a72fcca58-834ddc643d1mr4609851b3a.35.1777401431392;
 Tue, 28 Apr 2026 11:37:11 -0700 (PDT)
Date: Tue, 28 Apr 2026 18:36:37 +0000
In-Reply-To: <20260428183643.3796063-1-dylanbhatch@google.com>
Mime-Version: 1.0
References: <20260428183643.3796063-1-dylanbhatch@google.com>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
Message-ID: <20260428183643.3796063-3-dylanbhatch@google.com>
Subject: [PATCH v5 2/8] arm64, unwind: build kernel with sframe V3 info
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
X-CRM114-CacheID: sfid-20260428_113713_354583_C8174BF3 
X-CRM114-Status: GOOD (  22.76  )
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
Reviewed-by: Jens Remus <jremus@linux.ibm.com>
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
2.54.0.545.g6539524ca2-goog


