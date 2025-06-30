Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A31E9C83029
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Jun 2025 17:15:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uk0sE/BCMGvaA7bCbAXV+RAu7t0GwWYb3WWV/cO67KU=; b=ukU5R2pHNz2bHXUofPX3ot8woI
	NqeskoenlSFlieqwiohI7vcoyJs2VkPtX714heQ8fOcCiGX/7vltEH/fGWNuiJkicTNwH2PJPKfBX
	0OZLz07WFQiQA1GmOye4tW2ZJhjmg2UW9R2gLO1K3cthbdEzrnpWGaMUtL1qz3LMJw0rh8VadroKl
	m7XU5CVuyDi0piMSYe7rS5DuOjjBx28E5Vj38YSjLU8neRh+Q1mG+jmcevUIWZZHVhE5pNpkpi0tt
	c7j7wIqWMG4VKgI35nj/CP3Wdtu26oHoXycd1CZ3rJwFW50OZg3XlX80WqfZFygDZlSC6KeTzo4s6
	siS+sPQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWI6A-0000000330U-0Dah;
	Mon, 30 Jun 2025 17:15:18 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWH4M-00000002pjz-3vYJ;
	Mon, 30 Jun 2025 16:09:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 54C5F6113B;
	Mon, 30 Jun 2025 16:09:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A35A7C4CEF5;
	Mon, 30 Jun 2025 16:09:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751299762;
	bh=5WUT3FVFtGYY38nGQk9FGEw/eHR0uyP40u2JgCeMrws=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=e+N+Rp7skA/eq8mkB7Jny8AcWCh4HRKnMJmSFz+cvafpdyHVdMjSt93EsD54zMvMs
	 /WyIqcz+TKrriW94MpM4zGQLw28AMAEVLamI7OUOzNdCwAx3uld43AU3LB0bXYQaIL
	 Ysygpb5KwKvQP7ez1n7hmFLHtqPW5XGEZUJXWUjJC9cc94Y1TNGXVe+6j/bItAqLGD
	 qYieA8QBrcCXt1v+n5nzgDRTzRRqNgaYFws411PqpqpH5xwUSLN2oWBAHvhRDWfsWF
	 uMyxhU4KDrgRJZRyK+SkqvDJ+p6MHQl6jFOoW7w7ndpIfaimBkuREJiy4Uux35Q1I6
	 BdnmQUWL/SNCQ==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org,
	x86@kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Eric Biggers <ebiggers@kernel.org>
Subject: [PATCH v2 03/14] lib/crypto: sha256: Reorder some code
Date: Mon, 30 Jun 2025 09:06:34 -0700
Message-ID: <20250630160645.3198-4-ebiggers@kernel.org>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250630160645.3198-1-ebiggers@kernel.org>
References: <20250630160645.3198-1-ebiggers@kernel.org>
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

First, move the declarations of sha224_init/update/final to be just
above the corresponding SHA-256 code, matching the order that I used for
SHA-384 and SHA-512.  In sha2.h, the end result is that SHA-224,
SHA-256, SHA-384, and SHA-512 are all in the logical order.

Second, move sha224_block_init() and sha256_block_init() to be just
below crypto_sha256_state.  In later changes, these functions as well as
struct crypto_sha256_state will no longer be used by the library
functions.  They'll remain just for some legacy offload drivers.  This
gets them into a logical place in the file for that.

No code changes other than reordering.

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 include/crypto/sha2.h | 60 +++++++++++++++++++++----------------------
 lib/crypto/sha256.c   | 12 ++++-----
 2 files changed, 36 insertions(+), 36 deletions(-)

diff --git a/include/crypto/sha2.h b/include/crypto/sha2.h
index 296ce9d468bfc..bb181b7996cdc 100644
--- a/include/crypto/sha2.h
+++ b/include/crypto/sha2.h
@@ -69,10 +69,36 @@ extern const u8 sha512_zero_message_hash[SHA512_DIGEST_SIZE];
 struct crypto_sha256_state {
 	u32 state[SHA256_STATE_WORDS];
 	u64 count;
 };
 
+static inline void sha224_block_init(struct crypto_sha256_state *sctx)
+{
+	sctx->state[0] = SHA224_H0;
+	sctx->state[1] = SHA224_H1;
+	sctx->state[2] = SHA224_H2;
+	sctx->state[3] = SHA224_H3;
+	sctx->state[4] = SHA224_H4;
+	sctx->state[5] = SHA224_H5;
+	sctx->state[6] = SHA224_H6;
+	sctx->state[7] = SHA224_H7;
+	sctx->count = 0;
+}
+
+static inline void sha256_block_init(struct crypto_sha256_state *sctx)
+{
+	sctx->state[0] = SHA256_H0;
+	sctx->state[1] = SHA256_H1;
+	sctx->state[2] = SHA256_H2;
+	sctx->state[3] = SHA256_H3;
+	sctx->state[4] = SHA256_H4;
+	sctx->state[5] = SHA256_H5;
+	sctx->state[6] = SHA256_H6;
+	sctx->state[7] = SHA256_H7;
+	sctx->count = 0;
+}
+
 struct sha256_state {
 	union {
 		struct crypto_sha256_state ctx;
 		struct {
 			u32 state[SHA256_STATE_WORDS];
@@ -86,51 +112,25 @@ struct sha512_state {
 	u64 state[SHA512_DIGEST_SIZE / 8];
 	u64 count[2];
 	u8 buf[SHA512_BLOCK_SIZE];
 };
 
-static inline void sha256_block_init(struct crypto_sha256_state *sctx)
+static inline void sha224_init(struct sha256_state *sctx)
 {
-	sctx->state[0] = SHA256_H0;
-	sctx->state[1] = SHA256_H1;
-	sctx->state[2] = SHA256_H2;
-	sctx->state[3] = SHA256_H3;
-	sctx->state[4] = SHA256_H4;
-	sctx->state[5] = SHA256_H5;
-	sctx->state[6] = SHA256_H6;
-	sctx->state[7] = SHA256_H7;
-	sctx->count = 0;
+	sha224_block_init(&sctx->ctx);
 }
+/* Simply use sha256_update as it is equivalent to sha224_update. */
+void sha224_final(struct sha256_state *sctx, u8 out[SHA224_DIGEST_SIZE]);
 
 static inline void sha256_init(struct sha256_state *sctx)
 {
 	sha256_block_init(&sctx->ctx);
 }
 void sha256_update(struct sha256_state *sctx, const u8 *data, size_t len);
 void sha256_final(struct sha256_state *sctx, u8 out[SHA256_DIGEST_SIZE]);
 void sha256(const u8 *data, size_t len, u8 out[SHA256_DIGEST_SIZE]);
 
-static inline void sha224_block_init(struct crypto_sha256_state *sctx)
-{
-	sctx->state[0] = SHA224_H0;
-	sctx->state[1] = SHA224_H1;
-	sctx->state[2] = SHA224_H2;
-	sctx->state[3] = SHA224_H3;
-	sctx->state[4] = SHA224_H4;
-	sctx->state[5] = SHA224_H5;
-	sctx->state[6] = SHA224_H6;
-	sctx->state[7] = SHA224_H7;
-	sctx->count = 0;
-}
-
-static inline void sha224_init(struct sha256_state *sctx)
-{
-	sha224_block_init(&sctx->ctx);
-}
-/* Simply use sha256_update as it is equivalent to sha224_update. */
-void sha224_final(struct sha256_state *sctx, u8 out[SHA224_DIGEST_SIZE]);
-
 /* State for the SHA-512 (and SHA-384) compression function */
 struct sha512_block_state {
 	u64 h[8];
 };
 
diff --git a/lib/crypto/sha256.c b/lib/crypto/sha256.c
index 6bfa4ae8dfb59..573ccecbf48bf 100644
--- a/lib/crypto/sha256.c
+++ b/lib/crypto/sha256.c
@@ -56,22 +56,22 @@ static inline void __sha256_final(struct sha256_state *sctx, u8 *out,
 	sha256_finup(&sctx->ctx, sctx->buf, partial, out, digest_size,
 		     sha256_purgatory(), false);
 	memzero_explicit(sctx, sizeof(*sctx));
 }
 
-void sha256_final(struct sha256_state *sctx, u8 out[SHA256_DIGEST_SIZE])
-{
-	__sha256_final(sctx, out, SHA256_DIGEST_SIZE);
-}
-EXPORT_SYMBOL(sha256_final);
-
 void sha224_final(struct sha256_state *sctx, u8 out[SHA224_DIGEST_SIZE])
 {
 	__sha256_final(sctx, out, SHA224_DIGEST_SIZE);
 }
 EXPORT_SYMBOL(sha224_final);
 
+void sha256_final(struct sha256_state *sctx, u8 out[SHA256_DIGEST_SIZE])
+{
+	__sha256_final(sctx, out, SHA256_DIGEST_SIZE);
+}
+EXPORT_SYMBOL(sha256_final);
+
 void sha256(const u8 *data, size_t len, u8 out[SHA256_DIGEST_SIZE])
 {
 	struct sha256_state sctx;
 
 	sha256_init(&sctx);
-- 
2.50.0


