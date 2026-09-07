Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66EE4C79FA0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 16:37:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6dpWxBNfInUaNyuOgfIBwdLimXQZBIeRnLQ9BgIWjOg=; b=bZGrtUCbg9zEE9oL02pg5TQxtL
	TDKWVCgspoLrNVpBQN84VEOTEyc8q46QbI/XqesMws56vIUSwwRk0fk3yrx7yzHEOY+xw44xCLqzr
	is0TlAYPOUcj4F0qDtmH6kx2sfzmWXYji702G/RZtccLu4EPH0MsCgydUvT3GNP7oX15AsTANtlSr
	TY0Zrp41Tya2P5/ZpTAQ0cIAU39AdwpB69cL8uv+lDF5zxzhrd51nslZ16n4DRbl+K0PSRgIfNkeF
	eeSezn8xfzm5UBNFazdGTOGANlvGEs9PZlnYXqXbm6KvNRU6TRvnqjOXDhxvU1NqVOzZ0YehFmwwk
	pjZuX6SQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3cLu-00000007Jus-0bTo;
	Mon, 07 Sep 2026 16:37:50 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3cLs-00000007JuP-2M0U
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 16:37:48 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id BA4D343A9D;
	Mon,  7 Sep 2026 16:37:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EFFE1F00A3F;
	Mon,  7 Sep 2026 16:37:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788799066;
	bh=6dpWxBNfInUaNyuOgfIBwdLimXQZBIeRnLQ9BgIWjOg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=OllL8Lp00Z8nr/h17b8SYnuzFy/hSbyCf+Tvwy7p8L64bUGwMcN1nd6DGRDIN8fGd
	 lWzugKZ5CfdasfuwMRAZ4X9N3lClg+/7LBF5/p/hNytQOm3Vz4We/rmTvM3Iu4PCYB
	 H2dMwLJk55RtPvHCi2AUwjDzslaFvZrbSkIqGZBTJPQfmhoM/HLlkcZkHaZoMq2Yo3
	 lEIN43ThUvvn57i2gwSxBuGjYPXcHMyzxCZ6cEnzA4acvaVkXHp78mV1kAPMLgzcta
	 D7C3U9bEQJwqskOVZ+iclXqumAGaVnnGaPg8OuU06FZL3Swsv0O5vBvj+c51/grdLi
	 kFU3ux3+qnSXA==
From: Will Deacon <will@kernel.org>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Will Deacon <will@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Ard Biesheuvel <ardb@kernel.org>,
	Eric Biggers <ebiggers@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Marc Zyngier <maz@kernel.org>
Subject: [PATCH v2 02/14] arm64: bpf: Remove big-endian support from the JIT compiler
Date: Mon,  7 Sep 2026 17:37:13 +0100
Message-ID: <20260907163726.17104-3-will@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260907163726.17104-1-will@kernel.org>
References: <20260907163726.17104-1-will@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Big-endian support on arm64 depends on BROKEN. In preparation for
removing the dead code altogether, remove the big-endian-specific
support from the arm64 BPF JIT backend.

Acked-by: Catalin Marinas <catalin.marinas@arm.com>
Acked-by: Arnd Bergmann <arnd@arndb.de>
Acked-by: Marc Zyngier <maz@kernel.org>
Acked-by: Eric Biggers <ebiggers@kernel.org>
Signed-off-by: Will Deacon <will@kernel.org>
---
 arch/arm64/net/bpf_jit_comp.c | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/arch/arm64/net/bpf_jit_comp.c b/arch/arm64/net/bpf_jit_comp.c
index c18e005a41db..a5634428fdd5 100644
--- a/arch/arm64/net/bpf_jit_comp.c
+++ b/arch/arm64/net/bpf_jit_comp.c
@@ -1439,13 +1439,8 @@ static int build_insn(const struct bpf_verifier_env *env, const struct bpf_insn
 	case BPF_ALU | BPF_END | BPF_FROM_LE:
 	case BPF_ALU | BPF_END | BPF_FROM_BE:
 	case BPF_ALU64 | BPF_END | BPF_FROM_LE:
-#ifdef CONFIG_CPU_BIG_ENDIAN
-		if (BPF_CLASS(code) == BPF_ALU && BPF_SRC(code) == BPF_FROM_BE)
-			goto emit_bswap_uxt;
-#else /* !CONFIG_CPU_BIG_ENDIAN */
 		if (BPF_CLASS(code) == BPF_ALU && BPF_SRC(code) == BPF_FROM_LE)
 			goto emit_bswap_uxt;
-#endif
 		switch (imm) {
 		case 16:
 			emit(A64_REV16(is64, dst, dst), ctx);
@@ -2559,15 +2554,9 @@ static void clear_garbage(struct jit_ctx *ctx, int reg, int effective_bytes)
 {
 	if (effective_bytes) {
 		int garbage_bits = 64 - 8 * effective_bytes;
-#ifdef CONFIG_CPU_BIG_ENDIAN
-		/* garbage bits are at the right end */
-		emit(A64_LSR(1, reg, reg, garbage_bits), ctx);
-		emit(A64_LSL(1, reg, reg, garbage_bits), ctx);
-#else
 		/* garbage bits are at the left end */
 		emit(A64_LSL(1, reg, reg, garbage_bits), ctx);
 		emit(A64_LSR(1, reg, reg, garbage_bits), ctx);
-#endif
 	}
 }
 
-- 
2.55.0.979.g7e5102b832-goog


