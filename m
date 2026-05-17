Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37731CD4F47
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 17 May 2026 18:07:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ra5Z4YYE3acYeuXsyJvtNtB0kw45T1bBE4SEjM00MXw=; b=3y+tMbd73ukINe+4EWjuyOUVz9
	rO84/IuLBmFzp8XHNaqv1PDeE0W/E2mMbdMmwAQya+Jr/xJqAy40lK2O5z7KVz/ZGvJz8OMZ0yy3t
	i6J8YbxTsoTAvnqNi2wVP/KJTM2XumOr9j9bE37OLDRY4Ipw3vU28C78f9DXT6Y26ApXxRjdYxz9m
	QUPGlMVH+iWjPPXk5Zrn+PbxhpEcZuciibC6miGAjYk5RXQhZCSRqP8dATLWAIP16/2urwyqbjrye
	FEs0dEegBIZVztum/GabJOOAJp179EBnfQuzRYvCBzkoZVzfIn82uMxlcoVnqWNn1WoCC0hw0otky
	zVZiRb5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOft9-0000000DAQL-0Xtx;
	Sun, 17 May 2026 18:06:55 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOft4-0000000DANO-2Asb
	for linux-arm-kernel@lists.infradead.org;
	Sun, 17 May 2026 18:06:51 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-48fde653997so1862735e9.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 17 May 2026 11:06:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779041209; x=1779646009; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ra5Z4YYE3acYeuXsyJvtNtB0kw45T1bBE4SEjM00MXw=;
        b=R2JHjgFnFrp+gKjks0pAtWg+i/LgjtF2QHAXXYXoI0DkZrpRLS3+c62FNkWBl51lZF
         5mHArGtBTpRWbho+THomKXPoXj1QhqpPSts+m8bM7H3uHlwerpjP2s3Ov/t5YSGOM06q
         z+SF4NMxnQGueDKQHuBrREAT8xN07wXKlsaEZkD+jvO+yN5B2+yrskSfisuNcU2zr6j4
         jbqhTN7DUp9yojDlmGsMJbA9/SWuhNGGTSNlO/k9PT/1qIKmzLNdr6u8HQ9OiEo/Ndmv
         NDctgI0BuWCvazUNKySW95iGHIPPPJwMaw6TNk1WlxrP/kPorhGX3VCXHV7/fYxm6GLi
         nCIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779041209; x=1779646009;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ra5Z4YYE3acYeuXsyJvtNtB0kw45T1bBE4SEjM00MXw=;
        b=A7Ry8xib8bXET0gM6uxF45gjYP4MihPxMXryhQCC5oWCEP8jKzP39X/yMicdnRIg8h
         bPgQLYxOlKlSzgP1G8ZeT/GOIh/yFWh2IZEI+a4cSiVeticfZMOl/LNA51kET5wBOZs1
         Jo9G4BUo473Gcr5XIufpcYuqNfowgpMvmYGIr4ht74g/cRh0kJzVM5VU89c8X+IFyS1a
         nrBMxKp6wKMoFTbIxDw92kQhuo4hbLq7I/Xj42bLGjqOv11piSeaVDTaoVpQh5guPhmm
         INomPc2SZRaeko6cpco5tkN+MCsATgVFsGVlclrFvtee2lvEOVir5QI5nOt80dDr9579
         Taaw==
X-Forwarded-Encrypted: i=1; AFNElJ/P3yZ3uoHP2Wrymhda0T0GSX8hTq5thE2gS3B+U4vLzojxSO6AYj3OvOavx1ITQ+tEma+C2kkA2D7cZXBASmN/@lists.infradead.org
X-Gm-Message-State: AOJu0YxPP6d/IbQS0gjvEaQLLC/kFeQg658njuYNaa+34zeeipCWmRWC
	BL3NiKOhlxS+pHLURb49SCAn0/cJaWUuBU/04JTY9XT7oxcb3gFKpXCf
X-Gm-Gg: Acq92OH7j1IvCVinBhdiSDLLfpM4gs/qDXxBGthYF1lg5p9xr9d2jYwJ191XNG22JXo
	Cy0kLBhsTVmeHhWJc2zdBAgXvrhF/q4XORD49mS8mkCBakvWWpVBLmaLDgs5HUajYFK/Bwy7mBS
	O3O0e98VL09pL24PqHunTDMrug0TbaRjTayVRj5jfh+Mgnrt6Tul2GosLy8ZSEa82bgY8xGHCEV
	AbmAy32G17Brx2Kw9WsvPAbN6KkDfI79iZnqw6DNTrdOwIDQsj+fwWesw07TE34sNRtV4rUW+GI
	MwzPuA0+uof2Z2zijw9mhJYK4nCEWzZ1zFPcrFOED4vQdV35MPNX4kqitB6QTfZnUcv7jbLwT0T
	LAGeaNynJryrCWTqINy264q9cs4/brspcc9bwSDfycCpwlM8cPxAMg7n6oG+hCaeH3TrVYlLugD
	xPPburqY2eLJI2+X40dgzNRLp1D/P9sGCADD7QCgKreEg/C4vB5pZwdkskkA9IprF6r648lDlfP
	A==
X-Received: by 2002:a05:600c:1d02:b0:48a:5302:8ed9 with SMTP id 5b1f17b1804b1-48fe5ea0842mr106215275e9.0.1779041208400;
        Sun, 17 May 2026 11:06:48 -0700 (PDT)
Received: from menon.v.cablecom.net (84-74-0-139.dclient.hispeed.ch. [84.74.0.139])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da15a6454sm31766775f8f.34.2026.05.17.11.06.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 11:06:48 -0700 (PDT)
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
Subject: [PATCH 01/12] crypto: atmel-ecc - rename driver_data before moving it into atmel-i2c
Date: Sun, 17 May 2026 18:06:28 +0000
Message-Id: <20260517180639.9657-3-l.rubusch@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260517180639.9657-1-l.rubusch@gmail.com>
References: <20260517180639.9657-1-l.rubusch@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260517_110650_580320_5DEA8FD2 
X-CRM114-Status: GOOD (  13.32  )
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
 drivers/crypto/atmel-ecc.c | 30 +++++++++++++++---------------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/drivers/crypto/atmel-ecc.c b/drivers/crypto/atmel-ecc.c
index 9660f6426a84..c9f798ebf44f 100644
--- a/drivers/crypto/atmel-ecc.c
+++ b/drivers/crypto/atmel-ecc.c
@@ -23,7 +23,7 @@
 #include <crypto/kpp.h>
 #include "atmel-i2c.h"
 
-static struct atmel_ecc_driver_data driver_data;
+static struct atmel_ecc_driver_data atmel_i2c_mgmt;
 
 /**
  * struct atmel_ecdh_ctx - transformation context
@@ -209,14 +209,14 @@ static struct i2c_client *atmel_ecc_i2c_client_alloc(void)
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
@@ -232,7 +232,7 @@ static struct i2c_client *atmel_ecc_i2c_client_alloc(void)
 		client = min_i2c_priv->client;
 	}
 
-	spin_unlock(&driver_data.i2c_list_lock);
+	spin_unlock(&atmel_i2c_mgmt.i2c_list_lock);
 
 	return client;
 }
@@ -323,16 +323,16 @@ static int atmel_ecc_probe(struct i2c_client *client)
 
 	i2c_priv = i2c_get_clientdata(client);
 
-	spin_lock(&driver_data.i2c_list_lock);
+	spin_lock(&atmel_i2c_mgmt.i2c_list_lock);
 	list_add_tail(&i2c_priv->i2c_client_list_node,
-		      &driver_data.i2c_client_list);
-	spin_unlock(&driver_data.i2c_list_lock);
+		      &atmel_i2c_mgmt.i2c_client_list);
+	spin_unlock(&atmel_i2c_mgmt.i2c_list_lock);
 
 	ret = crypto_register_kpp(&atmel_ecdh_nist_p256);
 	if (ret) {
-		spin_lock(&driver_data.i2c_list_lock);
+		spin_lock(&atmel_i2c_mgmt.i2c_list_lock);
 		list_del(&i2c_priv->i2c_client_list_node);
-		spin_unlock(&driver_data.i2c_list_lock);
+		spin_unlock(&atmel_i2c_mgmt.i2c_list_lock);
 
 		dev_err(&client->dev, "%s alg registration failed\n",
 			atmel_ecdh_nist_p256.base.cra_driver_name);
@@ -363,9 +363,9 @@ static void atmel_ecc_remove(struct i2c_client *client)
 
 	crypto_unregister_kpp(&atmel_ecdh_nist_p256);
 
-	spin_lock(&driver_data.i2c_list_lock);
+	spin_lock(&atmel_i2c_mgmt.i2c_list_lock);
 	list_del(&i2c_priv->i2c_client_list_node);
-	spin_unlock(&driver_data.i2c_list_lock);
+	spin_unlock(&atmel_i2c_mgmt.i2c_list_lock);
 }
 
 static const struct of_device_id atmel_ecc_dt_ids[] = {
@@ -394,8 +394,8 @@ static struct i2c_driver atmel_ecc_driver = {
 
 static int __init atmel_ecc_init(void)
 {
-	spin_lock_init(&driver_data.i2c_list_lock);
-	INIT_LIST_HEAD(&driver_data.i2c_client_list);
+	spin_lock_init(&atmel_i2c_mgmt.i2c_list_lock);
+	INIT_LIST_HEAD(&atmel_i2c_mgmt.i2c_client_list);
 	return i2c_add_driver(&atmel_ecc_driver);
 }
 
-- 
2.53.0


