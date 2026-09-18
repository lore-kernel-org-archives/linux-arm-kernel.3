Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB673C982DF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 14:52:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RnutA+SVEPQhig+pWBctSm0lXzVfwP4aZM5FopJbHtE=; b=aFmLfiyDMtaLWFvcXjPMCAvrgH
	HVG5OqiBoK3X7m4qCbqxmvy+jUCVAHxtd4XgudgNbjspX07Wu2UJUNiWO+vVQeusxCgvgPBHZzy82
	79RIGFgm35AgetbJR8SoAy4dXN/blvOU9fduytq2vobjx67byKncBrbWHBWTwBue5Am1jm4lUMTAZ
	1NqmwVGlwQSwlCh1MAQ5oc/kyp1Ko080/UcpUOS/fi0yFL7oLsAQipuIE6CGYpRnMMvG3fmHT5PuC
	YDls50RsqUejaRfA9VraxAFGNht7TonsNysdLYqJaJSU/MHoSsUrFvH/SgQ1kr2tFdyOni46//3Ye
	8arJQhfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Zx3-0000000EmI3-1iiP;
	Fri, 18 Sep 2026 14:52:33 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Zx1-0000000EmHJ-2NOX
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 14:52:31 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 097C86053D;
	Fri, 18 Sep 2026 14:52:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 434281F0089A;
	Fri, 18 Sep 2026 14:52:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789743150;
	bh=RnutA+SVEPQhig+pWBctSm0lXzVfwP4aZM5FopJbHtE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=NVHbzjhCKBzFJ93rW2N72ADw2QOi2UOdtdCn8dgyKgGKczC3D02G0QfqTKYT2Cnjt
	 IjZWGBwGHNhEHimgXtJIyfYXtUps3sQrWR3agnXu3hSTCXKi+TLH/jBX0s0k8oFRUH
	 Hh51/9NoGJuuIKYU7tYBnFZX6V7eAYgZj0FYxoA/KOkCJ3raG+RxX1edGI6BYoJvXN
	 jwOtIbWpcUrdmbiDDhpms002VfnT3A2X6Lb6UlRyoNHNv/bkPbq8Lh6WXbaVaGutWt
	 G+BmJFWDau9OaFaahLjKJGss478HL7ReG86HEtSHBqlkuH5qNd76tWF4/ZSnCfJrnM
	 EfZFxcoEo2xwQ==
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
Subject: [PATCH v3 02/13] arm64: bpf: Remove big-endian support from the JIT compiler
Date: Fri, 18 Sep 2026 15:52:04 +0100
Message-ID: <20260918145217.1669-3-will@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260918145217.1669-1-will@kernel.org>
References: <20260918145217.1669-1-will@kernel.org>
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
Acked-by: Alexei Starovoitov <ast@kernel.org>
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
2.55.0.1082.g2b9226bbc0-goog


