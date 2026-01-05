Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80FF0C2A072
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 05:16:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RYyqji9PE8eYzuuXi3K+bad+83MyA0VZDDSADsJ0DWA=; b=QXZnq3HoutjXaN/34deOhCxEP3
	kq/iaEpxFbWrkQtir4tLdy0IvKxbrnR4uT1oE8eliSnSVenRxcNvrF5uIMhnoIAEV4QTTFk7a7pDm
	zpVNVihZSWMzpo3txZla5oe9aPUz27ycJ3SlmS+4KiAdDje6ZE0JhaO2STMty5rRjN8Yj5plt86VR
	IeVh8SbyQWOr+2sXbcv0kr6Q61/vskCmT4YBLlTvJbKQz5PKIfvTVHHNnlETAuMtt6jO5ofAc0j4F
	prwgXILvPZgpVyalGooL4D6YI+WBbF7mfWsH5O0kV2s/k7Am6uDMkHqaErySH+8h0erfIYvGREZVd
	T+RKqZKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vccwz-0000000AkwP-06IR;
	Mon, 05 Jan 2026 05:16:17 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vccvo-0000000Aj3N-27OM;
	Mon, 05 Jan 2026 05:15:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5CCC74434B;
	Mon,  5 Jan 2026 05:15:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1DB5C2BCB2;
	Mon,  5 Jan 2026 05:15:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767590104;
	bh=NFL++YcblhzlGK3w2LADc6E1fzvZkgF4LxjOicoIZ1Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tRQqfhtA2O5EPzgQlXTjC9WYjX+ogwMOT4kcPOtfAjeFNIivecPxD18ZAwTLAhQB6
	 fchsFvky/zd8YoikJGzyo9TAeEXv8d4fexYoImgFtGBdvTrxM3d51ucS+v+8du08Ea
	 Z5fK60dhIR/VDxkzg5tkCyJvE6ZN9n489TzeAKIouRaS3jInP9xdD29r3SVa5aW7Mv
	 u0ww0PR2xXwB5+Sn6y2Drvc1aV7RgL/pLeNWEW02oRogbdGpLPPzqUta8kV+oK5pDa
	 oGw4+d5oMdKOGwMtqZcoIsJoHIS/+m/1Ubp4C42AIeToZ6tR1AjZyKYzBdfWK8VUY+
	 9UYPQqDO2mBqQ==
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
Subject: [PATCH 20/36] chelsio: Use new AES library API
Date: Sun,  4 Jan 2026 21:12:53 -0800
Message-ID: <20260105051311.1607207-21-ebiggers@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260105051311.1607207-1-ebiggers@kernel.org>
References: <20260105051311.1607207-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260104_211504_698365_9B24DFC9 
X-CRM114-Status: GOOD (  13.56  )
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

Note: aes_encrypt_new() will be renamed to aes_encrypt() once all
callers of the old aes_encrypt() have been updated.

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 .../ethernet/chelsio/inline_crypto/ch_ipsec/chcr_ipsec.c  | 6 +++---
 .../ethernet/chelsio/inline_crypto/ch_ktls/chcr_ktls.c    | 8 ++++----
 .../net/ethernet/chelsio/inline_crypto/chtls/chtls_hw.c   | 6 +++---
 3 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/net/ethernet/chelsio/inline_crypto/ch_ipsec/chcr_ipsec.c b/drivers/net/ethernet/chelsio/inline_crypto/ch_ipsec/chcr_ipsec.c
index 49b57bb5fac1..882d09b2b1a8 100644
--- a/drivers/net/ethernet/chelsio/inline_crypto/ch_ipsec/chcr_ipsec.c
+++ b/drivers/net/ethernet/chelsio/inline_crypto/ch_ipsec/chcr_ipsec.c
@@ -168,11 +168,11 @@ static int ch_ipsec_setkey(struct xfrm_state *x,
 {
 	int keylen = (x->aead->alg_key_len + 7) / 8;
 	unsigned char *key = x->aead->alg_key;
 	int ck_size, key_ctx_size = 0;
 	unsigned char ghash_h[AEAD_H_SIZE];
-	struct crypto_aes_ctx aes;
+	struct aes_enckey aes;
 	int ret = 0;
 
 	if (keylen > 3) {
 		keylen -= 4;  /* nonce/salt is present in the last 4 bytes */
 		memcpy(sa_entry->salt, key + keylen, 4);
@@ -202,17 +202,17 @@ static int ch_ipsec_setkey(struct xfrm_state *x,
 						 key_ctx_size >> 4);
 
 	/* Calculate the H = CIPH(K, 0 repeated 16 times).
 	 * It will go in key context
 	 */
-	ret = aes_expandkey(&aes, key, keylen);
+	ret = aes_prepareenckey(&aes, key, keylen);
 	if (ret) {
 		sa_entry->enckey_len = 0;
 		goto out;
 	}
 	memset(ghash_h, 0, AEAD_H_SIZE);
-	aes_encrypt(&aes, ghash_h, ghash_h);
+	aes_encrypt_new(&aes, ghash_h, ghash_h);
 	memzero_explicit(&aes, sizeof(aes));
 
 	memcpy(sa_entry->key + (DIV_ROUND_UP(sa_entry->enckey_len, 16) *
 	       16), ghash_h, AEAD_H_SIZE);
 	sa_entry->kctx_len = ((DIV_ROUND_UP(sa_entry->enckey_len, 16)) << 4) +
diff --git a/drivers/net/ethernet/chelsio/inline_crypto/ch_ktls/chcr_ktls.c b/drivers/net/ethernet/chelsio/inline_crypto/ch_ktls/chcr_ktls.c
index 4e2096e49684..09c0687f911f 100644
--- a/drivers/net/ethernet/chelsio/inline_crypto/ch_ktls/chcr_ktls.c
+++ b/drivers/net/ethernet/chelsio/inline_crypto/ch_ktls/chcr_ktls.c
@@ -74,11 +74,11 @@ static int chcr_ktls_save_keys(struct chcr_ktls_info *tx_info,
 {
 	int ck_size, key_ctx_size, mac_key_size, keylen, ghash_size, ret;
 	unsigned char ghash_h[TLS_CIPHER_AES_GCM_256_TAG_SIZE];
 	struct tls12_crypto_info_aes_gcm_128 *info_128_gcm;
 	struct ktls_key_ctx *kctx = &tx_info->key_ctx;
-	struct crypto_aes_ctx aes_ctx;
+	struct aes_enckey aes;
 	unsigned char *key, *salt;
 
 	switch (crypto_info->cipher_type) {
 	case TLS_CIPHER_AES_GCM_128:
 		info_128_gcm =
@@ -136,17 +136,17 @@ static int chcr_ktls_save_keys(struct chcr_ktls_info *tx_info,
 		       roundup(keylen, 16) + ghash_size;
 	/* Calculate the H = CIPH(K, 0 repeated 16 times).
 	 * It will go in key context
 	 */
 
-	ret = aes_expandkey(&aes_ctx, key, keylen);
+	ret = aes_prepareenckey(&aes, key, keylen);
 	if (ret)
 		goto out;
 
 	memset(ghash_h, 0, ghash_size);
-	aes_encrypt(&aes_ctx, ghash_h, ghash_h);
-	memzero_explicit(&aes_ctx, sizeof(aes_ctx));
+	aes_encrypt_new(&aes, ghash_h, ghash_h);
+	memzero_explicit(&aes, sizeof(aes));
 
 	/* fill the Key context */
 	if (direction == TLS_OFFLOAD_CTX_DIR_TX) {
 		kctx->ctx_hdr = FILL_KEY_CTX_HDR(ck_size,
 						 mac_key_size,
diff --git a/drivers/net/ethernet/chelsio/inline_crypto/chtls/chtls_hw.c b/drivers/net/ethernet/chelsio/inline_crypto/chtls/chtls_hw.c
index fab6df21f01c..be2b623957c0 100644
--- a/drivers/net/ethernet/chelsio/inline_crypto/chtls/chtls_hw.c
+++ b/drivers/net/ethernet/chelsio/inline_crypto/chtls/chtls_hw.c
@@ -245,11 +245,11 @@ static int chtls_key_info(struct chtls_sock *csk,
 {
 	unsigned char key[AES_MAX_KEY_SIZE];
 	unsigned char *key_p, *salt;
 	unsigned char ghash_h[AEAD_H_SIZE];
 	int ck_size, key_ctx_size, kctx_mackey_size, salt_size;
-	struct crypto_aes_ctx aes;
+	struct aes_enckey aes;
 	int ret;
 
 	key_ctx_size = sizeof(struct _key_ctx) +
 		       roundup(keylen, 16) + AEAD_H_SIZE;
 
@@ -289,16 +289,16 @@ static int chtls_key_info(struct chtls_sock *csk,
 	}
 
 	/* Calculate the H = CIPH(K, 0 repeated 16 times).
 	 * It will go in key context
 	 */
-	ret = aes_expandkey(&aes, key, keylen);
+	ret = aes_prepareenckey(&aes, key, keylen);
 	if (ret)
 		return ret;
 
 	memset(ghash_h, 0, AEAD_H_SIZE);
-	aes_encrypt(&aes, ghash_h, ghash_h);
+	aes_encrypt_new(&aes, ghash_h, ghash_h);
 	memzero_explicit(&aes, sizeof(aes));
 	csk->tlshws.keylen = key_ctx_size;
 
 	/* Copy the Key context */
 	if (optname == TLS_RX) {
-- 
2.52.0


