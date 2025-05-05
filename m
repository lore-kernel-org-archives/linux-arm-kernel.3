Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD743C3ABBF
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 00:29:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lcCv7hpJFXCgQNPjvIpQD0jIr1c2DrHVr6zfyF1t5G8=; b=A1M6HmRJ6EMdZNP0BPKXcGgexc
	HRMfQZjEcIvTgifk8Qf2EczTUBidqtiULNicNoxFF7p/Tio7L6mLQjFqsqP9QRTwCOEoyPFXpFw6c
	wMQhD3dcb8PJJgVSC8TTFLm6vj/ADJtw+WXVNqxCBx6RLYWhvv2BIOVfjS12xRQJoAsjpH1k8gCO5
	cbFCR2F2kmq9THeTicQSfzoASvUK31YQColFAWEwHGaywgrcB02w+eRyaJLQ5AkllRcQ7NiT0opAi
	Jg9dclpQZrfjxjYDgogqHL16Fn5XPx++Ojx2fDvjd5HtJxUxzNeFZkRKtjMcO3i/fMFys97/DgNSR
	chQoIuFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC6Bf-00000009I2K-4BSa;
	Tue, 06 May 2025 00:29:32 +0000
Received: from mail-pf1-x449.google.com ([2607:f8b0:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC4Oa-00000008ndU-3zcP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 May 2025 22:34:46 +0000
Received: by mail-pf1-x449.google.com with SMTP id d2e1a72fcca58-7398d70abbfso6662940b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 May 2025 15:34:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746484483; x=1747089283; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=lcCv7hpJFXCgQNPjvIpQD0jIr1c2DrHVr6zfyF1t5G8=;
        b=ywuRpHKr0D0lXnLPx/zB2V8tfZ38fzQCB0CroWdwHoXtMertemNRmFnBbTZc6Do9k8
         +cuB84+JBQYzJnkttt7rnvM5Ca46l1xqsAdUQqButkL+LloCFhOHXtNdJ8udlbLgxDKx
         SIzKF8oLQyKzmYmM18ESk+mQcxkX5b8qNxkQuglD2rlS/xvQgL/J41Pv6wsjBVruQo1d
         +PJFwfr3iLNL2bTbkOJ49LKZw/MpPmxLXbqaECuT0hCxXeRt5tSkMbViRviwdirQjonh
         M8x9R/hAfEdxAzt6BSD+X5WURX3EE0Z5H5gg/yB+LUBsXtM0aHonUeVUtpol23crxu0+
         2djw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746484483; x=1747089283;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lcCv7hpJFXCgQNPjvIpQD0jIr1c2DrHVr6zfyF1t5G8=;
        b=EOM+fl/L20mZk+GbbggflRdHDp+oAXQuYzeuS6e5zB+BO60TzaLVAJaIciSMeypEVd
         jHg2tTJEe99Im7Idg9bWTSYXQJ/tWsl0wG7ibwghoNw6nepMgM5Q4nhNnjt3Qn/2yUaI
         At5fCR9ro6tuXCTr01V5WKg2z1nlstgYAfyeJwp84TaawAA0iK5N6lBmUOwvLisaoTJf
         U9DGq/CBWx4gJ8W6as/vvdManoX/8WMTkfl3DVDdpvp+o96JzokgSx/uap1e6zP91s8T
         dYDMWW0QEqGlHL2S4PENvgz4JZjKiGZMYoLZU0q5/nETvXaecj9oDQ8uHGJS9pbkFj4T
         KmrQ==
X-Forwarded-Encrypted: i=1; AJvYcCU7hKcjLNNCErd1eJs4yGAHZ7eokWyck4pneQVIH8h24DUl61vpjWWkLnwFChaq1T5Mc+cwC6djgXmTYoDucfQ3@lists.infradead.org
X-Gm-Message-State: AOJu0YxChazOhKN/Iz1Wjv22Vb4RlEA6Tkm+4+eXfkcu8MrVqmqIdObH
	Hldpk5ek6lW+j9XhVhI1xgWtbjsEE7BMsa5aRSfJLRDR+OUIgzCGdqIkYtJmAvR7l8qaRVz+V3F
	iC9REqBS23dm6FSrYtlYXADSB+Q==
X-Google-Smtp-Source: AGHT+IHNzFURwBesMY2NJiCBx+5mmsp7b+O42UgI3ZoXcQ+zCwjPh8MzPQ3QOywW7NIAJbYKP3/lXbLkj6ZlWCWXibo=
X-Received: from pfoc21.prod.google.com ([2002:aa7:8815:0:b0:739:45ba:a49a])
 (user=samitolvanen job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a20:c88f:b0:1ee:d8c8:4b7f with SMTP id adf61e73a8af0-2118259786cmr1133213637.25.1746484483566;
 Mon, 05 May 2025 15:34:43 -0700 (PDT)
Date: Mon,  5 May 2025 22:34:39 +0000
In-Reply-To: <20250505223437.3722164-4-samitolvanen@google.com>
Mime-Version: 1.0
References: <20250505223437.3722164-4-samitolvanen@google.com>
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=5250; i=samitolvanen@google.com;
 h=from:subject; bh=wKRcArm3I8YdLV7xUagIsjaFHkOg54K0GIqYgszVZFg=;
 b=owGbwMvMwCEWxa662nLh8irG02pJDBmSNv9K1st1fkzpOPgpqm9HvJ6izx0fP3eZM7ddDm3ff
 pbr0IuOjlIWBjEOBlkxRZaWr6u37v7ulPrqc5EEzBxWJpAhDFycAjCR9YoM/2u/Vn5ymMXkPVEj
 Y5nFhVMNq0JCk3uyGX6cbNw8aYnmg2hGhm0vH91YYKerum/zl3o2sWSho2YmT7/NTtTW4F61YrZ RHQMA
X-Mailer: git-send-email 2.49.0.967.g6a0df3ecc3-goog
Message-ID: <20250505223437.3722164-5-samitolvanen@google.com>
Subject: [PATCH bpf-next v9 1/2] cfi: add C CFI type macro
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
X-CRM114-CacheID: sfid-20250505_153444_995055_B748B34A 
X-CRM114-Status: GOOD (  13.38  )
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
index bf82c6f7d690..a5147fcd8397 100644
--- a/arch/x86/kernel/alternative.c
+++ b/arch/x86/kernel/alternative.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0-only
 #define pr_fmt(fmt) "SMP alternatives: " fmt
 
+#include <linux/cfi_types.h>
 #include <linux/module.h>
 #include <linux/sched.h>
 #include <linux/perf_event.h>
@@ -947,37 +948,11 @@ struct bpf_insn;
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
2.49.0.967.g6a0df3ecc3-goog


