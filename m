Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76E9CE9A04E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Feb 2026 21:37:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lbWuolc8F8aJdcUrouDaXcvVJpp2C+6tLNlC+DSLQwE=; b=0cg3hmQBXqRISd9nRSjiC/XlP3
	ie3UlW1mEt6LhgzkX02euVkbbiV5DcmzvxtsjM1IBg7Y2rpsmavmy6IqnPPdr35PoUeKN09ZeI6Ij
	rPiO6d1QC6UScMHewAsfxk8xdgxnr4W12uaueDqBd0FPVeWCTatLIwPmgKiOeP0y9ylaEQXzILR1+
	LiKw6XPEqlzvPi9Kf+VJZUsU5sRbovhnpmDwdvZ3n9UmiQ5bK29e1jimWREK8hT9qC0f6pnf0hSs2
	QOyhkzurS4mLccINW4yFNPlrn4sJeQ7r7qYMMq0vo4VnjhjizQW03b4DRuEzt+PDWsV4A57QVoItl
	WSXKNbNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vspEI-0000000ASZl-1zzZ;
	Wed, 18 Feb 2026 21:37:06 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vspED-0000000ASU1-003J
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Feb 2026 21:37:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2389F6185F;
	Wed, 18 Feb 2026 21:37:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C6DFC2BCB6;
	Wed, 18 Feb 2026 21:36:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771450619;
	bh=DnjzfD8UUtPv4slYL2pB1p87UHI2Kx6DNAW3W2bIPLI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=d9nC0y+8/G9755xCvbvHN7DAKjWuIifVrEaCp0dH8JCWSY/8/37cCz4/JnQuj7feq
	 7Y7XXMYb8fsKXNrT6/WTFWzZj2+yxF5NkANQMz+oVnWsBRlGJaurnowsom4L2nZ+Nm
	 Ym4oX9qP9/zITYlEI9YfMoGTwcAAe8GLr92c44TfjXeZspAAtgr7UpZoviaX5VXx+l
	 hTHXNg25Lu3VkKGAkTYbR2QA0UKgwMjm6/st6FQbn6gjOr0pWObiKLPnAoyjbmKBce
	 PfD5qahcQ+51pdMH8lVmK6F/lPHgr1QIKjnd4hk3XKjR8ng+EBDqxyIH6+mRCOeBrG
	 8eVL99dt8et3Q==
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
Subject: [PATCH 14/15] wifi: mac80211: Use AES-CMAC library in ieee80211_aes_cmac()
Date: Wed, 18 Feb 2026 13:35:00 -0800
Message-ID: <20260218213501.136844-15-ebiggers@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260218213501.136844-1-ebiggers@kernel.org>
References: <20260218213501.136844-1-ebiggers@kernel.org>
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

Now that AES-CMAC has a library API, convert the mac80211 AES-CMAC
packet authentication code to use it instead of a "cmac(aes)"
crypto_shash.  This has multiple benefits, such as:

- It's faster.  The AES-CMAC code is now called directly, without
  unnecessary overhead such as indirect calls.

- MAC calculation can no longer fail.

- The AES-CMAC key struct is now a fixed size, allowing it to be
  embedded directly into 'struct ieee80211_key' rather than using a
  separate allocation.  Note that although this increases the size of
  the 'u.cmac' field of 'struct ieee80211_key', it doesn't cause it to
  exceed the size of the largest variant of the union 'u'.  Therefore,
  the size of 'struct ieee80211_key' itself is unchanged.

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 net/mac80211/Kconfig    |  1 +
 net/mac80211/aes_cmac.c | 65 ++++++++---------------------------------
 net/mac80211/aes_cmac.h | 12 +++-----
 net/mac80211/key.c      | 11 ++-----
 net/mac80211/key.h      |  3 +-
 net/mac80211/wpa.c      | 13 +++------
 6 files changed, 26 insertions(+), 79 deletions(-)

diff --git a/net/mac80211/Kconfig b/net/mac80211/Kconfig
index cf0f7780fb10..0afbe4f4f976 100644
--- a/net/mac80211/Kconfig
+++ b/net/mac80211/Kconfig
@@ -1,10 +1,11 @@
 # SPDX-License-Identifier: GPL-2.0-only
 config MAC80211
 	tristate "Generic IEEE 802.11 Networking Stack (mac80211)"
 	depends on CFG80211
 	select CRYPTO
+	select CRYPTO_LIB_AES_CBC_MACS
 	select CRYPTO_LIB_ARC4
 	select CRYPTO_AES
 	select CRYPTO_CCM
 	select CRYPTO_GCM
 	select CRYPTO_CMAC
diff --git a/net/mac80211/aes_cmac.c b/net/mac80211/aes_cmac.c
index 0827965455dc..55b674ad7d7a 100644
--- a/net/mac80211/aes_cmac.c
+++ b/net/mac80211/aes_cmac.c
@@ -5,80 +5,39 @@
  * Copyright (C) 2020 Intel Corporation
  */
 
 #include <linux/kernel.h>
 #include <linux/types.h>
-#include <linux/crypto.h>
 #include <linux/export.h>
 #include <linux/err.h>
-#include <crypto/aes.h>
+#include <crypto/aes-cbc-macs.h>
 
 #include <net/mac80211.h>
 #include "key.h"
 #include "aes_cmac.h"
 
 #define AAD_LEN 20
 
 static const u8 zero[IEEE80211_CMAC_256_MIC_LEN];
 
-int ieee80211_aes_cmac(struct crypto_shash *tfm, const u8 *aad,
-		       const u8 *data, size_t data_len, u8 *mic,
-		       unsigned int mic_len)
+void ieee80211_aes_cmac(const struct aes_cmac_key *key, const u8 *aad,
+			const u8 *data, size_t data_len, u8 *mic,
+			unsigned int mic_len)
 {
-	int err;
-	SHASH_DESC_ON_STACK(desc, tfm);
+	struct aes_cmac_ctx ctx;
 	u8 out[AES_BLOCK_SIZE];
 	const __le16 *fc;
 
-	desc->tfm = tfm;
-
-	err = crypto_shash_init(desc);
-	if (err)
-		return err;
-	err = crypto_shash_update(desc, aad, AAD_LEN);
-	if (err)
-		return err;
+	aes_cmac_init(&ctx, key);
+	aes_cmac_update(&ctx, aad, AAD_LEN);
 	fc = (const __le16 *)aad;
 	if (ieee80211_is_beacon(*fc)) {
 		/* mask Timestamp field to zero */
-		err = crypto_shash_update(desc, zero, 8);
-		if (err)
-			return err;
-		err = crypto_shash_update(desc, data + 8,
-					  data_len - 8 - mic_len);
-		if (err)
-			return err;
+		aes_cmac_update(&ctx, zero, 8);
+		aes_cmac_update(&ctx, data + 8, data_len - 8 - mic_len);
 	} else {
-		err = crypto_shash_update(desc, data, data_len - mic_len);
-		if (err)
-			return err;
+		aes_cmac_update(&ctx, data, data_len - mic_len);
 	}
-	err = crypto_shash_finup(desc, zero, mic_len, out);
-	if (err)
-		return err;
+	aes_cmac_update(&ctx, zero, mic_len);
+	aes_cmac_final(&ctx, out);
 	memcpy(mic, out, mic_len);
-
-	return 0;
-}
-
-struct crypto_shash *ieee80211_aes_cmac_key_setup(const u8 key[],
-						  size_t key_len)
-{
-	struct crypto_shash *tfm;
-
-	tfm = crypto_alloc_shash("cmac(aes)", 0, 0);
-	if (!IS_ERR(tfm)) {
-		int err = crypto_shash_setkey(tfm, key, key_len);
-
-		if (err) {
-			crypto_free_shash(tfm);
-			return ERR_PTR(err);
-		}
-	}
-
-	return tfm;
-}
-
-void ieee80211_aes_cmac_key_free(struct crypto_shash *tfm)
-{
-	crypto_free_shash(tfm);
 }
diff --git a/net/mac80211/aes_cmac.h b/net/mac80211/aes_cmac.h
index 5f971a8298cb..c7a6df47b327 100644
--- a/net/mac80211/aes_cmac.h
+++ b/net/mac80211/aes_cmac.h
@@ -4,16 +4,12 @@
  */
 
 #ifndef AES_CMAC_H
 #define AES_CMAC_H
 
-#include <linux/crypto.h>
-#include <crypto/hash.h>
+#include <crypto/aes-cbc-macs.h>
 
-struct crypto_shash *ieee80211_aes_cmac_key_setup(const u8 key[],
-						  size_t key_len);
-int ieee80211_aes_cmac(struct crypto_shash *tfm, const u8 *aad,
-		       const u8 *data, size_t data_len, u8 *mic,
-		       unsigned int mic_len);
-void ieee80211_aes_cmac_key_free(struct crypto_shash *tfm);
+void ieee80211_aes_cmac(const struct aes_cmac_key *key, const u8 *aad,
+			const u8 *data, size_t data_len, u8 *mic,
+			unsigned int mic_len);
 
 #endif /* AES_CMAC_H */
diff --git a/net/mac80211/key.c b/net/mac80211/key.c
index 04c8809173d7..4b8965633df3 100644
--- a/net/mac80211/key.c
+++ b/net/mac80211/key.c
@@ -688,14 +688,13 @@ ieee80211_key_alloc(u32 cipher, int idx, size_t key_len,
 					seq[IEEE80211_CMAC_PN_LEN - j - 1];
 		/*
 		 * Initialize AES key state here as an optimization so that
 		 * it does not need to be initialized for every packet.
 		 */
-		key->u.aes_cmac.tfm =
-			ieee80211_aes_cmac_key_setup(key_data, key_len);
-		if (IS_ERR(key->u.aes_cmac.tfm)) {
-			err = PTR_ERR(key->u.aes_cmac.tfm);
+		err = aes_cmac_preparekey(&key->u.aes_cmac.key, key_data,
+					  key_len);
+		if (err) {
 			kfree(key);
 			return ERR_PTR(err);
 		}
 		break;
 	case WLAN_CIPHER_SUITE_BIP_GMAC_128:
@@ -748,14 +747,10 @@ static void ieee80211_key_free_common(struct ieee80211_key *key)
 	switch (key->conf.cipher) {
 	case WLAN_CIPHER_SUITE_CCMP:
 	case WLAN_CIPHER_SUITE_CCMP_256:
 		ieee80211_aes_key_free(key->u.ccmp.tfm);
 		break;
-	case WLAN_CIPHER_SUITE_AES_CMAC:
-	case WLAN_CIPHER_SUITE_BIP_CMAC_256:
-		ieee80211_aes_cmac_key_free(key->u.aes_cmac.tfm);
-		break;
 	case WLAN_CIPHER_SUITE_BIP_GMAC_128:
 	case WLAN_CIPHER_SUITE_BIP_GMAC_256:
 		ieee80211_aes_gmac_key_free(key->u.aes_gmac.tfm);
 		break;
 	case WLAN_CIPHER_SUITE_GCMP:
diff --git a/net/mac80211/key.h b/net/mac80211/key.h
index 1fa0f4f78962..826e4e9387c5 100644
--- a/net/mac80211/key.h
+++ b/net/mac80211/key.h
@@ -10,10 +10,11 @@
 
 #include <linux/types.h>
 #include <linux/list.h>
 #include <linux/crypto.h>
 #include <linux/rcupdate.h>
+#include <crypto/aes-cbc-macs.h>
 #include <crypto/arc4.h>
 #include <net/mac80211.h>
 
 #define NUM_DEFAULT_KEYS 4
 #define NUM_DEFAULT_MGMT_KEYS 2
@@ -91,11 +92,11 @@ struct ieee80211_key {
 			struct crypto_aead *tfm;
 			u32 replays; /* dot11RSNAStatsCCMPReplays */
 		} ccmp;
 		struct {
 			u8 rx_pn[IEEE80211_CMAC_PN_LEN];
-			struct crypto_shash *tfm;
+			struct aes_cmac_key key;
 			u32 replays; /* dot11RSNAStatsCMACReplays */
 			u32 icverrors; /* dot11RSNAStatsCMACICVErrors */
 		} aes_cmac;
 		struct {
 			u8 rx_pn[IEEE80211_GMAC_PN_LEN];
diff --git a/net/mac80211/wpa.c b/net/mac80211/wpa.c
index fdf98c21d32c..59324b367bdd 100644
--- a/net/mac80211/wpa.c
+++ b/net/mac80211/wpa.c
@@ -870,15 +870,12 @@ ieee80211_crypto_aes_cmac_encrypt(struct ieee80211_tx_data *tx,
 	if (info->control.hw_key)
 		return TX_CONTINUE;
 
 	bip_aad(skb, aad);
 
-	if (ieee80211_aes_cmac(key->u.aes_cmac.tfm, aad,
-			       skb->data + 24, skb->len - 24,
-			       mmie->mic, mic_len))
-		return TX_DROP;
-
+	ieee80211_aes_cmac(&key->u.aes_cmac.key, aad, skb->data + 24,
+			   skb->len - 24, mmie->mic, mic_len);
 	return TX_CONTINUE;
 }
 
 ieee80211_rx_result
 ieee80211_crypto_aes_cmac_decrypt(struct ieee80211_rx_data *rx,
@@ -916,14 +913,12 @@ ieee80211_crypto_aes_cmac_decrypt(struct ieee80211_rx_data *rx,
 	}
 
 	if (!(status->flag & RX_FLAG_DECRYPTED)) {
 		/* hardware didn't decrypt/verify MIC */
 		bip_aad(skb, aad);
-		if (ieee80211_aes_cmac(key->u.aes_cmac.tfm, aad,
-				       skb->data + 24, skb->len - 24,
-				       mic, mic_len))
-			return RX_DROP_U_DECRYPT_FAIL;
+		ieee80211_aes_cmac(&key->u.aes_cmac.key, aad, skb->data + 24,
+				   skb->len - 24, mic, mic_len);
 		if (crypto_memneq(mic, mmie->mic, mic_len)) {
 			key->u.aes_cmac.icverrors++;
 			return RX_DROP_U_MIC_FAIL;
 		}
 	}
-- 
2.53.0


