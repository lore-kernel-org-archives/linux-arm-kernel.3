Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63A95FF885C
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 26 Apr 2026 00:20:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A1/7/Ysizv1COkOwuIhys+pXMRlxdZpGlCshUkZX8DE=; b=WZYioroWJfeELb75gpXhd5vE5l
	Q4/3+uk5A4U7ztsr8boaDQWPVlerOzQNH5jRmPwTStIk9kXJf5nf2T1ySbdzt5MG750MWcX6ChaG1
	MhBzsMEhivlmBIbA2oU/H6gVms/DfRTqDL7d2Tu9KsxWy3FzDycDc18YSK06bOLWmsxIIMY+CcaVW
	MihQb9Px+cni1k2UetyRwuweoFStxp0MKorYSBaZsiwD96KgrEo78FWMlioCW9C7F8WSt+f35NTo7
	t2WVdMaJt6nlK6/UakN8HjTPTdhKah2qNIw/mee0OaWqbr/gFOuJgHwZEPS1rbtzIwaysv5HjUCf8
	0Bd56vzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGnEs-0000000F6wc-2XKc;
	Sun, 26 Apr 2026 00:20:46 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGnEi-0000000F6j6-1ULc;
	Sun, 26 Apr 2026 00:20:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1777162833;
	bh=mcYcKV11L+FkP12+dnD49x//O1Dzy8xiVIwcEdLrxGI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=MTuGRBfH0HNSdgxO5ZKxaL/IUG23A04JImGeqPqSW2ay5NXaHcxF+XSbPwOlMRipQ
	 LLUMm3/0cZlLltBULm03RFKvBvnlPvypZEZqOvASG+9u5mG0eNp3B94J4RDULoE4qu
	 1rJZo4ZoKMEuXZAXNGYnTcs26W3+G2mUbYYLSRci+mQ6bqR5d+7grNFAyK/dgXAqCM
	 nDwUlQQEcdSCkp9XB8UlFwOWuXrakaKX6SUMqIzIe68Zto3UvWk6PdaPiIZ2iH4A9Z
	 Y523duFh8kR7VrIayDMSsWlclxizFsfy1GqTAf3GFs6eEIIakE8jvHx90o4UC0zAl0
	 FAiTBkvls3zpg==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5EE3717E157E;
	Sun, 26 Apr 2026 02:20:33 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Sun, 26 Apr 2026 03:20:20 +0300
Subject: [PATCH v5 08/10] drm/rockchip: dw_hdmi_qp: Use local dev variable
 consistently in bind()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260426-dw-hdmi-qp-scramb-v5-8-d778e70c317b@collabora.com>
References: <20260426-dw-hdmi-qp-scramb-v5-0-d778e70c317b@collabora.com>
In-Reply-To: <20260426-dw-hdmi-qp-scramb-v5-0-d778e70c317b@collabora.com>
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
 linux-rockchip@lists.infradead.org
X-Mailer: b4 0.15.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260425_172036_599260_8D181327 
X-CRM114-Status: UNSURE (   9.79  )
X-CRM114-Notice: Please train this message.
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

Replace indirect struct device accesses via hdmi->dev and pdev->dev with
the local dev parameter already available in dw_hdmi_qp_rockchip_bind(),
for consistency and readability.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c | 33 +++++++++++++-------------
 1 file changed, 16 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
index d9333ad8996b..618d2aaa5c7d 100644
--- a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
@@ -475,7 +475,7 @@ static int dw_hdmi_qp_rockchip_bind(struct device *dev, struct device *master,
 	struct clk *ref_clk;
 	int ret, irq, i;
 
-	if (!pdev->dev.of_node)
+	if (!dev->of_node)
 		return -ENODEV;
 
 	hdmi = drmm_kzalloc(drm, sizeof(*hdmi), GFP_KERNEL);
@@ -495,7 +495,7 @@ static int dw_hdmi_qp_rockchip_bind(struct device *dev, struct device *master,
 		return dev_err_probe(dev, -ENODEV, "Missing platform ctrl ops\n");
 
 	hdmi->ctrl_ops = cfg->ctrl_ops;
-	hdmi->dev = &pdev->dev;
+	hdmi->dev = dev;
 	hdmi->port_id = -ENODEV;
 
 	/* Identify port ID by matching base IO address */
@@ -506,7 +506,7 @@ static int dw_hdmi_qp_rockchip_bind(struct device *dev, struct device *master,
 		}
 	}
 	if (hdmi->port_id < 0)
-		return dev_err_probe(hdmi->dev, hdmi->port_id,
+		return dev_err_probe(dev, hdmi->port_id,
 				     "Failed to match HDMI port ID\n");
 
 	plat_data.phy_ops = cfg->phy_ops;
@@ -530,37 +530,36 @@ static int dw_hdmi_qp_rockchip_bind(struct device *dev, struct device *master,
 	hdmi->regmap = syscon_regmap_lookup_by_phandle(dev->of_node,
 						       "rockchip,grf");
 	if (IS_ERR(hdmi->regmap))
-		return dev_err_probe(hdmi->dev, PTR_ERR(hdmi->regmap),
+		return dev_err_probe(dev, PTR_ERR(hdmi->regmap),
 				     "Unable to get rockchip,grf\n");
 
 	hdmi->vo_regmap = syscon_regmap_lookup_by_phandle(dev->of_node,
 							  "rockchip,vo-grf");
 	if (IS_ERR(hdmi->vo_regmap))
-		return dev_err_probe(hdmi->dev, PTR_ERR(hdmi->vo_regmap),
+		return dev_err_probe(dev, PTR_ERR(hdmi->vo_regmap),
 				     "Unable to get rockchip,vo-grf\n");
 
-	ret = devm_clk_bulk_get_all_enabled(hdmi->dev, &clks);
+	ret = devm_clk_bulk_get_all_enabled(dev, &clks);
 	if (ret < 0)
-		return dev_err_probe(hdmi->dev, ret, "Failed to get clocks\n");
+		return dev_err_probe(dev, ret, "Failed to get clocks\n");
 
-	ref_clk = clk_get(hdmi->dev, "ref");
+	ref_clk = clk_get(dev, "ref");
 	if (IS_ERR(ref_clk))
-		return dev_err_probe(hdmi->dev, PTR_ERR(ref_clk),
+		return dev_err_probe(dev, PTR_ERR(ref_clk),
 				     "Failed to get ref clock\n");
 
 	plat_data.ref_clk_rate = clk_get_rate(ref_clk);
 	clk_put(ref_clk);
 
-	hdmi->frl_enable_gpio = devm_gpiod_get_optional(hdmi->dev, "frl-enable",
+	hdmi->frl_enable_gpio = devm_gpiod_get_optional(dev, "frl-enable",
 							GPIOD_OUT_LOW);
 	if (IS_ERR(hdmi->frl_enable_gpio))
-		return dev_err_probe(hdmi->dev, PTR_ERR(hdmi->frl_enable_gpio),
+		return dev_err_probe(dev, PTR_ERR(hdmi->frl_enable_gpio),
 				     "Failed to request FRL enable GPIO\n");
 
 	hdmi->phy = devm_of_phy_get_by_index(dev, dev->of_node, 0);
 	if (IS_ERR(hdmi->phy))
-		return dev_err_probe(hdmi->dev, PTR_ERR(hdmi->phy),
-				     "Failed to get phy\n");
+		return dev_err_probe(dev, PTR_ERR(hdmi->phy), "Failed to get phy\n");
 
 	cfg->ctrl_ops->io_init(hdmi);
 
@@ -578,7 +577,7 @@ static int dw_hdmi_qp_rockchip_bind(struct device *dev, struct device *master,
 	if (irq < 0)
 		return irq;
 
-	ret = devm_request_threaded_irq(hdmi->dev, irq,
+	ret = devm_request_threaded_irq(dev, irq,
 					cfg->ctrl_ops->hardirq_callback,
 					cfg->ctrl_ops->irq_callback,
 					IRQF_SHARED, "dw-hdmi-qp-hpd",
@@ -589,18 +588,18 @@ static int dw_hdmi_qp_rockchip_bind(struct device *dev, struct device *master,
 	drm_encoder_helper_add(encoder, &dw_hdmi_qp_rockchip_encoder_helper_funcs);
 	ret = drmm_encoder_init(drm, encoder, NULL, DRM_MODE_ENCODER_TMDS, NULL);
 	if (ret)
-		return dev_err_probe(hdmi->dev, ret, "Failed to init encoder\n");
+		return dev_err_probe(dev, ret, "Failed to init encoder\n");
 
 	platform_set_drvdata(pdev, hdmi);
 
 	hdmi->hdmi = dw_hdmi_qp_bind(pdev, encoder, &plat_data);
 	if (IS_ERR(hdmi->hdmi))
-		return dev_err_probe(hdmi->dev, PTR_ERR(hdmi->hdmi),
+		return dev_err_probe(dev, PTR_ERR(hdmi->hdmi),
 				     "Failed to bind dw-hdmi-qp\n");
 
 	connector = drm_bridge_connector_init(drm, encoder);
 	if (IS_ERR(connector))
-		return dev_err_probe(hdmi->dev, PTR_ERR(connector),
+		return dev_err_probe(dev, PTR_ERR(connector),
 				     "Failed to init bridge connector\n");
 
 	return drm_connector_attach_encoder(connector, encoder);

-- 
2.53.0


