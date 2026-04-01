Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA09F10F9315
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Apr 2026 00:08:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S1nhQATRq7biQrrGMQK3ToeODei4RCKBpa0UhKvUJms=; b=SmO+07yzt43RcuDGHlNWHqaR1l
	FvRsTuPyNka+iMmJCXtD5dLrfuNzTYh/0rJjnD4btZNrwWgXCGGGgHbOsXadALtvnzXp9hZvGBNOD
	ebw6DQQqZOmrUA6Fkn6olrorVP2S+NfuO1LI69dQN4kq/I2sjPmbr53BktIDkJn6t0GgeFOo/fkEg
	zTjVaHjxyinvWtqv76ULwmP5B+By+E/lNp53/g+iZU4Z5xy8NoIys477jawZbNF14bALLmd+P8DE7
	Ce9pJ//ajhydDjJ0zVwkz5tg4S2rmxx7P01LjO5z1RCGetPdoDSXJOexuaO40ZbmWUc3bv7ZzWCWZ
	c7is8JGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7j7n-0000000DiHI-3jeM;
	Wed, 01 Apr 2026 00:07:59 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7j7g-0000000DiCN-2XjT
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Apr 2026 00:07:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0D71140687;
	Wed,  1 Apr 2026 00:07:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DE63C19423;
	Wed,  1 Apr 2026 00:07:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775002071;
	bh=07ofvOpbjy7Rvwy7/y+ptg/LOHhp6n7ORQdHYjZws/0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CCTICZVm5Xek9G7SrzaQRLeTtYiCK2S8jTgni2L9zEre5E/hNHHe0G0r5BKyKKsBQ
	 8su2oWId/cDBZrb8PihZ4wlC4Ac+nRiCWw+1LxhfViVGIWYY1icoXdLeqVK3g+FkBk
	 P0yrqKIyWvZVB8mGQ8DuE8EOCmCScQnIMzOziVA5frx4YczjVAvnFFBFKpWfLTG023
	 q8TcH0TbNobEHDIDB7Z+twjZCqMhogkSVZVDaYZqQogaimEHgJSgQlca67UfaVop4t
	 8fDcs/RlYsUuhCvb4Az988H0Ee8WzbBZ1vMFIVv6Me66kbvftzVGlnqUEvK2SQGZys
	 raP8llq4AjL+Q==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	linux-arm-kernel@lists.infradead.org,
	Eric Biggers <ebiggers@kernel.org>
Subject: [PATCH 8/9] lib/crypto: arm64/sha3: Remove obsolete chunking logic
Date: Tue, 31 Mar 2026 17:05:47 -0700
Message-ID: <20260401000548.133151-9-ebiggers@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260401000548.133151-1-ebiggers@kernel.org>
References: <20260401000548.133151-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_170752_681406_80B94E2C 
X-CRM114-Status: GOOD (  11.02  )
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

Since commit aefbab8e77eb ("arm64: fpsimd: Preserve/restore kernel mode
NEON at context switch"), kernel-mode NEON sections have been
preemptible on arm64.  And since commit 7dadeaa6e851 ("sched: Further
restrict the preemption modes"), voluntary preemption is no longer
supported on arm64 either.  Therefore, there's no longer any need to
limit the length of kernel-mode NEON sections on arm64.

Simplify the SHA-3 code accordingly.

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 lib/crypto/arm64/sha3-ce-core.S |  8 +++-----
 lib/crypto/arm64/sha3.h         | 15 ++++-----------
 2 files changed, 7 insertions(+), 16 deletions(-)

diff --git a/lib/crypto/arm64/sha3-ce-core.S b/lib/crypto/arm64/sha3-ce-core.S
index ace90b506490..b8ab01987ae0 100644
--- a/lib/crypto/arm64/sha3-ce-core.S
+++ b/lib/crypto/arm64/sha3-ce-core.S
@@ -35,12 +35,12 @@
 	.macro	xar, rd, rn, rm, imm6
 	.inst	0xce800000 | .L\rd | (.L\rn << 5) | ((\imm6) << 10) | (.L\rm << 16)
 	.endm
 
 	/*
-	 * size_t sha3_ce_transform(struct sha3_state *state, const u8 *data,
-	 *			    size_t nblocks, size_t block_size)
+	 * void sha3_ce_transform(struct sha3_state *state, const u8 *data,
+	 *			  size_t nblocks, size_t block_size)
 	 *
 	 * block_size is assumed to be one of 72 (SHA3-512), 104 (SHA3-384), 136
 	 * (SHA3-256 and SHAKE256), 144 (SHA3-224), or 168 (SHAKE128).
 	 */
 	.text
@@ -183,22 +183,20 @@ SYM_FUNC_START(sha3_ce_transform)
 	bcax	 v2.16b,  v2.16b, v28.16b, v27.16b
 
 	eor	 v0.16b,  v0.16b, v31.16b
 
 	cbnz	w8, 3b
-	cond_yield 4f, x8, x9
 	cbnz	x2, 0b
 
 	/* save state */
-4:	st1	{ v0.1d- v3.1d}, [x0], #32
+	st1	{ v0.1d- v3.1d}, [x0], #32
 	st1	{ v4.1d- v7.1d}, [x0], #32
 	st1	{ v8.1d-v11.1d}, [x0], #32
 	st1	{v12.1d-v15.1d}, [x0], #32
 	st1	{v16.1d-v19.1d}, [x0], #32
 	st1	{v20.1d-v23.1d}, [x0], #32
 	st1	{v24.1d}, [x0]
-	mov	x0, x2
 	ret
 SYM_FUNC_END(sha3_ce_transform)
 
 	.section	".rodata", "a"
 	.align		8
diff --git a/lib/crypto/arm64/sha3.h b/lib/crypto/arm64/sha3.h
index b602f1b3b282..eaaba3224acc 100644
--- a/lib/crypto/arm64/sha3.h
+++ b/lib/crypto/arm64/sha3.h
@@ -10,26 +10,19 @@
 #include <asm/simd.h>
 #include <linux/cpufeature.h>
 
 static __ro_after_init DEFINE_STATIC_KEY_FALSE(have_sha3);
 
-asmlinkage size_t sha3_ce_transform(struct sha3_state *state, const u8 *data,
-				    size_t nblocks, size_t block_size);
+asmlinkage void sha3_ce_transform(struct sha3_state *state, const u8 *data,
+				  size_t nblocks, size_t block_size);
 
 static void sha3_absorb_blocks(struct sha3_state *state, const u8 *data,
 			       size_t nblocks, size_t block_size)
 {
 	if (static_branch_likely(&have_sha3) && likely(may_use_simd())) {
-		do {
-			size_t rem;
-
-			scoped_ksimd()
-				rem = sha3_ce_transform(state, data, nblocks,
-							block_size);
-			data += (nblocks - rem) * block_size;
-			nblocks = rem;
-		} while (nblocks);
+		scoped_ksimd()
+			sha3_ce_transform(state, data, nblocks, block_size);
 	} else {
 		sha3_absorb_blocks_generic(state, data, nblocks, block_size);
 	}
 }
 
-- 
2.53.0


