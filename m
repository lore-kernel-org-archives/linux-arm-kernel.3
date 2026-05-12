Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17599CD343F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 May 2026 22:44:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9RwkhAyGo0F1Zzezeg5ARZljvoevw6uxnTcs7DFl6kQ=; b=nJmGZvBX7tNt5rh5JI1Ty0Hvbe
	eyONKbyw1vpVgzqLl+5Te+36Xl6VUWQqJfRa0w5dH7UGoWzCfU+Sc11mUyu92Bt8kcAWANlJffHl6
	janSe29G8cQCx5KaCo+KlVUaRQjyOCOwc5jUZVu0OvmwHUCIrmlm5LKy3ia8DNePr4zYbs8ABe8hc
	4xn1JNP3O92X8LtSJF2R964Gcxn+FBRXbs9gRDjTRb6LECcdC3MTdLs1K8e6j6ejT3C9EZ6yXsGch
	khrEn7F+XS56ZoUfnrhp1XQxXkp2Ux15889ZjR40jdWcyUns9n8NtR7Qg8GIxTqc6rtZBpyVbknYJ
	vh+waKzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMvpm-00000000bwp-3qzY;
	Tue, 12 May 2026 22:44:14 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMvpj-00000000buq-2HEf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 May 2026 22:44:12 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4891b02a0acso6258245e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 May 2026 15:44:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778625850; x=1779230650; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9RwkhAyGo0F1Zzezeg5ARZljvoevw6uxnTcs7DFl6kQ=;
        b=f8lziEW/39/pVuaP3twTGccPmqvZCpBPtUoHG3VbhMJLV80822MJDV3rftOJwMWJEp
         UG+zH+O193ULFmYREszfMlwooCxbHnyhnTW4bqotfdKvW+aemKvgecog+O2RCAxxpgZB
         2c2gEAVLzT8cLSeF/ujbFwpeJd9BiAkHs0uwi+CwdxEE3dQVlmvKT97lo19bhiByF2TK
         wf8DgPn1ORuauUee5vQK1rybFzAYAlfbG2D9CnZmCiNo9H7lhPB19JxqB77+YKZHD9MR
         cMz7TpV2yo7KgMAvrkshME9gwreb7XAXanH1+GPa4kgIyjzBL1CT0EFCsst8xpLQDQ8M
         xBvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778625850; x=1779230650;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9RwkhAyGo0F1Zzezeg5ARZljvoevw6uxnTcs7DFl6kQ=;
        b=kuhl0zIy8niCl7RiJRRAjUyJ/L5n6fkEK8ILEDHbgROm6Xp2xcg30DaaeR7NWZ3t8B
         QRHks9FqoiVYIPJ7hyudTBAeVwE1TIz9pMV1bDAhUr95CCOuDowDuJ6Kn3R5aBnIuJx2
         tVNAmZ/W34ZjGEqUVsGUu6R8mxuJrw3XQh5dKHuoR27Z5a1Qly/Yb0RoH3nfnuI6TaZ8
         HMM0xAA4O+ST89rWGeqmlJimO23PY2r1Fwd0W4rKCmHoB8DXsY47mdmIs/ZMmsE/MjZd
         2s5B4ESdT7MSXqttJv/+w6LGBvlPxj8rZF8ZtKrwhmu95vBII05MKi/k4AiCdPezGFJW
         iOhg==
X-Forwarded-Encrypted: i=1; AFNElJ86ntmjWmRYj/11zqkpbAm+V7u0x3bX8nzaISO5xrLW+b5SktOALjOwjsGIKIFfzAy7PBs5UKfjgmqh6SKr+5Ra@lists.infradead.org
X-Gm-Message-State: AOJu0YwzolK9VS/8EKN7ntVSCjEAAgo3Xgq65bKuOIiEioG4NnRrjMSx
	PQzY53rJAO/aSlQWRK6rf+lwAX5QOG1jhrw7snXP26YmqGqdxlUzs6Iu
X-Gm-Gg: Acq92OEZEqqFP9HqWJU6u0RyL7tisSA7CUHxcxeePrbimOQKH4mB752W6D0T9eC0VJm
	wkrbetpdEFI5SEDzir95SlARHEeJX6MtfKMfM/r+mn2bAoWugDb58BOpqYBRJkXHuSEC/nuDUeW
	brpMuA6Y5q+WzIrbnnzkR9yT96vORdvPSRpiiuRGkLUx5isyl8CS8dZhVBajHORn9mUXN6emihJ
	rEm+GAAGlkBWw6cBiDwz1Cpbgal0I5swlMZW3dPzKwJeT19hDvRVNdnaVfoTvy02+c/C2c1HutA
	FwYYmC0E/17AZzkVh7Xp+Zg3OzzNy1YL6wujF9NLUEul8eDuOgv3hTii0Awu5fHPc3p2ptpFXYF
	hRFY+yOX7weOCyoLFUfMIEVYz/y8AthEdX+08KnjRElu7IJvPRKZh9z19WByJ72pJZeWwUoChnr
	d7Pw2Mb3vylNFGq1PEvZb0lZPovbR+o2CQyrdJP/zouArOojPutAWAbmHPUhcT8Lw=
X-Received: by 2002:a05:600c:19ce:b0:488:a797:f099 with SMTP id 5b1f17b1804b1-48fc9a34585mr5290375e9.3.1778625849440;
        Tue, 12 May 2026 15:44:09 -0700 (PDT)
Received: from menon.v.cablecom.net (84-74-0-139.dclient.hispeed.ch. [84.74.0.139])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fce385ea5sm3194025e9.14.2026.05.12.15.44.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 15:44:09 -0700 (PDT)
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
Subject: [PATCH 02/12] crypto: atmel - move capability-based client allocation into i2c core
Date: Tue, 12 May 2026 22:43:39 +0000
Message-Id: <20260512224349.64621-3-l.rubusch@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260512224349.64621-1-l.rubusch@gmail.com>
References: <20260512224349.64621-1-l.rubusch@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_154411_615872_1D03C1A8 
X-CRM114-Status: GOOD (  21.07  )
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

Move the i2c client allocation logic from atmel-ecc into the shared
atmel-i2c core and extend it to support capability-based client
selection.

Introduce enum atmel_i2c_capability and add capability flags to
struct atmel_i2c_client_priv. Devices now advertise their supported
features during probe, allowing atmel_i2c_client_alloc() to select a
compatible client from the shared i2c client list.

The allocation logic continues to balance crypto transformation usage
across devices by selecting the client with the lowest tfm_count, but
is no longer limited to ECC-capable devices.

This centralizes shared client management in the common atmel-i2c core
and prepares the infrastructure for additional shared crypto features
across compatible Atmel devices.

Signed-off-by: Lothar Rubusch <l.rubusch@gmail.com>
---
 drivers/crypto/atmel-ecc.c     | 39 +++-------------------------------
 drivers/crypto/atmel-i2c.c     | 39 ++++++++++++++++++++++++++++++++++
 drivers/crypto/atmel-i2c.h     |  7 ++++++
 drivers/crypto/atmel-sha204a.c |  2 ++
 4 files changed, 51 insertions(+), 36 deletions(-)

diff --git a/drivers/crypto/atmel-ecc.c b/drivers/crypto/atmel-ecc.c
index cba4238735cc..c63d30947bd7 100644
--- a/drivers/crypto/atmel-ecc.c
+++ b/drivers/crypto/atmel-ecc.c
@@ -200,41 +200,6 @@ static int atmel_ecdh_compute_shared_secret(struct kpp_request *req)
 	return ret;
 }
 
-static struct i2c_client *atmel_ecc_i2c_client_alloc(void)
-{
-	struct atmel_i2c_client_priv *i2c_priv, *min_i2c_priv = NULL;
-	struct i2c_client *client = ERR_PTR(-ENODEV);
-	int min_tfm_cnt = INT_MAX;
-	int tfm_cnt;
-
-	spin_lock(&atmel_i2c_mgmt.i2c_list_lock);
-
-	if (list_empty(&atmel_i2c_mgmt.i2c_client_list)) {
-		spin_unlock(&atmel_i2c_mgmt.i2c_list_lock);
-		return ERR_PTR(-ENODEV);
-	}
-
-	list_for_each_entry(i2c_priv, &atmel_i2c_mgmt.i2c_client_list,
-			    i2c_client_list_node) {
-		tfm_cnt = atomic_read(&i2c_priv->tfm_count);
-		if (tfm_cnt < min_tfm_cnt) {
-			min_tfm_cnt = tfm_cnt;
-			min_i2c_priv = i2c_priv;
-		}
-		if (!min_tfm_cnt)
-			break;
-	}
-
-	if (min_i2c_priv) {
-		atomic_inc(&min_i2c_priv->tfm_count);
-		client = min_i2c_priv->client;
-	}
-
-	spin_unlock(&atmel_i2c_mgmt.i2c_list_lock);
-
-	return client;
-}
-
 static void atmel_ecc_i2c_client_free(struct i2c_client *client)
 {
 	struct atmel_i2c_client_priv *i2c_priv = i2c_get_clientdata(client);
@@ -249,7 +214,7 @@ static int atmel_ecdh_init_tfm(struct crypto_kpp *tfm)
 	struct atmel_ecdh_ctx *ctx = kpp_tfm_ctx(tfm);
 
 	ctx->curve_id = ECC_CURVE_NIST_P256;
-	ctx->client = atmel_ecc_i2c_client_alloc();
+	ctx->client = atmel_i2c_client_alloc(ATMEL_CAP_ECDH);
 	if (IS_ERR(ctx->client)) {
 		pr_err("tfm - i2c_client binding failed\n");
 		return PTR_ERR(ctx->client);
@@ -321,6 +286,8 @@ static int atmel_ecc_probe(struct i2c_client *client)
 
 	i2c_priv = i2c_get_clientdata(client);
 
+	i2c_priv->caps = BIT(ATMEL_CAP_ECDH);
+
 	/* add to client list */
 	spin_lock(&atmel_i2c_mgmt.i2c_list_lock);
 	list_add_tail(&i2c_priv->i2c_client_list_node,
diff --git a/drivers/crypto/atmel-i2c.c b/drivers/crypto/atmel-i2c.c
index 861af52d7a88..b7ee2ec37531 100644
--- a/drivers/crypto/atmel-i2c.c
+++ b/drivers/crypto/atmel-i2c.c
@@ -57,6 +57,45 @@ static void atmel_i2c_checksum(struct atmel_i2c_cmd *cmd)
 	*__crc16 = cpu_to_le16(bitrev16(crc16(0, data, len)));
 }
 
+struct i2c_client *atmel_i2c_client_alloc(enum atmel_i2c_capability cap)
+{
+	struct atmel_i2c_client_priv *i2c_priv, *min_i2c_priv = NULL;
+	struct i2c_client *client = ERR_PTR(-ENODEV);
+	int min_tfm_cnt = INT_MAX;
+	int tfm_cnt;
+
+	spin_lock(&atmel_i2c_mgmt.i2c_list_lock);
+
+	if (list_empty(&atmel_i2c_mgmt.i2c_client_list)) {
+		spin_unlock(&atmel_i2c_mgmt.i2c_list_lock);
+		return ERR_PTR(-ENODEV);
+	}
+
+	list_for_each_entry(i2c_priv, &atmel_i2c_mgmt.i2c_client_list,
+			    i2c_client_list_node) {
+		if (!(i2c_priv->caps & BIT(cap)))
+			continue;
+
+		tfm_cnt = atomic_read(&i2c_priv->tfm_count);
+		if (tfm_cnt < min_tfm_cnt) {
+			min_tfm_cnt = tfm_cnt;
+			min_i2c_priv = i2c_priv;
+		}
+		if (!min_tfm_cnt)
+			break;
+	}
+
+	if (min_i2c_priv) {
+		atomic_inc(&min_i2c_priv->tfm_count);
+		client = min_i2c_priv->client;
+	}
+
+	spin_unlock(&atmel_i2c_mgmt.i2c_list_lock);
+
+	return client;
+}
+EXPORT_SYMBOL(atmel_i2c_client_alloc);
+
 void atmel_i2c_init_read_config_cmd(struct atmel_i2c_cmd *cmd)
 {
 	cmd->word_addr = COMMAND;
diff --git a/drivers/crypto/atmel-i2c.h b/drivers/crypto/atmel-i2c.h
index 43a0c1cfcd94..70579b438256 100644
--- a/drivers/crypto/atmel-i2c.h
+++ b/drivers/crypto/atmel-i2c.h
@@ -115,6 +115,10 @@ struct atmel_i2c_cmd {
 #define ECDH_PREFIX_MODE		0x00
 
 /* Used for binding tfm objects to i2c clients. */
+enum atmel_i2c_capability {
+	ATMEL_CAP_ECDH = 0,
+};
+
 struct atmel_i2c_client_mgmt {
 	struct list_head i2c_client_list;
 	spinlock_t i2c_list_lock;
@@ -130,6 +134,7 @@ extern struct atmel_i2c_client_mgmt atmel_i2c_mgmt;
  * @wake_token_sz       : size in bytes of the wake_token
  * @tfm_count           : number of active crypto transformations on i2c client
  * @hwrng               : hold the hardware generated rng
+ * @caps                : feature capability of the particular driver
  *
  * Reads and writes from/to the i2c client are sequential. The first byte
  * transmitted to the device is treated as the byte size. Any attempt to send
@@ -146,6 +151,7 @@ struct atmel_i2c_client_priv {
 	size_t wake_token_sz;
 	atomic_t tfm_count ____cacheline_aligned;
 	struct hwrng hwrng;
+	u32 caps;
 };
 
 /**
@@ -190,6 +196,7 @@ void atmel_i2c_init_genkey_cmd(struct atmel_i2c_cmd *cmd, u16 keyid);
 int atmel_i2c_init_ecdh_cmd(struct atmel_i2c_cmd *cmd,
 			    struct scatterlist *pubkey);
 
+struct i2c_client *atmel_i2c_client_alloc(enum atmel_i2c_capability cap);
 void atmel_i2c_unregister_client(struct atmel_i2c_client_priv *i2c_priv);
 
 #endif /* __ATMEL_I2C_H__ */
diff --git a/drivers/crypto/atmel-sha204a.c b/drivers/crypto/atmel-sha204a.c
index e6808c2bc891..ab758c9cd410 100644
--- a/drivers/crypto/atmel-sha204a.c
+++ b/drivers/crypto/atmel-sha204a.c
@@ -173,6 +173,8 @@ static int atmel_sha204a_probe(struct i2c_client *client)
 
 	i2c_priv = i2c_get_clientdata(client);
 
+	i2c_priv->caps = 0;
+
 	/* add to client list */
 	spin_lock(&atmel_i2c_mgmt.i2c_list_lock);
 	list_add_tail(&i2c_priv->i2c_client_list_node,
-- 
2.53.0


