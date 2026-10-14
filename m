Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23990CC6B1D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 15:27:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uOQE4G5vU2NQ5ZaBGGdj2Ya8VgNb7iH0ONyBIwd7aZo=; b=t/nmr7JqwZ1O2ZSw6wKibXYo+M
	M0aJX4J1KgD5hxbK8bFD4xLZjx2BOjsqfAC3zVDl+ZuKaYaq/fCWUp6DyhbCNmf/BHc+c5P5ds3kI
	GR6i/BkvrgYzIHiwuxESDHUMpVzS5g/6qD3kEdEnH0/EZpIruCYrE6BffGN1Ix5Kfx1cV15OEXzhZ
	b0mBcDcQ7ZYPcPn0BHgCh5P5LwgNLpPHZeLd6OfFH/mjb8gyiY4Oq5TqrFlpu590igdDdgcbHgaeI
	SJqq5sBcyo6CGEMw0d488EwzstBNYe4m22shU4BYldEwl+t0JGNfL+10SNAMNU8ys8chYPHjs8ICA
	5uhqtXpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xH0tI-0000000FqR0-3SL4;
	Wed, 14 Oct 2026 15:27:40 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xH0tG-0000000FqQ5-2CLa;
	Wed, 14 Oct 2026 15:27:38 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4969D40659;
	Wed, 14 Oct 2026 15:27:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9F5B1F000C4;
	Wed, 14 Oct 2026 15:27:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791991658;
	bh=uOQE4G5vU2NQ5ZaBGGdj2Ya8VgNb7iH0ONyBIwd7aZo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=TPlMek9W75wVjNxsr62uYjHpFW/ZTjFv35CbHwROiYINy+gIo32mtmvqn398+r/VK
	 naNNAslfbWgUO0zxkn2GK3fJe10yBP3j/IEwbNKkvZubODZcF7qCG8edn31io7iB7p
	 IHuJneCVOaJIa2X4F8B2hrDaZA4X4QxSL+p3p0VCZn1CfW9DOrFFg+1Ktbof8m9esR
	 UCrsw5xevf3Nvq3eIeU1FT7dswdMGkM1SvF/g+z9zSpgIvs5Fo1YYvKOZM9TrlzorB
	 MUxABTWp6MK8y/fMexf5Jg7rjq+N/38gO1tpzZUwj954gl5snqPkJ6IrtvaQ6uzyQR
	 nCfKCtZnwmzwg==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	linux-arm-kernel@lists.infradead.org,
	x86@kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-mips@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Vladimir Kukharenko <vladimir@genproof.com>,
	Eric Biggers <ebiggers@kernel.org>
Subject: [PATCH 2/2] lib/crypto: chacha: Use size_t length
Date: Wed, 14 Oct 2026 17:26:04 +0200
Message-ID: <20261014152604.323310-3-ebiggers@kernel.org>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261014152604.323310-1-ebiggers@kernel.org>
References: <20261014152604.323310-1-ebiggers@kernel.org>
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

Upgrade the ChaCha functions from 32-bit lengths to size_t.

'size_t' is the best practice for buffer lengths, and it's what the rest
of the crypto library uses.

Moreover, all the ChaCha assembly functions actually already treated the
length as size_t, despite it being declared as 32-bit on the 64-bit
architectures arm64, ppc64, and x86_64.  For arm64 and x86_64, this
caused unspecified behavior due to the high 32 bits of the corresponding
register having an unspecified value in those architectures' ABIs.
However, in practice these bits are always zero and no issue occurred.

(ppc64 was fine too, since there the ABI zero-extends 32-bit arguments.)

These issues date to the original introduction of the ChaCha code.
However, as noted above, they don't have any real-world impact
currently; so this is an API robustness improvement only.

Reported-by: Vladimir Kukharenko <vladimir@genproof.com>
Closes: https://lore.kernel.org/r/20261012-libcrypto-4gib-lengths-v1-0-ea566c129a2e@genproof.com
Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 include/crypto/chacha.h              |  6 ++---
 lib/crypto/arm/chacha-scalar-core.S  |  2 +-
 lib/crypto/arm/chacha.h              | 14 +++++-----
 lib/crypto/arm64/chacha.h            | 10 +++----
 lib/crypto/chacha.c                  |  8 +++---
 lib/crypto/mips/chacha.h             |  5 ++--
 lib/crypto/powerpc/chacha-p10le-8x.S |  2 +-
 lib/crypto/powerpc/chacha.h          | 10 +++----
 lib/crypto/riscv/chacha.h            |  6 ++---
 lib/crypto/s390/chacha.h             |  2 +-
 lib/crypto/x86/chacha.h              | 40 ++++++++++++++--------------
 11 files changed, 52 insertions(+), 53 deletions(-)

diff --git a/include/crypto/chacha.h b/include/crypto/chacha.h
index 1cc301a484697..bacf253781d52 100644
--- a/include/crypto/chacha.h
+++ b/include/crypto/chacha.h
@@ -86,10 +86,10 @@ static inline void chacha_init(struct chacha_state *state,
 }
 
 void chacha_crypt(struct chacha_state *state, u8 *dst, const u8 *src,
-		  unsigned int bytes, int nrounds);
+		  size_t bytes, int nrounds);
 
-static inline void chacha20_crypt(struct chacha_state *state,
-				  u8 *dst, const u8 *src, unsigned int bytes)
+static inline void chacha20_crypt(struct chacha_state *state, u8 *dst,
+				  const u8 *src, size_t bytes)
 {
 	chacha_crypt(state, dst, src, bytes, 20);
 }
diff --git a/lib/crypto/arm/chacha-scalar-core.S b/lib/crypto/arm/chacha-scalar-core.S
index 4951df05c158d..509b2f277b57f 100644
--- a/lib/crypto/arm/chacha-scalar-core.S
+++ b/lib/crypto/arm/chacha-scalar-core.S
@@ -366,7 +366,7 @@
 .endm	// _chacha
 
 /*
- * void chacha_doarm(u8 *dst, const u8 *src, unsigned int bytes,
+ * void chacha_doarm(u8 *dst, const u8 *src, size_t bytes,
  *		     const struct chacha_state *state, int nrounds);
  */
 ENTRY(chacha_doarm)
diff --git a/lib/crypto/arm/chacha.h b/lib/crypto/arm/chacha.h
index 836e49088e983..8ce5375f58aa5 100644
--- a/lib/crypto/arm/chacha.h
+++ b/lib/crypto/arm/chacha.h
@@ -17,14 +17,14 @@
 asmlinkage void chacha_block_xor_neon(const struct chacha_state *state,
 				      u8 *dst, const u8 *src, int nrounds);
 asmlinkage void chacha_4block_xor_neon(const struct chacha_state *state,
-				       u8 *dst, const u8 *src,
-				       int nrounds, unsigned int nbytes);
+				       u8 *dst, const u8 *src, int nrounds,
+				       size_t nbytes);
 asmlinkage void hchacha_block_arm(const struct chacha_state *state,
 				  u32 out[HCHACHA_OUT_WORDS], int nrounds);
 asmlinkage void hchacha_block_neon(const struct chacha_state *state,
 				   u32 out[HCHACHA_OUT_WORDS], int nrounds);
 
-asmlinkage void chacha_doarm(u8 *dst, const u8 *src, unsigned int bytes,
+asmlinkage void chacha_doarm(u8 *dst, const u8 *src, size_t bytes,
 			     const struct chacha_state *state, int nrounds);
 
 static __ro_after_init DEFINE_STATIC_KEY_FALSE(use_neon);
@@ -35,12 +35,12 @@ static inline bool neon_usable(void)
 }
 
 static void chacha_doneon(struct chacha_state *state, u8 *dst, const u8 *src,
-			  unsigned int bytes, int nrounds)
+			  size_t bytes, int nrounds)
 {
 	u8 buf[CHACHA_BLOCK_SIZE];
 
 	while (bytes > CHACHA_BLOCK_SIZE) {
-		unsigned int l = min(bytes, CHACHA_BLOCK_SIZE * 4U);
+		size_t l = min(bytes, CHACHA_BLOCK_SIZE * 4U);
 
 		chacha_4block_xor_neon(state, dst, src, nrounds, l);
 		bytes -= l;
@@ -73,7 +73,7 @@ static void hchacha_block_arch(const struct chacha_state *state,
 }
 
 static void chacha_crypt_arch(struct chacha_state *state, u8 *dst,
-			      const u8 *src, unsigned int bytes, int nrounds)
+			      const u8 *src, size_t bytes, int nrounds)
 {
 	if (!IS_ENABLED(CONFIG_KERNEL_MODE_NEON) || !neon_usable() ||
 	    bytes <= CHACHA_BLOCK_SIZE) {
@@ -83,7 +83,7 @@ static void chacha_crypt_arch(struct chacha_state *state, u8 *dst,
 	}
 
 	do {
-		unsigned int todo = min_t(unsigned int, bytes, SZ_4K);
+		size_t todo = min(bytes, SZ_4K);
 
 		scoped_ksimd()
 			chacha_doneon(state, dst, src, todo, nrounds);
diff --git a/lib/crypto/arm64/chacha.h b/lib/crypto/arm64/chacha.h
index c6f8ddf98e2de..793ee9112eb99 100644
--- a/lib/crypto/arm64/chacha.h
+++ b/lib/crypto/arm64/chacha.h
@@ -28,18 +28,18 @@
 asmlinkage void chacha_block_xor_neon(const struct chacha_state *state,
 				      u8 *dst, const u8 *src, int nrounds);
 asmlinkage void chacha_4block_xor_neon(const struct chacha_state *state,
-				       u8 *dst, const u8 *src,
-				       int nrounds, int bytes);
+				       u8 *dst, const u8 *src, int nrounds,
+				       size_t bytes);
 asmlinkage void hchacha_block_neon(const struct chacha_state *state,
 				   u32 out[HCHACHA_OUT_WORDS], int nrounds);
 
 static __ro_after_init DEFINE_STATIC_KEY_FALSE(have_neon);
 
 static void chacha_doneon(struct chacha_state *state, u8 *dst, const u8 *src,
-			  unsigned int bytes, int nrounds)
+			  size_t bytes, int nrounds)
 {
 	while (bytes) {
-		int l = min(bytes, CHACHA_BLOCK_SIZE * 5);
+		size_t l = min(bytes, CHACHA_BLOCK_SIZE * 5);
 
 		if (l <= CHACHA_BLOCK_SIZE) {
 			u8 buf[CHACHA_BLOCK_SIZE];
@@ -70,7 +70,7 @@ static void hchacha_block_arch(const struct chacha_state *state,
 }
 
 static void chacha_crypt_arch(struct chacha_state *state, u8 *dst,
-			      const u8 *src, unsigned int bytes, int nrounds)
+			      const u8 *src, size_t bytes, int nrounds)
 {
 	if (!static_branch_likely(&have_neon) || bytes <= CHACHA_BLOCK_SIZE ||
 	    !crypto_simd_usable())
diff --git a/lib/crypto/chacha.c b/lib/crypto/chacha.c
index 86e5d382a4e0c..95ecd6f989e35 100644
--- a/lib/crypto/chacha.c
+++ b/lib/crypto/chacha.c
@@ -11,9 +11,9 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 
-static void __maybe_unused
-chacha_crypt_generic(struct chacha_state *state, u8 *dst, const u8 *src,
-		     unsigned int bytes, int nrounds)
+static void __maybe_unused chacha_crypt_generic(struct chacha_state *state,
+						u8 *dst, const u8 *src,
+						size_t bytes, int nrounds)
 {
 	/* aligned to potentially speed up crypto_xor() */
 	u8 stream[CHACHA_BLOCK_SIZE] __aligned(sizeof(long));
@@ -39,7 +39,7 @@ chacha_crypt_generic(struct chacha_state *state, u8 *dst, const u8 *src,
 #endif
 
 void chacha_crypt(struct chacha_state *state, u8 *dst, const u8 *src,
-		  unsigned int bytes, int nrounds)
+		  size_t bytes, int nrounds)
 {
 	chacha_crypt_arch(state, dst, src, bytes, nrounds);
 }
diff --git a/lib/crypto/mips/chacha.h b/lib/crypto/mips/chacha.h
index 0c18c0dc2a406..5a565d0a8c26e 100644
--- a/lib/crypto/mips/chacha.h
+++ b/lib/crypto/mips/chacha.h
@@ -7,8 +7,7 @@
 
 #include <linux/kernel.h>
 
-asmlinkage void chacha_crypt_arch(struct chacha_state *state,
-				  u8 *dst, const u8 *src,
-				  unsigned int bytes, int nrounds);
+asmlinkage void chacha_crypt_arch(struct chacha_state *state, u8 *dst,
+				  const u8 *src, size_t bytes, int nrounds);
 asmlinkage void hchacha_block_arch(const struct chacha_state *state,
 				   u32 out[HCHACHA_OUT_WORDS], int nrounds);
diff --git a/lib/crypto/powerpc/chacha-p10le-8x.S b/lib/crypto/powerpc/chacha-p10le-8x.S
index b29562bd5d40d..7a32fc6493f12 100644
--- a/lib/crypto/powerpc/chacha-p10le-8x.S
+++ b/lib/crypto/powerpc/chacha-p10le-8x.S
@@ -573,7 +573,7 @@
 
 #
 # void chacha_p10le_8x(const struct chacha_state *state, u8 *dst, const u8 *src,
-#		       unsigned int len, int nrounds);
+#		       size_t len, int nrounds);
 #
 SYM_FUNC_START(chacha_p10le_8x)
 .align 5
diff --git a/lib/crypto/powerpc/chacha.h b/lib/crypto/powerpc/chacha.h
index 1df6e1ce31c46..706060b2fa1ba 100644
--- a/lib/crypto/powerpc/chacha.h
+++ b/lib/crypto/powerpc/chacha.h
@@ -13,7 +13,7 @@
 #include <asm/switch_to.h>
 
 asmlinkage void chacha_p10le_8x(const struct chacha_state *state, u8 *dst,
-				const u8 *src, unsigned int len, int nrounds);
+				const u8 *src, size_t len, int nrounds);
 
 static __ro_after_init DEFINE_STATIC_KEY_FALSE(have_p10);
 
@@ -30,9 +30,9 @@ static void vsx_end(void)
 }
 
 static void chacha_p10_do_8x(struct chacha_state *state, u8 *dst, const u8 *src,
-			     unsigned int bytes, int nrounds)
+			     size_t bytes, int nrounds)
 {
-	unsigned int l = bytes & ~0x0FF;
+	size_t l = bytes & ~0x0FF;
 
 	if (l > 0) {
 		chacha_p10le_8x(state, dst, src, l, nrounds);
@@ -49,14 +49,14 @@ static void chacha_p10_do_8x(struct chacha_state *state, u8 *dst, const u8 *src,
 #define hchacha_block_arch hchacha_block_generic /* not implemented yet */
 
 static void chacha_crypt_arch(struct chacha_state *state, u8 *dst,
-			      const u8 *src, unsigned int bytes, int nrounds)
+			      const u8 *src, size_t bytes, int nrounds)
 {
 	if (!static_branch_likely(&have_p10) || bytes <= CHACHA_BLOCK_SIZE ||
 	    !crypto_simd_usable())
 		return chacha_crypt_generic(state, dst, src, bytes, nrounds);
 
 	do {
-		unsigned int todo = min_t(unsigned int, bytes, SZ_4K);
+		size_t todo = min(bytes, SZ_4K);
 
 		vsx_begin();
 		chacha_p10_do_8x(state, dst, src, todo, nrounds);
diff --git a/lib/crypto/riscv/chacha.h b/lib/crypto/riscv/chacha.h
index 5c000c6aef4be..a84913c4ece8e 100644
--- a/lib/crypto/riscv/chacha.h
+++ b/lib/crypto/riscv/chacha.h
@@ -19,11 +19,11 @@ asmlinkage void chacha_zvkb(struct chacha_state *state, const u8 *in, u8 *out,
 #define hchacha_block_arch hchacha_block_generic /* not implemented yet */
 
 static void chacha_crypt_arch(struct chacha_state *state, u8 *dst,
-			      const u8 *src, unsigned int bytes, int nrounds)
+			      const u8 *src, size_t bytes, int nrounds)
 {
 	u8 block_buffer[CHACHA_BLOCK_SIZE];
-	unsigned int full_blocks = bytes / CHACHA_BLOCK_SIZE;
-	unsigned int tail_bytes = bytes % CHACHA_BLOCK_SIZE;
+	size_t full_blocks = bytes / CHACHA_BLOCK_SIZE;
+	size_t tail_bytes = bytes % CHACHA_BLOCK_SIZE;
 
 	if (!static_branch_likely(&use_zvkb) || !crypto_simd_usable())
 		return chacha_crypt_generic(state, dst, src, bytes, nrounds);
diff --git a/lib/crypto/s390/chacha.h b/lib/crypto/s390/chacha.h
index fd9c4a4223656..fa7dfc63cb2f5 100644
--- a/lib/crypto/s390/chacha.h
+++ b/lib/crypto/s390/chacha.h
@@ -15,7 +15,7 @@
 #define hchacha_block_arch hchacha_block_generic /* not implemented yet */
 
 static void chacha_crypt_arch(struct chacha_state *state, u8 *dst,
-			      const u8 *src, unsigned int bytes, int nrounds)
+			      const u8 *src, size_t bytes, int nrounds)
 {
 	/* s390 chacha20 implementation has 20 rounds hard-coded,
 	 * it cannot handle a block of data or less, but otherwise
diff --git a/lib/crypto/x86/chacha.h b/lib/crypto/x86/chacha.h
index 10cf8f1c569dc..b971fb0f3d472 100644
--- a/lib/crypto/x86/chacha.h
+++ b/lib/crypto/x86/chacha.h
@@ -11,46 +11,46 @@
 #include <linux/sizes.h>
 
 asmlinkage void chacha_block_xor_ssse3(const struct chacha_state *state,
-				       u8 *dst, const u8 *src,
-				       unsigned int len, int nrounds);
+				       u8 *dst, const u8 *src, size_t len,
+				       int nrounds);
 asmlinkage void chacha_4block_xor_ssse3(const struct chacha_state *state,
-					u8 *dst, const u8 *src,
-					unsigned int len, int nrounds);
+					u8 *dst, const u8 *src, size_t len,
+					int nrounds);
 asmlinkage void hchacha_block_ssse3(const struct chacha_state *state,
 				    u32 out[HCHACHA_OUT_WORDS], int nrounds);
 
 asmlinkage void chacha_2block_xor_avx2(const struct chacha_state *state,
-				       u8 *dst, const u8 *src,
-				       unsigned int len, int nrounds);
+				       u8 *dst, const u8 *src, size_t len,
+				       int nrounds);
 asmlinkage void chacha_4block_xor_avx2(const struct chacha_state *state,
-				       u8 *dst, const u8 *src,
-				       unsigned int len, int nrounds);
+				       u8 *dst, const u8 *src, size_t len,
+				       int nrounds);
 asmlinkage void chacha_8block_xor_avx2(const struct chacha_state *state,
-				       u8 *dst, const u8 *src,
-				       unsigned int len, int nrounds);
+				       u8 *dst, const u8 *src, size_t len,
+				       int nrounds);
 
 asmlinkage void chacha_2block_xor_avx512vl(const struct chacha_state *state,
-					   u8 *dst, const u8 *src,
-					   unsigned int len, int nrounds);
+					   u8 *dst, const u8 *src, size_t len,
+					   int nrounds);
 asmlinkage void chacha_4block_xor_avx512vl(const struct chacha_state *state,
-					   u8 *dst, const u8 *src,
-					   unsigned int len, int nrounds);
+					   u8 *dst, const u8 *src, size_t len,
+					   int nrounds);
 asmlinkage void chacha_8block_xor_avx512vl(const struct chacha_state *state,
-					   u8 *dst, const u8 *src,
-					   unsigned int len, int nrounds);
+					   u8 *dst, const u8 *src, size_t len,
+					   int nrounds);
 
 static __ro_after_init DEFINE_STATIC_KEY_FALSE(chacha_use_simd);
 static __ro_after_init DEFINE_STATIC_KEY_FALSE(chacha_use_avx2);
 static __ro_after_init DEFINE_STATIC_KEY_FALSE(chacha_use_avx512vl);
 
-static unsigned int chacha_advance(unsigned int len, unsigned int maxblocks)
+static size_t chacha_advance(size_t len, size_t maxblocks)
 {
 	len = min(len, maxblocks * CHACHA_BLOCK_SIZE);
 	return round_up(len, CHACHA_BLOCK_SIZE) / CHACHA_BLOCK_SIZE;
 }
 
 static void chacha_dosimd(struct chacha_state *state, u8 *dst, const u8 *src,
-			  unsigned int bytes, int nrounds)
+			  size_t bytes, int nrounds)
 {
 	if (static_branch_likely(&chacha_use_avx512vl)) {
 		while (bytes >= CHACHA_BLOCK_SIZE * 8) {
@@ -137,14 +137,14 @@ static void hchacha_block_arch(const struct chacha_state *state,
 }
 
 static void chacha_crypt_arch(struct chacha_state *state, u8 *dst,
-			      const u8 *src, unsigned int bytes, int nrounds)
+			      const u8 *src, size_t bytes, int nrounds)
 {
 	if (!static_branch_likely(&chacha_use_simd) ||
 	    bytes <= CHACHA_BLOCK_SIZE)
 		return chacha_crypt_generic(state, dst, src, bytes, nrounds);
 
 	do {
-		unsigned int todo = min_t(unsigned int, bytes, SZ_4K);
+		size_t todo = min(bytes, SZ_4K);
 
 		kernel_fpu_begin();
 		chacha_dosimd(state, dst, src, todo, nrounds);
-- 
2.56.0


