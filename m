Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30A54C3600C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Apr 2025 19:35:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5CSeb0qcw8xUj/6IkPOOeCu/ifhsHFC/EpEXxPm+/ks=; b=FztY59t+ZV1VZhCkF4/OeyQ+v0
	rWVg//qSRBMRHG+jGZqw6fceB452ujXYyK2iZrhlX8IPvB7SVqwc8S1kIRFkJJIWc46lEAUFyRsmw
	fTozdFVJmfCMR0YpYKjqgsvUeWu0H/M1xp51644vyD+e+xKNg/PkmvnDpc6LA+G51BKzUphI9/jQS
	zTwcDmkWgmwOSBmEqSD8q/z4dbwi2GryR83QBH/+dJhlLzZIOYrP1GY31ckv+RvoOfI5wAjzL5RoJ
	OEUPYp6HvNNgGwunT+Y8b0yVhoz0ihc/2itfpsbwbWKjv4bgEWhjFVrd4iLGWx4NEPNh7miixsibF
	VY495nIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0QLG-00000009m9J-1c6n;
	Thu, 03 Apr 2025 19:35:10 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0Q1M-00000009gU1-1OM7;
	Thu, 03 Apr 2025 19:14:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8C6A343832;
	Thu,  3 Apr 2025 19:14:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42BDCC4CEEA;
	Thu,  3 Apr 2025 19:14:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743707676;
	bh=bYDF03y7wMr/7fpD3lfeArDZi4hx1ONU08HD9qmFx7o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=R6dYHZ8baKwt9agcsfPdxoS0PlwkqzkhwDqKdrMjwLofJrw0gFKrf2o3JFy8esuDc
	 qT4/D9lONS6Sj8vmFnoDnJ2EYFfXOIFZjVwSNBO7+o1D1/1MaCCMFaELaPal+eand+
	 0TflB2O8czW2ZPxKSr8CsnnWp447abL1PJjDPvEm5VWq5vlyChSSL0JFPTguSZ/zVp
	 10GBX9qKKC0V7aHwDCyZgizgAncPKbv0UbLsr/ljhjdmKhgPsOHqk+xqyZsJLKdzty
	 +Z2jSxpAovNYqWcdujVsSlenp4QaCKzw95OjY61mD33IQtH6G0irRWcboi7RHqE25V
	 hkUz/tQ6qnuuw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Jani Nikula <jani.nikula@intel.com>,
	Simona Vetter <simona.vetter@ffwll.ch>,
	Louis Chauvet <louis.chauvet@bootlin.com>,
	Sasha Levin <sashal@kernel.org>,
	hjc@rock-chips.com,
	heiko@sntech.de,
	andy.yan@rock-chips.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: [PATCH AUTOSEL 6.14 29/44] drm/rockchip: stop passing non struct drm_device to drm_err() and friends
Date: Thu,  3 Apr 2025 15:12:58 -0400
Message-Id: <20250403191313.2679091-29-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250403191313.2679091-1-sashal@kernel.org>
References: <20250403191313.2679091-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.14
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250403_121436_411597_B5C9E735 
X-CRM114-Status: GOOD (  11.17  )
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

From: Jani Nikula <jani.nikula@intel.com>

[ Upstream commit abeef1f9eaf9301cc98a6841dab5f72de5c95360 ]

The expectation is that the struct drm_device based logging helpers get
passed an actual struct drm_device pointer rather than some random
struct pointer where you can dereference the ->dev member.

Convert drm_err(hdmi, ...) to dev_err(hdmi->dev, ...). This matches
current usage, but drops "[drm] *ERROR*" prefix from logging.

Reviewed-by: Simona Vetter <simona.vetter@ffwll.ch>
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
Link: https://patchwork.freedesktop.org/patch/msgid/f42da4c9943a2f2a9de4272b7849e72236d4c3f9.1737644530.git.jani.nikula@intel.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c    | 16 ++++++++--------
 drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c | 16 ++++++++--------
 2 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c b/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
index e7a6669c46b07..f737e7d46e667 100644
--- a/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
@@ -203,7 +203,7 @@ static int rockchip_hdmi_parse_dt(struct rockchip_hdmi *hdmi)
 
 	hdmi->regmap = syscon_regmap_lookup_by_phandle(np, "rockchip,grf");
 	if (IS_ERR(hdmi->regmap)) {
-		drm_err(hdmi, "Unable to get rockchip,grf\n");
+		dev_err(hdmi->dev, "Unable to get rockchip,grf\n");
 		return PTR_ERR(hdmi->regmap);
 	}
 
@@ -214,7 +214,7 @@ static int rockchip_hdmi_parse_dt(struct rockchip_hdmi *hdmi)
 	if (IS_ERR(hdmi->ref_clk)) {
 		ret = PTR_ERR(hdmi->ref_clk);
 		if (ret != -EPROBE_DEFER)
-			drm_err(hdmi, "failed to get reference clock\n");
+			dev_err(hdmi->dev, "failed to get reference clock\n");
 		return ret;
 	}
 
@@ -222,7 +222,7 @@ static int rockchip_hdmi_parse_dt(struct rockchip_hdmi *hdmi)
 	if (IS_ERR(hdmi->grf_clk)) {
 		ret = PTR_ERR(hdmi->grf_clk);
 		if (ret != -EPROBE_DEFER)
-			drm_err(hdmi, "failed to get grf clock\n");
+			dev_err(hdmi->dev, "failed to get grf clock\n");
 		return ret;
 	}
 
@@ -302,16 +302,16 @@ static void dw_hdmi_rockchip_encoder_enable(struct drm_encoder *encoder)
 
 	ret = clk_prepare_enable(hdmi->grf_clk);
 	if (ret < 0) {
-		drm_err(hdmi, "failed to enable grfclk %d\n", ret);
+		dev_err(hdmi->dev, "failed to enable grfclk %d\n", ret);
 		return;
 	}
 
 	ret = regmap_write(hdmi->regmap, hdmi->chip_data->lcdsel_grf_reg, val);
 	if (ret != 0)
-		drm_err(hdmi, "Could not write to GRF: %d\n", ret);
+		dev_err(hdmi->dev, "Could not write to GRF: %d\n", ret);
 
 	clk_disable_unprepare(hdmi->grf_clk);
-	drm_dbg(hdmi, "vop %s output to hdmi\n", ret ? "LIT" : "BIG");
+	dev_dbg(hdmi->dev, "vop %s output to hdmi\n", ret ? "LIT" : "BIG");
 }
 
 static int
@@ -574,7 +574,7 @@ static int dw_hdmi_rockchip_bind(struct device *dev, struct device *master,
 	ret = rockchip_hdmi_parse_dt(hdmi);
 	if (ret) {
 		if (ret != -EPROBE_DEFER)
-			drm_err(hdmi, "Unable to parse OF data\n");
+			dev_err(hdmi->dev, "Unable to parse OF data\n");
 		return ret;
 	}
 
@@ -582,7 +582,7 @@ static int dw_hdmi_rockchip_bind(struct device *dev, struct device *master,
 	if (IS_ERR(hdmi->phy)) {
 		ret = PTR_ERR(hdmi->phy);
 		if (ret != -EPROBE_DEFER)
-			drm_err(hdmi, "failed to get phy\n");
+			dev_err(hdmi->dev, "failed to get phy\n");
 		return ret;
 	}
 
diff --git a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
index cebd72bf1ef25..6bbc84c5d716d 100644
--- a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
@@ -170,7 +170,7 @@ static void dw_hdmi_qp_rk3588_hpd_work(struct work_struct *work)
 	if (drm) {
 		changed = drm_helper_hpd_irq_event(drm);
 		if (changed)
-			drm_dbg(hdmi, "connector status changed\n");
+			dev_dbg(hdmi->dev, "connector status changed\n");
 	}
 }
 
@@ -287,7 +287,7 @@ static int dw_hdmi_qp_rockchip_bind(struct device *dev, struct device *master,
 		}
 	}
 	if (hdmi->port_id < 0) {
-		drm_err(hdmi, "Failed to match HDMI port ID\n");
+		dev_err(hdmi->dev, "Failed to match HDMI port ID\n");
 		return hdmi->port_id;
 	}
 
@@ -311,20 +311,20 @@ static int dw_hdmi_qp_rockchip_bind(struct device *dev, struct device *master,
 	hdmi->regmap = syscon_regmap_lookup_by_phandle(dev->of_node,
 						       "rockchip,grf");
 	if (IS_ERR(hdmi->regmap)) {
-		drm_err(hdmi, "Unable to get rockchip,grf\n");
+		dev_err(hdmi->dev, "Unable to get rockchip,grf\n");
 		return PTR_ERR(hdmi->regmap);
 	}
 
 	hdmi->vo_regmap = syscon_regmap_lookup_by_phandle(dev->of_node,
 							  "rockchip,vo-grf");
 	if (IS_ERR(hdmi->vo_regmap)) {
-		drm_err(hdmi, "Unable to get rockchip,vo-grf\n");
+		dev_err(hdmi->dev, "Unable to get rockchip,vo-grf\n");
 		return PTR_ERR(hdmi->vo_regmap);
 	}
 
 	ret = devm_clk_bulk_get_all_enabled(hdmi->dev, &clks);
 	if (ret < 0) {
-		drm_err(hdmi, "Failed to get clocks: %d\n", ret);
+		dev_err(hdmi->dev, "Failed to get clocks: %d\n", ret);
 		return ret;
 	}
 
@@ -332,7 +332,7 @@ static int dw_hdmi_qp_rockchip_bind(struct device *dev, struct device *master,
 						    GPIOD_OUT_HIGH);
 	if (IS_ERR(hdmi->enable_gpio)) {
 		ret = PTR_ERR(hdmi->enable_gpio);
-		drm_err(hdmi, "Failed to request enable GPIO: %d\n", ret);
+		dev_err(hdmi->dev, "Failed to request enable GPIO: %d\n", ret);
 		return ret;
 	}
 
@@ -340,7 +340,7 @@ static int dw_hdmi_qp_rockchip_bind(struct device *dev, struct device *master,
 	if (IS_ERR(hdmi->phy)) {
 		ret = PTR_ERR(hdmi->phy);
 		if (ret != -EPROBE_DEFER)
-			drm_err(hdmi, "failed to get phy: %d\n", ret);
+			dev_err(hdmi->dev, "failed to get phy: %d\n", ret);
 		return ret;
 	}
 
@@ -403,7 +403,7 @@ static int dw_hdmi_qp_rockchip_bind(struct device *dev, struct device *master,
 	connector = drm_bridge_connector_init(drm, encoder);
 	if (IS_ERR(connector)) {
 		ret = PTR_ERR(connector);
-		drm_err(hdmi, "failed to init bridge connector: %d\n", ret);
+		dev_err(hdmi->dev, "failed to init bridge connector: %d\n", ret);
 		return ret;
 	}
 
-- 
2.39.5


