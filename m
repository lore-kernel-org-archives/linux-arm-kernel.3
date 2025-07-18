Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7ABCCC83F34
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Jul 2025 22:39:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wLNwsWMuJI2qW6psZ/XSLZhNvSth+QDmozusgk4AwUU=; b=Qnixuj53oodu3sX8o7y5zEZzJR
	UnedQV7hopFax+Vl9sK/mq0myJ/6uyFszaf3IPcaqU6oHYYr/CZzRZG3uwgxoqN2I8pMzYSF+0r4/
	YsIOWGrD+uc964+Nik1U/8jAC8o0YQHislduIk2Km/bPby/MsAWX9/v3mZ8t524evTFAS6w5eHFmJ
	pAEjO6nEu8rDNWVdkWs/5kpNDYOFi9qrCefD6Ea+mcGKvKLkEDv/RfQJQJo3Pat6TexJ8vQey1u6j
	OwYLbahIrALM7lhWwvHE90VIgjM+uJ2Z7862yzERW57PMUVAbY1k4DjItQBfSlprOjRviWovz97YW
	9Ta4YDgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uctjD-0000000DYZH-1E0P;
	Fri, 18 Jul 2025 22:38:55 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucteM-0000000DYBR-1ZNV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Jul 2025 22:33:55 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-3138e65efe2so2257563a91.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Jul 2025 15:33:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1752878033; x=1753482833; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=wLNwsWMuJI2qW6psZ/XSLZhNvSth+QDmozusgk4AwUU=;
        b=3w5ZfsGYaWvrRoQJVuJMa1rX7NgrSSQSmMWmh8782tmHb0/1ly9MiBLpP9L8Y7iqRt
         ZICcqdcCOKnFZGMdQsYM4loGpzRchZC5Fd918HZZ93BoCC0RPRL5GpGJ9zk/1H3gy2wd
         w9BjyUEyodOnBXj0jEMsHNWWvTNMytikbmXk04tTWoahRT5A3A+1/Egi3/BnZk8ZxgpF
         jcc47wMseEVRaqlcs/V0VNyHNYavOzOqWFttZOpqMTYky0akob394M38FcwwdMF8PCIA
         RfawFf1MBNI8bKQp4Rv6HS1fQvR3RPobDpULvukGR+gr3+1sMI0X61Ca0qvEjnAg9IM8
         PTvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752878033; x=1753482833;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wLNwsWMuJI2qW6psZ/XSLZhNvSth+QDmozusgk4AwUU=;
        b=NMFYT2KHZb2UowpPHrkagxtgpih+59rWB5dDwfM3HzAoZfICuORI6mgmfT7XufcjVw
         Yf9QibUvLgtrBvYuylnu8rxk3B5//2YV6IslPpXF5txgGX5AlzNDBc3IDF258DFGdcSN
         8dAdal4dfGZXgL3DRh5d9N8lnp+AGGKa4kY99VtUsw78dKrC6qsbsYV0Lk9JcKXEUqfM
         UqkhiGVFM9ui7y5PN1DksYDLABDCkykFkJwllDa0qK9RdVZmozW/+78o1z4kXk5YdRh0
         I3DDX+fSkU+q2Co5fyO3Boat9WcBZushdPfFsJneD7vioVYoJamaHy/TKNp5X9TufWz9
         X7gw==
X-Forwarded-Encrypted: i=1; AJvYcCVqazI7hFvihvIMVKb2TkTdZwpIhtiL0iGT8J9zS7WYlOadbcSYpQsf8FqlzH53GF0RelU2nx0djuZS6V94Aixz@lists.infradead.org
X-Gm-Message-State: AOJu0YxS8bwycKIUc4lXZ0e6aqGmrilxZweZTBZWYWTq/knKUuTIiZoH
	ChUdlPZFqzKuhEdeB/G4ifE06MLsvoHXPsR9tBeiBBunKDZDUTOkXLShdYjW8WQnCgAPV2BL0TX
	r4JxTwpAxjiQ0xy07t/JE7zNhrOwqJg==
X-Google-Smtp-Source: AGHT+IEe+xTUihnDAkAc3U6ajgW2TM/Cn5Jl9867IKn9i7wvbqfMvGRzsT3rj30WxMWgL+wneVXowCfaUZatHchIzP0=
X-Received: from pjbtc15.prod.google.com ([2002:a17:90b:540f:b0:31c:2fe4:33b4])
 (user=samitolvanen job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:564d:b0:312:e744:5b76 with SMTP id 98e67ed59e1d1-31cc2608a4cmr7672725a91.33.1752878033143;
 Fri, 18 Jul 2025 15:33:53 -0700 (PDT)
Date: Fri, 18 Jul 2025 22:33:47 +0000
In-Reply-To: <20250718223345.1075521-5-samitolvanen@google.com>
Mime-Version: 1.0
References: <20250718223345.1075521-5-samitolvanen@google.com>
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=5299; i=samitolvanen@google.com;
 h=from:subject; bh=FeGMABhm61nFtopaseiCFlvAnaScqh+g9nMMwrwAEJc=;
 b=owGbwMvMwCUWxa662nLh8irG02pJDBlVp095Stl4hFR9l0nZwn3S5aa/++KX9ZM521afeSC16
 OmBl/78HaUsDGJcDLJiiiwtX1dv3f3dKfXV5yIJmDmsTCBDGLg4BWAif58y/HeNFk3zsDfjnRhn
 qFTWPYWpcn31hKfrnN/7q4e9YaqUu8Dw34UrJPrQIsmrR154NE+69Cb8nO0VCUnDYtGkx2e4Gu0 mMgMA
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
Message-ID: <20250718223345.1075521-6-samitolvanen@google.com>
Subject: [PATCH bpf-next v11 1/3] cfi: add C CFI type macro
From: Sami Tolvanen <samitolvanen@google.com>
To: bpf@vger.kernel.org, Puranjay Mohan <puranjay@kernel.org>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Andrii Nakryiko <andrii@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Maxwell Bland <mbland@motorola.com>, Sami Tolvanen <samitolvanen@google.com>, 
	Dao Huang <huangdao1@oppo.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250718_153354_417203_DC89A972 
X-CRM114-Status: GOOD (  13.07  )
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
Co-developed-by: Maxwell Bland <mbland@motorola.com>
Signed-off-by: Maxwell Bland <mbland@motorola.com>
Co-developed-by: Sami Tolvanen <samitolvanen@google.com>
Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
Tested-by: Dao Huang <huangdao1@oppo.com>
Acked-by: Will Deacon <will@kernel.org>
---
 arch/riscv/kernel/cfi.c       | 35 +++--------------------------------
 arch/x86/kernel/alternative.c | 31 +++----------------------------
 include/linux/cfi_types.h     | 23 +++++++++++++++++++++++
 3 files changed, 29 insertions(+), 60 deletions(-)

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
index ea1d984166cd..a555665b4d9c 100644
--- a/arch/x86/kernel/alternative.c
+++ b/arch/x86/kernel/alternative.c
@@ -2,6 +2,7 @@
 #define pr_fmt(fmt) "SMP alternatives: " fmt
 
 #include <linux/mmu_context.h>
+#include <linux/cfi_types.h>
 #include <linux/perf_event.h>
 #include <linux/vmalloc.h>
 #include <linux/memory.h>
@@ -1189,37 +1190,11 @@ struct bpf_insn;
 /* Must match bpf_func_t / DEFINE_BPF_PROG_RUN() */
 extern unsigned int __bpf_prog_runX(const void *ctx,
 				    const struct bpf_insn *insn);
-
-KCFI_REFERENCE(__bpf_prog_runX);
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
-KCFI_REFERENCE(__bpf_callback_fn);
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
index 6b8713675765..e5567c0fd0b3 100644
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
+	/* u32 name __ro_after_init = __kcfi_typeid_<func> */			\
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
2.50.0.727.gbf7dc18ff4-goog


