Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62C24CD5BBC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 May 2026 23:02:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uuVvbPMfCmoiXjDpDixu/ffXb2eS9sn4npWm18kEdeo=; b=2D9z3fqXlv9m5fz3bS9qvNhAMn
	KBXfkklcjFoJ/X/GuZDwpvxcWgfmEriZl7JYloSTwW8SozjQS98Oq9lTQ+Yjx3c8hnWxATMNF6VMd
	sbuzSbpVYOmmS6Bx3iqp9KzJVpHWtCAWLsuTB7CNGbfB1wGNy82ZahGClcbH8Fmv9lhTgV4uFm9OH
	8AqldlmkAdXZQri5JAs7p5En2MOofBmyqz+h+fYDkuIeaGQ17faaNRzwXo2vqFIyLf4q0U5/v5kjR
	qh/zGszgHlhJJ2ZYo/XPkXpsfjGjAGJk9n0r2DutavZTE+0EW7TUQlly45zRS9++w1mcNdRLGvQ/t
	XOmymU2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQYsU-0000000CATh-1i21;
	Fri, 22 May 2026 23:02:02 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQYsP-0000000CANL-0BtY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 May 2026 23:01:58 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-4493cf2f982so705309f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 May 2026 16:01:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779490915; x=1780095715; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uuVvbPMfCmoiXjDpDixu/ffXb2eS9sn4npWm18kEdeo=;
        b=rhj14DmMyLwu3ZJDkdRXO6G++kcrCvmjCScrceOZpl000JDt/WooDCmzcPG2v9YckW
         zoCV4eDNfHhmrkrn4k5o4ay7bl4jPry7tRIRPtHgAl9ejIBtyh92MXPLhwbHRB48kltC
         7sfoerai/xWeUiWWRWF7lPavoiWsQvRwzfDyrI5MdAe1xmkZ0bqhOA5DfSZMCX3iN7B4
         OePISUVl9UulfaEncKvjZUl4VFBL9KzFvyPZYhYCJyglSSM8OSCdbSxwEHt04QRqecxp
         oIuMqyCj8M+wumLUoWVGkIkWb3opD9IzQhe7kpjA83qjC/xIsaR4vlM1Vo23UN3P2xhV
         w7/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779490915; x=1780095715;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uuVvbPMfCmoiXjDpDixu/ffXb2eS9sn4npWm18kEdeo=;
        b=KTYcIjMcauBEoHtq1uFrgW8mzg2t5YWK+iOWjCYwkjka0Xj5wOnDArFEux9hK6RvNZ
         h/btoze8qewpQnT/kLXdpcLlrhoqd+EH6yMsf+rK0AVwpazdSTR4NB4fYadQdIOayxCB
         sX4StVBXtrSW2KqQtAmrUyJ/zdMxciPh+MXN9zvY9bewoAyTkHf1XPcMLIS37+qQ/VlK
         28O1W4I70Zp8U7iucvMOw7k0LPRXQF+uhg5B4zBnwVuk3E62Srkagebij7fP4pi00MVe
         0jbJBnmsA9sXyk+9gAXpmmoIGQYgIeeRKePoa/tGQbzqcLg5dZaSjXmCQ50W+Esxzw9z
         iMbQ==
X-Forwarded-Encrypted: i=1; AFNElJ/LMvyybcC8T9dHSRmaNV+k5pe9P8JPiBN8XSKP26LNCROEuP4ay7M6bbMOe1B2YPwSevEwrN9L0qAYa/BlJeQq@lists.infradead.org
X-Gm-Message-State: AOJu0YyajKpghHiOiheuIRPdWUxiECdYNC3fhlfO4BQX27ofw9lapLe/
	yAOKCSpcune0W00TznS5Z2y24pBV0tCys9SekQvy4eLhdar2GH9O3R5Y
X-Gm-Gg: Acq92OF3Tuxm6NzqlHwfqkp5MDY/g28AZMVazKJ83Vmqs4jUw63Du5TsgnrFmv5I8nH
	/W8JBGpWZKyZiHIPeqgcC+8a6mvICU/+qcOE+L0gfEhev2ltmS+WVIKfFmzuwKAtuT1kxE2e9CD
	nxJPHnPCuanA1lNv3Ognj8NrxPt5drGbzqhc6BgDCQGdlLDq7wE9zGYPIq2SC0O2gl84elZp/ar
	90Lh782PXRPE9Tc8bUjYiL1DaijYef73rbnlqs9MoWCrVKOf2Ulq/c3DZDADbAqVf9BchHtAUBX
	+dvfaDLUT8FWhf5doBIKnJts7iGi6slHOXJ2zr+UmqH2iA7gdbkVh4XF01u9vnQH32XoVQ0mflj
	qfaklSYrO7SVivlD84iHWFX6vsUt1k8kur/cwJ/BPpBqghZDmwrKRyliCd8K59d+f7eP3gq65cL
	hVl53vIJfXWSEZGycBULrMXdsvT4O74GH+P1ZvJFQ7hVi75/qYLH7+N+W06Mefq2s=
X-Received: by 2002:a05:600c:1386:b0:490:6ab:406a with SMTP id 5b1f17b1804b1-49042be7044mr34931885e9.8.1779490914815;
        Fri, 22 May 2026 16:01:54 -0700 (PDT)
Received: from menon.v.cablecom.net (84-74-0-139.dclient.hispeed.ch. [84.74.0.139])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490456274ebsm67100265e9.15.2026.05.22.16.01.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 16:01:54 -0700 (PDT)
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
Subject: [PATCH v4 11/12] crypto: atmel-sha204a - integrate into core management tracking
Date: Fri, 22 May 2026 23:01:33 +0000
Message-Id: <20260522230134.32414-12-l.rubusch@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260522230134.32414-1-l.rubusch@gmail.com>
References: <20260522230134.32414-1-l.rubusch@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_160157_103852_C2D4B1D1 
X-CRM114-Status: GOOD (  15.05  )
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
 drivers/crypto/atmel-sha204a.c | 26 ++++++++++++++++++++++----
 1 file changed, 22 insertions(+), 4 deletions(-)

diff --git a/drivers/crypto/atmel-sha204a.c b/drivers/crypto/atmel-sha204a.c
index 0c5b5cdbfcbc..86a68f2a27e0 100644
--- a/drivers/crypto/atmel-sha204a.c
+++ b/drivers/crypto/atmel-sha204a.c
@@ -177,9 +177,15 @@ static int atmel_sha204a_probe(struct i2c_client *client)
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
@@ -192,15 +198,26 @@ static int atmel_sha204a_probe(struct i2c_client *client)
 	ret = devm_hwrng_register(&client->dev, &i2c_priv->hwrng);
 	if (ret) {
 		dev_err(&client->dev, "failed to register RNG (%d)\n", ret);
-		return ret;
+		goto err_list_del;
 	}
 
 	ret = sysfs_create_group(&client->dev.kobj, &atmel_sha204a_groups);
 	if (ret) {
 		dev_err(&client->dev, "failed to create sysfs group (%d)\n", ret);
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
 
@@ -208,9 +225,11 @@ static void atmel_sha204a_remove(struct i2c_client *client)
 {
 	struct atmel_i2c_client_priv *i2c_priv = i2c_get_clientdata(client);
 
+	atmel_i2c_deactivate_client(i2c_priv);
+
 	sysfs_remove_group(&client->dev.kobj, &atmel_sha204a_groups);
 	devm_hwrng_unregister(&client->dev, &i2c_priv->hwrng);
-	atmel_i2c_flush_queue();
+	atmel_i2c_unregister_client(i2c_priv);
 
 	kfree((void *)i2c_priv->hwrng.priv);
 }
@@ -245,7 +264,6 @@ static int __init atmel_sha204a_init(void)
 
 static void __exit atmel_sha204a_exit(void)
 {
-	atmel_i2c_flush_queue();
 	i2c_del_driver(&atmel_sha204a_driver);
 }
 
-- 
2.39.5


