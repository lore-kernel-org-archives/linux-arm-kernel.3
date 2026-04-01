Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3586310F9310
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Apr 2026 00:08:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c8DGA6OfXcEa0FikPmG4OScgy2KZ99W6gP33MHj+ylM=; b=Bn03fzV/0Mms7NkEBIKtTFF/sK
	JMpyNH5UOY0ylznRU5ytfPGUEZuD+oFIG/2Oe5AL1zG5QmTyZx4ZnmRWiTpAtkDh+T1m/8Edcj4Sm
	A2VFUwBToWRTOoKNmrDXHZPgUM2uSMxatdKD1F+zipYvRU9MH5A3CWeINx5/B8O3ZqtIn2mBO/JmT
	rNiDHx676K+Ez8t7d8QkL9iYeE9dxuwCGeFWYvJMvR+dUNMn4y4wvbyUTzfzN80vJAl1KEr9caUcX
	SBdld+XlAxVXGziBtNH1FmHxH/EeUefYpGckeAf1kwzf9/srqt/CTUrZZfMUGZlyzqTx//vBm57G4
	pHwjQ/YQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7j7m-0000000DiFB-2gTP;
	Wed, 01 Apr 2026 00:07:58 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7j7f-0000000DiC8-3rFJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Apr 2026 00:07:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5E4C0600C4;
	Wed,  1 Apr 2026 00:07:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4F56C2BCB2;
	Wed,  1 Apr 2026 00:07:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775002071;
	bh=ZA5dMcNqb9sYb9aCW3C/EswuZIOxlWzjmUurDOE2JwA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=aDXeKjFzMbS83kJZgGBc/8YbdAGt2Mjt+ZfjZ9NIyP/zZsi9C/zmByZ9MEvYVeevw
	 00d2HqMUl8048AGKXjQWvQgPDnF5rX7UBPp6/rNPSnmGJUyvRfa14v5XKfU1RpWYHp
	 zDOPFEzZ08waJL67H5BsERhRgbdGBb4hk7A2KCxuEpMA3jqjjJSicwIrRdc9rVLHPP
	 nCvr2+oR8ML+0w/7boK/g9lxVkeJ4Gr1XseIhDOri32rorcA7zNVX4sG6ExNaRFQkZ
	 LeB/qaJxuWKiidlYRxK+N+kncfZUgg0OGUo5M9Yntqfaf0Dt/ZyTdOLI5yK9USVIip
	 r1raMpEq/HwQQ==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	linux-arm-kernel@lists.infradead.org,
	Eric Biggers <ebiggers@kernel.org>
Subject: [PATCH 6/9] lib/crypto: arm64/sha256: Remove obsolete chunking logic
Date: Tue, 31 Mar 2026 17:05:45 -0700
Message-ID: <20260401000548.133151-7-ebiggers@kernel.org>
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

Simplify the SHA-256 code accordingly.

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 lib/crypto/arm64/sha256-ce.S | 14 +++++---------
 lib/crypto/arm64/sha256.h    | 29 ++++++++---------------------
 2 files changed, 13 insertions(+), 30 deletions(-)

diff --git a/lib/crypto/arm64/sha256-ce.S b/lib/crypto/arm64/sha256-ce.S
index e4bfe42a61a9..b54ad977afa3 100644
--- a/lib/crypto/arm64/sha256-ce.S
+++ b/lib/crypto/arm64/sha256-ce.S
@@ -77,15 +77,15 @@
 	ld1		{ v8.4s-v11.4s}, [\tmp], #64
 	ld1		{v12.4s-v15.4s}, [\tmp]
 	.endm
 
 	/*
-	 * size_t __sha256_ce_transform(struct sha256_block_state *state,
-	 *				const u8 *data, size_t nblocks);
+	 * void sha256_ce_transform(struct sha256_block_state *state,
+	 *			    const u8 *data, size_t nblocks);
 	 */
 	.text
-SYM_FUNC_START(__sha256_ce_transform)
+SYM_FUNC_START(sha256_ce_transform)
 
 	load_round_constants	x8
 
 	/* load state */
 	ld1		{dgav.4s, dgbv.4s}, [x0]
@@ -125,21 +125,17 @@ CPU_LE(	rev32		v19.16b, v19.16b	)
 
 	/* update state */
 	add		dgav.4s, dgav.4s, dg0v.4s
 	add		dgbv.4s, dgbv.4s, dg1v.4s
 
-	/* return early if voluntary preemption is needed */
-	cond_yield	1f, x5, x6
-
 	/* handled all input blocks? */
 	cbnz		x2, 0b
 
 	/* store new state */
-1:	st1		{dgav.4s, dgbv.4s}, [x0]
-	mov		x0, x2
+	st1		{dgav.4s, dgbv.4s}, [x0]
 	ret
-SYM_FUNC_END(__sha256_ce_transform)
+SYM_FUNC_END(sha256_ce_transform)
 
 	.unreq dga
 	.unreq dgav
 	.unreq dgb
 	.unreq dgbv
diff --git a/lib/crypto/arm64/sha256.h b/lib/crypto/arm64/sha256.h
index 1fad3d7baa9a..b4353d3c4dd0 100644
--- a/lib/crypto/arm64/sha256.h
+++ b/lib/crypto/arm64/sha256.h
@@ -12,30 +12,21 @@ static __ro_after_init DEFINE_STATIC_KEY_FALSE(have_ce);
 
 asmlinkage void sha256_block_data_order(struct sha256_block_state *state,
 					const u8 *data, size_t nblocks);
 asmlinkage void sha256_block_neon(struct sha256_block_state *state,
 				  const u8 *data, size_t nblocks);
-asmlinkage size_t __sha256_ce_transform(struct sha256_block_state *state,
-					const u8 *data, size_t nblocks);
+asmlinkage void sha256_ce_transform(struct sha256_block_state *state,
+				    const u8 *data, size_t nblocks);
 
 static void sha256_blocks(struct sha256_block_state *state,
 			  const u8 *data, size_t nblocks)
 {
 	if (static_branch_likely(&have_neon) && likely(may_use_simd())) {
-		if (static_branch_likely(&have_ce)) {
-			do {
-				size_t rem;
-
-				scoped_ksimd()
-					rem = __sha256_ce_transform(state, data,
-								    nblocks);
-
-				data += (nblocks - rem) * SHA256_BLOCK_SIZE;
-				nblocks = rem;
-			} while (nblocks);
-		} else {
-			scoped_ksimd()
+		scoped_ksimd() {
+			if (static_branch_likely(&have_ce))
+				sha256_ce_transform(state, data, nblocks);
+			else
 				sha256_block_neon(state, data, nblocks);
 		}
 	} else {
 		sha256_block_data_order(state, data, nblocks);
 	}
@@ -53,17 +44,13 @@ asmlinkage void sha256_ce_finup2x(const struct __sha256_ctx *ctx,
 static bool sha256_finup_2x_arch(const struct __sha256_ctx *ctx,
 				 const u8 *data1, const u8 *data2, size_t len,
 				 u8 out1[SHA256_DIGEST_SIZE],
 				 u8 out2[SHA256_DIGEST_SIZE])
 {
-	/*
-	 * The assembly requires len >= SHA256_BLOCK_SIZE && len <= INT_MAX.
-	 * Further limit len to 65536 to avoid spending too long with preemption
-	 * disabled.  (Of course, in practice len is nearly always 4096 anyway.)
-	 */
+	/* The assembly requires len >= SHA256_BLOCK_SIZE && len <= INT_MAX. */
 	if (static_branch_likely(&have_ce) && len >= SHA256_BLOCK_SIZE &&
-	    len <= 65536 && likely(may_use_simd())) {
+	    len <= INT_MAX && likely(may_use_simd())) {
 		scoped_ksimd()
 			sha256_ce_finup2x(ctx, data1, data2, len, out1, out2);
 		kmsan_unpoison_memory(out1, SHA256_DIGEST_SIZE);
 		kmsan_unpoison_memory(out2, SHA256_DIGEST_SIZE);
 		return true;
-- 
2.53.0


