Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD5FDC5B572
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Aug 2026 14:01:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QAN0l7yaydmlw2Fkf5Tw2odDTeok7Wk3+KXsmI6pBNc=; b=uNbjMMjLm45UpoLo3qtMJWHhWC
	MZYlTDMYYcpCLbC2ZrBbguoh+LB7G0OzF7KAHaB8LplbWVdmM/hxvlBbC5ueM4rPQ1jw+Oao6oHGR
	KyNgp8GCmqubNAeSV1g9I98GyNdRYXR/dA6VW+PxhE/jxpBZR+ljkZvy2hKmLe2VR+U5yh/Ubcx4p
	vH18NDgEWK9AcQLq7y9G3AC7BV7DP69ThTli7xQoxkZ/uQ4p/e3ObqAgQ+czb+5qCG+6vPc9fjMul
	yE3TSZKZtspcuF4oVxYiE4OQ7JyoFcoSsqcdh/HLUvvcmEwncgTtAiYG2AC35owEDbAm1C6vLjR8w
	+VsotWLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtn36-0000000E9M4-1a09;
	Tue, 11 Aug 2026 14:01:48 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtn34-0000000E9Le-3GXk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Aug 2026 14:01:46 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 0FB9C600BB;
	Tue, 11 Aug 2026 14:01:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 600DE1F00A3E;
	Tue, 11 Aug 2026 14:01:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786456905;
	bh=QAN0l7yaydmlw2Fkf5Tw2odDTeok7Wk3+KXsmI6pBNc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ZTZG9dqNeXmloyamvDBCjoTZjYp+h4HLwHk3qphnHwHXV7i23kF8ZbQT6BOvovJ7J
	 Zx1DPOnrTuPmbKCGfMYhu4d+VwRrNmmgIHBo37EgVeC+J+05O6InEmetwXNFpKCecy
	 eN6LmOn6BXFzqst6QRJahAbi91lV7MFLWvK7YDHREmt16h8ara+G4lXkelTFpsfDGc
	 usXatHN9zi1NrgdogqlxadKEdkBN9wjMq1W8zNLeUCUMkSOfi8rDxmA3WzE+ctIeeM
	 zHl4da3iOFP++E9ie1luQcF99eKsN4bBuWHbTPFAL5jjU/bmOVjxsAdHZWyrvnNgGZ
	 Gi70FiyNezPhQ==
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
Subject: [PATCH 02/12] arm64: bpf: Remove big-endian support from the JIT compiler
Date: Tue, 11 Aug 2026 15:01:21 +0100
Message-ID: <20260811140132.22778-3-will@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260811140132.22778-1-will@kernel.org>
References: <20260811140132.22778-1-will@kernel.org>
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

Signed-off-by: Will Deacon <will@kernel.org>
---
 arch/arm64/net/bpf_jit_comp.c | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/arch/arm64/net/bpf_jit_comp.c b/arch/arm64/net/bpf_jit_comp.c
index b0075ece4a6e..044216c4acf6 100644
--- a/arch/arm64/net/bpf_jit_comp.c
+++ b/arch/arm64/net/bpf_jit_comp.c
@@ -1377,13 +1377,8 @@ static int build_insn(const struct bpf_verifier_env *env, const struct bpf_insn
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
@@ -2478,15 +2473,9 @@ static void clear_garbage(struct jit_ctx *ctx, int reg, int effective_bytes)
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
2.55.0.679.g6767b8d81c-goog


