Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C477B10F930F
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Apr 2026 00:08:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FpVpIsk71t330qjd8SOiWobWhqfNi1tR4W1JMOVUsL4=; b=dbxfIJD4+FqvGQpAEgE57PQxru
	ibkhrirpL+ttQCOIjWnnsdc9Cko7fVXj+mDgPqcFvFPy4kvbb7VOjCIQG1NJlKLc8uVn/ZSGp4LiX
	PfRnS01lZ0bpmtPAxJoXOMu6VuINWhSj/429j2OGe5ujWLhlTFwmvKuExScLhRpNZnygrH7MVtx4w
	3ehlaTpHCQjaXMC+9Tf1ag7TvOQWDlzZ+g+tJyGSjMZjuOHbDHRv4aeKcHpHVI9I06dhG8UcvrhBD
	hwUPPfziwJ+0zKpYFGVZM+MUXnikN72C0A+VeHYmYe3oikmIU9JyXuPKI7/tmeQwuC5Nv+qGOHu5y
	9sDq/erA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7j7n-0000000DiGI-1AVA;
	Wed, 01 Apr 2026 00:07:59 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7j7g-0000000DiCE-1L4M
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Apr 2026 00:07:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C0E4A6012A;
	Wed,  1 Apr 2026 00:07:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39FBBC2BCB0;
	Wed,  1 Apr 2026 00:07:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775002071;
	bh=CAC+qe7Z/7a3GD63JAT9HC8eCyiKaVWZzQ/HUGxe4cI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VZ9K754Lb9Mn8acJgg8xXygVIgFVgCsEu0WSKlrDoqPc+oJmZADyrnyGot+A4tQYL
	 e6FIk6AaPSQLKatwj5hdQuC/e7vptVT2X94JvAi95l8BZOMa4ab82cvrhlhC3DHEZl
	 waBKkLqjrt94Snwpxm3GMEKnAIb1+RzO9GJztMwQGaSXK23XMgqPsXeFd6VWst/DC4
	 Txi+ECzcEPZg33nWyU7fl3ybs6mzWdrFdLvSmhcL+++lWYtXaksOKTv/WYMe7T+yj4
	 CYykjpmjrcSOZL2v0B2jJsjrVkWG3dSGOTyGeNiCTOakRuf5qnURmOOkqc4GmQU1nY
	 1hcjJRa8UULoA==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	linux-arm-kernel@lists.infradead.org,
	Eric Biggers <ebiggers@kernel.org>
Subject: [PATCH 7/9] lib/crypto: arm64/sha512: Remove obsolete chunking logic
Date: Tue, 31 Mar 2026 17:05:46 -0700
Message-ID: <20260401000548.133151-8-ebiggers@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260401000548.133151-1-ebiggers@kernel.org>
References: <20260401000548.133151-1-ebiggers@kernel.org>
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

Since commit aefbab8e77eb ("arm64: fpsimd: Preserve/restore kernel mode
NEON at context switch"), kernel-mode NEON sections have been
preemptible on arm64.  And since commit 7dadeaa6e851 ("sched: Further
restrict the preemption modes"), voluntary preemption is no longer
supported on arm64 either.  Therefore, there's no longer any need to
limit the length of kernel-mode NEON sections on arm64.

Simplify the SHA-512 code accordingly.

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 lib/crypto/arm64/sha512-ce-core.S | 12 +++++-------
 lib/crypto/arm64/sha512.h         | 15 ++++-----------
 2 files changed, 9 insertions(+), 18 deletions(-)

diff --git a/lib/crypto/arm64/sha512-ce-core.S b/lib/crypto/arm64/sha512-ce-core.S
index ffd51acfd1ee..26834921e8d6 100644
--- a/lib/crypto/arm64/sha512-ce-core.S
+++ b/lib/crypto/arm64/sha512-ce-core.S
@@ -91,15 +91,15 @@
 	add		v\i4\().2d, v\i1\().2d, v\i3\().2d
 	sha512h2	q\i3, q\i1, v\i0\().2d
 	.endm
 
 	/*
-	 * size_t __sha512_ce_transform(struct sha512_block_state *state,
-	 *				const u8 *data, size_t nblocks);
+	 * void sha512_ce_transform(struct sha512_block_state *state,
+	 *			    const u8 *data, size_t nblocks);
 	 */
 	.text
-SYM_FUNC_START(__sha512_ce_transform)
+SYM_FUNC_START(sha512_ce_transform)
 	/* load state */
 	ld1		{v8.2d-v11.2d}, [x0]
 
 	/* load first 4 round constants */
 	adr_l		x3, .Lsha512_rcon
@@ -184,14 +184,12 @@ CPU_LE(	rev64		v19.16b, v19.16b	)
 	add		v8.2d, v8.2d, v0.2d
 	add		v9.2d, v9.2d, v1.2d
 	add		v10.2d, v10.2d, v2.2d
 	add		v11.2d, v11.2d, v3.2d
 
-	cond_yield	3f, x4, x5
 	/* handled all input blocks? */
 	cbnz		x2, 0b
 
 	/* store new state */
-3:	st1		{v8.2d-v11.2d}, [x0]
-	mov		x0, x2
+	st1		{v8.2d-v11.2d}, [x0]
 	ret
-SYM_FUNC_END(__sha512_ce_transform)
+SYM_FUNC_END(sha512_ce_transform)
diff --git a/lib/crypto/arm64/sha512.h b/lib/crypto/arm64/sha512.h
index d978c4d07e90..5da27e6e23ea 100644
--- a/lib/crypto/arm64/sha512.h
+++ b/lib/crypto/arm64/sha512.h
@@ -10,27 +10,20 @@
 
 static __ro_after_init DEFINE_STATIC_KEY_FALSE(have_sha512_insns);
 
 asmlinkage void sha512_block_data_order(struct sha512_block_state *state,
 					const u8 *data, size_t nblocks);
-asmlinkage size_t __sha512_ce_transform(struct sha512_block_state *state,
-					const u8 *data, size_t nblocks);
+asmlinkage void sha512_ce_transform(struct sha512_block_state *state,
+				    const u8 *data, size_t nblocks);
 
 static void sha512_blocks(struct sha512_block_state *state,
 			  const u8 *data, size_t nblocks)
 {
 	if (static_branch_likely(&have_sha512_insns) &&
 	    likely(may_use_simd())) {
-		do {
-			size_t rem;
-
-			scoped_ksimd()
-				rem = __sha512_ce_transform(state, data, nblocks);
-
-			data += (nblocks - rem) * SHA512_BLOCK_SIZE;
-			nblocks = rem;
-		} while (nblocks);
+		scoped_ksimd()
+			sha512_ce_transform(state, data, nblocks);
 	} else {
 		sha512_block_data_order(state, data, nblocks);
 	}
 }
 
-- 
2.53.0


