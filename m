Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94D7FC83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Jul 2025 12:33:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G7HtzhH5QPJr92DGCLq8/qfM86Vj1rU2kScnrBc1jhM=; b=uHFqyjgk2kP+rhC9ZIxQUl05k3
	IodO/BdE95gTIAqT4fyFq6kATjwn/VMVMFumkj0gDESlkyVK0cMOrjdfCJyzLLJVi9rM/BGhPOty6
	8fuVPtJJYsai8KEz4OmaCwvUms7ixIuDZ4i4HYEr/bW9yYEcDrIkktQ+tVron3B3wHov9c4aU7xRn
	Nbv3O3GoK4PQW+1SbkoYzKl8i9mGbLCl/NjFK4GLcC3y/CTe9J6fdeRrtCj16bwf3uqt5PH0m7Ilw
	Kkeq+2j7USdwtpov1F0C8UaR08bcQuG7R8sCpD2M0jVwtLnyzZ6CrQNaQye63bpInThZKvcDHSbA4
	5YFj+qUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueYfM-00000004vG9-1ApI;
	Wed, 23 Jul 2025 12:33:48 +0000
Received: from smtp.forwardemail.net ([121.127.44.73])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueYVh-00000004tkR-279V
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Jul 2025 12:23:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From; q=dns/txt; s=fe-e1b5cab7be;
 t=1753273428; bh=G7HtzhH5QPJr92DGCLq8/qfM86Vj1rU2kScnrBc1jhM=;
 b=BiqofRfZN1UAbZzFAENCQ75UVlbpSMvz1+rBdDwBtMUmki4HVqWA+cmQMDjD3/O+eGU9XU/GR
 z59zw9UX6raWMEAPRBCBcUl88Ot4JQbTg+MRn3lhhLyHc9qpKwuCQFpwq/5zGP7/yMhZYiD01/8
 czBEyndHSXyRTBeBq7FiEHcEMFKsV49i0DKnDyNXrbiaSFyklp8Cb+2zGFHFcSxMtGm+KfAfz9u
 V6QwMIbkNGjx3Z8rsMGk/fjvgyuHOF6lEv+LML/pblUgbeUzmcyJo23iFbQBL3WFJhU7CZmMIVX
 SlKutWJ7imryzs7egWucUFlDli19rbiRbbc1yeP/hZHA==
X-Forward-Email-ID: 6880d453cb0ee86f9731a09c
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 121.127.44.73
X-Forward-Email-Version: 1.1.6
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
From: Jonas Karlman <jonas@kwiboo.se>
To: Heiko Stuebner <heiko@sntech.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>
Cc: Yao Zi <ziyao@disroot.org>,
	Chukun Pan <amadeus@jmu.edu.cn>,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jonas Karlman <jonas@kwiboo.se>
Subject: [PATCH 04/11] phy: rockchip: inno-usb2: Add clkout_ctl_phy support
Date: Wed, 23 Jul 2025 12:23:02 +0000
Message-ID: <20250723122323.2344916-5-jonas@kwiboo.se>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250723122323.2344916-1-jonas@kwiboo.se>
References: <20250723122323.2344916-1-jonas@kwiboo.se>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250723_052349_638479_539B62AE 
X-CRM114-Status: GOOD (  16.14  )
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

The 480m clk is controlled using regs in the PHY address space and not
in the USB GRF address space on e.g. RK3528 and RK3506.

Add a clkout_ctl_phy usb2phy_reg to handle enable/disable of the 480m
clk on these SoCs.

Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
 drivers/phy/rockchip/phy-rockchip-inno-usb2.c | 47 +++++++++++++++----
 1 file changed, 38 insertions(+), 9 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-inno-usb2.c b/drivers/phy/rockchip/phy-rockchip-inno-usb2.c
index 130f03474719..cd1a02b990ef 100644
--- a/drivers/phy/rockchip/phy-rockchip-inno-usb2.c
+++ b/drivers/phy/rockchip/phy-rockchip-inno-usb2.c
@@ -179,6 +179,7 @@ struct rockchip_usb2phy_cfg {
 	unsigned int	num_ports;
 	int (*phy_tuning)(struct rockchip_usb2phy *rphy);
 	struct usb2phy_reg	clkout_ctl;
+	struct usb2phy_reg	clkout_ctl_phy;
 	const struct rockchip_usb2phy_port_cfg	port_cfgs[USB2PHY_NUM_PORTS];
 	const struct rockchip_chg_det_reg	chg_det;
 };
@@ -228,6 +229,7 @@ struct rockchip_usb2phy_port {
  * struct rockchip_usb2phy - usb2.0 phy driver data.
  * @dev: pointer to device.
  * @grf: General Register Files regmap.
+ * @phy_base: USB PHY regmap.
  * @clks: array of phy input clocks.
  * @clk480m: clock struct of phy output clk.
  * @clk480m_hw: clock struct of phy output clk management.
@@ -245,6 +247,7 @@ struct rockchip_usb2phy_port {
 struct rockchip_usb2phy {
 	struct device	*dev;
 	struct regmap	*grf;
+	struct regmap	*phy_base;
 	struct clk_bulk_data	*clks;
 	struct clk	*clk480m;
 	struct clk_hw	clk480m_hw;
@@ -312,15 +315,33 @@ static void rockchip_usb2phy_clk_bulk_disable(void *data)
 	clk_bulk_disable_unprepare(rphy->num_clks, rphy->clks);
 }
 
-static int rockchip_usb2phy_clk480m_prepare(struct clk_hw *hw)
+static void
+rockchip_usb2phy_clk480m_clkout_ctl(struct clk_hw *hw, struct regmap **base,
+				    const struct usb2phy_reg **clkout_ctl)
 {
 	struct rockchip_usb2phy *rphy =
 		container_of(hw, struct rockchip_usb2phy, clk480m_hw);
+
+	if (rphy->phy_cfg->clkout_ctl_phy.enable) {
+		*base = rphy->phy_base;
+		*clkout_ctl = &rphy->phy_cfg->clkout_ctl_phy;
+	} else {
+		*base = rphy->grf;
+		*clkout_ctl = &rphy->phy_cfg->clkout_ctl;
+	}
+}
+
+static int rockchip_usb2phy_clk480m_prepare(struct clk_hw *hw)
+{
+	const struct usb2phy_reg *clkout_ctl;
+	struct regmap *base;
 	int ret;
 
+	rockchip_usb2phy_clk480m_clkout_ctl(hw, &base, &clkout_ctl);
+
 	/* turn on 480m clk output if it is off */
-	if (!property_enabled(rphy->grf, &rphy->phy_cfg->clkout_ctl)) {
-		ret = property_enable(rphy->grf, &rphy->phy_cfg->clkout_ctl, true);
+	if (!property_enabled(base, clkout_ctl)) {
+		ret = property_enable(base, clkout_ctl, true);
 		if (ret)
 			return ret;
 
@@ -333,19 +354,23 @@ static int rockchip_usb2phy_clk480m_prepare(struct clk_hw *hw)
 
 static void rockchip_usb2phy_clk480m_unprepare(struct clk_hw *hw)
 {
-	struct rockchip_usb2phy *rphy =
-		container_of(hw, struct rockchip_usb2phy, clk480m_hw);
+	const struct usb2phy_reg *clkout_ctl;
+	struct regmap *base;
+
+	rockchip_usb2phy_clk480m_clkout_ctl(hw, &base, &clkout_ctl);
 
 	/* turn off 480m clk output */
-	property_enable(rphy->grf, &rphy->phy_cfg->clkout_ctl, false);
+	property_enable(base, clkout_ctl, false);
 }
 
 static int rockchip_usb2phy_clk480m_prepared(struct clk_hw *hw)
 {
-	struct rockchip_usb2phy *rphy =
-		container_of(hw, struct rockchip_usb2phy, clk480m_hw);
+	const struct usb2phy_reg *clkout_ctl;
+	struct regmap *base;
+
+	rockchip_usb2phy_clk480m_clkout_ctl(hw, &base, &clkout_ctl);
 
-	return property_enabled(rphy->grf, &rphy->phy_cfg->clkout_ctl);
+	return property_enabled(base, clkout_ctl);
 }
 
 static unsigned long
@@ -1332,9 +1357,13 @@ static int rockchip_usb2phy_probe(struct platform_device *pdev)
 
 	if (!dev->parent || !dev->parent->of_node ||
 	    of_property_present(np, "rockchip,usbgrf")) {
+		rphy->phy_base = device_node_to_regmap(np);
+		if (IS_ERR(rphy->phy_base))
+			return PTR_ERR(rphy->phy_base);
 		rphy->grf = syscon_regmap_lookup_by_phandle(np, "rockchip,usbgrf");
 	} else {
 		rphy->grf = syscon_node_to_regmap(dev->parent->of_node);
+		rphy->phy_base = rphy->grf;
 	}
 	if (IS_ERR(rphy->grf))
 		return PTR_ERR(rphy->grf);
-- 
2.50.1


