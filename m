Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 441F9CD4F4A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 17 May 2026 18:26:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XWhNCJ8/sNLNjfPa+oqEi9cxsLwe8oIu+0HMTTzZ//Q=; b=ExA4e/2j73436eOqo9TtykuIfz
	H6ayG/MfubyLWxuCQ9IH6u5CKwFicXCo5N41pCaMe8w8sVIuYhPbKSw1XzKPd/ryzgurhUmwg6fsv
	AZxQ9c7PWe3oCJ4al1DQuOsQsWQvgwK4qPXjmPq1i2JR3LxasbhR8HldngGMHloUVDl3FuDx10vLQ
	sTgDl2LiPyJNEfkWFLjFjm11J63jN2ulJQdEH33gg9YSygEltleJVDzXNNsTGVPDOP8b8/GMAnFjk
	xzVcYiQveTUYhakL6mxVNO1Ke6fWcaj1zaSk9yfka6XsT4XD2ERTGB4oLGCFQvxfUOOFDKYkpCCBM
	DRimI9ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOftM-0000000DAZ7-2QqX;
	Sun, 17 May 2026 18:07:08 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOft7-0000000DAOV-1mSj
	for linux-arm-kernel@lists.infradead.org;
	Sun, 17 May 2026 18:06:54 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-48fde2f2d61so2892795e9.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 17 May 2026 11:06:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779041211; x=1779646011; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XWhNCJ8/sNLNjfPa+oqEi9cxsLwe8oIu+0HMTTzZ//Q=;
        b=pGaHsJwqRO4V5PKG6m7PkK4ppnc18ofMRtO+UH1aT6pHr0X/8tihv/MJdiETyglBvf
         DoEbLWYwnyXOW5RG0dV5ceyyfWXV7OplbMjIuoO06XxBRTzIJS8oPcRtc9sGno/w3E3o
         l/Qh9hC75V6Wdx0VCUAxU3Yy0M1F00WRB00yrtEwdzubJltiSleMdTnTaM+jzne/Tp1D
         VO1AxOniNbahHF8Jsi/rrRjP7cdGBbTLv+iV6wNncCk2Zerj5Fus5chblbRjSx9/QJhd
         fO2t6NlKt67qSPDqCco8H/vZhwa2r43VXw+MpVSIePZqLKJ8fQO2LzdHD5ndbKMQHx7J
         6XzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779041211; x=1779646011;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XWhNCJ8/sNLNjfPa+oqEi9cxsLwe8oIu+0HMTTzZ//Q=;
        b=Z3zWk37OsxZM5MjVdVx9/zMJzXZBg79Z8wR5IDfOB1BB/FUanhCMg2n/CS4niL0e/e
         ZtuCFsM2vz72MyNjjTjB6E4G91mgPnZH1RivY8Z/6HQyenx7PKOEsd6ZzE/5LiHff33S
         El4jntBmb1LEbNPe03HX0PMLl6cE2uuE315vUq1+QY19T87RPDHw8+GB6freqU2rYbT0
         CXr8sGFS5S4gQfM+6fYegg3H1uY8nmgNcQgjMV6k2naS3xQhy05D2r4LabvAk5m9i4Vp
         7ov59PzeXCgc3qt5znhAa/0pHsAg0HICmOeE/jxDHnk3JxwRzoZLszZmfgPEAQbLbyVe
         1NDw==
X-Forwarded-Encrypted: i=1; AFNElJ/MrXnToHbkmVXA1Gj+I+s1j484a8FSolOIQdwzsvPWCjYcyKJhT+IZuW7N3CXoq3SPMeWAzjTnWCR074oo/Thy@lists.infradead.org
X-Gm-Message-State: AOJu0YysR2ZeB/lthE33vHaIetIhJJ5MUfEjEAE+m7jM+bIo/fmhDyxA
	I87IKP1IqmJ7pH1q1CWmkTB/0HDHgcb0PB6V4q8/wqMZmu15wgjVF9sY
X-Gm-Gg: Acq92OG7Kybv1y0EFXg9tX+7j/T/dJHEvTmACz5uaAE07xup96T9q8mXBq3cGYvABjS
	Ge2PnNWGOLw1sMhglSaJ9ga0p3yq7fOdEN7L9k2+zApeWjsgBv0aXTIp/6pk2LJOiZrUcXXnoju
	o3FBvQYR9SXyK/YPp5zLpNJsbAJu9fDNa41IvntJOMYrPPbbJeTzOdqdFJTO5DAV7tw4w7evyQw
	RDtQq38iD12SATKQJjzgTNqnZ1MKYOALEBhAKoxZMEcNB5L/K6mFNeOAzbrp9AYtflGPjq/02ZJ
	SMsT/FkmlbSU8imk2qamN+Cz6CBX7ebMLX4N8jvqrwxoxSeJdhjUoOdYWoBJ1fnSeXW8SCAVE5l
	lbu8k20pSUBbUId+J5QW388e3xPskUB3cSwLt/2cHCYrJjSUDvQ38zWxoom+an5F2sTdMG8Lgtp
	4JPa7hSW5yhdnuAhVN2gImlJtO6skWMgqshg9ZOIevsKeYNNreQGI40vczusT1fdA=
X-Received: by 2002:a05:600c:1d0d:b0:485:c456:5e4f with SMTP id 5b1f17b1804b1-48fe59b071bmr91127835e9.0.1779041211464;
        Sun, 17 May 2026 11:06:51 -0700 (PDT)
Received: from menon.v.cablecom.net (84-74-0-139.dclient.hispeed.ch. [84.74.0.139])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da15a6454sm31766775f8f.34.2026.05.17.11.06.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 11:06:51 -0700 (PDT)
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
Subject: [PATCH 04/12] crypto: atmel-ecc - simplify probe error handling
Date: Sun, 17 May 2026 18:06:31 +0000
Message-Id: <20260517180639.9657-6-l.rubusch@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260517180639.9657-1-l.rubusch@gmail.com>
References: <20260517180639.9657-1-l.rubusch@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260517_110653_482736_4294C584 
X-CRM114-Status: UNSURE (   9.74  )
X-CRM114-Notice: Please train this message.
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

Replace early return in atmel_ecc_probe() with explicit error handling
using a goto-based cleanup path.

Add comments to clarify client list insertion and algorithm registration
steps.

No functional change intended.

Signed-off-by: Lothar Rubusch <l.rubusch@gmail.com>
---
 drivers/crypto/atmel-ecc.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/crypto/atmel-ecc.c b/drivers/crypto/atmel-ecc.c
index 76fb1d0cf075..696ab1d51fc6 100644
--- a/drivers/crypto/atmel-ecc.c
+++ b/drivers/crypto/atmel-ecc.c
@@ -328,17 +328,20 @@ static int atmel_ecc_probe(struct i2c_client *client)
 
 	ret = crypto_register_kpp(&atmel_ecdh_nist_p256);
 	if (ret) {
-		spin_lock(&atmel_i2c_mgmt.i2c_list_lock);
-		list_del(&i2c_priv->i2c_client_list_node);
-		spin_unlock(&atmel_i2c_mgmt.i2c_list_lock);
-
 		dev_err(&client->dev, "%s alg registration failed\n",
 			atmel_ecdh_nist_p256.base.cra_driver_name);
+		goto err_list_del;
 	} else {
 		dev_info(&client->dev, "atmel ecc algorithms registered in /proc/crypto\n");
 	}
 
 	return ret;
+
+err_list_del:
+	spin_lock(&atmel_i2c_mgmt.i2c_list_lock);
+	list_del(&i2c_priv->i2c_client_list_node);
+	spin_unlock(&atmel_i2c_mgmt.i2c_list_lock);
+	return ret;
 }
 
 static void atmel_ecc_remove(struct i2c_client *client)
-- 
2.53.0


