Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23E17D3E784
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Dec 2025 01:21:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jNOK6HUl6spwUJz8j/gk/U0tK4exv7EhDXUHP0RZZgg=; b=onzG9/BP3xoO34ccn2mnFISeEL
	1AtH6z/TicWGD+RcXYiHbBYDGnP5B5IqBRHqJ2dsdVGRwRt+D3lGXg7MGRHYJu75OgI921DUmS9s0
	SOujQZlJOR5J3mHXD3Q0K49vDXQEtgXM7jYMVmiOtpxJKwqdcAsEtyca+4/4MWkQ15wpiV3d81LRT
	PEFrVNvv1XLMKVOUA3ueZmcZQMtt6q+KXhDyDHE7aGczH6wEllX90lB64nRMUfdZuD3DxiLdU4Qse
	3HcOub4SnFZmDl1cBSZlnOUTAXve0/Hit6Oukf1ZXQKa+NYZt8D+uU3nENI2f0/ZqbCJoyPZrbEoM
	J8D5nqrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTVMd-0000000G3ni-3fE5;
	Thu, 11 Dec 2025 01:21:03 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTVMX-0000000G3eq-0HiQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Dec 2025 01:20:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C21834445B;
	Thu, 11 Dec 2025 01:20:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 357E2C4CEF1;
	Thu, 11 Dec 2025 01:20:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765416056;
	bh=jd/fjl1lIZXJuNgWgLThZjv/SSMLpriHsm2sS8H6n5I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZQk9eE2Tzk0O/evrnS0rJOJm+PLw6jInkaleZNFiigXdLc66ih5OP46+M2POJ4O4X
	 GBBGazdMiS5im28bkZVk05hTkXcsfuCoPH37SUA1HBJissve1vm5vafFLhKTh5uRMl
	 jzzMw23YB98nUszmt8R+okWS5I00BEdyWg/lDv3OlM5biJsj/EbXi+o9I8jN6pPjN2
	 spUYMlqSjZnXYMz92Wi9m4mySNL0CX4Dl52fc3TPkZ/qETfV1QUTnd0vV+CKzJLEJI
	 BpeRSKbTDBbhYERJySOV2PWPCKAqUnxbf1W3VxviScMfxmKZeI6ucUc0sH2RuC4tvJ
	 50KgmXarg6ESQ==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	linux-arm-kernel@lists.infradead.org,
	x86@kernel.org,
	Eric Biggers <ebiggers@kernel.org>
Subject: [PATCH 09/12] crypto: adiantum - Drop support for asynchronous xchacha ciphers
Date: Wed, 10 Dec 2025 17:18:41 -0800
Message-ID: <20251211011846.8179-10-ebiggers@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251211011846.8179-1-ebiggers@kernel.org>
References: <20251211011846.8179-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251210_172057_639282_CEFD175E 
X-CRM114-Status: GOOD (  26.39  )
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

This feature isn't useful in practice.  Simplify and streamline the code
in the synchronous case, i.e. the case that actually matters, instead.

For example, by no longer having to support resuming the calculation
after an asynchronous return of the xchacha cipher, we can just keep
more of the state on the stack instead of in the request context.

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 crypto/adiantum.c | 174 +++++++++++++++++++---------------------------
 1 file changed, 70 insertions(+), 104 deletions(-)

diff --git a/crypto/adiantum.c b/crypto/adiantum.c
index 6d882f926ab0..5ddf585abb66 100644
--- a/crypto/adiantum.c
+++ b/crypto/adiantum.c
@@ -81,33 +81,10 @@ struct nhpoly1305_ctx {
 
 	__le64 nh_hash[NH_NUM_PASSES];
 };
 
 struct adiantum_request_ctx {
-
-	/*
-	 * Buffer for right-hand part of data, i.e.
-	 *
-	 *    P_L => P_M => C_M => C_R when encrypting, or
-	 *    C_R => C_M => P_M => P_L when decrypting.
-	 *
-	 * Also used to build the IV for the stream cipher.
-	 */
-	union {
-		u8 bytes[XCHACHA_IV_SIZE];
-		__le32 words[XCHACHA_IV_SIZE / sizeof(__le32)];
-		le128 bignum;	/* interpret as element of Z/(2^{128}Z) */
-	} rbuf;
-
-	bool enc; /* true if encrypting, false if decrypting */
-
-	/*
-	 * The result of the Poly1305 ε-∆U hash function applied to
-	 * (bulk length, tweak)
-	 */
-	le128 header_hash;
-
 	/*
 	 * skcipher sub-request size is unknown at compile-time, so it needs to
 	 * go after the members with known sizes.
 	 */
 	union {
@@ -214,25 +191,24 @@ static inline void le128_sub(le128 *r, const le128 *v1, const le128 *v2)
 			   (x - y > x));
 }
 
 /*
  * Apply the Poly1305 ε-∆U hash function to (bulk length, tweak) and save the
- * result to rctx->header_hash.  This is the calculation
+ * result to @out.  This is the calculation
  *
  *	H_T ← Poly1305_{K_T}(bin_{128}(|L|) || T)
  *
  * from the procedure in section 6.4 of the Adiantum paper.  The resulting value
  * is reused in both the first and second hash steps.  Specifically, it's added
  * to the result of an independently keyed ε-∆U hash function (for equal length
  * inputs only) taken over the left-hand part (the "bulk") of the message, to
  * give the overall Adiantum hash of the (tweak, left-hand part) pair.
  */
-static void adiantum_hash_header(struct skcipher_request *req)
+static void adiantum_hash_header(struct skcipher_request *req, le128 *out)
 {
 	struct crypto_skcipher *tfm = crypto_skcipher_reqtfm(req);
 	const struct adiantum_tfm_ctx *tctx = crypto_skcipher_ctx(tfm);
-	struct adiantum_request_ctx *rctx = skcipher_request_ctx(req);
 	const unsigned int bulk_len = req->cryptlen - BLOCKCIPHER_BLOCK_SIZE;
 	struct {
 		__le64 message_bits;
 		__le64 padding;
 	} header = {
@@ -248,11 +224,11 @@ static void adiantum_hash_header(struct skcipher_request *req)
 
 	BUILD_BUG_ON(TWEAK_SIZE % POLY1305_BLOCK_SIZE != 0);
 	poly1305_core_blocks(&state, &tctx->header_hash_key, req->iv,
 			     TWEAK_SIZE / POLY1305_BLOCK_SIZE, 1);
 
-	poly1305_core_emit(&state, NULL, &rctx->header_hash);
+	poly1305_core_emit(&state, NULL, out);
 }
 
 /* Pass the next NH hash value through Poly1305 */
 static void process_nh_hash_value(struct nhpoly1305_ctx *ctx,
 				  const struct adiantum_tfm_ctx *key)
@@ -387,116 +363,73 @@ static void adiantum_hash_message(struct skcipher_request *req,
 		len -= n;
 	}
 	nhpoly1305_final(&rctx->u.hash_ctx, tctx, out);
 }
 
-/* Continue Adiantum encryption/decryption after the stream cipher step */
-static int adiantum_finish(struct skcipher_request *req)
+static int adiantum_crypt(struct skcipher_request *req, bool enc)
 {
 	struct crypto_skcipher *tfm = crypto_skcipher_reqtfm(req);
 	const struct adiantum_tfm_ctx *tctx = crypto_skcipher_ctx(tfm);
 	struct adiantum_request_ctx *rctx = skcipher_request_ctx(req);
 	const unsigned int bulk_len = req->cryptlen - BLOCKCIPHER_BLOCK_SIZE;
-	struct scatterlist *dst = req->dst;
-	le128 digest;
-
-	/* If decrypting, decrypt C_M with the block cipher to get P_M */
-	if (!rctx->enc)
-		crypto_cipher_decrypt_one(tctx->blockcipher, rctx->rbuf.bytes,
-					  rctx->rbuf.bytes);
-
+	struct scatterlist *src = req->src, *dst = req->dst;
 	/*
-	 * Second hash step
-	 *	enc: C_R = C_M - H_{K_H}(T, C_L)
-	 *	dec: P_R = P_M - H_{K_H}(T, P_L)
+	 * Buffer for right-hand part of data, i.e.
+	 *
+	 *    P_L => P_M => C_M => C_R when encrypting, or
+	 *    C_R => C_M => P_M => P_L when decrypting.
+	 *
+	 * Also used to build the IV for the stream cipher.
 	 */
-	le128_sub(&rctx->rbuf.bignum, &rctx->rbuf.bignum, &rctx->header_hash);
-	if (dst->length >= req->cryptlen &&
-	    dst->offset + req->cryptlen <= PAGE_SIZE) {
-		/* Fast path for single-page destination */
-		struct page *page = sg_page(dst);
-		void *virt = kmap_local_page(page) + dst->offset;
-
-		nhpoly1305_init(&rctx->u.hash_ctx);
-		nhpoly1305_update(&rctx->u.hash_ctx, tctx, virt, bulk_len);
-		nhpoly1305_final(&rctx->u.hash_ctx, tctx, &digest);
-		le128_sub(&rctx->rbuf.bignum, &rctx->rbuf.bignum, &digest);
-		memcpy(virt + bulk_len, &rctx->rbuf.bignum, sizeof(le128));
-		flush_dcache_page(page);
-		kunmap_local(virt);
-	} else {
-		/* Slow path that works for any destination scatterlist */
-		adiantum_hash_message(req, dst, &digest);
-		le128_sub(&rctx->rbuf.bignum, &rctx->rbuf.bignum, &digest);
-		memcpy_to_sglist(dst, bulk_len, &rctx->rbuf.bignum,
-				 sizeof(le128));
-	}
-	return 0;
-}
-
-static void adiantum_streamcipher_done(void *data, int err)
-{
-	struct skcipher_request *req = data;
-
-	if (!err)
-		err = adiantum_finish(req);
-
-	skcipher_request_complete(req, err);
-}
-
-static int adiantum_crypt(struct skcipher_request *req, bool enc)
-{
-	struct crypto_skcipher *tfm = crypto_skcipher_reqtfm(req);
-	const struct adiantum_tfm_ctx *tctx = crypto_skcipher_ctx(tfm);
-	struct adiantum_request_ctx *rctx = skcipher_request_ctx(req);
-	const unsigned int bulk_len = req->cryptlen - BLOCKCIPHER_BLOCK_SIZE;
-	struct scatterlist *src = req->src;
+	union {
+		u8 bytes[XCHACHA_IV_SIZE];
+		__le32 words[XCHACHA_IV_SIZE / sizeof(__le32)];
+		le128 bignum; /* interpret as element of Z/(2^{128}Z) */
+	} rbuf;
+	le128 header_hash, msg_hash;
 	unsigned int stream_len;
-	le128 digest;
+	int err;
 
 	if (req->cryptlen < BLOCKCIPHER_BLOCK_SIZE)
 		return -EINVAL;
 
-	rctx->enc = enc;
-
 	/*
 	 * First hash step
 	 *	enc: P_M = P_R + H_{K_H}(T, P_L)
 	 *	dec: C_M = C_R + H_{K_H}(T, C_L)
 	 */
-	adiantum_hash_header(req);
+	adiantum_hash_header(req, &header_hash);
 	if (src->length >= req->cryptlen &&
 	    src->offset + req->cryptlen <= PAGE_SIZE) {
 		/* Fast path for single-page source */
 		void *virt = kmap_local_page(sg_page(src)) + src->offset;
 
 		nhpoly1305_init(&rctx->u.hash_ctx);
 		nhpoly1305_update(&rctx->u.hash_ctx, tctx, virt, bulk_len);
-		nhpoly1305_final(&rctx->u.hash_ctx, tctx, &digest);
-		memcpy(&rctx->rbuf.bignum, virt + bulk_len, sizeof(le128));
+		nhpoly1305_final(&rctx->u.hash_ctx, tctx, &msg_hash);
+		memcpy(&rbuf.bignum, virt + bulk_len, sizeof(le128));
 		kunmap_local(virt);
 	} else {
 		/* Slow path that works for any source scatterlist */
-		adiantum_hash_message(req, src, &digest);
-		memcpy_from_sglist(&rctx->rbuf.bignum, src, bulk_len,
-				   sizeof(le128));
+		adiantum_hash_message(req, src, &msg_hash);
+		memcpy_from_sglist(&rbuf.bignum, src, bulk_len, sizeof(le128));
 	}
-	le128_add(&rctx->rbuf.bignum, &rctx->rbuf.bignum, &rctx->header_hash);
-	le128_add(&rctx->rbuf.bignum, &rctx->rbuf.bignum, &digest);
+	le128_add(&rbuf.bignum, &rbuf.bignum, &header_hash);
+	le128_add(&rbuf.bignum, &rbuf.bignum, &msg_hash);
 
 	/* If encrypting, encrypt P_M with the block cipher to get C_M */
 	if (enc)
-		crypto_cipher_encrypt_one(tctx->blockcipher, rctx->rbuf.bytes,
-					  rctx->rbuf.bytes);
+		crypto_cipher_encrypt_one(tctx->blockcipher, rbuf.bytes,
+					  rbuf.bytes);
 
 	/* Initialize the rest of the XChaCha IV (first part is C_M) */
 	BUILD_BUG_ON(BLOCKCIPHER_BLOCK_SIZE != 16);
 	BUILD_BUG_ON(XCHACHA_IV_SIZE != 32);	/* nonce || stream position */
-	rctx->rbuf.words[4] = cpu_to_le32(1);
-	rctx->rbuf.words[5] = 0;
-	rctx->rbuf.words[6] = 0;
-	rctx->rbuf.words[7] = 0;
+	rbuf.words[4] = cpu_to_le32(1);
+	rbuf.words[5] = 0;
+	rbuf.words[6] = 0;
+	rbuf.words[7] = 0;
 
 	/*
 	 * XChaCha needs to be done on all the data except the last 16 bytes;
 	 * for disk encryption that usually means 4080 or 496 bytes.  But ChaCha
 	 * implementations tend to be most efficient when passed a whole number
@@ -509,16 +442,48 @@ static int adiantum_crypt(struct skcipher_request *req, bool enc)
 	if (round_up(stream_len, CHACHA_BLOCK_SIZE) <= req->cryptlen)
 		stream_len = round_up(stream_len, CHACHA_BLOCK_SIZE);
 
 	skcipher_request_set_tfm(&rctx->u.streamcipher_req, tctx->streamcipher);
 	skcipher_request_set_crypt(&rctx->u.streamcipher_req, req->src,
-				   req->dst, stream_len, &rctx->rbuf);
+				   req->dst, stream_len, &rbuf);
 	skcipher_request_set_callback(&rctx->u.streamcipher_req,
-				      req->base.flags,
-				      adiantum_streamcipher_done, req);
-	return crypto_skcipher_encrypt(&rctx->u.streamcipher_req) ?:
-		adiantum_finish(req);
+				      req->base.flags, NULL, NULL);
+	err = crypto_skcipher_encrypt(&rctx->u.streamcipher_req);
+	if (err)
+		return err;
+
+	/* If decrypting, decrypt C_M with the block cipher to get P_M */
+	if (!enc)
+		crypto_cipher_decrypt_one(tctx->blockcipher, rbuf.bytes,
+					  rbuf.bytes);
+
+	/*
+	 * Second hash step
+	 *	enc: C_R = C_M - H_{K_H}(T, C_L)
+	 *	dec: P_R = P_M - H_{K_H}(T, P_L)
+	 */
+	le128_sub(&rbuf.bignum, &rbuf.bignum, &header_hash);
+	if (dst->length >= req->cryptlen &&
+	    dst->offset + req->cryptlen <= PAGE_SIZE) {
+		/* Fast path for single-page destination */
+		struct page *page = sg_page(dst);
+		void *virt = kmap_local_page(page) + dst->offset;
+
+		nhpoly1305_init(&rctx->u.hash_ctx);
+		nhpoly1305_update(&rctx->u.hash_ctx, tctx, virt, bulk_len);
+		nhpoly1305_final(&rctx->u.hash_ctx, tctx, &msg_hash);
+		le128_sub(&rbuf.bignum, &rbuf.bignum, &msg_hash);
+		memcpy(virt + bulk_len, &rbuf.bignum, sizeof(le128));
+		flush_dcache_page(page);
+		kunmap_local(virt);
+	} else {
+		/* Slow path that works for any destination scatterlist */
+		adiantum_hash_message(req, dst, &msg_hash);
+		le128_sub(&rbuf.bignum, &rbuf.bignum, &msg_hash);
+		memcpy_to_sglist(dst, bulk_len, &rbuf.bignum, sizeof(le128));
+	}
+	return 0;
 }
 
 static int adiantum_encrypt(struct skcipher_request *req)
 {
 	return adiantum_crypt(req, true);
@@ -622,11 +587,12 @@ static int adiantum_create(struct crypto_template *tmpl, struct rtattr **tb)
 	ictx = skcipher_instance_ctx(inst);
 
 	/* Stream cipher, e.g. "xchacha12" */
 	err = crypto_grab_skcipher(&ictx->streamcipher_spawn,
 				   skcipher_crypto_instance(inst),
-				   crypto_attr_alg_name(tb[1]), 0, mask);
+				   crypto_attr_alg_name(tb[1]), 0,
+				   mask | CRYPTO_ALG_ASYNC /* sync only */);
 	if (err)
 		goto err_free_inst;
 	streamcipher_alg = crypto_spawn_skcipher_alg_common(&ictx->streamcipher_spawn);
 
 	/* Block cipher, e.g. "aes" */
-- 
2.52.0


