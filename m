Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1475C982DB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Jan 2026 17:03:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FQ0P42EzhOi6Mvdjh1r2E2jQmcpCktzh4DgjhufdPjg=; b=jJeBk2DTEEogIEV59W/2mABQQB
	Tft7/ZKE1citDz4jvzvBiKmmxdGLngUYTuK4hiJ78Ajl/fECtTStOh5ZDsOuohlTkS9Rwx5o2+I1J
	k7tbkZcsXMkheliyJWmFdQbHkIL7TmsTVgMpUB27ThbA1L9qUbXRGqPwpXn3jHUGRjuuWqG5COJsj
	hMZmVYdlf3XyByEqWe4cKdF3SZH9+GNmop+R75mRnh6sj3XQIdzLinj0FkhKRN8puXUehXRxgWQVN
	kNImXgydoXFHhP6AtP8DHJetFx2h3/VZc5zrsFJeUrpX8zN4D54YqDClPR7Z4+GypLqtC1Xd/Hw9n
	NHroy4Fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgnER-0000000EWRs-3QZe;
	Fri, 16 Jan 2026 17:03:31 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgnEL-0000000EWJY-3uhz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Jan 2026 17:03:28 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 4F19F4E42112;
	Fri, 16 Jan 2026 17:03:24 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2371A606F9;
	Fri, 16 Jan 2026 17:03:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6613E10B68CBC;
	Fri, 16 Jan 2026 18:03:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768583002; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=FQ0P42EzhOi6Mvdjh1r2E2jQmcpCktzh4DgjhufdPjg=;
	b=rdcMsSZVvAX3sGyS3YDOQDm55QbdOmclQDY0PuXcCWOw8y7mspCFXFUQpKIQtdgjndm9aJ
	pHCyA0d5BNhNi5LoZErPdK9wYPU4qwnL09zi2wxaif+t3AZelEmeJmFYB9cWXz5vCWX0CF
	xCiiFjoawSRdTEv+Q4DO7Pq1V6KIyWV6sIFx1iCstA7i6CAaY6LxNxUatnBD4Amsd3afyE
	aJv9kiP7kOCST6huK1O/WisidXr+KU7HPgxl2izoeDPMC5kR/DiFjgPQqoNrySrT1snQiG
	VVuKxrrAHgSt05/TWNkBT93zEdQcanOFHr+/kpiGx3zmBIkmgz/R6LJ7OaGhtw==
From: "Kory Maincent (TI.com)" <kory.maincent@bootlin.com>
Date: Fri, 16 Jan 2026 18:02:14 +0100
Subject: [PATCH v4 14/25] drm/tilcdc: Use drm_module_platform_driver()
 helper
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260116-feature_tilcdc-v4-14-2c1c22143087@bootlin.com>
References: <20260116-feature_tilcdc-v4-0-2c1c22143087@bootlin.com>
In-Reply-To: <20260116-feature_tilcdc-v4-0-2c1c22143087@bootlin.com>
To: Jyri Sarha <jyri.sarha@iki.fi>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Tony Lindgren <tony@atomide.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Markus Schneider-Pargmann <msp@baylibre.com>, 
 Bajjuri Praneeth <praneeth@ti.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Louis Chauvet <louis.chauvet@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Miguel Gazquez <miguel.gazquez@bootlin.com>, 
 Herve Codina <herve.codina@bootlin.com>, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org, 
 "Kory Maincent (TI.com)" <kory.maincent@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260116_090326_232938_8F5FE479 
X-CRM114-Status: GOOD (  11.89  )
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

Use the drm_module_platform_driver() helper macro to simplify driver
registration. This macro handles both the platform driver registration
and the drm_firmware_drivers_only() check, making the custom init/exit
functions unnecessary.

Signed-off-by: Kory Maincent (TI.com) <kory.maincent@bootlin.com>
---

Change in v3:
- New patch split from previous patch of the series.
---
 drivers/gpu/drm/tilcdc/tilcdc_drv.c | 19 ++-----------------
 1 file changed, 2 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/tilcdc/tilcdc_drv.c b/drivers/gpu/drm/tilcdc/tilcdc_drv.c
index 20f93240b335c..97380b623fca3 100644
--- a/drivers/gpu/drm/tilcdc/tilcdc_drv.c
+++ b/drivers/gpu/drm/tilcdc/tilcdc_drv.c
@@ -20,6 +20,7 @@
 #include <drm/drm_gem_dma_helper.h>
 #include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_mm.h>
+#include <drm/drm_module.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_vblank.h>
 
@@ -532,23 +533,7 @@ static struct platform_driver tilcdc_platform_driver = {
 	},
 };
 
-static int __init tilcdc_drm_init(void)
-{
-	if (drm_firmware_drivers_only())
-		return -ENODEV;
-
-	DBG("init");
-	return platform_driver_register(&tilcdc_platform_driver);
-}
-
-static void __exit tilcdc_drm_fini(void)
-{
-	DBG("fini");
-	platform_driver_unregister(&tilcdc_platform_driver);
-}
-
-module_init(tilcdc_drm_init);
-module_exit(tilcdc_drm_fini);
+drm_module_platform_driver(tilcdc_platform_driver);
 
 MODULE_AUTHOR("Rob Clark <robdclark@gmail.com");
 MODULE_DESCRIPTION("TI LCD Controller DRM Driver");

-- 
2.43.0


