Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD3BACD5BBB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 May 2026 23:02:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6/v/8SwP1OMGt6X7FpwGNnrj1hJ2WLb5Kzz8Rnl3t28=; b=cleedF1/hIq02te8ZodiFfrBI2
	E0HZI8uxZ/eSC4bxe2ndvGO3xI9YYclVRxFwwuGUwJwwcHPS1O186QVYkj5gv6g3lgYBAlG1bxy38
	ARIQrBECqXbNpHESgnZ1J28eay56HT9FkEx1R68o78EsD8bDnYv4PC4H7msgoPURGczgFt8to9uuc
	IN/6gFwwBvXdLiJZAPy7tLjXVYZJwMiy9VRR6YdaFrYNPA20ZSS6QDeImAiC7p0Sng1soOExSVRgs
	MhrPWf8z5mp3al+uxWz+horPat3msgYIPQQ8UGfm40tm06QmSo/J4rWIyx+zyMNpSOmrbxuFnhYQ7
	y2SXkFcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQYsT-0000000CARv-38R5;
	Fri, 22 May 2026 23:02:01 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQYsJ-0000000CAJ7-2Mye
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 May 2026 23:01:52 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-43d7dab87e1so1005685f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 May 2026 16:01:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779490910; x=1780095710; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6/v/8SwP1OMGt6X7FpwGNnrj1hJ2WLb5Kzz8Rnl3t28=;
        b=iHOJKSYMq9Dw9Ic7TnzyamlvQa5fl6lCQcGwkG/2rceQR6/ITagcE+CrEmYBCpNDmJ
         InyrTCpOclAkBP72Ip2yq++OecCdFVN7S5jg9cTs1B9hC6vtVsea3pVdbLUhzq3FP/yS
         iHOc/byXnALzJgGDogIHnAMMOS57KbSoJmUH9ESK4HdMo5ue3rOwBjcjmNiUY5w7vt0G
         2osTT0p4UF4TU0moKhODE5Git4DVMoCItj/m3R6r5zfz9hs/4HZbE3VIWvZtC0Q/9jqV
         +6sYVODPrhsJCLDRjX6bw4LcQRL/E1mYcX77JhOio+ECF8GqdiqIeeb/YvlPeTaNLq8x
         N0FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779490910; x=1780095710;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6/v/8SwP1OMGt6X7FpwGNnrj1hJ2WLb5Kzz8Rnl3t28=;
        b=qpS0+I2Fc29DW9E+qL4GMMSl8FRe0NMMDhhwaOwDbDoCyURaUfo4FW5GBLSpBU1PFZ
         kUVndfrSNjanSQb39lJcsId5QQbNIUCkTHPau+A3wQI0WEcNXRsICaqgou+otZEVrN1O
         tQAEBKCdCVfPgw0kw4UdoW/DqH1dk9puqic6np/NHXAENLekX3KRTpUaz2WbmWFW5WK7
         NERyLSwSoiE2C2ooe8sLs33G5UY0BxfkV1mWXpd9cJHpYbLC09PM1bHpwXMM5Wq3G/oQ
         ERopzFL8Gch0sVtlQE4EbMfX9UKJIjylSehvt4aVO5SmsdZc0eeofLjDchFhYX23w4dZ
         hfJA==
X-Forwarded-Encrypted: i=1; AFNElJ9VWbYQDbc5yMiJaw0PdPL28EbYPSwz6vR73mbCQ2g6eUKzEi1wdtDnDzdZux4s9/gPaz7qJq/gdWSJ5lBiJfvS@lists.infradead.org
X-Gm-Message-State: AOJu0YxFhuttKtdJpW6SvcyASbjDleu+Uf48hITJuPizPSrmIBqlNFQO
	CmN8cq3PrpASqR5+QFCKI0C3ass0eZ5P10NKNbwTY1HIVvmxuWZYG6ke
X-Gm-Gg: Acq92OGcm6i/5XVqm3jcQlRkHFEoh2XfLEMedmh7mRhPLPi0zAs+nrKgzS69AuisWQH
	vOYfEyjYyPvA5wVRMmmk9xRsjfFhJAy7rqbTSMOVxThDCGqc9rcRuU0o7fFmUCzQ7X34zENq41g
	448cYK07cLGLHyBLLn9OHgUFIykvrhOoiUDRpu74IrVXuv6LBZodeM0zgR0dHXE+GXFs3OviZE7
	LciG0p0fQZ2UDXbjZoN4YHAD2BBf/BGkatoMoMBRzRzvUUovoUkDN9k8o6xbX3a19DKz+yOC2vD
	TOpQGDwU4qSg1zBoFZJzi3mGIQg9GJnXABW/p/rjy1WLkxpN1v5JSbhk8tsivcTnz5X6sKJ/2gg
	TL0y4S6IVFkZdFyNg+GOkcTEuNa3fuCPHRNBKZ9v/TOWLgSFb0bb0UJlXA87Xxu/OeTuoFHJan1
	kTxKclimy7EyKKIOTe/PnqJQfhHgInPmTFjKBKqFwwqjemEHOXydt/JTBkEfuVfpg=
X-Received: by 2002:a05:600c:3547:b0:490:3d3c:22f1 with SMTP id 5b1f17b1804b1-490428e6d5dmr38350275e9.7.1779490909725;
        Fri, 22 May 2026 16:01:49 -0700 (PDT)
Received: from menon.v.cablecom.net (84-74-0-139.dclient.hispeed.ch. [84.74.0.139])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490456274ebsm67100265e9.15.2026.05.22.16.01.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 16:01:49 -0700 (PDT)
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
Subject: [PATCH v4 07/12] crypto: atmel-i2c - introduce shared teardown helpers and fix queue flush
Date: Fri, 22 May 2026 23:01:29 +0000
Message-Id: <20260522230134.32414-8-l.rubusch@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260522230134.32414-1-l.rubusch@gmail.com>
References: <20260522230134.32414-1-l.rubusch@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_160151_667775_74179D14 
X-CRM114-Status: GOOD (  16.50  )
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

Introduce atmel_i2c_deactivate_client() and atmel_i2c_unregister_client()
helpers in the atmel-i2c core library to modularize client teardown. This
encapsulates common client state tracking and list manipulation operations.

Convert the ECC driver's error recovery and device removal paths to utilize
these new helpers, ensuring consistent execution ordering when modifying
device-readiness states and deleting linked-list nodes.

Additionally, migrate the atmel_i2c_flush_queue() call out of the module
exit path. It now runs inside the core unregistration helper. Export both
new tracking symbols via EXPORT_SYMBOL_GPL() to match the existing core
driver licensing standard.

Signed-off-by: Lothar Rubusch <l.rubusch@gmail.com>
---
 drivers/crypto/atmel-ecc.c | 25 ++++++-------------------
 drivers/crypto/atmel-i2c.c | 20 ++++++++++++++++++++
 drivers/crypto/atmel-i2c.h |  3 +++
 3 files changed, 29 insertions(+), 19 deletions(-)

diff --git a/drivers/crypto/atmel-ecc.c b/drivers/crypto/atmel-ecc.c
index 1ae9c52812df..e6d3e6574251 100644
--- a/drivers/crypto/atmel-ecc.c
+++ b/drivers/crypto/atmel-ecc.c
@@ -351,12 +351,8 @@ static int atmel_ecc_probe(struct i2c_client *client)
 						      msecs_to_jiffies(2000));
 		mutex_lock(&atmel_ecc_kpp_lock);
 		if (timeout == 0) {
-			spin_lock(&atmel_i2c_mgmt.i2c_list_lock);
-			i2c_priv->ready = false;
-			list_del(&i2c_priv->i2c_client_list_node);
-			spin_unlock(&atmel_i2c_mgmt.i2c_list_lock);
-			mutex_unlock(&atmel_ecc_kpp_lock);
-
+			atmel_i2c_deactivate_client(i2c_priv);
+			atmel_i2c_unregister_client(i2c_priv);
 			dev_err(&client->dev, "probe timed out, former driver instance not fully deregistered\n");
 			return -ETIMEDOUT;
 		}
@@ -365,12 +361,8 @@ static int atmel_ecc_probe(struct i2c_client *client)
 	if (atmel_ecc_kpp_refcnt == 0) {
 		ret = crypto_register_kpp(&atmel_ecdh_nist_p256);
 		if (ret) {
-			spin_lock(&atmel_i2c_mgmt.i2c_list_lock);
-			i2c_priv->ready = false;
-			list_del(&i2c_priv->i2c_client_list_node);
-			spin_unlock(&atmel_i2c_mgmt.i2c_list_lock);
-			mutex_unlock(&atmel_ecc_kpp_lock);
-
+			atmel_i2c_deactivate_client(i2c_priv);
+			atmel_i2c_unregister_client(i2c_priv);
 			dev_err(&client->dev, "%s alg registration failed\n",
 				atmel_ecdh_nist_p256.base.cra_driver_name);
 			return ret;
@@ -388,9 +380,7 @@ static void atmel_ecc_remove(struct i2c_client *client)
 	struct atmel_i2c_client_priv *i2c_priv = i2c_get_clientdata(client);
 	bool trigger_unreg = false;
 
-	spin_lock(&atmel_i2c_mgmt.i2c_list_lock);
-	i2c_priv->ready = false;
-	spin_unlock(&atmel_i2c_mgmt.i2c_list_lock);
+	atmel_i2c_deactivate_client(i2c_priv);
 
 	/*
 	 * The Linux crypto core automatically blocks until all active
@@ -410,9 +400,7 @@ static void atmel_ecc_remove(struct i2c_client *client)
 	if (atomic_read(&i2c_priv->tfm_count))
 		wait_for_completion(&i2c_priv->remove_done);
 
-	spin_lock(&atmel_i2c_mgmt.i2c_list_lock);
-	list_del(&i2c_priv->i2c_client_list_node);
-	spin_unlock(&atmel_i2c_mgmt.i2c_list_lock);
+	atmel_i2c_unregister_client(i2c_priv);
 
 	/*
 	 * The driver registers once an algorithm, but maintains a list of
@@ -461,7 +449,6 @@ static int __init atmel_ecc_init(void)
 
 static void __exit atmel_ecc_exit(void)
 {
-	atmel_i2c_flush_queue();
 	i2c_del_driver(&atmel_ecc_driver);
 }
 
diff --git a/drivers/crypto/atmel-i2c.c b/drivers/crypto/atmel-i2c.c
index a42b0ea30033..db818ce55033 100644
--- a/drivers/crypto/atmel-i2c.c
+++ b/drivers/crypto/atmel-i2c.c
@@ -354,6 +354,26 @@ static int device_sanity_check(struct i2c_client *client)
 	return ret;
 }
 
+void atmel_i2c_deactivate_client(struct atmel_i2c_client_priv *i2c_priv)
+{
+	spin_lock(&atmel_i2c_mgmt.i2c_list_lock);
+	i2c_priv->ready = false;
+	spin_unlock(&atmel_i2c_mgmt.i2c_list_lock);
+}
+EXPORT_SYMBOL_GPL(atmel_i2c_deactivate_client);
+
+void atmel_i2c_unregister_client(struct atmel_i2c_client_priv *i2c_priv)
+{
+	spin_lock(&atmel_i2c_mgmt.i2c_list_lock);
+	if (!list_empty(&i2c_priv->i2c_client_list_node))
+		list_del_init(&i2c_priv->i2c_client_list_node);
+	spin_unlock(&atmel_i2c_mgmt.i2c_list_lock);
+
+	/* don't sleep inside spin locks */
+	atmel_i2c_flush_queue();
+}
+EXPORT_SYMBOL_GPL(atmel_i2c_unregister_client);
+
 int atmel_i2c_probe(struct i2c_client *client)
 {
 	struct atmel_i2c_client_priv *i2c_priv;
diff --git a/drivers/crypto/atmel-i2c.h b/drivers/crypto/atmel-i2c.h
index 82321c35c21f..07fd2248e20b 100644
--- a/drivers/crypto/atmel-i2c.h
+++ b/drivers/crypto/atmel-i2c.h
@@ -193,4 +193,7 @@ void atmel_i2c_init_genkey_cmd(struct atmel_i2c_cmd *cmd, u16 keyid);
 int atmel_i2c_init_ecdh_cmd(struct atmel_i2c_cmd *cmd,
 			    struct scatterlist *pubkey);
 
+void atmel_i2c_deactivate_client(struct atmel_i2c_client_priv *i2c_priv);
+void atmel_i2c_unregister_client(struct atmel_i2c_client_priv *i2c_priv);
+
 #endif /* __ATMEL_I2C_H__ */
-- 
2.39.5


