Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5AA9C83F25
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Jul 2025 20:53:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZHownloYScgx/peEPOAu+NanD7LJponwsGoBJ5e+uKQ=; b=UtMSixzOP0dIasUZlMERqeL/GV
	Ht4DzlCGIsGI3alqLxh/UNpm3msiFrYLu059YN6kyNVaJrNiuZCHYJkKLnvr3isSf3xiwuk9U8idU
	mmX55FxI7yTQShXRm7wI8wtKjRucisYDvNB11epIpj0mfxkiKqvTn8fBQCnosHNNhKAYnoX1Z9NIL
	Kt/TDOv5I8jL4cAYahfvAZaEjcO/yCRNI+8daKGeru1Wc8hmk+praukoUndePeDUWesV7hK3CI//P
	gPwq8LOreABFEZGueTYLg46Vr6C8/Vr3hOUbRmX+qt20f7H1CNXPHfOH7e7g3TlVpMa9cvdDv+Srz
	s+GDaAJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udxVY-00000000fpg-1MBV;
	Mon, 21 Jul 2025 20:53:12 +0000
Received: from mail-pf1-x449.google.com ([2607:f8b0:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udwzv-00000000buI-0TSj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Jul 2025 20:20:32 +0000
Received: by mail-pf1-x449.google.com with SMTP id d2e1a72fcca58-74ea5d9982cso3305924b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Jul 2025 13:20:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753129229; x=1753734029; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZHownloYScgx/peEPOAu+NanD7LJponwsGoBJ5e+uKQ=;
        b=VWSVslYcY27MsWaKa/8NmrmgZZbObTPp2LNHEA0bDg7k5FJj/FzreaSl66AQW2viIt
         1WU7zaG4EJQGX7I1Gc6VAqQN2z/WI+xEPnSim0y0N11RQVtgzno7lzwI4wbbP/wFlG1o
         N6UkZeQWUXRAi/IjuJT0Yh2mp9ig1CcAf3iop2vHKdz3phET9L05zEBEwkIGLIZIUsNx
         u49M5tDV8BATcSEvsxcUNZAPVdZFdMzVSx7MOL7pJWmSRvPvqhPvkhaD4PP64bYxTdOS
         8AgCVcU8VhqyuNqnUnbQudzJ6vTo++mlDq8qKmb819VB5HIFLj+C8WCMS2kRe1mM7Ege
         DBqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753129229; x=1753734029;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZHownloYScgx/peEPOAu+NanD7LJponwsGoBJ5e+uKQ=;
        b=p3OhR0fF6Lwe3SwjCJIFMYEubXDyz+LjFQB6I6K5dk/ua4Ejzdk5M+POOIp5nEaQgH
         E9rUHSKcVLt4qcR8y/XRRkpxH1RFxWVPeZg1w4l7TW7jd/4frpDAIi5DkO2MmYp3htUY
         NAlw12SZ91hkIb0StzcOKw5XnpaJp8JkV6uo/jhdJL/VjsqBTLUOtI+Pca4gWV2A7FfN
         LXEq9nHkPNb8pX+I0VPoR1kdIgngMRShAHdYiRM7fr0DaKKNpWRRkWjJRhOVYgvRKa5L
         5+E45Qj05fJcnJ3N2Aj4FfHeNWfvacxd39qvGuvDqcAwETtO7VKgIHAPcRv9vRxhh2LC
         nEiQ==
X-Forwarded-Encrypted: i=1; AJvYcCWBr0QeB8pa/MqzIPJB6lqtA0RPfpHNX32r2Zm6LnQ7dmcFJM8Zz6mGC7nfxDZxpsoqn+6AZVipp8qZcLLfSFKW@lists.infradead.org
X-Gm-Message-State: AOJu0YzZzzFVuEsVj6EvOHpRiVxyl5y4VszWT7oozLgwLmOpDzLxK+2m
	8R9LiXgH+JBOU/zxmuTwKGrvgeorhX2DdxlNvWbyIywOXxjziwlKAwxHuCQ8Ynwt/TRzLE8MvTB
	tGZ+tzzQmxLLZUZqjxeqWxdtRJ6lt3g==
X-Google-Smtp-Source: AGHT+IH7KB4Embbv+x/j7/TiNXBRPpel5ppAcMFteDc0+/hNDLuiR64hBw5sgTN0lkM+CXbz8tU6Wnv96FwrgIwShQg=
X-Received: from pfbca26.prod.google.com ([2002:a05:6a00:419a:b0:746:2524:8aab])
 (user=samitolvanen job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:2e91:b0:758:b81:603a with SMTP id d2e1a72fcca58-759ab63965bmr19047414b3a.2.1753129229517;
 Mon, 21 Jul 2025 13:20:29 -0700 (PDT)
Date: Mon, 21 Jul 2025 20:20:19 +0000
In-Reply-To: <20250721202015.3530876-5-samitolvanen@google.com>
Mime-Version: 1.0
References: <20250721202015.3530876-5-samitolvanen@google.com>
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=4115; i=samitolvanen@google.com;
 h=from:subject; bh=Btyu244psEehuoYDLzh4LQVWud/Fy+nWITFJv1APkz4=;
 b=owGbwMvMwCUWxa662nLh8irG02pJDBl1CxlXHHOZf/X60+irp+9+N/yvsFUr1TSxkOX50n0W9
 7iOdF8v6ShlYRDjYpAVU2Rp+bp66+7vTqmvPhdJwMxhZQIZwsDFKQATqV7OyPDk61XxZz43n97W
 XXkldZeiValAjU3Lg8/xfy1qL8w9+WYfI8Pd4OSJn26/Y/iUunOV4+en2xlUi8St5SW8Z8e1Kmp P3sUNAA==
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
Message-ID: <20250721202015.3530876-8-samitolvanen@google.com>
Subject: [PATCH bpf-next v12 3/3] arm64/cfi,bpf: Support kCFI + BPF on arm64
From: Sami Tolvanen <samitolvanen@google.com>
To: bpf@vger.kernel.org, Puranjay Mohan <puranjay@kernel.org>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Andrii Nakryiko <andrii@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Maxwell Bland <mbland@motorola.com>, Puranjay Mohan <puranjay12@gmail.com>, 
	Sami Tolvanen <samitolvanen@google.com>, Dao Huang <huangdao1@oppo.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_132031_144574_371E9DCE 
X-CRM114-Status: GOOD (  20.65  )
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

From: Puranjay Mohan <puranjay12@gmail.com>

Currently, bpf_dispatcher_*_func() is marked with `__nocfi` therefore
calling BPF programs from this interface doesn't cause CFI warnings.

When BPF programs are called directly from C: from BPF helpers or
struct_ops, CFI warnings are generated.

Implement proper CFI prologues for the BPF programs and callbacks and
drop __nocfi for arm64. Fix the trampoline generation code to emit kCFI
prologue when a struct_ops trampoline is being prepared.

Signed-off-by: Puranjay Mohan <puranjay12@gmail.com>
Co-developed-by: Maxwell Bland <mbland@motorola.com>
Signed-off-by: Maxwell Bland <mbland@motorola.com>
Co-developed-by: Sami Tolvanen <samitolvanen@google.com>
Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
Tested-by: Dao Huang <huangdao1@oppo.com>
Acked-by: Will Deacon <will@kernel.org>
---
 arch/arm64/include/asm/cfi.h  |  7 +++++++
 arch/arm64/net/bpf_jit_comp.c | 22 +++++++++++++++++++---
 2 files changed, 26 insertions(+), 3 deletions(-)
 create mode 100644 arch/arm64/include/asm/cfi.h

diff --git a/arch/arm64/include/asm/cfi.h b/arch/arm64/include/asm/cfi.h
new file mode 100644
index 000000000000..ab90f0351b7a
--- /dev/null
+++ b/arch/arm64/include/asm/cfi.h
@@ -0,0 +1,7 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _ASM_ARM64_CFI_H
+#define _ASM_ARM64_CFI_H
+
+#define __bpfcall
+
+#endif /* _ASM_ARM64_CFI_H */
diff --git a/arch/arm64/net/bpf_jit_comp.c b/arch/arm64/net/bpf_jit_comp.c
index 89b1b8c248c6..f4a98c1a1583 100644
--- a/arch/arm64/net/bpf_jit_comp.c
+++ b/arch/arm64/net/bpf_jit_comp.c
@@ -10,6 +10,7 @@
 #include <linux/arm-smccc.h>
 #include <linux/bitfield.h>
 #include <linux/bpf.h>
+#include <linux/cfi.h>
 #include <linux/filter.h>
 #include <linux/memory.h>
 #include <linux/printk.h>
@@ -166,6 +167,12 @@ static inline void emit_bti(u32 insn, struct jit_ctx *ctx)
 		emit(insn, ctx);
 }
 
+static inline void emit_kcfi(u32 hash, struct jit_ctx *ctx)
+{
+	if (IS_ENABLED(CONFIG_CFI_CLANG))
+		emit(hash, ctx);
+}
+
 /*
  * Kernel addresses in the vmalloc space use at most 48 bits, and the
  * remaining bits are guaranteed to be 0x1. So we can compose the address
@@ -476,7 +483,6 @@ static int build_prologue(struct jit_ctx *ctx, bool ebpf_from_cbpf)
 	const bool is_main_prog = !bpf_is_subprog(prog);
 	const u8 fp = bpf2a64[BPF_REG_FP];
 	const u8 arena_vm_base = bpf2a64[ARENA_VM_START];
-	const int idx0 = ctx->idx;
 	int cur_offset;
 
 	/*
@@ -502,6 +508,9 @@ static int build_prologue(struct jit_ctx *ctx, bool ebpf_from_cbpf)
 	 *
 	 */
 
+	emit_kcfi(is_main_prog ? cfi_bpf_hash : cfi_bpf_subprog_hash, ctx);
+	const int idx0 = ctx->idx;
+
 	/* bpf function may be invoked by 3 instruction types:
 	 * 1. bl, attached via freplace to bpf prog via short jump
 	 * 2. br, attached via freplace to bpf prog via long jump
@@ -2055,9 +2064,9 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_prog *prog)
 		jit_data->ro_header = ro_header;
 	}
 
-	prog->bpf_func = (void *)ctx.ro_image;
+	prog->bpf_func = (void *)ctx.ro_image + cfi_get_offset();
 	prog->jited = 1;
-	prog->jited_len = prog_size;
+	prog->jited_len = prog_size - cfi_get_offset();
 
 	if (!prog->is_func || extra_pass) {
 		int i;
@@ -2426,6 +2435,12 @@ static int prepare_trampoline(struct jit_ctx *ctx, struct bpf_tramp_image *im,
 	/* return address locates above FP */
 	retaddr_off = stack_size + 8;
 
+	if (flags & BPF_TRAMP_F_INDIRECT) {
+		/*
+		 * Indirect call for bpf_struct_ops
+		 */
+		emit_kcfi(cfi_get_func_hash(func_addr), ctx);
+	}
 	/* bpf trampoline may be invoked by 3 instruction types:
 	 * 1. bl, attached to bpf prog or kernel function via short jump
 	 * 2. br, attached to bpf prog or kernel function via long jump
@@ -2942,6 +2957,7 @@ void bpf_jit_free(struct bpf_prog *prog)
 					   sizeof(jit_data->header->size));
 			kfree(jit_data);
 		}
+		prog->bpf_func -= cfi_get_offset();
 		hdr = bpf_jit_binary_pack_hdr(prog);
 		bpf_jit_binary_pack_free(hdr, NULL);
 		WARN_ON_ONCE(!bpf_prog_kallsyms_verify_off(prog));
-- 
2.50.0.727.gbf7dc18ff4-goog


