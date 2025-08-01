Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32771C87FD3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Aug 2025 01:43:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f5uDl85wDGhTjSIRJ3MDpBVcbv+/o9QKj57RG6DGCPk=; b=Wiu8uLS+FCB64U93Maudnz+SdS
	rZ8acM00zAnIm+NkNHUJGh6lPvDl6G8bjcI2quKC55ZIr8cFHOhpPcjnkxW1RwruIorFbVxCph08k
	BZFK7CeIey8nDv53QyGVmWP/cspa1gXdXAXYQZ64kYCDoanVu9PHByty5EA2kP/hrNAwMTTjoBV36
	RvV5/vcxqfLz/qLf8s82gQ8ew18f3BwEuSo/MvgoYF6zxhy2ZBIhz+FGEtvN5s/Co1lnmTK+LiwLF
	lIHl567BT+TnIVV1SUAWUlEs3tgPe3KJv3iZovAnabORddGfEbWruhvZMowVxgwpDHsjYU4J3FnsK
	IggSlL+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhend-00000004n9U-0yzd;
	Fri, 01 Aug 2025 01:43:09 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhdLz-00000004i7E-0LXS
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 01 Aug 2025 00:10:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=f5uDl85wDGhTjSIRJ3MDpBVcbv+/o9QKj57RG6DGCPk=; b=cJ8Y/Rqr+hmBtV0PbWygbllB0E
	eblEmtJWaR7c2GQwx6GrEUl+2PPNxnLEABEUM1JLfPGS/Rcn2L+YBqkbDmus05tqrxow3G5Sblrx8
	Ka85Iga1ISA1rWwLKQvIewPXF9wII/cd6fVHZyt3j/4vSgq562rv13w8TCSjuMjjfm9HqdaoJ05Uo
	bfcHpVK41kLk/mftr2G4ciIRIucGZXjYP66TXpcN5jmGZ1Z8KUsmJkQmNc17rEJVyAzi7mPdjRm+z
	PDwZX2d9chJFl9RtthbkksmQMWfiLyYlm1kH6pHEVRcoIHZgsduGGTsy7Ww0Qjr8oWiQGZ7uqthJT
	kCukP7nw==;
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhdLo-0000000DBDk-1xG0
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Aug 2025 00:10:27 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-31ebadfb7f2so1537071a91.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 31 Jul 2025 17:10:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1754007014; x=1754611814; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=f5uDl85wDGhTjSIRJ3MDpBVcbv+/o9QKj57RG6DGCPk=;
        b=iWuBJ3fCQOHnPkgTr2bvlN0mq5gtLK3CKTPM2u7/tjnv3YaYdjD4+RWyzw3MC9uxzV
         LTbZj4XAGX4NUd+RXppAeI9f4ZqN8G76uRzLclltHKeddSECPiXEIeSRPVstPzbD79iH
         YZdWnLOBfsOXWYpvgEyB8iA51C78KDUuH0jixGsW4bHS/1KeQsz8KWSY+jmoHJ2gEx5L
         OnxgxlLqBNlTVoR+EmpuboUJ/124ub0K3ZUAiP5nSXZGjMgKdwhsO6PpFxjhOLHJm+nz
         +PWzMx1DWcnXGWl8WTGYQJZVv/ZiJAo+XTbnCKqVkgPyQt/9QvCR9MfF72A8eI7qeFh4
         +scg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754007014; x=1754611814;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=f5uDl85wDGhTjSIRJ3MDpBVcbv+/o9QKj57RG6DGCPk=;
        b=tj2sZc5ZTXIkq8WKekbj65xIPzaOQdxft9tLsIpXk94aPZ0/Q7uSQ+WCRtrFBTCvx3
         9aBpKzF2EKxFgH6w55LRxlCtnLlRKbT8iQH7fd+zQXF8nT3FgZ+t4f6rtpl7tIBwtX6B
         gjQUxfscZeb9EmHDwudFKj61zdCrZQ10jGFEYWwCk75g+YAYchpJ+e0XVNdVBppWCTkB
         8GGK0wwkmyjq7BC7nFXoIpLjpYDwijWUvdp5jJtznHmZHQmQq7QF7OHDrTCVA9mcDvaB
         z8Vurtlxm7P1SwDUfpiNFJVPOzIRoTJbSTRMBRLFJsAx4cEdMdsD1elKUF0VzWl7mFOP
         s2nQ==
X-Forwarded-Encrypted: i=1; AJvYcCWgk32QjpfXBROHgMKPXtPp2wbeAjOpvadRAdnDE2ZbKn++RjrgLUhtAotSly8XfEgl5SdjXtTdf32RHiBXtuLY@lists.infradead.org
X-Gm-Message-State: AOJu0Yy6G0NTK3stu66a0Z3am9S1N9A3cws3vkWV6PtSp3gf3AyH1NsG
	cKgG2mAW0Oqjxk0zHMdYq3Wdgod6HOdP4s/Bw8g74Li9tqRzATIvvpozbM3nCWRMFiWvFVkz1cy
	Vx9zkoRrfTSEMHBxNqKjNGXl0vJjT9g==
X-Google-Smtp-Source: AGHT+IGe6iTItosrIYdSiu53+Ci7qA2QFXWZJ90ywhAykW0k2WhvUSTmqFJV6z+v+U/Hxqi/jtBom1ufe6Z6w654MMc=
X-Received: from pjx3.prod.google.com ([2002:a17:90b:5683:b0:311:6040:2c7a])
 (user=samitolvanen job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:35d1:b0:312:e6f1:c05d with SMTP id 98e67ed59e1d1-31f5dd891dcmr12128094a91.2.1754007014453;
 Thu, 31 Jul 2025 17:10:14 -0700 (PDT)
Date: Fri,  1 Aug 2025 00:10:08 +0000
In-Reply-To: <20250801001004.1859976-5-samitolvanen@google.com>
Mime-Version: 1.0
References: <20250801001004.1859976-5-samitolvanen@google.com>
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=4507; i=samitolvanen@google.com;
 h=from:subject; bh=hZabVFFCxKVAeJdp4nYEgQjtD7vc/y+UZPfwjcPcYes=;
 b=owGbwMvMwCUWxa662nLh8irG02pJDBk9rPdi03WyDi2s+j2TLXrpqwQv4byFyydv75kopqocs
 DiXUWVmRykLgxgXg6yYIkvL19Vbd393Sn31uUgCZg4rE8gQBi5OAZjI5U0M/+sPv9nwy1tTa8sK
 7+iJU/REprzNuvh764M2XiPGqQp7Xrsz/JVLcNrHEN/pst8r23nVypj3X66827fl0ElBj7VHOT6 /cmcHAA==
X-Mailer: git-send-email 2.50.1.565.gc32cd1483b-goog
Message-ID: <20250801001004.1859976-8-samitolvanen@google.com>
Subject: [PATCH bpf-next v14 3/3] arm64/cfi,bpf: Support kCFI + BPF on arm64
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
X-CRM114-CacheID: sfid-20250801_011022_457053_547588F3 
X-CRM114-Status: GOOD (  21.44  )
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
index 97dfd5432809..52ffe115a8c4 100644
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
@@ -114,6 +115,14 @@ static inline void emit(const u32 insn, struct jit_ctx *ctx)
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
@@ -174,6 +183,12 @@ static inline void emit_bti(u32 insn, struct jit_ctx *ctx)
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
@@ -503,7 +518,6 @@ static int build_prologue(struct jit_ctx *ctx, bool ebpf_from_cbpf)
 	const u8 arena_vm_base = bpf2a64[ARENA_VM_START];
 	const u8 priv_sp = bpf2a64[PRIVATE_SP];
 	void __percpu *priv_stack_ptr;
-	const int idx0 = ctx->idx;
 	int cur_offset;
 
 	/*
@@ -529,6 +543,9 @@ static int build_prologue(struct jit_ctx *ctx, bool ebpf_from_cbpf)
 	 *
 	 */
 
+	emit_kcfi(is_main_prog ? cfi_bpf_hash : cfi_bpf_subprog_hash, ctx);
+	const int idx0 = ctx->idx;
+
 	/* bpf function may be invoked by 3 instruction types:
 	 * 1. bl, attached via freplace to bpf prog via short jump
 	 * 2. br, attached via freplace to bpf prog via long jump
@@ -2146,9 +2163,9 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_prog *prog)
 		jit_data->ro_header = ro_header;
 	}
 
-	prog->bpf_func = (void *)ctx.ro_image;
+	prog->bpf_func = (void *)ctx.ro_image + cfi_get_offset();
 	prog->jited = 1;
-	prog->jited_len = prog_size;
+	prog->jited_len = prog_size - cfi_get_offset();
 
 	if (!prog->is_func || extra_pass) {
 		int i;
@@ -2527,6 +2544,12 @@ static int prepare_trampoline(struct jit_ctx *ctx, struct bpf_tramp_image *im,
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
@@ -3045,6 +3068,7 @@ void bpf_jit_free(struct bpf_prog *prog)
 					   sizeof(jit_data->header->size));
 			kfree(jit_data);
 		}
+		prog->bpf_func -= cfi_get_offset();
 		hdr = bpf_jit_binary_pack_hdr(prog);
 		bpf_jit_binary_pack_free(hdr, NULL);
 		priv_stack_ptr = prog->aux->priv_stack_ptr;
-- 
2.50.1.565.gc32cd1483b-goog


