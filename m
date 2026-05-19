Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2E1BCD5BAB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 20:48:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LjpnSe9r8g1EhPpSrGAgVKmBUmEd4FiP3tGuvmdsN18=; b=vbkTmemVfrHjCTT2b/f1eMYhaR
	rbd5o3EUdGV74W7lxyWTQFg7aiiurQ+D/YloMjuuEPR86wYjl4tshVjWDPETuWzlJL9ukPSZEIY5a
	ENiCKepdMQcQPmJO5fXskR1bSYxWEShVjMF8wEazsCrxqpv3tae9Q73g3kbuL5NYkuS2DrXpIgWyj
	C9Jh94wA0Oko2l01bj8e5SSAH95BMLkmWW2/H56xxUlEm724JMdycNvJ0txh9QmVjgSjHqAP3XZnI
	uurB2/XQ2/Qkz6bMFhFjnkDAvoMmLqcv3lLMjxq45MbXFjxC6Fip243rMcsRTywYklWG5P9gDko6G
	vQXTGpyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPRMf-00000002lPa-20kw;
	Tue, 19 May 2026 20:48:33 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPRMR-00000002lCs-3U8z
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 20:48:20 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-4462f8d2488so257930f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 May 2026 13:48:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779223698; x=1779828498; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LjpnSe9r8g1EhPpSrGAgVKmBUmEd4FiP3tGuvmdsN18=;
        b=OYFOk2JLhTZZYDVSI17hv/xgu0LY3LSRE81o/80RtqftRtsQHHA533aR7f/hdYEqqF
         fk1iHwZiWUT485vdmbtnXLtAJLZ8s6OxXfKfb3QCk9tMBPz/QQTNJ/V70/+fFpkggt2A
         pjD+7Y9xiHqO0RcNLPh1MKUCs0jsZ69pFphpNZt6uXUUxVbGTFUYpoaA+sFtGCw9yP47
         Em8Bt5+PLhBJrgcMugJXCnkJJ+b/qRy/e3/CYf9PV8qa50m/GzWTuTB5RZM2lgSYum78
         jR0qVIPIk7Wl9g83EZwsIksibXWt9vc5uKYxAtyAYjMiLAvlVs4PmOOjzcfHPzbCuEU6
         5VMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779223698; x=1779828498;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LjpnSe9r8g1EhPpSrGAgVKmBUmEd4FiP3tGuvmdsN18=;
        b=QeLJ2eq/AWTrZRuvTNflyDndK1koxRPGjM6YGX/okE3m0Si6sBru14eJF0fS7X+1A4
         8xoz4jQbnXbAFaGCoSaKMc0YXt/6rBEAxUiIfwjz6OJH15wnSEd96hOGpINmxJJktQMf
         IZaKqxVmB1h19Yuj46uJvLFFJoN9WbTO+g4YBL+vt9Hni8QkoXooRmO7cVZp72reRtcJ
         Q1AQJ83DFUcUCLb++d5Xt0gJowc9twCfsBe3XSXe9kjmQbyoOFj++flUvgaj0FR5MfuE
         F/eAsrKmo1q4r79vqKXOSgyosA1eYSLUHiS1+nMLFd4dEDLvQzZD1S5ayBacGHi5XorS
         7rHQ==
X-Forwarded-Encrypted: i=1; AFNElJ+/gjSyd0mzCGLdCpQzoOGJuuUIgquzD7D/fliheGTaPQL/EVzak0LsCpKIhib11GJd2pzwTDwOBZNIctkgk8Wk@lists.infradead.org
X-Gm-Message-State: AOJu0YyEkTtOy+IsSuAKX58d8zamwDBMr+L8pDmHOfpoK9IZoefvbXhJ
	wSYuc4LBb5yPN8ACj/oXU6AxHd6S9dYyRE7o03++pMvlA6dRO4+oER7K
X-Gm-Gg: Acq92OGzvCJwsPGqTJZ380RS3vsOxjVbJ+CXR5Ibd8L1SQw/ce+fg7qIqDjJr9syt4F
	CxewQWBElXset14I06YP3Wreyd4a+X7RyDDkSZrBXtQ1qmYijbkDv/yrX8k5TE1rPS/Ges7APXG
	E61B0NHszPYCLL37juDRH7I49QksbbMraQS9LSX4S58m0F86mLyyAm1EhBT1IKEwbWAx7yy/Fax
	/kwyMIXMTuA2IAMcaGC9ykNHMfPXVaqSF8O9WZN7dfemyyZu5Njy36GB+dHrAYUmX1X+odyV8bZ
	LmICS7KZu4Cd+uKvL9c/r/yieCZrw1gm7KWaDj/EhdOyEJ6vgksVGn5+vlknKuhYhLnReZPaipe
	ngna7dZyFsukvD3Y6arXk9P4it2geBSmBzBtGCcVvwPTNlu9+CF/XosvLnZ8r+qYM+5XK2lPx0h
	goEGc6Huq/Fd2cY0lO0UtYcJv/xsYyu3tixyhTtCwDhpCW9Rndu6SMzLp+BIqIfTI=
X-Received: by 2002:a05:600c:1914:b0:487:1fbb:5a28 with SMTP id 5b1f17b1804b1-48fe5fcb651mr173127925e9.1.1779223698112;
        Tue, 19 May 2026 13:48:18 -0700 (PDT)
Received: from menon.v.cablecom.net (84-74-0-139.dclient.hispeed.ch. [84.74.0.139])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fe4dac000sm356457755e9.0.2026.05.19.13.48.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 13:48:17 -0700 (PDT)
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
Subject: [PATCH v2 09/12] crypto: atmel-i2c - implement capability-based client selection
Date: Tue, 19 May 2026 20:48:00 +0000
Message-Id: <20260519204803.17034-10-l.rubusch@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260519204803.17034-1-l.rubusch@gmail.com>
References: <20260519204803.17034-1-l.rubusch@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_134819_894818_7031A3E8 
X-CRM114-Status: GOOD (  19.87  )
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

Extend the shared I2C client allocation interface to support feature-aware
hardware selection by introducing capability filtering.

Add a 'caps' mask to 'struct atmel_i2c_client_priv' alongside an
'atmel_i2c_capability' enum. The allocator now explicitly filters hardware
nodes by a requested capability bit while retaining the least-loaded device
load-balancing scheme.

Update the ECC driver to advertise ATMEL_CAP_ECDH configuration capability
during probe, and adapt the tfm context setup execution path to request
this specific capability variant. Initialize the bitmask field to zero
inside the SHA204A driver context for now.

Signed-off-by: Lothar Rubusch <l.rubusch@gmail.com>
---
 drivers/crypto/atmel-ecc.c     | 4 +++-
 drivers/crypto/atmel-i2c.c     | 6 +++++-
 drivers/crypto/atmel-i2c.h     | 8 +++++++-
 drivers/crypto/atmel-sha204a.c | 2 ++
 4 files changed, 17 insertions(+), 3 deletions(-)

diff --git a/drivers/crypto/atmel-ecc.c b/drivers/crypto/atmel-ecc.c
index 7d090c557330..11ee8ef71b94 100644
--- a/drivers/crypto/atmel-ecc.c
+++ b/drivers/crypto/atmel-ecc.c
@@ -210,7 +210,7 @@ static int atmel_ecdh_init_tfm(struct crypto_kpp *tfm)
 	struct atmel_ecdh_ctx *ctx = kpp_tfm_ctx(tfm);
 
 	ctx->curve_id = ECC_CURVE_NIST_P256;
-	ctx->client = atmel_i2c_client_alloc();
+	ctx->client = atmel_i2c_client_alloc(ATMEL_CAP_ECDH);
 	if (IS_ERR(ctx->client)) {
 		pr_err("tfm - i2c_client binding failed\n");
 		return PTR_ERR(ctx->client);
@@ -283,6 +283,8 @@ static int atmel_ecc_probe(struct i2c_client *client)
 	i2c_priv = i2c_get_clientdata(client);
 	i2c_priv->ready = false;
 
+	i2c_priv->caps = BIT(ATMEL_CAP_ECDH);
+
 	spin_lock(&atmel_i2c_mgmt.i2c_list_lock);
 	list_add_tail(&i2c_priv->i2c_client_list_node,
 		      &atmel_i2c_mgmt.i2c_client_list);
diff --git a/drivers/crypto/atmel-i2c.c b/drivers/crypto/atmel-i2c.c
index 4621aa57833f..e6eeba1f6554 100644
--- a/drivers/crypto/atmel-i2c.c
+++ b/drivers/crypto/atmel-i2c.c
@@ -57,7 +57,7 @@ static void atmel_i2c_checksum(struct atmel_i2c_cmd *cmd)
 	*__crc16 = cpu_to_le16(bitrev16(crc16(0, data, len)));
 }
 
-struct i2c_client *atmel_i2c_client_alloc(void)
+struct i2c_client *atmel_i2c_client_alloc(enum atmel_i2c_capability cap)
 {
 	struct atmel_i2c_client_priv *i2c_priv, *min_i2c_priv = NULL;
 	struct i2c_client *client = ERR_PTR(-ENODEV);
@@ -75,6 +75,10 @@ struct i2c_client *atmel_i2c_client_alloc(void)
 			    i2c_client_list_node) {
 		if (!i2c_priv->ready)
 			continue;
+
+		if (!(i2c_priv->caps & BIT(cap)))
+			continue;
+
 		tfm_cnt = atomic_read(&i2c_priv->tfm_count);
 		if (tfm_cnt < min_tfm_cnt) {
 			min_tfm_cnt = tfm_cnt;
diff --git a/drivers/crypto/atmel-i2c.h b/drivers/crypto/atmel-i2c.h
index 6c2d86fd9068..636d21bd1348 100644
--- a/drivers/crypto/atmel-i2c.h
+++ b/drivers/crypto/atmel-i2c.h
@@ -115,6 +115,10 @@ struct atmel_i2c_cmd {
 #define ECDH_PREFIX_MODE		0x00
 
 /* Used for binding tfm objects to i2c clients. */
+enum atmel_i2c_capability {
+	ATMEL_CAP_ECDH = 0,
+};
+
 struct atmel_i2c_client_mgmt {
 	struct list_head i2c_client_list;
 	spinlock_t i2c_list_lock;
@@ -131,6 +135,7 @@ extern struct atmel_i2c_client_mgmt atmel_i2c_mgmt;
  * @tfm_count           : number of active crypto transformations on i2c client
  * @hwrng               : hold the hardware generated rng
  * @ready               : hw client is ready to use
+ * @caps                : feature capability of the particular driver
  *
  * Reads and writes from/to the i2c client are sequential. The first byte
  * transmitted to the device is treated as the byte size. Any attempt to send
@@ -148,6 +153,7 @@ struct atmel_i2c_client_priv {
 	atomic_t tfm_count ____cacheline_aligned;
 	struct hwrng hwrng;
 	bool ready;
+	u32 caps;
 };
 
 /**
@@ -192,7 +198,7 @@ void atmel_i2c_init_genkey_cmd(struct atmel_i2c_cmd *cmd, u16 keyid);
 int atmel_i2c_init_ecdh_cmd(struct atmel_i2c_cmd *cmd,
 			    struct scatterlist *pubkey);
 
-struct i2c_client *atmel_i2c_client_alloc(void);
+struct i2c_client *atmel_i2c_client_alloc(enum atmel_i2c_capability cap);
 void atmel_i2c_client_free(struct i2c_client *client);
 
 void atmel_i2c_deactivate_client(struct atmel_i2c_client_priv *i2c_priv);
diff --git a/drivers/crypto/atmel-sha204a.c b/drivers/crypto/atmel-sha204a.c
index 6e6ac4770416..3853d2b95449 100644
--- a/drivers/crypto/atmel-sha204a.c
+++ b/drivers/crypto/atmel-sha204a.c
@@ -173,6 +173,8 @@ static int atmel_sha204a_probe(struct i2c_client *client)
 
 	i2c_priv = i2c_get_clientdata(client);
 
+	i2c_priv->caps = 0;
+
 	memset(&i2c_priv->hwrng, 0, sizeof(i2c_priv->hwrng));
 
 	i2c_priv->hwrng.name = dev_name(&client->dev);
-- 
2.39.5


