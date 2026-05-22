Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62BCACD5BB0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 May 2026 23:02:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CYnl6H7JNYvzOK1yTCqArfWOoQ9aVJm0Lozs66ZGulI=; b=SV+jD/iskzDRFAXPngtQXhedFX
	gGkc+4N0Xao+MY9o63zkbGTbFQ/+tR6tP50jBSPQpN5CWViDSGb+x5FXEMvYvX/Kwz/+CIF+aKEeB
	WQNyWDWy32A3ey3SuGG8P/CVAbvSod1+sjWadZ0nQs7KZaIOoiygDLnhcHnO41hqK8bRlbcbUi5w9
	A4/YERzB8lojnEt7ywobG7IIteTkoi5naqntmLT8fJgIrV/IAKUjQEbzrq3wWJjeDfiVZ0iFubf4H
	6n9+ltBJgodo1xOOTq1kHAwJ2Livsxa6F76AkvrV/7uN2PPUT6NBFclPFf90lXPcPKBgG4Mw1jSzy
	dqI5nlzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQYsU-0000000CASv-0k6b;
	Fri, 22 May 2026 23:02:02 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQYsN-0000000CALo-0VJj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 May 2026 23:01:56 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-44ad87a57f6so612375f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 May 2026 16:01:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779490913; x=1780095713; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CYnl6H7JNYvzOK1yTCqArfWOoQ9aVJm0Lozs66ZGulI=;
        b=WTb3MPLCDB27VThkHBOvenR8qYSYinn94RHi+iMpcjj+wv4+tLh69Kq1AlyPUTzj7Q
         TErUIUn/kuBYYrVOLjxu6VV/8yntZD/KIUrAkx7jATlilmnx66GgBWH99Mxvu4ozqxCz
         ZVMk0OI82uVdoYqBeP4Hz29f3GJfg/IwoR+b03o1vBEzqhqPgWgdQdGlxVbTxfI5k4Cz
         FDSY7WjEdm2kCSpadwIhdJb5P2rmSAqXn7+YAIFx/Stx17xi03tNBqGxFRT6CTqaF3wP
         FmZQYk9KDnrcpELofHBypQQalYcy4afMRx7G2g2nZHXG0pFQ2nO0hd0LpN30A1ToW+hk
         6woQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779490913; x=1780095713;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CYnl6H7JNYvzOK1yTCqArfWOoQ9aVJm0Lozs66ZGulI=;
        b=gx+vQgJPID98AeZN9Mj+IdUm0xC8q5GkQwqjreNVmOESAWsfrRopYtwNDyEwtNGXXG
         ydiATB8myU8UCcUqOgpIaDU0clsLrdTu7ock/hiWHdbRPlDXCIeaXkkUCfKchmwz+8zK
         sLgwibPpw6xeNBCNEFmJ6LdIaY5xcUQ8nJajhswHce13cJMKVd3IhwsFIqc+PigUglB9
         ltg/2ObJIyBzygoY1FSHkI60J5mr6GC+dokba4sJvE6v8COaSFtMzbcF3Vp0UU561fgU
         mh37l9ZjJ+fJlPjB4cGSzvLrtkG4ft/wHzV9CTutCSJWUkWN6GlYWSzeHM7KdG9wwV0f
         paDA==
X-Forwarded-Encrypted: i=1; AFNElJ/Ob3i+eyvBgQnzdwjCNbegw8X3Dj1kk8Y8roqsb/558T74yZ9n+pJxZg3Vuz0OCW5MkyZiTcSLsO+7lO2HPctR@lists.infradead.org
X-Gm-Message-State: AOJu0Yz0ph81I58+V8oONyIOpddNdbGPrJV3KLYKshyPk25bfUPmqmjx
	Md9NGuyWTnxQux/sCtYv+zLn+wWvn2uuAoLOoYVbePqC0NnxX/rN+SsP
X-Gm-Gg: Acq92OEjM4Vt3NTQ31xCbGUtDJG/UuHz2iyzACACzq4E3MY9o2pWCqx6qE4iV1sQRuy
	zxUXibWizur20XNnHCtpH5uCcZrYvTamn9/yNk5/H553p117/naLqLCo68kA7f1sEg62QoJR5hG
	i/eQrGYnvLayuUfbF5ByYpHMVifViibpSpZxgBm0DweaBdEA+xeuiQYJDlj5jEo05nw+489UCD5
	aOZ0BAkZTswuiFdE3du6xEZARlYSJj3vw/AX3ayhnOkYwH+soD6mZa8npJ9BZwBvjqyt/8/Vczb
	98Y5wZmvf08FBrsoLmtrEb8Krp6U2gR7d8H6UL2GhTlXwz2em/gEGMEGbOWsfapktdtwMuH4/xh
	yEdXb4yrfTJFAW/+psKfV7Z63XEWZ4v5CUb71aNhyp0HvV77J8Ycrb6J3zyJqaYEOKbRtFLv0Er
	5D8uGkGyuBtMcbUsuVvFGYC2BlwCiXe1ybeQsg6DbxL+BxxNCC6CT2cREIkNQCAkg=
X-Received: by 2002:a05:600c:444e:b0:48e:7a10:1f5e with SMTP id 5b1f17b1804b1-4904248ab61mr37470595e9.2.1779490913007;
        Fri, 22 May 2026 16:01:53 -0700 (PDT)
Received: from menon.v.cablecom.net (84-74-0-139.dclient.hispeed.ch. [84.74.0.139])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490456274ebsm67100265e9.15.2026.05.22.16.01.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 16:01:52 -0700 (PDT)
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
Subject: [PATCH v4 10/12] crypto: atmel-i2c - implement capability-based client selection
Date: Fri, 22 May 2026 23:01:32 +0000
Message-Id: <20260522230134.32414-11-l.rubusch@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260522230134.32414-1-l.rubusch@gmail.com>
References: <20260522230134.32414-1-l.rubusch@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_160155_188208_98115636 
X-CRM114-Status: GOOD (  18.94  )
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
index 16e607cd06c4..76b8f9e7c2e1 100644
--- a/drivers/crypto/atmel-ecc.c
+++ b/drivers/crypto/atmel-ecc.c
@@ -212,7 +212,7 @@ static int atmel_ecdh_init_tfm(struct crypto_kpp *tfm)
 	struct atmel_ecdh_ctx *ctx = kpp_tfm_ctx(tfm);
 
 	ctx->curve_id = ECC_CURVE_NIST_P256;
-	ctx->client = atmel_i2c_client_alloc();
+	ctx->client = atmel_i2c_client_alloc(ATMEL_CAP_ECDH);
 	if (IS_ERR(ctx->client)) {
 		pr_err("tfm - i2c_client binding failed\n");
 		return PTR_ERR(ctx->client);
@@ -287,6 +287,8 @@ static int atmel_ecc_probe(struct i2c_client *client)
 	i2c_priv = i2c_get_clientdata(client);
 	i2c_priv->ready = false;
 
+	i2c_priv->caps = BIT(ATMEL_CAP_ECDH);
+
 	spin_lock(&atmel_i2c_mgmt.i2c_list_lock);
 	list_add_tail(&i2c_priv->i2c_client_list_node,
 		      &atmel_i2c_mgmt.i2c_client_list);
diff --git a/drivers/crypto/atmel-i2c.c b/drivers/crypto/atmel-i2c.c
index 92d3e28f9d9a..4953b8fcb02d 100644
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
index ddab80bc1a72..af2e49332ab6 100644
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
@@ -149,6 +154,7 @@ struct atmel_i2c_client_priv {
 	struct hwrng hwrng;
 	struct completion remove_done;
 	bool ready;
+	u32 caps;
 };
 
 /**
@@ -193,7 +199,7 @@ void atmel_i2c_init_genkey_cmd(struct atmel_i2c_cmd *cmd, u16 keyid);
 int atmel_i2c_init_ecdh_cmd(struct atmel_i2c_cmd *cmd,
 			    struct scatterlist *pubkey);
 
-struct i2c_client *atmel_i2c_client_alloc(void);
+struct i2c_client *atmel_i2c_client_alloc(enum atmel_i2c_capability cap);
 void atmel_i2c_client_free(struct i2c_client *client);
 
 void atmel_i2c_deactivate_client(struct atmel_i2c_client_priv *i2c_priv);
diff --git a/drivers/crypto/atmel-sha204a.c b/drivers/crypto/atmel-sha204a.c
index 33e5a66b843c..0c5b5cdbfcbc 100644
--- a/drivers/crypto/atmel-sha204a.c
+++ b/drivers/crypto/atmel-sha204a.c
@@ -178,6 +178,8 @@ static int atmel_sha204a_probe(struct i2c_client *client)
 
 	i2c_priv = i2c_get_clientdata(client);
 
+	i2c_priv->caps = 0;
+
 	memset(&i2c_priv->hwrng, 0, sizeof(i2c_priv->hwrng));
 
 	i2c_priv->hwrng.name = dev_name(&client->dev);
-- 
2.39.5


