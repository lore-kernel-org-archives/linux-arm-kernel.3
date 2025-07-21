Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 603A5C83F25
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Jul 2025 20:48:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ATtT7J3eGVlX0DAsIWIni7wioYwQuHnqhrVZz3llpO4=; b=yAqDrgUVkO5n6JVfRcD9Eal6kD
	iW/qsIy4PQKC0L+OKc43zvQLQQWR+RQ3BchmTiLTkh3X7RQZaTZqBg12RJCaUE6YUIHAxqmk8q9ZF
	ll1gSFEcB9gOfmNM4M0cm12+YygvSFZc5PmFPm+VU1il+9GwLr6a5BWENadN0CgkDUidOKTK27+Q1
	HZjQMjcrXoJBozRfKN70c1nmYmZ4GB0rw7Uky4rNzuI8hKBMs7VEebA+FcziX71cZQnw/32LGMPCT
	jsBKQujY0ntBzLgl9bltjXHiFDCuPC8HRlZB4a3GT37VZRRClvTiBDGm8X0AJ/dn3ts5ZPZJkVlP/
	bVNPHqYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udxQh-00000000fMj-3Ehk;
	Mon, 21 Jul 2025 20:48:11 +0000
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udwzr-00000000bsj-20R2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Jul 2025 20:20:28 +0000
Received: by mail-pf1-x44a.google.com with SMTP id d2e1a72fcca58-740774348f6so4355087b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Jul 2025 13:20:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753129226; x=1753734026; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ATtT7J3eGVlX0DAsIWIni7wioYwQuHnqhrVZz3llpO4=;
        b=YAm+F0FSGV1iMG+f+k2sUj0QXwq45YLtgKpexzSxnXb6fP6UqD/b7tR4ZhA7IIlXjj
         rXG+bXO/1UgH3mfMg44TPvgT+Rbh/4nVGjl20y8H/2G4vxDsep7n8pUb++m6BA+cawB3
         PoLObvE2fQ3TRrf/VVHrP+58gntP186GoJE/xlicnoiUpU7prNpbIN83ZCkhSlVDLgEz
         nLHXDLz0fEfk0EcneyxYjf9MREH13i/Qju/M8UcJL2N6XKHue3ve0X+iYa9zjUW0eaxc
         n0nM9OBW+SmyjHyQp+B5XLyDYK+UNSali3UvzKVDcwtRDr8q2QMkvasgI7ZurzuAMHcx
         lQNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753129226; x=1753734026;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ATtT7J3eGVlX0DAsIWIni7wioYwQuHnqhrVZz3llpO4=;
        b=eKWCwxlm3qJz2AcPVgUFLiDK5cENqC5eyCge7H3BH67h+yD0ZcRl8jFf2nM+vvTWkk
         e4sUj6f46AaCBv0CDcsQHJaviaLY91dX7mB8uIzDlguOQP89D6gmY3OMUXTWzIv8TLSf
         UDK8mGMBkoeW141WZe0B0Z1b2n7G/i0SYSLSBHxEr6z1CdyyLt/ie2M+1gKzEyRXFdoc
         GI+BJlM67s2rAhHPxQvjgxEm0PRZQtW7rfWSQ232pzOczNraJ13LhVLa+o2rUU2r7meL
         jF1EKw+zHPqr6IxuLheGyDTwtaEr6nsYdYELcC5AoAbKJ7ZjcC7fcXYX88SU97+7aBKm
         M/ZA==
X-Forwarded-Encrypted: i=1; AJvYcCVY8WbBE4cuKOhisDj06dDZDgj2b+kdgrvdJXJaFSExHGzlJuQcXkQEdVGnlHfMtRHzOhix+wSUzllBhfyRt1Ec@lists.infradead.org
X-Gm-Message-State: AOJu0Yzj0LCM3ns3xP3LOIM1df663FtXrDog4wLDzX0VWVIJigzJ5d7a
	0sZNg4S5gEvLzFaIp44ICFQ9DDmfFXoK2flagN2bujmKQumlHQRecJAunSvKZJJsIy4yV6ye7vN
	iVt7YfVhcjJaKWbii7J2+2OoPlN/UvQ==
X-Google-Smtp-Source: AGHT+IFMHr6borf7kwzwjf/sDWkpfr6CqD7C7zKnwE9LtBZhs0jVXDx6hG0voSrPzJ9O9xdehYJ43YU69oZLT1yhuXc=
X-Received: from pfbdh6.prod.google.com ([2002:a05:6a00:4786:b0:746:2a27:3025])
 (user=samitolvanen job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:179f:b0:749:4fd7:3513 with SMTP id d2e1a72fcca58-759ad9e5239mr17855621b3a.16.1753129226170;
 Mon, 21 Jul 2025 13:20:26 -0700 (PDT)
Date: Mon, 21 Jul 2025 20:20:17 +0000
In-Reply-To: <20250721202015.3530876-5-samitolvanen@google.com>
Mime-Version: 1.0
References: <20250721202015.3530876-5-samitolvanen@google.com>
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=5301; i=samitolvanen@google.com;
 h=from:subject; bh=Dmv7MBdL2t4YlIN+ZApIs9QGn/40RNGjIGDoX876EIY=;
 b=owGbwMvMwCUWxa662nLh8irG02pJDBl1CxnqNh54s6quo15jb5tZrkxbpfL6Jv22VLWgfzd6F
 GTfOOzoKGVhEONikBVTZGn5unrr7u9Oqa8+F0nAzGFlAhnCwMUpABM5wMbI8DcknJ0t5F/vvaom
 pj9+Gsy/7gdvUpzI6b5azZuD3SiihpFhl8XUw5Z+xseCHzuuWyhu37zwzZEfQi8i4+30jbZYzj/ CDwA=
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
Message-ID: <20250721202015.3530876-6-samitolvanen@google.com>
Subject: [PATCH bpf-next v12 1/3] cfi: add C CFI type macro
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
X-CRM114-CacheID: sfid-20250721_132027_520729_CD0AAF08 
X-CRM114-Status: GOOD (  13.21  )
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
2.50.0.727.gbf7dc18ff4-goog


