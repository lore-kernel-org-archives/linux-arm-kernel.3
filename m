Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72F3FCF45C5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Jan 2026 19:26:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Dcl3UE3umGt/L3RjuznoXNLadh4OW0Sy9sJ/IsckP2I=; b=wzIvC9lKDrLigBQMFbpgDFOw6W
	DclfNP9re6T+hvp/5Zc8lsz5LHPJg1cOlBVlFFwEukWBTFwxZDCeNvYYAha/WEnughfXn0OIdB/cJ
	YYs738fJghExFY7C0fzAzE5hE7zoF/kae1ZCjR5VSF04Zd26WdJa8MLc+TqjE8Li41gx2UF04PD1K
	5FJ1tO51ewdAPpGYxPxPLxViKf1HQBEwrkJY2UG97nU5SyM0wDMnFHSDaYY/0dW/Gvvkbhyc1C4LT
	J7OPC8Gs0ir7SOfrtgz4eTJV25Q7EYcCtqiotd73YeAd4C+Fc2lE+EdmLi2K61urCeLn7N5N1JoFV
	c9WeJwxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfNXw-000000062FB-0yvK;
	Mon, 12 Jan 2026 19:25:48 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfNVn-00000005zCR-1Te4;
	Mon, 12 Jan 2026 19:23:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B8095600AE;
	Mon, 12 Jan 2026 19:23:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EEABC16AAE;
	Mon, 12 Jan 2026 19:23:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768245814;
	bh=2yX1SAnAgKA7xbLH25xiQD42E7Ke51oKK+KgmtTec0s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JGAY+SvhLYay2TgvMrif+ANkVrcmyC25n1wXaObgxPNPKPgRoxlQESdodwyIlX2O1
	 Q7V+wgk/nfCRxUZyBdqtJpnEkJt9FZOZmB5On9rs+UHN8bgEQHxrp9E0K0lczA7srL
	 6eJ9tBw9XF+0C2b1m7/xwczEdD9UCDYr7j5hz8+y1XDiwjnH7f+y/CNqvw8lACWblO
	 sYUtSTxUN4kpurSKzm1oIDucrgK73G2ZVnm6TjcmdGSV0lvQyV+gFkFKri+6p6T7cv
	 NYuvcNGcXlDvOweSxvKR6G27MBmsS4uZWPAbKl9rJo5b+3MJJrWYwA+f9oIUhjDU+a
	 /ht13DAlXfpLg==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org,
	x86@kernel.org,
	Holger Dengler <dengler@linux.ibm.com>,
	Harald Freudenberger <freude@linux.ibm.com>,
	Eric Biggers <ebiggers@kernel.org>
Subject: [PATCH v2 30/35] crypto: inside-secure - Use new AES library API
Date: Mon, 12 Jan 2026 11:20:28 -0800
Message-ID: <20260112192035.10427-31-ebiggers@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260112192035.10427-1-ebiggers@kernel.org>
References: <20260112192035.10427-1-ebiggers@kernel.org>
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

Switch from the old AES library functions (which use struct
crypto_aes_ctx) to the new ones (which use struct aes_enckey).  This
eliminates the unnecessary computation and caching of the decryption
round keys.  The new AES en/decryption functions are also much faster
and use AES instructions when supported by the CPU.

Note that in addition to the change in the key preparation function and
the key struct type itself, the change in the type of the key struct
results in aes_encrypt() (which is temporarily a type-generic macro)
calling the new encryption function rather than the old one.

This driver used crypto_aes_ctx::key_enc, but only to access the copy of
the raw key that is stored at the beginning of the expanded key.  To
eliminate the dependency on this field, instead just access the raw key
directly, which is already available in the relevant functions.

Acked-by: Ard Biesheuvel <ardb@kernel.org>
Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 drivers/crypto/inside-secure/safexcel_cipher.c | 12 +++++-------
 drivers/crypto/inside-secure/safexcel_hash.c   | 14 +++++++-------
 2 files changed, 12 insertions(+), 14 deletions(-)

diff --git a/drivers/crypto/inside-secure/safexcel_cipher.c b/drivers/crypto/inside-secure/safexcel_cipher.c
index 919e5a2cab95..27b180057417 100644
--- a/drivers/crypto/inside-secure/safexcel_cipher.c
+++ b/drivers/crypto/inside-secure/safexcel_cipher.c
@@ -2505,31 +2505,29 @@ static int safexcel_aead_gcm_setkey(struct crypto_aead *ctfm, const u8 *key,
 				    unsigned int len)
 {
 	struct crypto_tfm *tfm = crypto_aead_tfm(ctfm);
 	struct safexcel_cipher_ctx *ctx = crypto_tfm_ctx(tfm);
 	struct safexcel_crypto_priv *priv = ctx->base.priv;
-	struct crypto_aes_ctx aes;
+	struct aes_enckey aes;
 	u32 hashkey[AES_BLOCK_SIZE >> 2];
 	int ret, i;
 
-	ret = aes_expandkey(&aes, key, len);
-	if (ret) {
-		memzero_explicit(&aes, sizeof(aes));
+	ret = aes_prepareenckey(&aes, key, len);
+	if (ret)
 		return ret;
-	}
 
 	if (priv->flags & EIP197_TRC_CACHE && ctx->base.ctxr_dma) {
 		for (i = 0; i < len / sizeof(u32); i++) {
-			if (le32_to_cpu(ctx->key[i]) != aes.key_enc[i]) {
+			if (ctx->key[i] != get_unaligned((__le32 *)key + i)) {
 				ctx->base.needs_inv = true;
 				break;
 			}
 		}
 	}
 
 	for (i = 0; i < len / sizeof(u32); i++)
-		ctx->key[i] = cpu_to_le32(aes.key_enc[i]);
+		ctx->key[i] = get_unaligned((__le32 *)key + i);
 
 	ctx->key_len = len;
 
 	/* Compute hash key by encrypting zeroes with cipher key */
 	memset(hashkey, 0, AES_BLOCK_SIZE);
diff --git a/drivers/crypto/inside-secure/safexcel_hash.c b/drivers/crypto/inside-secure/safexcel_hash.c
index ef0ba4832928..e534b7a200cf 100644
--- a/drivers/crypto/inside-secure/safexcel_hash.c
+++ b/drivers/crypto/inside-secure/safexcel_hash.c
@@ -28,11 +28,11 @@ struct safexcel_ahash_ctx {
 	bool cbcmac;
 	bool do_fallback;
 	bool fb_init_done;
 	bool fb_do_setkey;
 
-	struct crypto_aes_ctx *aes;
+	struct aes_enckey *aes;
 	struct crypto_ahash *fback;
 	struct crypto_shash *shpre;
 	struct shash_desc *shdesc;
 };
 
@@ -1974,11 +1974,11 @@ static int safexcel_xcbcmac_setkey(struct crypto_ahash *tfm, const u8 *key,
 {
 	struct safexcel_ahash_ctx *ctx = crypto_tfm_ctx(crypto_ahash_tfm(tfm));
 	u32 key_tmp[3 * AES_BLOCK_SIZE / sizeof(u32)];
 	int ret, i;
 
-	ret = aes_expandkey(ctx->aes, key, len);
+	ret = aes_prepareenckey(ctx->aes, key, len);
 	if (ret)
 		return ret;
 
 	/* precompute the XCBC key material */
 	aes_encrypt(ctx->aes, (u8 *)key_tmp + 2 * AES_BLOCK_SIZE,
@@ -1988,13 +1988,13 @@ static int safexcel_xcbcmac_setkey(struct crypto_ahash *tfm, const u8 *key,
 	aes_encrypt(ctx->aes, (u8 *)key_tmp + AES_BLOCK_SIZE,
 		    "\x3\x3\x3\x3\x3\x3\x3\x3\x3\x3\x3\x3\x3\x3\x3\x3");
 	for (i = 0; i < 3 * AES_BLOCK_SIZE / sizeof(u32); i++)
 		ctx->base.ipad.word[i] = swab32(key_tmp[i]);
 
-	ret = aes_expandkey(ctx->aes,
-			    (u8 *)key_tmp + 2 * AES_BLOCK_SIZE,
-			    AES_MIN_KEY_SIZE);
+	ret = aes_prepareenckey(ctx->aes,
+				(u8 *)key_tmp + 2 * AES_BLOCK_SIZE,
+				AES_MIN_KEY_SIZE);
 	if (ret)
 		return ret;
 
 	ctx->alg    = CONTEXT_CONTROL_CRYPTO_ALG_XCBC128;
 	ctx->key_sz = AES_MIN_KEY_SIZE + 2 * AES_BLOCK_SIZE;
@@ -2060,16 +2060,16 @@ static int safexcel_cmac_setkey(struct crypto_ahash *tfm, const u8 *key,
 	u64 _const[2];
 	u8 msb_mask, gfmask;
 	int ret, i;
 
 	/* precompute the CMAC key material */
-	ret = aes_expandkey(ctx->aes, key, len);
+	ret = aes_prepareenckey(ctx->aes, key, len);
 	if (ret)
 		return ret;
 
 	for (i = 0; i < len / sizeof(u32); i++)
-		ctx->base.ipad.word[i + 8] = swab32(ctx->aes->key_enc[i]);
+		ctx->base.ipad.word[i + 8] = get_unaligned_be32(&key[4 * i]);
 
 	/* code below borrowed from crypto/cmac.c */
 	/* encrypt the zero block */
 	memset(consts, 0, AES_BLOCK_SIZE);
 	aes_encrypt(ctx->aes, (u8 *)consts, (u8 *)consts);
-- 
2.52.0


