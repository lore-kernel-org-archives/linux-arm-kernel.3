Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C072AC83F17
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jul 2025 23:02:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v5AK/1PeqQC+sa8XwDnM8NGzttuQcxnY7sFwTeAuNhw=; b=bPqtpVsdtrw3URjRK/RcpBLMXd
	lluVGrQUzGcRo1kjiKveKa/SKzWmCPbNu3/8yrSGcAZl4H5NrKsthx1K0StQT8DJ28rvtSya/6avj
	XPsMVG7gcnSjnOqp0UuOOMbtPasovcIp3YHFRXLJuUebC+jlfLATZF3cBMKDQI7bnUEHNArmSyYEk
	aWFQqXk8uJJW5cr6iM+9Hph1+zqt4uxgOhCKdBePCfFjf7z6qC2PJ5/BAWd5kC68cNcJjTFJzzftl
	vQu/zORroiYxHQOo1zbkf6Ssg98kBJkVI5f7QodTQMfSdxJYyqOAdocu2ghy/+n9O0K8xaKdCsH3A
	KHp15QcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubofe-00000006N2C-3OAF;
	Tue, 15 Jul 2025 23:02:46 +0000
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uboao-00000006M1e-1faI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Jul 2025 22:57:47 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-312df02acf5so254486a91.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Jul 2025 15:57:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1752620265; x=1753225065; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=v5AK/1PeqQC+sa8XwDnM8NGzttuQcxnY7sFwTeAuNhw=;
        b=ZdiQuIrhTCahW3HYIu02KU41W+qjoAkW8dM8v+CKETHS7tP7zLerLZ7POeahN4mQfp
         SbRUhnTJjgU4PJgVBjaGwXiZsYjE+Bt6FJngRI9Ztwq9Z35M6nw+cUR0nuf52jLD0ZBd
         W4VtMYvtlNBz/EZND6AjUWcQpZVrGCPw7rDBessn7+RneOBY/5kseDBoDJmdHgruDxKi
         yBgvo0vM46GHWhlRuTjwWiYDDT41gwEDuVXmxL8B6GEcIZmRSUE3OW+Nbd/q+JuuMr76
         JMfQIRRb9RZ47nGP6gMt3QZ5fi0aJ/yrZohIHXG2yBdGwdf6+yob66opv8sol9XWNJWR
         /QOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752620265; x=1753225065;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=v5AK/1PeqQC+sa8XwDnM8NGzttuQcxnY7sFwTeAuNhw=;
        b=xRTdxjSWRlpbixZ8gCoHF/gggMwCGfV5+KM67dFjF19mrNFwDxnK2dq0h21cJcxunj
         08wsEjN1DJRoN6IXnbX7kn9h8eRycLYYbk3PsXnAJj0FT9WBQsxxFC5S8QuHHs355E6m
         vUNthI/PMjvqucsnjThnJh18vCHcPVka+zOvOV6io3MsikKJ52N9xfhcLVHBM0OzMAnu
         AdtSC71hKmqvWohxcX1NpW9pqDm8lrKPKk1Q18/zA0m67+ovmjieZCpfyXaDTx+FSWTi
         PQEt3BYZJADSgq0WODSATpPyBUzlHTRaUBoCAeHH+tzRnJ+4LtjcwErb9o8vTRWkOZJR
         Ha4A==
X-Forwarded-Encrypted: i=1; AJvYcCV9W9OsyrO19k0CohHLWNrK67rHT020tbeO6KH4XBGfGVk7d195plvFau3Tl6Eh+ZUsS80EuGC7pgtloC7OnEWx@lists.infradead.org
X-Gm-Message-State: AOJu0YzlvTlwoASrUCUCx1fm30uWgehZ27OHb0DVz5GNPuiWZAHAYOLr
	pRosddms+Q3dxBuMjlxSez1l0nEi/a+UT30lAzfiYJFL3CV/P4WrKCtqiWnPtywk40lH91aRKJz
	xccrXXAcTs1zEcU6HaoN+X12tEq/GQA==
X-Google-Smtp-Source: AGHT+IFRJnQuf3ZfTFNheXhqqmEyyVMwsn+nHtXsPsgY0nnTYfz2CvtHbU+B8gUhLr16qjC7a3OLa11W0DsbaBWGlp0=
X-Received: from pjwx13.prod.google.com ([2002:a17:90a:c2cd:b0:313:230:89ed])
 (user=samitolvanen job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:1b4d:b0:2ff:4a8d:74f9 with SMTP id 98e67ed59e1d1-31c9e73efe6mr1347174a91.10.1752620265306;
 Tue, 15 Jul 2025 15:57:45 -0700 (PDT)
Date: Tue, 15 Jul 2025 22:57:35 +0000
In-Reply-To: <20250715225733.3921432-5-samitolvanen@google.com>
Mime-Version: 1.0
References: <20250715225733.3921432-5-samitolvanen@google.com>
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=5258; i=samitolvanen@google.com;
 h=from:subject; bh=fmHbTT6n3AcyMrdoZaFttPRZqXRsHYHqk54PFgD4xF8=;
 b=owGbwMvMwCUWxa662nLh8irG02pJDBlld+4dcv66/MPU6FXsLAsCTrLUa5wV/ZDUqjj/UHHN/
 Lot76ukO0pZGMS4GGTFFFlavq7euvu7U+qrz0USMHNYmUCGMHBxCsBEVEIY/vBdZ+ipVq/R0pQ9
 tOfUjd1iHpZX99WWGoSlML2v6ku//5/hn9K0Umljzpvnz/78GHw3sNjAfoFfaTj36uMJC18yXFs fywsA
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
Message-ID: <20250715225733.3921432-6-samitolvanen@google.com>
Subject: [PATCH bpf-next v10 1/3] cfi: add C CFI type macro
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
X-CRM114-CacheID: sfid-20250715_155746_440409_36856FED 
X-CRM114-Status: GOOD (  13.65  )
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


