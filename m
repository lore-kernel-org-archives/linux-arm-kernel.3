Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA119CD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 20:48:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0c34ELoPJoazDfI83jDiunrFakmVLtTU4AFI7jrtuhM=; b=ahuYqZdyet3vSX82FeHKQcgU69
	pYc4AZh1NHG281mr19Ybj+GSQjuoAvNhylDKdqWN8zDz2r3NoKUPRVR/4gAfRHmalTaefh5aVYCnw
	isrKTCJiVVriN1cSrOtYKjVHwrdz8Q2AhUqu6DVp7VkR+jC9kASDeuwVIN4Y236bxN0bBVszZTe5/
	Qi9GB6gqp18gKBz3cXlLGVqtyYZjugLESqbQs0s6/6xua1LfCbPMPs/Y2UUFhg3t+tg/HHIn+ukei
	2lquD1rvV/AkcwCtwUXIdANUQNhZXj/9zN8Dp3BAqiRxX4LxKFyLlOsfQ9y1k6ZNavyeCC9ikrG2E
	018/gamg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPRMQ-00000002lCo-34Pc;
	Tue, 19 May 2026 20:48:18 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPRMK-00000002l8i-1NmX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 20:48:14 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-4462f8d2488so257905f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 May 2026 13:48:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779223690; x=1779828490; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0c34ELoPJoazDfI83jDiunrFakmVLtTU4AFI7jrtuhM=;
        b=GyANWD1pV9/wsLxNNyi4d7X7vcVOwhn5vz8oDwKcU7wPd5hx2wAIQpXO66Sv8c/t4T
         qrlWU+h27rhDqm+Sj/i5ad24R7/Q/gG2DEy3Q0J7grpxdABx6t3NSad1SCa67bGQWZGB
         tRbTaVTsuleeyfI9oHvKCzJyCEK8VtEcn/M+nX2b1znyGuIFERriUDUZIq1uJbBn2gNS
         FNg1AdhuDRD2pbJzSJ00JlU9Q98yit6FBtS/Hyh0xX2A2e0fDMOEQWZL6nMsswCAkw7t
         osrQdhmKdu/BbdxyNPilj6GMMcoprKlIB0XIsCnQobffAmChIsovxJjRnyc8Z3lKaNRD
         /eqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779223690; x=1779828490;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0c34ELoPJoazDfI83jDiunrFakmVLtTU4AFI7jrtuhM=;
        b=csEBl6Ea5PO+f0ILkjBjnQDMuwROWUv8fsTNt8qBhoQ5XdL1TNS8XBquvaY/tcmdVc
         3R5eZRDOOD1O99ky6eCgRBwR8zF6RX4QXrG6YcYqxef1XiYPO0zbB8SHavxN3x7OjKLs
         Lkc2rA3bnDzMz7o6CZ/tTggl7cHIH8yp135FZJ8XHQ7OLAOM3F0a0NmklfoLOpoVA+1Y
         NaOx0wh7y/N2ksGAOBS5M1wQqjA6kxgF7/okXRhZhq7xAFzWhAZKLiX6qASXKlyKqGj0
         xnxGjwG894ObKbZfWA5vcHA/ZE8/8oDZnpJVl0GT6P57m3Yg2p0UyENNv5oorcoUfOgO
         5k0w==
X-Forwarded-Encrypted: i=1; AFNElJ+LByncZYzxb80D2Quzp5IJ7H3vyys3E9E6Mnaw9gXaZRRO0CqekvwczDAr/afudb6UpR0zOvRhjfv6X9UjVTIJ@lists.infradead.org
X-Gm-Message-State: AOJu0YzYJmNeZTtEUJOfPXIaAbFERD9uhTjfXjH28dCwyfwkXCT2azPK
	yXs92ASK0C9GL+qFmm4qD5LhOLX5y2efnF7cI9rhZ0KlrjbzCEEVgHEY
X-Gm-Gg: Acq92OEgpc+717Ytzoxg9nQYD0fSWNE4G0US2K4iAkliGIgwZJmC2CFx3wY06vVKx16
	MCXWaPz0G40mMF1r0gUzsqCMW2ELVf81bDNr/HqW840REEExxq+eT5hQj8E3EEd/3YXkxgh3BLk
	1UlbWyLqIhqG33PagaBQWKqjJ0eaBNH9O2pQiRGc4liZAc5sXwf3ays9wJzrg9lqdQSmCdX1wlW
	SGmmATba5SKL8u23oV0F0RxHnQ0E5CxXhIFVQxZ+usXfWp1T2viKdglnG1meHIWBm6r9Ozl9Drf
	tb2jH2mNBpxCz02RWZ5VoMWla9qxBQmNxjSfmngyHQetMmxV9/+/HnqfTRHjKatngppBiqzCSGZ
	xEo51vuGV13+CSVQMczuEf/Ars7nAVsc9izLQfCvg1HNZpoFfAV+NwOps9ofPSoTcFiSSaPdlFu
	BwpU6XsKurgqtCo96hCqTsDexshs9KFTel1E1Ty75U977FeYJx7wLJ/pRcLdmdupc=
X-Received: by 2002:a05:600c:4455:b0:489:1fa8:b895 with SMTP id 5b1f17b1804b1-48fe5fcb2dfmr159641895e9.2.1779223690355;
        Tue, 19 May 2026 13:48:10 -0700 (PDT)
Received: from menon.v.cablecom.net (84-74-0-139.dclient.hispeed.ch. [84.74.0.139])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fe4dac000sm356457755e9.0.2026.05.19.13.48.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 13:48:10 -0700 (PDT)
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
Subject: [PATCH v2 01/12] crypto: atmel-ecc - rename driver_data before moving it into atmel-i2c
Date: Tue, 19 May 2026 20:47:52 +0000
Message-Id: <20260519204803.17034-2-l.rubusch@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260519204803.17034-1-l.rubusch@gmail.com>
References: <20260519204803.17034-1-l.rubusch@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_134812_387737_74D29221 
X-CRM114-Status: GOOD (  14.68  )
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


