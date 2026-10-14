Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBEEECC6B29
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 15:27:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rMrK99DQaVJWkcUSguOouNKEIZCA0dE5JQons3nRmuU=; b=o5GbL5Ur1qdsdySSKL6aMYqT+p
	SkA8Bgqx+vs1Jkg3pt/h0QcCRQy4qXIdMI+kdUv8cJpTwtChHE41EDBafqTzC0Qcioe1pxBIxiBFX
	NE9dU7ZTA7y5uCt14RZt0xtFXwSrCzanYcDQXyRadsDMhkqnGaqsJWRAcGnx8Dw6S5svtYwFErW+f
	6cHNPgbRCQuuXByugG/P+6oeYRO74/4IXiwer3qjhm+fx+n9Efc9yakOw1R6W0TC8bNiUig694jDS
	ANERtN1WYQn2rShZ5Hqze0p2VhaSiJArX0H8ifelahGKYRU4uuQ+HtF2Ae/qcQ9TjCWn9YAx+40+S
	wIdWdyQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xH0t3-0000000FqLO-2acO;
	Wed, 14 Oct 2026 15:27:25 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xH0t3-0000000FqKf-09X1;
	Wed, 14 Oct 2026 15:27:25 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 1765C60229;
	Wed, 14 Oct 2026 15:27:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A68CF1F000C5;
	Wed, 14 Oct 2026 15:27:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791991643;
	bh=rMrK99DQaVJWkcUSguOouNKEIZCA0dE5JQons3nRmuU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=VR5SptM6Py5WfdyGsqUntArUDUY67uOLxntGkPj0R12eZJvhU+OXlb/j2mfNwNpIS
	 oPHikBHQJ7I58oH19/mRNSjO1LcTuX19SqTWBXUGtVVknFjuLQXIhcyqDjxckVoxKb
	 kb7dVv4Jm5Y2MYFfTmQc3iQ5p6DSLMUPI2XPBWVEf4qSAncOUhh4WbbEZpCAU12h+M
	 XbeXQfYsOnUobTWaovvyLd1CZByyJ0Ts+km1UEY2IZKkh40u2+SOq1yXpRsz1AYtcx
	 ppDkNvt7l8C23ZOmidReINL83WwTkwiO2Y5tn7CDGSujU1rHAsrWLACiidoU7rShpA
	 BOirYQYhCdy4Q==
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
Subject: [PATCH 1/2] lib/crypto: poly1305: Use size_t length
Date: Wed, 14 Oct 2026 17:26:03 +0200
Message-ID: <20261014152604.323310-2-ebiggers@kernel.org>
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

Upgrade the Poly1305 functions from 32-bit lengths to size_t.

'size_t' is the best practice for buffer lengths, and it's what the rest
of the crypto library uses.

Moreover, all the Poly1305 assembly functions actually already treated
the length as size_t, despite it being declared as 32-bit on the 64-bit
architectures arm64, mips64, ppc64, and riscv64:

- On arm64, this caused unspecified behavior due to the high 32 bits
  having an unspecified value in that architecture's ABI.  However, in
  practice these bits are always zero and no issue occurred.  (ppc64 was
  fine too, since there the ABI zero-extends 32-bit arguments.)

- On mips64 and riscv64, this caused incorrect behavior on lengths above
  S32_MAX, due to the sign extension done by those architectures' ABIs.
  Note that no current callers pass lengths over S32_MAX.

Also, the expression 'desc->buflen + nbytes >= POLY1305_BLOCK_SIZE' in
poly1305_update() could overflow if nbytes was in [UINT_MAX - 14,
UINT_MAX].  Note that again, no current callers pass lengths this large.

These issues date to the original introduction of the Poly1305 code.
However, as noted above, they don't have any real-world impact
currently; so this is an API robustness improvement only.

Reported-by: Vladimir Kukharenko <vladimir@genproof.com>
Closes: https://lore.kernel.org/r/20261012-libcrypto-4gib-lengths-v1-0-ea566c129a2e@genproof.com
Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 include/crypto/internal/poly1305.h     |  4 ++--
 include/crypto/poly1305.h              |  4 ++--
 lib/crypto/arm/poly1305.h              |  8 ++++----
 lib/crypto/arm64/poly1305.h            |  6 +++---
 lib/crypto/mips/poly1305.h             |  2 +-
 lib/crypto/poly1305-donna32.c          |  2 +-
 lib/crypto/poly1305-donna64.c          |  2 +-
 lib/crypto/poly1305.c                  | 10 +++++-----
 lib/crypto/powerpc/poly1305-p10le_64.S | 23 ++++++++++++-----------
 lib/crypto/powerpc/poly1305.h          |  8 +++++---
 lib/crypto/riscv/poly1305.h            |  2 +-
 lib/crypto/x86/poly1305.h              |  4 ++--
 12 files changed, 39 insertions(+), 36 deletions(-)

diff --git a/include/crypto/internal/poly1305.h b/include/crypto/internal/poly1305.h
index a72fff409ab85..6b0dec05cd36d 100644
--- a/include/crypto/internal/poly1305.h
+++ b/include/crypto/internal/poly1305.h
@@ -26,7 +26,7 @@ static inline void poly1305_core_init(struct poly1305_state *state)
 
 void poly1305_core_blocks(struct poly1305_state *state,
 			  const struct poly1305_core_key *key, const void *src,
-			  unsigned int nblocks, u32 hibit);
+			  size_t nblocks, u32 hibit);
 void poly1305_core_emit(const struct poly1305_state *state, const u32 nonce[4],
 			void *dst);
 
@@ -39,7 +39,7 @@ poly1305_block_init_generic(struct poly1305_block_state *desc,
 }
 
 static inline void poly1305_blocks_generic(struct poly1305_block_state *state,
-					   const u8 *src, unsigned int len,
+					   const u8 *src, size_t len,
 					   u32 padbit)
 {
 	poly1305_core_blocks(&state->h, &state->core_r, src,
diff --git a/include/crypto/poly1305.h b/include/crypto/poly1305.h
index 190beb427c6de..ccdb0ea3e25d0 100644
--- a/include/crypto/poly1305.h
+++ b/include/crypto/poly1305.h
@@ -60,8 +60,8 @@ struct poly1305_desc_ctx {
 
 void poly1305_init(struct poly1305_desc_ctx *desc,
 		   const u8 key[at_least POLY1305_KEY_SIZE]);
-void poly1305_update(struct poly1305_desc_ctx *desc,
-		     const u8 *src, unsigned int nbytes);
+void poly1305_update(struct poly1305_desc_ctx *desc, const u8 *src,
+		     size_t nbytes);
 void poly1305_final(struct poly1305_desc_ctx *desc, u8 *digest);
 
 #endif
diff --git a/lib/crypto/arm/poly1305.h b/lib/crypto/arm/poly1305.h
index 0fe903d8de556..6cad0824a2b42 100644
--- a/lib/crypto/arm/poly1305.h
+++ b/lib/crypto/arm/poly1305.h
@@ -14,9 +14,9 @@
 asmlinkage void poly1305_block_init(struct poly1305_block_state *state,
 				    const u8 raw_key[POLY1305_BLOCK_SIZE]);
 asmlinkage void poly1305_blocks_arm(struct poly1305_block_state *state,
-				    const u8 *src, u32 len, u32 hibit);
+				    const u8 *src, size_t len, u32 hibit);
 asmlinkage void poly1305_blocks_neon(struct poly1305_block_state *state,
-				     const u8 *src, u32 len, u32 hibit);
+				     const u8 *src, size_t len, u32 hibit);
 asmlinkage void poly1305_emit(const struct poly1305_state *state,
 			      u8 digest[POLY1305_DIGEST_SIZE],
 			      const u32 nonce[4]);
@@ -24,12 +24,12 @@ asmlinkage void poly1305_emit(const struct poly1305_state *state,
 static __ro_after_init DEFINE_STATIC_KEY_FALSE(have_neon);
 
 static void poly1305_blocks(struct poly1305_block_state *state, const u8 *src,
-			    unsigned int len, u32 padbit)
+			    size_t len, u32 padbit)
 {
 	if (IS_ENABLED(CONFIG_KERNEL_MODE_NEON) &&
 	    static_branch_likely(&have_neon) && likely(may_use_simd())) {
 		do {
-			unsigned int todo = min_t(unsigned int, len, SZ_4K);
+			size_t todo = min(len, SZ_4K);
 
 			scoped_ksimd()
 				poly1305_blocks_neon(state, src, todo, padbit);
diff --git a/lib/crypto/arm64/poly1305.h b/lib/crypto/arm64/poly1305.h
index 3d4bde8576994..2ebd2d919c93a 100644
--- a/lib/crypto/arm64/poly1305.h
+++ b/lib/crypto/arm64/poly1305.h
@@ -14,9 +14,9 @@
 asmlinkage void poly1305_block_init(struct poly1305_block_state *state,
 				    const u8 raw_key[POLY1305_BLOCK_SIZE]);
 asmlinkage void poly1305_blocks_arm64(struct poly1305_block_state *state,
-				      const u8 *src, u32 len, u32 hibit);
+				      const u8 *src, size_t len, u32 hibit);
 asmlinkage void poly1305_blocks_neon(struct poly1305_block_state *state,
-				     const u8 *src, u32 len, u32 hibit);
+				     const u8 *src, size_t len, u32 hibit);
 asmlinkage void poly1305_emit(const struct poly1305_state *state,
 			      u8 digest[POLY1305_DIGEST_SIZE],
 			      const u32 nonce[4]);
@@ -24,7 +24,7 @@ asmlinkage void poly1305_emit(const struct poly1305_state *state,
 static __ro_after_init DEFINE_STATIC_KEY_FALSE(have_neon);
 
 static void poly1305_blocks(struct poly1305_block_state *state, const u8 *src,
-			    unsigned int len, u32 padbit)
+			    size_t len, u32 padbit)
 {
 	if (static_branch_likely(&have_neon) && likely(may_use_simd())) {
 		scoped_ksimd()
diff --git a/lib/crypto/mips/poly1305.h b/lib/crypto/mips/poly1305.h
index 85de450f1a93d..9e9147f40d175 100644
--- a/lib/crypto/mips/poly1305.h
+++ b/lib/crypto/mips/poly1305.h
@@ -8,7 +8,7 @@
 asmlinkage void poly1305_block_init(struct poly1305_block_state *state,
 				    const u8 raw_key[POLY1305_BLOCK_SIZE]);
 asmlinkage void poly1305_blocks(struct poly1305_block_state *state,
-				const u8 *src, u32 len, u32 hibit);
+				const u8 *src, size_t len, u32 hibit);
 asmlinkage void poly1305_emit(const struct poly1305_state *state,
 			      u8 digest[POLY1305_DIGEST_SIZE],
 			      const u32 nonce[4]);
diff --git a/lib/crypto/poly1305-donna32.c b/lib/crypto/poly1305-donna32.c
index b66131b3f6d4b..5977785cd76e3 100644
--- a/lib/crypto/poly1305-donna32.c
+++ b/lib/crypto/poly1305-donna32.c
@@ -31,7 +31,7 @@ EXPORT_SYMBOL(poly1305_core_setkey);
 
 void poly1305_core_blocks(struct poly1305_state *state,
 			  const struct poly1305_core_key *key, const void *src,
-			  unsigned int nblocks, u32 hibit)
+			  size_t nblocks, u32 hibit)
 {
 	const u8 *input = src;
 	u32 r0, r1, r2, r3, r4;
diff --git a/lib/crypto/poly1305-donna64.c b/lib/crypto/poly1305-donna64.c
index 8a72a5a849446..d0e4234c1c4c1 100644
--- a/lib/crypto/poly1305-donna64.c
+++ b/lib/crypto/poly1305-donna64.c
@@ -32,7 +32,7 @@ EXPORT_SYMBOL(poly1305_core_setkey);
 
 void poly1305_core_blocks(struct poly1305_state *state,
 			  const struct poly1305_core_key *key, const void *src,
-			  unsigned int nblocks, u32 hibit)
+			  size_t nblocks, u32 hibit)
 {
 	const u8 *input = src;
 	u64 hibit64;
diff --git a/lib/crypto/poly1305.c b/lib/crypto/poly1305.c
index f313ccc4b4dd2..db7b262240d3f 100644
--- a/lib/crypto/poly1305.c
+++ b/lib/crypto/poly1305.c
@@ -34,14 +34,14 @@ void poly1305_init(struct poly1305_desc_ctx *desc,
 }
 EXPORT_SYMBOL(poly1305_init);
 
-void poly1305_update(struct poly1305_desc_ctx *desc,
-		     const u8 *src, unsigned int nbytes)
+void poly1305_update(struct poly1305_desc_ctx *desc, const u8 *src,
+		     size_t nbytes)
 {
-	if (desc->buflen + nbytes >= POLY1305_BLOCK_SIZE) {
-		unsigned int bulk_len;
+	if (nbytes >= POLY1305_BLOCK_SIZE - desc->buflen) {
+		size_t bulk_len;
 
 		if (desc->buflen) {
-			unsigned int l = POLY1305_BLOCK_SIZE - desc->buflen;
+			size_t l = POLY1305_BLOCK_SIZE - desc->buflen;
 
 			memcpy(&desc->buf[desc->buflen], src, l);
 			src += l;
diff --git a/lib/crypto/powerpc/poly1305-p10le_64.S b/lib/crypto/powerpc/poly1305-p10le_64.S
index a3c1987f1ecd1..ffd5b4aa0a5b9 100644
--- a/lib/crypto/powerpc/poly1305-p10le_64.S
+++ b/lib/crypto/powerpc/poly1305-p10le_64.S
@@ -46,11 +46,11 @@
 # r4, r3,   r2,   r1,   r0  ;
 #
 #
-# poly1305_p10le_4blocks( uint8_t *k, uint32_t mlen, uint8_t *m)
-#  k = 32 bytes key
-#  r3 = k (r, s)
-#  r4 = mlen
-#  r5 = m
+# void poly1305_p10le_4blocks(struct poly1305_block_state *state, const u8 *m,
+#			      size_t mlen);
+#  r3 = state
+#  r4 = m
+#  r5 = mlen
 #
 #include <asm/ppc_asm.h>
 #include <asm/asm-offsets.h>
@@ -519,11 +519,11 @@ SYM_FUNC_END(do_mul)
 .endm
 
 #
-# poly1305_p10le_4blocks( uint8_t *k, uint32_t mlen, uint8_t *m)
-#  k = 32 bytes key
-#  r3 = k (r, s)
-#  r4 = mlen
-#  r5 = m
+# void poly1305_p10le_4blocks(struct poly1305_block_state *state, const u8 *m,
+#			      size_t mlen);
+#  r3 = state
+#  r4 = m
+#  r5 = mlen
 #
 SYM_FUNC_START(poly1305_p10le_4blocks)
 .align 5
@@ -919,7 +919,8 @@ SYM_FUNC_END(Carry_reduction)
 #       d2 = h0 * r0
 #
 #
-# unsigned int poly1305_test_64s(unisgned char *state, const byte *src, size_t len, highbit)
+# void poly1305_64s(struct poly1305_block_state *state, const u8 *m,
+#		    size_t mlen, int highbit);
 #   - no highbit if final leftover block (highbit = 0)
 #
 SYM_FUNC_START(poly1305_64s)
diff --git a/lib/crypto/powerpc/poly1305.h b/lib/crypto/powerpc/poly1305.h
index b8ed098a0e95f..f758c24b31294 100644
--- a/lib/crypto/powerpc/poly1305.h
+++ b/lib/crypto/powerpc/poly1305.h
@@ -10,8 +10,10 @@
 #include <linux/kernel.h>
 #include <linux/unaligned.h>
 
-asmlinkage void poly1305_p10le_4blocks(struct poly1305_block_state *state, const u8 *m, u32 mlen);
-asmlinkage void poly1305_64s(struct poly1305_block_state *state, const u8 *m, u32 mlen, int highbit);
+asmlinkage void poly1305_p10le_4blocks(struct poly1305_block_state *state,
+				       const u8 *m, size_t mlen);
+asmlinkage void poly1305_64s(struct poly1305_block_state *state, const u8 *m,
+			     size_t mlen, int highbit);
 asmlinkage void poly1305_emit_64(const struct poly1305_state *state, const u32 nonce[4], u8 digest[POLY1305_DIGEST_SIZE]);
 
 static __ro_after_init DEFINE_STATIC_KEY_FALSE(have_p10);
@@ -40,7 +42,7 @@ static void poly1305_block_init(struct poly1305_block_state *dctx,
 }
 
 static void poly1305_blocks(struct poly1305_block_state *state, const u8 *src,
-			    unsigned int len, u32 padbit)
+			    size_t len, u32 padbit)
 {
 	if (!static_key_enabled(&have_p10))
 		return poly1305_blocks_generic(state, src, len, padbit);
diff --git a/lib/crypto/riscv/poly1305.h b/lib/crypto/riscv/poly1305.h
index 88f3df44e355e..aaf24d0f66745 100644
--- a/lib/crypto/riscv/poly1305.h
+++ b/lib/crypto/riscv/poly1305.h
@@ -8,7 +8,7 @@
 asmlinkage void poly1305_block_init(struct poly1305_block_state *state,
 				    const u8 raw_key[POLY1305_BLOCK_SIZE]);
 asmlinkage void poly1305_blocks(struct poly1305_block_state *state,
-				const u8 *src, u32 len, u32 hibit);
+				const u8 *src, size_t len, u32 hibit);
 asmlinkage void poly1305_emit(const struct poly1305_state *state,
 			      u8 digest[POLY1305_DIGEST_SIZE],
 			      const u32 nonce[4]);
diff --git a/lib/crypto/x86/poly1305.h b/lib/crypto/x86/poly1305.h
index ee92e3740a787..ec10d917e6d9d 100644
--- a/lib/crypto/x86/poly1305.h
+++ b/lib/crypto/x86/poly1305.h
@@ -90,7 +90,7 @@ static void poly1305_block_init(struct poly1305_block_state *state,
 }
 
 static void poly1305_blocks(struct poly1305_block_state *state, const u8 *inp,
-			    unsigned int len, u32 padbit)
+			    size_t len, u32 padbit)
 {
 	struct poly1305_arch_internal *ctx =
 		container_of(&state->h.h, struct poly1305_arch_internal, h);
@@ -115,7 +115,7 @@ static void poly1305_blocks(struct poly1305_block_state *state, const u8 *inp,
 	}
 
 	do {
-		const unsigned int bytes = min(len, SZ_4K);
+		const size_t bytes = min(len, SZ_4K);
 
 		kernel_fpu_begin();
 		if (static_branch_likely(&poly1305_use_avx512))
-- 
2.56.0


