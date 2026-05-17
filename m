Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E442CD4F4D
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 17 May 2026 18:07:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KVgxZ97arp1tDrxkndKJZ1UkHaadytuLX7zd1XhXT7c=; b=4MQyNtd3YaVEAZ7nCHgrRaa/t/
	5FgZFb+ywAWUpK6xOY9OgQMApmXHF/DwnZ+0/G8R9GJq53Xrn5f4Zl6M/XkTiBK6aVRCZ/f4sBX6N
	2WzM+mEcxk1sconomV2iCu6ghajRwtohPb2YlBIUFjhvVdoXuK76nAoXQleQDzeIufjSKhD6ztgps
	VDvqlzPvJj5W4y3M4KciMLnxRQY1yLWZnx+jYt9apNWyhB0uc5QR8s9f5YYpGFxsfJfEhl1Zx7YrW
	tj+t73hMZXrelcer2WSY7ctrA6DHl+gcWjtyH0Wggz3EMGmZ6PH7obYTd/gZtiLPimmA5GzTEFYL8
	Nmz0DKCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOftN-0000000DAbg-2399;
	Sun, 17 May 2026 18:07:09 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOftE-0000000DAUd-3oZA
	for linux-arm-kernel@lists.infradead.org;
	Sun, 17 May 2026 18:07:02 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4891cd5927dso2085955e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 17 May 2026 11:07:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779041219; x=1779646019; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KVgxZ97arp1tDrxkndKJZ1UkHaadytuLX7zd1XhXT7c=;
        b=HJI33rGpSV68XhXNOdk2BO4Q+aqE7YiAoPpUU8hZFhK6HOc75PcL+W0zM0gab/urGv
         1xTUd9lpz4iKDHEWM7Ot8KLOlMCy/QaPaDlWeT3HV8Klz6mCROgMPNVYePmPrH5kJbkx
         dv7EAwtUd2Dl8SMH68q1Sdbt/Lhpj5oAnG2AyvOtVCHF17Xmx85CjJnbSe2BwNXFafBI
         ZW4RRmSIUJLyjIYxZYfhgwFnmC2D4s13AlbAKn3x1TyXrvdXMdMlV2PBU/4dGFCIHOM2
         3yuipNBMdZwhQjjSHnmSX2rY8YmCbwVlryUOW1wvldjcf1uQBDpdxjS2m4ABM8DjZ+M8
         9WUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779041219; x=1779646019;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KVgxZ97arp1tDrxkndKJZ1UkHaadytuLX7zd1XhXT7c=;
        b=XhnvvV3H7TNm34slZdjCL9Saq5BkRDuAhVRfTwGIayIkDDeZecOo28kQ3/vFimdnqd
         /jip8MzjM9WrAOklPBiB9JSqNa63x4JFBg7RKfFSHMC2+kq2Yyn52BF/r8ZuXvlRwzvn
         BZHS13MRx0E6YNd4Pu6JqSOMJPvFoht21TIJOpBzeYCykmMLrXW+ID5j6mCEe5xNEYd9
         5HjwNh3nFzM5MsWWSf9/OxQqHPY+XYjT0hOn6o0r6TdculF05feT7udDSf4sJR6oGXok
         b+cajTsAT/zLF2Jd06ZkypHecgylA56NX1xqIiPUtATj2EF5S78YyRibxmhxv/95kkRR
         zINw==
X-Forwarded-Encrypted: i=1; AFNElJ8TnEfWmsfZcznUsFJVbJ+hRqsl9I4krqALQN4/OMGB95tZ+ceCDjD+HoKMuiWQYHwM21R5W7ofmlSmRLQi0CQ3@lists.infradead.org
X-Gm-Message-State: AOJu0YyRvkHYgwDT9i1OUCQdPmkesDlrZF1PoLE1Qy5OxxcqOeWzD+y4
	SDuykHgJk17enaTz48G+SJlhoq54GCrw3F4LpKKt+vJGbVVKdALiYKi9
X-Gm-Gg: Acq92OFPtpmK4UypH/vVLZpft34S0mj/1inhyNKMGCJWclq4OXtB+arCZPtsbVTRNoH
	34B8YGD1S1IQQduiVgfOPhd/IywxhBIueYk0hw4AxTIffrkgoRtW2767iSjwF7zC5HwCCzl4NEe
	TcAyDNUx/DqSd6z3Kel2QJzvxURmPVjRNqtqMiAw7ELVHS/SRe4ucDRhm2Uh2XtT3ZFa8z1Q9kc
	pLLrTSWGrHtNVY+ttcfI9wCm1msw39EAJ8Et4uTt0QF45WM9fO/06H5CoP1yIGwajWRcNVy8vAx
	yUrJraP3Ql0A0x8NH1OhEWcUy2KKoXBzSDSDyZY6zjMmWqhrHCVGV1l0mom8NcYIOagwXAEPtED
	/ztSZb9BtI8gWrUdub0ZnTF5ik1GW7SEfi+Wws+k5MMHAKi8RHgaDF91ZUUwX04P2EGF2kzKXbI
	/QJKTSgfrL+9dITUrFK+pKT4IA+/ycwbNPAr0vFx9Dg002ys3g5QZ7YGDMfs2TA7g=
X-Received: by 2002:a05:600c:310f:b0:48e:7a10:1f5e with SMTP id 5b1f17b1804b1-48fe5fd5b3amr81048735e9.2.1779041219238;
        Sun, 17 May 2026 11:06:59 -0700 (PDT)
Received: from menon.v.cablecom.net (84-74-0-139.dclient.hispeed.ch. [84.74.0.139])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da15a6454sm31766775f8f.34.2026.05.17.11.06.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 11:06:58 -0700 (PDT)
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
Subject: [PATCH 11/12] crypto: atmel - move i2c client selection to core driver
Date: Sun, 17 May 2026 18:06:38 +0000
Message-Id: <20260517180639.9657-13-l.rubusch@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260517180639.9657-1-l.rubusch@gmail.com>
References: <20260517180639.9657-1-l.rubusch@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260517_110701_480113_62E154D2 
X-CRM114-Status: GOOD (  15.18  )
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

Move the I2C client selection/allocation logic from the ECC-specific driver
into the shared Atmel I2C core.

This consolidates hardware client selection in a single place, allowing all
Atmel crypto drivers to reuse the same balancing logic for selecting the
least-loaded I2C client based on the current transformation count.

No functional change is intended.

Signed-off-by: Lothar Rubusch <l.rubusch@gmail.com>
---
 drivers/crypto/atmel-ecc.c | 37 +------------------------------------
 drivers/crypto/atmel-i2c.c | 36 ++++++++++++++++++++++++++++++++++++
 drivers/crypto/atmel-i2c.h |  1 +
 3 files changed, 38 insertions(+), 36 deletions(-)

diff --git a/drivers/crypto/atmel-ecc.c b/drivers/crypto/atmel-ecc.c
index ce7a2e750ba8..f877f236552f 100644
--- a/drivers/crypto/atmel-ecc.c
+++ b/drivers/crypto/atmel-ecc.c
@@ -200,41 +200,6 @@ static int atmel_ecdh_compute_shared_secret(struct kpp_request *req)
 	return ret;
 }
 
-static struct i2c_client *atmel_ecc_i2c_client_alloc(void)
-{
-	struct atmel_i2c_client_priv *i2c_priv, *min_i2c_priv = NULL;
-	struct i2c_client *client = ERR_PTR(-ENODEV);
-	int min_tfm_cnt = INT_MAX;
-	int tfm_cnt;
-
-	spin_lock(&atmel_i2c_mgmt.i2c_list_lock);
-
-	if (list_empty(&atmel_i2c_mgmt.i2c_client_list)) {
-		spin_unlock(&atmel_i2c_mgmt.i2c_list_lock);
-		return ERR_PTR(-ENODEV);
-	}
-
-	list_for_each_entry(i2c_priv, &atmel_i2c_mgmt.i2c_client_list,
-			    i2c_client_list_node) {
-		tfm_cnt = atomic_read(&i2c_priv->tfm_count);
-		if (tfm_cnt < min_tfm_cnt) {
-			min_tfm_cnt = tfm_cnt;
-			min_i2c_priv = i2c_priv;
-		}
-		if (!min_tfm_cnt)
-			break;
-	}
-
-	if (min_i2c_priv) {
-		atomic_inc(&min_i2c_priv->tfm_count);
-		client = min_i2c_priv->client;
-	}
-
-	spin_unlock(&atmel_i2c_mgmt.i2c_list_lock);
-
-	return client;
-}
-
 static void atmel_ecc_i2c_client_free(struct i2c_client *client)
 {
 	struct atmel_i2c_client_priv *i2c_priv = i2c_get_clientdata(client);
@@ -249,7 +214,7 @@ static int atmel_ecdh_init_tfm(struct crypto_kpp *tfm)
 	struct atmel_ecdh_ctx *ctx = kpp_tfm_ctx(tfm);
 
 	ctx->curve_id = ECC_CURVE_NIST_P256;
-	ctx->client = atmel_ecc_i2c_client_alloc();
+	ctx->client = atmel_i2c_client_alloc();
 	if (IS_ERR(ctx->client)) {
 		pr_err("tfm - i2c_client binding failed\n");
 		return PTR_ERR(ctx->client);
diff --git a/drivers/crypto/atmel-i2c.c b/drivers/crypto/atmel-i2c.c
index 861af52d7a88..4beab68997c4 100644
--- a/drivers/crypto/atmel-i2c.c
+++ b/drivers/crypto/atmel-i2c.c
@@ -57,6 +57,42 @@ static void atmel_i2c_checksum(struct atmel_i2c_cmd *cmd)
 	*__crc16 = cpu_to_le16(bitrev16(crc16(0, data, len)));
 }
 
+struct i2c_client *atmel_i2c_client_alloc(void)
+{
+	struct atmel_i2c_client_priv *i2c_priv, *min_i2c_priv = NULL;
+	struct i2c_client *client = ERR_PTR(-ENODEV);
+	int min_tfm_cnt = INT_MAX;
+	int tfm_cnt;
+
+	spin_lock(&atmel_i2c_mgmt.i2c_list_lock);
+
+	if (list_empty(&atmel_i2c_mgmt.i2c_client_list)) {
+		spin_unlock(&atmel_i2c_mgmt.i2c_list_lock);
+		return ERR_PTR(-ENODEV);
+	}
+
+	list_for_each_entry(i2c_priv, &atmel_i2c_mgmt.i2c_client_list,
+			    i2c_client_list_node) {
+		tfm_cnt = atomic_read(&i2c_priv->tfm_count);
+		if (tfm_cnt < min_tfm_cnt) {
+			min_tfm_cnt = tfm_cnt;
+			min_i2c_priv = i2c_priv;
+		}
+		if (!min_tfm_cnt)
+			break;
+	}
+
+	if (min_i2c_priv) {
+		atomic_inc(&min_i2c_priv->tfm_count);
+		client = min_i2c_priv->client;
+	}
+
+	spin_unlock(&atmel_i2c_mgmt.i2c_list_lock);
+
+	return client;
+}
+EXPORT_SYMBOL(atmel_i2c_client_alloc);
+
 void atmel_i2c_init_read_config_cmd(struct atmel_i2c_cmd *cmd)
 {
 	cmd->word_addr = COMMAND;
diff --git a/drivers/crypto/atmel-i2c.h b/drivers/crypto/atmel-i2c.h
index 43a0c1cfcd94..ba5a860011c8 100644
--- a/drivers/crypto/atmel-i2c.h
+++ b/drivers/crypto/atmel-i2c.h
@@ -190,6 +190,7 @@ void atmel_i2c_init_genkey_cmd(struct atmel_i2c_cmd *cmd, u16 keyid);
 int atmel_i2c_init_ecdh_cmd(struct atmel_i2c_cmd *cmd,
 			    struct scatterlist *pubkey);
 
+struct i2c_client *atmel_i2c_client_alloc(void);
 void atmel_i2c_unregister_client(struct atmel_i2c_client_priv *i2c_priv);
 
 #endif /* __ATMEL_I2C_H__ */
-- 
2.53.0


