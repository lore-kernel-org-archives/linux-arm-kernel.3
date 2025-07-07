Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFE38C83F0A
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Jul 2025 17:28:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YpitKWsGYdvkCnrR1mHFS1FP2h9VNXePXRkQPh7Xnq8=; b=H5+xa1LYpQQCS2L/pcc4/TKwhi
	i5BKJ7hStPhUvVu3/gfHRwaMV2PpCbPKaPXknUKskxA6z6YFuPMhf6LAEWQLgpd+pg9wfd0NSuu8I
	VxA7s4/f2Kc1Z6JNgS92wNL9Q7F76HcN4VOVlirwO8i0CmlzaTKY/+sAgWBnTJRo0YMSQeLAynVtF
	pTClid0tGXdNPTI9UlB4z81leuFooq4uk6CiuBkPLCqbZRjOXpznJ9s2/+4xkXjS2jqEdHctLLjf4
	iQJHc2hmF7F/027bpNywf9t+YFm3bNg2C6HmQyHKEQCpsGahHB44k1QqUw7Kml0ebECt77i2KNfxy
	v8rahyvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYpdu-00000003Ae9-3m5f;
	Mon, 07 Jul 2025 17:28:38 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYp2I-000000033tJ-1YIN;
	Mon, 07 Jul 2025 16:49:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type;
	bh=YpitKWsGYdvkCnrR1mHFS1FP2h9VNXePXRkQPh7Xnq8=; b=AIKF8kQRHi8mNwcFM+zhxqLyl6
	Ge/ez06ZIr4EFSDUVGczPLCZiaO3f+uSZ/kjawcOUBkqqKpCWZmXisTdeZhMnqsvmmQa3W84mTdOl
	MepxtMwXCbvF4G4403s+qSumq4ZnBZZ9K0wbi8Igi7UHOjqfIUYTeyyy+qNjHUQDHo6s+Z0xbx2mk
	5e0BZm/C0w33YqocUYHABh26i0o7cTQHBrrd1Dhrn6BnMVAAu8WgeUqEJuPu5lUQNYrxVY2OPy0GQ
	OAyekpgppxNmuEd7UKIG3qkt/GJ0x9fy8Rea+CNQH8R0AYcbVI/L7I98pr9USHRgf0e7CZInB0mf5
	7vUZrHxw==;
Received: from i53875bf5.versanet.de ([83.135.91.245] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uYp1q-0004yl-A5; Mon, 07 Jul 2025 18:49:18 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: heiko@sntech.de
Cc: neil.armstrong@linaro.org,
	quic_jesszhan@quicinc.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	hjc@rock-chips.com,
	andy.yan@rock-chips.com,
	andyshrk@163.com,
	nicolas.frattaroli@collabora.com,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: [PATCH 02/13] drm/panel: ilitek-ili9881c: move display_on/_off dcs calls to (un-)prepare
Date: Mon,  7 Jul 2025 18:48:55 +0200
Message-ID: <20250707164906.1445288-3-heiko@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250707164906.1445288-1-heiko@sntech.de>
References: <20250707164906.1445288-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_094946_418646_3F9076FD 
X-CRM114-Status: GOOD (  15.92  )
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

At least for panel-bridges, the atomic_enable call is defined as being
called right after the preceding element in the display pipe is enabled.

It is also stated that "The bridge can assume that the display pipe (i.e.
clocks and timing signals) feeding it is running when this callback is
called"

This means the DSI controller driving this display would have already
switched over to video-mode from command mode and thus dcs functions
should not be called anymore at this point.

This caused a non-working display for me, when trying to enable
the rk3576 dsi controller using a display using this controller.

Therefore move the display_on/off calls the more appropriate
prepare/unprepare callbacks.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 drivers/gpu/drm/panel/panel-ilitek-ili9881c.c | 27 +++++--------------
 1 file changed, 7 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c b/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
index d7a17dca2a9c..a20b52181ea0 100644
--- a/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
+++ b/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
@@ -1315,35 +1315,24 @@ static int ili9881c_prepare(struct drm_panel *panel)
 	if (ret)
 		goto disable_power;
 
-	return 0;
-
-disable_power:
-	regulator_disable(ctx->power);
-	return ret;
-}
-
-static int ili9881c_enable(struct drm_panel *panel)
-{
-	struct ili9881c *ctx = panel_to_ili9881c(panel);
-
 	msleep(120);
 
-	mipi_dsi_dcs_set_display_on(ctx->dsi);
+	ret = mipi_dsi_dcs_set_display_on(ctx->dsi);
+	if (ret)
+		goto disable_power;
 
 	return 0;
-}
 
-static int ili9881c_disable(struct drm_panel *panel)
-{
-	struct ili9881c *ctx = panel_to_ili9881c(panel);
-
-	return mipi_dsi_dcs_set_display_off(ctx->dsi);
+disable_power:
+	regulator_disable(ctx->power);
+	return ret;
 }
 
 static int ili9881c_unprepare(struct drm_panel *panel)
 {
 	struct ili9881c *ctx = panel_to_ili9881c(panel);
 
+	mipi_dsi_dcs_set_display_off(ctx->dsi);
 	mipi_dsi_dcs_enter_sleep_mode(ctx->dsi);
 	regulator_disable(ctx->power);
 	gpiod_set_value_cansleep(ctx->reset, 1);
@@ -1499,8 +1488,6 @@ static enum drm_panel_orientation ili9881c_get_orientation(struct drm_panel *pan
 static const struct drm_panel_funcs ili9881c_funcs = {
 	.prepare	= ili9881c_prepare,
 	.unprepare	= ili9881c_unprepare,
-	.enable		= ili9881c_enable,
-	.disable	= ili9881c_disable,
 	.get_modes	= ili9881c_get_modes,
 	.get_orientation = ili9881c_get_orientation,
 };
-- 
2.47.2


