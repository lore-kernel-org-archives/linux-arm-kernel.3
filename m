Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D0F4C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Mar 2025 22:33:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AjPf2shQRLMRmBXrAUCw8IKmWn8Iwh7animLlBVPN6M=; b=GHtiHCvpzfO3/L5+/twpTQ6Kye
	PaSn6FJAuRzQa2G+xp7uQ4poX4NIyIsN0SmKdvynsjqGEB5+MVzso9lyyWKqPo9mTgHaLxZB8pigy
	ARQ82YbbGx44sz8Rk3gcNskxetI7NRoyw6a8cnbbHBAr60Uqy+UobX3eFcvWkyet2Q1Dmc/zlIqOh
	ZrsfynWAUIZ/ty7tecs/rZanOQomLjlGuk5IJ0yfkGNSjJvcGrtruB/Aa1FDNNhMRQ/Qb4SC88rUW
	5ARXVKixF7D1+smFjaHA9W3cXt7NUqFOr3+cQREsRkq+LfzCgW3Qo8FPKMzLdoXIETzI9pqkxK+LD
	6TfYdWzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trlgU-000000048SM-0XV2;
	Mon, 10 Mar 2025 22:33:18 +0000
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trldD-0000000485g-1olj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Mar 2025 22:29:56 +0000
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-2242ade807fso101756365ad.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Mar 2025 15:29:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1741645793; x=1742250593; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=AjPf2shQRLMRmBXrAUCw8IKmWn8Iwh7animLlBVPN6M=;
        b=rZFjVTflGRby+ff4JaILKXpIGVSSo62Kw+SxikQngRpQdd26csOfeceebFBZy2/+/Q
         0E+XCkpS8kPm2oviBgsBrpdqrt9i3fzM7HmHdXuweX4Eh12swvNz3JXBo0UjueFjpBxP
         EQsoSELaz41m5OpcfG9z9f3ux9INcnmxU7xTpb0+ggeTLoOx0ELy4cbwY2uOXoaS756Q
         MrQlrR2nEI3xGiEV/DRnoNuPMYUeezzLwJ0k4f2bPY1n6+cYZk92MVv7LqjmPNC3aZLX
         K6DtRByFQw10vGxZf40t9IPXaSeFzXhmdsYdsgaNxl+S0thSlc+NMnhigz4Mrju6MlzF
         NXqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741645793; x=1742250593;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AjPf2shQRLMRmBXrAUCw8IKmWn8Iwh7animLlBVPN6M=;
        b=o+Jtu8j0ybs13go4TXq/84uMEgk0dt0JUOYQqk5OzVhtlHHIqMJV4LzcQFTpSp0UDa
         jKjMU2+eic2vfHXtv9KkVErEVG0q4b0Eg98ardM2NEmtsMgDFiHyplhW9G1eyIPaUuaY
         +auz4OEgQiJhu18Vjw3XaKjIRuBbTgOE3KTMZk1qxsBUA3OB5pNrOfhlZ+iY2QpJJpuv
         5qIIpJP17bV/y/8CuC+7oJ2oGoBhZl2oljVkQwtl0FX3cDxStD0khCGSw38ZHwPYmi4z
         qm6JtFPdfzGAug+ZXezN6Zg1hII+L7/ODZtBuXfHEjsJz05hvRl54XGS6tHObQ49U45O
         Gj/A==
X-Forwarded-Encrypted: i=1; AJvYcCVmINTTZfmb3nP9R5am+kUOJf6EkYEHEdgFairfgvOcYIqN2GuB+6cykAJtNmBEUmTkxgAQ0oRx3AFqROVh7vMp@lists.infradead.org
X-Gm-Message-State: AOJu0YyCMgNrYyofqaWe8x2wwUiwbGT6HLLE04zdixvj+/vuEKlOXny2
	lwLuWdcKCU0RHRIZUXglOBcxH+za6EGqxMD7hah+oJzn34nZGVDCdcVIcUcKyeRJdZydqt/Eliw
	CEkSRa3Wx8yv0Nsd4LzcpWlS4XA==
X-Google-Smtp-Source: AGHT+IE81DnApalhSNa6Q+gumvBFHqSIx0AsWk7ET6yIBgX5IzlABVRR0oTugyRM8zrJx3fOpk/9aoT2bCShvufrS74=
X-Received: from pfqf15.prod.google.com ([2002:aa7:9d8f:0:b0:736:a70b:53c7])
 (user=samitolvanen job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:14d1:b0:730:8ed8:6cd0 with SMTP id d2e1a72fcca58-736aaadf579mr20796495b3a.16.1741645793503;
 Mon, 10 Mar 2025 15:29:53 -0700 (PDT)
Date: Mon, 10 Mar 2025 22:29:44 +0000
In-Reply-To: <20250310222942.1988975-4-samitolvanen@google.com>
Mime-Version: 1.0
References: <20250310222942.1988975-4-samitolvanen@google.com>
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=5315; i=samitolvanen@google.com;
 h=from:subject; bh=W+jggK7C/5PYdHixfxJP9xMmc6GBQiiKBsu4nn5qYP4=;
 b=owGbwMvMwCEWxa662nLh8irG02pJDOnn02/Nc2Fhu8TSPOX3R9mDq+6o7lzq6Ob9/Gm3vS8n3
 8nVP7PZO0pZGMQ4GGTFFFlavq7euvu7U+qrz0USMHNYmUCGMHBxCsBEwiwYGTYGzLuU9evUmn3M
 2fMcwpRKIv20qtLuHGbYKmMTF6LK/ZHhf32kqsDuWKPo43c9Pc//LF//iDfzwk2TtOv1p2c83F3 9gwsA
X-Mailer: git-send-email 2.49.0.rc0.332.g42c0ae87b1-goog
Message-ID: <20250310222942.1988975-5-samitolvanen@google.com>
Subject: [PATCH bpf-next v8 1/2] cfi: add C CFI type macro
From: Sami Tolvanen <samitolvanen@google.com>
To: bpf@vger.kernel.org
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Puranjay Mohan <puranjay12@gmail.com>, Maxwell Bland <mbland@motorola.com>, 
	Sami Tolvanen <samitolvanen@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_152955_477332_4698AA10 
X-CRM114-Status: GOOD (  13.55  )
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

From: Mark Rutland <mark.rutland@arm.com>

Currently x86 and riscv open-code 4 instances of the same logic to
define a u32 variable with the KCFI typeid of a given function.

Replace the duplicate logic with a common macro.

Signed-off-by: Mark Rutland <mark.rutland@arm.com>
Co-Developed-by: Maxwell Bland <mbland@motorola.com>
Signed-off-by: Maxwell Bland <mbland@motorola.com>
Co-Developed-by: Sami Tolvanen <samitolvanen@google.com>
Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
---
 arch/riscv/kernel/cfi.c       | 35 +++--------------------------------
 arch/x86/kernel/alternative.c | 35 +++--------------------------------
 include/linux/cfi_types.h     | 23 +++++++++++++++++++++++
 3 files changed, 29 insertions(+), 64 deletions(-)

diff --git a/arch/riscv/kernel/cfi.c b/arch/riscv/kernel/cfi.c
index 64bdd3e1ab8c..e7aec5f36dd5 100644
--- a/arch/riscv/kernel/cfi.c
+++ b/arch/riscv/kernel/cfi.c
@@ -4,6 +4,7 @@
  *
  * Copyright (C) 2023 Google LLC
  */
+#include <linux/cfi_types.h>
 #include <linux/cfi.h>
 #include <asm/insn.h>
 
@@ -82,41 +83,11 @@ struct bpf_insn;
 /* Must match bpf_func_t / DEFINE_BPF_PROG_RUN() */
 extern unsigned int __bpf_prog_runX(const void *ctx,
 				    const struct bpf_insn *insn);
-
-/*
- * Force a reference to the external symbol so the compiler generates
- * __kcfi_typid.
- */
-__ADDRESSABLE(__bpf_prog_runX);
-
-/* u32 __ro_after_init cfi_bpf_hash = __kcfi_typeid___bpf_prog_runX; */
-asm (
-"	.pushsection	.data..ro_after_init,\"aw\",@progbits	\n"
-"	.type	cfi_bpf_hash,@object				\n"
-"	.globl	cfi_bpf_hash					\n"
-"	.p2align	2, 0x0					\n"
-"cfi_bpf_hash:							\n"
-"	.word	__kcfi_typeid___bpf_prog_runX			\n"
-"	.size	cfi_bpf_hash, 4					\n"
-"	.popsection						\n"
-);
+DEFINE_CFI_TYPE(cfi_bpf_hash, __bpf_prog_runX);
 
 /* Must match bpf_callback_t */
 extern u64 __bpf_callback_fn(u64, u64, u64, u64, u64);
-
-__ADDRESSABLE(__bpf_callback_fn);
-
-/* u32 __ro_after_init cfi_bpf_subprog_hash = __kcfi_typeid___bpf_callback_fn; */
-asm (
-"	.pushsection	.data..ro_after_init,\"aw\",@progbits	\n"
-"	.type	cfi_bpf_subprog_hash,@object			\n"
-"	.globl	cfi_bpf_subprog_hash				\n"
-"	.p2align	2, 0x0					\n"
-"cfi_bpf_subprog_hash:						\n"
-"	.word	__kcfi_typeid___bpf_callback_fn			\n"
-"	.size	cfi_bpf_subprog_hash, 4				\n"
-"	.popsection						\n"
-);
+DEFINE_CFI_TYPE(cfi_bpf_subprog_hash, __bpf_callback_fn);
 
 u32 cfi_get_func_hash(void *func)
 {
diff --git a/arch/x86/kernel/alternative.c b/arch/x86/kernel/alternative.c
index c71b575bf229..a9f415e873dd 100644
--- a/arch/x86/kernel/alternative.c
+++ b/arch/x86/kernel/alternative.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0-only
 #define pr_fmt(fmt) "SMP alternatives: " fmt
 
+#include <linux/cfi_types.h>
 #include <linux/module.h>
 #include <linux/sched.h>
 #include <linux/perf_event.h>
@@ -934,41 +935,11 @@ struct bpf_insn;
 /* Must match bpf_func_t / DEFINE_BPF_PROG_RUN() */
 extern unsigned int __bpf_prog_runX(const void *ctx,
 				    const struct bpf_insn *insn);
-
-/*
- * Force a reference to the external symbol so the compiler generates
- * __kcfi_typid.
- */
-__ADDRESSABLE(__bpf_prog_runX);
-
-/* u32 __ro_after_init cfi_bpf_hash = __kcfi_typeid___bpf_prog_runX; */
-asm (
-"	.pushsection	.data..ro_after_init,\"aw\",@progbits	\n"
-"	.type	cfi_bpf_hash,@object				\n"
-"	.globl	cfi_bpf_hash					\n"
-"	.p2align	2, 0x0					\n"
-"cfi_bpf_hash:							\n"
-"	.long	__kcfi_typeid___bpf_prog_runX			\n"
-"	.size	cfi_bpf_hash, 4					\n"
-"	.popsection						\n"
-);
+DEFINE_CFI_TYPE(cfi_bpf_hash, __bpf_prog_runX);
 
 /* Must match bpf_callback_t */
 extern u64 __bpf_callback_fn(u64, u64, u64, u64, u64);
-
-__ADDRESSABLE(__bpf_callback_fn);
-
-/* u32 __ro_after_init cfi_bpf_subprog_hash = __kcfi_typeid___bpf_callback_fn; */
-asm (
-"	.pushsection	.data..ro_after_init,\"aw\",@progbits	\n"
-"	.type	cfi_bpf_subprog_hash,@object			\n"
-"	.globl	cfi_bpf_subprog_hash				\n"
-"	.p2align	2, 0x0					\n"
-"cfi_bpf_subprog_hash:						\n"
-"	.long	__kcfi_typeid___bpf_callback_fn			\n"
-"	.size	cfi_bpf_subprog_hash, 4				\n"
-"	.popsection						\n"
-);
+DEFINE_CFI_TYPE(cfi_bpf_subprog_hash, __bpf_callback_fn);
 
 u32 cfi_get_func_hash(void *func)
 {
diff --git a/include/linux/cfi_types.h b/include/linux/cfi_types.h
index 6b8713675765..209c8a16ac4e 100644
--- a/include/linux/cfi_types.h
+++ b/include/linux/cfi_types.h
@@ -41,5 +41,28 @@
 	SYM_TYPED_START(name, SYM_L_GLOBAL, SYM_A_ALIGN)
 #endif
 
+#else /* __ASSEMBLY__ */
+
+#ifdef CONFIG_CFI_CLANG
+#define DEFINE_CFI_TYPE(name, func)						\
+	/*									\
+	 * Force a reference to the function so the compiler generates		\
+	 * __kcfi_typeid_<func>.						\
+	 */									\
+	__ADDRESSABLE(func);							\
+	/* u32 name = __kcfi_typeid_<func> */					\
+	extern u32 name;							\
+	asm (									\
+	"	.pushsection	.data..ro_after_init,\"aw\",@progbits	\n"	\
+	"	.type	" #name ",@object				\n"	\
+	"	.globl	" #name "					\n"	\
+	"	.p2align	2, 0x0					\n"	\
+	#name ":							\n"	\
+	"	.4byte	__kcfi_typeid_" #func "				\n"	\
+	"	.size	" #name ", 4					\n"	\
+	"	.popsection						\n"	\
+	);
+#endif
+
 #endif /* __ASSEMBLY__ */
 #endif /* _LINUX_CFI_TYPES_H */
-- 
2.49.0.rc0.332.g42c0ae87b1-goog


