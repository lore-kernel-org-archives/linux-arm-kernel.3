Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79EE2CD5BD2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 09:27:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kNd8JRRutou7cnYAoh85T3g5wIr46IBSZCq17y/WOqA=; b=dzN9KYP+i1JR0Ubz0Txt7UXTAJ
	xk1E8XaHRDm9lEAd0sP2BoTsfMPk+yx4soPv9G0Q5Zl7roG4pV8CbIZaNbPQ+CkuGpZ4+WHU6pmBw
	xZ3NaxR4nIK8QfMcchk8UlKpOYUunR6AxNf26BbXUT/dxeMJT4ebv4JWmCLBYsMBqdR9isYV/5bF5
	iopyXChGF8nFFitLjILl+606qj4MXDunr3dCmtUI+a4wyZqlUV4QrXVg/vjRff7rhk775ygSC5UmA
	5LAj3TB/GLTd4NGdF6aEf0jwdB8ZNZm81Qgo0JVsBzQmvz+XdNpVv2Rbw1tGkSmDbbL/G0C+PiQuT
	e0/A3ACg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wStUo-0000000749x-1pNa;
	Fri, 29 May 2026 09:27:14 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wStUl-0000000749O-45P9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 09:27:13 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-48d10c981e4so14171125e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 29 May 2026 02:27:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780046830; x=1780651630; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kNd8JRRutou7cnYAoh85T3g5wIr46IBSZCq17y/WOqA=;
        b=r40TrMqjefzt4Q7Eg52OaJZ3KEyrxb4nJKOo31HWMUKPr0C+dlRvsq4SYHByLxwNP8
         hNMIQkN/SmxYuR0CcPqgOxblWai61veME2z1XEFcMykC7dFAD2/cWBzV+wIh3SwoLkV/
         7KSE+D8eUuzTjnAN7uXtdWtkBsXzx+39gloJ93N/32QyBAMu3adbcr1zZIdoF3vmILM0
         k0tRk8vAsbHnLoFT/h61smh09X/1Fw8f8vSIvEmylFqem45/lRt6xQG/fKEvtZl10w03
         ZLVf8dGuzCz9JGe/w++XBzbq7SsGb8T+1h6jhKHEMLr/WemLNVvuEN9ruO7MMi7mP7G4
         uTtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780046830; x=1780651630;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kNd8JRRutou7cnYAoh85T3g5wIr46IBSZCq17y/WOqA=;
        b=C1M1JJ0bSfgBydQJ3MP98DevEkvfvFkLonOVUv3hKNnziWGBhuuQ484g8VY1f4vZ3f
         d4OtOv4S1X5iqvZX9gS1by79T+qJAukUbGgbsl9soNxig8INLhbn81zrJ0saQh1Cfwbt
         P/xKJqhCjQtfnOIU/xgEj3hcokV+yt/voAvup5bXgienaIAvg9oyUt/uMOsOW0iyUFPz
         Jz7tdkANzt5BVNkXgWXu7BKidGF4mNqx6r0DkmtwacwHuckfuniYN9szMuAf/zN8dDJP
         OtVzI4UkU1tDNK7aqKpRUurcCvwVLmoPfFyZMoaRs8xaKwgufDV/ilWKW6ynEQYx0NUj
         c4yQ==
X-Forwarded-Encrypted: i=1; AFNElJ/vF/VtzfBBbr96VlX8xuVYz+iWBKwLI9FTknNbjqgOEWR39PCbIslmMv2faa7L+KAMoxKoNav+bO4ddY7Tm9tS@lists.infradead.org
X-Gm-Message-State: AOJu0Yy6mBZYjj+WiahLiQQZMPmZ7AEZZyaydzUq2/bxdnHiNxN5IGzP
	/xI9cOOVVEnhJdWOwOR3he5uZbt8YqtbdbxyMp4u/QLxE7HHxmze0Qb0
X-Gm-Gg: Acq92OHBRgh27PjCCG/BhYCp3Vy9dKQHLYBN8aJ41EpAMnDKmzS2+LEM9H813vhRPst
	I1ZYGgxVR/Yjz8l2C6mEgufAmWsIijcn6dAq0D2pdvNQeMCIRo7uR+gJsmTVD2ABIbFdtggftoD
	eXo3i4IszX85XNmWM+6vrecRCAlB83yYpnXmlxS1Jd5As0DtfwYe+J9K4JEmv6G5WgIYcDBf7Se
	RoQDai6bbMb0PQE+xtYQNbocGdyJkB1KXEjpiRScBsFd0SyC1vUX/jLYZZzsD0chdjVC5UtKhuO
	fCN9tOHR4hOfVghRLyl1MkoMTi8Jz9Ft7PbLJvHmeIrOth8ps3KqwWIQFS2AdRMToQ5Oo95GT6f
	l75u6tVJ+omNd0/7klzAXeknnrhZPjSmd26ptraTlnxVRpsia5AjfnApuXLxBUHAL0GbRdNsYQU
	4Nsl3geqlwCl68eBcwxhlKJEOHwJxRmmh0dkHO7jnyhyYKulbNk8O6Y6LnVEgsSYmnWDXekBm7t
	w==
X-Received: by 2002:a05:600c:6d08:b0:490:3cb8:b853 with SMTP id 5b1f17b1804b1-4909c0e0d29mr9716185e9.7.1780046829525;
        Fri, 29 May 2026 02:27:09 -0700 (PDT)
Received: from menon.v.cablecom.net (84-74-0-139.dclient.hispeed.ch. [84.74.0.139])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4909cab0e79sm59295725e9.13.2026.05.29.02.27.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 02:27:09 -0700 (PDT)
From: Lothar Rubusch <l.rubusch@gmail.com>
To: thorsten.blum@linux.dev,
	herbert@gondor.apana.org.au,
	davem@davemloft.net,
	nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev,
	tudor.ambarus@linaro.org,
	krzk+dt@kernel.org
Cc: linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	l.rubusch@gmail.com
Subject: [PATCH 1/1] crypto: atmel-ecc - fix use after free situation
Date: Fri, 29 May 2026 09:27:03 +0000
Message-Id: <20260529092703.33086-1-l.rubusch@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_022712_031317_F8266544 
X-CRM114-Status: GOOD (  16.44  )
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
index 0ca02995a1de..d391fe1462f6 100644
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

base-commit: 5624ea54f3ba5c83d2e5503411a31a8be0278c1e
-- 
2.53.0


