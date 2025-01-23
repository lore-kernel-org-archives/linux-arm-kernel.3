Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF89BC02182
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jan 2025 15:11:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=knMGn2Wkuz6riwch0zsxfhPrwQTG5Mk4DlPhD7PidIw=; b=Ste82OniXUx6l1530T8ps/OQ52
	OUsndHZyGV7R+Un9vBO6fX49H4/HbyQ3+cO939cZLhnByhQCqqJHYlQqm4JattJZDFYl4CY0ZwL11
	kw0/QDEY//oBEMjwi2HbgWLzDJ3VKgTff24j7R84skx1psHHyfJ2xWQC2u7K9tb0YYPN55bFJJPor
	l9eqVU8/8epqITIaJqzeEN9h7P+slIiQE8QKNscT8Igd4nWiu0UrAeSb2BvXb3fY4nuzP28jqEnh/
	jXW8vf06sTlkoXpV22PzznKswvO/lKzEaTZowfnl9ySUHU0MtaWuLPjHbjSl3VxYXTm0bl+CIWjqi
	j6SusGeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tayr5-0000000CgAE-2UWP;
	Thu, 23 Jan 2025 15:10:51 +0000
Received: from mgamail.intel.com ([198.175.65.11])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taypn-0000000Cfyn-35uE;
	Thu, 23 Jan 2025 15:09:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737644972; x=1769180972;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=pF/kDcBdLVM7aYd9aJedufMh9LibuSV9mXkSDswmU+8=;
  b=Mcbt++eu+0mHzQH1G1IOxnp1DqQFItWsTFmhP0iIQxuhOu/XqZ938XeZ
   P3DMRDYnVbcm81yEdUSh0RkQXHAMi/6k3Ky3M6rNB4S5fq6GK/pBK32NM
   jWjcLdinfJFRjnm4SW8tyKUwhfeRS/uIoG18uTqfs5GeSa5j9MHWisL1E
   Jmm7e6GFu5HaWY/dWNbFOpsdempznF5v7q8/RnHXTmfF3PNfmW7Ys3Uzf
   rzHxC0nThHHP+seGjRznm+5Q2RXeOcBtKskpjnp1dWYzV4p9MqwAyQxV2
   BWWrP1WzSpw1LJJfIVLfCxbBFkKkUMbPdheRY75gVPwsFfN4Utsk32MrD
   w==;
X-CSE-ConnectionGUID: 2ynxT7WKQwKQFaZMeJM4wA==
X-CSE-MsgGUID: XvFYivoHRfaXKSgL+sMSdg==
X-IronPort-AV: E=McAfee;i="6700,10204,11324"; a="48644535"
X-IronPort-AV: E=Sophos;i="6.13,228,1732608000"; 
   d="scan'208";a="48644535"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2025 07:09:31 -0800
X-CSE-ConnectionGUID: xPbLHVeBSq616OQf1WAQSA==
X-CSE-MsgGUID: TzDUErmnQpiQQvLgaCPQJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,228,1732608000"; 
   d="scan'208";a="107297820"
Received: from unknown (HELO localhost) ([10.237.66.160])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2025 07:09:28 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org,
	jani.nikula@intel.com,
	Sandy Huang <hjc@rock-chips.com>,
	=?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
	Andy Yan <andy.yan@rock-chips.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: [PATCH 2/5] drm/rockchip: stop passing non struct drm_device to drm_err() and friends
Date: Thu, 23 Jan 2025 17:09:09 +0200
Message-Id: <f42da4c9943a2f2a9de4272b7849e72236d4c3f9.1737644530.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <cover.1737644530.git.jani.nikula@intel.com>
References: <cover.1737644530.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250123_070931_823263_83C82154 
X-CRM114-Status: GOOD (  11.68  )
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

The expectation is that the struct drm_device based logging helpers get
passed an actual struct drm_device pointer rather than some random
struct pointer where you can dereference the ->dev member.

Convert drm_err(hdmi, ...) to dev_err(hdmi->dev, ...). This matches
current usage, but drops "[drm] *ERROR*" prefix from logging.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>

---

Looks like it's possible to hunt down the struct drm_device in most of
these cases, if that's desired. This was the simplest change.

Cc: Sandy Huang <hjc@rock-chips.com>
Cc: "Heiko Stübner" <heiko@sntech.de>
Cc: Andy Yan <andy.yan@rock-chips.com>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-rockchip@lists.infradead.org
---
 drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c    | 16 ++++++++--------
 drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c | 16 ++++++++--------
 2 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c b/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
index e7a6669c46b0..f737e7d46e66 100644
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
index f41151d49fca..3d1dddb34603 100644
--- a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
@@ -242,7 +242,7 @@ static void dw_hdmi_qp_rk3588_hpd_work(struct work_struct *work)
 	if (drm) {
 		changed = drm_helper_hpd_irq_event(drm);
 		if (changed)
-			drm_dbg(hdmi, "connector status changed\n");
+			dev_dbg(hdmi->dev, "connector status changed\n");
 	}
 }
 
@@ -472,7 +472,7 @@ static int dw_hdmi_qp_rockchip_bind(struct device *dev, struct device *master,
 		}
 	}
 	if (hdmi->port_id < 0) {
-		drm_err(hdmi, "Failed to match HDMI port ID\n");
+		dev_err(hdmi->dev, "Failed to match HDMI port ID\n");
 		return hdmi->port_id;
 	}
 
@@ -496,20 +496,20 @@ static int dw_hdmi_qp_rockchip_bind(struct device *dev, struct device *master,
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
 
@@ -517,7 +517,7 @@ static int dw_hdmi_qp_rockchip_bind(struct device *dev, struct device *master,
 						    GPIOD_OUT_HIGH);
 	if (IS_ERR(hdmi->enable_gpio)) {
 		ret = PTR_ERR(hdmi->enable_gpio);
-		drm_err(hdmi, "Failed to request enable GPIO: %d\n", ret);
+		dev_err(hdmi->dev, "Failed to request enable GPIO: %d\n", ret);
 		return ret;
 	}
 
@@ -525,7 +525,7 @@ static int dw_hdmi_qp_rockchip_bind(struct device *dev, struct device *master,
 	if (IS_ERR(hdmi->phy)) {
 		ret = PTR_ERR(hdmi->phy);
 		if (ret != -EPROBE_DEFER)
-			drm_err(hdmi, "failed to get phy: %d\n", ret);
+			dev_err(hdmi->dev, "failed to get phy: %d\n", ret);
 		return ret;
 	}
 
@@ -564,7 +564,7 @@ static int dw_hdmi_qp_rockchip_bind(struct device *dev, struct device *master,
 	connector = drm_bridge_connector_init(drm, encoder);
 	if (IS_ERR(connector)) {
 		ret = PTR_ERR(connector);
-		drm_err(hdmi, "failed to init bridge connector: %d\n", ret);
+		dev_err(hdmi->dev, "failed to init bridge connector: %d\n", ret);
 		return ret;
 	}
 
-- 
2.39.5


