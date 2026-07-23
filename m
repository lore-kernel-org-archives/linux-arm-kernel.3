Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFD3CC44532
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 01:37:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TARE8/sXv3L6g2hxD7xnpFQW2oHrPU6OhXPR2+eRj3g=; b=AsJbSpEoeHlvY5Eo2zR7KWw4hr
	PoET3UuFsNzgZiE+AIGQwRKq5E8TLQxXRBBmJZqicFUfrEYvGEe7uQp+Eh22rTkkbYrdmOqcNv0qp
	uQlqeibjKT2nuefdxcxb8gj/FiIPENmPplhHG0OrXZ9pkmiFltvkKwL5V8BFBdTK5hbq2rY5HB+ns
	2wyCuLoFiO4Y0pGcjV//yQF+UrIKtIe0eFN2SQNNFN7VJPlKfORKc8rXLmUfZ4qDFRFfjCWUcoVr3
	pGy3SwEH1VUPUC9qg7iwTqb2unaCt4ZN8zhCLGbSxKbn007uWRA5zH3qmsowmQApWYGfuXRTq6XnJ
	G1nVZucQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmiNh-0000000D6LI-2RYs;
	Thu, 23 Jul 2026 01:37:49 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmiLP-0000000D38k-2rg5;
	Thu, 23 Jul 2026 01:35:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1784770525;
	bh=iLBgGcOxsOS2yAa7hsIIJ+lrcLo+tkotBZn2zYbteNg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=a//86aP8s3QmqoJfeZedJDtPEVErdNHBv0NRJKk6ifdy4IT3skD6NdGxknmhb03C5
	 oMe6tQ4QPZXpys7IK28bPMFUsWatvsqyMAu/uW6DZdcBjXWbCNYh4q7szo0Kv8TglO
	 ooUOYOmvOdYa+XzG9hb8b9H/bKEF0966+5bT/YfJxJV4Saur12Ph1C3EJH9u1Jamgr
	 Mfgw+I1VBVqTvtjS7QmMx1WpibKtI+u3TGHuWiG1Q5DPhv6Uenwe/m2qyb3zjzDpwf
	 P6o92qM2OLVEhsGTs4jfsm/3+mI2cp0gbvL+FyzOcdPbslPK2Xkw/+kauZB7wDPvOG
	 mONZx+qLU8qZw==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id CDCEA17E1064;
	Thu, 23 Jul 2026 03:35:25 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Thu, 23 Jul 2026 04:35:23 +0300
Subject: [PATCH v9 34/61] drm/vc4: hdmi: Use common TMDS char rate
 constants
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260723-dw-hdmi-qp-scramb-v9-34-4fb12ea22ac9@collabora.com>
References: <20260723-dw-hdmi-qp-scramb-v9-0-4fb12ea22ac9@collabora.com>
In-Reply-To: <20260723-dw-hdmi-qp-scramb-v9-0-4fb12ea22ac9@collabora.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Chen-Yu Tsai <wens@kernel.org>, Samuel Holland <samuel@sholland.org>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, Algea Cao <algea.cao@rock-chips.com>, 
 Daniel Stone <daniels@collabora.com>, Liu Ying <victor.liu@nxp.com>, 
 Phong LE <ple@baylibre.com>
Cc: kernel@collabora.com, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-rockchip@lists.infradead.org
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_183527_918135_3A2817C5 
X-CRM114-Status: GOOD (  13.38  )
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

Replace HDMI_14_MAX_TMDS_CLK defined locally with
HDMI_1_3_TMDS_CHAR_RATE_MAX_HZ provided by linux/hdmi.h.  Note this
incorrectly referenced HDMI 1.4, as the 340 MHz maximum TMDS character
rate was actually introduced in HDMI 1.3.

Similarly, use HDMI_2_0_TMDS_CHAR_RATE_MAX_HZ instead of the 600000000
magic number.

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Acked-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 7f613f912368..9ce56eca775c 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -45,6 +45,7 @@
 #include <linux/clk.h>
 #include <linux/component.h>
 #include <linux/gpio/consumer.h>
+#include <linux/hdmi.h>
 #include <linux/i2c.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
@@ -113,8 +114,6 @@
 #define HSM_MIN_CLOCK_FREQ	120000000
 #define CEC_CLOCK_FREQ 40000
 
-#define HDMI_14_MAX_TMDS_CLK   (340 * 1000 * 1000)
-
 static bool vc4_hdmi_supports_scrambling(struct vc4_hdmi *vc4_hdmi)
 {
 	struct drm_display_info *display = &vc4_hdmi->connector.display_info;
@@ -137,7 +136,7 @@ static bool vc4_hdmi_mode_needs_scrambling(const struct drm_display_mode *mode,
 {
 	unsigned long long clock = drm_hdmi_compute_mode_clock(mode, bpc, fmt);
 
-	return clock > HDMI_14_MAX_TMDS_CLK;
+	return clock > HDMI_1_3_TMDS_CHAR_RATE_MAX_HZ;
 }
 
 static int vc4_hdmi_debugfs_regs(struct seq_file *m, void *unused)
@@ -1727,7 +1726,7 @@ vc4_hdmi_connector_clock_valid(const struct drm_connector *connector,
 	if (clock > vc4_hdmi->variant->max_pixel_clock)
 		return MODE_CLOCK_HIGH;
 
-	if (!vc4->hvs->vc5_hdmi_enable_hdmi_20 && clock > HDMI_14_MAX_TMDS_CLK)
+	if (!vc4->hvs->vc5_hdmi_enable_hdmi_20 && clock > HDMI_1_3_TMDS_CHAR_RATE_MAX_HZ)
 		return MODE_CLOCK_HIGH;
 
 	/* 4096x2160@60 is not reliable without overclocking core */
@@ -3253,7 +3252,7 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
 	 * vc4_hdmi_disable_scrambling() will thus run at boot, make
 	 * sure it's disabled, and avoid any inconsistency.
 	 */
-	if (variant->max_pixel_clock > HDMI_14_MAX_TMDS_CLK)
+	if (variant->max_pixel_clock > HDMI_1_3_TMDS_CHAR_RATE_MAX_HZ)
 		vc4_hdmi->scdc_enabled = true;
 
 	ret = variant->init_resources(drm, vc4_hdmi);
@@ -3383,7 +3382,7 @@ static const struct vc4_hdmi_variant bcm2711_hdmi0_variant = {
 	.encoder_type		= VC4_ENCODER_TYPE_HDMI0,
 	.debugfs_name		= "hdmi0_regs",
 	.card_name		= "vc4-hdmi-0",
-	.max_pixel_clock	= 600000000,
+	.max_pixel_clock	= HDMI_2_0_TMDS_CHAR_RATE_MAX_HZ,
 	.registers		= vc5_hdmi_hdmi0_fields,
 	.num_registers		= ARRAY_SIZE(vc5_hdmi_hdmi0_fields),
 	.phy_lane_mapping	= {
@@ -3412,7 +3411,7 @@ static const struct vc4_hdmi_variant bcm2711_hdmi1_variant = {
 	.encoder_type		= VC4_ENCODER_TYPE_HDMI1,
 	.debugfs_name		= "hdmi1_regs",
 	.card_name		= "vc4-hdmi-1",
-	.max_pixel_clock	= HDMI_14_MAX_TMDS_CLK,
+	.max_pixel_clock	= HDMI_1_3_TMDS_CHAR_RATE_MAX_HZ,
 	.registers		= vc5_hdmi_hdmi1_fields,
 	.num_registers		= ARRAY_SIZE(vc5_hdmi_hdmi1_fields),
 	.phy_lane_mapping	= {
@@ -3441,7 +3440,7 @@ static const struct vc4_hdmi_variant bcm2712_hdmi0_variant = {
 	.encoder_type		= VC4_ENCODER_TYPE_HDMI0,
 	.debugfs_name		= "hdmi0_regs",
 	.card_name		= "vc4-hdmi-0",
-	.max_pixel_clock	= 600000000,
+	.max_pixel_clock	= HDMI_2_0_TMDS_CHAR_RATE_MAX_HZ,
 	.registers		= vc6_hdmi_hdmi0_fields,
 	.num_registers		= ARRAY_SIZE(vc6_hdmi_hdmi0_fields),
 	.phy_lane_mapping	= {
@@ -3468,7 +3467,7 @@ static const struct vc4_hdmi_variant bcm2712_hdmi1_variant = {
 	.encoder_type		= VC4_ENCODER_TYPE_HDMI1,
 	.debugfs_name		= "hdmi1_regs",
 	.card_name		= "vc4-hdmi-1",
-	.max_pixel_clock	= 600000000,
+	.max_pixel_clock	= HDMI_2_0_TMDS_CHAR_RATE_MAX_HZ,
 	.registers		= vc6_hdmi_hdmi1_fields,
 	.num_registers		= ARRAY_SIZE(vc6_hdmi_hdmi1_fields),
 	.phy_lane_mapping	= {

-- 
2.55.0


