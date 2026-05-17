Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A2BECD4F4B
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 17 May 2026 18:07:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UvLRNBQYDT8+Qt2zwMF/yaLEeJC75IH2Ss/ramc0Mks=; b=B5qeNW/vcDDrxS8NL1CGjMjJzP
	wFBRccGBEhwi3/RGW69F8R7AfOUZRzI8fzJqlfCTrMX9HIhrdZY71VwzCoLUzgHAvLJBe/6ENckvR
	1hVgsvtPqhWIEQyMWXNxSbk0J2cs5Aj7ZQmJ2SFXZb2bFQWQWuCj9UzTMJlaZgO3w9XzIZhOPYr8s
	jhdyoNxr/0SEiljSRa15yYsDZx3QTJYI23yZT/TwI+dB4xgTjjF+7vjITrH+jkWZ+hkSiRj58P1K/
	XBMukqF4SY9hlP2uH7rdnnmeNlvhiSNqI6z9GSiJkSTGGaTQpeSvaDSrS65ZmDsrH9kdDrKY8W71y
	LYHHprWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOftN-0000000DAaf-0mCL;
	Sun, 17 May 2026 18:07:09 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOftC-0000000DAST-2VXm
	for linux-arm-kernel@lists.infradead.org;
	Sun, 17 May 2026 18:06:59 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-452aacde862so63370f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 17 May 2026 11:06:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779041217; x=1779646017; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UvLRNBQYDT8+Qt2zwMF/yaLEeJC75IH2Ss/ramc0Mks=;
        b=IsfwVgqiSif9oc6Wj5Gdcx6GbhRo+0mimnzuU5PjKfLDlr5dZOhcf5TSqMiSapQSyJ
         7JkC5S6VB5p+MVUfuP1t1kODeaXv9+NoGMTNY2goiYxjsN7+/IRIo6sb/zWZocqYWjoM
         LVJFCuN20x0ZWg3jVj0o29nopr3W8RDGHvO8FhnULn28H9s8uB6v73DMqaLWgd/zwQUP
         pVHGJyf7sx6c29B1xuw6m4bNTxj8EskgJMxFGkJPWgwmfqX9Gm4xX144Rs74GGcQyGMq
         9KO1bAInmzpwZYQEXz38osJiATRNYx1rAzeNlHJzC8FTPhHXe9IhKFP4+4aoYID0dEjx
         PfPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779041217; x=1779646017;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UvLRNBQYDT8+Qt2zwMF/yaLEeJC75IH2Ss/ramc0Mks=;
        b=rOugywne+IR5QuqU4IFSJ13UmsVaAwk1Wd2ApLuSvmp0Tji5IPVFQUqiSOCj2+jH2A
         wWOOLcYbQIJW7qE2fZONmPLSB36ByC8E5gEDvPMI3d9eMsOK6HdCuMAfI2nm6RT9DOsm
         honjNEF/PWgI375YJ44l/SyG5mHD6zilHo+YSGvDuUfLHk4s/JpCB+c4jngn120wPBNr
         8FRvKNropv2wdkTwr54AhI+KlKj75Q3bVVhBsbxOq9xS97kEbH3QZWWkfQ191spAusj0
         lpUchgq7QOuKi94mleayx/uEz+AqMUbX6PrdBxTTFffo1ecJkebguYdAdCYa512oKl5c
         +Qbw==
X-Forwarded-Encrypted: i=1; AFNElJ/chC+yz8Kba4P1fq93l5MSH/3xBTBfQLi0w2oPkOdYUDHe0RIbKojr3lBOEJDZccJnZU5K0EqHsTBhYA3QagHa@lists.infradead.org
X-Gm-Message-State: AOJu0YyRNPY6m/VOvkxtpizpjXBPYtT8XPqotmBNS56sjcsRkX/Y+wPF
	fIoRFUGZ4KHTpsO2kP2/vEMWK59ClIHu8DVsI3nwKII8PRWxEZ8k0gRC
X-Gm-Gg: Acq92OFu3dHmf6I1ritpwIawahi2pYVRim9vbJ/5GKBdAy5j8rQJqNLhkohRKCQCBbb
	2xK0XAyRk5xiI4QWrSCR/Mm2wE4LN+NqVaBzqnVDRn7apBfVURl1mUF4K/UKssc8BzffCJks+ub
	GJXGWOPUQ2YpleDMzRdwf6Z08u3FBOI88ZOsgPtmEsu0+9XDZR4DM2HCItz3gWIs4huv3je3hqP
	3DyRpdKzuiPoC0+KJTakiMMNmd19d0+UYJHxBRYSoLCMDMQgI0A7vcDW7TIW7O+NeX1i8DXQZht
	CzVvZyig9G9a+GWoNXPpnK/ANkMByVkN6s1z8YfD4YZ4BkYTF2smnP6HDg1X0mFQlNNNq9Iny5U
	+OtGasY4vgLGDlD9PKcqhRdQjMwLsv+Ufvh4fnQNvN37fvPKTty+O6Exn9zEC8vArHmC5G2pbET
	8Yz+z6fCMAl+NPlWclJKVzKvbRCkkK8FMQF78d6LF3zjewW85sOyMrjQCiBGkW70Y=
X-Received: by 2002:a5d:5850:0:b0:453:f281:b4ff with SMTP id ffacd0b85a97d-45e5c59557dmr8853464f8f.2.1779041216533;
        Sun, 17 May 2026 11:06:56 -0700 (PDT)
Received: from menon.v.cablecom.net (84-74-0-139.dclient.hispeed.ch. [84.74.0.139])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da15a6454sm31766775f8f.34.2026.05.17.11.06.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 11:06:56 -0700 (PDT)
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
Subject: [PATCH 09/12] crypto: atmel-ecc - simplify remove path and relax busy handling
Date: Sun, 17 May 2026 18:06:36 +0000
Message-Id: <20260517180639.9657-11-l.rubusch@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260517180639.9657-1-l.rubusch@gmail.com>
References: <20260517180639.9657-1-l.rubusch@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260517_110658_654149_83356628 
X-CRM114-Status: GOOD (  14.97  )
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

Simplify atmel_ecc_remove() by removing early exit logic and
centralizing client retrieval and validation.

Previously the driver returned early when active transform users
were detected, which could leave partially initialized state
without proper cleanup.

Replace this with a warning when active transforms are present,
but continue with full teardown of crypto registration and
device cleanup.

This ensures consistent removal behaviour even when the device
is still in use.

Signed-off-by: Lothar Rubusch <l.rubusch@gmail.com>
---
 drivers/crypto/atmel-ecc.c | 19 ++++++-------------
 1 file changed, 6 insertions(+), 13 deletions(-)

diff --git a/drivers/crypto/atmel-ecc.c b/drivers/crypto/atmel-ecc.c
index dcfc09d24497..ce7a2e750ba8 100644
--- a/drivers/crypto/atmel-ecc.c
+++ b/drivers/crypto/atmel-ecc.c
@@ -346,21 +346,14 @@ static int atmel_ecc_probe(struct i2c_client *client)
 
 static void atmel_ecc_remove(struct i2c_client *client)
 {
-	struct atmel_i2c_client_priv *i2c_priv = i2c_get_clientdata(client);
+	struct atmel_i2c_client_priv *i2c_priv;
 
-	/* Return EBUSY if i2c client already allocated. */
-	if (atomic_read(&i2c_priv->tfm_count)) {
-		/*
-		 * After we return here, the memory backing the device is freed.
-		 * That happens no matter what the return value of this function
-		 * is because in the Linux device model there is no error
-		 * handling for unbinding a driver.
-		 * If there is still some action pending, it probably involves
-		 * accessing the freed memory.
-		 */
-		dev_emerg(&client->dev, "Device is busy, expect memory corruption.\n");
+	i2c_priv = i2c_get_clientdata(client);
+	if (WARN_ON(!i2c_priv))
 		return;
-	}
+
+	if (atomic_read(&i2c_priv->tfm_count))
+		dev_warn(&client->dev, "Device is busy, remove it anyhow\n");
 
 	crypto_unregister_kpp(&atmel_ecdh_nist_p256);
 
-- 
2.53.0


