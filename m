Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41A38E98E14
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 10:20:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y7h1ubOWGeOU8eh57jYCzivrtHqCZy9UTk9vrYhx9xY=; b=b3ONDaF80qv1SW+sdcpOhLIeg9
	LMlIG980breXvTHMkD/1gd8rDuGq6pKWswUqbA88VZ9JUV+vn2YRte+2Z+oDazxlfrwz48ORNz3pX
	88GTTTWEQnD7Sk4RlbcUFSWhcsAB5VN33AIymJ2XxJ3VO2A81JMF4qk1L/oWV0qUNhajUGTFUbbXR
	cx5XBh+yb+FJ19ghX5W57EMBEgyBopuO2IQ8kCK8glovylYeM/A+FHD7E1QlRgVPFGtK9W7e1hZPQ
	nv9jsVFTN1lEuqETdq70dbsJVm7DNpWfqLsFq0xZZ5talE3T1i1s1FnI8hU71+ESz3a1+OyrQwTnL
	p1FrvqBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuT3O-000000002O2-1QQQ;
	Mon, 23 Feb 2026 10:20:38 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuT3G-000000002IA-3uyY
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Feb 2026 10:20:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1771842030; x=1803378030;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=XGUvf+KenQzk8k4vozQBvoxGs/tTB8x65xysSNH3uRc=;
  b=2o7vaE95ZqUMIbez3UrvXpMPRVpd5yOfBaUtGNXr2Bkj8Uqv4OiOsJeO
   h/k4wvkhmRcfnX0CZd2K0THz79uY8nQ8izFbHlhQyPemG4pWYwH8Fz9qX
   UbW092Zw+HBv7wl0hsn74rYSqt2ym7NBnUfH/yB67A2ifQ6MzKfAfaNp9
   uOUyPyJpa0cOFoU2DOGP5RDl7Jr4n0wxvZAKJ7ohXVACaKiPZvrMZcaw8
   HGKX2gi3JY2XWImfkGihR4qTOChf2Sf5ICwLzfRudRnAOPkla9IRIMHV6
   q0amIi18cdEZH6gqKI51A0W8+8hxP6OtCC1TiX0J10awL1rFQuh6iFit3
   g==;
X-CSE-ConnectionGUID: xLxJrVz4SA+TZ2kb8t2UqQ==
X-CSE-MsgGUID: d6Eg9STLReWgxqckjEf6tw==
X-IronPort-AV: E=Sophos;i="6.21,306,1763449200"; 
   d="scan'208";a="220994672"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2026 03:20:29 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.87.151) by
 chn-vm-ex4.mchp-main.com (10.10.87.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.35; Mon, 23 Feb 2026 03:20:00 -0700
Received: from che-lt-i67131.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Mon, 23 Feb 2026 03:19:54 -0700
From: Manikandan Muralidharan <manikandan.m@microchip.com>
To: <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
	<tzimmermann@suse.de>, <airlied@gmail.com>, <simona@ffwll.ch>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <lee@kernel.org>,
	<dri-devel@lists.freedesktop.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
CC: <manikandan.m@microchip.com>, Dharma Balasubiramani
	<dharma.b@microchip.com>
Subject: [PATCH v3 2/4] drm: atmel-hlcdc: configure LVDS PLL clock rate for LVDS Displays
Date: Mon, 23 Feb 2026 15:49:18 +0530
Message-ID: <20260223101920.284697-3-manikandan.m@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260223101920.284697-1-manikandan.m@microchip.com>
References: <20260223101920.284697-1-manikandan.m@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_022031_040485_6D8FEA49 
X-CRM114-Status: GOOD (  13.09  )
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

From: Dharma Balasubiramani <dharma.b@microchip.com>

As per datasheet, The LVDS PLL clock runs at 7 times the
panel pixel clock.
Set the LVDS PLL clock to eliminate the need of assiging
them in the DT and fallback to sys_clk for non-LVDS displays
with proper error handling.

Signed-off-by: Dharma Balasubiramani <dharma.b@microchip.com>
Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
---
Changes in v3:
- Rephrase commit message and comment block

Changes in v2:
- Rephrase commit message and comment block
---
 .../gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c    | 36 ++++++++++++++++---
 1 file changed, 32 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c
index b075f291847f..26c9fbdfd871 100644
--- a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c
+++ b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c
@@ -100,7 +100,10 @@ static void atmel_hlcdc_crtc_mode_set_nofb(struct drm_crtc *c)
 		drm_connector_list_iter_end(&iter);
 	}
 
-	ret = clk_prepare_enable(crtc->dc->hlcdc->sys_clk);
+	if (crtc->dc->hlcdc->lvds_pll_clk)
+		ret = clk_prepare_enable(crtc->dc->hlcdc->lvds_pll_clk);
+	else
+		ret = clk_prepare_enable(crtc->dc->hlcdc->sys_clk);
 	if (ret)
 		return;
 
@@ -187,7 +190,10 @@ static void atmel_hlcdc_crtc_mode_set_nofb(struct drm_crtc *c)
 			   ATMEL_XLCDC_DPI : ATMEL_HLCDC_MODE_MASK),
 			   cfg);
 
-	clk_disable_unprepare(crtc->dc->hlcdc->sys_clk);
+	if (crtc->dc->hlcdc->lvds_pll_clk)
+		clk_disable_unprepare(crtc->dc->hlcdc->lvds_pll_clk);
+	else
+		clk_disable_unprepare(crtc->dc->hlcdc->sys_clk);
 }
 
 static enum drm_mode_status
@@ -243,7 +249,11 @@ static void atmel_hlcdc_crtc_atomic_disable(struct drm_crtc *c,
 				    10, 1000))
 		drm_warn(dev, "Atmel LCDC status register CLKSTS timeout\n");
 
-	clk_disable_unprepare(crtc->dc->hlcdc->sys_clk);
+	if (crtc->dc->hlcdc->lvds_pll_clk)
+		clk_disable_unprepare(crtc->dc->hlcdc->lvds_pll_clk);
+	else
+		clk_disable_unprepare(crtc->dc->hlcdc->sys_clk);
+
 	pinctrl_pm_select_sleep_state(dev->dev);
 
 	pm_runtime_allow(dev->dev);
@@ -256,15 +266,33 @@ static void atmel_hlcdc_crtc_atomic_enable(struct drm_crtc *c,
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
+				   (adj->clock * 7000));
+		if (ret) {
+			drm_err(dev, "Failed to set LVDS PLL clk rate: %d\n", ret);
+			return;
+		}
+		ret = clk_prepare_enable(crtc->dc->hlcdc->lvds_pll_clk);
+	} else {
+		ret = clk_prepare_enable(crtc->dc->hlcdc->sys_clk);
+	}
+	if (ret)
+		return;
 
 	regmap_write(regmap, ATMEL_HLCDC_EN, ATMEL_HLCDC_PIXEL_CLK);
 	if (regmap_read_poll_timeout(regmap, ATMEL_HLCDC_SR, status,
-- 
2.25.1


