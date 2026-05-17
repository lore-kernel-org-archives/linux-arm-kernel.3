Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D48C5CD4F47
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 17 May 2026 18:07:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LXDGFqKG+aLieN/ARyZ/nrrCa3/quxxq3chmprkLuVc=; b=wwFrEZDjTbAYZhFtI4ncPxMlS8
	CHQ+nC5CehRVuBf6Pk2ffVEDJ/u4gF3dViGcwiU8V0k3e8omKc5TCD02f8pG8DRfDtTlAms5CTgNR
	18nrTy0MU+PN2DEBIbWfIkBwiY4Kprx/hGBt+9hdIg+zMtsPX0l2KXOGkMe4RGlKrNVLJ9j/H0c3l
	t+KVslbabYPgoVZp1C+uAYY+m54J38EaGR6vRkBFCR6XgzAsGN58E6JIp9ex4LOkA1g5Q79fbB+cQ
	Q5XOdRpigWU8MI8OJ2WQwHLEBFpnNNfWy8pWWr+hQojk3S2Cjj4kykMFxMXNotsCiGMQQFqZg2x6m
	kWzPECTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOftM-0000000DAZS-2pHc;
	Sun, 17 May 2026 18:07:08 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOft8-0000000DAP6-27EZ
	for linux-arm-kernel@lists.infradead.org;
	Sun, 17 May 2026 18:06:55 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-48fe7a40e51so1518185e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 17 May 2026 11:06:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779041212; x=1779646012; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LXDGFqKG+aLieN/ARyZ/nrrCa3/quxxq3chmprkLuVc=;
        b=b2dYVgVHd21kvsZ2ClPevb2QBZbr5dc6+YxHNPlxFc+uySGG53iQrwXlpmaSx+zw9m
         xJOLrLTv/xmfCdOKdP6PXF1ifFP9ML/vNxVU5KARmgQUjhqoQvyNlTKFoYyEGwBJqkmh
         fFd0vsT9ayGUBt44wjC9iW9Cpz9RPlC0X/p+wW3/xM/+rNR+Y1YrB5pPeIDmR5hA5UAI
         ckrQbeCotevgA5PNPdr4rJHiIvvZQUJMlRHYlAMGY6W4qh445jkzBdutHV95P5Jcmzcm
         87z7ZbSP8hHf8cjUiqdH+KSWtitc98HOpIe6K1o0Q6+jsuqdNFktPYzJ3rEGIXc3azZm
         ZL0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779041212; x=1779646012;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LXDGFqKG+aLieN/ARyZ/nrrCa3/quxxq3chmprkLuVc=;
        b=nXDu5Fqvuvvh1xjPknC4gbL76THHq4S5YVXDSVF9EOCv4kcNi7ZeZiTTnyrOx6SSeG
         Ok3IUfxSPEZ5OxQvULo2fpf5aRwSSsh359RKnkOG+VDbZYapLMxHJU8TcORXYxtw17ha
         uWG5pBMeSq3bMp5pRXioy0oStAh9dS8ybMaXx7ZqPICTkyBTfVCB7JZbmviCGjIB+c07
         JJTsgE3/F1GmIjB7ZXjG3NUpysf4KjJyM2h8t+A01B71EDHTc/K9EbWsgH35j9SUWmpn
         CSuSa1RPKHdzJHi2pVvlmd6WMdmBffe+1DB8qnspCDQktNQDAeT8y1USsfUAlPqELhwx
         dfdw==
X-Forwarded-Encrypted: i=1; AFNElJ/aiw0FovltCX6HJ72mi2POpb6aZk6RDl2zgQE+Js0PfDvkVVQVUBAhrWlLKnXFpYjp1U7yHPmqCW5wEQ0Ed28M@lists.infradead.org
X-Gm-Message-State: AOJu0Yxh5h42ORjLMJdDc/YSjog+L2pc5q6pZC8M2IkvefV16f2cGzp9
	kBM9Rk0laph3av2NUzXLNrjkqUKvut6oVmF02keLdvOdixAU60/wfLzw
X-Gm-Gg: Acq92OFVIqewoYnAFCJdPeuHUibQpChqylsmZvWLOfpojRrabQlcq2sbFaZWWPNTh/j
	r2qQKFW1IzSYqujV3eiOfGmKv/WgWXb6xAsAFtVWJKezc+athy9dBIaI/BlxNXC/jBgHIVKQR5D
	PxYQ/np39ybFru/4nIBi1ckqwPwQgG1JUUkCBtVI6nc9+bMIjMDWvmBOrUqdN2ad45r7bR+mRs1
	QMM3GhzLN5W66p2Q/q+ryiMuL/oU1brUXiMisWCo8KmP+sElUYbwHOZmcuhOBUavq0a+tw/4a1K
	PQ+wJvdZ5e9h0w4gXBLfFlmxK0aB5Rtry6KFUk8NSvHpZLRXsabHGkUQYaIeyyS4P4yoo5wh0cW
	M8Sxpp7LMx9RUFVNuTp4wRjnh2fRJ0yeuvyRN0hbEYlo85GF3PvQzz5a99LEXpx3JjcXBFKR135
	NMLiUIsvzKdVDMg5OplQ8Erq4fg1lPsfn97yVEbNGTAVuGqhzs0zoXfzuFDSuM0rg6uYp7MsZx5
	Q==
X-Received: by 2002:a5d:5f45:0:b0:458:3bdb:7eb0 with SMTP id ffacd0b85a97d-45e5c5dd4bemr8843390f8f.4.1779041212405;
        Sun, 17 May 2026 11:06:52 -0700 (PDT)
Received: from menon.v.cablecom.net (84-74-0-139.dclient.hispeed.ch. [84.74.0.139])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da15a6454sm31766775f8f.34.2026.05.17.11.06.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 11:06:52 -0700 (PDT)
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
Subject: [PATCH 05/12] crypto: atmel - factor out i2c client unregistration helper
Date: Sun, 17 May 2026 18:06:32 +0000
Message-Id: <20260517180639.9657-7-l.rubusch@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260517180639.9657-1-l.rubusch@gmail.com>
References: <20260517180639.9657-1-l.rubusch@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260517_110654_564195_4738A270 
X-CRM114-Status: GOOD (  13.53  )
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

Move the i2c client removal logic into a dedicated helper
atmel_i2c_unregister_client() in the atmel-i2c core.

Convert ECC driver remove path to use the new helper and
ensure queue flushing is performed after removing the device
from the shared client list.

Signed-off-by: Lothar Rubusch <l.rubusch@gmail.com>
---
 drivers/crypto/atmel-ecc.c | 5 ++---
 drivers/crypto/atmel-i2c.c | 9 +++++++++
 drivers/crypto/atmel-i2c.h | 2 ++
 3 files changed, 13 insertions(+), 3 deletions(-)

diff --git a/drivers/crypto/atmel-ecc.c b/drivers/crypto/atmel-ecc.c
index 696ab1d51fc6..e5dd77008b97 100644
--- a/drivers/crypto/atmel-ecc.c
+++ b/drivers/crypto/atmel-ecc.c
@@ -364,9 +364,8 @@ static void atmel_ecc_remove(struct i2c_client *client)
 
 	crypto_unregister_kpp(&atmel_ecdh_nist_p256);
 
-	spin_lock(&atmel_i2c_mgmt.i2c_list_lock);
-	list_del(&i2c_priv->i2c_client_list_node);
-	spin_unlock(&atmel_i2c_mgmt.i2c_list_lock);
+	atmel_i2c_flush_queue();
+	atmel_i2c_unregister_client(i2c_priv);
 }
 
 static const struct of_device_id atmel_ecc_dt_ids[] = {
diff --git a/drivers/crypto/atmel-i2c.c b/drivers/crypto/atmel-i2c.c
index db24f65ae90e..861af52d7a88 100644
--- a/drivers/crypto/atmel-i2c.c
+++ b/drivers/crypto/atmel-i2c.c
@@ -354,6 +354,15 @@ static int device_sanity_check(struct i2c_client *client)
 	return ret;
 }
 
+void atmel_i2c_unregister_client(struct atmel_i2c_client_priv *i2c_priv)
+{
+	spin_lock(&atmel_i2c_mgmt.i2c_list_lock);
+	if (!list_empty(&i2c_priv->i2c_client_list_node))
+		list_del_init(&i2c_priv->i2c_client_list_node);
+	spin_unlock(&atmel_i2c_mgmt.i2c_list_lock);
+}
+EXPORT_SYMBOL(atmel_i2c_unregister_client);
+
 int atmel_i2c_probe(struct i2c_client *client)
 {
 	struct atmel_i2c_client_priv *i2c_priv;
diff --git a/drivers/crypto/atmel-i2c.h b/drivers/crypto/atmel-i2c.h
index a3385e8f0dc9..43a0c1cfcd94 100644
--- a/drivers/crypto/atmel-i2c.h
+++ b/drivers/crypto/atmel-i2c.h
@@ -190,4 +190,6 @@ void atmel_i2c_init_genkey_cmd(struct atmel_i2c_cmd *cmd, u16 keyid);
 int atmel_i2c_init_ecdh_cmd(struct atmel_i2c_cmd *cmd,
 			    struct scatterlist *pubkey);
 
+void atmel_i2c_unregister_client(struct atmel_i2c_client_priv *i2c_priv);
+
 #endif /* __ATMEL_I2C_H__ */
-- 
2.53.0


