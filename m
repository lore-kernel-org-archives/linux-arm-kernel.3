Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60481E9A04D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Feb 2026 21:37:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=htsSD+LMDU2t4Z1iKdiP8cz7dGYB87T3HgzCybits84=; b=jLcN/le8NDc/Jz7t2MeNMjCwOq
	7pBV5Sffc0jHseJVaU+r/SPyqkbpTSzJ9ApB43szWGhWz3zYiqC0jIhVPab2EgtNPwOtuy9aCmDJ2
	6gqaP7GvGsf7Ko09u/1zFQfmf65iANYJlch14dvlZbmxIDLvhgayE/gfTY2CivW+WqYBAnX2nomUI
	j7u42r97eVSGdczKWl6Q49cnId/2O1fE8WIHBJtqXgM+9cEDXLystKbvMm/pmbFjVY3+JPLLJi5w/
	kVIKsMb6UyZo2RJPIOXE2jTftLFGv/ajqtKVasOLQ117sKdx78PSdSMI+Raz5bEC7gA9IOGM8Tpa+
	Tzja/qRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vspEI-0000000ASaD-3NEl;
	Wed, 18 Feb 2026 21:37:06 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vspED-0000000ASUA-0t9v
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Feb 2026 21:37:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DE7414396D;
	Wed, 18 Feb 2026 21:37:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2924C2BCB4;
	Wed, 18 Feb 2026 21:36:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771450620;
	bh=MukATPOpIzjauahsnyw5/LgkOoeHj4ze2Fz2UAEw0rw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=S7cvUUs2MbPHShNzMReODOXXx0055P+B5i6wUSiG6e9WEN6m6eioCUpXWfIz4SPHd
	 o2Jp/TgF7O6k4rs3A3NJzK32Pj7x0O9bWs75sgyw05p+8QPHl6J3iXMMcY2J/BSv03
	 pBovcGwo2XyB8w7WI+rZziQRib7Q7PXdefsaQDZORQah7mhr+W2KC+iVMfIJnwzjTn
	 Wv2DoQtvp6FRV+kUAeWFOybO9Ojm9HEgHVDla4zh2fQOJnhZTDqYNKySvsx6PNr4D4
	 lDUbu1wGNmXaGuU4e3y2JDb25S/GbeOLp7/b1VANEkR53N572/mF3aKaK96nxZXrDo
	 gYvDPt8fT+elQ==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	linux-arm-kernel@lists.infradead.org,
	linux-cifs@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	Eric Biggers <ebiggers@kernel.org>
Subject: [PATCH 15/15] wifi: mac80211: Use AES-CMAC library in aes_s2v()
Date: Wed, 18 Feb 2026 13:35:01 -0800
Message-ID: <20260218213501.136844-16-ebiggers@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260218213501.136844-1-ebiggers@kernel.org>
References: <20260218213501.136844-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260218_133701_289153_9F8F1E61 
X-CRM114-Status: GOOD (  18.67  )
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

Now that AES-CMAC has a library API, convert aes_s2v() to use it instead
of a "cmac(aes)" crypto_shash.  The result is faster and simpler code.

It's also more reliable, since with the library the only step that can
fail is preparing the key.  In contrast, crypto_shash_digest(),
crypto_shash_init(), crypto_shash_update(), and crypto_shash_final()
could all fail and return an errno value.  aes_s2v() ignored these
errors, which was a bug.  So that bug is fixed as well.

As part of this, change the prototype of aes_s2v() to take the raw key
directly instead of a prepared key.  Its only two callers prepare a key
for each call, so it might as well be done directly in aes_s2v().

Since this removes the last dependency on the "cmac(aes)" crypto_shash
from mac80211, also remove the 'select CRYPTO_CMAC'.

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 net/mac80211/Kconfig     |  1 -
 net/mac80211/fils_aead.c | 48 ++++++++++++++--------------------------
 2 files changed, 17 insertions(+), 32 deletions(-)

diff --git a/net/mac80211/Kconfig b/net/mac80211/Kconfig
index 0afbe4f4f976..d6bc295e23a1 100644
--- a/net/mac80211/Kconfig
+++ b/net/mac80211/Kconfig
@@ -6,11 +6,10 @@ config MAC80211
 	select CRYPTO_LIB_AES_CBC_MACS
 	select CRYPTO_LIB_ARC4
 	select CRYPTO_AES
 	select CRYPTO_CCM
 	select CRYPTO_GCM
-	select CRYPTO_CMAC
 	select CRC32
 	help
 	  This option enables the hardware independent IEEE 802.11
 	  networking stack.
 
diff --git a/net/mac80211/fils_aead.c b/net/mac80211/fils_aead.c
index 912c46f74d24..d2f4a17eab99 100644
--- a/net/mac80211/fils_aead.c
+++ b/net/mac80211/fils_aead.c
@@ -2,17 +2,15 @@
 /*
  * FILS AEAD for (Re)Association Request/Response frames
  * Copyright 2016, Qualcomm Atheros, Inc.
  */
 
-#include <crypto/aes.h>
-#include <crypto/hash.h>
+#include <crypto/aes-cbc-macs.h>
 #include <crypto/skcipher.h>
 #include <crypto/utils.h>
 
 #include "ieee80211_i.h"
-#include "aes_cmac.h"
 #include "fils_aead.h"
 
 static void gf_mulx(u8 *pad)
 {
 	u64 a = get_unaligned_be64(pad);
@@ -20,58 +18,63 @@ static void gf_mulx(u8 *pad)
 
 	put_unaligned_be64((a << 1) | (b >> 63), pad);
 	put_unaligned_be64((b << 1) ^ ((a >> 63) ? 0x87 : 0), pad + 8);
 }
 
-static int aes_s2v(struct crypto_shash *tfm,
+static int aes_s2v(const u8 *in_key, size_t key_len,
 		   size_t num_elem, const u8 *addr[], size_t len[], u8 *v)
 {
 	u8 d[AES_BLOCK_SIZE], tmp[AES_BLOCK_SIZE] = {};
-	SHASH_DESC_ON_STACK(desc, tfm);
+	struct aes_cmac_key key;
+	struct aes_cmac_ctx ctx;
 	size_t i;
+	int res;
 
-	desc->tfm = tfm;
+	res = aes_cmac_preparekey(&key, in_key, key_len);
+	if (res)
+		return res;
 
 	/* D = AES-CMAC(K, <zero>) */
-	crypto_shash_digest(desc, tmp, AES_BLOCK_SIZE, d);
+	aes_cmac(&key, tmp, AES_BLOCK_SIZE, d);
 
 	for (i = 0; i < num_elem - 1; i++) {
 		/* D = dbl(D) xor AES_CMAC(K, Si) */
 		gf_mulx(d); /* dbl */
-		crypto_shash_digest(desc, addr[i], len[i], tmp);
+		aes_cmac(&key, addr[i], len[i], tmp);
 		crypto_xor(d, tmp, AES_BLOCK_SIZE);
 	}
 
-	crypto_shash_init(desc);
+	aes_cmac_init(&ctx, &key);
 
 	if (len[i] >= AES_BLOCK_SIZE) {
 		/* len(Sn) >= 128 */
 		/* T = Sn xorend D */
-		crypto_shash_update(desc, addr[i], len[i] - AES_BLOCK_SIZE);
+		aes_cmac_update(&ctx, addr[i], len[i] - AES_BLOCK_SIZE);
 		crypto_xor(d, addr[i] + len[i] - AES_BLOCK_SIZE,
 			   AES_BLOCK_SIZE);
 	} else {
 		/* len(Sn) < 128 */
 		/* T = dbl(D) xor pad(Sn) */
 		gf_mulx(d); /* dbl */
 		crypto_xor(d, addr[i], len[i]);
 		d[len[i]] ^= 0x80;
 	}
 	/* V = AES-CMAC(K, T) */
-	crypto_shash_finup(desc, d, AES_BLOCK_SIZE, v);
+	aes_cmac_update(&ctx, d, AES_BLOCK_SIZE);
+	aes_cmac_final(&ctx, v);
 
+	memzero_explicit(&key, sizeof(key));
 	return 0;
 }
 
 /* Note: addr[] and len[] needs to have one extra slot at the end. */
 static int aes_siv_encrypt(const u8 *key, size_t key_len,
 			   const u8 *plain, size_t plain_len,
 			   size_t num_elem, const u8 *addr[],
 			   size_t len[], u8 *out)
 {
 	u8 v[AES_BLOCK_SIZE];
-	struct crypto_shash *tfm;
 	struct crypto_skcipher *tfm2;
 	struct skcipher_request *req;
 	int res;
 	struct scatterlist src[1], dst[1];
 	u8 *tmp;
@@ -81,19 +84,11 @@ static int aes_siv_encrypt(const u8 *key, size_t key_len,
 	addr[num_elem] = plain;
 	len[num_elem] = plain_len;
 	num_elem++;
 
 	/* S2V */
-
-	tfm = crypto_alloc_shash("cmac(aes)", 0, 0);
-	if (IS_ERR(tfm))
-		return PTR_ERR(tfm);
-	/* K1 for S2V */
-	res = crypto_shash_setkey(tfm, key, key_len);
-	if (!res)
-		res = aes_s2v(tfm, num_elem, addr, len, v);
-	crypto_free_shash(tfm);
+	res = aes_s2v(key /* K1 */, key_len, num_elem, addr, len, v);
 	if (res)
 		return res;
 
 	/* Use a temporary buffer of the plaintext to handle need for
 	 * overwriting this during AES-CTR.
@@ -144,11 +139,10 @@ static int aes_siv_encrypt(const u8 *key, size_t key_len,
 static int aes_siv_decrypt(const u8 *key, size_t key_len,
 			   const u8 *iv_crypt, size_t iv_c_len,
 			   size_t num_elem, const u8 *addr[], size_t len[],
 			   u8 *out)
 {
-	struct crypto_shash *tfm;
 	struct crypto_skcipher *tfm2;
 	struct skcipher_request *req;
 	struct scatterlist src[1], dst[1];
 	size_t crypt_len;
 	int res;
@@ -196,19 +190,11 @@ static int aes_siv_decrypt(const u8 *key, size_t key_len,
 	crypto_free_skcipher(tfm2);
 	if (res)
 		return res;
 
 	/* S2V */
-
-	tfm = crypto_alloc_shash("cmac(aes)", 0, 0);
-	if (IS_ERR(tfm))
-		return PTR_ERR(tfm);
-	/* K1 for S2V */
-	res = crypto_shash_setkey(tfm, key, key_len);
-	if (!res)
-		res = aes_s2v(tfm, num_elem, addr, len, check);
-	crypto_free_shash(tfm);
+	res = aes_s2v(key /* K1 */, key_len, num_elem, addr, len, check);
 	if (res)
 		return res;
 	if (memcmp(check, frame_iv, AES_BLOCK_SIZE) != 0)
 		return -EINVAL;
 	return 0;
-- 
2.53.0


