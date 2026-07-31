Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59603C55173
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jul 2026 16:23:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PC1Wle8bBIj24QPVHQCSCzKYO3/McfcqaAmpDPKjwFc=; b=d+KWDE6OgRI3781DMXzBrE+EYm
	OfE5k5d2QymmuLs0+Fn9Bo1xccsfHA76ciMWY/Ziw7mva3o0n05238FsithlC/IvMDiJbvtka6eYF
	iKx9X6zQJfP5+fgckBvqvPCv60l+2OfwzHwwC1NT7wc5EuWjA40VtUzgBlt35M271Q1DDX5NUGigx
	wYCxlw9rjRMfB9EnWSrw8uQsnnzpqg792CLEtBpG3+XUraF+62ZLCD1ottR22gYLxeUwtA/3hkj4W
	49vLK6yM+KRlKC3SAtOeqgWzdFh5rijc7WhKPbGE8wQe1Q95ravX/knF5anmZFej4mCbC4Kdq8vm1
	+jDNdo6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpq1I-0000000D2Xb-0a4P;
	Fri, 31 Jul 2026 16:23:36 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wppxT-0000000CzD1-2YPG;
	Fri, 31 Jul 2026 16:19:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1785514777;
	bh=JbW8f4el2mFe4+XGbTbJU5Xyehv5uYd4tsQ5QlXCZF4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=W/aXjGBknObSn9h4jm72atc4N7ja2E0nqizFMJLXIpHrC8bkHFXs8JZBDs6wpMZLl
	 cVx2t1thPLA65yEFRFp1d8od9ZWx0ZiXHMlfTi8/Z4NMDQeOOW8U4rCSe4Zf/yPw6b
	 dlGs3nYN1Fruoq6J4DWuOUouh2kgZsov9EhyBLb/SRHKEwo5NeHNx2E6UpfvGcHlYx
	 jNEFNNbQuZAWaCo+xI3X697xeDDITe/7fuSYwMeHF1GfeUKqH5jFpH1XR9ymCEAVRm
	 vZhaz/nMfTzg9nvjNG0rmZ5F4wOWYB9JumYQ50s7P+bzhPG0BjZVctIpZfnA0HODEW
	 SCKkSz44rc5oQ==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C21C217E0213;
	Fri, 31 Jul 2026 18:19:37 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Fri, 31 Jul 2026 19:19:39 +0300
Subject: [PATCH v10 32/69] drm/rockchip: dw_hdmi_qp: Use local dev variable
 consistently in bind()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-dw-hdmi-qp-scramb-v10-32-294364b2cf15@collabora.com>
References: <20260731-dw-hdmi-qp-scramb-v10-0-294364b2cf15@collabora.com>
In-Reply-To: <20260731-dw-hdmi-qp-scramb-v10-0-294364b2cf15@collabora.com>
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
 linux-sunxi@lists.linux.dev, linux-rockchip@lists.infradead.org, 
 Maud Spierings <maud_spierings@hotmail.com>, 
 Diederik de Haas <diederik@cknow-tech.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260731_091939_808723_5F17533C 
X-CRM114-Status: GOOD (  10.66  )
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

Reviewed-by: Heiko Stuebner <heiko@sntech.de>
Tested-by: Maud Spierings <maud_spierings@hotmail.com>
Tested-by: Diederik de Haas <diederik@cknow-tech.com>  # NanoPC-T6 LTS, Rock 5B
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c | 33 +++++++++++++-------------
 1 file changed, 16 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
index 8b48558deb3e..36043bf82273 100644
--- a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
@@ -563,7 +563,7 @@ static int dw_hdmi_qp_rockchip_bind(struct device *dev, struct device *master,
 	struct clk *ref_clk;
 	int ret, irq, i;
 
-	if (!pdev->dev.of_node)
+	if (!dev->of_node)
 		return -ENODEV;
 
 	hdmi = drmm_kzalloc(drm, sizeof(*hdmi), GFP_KERNEL);
@@ -583,7 +583,7 @@ static int dw_hdmi_qp_rockchip_bind(struct device *dev, struct device *master,
 		return dev_err_probe(dev, -ENODEV, "Missing platform ctrl ops\n");
 
 	hdmi->ctrl_ops = cfg->ctrl_ops;
-	hdmi->dev = &pdev->dev;
+	hdmi->dev = dev;
 	hdmi->port_id = -ENODEV;
 
 	/* Identify port ID by matching base IO address */
@@ -594,7 +594,7 @@ static int dw_hdmi_qp_rockchip_bind(struct device *dev, struct device *master,
 		}
 	}
 	if (hdmi->port_id < 0)
-		return dev_err_probe(hdmi->dev, hdmi->port_id,
+		return dev_err_probe(dev, hdmi->port_id,
 				     "Failed to match HDMI port ID\n");
 
 	plat_data.phy_ops = cfg->phy_ops;
@@ -622,37 +622,36 @@ static int dw_hdmi_qp_rockchip_bind(struct device *dev, struct device *master,
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
 
@@ -670,7 +669,7 @@ static int dw_hdmi_qp_rockchip_bind(struct device *dev, struct device *master,
 	if (irq < 0)
 		return irq;
 
-	ret = devm_request_threaded_irq(hdmi->dev, irq,
+	ret = devm_request_threaded_irq(dev, irq,
 					cfg->ctrl_ops->hardirq_callback,
 					cfg->ctrl_ops->irq_callback,
 					IRQF_SHARED, "dw-hdmi-qp-hpd",
@@ -681,16 +680,16 @@ static int dw_hdmi_qp_rockchip_bind(struct device *dev, struct device *master,
 	drm_encoder_helper_add(encoder, &dw_hdmi_qp_rockchip_encoder_helper_funcs);
 	ret = drmm_encoder_init(drm, encoder, NULL, DRM_MODE_ENCODER_TMDS, NULL);
 	if (ret)
-		return dev_err_probe(hdmi->dev, ret, "Failed to init encoder\n");
+		return dev_err_probe(dev, ret, "Failed to init encoder\n");
 
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
 
 	platform_set_drvdata(pdev, hdmi);

-- 
2.55.0


