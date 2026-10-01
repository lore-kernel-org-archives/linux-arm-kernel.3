Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 489F7CA5FD6
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 01:15:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C62NbbZZXw/kBQhpslyP1gjpT+jZCJgIPo2p22d+QlI=; b=3LZM4La4Q+x2DYkMTRr6CRineY
	pmj4GqWVkAik1UNjWiMUtSi4n1iKguNTV/xbVuNspANmWtC0g9l7Gjv5dIJ/10uJkc2j2SapdOjFB
	tJu7PJHFF1i8lHQ/Wk9ZPiBepGGqZq+tf+9VAl1nDlosAeRnd7XsBhom1c8encJoU+UssR8+VymOg
	HzExwrDGQZ2DiEz8Rtwq1oeMEm148FhGfgfBdyJhJGeTZ88Px1KDh3mG1RLjFlewnQk2VtjDqgGvK
	5kVrdwP/ZkCRSo/bRTf6Jf0vyMatngcGJxQx4/WUG/dDafP02J7w9zci1DWE/1U3MeAvYxOSqEQVm
	SUL6W5Ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xC5OQ-00000007YCj-33wj;
	Thu, 01 Oct 2026 01:15:26 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xC5O7-00000007Y3k-22ZV;
	Thu, 01 Oct 2026 01:15:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1790817303;
	bh=eTwvcHzDahjPYHCtMEH5hOYZ7IvsD5Sh3bBiNe6fI+U=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=AJGtWScpvXvSKR4IHdG06rCq1VHxF0mP0qOFfXfHwx2YP17Jj43UTtdKcZqIktDz4
	 pNO+5IU8uDFrKcDAzZqC37TcAeyN1pSJgNlHU5HSbJtIHjNGhT5YYZMaDXF0c6BcMR
	 uVGU9Nka+bNChhQmLVCdxef4pNo4GRn8S0B0xy+FWCbWbWQdo2BP0aIH7Y63D6UD98
	 QQuYb12YExyFpDIEn7eDE4YtJLzyQuTMBHBhSUpU0BhqdPcOEn2VVFDpYRAxPDPJbS
	 4K7NsUzoMymyjvBwOabgXvnaZuAUWQxhDIvJOXIIzlBnUcNd5vZpgKvxDqdj/hCkWF
	 MGC2sCL2CxQKg==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5E98417E1088;
	Thu, 01 Oct 2026 03:15:03 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Thu, 01 Oct 2026 04:14:39 +0300
Subject: [PATCH 8/8] drm/sun4i: hdmi: Convert to drmm_connector_hdmi_init()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261001-bridge-advert-hdmi-caps-v1-8-f8806570e243@collabora.com>
References: <20261001-bridge-advert-hdmi-caps-v1-0-f8806570e243@collabora.com>
In-Reply-To: <20261001-bridge-advert-hdmi-caps-v1-0-f8806570e243@collabora.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Andy Yan <andy.yan@rock-chips.com>, Liu Ying <victor.liu@nxp.com>, 
 Phong LE <ple@baylibre.com>, Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Chen-Yu Tsai <wens@kernel.org>, Samuel Holland <samuel@sholland.org>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_181507_687630_F3AD6071 
X-CRM114-Status: GOOD (  14.56  )
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

Switch driver over to the new drmm_connector_hdmi_init() signature and
advertise HDMI 1.2 support.  The vendor, product, supported_formats and
max_bpc values previously passed as arguments are now provided through
struct drm_connector_hdmi_funcs, together with the new
supported_hdmi_ver field.

The HDMI connector helpers infer the 165 MHz TMDS character rate ceiling
from supported_hdmi_ver and reject modes exceeding it before invoking
the driver's .tmds_char_rate_valid() hook.  This makes the explicit mode
clock check in sun4i_hdmi_connector_clock_valid() redundant, so drop it.

No functional change intended.

Reviewed-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c | 25 +++++++++++--------------
 1 file changed, 11 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c b/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
index d98b6f12a7bc..6f4fe0c8efae 100644
--- a/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
+++ b/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
@@ -192,10 +192,6 @@ sun4i_hdmi_connector_clock_valid(const struct drm_connector *connector,
 	if (mode->flags & DRM_MODE_FLAG_DBLCLK)
 		return MODE_BAD;
 
-	/* HDMI 1.0 max TMDS character rate */
-	if (clock > HDMI_1_0_TMDS_CHAR_RATE_MAX_HZ)
-		return MODE_CLOCK_HIGH;
-
 	rounded_rate = clk_round_rate(hdmi->tmds_clk, clock);
 	if (rounded_rate > 0 &&
 	    max_t(unsigned long, rounded_rate, clock) -
@@ -253,6 +249,15 @@ static struct i2c_adapter *sun4i_hdmi_get_ddc(struct device *dev)
 }
 
 static const struct drm_connector_hdmi_funcs sun4i_hdmi_hdmi_connector_funcs = {
+	/*
+	 * NOTE: Those are likely to be wrong, but I couldn't find
+	 * the actual ones in the BSP.
+	 */
+	.vendor = "AW",
+	.product = "HDMI",
+	.supported_hdmi_ver = HDMI_VERSION_1_2,
+	.supported_formats = BIT(DRM_OUTPUT_COLOR_FORMAT_RGB444),
+	.max_bpc = 8,
 	.tmds_char_rate_valid	= sun4i_hdmi_connector_clock_valid,
 	.avi = {
 		.clear_infoframe	= sun4i_hdmi_clear_avi_infoframe,
@@ -654,19 +659,11 @@ static int sun4i_hdmi_bind(struct device *dev, struct device *master,
 
 	drm_connector_helper_add(&hdmi->connector,
 				 &sun4i_hdmi_connector_helper_funcs);
-	ret = drmm_connector_hdmi_ini2(drm, &hdmi->connector,
-				       /*
-					* NOTE: Those are likely to be
-					* wrong, but I couldn't find the
-					* actual ones in the BSP.
-					*/
-				       "AW", "HDMI",
+	ret = drmm_connector_hdmi_init(drm, &hdmi->connector,
 				       &sun4i_hdmi_connector_funcs,
 				       &sun4i_hdmi_hdmi_connector_funcs,
 				       DRM_MODE_CONNECTOR_HDMIA,
-				       hdmi->ddc_i2c,
-				       BIT(DRM_OUTPUT_COLOR_FORMAT_RGB444),
-				       8);
+				       hdmi->ddc_i2c);
 	if (ret) {
 		dev_err(dev,
 			"Couldn't initialise the HDMI connector\n");

-- 
2.55.0


