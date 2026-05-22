Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73238CD5BB8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 May 2026 23:01:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yLhglCCko+VFtBnuII+zHndGNGz8atU/cZ6T50d3HYU=; b=XK6QD0lozxHLTmtYHZ5AXwCWXe
	y8pBmV6wJw23dpNguFEzkMzl/vZ1UlUJVLJbhA5VPB7nCkmIxCw4btqg5FaeODbYdQJorH0661rtG
	rdE/blx6oqA6/zCgoxZwAZrrtxdXtGLW9XBbvS+J9N/k0lAuS3TIwrM1/Vsf0kqA5Pz1LwQ+5zX0t
	Xv4yrFFTWqPb9zp8JjlUXy4FjmGpja0Iq1G9o/yTYycXzkCCtyaixtr3ebreqdXxdw7wzullJH0Na
	3l6mN81xWCwVVeWI122bh5hwjzThz/c8SwFMWfPNr5J1FAupjf30tD425Dda+HkqlQ1ZAYxpzs+y1
	xQHnU0Pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQYsG-0000000CAGm-3bEa;
	Fri, 22 May 2026 23:01:48 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQYsA-0000000CAED-48Jw
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 May 2026 23:01:44 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-44a7c719151so592658f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 May 2026 16:01:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779490901; x=1780095701; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yLhglCCko+VFtBnuII+zHndGNGz8atU/cZ6T50d3HYU=;
        b=mCXdv5Owt8QzJnywwBqgaXeSN118a0R8UhiBrVAu3zkopxOsMnHU4PvhdFTjfItNRD
         DO4uc+/oecpuqY9dOTPlp8Cw3XFFBxo5ZU5QUKL8EwtMRq1XiXXBL1COcW8ebWkD3lxJ
         oP0jeFWfTYF1QjA2V4qOHG8NAH2wJl2E833q7QAJ2N2w47YsFND/78bXVzqHCnsUSAJ5
         d8Lw2xtcl84RehlUpLDbehdlnvuiQ1o0winmGmp2+3V6azoEWB1S14yE4NzBlCnCftsM
         yIe/zcQJG4eMZUXcxxKfFoxKJwC28qW+omdgv+uBoKmnW5WQ3MKel/vJyfp39mRoP1s0
         dAVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779490901; x=1780095701;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yLhglCCko+VFtBnuII+zHndGNGz8atU/cZ6T50d3HYU=;
        b=q7dyzFLhI8QiPsfxMea3HWLoFuUs26F2GBsxqjNVo2LgSwv3wPmFm+E4IHfF80E9YG
         YvCI0Rnt/Mh0xVjWOeZ3Kbyjzo9tMML7Ey1InrRgV7fMo22IrifNq9SfS5VuygMPWxMt
         zpqu5TUhEf+o3uVBM7+4KCLfed/StdIgF9udtG+7q5AUctTSEyXQoBtWbeNq/F9B+fYU
         HIcuxNMqbDFyXRGESRGK7ZHm+g91YJGyOBIPsPwVu/Dc6Iy3cria6gL6pgiGHeNXvL6E
         ebLONhvdvEq7LVynGr9z4QZmB7ZfkL5tzXuKTvU/h30bHDMqr9ucApTYvwEtwJFczB0B
         crFQ==
X-Forwarded-Encrypted: i=1; AFNElJ+9zYm5penK+bF45LJ/zqVU3vRjJT1sFKe74DALVJ0yBBk9WCGJjdPWi8R+miEeqp5mWk4epbskLi82z327CNjG@lists.infradead.org
X-Gm-Message-State: AOJu0YwSqfXjgBqqE1q25fHryVXMhGdGWmbKFHpTPQsan14jxRpquFV3
	XrbUf+0s+Ch36Xp6+NISWaNeBbGWyP4oQneCMIfkQ75wHVDLPSAH/V2T
X-Gm-Gg: Acq92OFfh9XjoQrRqS7b+POF5TL6kuUAGPUzC7wLFg07LDskpSbKDVLQBgAANW94u5B
	eLNzFtQXpt+g/2CaSjnv2oSBybmz4CrwdGQuQ0VKXZcEpTYJAt9zvFoCW4LBrdIKwmkeBlXB47W
	zQReREluOmp8Mga+7uLd1douwD0svXRZTwu5s3aEXRc12oyiC7LgUO313v2NfFboCDjBBaVOiYd
	dfHYxtI5+qqb4FPOa2xDbzKiZjxGksK25H2k/phHfSm9IaEoDXx8S0uEvQMTe0cd/fV6FUC2Tu0
	WNxWjbw+MyOcpqJ3h9JlovniI9Cb2Gr9p9XdYvQx7PyaELTAP8aIpWUPvIlqmtooFcvTxZ4klBz
	3NUxDpoiLN/zHxZoRnPWDvY2HoCrlha4SnwO8Wf7kum87u8TENq7x8rXBHRel9D63Honn5DsWGY
	RRmkUdLamRPwO9l2MFHD09uoS7W4CePaq/fWI+ZlUILumOUAUPTfh9VQhYLzxAZaMCw7yk2Q1WQ
	Q==
X-Received: by 2002:a05:600c:b96:b0:490:4923:aa3e with SMTP id 5b1f17b1804b1-4904923ab35mr20036195e9.7.1779490900958;
        Fri, 22 May 2026 16:01:40 -0700 (PDT)
Received: from menon.v.cablecom.net (84-74-0-139.dclient.hispeed.ch. [84.74.0.139])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490456274ebsm67100265e9.15.2026.05.22.16.01.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 16:01:40 -0700 (PDT)
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
Subject: [PATCH v4 01/12] crypto: atmel-ecc - fix use after free situation
Date: Fri, 22 May 2026 23:01:23 +0000
Message-Id: <20260522230134.32414-2-l.rubusch@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260522230134.32414-1-l.rubusch@gmail.com>
References: <20260522230134.32414-1-l.rubusch@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_160143_049342_075E1C39 
X-CRM114-Status: GOOD (  16.89  )
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

Fixes a possible race condition, when having multiple of such devices
attached (identified by sashiko feedback).

The Scenario:
    Thread A (Device 1 Probe): Successfully adds i2c_priv to the global
             list (Line 324). The lock is released.
    Thread B (An active crypto request): Concurrently calls
              atmel_ecc_i2c_client_alloc(). It scans the global list, sees
              Device 1, and assigns a crypto job to it.
    Thread A: Moves to line 332. crypto_register_kpp() fails (e.g., out of
              memory or name clash).
    Thread A: Enters the error path. It removes Device 1 from the list and
              frees the i2c_priv memory.
    Thread B: Is still actively trying to talk to the I2C hardware using
              the i2c_priv pointer it grabbed in Step 2. The memory is now
              gone. Result: Kernel crash (Use-After-Free).

Fixes: 11105693fa05 ("crypto: atmel-ecc - introduce Microchip / Atmel ECC driver")
Signed-off-by: Lothar Rubusch <l.rubusch@gmail.com>
---
 drivers/crypto/atmel-ecc.c | 10 ++++++++++
 drivers/crypto/atmel-i2c.h |  2 ++
 2 files changed, 12 insertions(+)

diff --git a/drivers/crypto/atmel-ecc.c b/drivers/crypto/atmel-ecc.c
index 9660f6426a84..94360d29f9f9 100644
--- a/drivers/crypto/atmel-ecc.c
+++ b/drivers/crypto/atmel-ecc.c
@@ -218,6 +218,8 @@ static struct i2c_client *atmel_ecc_i2c_client_alloc(void)
 
 	list_for_each_entry(i2c_priv, &driver_data.i2c_client_list,
 			    i2c_client_list_node) {
+		if (!i2c_priv->ready)
+			continue;
 		tfm_cnt = atomic_read(&i2c_priv->tfm_count);
 		if (tfm_cnt < min_tfm_cnt) {
 			min_tfm_cnt = tfm_cnt;
@@ -322,20 +324,24 @@ static int atmel_ecc_probe(struct i2c_client *client)
 		return ret;
 
 	i2c_priv = i2c_get_clientdata(client);
+	i2c_priv->ready = false;
 
 	spin_lock(&driver_data.i2c_list_lock);
 	list_add_tail(&i2c_priv->i2c_client_list_node,
 		      &driver_data.i2c_client_list);
+	i2c_priv->ready = true;
 	spin_unlock(&driver_data.i2c_list_lock);
 
 	ret = crypto_register_kpp(&atmel_ecdh_nist_p256);
 	if (ret) {
 		spin_lock(&driver_data.i2c_list_lock);
+		i2c_priv->ready = false;
 		list_del(&i2c_priv->i2c_client_list_node);
 		spin_unlock(&driver_data.i2c_list_lock);
 
 		dev_err(&client->dev, "%s alg registration failed\n",
 			atmel_ecdh_nist_p256.base.cra_driver_name);
+		return ret;
 	} else {
 		dev_info(&client->dev, "atmel ecc algorithms registered in /proc/crypto\n");
 	}
@@ -347,6 +353,10 @@ static void atmel_ecc_remove(struct i2c_client *client)
 {
 	struct atmel_i2c_client_priv *i2c_priv = i2c_get_clientdata(client);
 
+	spin_lock(&driver_data.i2c_list_lock);
+	i2c_priv->ready = false;
+	spin_unlock(&driver_data.i2c_list_lock);
+
 	/* Return EBUSY if i2c client already allocated. */
 	if (atomic_read(&i2c_priv->tfm_count)) {
 		/*
diff --git a/drivers/crypto/atmel-i2c.h b/drivers/crypto/atmel-i2c.h
index 72f04c15682f..e3b12030f9c4 100644
--- a/drivers/crypto/atmel-i2c.h
+++ b/drivers/crypto/atmel-i2c.h
@@ -129,6 +129,7 @@ struct atmel_ecc_driver_data {
  * @wake_token_sz       : size in bytes of the wake_token
  * @tfm_count           : number of active crypto transformations on i2c client
  * @hwrng               : hold the hardware generated rng
+ * @ready               : hw client is ready to use
  *
  * Reads and writes from/to the i2c client are sequential. The first byte
  * transmitted to the device is treated as the byte size. Any attempt to send
@@ -145,6 +146,7 @@ struct atmel_i2c_client_priv {
 	size_t wake_token_sz;
 	atomic_t tfm_count ____cacheline_aligned;
 	struct hwrng hwrng;
+	bool ready;
 };
 
 /**
-- 
2.39.5


