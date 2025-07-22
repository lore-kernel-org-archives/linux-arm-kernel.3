Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87B93C83F27
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Jul 2025 21:04:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v0xky3Tz++dR8wOWXy0XI+fGsD8WnNLUtoliWtDdioM=; b=OY2ME1HGIG2A5H8PV6BQJaH1+Z
	7GMLntC+fwJigcFOARBdFzkLSToKumQA6iMxZdpwnDaPEO6i5IIk/h0QhVIAeXdURc0qXdgDGxpuL
	mhCjb6I6B5JA+Yb16VCI8Z5g1pd+Hlx/rx9/qzx3l81aXqg6xa8vCFAGYYOsmjPykloGd5shXQNYP
	r+W+RwA/3dRizyGWD0imVBdm94+rqlvtmwkhJ54v/eSr6L6jFbN3D2cPDLvSx1o5+Zr8ZiS0jLV8M
	eS+gTeuRdNmrZ/pqYKGmTTUak2Id2i/2ScSZ40PpVsXw9IOIf/V9vLJP1jAl36dmV/l6M/R4sjQ+N
	VHgcD6fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueKAA-00000003U5r-1qij;
	Tue, 22 Jul 2025 21:04:38 +0000
Received: from mail-pg1-x549.google.com ([2607:f8b0:4864:20::549])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueK00-00000003SzD-0z1G
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Jul 2025 20:54:09 +0000
Received: by mail-pg1-x549.google.com with SMTP id 41be03b00d2f7-b31df10dfadso4065850a12.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Jul 2025 13:54:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753217647; x=1753822447; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=v0xky3Tz++dR8wOWXy0XI+fGsD8WnNLUtoliWtDdioM=;
        b=s5w5N3VqkQBqRvFTVuVHwV1mqbstblVJMAaEWD1qHqraHGF3A3L/4ssMaGp3MPONKC
         /hn31lwc28atfo+UPZyDeFt5+DjSaZ+Hk9CiPxkNKo+kZSL5jsWW+a5vEucRVtVjWTyJ
         YUvsx5+dpHgKCrw9lZvcRWsY0T0qxhgyzgB7nEzWwP+v4Ls/SMbJ6kUEmkwoKcoesVIK
         HV2EN6xeLCLbXBXPqP/2oHZJAwcEKD7Hj/o6tUyw8VvbxM7T8LBEGIAnLAsZuFgHLDM5
         DHKeI/ZKBJFIwuCPB87hBnJgvW3Ri7yTVlveTrm5ddA9QqT5gfR9FqFMLLaFFJ8Y7QEG
         ObHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753217647; x=1753822447;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=v0xky3Tz++dR8wOWXy0XI+fGsD8WnNLUtoliWtDdioM=;
        b=JPUg5lsTQbx3YztevZjoEHaJ9iZpzx8SjQDs0UBZFfuvgKP1zAXNO9BeJtUFDCF1j8
         v7D37ISojyhgigTANPuqK93g7cQdI6SO4gNUUZWsKy6fPFNxsJVFMjPwB/EQINZD+Gne
         hfLDxdCPgddRyfgU9WB1QtfS8e97E9nRRSZth9YB8PKvJB1OTEiQ+VUgKz29ktpvDp35
         bbaZ4yEYC3861p3QcpRtBKG5+9heisPrbEIIWVrt+KRyzmsNa5AikigZ3ikx7QmNwa6D
         l3VQW+O7LJjVPUPhoQGidtLdYFY3mvWxmIm2SlzX4ypnpRiwHHX6YZfM5db51/FqUSQA
         RjaA==
X-Forwarded-Encrypted: i=1; AJvYcCXvVYyLeu+vaicB7fQK/Cf3aJsKt3bcdb984YNdsZYuNJROjw4PoFgCa67KBrt1Tj4OhUXq99Y//WsF/ejZVw6Z@lists.infradead.org
X-Gm-Message-State: AOJu0Yyv9C+pBgncGyxhrSJDUzA3ZXRgzeuYVyxDv9Zn+BzNBk99r/yK
	NFaigXfbXT22Pvd12Z62TSFoUDp2xet9f4E6iYG8GTTDE0XUsdCFJ4d7BXtha5H3CWMQF1wgad0
	XMg9zMiMHV0+KEnyCmSJnxYjwa4fNSQ==
X-Google-Smtp-Source: AGHT+IH6x4q5kLczvA9H+m286fHAokh7HU92JRe53jNpVYETLy7h6qxVO9bNE0XMECCrfd5TA/Z0QoAyJ5vJf8ucB2k=
X-Received: from pfbha4.prod.google.com ([2002:a05:6a00:8504:b0:746:2897:67e3])
 (user=samitolvanen job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a21:1fc3:b0:23d:35f2:4e69 with SMTP id adf61e73a8af0-23d490f6100mr432417637.23.1753217647145;
 Tue, 22 Jul 2025 13:54:07 -0700 (PDT)
Date: Tue, 22 Jul 2025 20:54:01 +0000
In-Reply-To: <20250722205357.3347626-5-samitolvanen@google.com>
Mime-Version: 1.0
References: <20250722205357.3347626-5-samitolvanen@google.com>
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=4527; i=samitolvanen@google.com;
 h=from:subject; bh=V2hbK6L5Ngvs6CaLj1XnAp6J1iiarTYTez80LhYwsI4=;
 b=owGbwMvMwCUWxa662nLh8irG02pJDBn1v9I5n4RtPnZpu4LCIsOEhytmr2wSm7Bl7r4PE5YcN
 AzVFpxh3VHKwiDGxSArpsjS8nX11t3fnVJffS6SgJnDygQyhIGLUwAmwhzCyHA8ZdFRGXGj7H3m
 hcF8nw+xrJNYb3aRyVxu/b1fSybV9aYw/Pe4pPziyteDP3gibqY7T+XMu1ZoJl5VMkO3/+uVq9t uHmIHAA==
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
Message-ID: <20250722205357.3347626-8-samitolvanen@google.com>
Subject: [PATCH bpf-next v13 3/3] arm64/cfi,bpf: Support kCFI + BPF on arm64
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
X-CRM114-CacheID: sfid-20250722_135408_281823_0534735B 
X-CRM114-Status: GOOD (  21.15  )
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
 arch/arm64/net/bpf_jit_comp.c | 30 +++++++++++++++++++++++++++---
 2 files changed, 34 insertions(+), 3 deletions(-)
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
index 89b1b8c248c6..993b5d6e1525 100644
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
@@ -106,6 +107,14 @@ static inline void emit(const u32 insn, struct jit_ctx *ctx)
 	ctx->idx++;
 }
 
+static inline void emit_u32_data(const u32 data, struct jit_ctx *ctx)
+{
+	if (ctx->image != NULL && ctx->write)
+		ctx->image[ctx->idx] = data;
+
+	ctx->idx++;
+}
+
 static inline void emit_a64_mov_i(const int is64, const int reg,
 				  const s32 val, struct jit_ctx *ctx)
 {
@@ -166,6 +175,12 @@ static inline void emit_bti(u32 insn, struct jit_ctx *ctx)
 		emit(insn, ctx);
 }
 
+static inline void emit_kcfi(u32 hash, struct jit_ctx *ctx)
+{
+	if (IS_ENABLED(CONFIG_CFI_CLANG))
+		emit_u32_data(hash, ctx);
+}
+
 /*
  * Kernel addresses in the vmalloc space use at most 48 bits, and the
  * remaining bits are guaranteed to be 0x1. So we can compose the address
@@ -476,7 +491,6 @@ static int build_prologue(struct jit_ctx *ctx, bool ebpf_from_cbpf)
 	const bool is_main_prog = !bpf_is_subprog(prog);
 	const u8 fp = bpf2a64[BPF_REG_FP];
 	const u8 arena_vm_base = bpf2a64[ARENA_VM_START];
-	const int idx0 = ctx->idx;
 	int cur_offset;
 
 	/*
@@ -502,6 +516,9 @@ static int build_prologue(struct jit_ctx *ctx, bool ebpf_from_cbpf)
 	 *
 	 */
 
+	emit_kcfi(is_main_prog ? cfi_bpf_hash : cfi_bpf_subprog_hash, ctx);
+	const int idx0 = ctx->idx;
+
 	/* bpf function may be invoked by 3 instruction types:
 	 * 1. bl, attached via freplace to bpf prog via short jump
 	 * 2. br, attached via freplace to bpf prog via long jump
@@ -2055,9 +2072,9 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_prog *prog)
 		jit_data->ro_header = ro_header;
 	}
 
-	prog->bpf_func = (void *)ctx.ro_image;
+	prog->bpf_func = (void *)ctx.ro_image + cfi_get_offset();
 	prog->jited = 1;
-	prog->jited_len = prog_size;
+	prog->jited_len = prog_size - cfi_get_offset();
 
 	if (!prog->is_func || extra_pass) {
 		int i;
@@ -2426,6 +2443,12 @@ static int prepare_trampoline(struct jit_ctx *ctx, struct bpf_tramp_image *im,
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
@@ -2942,6 +2965,7 @@ void bpf_jit_free(struct bpf_prog *prog)
 					   sizeof(jit_data->header->size));
 			kfree(jit_data);
 		}
+		prog->bpf_func -= cfi_get_offset();
 		hdr = bpf_jit_binary_pack_hdr(prog);
 		bpf_jit_binary_pack_free(hdr, NULL);
 		WARN_ON_ONCE(!bpf_prog_kallsyms_verify_off(prog));
-- 
2.50.0.727.gbf7dc18ff4-goog


