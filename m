Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04EECEB364F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Mar 2026 01:38:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a+OMEl7jW9fwjryCD/mh+2mTQpWaHTEudOcVmWoiYSg=; b=jqBY7OtNhDCuP0WZSQorrBycVp
	8/Ot2OlWuNtpPA4iJvCk+T/9yDRgZCOsMkgqlbpJPXDqFpB8g7QFDykGpDnjB0gIRynlzvlB4MC6G
	cAhtJOW5yX97qv31le9Al6SpTh5jWDrUd8Rhn28Ic3TlNqqipGy+peZdlhub+QzPFKKglklB8cugv
	rvitDDhTUYh8h+4ZlHl2EaayZgBqVOcZ6evgPVXP1nEFLamIopjvoSiZP60altCPCah1SACy2rzub
	TIgg7LEtA0vtkIrgHg8OWZSR8kEEuPkAzYBIr7eLVPB/5Z8y9+jrRtDA9zOQvTMDCOXEKyk3qnpzY
	dLU3QqAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxEiY-0000000EM4n-0TXl;
	Tue, 03 Mar 2026 01:38:34 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxEiT-0000000ELyE-12lg;
	Tue, 03 Mar 2026 01:38:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1772501907;
	bh=FaphVizh/jrcTWKzM1pHB/8nCLnRBECP6/YJ+CUORb8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=olgvzxVe11U57V+A1VTZ018hNw3sw3/1yyP+V7GDrnhUdL8GlFS5ylJbh5L+ovysF
	 to3h7wR2nnPiyRVdLNm7SPugNumHmrSk45VnJT7BR9nLPkit5QZpeO6kOsXhjBVxNE
	 cw+xoBCa8QdDDcQYtzfWMEPxPkcajnOkhc/kTbsLBq4Q+FuPiYRhVqCk8uW1GamIVQ
	 lkvPNUEgY4/pmL3AWInZikQsjqVXSHGXzLsQCYUKE6xZC6pEkJkPxBYyy6M0cjGmoN
	 gxGACk2DK5Q/ajP5B3vv9mIRbTU4JbBYcTW05RhDKMALEAXhddhwAZ59JylIyWKqAG
	 EqkaaKxgzeyEg==
Received: from localhost (unknown [86.123.23.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0219A17E12A2;
	Tue,  3 Mar 2026 02:38:26 +0100 (CET)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Tue, 03 Mar 2026 03:38:10 +0200
Subject: [PATCH v4 4/4] drm/rockchip: dw_hdmi_qp: Do not send HPD events
 for all connectors
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260303-dw-hdmi-qp-scramb-v4-4-317d3b8bd219@collabora.com>
References: <20260303-dw-hdmi-qp-scramb-v4-0-317d3b8bd219@collabora.com>
In-Reply-To: <20260303-dw-hdmi-qp-scramb-v4-0-317d3b8bd219@collabora.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, 
 Diederik de Haas <diederik@cknow-tech.com>, 
 Maud Spierings <maud_spierings@hotmail.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_173829_468788_BF0E0F17 
X-CRM114-Status: GOOD (  14.75  )
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

In order to optimize the HPD event handling and run the detect cycle on
the affected connector only, make use of
drm_connector_helper_hpd_irq_event() instead of
drm_helper_hpd_irq_event().

Additionally, move devm_request_threaded_irq() after bridge connector
initialization.

Tested-by: Diederik de Haas <diederik@cknow-tech.com>
Tested-by: Maud Spierings <maud_spierings@hotmail.com>
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c | 44 ++++++++++++--------------
 1 file changed, 20 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
index 1a09bcc96c3e..65dfaee15178 100644
--- a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
@@ -92,6 +92,7 @@ struct rockchip_hdmi_qp {
 	struct regmap *regmap;
 	struct regmap *vo_regmap;
 	struct rockchip_encoder encoder;
+	struct drm_connector *connector;
 	struct dw_hdmi_qp *hdmi;
 	struct phy *phy;
 	struct gpio_desc *frl_enable_gpio;
@@ -251,14 +252,10 @@ static void dw_hdmi_qp_rk3588_hpd_work(struct work_struct *work)
 	struct rockchip_hdmi_qp *hdmi = container_of(work,
 						     struct rockchip_hdmi_qp,
 						     hpd_work.work);
-	struct drm_device *drm = hdmi->encoder.encoder.dev;
-	bool changed;
+	bool changed = drm_connector_helper_hpd_irq_event(hdmi->connector);
 
-	if (drm) {
-		changed = drm_helper_hpd_irq_event(drm);
-		if (changed)
-			dev_dbg(hdmi->dev, "connector status changed\n");
-	}
+	if (changed)
+		dev_dbg(hdmi->dev, "connector status changed\n");
 }
 
 static irqreturn_t dw_hdmi_qp_rk3576_hardirq(int irq, void *dev_id)
@@ -466,13 +463,12 @@ static int dw_hdmi_qp_rockchip_bind(struct device *dev, struct device *master,
 	struct dw_hdmi_qp_plat_data plat_data = {};
 	const struct rockchip_hdmi_qp_cfg *cfg;
 	struct drm_device *drm = data;
-	struct drm_connector *connector;
 	struct drm_encoder *encoder;
 	struct rockchip_hdmi_qp *hdmi;
 	struct resource *res;
 	struct clk_bulk_data *clks;
 	struct clk *ref_clk;
-	int ret, irq, i;
+	int ret, hpd_irq, i;
 
 	if (!pdev->dev.of_node)
 		return -ENODEV;
@@ -573,17 +569,9 @@ static int dw_hdmi_qp_rockchip_bind(struct device *dev, struct device *master,
 	if (plat_data.cec_irq < 0)
 		return plat_data.cec_irq;
 
-	irq = platform_get_irq_byname(pdev, "hpd");
-	if (irq < 0)
-		return irq;
-
-	ret = devm_request_threaded_irq(hdmi->dev, irq,
-					cfg->ctrl_ops->hardirq_callback,
-					cfg->ctrl_ops->irq_callback,
-					IRQF_SHARED, "dw-hdmi-qp-hpd",
-					hdmi);
-	if (ret)
-		return ret;
+	hpd_irq = platform_get_irq_byname(pdev, "hpd");
+	if (hpd_irq < 0)
+		return hpd_irq;
 
 	drm_encoder_helper_add(encoder, &dw_hdmi_qp_rockchip_encoder_helper_funcs);
 	drm_simple_encoder_init(drm, encoder, DRM_MODE_ENCODER_TMDS);
@@ -597,12 +585,20 @@ static int dw_hdmi_qp_rockchip_bind(struct device *dev, struct device *master,
 				     "Failed to bind dw-hdmi-qp");
 	}
 
-	connector = drm_bridge_connector_init(drm, encoder);
-	if (IS_ERR(connector))
-		return dev_err_probe(hdmi->dev, PTR_ERR(connector),
+	hdmi->connector = drm_bridge_connector_init(drm, encoder);
+	if (IS_ERR(hdmi->connector))
+		return dev_err_probe(hdmi->dev, PTR_ERR(hdmi->connector),
 				     "Failed to init bridge connector\n");
 
-	return drm_connector_attach_encoder(connector, encoder);
+	ret = drm_connector_attach_encoder(hdmi->connector, encoder);
+	if (ret)
+		return ret;
+
+	return devm_request_threaded_irq(hdmi->dev, hpd_irq,
+					 cfg->ctrl_ops->hardirq_callback,
+					 cfg->ctrl_ops->irq_callback,
+					 IRQF_SHARED, "dw-hdmi-qp-hpd",
+					 hdmi);
 }
 
 static void dw_hdmi_qp_rockchip_unbind(struct device *dev,

-- 
2.52.0


