Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D83C8CD5BAA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 15:57:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oJt+1uhmRklXQWY1fAdB9UbwqmpgsjgJ14JFT2yZWDo=; b=J6H+r5rf59ej+LWHElLOhPHn45
	4mLa3WV3cBuoGhZ8sqEONP68skyvCbi+Z06WKKhq37nvVD/jpANIn2gtQUc/txbCNFjMkwFgN4Gii
	orw9JdCXw+5epaHj3SP1GnbNVnoPyvnk/7D9uaroV6T/x2750oNWBE6w1vLPR0LVdWAx3wG8v9pek
	PBkhUqJ3EsEipeCQh4rhmg3+HORW75BOTmQj86vrh+OTuhJMLpUlT048rvFE0OslH7FdVNFNIQBfU
	GIjLyzfvzNjrVpRFHin6+ZrufQwj6hRf14KHoQhiwuWMdFVMG8sP55hFITjL88fLfoM6Jq2z+lGwY
	giDRUfBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPjIO-000000055HY-3ga8;
	Wed, 20 May 2026 15:57:20 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPjIM-000000055FU-0oM2
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 20 May 2026 15:57:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=oJt+1uhmRklXQWY1fAdB9UbwqmpgsjgJ14JFT2yZWDo=; b=YVcvBXOOJIdb+VgHwiOnYZ5Ioi
	O/d/PSNqT23KhfBJeQu6DzRatM8nTuPLb3eATd30uZsSBFIiFauGlqDpdt/HRtEZpjV3OVQz0xuKm
	aW4jSgzsEw2mBk9e5u42Dk/ykxtSrbnxo/9jxj1Uh8CmD9kvaHbGN/kDfLZMT98JhyKRpOQvEn3EN
	SSI/VSsC+PNCzFGiAPS6gapeEegqiIUDXHrUmLJl858ktX3BHl7vy1saJ1nl3TWS+tzB2O9j7WaJy
	jH5n/iOGqS1Ma0UCa1S+39aRFUIvjs/iwXdskNual+cx7X93q34L8uUIA1Ak9WenV9eFLtycaXg4V
	udgT38bw==;
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPjIH-0000000HIr1-3Jsd
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 May 2026 15:57:16 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-490227b682cso1297585e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 20 May 2026 08:57:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779292631; x=1779897431; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oJt+1uhmRklXQWY1fAdB9UbwqmpgsjgJ14JFT2yZWDo=;
        b=BCZDmRKqlMABHL/hlcKLrv0FJoWSIxlUTDUAOqBWOamKoWq7gpMP7Wf9GX2EAACRdr
         g3xwo92LnuSvE5bl0BCY79UuhrQRo75nC3rFeRAqR10TyTDFkrtF5t4jhmzYUF2Zz5M3
         weq8hfAsCXTTPRt56gS19c44Pt9dBUPxGw3slOOBLQaNXLFleiEdzxMW8wZqeYgOs25a
         3NpPs8z+J9LLhP11d8Tzr+zUXmapMuJKYelgM+LNZ9sGkNB3eQvqMiJdh23cwjTPe5lk
         rOZkaKTmwplXbZXxXKWsOtnUY9UceHYSdzkayxfTO4VOGAheQYAZFdMTil+8n+g0Kfr1
         ZQWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779292631; x=1779897431;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oJt+1uhmRklXQWY1fAdB9UbwqmpgsjgJ14JFT2yZWDo=;
        b=csVWXuWrY4qXYvKe/r3vokdpKC5qTVGM7rvO3r8JNW2UxS7r1lznVzb5YuyopcP99b
         6Hvr80NydJL4udXrwBNgA9MgM9pepFmWkicEF7D54i9lFbu4GfQ365zkw2olvP3TZBwL
         1nY7hNtu3NleTArj0xPL0NJw/iLullhxgSDbVCKTdSUpyjVpZm8uXTwNY0v54axqPtLW
         kGe1ZPl5HlGbv0IY6Of1/CCVDT6ObjyyR7hW96viE4DrR4qQrX7EPPSY0uPugdgbPmk7
         82dUAgiMuQV5lY+2nRHL8p3CZHduSqlM55kYVqfHP+Ln0E1hRJ3U0eX3oJQ+RZVylXw8
         vq1w==
X-Forwarded-Encrypted: i=1; AFNElJ89H/H+OHm27i1VfPki901hA5JNaDC6gH0h8tov9WJgfQtWZlYBr2IPFZLH6U9GoFU0H0ne3C9Rdkx4iCeJxCTh@lists.infradead.org
X-Gm-Message-State: AOJu0YzVzd9qYvKwY34+nrv/dwEDLVluIvnPetuDEk6suvS0r8U01ijN
	+egUq+N/lBMG7QgX7wLvMfb598MDuIhFaaIM9bT8zI7NaN/G1yLjIqiK
X-Gm-Gg: Acq92OFXNe4BmBUCPJ90c3IiDgEy6ukoF8U4uM/7RWtY272DCpqxml1fWJIXJqq5al8
	FKSgWP5At+Zyu/nyWVI/DY2Leby4RHMCA/31qjBU8xFgFFx3huoskbPETQtzY9w2MgsV8nkYO/0
	XvtrgWxuRFhNoS0mvnPi9JF06c0FOkJen8C47q7ElySU33YRNi5V2BMgD0zAQM7wtDHaYtpImVR
	9DFjoqf/ha5kkxE30CwHyA5eaHWVQ8Af3Xnb8q3zrAJdJk063dG6y/X/CYD5AYWCrL6D23p3Ty0
	g0O+9k8NL7KO6YzSbwwhJJhdYIpzIK+pHMIUVcBqJKRyTVhZQMcvxejSLDtaMhsHV9rjZ4xzP8N
	fpUWCkKKkx904pCbwldDgj1vmobGaq0p7gXgeeQcN69gBasuiq75iO99U10bY4U/9O8IvyF5HFo
	5JIJjsRFtqOz9R3DkEAxfgSF4cIlt6bq0Aigmek8Ay+CPAe+jqRB8HXv91DadMqlK/qH0wNcRsP
	A==
X-Received: by 2002:a05:600c:8b25:b0:490:6ab:406a with SMTP id 5b1f17b1804b1-49006ab40f1mr142371715e9.8.1779292630575;
        Wed, 20 May 2026 08:57:10 -0700 (PDT)
Received: from menon.v.cablecom.net (84-74-0-139.dclient.hispeed.ch. [84.74.0.139])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48febe79ce3sm137216715e9.31.2026.05.20.08.57.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 08:57:10 -0700 (PDT)
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
Subject: [PATCH v3 02/12] crypto: atmel-ecc - fix use after free situation
Date: Wed, 20 May 2026 15:56:53 +0000
Message-Id: <20260520155703.23018-3-l.rubusch@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260520155703.23018-1-l.rubusch@gmail.com>
References: <20260520155703.23018-1-l.rubusch@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_165714_779274_F2A411CB 
X-CRM114-Status: GOOD (  17.17  )
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

Fixes the very likely race condition, having multiple of such devices
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
index c9f798ebf44f..4c6860fc3dd9 100644
--- a/drivers/crypto/atmel-ecc.c
+++ b/drivers/crypto/atmel-ecc.c
@@ -218,6 +218,8 @@ static struct i2c_client *atmel_ecc_i2c_client_alloc(void)
 
 	list_for_each_entry(i2c_priv, &atmel_i2c_mgmt.i2c_client_list,
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
 
 	spin_lock(&atmel_i2c_mgmt.i2c_list_lock);
 	list_add_tail(&i2c_priv->i2c_client_list_node,
 		      &atmel_i2c_mgmt.i2c_client_list);
+	i2c_priv->ready = true;
 	spin_unlock(&atmel_i2c_mgmt.i2c_list_lock);
 
 	ret = crypto_register_kpp(&atmel_ecdh_nist_p256);
 	if (ret) {
 		spin_lock(&atmel_i2c_mgmt.i2c_list_lock);
 		list_del(&i2c_priv->i2c_client_list_node);
+		i2c_priv->ready = false;
 		spin_unlock(&atmel_i2c_mgmt.i2c_list_lock);
 
 		dev_err(&client->dev, "%s alg registration failed\n",
 			atmel_ecdh_nist_p256.base.cra_driver_name);
+		return ret;
 	} else {
 		dev_info(&client->dev, "atmel ecc algorithms registered in /proc/crypto\n");
 	}
@@ -347,6 +353,10 @@ static void atmel_ecc_remove(struct i2c_client *client)
 {
 	struct atmel_i2c_client_priv *i2c_priv = i2c_get_clientdata(client);
 
+	spin_lock(&atmel_i2c_mgmt.i2c_list_lock);
+	i2c_priv->ready = false;
+	spin_unlock(&atmel_i2c_mgmt.i2c_list_lock);
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


