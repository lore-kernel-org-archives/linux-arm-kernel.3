Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92DF5C87FD3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Aug 2025 01:13:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b5iHHkCZp0P25Nw1yiUQv4bGhfUyY+YLuZAbEHBpOG4=; b=s7jh3mNYwC6GF6to70d/l5oZQ4
	Yk6rnTVQ6w8MTWQJgVX6ALJ0pT2+9g8Dj1zWk71KVuN4hYPXIr9zPh+snGARKvpUkIdZOTJQJJAZl
	ga9RVxbG9YZ36eHHblge0vzyJuM5HFs0bNht2O8yAMCm40tHNzWxCwP1tC9KFiatQDxHYbuL/R8hB
	S1u8ns5HvcyMqeKdx0xg1FL5YboiYXRDZYPsHiAS9hZOrwyqW3eCKOBkcbPqVSykDqM32SY0oXWZY
	QtLbXPREhEf3YPmPj7UeMOzfzlE35BsA4uAgJfy2BDRFaumH2vVz/i4xxBB680ETQnrzwXjy5Javx
	loU5+qyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uheKa-00000004lYP-1xVP;
	Fri, 01 Aug 2025 01:13:08 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhdLs-00000004i6K-0fnD
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 01 Aug 2025 00:10:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=b5iHHkCZp0P25Nw1yiUQv4bGhfUyY+YLuZAbEHBpOG4=; b=fIQkWkNStCi/TMMrWIaA7934UW
	lBqJpeGWOTXPdw0f3sX4aWAiPXhfw/E7EzqIiDDs0Bs6p2OG4lTb+mEhSjC+RsUBM7Uh3RtiJlDi1
	AyszT6uxB5mOfvA3tTvhx2oLFmDvWUcCHXb/Y9SqbsbKyL3QTiC2K3WzdI8fl3f2cdZfr41bEZKO8
	N0KaN3/pq5CGUR/rtIsQza8ZS9zF7/fybXImlZooqWLzzk+/mYL/uoY+bZFCtc+RwQSIziVEO36fr
	q+QRJJV/pqAVnnS6ZO4wk2O9HtLn7tK1abKxBVNI1B96xvWKP9sf0sEkMhD9eD/jtEBpK5tJ3ndcL
	XNsp6Iww==;
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhdLk-0000000DBDV-4BlT
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Aug 2025 00:10:20 +0000
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-24004ac2ecdso13968675ad.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 31 Jul 2025 17:10:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1754007013; x=1754611813; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=b5iHHkCZp0P25Nw1yiUQv4bGhfUyY+YLuZAbEHBpOG4=;
        b=ydWrzLlbQQ1ue9WOaRWc5y98V6RnaE5ctKaqxq4H3tdSUV10zV0tD3YazqBWmhhVlC
         hyVK8W/Yl58jQr369zwB40lQfJMSvhzkEXC4hRfL/JjSFJZjr15s/4NZLWHebgaBsLZ/
         IDZHgROnq4D6izzrzSBWUBnmbvegN6CgVErt6hwIPZmMVyPtecESiiwIldeaU2QmMVpn
         Sfvoz/1Wkeq7El/FE2FvbiMnVDhNPdkrLQTPrAwHJk4zUzhiAwq+a1uqYo4F5wghIU2e
         NiMkgmkSyEMSCsoQgcEEtQYOsPVxpQrWBXWRfNx9+z7GBT7Co6UN+ul5por2XddT81yK
         DDrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754007013; x=1754611813;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=b5iHHkCZp0P25Nw1yiUQv4bGhfUyY+YLuZAbEHBpOG4=;
        b=Vs0UfXsBmEYxZj+krLr5wy+H23MwwFclEMndPaT3cL0PwRYNrqAp716aAMP0eS8vy9
         8UwtutaBylk0XynYK6Q6QFcerA00D/dZeiEMDGPa0p8O5A38g4S6lWCLrf/IaCJblWsd
         Y+SdyUSRGhEYmSlECbhdXM5jeLdbA4VlwQfNw2AWa5MsQGNz4DKKBcHE85WRVfahdwrN
         37S+A9jZ7fQ7yz7tPDls7Boyl475RGaj+L1EBIC5usoJcF5v+I8D/wDhj/pxbO5wg9LO
         zg3O59yEOv2aow/0H1mc7vwrje6dOAb8N0W0r4K5Vjov6Ez8pvKo2LyD4faivHj/5A5M
         VGpg==
X-Forwarded-Encrypted: i=1; AJvYcCWkULpiitlquK3qnAqbvFGTNm00+V7sBTY4BojL6cqhYkNPn1FmTqv3lIEmLwnbc5K4gpIGwaxpwo44dNgsHPLp@lists.infradead.org
X-Gm-Message-State: AOJu0Yzh/BLBNHJrEiqTaISoJRPI7tZOWM5MmWqyIkOwlUj/k0KPVQWH
	aPZ9LL+RbtUAemD9V/a1hn4+pu0wrsnLaARZR7F3Df4w75+rZg+HXjm9fMltbJIpxlQWajsWXq/
	A0JvOzer9HndAWJDqCzLHHhjmyLOD6A==
X-Google-Smtp-Source: AGHT+IGEL+K834biNFo4yMv4E4uY+VY5Shz8+jtaGsyV2sasJARA8Z/IfB2j8/y81KRGALd/nCnzm3VLQkZzPcjhhZ8=
X-Received: from plzt4.prod.google.com ([2002:a17:902:bc44:b0:240:3ee:1601])
 (user=samitolvanen job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:e5cb:b0:234:ed31:fca7 with SMTP id d9443c01a7336-2422a6d803cmr8152855ad.48.1754007012792;
 Thu, 31 Jul 2025 17:10:12 -0700 (PDT)
Date: Fri,  1 Aug 2025 00:10:07 +0000
In-Reply-To: <20250801001004.1859976-5-samitolvanen@google.com>
Mime-Version: 1.0
References: <20250801001004.1859976-5-samitolvanen@google.com>
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=7400; i=samitolvanen@google.com;
 h=from:subject; bh=bUNQlcSLssMdbHKmQmMRnOmVGMiEFxEip285SleFhmg=;
 b=owGbwMvMwCUWxa662nLh8irG02pJDBk9rHdvPHrbJXfy09wPx6rYVZR2Meie+u169aKp2ZdTr
 14krW6I7ShlYRDjYpAVU2Rp+bp66+7vTqmvPhdJwMxhZQIZwsDFKQATyS1jZPijv/PhNGFp6SnW
 H/kKUypYntbe12B1OcXifcXZ6ucjpVZGhsMRN16Y6Qf5XLz7Z7qH6UTjn0ktF/bvO5Vb1jZRKGj dRF4A
X-Mailer: git-send-email 2.50.1.565.gc32cd1483b-goog
Message-ID: <20250801001004.1859976-7-samitolvanen@google.com>
Subject: [PATCH bpf-next v14 2/3] cfi: Move BPF CFI types and helpers to
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
X-CRM114-CacheID: sfid-20250801_011018_265587_7DB767FC 
X-CRM114-Status: GOOD (  18.11  )
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
2.50.1.565.gc32cd1483b-goog


