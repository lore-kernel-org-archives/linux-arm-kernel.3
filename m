Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E98BDC44501
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 07:25:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rhOhCok8KJZwb9BgUeO86PYIaljD8639HNhjhemVwqQ=; b=ii0u2EGk5hBIaA80o7BSbbsQmw
	Fkgef58US7rj9nGmusNNqwn1fkpiW5Esf/JSRinv8ra6rb35209K8GAk4dfLZMomvYKAQ8AnNDF3Y
	JbL1ejj6n00nRk5mCL7s0ZxJezjwBqkNwJJ0hM3eotDTS/4wiAFPSh4gI9yL6B4NyswTevouXjQ/m
	of/v6joKIJxU942yyPSxWnzgA7V5tK3Ro1lY082qBvw2WN3QRKBHGGH+Ua9WNSHwmQdHV+DvHiHrU
	2F1+kNhrukLayl0n5jB5Snh+we2wtAyoZBrxgQKAWivmebR49cgKubfY5hkIaYVHTCH+MTv263ZSf
	auK6vp6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjXWD-0000000B9o7-1Ld9;
	Tue, 14 Jul 2026 07:25:29 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjXWA-0000000B9li-2F0y
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 07:25:28 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-493b77b150aso4554785e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jul 2026 00:25:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1784013925; x=1784618725; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rhOhCok8KJZwb9BgUeO86PYIaljD8639HNhjhemVwqQ=;
        b=mweZz9ig2JgYsq/T9kJHhUJbiiqDEetNmNR+DLnHLCBWk2/HDfUM2C8EVMH+UQPSHI
         vvdk0cTOtLfrrRV7xKYhhss1zR+9cZhErM3RqpzRxzYJukUCiH81z+pqN4mSsesg5WEn
         OtIKFBt3LHVTbU/QSKzpb1RcFs1sPC+4hCXnahN+U0IfmrNOj+xh/DkPlt30RZVr7seN
         MUDqv7irZY3jBjleQPguXC1Wsa7y+2p8/SLy3xx6WWATzwuVv59GQ/5FS3h6chjRDQu6
         vleuQAmHB4pzy2om7UMTi7GLTW4Fuy4ZOjpZS5ohgxUgfh9+fNSrukrt9PI0krZRyoy7
         OX9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784013925; x=1784618725;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rhOhCok8KJZwb9BgUeO86PYIaljD8639HNhjhemVwqQ=;
        b=RUDiPN+cx3sN+BefgoHjFEG2zh1hL8yhTfFQ1uatF3E+uNVNPY3mdDJARBTs+kvu9f
         SxNrB6xCHOlQfbznBAbvpAaxDKAE7EdI7Vdt+IrFVjoGtEv1/93FuYDYb7k47QBj6A0s
         G/YsxfWHjwjwLErs5mtyqNNeB5xdyVAII2XE791rQKTEt7FqHHVredTQ112Rr/UAtcJV
         KPV07+OaecP1XiXlm3KoCsoarpxOCU4m20iRQs03iRJzfrsufK+G/PvFMmXkTl748j0v
         wN1JKPfw9mMxpnuLG2bW9uSKr8i7f10crX1TF8bj3rHseUaXQ1D9OYOw8TCT1Z88N7Q3
         U8+w==
X-Forwarded-Encrypted: i=1; AHgh+Rol5Mi2dYAgSMfobavWZUZDKdwIRsrpQwcDZPGYsKp0zcziqH3mkhr5PqNgIX+JtYL/w3U1LDT3X/EF+kDX+y0r@lists.infradead.org
X-Gm-Message-State: AOJu0Yz91nMct1c9aRqp9YoCBqODOTAdKmiV9H8RgJjDfQ5a4idBoFpH
	04p2Ds0nGn2l1c1uNwW2ayLyuTLOhtEHvtJ1QBwBh3A3XRcrf4NLw1AN4716FBTntLE=
X-Gm-Gg: AfdE7cnYnHfC8VKgB55DAUyiPG8Roq9vgjKVN48hBj8Co505Q3nca9TW+pavey4xjFQ
	wn6M7Ti7Z0EEyp3V1F6gCyosNuh9gYBigpxC63NVU6titpUJ8znYMvK5I9IJHKdIJwDKov+QkRH
	kvdLo5SuqNliuKSNvXF/fxqU1JkvRcjX9M7w86/P6MWFeNVwammRzSwHyTTy7TuFvYFprKT+42h
	PJgoOFq+zhH+Ua/lmPWKgj8R7sxVZdZ2w10XQfbZqgSFmG3j6VPC6J0ujMMpIfBNqJfYrw38VMu
	cmc6pBHxCR14W9yjsJ8IQqgkH4rxolukKz3J5mAguFyrTtX3zRjd7aVIym18abUpLf+I8fy1bU3
	axKGMLTg4Qm2l9LUI8TJsu5qQaEVVI50EDRKbMfM8vtTGWsH4dVtKftSNTpPInpyI0kkI2sSPFt
	j5+JdYa26FIQFPXH/6BfMHlfHuF3qjmWInPS9bUoebqXv1O2XciFma7S2z2G1wWshouNYfcrVtR
	DK+
X-Received: by 2002:a7b:c8c2:0:b0:492:7084:32af with SMTP id 5b1f17b1804b1-493f881d21amr86423645e9.23.1784013924640;
        Tue, 14 Jul 2026 00:25:24 -0700 (PDT)
Received: from localhost (p200300f65f47db04b44a80421173aa03.dip0.t-ipconnect.de. [2003:f6:5f47:db04:b44a:8042:1173:aa03])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-495087366c0sm103235765e9.7.2026.07.14.00.25.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 00:25:24 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: Ray Jui <rjui@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Imre Kaloz <kaloz@openwrt.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Daniel Palmer <daniel@thingy.jp>,
	Romain Perier <romain.perier@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v1 07/20] gpio: Add missing OF module annotations
Date: Tue, 14 Jul 2026 09:24:08 +0200
Message-ID: <72f0871dda4d65bb2b6ff8827da6a3b2dfdffab6.1784013063.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.55.0.11.g153666a7d9bb
In-Reply-To: <cover.1784013063.git.u.kleine-koenig@baylibre.com>
References: <cover.1784013063.git.u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=7966; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=CDGAuQBKSj+BrB4Chx7JpJWWpT/fi/gZCktZN8OyWzM=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqVeQtZBG3VoLsNGEM1WAVoDRQJe9lrJ9gvcxPZ gNTfJ1jAPGJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCalXkLQAKCRCPgPtYfRL+ TgMbB/4rie8AAVjE+9LOBTvioLXnQVEo9hTPWj1xE7RqDMNfxin0t6bySsXa5qWUhjitNHFDiPt Hw/QBE2RF9KaANja6Bt5K40JAWoWG9PVGIOnYn+1cI70JnLfG57TJ2Jt5b3uEn4pgL3sUA6xa2f tyVPKwY5yQdCIOVAsVfccq4ydbNJ4Lz0Tevg8VH7xQYmnXIRBpzYt9uCtm67yPBhEiXdhyGnTTq qsoroRyLjq1Dpe6hVDru0cjKaUzyl4LmcdmvKsXocafE7wxAQEXCITBtRCK47kVH3yEtytQdULK q0EPz1w0JB/zBDuygIyDEUXyQDBB67cH2tORHKXVqB1NcuYT
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_002526_618946_4A5FC432 
X-CRM114-Status: GOOD (  16.04  )
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

A driver module matching devices using an of device id table is supposed
to declare that in the module's metadata. Add this information for
several drivers that failed to declare these.

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/gpio/gpio-bcm-kona.c    | 1 +
 drivers/gpio/gpio-creg-snps.c   | 1 +
 drivers/gpio/gpio-ep93xx.c      | 1 +
 drivers/gpio/gpio-ftgpio010.c   | 1 +
 drivers/gpio/gpio-imx-scu.c     | 1 +
 drivers/gpio/gpio-ixp4xx.c      | 2 +-
 drivers/gpio/gpio-mpc5200.c     | 1 +
 drivers/gpio/gpio-mpc8xxx.c     | 1 +
 drivers/gpio/gpio-mpfs.c        | 1 +
 drivers/gpio/gpio-msc313.c      | 1 +
 drivers/gpio/gpio-mvebu.c       | 1 +
 drivers/gpio/gpio-nomadik.c     | 1 +
 drivers/gpio/gpio-pxa.c         | 1 +
 drivers/gpio/gpio-spear-spics.c | 1 +
 drivers/gpio/gpio-xgene.c       | 1 +
 drivers/gpio/gpio-zevio.c       | 1 +
 16 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-bcm-kona.c b/drivers/gpio/gpio-bcm-kona.c
index b0beffe48b7d..9bcbee25f685 100644
--- a/drivers/gpio/gpio-bcm-kona.c
+++ b/drivers/gpio/gpio-bcm-kona.c
@@ -522,6 +522,7 @@ static struct of_device_id const bcm_kona_gpio_of_match[] = {
 	{ .compatible = "brcm,kona-gpio" },
 	{}
 };
+MODULE_DEVICE_TABLE(of, bcm_kona_gpio_of_match);
 
 /*
  * This lock class tells lockdep that GPIO irqs are in a different
diff --git a/drivers/gpio/gpio-creg-snps.c b/drivers/gpio/gpio-creg-snps.c
index 157ab90f5ba8..2e159ea41791 100644
--- a/drivers/gpio/gpio-creg-snps.c
+++ b/drivers/gpio/gpio-creg-snps.c
@@ -131,6 +131,7 @@ static const struct of_device_id creg_gpio_ids[] = {
 		.data = &hsdk_cs_ctl
 	}, { /* sentinel */ }
 };
+MODULE_DEVICE_TABLE(of, creg_gpio_ids);
 
 static int creg_gpio_probe(struct platform_device *pdev)
 {
diff --git a/drivers/gpio/gpio-ep93xx.c b/drivers/gpio/gpio-ep93xx.c
index 8784e433e1ff..278b1093dd22 100644
--- a/drivers/gpio/gpio-ep93xx.c
+++ b/drivers/gpio/gpio-ep93xx.c
@@ -377,6 +377,7 @@ static const struct of_device_id ep93xx_gpio_match[] = {
 	{ .compatible = "cirrus,ep9301-gpio" },
 	{ /* sentinel */ }
 };
+MODULE_DEVICE_TABLE(of, ep93xx_gpio_match);
 
 static struct platform_driver ep93xx_gpio_driver = {
 	.driver		= {
diff --git a/drivers/gpio/gpio-ftgpio010.c b/drivers/gpio/gpio-ftgpio010.c
index 11e6907c3b54..e29df8d5e571 100644
--- a/drivers/gpio/gpio-ftgpio010.c
+++ b/drivers/gpio/gpio-ftgpio010.c
@@ -323,6 +323,7 @@ static const struct of_device_id ftgpio_gpio_of_match[] = {
 	},
 	{},
 };
+MODULE_DEVICE_TABLE(of, ftgpio_gpio_of_match);
 
 static struct platform_driver ftgpio_gpio_driver = {
 	.driver = {
diff --git a/drivers/gpio/gpio-imx-scu.c b/drivers/gpio/gpio-imx-scu.c
index 0a75afecf9f8..3ebd3d73ed58 100644
--- a/drivers/gpio/gpio-imx-scu.c
+++ b/drivers/gpio/gpio-imx-scu.c
@@ -114,6 +114,7 @@ static const struct of_device_id imx_scu_gpio_dt_ids[] = {
 	{ .compatible = "fsl,imx8qxp-sc-gpio" },
 	{ /* sentinel */ }
 };
+MODULE_DEVICE_TABLE(of, imx_scu_gpio_dt_ids);
 
 static struct platform_driver imx_scu_gpio_driver = {
 	.driver	= {
diff --git a/drivers/gpio/gpio-ixp4xx.c b/drivers/gpio/gpio-ixp4xx.c
index 669b139cd499..88d48cfc9017 100644
--- a/drivers/gpio/gpio-ixp4xx.c
+++ b/drivers/gpio/gpio-ixp4xx.c
@@ -341,7 +341,7 @@ static const struct of_device_id ixp4xx_gpio_of_match[] = {
 	},
 	{},
 };
-
+MODULE_DEVICE_TABLE(of, ixp4xx_gpio_of_match);
 
 static struct platform_driver ixp4xx_gpio_driver = {
 	.driver = {
diff --git a/drivers/gpio/gpio-mpc5200.c b/drivers/gpio/gpio-mpc5200.c
index 00f209157fd0..2c828bc922ae 100644
--- a/drivers/gpio/gpio-mpc5200.c
+++ b/drivers/gpio/gpio-mpc5200.c
@@ -180,6 +180,7 @@ static const struct of_device_id mpc52xx_wkup_gpiochip_match[] = {
 	{ .compatible = "fsl,mpc5200-gpio-wkup", },
 	{}
 };
+MODULE_DEVICE_TABLE(of, mpc52xx_wkup_gpiochip_match);
 
 static struct platform_driver mpc52xx_wkup_gpiochip_driver = {
 	.driver = {
diff --git a/drivers/gpio/gpio-mpc8xxx.c b/drivers/gpio/gpio-mpc8xxx.c
index a6868f673831..ee35da06cbc7 100644
--- a/drivers/gpio/gpio-mpc8xxx.c
+++ b/drivers/gpio/gpio-mpc8xxx.c
@@ -318,6 +318,7 @@ static const struct of_device_id mpc8xxx_gpio_ids[] = {
 	{ .compatible = "fsl,qoriq-gpio",   },
 	{}
 };
+MODULE_DEVICE_TABLE(of, mpc8xxx_gpio_ids);
 
 static int mpc8xxx_probe(struct platform_device *pdev)
 {
diff --git a/drivers/gpio/gpio-mpfs.c b/drivers/gpio/gpio-mpfs.c
index 7f0751d7b1c4..1078b3018970 100644
--- a/drivers/gpio/gpio-mpfs.c
+++ b/drivers/gpio/gpio-mpfs.c
@@ -295,6 +295,7 @@ static const struct of_device_id mpfs_gpio_of_ids[] = {
 	},
 	{ /* end of list */ }
 };
+MODULE_DEVICE_TABLE(of, mpfs_gpio_of_ids);
 
 static struct platform_driver mpfs_gpio_driver = {
 	.probe = mpfs_gpio_probe,
diff --git a/drivers/gpio/gpio-msc313.c b/drivers/gpio/gpio-msc313.c
index 7345afdc78de..38932986dc36 100644
--- a/drivers/gpio/gpio-msc313.c
+++ b/drivers/gpio/gpio-msc313.c
@@ -688,6 +688,7 @@ static const struct of_device_id msc313_gpio_of_match[] = {
 #endif
 	{ }
 };
+MODULE_DEVICE_TABLE(of, msc313_gpio_of_match);
 
 /*
  * The GPIO controller loses the state of the registers when the
diff --git a/drivers/gpio/gpio-mvebu.c b/drivers/gpio/gpio-mvebu.c
index 8d3acadb0d68..4d1625be11ec 100644
--- a/drivers/gpio/gpio-mvebu.c
+++ b/drivers/gpio/gpio-mvebu.c
@@ -978,6 +978,7 @@ static const struct of_device_id mvebu_gpio_of_match[] = {
 		/* sentinel */
 	},
 };
+MODULE_DEVICE_TABLE(of, mvebu_gpio_of_match);
 
 static int mvebu_gpio_suspend(struct platform_device *pdev, pm_message_t state)
 {
diff --git a/drivers/gpio/gpio-nomadik.c b/drivers/gpio/gpio-nomadik.c
index 208fed631975..90293329b40b 100644
--- a/drivers/gpio/gpio-nomadik.c
+++ b/drivers/gpio/gpio-nomadik.c
@@ -719,6 +719,7 @@ static const struct of_device_id nmk_gpio_match[] = {
 	{ .compatible = "mobileye,eyeq5-gpio", },
 	{}
 };
+MODULE_DEVICE_TABLE(of, nmk_gpio_match);
 
 static struct platform_driver nmk_gpio_driver = {
 	.driver = {
diff --git a/drivers/gpio/gpio-pxa.c b/drivers/gpio/gpio-pxa.c
index 5d61053e0596..317e3bc925eb 100644
--- a/drivers/gpio/gpio-pxa.c
+++ b/drivers/gpio/gpio-pxa.c
@@ -583,6 +583,7 @@ static const struct of_device_id pxa_gpio_dt_ids[] = {
 	{ .compatible = "marvell,pxa1928-gpio",	.data = &pxa1928_id, },
 	{}
 };
+MODULE_DEVICE_TABLE(of, pxa_gpio_dt_ids);
 
 static int pxa_gpio_probe_dt(struct platform_device *pdev,
 			     struct pxa_gpio_chip *pchip)
diff --git a/drivers/gpio/gpio-spear-spics.c b/drivers/gpio/gpio-spear-spics.c
index 96a0e1211500..3099deb2b290 100644
--- a/drivers/gpio/gpio-spear-spics.c
+++ b/drivers/gpio/gpio-spear-spics.c
@@ -157,6 +157,7 @@ static const struct of_device_id spics_gpio_of_match[] = {
 	{ .compatible = "st,spear-spics-gpio" },
 	{}
 };
+MODULE_DEVICE_TABLE(of, spics_gpio_of_match);
 
 static struct platform_driver spics_gpio_driver = {
 	.probe = spics_gpio_probe,
diff --git a/drivers/gpio/gpio-xgene.c b/drivers/gpio/gpio-xgene.c
index ad0f1551c271..b34b0c58b67c 100644
--- a/drivers/gpio/gpio-xgene.c
+++ b/drivers/gpio/gpio-xgene.c
@@ -191,6 +191,7 @@ static const struct of_device_id xgene_gpio_of_match[] = {
 	{ .compatible = "apm,xgene-gpio", },
 	{},
 };
+MODULE_DEVICE_TABLE(of, xgene_gpio_of_match);
 
 #ifdef CONFIG_ACPI
 static const struct acpi_device_id xgene_gpio_acpi_match[] = {
diff --git a/drivers/gpio/gpio-zevio.c b/drivers/gpio/gpio-zevio.c
index 288a86c8294a..f1c5c6a20673 100644
--- a/drivers/gpio/gpio-zevio.c
+++ b/drivers/gpio/gpio-zevio.c
@@ -213,6 +213,7 @@ static const struct of_device_id zevio_gpio_of_match[] = {
 	{ .compatible = "lsi,zevio-gpio", },
 	{ },
 };
+MODULE_DEVICE_TABLE(of, zevio_gpio_of_match);
 
 static struct platform_driver zevio_gpio_driver = {
 	.driver		= {
-- 
2.55.0.11.g153666a7d9bb


