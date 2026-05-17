Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C214CD4F4A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 17 May 2026 18:07:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xZeqSTb+Ww2f5MTxnXj9yvOCpat7Odm2G/43tTwf1sE=; b=TWwJ5gTBBLIZiI13ZxYra/tMWc
	ZE3X0eI9U+aTNoutTVHrjmXID3WjRUBm7ifVJ7S9R2IBRpOpgxVa4Dj3yKd1CLbFq8fzay/hOJyoW
	oQNdI8WrNXxPp87CVFIY+AVZogbQuk5kcYHgcpQFW9K2kI2StcMH4hR+PqhT4m6z1SDpc1Ak2Nn8j
	ofgtsCRBc4nyJZoTOnpXeLf4erwiNcvQ4XPbK4Ar7IPiG5vRCwPtne1pYkMrokEYukRy+3X8w5VjS
	UBcCEBLCXTvOvIgesa2JvCY43YRB4+NIyYImQXDsrGNH8ZoDwkrM2TsDDgya9RIHdGQ7RuM29L1Hz
	cTaix/NA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOftM-0000000DAZj-3K0i;
	Sun, 17 May 2026 18:07:08 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOft9-0000000DAPi-0oqo
	for linux-arm-kernel@lists.infradead.org;
	Sun, 17 May 2026 18:06:56 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-48fde2f2d61so2892855e9.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 17 May 2026 11:06:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779041214; x=1779646014; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xZeqSTb+Ww2f5MTxnXj9yvOCpat7Odm2G/43tTwf1sE=;
        b=KWpWr75F1T9A1vYXlGcCScoDROUsPnoZ0XkD48zFa2aD62kuJqbIxXHte8PxqG7pPy
         RFYJMTZ6fYQS+RaS5m7Dsb4/mksTl2CQO8y/76GOxc28IoNdDxCOmaT6Jw4hlGxKmw5P
         ecDcLPtvOcnRmRV2XVd1ANSWvOPE5wz/Oqp8+yKs2cQ1WzGcoZGLdPGW0W0X5qXjCo8M
         Ll+K0dQnP25UYqsN2MvJTLEzaVTjMYrV1Q917MpMfm0n6LpPHW+JmXdTGGHH/09m1MLb
         sDlDNAaf6eayNHL8IP9G39nGDoznFwJ98ejyLrubvk+k4L7MSx6JkJune+3xUEHeqUGt
         mqgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779041214; x=1779646014;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xZeqSTb+Ww2f5MTxnXj9yvOCpat7Odm2G/43tTwf1sE=;
        b=At9XmeWglqfiSm75HRzyoauY/hgW3dXGBiFC31Ra4d5MPKcOyGXQNWC02bNX8j5Yhh
         UP0PvtX0Sfiwy3LhfD7ulYt4uvnMxEQOwl5KoABFIkAA4Zu7jhnMvJM4wZWTy1DMS6tf
         2ONzGlSOo02eVcSfrzkjCLvmgmXaMMXsFLDyavPt8Jg5wgfLu5y+76C4+JhsjOgG2I8R
         sUaJUm1fqZUjX0jqH/PDxSFsFdyWXVazz1BQKO0378vakDq2k+7ONG/GnBOFreuWCS2f
         dNiR1na3S370JmM6HM33ZDRMouvkprmKuSkhiXxf+y21H39D1wOWyvGFQvHmQMJqNxBs
         Py4g==
X-Forwarded-Encrypted: i=1; AFNElJ8c4GK/E3Fc+TaJynTmzNtTHYcReemPRxp9eqRijjRD3n7Ni+y7tnN8XB/NjTdmf7Q+4GCbe3l5D6nnxrPXL7SU@lists.infradead.org
X-Gm-Message-State: AOJu0YycDFi2QhL/zl9BKhk+dXhky+rsgGe4CsvtJjgKZnP5/hwUHkdq
	vqoOf/kAtggBE9AKv77PqRVL+ZXWtR1fQ5zXKAwZtsOQho8ZOppTpU+h
X-Gm-Gg: Acq92OFBXB+ozOE6fjevwAXUZkozZtLpv3YAHvQW+ffli8B6wJBRoWfxdEowzLRAd5h
	4oy+EB1/kMZCoPFvvm7rBybPjEk7eo6HE9hY5+YccF8wYwo5yGNVYENHg6KmE/cdkbQ2hhQua+d
	QWBJtDKlZpa5YRrDC8nUXY1Maumdn66oI5ccIDgg4BqaEbGialHCp4fCK7aM2xCMTDfChyKLLfL
	fXL/IpDXjXlrbBuwvUo7b+7aLpC35zMUkua0BDmiAye4OyV2nL0BIBImoRKhenVhwgH6+yz4bFr
	U0x6okafe7CzXl0z5fl4jB0XJBCXEtufM9dDmFDz7ci6Nm1Texwe2FCHwH4W+ymW9sqBRqqNwyK
	iRkMsxjjDTPVRg5D7zbJOvAJEIWXYDQcVsgmcyr2IXDDh3PeLD+Yk5KcsGsGgyb/Is5kr6W487a
	DD7KXRAzKiF23Pm1h2LYL5KZojNdClATxq0lvI4X1Rw+LfkHtuUbumg/Vi7jE39ajAIaJ16tkqf
	g==
X-Received: by 2002:a5d:5f90:0:b0:454:454a:4cbd with SMTP id ffacd0b85a97d-45e5c6000c3mr8001358f8f.5.1779041213530;
        Sun, 17 May 2026 11:06:53 -0700 (PDT)
Received: from menon.v.cablecom.net (84-74-0-139.dclient.hispeed.ch. [84.74.0.139])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da15a6454sm31766775f8f.34.2026.05.17.11.06.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 11:06:53 -0700 (PDT)
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
Subject: [PATCH 06/12] crypto: atmel-sha204a - add i2c hw client list and improve probe error handling
Date: Sun, 17 May 2026 18:06:33 +0000
Message-Id: <20260517180639.9657-8-l.rubusch@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260517180639.9657-1-l.rubusch@gmail.com>
References: <20260517180639.9657-1-l.rubusch@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260517_110655_281502_3A1B10CA 
X-CRM114-Status: GOOD (  12.44  )
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

Add registration of the SHA204A I2C client into the shared atmel_i2c client
management list during probe.

This allows the driver to participate in the common hardware selection
infrastructure used by Atmel crypto devices.

Improve error handling in atmel_sha204a_probe() by ensuring that partial
initialization (hwrng registration or sysfs creation) results in proper
cleanup of the client list entry.

No functional change intended beyond improved lifecycle handling.

Signed-off-by: Lothar Rubusch <l.rubusch@gmail.com>
---
 drivers/crypto/atmel-sha204a.c | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/drivers/crypto/atmel-sha204a.c b/drivers/crypto/atmel-sha204a.c
index 6e6ac4770416..cdfdcf2e43a7 100644
--- a/drivers/crypto/atmel-sha204a.c
+++ b/drivers/crypto/atmel-sha204a.c
@@ -173,6 +173,13 @@ static int atmel_sha204a_probe(struct i2c_client *client)
 
 	i2c_priv = i2c_get_clientdata(client);
 
+	/* add to client list */
+	spin_lock(&atmel_i2c_mgmt.i2c_list_lock);
+	list_add_tail(&i2c_priv->i2c_client_list_node,
+		      &atmel_i2c_mgmt.i2c_client_list);
+	spin_unlock(&atmel_i2c_mgmt.i2c_list_lock);
+
+	/* register rng */
 	memset(&i2c_priv->hwrng, 0, sizeof(i2c_priv->hwrng));
 
 	i2c_priv->hwrng.name = dev_name(&client->dev);
@@ -183,15 +190,24 @@ static int atmel_sha204a_probe(struct i2c_client *client)
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
+		goto err_list_del;
 	}
 
+	return ret;
+
+err_list_del:
+	spin_lock(&atmel_i2c_mgmt.i2c_list_lock);
+	list_del(&i2c_priv->i2c_client_list_node);
+	spin_unlock(&atmel_i2c_mgmt.i2c_list_lock);
+
 	return ret;
 }
 
-- 
2.53.0


