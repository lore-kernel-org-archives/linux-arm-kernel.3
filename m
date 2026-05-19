Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96954CD5BA4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 20:48:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gxI7hUf51SF8n1So+Ll4nAd4AxUxL7HVVQ7quL1tTus=; b=38QL0DOehLX0Ok5og5MoeO3nAx
	cbVmBq8F/9UE2Plhx744kfBKS8dt8r0ps7reSouQyDav6r/YTh/tiXqCiahWcb0601UW2+mxSE/Ca
	3pVsy/Sq+BCeFIX3kGXf52VC2G5wJ10nKMNlKDgz8se++fLLlT+JEkyZfkOhlRz724uVgyP8I73Rz
	5pdF4s5gJYYegi3jXawMecmvEvr5ezYqUZJQuOLN07rVvK7sxCFu7yhQiZ8McdJW+KujcdsQxX+98
	Nnv3CzGSUcsY2lN/49FglfrCm62eHqXmA6nslMtRxamz3ZWz5UrE2TUy9/mqKeHOFpTIWqmIOryHq
	PMhIjrNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPRMf-00000002lOq-0KBO;
	Tue, 19 May 2026 20:48:33 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPRMR-00000002lC7-0RWR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 20:48:20 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-452aacde862so298597f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 May 2026 13:48:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779223697; x=1779828497; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gxI7hUf51SF8n1So+Ll4nAd4AxUxL7HVVQ7quL1tTus=;
        b=AgRZm9ND57YcyDLWZs8YP1ABjtAqahTChIYuVkYI9kLaH1VyMoG13MZsvpW7dTJRGN
         jBC16cXclKfhhJ3Zod6fj6ZEIynS1YGVSWJsSN0mrzxPYZsFIb4F8ipRKVZPieG7oSCL
         EkHf6tVgVBgDHl2m1e/AKDSwXCdUpsQakItV1IxLH5yDc2qwqagOAMNIKzx4A88EUaGy
         0ZzSNYjSqA9HGKAjRby/fWqHekaayw6DczrT/mCzdJglrioJt08a1s0mtjKOAFle1omV
         yG8/ydnIh+2RoZnrL5F+0S13wkQIizBkTtQiDdge1Qh1Dd0jqmV8BOcYfqjf3Uhb7Qi9
         B5Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779223697; x=1779828497;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gxI7hUf51SF8n1So+Ll4nAd4AxUxL7HVVQ7quL1tTus=;
        b=mu2QpyrHcKhvJrY68sPqkKwp8xVfNOZhWew8HimYw2l78gkF2EoKFaPuYDjxSxli3l
         ImoHU9Wm7fUomrGiYdTXRFJ/XYaqs4BxtzMD/rnf/kyZSHqatBq4JZpE2D455EbVHk+o
         IDkeaL5IUdGUw0Tdv4C/Wsli5481Uf91CMCYtdBQ9Z3BhWdeZVLaNR0Zqb9hBFHYIcMA
         mM/v5td1nDRyIj9fjWuNHvJm7+PqfD4cDH1mPnvsyvBTkU5Ln1OxJjME6nS5vIVKo4Y/
         McIURwVr0bENHv6uTB7IrDt/qNcGYClcywvdYUA8XVPtQuNyZxpRboo5NTGsc6MOVvQ8
         zNuw==
X-Forwarded-Encrypted: i=1; AFNElJ+bpdDev1mUrUKof0JD76HO3q53QU0DLUTOWsNM8C8L8MVMbPj7q/EuFRTVgwRUkCJsd9vRTfF+0z0jDXy+RpBd@lists.infradead.org
X-Gm-Message-State: AOJu0YwF+1Xv908vqajDIpDoONQ+dpVcpFALY7xzjUEtrV9Vej6lXwjj
	nRgp2YiCLwL1KPD+HI4/NT00TqrcgNK79d2oSaommwq67xEyj4I32Rveq3UU4A==
X-Gm-Gg: Acq92OEmILmiFdzcLIZQgEJxNyKcZ+/mKf1bB4B4lzvpCIRfLVMHLQ9DMOS53u5Cbkj
	61lqVRs1iV06XZyeXMkCDPXSSSG7w/+EvpVoDDTd/Omz8VgegEb63Zyh+Cd/IlMjrgKzljdvLIB
	DsUhjcJV2B2yPi8GuxXQmi3HelEz6VdWyE0GPREoyd9+gSQG0zhwDFD2C7Y6GnigyNbWIxaT/GS
	vXzCsO9eYFPGdyOYWXjGtvM7uRlhwGCBmqDAU9k4gwQ9ZAmMIICWHKE90uF1VhonQClCcMKG792
	vHrzaSsGKC3b2OTn+xG04hr4jkipJjbrWa3Lk8jguAyw1iYXbDl90h/2yET/Q1EwYPQYZ32Ep7r
	b+T+KFk2S5U2eVgO1tEOHazBbL0ybztPjtidOwvA9BRAZCoOYQh5GfvP82t0nQaWb7CyAJX07NV
	qAST/KbPpc4cXRmRC7b024f4fFo2chlPARARPMSaQbNFiTExY2PTpJq9Ybg+HVcHQ=
X-Received: by 2002:a05:600c:4588:b0:489:1c1f:35e5 with SMTP id 5b1f17b1804b1-48fe664be2amr148849335e9.6.1779223697098;
        Tue, 19 May 2026 13:48:17 -0700 (PDT)
Received: from menon.v.cablecom.net (84-74-0-139.dclient.hispeed.ch. [84.74.0.139])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fe4dac000sm356457755e9.0.2026.05.19.13.48.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 13:48:16 -0700 (PDT)
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
Subject: [PATCH v2 08/12] crypto: atmel-i2c - move shared client allocation logic to core
Date: Tue, 19 May 2026 20:47:59 +0000
Message-Id: <20260519204803.17034-9-l.rubusch@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260519204803.17034-1-l.rubusch@gmail.com>
References: <20260519204803.17034-1-l.rubusch@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_134819_211427_814BA900 
X-CRM114-Status: GOOD (  17.73  )
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

Migrate the I2C client allocation and runtime load-balancing routines out
of the ECC driver code and into the central atmel-i2c core library module.

Export the symmetric lifecycle helper interfaces atmel_i2c_client_alloc()
and atmel_i2c_client_free() using EXPORT_SYMBOL_GPL() to expose a unified
client management API. This consolidation enables the dynamic selection
subsystem (which chooses the least-loaded client device based on the active
transformation count) to be shared by both the ECC driver and upcoming
Atmel crypto modules.

Refactor the ECC driver's transformation context initialization (init_tfm)
and teardown (exit_tfm) paths to use this centralized core API.

No functional change is intended.

Signed-off-by: Lothar Rubusch <l.rubusch@gmail.com>
---
 drivers/crypto/atmel-ecc.c | 50 +++-----------------------------------
 drivers/crypto/atmel-i2c.c | 46 +++++++++++++++++++++++++++++++++++
 drivers/crypto/atmel-i2c.h |  3 +++
 3 files changed, 52 insertions(+), 47 deletions(-)

diff --git a/drivers/crypto/atmel-ecc.c b/drivers/crypto/atmel-ecc.c
index 4f27e1caf106..7d090c557330 100644
--- a/drivers/crypto/atmel-ecc.c
+++ b/drivers/crypto/atmel-ecc.c
@@ -203,50 +203,6 @@ static int atmel_ecdh_compute_shared_secret(struct kpp_request *req)
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
-		if (!i2c_priv->ready)
-			continue;
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
-static void atmel_ecc_i2c_client_free(struct i2c_client *client)
-{
-	struct atmel_i2c_client_priv *i2c_priv = i2c_get_clientdata(client);
-
-	atomic_dec(&i2c_priv->tfm_count);
-}
-
 static int atmel_ecdh_init_tfm(struct crypto_kpp *tfm)
 {
 	const char *alg = kpp_alg_name(tfm);
@@ -254,7 +210,7 @@ static int atmel_ecdh_init_tfm(struct crypto_kpp *tfm)
 	struct atmel_ecdh_ctx *ctx = kpp_tfm_ctx(tfm);
 
 	ctx->curve_id = ECC_CURVE_NIST_P256;
-	ctx->client = atmel_ecc_i2c_client_alloc();
+	ctx->client = atmel_i2c_client_alloc();
 	if (IS_ERR(ctx->client)) {
 		pr_err("tfm - i2c_client binding failed\n");
 		return PTR_ERR(ctx->client);
@@ -264,7 +220,7 @@ static int atmel_ecdh_init_tfm(struct crypto_kpp *tfm)
 	if (IS_ERR(fallback)) {
 		dev_err(&ctx->client->dev, "Failed to allocate transformation for '%s': %ld\n",
 			alg, PTR_ERR(fallback));
-		atmel_ecc_i2c_client_free(ctx->client);
+		atmel_i2c_client_free(ctx->client);
 		return PTR_ERR(fallback);
 	}
 
@@ -280,7 +236,7 @@ static void atmel_ecdh_exit_tfm(struct crypto_kpp *tfm)
 
 	kfree(ctx->public_key);
 	crypto_free_kpp(ctx->fallback);
-	atmel_ecc_i2c_client_free(ctx->client);
+	atmel_i2c_client_free(ctx->client);
 }
 
 static unsigned int atmel_ecdh_max_size(struct crypto_kpp *tfm)
diff --git a/drivers/crypto/atmel-i2c.c b/drivers/crypto/atmel-i2c.c
index c73ef3cadf0e..4621aa57833f 100644
--- a/drivers/crypto/atmel-i2c.c
+++ b/drivers/crypto/atmel-i2c.c
@@ -57,6 +57,52 @@ static void atmel_i2c_checksum(struct atmel_i2c_cmd *cmd)
 	*__crc16 = cpu_to_le16(bitrev16(crc16(0, data, len)));
 }
 
+struct i2c_client *atmel_i2c_client_alloc(void)
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
+		if (!i2c_priv->ready)
+			continue;
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
+EXPORT_SYMBOL_GPL(atmel_i2c_client_alloc);
+
+void atmel_i2c_client_free(struct i2c_client *client)
+{
+	struct atmel_i2c_client_priv *i2c_priv = i2c_get_clientdata(client);
+
+	atomic_dec(&i2c_priv->tfm_count);
+}
+EXPORT_SYMBOL_GPL(atmel_i2c_client_free);
+
 void atmel_i2c_init_read_config_cmd(struct atmel_i2c_cmd *cmd)
 {
 	cmd->word_addr = COMMAND;
diff --git a/drivers/crypto/atmel-i2c.h b/drivers/crypto/atmel-i2c.h
index 351306c426aa..6c2d86fd9068 100644
--- a/drivers/crypto/atmel-i2c.h
+++ b/drivers/crypto/atmel-i2c.h
@@ -192,6 +192,9 @@ void atmel_i2c_init_genkey_cmd(struct atmel_i2c_cmd *cmd, u16 keyid);
 int atmel_i2c_init_ecdh_cmd(struct atmel_i2c_cmd *cmd,
 			    struct scatterlist *pubkey);
 
+struct i2c_client *atmel_i2c_client_alloc(void);
+void atmel_i2c_client_free(struct i2c_client *client);
+
 void atmel_i2c_deactivate_client(struct atmel_i2c_client_priv *i2c_priv);
 void atmel_i2c_unregister_client(struct atmel_i2c_client_priv *i2c_priv);
 
-- 
2.39.5


