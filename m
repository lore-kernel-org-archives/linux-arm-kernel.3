Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF620CD4F47
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 17 May 2026 18:31:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pZVKXrkAaVKO/vkAKRUgA7JaIQeAJzwGUI/xuakH4Lc=; b=2k2K3O/NBUi7haLiwpei5w1/uE
	ktZf2kzIDLTQbLuA7blsnBU6naPDwvTbsRk3KpizajfNjyGFAGFcJJAdh3p2LsAqNUmvwInOaXzZF
	aA5wp6NoJEfik43ExppJx5Rbb4xWx3uS+5GTR/VdNHHDmGz0RkUVhKEPmVt2N1TX3LEOiAoHxc2UN
	nYCThpg4L3TDwR2vnFdnu9TY8KuKFO9FXbR+boRTeU9LGEyMgiM/Ak10H3qrpL7rNGkIb/HHEOFCe
	TBZV/6NzOBiK5U/V43RH7fI3TKlPiIniQ1v4zeGbxHOB3uwZEk5GcmZEcWYt0LydqyXfDtqBoenvF
	JozPOVDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOftN-0000000DAaK-0D6V;
	Sun, 17 May 2026 18:07:09 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOftB-0000000DARs-1yQL
	for linux-arm-kernel@lists.infradead.org;
	Sun, 17 May 2026 18:06:58 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-48fe7a40e51so1518225e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 17 May 2026 11:06:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779041215; x=1779646015; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pZVKXrkAaVKO/vkAKRUgA7JaIQeAJzwGUI/xuakH4Lc=;
        b=NN1uyrrJaPLVeIJLafjX1TF7+3a1EUwPjAeMc5m1HAr7CjmnhJnqJsD7dui3/9KClX
         /7Me9nHQfaUKeIlHA8atb7NvdtIMLWtjTkwTc6WmFZPmeqlXxg7VfJpQRZgtLjWhXApD
         oJfpAKn6vSlol4Zm10aDnkPXUrZ2DWudnNIybeqQIeYUVeahEkz9/HFrKZXGC8eeZr8W
         rtxSr2EWhB7GQr+CopZOrxBoH7/aPg762w/DI46zpfPkCVn+sliFT3WlqRpxpt/Bpc/K
         F1VnNeMvnEoVBWhOw+sqdlNBadoaui10dkLxGctwVfClFwkUZoThMSxWBV74DGsAlyac
         VQsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779041215; x=1779646015;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pZVKXrkAaVKO/vkAKRUgA7JaIQeAJzwGUI/xuakH4Lc=;
        b=rOhVrYUCTfdpvML3oE404/GyhHVAuG6P9Dn6hVCxBb7WStIrITaJlrhRsf4uZsP6kP
         KM2+qmDyNd6usVkTMMqWxoUdIlwpkD+jY1xDVIS9ZZ0zSf9xzrzYB+Ab+/S27HIpXNzv
         YWpS3VS/UbaiyFyOAH8y6e05aMeXfbwE1j1OXzhxfXUAKqOh9Hqa5VqCnK5jmWIe9PfV
         2yHxDd1nQLqDcztVlN6dUDYvKY4frqXMfQBKQRcXHMD4J6e2zImvCe8tCEaDovSH0kf6
         rnZd7j81hu++YoFIZibGGQebeIzwGwkrWOQHjQWEMxdeDXe1NPkY3ElFnv3Dof0TT6/W
         ujmQ==
X-Forwarded-Encrypted: i=1; AFNElJ8wyezGXSEJ/aIyAhM7FsmlVFPRXJhROzREzOwKI1PoAkopGEPbEdmfVLWmZKZFFUveNl1kot5if3lmoN91DJU2@lists.infradead.org
X-Gm-Message-State: AOJu0YyWXFZ9u2PVLSXgNPbrNef3NaCPdM2E8CanPnyFkOz1668+XPvg
	WRK6WsGrdyjozWbrwQtV8/M9hgMc0D/rySJAikY4ssm+5o7ovgVON8o8
X-Gm-Gg: Acq92OEb5IhCiO/VOV1Q8WYGrvV63F2M8vZaKOLTWCtZbOThJKXIjhSXPr5dAypBWCf
	nco0tke+S2QodNnPFi2DXSR123Ze5kkSAweqVTw/JNVLQW7GYStLq/Q3EfTZNNWGDYILPzajdcd
	zhqmczWoCnz5W83psLf7Krfp5jwxGwVG+bGOglMT5tLXxPCVJIkyu/YW1oR2PXVLci2GqGyw/s7
	GI/lSB9SjXXJyinGMF3vrhMTC8p5v7y+wRdy7Gi3Ui4UyHBBHeYj8IiUnV+OU1lQua6/pd3MVZ1
	iI49ZEtf/88zYCwHymLOu3UCMcRBGMyr4fO/QZ1C/HzuVrm9YLKGBcdw2u2BnH1qcISrhAGisJj
	FbRYv48q9spGO7gThKD9S2qSl0ykzw4PfWM+GwcfXy2MMqxbj5u3VrHFbUCFWVTDvcHgpeUjB9i
	Olk+1yTBOPUn7uTV+90sVY60ktWkgrgaMrameztQa3uOalyUN32mHAox2lXhqKs8YEEJw3YTD+k
	A==
X-Received: by 2002:a05:600c:1f8c:b0:488:abe9:86 with SMTP id 5b1f17b1804b1-48fe631817cmr83409915e9.7.1779041215510;
        Sun, 17 May 2026 11:06:55 -0700 (PDT)
Received: from menon.v.cablecom.net (84-74-0-139.dclient.hispeed.ch. [84.74.0.139])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da15a6454sm31766775f8f.34.2026.05.17.11.06.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 11:06:55 -0700 (PDT)
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
Subject: [PATCH 08/12] crypto: atmel-ecc - switch to module_i2c_driver
Date: Sun, 17 May 2026 18:06:35 +0000
Message-Id: <20260517180639.9657-10-l.rubusch@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260517180639.9657-1-l.rubusch@gmail.com>
References: <20260517180639.9657-1-l.rubusch@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260517_110657_519520_5B9F9202 
X-CRM114-Status: GOOD (  10.24  )
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

Replace custom module init/exit functions with module_i2c_driver() for
simplified driver registration.

Initialization of the shared I2C client management structure is handled by
the core driver and no longer performed in the ECC module init path.

Signed-off-by: Lothar Rubusch <l.rubusch@gmail.com>
---
 drivers/crypto/atmel-ecc.c | 16 +---------------
 1 file changed, 1 insertion(+), 15 deletions(-)

diff --git a/drivers/crypto/atmel-ecc.c b/drivers/crypto/atmel-ecc.c
index e5dd77008b97..dcfc09d24497 100644
--- a/drivers/crypto/atmel-ecc.c
+++ b/drivers/crypto/atmel-ecc.c
@@ -392,21 +392,7 @@ static struct i2c_driver atmel_ecc_driver = {
 	.id_table	= atmel_ecc_id,
 };
 
-static int __init atmel_ecc_init(void)
-{
-	spin_lock_init(&atmel_i2c_mgmt.i2c_list_lock);
-	INIT_LIST_HEAD(&atmel_i2c_mgmt.i2c_client_list);
-	return i2c_add_driver(&atmel_ecc_driver);
-}
-
-static void __exit atmel_ecc_exit(void)
-{
-	atmel_i2c_flush_queue();
-	i2c_del_driver(&atmel_ecc_driver);
-}
-
-module_init(atmel_ecc_init);
-module_exit(atmel_ecc_exit);
+module_i2c_driver(atmel_ecc_driver);
 
 MODULE_AUTHOR("Tudor Ambarus");
 MODULE_DESCRIPTION("Microchip / Atmel ECC (I2C) driver");
-- 
2.53.0


