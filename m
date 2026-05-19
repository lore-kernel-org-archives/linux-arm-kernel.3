Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EE83CD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 06:50:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iRKRd4x/pwAScmiYrTs7DHQemJERJH4e04G6xMVKSnw=; b=JSvMGqiVweOzj8HoEEkeKmXZIr
	gywS2omzOq6No3xPs3T3sKz3RF7rxTXHnv0zxWh05X7lq82xLD9BNCYn+ZesqxN4dI1Ylal5wv5xR
	wLw842tZgal+dyj7HAThf/Buc33O/jY62CxEM8+aGNvrf3RVmAlGWU5suPr5s+oYrn543bf3fnfUH
	bCy2iAH43SCidhn+dSKtow1MLnk6M7JQpamJ/+YOrPY9M7ldsBhx2oOgTjXWuakSL89NIZ0IyGLf9
	njnHX5K7788GJduCeJ+X7i7JAK1UMS4xGTJEeAVzjgcOY9zeLgd6GbAELHwFg0Kr1x93kQyUXj6I4
	6sPJqASA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPEHN-00000000OVR-00Qg;
	Tue, 19 May 2026 06:50:13 +0000
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPEHK-00000000OTw-3ONK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 06:50:12 +0000
Received: by mail-pf1-x44a.google.com with SMTP id d2e1a72fcca58-83cecc22d5fso1700557b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 18 May 2026 23:50:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779173409; x=1779778209; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=iRKRd4x/pwAScmiYrTs7DHQemJERJH4e04G6xMVKSnw=;
        b=YjN1GWp2YYiG22hyyWQXEC0tmnVpQzE1kDVwDx4iTifz5xq797JSrTmrfAIu3CzkP9
         88hbLAqsJVpQT0SU4syRsj9mHA+ow2KvCemcd9Pju7rN0V1MEBtSOqdBIhii/hvm33SZ
         Z39Km+o995lDsNHPASMipS7Wv3tfNfbH5vC1YocNgAnXx6STLeSDBYWOamrR+fCYflfo
         w9eQ1jsPlRwakVWIMmeU2uml2ihidLzVefmMJ2oie3Jwo9cX4qQtyvbum7maTM9zIMsv
         fG3Xc4IUdgVfqXlTeJTHpcb/i/LNWnJrovn5Q5zIpHASZ8zLVYq6hEZ+0xEj7KXmghBB
         mT4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779173409; x=1779778209;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iRKRd4x/pwAScmiYrTs7DHQemJERJH4e04G6xMVKSnw=;
        b=Ov0CgQG13ZUtWdAkvcUzIYxQ93Z9iNq0WBVU9FriXpPhbudYaQUAxoCR6v9wk3NHyn
         XECoSG7mwF25Q+TOnjoY7xtKorvMAMc1dIRL6nTYoCU+QQa14/y0tz2pTmyYLwlh3tbd
         hDZiwMYVjunRiGtEVVBbkJu7ekpq60BS0C12fLErKIU9U0D3yXqXMEelPBm7L1fJoh01
         UfuerCxAHBWu7G3TuQzQEpLjuahT5YPtdO0Tv3vSQ6NPTXQ1s/yxwH2x1I9PEAjnLNhh
         ZFBPe3DmzMV4OlzYHNCHLOvOBq4dFYR/Pdw6PlZuKLt0idFS7/Z4z5+iBh4Gb+/5ntjy
         fI5A==
X-Forwarded-Encrypted: i=1; AFNElJ+lMN1ueBQfak/Ny/OwFgiaPSFO/wgblR+kyChZOpxtc6XRAblMOb+Rn7lORSGq5uqJynKtucC1vdbrMnyS1DEK@lists.infradead.org
X-Gm-Message-State: AOJu0Yysj47AeiHZFGSao9QZ/ICHcefbRZnDurXdqIH4rf+WX8fxnk+v
	/Bbga3RRqrdjt/ySsQbLxV06KJVsM8VmfXO5axJkcUfV0btnHU9pc0Wvuz+DTd8eLfct8JeDLQf
	PcJD6SQrEOWyDSOipn7IJccSCAw==
X-Received: from pfnw18.prod.google.com ([2002:aa7:8592:0:b0:83f:64cf:fda3])
 (user=dylanbhatch job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:35ce:b0:82f:cfd2:6ca0 with SMTP id d2e1a72fcca58-83f33ccd7acmr18266477b3a.40.1779173408976;
 Mon, 18 May 2026 23:50:08 -0700 (PDT)
Date: Tue, 19 May 2026 06:49:43 +0000
In-Reply-To: <20260519064950.493949-1-dylanbhatch@google.com>
Mime-Version: 1.0
References: <20260519064950.493949-1-dylanbhatch@google.com>
X-Mailer: git-send-email 2.54.0.563.g4f69b47b94-goog
Message-ID: <20260519064950.493949-3-dylanbhatch@google.com>
Subject: [PATCH v6 2/9] arm64, unwind: build kernel with sframe V3 info
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
X-CRM114-CacheID: sfid-20260518_235010_863284_B4F92325 
X-CRM114-Status: GOOD (  23.64  )
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
 MAINTAINERS                            |  2 +-
 Makefile                               |  8 ++++++++
 arch/Kconfig                           | 21 +++++++++++++++++++++
 arch/arm64/Kconfig                     |  1 +
 arch/arm64/include/asm/unwind_sframe.h |  8 ++++++++
 arch/arm64/kernel/vdso/Makefile        |  2 +-
 include/asm-generic/sections.h         |  4 ++++
 include/asm-generic/vmlinux.lds.h      | 15 +++++++++++++++
 8 files changed, 59 insertions(+), 2 deletions(-)
 create mode 100644 arch/arm64/include/asm/unwind_sframe.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 54613c683fdb..046d06dcdb86 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -27862,8 +27862,8 @@ STACK UNWINDING
 M:	Josh Poimboeuf <jpoimboe@kernel.org>
 M:	Steven Rostedt <rostedt@goodmis.org>
 S:	Maintained
+F:	arch/*/include/asm/unwind_sframe.h
 F:	arch/*/include/asm/unwind_user.h
-F:	arch/*/include/asm/unwind_user_sframe.h
 F:	include/asm-generic/unwind_user.h
 F:	include/linux/sframe.h
 F:	include/linux/unwind*.h
diff --git a/Makefile b/Makefile
index 9f88dcaae382..227fda16deb1 100644
--- a/Makefile
+++ b/Makefile
@@ -1147,6 +1147,14 @@ endif
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
index 6eeafd86347b..f931b5848593 100644
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
index fe60738e5943..c3ef478469e5 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -86,6 +86,7 @@ config ARM64
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
index 60c8c22fd3e4..6aeed39097dd 100644
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
@@ -904,6 +906,19 @@
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
2.54.0.563.g4f69b47b94-goog


