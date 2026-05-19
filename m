Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F9E0CD4F5B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 20:48:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g1DeJFJSEHZep1pJ6wxiVEkdit9Es+ISenMHqnD6wG8=; b=YvgRtnRSNiMRsjfDjJBAr/OwBv
	cAKNJTVBRkYnpidj8Rmf09w1dHWz216ABHGV5h+t2F/vSQQlExF1vkNCniVSNp1vAKDSz5b/0/DpA
	1JyrP0x07Md9auz630O/j6EwgiQCdtfxoJ2IVAODcGwvOBwksckdCWNB9JOgtMlKE8t4w/Fhnd1tM
	54ZNyBNZLBYRypMHcVdkkU7viBCDFjtkp0TNaq3atFFxiDI4TcQq2aYUyGaQQxKlZzrjKrrAV4M6A
	p9a9WBEdMvKOH/HbYQKNJTb5C55Z+zxjleT+7D5DcCJhfpWvOj0azHJcWV1mxNzjTcNH7VxpX//FA
	lBjkTtUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPRMQ-00000002lDC-47Uf;
	Tue, 19 May 2026 20:48:18 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPRML-00000002l96-1M5H
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 20:48:14 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-45e6c2d9c5cso246591f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 May 2026 13:48:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779223691; x=1779828491; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g1DeJFJSEHZep1pJ6wxiVEkdit9Es+ISenMHqnD6wG8=;
        b=kd32gAJFuGHtwd96VVCaLOYBAD6tOlu325Un6A3BQ5wvhVJlH4u49rSkmj6tXOpO08
         flCscq5XZdFwzDn/s2U+PTqCQKtDZbl3j924OYZ3NINIL7OVYY6G11hBcG1iI8l6YACw
         Xs97ApL81q40KMS5J68MHEI6lfIVhOx25Ah69n6Z2NUgzLdYme9eadyKSUahHZHLCabt
         rQN25tVk4PZkQmkJJ6gKhsUUTWbdFBcZgwUg6vO7jI6+IdVeRFf+SyRY5wtKhQcByCpy
         iyirzn9D15c04U0+wm9c5tiq80u3CWyEIuKsv4B/wZTmmuhHj2+a0r504n57/cNi93ZV
         vJxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779223691; x=1779828491;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=g1DeJFJSEHZep1pJ6wxiVEkdit9Es+ISenMHqnD6wG8=;
        b=AxdN+dFGTUW39CCb5Jm1Noroa2g8Q9c7BM8HP1aZ3DpJZFop6zv9s+EPx39DbCEMwj
         Yxt81GFBuL+shBG+3CTl5UIEw57ujPs2nmio3KPw/ASi3+vqncrL+voSKtpid9MvYw99
         7jkiDxyh7UKWQpXFlw5zWBUJgm4IeB0cy2gfSVd+kgXifcj1atgcOeeNHW8lT2e1GlB8
         oijC4iVgCeK/ST5OnnfsOE1xxy+qAbzGRvXAHk9cjsymgIYl8BiZffPb+q8F5vLx+wT4
         Kj40JTbwXdWGVZ97xuzxuSLHUa9LG4mfhVnouN20ufJynjsDEYTDau125dxMOAbsqJbW
         suBA==
X-Forwarded-Encrypted: i=1; AFNElJ/xUtQV8sPWZeXAQkqbsfaVPlZ9zd28516g1Hrtn89YsysfZ7IdSuWJocFguSprTAYT1sZ1gmlpjd5GOdZYytUv@lists.infradead.org
X-Gm-Message-State: AOJu0Yxl5e/j8WnGHv/egjfBFgfrsXUI/mLm+wTnvvumSyoD+Z14GVb7
	ujSUjm6/b6d5LC6CN+I4teTgjWNDCqsmMowLEVGhNMdja7IG0v5BseYU
X-Gm-Gg: Acq92OGx5adEkqMoE71bhydsyh/NighoPbJIm1V2avGMp+P7bSlLgWRub1laGfEnCn2
	JZ64a6cgVvQACf6lOZSMhbBYNG54+PYnkYFMOivSYuc2ScJ72yaaVr4CvU0Lx3an61gvTDld8NY
	Ds0iStRrpd8g1+YidGUKB0LswVcu2RgXkzIpu7LbTL3URjX8zFckCdbS/PebqurKCVntEhEq/fs
	73vywoE/WXnsWEst5eAoig0EBD5Hfvogh4Tft0Kp+ZxxnwC0UT9BolvDGqIIil9mAdPdAEizpym
	cKgaIdZAKX0pOyMNRX4mUJwlFQIpvptVMEuJ1G52IpewzQ14gHNbaEjuB/+ETpMXST7sxlzc7Y3
	Quuy49edSQzx42yrNLkClAL64XHlTW7DBDzw6cf6HT7pF0bqrxCKl0bxzPGPYGfVPcU3YlHD8Au
	ZNDKoaoyFP2qNmuYNLZIp/G+FgPTHpFQPdeezLZhMApCvF5adndQ0cg3n8tHRsu3kTDIOA1HJwV
	w==
X-Received: by 2002:a05:600c:1f8c:b0:488:abe9:86 with SMTP id 5b1f17b1804b1-48fe631817cmr157538085e9.7.1779223691288;
        Tue, 19 May 2026 13:48:11 -0700 (PDT)
Received: from menon.v.cablecom.net (84-74-0-139.dclient.hispeed.ch. [84.74.0.139])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fe4dac000sm356457755e9.0.2026.05.19.13.48.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 13:48:10 -0700 (PDT)
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
Subject: [PATCH v2 02/12] crypto: atmel-ecc - fix use after free situation
Date: Tue, 19 May 2026 20:47:53 +0000
Message-Id: <20260519204803.17034-3-l.rubusch@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260519204803.17034-1-l.rubusch@gmail.com>
References: <20260519204803.17034-1-l.rubusch@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_134813_376079_D8FD01A0 
X-CRM114-Status: GOOD (  17.59  )
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
 drivers/crypto/atmel-ecc.c | 12 ++++++++++++
 drivers/crypto/atmel-i2c.h |  2 ++
 2 files changed, 14 insertions(+)

diff --git a/drivers/crypto/atmel-ecc.c b/drivers/crypto/atmel-ecc.c
index c9f798ebf44f..19d5435aa42b 100644
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
@@ -322,6 +324,7 @@ static int atmel_ecc_probe(struct i2c_client *client)
 		return ret;
 
 	i2c_priv = i2c_get_clientdata(client);
+	i2c_priv->ready = false;
 
 	spin_lock(&atmel_i2c_mgmt.i2c_list_lock);
 	list_add_tail(&i2c_priv->i2c_client_list_node,
@@ -336,10 +339,15 @@ static int atmel_ecc_probe(struct i2c_client *client)
 
 		dev_err(&client->dev, "%s alg registration failed\n",
 			atmel_ecdh_nist_p256.base.cra_driver_name);
+		return ret;
 	} else {
 		dev_info(&client->dev, "atmel ecc algorithms registered in /proc/crypto\n");
 	}
 
+	spin_lock(&atmel_i2c_mgmt.i2c_list_lock);
+	i2c_priv->ready = true;
+	spin_unlock(&atmel_i2c_mgmt.i2c_list_lock);
+
 	return ret;
 }
 
@@ -347,6 +355,10 @@ static void atmel_ecc_remove(struct i2c_client *client)
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


