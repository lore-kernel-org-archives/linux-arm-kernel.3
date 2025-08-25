Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83E22CA0FE9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Aug 2025 11:42:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mD9YGofEDd24zOOPnIFjzxEkbTTZfy4SdmycaG8qEqU=; b=POQici0rCEV+OrzrCM6hY/wlvQ
	FrYUHcw7TP86Kmz4AZHzEWmO+tAm4zhya2S9kgYqPcyD61kkfPzwCfEWcd5q6UPpPox53sIqbo2CZ
	y/YMMWNnP6oMoojgOyzSlBodS8K936RvqKBTC9LZWAxwr8r2EfJuuTa95WFbvfHFIcJZgCOQOZ/H7
	ioG2meRgJXvdz+aZKGGiDhKzfzy5O5ciaUNKg1q0ZvF3wY7jgrlmkIJDBhJtZBPjFFB2HFtEZB/QK
	Zr/h1PDXQrvy4zQpKmDIhPVSIvzI/VKIk/6RDkAyvErB8Q1dB0Y4bwoFjGPt8VtN2sPy0ZDaIzjnN
	kKBEoc7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqVaT-00000007nTE-0AnT;
	Mon, 25 Aug 2025 11:42:09 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqU86-00000007asb-3tEr;
	Mon, 25 Aug 2025 10:08:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1756116525;
	bh=9xiHC2hMHQhX5mp7mX3NwaloWJOeXf9/yzi4dN1d7LA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=P7QlWWa/0jhNTr6hsCWE+fxw1Is0KM37/TnYpl7Kj+X84Ho4UjPbQ/g5sD0kwFd/f
	 8raBQSOd57203T4JjcE5PKYBXXSvY7g9+oENDtEzIUhMly027XaCJ+mKx+lNpEroz+
	 uGzRH2mRXxU2uHB+SlLANCvQBcRk8nidKof6cT0kTqc8aaacx9zeBc/p50JnFG2x2T
	 zzhdD93tIoMq1KY3avNd1DswitHkqs2rA5flBhDQhJVDVaqOdKmlB/vxYO9ccKCAAm
	 XIIGwBD1FXpY1VOm+BTdlvNkmp5hOlzdPiyMkg1Bsg/H+ezokQjhjc52zwaBX6NjDC
	 bMopHD2LIUnPQ==
Received: from localhost (unknown [82.79.138.60])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with UTF8SMTPSA id 05AE917E08E3;
	Mon, 25 Aug 2025 12:08:44 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Mon, 25 Aug 2025 13:08:34 +0300
Subject: [PATCH v2 3/5] drm/rockchip: dw_hdmi_qp: Switch to phy_configure()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250825-rk3588-10bpc-v2-3-955622d16985@collabora.com>
References: <20250825-rk3588-10bpc-v2-0-955622d16985@collabora.com>
In-Reply-To: <20250825-rk3588-10bpc-v2-0-955622d16985@collabora.com>
To: Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250825_030847_148893_E33DE889 
X-CRM114-Status: GOOD (  17.87  )
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

Stop relying on phy_set_bus_width() based workaround to setup the TMDS
character rate and, instead, use the recently introduced HDMI PHY
configuration API.  This is also a prerequisite to enable high color
depth and FRL support.

Additionally, move the logic to ->atomic_check() callback where the
current mode rate is already provided by the connector state.  As a
matter of fact this is actually necessary to ensure the link rate is
configured before VOP2 attempts to use the PHY PLL as a DCLK source in
vop2_crtc_atomic_enable().  The rationale is to restrict any changes of
the PHY rate via CCF and, instead, prefer the PHY configuration API for
this purpose.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c | 37 +++++++++++++-------------
 1 file changed, 19 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
index 5280383febe25cf579c306ec1642557600595e58..6f2006e7999b540f29841ec4ef679a3ab1e8f497 100644
--- a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
@@ -13,6 +13,7 @@
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/phy/phy.h>
+#include <linux/phy/phy-hdmi.h>
 #include <linux/regmap.h>
 #include <linux/workqueue.h>
 
@@ -95,6 +96,7 @@ struct rockchip_hdmi_qp {
 	struct delayed_work hpd_work;
 	int port_id;
 	const struct rockchip_hdmi_qp_ctrl_ops *ctrl_ops;
+	unsigned long long tmds_char_rate;
 };
 
 struct rockchip_hdmi_qp_ctrl_ops {
@@ -113,24 +115,9 @@ static struct rockchip_hdmi_qp *to_rockchip_hdmi_qp(struct drm_encoder *encoder)
 static void dw_hdmi_qp_rockchip_encoder_enable(struct drm_encoder *encoder)
 {
 	struct rockchip_hdmi_qp *hdmi = to_rockchip_hdmi_qp(encoder);
-	struct drm_crtc *crtc = encoder->crtc;
-	unsigned long long rate;
 
 	/* Unconditionally switch to TMDS as FRL is not yet supported */
 	gpiod_set_value(hdmi->enable_gpio, 1);
-
-	if (crtc && crtc->state) {
-		rate = drm_hdmi_compute_mode_clock(&crtc->state->adjusted_mode,
-						   8, HDMI_COLORSPACE_RGB);
-		/*
-		 * FIXME: Temporary workaround to pass pixel clock rate
-		 * to the PHY driver until phy_configure_opts_hdmi
-		 * becomes available in the PHY API. See also the related
-		 * comment in rk_hdptx_phy_power_on() from
-		 * drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
-		 */
-		phy_set_bus_width(hdmi->phy, div_u64(rate, 100));
-	}
 }
 
 static int
@@ -138,12 +125,26 @@ dw_hdmi_qp_rockchip_encoder_atomic_check(struct drm_encoder *encoder,
 					 struct drm_crtc_state *crtc_state,
 					 struct drm_connector_state *conn_state)
 {
+	struct rockchip_hdmi_qp *hdmi = to_rockchip_hdmi_qp(encoder);
 	struct rockchip_crtc_state *s = to_rockchip_crtc_state(crtc_state);
+	union phy_configure_opts phy_cfg = {};
+	int ret;
 
-	s->output_mode = ROCKCHIP_OUT_MODE_AAAA;
-	s->output_type = DRM_MODE_CONNECTOR_HDMIA;
+	if (hdmi->tmds_char_rate == conn_state->hdmi.tmds_char_rate)
+		return 0;
 
-	return 0;
+	phy_cfg.hdmi.tmds_char_rate = conn_state->hdmi.tmds_char_rate;
+
+	ret = phy_configure(hdmi->phy, &phy_cfg);
+	if (!ret) {
+		hdmi->tmds_char_rate = conn_state->hdmi.tmds_char_rate;
+		s->output_mode = ROCKCHIP_OUT_MODE_AAAA;
+		s->output_type = DRM_MODE_CONNECTOR_HDMIA;
+	} else {
+		dev_err(hdmi->dev, "Failed to configure phy: %d\n", ret);
+	}
+
+	return ret;
 }
 
 static const struct

-- 
2.50.1


