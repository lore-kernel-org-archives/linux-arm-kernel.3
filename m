Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1259FCD5BB3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 May 2026 23:02:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VdPdyRKOtuD7Jq2T1rwTu6Wes+v7LpW2HMOrPNqb248=; b=daKqSF5EwF/LNNddSbit9Oa3MX
	fmoyIw5rDxFbLKLdVCe5RMlcdXGYkF4gXct/rm5jfO+3rgQNRJGFjnLJ5f1rMHsEGc8jrPRyVUkci
	TSipBakuvO1qPfbb9ZkpExB1kC3CpMORbD96k+BuAetdgsB8eicB6h+6j9gl2INma1OaUPu1R2T1O
	hCkR1uXZkE2GhRpbi9w/I+02a2A8qVG8hddQ2paQwEkew0wVqD7evPiIVe67hRDXjfmBF/cWx3GNP
	QYTDWe7xtybtse2KN4wz7YiUC0RrXZ3lEcvydWYzpEhOrZL9XsnGqhDMSGVnBvUMrUTyYy+SvsDhN
	1wH6EQzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQYsT-0000000CAR9-1s3H;
	Fri, 22 May 2026 23:02:01 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQYsF-0000000CAFw-31hs
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 May 2026 23:01:48 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-44b7e8b65faso599522f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 May 2026 16:01:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779490906; x=1780095706; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VdPdyRKOtuD7Jq2T1rwTu6Wes+v7LpW2HMOrPNqb248=;
        b=S8nvzQXeWLVBlMohEkRicxHV6E1RQ2Alh9dZ/z11NthU+mCc1J/12gEEL6iejtYp8Y
         cZSwUpvqCrlc5COWOrEULIEw3pkZRtfVGX5LWGM4dvQzp5wUkn3+37AywJYHVltKt0v0
         dG6b4fW0TJiPXyflUxoLj7XgGCutal+MHv0vQApyE6hyGDwtt7xXjgS/CxD4A/OUYgKk
         M0DetJ8BAsd2WlVVfkPUps+elWjtoS7c2IT2rhf3dwFKhc4j/lfW/MG397tV+R/KyZsr
         W5YDrshnoYraL3Ro0R71xTJVvnuP9tifJUXNyG/THQNmeNAhfmbRa73ckvgWKo3Rx1Ij
         47ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779490906; x=1780095706;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VdPdyRKOtuD7Jq2T1rwTu6Wes+v7LpW2HMOrPNqb248=;
        b=m5/d27sndfvcGB/fAPH7tOUV+tR92CzK1etW45XZuyRfNuqCjtoHT7ensRiTflVIoV
         27EggjsTVhzSVUZkY1dh9NejJI/xU03erp/C/sYVWfNMh07ZNdKU2tNVdwDPeYzsfRAK
         dCT3G0IcXo3ip797GZzVqMHwVJ3RHoxurphy058H8fo75WGpymkIzzu5saFC65HKJ97D
         lnI4DNbLyju56yM5uC9for9q2sc+q+4ni9fqJw9rXHe/t+Zjil4yurS9aFQ8WKoxcnHO
         IoRQOYmerQjp2ynBCMX4mKkoQFmO/OFI4bwjRs28SgFOojRGoMpJ9FCAkOfEPkuI+iAv
         0Wog==
X-Forwarded-Encrypted: i=1; AFNElJ/J8q7iI5rANBik4HLTMGTKnwqffs7bHRw3en3nxqLxi+0vQ03UHIXwir3ujDNMpE/xEGaH2JnSH5Uh3TUs7cys@lists.infradead.org
X-Gm-Message-State: AOJu0YyhpacaPbWvG7vN7skDpWDK0qJmj5sz+ZAUFy8FvMb8mwu/qVC9
	yyzd05omI2q8eTHK/T5e9m3xVKDA66GGTamn1Zvpw0DCaVqL7+epkR4q
X-Gm-Gg: Acq92OFkM5Ukag+tdQ0hGVbqFvG3BJB0xBbyp1Uf7SsMpMd+FnswO0t/QYQHzClgLGx
	uhuPawJ9ZPo1S5rWGhjQ8EA19eyi3Vwbf+1g3QsvylIILESElv4ErqJS5thFQjhtbXgzATP9xp6
	nHey6x+bsXjnj5/PGH7w0gXCk39poEg4dFvYSurSOXRf8TERhGo5xS9SvACJCcAHggffHQucepM
	77YjeGosLtjW2m5zLI8P6FHdh2Hinhqw3diNcbNGlloamGUOVVK6siPlKUTH8LMg1t7fnPiCgd0
	b12s+w6lL/ak0t/6nOQllsIr3BQUOaeF679UgWsZRovYrgruSuTebNM0cqScwoOUPrApiL6G60r
	+qjVsE1FKNy1qjxr3fTfxqPm1Krxs6xJxmAHoWMZxJ4OgmlFPSci/xYYfr/sD+o8BBixThaBsSc
	TLVHMTGp34PxBEEza4ogJxKDfsb0ZxTelz+RiC6eFIJ/nQFK6l+F2WfKxjGZtD8v4=
X-Received: by 2002:a05:600c:c4a3:b0:485:c456:5e4f with SMTP id 5b1f17b1804b1-490422529aemr38152485e9.0.1779490905632;
        Fri, 22 May 2026 16:01:45 -0700 (PDT)
Received: from menon.v.cablecom.net (84-74-0-139.dclient.hispeed.ch. [84.74.0.139])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490456274ebsm67100265e9.15.2026.05.22.16.01.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 16:01:44 -0700 (PDT)
From: Lothar Rubusch <l.rubusch@gmail.com>
To: thorsten.blum@linux.dev,
	herbert@gondor.apana.org.au,
	davem@davemloft.net,
	nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev,
	tudor.ambarus@linaro.org,
	ardb@kernel.org,
	linusw@kernel.org,
	krzk+dt@kernel.org
Cc: linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	l.rubusch@gmail.com
Subject: [PATCH v4 04/12] crypto: atmel-ecc - rename driver_data before moving it into atmel-i2c
Date: Fri, 22 May 2026 23:01:26 +0000
Message-Id: <20260522230134.32414-5-l.rubusch@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260522230134.32414-1-l.rubusch@gmail.com>
References: <20260522230134.32414-1-l.rubusch@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_160147_789309_C7B5C980 
X-CRM114-Status: GOOD (  14.52  )
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

Rename the local driver_data instance to atmel_i2c_mgmt in
preparation for moving the shared I2C client management
infrastructure into the atmel-i2c core driver in a subsequent
change.

No functional changes intended.

Signed-off-by: Lothar Rubusch <l.rubusch@gmail.com>
---
 drivers/crypto/atmel-ecc.c | 39 +++++++++++++++++++-------------------
 1 file changed, 19 insertions(+), 20 deletions(-)

diff --git a/drivers/crypto/atmel-ecc.c b/drivers/crypto/atmel-ecc.c
index 005a9a3d919c..d12a9dbe45a7 100644
--- a/drivers/crypto/atmel-ecc.c
+++ b/drivers/crypto/atmel-ecc.c
@@ -28,7 +28,7 @@ static int atmel_ecc_kpp_refcnt;
 DECLARE_COMPLETION(atmel_ecc_unreg_done);
 static bool atmel_ecc_unreg_active;
 
-static struct atmel_ecc_driver_data driver_data;
+static struct atmel_ecc_driver_data atmel_i2c_mgmt;
 
 /**
  * struct atmel_ecdh_ctx - transformation context
@@ -214,14 +214,14 @@ static struct i2c_client *atmel_ecc_i2c_client_alloc(void)
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
 		if (!i2c_priv->ready)
 			continue;
@@ -239,7 +239,7 @@ static struct i2c_client *atmel_ecc_i2c_client_alloc(void)
 		client = min_i2c_priv->client;
 	}
 
-	spin_unlock(&driver_data.i2c_list_lock);
+	spin_unlock(&atmel_i2c_mgmt.i2c_list_lock);
 
 	return client;
 }
@@ -334,11 +334,11 @@ static int atmel_ecc_probe(struct i2c_client *client)
 	i2c_priv = i2c_get_clientdata(client);
 	i2c_priv->ready = false;
 
-	spin_lock(&driver_data.i2c_list_lock);
+	spin_lock(&atmel_i2c_mgmt.i2c_list_lock);
 	list_add_tail(&i2c_priv->i2c_client_list_node,
-		      &driver_data.i2c_client_list);
+		      &atmel_i2c_mgmt.i2c_client_list);
 	i2c_priv->ready = true;
-	spin_unlock(&driver_data.i2c_list_lock);
+	spin_unlock(&atmel_i2c_mgmt.i2c_list_lock);
 
 	mutex_lock(&atmel_ecc_kpp_lock);
 	/*
@@ -352,12 +352,11 @@ static int atmel_ecc_probe(struct i2c_client *client)
 		timeout = wait_for_completion_timeout(&atmel_ecc_unreg_done,
 						      msecs_to_jiffies(2000));
 		mutex_lock(&atmel_ecc_kpp_lock);
-
 		if (timeout == 0) {
-			spin_lock(&driver_data.i2c_list_lock);
+			spin_lock(&atmel_i2c_mgmt.i2c_list_lock);
 			i2c_priv->ready = false;
 			list_del(&i2c_priv->i2c_client_list_node);
-			spin_unlock(&driver_data.i2c_list_lock);
+			spin_unlock(&atmel_i2c_mgmt.i2c_list_lock);
 			mutex_unlock(&atmel_ecc_kpp_lock);
 
 			dev_err(&client->dev, "probe timed out, former driver instance not fully deregistered\n");
@@ -368,10 +367,10 @@ static int atmel_ecc_probe(struct i2c_client *client)
 	if (atmel_ecc_kpp_refcnt == 0) {
 		ret = crypto_register_kpp(&atmel_ecdh_nist_p256);
 		if (ret) {
-			spin_lock(&driver_data.i2c_list_lock);
+			spin_lock(&atmel_i2c_mgmt.i2c_list_lock);
 			i2c_priv->ready = false;
 			list_del(&i2c_priv->i2c_client_list_node);
-			spin_unlock(&driver_data.i2c_list_lock);
+			spin_unlock(&atmel_i2c_mgmt.i2c_list_lock);
 			mutex_unlock(&atmel_ecc_kpp_lock);
 
 			dev_err(&client->dev, "%s alg registration failed\n",
@@ -391,9 +390,9 @@ static void atmel_ecc_remove(struct i2c_client *client)
 	struct atmel_i2c_client_priv *i2c_priv = i2c_get_clientdata(client);
 	bool trigger_unreg = false;
 
-	spin_lock(&driver_data.i2c_list_lock);
+	spin_lock(&atmel_i2c_mgmt.i2c_list_lock);
 	i2c_priv->ready = false;
-	spin_unlock(&driver_data.i2c_list_lock);
+	spin_unlock(&atmel_i2c_mgmt.i2c_list_lock);
 
 	/*
 	 * The Linux crypto core automatically blocks until all active
@@ -413,9 +412,9 @@ static void atmel_ecc_remove(struct i2c_client *client)
 	if (atomic_read(&i2c_priv->tfm_count))
 		wait_for_completion(&i2c_priv->remove_done);
 
-	spin_lock(&driver_data.i2c_list_lock);
+	spin_lock(&atmel_i2c_mgmt.i2c_list_lock);
 	list_del(&i2c_priv->i2c_client_list_node);
-	spin_unlock(&driver_data.i2c_list_lock);
+	spin_unlock(&atmel_i2c_mgmt.i2c_list_lock);
 
 	/*
 	 * The driver registers once an algorithm, but maintains a list of
@@ -459,8 +458,8 @@ static struct i2c_driver atmel_ecc_driver = {
 
 static int __init atmel_ecc_init(void)
 {
-	spin_lock_init(&driver_data.i2c_list_lock);
-	INIT_LIST_HEAD(&driver_data.i2c_client_list);
+	spin_lock_init(&atmel_i2c_mgmt.i2c_list_lock);
+	INIT_LIST_HEAD(&atmel_i2c_mgmt.i2c_client_list);
 	return i2c_add_driver(&atmel_ecc_driver);
 }
 
-- 
2.39.5


