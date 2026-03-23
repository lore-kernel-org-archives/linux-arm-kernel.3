Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7E70F483DF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 17:46:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a+OMEl7jW9fwjryCD/mh+2mTQpWaHTEudOcVmWoiYSg=; b=pXhWGZIbVsKEeak+6pfaatcWVX
	IxOKPaTnF8pctGWSMLotG0ViQV3DfXQf2ZVF3RT+2yFa91OK+DDNUK1iiB3jBgCq1sxmXzOugbzo8
	fNTxTXRmNcFQwnw000hi8n3r02jUbOqaYwOQBVmt6g/JOXrkyk5pX9PHhJiNo3V3Mb6RBOIvgZTw8
	uJydJRPf54a5ZtpZCwsWbgrw9R2s17G2hLhLhkqbgvwNNRzMydMt3qYjI6rAMJ+XjTRF9kYcis9EW
	eP5wktdu5r771oX/8Cj49rfwo9SRyhAw7ZnuOaXW8o+n66wzMnXEoOZtXE+WW0uwGD5BrkockwULl
	NBSLz8WQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4jMe-0000000HFt8-0HJv;
	Mon, 23 Mar 2026 17:46:56 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4jMI-0000000HFay-10Xh;
	Mon, 23 Mar 2026 17:46:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1774287991;
	bh=FaphVizh/jrcTWKzM1pHB/8nCLnRBECP6/YJ+CUORb8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=aP87GDEPev0+YdNme5A25+vd/LCzVS65S51MQDutLcvlkolvhDhFmlL/UtGSVOhf/
	 6SUCQnsIX/BoyTCGd+mfUi2gS1mG13U/P/GAFYMDZ76F/bg5siZLYhn7C+LRHd4gP0
	 WiOcLHXTsD47QPeXkC4MwsUjuX5GM3ZJMhuAHzNtynRZDe9K85+EP+GNOTSrUZlLaQ
	 BUNcVCi1MlCoh5bwVA9yXJ43aQDRc4ZDT45DVtdWEluwrJLe1si9abKzsdTZY8TEJ9
	 77IJDSBCufRdmbzcfuvwI258aNgT+KAC+B98pd+Uvz7h5SzmJUgAB+TtV9ijKw9KKV
	 dcQl25kIZ+AxA==
Received: from localhost (unknown [86.123.23.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 02D9417E3F1B;
	Mon, 23 Mar 2026 18:46:30 +0100 (CET)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Mon, 23 Mar 2026 19:45:30 +0200
Subject: [PATCH RESEND v4 4/4] drm/rockchip: dw_hdmi_qp: Do not send HPD
 events for all connectors
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260323-dw-hdmi-qp-scramb-v4-4-1d99df84883e@collabora.com>
References: <20260323-dw-hdmi-qp-scramb-v4-0-1d99df84883e@collabora.com>
In-Reply-To: <20260323-dw-hdmi-qp-scramb-v4-0-1d99df84883e@collabora.com>
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
X-CRM114-CacheID: sfid-20260323_104634_432024_3F1C4F0B 
X-CRM114-Status: GOOD (  14.64  )
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


