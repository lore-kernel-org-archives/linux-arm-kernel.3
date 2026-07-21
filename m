Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8E78C44537
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 10:35:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IQPPFL/hjxBVnM9Pyftg9jFhWyQV6jlGbyoMqpbCK9g=; b=j3RqA61763tU1AyBdBS35b5hYf
	gEmgk4Pgy9EG2TfvxuH9G86x7hJtr9mSC/ftjd/REtFrSLIdN563p2KNwrvGPLijPD8LggSfg1MsE
	ZZm3xfNoPb1AV3qkdiB+EXC39EBFC6/1sIyCDoJZTyQJlYV/1eoKPaD1rc7Pv58N7vWTB/25q1vCj
	HVTMtIu4lwl3DgcyX85lhg96uL7fIDZ6toC3xxCi93+GwiWOO/yTW/WxQrY43U8+ZqJSwFUUWyLQD
	cwwSnpd3NHi/D39V7Fkam8M4YZ8aXYn2cGquWP+1QczGdyg9ASuMCAcCBVSV7K1MDlT57lUypS1Bv
	EwW2ESgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm7oq-00000009DHJ-0I5j;
	Tue, 21 Jul 2026 10:35:24 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm7oo-00000009DG8-41EP;
	Tue, 21 Jul 2026 10:35:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B393A43E0A;
	Tue, 21 Jul 2026 10:35:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 90FF7C2BCFF;
	Tue, 21 Jul 2026 10:35:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1784630122;
	bh=K8YKqlHhniDiKHcRQtXpB3nwqXcCsFEZfLYIT5GS/zQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=FopkHmypm/43FCmLv0NHqsBI+lp1t//r67Nln754zvy9jmKh85dwK+as+CP/xrTcK
	 Cmhp9PkxOa6wB8lvrzLmLEDo6ih38IeeERZ30DT0xxXECCexur7c5FUeJ7FNEhhrKC
	 NMMHBdlWpSsgloeXtaSVvXk8wDGNTxV1OQmzjbgc1+LItqmsUgDdDDcd05RXto4WVA
	 ScgGZBmCzuVQ9ez90RgF6Wip3RoQd/Jx53ePfErF3wGVGhGdkYe8OrCDn6fSFmcKET
	 NK8M0abZnh62Fo2Ir7gyZjFJWzLWJUYrka8GJhlHyxx3dnDKHgpD7xssm4wxSdqMTT
	 Opnf24pHEzicA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FFDEC44533;
	Tue, 21 Jul 2026 10:35:22 +0000 (UTC)
From: Jason Yang via B4 Relay <devnull+jason98166.gmail.com@kernel.org>
Date: Tue, 21 Jul 2026 18:35:21 +0800
Subject: [PATCH 3/4] phy: rockchip-samsung-dcphy: model TX and RX as
 separate PHYs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260721-dcphy-rx-v1-v1-3-4fc83c0ccac9@gmail.com>
References: <20260721-dcphy-rx-v1-v1-0-4fc83c0ccac9@gmail.com>
In-Reply-To: <20260721-dcphy-rx-v1-v1-0-4fc83c0ccac9@gmail.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Guochun Huang <hero.huang@rock-chips.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Jason Yang <jason98166@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784630121; l=9415;
 i=jason98166@gmail.com; s=20260721; h=from:subject:message-id;
 bh=bDL/0FuA2Gt8MlOhFoc43fxl634cUhUTxUySC20Qynk=;
 b=/6jOtuu5/ccM9L5VVyQBxlYwc1HFFD9m5G5oqIDp5jY7T4wrS+BftOZ0YCtnp9Zb9+dq9mf6y
 QJYsvp3TN9bC5PhoJn4qWsfmBxPkhGdJQw6xj2xwjtLCWmZZ+CnNlg/
X-Developer-Key: i=jason98166@gmail.com; a=ed25519;
 pk=xQmD001Q/ooHl39PxyQtusbUQmgbOsSfpFryRVWZ/k4=
X-Endpoint-Received: by B4 Relay for jason98166@gmail.com/20260721 with
 auth_id=887
X-Original-From: Jason Yang <jason98166@gmail.com>
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
Reply-To: jason98166@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Jason Yang <jason98166@gmail.com>

The DC-PHY drives a MIPI DSI transmitter and a MIPI CSI receiver, and on
RK3588 both can be wired to the same PHY as independent consumers. The
PHY core reference-counts power_on() per struct phy, so a single struct
phy cannot bring the two directions up independently.

Register one struct phy per direction and move the per-direction state
(direction and PHY type) into its own driver data. of_xlate() accepts
the legacy single cell as the transmitter and an optional second cell
that selects the direction, so existing single-cell DSI device trees
keep resolving to the transmitter.

The shared BIAS block must be programmed only once for the whole block.
Whichever direction powers on first enables it, checking the peer phy's
power_count under a per-provider mutex so that powering one direction on
does not disturb an already running one. The APB reset is issued on the
transmitter bring-up path.
The receiver bring-up itself is added in a later change.

Signed-off-by: Jason Yang <jason98166@gmail.com>
Assisted-by: Claude:claude-opus-4-8
---
 drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c | 133 +++++++++++++++-------
 1 file changed, 95 insertions(+), 38 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c b/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c
index d0d77421bd4b..0248424929bb 100644
--- a/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c
+++ b/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c
@@ -5,6 +5,7 @@
  *      Guochun Huang <hero.huang@rock-chips.com>
  */
 
+#include <dt-bindings/phy/phy-rockchip-samsung-dcphy.h>
 #include <dt-bindings/phy/phy.h>
 #include <linux/bitfield.h>
 #include <linux/clk.h>
@@ -13,6 +14,7 @@
 #include <linux/kernel.h>
 #include <linux/mfd/syscon.h>
 #include <linux/module.h>
+#include <linux/mutex.h>
 #include <linux/of.h>
 #include <linux/phy/phy.h>
 #include <linux/platform_device.h>
@@ -280,6 +282,16 @@ struct samsung_mipi_dcphy_plat_data {
 	u32 dphy_tx_max_lane_kbps;
 };
 
+struct samsung_mipi_dcphy;
+
+/* One PHY per direction: transmitter (DSI) and receiver (CSI). */
+struct samsung_mipi_dcphy_dir {
+	struct phy *phy;
+	struct samsung_mipi_dcphy *parent;
+	u8 dir;
+	u8 type;
+};
+
 struct samsung_mipi_dcphy {
 	struct device *dev;
 	struct clk *ref_clk;
@@ -291,8 +303,9 @@ struct samsung_mipi_dcphy {
 	struct reset_control *apb_rst;
 	struct reset_control *grf_apb_rst;
 	unsigned int lanes;
-	struct phy *phy;
-	u8 type;
+	struct samsung_mipi_dcphy_dir phys[2];
+	/* Serialises the two directions' access to the shared PHY state. */
+	struct mutex lock;
 
 	const struct samsung_mipi_dcphy_plat_data *pdata;
 	struct {
@@ -1332,13 +1345,26 @@ samsung_mipi_dphy_data_lane_timing_init(struct samsung_mipi_dcphy *samsung)
 	regmap_write(samsung->regmap, DPHY_MD3_TIME_CON4, 0x1f4);
 }
 
-static int samsung_mipi_dphy_tx_power_on(struct samsung_mipi_dcphy *samsung)
+static int samsung_mipi_dphy_tx_power_on(struct samsung_mipi_dcphy *samsung,
+					 struct phy *peer)
 {
+	bool first = peer->power_count == 0;
 	int ret;
 
+	/*
+	 * The shared BIAS block is brought up by whichever direction powers
+	 * on first, leaving an already active peer undisturbed.
+	 */
+	if (first) {
+		reset_control_assert(samsung->apb_rst);
+		udelay(1);
+		reset_control_deassert(samsung->apb_rst);
+	}
+
 	reset_control_assert(samsung->m_phy_rst);
 
-	samsung_mipi_dcphy_bias_block_enable(samsung);
+	if (first)
+		samsung_mipi_dcphy_bias_block_enable(samsung);
 	samsung_mipi_dcphy_pll_configure(samsung);
 	samsung_mipi_dphy_clk_lane_timing_init(samsung);
 	samsung_mipi_dphy_data_lane_timing_init(samsung);
@@ -1368,34 +1394,41 @@ static int samsung_mipi_dphy_tx_power_off(struct samsung_mipi_dcphy *samsung)
 
 static int samsung_mipi_dcphy_power_on(struct phy *phy)
 {
-	struct samsung_mipi_dcphy *samsung = phy_get_drvdata(phy);
-
-	reset_control_assert(samsung->apb_rst);
-	udelay(1);
-	reset_control_deassert(samsung->apb_rst);
+	struct samsung_mipi_dcphy_dir *pd = phy_get_drvdata(phy);
+	struct samsung_mipi_dcphy *samsung = pd->parent;
+	struct phy *peer = samsung->phys[!pd->dir].phy;
+	int ret;
 
-	switch (samsung->type) {
-	case PHY_TYPE_DPHY:
-		return samsung_mipi_dphy_tx_power_on(samsung);
-	default:
-		/* CPHY part to be implemented later */
+	if (pd->type != PHY_TYPE_DPHY)
 		return -EOPNOTSUPP;
-	}
 
-	return 0;
+	mutex_lock(&samsung->lock);
+	if (pd->dir == RK_DCPHY_DIR_RX)
+		ret = -EOPNOTSUPP;
+	else
+		ret = samsung_mipi_dphy_tx_power_on(samsung, peer);
+	mutex_unlock(&samsung->lock);
+
+	return ret;
 }
 
 static int samsung_mipi_dcphy_power_off(struct phy *phy)
 {
-	struct samsung_mipi_dcphy *samsung = phy_get_drvdata(phy);
+	struct samsung_mipi_dcphy_dir *pd = phy_get_drvdata(phy);
+	struct samsung_mipi_dcphy *samsung = pd->parent;
+	int ret;
 
-	switch (samsung->type) {
-	case PHY_TYPE_DPHY:
-		return samsung_mipi_dphy_tx_power_off(samsung);
-	default:
-		/* CPHY part to be implemented later */
+	if (pd->type != PHY_TYPE_DPHY)
 		return -EOPNOTSUPP;
-	}
+
+	if (pd->dir == RK_DCPHY_DIR_RX)
+		return -EOPNOTSUPP;
+
+	mutex_lock(&samsung->lock);
+	ret = samsung_mipi_dphy_tx_power_off(samsung);
+	mutex_unlock(&samsung->lock);
+
+	return ret;
 }
 
 static int
@@ -1488,11 +1521,15 @@ samsung_mipi_dcphy_pll_calc_rate(struct samsung_mipi_dcphy *samsung,
 static int samsung_mipi_dcphy_configure(struct phy *phy,
 					union phy_configure_opts *opts)
 {
-	struct samsung_mipi_dcphy *samsung = phy_get_drvdata(phy);
+	struct samsung_mipi_dcphy_dir *pd = phy_get_drvdata(phy);
+	struct samsung_mipi_dcphy *samsung = pd->parent;
 	unsigned long long target_rate = opts->mipi_dphy.hs_clk_rate;
 
 	samsung->lanes = opts->mipi_dphy.lanes > 4 ? 4 : opts->mipi_dphy.lanes;
 
+	if (pd->dir == RK_DCPHY_DIR_RX)
+		return -EOPNOTSUPP;
+
 	samsung_mipi_dcphy_pll_calc_rate(samsung, target_rate);
 	opts->mipi_dphy.hs_clk_rate = samsung->pll.rate;
 
@@ -1501,16 +1538,16 @@ static int samsung_mipi_dcphy_configure(struct phy *phy,
 
 static int samsung_mipi_dcphy_init(struct phy *phy)
 {
-	struct samsung_mipi_dcphy *samsung = phy_get_drvdata(phy);
+	struct samsung_mipi_dcphy_dir *pd = phy_get_drvdata(phy);
 
-	return pm_runtime_resume_and_get(samsung->dev);
+	return pm_runtime_resume_and_get(pd->parent->dev);
 }
 
 static int samsung_mipi_dcphy_exit(struct phy *phy)
 {
-	struct samsung_mipi_dcphy *samsung = phy_get_drvdata(phy);
+	struct samsung_mipi_dcphy_dir *pd = phy_get_drvdata(phy);
 
-	pm_runtime_put(samsung->dev);
+	pm_runtime_put(pd->parent->dev);
 
 	return 0;
 }
@@ -1536,19 +1573,29 @@ static struct phy *samsung_mipi_dcphy_xlate(struct device *dev,
 					    const struct of_phandle_args *args)
 {
 	struct samsung_mipi_dcphy *samsung = dev_get_drvdata(dev);
+	struct samsung_mipi_dcphy_dir *pd;
+	u8 dir = RK_DCPHY_DIR_TX;
 
-	if (args->args_count != 1) {
+	if (args->args_count < 1 || args->args_count > 2) {
 		dev_err(dev, "invalid number of arguments\n");
 		return ERR_PTR(-EINVAL);
 	}
 
-	if (samsung->type != PHY_NONE && samsung->type != args->args[0])
-		dev_warn(dev, "phy type select %d overwriting type %d\n",
-			 args->args[0], samsung->type);
+	if (args->args_count == 2) {
+		if (args->args[1] > RK_DCPHY_DIR_RX) {
+			dev_err(dev, "invalid direction %u\n", args->args[1]);
+			return ERR_PTR(-EINVAL);
+		}
+		dir = args->args[1];
+	}
 
-	samsung->type = args->args[0];
+	pd = &samsung->phys[dir];
+	if (pd->type != PHY_NONE && pd->type != args->args[0])
+		dev_warn(dev, "phy type select %u overwriting type %u\n",
+			 args->args[0], pd->type);
+	pd->type = args->args[0];
 
-	return samsung->phy;
+	return pd->phy;
 }
 
 static int samsung_mipi_dcphy_probe(struct platform_device *pdev)
@@ -1559,6 +1606,7 @@ static int samsung_mipi_dcphy_probe(struct platform_device *pdev)
 	struct phy_provider *phy_provider;
 	struct resource *res;
 	void __iomem *regs;
+	unsigned int i;
 	int ret;
 
 	samsung = devm_kzalloc(dev, sizeof(*samsung), GFP_KERNEL);
@@ -1568,6 +1616,7 @@ static int samsung_mipi_dcphy_probe(struct platform_device *pdev)
 	samsung->dev = dev;
 	samsung->pdata = device_get_match_data(dev);
 	platform_set_drvdata(pdev, samsung);
+	mutex_init(&samsung->lock);
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	regs = devm_ioremap_resource(dev, res);
@@ -1613,11 +1662,19 @@ static int samsung_mipi_dcphy_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, PTR_ERR(samsung->grf_apb_rst),
 				     "Failed to get system grf_apb_rst control\n");
 
-	samsung->phy = devm_phy_create(dev, NULL, &samsung_mipi_dcphy_ops);
-	if (IS_ERR(samsung->phy))
-		return dev_err_probe(dev, PTR_ERR(samsung->phy), "Failed to create MIPI DC-PHY\n");
+	for (i = 0; i < ARRAY_SIZE(samsung->phys); i++) {
+		struct phy *phy = devm_phy_create(dev, NULL,
+						  &samsung_mipi_dcphy_ops);
 
-	phy_set_drvdata(samsung->phy, samsung);
+		if (IS_ERR(phy))
+			return dev_err_probe(dev, PTR_ERR(phy),
+					     "Failed to create MIPI DC-PHY\n");
+
+		samsung->phys[i].phy = phy;
+		samsung->phys[i].parent = samsung;
+		samsung->phys[i].dir = i;
+		phy_set_drvdata(phy, &samsung->phys[i]);
+	}
 
 	ret = devm_pm_runtime_enable(dev);
 	if (ret)

-- 
2.43.0



