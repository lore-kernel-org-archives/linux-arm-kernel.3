Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B113C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Jul 2025 22:44:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZHownloYScgx/peEPOAu+NanD7LJponwsGoBJ5e+uKQ=; b=cwQNc/KVNKjkaPdvj9o8O7vFBZ
	3B3ILhhsYo+pEDm4KuOEwjbvRlkygQBl58Eqjy1iCbFd5rYeh0X/eWb/rbA4sTcEAA8eL/zndPtyy
	YFTGA3POG/Xm+qcxJ5CxgRd/coF+RkwgcOQOppTGIhxQUwHQljmveVQaYniB1tUUXeGptSsF3fR4j
	6lLFZ227rX2U8qd9+2Gnmkml8x8inYQQ3Bg6jFcVjM3dzr5e7HdvsmZ4C0dULFk9OyITrvE7q9K55
	DJ1wQAZ0nn2LT+GMgXVoM4TYv5LieKYWx4kyfFeoVO/dXCRtaD5o5OD51TjMUiIWL2zZDCd1DIFne
	yvuscFKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucto2-0000000DYsK-3Od7;
	Fri, 18 Jul 2025 22:43:54 +0000
Received: from mail-pg1-x54a.google.com ([2607:f8b0:4864:20::54a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucteP-0000000DYC5-3G3q
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Jul 2025 22:33:58 +0000
Received: by mail-pg1-x54a.google.com with SMTP id 41be03b00d2f7-b3f321dc6abso716409a12.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Jul 2025 15:33:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1752878036; x=1753482836; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZHownloYScgx/peEPOAu+NanD7LJponwsGoBJ5e+uKQ=;
        b=AklqhIviUz2t75numIPL1gIUHX1bNAyJgbYPYd3nTqtZp4blNybrdf7ZYjgVzgQpKa
         Bmz83cJqSqWvq0nPIrO5rHR7IpM8nWiXKkBQQ+XjDq+hB//9VQzDVG8kfaufcVk6Pjyt
         LuXfjJ/BXo7kPRd5mWxlHd3fx7YwzqjDyw1ygJ+OePPkhYa1iQFOHNnSxv3rOp1Azjyj
         U7PgwmBvFnJIOahOBce5+TMbNN319xoOTfRT/SzObNNvPZLB4vxQXHl5dkMfR6r3YYKr
         WRD8Z3CwlaA7W/B/6s/Y4Qs6Pb6Pe711A/iLjRpXFZOlTnBK1NpCOI1+hl73X5DYJmut
         1Now==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752878036; x=1753482836;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZHownloYScgx/peEPOAu+NanD7LJponwsGoBJ5e+uKQ=;
        b=RmgtMuq9D8PF3F9OPLa8c/q/gSjeqhPcMEWviA7RUiH6SBL+kIbcvmJkjpuguP+V8f
         9t5oKY1ABujqMxVnKtyOBAKFw892nfO+lvv7QP02UNaTiy/xxvfsib5Cwv8ZMhosB6aj
         yY6WlhIlEVCikvhvfhKErJKawyTm60fQJ+fOtoUknUZLNlaY6aTYxGhxnJIp7OVRGO6i
         cpXPM1U1f4jJea+EHegCPGDeFXS+cS2YKWSciVbnmCRPYm/DxBWUaMy8MY6yBc6mxtEJ
         LmdQfYVs7ILEJFiPlkNSCsQVGdPiVw3lQvFkKNzFC06oqTulhU1WI5BsK0xzZsPzMfwZ
         pQWA==
X-Forwarded-Encrypted: i=1; AJvYcCWC9aATdy0E7GKVrtNmMb1FQDKXmrrmulcjAJTw8mQhqXFICFgFLHtxqFiga+jlJA4ClDMwTEQe97M7vX6vr787@lists.infradead.org
X-Gm-Message-State: AOJu0YwqG76FkDGBN9qGAZRjLGItZisbCP14c43fetSyY7cJ7Ruz88xB
	KtuMatAd1Ktw+2y5BN79W7QbTD3BPbV7+VDNJqN0GcnO/6Y3UbgfqR2f/UEWx8GKP1Hx8QwrgUy
	pfjPhyGLq+vsJcCHnFAfPu2H8VhS/yQ==
X-Google-Smtp-Source: AGHT+IH/zdK2zKLGKRZy6B1NJr3Oj3Ajj+FM6XNXJaqaMMi3F49NCdknto5RfR6BR+VXKXY2MJ7ChfHz+3y7/DnjrgM=
X-Received: from pgbcw13.prod.google.com ([2002:a05:6a02:428d:b0:b3b:b53c:abce])
 (user=samitolvanen job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a20:7283:b0:220:b161:431 with SMTP id adf61e73a8af0-23811d5b52dmr20957669637.7.1752878036666;
 Fri, 18 Jul 2025 15:33:56 -0700 (PDT)
Date: Fri, 18 Jul 2025 22:33:49 +0000
In-Reply-To: <20250718223345.1075521-5-samitolvanen@google.com>
Mime-Version: 1.0
References: <20250718223345.1075521-5-samitolvanen@google.com>
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=4115; i=samitolvanen@google.com;
 h=from:subject; bh=Btyu244psEehuoYDLzh4LQVWud/Fy+nWITFJv1APkz4=;
 b=owGbwMvMwCUWxa662nLh8irG02pJDBlVp0+vOOYy/+r1p9FXT9/9bvhfYatWqmliIcvzpfss7
 nEd6b5e0lHKwiDGxSArpsjS8nX11t3fnVJffS6SgJnDygQyhIGLUwAmYv2Q4b/Tz0kKatVhr094
 /Mh1+8s362EK68bAg55SBpU3Z/W19b9h+MOxK2GeXUlXzJuM9M3uFzpnH7O2PvB9isca9m0a5pX XgngB
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
Message-ID: <20250718223345.1075521-8-samitolvanen@google.com>
Subject: [PATCH bpf-next v11 3/3] arm64/cfi,bpf: Support kCFI + BPF on arm64
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
X-CRM114-CacheID: sfid-20250718_153357_820583_B2E40F60 
X-CRM114-Status: GOOD (  20.50  )
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


