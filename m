Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 494B2CD343F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 May 2026 23:21:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CQMP+CsFbE9KP3qAcxLaIg4zkOxpF/EIB64y6avymrk=; b=bfUkAMVwE6GsJjZTWrWbjuSdaW
	NyQqN1Soe4s7xj+nBYob/hU+DdoL8CFYTH84LIQ/bpCL3faOKKejqNr5Vyq1NbaFcBuRsfmXuDuTJ
	NautvO9Bu/IHwlxAPuyvFM7wqmIZ4ISawKs8fzTa9h0FZJqfAfe+bkYO/qhdIG/h/MrsZZAYp97xe
	H0LUTT/6pHvJR9an6+WyQ67GJCgOUes9H4fD5aSNNGa/4zLSaf6QagnEpl6ekj7MVYfbPIXvyaaW+
	WuHVLOYMfA9KKs3ZTmV8vuokkQKoPS8niViw5HXXlKFQ5OH2s5kNu2KauMfwOFOoDfHpiB4/FsnIx
	uqZvVzVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMvpu-00000000c4Q-15oX;
	Tue, 12 May 2026 22:44:22 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMvpr-00000000bzF-0kZ1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 May 2026 22:44:20 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-44b729aa7c5so468867f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 May 2026 15:44:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778625857; x=1779230657; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CQMP+CsFbE9KP3qAcxLaIg4zkOxpF/EIB64y6avymrk=;
        b=nhMRG5YrLWU9UvUM6GQcXJcsZwUek633cxYl/Xiv2qGp900W9cNaxu0EFt49vOusxw
         iNa+1eE4gEhgYePlgx9b9AxPOv9ltwtRn2Ahp94EDRT6PDiNZ3AuYPiz4KRMdwx0XOYI
         iznqR1YEyuwmJgDNB3Zs4LAsW1mlICk5vsPQiRqh/KCUJ27mJOm2WXAZuyenbEEHwi3K
         8bolvdDZFr8BdQpPMZigCRtWNxLUiGU3gh6exY2Aa0P2Wq/jUF4EAR+RBiNavOqQ2VZZ
         xpAbGpOVre4X6a7LY2icI0nLgnRl16gr+m+YiQ2WTkt+DVIFjzT860Sjntwoxv4LllW7
         nBqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778625857; x=1779230657;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CQMP+CsFbE9KP3qAcxLaIg4zkOxpF/EIB64y6avymrk=;
        b=HqvLwU4IpoOS6HLc4/S/euaPeY7rWZMDaFYUgk1A4owosmv1Ons0l6mZBenRU0gn3g
         DH8NQRhY7ZaZa7EmbNI8HBWoe1S0gUye/sXpTpMxltqScnVNL+pCsiMQ3Y3NqELM9qA3
         4WJAjPT6D6jhrsdCF3V9tKgx2kF3d2Yrw8bZAPZNRYN4xHf7QBSY3AUoJYJfkmNuA+PN
         638xZK7OhlCeHtnYvvQLyC6qVIK6cCgqDr6/7BoUY/8rZrB7oh9LsJ1RKZzublOpk36t
         XCWIn5zt5vAZLrJErEHRgvDGJ0Y/Nti5UIO4zDA+UV9K6wyIGbbP9rmQVWntZ3HMp+ru
         Zd0g==
X-Forwarded-Encrypted: i=1; AFNElJ+JumqbDc7f9yDfex8xFfVzaQf67U97BGGnIsDRnF4bXsQs+/0OrdjqObvjaWJsENM2XI8sA3YZ0lippmN44zOD@lists.infradead.org
X-Gm-Message-State: AOJu0Yw5Juf/fqdeqbjMj8uDLYDfoOQYdiLYQSbkVeYzSq74TrrEIBht
	MMGY17xmcMhy29WEQGL+Yt+d/UT9jgjlnIiz74hx8ZiYjKfns8Fu3pkR
X-Gm-Gg: Acq92OHoY9p1rd4bXyY1nKYqu3sGHfox4DjQaCaiih43Q3jZsub3yVi0vIlIdMClqvg
	zt2slH8MO2AgSqah12iIiW7zc4GEj8+BtygK6wJSrSeHhkdVCs14lMQyZ4nrxZTPgffBmUPUUg2
	F2a/7hVAfbJlMLqgH9n6KclrmWQqNYsWecSjjiyq4MXlpTSmspEgNvAF0IprQkozRYHFC4CKsYn
	Nw5wxQfx/QJ4zdk+De2iEWNvlI4nleyh9I2JKdVw3cNqCSpIuTamZ8TUd0dh2Ecg3TR9E0IXJZh
	Qkysjl8YPLK8PTY+hR+i3FQ1+WSNWaFsrfzmVziFV1Xden1BwzjOG8LD0tYOkgF/gGPOPqwfTux
	y7TqJIKpJgI6dnKrlZR26QBlOurdN72VgjgEcPaq+mBd8T6cb/2whaK57PKUzvspOCZgPO3Bgb3
	uRfpy69unbgk46+2bZXrTjPJNYanrazQgKJGnwoWIB6eW/xiCMZNItnFXml6R5pE3rWD3KX+sov
	g==
X-Received: by 2002:a05:600c:4e8c:b0:489:6c28:dbc9 with SMTP id 5b1f17b1804b1-48fc9a45602mr4727125e9.7.1778625857153;
        Tue, 12 May 2026 15:44:17 -0700 (PDT)
Received: from menon.v.cablecom.net (84-74-0-139.dclient.hispeed.ch. [84.74.0.139])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fce385ea5sm3194025e9.14.2026.05.12.15.44.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 15:44:16 -0700 (PDT)
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
Subject: [PATCH 09/12] crypto: atmel - check client data in remove callbacks
Date: Tue, 12 May 2026 22:43:46 +0000
Message-Id: <20260512224349.64621-10-l.rubusch@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260512224349.64621-1-l.rubusch@gmail.com>
References: <20260512224349.64621-1-l.rubusch@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_154419_232081_338BC9C3 
X-CRM114-Status: GOOD (  17.67  )
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

Check the i2c client private data pointer in the remove callbacks of
the Atmel ECC and SHA204A drivers before accessing driver state.
Move sysfs group removal ahead of the NULL check so cleanup can still
proceed even if client data is unavailable. Also downgrade the
busy-device warning in the ECC remove path from dev_emerg() to
dev_warn().

Signed-off-by: Lothar Rubusch <l.rubusch@gmail.com>
---
 drivers/crypto/atmel-ecc.c     | 20 ++++++--------------
 drivers/crypto/atmel-sha204a.c |  7 +++++--
 2 files changed, 11 insertions(+), 16 deletions(-)

diff --git a/drivers/crypto/atmel-ecc.c b/drivers/crypto/atmel-ecc.c
index f6d1a9694d63..9ad6d42b6eef 100644
--- a/drivers/crypto/atmel-ecc.c
+++ b/drivers/crypto/atmel-ecc.c
@@ -380,19 +380,13 @@ static void atmel_ecc_remove(struct i2c_client *client)
 {
 	struct atmel_i2c_client_priv *i2c_priv = i2c_get_clientdata(client);
 
-	/* Return EBUSY if i2c client already allocated. */
-	if (atomic_read(&i2c_priv->tfm_count)) {
-		/*
-		 * After we return here, the memory backing the device is freed.
-		 * That happens no matter what the return value of this function
-		 * is because in the Linux device model there is no error
-		 * handling for unbinding a driver.
-		 * If there is still some action pending, it probably involves
-		 * accessing the freed memory.
-		 */
-		dev_emerg(&client->dev, "Device is busy, expect memory corruption.\n");
+	sysfs_remove_group(&client->dev.kobj, &atmel_ecc508a_groups);
+
+	if (!i2c_priv)
 		return;
-	}
+
+	if (atomic_read(&i2c_priv->tfm_count))
+		dev_warn(&client->dev, "Device is busy, remove it anyhow\n");
 
 	atmel_i2c_unregister_client(i2c_priv);
 	atmel_i2c_flush_queue();
@@ -403,8 +397,6 @@ static void atmel_ecc_remove(struct i2c_client *client)
 		kfree((void *)i2c_priv->hwrng.priv);
 		i2c_priv->hwrng.priv = 0;
 	}
-
-	sysfs_remove_group(&client->dev.kobj, &atmel_ecc508a_groups);
 }
 
 static const struct atmel_i2c_of_match_data atecc508a_match_data = {
diff --git a/drivers/crypto/atmel-sha204a.c b/drivers/crypto/atmel-sha204a.c
index 88726f6ef87c..6a41024ae40d 100644
--- a/drivers/crypto/atmel-sha204a.c
+++ b/drivers/crypto/atmel-sha204a.c
@@ -111,6 +111,11 @@ static void atmel_sha204a_remove(struct i2c_client *client)
 {
 	struct atmel_i2c_client_priv *i2c_priv = i2c_get_clientdata(client);
 
+	sysfs_remove_group(&client->dev.kobj, &atmel_sha204a_groups);
+
+	if (!i2c_priv)
+		return;
+
 	devm_hwrng_unregister(&client->dev, &i2c_priv->hwrng);
 	atmel_i2c_flush_queue();
 
@@ -118,8 +123,6 @@ static void atmel_sha204a_remove(struct i2c_client *client)
 		kfree((void *)i2c_priv->hwrng.priv);
 		i2c_priv->hwrng.priv = 0;
 	}
-
-	sysfs_remove_group(&client->dev.kobj, &atmel_sha204a_groups);
 }
 
 static const struct atmel_i2c_of_match_data atsha204_match_data = {
-- 
2.53.0


