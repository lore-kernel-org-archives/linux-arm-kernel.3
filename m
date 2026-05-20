Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5C42CD5BAA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 15:57:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gNOINsowG7WTZn4Wfd0Y0oRU0rQmWn1GPDfPM6W1f5A=; b=RT1osiL+oM9iSejt3JaSXWIrYb
	UGw1Lfp9zQtnRt/qyBJRoWDjOBOS8GlY4K51AYjwHWAbfT7qohiVWT6B6NNrfnuMDSTHj3dtCBEoh
	v0a8dgHiPZP4GGhJffsSBJ/f2Av1w/mbztfr6211jMEvg9UN8II6XYszQVjfsRv6PRK/rmXLmZIK2
	WMx7+b9Ti8BNXYKke4GwAZz2/ML6/VevOOjcVsIb8xRuiMfwE19LMOOVLsb8CDGPbcdfvMVOl2h5G
	bLLl+2eqRQsFmbhynqpCyymij7yEQHwjjTGMzB7XfqogS1WRRhOxbqiqK36/5DlEN3GDXoR1L/mIb
	K2yz+tnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPjIu-000000055iy-1gxw;
	Wed, 20 May 2026 15:57:52 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPjIn-000000055dz-1SFF
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 20 May 2026 15:57:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=gNOINsowG7WTZn4Wfd0Y0oRU0rQmWn1GPDfPM6W1f5A=; b=odQI++eec77dqKjbL/u0T2MQC/
	ms3S2nRQB7ymqRNnnirGrZhKT2LlPdyyEtKkpFI1IuW9IKrRmdmbeZhKwCCq1cQaAw5dUxN1bKbNC
	HpXY4gmbSVsaZDoEREy3jSA/VgcVeEOHchuDzbI/32S7nFm2s3nLs8vGVGD9f6nPqnylpbjEREBnM
	UNvFUrDEYGwUQBP8EiCHyu7+8dKwx+l0iwJhnUPdqEha7cT3CtGhFiOcIN5bjMJ4b6JslsenWJ4FY
	m1ikjSsi+hs15ywFFXfRfIq32rEIqKsQB0KEp0+mBUnxr/piCJ9vHnbok6NqNHcupmAEtf/s+5wz8
	n//G1ODQ==;
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPjIT-0000000HIuW-2YtA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 May 2026 15:57:28 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-48fde2f2d61so8460675e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 20 May 2026 08:57:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779292644; x=1779897444; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gNOINsowG7WTZn4Wfd0Y0oRU0rQmWn1GPDfPM6W1f5A=;
        b=CsONAw/muAA6DJme94Dfbe2ykYfGPi9ruhDTpJMf/FcqCNoJyBxmBp9R6rpLd/Osee
         lVet8LrwKpQfnuHhUOLcJOHi5A4Sn/xS0lav1zo+SNtD3288gcL2lImhMeihPIbI3usj
         3aWmhN/D1D021qktizuUdNC5OzXRl7ApteR4exydKQqhUA3+zNP/vOvLl8/TjsC0FI/a
         TELKvl9/R+DSxW97w8LPEVNzxCW7x/WkE5iJ8B86CDv+qhBJXvClnBysDTQCTG0WQzjY
         Uu3vn6gNeJ+b0HYynzq+Z5Pzu90yYoaDYr9lpZG2amOc2Yovqckp5e2wqmBxgkdualnq
         lxVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779292644; x=1779897444;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gNOINsowG7WTZn4Wfd0Y0oRU0rQmWn1GPDfPM6W1f5A=;
        b=PQfAK8FCHOd/EfWoatBpDohah4V1V9p1JfCvJyxvGIdEe1XcjLI2bdUxKCgwV3mXFp
         CFG8UjyE+/Qb1uzluku0msP6Dln0Sdp53eVOY0AD+34RxjHYsbAOWnbJWgkuToDvToss
         YH0vu6DYLvpJ8n0FtGoq+RtaQuq2qLl6FabGLXyEIRYJAAI/746NRI+g1Pz5BMZEWMZj
         EWFS3Lko0RM3zeatTPbOB/BN/xI4e4lMk/87sGrhbnS7r01Ese+UxGWUh/HZMw2W1nw+
         SZZ68v36smWaPfKELEE6WqbAppBCT3JHd9P8Se2RpqXWH0RtgBL/yVRu22JppVYpxlcq
         b9Kw==
X-Forwarded-Encrypted: i=1; AFNElJ8yZGGQMMJsImBXz6JJCjx8rYC1rxIhCtHNZctgNvwaCanapx/yuqrsthwqMOSL5uO4V8h2R33MLmNH/ZYi969K@lists.infradead.org
X-Gm-Message-State: AOJu0YzKgmZexW/nGuhzu5s/NbaVeqxkPDFx0oKpLWQy5fzDJAkkROXQ
	NgK9YDyTZmpI97CakeKSVPAtcxg2H4sh8T/ruXe/ZRkwLRo/0Q97Gt2Y
X-Gm-Gg: Acq92OGMezOdJtZLjLR/hPdVMSsbGvZvwgSi08j3gKQKVaS3PO0ZnC6vAfqP/jMGmfe
	Q4mYuUCxpeNzy8JBfHHAXCq4fehS9wIzxJXBrfLR5f5KcTceBuwgQ0zJgRL3E8skuHVKj6viYpB
	eGJ9vulIff5mhm6xlNffnQyvnXaMvYtm3Y5voBAKOvno9VpQwqgJTU1Jjdb440Kk6JPAj6xorwv
	ITO6V3K2qhdtyXpxigMme+G5UY1zvsdpdjxIO0JKwPy83qpxQMr4hX7haruDCaE7hn7ZpJ3KrA5
	+lwraQXTml/GFKHrYnDSugHGaVPS/oJQVYSIreeS3tw7epx14mITE+rO+NWo9WjQ0fPtrgzva68
	lYjAJSNCjqcBDhTCQMgZaL0ayX5rwbjIy6F1w6m6hZFaXYoNilt53/sVM+NCLy6NrdPmp8TAPnp
	TYiVNJ/bcQubsa+ImFr5da36ZoV3KALoZeU5CeyW6UpYRcp3VIv+BWY+JyNVGjtwq9BnBrEAT+d
	A==
X-Received: by 2002:a05:600c:4587:b0:48f:d410:605e with SMTP id 5b1f17b1804b1-48fe632143fmr188644315e9.7.1779292643905;
        Wed, 20 May 2026 08:57:23 -0700 (PDT)
Received: from menon.v.cablecom.net (84-74-0-139.dclient.hispeed.ch. [84.74.0.139])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48febe79ce3sm137216715e9.31.2026.05.20.08.57.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 08:57:23 -0700 (PDT)
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
Subject: [PATCH v3 09/12] crypto: atmel-i2c - implement capability-based client selection
Date: Wed, 20 May 2026 15:57:00 +0000
Message-Id: <20260520155703.23018-10-l.rubusch@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260520155703.23018-1-l.rubusch@gmail.com>
References: <20260520155703.23018-1-l.rubusch@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_165726_928702_A99C3D56 
X-CRM114-Status: GOOD (  19.73  )
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
index 19e9ee9c15e5..ec8535b1d4f8 100644
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
index e10713a7bcfe..7ef62b40c353 100644
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


