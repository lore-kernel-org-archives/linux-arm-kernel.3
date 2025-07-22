Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA533C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Jul 2025 21:02:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FfCLGywMG5rCOsx3g823MlhxRQ/vXUvg0nXF69NJcN8=; b=VTu4/RHCOgfe+UgWT/jmvE2TTA
	4udhIUxpGwcv3FRU1Eu9dVUtyffRjJRuVcmtEIFa89cArdkN5qolesfkvvxchKLg8fBUut3cfcHH7
	FKEsJwtpg0FXX19GjoBAhMkOYPN5B6f9DKhtu8m98DpVH6JxvYXmAVXZhAn/brW8PgjidNJxHix4L
	IVWcNDrQgXBOYLmmUJ3otBQZTSq9D1U1iosx/5In+8oKnAXW2LbWLE7XUC2ByuAFqiGgR0KGldXHI
	D6z1B1xx7bXw1zky3KMNHg6EXIDFipc7CF4b8bHcG91JkqsLP43DMWoCGaMq69zJ9rkCPMWo3E5pc
	dBWjgHWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueK7h-00000003TrG-2Y5O;
	Tue, 22 Jul 2025 21:02:05 +0000
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueJzy-00000003Syt-2Odz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Jul 2025 20:54:07 +0000
Received: by mail-pf1-x44a.google.com with SMTP id d2e1a72fcca58-748fd21468cso5257593b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Jul 2025 13:54:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753217645; x=1753822445; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=FfCLGywMG5rCOsx3g823MlhxRQ/vXUvg0nXF69NJcN8=;
        b=cMaF8ukDRX9ZF2xhgsWsdGpRajaYoYMxzII49QO+ACXfP2FzbRk+oJ8fZAMGuT+4uL
         8tvKf5NIaf0T00yLpD9GaJc2hH2J+tzXhxYvsW9hLqxt8+IEbUGWPHSiQmTJdOFFuuhD
         rE5YvGeA959DRrGpBLmarZTQ8RFCN7/Qz6J/b5RcsHgjvAk5Vj8M1D9pJ2wV8XC5+0Vm
         dNaSPEUFY/tw0JYSIRJA6CTLOpHonWF8VBSbrH9ERN5SYDxtbcJsHoGMLmvE/ySITmv0
         E9ah+LYKEcGjqp6scQkYikELdaGTtC12cQnHlZf9EZBKPQvfFNEdYRES4edNp4BpWDGI
         sctw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753217645; x=1753822445;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FfCLGywMG5rCOsx3g823MlhxRQ/vXUvg0nXF69NJcN8=;
        b=okNYgu00Q/vN0lse3TsagB+sWDUsnjKV0UzzzVON+Efteb388hwQ5ZWpmvgyhoQvQp
         JR7l1C6Jfugm4gxAi7FmicFA1oSqmS6/WtvnrlFox2CzVcqyg7jmI4oSUVNwHuZyucYS
         AsRvGoGJ5ccnkov8nwAi86j/Pbi6BLBfaRvWTjg+EzUGWi1yLHa4S+uHCVAGWAk1K+Ja
         GNk+F+mS4HCS/OM6SobBAwOf1nBaeiy9nxm0/jbmkxGWjDU6J52wA9mPbYYOoV4MUl6A
         qXywffC3gNs0fH995aY48s6vZY4oDK7nX3QN2O+ABJ0lJHA6/VbqBraVpH/RtCzCL3tW
         LliA==
X-Forwarded-Encrypted: i=1; AJvYcCXAzb+7UhUiO2e88XGtg15D8iG+RZQh7D4Hdr03SRWJmRQ0lGbIIG58zytF/XwfzyzWXRuhJoa09qE4RUZZit2z@lists.infradead.org
X-Gm-Message-State: AOJu0Yx/EzdorWS8+cx6WHrECYUwKt//7DVJQrHEExzog9dY20jVT8bF
	mlcyTnZPEqCTGtCz1oT1DuhyLQwGuLM1NH/EVvXCJk4XlgQSuT/+kWN7QCbCoZBtiJAsHObuoVo
	wUBPt7/VNsU1Xg4q2sj6FkjS48XpV9A==
X-Google-Smtp-Source: AGHT+IGj2mYJDItRw3m2soeh8qmNL3HkKmMm41UrOhWIIYH3X5YCpMlu0vttpjV7e4JBGv0PmXpCRcx9gMgupcUb7yo=
X-Received: from pfbce15.prod.google.com ([2002:a05:6a00:2a0f:b0:749:937:54c8])
 (user=samitolvanen job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a21:112:b0:234:4b39:182c with SMTP id adf61e73a8af0-23d49143ad9mr423743637.38.1753217645576;
 Tue, 22 Jul 2025 13:54:05 -0700 (PDT)
Date: Tue, 22 Jul 2025 20:54:00 +0000
In-Reply-To: <20250722205357.3347626-5-samitolvanen@google.com>
Mime-Version: 1.0
References: <20250722205357.3347626-5-samitolvanen@google.com>
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=7400; i=samitolvanen@google.com;
 h=from:subject; bh=8sqyVESEJUMNiJl/uCjzhPfl9OVRxgVUJjpXrAl5Bgs=;
 b=owGbwMvMwCUWxa662nLh8irG02pJDBn1v9LubhOs9bG86TVvvUGxxO87f2/x30p4zuy/IZlJf
 ENdZCxLRykLgxgXg6yYIkvL19Vbd393Sn31uUgCZg4rE8gQBi5OAZjIOkdGhvMK0/mtvrC8dNX8
 KlhQzRtbFsHivCigU+/XVQOXY2deKjMyvGANl2vkbW697vV5pemOmT0/rxlq21S3B9gIsd0rK/X hAwA=
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
Message-ID: <20250722205357.3347626-7-samitolvanen@google.com>
Subject: [PATCH bpf-next v13 2/3] cfi: Move BPF CFI types and helpers to
 generic code
From: Sami Tolvanen <samitolvanen@google.com>
To: bpf@vger.kernel.org, Puranjay Mohan <puranjay@kernel.org>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Andrii Nakryiko <andrii@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Maxwell Bland <mbland@motorola.com>, Sami Tolvanen <samitolvanen@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_135406_615637_D4C88BE0 
X-CRM114-Status: GOOD (  17.82  )
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

Instead of duplicating the same code for each architecture, move
the CFI type hash variables for BPF function types and related
helper functions to generic CFI code, and allow architectures to
override the function definitions if needed.

Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
---
 arch/riscv/include/asm/cfi.h  | 16 ------------
 arch/riscv/kernel/cfi.c       | 24 ------------------
 arch/x86/include/asm/cfi.h    | 10 ++------
 arch/x86/kernel/alternative.c | 12 ---------
 include/linux/cfi.h           | 47 +++++++++++++++++++++++++++++------
 kernel/cfi.c                  | 15 +++++++++++
 6 files changed, 56 insertions(+), 68 deletions(-)

diff --git a/arch/riscv/include/asm/cfi.h b/arch/riscv/include/asm/cfi.h
index fb9696d7a3f2..4508aaa7a2fd 100644
--- a/arch/riscv/include/asm/cfi.h
+++ b/arch/riscv/include/asm/cfi.h
@@ -14,27 +14,11 @@ struct pt_regs;
 #ifdef CONFIG_CFI_CLANG
 enum bug_trap_type handle_cfi_failure(struct pt_regs *regs);
 #define __bpfcall
-static inline int cfi_get_offset(void)
-{
-	return 4;
-}
-
-#define cfi_get_offset cfi_get_offset
-extern u32 cfi_bpf_hash;
-extern u32 cfi_bpf_subprog_hash;
-extern u32 cfi_get_func_hash(void *func);
 #else
 static inline enum bug_trap_type handle_cfi_failure(struct pt_regs *regs)
 {
 	return BUG_TRAP_TYPE_NONE;
 }
-
-#define cfi_bpf_hash 0U
-#define cfi_bpf_subprog_hash 0U
-static inline u32 cfi_get_func_hash(void *func)
-{
-	return 0;
-}
 #endif /* CONFIG_CFI_CLANG */
 
 #endif /* _ASM_RISCV_CFI_H */
diff --git a/arch/riscv/kernel/cfi.c b/arch/riscv/kernel/cfi.c
index e7aec5f36dd5..6ec9dbd7292e 100644
--- a/arch/riscv/kernel/cfi.c
+++ b/arch/riscv/kernel/cfi.c
@@ -4,7 +4,6 @@
  *
  * Copyright (C) 2023 Google LLC
  */
-#include <linux/cfi_types.h>
 #include <linux/cfi.h>
 #include <asm/insn.h>
 
@@ -76,26 +75,3 @@ enum bug_trap_type handle_cfi_failure(struct pt_regs *regs)
 
 	return report_cfi_failure(regs, regs->epc, &target, type);
 }
-
-#ifdef CONFIG_CFI_CLANG
-struct bpf_insn;
-
-/* Must match bpf_func_t / DEFINE_BPF_PROG_RUN() */
-extern unsigned int __bpf_prog_runX(const void *ctx,
-				    const struct bpf_insn *insn);
-DEFINE_CFI_TYPE(cfi_bpf_hash, __bpf_prog_runX);
-
-/* Must match bpf_callback_t */
-extern u64 __bpf_callback_fn(u64, u64, u64, u64, u64);
-DEFINE_CFI_TYPE(cfi_bpf_subprog_hash, __bpf_callback_fn);
-
-u32 cfi_get_func_hash(void *func)
-{
-	u32 hash;
-
-	if (get_kernel_nofault(hash, func - cfi_get_offset()))
-		return 0;
-
-	return hash;
-}
-#endif
diff --git a/arch/x86/include/asm/cfi.h b/arch/x86/include/asm/cfi.h
index 3e51ba459154..1751f1eb95ef 100644
--- a/arch/x86/include/asm/cfi.h
+++ b/arch/x86/include/asm/cfi.h
@@ -116,8 +116,6 @@ struct pt_regs;
 #ifdef CONFIG_CFI_CLANG
 enum bug_trap_type handle_cfi_failure(struct pt_regs *regs);
 #define __bpfcall
-extern u32 cfi_bpf_hash;
-extern u32 cfi_bpf_subprog_hash;
 
 static inline int cfi_get_offset(void)
 {
@@ -135,6 +133,8 @@ static inline int cfi_get_offset(void)
 #define cfi_get_offset cfi_get_offset
 
 extern u32 cfi_get_func_hash(void *func);
+#define cfi_get_func_hash cfi_get_func_hash
+
 extern int cfi_get_func_arity(void *func);
 
 #ifdef CONFIG_FINEIBT
@@ -153,12 +153,6 @@ static inline enum bug_trap_type handle_cfi_failure(struct pt_regs *regs)
 {
 	return BUG_TRAP_TYPE_NONE;
 }
-#define cfi_bpf_hash 0U
-#define cfi_bpf_subprog_hash 0U
-static inline u32 cfi_get_func_hash(void *func)
-{
-	return 0;
-}
 static inline int cfi_get_func_arity(void *func)
 {
 	return 0;
diff --git a/arch/x86/kernel/alternative.c b/arch/x86/kernel/alternative.c
index a555665b4d9c..9f6b7dab2d9a 100644
--- a/arch/x86/kernel/alternative.c
+++ b/arch/x86/kernel/alternative.c
@@ -2,7 +2,6 @@
 #define pr_fmt(fmt) "SMP alternatives: " fmt
 
 #include <linux/mmu_context.h>
-#include <linux/cfi_types.h>
 #include <linux/perf_event.h>
 #include <linux/vmalloc.h>
 #include <linux/memory.h>
@@ -1185,17 +1184,6 @@ bool cfi_bhi __ro_after_init = false;
 #endif
 
 #ifdef CONFIG_CFI_CLANG
-struct bpf_insn;
-
-/* Must match bpf_func_t / DEFINE_BPF_PROG_RUN() */
-extern unsigned int __bpf_prog_runX(const void *ctx,
-				    const struct bpf_insn *insn);
-DEFINE_CFI_TYPE(cfi_bpf_hash, __bpf_prog_runX);
-
-/* Must match bpf_callback_t */
-extern u64 __bpf_callback_fn(u64, u64, u64, u64, u64);
-DEFINE_CFI_TYPE(cfi_bpf_subprog_hash, __bpf_callback_fn);
-
 u32 cfi_get_func_hash(void *func)
 {
 	u32 hash;
diff --git a/include/linux/cfi.h b/include/linux/cfi.h
index 1db17ecbb86c..52a98886a455 100644
--- a/include/linux/cfi.h
+++ b/include/linux/cfi.h
@@ -11,16 +11,9 @@
 #include <linux/module.h>
 #include <asm/cfi.h>
 
+#ifdef CONFIG_CFI_CLANG
 extern bool cfi_warn;
 
-#ifndef cfi_get_offset
-static inline int cfi_get_offset(void)
-{
-	return 0;
-}
-#endif
-
-#ifdef CONFIG_CFI_CLANG
 enum bug_trap_type report_cfi_failure(struct pt_regs *regs, unsigned long addr,
 				      unsigned long *target, u32 type);
 
@@ -29,6 +22,44 @@ static inline enum bug_trap_type report_cfi_failure_noaddr(struct pt_regs *regs,
 {
 	return report_cfi_failure(regs, addr, NULL, 0);
 }
+
+#ifndef cfi_get_offset
+/*
+ * Returns the CFI prefix offset. By default, the compiler emits only
+ * a 4-byte CFI type hash before the function. If an architecture
+ * uses -fpatchable-function-entry=N,M where M>0 to change the prefix
+ * offset, they must override this function.
+ */
+static inline int cfi_get_offset(void)
+{
+	return 4;
+}
+#endif
+
+#ifndef cfi_get_func_hash
+static inline u32 cfi_get_func_hash(void *func)
+{
+	u32 hash;
+
+	if (get_kernel_nofault(hash, func - cfi_get_offset()))
+		return 0;
+
+	return hash;
+}
+#endif
+
+/* CFI type hashes for BPF function types */
+extern u32 cfi_bpf_hash;
+extern u32 cfi_bpf_subprog_hash;
+
+#else /* CONFIG_CFI_CLANG */
+
+static inline int cfi_get_offset(void) { return 0; }
+static inline u32 cfi_get_func_hash(void *func) { return 0; }
+
+#define cfi_bpf_hash 0U
+#define cfi_bpf_subprog_hash 0U
+
 #endif /* CONFIG_CFI_CLANG */
 
 #ifdef CONFIG_ARCH_USES_CFI_TRAPS
diff --git a/kernel/cfi.c b/kernel/cfi.c
index 422fa4f958ae..4dad04ead06c 100644
--- a/kernel/cfi.c
+++ b/kernel/cfi.c
@@ -5,6 +5,8 @@
  * Copyright (C) 2022 Google LLC
  */
 
+#include <linux/bpf.h>
+#include <linux/cfi_types.h>
 #include <linux/cfi.h>
 
 bool cfi_warn __ro_after_init = IS_ENABLED(CONFIG_CFI_PERMISSIVE);
@@ -27,6 +29,19 @@ enum bug_trap_type report_cfi_failure(struct pt_regs *regs, unsigned long addr,
 	return BUG_TRAP_TYPE_BUG;
 }
 
+/*
+ * Declare two non-existent functions with types that match bpf_func_t and
+ * bpf_callback_t pointers, and use DEFINE_CFI_TYPE to define type hash
+ * variables for each function type. The cfi_bpf_* variables are used by
+ * arch-specific BPF JIT implementations to ensure indirectly callable JIT
+ * code has matching CFI type hashes.
+ */
+extern typeof(*(bpf_func_t)0) __bpf_prog_runX;
+DEFINE_CFI_TYPE(cfi_bpf_hash, __bpf_prog_runX);
+
+extern typeof(*(bpf_callback_t)0) __bpf_callback_fn;
+DEFINE_CFI_TYPE(cfi_bpf_subprog_hash, __bpf_callback_fn);
+
 #ifdef CONFIG_ARCH_USES_CFI_TRAPS
 static inline unsigned long trap_address(s32 *p)
 {
-- 
2.50.0.727.gbf7dc18ff4-goog


