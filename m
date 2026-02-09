Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94AC9E7E0B7
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Feb 2026 09:48:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L73l4ROLjtM8oT21GNqYu5W5Cp8DA6xA87cNlJh72s0=; b=mp25RjO1jMco4Xq8VYsn3r4AyQ
	RGJwqCbspBQ0zzSB0rRtaC1FbVV2E5H6JPx+YhVQfdNJ3x5qzuhDBi9Q/2UnOWubcxXcuk3RBqHug
	zcXwBZ9CJwQMWBq5e+BEBU1vTxcgDohb2e7vHGMRsIFaAQPo04FXeSzyyOhH/EEfLEaJ4yuY0bXdp
	j6/XgWDRYzE0TF9byLF7mnzWmP33VBptiHTmTcgmVbmcwG+Fmqg7qq0FSV6Q9Qs6h7GtW8Dv4C3MZ
	tEkH2LfgqMWEhgJlVKf0EUsPOJhI/TNpCdEhJLprM6iJqkrbdlhnY82AXJTLmoPGzuYp2d+ndzCaH
	w/EwHgBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpNsr-0000000FAyu-33SP;
	Mon, 09 Feb 2026 09:48:45 +0000
Received: from azure-sdnproxy.icoremail.net ([207.46.229.174])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpNsp-0000000FAxZ-0ipz
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Feb 2026 09:48:44 +0000
Received: from E0004057DT.eswin.cn (unknown [10.11.96.26])
	by app1 (Coremail) with SMTP id TAJkCgBHlzdyrYlpFDcEAA--.18983S2;
	Mon, 09 Feb 2026 17:48:35 +0800 (CST)
From: lizhi2@eswincomputing.com
To: devicetree@vger.kernel.org,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	netdev@vger.kernel.org,
	pabeni@redhat.com,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	rmk+kernel@armlinux.org.uk,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: ningyu@eswincomputing.com,
	linmin@eswincomputing.com,
	pinkesh.vaghela@einfochips.com,
	weishangjuan@eswincomputing.com,
	Zhi Li <lizhi2@eswincomputing.com>
Subject: [PATCH v2 2/2] net: stmmac: eic7700: enable clocks before syscon access and correct RX sampling timing
Date: Mon,  9 Feb 2026 17:48:29 +0800
Message-ID: <20260209094832.932-1-lizhi2@eswincomputing.com>
X-Mailer: git-send-email 2.52.0.windows.1
In-Reply-To: <20260209094628.886-1-lizhi2@eswincomputing.com>
References: <20260209094628.886-1-lizhi2@eswincomputing.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: TAJkCgBHlzdyrYlpFDcEAA--.18983S2
X-Coremail-Antispam: 1UD129KBjvJXoWxKw4kKr45AF47XF15tFy7ZFb_yoWftw15pF
	WkAFyYqr1jqF1fG3yqyF48ta4Fyw47WF1FyrWfKFnFyF9xtr1DXayjya4xCFy5Kry7Zr13
	J3yUAFyxu3W29rJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUBm14x267AKxVW5JVWrJwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
	JVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
	CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2
	Y2ka0xkIwI1lw4CEc2x0rVAKj4xxMxkF7I0En4kS14v26r4a6rW5MxkIecxEwVCm-wCF04
	k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18
	MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_GFv_WrylIxkGc2Ij64vIr4
	1lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1U
	MIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I
	8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjTRNSdgDUUUU
X-CM-SenderInfo: xol2xx2s6h245lqf0zpsxwx03jof0z/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260209_014843_395636_2D996463 
X-CRM114-Status: GOOD (  17.30  )
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

From: Zhi Li <lizhi2@eswincomputing.com>

The second Ethernet controller (eth1) on the Eswin EIC7700 SoC may fail
to sample RX data correctly at Gigabit speed due to EIC7700-specific
receive clock to data skew at the MAC input in the silicon.

The existing internal delay configuration does not provide sufficient
adjustment range to compensate for this condition at 1000Mbps.
Update the EIC7700 DWMAC glue driver to apply EIC7700-specific clock
sampling inversion only during Gigabit operation on MAC instances
that require it.

TXD and RXD delay registers are explicitly cleared during initialization
to override any residual configuration left by the bootloader. All HSP
CSR register accesses are performed only after the required clocks are
enabled.

Fixes: ea77dbbdbc4e ("net: stmmac: add Eswin EIC7700 glue driver")
Signed-off-by: Zhi Li <lizhi2@eswincomputing.com>
---
 .../ethernet/stmicro/stmmac/dwmac-eic7700.c   | 152 +++++++++++++-----
 1 file changed, 116 insertions(+), 36 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-eic7700.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-eic7700.c
index bcb8e000e720..f6a99784596b 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-eic7700.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-eic7700.c
@@ -28,20 +28,37 @@
 
 /*
  * TX/RX Clock Delay Bit Masks:
- * - TX Delay: bits [14:8] — TX_CLK delay (unit: 0.1ns per bit)
- * - RX Delay: bits [30:24] — RX_CLK delay (unit: 0.1ns per bit)
+ * - TX Delay: bits [14:8] — TX_CLK delay (unit: 0.02ns per bit)
+ * - TX Invert : bit  [15]
+ * - RX Delay: bits [30:24] — RX_CLK delay (unit: 0.02ns per bit)
+ * - RX Invert : bit  [31]
  */
 #define EIC7700_ETH_TX_ADJ_DELAY	GENMASK(14, 8)
 #define EIC7700_ETH_RX_ADJ_DELAY	GENMASK(30, 24)
+#define EIC7700_ETH_TX_INV_DELAY	BIT(15)
+#define EIC7700_ETH_RX_INV_DELAY	BIT(31)
 
-#define EIC7700_MAX_DELAY_UNIT 0x7F
+#define EIC7700_MAX_DELAY_STEPS 0x7F
 
 static const char * const eic7700_clk_names[] = {
 	"tx", "axi", "cfg",
 };
 
+struct eic7700_dwmac_data {
+	bool rgmii_rx_clk_invert;
+};
+
 struct eic7700_qos_priv {
+	struct device *dev;
 	struct plat_stmmacenet_data *plat_dat;
+	struct regmap *eic7700_hsp_regmap;
+	u32 eth_axi_lp_ctrl_offset;
+	u32 eth_phy_ctrl_offset;
+	u32 eth_txd_offset;
+	u32 eth_clk_offset;
+	u32 eth_rxd_offset;
+	u32 eth_clk_dly_param;
+	bool eth_rx_clk_inv;
 };
 
 static int eic7700_clks_config(void *priv, bool enabled)
@@ -61,8 +78,27 @@ static int eic7700_clks_config(void *priv, bool enabled)
 static int eic7700_dwmac_init(struct device *dev, void *priv)
 {
 	struct eic7700_qos_priv *dwc = priv;
+	u32 eth_phy_ctrl_regset;
+	int ret = 0;
+
+	ret = eic7700_clks_config(dwc, true);
+	if (ret)
+		return ret;
+
+	regmap_read(dwc->eic7700_hsp_regmap, dwc->eth_phy_ctrl_offset,
+		    &eth_phy_ctrl_regset);
+	eth_phy_ctrl_regset |=
+		(EIC7700_ETH_TX_CLK_SEL | EIC7700_ETH_PHY_INTF_SELI);
+	regmap_write(dwc->eic7700_hsp_regmap, dwc->eth_phy_ctrl_offset,
+		     eth_phy_ctrl_regset);
+
+	regmap_write(dwc->eic7700_hsp_regmap, dwc->eth_axi_lp_ctrl_offset,
+		     EIC7700_ETH_CSYSREQ_VAL);
+
+	regmap_write(dwc->eic7700_hsp_regmap, dwc->eth_txd_offset, 0);
+	regmap_write(dwc->eic7700_hsp_regmap, dwc->eth_rxd_offset, 0);
 
-	return eic7700_clks_config(dwc, true);
+	return ret;
 }
 
 static void eic7700_dwmac_exit(struct device *dev, void *priv)
@@ -88,17 +124,33 @@ static int eic7700_dwmac_resume(struct device *dev, void *priv)
 	return ret;
 }
 
+static void eic7700_dwmac_fix_speed(void *priv, int speed, unsigned int mode)
+{
+	struct eic7700_qos_priv *dwc = (struct eic7700_qos_priv *)priv;
+	u32 dly_param = dwc->eth_clk_dly_param;
+
+	switch (speed) {
+	case SPEED_1000:
+		if (dwc->eth_rx_clk_inv)
+			dly_param |= EIC7700_ETH_RX_INV_DELAY;
+		break;
+	case SPEED_100:
+	case SPEED_10:
+		break;
+	default:
+		dev_err(dwc->dev, "invalid speed %u\n", speed);
+		break;
+	}
+
+	regmap_write(dwc->eic7700_hsp_regmap, dwc->eth_clk_offset, dly_param);
+}
+
 static int eic7700_dwmac_probe(struct platform_device *pdev)
 {
+	const struct eic7700_dwmac_data *data;
 	struct plat_stmmacenet_data *plat_dat;
 	struct stmmac_resources stmmac_res;
 	struct eic7700_qos_priv *dwc_priv;
-	struct regmap *eic7700_hsp_regmap;
-	u32 eth_axi_lp_ctrl_offset;
-	u32 eth_phy_ctrl_offset;
-	u32 eth_phy_ctrl_regset;
-	u32 eth_rxd_dly_offset;
-	u32 eth_dly_param = 0;
 	u32 delay_ps;
 	int i, ret;
 
@@ -116,13 +168,23 @@ static int eic7700_dwmac_probe(struct platform_device *pdev)
 	if (!dwc_priv)
 		return -ENOMEM;
 
+	dwc_priv->dev = &pdev->dev;
+
+	data = device_get_match_data(&pdev->dev);
+	if (!data)
+		return dev_err_probe(&pdev->dev,
+				     -EINVAL, "no match data found\n");
+
+	dwc_priv->eth_rx_clk_inv = data->rgmii_rx_clk_invert;
+
 	/* Read rx-internal-delay-ps and update rx_clk delay */
 	if (!of_property_read_u32(pdev->dev.of_node,
 				  "rx-internal-delay-ps", &delay_ps)) {
-		u32 val = min(delay_ps / 100, EIC7700_MAX_DELAY_UNIT);
+		u32 val = min(delay_ps / 20, EIC7700_MAX_DELAY_STEPS);
 
-		eth_dly_param &= ~EIC7700_ETH_RX_ADJ_DELAY;
-		eth_dly_param |= FIELD_PREP(EIC7700_ETH_RX_ADJ_DELAY, val);
+		dwc_priv->eth_clk_dly_param &= ~EIC7700_ETH_RX_ADJ_DELAY;
+		dwc_priv->eth_clk_dly_param |=
+				 FIELD_PREP(EIC7700_ETH_RX_ADJ_DELAY, val);
 	} else {
 		return dev_err_probe(&pdev->dev, -EINVAL,
 			"missing required property rx-internal-delay-ps\n");
@@ -131,55 +193,58 @@ static int eic7700_dwmac_probe(struct platform_device *pdev)
 	/* Read tx-internal-delay-ps and update tx_clk delay */
 	if (!of_property_read_u32(pdev->dev.of_node,
 				  "tx-internal-delay-ps", &delay_ps)) {
-		u32 val = min(delay_ps / 100, EIC7700_MAX_DELAY_UNIT);
+		u32 val = min(delay_ps / 20, EIC7700_MAX_DELAY_STEPS);
 
-		eth_dly_param &= ~EIC7700_ETH_TX_ADJ_DELAY;
-		eth_dly_param |= FIELD_PREP(EIC7700_ETH_TX_ADJ_DELAY, val);
+		dwc_priv->eth_clk_dly_param &= ~EIC7700_ETH_TX_ADJ_DELAY;
+		dwc_priv->eth_clk_dly_param |=
+				 FIELD_PREP(EIC7700_ETH_TX_ADJ_DELAY, val);
 	} else {
 		return dev_err_probe(&pdev->dev, -EINVAL,
 			"missing required property tx-internal-delay-ps\n");
 	}
 
-	eic7700_hsp_regmap = syscon_regmap_lookup_by_phandle(pdev->dev.of_node,
-							     "eswin,hsp-sp-csr");
-	if (IS_ERR(eic7700_hsp_regmap))
+	dwc_priv->eic7700_hsp_regmap =
+			syscon_regmap_lookup_by_phandle(pdev->dev.of_node,
+							"eswin,hsp-sp-csr");
+	if (IS_ERR(dwc_priv->eic7700_hsp_regmap))
 		return dev_err_probe(&pdev->dev,
-				PTR_ERR(eic7700_hsp_regmap),
+				PTR_ERR(dwc_priv->eic7700_hsp_regmap),
 				"Failed to get hsp-sp-csr regmap\n");
 
 	ret = of_property_read_u32_index(pdev->dev.of_node,
 					 "eswin,hsp-sp-csr",
-					 1, &eth_phy_ctrl_offset);
+					 1, &dwc_priv->eth_phy_ctrl_offset);
 	if (ret)
 		return dev_err_probe(&pdev->dev, ret,
 				     "can't get eth_phy_ctrl_offset\n");
 
-	regmap_read(eic7700_hsp_regmap, eth_phy_ctrl_offset,
-		    &eth_phy_ctrl_regset);
-	eth_phy_ctrl_regset |=
-		(EIC7700_ETH_TX_CLK_SEL | EIC7700_ETH_PHY_INTF_SELI);
-	regmap_write(eic7700_hsp_regmap, eth_phy_ctrl_offset,
-		     eth_phy_ctrl_regset);
-
 	ret = of_property_read_u32_index(pdev->dev.of_node,
 					 "eswin,hsp-sp-csr",
-					 2, &eth_axi_lp_ctrl_offset);
+					 2, &dwc_priv->eth_axi_lp_ctrl_offset);
 	if (ret)
 		return dev_err_probe(&pdev->dev, ret,
 				     "can't get eth_axi_lp_ctrl_offset\n");
 
-	regmap_write(eic7700_hsp_regmap, eth_axi_lp_ctrl_offset,
-		     EIC7700_ETH_CSYSREQ_VAL);
+	ret = of_property_read_u32_index(pdev->dev.of_node,
+					 "eswin,hsp-sp-csr",
+					 3, &dwc_priv->eth_txd_offset);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret,
+				     "can't get eth_txd_offset\n");
 
 	ret = of_property_read_u32_index(pdev->dev.of_node,
 					 "eswin,hsp-sp-csr",
-					 3, &eth_rxd_dly_offset);
+					 4, &dwc_priv->eth_clk_offset);
 	if (ret)
 		return dev_err_probe(&pdev->dev, ret,
-				     "can't get eth_rxd_dly_offset\n");
+				     "can't get eth_clk_offset\n");
 
-	regmap_write(eic7700_hsp_regmap, eth_rxd_dly_offset,
-		     eth_dly_param);
+	ret = of_property_read_u32_index(pdev->dev.of_node,
+					 "eswin,hsp-sp-csr",
+					 5, &dwc_priv->eth_rxd_offset);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret,
+				     "can't get eth_rxd_offset\n");
 
 	plat_dat->num_clks = ARRAY_SIZE(eic7700_clk_names);
 	plat_dat->clks = devm_kcalloc(&pdev->dev,
@@ -208,12 +273,27 @@ static int eic7700_dwmac_probe(struct platform_device *pdev)
 	plat_dat->exit = eic7700_dwmac_exit;
 	plat_dat->suspend = eic7700_dwmac_suspend;
 	plat_dat->resume = eic7700_dwmac_resume;
+	plat_dat->fix_mac_speed = eic7700_dwmac_fix_speed;
 
 	return devm_stmmac_pltfr_probe(pdev, plat_dat, &stmmac_res);
 }
 
+static const struct eic7700_dwmac_data eic7700_dwmac_data = {
+	.rgmii_rx_clk_invert = false,
+};
+
+static const struct eic7700_dwmac_data eic7700_dwmac_data_clk_inversion = {
+	.rgmii_rx_clk_invert = true,
+};
+
 static const struct of_device_id eic7700_dwmac_match[] = {
-	{ .compatible = "eswin,eic7700-qos-eth" },
+	{	.compatible = "eswin,eic7700-qos-eth",
+		.data = &eic7700_dwmac_data,
+	},
+	{
+		.compatible = "eswin,eic7700-qos-eth-clk-inversion",
+		.data = &eic7700_dwmac_data_clk_inversion,
+	},
 	{ }
 };
 MODULE_DEVICE_TABLE(of, eic7700_dwmac_match);
-- 
2.25.1


