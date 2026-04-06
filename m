Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0921CF46C71
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Apr 2026 18:50:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VpzT+ICu0jB9Dwg0WfUKLLeGWuMQN0uNeEJrD8H4J74=; b=qLMPzCtjVJ1hbr6/gjDEe+7Cpi
	bEVlThdtzhL/EFYGGr5Z08WpOQOI9goR2LgRxRAE0nxu8qaUD5umC/Mqyz+Kz+9QeCqnpvxU8iAwL
	jigwY9/qSclO3OE/FTKlzAPTWIFCZdNOIXwMymuzEDHnKgD8qQqqTYBhj9/VdlJaHyyElXVPrbBgc
	5KdowI+aGm9ivbTy3MuETMFATPqooOSjrgWBs5mSJRP0wZn5HkNu/ke2r1q0d7PzPqkMOz3coeUQS
	MZ3pDZALJ1sF/JdJ/en/Ew36NPvpSYNBX+2P351hphCJnXnhW0SkA6v2uvDfWBahpxijGbTY5kaJX
	pDurDlMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9p1k-00000005POT-2JDL;
	Mon, 06 Apr 2026 18:50:24 +0000
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9p1g-00000005PMG-3mUZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Apr 2026 18:50:22 +0000
Received: by mail-pf1-x44a.google.com with SMTP id d2e1a72fcca58-82c1e1a6cfbso2889544b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Apr 2026 11:50:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775501420; x=1776106220; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=VpzT+ICu0jB9Dwg0WfUKLLeGWuMQN0uNeEJrD8H4J74=;
        b=F7xrnjbxuMSUBu/JxuiNVEcwGaYWm9E32ODfbBh/wqkToCiFFqRtXS8hTGu905zj0S
         GuwZ9oh5d3ryoqLR2fKb64Dd7BVxRvFWSzFpOsk4JXe12K924Xp77U1dTF0uY6KQASI4
         cnScX/n5IYYrUn9nneQTbYytx5xfFw9s6VRChvKBnRIljPgVUeY5MJWTlUhG3ctzM5mQ
         kT3N+eMbqTOHV84En8z6jf987KGc1z3SqpXiLBi0XueMFX2Te+nxnDVVRI9dJH32sZXf
         LIvMyTlJA+9/7dQW6O8v6iOPct6dlz3OhHf1lUSQBD2jXq+i+bnuDxGlf5ChwtdTtkvd
         41IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775501420; x=1776106220;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VpzT+ICu0jB9Dwg0WfUKLLeGWuMQN0uNeEJrD8H4J74=;
        b=UxQ+oRbYHajap65KHhhtyIoUzZoIkCGZBr6UM7dCz33jc9CeKtLKzGFS02bj18wQNT
         +RiNoBkxIiQ4FhmZhyAIhqAfs3NFGMcFV5eBIumedrcPLrDo4H18yDl5nI2wL+hERO9E
         IPciyrOu34VpMaJwLdHs5MiWk+tt5gxZDgDzfZV6SffDyM3uJA3vQlhBx9f12HO1Lk24
         l3g04UUcJj7isr9Rs/+ElqYtf6Sf0lTwzbGLGtPgGROtV7o3SbcX21QimPUjbDNYYpMm
         5nt0w/fRoB/4YgwkHK8tERELTVm7qynsUFR1M/SDNWtKKR3v5ye8TomKkXo6anEXjfw4
         BLHA==
X-Forwarded-Encrypted: i=1; AJvYcCU/9+rVXSGaQ0MUwThW0JV9EH6G3AX9NAkuHCvRFMchftndE7CuFuWfoiOAzh+OajxBLFKqh9FPqzaxjgeME7Y5@lists.infradead.org
X-Gm-Message-State: AOJu0YwfuV3nbzxRAiZ913bKvx8zhbqoo6LL0UB1sBDi1EL3uu0OHo5f
	LxlYMXHQN90RAnjyEG9SX1gtSgo/jZ5tQJtfSzguT84zym33pTZOX3LuXEk82PYy5nmeegveL4r
	6/ty7WPPJ6EQESm5xWPDLI182zA==
X-Received: from pfus21.prod.google.com ([2002:a05:6a00:8d5:b0:824:aec2:e5eb])
 (user=dylanbhatch job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:2e22:b0:7e8:4471:ae55 with SMTP id d2e1a72fcca58-82d0db72eb0mr14262131b3a.33.1775501419533;
 Mon, 06 Apr 2026 11:50:19 -0700 (PDT)
Date: Mon,  6 Apr 2026 18:49:54 +0000
In-Reply-To: <20260406185000.1378082-1-dylanbhatch@google.com>
Mime-Version: 1.0
References: <20260406185000.1378082-1-dylanbhatch@google.com>
X-Mailer: git-send-email 2.53.0.1213.gd9a14994de-goog
Message-ID: <20260406185000.1378082-3-dylanbhatch@google.com>
Subject: [PATCH v3 2/8] arm64, unwind: build kernel with sframe V3 info
From: Dylan Hatch <dylanbhatch@google.com>
To: Roman Gushchin <roman.gushchin@linux.dev>, Weinan Liu <wnliu@google.com>, 
	Will Deacon <will@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Indu Bhagat <indu.bhagat@oracle.com>, Peter Zijlstra <peterz@infradead.org>, 
	Steven Rostedt <rostedt@goodmis.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Jiri Kosina <jikos@kernel.org>
Cc: Dylan Hatch <dylanbhatch@google.com>, Mark Rutland <mark.rutland@arm.com>, 
	Prasanna Kumar T S M <ptsm@linux.microsoft.com>, Puranjay Mohan <puranjay@kernel.org>, 
	Song Liu <song@kernel.org>, joe.lawrence@redhat.com, linux-toolchains@vger.kernel.org, 
	linux-kernel@vger.kernel.org, live-patching@vger.kernel.org, 
	Jens Remus <jremus@linux.ibm.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260406_115020_966139_3A526864 
X-CRM114-Status: GOOD (  21.85  )
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
Signed-off-by: Dylan Hatch <dylanbhatch@google.com>
Reviewed-by: Prasanna Kumar T S M <ptsm@linux.microsoft.com>
---
 MAINTAINERS                            |  1 +
 Makefile                               |  8 ++++++++
 arch/Kconfig                           |  7 +++++++
 arch/arm64/Kconfig                     |  1 +
 arch/arm64/Kconfig.debug               | 13 +++++++++++++
 arch/arm64/include/asm/unwind_sframe.h | 12 ++++++++++++
 arch/arm64/kernel/vdso/Makefile        |  2 +-
 include/asm-generic/vmlinux.lds.h      | 15 +++++++++++++++
 8 files changed, 58 insertions(+), 1 deletion(-)
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
index 2b15f0b4a0cb..e03d09ea6a23 100644
--- a/Makefile
+++ b/Makefile
@@ -1110,6 +1110,14 @@ endif
 # Ensure compilers do not transform certain loops into calls to wcslen()
 KBUILD_CFLAGS += -fno-builtin-wcslen
 
+# build with sframe table
+ifdef CONFIG_SFRAME_UNWINDER
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
index 6695c222c728..c87e489fa978 100644
--- a/arch/Kconfig
+++ b/arch/Kconfig
@@ -520,6 +520,13 @@ config SFRAME_VALIDATION
 
 	  If unsure, say N.
 
+config ARCH_SUPPORTS_SFRAME_UNWINDER
+	bool
+	help
+	  An architecture can select this if it  enables the sframe (Simple
+	  Frame) unwinder for unwinding kernel stack traces. It uses unwind
+	  table that is directly generatedby toolchain based on DWARF CFI information.
+
 config HAVE_PERF_REGS
 	bool
 	help
diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index 38dba5f7e4d2..189bc199ad2e 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -112,6 +112,7 @@ config ARM64
 	select ARCH_SUPPORTS_SCHED_SMT
 	select ARCH_SUPPORTS_SCHED_CLUSTER
 	select ARCH_SUPPORTS_SCHED_MC
+	select ARCH_SUPPORTS_SFRAME_UNWINDER
 	select ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH
 	select ARCH_WANT_COMPAT_IPC_PARSE_VERSION if COMPAT
 	select ARCH_WANT_DEFAULT_BPF_JIT
diff --git a/arch/arm64/Kconfig.debug b/arch/arm64/Kconfig.debug
index 265c4461031f..df291d64812f 100644
--- a/arch/arm64/Kconfig.debug
+++ b/arch/arm64/Kconfig.debug
@@ -20,4 +20,17 @@ config ARM64_RELOC_TEST
 	depends on m
 	tristate "Relocation testing module"
 
+config SFRAME_UNWINDER
+	bool "Sframe unwinder"
+	depends on AS_SFRAME3
+	depends on 64BIT
+	depends on ARCH_SUPPORTS_SFRAME_UNWINDER
+	select SFRAME_LOOKUP
+	help
+	  This option enables the sframe (Simple Frame) unwinder for unwinding
+	  kernel stack traces. It uses unwind table that is directly generated
+	  by toolchain based on DWARF CFI information. In, practice this can
+	  provide more reliable stacktrace results than unwinding with frame
+	  pointers alone.
+
 source "drivers/hwtracing/coresight/Kconfig"
diff --git a/arch/arm64/include/asm/unwind_sframe.h b/arch/arm64/include/asm/unwind_sframe.h
new file mode 100644
index 000000000000..1682c079e387
--- /dev/null
+++ b/arch/arm64/include/asm/unwind_sframe.h
@@ -0,0 +1,12 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _ASM_ARM64_UNWIND_SFRAME_H
+#define _ASM_ARM64_UNWIND_SFRAME_H
+
+#ifdef CONFIG_ARM64
+
+#define SFRAME_REG_SP	31
+#define SFRAME_REG_FP	29
+
+#endif
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
diff --git a/include/asm-generic/vmlinux.lds.h b/include/asm-generic/vmlinux.lds.h
index 1e1580febe4b..0a5c2f6cc4c0 100644
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
 
+#ifdef CONFIG_SFRAME_UNWINDER
+#define SFRAME							\
+	/* sframe */						\
+	.sframe : AT(ADDR(.sframe) - LOAD_OFFSET) {		\
+		__start_sframe_header = .;			\
+		KEEP(*(.sframe))				\
+		KEEP(*(.init.sframe))				\
+		__stop_sframe_header = .;			\
+	}
+#else
+#define SFRAME
+#endif
+
 #ifdef CONFIG_PRINTK_INDEX
 #define PRINTK_INDEX							\
 	.printk_index : AT(ADDR(.printk_index) - LOAD_OFFSET) {		\
-- 
2.53.0.1213.gd9a14994de-goog


