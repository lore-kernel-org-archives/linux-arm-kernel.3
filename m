Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD7C0E98DFF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 09:35:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6BAwLV4bdbVtzEzOTR74P5WaZq6uAb5HtdIWeBiWhr4=; b=eMb5taNleLSDZmzvotaN5+vx+e
	R+3XN6cZprXt2pwgJJITuv/tmYCuX7Rh4asVf0LDNgAeyC3AXnpgPtah1eBJ3yQvw94Be9O87f0lT
	KFa4MykpMue95y+HhLItYAe6CH0xiijWW/bGP84tmJFgLHEP1yhKkg9fo/Dbhcwg5b0bfIRjOVX+y
	7avFh+pcOlEqHl1FPfdK6XCOeynbPtfdQVohGFKT8LaWReKNHnagDAhZtyc6VmnI0PKYqhWxjHd/8
	nqdJamVk3yJZVCx76H0DBn058M6g282pdpMkys3+S3JtoVRu9lxL9B0Uaw1jHqUwWsWAmQ558As6y
	wgR4j4YA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuSLP-0000000HY6r-3FzE;
	Mon, 23 Feb 2026 09:35:11 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuSLM-0000000HY0b-3RZY
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Feb 2026 09:35:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=6BAwLV4bdbVtzEzOTR74P5WaZq6uAb5HtdIWeBiWhr4=; b=tGtzN0FZMm1r5TOW/iTiPUyNNj
	5HJMGjHR++BG2hu7wdEDiF+EenUaqbj78nvYZN/9rZyl2klZilbCcxUPFBQOHlouoc2ZPG0UhZIsK
	GyAenk5eBpUexYaUfWFoux23qCYv2+mzsbUjRyxDr6PdWBpJthZPMFepkkrz2E6UAkcuSe0mtk5N3
	pncxhB5uviaBh9cW0t3lPNQ2zqSFJKb4+bsTm2yWK/lJx9b1nOev6yDUN9IzBDWJM8PF7D1E3mWPT
	/+91zm7eYM4dH8xpCx1ZPlNqaiVTf1NNVlRfNQBWCnKQNe3N/kibpYDGUHZwu6dATT8R3Wq4KZxkw
	XLCV5RcA==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:59746 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vuSKx-000000003nT-3XAN;
	Mon, 23 Feb 2026 09:34:44 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vuSKv-0000000AScG-1zv6;
	Mon, 23 Feb 2026 09:34:41 +0000
In-Reply-To: <aZwfAFJQcp9f0niI@shell.armlinux.org.uk>
References: <aZwfAFJQcp9f0niI@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Frank Li <Frank.Li@nxp.com>,
	imx@lists.linux.dev,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Vinod Koul <vkoul@kernel.org>
Subject: [PATCH net-next 06/10] net: stmmac: pass interface mode into
 fix_mac_speed() method
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1vuSKv-0000000AScG-1zv6@rmk-PC.armlinux.org.uk>
Date: Mon, 23 Feb 2026 09:34:41 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_013509_042029_3D8744E2 
X-CRM114-Status: GOOD (  12.83  )
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

Pass the current interface mode reported by phylink into the
fix_mac_speed() method. This will be used by qcom-ethqos for its
"SGMII" configuration.

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
Tested-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c   |  3 ++-
 drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c       | 11 +++++++----
 drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c  |  3 ++-
 .../net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c   |  3 ++-
 drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c   |  3 ++-
 drivers/net/ethernet/stmicro/stmmac/dwmac-sti.c       | 11 +++++++----
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c     |  3 ++-
 include/linux/stmmac.h                                |  3 ++-
 8 files changed, 26 insertions(+), 14 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c
index d043bad4a862..0495437d3a6e 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c
@@ -112,7 +112,8 @@ static int dwc_qos_probe(struct platform_device *pdev,
 #define AUTO_CAL_STATUS 0x880c
 #define  AUTO_CAL_STATUS_ACTIVE BIT(31)
 
-static void tegra_eqos_fix_speed(void *bsp_priv, int speed, unsigned int mode)
+static void tegra_eqos_fix_speed(void *bsp_priv, phy_interface_t interface,
+				 int speed, unsigned int mode)
 {
 	struct tegra_eqos *eqos = bsp_priv;
 	bool needs_calibration = false;
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c
index c4e85197629d..9f5a15b81f8a 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c
@@ -48,7 +48,8 @@ struct imx_dwmac_ops {
 
 	int (*fix_soc_reset)(struct stmmac_priv *priv);
 	int (*set_intf_mode)(struct imx_priv_data *dwmac, u8 phy_intf_sel);
-	void (*fix_mac_speed)(void *priv, int speed, unsigned int mode);
+	void (*fix_mac_speed)(void *priv, phy_interface_t interface,
+			      int speed, unsigned int mode);
 };
 
 struct imx_priv_data {
@@ -160,7 +161,8 @@ static int imx_dwmac_set_clk_tx_rate(void *bsp_priv, struct clk *clk_tx_i,
 	return stmmac_set_clk_tx_rate(bsp_priv, clk_tx_i, interface, speed);
 }
 
-static void imx_dwmac_fix_speed(void *priv, int speed, unsigned int mode)
+static void imx_dwmac_fix_speed(void *priv, phy_interface_t interface,
+				int speed, unsigned int mode)
 {
 	struct plat_stmmacenet_data *plat_dat;
 	struct imx_priv_data *dwmac = priv;
@@ -185,13 +187,14 @@ static void imx_dwmac_fix_speed(void *priv, int speed, unsigned int mode)
 		dev_err(dwmac->dev, "failed to set tx rate %lu\n", rate);
 }
 
-static void imx93_dwmac_fix_speed(void *priv, int speed, unsigned int mode)
+static void imx93_dwmac_fix_speed(void *priv, phy_interface_t interface,
+				  int speed, unsigned int mode)
 {
 	struct imx_priv_data *dwmac = priv;
 	unsigned int iface;
 	int ctrl, old_ctrl;
 
-	imx_dwmac_fix_speed(priv, speed, mode);
+	imx_dwmac_fix_speed(priv, interface, speed, mode);
 
 	if (!dwmac || mode != MLO_AN_FIXED)
 		return;
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
index 815213223583..9c51c96223ad 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
@@ -143,7 +143,8 @@ static struct stmmac_pci_info loongson_gmac_pci_info = {
 	.setup = loongson_gmac_data,
 };
 
-static void loongson_gnet_fix_speed(void *priv, int speed, unsigned int mode)
+static void loongson_gnet_fix_speed(void *priv, phy_interface_t interface,
+				    int speed, unsigned int mode)
 {
 	struct loongson_data *ld = (struct loongson_data *)priv;
 	struct net_device *ndev = dev_get_drvdata(ld->dev);
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index bd5d3bf90400..9b29516a5a7c 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -643,7 +643,8 @@ static void ethqos_configure(struct qcom_ethqos *ethqos, int speed)
 	return ethqos->configure_func(ethqos, speed);
 }
 
-static void ethqos_fix_mac_speed(void *priv, int speed, unsigned int mode)
+static void ethqos_fix_mac_speed(void *priv, phy_interface_t interface,
+				 int speed, unsigned int mode)
 {
 	struct qcom_ethqos *ethqos = priv;
 
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
index 4c8991f3b38d..c6b99814d391 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
@@ -72,7 +72,8 @@ struct socfpga_dwmac {
 	const struct socfpga_dwmac_ops *ops;
 };
 
-static void socfpga_dwmac_fix_mac_speed(void *bsp_priv, int speed,
+static void socfpga_dwmac_fix_mac_speed(void *bsp_priv,
+					phy_interface_t interface, int speed,
 					unsigned int mode)
 {
 	struct socfpga_dwmac *dwmac = (struct socfpga_dwmac *)bsp_priv;
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sti.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sti.c
index f50547b67fbc..6ebbf95d158f 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sti.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sti.c
@@ -91,11 +91,13 @@ struct sti_dwmac {
 	struct regmap *regmap;
 	bool gmac_en;
 	int speed;
-	void (*fix_retime_src)(void *priv, int speed, unsigned int mode);
+	void (*fix_retime_src)(void *priv, phy_interface_t interface,
+			       int speed, unsigned int mode);
 };
 
 struct sti_dwmac_of_data {
-	void (*fix_retime_src)(void *priv, int speed, unsigned int mode);
+	void (*fix_retime_src)(void *priv, phy_interface_t interface,
+			       int speed, unsigned int mode);
 };
 
 enum {
@@ -114,7 +116,8 @@ static u32 stih4xx_tx_retime_val[] = {
 				 | STIH4XX_ETH_SEL_INTERNAL_NOTEXT_PHYCLK,
 };
 
-static void stih4xx_fix_retime_src(void *priv, int spd, unsigned int mode)
+static void stih4xx_fix_retime_src(void *priv, phy_interface_t interface,
+				   int spd, unsigned int mode)
 {
 	struct sti_dwmac *dwmac = priv;
 	u32 src = dwmac->tx_retime_src;
@@ -170,7 +173,7 @@ static int sti_set_phy_intf_sel(void *bsp_priv, u8 phy_intf_sel)
 	val = (dwmac->interface == PHY_INTERFACE_MODE_REVMII) ? 0 : ENMII;
 	regmap_update_bits(regmap, reg, ENMII_MASK, val);
 
-	dwmac->fix_retime_src(dwmac, dwmac->speed, 0);
+	dwmac->fix_retime_src(dwmac, dwmac->interface, dwmac->speed, 0);
 
 	return 0;
 }
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 82375d34ad57..d7c730179a7f 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -1071,7 +1071,8 @@ static void stmmac_mac_link_up(struct phylink_config *config,
 	}
 
 	if (priv->plat->fix_mac_speed)
-		priv->plat->fix_mac_speed(priv->plat->bsp_priv, speed, mode);
+		priv->plat->fix_mac_speed(priv->plat->bsp_priv, interface,
+					  speed, mode);
 
 	if (!duplex)
 		ctrl &= ~priv->hw->link.duplex;
diff --git a/include/linux/stmmac.h b/include/linux/stmmac.h
index 32352a216567..b96ae9dadfab 100644
--- a/include/linux/stmmac.h
+++ b/include/linux/stmmac.h
@@ -256,7 +256,8 @@ struct plat_stmmacenet_data {
 	int (*set_phy_intf_sel)(void *priv, u8 phy_intf_sel);
 	int (*set_clk_tx_rate)(void *priv, struct clk *clk_tx_i,
 			       phy_interface_t interface, int speed);
-	void (*fix_mac_speed)(void *priv, int speed, unsigned int mode);
+	void (*fix_mac_speed)(void *priv, phy_interface_t interface,
+			      int speed, unsigned int mode);
 	int (*fix_soc_reset)(struct stmmac_priv *priv);
 	int (*serdes_powerup)(struct net_device *ndev, void *priv);
 	void (*serdes_powerdown)(struct net_device *ndev, void *priv);
-- 
2.47.3


