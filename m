Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 350DBC02182
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jan 2025 10:25:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pCECahZs5tOSYFvivjdqInexcfTKOQK4/UZ4WFBnDq8=; b=OE1jLlEFcersNIlZN4ZeiNrXAC
	5C6SQr1q8qes8BUlVqgUGSYImeAVXCPfvrPo2QYOhmc0oChY0OQ1NjmE6ezgfegyYZrnIOzgTAlCh
	l0GiSjt0/2E9hz/EHdZvOAvyoezURsx53sgWQNy8GAf7u6M7Rv1QibOAsKVdVfwuFY10OEpCdBb8g
	qSkPRfmr6w3EYFXmyGaZKVohthbuO8c+0+YwSwzTAP1htVqsvtJL4kb61kOZtE/C9oaz6aou+r8vQ
	SJ7jDthvJzpkIk4GM1HoT9iZ9eVDYrfq2L3DEhhP0BNn8ejUZk8sJ26ebqa/B/8oGgqcU91D9K65B
	tfm014gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tauOW-0000000CCBA-27GP;
	Thu, 23 Jan 2025 10:25:04 +0000
Received: from mail-m1973197.qiye.163.com ([220.197.31.97])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tau8O-0000000C9in-1lci;
	Thu, 23 Jan 2025 10:08:25 +0000
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 9818ae97;
	Thu, 23 Jan 2025 18:08:20 +0800 (GMT+08:00)
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
Subject: [PATCH v6 11/14] drm/rockchip: analogix_dp: Add support for RK3588
Date: Thu, 23 Jan 2025 18:07:44 +0800
Message-Id: <20250123100747.1841357-12-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250123100747.1841357-1-damon.ding@rock-chips.com>
References: <20250123100747.1841357-1-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQ0xIT1ZDSU0YTE4ZSEJCHh5WFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
X-HM-Tid: 0a9492a256fc03a3kunm9818ae97
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6MU06LDo5VjIRMCxMDi84FCgP
	KE9PCk9VSlVKTEhMTUlNQktJSk9JVTMWGhIXVR8aFhQVVR8SFRw7CRQYEFYYExILCFUYFBZFWVdZ
	EgtZQVlOQ1VJSVVMVUpKT1lXWQgBWUFNSUpINwY+
DKIM-Signature: a=rsa-sha256;
	b=MH98VuPbt5QJXPjP80ITZRQb7hsWnS7ra/kzz0FOv1st2fKYQ8yfD1yr82TOU4bqroJ1oBKQujTRXFsi4+9Z9jZIXE9ny4JctZzLx927fjlRf/CAO0it+idrKZi2brKEnFavv9dqO7C5HHdq7MWK27RoTx6q8grIrAR1Rxp86Qo=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=pCECahZs5tOSYFvivjdqInexcfTKOQK4/UZ4WFBnDq8=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250123_020824_616688_1D87767A 
X-CRM114-Status: GOOD (  19.87  )
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

RK3588 integrates the Analogix eDP 1.3 TX controller IP and the HDMI/eDP
TX Combo PHY based on a Samsung IP block. There are also two independent
eDP display interface with different address on RK3588 Soc.

The patch currently adds only the basic support, specifically RGB output
up to 4K@60Hz, without the tests for audio, PSR and other eDP 1.3 specific
features.

In additon, the above Analogix IP has always been utilized as eDP on
Rockchip platform, despite its capability to also support the DP v1.2.
Therefore, the newly added logs will contain the term 'edp' rather than
'dp'. And the newly added 'apb' reset control is to ensure the APB bus
of eDP controller works well on the RK3588 SoC.

Signed-off-by: Damon Ding <damon.ding@rock-chips.com>

---

Changes in v2:
- Add support for the other eDP output edp1

Changes in v3:
- Fix the unexpected use of alias
- Add more details in commit message

Changes in v4:
- Add the 'apb' reset control

Changes in v5:
- Use drm_...()/dev_...() instead of DRM_...()
- Clean &rockchip_dp_chip_data.reg related comments in commit message
- Move the modifications in anlogix_dp.h to the Analogix side in order
  to avoid the warning:

  drivers/gpu/drm/bridge/analogix/analogix_dp_core.c:1506:10: warning:
  enumeration value 'RK3588_EDP' not handled in switch [-Wswitch]
          switch (dp->plat_data->dev_type) {

Changes in v6:
- Pass 'dp' in drm_...() rather than 'dp->drm_dev'
- Use drm_...() uniformly rather than mixing drm_...() and dev_..()
---
 .../gpu/drm/rockchip/analogix_dp-rockchip.c   | 61 ++++++++++++++++++-
 1 file changed, 58 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
index 004b1b68d1cf..a86d655b021e 100644
--- a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
+++ b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
@@ -51,11 +51,13 @@ struct rockchip_grf_reg_field {
 /**
  * struct rockchip_dp_chip_data - splite the grf setting of kind of chips
  * @lcdc_sel: grf register field of lcdc_sel
+ * @edp_mode: grf register field of edp_mode
  * @chip_type: specific chip type
  * @reg: register base address
  */
 struct rockchip_dp_chip_data {
 	const struct rockchip_grf_reg_field lcdc_sel;
+	const struct rockchip_grf_reg_field edp_mode;
 	u32	chip_type;
 	u32	reg;
 };
@@ -70,6 +72,7 @@ struct rockchip_dp_device {
 	struct clk               *grfclk;
 	struct regmap            *grf;
 	struct reset_control     *rst;
+	struct reset_control     *apbrst;
 
 	const struct rockchip_dp_chip_data *data;
 
@@ -115,6 +118,10 @@ static int rockchip_dp_pre_init(struct rockchip_dp_device *dp)
 	usleep_range(10, 20);
 	reset_control_deassert(dp->rst);
 
+	reset_control_assert(dp->apbrst);
+	usleep_range(10, 20);
+	reset_control_deassert(dp->apbrst);
+
 	return 0;
 }
 
@@ -136,12 +143,21 @@ static int rockchip_dp_poweron(struct analogix_dp_plat_data *plat_data)
 		return ret;
 	}
 
+	ret = rockchip_grf_field_write(dp->grf, &dp->data->edp_mode, 1);
+	if (ret != 0)
+		drm_err(dp, "failed to set edp mode %d\n", ret);
+
 	return ret;
 }
 
 static int rockchip_dp_powerdown(struct analogix_dp_plat_data *plat_data)
 {
 	struct rockchip_dp_device *dp = pdata_encoder_to_dp(plat_data);
+	int ret;
+
+	ret = rockchip_grf_field_write(dp->grf, &dp->data->edp_mode, 0);
+	if (ret != 0)
+		drm_err(dp, "failed to set edp mode %d\n", ret);
 
 	clk_disable_unprepare(dp->pclk);
 
@@ -206,6 +222,10 @@ static void rockchip_dp_drm_encoder_enable(struct drm_encoder *encoder,
 	struct rockchip_dp_device *dp = encoder_to_dp(encoder);
 	struct drm_crtc *crtc;
 	struct drm_crtc_state *old_crtc_state;
+	struct of_endpoint endpoint;
+	struct device_node *remote_port, *remote_port_parent;
+	char name[32];
+	u32 port_id;
 	int ret;
 
 	crtc = rockchip_dp_drm_get_new_crtc(encoder, state);
@@ -223,13 +243,27 @@ static void rockchip_dp_drm_encoder_enable(struct drm_encoder *encoder,
 		return;
 	}
 
-	ret = drm_of_encoder_active_endpoint_id(dp->dev->of_node, encoder);
+	ret = drm_of_encoder_active_endpoint(dp->dev->of_node, encoder, &endpoint);
 	if (ret < 0)
 		return;
 
-	drm_dbg_core(dp, "vop %s output to dp\n", (ret) ? "LIT" : "BIG");
+	remote_port_parent = of_graph_get_remote_port_parent(endpoint.local_node);
+	if (remote_port_parent) {
+		if (of_get_child_by_name(remote_port_parent, "ports")) {
+			remote_port = of_graph_get_remote_port(endpoint.local_node);
+			of_property_read_u32(remote_port, "reg", &port_id);
+			of_node_put(remote_port);
+			sprintf(name, "%s vp%d", remote_port_parent->full_name, port_id);
+		} else {
+			sprintf(name, "%s %s",
+				remote_port_parent->full_name, endpoint.id ? "vopl" : "vopb");
+		}
+		of_node_put(remote_port_parent);
+
+		drm_dbg_core(dp, "%s output to edp\n", name);
+	}
 
-	ret = rockchip_grf_field_write(dp->grf, &dp->data->lcdc_sel, ret);
+	ret = rockchip_grf_field_write(dp->grf, &dp->data->lcdc_sel, endpoint.id);
 	if (ret != 0)
 		drm_err(dp, "Could not write to GRF: %d\n", ret);
 
@@ -323,6 +357,12 @@ static int rockchip_dp_of_probe(struct rockchip_dp_device *dp)
 		return PTR_ERR(dp->rst);
 	}
 
+	dp->apbrst = devm_reset_control_get_optional(dev, "apb");
+	if (IS_ERR(dp->apbrst)) {
+		drm_err(dp, "failed to get apb reset control\n");
+		return PTR_ERR(dp->apbrst);
+	}
+
 	return 0;
 }
 
@@ -526,9 +566,24 @@ static const struct rockchip_dp_chip_data rk3288_dp[] = {
 	{ /* sentinel */ }
 };
 
+static const struct rockchip_dp_chip_data rk3588_edp[] = {
+	{
+		.edp_mode = GRF_REG_FIELD(0x0000, 0, 0),
+		.chip_type = RK3588_EDP,
+		.reg = 0xfdec0000,
+	},
+	{
+		.edp_mode = GRF_REG_FIELD(0x0004, 0, 0),
+		.chip_type = RK3588_EDP,
+		.reg = 0xfded0000,
+	},
+	{ /* sentinel */ }
+};
+
 static const struct of_device_id rockchip_dp_dt_ids[] = {
 	{.compatible = "rockchip,rk3288-dp", .data = &rk3288_dp },
 	{.compatible = "rockchip,rk3399-edp", .data = &rk3399_edp },
+	{.compatible = "rockchip,rk3588-edp", .data = &rk3588_edp },
 	{}
 };
 MODULE_DEVICE_TABLE(of, rockchip_dp_dt_ids);
-- 
2.34.1


