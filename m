Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 676B7CD4F3D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 15:57:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4fqnKQyfEX10m0YEJcZYCgsQ4k4ZpuOar6eAbgyMF0M=; b=QoKjvH6R/85U6+3jzB5j4GsiOv
	fcexyjlxhwnDJ9LvVKGt9sOFprTQHG3B64x3TNhxMMYBOif/5TD8Itla5xD6ThTI49DP7HjWr/pS8
	bKLtLQn0thpnG7mSou7BI3ctrKIrR4qYXzvNl0StLjWOiSAMa/cyq7/ePhZsj5bZP1MLQAHO2P67o
	pbA525lc2dzkykdDk7eyQA8z9l5nk7GsxCv+WCiIE9omDCIWh04Puf4jC/voF/bIDqxgSD5h+XlbD
	MacgZ6hhOoMi+VJoq/4OH4dwgsAPladyfopBWtlZjhIYuBM1wRRZxb2W1JCXxgY83VoScZd/m7BLT
	mVT7dkLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPjIa-000000055RM-1koS;
	Wed, 20 May 2026 15:57:32 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPjIV-000000055Mv-0iwu
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 May 2026 15:57:28 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4891b02a0acso2821855e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 20 May 2026 08:57:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779292645; x=1779897445; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4fqnKQyfEX10m0YEJcZYCgsQ4k4ZpuOar6eAbgyMF0M=;
        b=Szr2ftscZS0tm4jx7gaUMSauzZpiOvnsJBdNP+Scvu6Lp4P5Nc38DtIeUft9gp/lJ9
         4nUHehZZ7RKRVKkoVf4LQlJfFTo4QTDnxFYJGYanmJnbfwvm6MrXFlsLkPMYrjwT/64M
         szbo1igmLqfJKTWQApDIoEAishcTfE+eeyjkzXPV01LN29AsWmWANlAow7HzHGvfpMa5
         +kLYCsLk7p90xaRDIx0gwM+afokeyAL5LlbYzagX3+9wHx6aaG1rRJh7AQHjDBgx0vp2
         218RcViAiur8EzH97CrhNTYBWyFBZea1yflARAHc8smBtAp4W0Fcfv7lZF4f3K9olLiI
         sKAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779292645; x=1779897445;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4fqnKQyfEX10m0YEJcZYCgsQ4k4ZpuOar6eAbgyMF0M=;
        b=ERoyjNDgZb976bGNGyiDCilOTW87vsKJ+OrEyj72zTOmX+yh6jANz+6N3o/0NOyz47
         WEkx0Cepfs1Te/X+78OYz+0SPNBMc7zPZu3H+3GYadVBlEOAs2dEvAEnaONjU2urG570
         xD6YpfsOqAr6H9pLxnqur+2Ay9Nad20j4jPXpc+CgH7S3CEegGKytXsy7kyePmcA0CJx
         ZTqm76axG7ZtY54KTHfkFnWmdMdd4WNFCmxuCuM36c28PjDeSH++EyeTfmZULeIf5+Wy
         KE15K+Jw/0GObvFeoqpMbcSQXIB4MhmHVlq+iVtOtAlz9HgGZL98/8cdREPOfDSAmwsr
         Wf7g==
X-Forwarded-Encrypted: i=1; AFNElJ+W7B77ouh4u86LyELLE4UizGE8mLzbgD7S05TauA9d3ZaeTELS2XNDFw9FnGmzhbm6NBgk+xgOzOKX2RTGZjZu@lists.infradead.org
X-Gm-Message-State: AOJu0Yxh1lMS35HnQf7B8b5LB2q/UhCFdZdTO1jv2uDK1w1bI0mIJdDI
	f8Mfrs3+TNDehJotY3ggpthAU0HB+XqvlgssFsMAlAQvDG2jWzKU/M0y
X-Gm-Gg: Acq92OFm15iUmGEP/2Vu+Wgu3XzwtnblPlEex15DrB8z12AhNPq4HDFDsDr4upT3h6h
	r8NS2PW/OGf59yGyKoT2TFdQfCJQ4872fOD5xs2EcWAx1dQzMAM3lDRe8SpEkQimzOD03KM6NoU
	sT2vome0B4dnSAnJKprE7kh1VqpznAPSLRGOuraxs1vYVZcdyzcllRM5AhYs3P3NSe/5wp9wUVg
	GEOukXvLCSeq6Lm5yXmzAU1976XOauMNHhGeu+NPzRm8N9bmeH0CoioZCPfB/ZHf50FCdsgNskC
	V7J9ySRc39zlHskoA6ulA2Da5zRbVZLkLPx+1x/Ucvl6PQGHLg6BzR8BefAkSui9psjHOEX3tf3
	HCmg7fhAufR2nA8ELrvrQgHPNXTMXOKIKl4CMS29In6aNwhaCZ62XHZ1mK2kUQAP/hthIZQTRoM
	1Iy+D9UC+aOOCrgEdeczwE+u8m3wL7lEfjiZHgE4+4jXgwoLEqYzJWiq9UzjIUp8E=
X-Received: by 2002:a05:600c:470e:b0:485:f1d6:2b1d with SMTP id 5b1f17b1804b1-48fe59adb12mr166420295e9.0.1779292645281;
        Wed, 20 May 2026 08:57:25 -0700 (PDT)
Received: from menon.v.cablecom.net (84-74-0-139.dclient.hispeed.ch. [84.74.0.139])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48febe79ce3sm137216715e9.31.2026.05.20.08.57.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 08:57:24 -0700 (PDT)
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
Subject: [PATCH v3 10/12] crypto: atmel-sha204a - integrate into core management tracking
Date: Wed, 20 May 2026 15:57:01 +0000
Message-Id: <20260520155703.23018-11-l.rubusch@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260520155703.23018-1-l.rubusch@gmail.com>
References: <20260520155703.23018-1-l.rubusch@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_085727_241620_3C0B86B7 
X-CRM114-Status: GOOD (  16.79  )
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

Register the SHA204A I2C device instance into the shared atmel_i2c client
management tracking list during the probe phase. This allows the driver to
participate in the central hardware selection infrastructure.

Rework the error-unwind paths inside atmel_sha204a_probe() to prevent stale
entries from remaining in the global tracking structures if a partial
initialization failure occurs. If sysfs group creation fails, explicitly
trigger devm_hwrng_unregister() to preserve the strict lifecycle ordering
introduced in previous stability fixes.

Convert the removal path to use the core teardown helpers. Ensure the
device readiness state is deactivated using atmel_i2c_deactivate_client()
and the tracking node is removed via atmel_i2c_unregister_client() before
local memory resources are freed. This guarantees that any in-flight work
queue items are unconditionally flushed, eliminating a potential
Use-After-Free (UAF) window during device removal.

No functional change intended beyond improved lifecycle handling.

Signed-off-by: Lothar Rubusch <l.rubusch@gmail.com>
---
 drivers/crypto/atmel-sha204a.c | 29 ++++++++++++++++++++++++-----
 1 file changed, 24 insertions(+), 5 deletions(-)

diff --git a/drivers/crypto/atmel-sha204a.c b/drivers/crypto/atmel-sha204a.c
index 3853d2b95449..db61ac0177f6 100644
--- a/drivers/crypto/atmel-sha204a.c
+++ b/drivers/crypto/atmel-sha204a.c
@@ -172,9 +172,15 @@ static int atmel_sha204a_probe(struct i2c_client *client)
 		return ret;
 
 	i2c_priv = i2c_get_clientdata(client);
+	i2c_priv->ready = false;
 
 	i2c_priv->caps = 0;
 
+	spin_lock(&atmel_i2c_mgmt.i2c_list_lock);
+	list_add_tail(&i2c_priv->i2c_client_list_node,
+		      &atmel_i2c_mgmt.i2c_client_list);
+	spin_unlock(&atmel_i2c_mgmt.i2c_list_lock);
+
 	memset(&i2c_priv->hwrng, 0, sizeof(i2c_priv->hwrng));
 
 	i2c_priv->hwrng.name = dev_name(&client->dev);
@@ -185,15 +191,28 @@ static int atmel_sha204a_probe(struct i2c_client *client)
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
+		goto err_hwrng_unregister;
 	}
 
+	spin_lock(&atmel_i2c_mgmt.i2c_list_lock);
+	i2c_priv->ready = true;
+	spin_unlock(&atmel_i2c_mgmt.i2c_list_lock);
+
+	return 0;
+
+err_hwrng_unregister:
+	devm_hwrng_unregister(&client->dev, &i2c_priv->hwrng);
+err_list_del:
+	atmel_i2c_unregister_client(i2c_priv);
+
 	return ret;
 }
 
@@ -201,9 +220,10 @@ static void atmel_sha204a_remove(struct i2c_client *client)
 {
 	struct atmel_i2c_client_priv *i2c_priv = i2c_get_clientdata(client);
 
-	devm_hwrng_unregister(&client->dev, &i2c_priv->hwrng);
-	atmel_i2c_flush_queue();
+	atmel_i2c_deactivate_client(i2c_priv);
 
+	devm_hwrng_unregister(&client->dev, &i2c_priv->hwrng);
+	atmel_i2c_unregister_client(i2c_priv);
 	sysfs_remove_group(&client->dev.kobj, &atmel_sha204a_groups);
 
 	kfree((void *)i2c_priv->hwrng.priv);
@@ -239,7 +259,6 @@ static int __init atmel_sha204a_init(void)
 
 static void __exit atmel_sha204a_exit(void)
 {
-	atmel_i2c_flush_queue();
 	i2c_del_driver(&atmel_sha204a_driver);
 }
 
-- 
2.39.5


