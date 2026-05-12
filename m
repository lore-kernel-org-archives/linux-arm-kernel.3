Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3152CD4F24
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 May 2026 22:44:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=61M3DMNG+oWQqxSuQprE2URgrjy5u8AgK8OgQ9rm0Ps=; b=qyUN5WoJzUYWyJDptBbQiYZa+c
	gH3b1wnHD43Rj9GytTRvMCA1A0WcUyHkKCpXKFgDDlI5TJplSOfh9QkThhrAS26ZW9rbyPV3rkoyn
	Esdk/K0SUB4im7MLjjAb4r1tWecOxtXiJXBHzgLO99nvhk7jcuNOhDt42jN3qj9n6Z+8h19+R38JV
	P+EPPV6WXc/ybaDQ7DUs+Yb6EJ55y1gLAq33hTFRM0bPZKNGx2mirdAptr6vBdjrJ+XxTMMvp3Wk+
	n5aHvOvJ9bPZyMcvtQpsd1/grH0pEw96e5OSfcK3w/xvVuUQ+/gLJo/DbinYiydspo/Z8ZqDaP5kU
	2nJ7uYhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMvpm-00000000bwk-3Nch;
	Tue, 12 May 2026 22:44:14 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMvpi-00000000buW-2Kyg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 May 2026 22:44:11 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-4493cf2f982so373912f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 May 2026 15:44:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778625849; x=1779230649; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=61M3DMNG+oWQqxSuQprE2URgrjy5u8AgK8OgQ9rm0Ps=;
        b=nzTgQnJHkvNiLsBKeYzvprRDh7nfdo0NTNtiHHT8LUpCJGy3o3wlxdnrSs+D8OuHxR
         V56IHGbrj8FhGEwHXiM8e1ocmWPCMbhjEF3aUNNDkUVgv0kLyNnoEBDQscUa9hIOqek+
         ulp1BAqTKm4grGEeZ+3I14OszPAZmBQaRUvNDTOgf9gZ6bjOB0hw49qyrP1AlOLjN89T
         5gPrUqTiFcw2Vk7Kods2FjvEC4VbXGLpRnOfwRy9bY8yLmXyhYDThP8MsCwMk3vqHQ5H
         QPWG+hDOg+Z5FTtDN5i4S+SaBr7U2W2IQhgFM+yV88q+j2nqrAGZlBHqJNCkRNWoluNn
         7SZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778625849; x=1779230649;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=61M3DMNG+oWQqxSuQprE2URgrjy5u8AgK8OgQ9rm0Ps=;
        b=r10aACkBAPU+JdVs+AZ7gPtLp1gmMzehs2M0ffpyzI22wFv0CBcDWnLTt3u1Wcf2OT
         9qVWiXqFzNkn8rKYGIVfgf2YcODQaWql9AgTEuWVvrGz6MECsZeSF/v4brr0gp5ZHzF4
         /rFEVLAUZCJ81JEh2YHGbMzZRBB/sNfHxTYI3Mk5bciqzjwfjj1L6XpDFM60NzHp0Umy
         TIQiRqGyQwnPeXOX3xa9KnuEo8E8x4LqLmoT0vo7Dcw94/VgJmlnMaXT2fHJ6onIu/en
         yOtsJOQLwxj33Vt/kjqUa5Fhe2PQU+kt0IVEo6FrRKOHyVJGTkynPuWKw4HBHqvdHxHS
         XuYg==
X-Forwarded-Encrypted: i=1; AFNElJ+LtAVrKI2/U48iTb5EjNWpmPyjAjqkGWz2yOkpklNAB3dO5Q4VKl8gD4LONIhN0lGzd6j2NWWYiS7TfAppJdjW@lists.infradead.org
X-Gm-Message-State: AOJu0YyE/v8i2Cb1KdGMhqu13Z8kk4vRPFP2Yiddi9caemv20LvUpHkq
	ofa3jNJouOTz46nGnoFEV2dvf/KIDfQVp6VVodiHIOtoBa5yUIAIFxFY
X-Gm-Gg: Acq92OH2Bv8uCyb8tNhuGq9r1hnGlqRGcKxgPonRL8kh5u5D2vi4uVS6h5YVa0WuvNu
	H7Ojbp9TSzIxW/iNs2+zYnYqeQeRb92XD/BzS8XrXqT08Q87IFOKSPsOhrVeLxixs/qFyGBLQ6J
	L4pPfsWV4hKJNlciNaC0KPZDNDMpUJXTabU80tJ6LvP80jumTC3PyHKsY85j1xpgGVI4ieSQSfc
	NfJtSCzO24RCpQ9XXlJMEVVe131+3OE65kM0M9M7Y8hz0Drdt5Rg5x5BoQcxK9fZmZZMoFIXZqo
	5jwGdGqoa8pD4UPPHjZ4/fM1hDrFnVeCMAUUHykFr+9lKhvFIxOxEBewF37NnLWla3/53OWpSTW
	k9cKaU1P3JVdVrsU7uQ4cbMyBIHBS/O/8otmBjiAgHpnD3IODu3BVom1t62FgUyVgRd3nag1CUz
	/Bossuk1Z8/3SuQs6eTXVH7yfRD6twb2eyk6VUwx/Bj4csTv6pNVKUPRPUbiJXMFMngTyl+Ad+7
	g==
X-Received: by 2002:a05:600c:3b16:b0:48a:79da:c87 with SMTP id 5b1f17b1804b1-48fc9a51444mr4274175e9.8.1778625848430;
        Tue, 12 May 2026 15:44:08 -0700 (PDT)
Received: from menon.v.cablecom.net (84-74-0-139.dclient.hispeed.ch. [84.74.0.139])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fce385ea5sm3194025e9.14.2026.05.12.15.44.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 15:44:08 -0700 (PDT)
From: Lothar Rubusch <l.rubusch@gmail.com>
To: thorsten.blum@linux.dev,
	herbert@gondor.apana.org.au,
	davem@davemloft.net,
	nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev
Cc: linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	l.rubusch@gmail.com
Subject: [PATCH 01/12] crypto: atmel - introduce shared I2C client management
Date: Tue, 12 May 2026 22:43:38 +0000
Message-Id: <20260512224349.64621-2-l.rubusch@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260512224349.64621-1-l.rubusch@gmail.com>
References: <20260512224349.64621-1-l.rubusch@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_154410_644591_A36AD0D9 
X-CRM114-Status: GOOD (  19.61  )
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

Introduce a shared I2C client management infrastructure in the
atmel-i2c core and convert the atmel-ecc and atmel-sha204a drivers
to use it.

Replace the driver-local atmel_ecc_driver_data structure with the
common atmel_i2c_mgmt instance, providing a shared client list and
locking for compatible Atmel secure element devices. Add a common
atmel_i2c_unregister_client() helper to centralize client removal
handling.

Refactor both drivers to use module_i2c_driver() and move duplicated
client list handling into the shared infrastructure. Probe and remove
paths are updated accordingly, including consistent error unwinding
for client registration failures.

Subsequent patches will build on the shared client infrastructure.

Signed-off-by: Lothar Rubusch <l.rubusch@gmail.com>
---
 drivers/crypto/atmel-ecc.c     | 58 ++++++++++++++--------------------
 drivers/crypto/atmel-i2c.c     | 15 +++++++++
 drivers/crypto/atmel-i2c.h     |  5 ++-
 drivers/crypto/atmel-sha204a.c | 38 ++++++++++++----------
 4 files changed, 65 insertions(+), 51 deletions(-)

diff --git a/drivers/crypto/atmel-ecc.c b/drivers/crypto/atmel-ecc.c
index 3738a4eb8701..cba4238735cc 100644
--- a/drivers/crypto/atmel-ecc.c
+++ b/drivers/crypto/atmel-ecc.c
@@ -23,8 +23,6 @@
 #include <crypto/kpp.h>
 #include "atmel-i2c.h"
 
-static struct atmel_ecc_driver_data driver_data;
-
 /**
  * struct atmel_ecdh_ctx - transformation context
  * @client     : pointer to i2c client device
@@ -209,14 +207,14 @@ static struct i2c_client *atmel_ecc_i2c_client_alloc(void)
 	int min_tfm_cnt = INT_MAX;
 	int tfm_cnt;
 
-	spin_lock(&driver_data.i2c_list_lock);
+	spin_lock(&atmel_i2c_mgmt.i2c_list_lock);
 
-	if (list_empty(&driver_data.i2c_client_list)) {
-		spin_unlock(&driver_data.i2c_list_lock);
+	if (list_empty(&atmel_i2c_mgmt.i2c_client_list)) {
+		spin_unlock(&atmel_i2c_mgmt.i2c_list_lock);
 		return ERR_PTR(-ENODEV);
 	}
 
-	list_for_each_entry(i2c_priv, &driver_data.i2c_client_list,
+	list_for_each_entry(i2c_priv, &atmel_i2c_mgmt.i2c_client_list,
 			    i2c_client_list_node) {
 		tfm_cnt = atomic_read(&i2c_priv->tfm_count);
 		if (tfm_cnt < min_tfm_cnt) {
@@ -232,7 +230,7 @@ static struct i2c_client *atmel_ecc_i2c_client_alloc(void)
 		client = min_i2c_priv->client;
 	}
 
-	spin_unlock(&driver_data.i2c_list_lock);
+	spin_unlock(&atmel_i2c_mgmt.i2c_list_lock);
 
 	return client;
 }
@@ -319,27 +317,34 @@ static int atmel_ecc_probe(struct i2c_client *client)
 
 	ret = atmel_i2c_probe(client);
 	if (ret)
-		return ret;
+		goto done;
 
 	i2c_priv = i2c_get_clientdata(client);
 
-	spin_lock(&driver_data.i2c_list_lock);
+	/* add to client list */
+	spin_lock(&atmel_i2c_mgmt.i2c_list_lock);
 	list_add_tail(&i2c_priv->i2c_client_list_node,
-		      &driver_data.i2c_client_list);
-	spin_unlock(&driver_data.i2c_list_lock);
+		      &atmel_i2c_mgmt.i2c_client_list);
+	spin_unlock(&atmel_i2c_mgmt.i2c_list_lock);
 
+	/* register algorithms */
 	ret = crypto_register_kpp(&atmel_ecdh_nist_p256);
 	if (ret) {
-		spin_lock(&driver_data.i2c_list_lock);
-		list_del(&i2c_priv->i2c_client_list_node);
-		spin_unlock(&driver_data.i2c_list_lock);
-
 		dev_err(&client->dev, "%s alg registration failed\n",
 			atmel_ecdh_nist_p256.base.cra_driver_name);
+		goto err_list_del;
 	} else {
 		dev_info(&client->dev, "atmel ecc algorithms registered in /proc/crypto\n");
 	}
 
+	goto done;
+
+err_list_del:
+	spin_lock(&atmel_i2c_mgmt.i2c_list_lock);
+	list_del(&i2c_priv->i2c_client_list_node);
+	spin_unlock(&atmel_i2c_mgmt.i2c_list_lock);
+
+done:
 	return ret;
 }
 
@@ -361,11 +366,10 @@ static void atmel_ecc_remove(struct i2c_client *client)
 		return;
 	}
 
-	crypto_unregister_kpp(&atmel_ecdh_nist_p256);
+	atmel_i2c_unregister_client(i2c_priv);
+	atmel_i2c_flush_queue();
 
-	spin_lock(&driver_data.i2c_list_lock);
-	list_del(&i2c_priv->i2c_client_list_node);
-	spin_unlock(&driver_data.i2c_list_lock);
+	crypto_unregister_kpp(&atmel_ecdh_nist_p256);
 }
 
 #ifdef CONFIG_OF
@@ -398,21 +402,7 @@ static struct i2c_driver atmel_ecc_driver = {
 	.id_table	= atmel_ecc_id,
 };
 
-static int __init atmel_ecc_init(void)
-{
-	spin_lock_init(&driver_data.i2c_list_lock);
-	INIT_LIST_HEAD(&driver_data.i2c_client_list);
-	return i2c_add_driver(&atmel_ecc_driver);
-}
-
-static void __exit atmel_ecc_exit(void)
-{
-	atmel_i2c_flush_queue();
-	i2c_del_driver(&atmel_ecc_driver);
-}
-
-module_init(atmel_ecc_init);
-module_exit(atmel_ecc_exit);
+module_i2c_driver(atmel_ecc_driver);
 
 MODULE_AUTHOR("Tudor Ambarus");
 MODULE_DESCRIPTION("Microchip / Atmel ECC (I2C) driver");
diff --git a/drivers/crypto/atmel-i2c.c b/drivers/crypto/atmel-i2c.c
index 0e275dbdc8c5..861af52d7a88 100644
--- a/drivers/crypto/atmel-i2c.c
+++ b/drivers/crypto/atmel-i2c.c
@@ -21,6 +21,12 @@
 #include <linux/workqueue.h>
 #include "atmel-i2c.h"
 
+struct atmel_i2c_client_mgmt atmel_i2c_mgmt = {
+	.i2c_list_lock = __SPIN_LOCK_UNLOCKED(atmel_i2c_mgmt.i2c_list_lock),
+	.i2c_client_list = LIST_HEAD_INIT(atmel_i2c_mgmt.i2c_client_list),
+};
+EXPORT_SYMBOL_GPL(atmel_i2c_mgmt);
+
 static const struct {
 	u8 value;
 	const char *error_text;
@@ -348,6 +354,15 @@ static int device_sanity_check(struct i2c_client *client)
 	return ret;
 }
 
+void atmel_i2c_unregister_client(struct atmel_i2c_client_priv *i2c_priv)
+{
+	spin_lock(&atmel_i2c_mgmt.i2c_list_lock);
+	if (!list_empty(&i2c_priv->i2c_client_list_node))
+		list_del_init(&i2c_priv->i2c_client_list_node);
+	spin_unlock(&atmel_i2c_mgmt.i2c_list_lock);
+}
+EXPORT_SYMBOL(atmel_i2c_unregister_client);
+
 int atmel_i2c_probe(struct i2c_client *client)
 {
 	struct atmel_i2c_client_priv *i2c_priv;
diff --git a/drivers/crypto/atmel-i2c.h b/drivers/crypto/atmel-i2c.h
index 72f04c15682f..43a0c1cfcd94 100644
--- a/drivers/crypto/atmel-i2c.h
+++ b/drivers/crypto/atmel-i2c.h
@@ -115,10 +115,11 @@ struct atmel_i2c_cmd {
 #define ECDH_PREFIX_MODE		0x00
 
 /* Used for binding tfm objects to i2c clients. */
-struct atmel_ecc_driver_data {
+struct atmel_i2c_client_mgmt {
 	struct list_head i2c_client_list;
 	spinlock_t i2c_list_lock;
 } ____cacheline_aligned;
+extern struct atmel_i2c_client_mgmt atmel_i2c_mgmt;
 
 /**
  * atmel_i2c_client_priv - i2c_client private data
@@ -189,4 +190,6 @@ void atmel_i2c_init_genkey_cmd(struct atmel_i2c_cmd *cmd, u16 keyid);
 int atmel_i2c_init_ecdh_cmd(struct atmel_i2c_cmd *cmd,
 			    struct scatterlist *pubkey);
 
+void atmel_i2c_unregister_client(struct atmel_i2c_client_priv *i2c_priv);
+
 #endif /* __ATMEL_I2C_H__ */
diff --git a/drivers/crypto/atmel-sha204a.c b/drivers/crypto/atmel-sha204a.c
index ed7d69bf6890..e6808c2bc891 100644
--- a/drivers/crypto/atmel-sha204a.c
+++ b/drivers/crypto/atmel-sha204a.c
@@ -169,10 +169,17 @@ static int atmel_sha204a_probe(struct i2c_client *client)
 
 	ret = atmel_i2c_probe(client);
 	if (ret)
-		return ret;
+		goto done;
 
 	i2c_priv = i2c_get_clientdata(client);
 
+	/* add to client list */
+	spin_lock(&atmel_i2c_mgmt.i2c_list_lock);
+	list_add_tail(&i2c_priv->i2c_client_list_node,
+		      &atmel_i2c_mgmt.i2c_client_list);
+	spin_unlock(&atmel_i2c_mgmt.i2c_list_lock);
+
+	/* register rng */
 	memset(&i2c_priv->hwrng, 0, sizeof(i2c_priv->hwrng));
 
 	i2c_priv->hwrng.name = dev_name(&client->dev);
@@ -183,15 +190,26 @@ static int atmel_sha204a_probe(struct i2c_client *client)
 		i2c_priv->hwrng.quality = *quality;
 
 	ret = devm_hwrng_register(&client->dev, &i2c_priv->hwrng);
-	if (ret)
+	if (ret) {
 		dev_warn(&client->dev, "failed to register RNG (%d)\n", ret);
+		goto err_list_del;
+	}
 
 	ret = sysfs_create_group(&client->dev.kobj, &atmel_sha204a_groups);
 	if (ret) {
 		dev_err(&client->dev, "failed to register sysfs entry\n");
-		return ret;
+		goto err_list_del;
 	}
 
+	goto done;
+
+err_list_del:
+	sysfs_remove_group(&client->dev.kobj, &atmel_sha204a_groups);
+	spin_lock(&atmel_i2c_mgmt.i2c_list_lock);
+	list_del(&i2c_priv->i2c_client_list_node);
+	spin_unlock(&atmel_i2c_mgmt.i2c_list_lock);
+
+done:
 	return ret;
 }
 
@@ -230,19 +248,7 @@ static struct i2c_driver atmel_sha204a_driver = {
 	.driver.of_match_table	= of_match_ptr(atmel_sha204a_dt_ids),
 };
 
-static int __init atmel_sha204a_init(void)
-{
-	return i2c_add_driver(&atmel_sha204a_driver);
-}
-
-static void __exit atmel_sha204a_exit(void)
-{
-	atmel_i2c_flush_queue();
-	i2c_del_driver(&atmel_sha204a_driver);
-}
-
-module_init(atmel_sha204a_init);
-module_exit(atmel_sha204a_exit);
+module_i2c_driver(atmel_sha204a_driver);
 
 MODULE_AUTHOR("Ard Biesheuvel <ard.biesheuvel@linaro.org>");
 MODULE_DESCRIPTION("Microchip / Atmel SHA204A (I2C) driver");
-- 
2.53.0


