Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D73DCCD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 15:57:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0c34ELoPJoazDfI83jDiunrFakmVLtTU4AFI7jrtuhM=; b=vU/fa/tOjZixcJG9x/xTBsowoj
	vKGIvWERs0jdpSvR4+4nKTPjJdQlBUXoDBKKP1XQykITPRKD4lTVuREcfcauujyyzIviPR+kDZUM1
	irU1UdVRhlQYZcAYG68J2+/oaLhjvmydiQeNM3xC+J/Hz/P/bh8UKEPDHMO/m5ydKghSIwMBKPphe
	+U5ADPicF6t/SpwzaSrDk9mGtQ/zhqPjSWx48KdMed4SyYIVxBuiUdUFxE4Fw7GartDPEqIT7geOU
	k0ttuWj3Kh9pIj9B1CacWONuwTuQMZ5TSVIEI1C5c7HXx4SisEtPDtHxTVPU4npl0CVTwXi3BJXX+
	F86Vs4JA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPjIK-000000055Ei-2TjM;
	Wed, 20 May 2026 15:57:16 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPjIF-000000055Cd-1xfm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 May 2026 15:57:12 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-48fde2f2d61so8459935e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 20 May 2026 08:57:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779292629; x=1779897429; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0c34ELoPJoazDfI83jDiunrFakmVLtTU4AFI7jrtuhM=;
        b=OgtIU8su4phrg8t1M6hyi/lpPtLMvaqJu93RapOxP1KdmqeD2zvXPvdzYmFqFO2heh
         GPUOfnXdCMxInNCVnKgKJKJpHuYjI0vbi1W2SCSLtQTrFYJOEUbtKpsnTqPO7b/2fBp3
         uaAksUzO5O+d2PpwEnPHgqycmQDYiWqz4kUBAtAs5xkzMbgIZwg+qrvKj9qH26Tz52Th
         pCjto5u69l4jbrkRR0slFgQD/5/mcPdWXFpCfmDoURL31Pz4LLZCtE8cZNcZSpYom7v8
         oybwAhmcI4mLeBMdR0gDkOEQ+3FJ6wi7q9ogT1GTWfpV+BK4r/eiz9BhUYYsarhF1liE
         xLIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779292629; x=1779897429;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0c34ELoPJoazDfI83jDiunrFakmVLtTU4AFI7jrtuhM=;
        b=ZcUNFNlEH0u3UjMNTbxmQ3h/fjkMKDzwESmh8dyrPKR4dYA9qowJtOSuBJ0OzcH0Gf
         RQDYR2geKwmlwASYx68vc+NSrNWJsh7aWba8ecx9B0kgauvvrZ92tgUh3lfSU/MsnMeY
         B/vOF6n7OVUn+Tq1ykDsha22MrwwBIz1rB/FMoZs9+GHw9WmkeXw6WkRhWKwTvtN16pT
         DBo66atY7o5974avODyNKQQtN/UhBPp1ewIQqKHT3vsIyWMqFORtCKTuA36Urs9xIOm3
         rLTvR+r3wsm1bHY1CZRSqRd1AdZAPnLzNBSftdSIQliRXEQGAYkcex6IgoQjf0dFVNng
         IM+Q==
X-Forwarded-Encrypted: i=1; AFNElJ+Y3+m1phhosv/thWnif5ZuyAcXG/PwkCqmJUyVndbpZuaAcbowqMQa7BhEB4098xGJxilV9aOkIxatfSlTbv1S@lists.infradead.org
X-Gm-Message-State: AOJu0YzfH7xdvW08NottPa9Yn040c0VjH7i8uqppFpDJLULIACFwd67t
	s481nrwbXOOH3rlltT9E1HzBPnXy98Y3J1otpggPiA+8mICCouYfYmON
X-Gm-Gg: Acq92OFzpZxMNh5sUb4mnsUBX8t6wHEJPeIB6QhwuQZxhXIKQkThQW79jigAVdXSBAX
	EWKWEpgUgJ5msIdjFub/yCAEmVwZ9Tc6zUXkEe7WypfL7ywW4N0Dtp4/cuP1Y/7Hi70QZsoAGx0
	dsSqk1+lEAve0OXXHzGsKPDqT7hKkoAuO1jMov9UKgoJJwBpMIhkNw586El29ZO1jxrLxqcdnQN
	Tp02Cig3Tds0X8pLty8nRiHh7Lwa+s1QrABj0nrVoCXXGMuSq2o1S0+58bfZHzDjLJ9lsxHMJYp
	2QQGHa7S0ZhXzFtdDNhWP/Ot4A0Q9xxrc+frQG8CNX8AxcXXPfyOTvMmAw0P0DZjgOA0j2+3fQw
	Gm1Bda1t9QCF9Hds8xuyTRKS/Xlv08xo7tUJ+RVlQg9S2G4POHgwRcdL3A6GhXSpYKh+RgnFQZg
	3hkzKQMorNVgNlx5d/D1HQeMa+MAQpmA4DE61x74AL51ICsLmDjYc3b0KaHd8HZ+k=
X-Received: by 2002:a05:600c:4692:b0:48a:52ce:a4d3 with SMTP id 5b1f17b1804b1-48fe63262famr211663295e9.8.1779292629254;
        Wed, 20 May 2026 08:57:09 -0700 (PDT)
Received: from menon.v.cablecom.net (84-74-0-139.dclient.hispeed.ch. [84.74.0.139])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48febe79ce3sm137216715e9.31.2026.05.20.08.57.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 08:57:08 -0700 (PDT)
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
Subject: [PATCH v3 01/12] crypto: atmel-ecc - rename driver_data before moving it into atmel-i2c
Date: Wed, 20 May 2026 15:56:52 +0000
Message-Id: <20260520155703.23018-2-l.rubusch@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260520155703.23018-1-l.rubusch@gmail.com>
References: <20260520155703.23018-1-l.rubusch@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_085711_518855_9BC98A91 
X-CRM114-Status: GOOD (  14.59  )
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
2.39.5


