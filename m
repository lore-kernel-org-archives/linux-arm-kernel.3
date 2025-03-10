Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D68ECC282DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Mar 2025 22:35:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VHU8rTWgBupCD0kyXYGUHHuE6QBh+Vnbh8dhf8rC5uU=; b=TeXh44UNi1DbwwPqfi/JfcZvgM
	WGbXqrLVd9MlKQauUt0gQJQ6CH9A4LgoOm/icKKIwiczpYisaAh0Kaxt1jcxRT8NFoOUEGE0yNOtQ
	qJGCtZJjE7FB8mYjWg6vzRsWJvgsCQ88H+sAgDvlrFos5T2WnmF2DPeRs9kb90l9YIJByY92Ur1Vj
	lL0k0KSiAlFg/ggjkifrhYjzVZOzYGyKaCVbD9+jFs3UeYvqlZflKduBj+qOaMyjN0SpFT4djBMXl
	7avojUPg689YZ9JkCp9Y3PT+2J6sRUQKzQMLeVKb3wencmNXwV4p+m7jjw13f8jKt3pj5g4XNCK/M
	52dBh7xQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trli5-000000048ab-3RSB;
	Mon, 10 Mar 2025 22:34:57 +0000
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trldE-00000004860-2lxC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Mar 2025 22:29:57 +0000
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-22403329f9eso79606445ad.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Mar 2025 15:29:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1741645795; x=1742250595; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=VHU8rTWgBupCD0kyXYGUHHuE6QBh+Vnbh8dhf8rC5uU=;
        b=jYMLEfSIB9tp4+d0NtqcoxwIozCbrv+ROEgITHiSiOsKScLGoS/1wRoeSTmY0S1WuP
         DoVgdSQsezGrmNhrkCLlRhwOyZJLvmjoB4fRatjhECDNiOeWAzSkytsz9MtRLToV0Y/y
         /LjImh2lkgOo5axEKhw7X6jmdZapX4k5RviUpwgYkLTmjZB/Fmoik6sOqfHegeL8Lkzy
         cgnWpPJ9GJFS+0HHt5t40fqCSf8EN9+iAYsdSdSDiolppfT1bxLYW7Kj1gl/n58B3mMO
         TVPpw8vV78fevpjKX0WiDGGhSfG2UCIPE0A25WyGxUn3Jau1Xnmij7X9EXqlB42+6Kme
         f85A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741645795; x=1742250595;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VHU8rTWgBupCD0kyXYGUHHuE6QBh+Vnbh8dhf8rC5uU=;
        b=LwIGx9K4Dw6CEoASN9OHdTFrOZKb/CchM0Pp2rYjPblxzIWLuHVa0Mph9WOz4Mn8HC
         hqcczsZeR111wPzOB3PE10uj/i3alW/CDGX0zk3uZAus7Ik3tZaw/vF2L9aBl26ZYhqI
         h0C7oMZ4gi0qpzUmT9nDvE60gMdqZBVTlcvFlch2Q2QPZWzoE8hgC9xK2dAMhe9kH2K8
         y1uM2Ym1gcUtFoA5AQjtFBo4/8oqotC93OqEIwBmTIilgQ3zMcgtqT4qjRKU1HfQiBfI
         l4cxw/FlfeagUfKa5wq40RneDAaOIhSrEGLSNfPnazWfmuKwUKgb/pAGxaDzsMIsPdfo
         joXw==
X-Forwarded-Encrypted: i=1; AJvYcCWRJdBrIGo+5dkgoerfnPzrPhzYugOmPZ2Zzvm4qQYyIQB7EztxYKEW853AfCbJWz8mosYch+tBh2P8g2r3IlBL@lists.infradead.org
X-Gm-Message-State: AOJu0YxP7bmNx6nK+xN/sjtMkLGA/YwAMf8VrJFCFD3I7+ZSKtY/xueA
	y0hCZHuQKMSoo6LVx2dpgf9EByVwPyJ2au7iHzd9r//jklwQIXZ1dOL7MTEPU0sRWVnoR6xBU6E
	yeXGKZ1oxGduVMlzmMa2hPEanAg==
X-Google-Smtp-Source: AGHT+IHFhuWhKuHNz9Fgp9FirrVIYERb4+eQ/sNIhVDmpSExLjut7bH5NkxneyzB/GAZESXqV0qgtpdoJPMyOC/28Jo=
X-Received: from pfdr25.prod.google.com ([2002:aa7:8b99:0:b0:736:5b75:dde8])
 (user=samitolvanen job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:e5d2:b0:224:e33:8896 with SMTP id d9443c01a7336-22428886514mr236067925ad.11.1741645794779;
 Mon, 10 Mar 2025 15:29:54 -0700 (PDT)
Date: Mon, 10 Mar 2025 22:29:45 +0000
In-Reply-To: <20250310222942.1988975-4-samitolvanen@google.com>
Mime-Version: 1.0
References: <20250310222942.1988975-4-samitolvanen@google.com>
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=5846; i=samitolvanen@google.com;
 h=from:subject; bh=nnEDzY0cdXNg5DInXr2mCSLGjD0bJaDeFd9RiRfzo4M=;
 b=owGbwMvMwCEWxa662nLh8irG02pJDOnn02+zmk8qvM15+eOR4itv2iUe3WHXdDmQpuh0RL2HJ
 XRC9zWzjlIWBjEOBlkxRZaWr6u37v7ulPrqc5EEzBxWJpAhDFycAjCRlrOMDKcmnAxb6p/PI9cV
 fKYpXWXrHP6PV8RC60/NC0ueoXVa4ybDP/uXoo8XlLM7M3z/3v7y6PUg117paX8rA40TnV1qmSq mMwEA
X-Mailer: git-send-email 2.49.0.rc0.332.g42c0ae87b1-goog
Message-ID: <20250310222942.1988975-6-samitolvanen@google.com>
Subject: [PATCH bpf-next v8 2/2] arm64/cfi,bpf: Support kCFI + BPF on arm64
From: Sami Tolvanen <samitolvanen@google.com>
To: bpf@vger.kernel.org
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Puranjay Mohan <puranjay12@gmail.com>, Maxwell Bland <mbland@motorola.com>, 
	Sami Tolvanen <samitolvanen@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_152956_702044_C37237E1 
X-CRM114-Status: GOOD (  21.79  )
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
Co-Developed-by: Maxwell Bland <mbland@motorola.com>
Signed-off-by: Maxwell Bland <mbland@motorola.com>
Co-Developed-by: Sami Tolvanen <samitolvanen@google.com>
Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
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
index 70d7c89d3ac9..8870c205f934 100644
--- a/arch/arm64/net/bpf_jit_comp.c
+++ b/arch/arm64/net/bpf_jit_comp.c
@@ -17,6 +17,7 @@
 #include <asm/asm-extable.h>
 #include <asm/byteorder.h>
 #include <asm/cacheflush.h>
+#include <asm/cfi.h>
 #include <asm/debug-monitors.h>
 #include <asm/insn.h>
 #include <asm/text-patching.h>
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
2.49.0.rc0.332.g42c0ae87b1-goog


