Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41D02C3ABBF
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 00:31:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7UG6GYoDYUvSTCJXNbhcTCy+rTclDma5rPa6bv6GcMw=; b=ADVNUt6dkeOQTdll2abc6cBcgF
	aPcAuIyh04iIJ6yZoCYrcoobFnMZQPRRH5vWOo66jZtTYsJRGkeoJQWTG/ePKnFKI52z8a/1AUhBx
	H4xNb/Ig8xK8rAgVdmOKPYL2Wfw/iNi1kITp8oqo3il6sCVBeAzwuyFBc+bFXt2kwUO1JZXaIqLqI
	8FPx29EHhIHKJLHplr20mVSKgd+jLkYHpeYFjnIEm0uBrBptZTwLFezmFStnSDCz4RBYGnYRE4vMf
	k8ZdtDkTVjSjp9O661liIP3JYXQTa/hWcsVH77fnZ0NZJEIvV7STdINDL1nUyY5AzAAzfQ/vHGSUg
	SQelAavg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC6Df-00000009IYG-0wW6;
	Tue, 06 May 2025 00:31:35 +0000
Received: from mail-pf1-x449.google.com ([2607:f8b0:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC4Oc-00000008ne6-10hv
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 May 2025 22:34:47 +0000
Received: by mail-pf1-x449.google.com with SMTP id d2e1a72fcca58-736b5f9279cso4096624b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 May 2025 15:34:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746484485; x=1747089285; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=7UG6GYoDYUvSTCJXNbhcTCy+rTclDma5rPa6bv6GcMw=;
        b=WJITwWLVlJiWk1aQk21zNlsvOExmqF2Hml+amhr8hbb2xSkKXJZMG3f1cJ+PMQNYZI
         3zS0cgxt/jPKpbRV4E1NpsApDTrDedQNiID8pSruQ0a+9SKaIrYjII7vYSxGTQdjw8BR
         3xSvFnPvhCOqJjhGEdUYQFcJYm1As9gFUJDFkg+rECu1uBld91oirPzenHr2aNavlZEv
         gkdEqsA5P/Ooj9O6VJ/niyadtKq0V5H6IVbF4rgWn9f/st4fmLooU0F7XdG+aAO0P1Fn
         rZeVJDOjOiX4/pLsudUrCL0lUBQWycBXn74oSnfiuhFxvTKZnoqsMOC9P37K50Ys018k
         v29w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746484485; x=1747089285;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7UG6GYoDYUvSTCJXNbhcTCy+rTclDma5rPa6bv6GcMw=;
        b=Dtv7MLKr/PyjP5pGkrPDmd2DuT/r0KIgw3ICYu1SNZsRBvFTbYBOUloofOnDGZWLxz
         7rRwAQlawbHfLGwj2F8cXQaOfo/zN3F2UHdPsHiXTB4mTvqfAUAgYjXdQE61y7ksz7Sf
         PafkgSDvKFweFePAQDtSCMdqAIKl20mP00+2APIsUCRq8K6QRgqvM2qbM1BEBrN3bI8O
         Nch2FTpWQ66zApet0iTv+it/AGWsmXUO9oN8p6wjnhKTo84lzcpCrANt5avtPs8ope4v
         38fcC0lr6ot0nc2Q35c3SijEgotbm24CNCEWBr+DZTDjCEX9dUvNNnq/Nh9cuh5eeRWl
         rW+g==
X-Forwarded-Encrypted: i=1; AJvYcCUfd9Zj5kOtkD1z19kGnofvOa60mxIsdFJdoMd2/EkHlGqJmQM2MB//AjmEQ9yCHuKiWpg9Jxj7emYQIPTlxBvE@lists.infradead.org
X-Gm-Message-State: AOJu0YxTOO+/PExn5ls3caDtcm62yH/FYotDrSxRRYBeD+eo44il2E5X
	EmOGni0Qki3H/3w94720uhD6NeuoVLMomaa9RjkQwSQR+qRRC6HXzOlDjvHUks3e4bhsKWdEgPp
	71ij8u+PqqC24C9uKR/vVsE9wiw==
X-Google-Smtp-Source: AGHT+IG9/bqquqZo0+5ekAmT9vTMi2AWIW4fPAq3lK8wl6/RiTTEb6BBW0o8BycH8+xREXoGfTl4Z8+v6d38vWKGCxA=
X-Received: from pgar26.prod.google.com ([2002:a05:6a02:2e9a:b0:af0:e359:c50a])
 (user=samitolvanen job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a20:43a3:b0:1f5:6c7b:8920 with SMTP id adf61e73a8af0-2118076ae4dmr1028201637.9.1746484484997;
 Mon, 05 May 2025 15:34:44 -0700 (PDT)
Date: Mon,  5 May 2025 22:34:40 +0000
In-Reply-To: <20250505223437.3722164-4-samitolvanen@google.com>
Mime-Version: 1.0
References: <20250505223437.3722164-4-samitolvanen@google.com>
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=5846; i=samitolvanen@google.com;
 h=from:subject; bh=7DbjnHH5VAkImXf9y6kWO2Cpd7OKLAKDbR8A6OUcpSo=;
 b=owGbwMvMwCEWxa662nLh8irG02pJDBmSNv+n70wW3Td999qDnluU1h/qaZRrv6XgbvBB9fe9j
 n2HrxUxdJSyMIhxMMiKKbK0fF29dfd3p9RXn4skYOawMoEMYeDiFICJ3PVg+Kcseq1CSHzW1a6c
 rZ4n9e4dPmdvfbpob7XIB/7NkjLOEkcZGdbeDuLtcTvWJBP+IZHFKOjdccWdfaFpL+7dCbLplng aygEA
X-Mailer: git-send-email 2.49.0.967.g6a0df3ecc3-goog
Message-ID: <20250505223437.3722164-6-samitolvanen@google.com>
Subject: [PATCH bpf-next v9 2/2] arm64/cfi,bpf: Support kCFI + BPF on arm64
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
X-CRM114-CacheID: sfid-20250505_153446_282825_EE1F3B87 
X-CRM114-Status: GOOD (  21.70  )
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
---
 arch/arm64/include/asm/cfi.h    | 23 +++++++++++++++++++++++
 arch/arm64/kernel/alternative.c | 25 +++++++++++++++++++++++++
 arch/arm64/net/bpf_jit_comp.c   | 22 +++++++++++++++++++---
 3 files changed, 67 insertions(+), 3 deletions(-)
 create mode 100644 arch/arm64/include/asm/cfi.h

diff --git a/arch/arm64/include/asm/cfi.h b/arch/arm64/include/asm/cfi.h
new file mode 100644
index 000000000000..670e191f8628
--- /dev/null
+++ b/arch/arm64/include/asm/cfi.h
@@ -0,0 +1,23 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _ASM_ARM64_CFI_H
+#define _ASM_ARM64_CFI_H
+
+#ifdef CONFIG_CFI_CLANG
+#define __bpfcall
+static inline int cfi_get_offset(void)
+{
+	return 4;
+}
+#define cfi_get_offset cfi_get_offset
+extern u32 cfi_bpf_hash;
+extern u32 cfi_bpf_subprog_hash;
+extern u32 cfi_get_func_hash(void *func);
+#else
+#define cfi_bpf_hash 0U
+#define cfi_bpf_subprog_hash 0U
+static inline u32 cfi_get_func_hash(void *func)
+{
+	return 0;
+}
+#endif /* CONFIG_CFI_CLANG */
+#endif /* _ASM_ARM64_CFI_H */
diff --git a/arch/arm64/kernel/alternative.c b/arch/arm64/kernel/alternative.c
index 8ff6610af496..71c153488dad 100644
--- a/arch/arm64/kernel/alternative.c
+++ b/arch/arm64/kernel/alternative.c
@@ -8,11 +8,13 @@
 
 #define pr_fmt(fmt) "alternatives: " fmt
 
+#include <linux/cfi_types.h>
 #include <linux/init.h>
 #include <linux/cpu.h>
 #include <linux/elf.h>
 #include <asm/cacheflush.h>
 #include <asm/alternative.h>
+#include <asm/cfi.h>
 #include <asm/cpufeature.h>
 #include <asm/insn.h>
 #include <asm/module.h>
@@ -298,3 +300,26 @@ noinstr void alt_cb_patch_nops(struct alt_instr *alt, __le32 *origptr,
 		updptr[i] = cpu_to_le32(aarch64_insn_gen_nop());
 }
 EXPORT_SYMBOL(alt_cb_patch_nops);
+
+#ifdef CONFIG_CFI_CLANG
+struct bpf_insn;
+
+/* Must match bpf_func_t / DEFINE_BPF_PROG_RUN() */
+extern unsigned int __bpf_prog_runX(const void *ctx,
+				    const struct bpf_insn *insn);
+DEFINE_CFI_TYPE(cfi_bpf_hash, __bpf_prog_runX);
+
+/* Must match bpf_callback_t */
+extern u64 __bpf_callback_fn(u64, u64, u64, u64, u64);
+DEFINE_CFI_TYPE(cfi_bpf_subprog_hash, __bpf_callback_fn);
+
+u32 cfi_get_func_hash(void *func)
+{
+	u32 hash;
+
+	if (get_kernel_nofault(hash, func - cfi_get_offset()))
+		return 0;
+
+	return hash;
+}
+#endif /* CONFIG_CFI_CLANG */
diff --git a/arch/arm64/net/bpf_jit_comp.c b/arch/arm64/net/bpf_jit_comp.c
index 70d7c89d3ac9..3b3691e88dd5 100644
--- a/arch/arm64/net/bpf_jit_comp.c
+++ b/arch/arm64/net/bpf_jit_comp.c
@@ -9,6 +9,7 @@
 
 #include <linux/bitfield.h>
 #include <linux/bpf.h>
+#include <linux/cfi.h>
 #include <linux/filter.h>
 #include <linux/memory.h>
 #include <linux/printk.h>
@@ -164,6 +165,12 @@ static inline void emit_bti(u32 insn, struct jit_ctx *ctx)
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
@@ -474,7 +481,6 @@ static int build_prologue(struct jit_ctx *ctx, bool ebpf_from_cbpf)
 	const bool is_main_prog = !bpf_is_subprog(prog);
 	const u8 fp = bpf2a64[BPF_REG_FP];
 	const u8 arena_vm_base = bpf2a64[ARENA_VM_START];
-	const int idx0 = ctx->idx;
 	int cur_offset;
 
 	/*
@@ -500,6 +506,9 @@ static int build_prologue(struct jit_ctx *ctx, bool ebpf_from_cbpf)
 	 *
 	 */
 
+	emit_kcfi(is_main_prog ? cfi_bpf_hash : cfi_bpf_subprog_hash, ctx);
+	const int idx0 = ctx->idx;
+
 	/* bpf function may be invoked by 3 instruction types:
 	 * 1. bl, attached via freplace to bpf prog via short jump
 	 * 2. br, attached via freplace to bpf prog via long jump
@@ -2009,9 +2018,9 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_prog *prog)
 		jit_data->ro_header = ro_header;
 	}
 
-	prog->bpf_func = (void *)ctx.ro_image;
+	prog->bpf_func = (void *)ctx.ro_image + cfi_get_offset();
 	prog->jited = 1;
-	prog->jited_len = prog_size;
+	prog->jited_len = prog_size - cfi_get_offset();
 
 	if (!prog->is_func || extra_pass) {
 		int i;
@@ -2271,6 +2280,12 @@ static int prepare_trampoline(struct jit_ctx *ctx, struct bpf_tramp_image *im,
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
@@ -2790,6 +2805,7 @@ void bpf_jit_free(struct bpf_prog *prog)
 					   sizeof(jit_data->header->size));
 			kfree(jit_data);
 		}
+		prog->bpf_func -= cfi_get_offset();
 		hdr = bpf_jit_binary_pack_hdr(prog);
 		bpf_jit_binary_pack_free(hdr, NULL);
 		WARN_ON_ONCE(!bpf_prog_kallsyms_verify_off(prog));
-- 
2.49.0.967.g6a0df3ecc3-goog


