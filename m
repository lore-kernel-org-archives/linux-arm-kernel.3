Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1680DC83F27
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jul 2025 23:07:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UMeLoHHXfTV79ojOu6a6TdIa46QGFM3PiTHew+k00C8=; b=t9VvqjSgurtDQAHTb9qQ/F+LNr
	rc0h09nepEFdUg1mezN6Nm7Cp40r6xJIROluoy58pynZ5Ij3nEGWI7WBr/bw7K8o4yWwDow9jouzF
	el5nKe7dSTlsDJ/i1jJRf7lO4WahvMwrQ4BwI8yIwaGONtUcdENbeosW8MgXeED4nPy5a6NyAtPSo
	4CmR+jFcHD3GAiF32Toj8rRT3/CbA4QXKrDjzalJB2ca7feUJ6RyU4DvZ3o7EN27zyhQshpPpMy7e
	yspKTJwhQPfufEB65b0K84psw7dbPfKv9//SrH04CyuKRLcCCmKjTTLrU8jVE3/wD6yEMf/IidW0t
	fNsmEjOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubokR-00000006NO9-1CCT;
	Tue, 15 Jul 2025 23:07:43 +0000
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uboas-00000006M2S-0nLK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Jul 2025 22:57:51 +0000
Received: by mail-pf1-x44a.google.com with SMTP id d2e1a72fcca58-756a4884dfcso453101b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Jul 2025 15:57:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1752620269; x=1753225069; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=UMeLoHHXfTV79ojOu6a6TdIa46QGFM3PiTHew+k00C8=;
        b=xpVbwvkwZqKUL2pqAXZTWu2Bg8ke3Q+ZyHbz0sd+kM43OSqMbSKE9wtwx33QTmsPrM
         Q6fno3wmAZAyp10O56QnuDKoUlC/WgQD0xbESIlJwquc5Ngyl7gTlf8BUwNPSs6hDYqH
         HkuMm6CmEizrMK56w72hydYmoC15fas3FV62vn6gKAy5Sgpds8usg1YIgqPnQTWqYtnR
         /NNlCUC1kNeOv9ygslep3uPZNsXRBdpvaZGQUFtLgDZUQy99n13GnjOQRaJM63e+5BW+
         VXgvxIKDOh2RdEP5NCChyVt8FyLz1NZa3czhCczDdgBrGJky3lSGx+8htafuLF7JMwC3
         6w1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752620269; x=1753225069;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UMeLoHHXfTV79ojOu6a6TdIa46QGFM3PiTHew+k00C8=;
        b=OGVxn9GwRrIhiedm9YeI/vgmvFvXEdoTRKeLwTk4bqobxXxcTyeymE+e/8Wvl5ldQF
         1Uc65sjtxkfXzhFCbfR7dttnoRCwmD8UZSPxDOKOmEZDhoJZS9ty+sGitKP3jK68SvKn
         k/uXnxaqzgLUT4l8iNW3yGKPIR5arP67x4DJ0J3ejIjSr5NUZQ+kVvdKN2b/VIP+kaAb
         1SrlgGvTTabYPLiH4l498wX2CUO9gjg9GQ11Ye77yCkQpO4pcV0rvlNfr6n9tzY4CTjf
         JRgVmXD+CV6KHGFXtsetobw3Z9TEmB1aW87fwfPhnVo8aQYdhKzXA3dBcu+6kmP5t+V9
         GJ2g==
X-Forwarded-Encrypted: i=1; AJvYcCXzPCC32C5g9ZT7YDwZt1MUpXHzqI/NKUXiI0+UOSkMwuL2Qst7Od4jSltGtJaPYN/TzA4r3Gutdtv7PFjimSTe@lists.infradead.org
X-Gm-Message-State: AOJu0YwlWK6SkVN7MRvylh6P3nDtGPfMZ5NlXDml4OnqMP3YPwZLHF2D
	Pi3qud5Ac8qXNsjpKNnXAFwZJGjMrVtrW8TWZ2xH20C8QiGuY05Q2rIOxnHuJp8XWdkSPXaLtZc
	FSWh26YmX9c1wSYTAnqNPAAtMKDkkPQ==
X-Google-Smtp-Source: AGHT+IG3vbzi3NS1evCtARelMjUlrEo+9oD75X7Kycti+9xG6ucYm6MbJrliwfPbGT6yJzXUkmX1s4WzbSQSu1uIXYw=
X-Received: from pfbcw5.prod.google.com ([2002:a05:6a00:4505:b0:748:f4a1:ae2e])
 (user=samitolvanen job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a21:33aa:b0:22f:bba6:5dee with SMTP id adf61e73a8af0-23813350a48mr649865637.34.1752620268643;
 Tue, 15 Jul 2025 15:57:48 -0700 (PDT)
Date: Tue, 15 Jul 2025 22:57:37 +0000
In-Reply-To: <20250715225733.3921432-5-samitolvanen@google.com>
Mime-Version: 1.0
References: <20250715225733.3921432-5-samitolvanen@google.com>
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=4074; i=samitolvanen@google.com;
 h=from:subject; bh=rKFd0jTYWs9nu9VBagQnyYYRJmgpx3uHjv+Tze4TT2E=;
 b=owGbwMvMwCUWxa662nLh8irG02pJDBlld+5/zxS2cDSfHqLN/vbuV84Dj1mDfnw4sbZX68E19
 qcvVLK9OkpZGMS4GGTFFFlavq7euvu7U+qrz0USMHNYmUCGMHBxCsBErGUZ/ucd6+sWWrUn72aQ
 i8bsr+f7t+RMz9/wsbnj7z1n9hUW+R6MDBM+2oewJ+8In9Tk5rx9vcjNHY3LRL0viWbyvjKfFtL IxQcA
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
Message-ID: <20250715225733.3921432-8-samitolvanen@google.com>
Subject: [PATCH bpf-next v10 3/3] arm64/cfi,bpf: Support kCFI + BPF on arm64
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
X-CRM114-CacheID: sfid-20250715_155750_232349_18A6A1E6 
X-CRM114-Status: GOOD (  21.08  )
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
index b6c42b5c9668..7509ac6e76bf 100644
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
@@ -2431,6 +2440,12 @@ static int prepare_trampoline(struct jit_ctx *ctx, struct bpf_tramp_image *im,
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
@@ -2947,6 +2962,7 @@ void bpf_jit_free(struct bpf_prog *prog)
 					   sizeof(jit_data->header->size));
 			kfree(jit_data);
 		}
+		prog->bpf_func -= cfi_get_offset();
 		hdr = bpf_jit_binary_pack_hdr(prog);
 		bpf_jit_binary_pack_free(hdr, NULL);
 		WARN_ON_ONCE(!bpf_prog_kallsyms_verify_off(prog));
-- 
2.50.0.727.gbf7dc18ff4-goog


