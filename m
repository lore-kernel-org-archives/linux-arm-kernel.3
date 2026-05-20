Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6406CD4F3D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 15:57:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ix3QOsJRJfrw5u43r2mA+N3E2gg1vLyQm9dlzJ2uvsQ=; b=pZfBOPN03w1F1mHrYHyQyyLTlc
	DbjhyYrARpXMvh2lu+OqNEJT1lhQxni4rhQA/Xs0DUHuDCDqzfX7T/TH34FHLEHztxxNQ2gwbqVeX
	EJa3vYFsaWtp4EpToqmHOwJwuuJ9+wB8af0/OZg8tri/bseEVVtpYR8UpuJdrwxGv9D/zhOxYj2WG
	OIe/5lXLZNT58sk01pZhrJ+nPJFuChQaOQ2Ow6qSv1RhO2edxfTt2+ALKEdvNvorT1umBepL1cq79
	WMK/i752gH+Fy4AOHIJaLagoJPoGFO6prqH3G3VwxUCNjkxsJfSv0pI+M0JTx/j95XW+B7FG/ctYF
	ihXURRCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPjIa-000000055R5-1KGX;
	Wed, 20 May 2026 15:57:32 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPjIS-000000055Kg-1xBx
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 May 2026 15:57:25 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-48d10c981e4so6607945e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 20 May 2026 08:57:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779292643; x=1779897443; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ix3QOsJRJfrw5u43r2mA+N3E2gg1vLyQm9dlzJ2uvsQ=;
        b=ni3kM4Fw7cxk+WCKxmV/nPHLYNHqqASfxzz+rDzRYeoVDLiUSBihmvdKIwjAgUAGE3
         vuwJ99J0BeV82lL5JVw/QDUdSS688UifTDK/4fxbe329ZJMWYA4DIS8wqxzjask6rHf0
         pnH3hIZZeMk8alVLZ++rnIF/vheBbvwvk0OZf/yNil0ux88Iw8KAstBq00LPrpFIVXJF
         FMLdWLtvATeO6guhomqsOwHpAO8hYprarTJlrVSBO4hIJHVowZp/UdaaGLBIk3ZsAKnV
         +clUyvIjHUg7LM6QI0M5yD6C6ijmFlziP+niwLr3BPDqsE5cuDwoc5gG/V7v61ghAGvn
         1Z/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779292643; x=1779897443;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ix3QOsJRJfrw5u43r2mA+N3E2gg1vLyQm9dlzJ2uvsQ=;
        b=OG9V3WZX4VcYyO/tCo4GIIWPAecUYpFwjd2iTYk2cfgcs7RXcYJ8MvAT1KcsgkPWlP
         XQtF/lozPuCsrFZ8R1G6gFoHnaySwezWyCsrbO3yZVHbTTnQtc7DyMMDDusue9kOV29T
         FyCxpKOKBNuCxVD59hZ9/uKhFmrZ+EXZJpxKz/wDZutRYyMpcMdZI/+7h6OTQxn8q7k9
         j9uCKeYt/anjvT5V0d0otBCLaY+iQWF6XFKzmGl7oDMzw5i3IZyBW9uXZxUEbauP+2vh
         HtS3OvjpwqCjbKbgYaCgf6r6FgWP9eQ6GNVd1ZLAwXfnJNXxOSyJ873zcp7500rXGjAI
         ZiUg==
X-Forwarded-Encrypted: i=1; AFNElJ/5RVO6I2IFk3GSo17zGvt1ee88W9S4KkaVIXqDwqtQJI1UcJ/PJldqvTAmS1nbLEzZNtVzb+zSBy5PuzOm4scU@lists.infradead.org
X-Gm-Message-State: AOJu0Yx2nSsR+HaJRvUHvnNSucVwdHQAnOxZQZaieWuShB1g+NSWQuSP
	prPr5yExJnN667aW8XICEkcWU/UPEHediVAsaX0J3UFxIzP/6NcCBAIk
X-Gm-Gg: Acq92OFABMT379nAxnYTQJsrDgBLaPb843iuriFXsuZ2Xmco0ftdxvWWsqT7PSR3Emv
	FvES+4W46cS8hAPJ0Gkwk9VNtdHmUjPGGEFobthPMpT3ECZpXIvObleheGGAKX4d85xjH2fBPu6
	Xf0GwUSPHe+GypWPpu9oBtmLpJp3vrrFvPLxM5mtK/rfjWALjRBwFfPZ8tLVB7DDk9jzUUYJBkm
	j9Hcq/v+/BeBbkzHEZOn3HhyMLJV7kyhFNqExa1z25ee2e1wPz4Fd2r7aplc1qx5aJQckCxkAw+
	b1IPaVVbJ9ZuCDAQqSI/Jyu7qpUqdoGePrR4UPYgMaejvcer9vNOPM0jSJk43EIsnP2xj/vPxbm
	j7t1X1ULlu7XPA39ZQu4RWSFuJ8tA7iZ9QsOQB9zU4OVuSR2fh2qb1+6k0h2cBctu0uArB3wQg+
	fSWs+ZRWf287qpS2HSV47NCCD+u/bidLXfYNHRenUzJwzOwMxG8Z9HgTq0NV7JcxY=
X-Received: by 2002:a05:600c:3b07:b0:48e:6db5:76e6 with SMTP id 5b1f17b1804b1-48fe63099c6mr198267165e9.2.1779292642678;
        Wed, 20 May 2026 08:57:22 -0700 (PDT)
Received: from menon.v.cablecom.net (84-74-0-139.dclient.hispeed.ch. [84.74.0.139])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48febe79ce3sm137216715e9.31.2026.05.20.08.57.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 08:57:22 -0700 (PDT)
From: Lothar Rubusch <l.rubusch@gmail.com>
To: thorsten.blum@linux.dev,
	herbert@gondor.apana.org.au,
	davem@davemloft.net,
	nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev,
	tudor.ambarus@linaro.org,
	ardb@kernel.org,
	linusw@kernel.org
Cc: linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	l.rubusch@gmail.com
Subject: [PATCH v3 08/12] crypto: atmel-i2c - move shared client allocation logic to core
Date: Wed, 20 May 2026 15:56:59 +0000
Message-Id: <20260520155703.23018-9-l.rubusch@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260520155703.23018-1-l.rubusch@gmail.com>
References: <20260520155703.23018-1-l.rubusch@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_085724_535884_0364FA2F 
X-CRM114-Status: GOOD (  17.51  )
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
index f166144febfe..19e9ee9c15e5 100644
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
index cf3c57745414..e10713a7bcfe 100644
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


