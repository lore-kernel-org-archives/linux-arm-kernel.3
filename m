Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C64F9CA1013
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 21:18:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wpQNpz4Fu+9tXiDj6d/14i+714EQdsW5/+YIsgtl3BQ=; b=gGqqOvr1sb/a82Wsi6aySgZE+2
	EAmoFNGeRYdQlObvCy4BVeYOTyBy35RGpX4ZKyEaL2slchiGmHqlMFJnB/+vKedpQ1nBu7e4EhyAx
	aH/vWEhfNP38lh6oXPA4fdP7RSlT5MTPQxbYXr42tRfKmusTuBmcpXq9QmHLRT0A6JwoXFnH/FCGN
	vZc1uOo7vQQ92Vf8fhXI449WqucPov2azJ5J2xN1zTSGJ2nHnFpwjATE1bz7anF27UullEVjIXHuw
	i9miorjdN/jCAQJnKB7CNAC0nTh9lls2gR2QqRmtzOfmiafdvN7+iGIgKTUyJDQZJFo718yo7VrjU
	x+JCeUoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utusH-00000007eKF-2vGz;
	Wed, 03 Sep 2025 21:18:37 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utr8c-00000007AfQ-46nw;
	Wed, 03 Sep 2025 17:19:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DE99744C04;
	Wed,  3 Sep 2025 17:19:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 91A0FC4CEF4;
	Wed,  3 Sep 2025 17:19:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756919953;
	bh=U9NS79r/yfxF2enN0dgFxeqELCwhpIKV/1W2Bi08Osk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=pn/VF9KVFLiDLBhawe3Y+3l7u0Yiz5xsrUleUdjmU1iwUAPwTBtAdS2LI2GflQNVa
	 xt3pzz4Gbs7Rjz/dO6Hrm1pGMcNbU9u2A9uttux4dsn36KB0PEn8DYbMCjtsvoYgpc
	 iC5Ac/GqPS/FnK0rmtz5CbrwQ8wFH4gqwDEGK4M75uFPfb0M7/Dp1hyJm0175DUZ57
	 Bt8BZHkeCjUG0v7bi5NL+gyqkhU8F1uGlabhEEVVKzSOyUjPq/vgj337zgRRluNBcO
	 H4hTSBvayqdHRl7e6pS9pITH0DWEBjydfQRdK0b2IDud/wPu1Zupydb+oWohtk6i8r
	 xbgZCH1F4siZw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82D33CA0FF2;
	Wed,  3 Sep 2025 17:19:13 +0000 (UTC)
From: Michael Riesch via B4 Relay <devnull+michael.riesch.collabora.com@kernel.org>
Date: Wed, 03 Sep 2025 19:04:53 +0200
Subject: [PATCH v4 5/7] phy: rockchip: phy-rockchip-inno-csidphy: allow for
 different reset lines
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250616-rk3588-csi-dphy-v4-5-a4f340a7f0cf@collabora.com>
References: <20250616-rk3588-csi-dphy-v4-0-a4f340a7f0cf@collabora.com>
In-Reply-To: <20250616-rk3588-csi-dphy-v4-0-a4f340a7f0cf@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Kever Yang <kever.yang@rock-chips.com>, 
 Jagan Teki <jagan@amarulasolutions.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Diederik de Haas <didi.debian@cknow.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Heiko Stuebner <heiko@sntech.de>, 
 Collabora Kernel Team <kernel@collabora.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-phy@lists.infradead.org, 
 Michael Riesch <michael.riesch@collabora.com>
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756919100; l=4524;
 i=michael.riesch@collabora.com; s=20250410; h=from:subject:message-id;
 bh=ouqlgbnwWSp9gE4kXLQdfgX4LelZawR0mUFaykrHL9U=;
 b=NRuarniyeddlvm8uHBr/1dfXaIebfkSTrMveSDbVes8hWlBDX9Cbj175m1OMiyAeFmHJLVISe
 gdtoUNWEX9MCU3fSObSPlZTSV4ciMzlw0cxfSAxYdndDufzBOAc8OYH
X-Developer-Key: i=michael.riesch@collabora.com; a=ed25519;
 pk=+MWX1fffLFZtTPG/I6XdYm/+OSvpRE8D9evQaWbiN04=
X-Endpoint-Received: by B4 Relay for michael.riesch@collabora.com/20250410
 with auth_id=371
X-Original-From: Michael Riesch <michael.riesch@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_101915_073889_E8DC6192 
X-CRM114-Status: GOOD (  19.21  )
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
Reply-To: michael.riesch@collabora.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Michael Riesch <michael.riesch@collabora.com>

The RK3588 MIPI CSI-2 DPHY variant requires two reset lines. Add support
for different sets of reset lines to the phy-rockchip-inno-csidphy driver
as preparation for the introduction of the RK3588 variant.

Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-inno-csidphy.c | 34 +++++++++++++++++++++---
 1 file changed, 30 insertions(+), 4 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-inno-csidphy.c b/drivers/phy/rockchip/phy-rockchip-inno-csidphy.c
index 75533d071025..6c4ddcd7e5de 100644
--- a/drivers/phy/rockchip/phy-rockchip-inno-csidphy.c
+++ b/drivers/phy/rockchip/phy-rockchip-inno-csidphy.c
@@ -67,6 +67,8 @@
 #define RK1808_CSIDPHY_CLK_CALIB_EN		0x168
 #define RK3568_CSIDPHY_CLK_CALIB_EN		0x168
 
+#define RESETS_MAX				2
+
 /*
  * The higher 16-bit of this register is used for write protection
  * only if BIT(x + 16) set to 1 the BIT(x) can be written.
@@ -127,6 +129,8 @@ struct dphy_drv_data {
 	const struct hsfreq_range *hsfreq_ranges;
 	int num_hsfreq_ranges;
 	const struct dphy_reg *grf_regs;
+	const char *const *resets;
+	unsigned int resets_num;
 };
 
 struct rockchip_inno_csidphy {
@@ -134,7 +138,8 @@ struct rockchip_inno_csidphy {
 	void __iomem *phy_base;
 	struct clk *pclk;
 	struct regmap *grf;
-	struct reset_control *rst;
+	struct reset_control_bulk_data resets[RESETS_MAX];
+	unsigned int resets_num;
 	const struct dphy_drv_data *drv_data;
 	struct phy_configure_opts_mipi_dphy config;
 	u8 hsfreq;
@@ -174,6 +179,10 @@ static const struct hsfreq_range rk3368_mipidphy_hsfreq_ranges[] = {
 	{1249, 0x0c}, {1349, 0x0d}, {1500, 0x0e}
 };
 
+static const char *const rk3368_reset_names[] = {
+	"apb"
+};
+
 static void rockchip_inno_csidphy_ths_settle(struct rockchip_inno_csidphy *priv,
 					     int hsfreq, int offset)
 {
@@ -344,6 +353,8 @@ static const struct dphy_drv_data rk1808_mipidphy_drv_data = {
 	.hsfreq_ranges = rk1808_mipidphy_hsfreq_ranges,
 	.num_hsfreq_ranges = ARRAY_SIZE(rk1808_mipidphy_hsfreq_ranges),
 	.grf_regs = rk1808_grf_dphy_regs,
+	.resets = rk3368_reset_names,
+	.resets_num = ARRAY_SIZE(rk3368_reset_names),
 };
 
 static const struct dphy_drv_data rk3326_mipidphy_drv_data = {
@@ -353,6 +364,8 @@ static const struct dphy_drv_data rk3326_mipidphy_drv_data = {
 	.hsfreq_ranges = rk3326_mipidphy_hsfreq_ranges,
 	.num_hsfreq_ranges = ARRAY_SIZE(rk3326_mipidphy_hsfreq_ranges),
 	.grf_regs = rk3326_grf_dphy_regs,
+	.resets = rk3368_reset_names,
+	.resets_num = ARRAY_SIZE(rk3368_reset_names),
 };
 
 static const struct dphy_drv_data rk3368_mipidphy_drv_data = {
@@ -362,6 +375,8 @@ static const struct dphy_drv_data rk3368_mipidphy_drv_data = {
 	.hsfreq_ranges = rk3368_mipidphy_hsfreq_ranges,
 	.num_hsfreq_ranges = ARRAY_SIZE(rk3368_mipidphy_hsfreq_ranges),
 	.grf_regs = rk3368_grf_dphy_regs,
+	.resets = rk3368_reset_names,
+	.resets_num = ARRAY_SIZE(rk3368_reset_names),
 };
 
 static const struct dphy_drv_data rk3568_mipidphy_drv_data = {
@@ -371,6 +386,8 @@ static const struct dphy_drv_data rk3568_mipidphy_drv_data = {
 	.hsfreq_ranges = rk1808_mipidphy_hsfreq_ranges,
 	.num_hsfreq_ranges = ARRAY_SIZE(rk1808_mipidphy_hsfreq_ranges),
 	.grf_regs = rk3568_grf_dphy_regs,
+	.resets = rk3368_reset_names,
+	.resets_num = ARRAY_SIZE(rk3368_reset_names),
 };
 
 static const struct of_device_id rockchip_inno_csidphy_match_id[] = {
@@ -404,6 +421,7 @@ static int rockchip_inno_csidphy_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct phy_provider *phy_provider;
 	struct phy *phy;
+	int ret;
 
 	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
 	if (!priv)
@@ -435,10 +453,18 @@ static int rockchip_inno_csidphy_probe(struct platform_device *pdev)
 		return PTR_ERR(priv->pclk);
 	}
 
-	priv->rst = devm_reset_control_get(dev, "apb");
-	if (IS_ERR(priv->rst)) {
+	if (priv->drv_data->resets_num > RESETS_MAX) {
+		dev_err(dev, "invalid number of resets\n");
+		return -EINVAL;
+	}
+	priv->resets_num = priv->drv_data->resets_num;
+	for (unsigned int i = 0; i < priv->resets_num; i++)
+		priv->resets[i].id = priv->drv_data->resets[i];
+	ret = devm_reset_control_bulk_get_exclusive(dev, priv->resets_num,
+						    priv->resets);
+	if (ret) {
 		dev_err(dev, "failed to get system reset control\n");
-		return PTR_ERR(priv->rst);
+		return ret;
 	}
 
 	phy = devm_phy_create(dev, NULL, &rockchip_inno_csidphy_ops);

-- 
2.39.5



