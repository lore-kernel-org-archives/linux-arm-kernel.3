Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC385C83F10
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Jul 2025 00:32:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zUlm4PeJQztSEdAXDcmnmQt+VbS5kv2O484A8pafujA=; b=Yb/u/nWnMcwSlPfIkPX6aPMEnG
	7EeZjX5MdOvzT2r1tfXlG8JPcEo1CrLUh8LEfgDTkCJCcDn2u6TZ/Q2/T+9/evy9n2gP8ZvA0TyHt
	7SNsoQOH8KxmooouAz8bY72I60/POKOKExYupU2Mukm6mYrFkLJpsIPzzsywBhEoSBoHYzVcfvEIN
	tjxR+Qj0eXMO+eEpBqrg3fcdeHz4Us4Eu+aBXX6LVNX8Jc0WSlRCvCde67vdJ1yJymgjq74BNoTu9
	E/oeuG3CICyUAboKIhktnYGHJCOWAuHi+poeYGXC4IG61ZAGk3ddwwmvMlO9ap03ZiZe/mE0OKu4D
	5idAQzuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uakdx-0000000HD0R-3pMl;
	Sun, 13 Jul 2025 00:32:37 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uajcS-0000000H7ra-2c0K
	for linux-arm-kernel@bombadil.infradead.org;
	Sat, 12 Jul 2025 23:27:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=zUlm4PeJQztSEdAXDcmnmQt+VbS5kv2O484A8pafujA=; b=N7b8DLr4YYnklGPfPxo76mit9G
	BxZmamZPH2uJCOtNsCFRt2KlR5cp+YzMjSWN4vCBUCUK/lDZhe1DLRqHAqkFSzUsYLD9Twnm/NqbD
	TObL5TvoM77TLvteZsTNM9sDnBmmU5Ion52elk7DzSbyRFNCjlXjIpqXXHkHSw3xZm/yQG9Ar0LQE
	M4ttBb1tgA5wN8uuEQNuX8obwo+Dt1xh2Jyy1tbgayRayy+iX1EkzBTJaNrm7G0GRzPuK4loIgVPZ
	3AFe88s3OmtNGcBhylYShcMaqi5JFNsYEfd623gXWa53CAScLtu7jbd+JYiTy7tFqVB7MhQc2QTjI
	J2DgYkxQ==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uajcA-00000009Uxq-3J1k
	for linux-arm-kernel@lists.infradead.org;
	Sat, 12 Jul 2025 23:26:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9435844A09;
	Sat, 12 Jul 2025 23:26:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25260C4CEF7;
	Sat, 12 Jul 2025 23:26:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752362792;
	bh=yc9nP0AyrYTSdnZBDBrGS14R619T+8Od6p+X/EDi6Wk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fX0E8o1k57ipPAfx4Uzk0gPIv9zXrwOi7EklV1MTTwN4CCofX0j1AgCETrLo46xpR
	 Fb/HAiIDk0Q2P043QlgVPWAz6ctV/JLTH2RJwvNw1pAU/2HI7xBrHJ7zDBInTtl6pG
	 mzEoqG3qquK7rGUpI1L2ysFaTLshgPnAeVAFNEt+PnuRxP2jzd7FmS0aJqJE6xV0G4
	 UAiLiC0Y1UK5bxhY8SxwNggognGdbLAPtfPBg71+lwZI1/NRIuLrUi/bGrX7oCfzlo
	 jkJE8G03Pxs0HpkZAiPARUZk5aGWGElD8l3JOFy2Vc19sZYmnKIZ8d0fCNYAFiC01z
	 WBJQa9HaiH7NQ==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org,
	x86@kernel.org,
	Eric Biggers <ebiggers@kernel.org>
Subject: [PATCH 26/26] lib/crypto: sha1: Remove low-level functions from API
Date: Sat, 12 Jul 2025 16:23:17 -0700
Message-ID: <20250712232329.818226-27-ebiggers@kernel.org>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250712232329.818226-1-ebiggers@kernel.org>
References: <20250712232329.818226-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250713_002644_047941_0576871B 
X-CRM114-Status: GOOD (  18.56  )
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

Now that there are no users of the low-level SHA-1 interface, remove it.

Specifically:

- Remove SHA1_DIGEST_WORDS (no longer used)
- Remove sha1_init_raw() (no longer used)
- Rename sha1_transform() to sha1_block_generic() and make it static
- Move SHA1_WORKSPACE_WORDS into lib/crypto/sha1.c

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 include/crypto/sha1.h | 10 -------
 lib/crypto/sha1.c     | 63 ++++++++++++-------------------------------
 2 files changed, 17 insertions(+), 56 deletions(-)

diff --git a/include/crypto/sha1.h b/include/crypto/sha1.h
index 162a529ec8413..34658f4d76e3b 100644
--- a/include/crypto/sha1.h
+++ b/include/crypto/sha1.h
@@ -24,20 +24,10 @@ struct sha1_state {
 	u32 state[SHA1_DIGEST_SIZE / 4];
 	u64 count;
 	u8 buffer[SHA1_BLOCK_SIZE];
 };
 
-/*
- * An implementation of SHA-1's compression function.  Don't use in new code!
- * You shouldn't be using SHA-1, and even if you *have* to use SHA-1, this isn't
- * the correct way to hash something with SHA-1 (use crypto_shash instead).
- */
-#define SHA1_DIGEST_WORDS	(SHA1_DIGEST_SIZE / 4)
-#define SHA1_WORKSPACE_WORDS	16
-void sha1_init_raw(__u32 *buf);
-void sha1_transform(__u32 *digest, const char *data, __u32 *W);
-
 /* State for the SHA-1 compression function */
 struct sha1_block_state {
 	u32 h[SHA1_DIGEST_SIZE / 4];
 };
 
diff --git a/lib/crypto/sha1.c b/lib/crypto/sha1.c
index 89831f7f27793..87a76bf97f445 100644
--- a/lib/crypto/sha1.c
+++ b/lib/crypto/sha1.c
@@ -49,11 +49,11 @@ static const struct sha1_block_state sha1_iv = {
 #else
   #define setW(x, val) (W(x) = (val))
 #endif
 
 /* This "rolls" over the 512-bit array */
-#define W(x) (array[(x)&15])
+#define W(x) (workspace[(x)&15])
 
 /*
  * Where do we get the source from? The first 16 iterations get it from
  * the input data, the next mix it from the 512-bit array.
  */
@@ -70,38 +70,24 @@ static const struct sha1_block_state sha1_iv = {
 #define T_16_19(t, A, B, C, D, E) SHA_ROUND(t, SHA_MIX, (((C^D)&B)^D) , 0x5a827999, A, B, C, D, E )
 #define T_20_39(t, A, B, C, D, E) SHA_ROUND(t, SHA_MIX, (B^C^D) , 0x6ed9eba1, A, B, C, D, E )
 #define T_40_59(t, A, B, C, D, E) SHA_ROUND(t, SHA_MIX, ((B&C)+(D&(B^C))) , 0x8f1bbcdc, A, B, C, D, E )
 #define T_60_79(t, A, B, C, D, E) SHA_ROUND(t, SHA_MIX, (B^C^D) ,  0xca62c1d6, A, B, C, D, E )
 
-/**
- * sha1_transform - single block SHA1 transform (deprecated)
- *
- * @digest: 160 bit digest to update
- * @data:   512 bits of data to hash
- * @array:  16 words of workspace (see note)
- *
- * This function executes SHA-1's internal compression function.  It updates the
- * 160-bit internal state (@digest) with a single 512-bit data block (@data).
- *
- * Don't use this function.  SHA-1 is no longer considered secure.  And even if
- * you do have to use SHA-1, this isn't the correct way to hash something with
- * SHA-1 as this doesn't handle padding and finalization.
- *
- * Note: If the hash is security sensitive, the caller should be sure
- * to clear the workspace. This is left to the caller to avoid
- * unnecessary clears between chained hashing operations.
- */
-void sha1_transform(__u32 *digest, const char *data, __u32 *array)
+#define SHA1_WORKSPACE_WORDS 16
+
+static void sha1_block_generic(struct sha1_block_state *state,
+			       const u8 data[SHA1_BLOCK_SIZE],
+			       u32 workspace[SHA1_WORKSPACE_WORDS])
 {
 	__u32 A, B, C, D, E;
 	unsigned int i = 0;
 
-	A = digest[0];
-	B = digest[1];
-	C = digest[2];
-	D = digest[3];
-	E = digest[4];
+	A = state->h[0];
+	B = state->h[1];
+	C = state->h[2];
+	D = state->h[3];
+	E = state->h[4];
 
 	/* Round 1 - iterations 0-16 take their input from 'data' */
 	for (; i < 16; ++i)
 		T_0_15(i, A, B, C, D, E);
 
@@ -119,39 +105,24 @@ void sha1_transform(__u32 *digest, const char *data, __u32 *array)
 
 	/* Round 4 */
 	for (; i < 80; ++i)
 		T_60_79(i, A, B, C, D, E);
 
-	digest[0] += A;
-	digest[1] += B;
-	digest[2] += C;
-	digest[3] += D;
-	digest[4] += E;
-}
-EXPORT_SYMBOL(sha1_transform);
-
-/**
- * sha1_init_raw - initialize the vectors for a SHA1 digest
- * @buf: vector to initialize
- */
-void sha1_init_raw(__u32 *buf)
-{
-	buf[0] = 0x67452301;
-	buf[1] = 0xefcdab89;
-	buf[2] = 0x98badcfe;
-	buf[3] = 0x10325476;
-	buf[4] = 0xc3d2e1f0;
+	state->h[0] += A;
+	state->h[1] += B;
+	state->h[2] += C;
+	state->h[3] += D;
+	state->h[4] += E;
 }
-EXPORT_SYMBOL(sha1_init_raw);
 
 static void __maybe_unused sha1_blocks_generic(struct sha1_block_state *state,
 					       const u8 *data, size_t nblocks)
 {
 	u32 workspace[SHA1_WORKSPACE_WORDS];
 
 	do {
-		sha1_transform(state->h, data, workspace);
+		sha1_block_generic(state, data, workspace);
 		data += SHA1_BLOCK_SIZE;
 	} while (--nblocks);
 
 	memzero_explicit(workspace, sizeof(workspace));
 }
-- 
2.50.1


