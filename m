Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EEA0C87FD2
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Aug 2025 00:23:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=poiKJPDAvEHBQ9ZH/JWYvRgnnVIaGPMPEIr2//brmzk=; b=un2Ld1EG4Crc5Lwdycva6C88vF
	SMtozedyH94PCOBApsDZ1IrrnGoZvgThAwzUGxdIA6IA1eHyzLMLQtU3FPluzu4pbWWNZvxx4bGsA
	Nq061KtKauC4FulVE+a1nbzI8LTnawN6MM9hCQ49tGHXq4inJ2L1RWA3I0gDxWKfKcSZfnqGKiNB5
	AL9R9p7N9CgI0y3BVaQnvUBEIfA2IuSOeDpxw0YJIPqC+mGDmKvbUDWKk35BN7gaq6D11GjbiN7SF
	oLHmIZjGOExzpInXHzPu7j+ob5BylIhwWOk0b+Q9IKdeoS+WU4UOxNUzWNCqKnJk8AC40pX+4vyjd
	+tolc53w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhdYM-00000004jDh-2Svk;
	Fri, 01 Aug 2025 00:23:18 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhdLy-00000004i77-0uzL
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 01 Aug 2025 00:10:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=poiKJPDAvEHBQ9ZH/JWYvRgnnVIaGPMPEIr2//brmzk=; b=AUgI59RJtTT2GwuDxAHJCqdjZ/
	1bSMlPea+pDES0JhElkdUhQkFZFTLI65LKK3QWIv1dRGK4/2Qz3Diz4d/I6H1fwSyqrKbMUNbVH4k
	kL3SEEAA7z/h8J752guxLmMD6TgNnvf3t9h2pJRGPRvhB2kuYrJKstvN51re8vYnpv8Uvi2nK/aJ/
	8YGogXF7/qiMjDNXLlVGvCnD1LfcKbwysAzFgkx4RaF4OoczxxiQD2i0CCWFx4ysk2mrtHZbs0OdJ
	khWXsNXKHcXdj8Uo7OSGnQcodQorUQMTTFEl8GE1nk9UY+9aBGJGXvw00HiqHpt20DMBk+WvclkEM
	3crQmhkA==;
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhdLl-0000000DBDT-2ZB6
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Aug 2025 00:10:25 +0000
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-235dd77d11fso10824155ad.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 31 Jul 2025 17:10:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1754007011; x=1754611811; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=poiKJPDAvEHBQ9ZH/JWYvRgnnVIaGPMPEIr2//brmzk=;
        b=hNdh8emz0G5dtVVXX+qYIeYwwuW+QFYprSiFcyXv/nn8unblIELV5BPHezilpthwlp
         a2I875ulZhjYcO4d6/eGdR+7PXyFkEcZIPm1pYlzSm1N78DOOw/Ug6Fsz+a6bRnJCIou
         jftBYJvxq7twhB1okPPivhpAcQuB0JpH+0gulY8Q/F1Kt2ggqhM6ya/DnI4ltS9Nx0yV
         A6PPIjnoglIqZXLjAhi1xEhF895XYXnTtMfII7cTi8bRQYqQHZ7FdOgz+q5MbuDFSfVC
         PV3AN7Hy1NNrzp+DgJxT6ON6yzfrI9bfSSTqrj2EC087IS/NuRlnUWaSQEvsUZMr9igW
         gIbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754007011; x=1754611811;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=poiKJPDAvEHBQ9ZH/JWYvRgnnVIaGPMPEIr2//brmzk=;
        b=O65G1S+vQpJXGgWckCvJWSJB+zPotXdTiWRvshtdM5XbddNHSAX9eJZOYE4T548Ftt
         21HjFjzriW1CX7zrLcEPKCJ7WNuShJ5ztntKFrHmPG1e7k9cSnxdjV45FB64i+xTQCfP
         XxjgOfDoLNYe1lxql1QGykqWwoDLWfWQa6eHwzGmeKgGPNVMfxOPJBTLv6eKUarXbgis
         Q6HUfLELY3/cy/0R5jrgebdHCFAdAvPY2hYycZLrsxT3r5OmnW7IDipsnDpa+3rnXB+1
         IhU24h3wYuyVwSBYFxoJGOn2G+BnwBDvZm1JzSj0YJOwIluItouARME2e7x0Drp53bIe
         p5rQ==
X-Forwarded-Encrypted: i=1; AJvYcCWNgFIyMV3omG51QGIlxPkmM86YlRnI90rw28QD4sUalM630m3wBKH6zq8jP0Urvsp1PIJnsrshhJRAqv6lwUlC@lists.infradead.org
X-Gm-Message-State: AOJu0YxI8iGGEI3YGkofcE+MGTaj5n/Up2jGSc3u/rquV0csyAZ6WemC
	8XShVo5wDFArbAnEaGMJxfeMjFWt/hfpwNG3C85rVD0Kogk/IZpul+Z76Q/YKKc71F06c7Wr/Cq
	/iyScDa0qHK7ilxIlJf9/wkiGpxEHgw==
X-Google-Smtp-Source: AGHT+IFKyym2jSAq6psdrRc/ipyIKLbA+9hAXRHr66syLBauUDoypbT6qP5GB3MHoJA1koWrGeXBIVJBOnLhYXTXqKI=
X-Received: from plfn6.prod.google.com ([2002:a17:902:e546:b0:23f:8c3f:e0fc])
 (user=samitolvanen job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:c402:b0:240:9dd8:2194 with SMTP id d9443c01a7336-2422a54c85amr9358745ad.22.1754007011127;
 Thu, 31 Jul 2025 17:10:11 -0700 (PDT)
Date: Fri,  1 Aug 2025 00:10:06 +0000
In-Reply-To: <20250801001004.1859976-5-samitolvanen@google.com>
Mime-Version: 1.0
References: <20250801001004.1859976-5-samitolvanen@google.com>
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=5301; i=samitolvanen@google.com;
 h=from:subject; bh=AqApxnnbLj039bMEAWEC+U8byw63lx5ks8eO2c5sGYg=;
 b=owGbwMvMwCUWxa662nLh8irG02pJDBk9rHe0q00PfWo2NbFYHRIjeEoqP1tIwui7lXFe845dk
 S0bl8h0lLIwiHExyIopsrR8Xb1193en1FefiyRg5rAygQxh4OIUgIkoMTIyfF/udTVT0czDROwk
 b2Gok0ZqoNyrFfFHOM32LFy5MF2MneG/Q+iJnTmpHudmrmy303ZbHrSw3r1z2+FHNY4p9QHuMyL YAA==
X-Mailer: git-send-email 2.50.1.565.gc32cd1483b-goog
Message-ID: <20250801001004.1859976-6-samitolvanen@google.com>
Subject: [PATCH bpf-next v14 1/3] cfi: add C CFI type macro
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
X-CRM114-CacheID: sfid-20250801_011020_206271_2B64B2E6 
X-CRM114-Status: GOOD (  13.64  )
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
index 6b8713675765..685f7181780f 100644
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
+	"	.pushsection	.data..ro_after_init,\"aw\",\%progbits	\n"	\
+	"	.type	" #name ",\%object				\n"	\
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
2.50.1.565.gc32cd1483b-goog


