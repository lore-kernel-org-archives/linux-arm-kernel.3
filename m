Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91A77CD4F4D
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 17 May 2026 18:07:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UnEz4kb5yNtR6Ed+ZspZs0azXccaDtFZKA7zrYYeQpw=; b=fTneHTujGOCW22NO1f9rzFJReE
	TS/x9iVk0LoWl5skUIIlcIPuX5Sk9bMrbKCdnyfbVrSaA/O9C70JLStY485Gd+mB3J7PGiwN30it9
	c5VIPFg2qUlSnx1SDvSHlawXks6eTpNY7WHUkY1oe20Pfm+DpK3bJWH/MOcjllkl3vUEcey+Hjkrb
	EBiKfTtxUrzNArWYhr0Q0KNiY8YRUlgCtlP/ly8VjLj4RDKW5e/BtaexOUibi7grTAoRtYNrwX/nR
	OV+87kG6IYHMfe8VP3kgkfBf+xtD+Mv+1dmhU+gi0cTa9ssBvqWD0CcdSZGHDmuI37s3DihVzcduJ
	lab7MSbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOft9-0000000DAQ5-09Qw;
	Sun, 17 May 2026 18:06:55 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOft3-0000000DAN7-2OkC
	for linux-arm-kernel@lists.infradead.org;
	Sun, 17 May 2026 18:06:50 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-48fde2f2d61so2892705e9.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 17 May 2026 11:06:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779041208; x=1779646008; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UnEz4kb5yNtR6Ed+ZspZs0azXccaDtFZKA7zrYYeQpw=;
        b=oXFutgwiTsUbElZthY5MC3t+iRr+Pz5fVvivNFZk2wW6+8hfv0LcFTRQfmz/bjhUu0
         vftKrqkfX4XNwPDwh0MW6HZxC3+yRVLH+ST4TyznfS1/pvP+2XjVoLDdfDQ8KMK6vd39
         j95XNKzVaks8UQymQGhUZB1W8hh6N+Q+NAamFS65iZNUuIzOm5DqL5XxPcrdJ24r91hI
         exWkeAdFbIvUphvcYGg/ZAVWziAw8zGxWNvNscZ0iJt2ccWcde9vcWilfkmUhbV1tEzC
         Hdu5qRf6f/XuIWB4TtVx5qqSKHCIb+sokMe7kr8fozdDSXJhimouHw+hGKWYBSNwy/zm
         Oa/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779041208; x=1779646008;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UnEz4kb5yNtR6Ed+ZspZs0azXccaDtFZKA7zrYYeQpw=;
        b=DzIaOz9SzgVg70oB9rdKpBEf6AxqLGbkPlVD0V/WOEY030L1EJk1kKNmgGG5dRhH6V
         pdpeNnY/owdABc11XZ3JCfxFbWdztA9c9J0kXEr5T9iIO2T/f3cdn4b29BmkylXpoqPP
         UW0ayHGVItHijEV62PbYS8OhIgx2yTwhjBiVoZJKQy69iL2+0XvN1LkabY98k/aOHYjY
         Fsi+ewcqCF239dug38u8ut7YRCuqlrfImrsXj1ocK0TxJ+2ZPCYjrVx3BLdLK0Vog2Va
         IM460qbGKs00kjH9AQ4zJpgd3ph3ZLeAp5P9Mhe8bKokdfyyDw4+4x1pV0DUXbdp7Ets
         0aLQ==
X-Forwarded-Encrypted: i=1; AFNElJ/beE4OmDkRkDF3OsVmT5DdfbwIebk/pAwaAzBHnnnmA6m8vD7DZgZ8HQ98UaJXjPh0qUn6bBgyCxJh2xHBfaxZ@lists.infradead.org
X-Gm-Message-State: AOJu0Yzh6Q9mB5dHaA6dZjQrrljFCZfOwjdvpg7yFdg7XdfEW9BnbCLH
	bbqehOIKwGUg6+7+fWf22rAvqTpMECiPRdLz3uAl+RVkJ7z3Cgqi/Pd7
X-Gm-Gg: Acq92OGk/vPoWscImwl216U6WB8gJEY/sRUFS2FEAekXPs5mOPP85ROPMuYDncEmhlZ
	JnKNKEPi+hrGydtR6i/tY6p8ve2zw5eG8g9leyT3cXDWUe3jNFByK11eB/y9E9WOZ2QiPNYy12H
	dgNxruhNDQE8oMEQfm8Q2NNiLgEcPYZHLyrDd/DeNSONlDfhcVqm2eL5mR/ODDbJZxe18/ryvdB
	sLN1noHofmgciENICbhyTAcB5mJ/grTCyYQsXXmKYj5BEsWkMi5KBZ0nPSbvmH3e3e2qyy33SDb
	dre8rbPAztYqvAFDeThyNlsi2ASmGRs49QqYEjpR4kgj6Y/L+Et2O3Lnnp7WWUFGDeeHmnkFn8A
	0hHMjrneinkExkLdyJSwajsv46JRYGHtC9y++EJzjK4GreH3ztYHWP18INlyY34ioNu1N7chpXB
	qAMH5L9S51imemp+R3U6ZWVnahzBgu+QdJj/Hr0IGGqGEGj7Oc13bFaRXd3P8R20Q=
X-Received: by 2002:a05:6000:29cf:b0:452:db27:b3ca with SMTP id ffacd0b85a97d-45e5c60a590mr5430759f8f.7.1779041206655;
        Sun, 17 May 2026 11:06:46 -0700 (PDT)
Received: from menon.v.cablecom.net (84-74-0-139.dclient.hispeed.ch. [84.74.0.139])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da15a6454sm31766775f8f.34.2026.05.17.11.06.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 11:06:46 -0700 (PDT)
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
Subject: [PATCH] crypto: atmel - add capability-based I2C client selection
Date: Sun, 17 May 2026 18:06:27 +0000
Message-Id: <20260517180639.9657-2-l.rubusch@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260517180639.9657-1-l.rubusch@gmail.com>
References: <20260517180639.9657-1-l.rubusch@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260517_110649_636148_B1C9BC02 
X-CRM114-Status: GOOD (  19.29  )
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

Add capability filtering to the I2C client allocator to support
feature-aware selection of hardware clients.

Each client now exposes supported features via a capability mask. The
allocator selects only clients matching the requested capability and still
prefers the least-loaded device.

ECC marks ECDH support during probe and requests matching clients during
tfm setup. SHA204A exposes no capabilities for now.

This is preparatory work for upcoming features that will extend hardware
usage beyond a single algorithm type.

Signed-off-by: Lothar Rubusch <l.rubusch@gmail.com>
---
 drivers/crypto/atmel-ecc.c     | 4 +++-
 drivers/crypto/atmel-i2c.c     | 5 ++++-
 drivers/crypto/atmel-i2c.h     | 8 +++++++-
 drivers/crypto/atmel-sha204a.c | 2 ++
 4 files changed, 16 insertions(+), 3 deletions(-)

diff --git a/drivers/crypto/atmel-ecc.c b/drivers/crypto/atmel-ecc.c
index f877f236552f..0eeee9ae6c48 100644
--- a/drivers/crypto/atmel-ecc.c
+++ b/drivers/crypto/atmel-ecc.c
@@ -214,7 +214,7 @@ static int atmel_ecdh_init_tfm(struct crypto_kpp *tfm)
 	struct atmel_ecdh_ctx *ctx = kpp_tfm_ctx(tfm);
 
 	ctx->curve_id = ECC_CURVE_NIST_P256;
-	ctx->client = atmel_i2c_client_alloc();
+	ctx->client = atmel_i2c_client_alloc(ATMEL_CAP_ECDH);
 	if (IS_ERR(ctx->client)) {
 		pr_err("tfm - i2c_client binding failed\n");
 		return PTR_ERR(ctx->client);
@@ -286,6 +286,8 @@ static int atmel_ecc_probe(struct i2c_client *client)
 
 	i2c_priv = i2c_get_clientdata(client);
 
+	i2c_priv->caps = BIT(ATMEL_CAP_ECDH);
+
 	spin_lock(&atmel_i2c_mgmt.i2c_list_lock);
 	list_add_tail(&i2c_priv->i2c_client_list_node,
 		      &atmel_i2c_mgmt.i2c_client_list);
diff --git a/drivers/crypto/atmel-i2c.c b/drivers/crypto/atmel-i2c.c
index 4beab68997c4..b7ee2ec37531 100644
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
@@ -73,6 +73,9 @@ struct i2c_client *atmel_i2c_client_alloc(void)
 
 	list_for_each_entry(i2c_priv, &atmel_i2c_mgmt.i2c_client_list,
 			    i2c_client_list_node) {
+		if (!(i2c_priv->caps & BIT(cap)))
+			continue;
+
 		tfm_cnt = atomic_read(&i2c_priv->tfm_count);
 		if (tfm_cnt < min_tfm_cnt) {
 			min_tfm_cnt = tfm_cnt;
diff --git a/drivers/crypto/atmel-i2c.h b/drivers/crypto/atmel-i2c.h
index ba5a860011c8..70579b438256 100644
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
@@ -130,6 +134,7 @@ extern struct atmel_i2c_client_mgmt atmel_i2c_mgmt;
  * @wake_token_sz       : size in bytes of the wake_token
  * @tfm_count           : number of active crypto transformations on i2c client
  * @hwrng               : hold the hardware generated rng
+ * @caps                : feature capability of the particular driver
  *
  * Reads and writes from/to the i2c client are sequential. The first byte
  * transmitted to the device is treated as the byte size. Any attempt to send
@@ -146,6 +151,7 @@ struct atmel_i2c_client_priv {
 	size_t wake_token_sz;
 	atomic_t tfm_count ____cacheline_aligned;
 	struct hwrng hwrng;
+	u32 caps;
 };
 
 /**
@@ -190,7 +196,7 @@ void atmel_i2c_init_genkey_cmd(struct atmel_i2c_cmd *cmd, u16 keyid);
 int atmel_i2c_init_ecdh_cmd(struct atmel_i2c_cmd *cmd,
 			    struct scatterlist *pubkey);
 
-struct i2c_client *atmel_i2c_client_alloc(void);
+struct i2c_client *atmel_i2c_client_alloc(enum atmel_i2c_capability cap);
 void atmel_i2c_unregister_client(struct atmel_i2c_client_priv *i2c_priv);
 
 #endif /* __ATMEL_I2C_H__ */
diff --git a/drivers/crypto/atmel-sha204a.c b/drivers/crypto/atmel-sha204a.c
index 923e462ff6b0..1a28c6434669 100644
--- a/drivers/crypto/atmel-sha204a.c
+++ b/drivers/crypto/atmel-sha204a.c
@@ -173,6 +173,8 @@ static int atmel_sha204a_probe(struct i2c_client *client)
 
 	i2c_priv = i2c_get_clientdata(client);
 
+	i2c_priv->caps = 0;
+
 	/* add to client list */
 	spin_lock(&atmel_i2c_mgmt.i2c_list_lock);
 	list_add_tail(&i2c_priv->i2c_client_list_node,
-- 
2.53.0


