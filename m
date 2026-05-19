Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 121E4CD4F57
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 09:03:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RfFj3ru1fQImEauJoWOOZ0kKHKeEo1Upyo5tWwIsy2U=; b=EDLZtvX3bZ0IOf2kjI/HvPy8/R
	wlqLgpbZ0SSfRjUqV0JyzpJfK7oqykfaBdp248baLiDOIyYcTK9RfCPb5zJfILCkjBiZVFwXn3qkx
	pGHt0+7LK/c6VgJcCy2xU4u+1MTcu/xI2Vd87t5UvwdM50inKBBFILLBTA5qxsBLPm+dHCNe7B1Zu
	1Ccm2kfMZLKqirFBjUi9JTARhQpUcdOg5tOuJCs8nZfFHF+qCRVt1w3JeFd9G3vQIa31YLEsERQOH
	HWdpPxaQq4XXV+tVQJZchjpRJL78pGlwdbxr1IvQB0kjNe39w5AjZKxfQ98MC9pP0pk5hn6IIYA5H
	Aq83ReYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPGLw-00000000p04-24pK;
	Tue, 19 May 2026 09:03:04 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPGLS-00000000oKm-2xAz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 09:02:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1779181354; x=1810717354;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Tm9q+vgC/TE0/J5bF1BfNmg6fL5/6NXJsdwhZrhCZDU=;
  b=vL6uqUfoemKkqj5YAm2UG06t8WkHBaOf/iou6aPYhH9bWmLInnaPuMl8
   F2kSVSZRkQ2XnXUE9FIFM7NvJdwDDyFyK0xjl0T/vR0EFIwqmF5UVyLtp
   TbbjvaI860YtvcHonX9Q+VzZS+A8R5cEgbtvEY2kkdfWuyWJI+AZ4EaUX
   RsH/Sv7JQsikO+t1YFPaAOZteOv/bXWMjXMsJQKTpu0EAEknCHeaT4g7c
   ZR/E0EzohdHubzmI+pCCNVAYn1xrwMVejMZtkmIJ/fDEVWBHBT01y/A7g
   lctjqgFkNMr5BDz5egeQ7e928/QmCu/HPyUxKxYsIs5N9mhwMv0+gcEui
   g==;
X-CSE-ConnectionGUID: 0bjdnIJPTk6rZW7FT7klOA==
X-CSE-MsgGUID: iDGxftsOQZGzJhzB6fhTbA==
X-IronPort-AV: E=Sophos;i="6.23,243,1770620400"; 
   d="scan'208";a="56939638"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 19 May 2026 02:02:33 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Tue, 19 May 2026 02:02:33 -0700
Received: from che-lt-i67131.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Tue, 19 May 2026 02:02:28 -0700
From: Manikandan Muralidharan <manikandan.m@microchip.com>
To: <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
	<tzimmermann@suse.de>, <airlied@gmail.com>, <simona@ffwll.ch>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <lee@kernel.org>,
	<dri-devel@lists.freedesktop.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
CC: <manikandan.m@microchip.com>
Subject: [PATCH 7/8] drm: atmel-hlcdc: add and configure LVDS PLL clock support
Date: Tue, 19 May 2026 14:31:34 +0530
Message-ID: <20260519090135.1188405-8-manikandan.m@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260519090135.1188405-1-manikandan.m@microchip.com>
References: <20260519090135.1188405-1-manikandan.m@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_020234_807173_E031952F 
X-CRM114-Status: GOOD (  15.19  )
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

Set the LVDS PLL rate to 7x the pixel clock.
set ATMEL_XLCDC_CLKBYP for the LVDS path, leaving clock
lifecycle management to the atomic callbacks and fallback to
sys_clk for non-LVDS displays with proper error handling.

Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
---
 .../gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c    | 45 +++++++++++++++++--
 1 file changed, 42 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c
index f837684654ea..73a8650bc9b7 100644
--- a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c
+++ b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c
@@ -26,6 +26,8 @@
 
 #include "atmel_hlcdc_dc.h"
 
+#define ATMEL_LVDS_PLL_MULT	7
+
 /**
  * struct atmel_hlcdc_crtc_state - Atmel HLCDC CRTC state structure
  *
@@ -66,6 +68,14 @@ drm_crtc_to_atmel_hlcdc_crtc(struct drm_crtc *crtc)
 	return container_of(crtc, struct atmel_hlcdc_crtc, base);
 }
 
+static void atmel_hlcdc_crtc_disable_clock(struct atmel_hlcdc_crtc *crtc)
+{
+	if (crtc->dc->hlcdc->lvds_pll_clk)
+		clk_disable_unprepare(crtc->dc->hlcdc->lvds_pll_clk);
+	else
+		clk_disable_unprepare(crtc->dc->hlcdc->sys_clk);
+}
+
 static int atmel_hlcdc_crtc_setup_clock(struct atmel_hlcdc_crtc *crtc,
 					unsigned long mode_rate,
 					unsigned int *cfg,
@@ -74,6 +84,12 @@ static int atmel_hlcdc_crtc_setup_clock(struct atmel_hlcdc_crtc *crtc,
 	unsigned long prate;
 	int div, ret;
 
+	if (crtc->dc->hlcdc->lvds_pll_clk) {
+		*cfg |= ATMEL_XLCDC_CLKBYP;
+		*mask |= ATMEL_XLCDC_CLKBYP;
+		return clk_prepare_enable(crtc->dc->hlcdc->lvds_pll_clk);
+	}
+
 	ret = clk_prepare_enable(crtc->dc->hlcdc->sys_clk);
 	if (ret)
 		return ret;
@@ -198,7 +214,7 @@ static void atmel_hlcdc_crtc_mode_set_nofb(struct drm_crtc *c)
 			   ATMEL_XLCDC_DPI : ATMEL_HLCDC_MODE_MASK),
 			   cfg);
 
-	clk_disable_unprepare(crtc->dc->hlcdc->sys_clk);
+	atmel_hlcdc_crtc_disable_clock(crtc);
 }
 
 static enum drm_mode_status
@@ -254,7 +270,8 @@ static void atmel_hlcdc_crtc_atomic_disable(struct drm_crtc *c,
 				    10, 1000))
 		drm_warn(dev, "Atmel LCDC status register CLKSTS timeout\n");
 
-	clk_disable_unprepare(crtc->dc->hlcdc->sys_clk);
+	atmel_hlcdc_crtc_disable_clock(crtc);
+
 	pinctrl_pm_select_sleep_state(dev->dev);
 
 	pm_runtime_allow(dev->dev);
@@ -267,15 +284,33 @@ static void atmel_hlcdc_crtc_atomic_enable(struct drm_crtc *c,
 {
 	struct drm_device *dev = c->dev;
 	struct atmel_hlcdc_crtc *crtc = drm_crtc_to_atmel_hlcdc_crtc(c);
+	struct drm_display_mode *adj = &c->state->adjusted_mode;
 	struct regmap *regmap = crtc->dc->hlcdc->regmap;
 	unsigned int status;
+	int ret;
 
 	pm_runtime_get_sync(dev->dev);
 
 	pm_runtime_forbid(dev->dev);
 
 	pinctrl_pm_select_default_state(dev->dev);
-	clk_prepare_enable(crtc->dc->hlcdc->sys_clk);
+
+	/*
+	 * Set LVDS PLL clock rate (7x pixel clock) if available
+	 */
+	if (crtc->dc->hlcdc->lvds_pll_clk) {
+		ret = clk_set_rate(crtc->dc->hlcdc->lvds_pll_clk,
+				   adj->clock * 1000 * ATMEL_LVDS_PLL_MULT);
+		if (ret) {
+			drm_err(dev, "Failed to set LVDS PLL clk rate: %d\n", ret);
+			goto err_clk;
+		}
+		ret = clk_prepare_enable(crtc->dc->hlcdc->lvds_pll_clk);
+	} else {
+		ret = clk_prepare_enable(crtc->dc->hlcdc->sys_clk);
+	}
+	if (ret)
+		goto err_clk;
 
 	regmap_write(regmap, ATMEL_HLCDC_EN, ATMEL_HLCDC_PIXEL_CLK);
 	if (regmap_read_poll_timeout(regmap, ATMEL_HLCDC_SR, status,
@@ -310,7 +345,11 @@ static void atmel_hlcdc_crtc_atomic_enable(struct drm_crtc *c,
 	}
 
 	pm_runtime_put_sync(dev->dev);
+	return;
 
+err_clk:
+	pm_runtime_allow(dev->dev);
+	pm_runtime_put_sync(dev->dev);
 }
 
 #define ATMEL_HLCDC_RGB444_OUTPUT		BIT(0)
-- 
2.25.1


