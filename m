Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1848CD4F4F
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 17 May 2026 18:07:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UnEz4kb5yNtR6Ed+ZspZs0azXccaDtFZKA7zrYYeQpw=; b=zmRPiWExwy77/VFI/msIoapNOE
	KFzBawZaJ1qZlzAUKpTC7J8QfByCsx1hfDqjT0YDq6FltskYiKgtKUDrhIKjqzTxTnYjPQ025EIoM
	ur3R84P/Pn9+Lx22/6CcSDXumnlMGyo3iekcH7gBXWypPpmb1GPS+Ruw78Z8/igabrmOouiY37reA
	8/ySAegW29gz5MAmpAnW+pu/ySlJUi6P5y6EMhJBVT8+AmAWUEfG2JdVQMCD3TsltHcPf7gA8Eb8a
	0vAsaOnW6Z2xUdKUN5mDHk1xl3Aotvfm1WsFYlpK426ObMoaT48ALo5HCy3gHGUJmpwxwnVt1BD8J
	ZTqas6Pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOftN-0000000DAbu-2dFF;
	Sun, 17 May 2026 18:07:09 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOftG-0000000DAUk-1Ezx
	for linux-arm-kernel@lists.infradead.org;
	Sun, 17 May 2026 18:07:03 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-488a8f97f6bso3337905e9.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 17 May 2026 11:07:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779041220; x=1779646020; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UnEz4kb5yNtR6Ed+ZspZs0azXccaDtFZKA7zrYYeQpw=;
        b=CXLVrqMpY6syPhFg7gEcB5F90JgaZjGsb5ucfj8ttrTamAczOkXHlEqnaSE+qJu1wZ
         VhpI/XCg6d+Vv4a6BaTHHjXQFMGu1omPZ5JDH77Kv9qnuwvJgsj2CBkSy7DXzr2YVIzZ
         iivSjkTC3PVg+JB8hWvOgCS0eKx7T01kTAnPaXYdq9Ppwy6EinbPS69ImRo2A/76Spr2
         BqE7fwexVaw+jE5aD6K+F5EoZrkIQB2TprJegT2PMTGwpyldduDvahybYZq0pNhoHM1K
         mswZsRCulusE9bD8vuXFJnNXTRvsfZITTXj0G7xybvSJf3i6Do3gjaYiIb2/piswpoPr
         dWug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779041220; x=1779646020;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UnEz4kb5yNtR6Ed+ZspZs0azXccaDtFZKA7zrYYeQpw=;
        b=h0DVCeglYTgs9IF4W9BbA0fm0tXrnN+b+zyT7IFFa/ionQkf9vxKcsd39a9zTAufQs
         vFTF9RYXo2HSF3ZN1Nseivscx9EQVeClsCswaFaMTWZggySWnEj6qrVc+RUsbV8at3sm
         SEkEZD8dzy2fl8q8OLX/9Pv7GbQtjQkjFlPy8+odHQU4HWkLU6HVZBEDktWcJbRPkdQ/
         pBqxmNJdukaPtpe6JIiXJMu9CUpNrjlW1i7tS13cUBuaF/2boMOCK2ICtY+LS705aGyN
         wyrpp4QHEz9Bn+hrpvNm4+YKwmyXjSctJiwas5t/xf8zOY6pzjwHCy+cjcgrOdWYkMCV
         g3Pw==
X-Forwarded-Encrypted: i=1; AFNElJ/UGkrDMwUdfKVxjImjpklIf5fas5l5xCh6QjEOaqel1ceFZlHM+nXeyV1sR/pwMmZ4Kii0sdq0PvRz2GVvmNW9@lists.infradead.org
X-Gm-Message-State: AOJu0Ywk+snMTifhmFVUn/s/3zIADByW7B0fzRGVp98EIbwyRoHCIS21
	+qgLSl23bnvibLhlYmFHV183+Hp6naVE6Hu0kXrXeowiQBkeEfXKuj71
X-Gm-Gg: Acq92OHpGWRkQ9d/GtpBunaB8egE6TzmiUpKyR+juqwPE5S7uawY7voiwISRAb86TV/
	9IoHwYFeA4HWMTLGlCtbPG8HW3TRk4DJ4Iwjt58RpA8JmGxzRSKdSWW6RJVxuVPuL4ufNNA39T/
	tKOeNpjpVtXRUbFFxvrJKcV7JGhJYc0Bl8c3EIPkqXgcKl4oQGdF3wQq/AgsZhBCtd9cvxvjmi9
	/QscBbbN+kVdfHUOTvE3a1hUsKIWDaUX7YZz8La+cBI0UIgKxlzVF2mgR1CSZuXz75Ea/54ys61
	4IuoPuEDjwnYo1/zQcZ/clo4qoZPfMdZRzXDALAAPRIcmh0rW27X/534aJ+f4J65Pro07YG7Mhb
	UnruU2UXXFXuk1yU99G0h4A+nZSpGnKzR8LDKb+XowcIfSZHH0ommg65LYhnVmoipNJrJYO60xd
	WLzUi8d2OMbu+fGGj2LeFF5IG4sTn+RUTPpHmvSYuqZ0QfmDjrT+Mn+wBAYABpqMk=
X-Received: by 2002:a05:600c:a48:b0:489:e696:127d with SMTP id 5b1f17b1804b1-48fe63022e8mr80058775e9.5.1779041220235;
        Sun, 17 May 2026 11:07:00 -0700 (PDT)
Received: from menon.v.cablecom.net (84-74-0-139.dclient.hispeed.ch. [84.74.0.139])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da15a6454sm31766775f8f.34.2026.05.17.11.06.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 11:06:59 -0700 (PDT)
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
Subject: [PATCH 12/12] crypto: atmel - add capability-based I2C client selection
Date: Sun, 17 May 2026 18:06:39 +0000
Message-Id: <20260517180639.9657-14-l.rubusch@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260517180639.9657-1-l.rubusch@gmail.com>
References: <20260517180639.9657-1-l.rubusch@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260517_110702_359000_76636116 
X-CRM114-Status: GOOD (  19.16  )
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


