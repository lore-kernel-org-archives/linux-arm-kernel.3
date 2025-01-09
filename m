Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC068E77197
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jan 2025 03:49:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gsSPIjk6QkuYkE5dl7/RNWeKbatAUffRApoCUlLx7BE=; b=1uA84k8IfMehguJuUbp1Bvwq3d
	mS9HPhKBwjWzyLrxx7Upz6ICmS6+yimiRWpFj+aRZVGBHAB14w3PygOd1gPxSGi7+/NhBEtJF3kl3
	6Ypz5FTyF4138Jjv5R7V2wi4k7BJ1ofs2eaX6kS9VEGIAcB43HJgr8tGjaXivVdHIkXrQ70V++7f+
	EARAcswRbOJw0kP7c6KCjKnhzpaANfEEAjkP1b8wDylJebQgGAGOQESZ6YzJdYHdaOfNL89TW5SVa
	siqRv+U8d+KPBEOSCUG3ctWWH8T4lrHZiGSv2ZqxMlxOSO1GAAkiT7+B/NPYU555WRsnoggWpqcaC
	VUWuFChA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVjXe-0000000AdzU-1Eb0;
	Thu, 09 Jan 2025 03:49:06 +0000
Received: from mail-m127218.xmail.ntesmail.com ([115.236.127.218])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVjIU-0000000Ab4y-3ZuI;
	Thu, 09 Jan 2025 03:33:28 +0000
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 82c01a8e;
	Thu, 9 Jan 2025 11:28:20 +0800 (GMT+08:00)
From: Damon Ding <damon.ding@rock-chips.com>
To: heiko@sntech.de
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	rfoss@kernel.org,
	vkoul@kernel.org,
	sebastian.reichel@collabora.com,
	cristian.ciocaltea@collabora.com,
	l.stach@pengutronix.de,
	dmitry.baryshkov@linaro.org,
	andy.yan@rock-chips.com,
	hjc@rock-chips.com,
	algea.cao@rock-chips.com,
	kever.yang@rock-chips.com,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	Damon Ding <damon.ding@rock-chips.com>
Subject: [PATCH v5 12/20] drm/rockchip: analogix_dp: Add support to get panel from the DP AUX bus
Date: Thu,  9 Jan 2025 11:27:17 +0800
Message-Id: <20250109032725.1102465-13-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250109032725.1102465-1-damon.ding@rock-chips.com>
References: <20250109032725.1102465-1-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQ04YGFZNTEpMTENJTUNOH0xWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
X-HM-Tid: 0a94491b199603a3kunm82c01a8e
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Mi46Eww4TzIJNRQZFks*Qx8I
	TjEwCi9VSlVKTEhNSEJISEtJSklPVTMWGhIXVR8aFhQVVR8SFRw7CRQYEFYYExILCFUYFBZFWVdZ
	EgtZQVlOQ1VJSVVMVUpKT1lXWQgBWUFIQklNNwY+
DKIM-Signature: a=rsa-sha256;
	b=EOqHs3jBMaPI8CHTGWvpFZg3od0Hpw3ngpPl6XrSqSqXWzb9PXa/dbrOWcQfeAUU7soNBzpW5ghxcFrAk6NsolygQ7NAbgqIVs9z3pdFlaY3eeMhjg97EHYNYcJsNZJYuvBHLlmgF6x9Iwy9PylWbeG+JRiTfc6NqOOmQXszkb4=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=gsSPIjk6QkuYkE5dl7/RNWeKbatAUffRApoCUlLx7BE=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_193327_089660_813E2A17 
X-CRM114-Status: GOOD (  16.57  )
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

Move drm_of_find_panel_or_bridge() a little later and combine it with
component_add() into a new function rockchip_dp_link_panel(). The function
will serve as done_probing() callback of devm_of_dp_aux_populate_bus(),
aiding to support for obtaining the eDP panel via the DP AUX bus.

If failed to get the panel from the DP AUX bus, it will then try the other
way to get panel information through the platform bus.

In addition, use dev_err() instead of drm_err() in rockchip_dp_poweron()
, which will be called before rockchip_dp_bind().

Signed-off-by: Damon Ding <damon.ding@rock-chips.com>

---

Changes in v4:
- Use done_probing() to call drm_of_find_panel_or_bridge() and
  component_add() when getting panel from the DP AUX bus

Changes in v5:
- Use the functions exported by the Analogix side to get the pointers of
  struct analogix_dp_plat_data and struct drm_dp_aux.
- Use dev_err() instead of drm_err() in rockchip_dp_poweron().

---
 .../gpu/drm/rockchip/analogix_dp-rockchip.c   | 41 ++++++++++++++-----
 1 file changed, 30 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
index 0957d3c5d31d..3ae01b870f49 100644
--- a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
+++ b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
@@ -124,13 +124,13 @@ static int rockchip_dp_poweron(struct analogix_dp_plat_data *plat_data)
 
 	ret = clk_prepare_enable(dp->pclk);
 	if (ret < 0) {
-		drm_err(dp->drm_dev, "failed to enable pclk %d\n", ret);
+		dev_err(dp->dev, "failed to enable pclk %d\n", ret);
 		return ret;
 	}
 
 	ret = rockchip_dp_pre_init(dp);
 	if (ret < 0) {
-		drm_err(dp->drm_dev, "failed to dp pre init %d\n", ret);
+		dev_err(dp->dev, "failed to dp pre init %d\n", ret);
 		clk_disable_unprepare(dp->pclk);
 		return ret;
 	}
@@ -392,11 +392,27 @@ static const struct component_ops rockchip_dp_component_ops = {
 	.unbind = rockchip_dp_unbind,
 };
 
+static int rockchip_dp_link_panel(struct drm_dp_aux *aux)
+{
+	struct analogix_dp_plat_data *plat_data = analogix_dp_aux_to_plat_data(aux);
+	struct rockchip_dp_device *dp = pdata_encoder_to_dp(plat_data);
+	int ret;
+
+	ret = drm_of_find_panel_or_bridge(dp->dev->of_node, 1, 0, &plat_data->panel, NULL);
+	if (ret)
+		return ret;
+
+	ret = component_add(dp->dev, &rockchip_dp_component_ops);
+	if (ret)
+		return ret;
+
+	return ret;
+}
+
 static int rockchip_dp_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	const struct rockchip_dp_chip_data *dp_data;
-	struct drm_panel *panel = NULL;
 	struct rockchip_dp_device *dp;
 	struct resource *res;
 	int i;
@@ -406,10 +422,6 @@ static int rockchip_dp_probe(struct platform_device *pdev)
 	if (!dp_data)
 		return -ENODEV;
 
-	ret = drm_of_find_panel_or_bridge(dev->of_node, 1, 0, &panel, NULL);
-	if (ret < 0)
-		return ret;
-
 	dp = devm_kzalloc(dev, sizeof(*dp), GFP_KERNEL);
 	if (!dp)
 		return -ENOMEM;
@@ -433,7 +445,6 @@ static int rockchip_dp_probe(struct platform_device *pdev)
 
 	dp->dev = dev;
 	dp->adp = ERR_PTR(-ENODEV);
-	dp->plat_data.panel = panel;
 	dp->plat_data.dev_type = dp->data->chip_type;
 	dp->plat_data.power_on = rockchip_dp_poweron;
 	dp->plat_data.power_off = rockchip_dp_powerdown;
@@ -449,9 +460,17 @@ static int rockchip_dp_probe(struct platform_device *pdev)
 	if (IS_ERR(dp->adp))
 		return PTR_ERR(dp->adp);
 
-	ret = component_add(dev, &rockchip_dp_component_ops);
-	if (ret)
-		return ret;
+	ret = devm_of_dp_aux_populate_bus(analogix_dp_get_aux(dp->adp), rockchip_dp_link_panel);
+	if (ret) {
+		if (ret != -ENODEV) {
+			dev_err(dev, "failed to populate aux bus : %d\n", ret);
+			return ret;
+		}
+
+		ret = rockchip_dp_link_panel(analogix_dp_get_aux(dp->adp));
+		if (ret)
+			return ret;
+	}
 
 	return 0;
 }
-- 
2.34.1


