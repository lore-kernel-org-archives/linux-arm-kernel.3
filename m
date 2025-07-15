Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1F08C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jul 2025 23:05:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bxkEzNpl+LQg8WYHJm151LdjKk0iMvXzxlrj1qGda2U=; b=DYy96JJd4aFIjOeoPmh58mosHG
	AEn0euBJI6K6caVJoobDKpp62mEFbJzeWY+CGlREXjIYmXI1MNXtAb4SajUnuCsqvplaZxO+6Ocpn
	G+/a+ylkCrZT1343fEhpCn6NbKpH2nbX2Ap3yIE2ekYL8VQmYqi08HCY+/c8ECwW7LiAOqQOsnV2f
	+JZpjvYLo1UVg0LLySgW1EZqNDwcA1CGdNz0BYYasoSwdT7yDHe2nNugF3wkOvqJ1LElat9L+KxCr
	nl96yN7rnLKWBkV0XNcrxsrWKeKeimdB1UuDbycg5sh1micnT+FudajAXIViJsuQlhNwHcn0cx6QD
	qcHNuUIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uboi2-00000006NCx-2CAy;
	Tue, 15 Jul 2025 23:05:14 +0000
Received: from mail-pf1-x449.google.com ([2607:f8b0:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uboaq-00000006M21-2kQh
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Jul 2025 22:57:49 +0000
Received: by mail-pf1-x449.google.com with SMTP id d2e1a72fcca58-74ea5d9982cso4690650b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Jul 2025 15:57:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1752620267; x=1753225067; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=bxkEzNpl+LQg8WYHJm151LdjKk0iMvXzxlrj1qGda2U=;
        b=NQcM4ihsOGxZSuqKCAv+ksJYsKkj3inZYCyjyppafUorY1i1+479jN413VHdtrR2Yc
         Q28tXzvnQ96rgdYeMkjDEVaYCb9CyG471Q3modYdkRh679MLWjik1LfWDZCWfVGYnfmQ
         0U4VvvraCgWVB1R7DqJDGvuK7rRXFpDSI3PLspSnIC3RB+GGM22kROjGORgQSoxS7cYw
         5lcrA4H2RMpgfN6hSxmGSx6WTPHpLGX8On0MLH+Hq4SKBdbreFyCWr7RvrvyIOsRcuNn
         ZTHTWMEiu50j6BGXxbEhZFSZahSrLM/AGvq6zdC6zG3CC+OzVY92qaVDzvnoDkcAF3RR
         nNUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752620267; x=1753225067;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bxkEzNpl+LQg8WYHJm151LdjKk0iMvXzxlrj1qGda2U=;
        b=fXv0vbIr3rJCTN/Tae7HbjsvYMjt8BFnzp+t9INTHapTWzdQ0mKg9cyf0EwtQIqL5G
         F5O8VNL7tfQKOCqsxA6fZY7BZUcUaMrHIz/BT82+QbsSoL8/6LRfKYUH1cDFyeKK+jpZ
         zveymrIwXxYuZfBIzHxR6ooEJGJfWZ1B5yRB23zvw2YXC0FDXMjitkkiV/1WSsl7tN2d
         bSv8KFJtoHXaR1m8bf6fWISTzNl58Su5dgOB/KTQGEQUcbmDK0cY1eyXI1Kiguya2vXQ
         NIHT9v4mh0EhxMefpp97wG77gGI0kVfJK9er4D4iHyljqDeGQWPmBE0boXizAOwWLnRC
         7aKA==
X-Forwarded-Encrypted: i=1; AJvYcCWIjsNDKL/zWiG3HJxyJVthLmbhZTa8MmuZhWj0IE0g5tCynU8DZ6LArEAxmJhJ7Vj5XSLdnT97X2mX1g89qpAf@lists.infradead.org
X-Gm-Message-State: AOJu0YwKma6YrTdUXBM/sM5D3fc3n3LKRqC7WFKVtBAbKvARv1/c98H+
	s4ZYEAiIUfhGnOd7HM4RMzO72ioVL8hUzKqfxVA8MHm5JgtOp3yxFBtb6wreisBJvzpaARCluSM
	U8uQmY+aaBmX4qucZARzhVPTKF9EBPQ==
X-Google-Smtp-Source: AGHT+IG2nwRuZU8nKSGZKv/KCQaDAPwv7UTHMunOLKPdpbGG0wYtSG/FaNgQ997rCgAEFOJqVAawtb6zF7I7itb5eWs=
X-Received: from pgac23.prod.google.com ([2002:a05:6a02:2957:b0:b2e:ce0c:b3fb])
 (user=samitolvanen job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a20:72a4:b0:235:2cd8:6cd1 with SMTP id adf61e73a8af0-237d754df40mr2164567637.34.1752620266993;
 Tue, 15 Jul 2025 15:57:46 -0700 (PDT)
Date: Tue, 15 Jul 2025 22:57:36 +0000
In-Reply-To: <20250715225733.3921432-5-samitolvanen@google.com>
Mime-Version: 1.0
References: <20250715225733.3921432-5-samitolvanen@google.com>
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=7361; i=samitolvanen@google.com;
 h=from:subject; bh=JYMMqOIguwvmYlpCtBUkSC4Y7ybrNECAIqn/EkjfUiY=;
 b=kA0DAAoWWgclqzmhp3oByyZiAGh23N+jP/g5zdO96cF7ZHZ4RED3bDnow5av8UA0IbpUzoer8
 Yh1BAAWCgAdFiEEhPWrtbv3QmXq83IYWgclqzmhp3oFAmh23N8ACgkQWgclqzmhp3pszQEA1Eo4
 g3Xc1MqFDX6ocKGbT/3AM0t8FXnN6Zbjsw9b+BMBAJqjNShp+eL0Gptqhtbb9qzV483Nl6NngZZ WhhyOp/wJ
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
Message-ID: <20250715225733.3921432-7-samitolvanen@google.com>
Subject: [PATCH bpf-next v10 2/3] cfi: Move BPF CFI types and helpers to
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
X-CRM114-CacheID: sfid-20250715_155748_697349_82AAB977 
X-CRM114-Status: GOOD (  18.33  )
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
 arch/riscv/include/asm/cfi.h  | 16 ---------------
 arch/riscv/kernel/cfi.c       | 24 -----------------------
 arch/x86/include/asm/cfi.h    |  9 ---------
 arch/x86/kernel/alternative.c | 12 ------------
 include/linux/cfi.h           | 37 +++++++++++++++++++++++++++--------
 kernel/cfi.c                  | 25 +++++++++++++++++++++++
 6 files changed, 54 insertions(+), 69 deletions(-)

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
index 3e51ba459154..64506a91971b 100644
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
@@ -134,7 +132,6 @@ static inline int cfi_get_offset(void)
 }
 #define cfi_get_offset cfi_get_offset
 
-extern u32 cfi_get_func_hash(void *func);
 extern int cfi_get_func_arity(void *func);
 
 #ifdef CONFIG_FINEIBT
@@ -153,12 +150,6 @@ static inline enum bug_trap_type handle_cfi_failure(struct pt_regs *regs)
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
index 1db17ecbb86c..53ed07cb9258 100644
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
 
@@ -29,6 +22,34 @@ static inline enum bug_trap_type report_cfi_failure_noaddr(struct pt_regs *regs,
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
+u32 cfi_get_func_hash(void *func);
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
index 422fa4f958ae..68b3760c15a6 100644
--- a/kernel/cfi.c
+++ b/kernel/cfi.c
@@ -5,6 +5,8 @@
  * Copyright (C) 2022 Google LLC
  */
 
+#include <linux/bpf.h>
+#include <linux/cfi_types.h>
 #include <linux/cfi.h>
 
 bool cfi_warn __ro_after_init = IS_ENABLED(CONFIG_CFI_PERMISSIVE);
@@ -27,6 +29,29 @@ enum bug_trap_type report_cfi_failure(struct pt_regs *regs, unsigned long addr,
 	return BUG_TRAP_TYPE_BUG;
 }
 
+u32 __weak cfi_get_func_hash(void *func)
+{
+	u32 hash;
+
+	if (get_kernel_nofault(hash, func - cfi_get_offset()))
+		return 0;
+
+	return hash;
+}
+
+/*
+ * Declare two non-existent functions with types that match bpf_func_t and
+ * bpf_callback_t pointers, and use DEFINE_CFI_TYPE to define type hash
+ * variables for each function type. The cfi_bpf_* variables are used by
+ * arch-specific BPF JIT implementations to ensure indirectly callable JIT
+ * code has matching CFI type hashes.
+ */
+typeof(*(bpf_func_t)0) __bpf_prog_runX;
+DEFINE_CFI_TYPE(cfi_bpf_hash, __bpf_prog_runX);
+
+typeof(*(bpf_callback_t)0) __bpf_callback_fn;
+DEFINE_CFI_TYPE(cfi_bpf_subprog_hash, __bpf_callback_fn);
+
 #ifdef CONFIG_ARCH_USES_CFI_TRAPS
 static inline unsigned long trap_address(s32 *p)
 {
-- 
2.50.0.727.gbf7dc18ff4-goog


