Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BB58CEFCE5
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Jan 2026 17:44:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r9TuuH3jGf5ZbOx4MF98tfbStt80GEUYcg9MPLUsmUM=; b=b9q4ee5PfqXMg8DvT1ciHVWXDU
	AX1We45abPyUDzMGHFUF5caWafmKj2qpZcG8d843lJ20SHDWASzTMH7+I8HQt/ft2XOVuDjaFWe3h
	2pOZIzbMCPSqVM/R+ZyYKDNipwxnE/wQwudO7FM2/PI1AY5QzSN5YCROfouE/SlgxVbITZLnSAsXv
	+X/G6SBssuYQL6FKsEJCqVJu/SFJ1eHb7+9K9V41M4YwSignAYpfe3wW/aPWV3Amp+oqxjgrV89M4
	fLSb/2fxYiT3bfi3Qpnn2ClDuQ1ABL4OgpNJPCpukCcOfvKWQ72ZzfvvSyTPXXnejUi7cHrIBdV+m
	W6UmF7pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdB6Q-0000000Dblb-1VyN;
	Tue, 06 Jan 2026 17:44:18 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdB6M-0000000Dbg1-3Jm6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Jan 2026 17:44:17 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 4F7184E41FB2;
	Tue,  6 Jan 2026 17:44:13 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2365560739;
	Tue,  6 Jan 2026 17:44:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 16BC3103C830C;
	Tue,  6 Jan 2026 18:44:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767721451; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=r9TuuH3jGf5ZbOx4MF98tfbStt80GEUYcg9MPLUsmUM=;
	b=zsJiNwipAGjaEXP65DHeV68VH1CIMFLKCpm7p5t7Yup1WQrCxfZ3LgGGxsOPiwscgKL7g4
	l6zXSC7jdjfKI/0Lyq0UYbGFU3zDUACmIlUdZSUPH6ijESjxWv+nxFHT9xlhEU6Yd+rYUG
	fPkcZU9ZrlT/fLdbAb/BNo1RLhAk5xJgFii135Ko84SykZxH+JUzXoRHDh2ipOA+GIob2X
	VHyK4PTH3jMgdo36daQ1Rf28m3XlDfzbc1ZmahKBe6vmumirNCE2HzNbKtY7IiMMRsDnJP
	BwqWscamvHHvhyvtFA+HtI7v2UeeenI16lRWDFHQbkmjxwyoUrvkr3q1RHl8IQ==
From: "Kory Maincent (TI.com)" <kory.maincent@bootlin.com>
Date: Tue, 06 Jan 2026 18:42:30 +0100
Subject: [PATCH v3 14/22] drm/tilcdc: Use drm_module_platform_driver()
 helper
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260106-feature_tilcdc-v3-14-9bad0f742164@bootlin.com>
References: <20260106-feature_tilcdc-v3-0-9bad0f742164@bootlin.com>
In-Reply-To: <20260106-feature_tilcdc-v3-0-9bad0f742164@bootlin.com>
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
X-CRM114-CacheID: sfid-20260106_094415_009030_AEE9AD19 
X-CRM114-Status: GOOD (  12.66  )
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
index 34d0e81552912..a82a2494e23d9 100644
--- a/drivers/gpu/drm/tilcdc/tilcdc_drv.c
+++ b/drivers/gpu/drm/tilcdc/tilcdc_drv.c
@@ -20,6 +20,7 @@
 #include <drm/drm_gem_dma_helper.h>
 #include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_mm.h>
+#include <drm/drm_module.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_vblank.h>
 
@@ -534,23 +535,7 @@ static struct platform_driver tilcdc_platform_driver = {
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


