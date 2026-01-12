Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 669F0CF45C5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Jan 2026 19:25:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DQ7M/QwofijnhNwqbcHQFefUTFJMWmyUFt4ledmWH3g=; b=456bSdjZPWi4WiApyHoVt6wlIn
	J1rC+sTuNy/MDOCAgUUHNk4Xjo/lU4I4PrcjHvDaX6w37d9rslmNqMvHBp42hDWSETJn/Rb5mP5kM
	+0+x6IXeprnzzRWdCB4Ethy3VQw7/Tfx25ELMLG7HvzcI+Qom2mFB6wkyt6lYOJ+jxyL62KU/qQnV
	IAb8PhiwB3SmjnP9GIj1q1eIXFLp055TiXk9Q/SIG0C00epxCxI7ApmtzDEpce5h2gIgbCgIOeuzG
	vAYoKhjqUAnhkDJCySOfQT7tjAPsp5p9JV8l0fXQVpEuN7E7KQH05AUFD/5mKQq+g/bHOx9w1JRLm
	RBCEHXcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfNWw-000000060jm-1mnr;
	Mon, 12 Jan 2026 19:24:46 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfNVh-00000005z5K-3Mua;
	Mon, 12 Jan 2026 19:23:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3AEA960097;
	Mon, 12 Jan 2026 19:23:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85F11C16AAE;
	Mon, 12 Jan 2026 19:23:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768245808;
	bh=xvx6Irt7McLpPRJvPxDb3Q6MTwdCsiaMbdNL/psBoQw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Ztmz/OJnF9izXz1+11a8n8ue1FadL6xEIAIHmPJpOtWbTN9uLhp38Q5NZMtTNf8aL
	 u+iSqUH9pU6VIiYWo3gzNM1xlS7YKdPMY9mbRVfzMqa37dHo65ZjmMu6p85wAVEdAY
	 bQMwsA23bhIBlPgkuOxsETreww86x/B0/6WYH68Jh94Fyw9pYwW3UUwNKqizt117J0
	 rxn9PbiGHKUJG859mT4+TqPx0KqNAsb4uGSAm+xwEXDfk1F4iQHO7xwvILfXd2sTKF
	 8or8T+eKsv4Mt8hE/RXUc9xdpUYb3qL0VJQMVSdcMV8FUB8VLen/q5RT2A26UjvjRw
	 rPnOlNCQe1Y7w==
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
Subject: [PATCH v2 20/35] chelsio: Use new AES library API
Date: Mon, 12 Jan 2026 11:20:18 -0800
Message-ID: <20260112192035.10427-21-ebiggers@kernel.org>
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

Acked-by: Ard Biesheuvel <ardb@kernel.org>
Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 .../ethernet/chelsio/inline_crypto/ch_ipsec/chcr_ipsec.c  | 4 ++--
 .../ethernet/chelsio/inline_crypto/ch_ktls/chcr_ktls.c    | 8 ++++----
 .../net/ethernet/chelsio/inline_crypto/chtls/chtls_hw.c   | 4 ++--
 3 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/net/ethernet/chelsio/inline_crypto/ch_ipsec/chcr_ipsec.c b/drivers/net/ethernet/chelsio/inline_crypto/ch_ipsec/chcr_ipsec.c
index 49b57bb5fac1..074717d4bb16 100644
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
@@ -202,11 +202,11 @@ static int ch_ipsec_setkey(struct xfrm_state *x,
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
diff --git a/drivers/net/ethernet/chelsio/inline_crypto/ch_ktls/chcr_ktls.c b/drivers/net/ethernet/chelsio/inline_crypto/ch_ktls/chcr_ktls.c
index 4e2096e49684..b8ebb56de65e 100644
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
+	aes_encrypt(&aes, ghash_h, ghash_h);
+	memzero_explicit(&aes, sizeof(aes));
 
 	/* fill the Key context */
 	if (direction == TLS_OFFLOAD_CTX_DIR_TX) {
 		kctx->ctx_hdr = FILL_KEY_CTX_HDR(ck_size,
 						 mac_key_size,
diff --git a/drivers/net/ethernet/chelsio/inline_crypto/chtls/chtls_hw.c b/drivers/net/ethernet/chelsio/inline_crypto/chtls/chtls_hw.c
index fab6df21f01c..d84473ca844d 100644
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
 
@@ -289,11 +289,11 @@ static int chtls_key_info(struct chtls_sock *csk,
 	}
 
 	/* Calculate the H = CIPH(K, 0 repeated 16 times).
 	 * It will go in key context
 	 */
-	ret = aes_expandkey(&aes, key, keylen);
+	ret = aes_prepareenckey(&aes, key, keylen);
 	if (ret)
 		return ret;
 
 	memset(ghash_h, 0, AEAD_H_SIZE);
 	aes_encrypt(&aes, ghash_h, ghash_h);
-- 
2.52.0


