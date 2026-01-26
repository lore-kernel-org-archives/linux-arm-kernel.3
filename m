Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 528D3D19502
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jan 2026 17:47:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MV7oBX2Ps45Ldknxm+5EalQaAccqqOFLOMB9j7YB/XU=; b=ip6IrKlsLqmwxqYHJQb7Sgw60F
	jcJ9PbBtv2lrqfYvXOSvDvSI3Y4Z3ihflV/0mBerGXd0l2wyx8R3L1hkcGRqiVpzHNF+amexm+6HE
	4LkD2pul0AeO44Hng+66JEjpOIqfh1EgY4EQPwb4RM2qqnsZ0OAYtdg4MjTZ5rVDQoBy2GGl1Yqci
	BQ5jOuZkTiBM23SvudxfO4oqHmhJgiRQCF87bWKNDYSxqTiE5oT0bzHMnYKJHAdHxngKrMemJwcnS
	ULX7KKCCBY+bVERgOuFzZSvxL6qeiqctshkvteDC69raoT3WOe8aTUsv9jPfh4MybTQHNAevCHh8L
	zSk64tVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkQgJ-0000000D0Wg-1Syx;
	Mon, 26 Jan 2026 17:47:19 +0000
Received: from out-170.mta0.migadu.com ([2001:41d0:1004:224b::aa])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkQgG-0000000D0W6-39Dd
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Jan 2026 17:47:18 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1769449632;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=MV7oBX2Ps45Ldknxm+5EalQaAccqqOFLOMB9j7YB/XU=;
	b=jmD2e4vQejkA5I1i4sNN5tDqDDvmEhkLZFy0ZQCotRQRZ7OPjzKjVqDQ6KZyuYKlLDryeD
	6v3lC9aWpsMoOuazyCU0wmuZndRKZBeuPK5lenD+NoJjhzTnLXzfINqAV/IlbuhfAveryw
	DrfVKEH1qNJWwGhktnzoU4f+4jIXapI=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] crypto: atmel - Use unregister_{aeads,ahashes,skciphers}
Date: Mon, 26 Jan 2026 18:47:03 +0100
Message-ID: <20260126174704.237141-1-thorsten.blum@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_094716_932019_23D62D7F 
X-CRM114-Status: GOOD (  14.14  )
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

Replace multiple for loops with calls to crypto_unregister_aeads(),
crypto_unregister_ahashes(), and crypto_unregister_skciphers().

Remove the definition of atmel_tdes_unregister_algs() because it is
equivalent to calling crypto_unregister_skciphers() directly, and the
function parameter 'struct atmel_tdes_dev *' is unused anyway.

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 drivers/crypto/atmel-aes.c  | 17 ++++++-----------
 drivers/crypto/atmel-sha.c  | 27 ++++++++++-----------------
 drivers/crypto/atmel-tdes.c | 25 ++++++-------------------
 3 files changed, 22 insertions(+), 47 deletions(-)

diff --git a/drivers/crypto/atmel-aes.c b/drivers/crypto/atmel-aes.c
index 3a2684208dda..bc0c40f10944 100644
--- a/drivers/crypto/atmel-aes.c
+++ b/drivers/crypto/atmel-aes.c
@@ -2201,12 +2201,10 @@ static irqreturn_t atmel_aes_irq(int irq, void *dev_id)
 
 static void atmel_aes_unregister_algs(struct atmel_aes_dev *dd)
 {
-	int i;
-
 #if IS_ENABLED(CONFIG_CRYPTO_DEV_ATMEL_AUTHENC)
 	if (dd->caps.has_authenc)
-		for (i = 0; i < ARRAY_SIZE(aes_authenc_algs); i++)
-			crypto_unregister_aead(&aes_authenc_algs[i]);
+		crypto_unregister_aeads(aes_authenc_algs,
+					ARRAY_SIZE(aes_authenc_algs));
 #endif
 
 	if (dd->caps.has_xts)
@@ -2215,8 +2213,7 @@ static void atmel_aes_unregister_algs(struct atmel_aes_dev *dd)
 	if (dd->caps.has_gcm)
 		crypto_unregister_aead(&aes_gcm_alg);
 
-	for (i = 0; i < ARRAY_SIZE(aes_algs); i++)
-		crypto_unregister_skcipher(&aes_algs[i]);
+	crypto_unregister_skciphers(aes_algs, ARRAY_SIZE(aes_algs));
 }
 
 static void atmel_aes_crypto_alg_init(struct crypto_alg *alg)
@@ -2229,7 +2226,7 @@ static void atmel_aes_crypto_alg_init(struct crypto_alg *alg)
 
 static int atmel_aes_register_algs(struct atmel_aes_dev *dd)
 {
-	int err, i, j;
+	int err, i;
 
 	for (i = 0; i < ARRAY_SIZE(aes_algs); i++) {
 		atmel_aes_crypto_alg_init(&aes_algs[i].base);
@@ -2272,8 +2269,7 @@ static int atmel_aes_register_algs(struct atmel_aes_dev *dd)
 #if IS_ENABLED(CONFIG_CRYPTO_DEV_ATMEL_AUTHENC)
 	/* i = ARRAY_SIZE(aes_authenc_algs); */
 err_aes_authenc_alg:
-	for (j = 0; j < i; j++)
-		crypto_unregister_aead(&aes_authenc_algs[j]);
+	crypto_unregister_aeads(aes_authenc_algs, i);
 	crypto_unregister_skcipher(&aes_xts_alg);
 #endif
 err_aes_xts_alg:
@@ -2281,8 +2277,7 @@ static int atmel_aes_register_algs(struct atmel_aes_dev *dd)
 err_aes_gcm_alg:
 	i = ARRAY_SIZE(aes_algs);
 err_aes_algs:
-	for (j = 0; j < i; j++)
-		crypto_unregister_skcipher(&aes_algs[j]);
+	crypto_unregister_skciphers(aes_algs, i);
 
 	return err;
 }
diff --git a/drivers/crypto/atmel-sha.c b/drivers/crypto/atmel-sha.c
index 3d7573c7bd1c..b02a71061708 100644
--- a/drivers/crypto/atmel-sha.c
+++ b/drivers/crypto/atmel-sha.c
@@ -2418,27 +2418,23 @@ EXPORT_SYMBOL_GPL(atmel_sha_authenc_abort);
 
 static void atmel_sha_unregister_algs(struct atmel_sha_dev *dd)
 {
-	int i;
-
 	if (dd->caps.has_hmac)
-		for (i = 0; i < ARRAY_SIZE(sha_hmac_algs); i++)
-			crypto_unregister_ahash(&sha_hmac_algs[i]);
+		crypto_unregister_ahashes(sha_hmac_algs,
+					  ARRAY_SIZE(sha_hmac_algs));
 
-	for (i = 0; i < ARRAY_SIZE(sha_1_256_algs); i++)
-		crypto_unregister_ahash(&sha_1_256_algs[i]);
+	crypto_unregister_ahashes(sha_1_256_algs, ARRAY_SIZE(sha_1_256_algs));
 
 	if (dd->caps.has_sha224)
 		crypto_unregister_ahash(&sha_224_alg);
 
-	if (dd->caps.has_sha_384_512) {
-		for (i = 0; i < ARRAY_SIZE(sha_384_512_algs); i++)
-			crypto_unregister_ahash(&sha_384_512_algs[i]);
-	}
+	if (dd->caps.has_sha_384_512)
+		crypto_unregister_ahashes(sha_384_512_algs,
+					  ARRAY_SIZE(sha_384_512_algs));
 }
 
 static int atmel_sha_register_algs(struct atmel_sha_dev *dd)
 {
-	int err, i, j;
+	int err, i;
 
 	for (i = 0; i < ARRAY_SIZE(sha_1_256_algs); i++) {
 		atmel_sha_alg_init(&sha_1_256_algs[i]);
@@ -2480,18 +2476,15 @@ static int atmel_sha_register_algs(struct atmel_sha_dev *dd)
 
 	/*i = ARRAY_SIZE(sha_hmac_algs);*/
 err_sha_hmac_algs:
-	for (j = 0; j < i; j++)
-		crypto_unregister_ahash(&sha_hmac_algs[j]);
+	crypto_unregister_ahashes(sha_hmac_algs, i);
 	i = ARRAY_SIZE(sha_384_512_algs);
 err_sha_384_512_algs:
-	for (j = 0; j < i; j++)
-		crypto_unregister_ahash(&sha_384_512_algs[j]);
+	crypto_unregister_ahashes(sha_384_512_algs, i);
 	crypto_unregister_ahash(&sha_224_alg);
 err_sha_224_algs:
 	i = ARRAY_SIZE(sha_1_256_algs);
 err_sha_1_256_algs:
-	for (j = 0; j < i; j++)
-		crypto_unregister_ahash(&sha_1_256_algs[j]);
+	crypto_unregister_ahashes(sha_1_256_algs, i);
 
 	return err;
 }
diff --git a/drivers/crypto/atmel-tdes.c b/drivers/crypto/atmel-tdes.c
index 3b2a92029b16..278c0df3c92f 100644
--- a/drivers/crypto/atmel-tdes.c
+++ b/drivers/crypto/atmel-tdes.c
@@ -897,38 +897,25 @@ static irqreturn_t atmel_tdes_irq(int irq, void *dev_id)
 	return IRQ_NONE;
 }
 
-static void atmel_tdes_unregister_algs(struct atmel_tdes_dev *dd)
-{
-	int i;
-
-	for (i = 0; i < ARRAY_SIZE(tdes_algs); i++)
-		crypto_unregister_skcipher(&tdes_algs[i]);
-}
-
 static int atmel_tdes_register_algs(struct atmel_tdes_dev *dd)
 {
-	int err, i, j;
+	int err, i;
 
 	for (i = 0; i < ARRAY_SIZE(tdes_algs); i++) {
 		atmel_tdes_skcipher_alg_init(&tdes_algs[i]);
 
 		err = crypto_register_skcipher(&tdes_algs[i]);
-		if (err)
-			goto err_tdes_algs;
+		if (err) {
+			crypto_unregister_skciphers(tdes_algs, i);
+			return err;
+		}
 	}
 
 	return 0;
-
-err_tdes_algs:
-	for (j = 0; j < i; j++)
-		crypto_unregister_skcipher(&tdes_algs[j]);
-
-	return err;
 }
 
 static void atmel_tdes_get_cap(struct atmel_tdes_dev *dd)
 {
-
 	dd->caps.has_dma = 0;
 
 	/* keep only major version number */
@@ -1061,7 +1048,7 @@ static void atmel_tdes_remove(struct platform_device *pdev)
 	list_del(&tdes_dd->list);
 	spin_unlock(&atmel_tdes.lock);
 
-	atmel_tdes_unregister_algs(tdes_dd);
+	crypto_unregister_skciphers(tdes_algs, ARRAY_SIZE(tdes_algs));
 
 	tasklet_kill(&tdes_dd->done_task);
 	tasklet_kill(&tdes_dd->queue_task);
-- 
Thorsten Blum <thorsten.blum@linux.dev>
GPG: 1D60 735E 8AEF 3BE4 73B6  9D84 7336 78FD 8DFE EAD4


