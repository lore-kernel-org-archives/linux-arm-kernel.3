Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49C83C021A4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Feb 2025 15:13:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7bkdFPh3F/SxPMUGrcqB5tVaUarkJGs2j9EyjS5IwjQ=; b=J2djummnOILiUKwsTnATYYGUoV
	+9ccJiyreuC7lGqnhMiP5gprlMNhBX3VlfpUC+DGnofhiKHTJhUaLIPeLvZSLEQaC+Cd0hw4Oz8CZ
	C9MvLJKBXppZIbsNbEUuA2djN8BNaBK/9MsMZ05mkRFIFNiMqvGPqlFCPU9MRcEQgNGA9pS5YGIDK
	0bKw2ouNUZCYPGE7vPUoHezSKNSWQziJdf6SWkol9U/MxNiwfu7na584B58tVgypL9nKqPW/jCtWH
	pBkjV7ox8SzODlbfHAvCt0e8s3oF0sydxR7xFz+VmSNEAS+GJjlzDqJxYJruOADj/uZqcqzwUpkwP
	u8ko9I2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tma91-0000000EEy8-0ShU;
	Mon, 24 Feb 2025 15:13:19 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmZkF-0000000EAJb-0zEA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Feb 2025 14:47:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=7bkdFPh3F/SxPMUGrcqB5tVaUarkJGs2j9EyjS5IwjQ=; b=L4pIOE0+EY9VmZjKw7eYs64Nce
	Ecr1xR1rz8Myfd5siPDTFzvdVWkqR0H2vtGYV2N8JLdJovxM2XSp9podWNjSntBn4Zix33neV3e8W
	YoHZCsZTslaHmf2cX75HPweusGxmMXzdjCEscCdJIa3KTDnwFYEvx7gv+ODyBVcoU4Rrli3hzRnAq
	0nzD08nnpjIsPmKpsPR65dDmi83/nLCczvE/wqIFCl6HPtqxL25Rwza7WERR6G7a8jmmNgT/gCR/S
	CNLYIaoMEBaX7L1zwD9vTiTXM4GUGmZWl2nZ9EtobUbh9eMVJBBAIORfV9djGeM+7+3zqTIu1FgNZ
	YUxEEpRw==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:42816 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1tmZkB-0006fx-0R;
	Mon, 24 Feb 2025 14:47:39 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1tmZjr-004uJP-82; Mon, 24 Feb 2025 14:47:19 +0000
In-Reply-To: <Z7yGdNuX2mYph8X8@shell.armlinux.org.uk>
References: <Z7yGdNuX2mYph8X8@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH net-next 2/2] net: stmmac: dwc-qos: clean up clock
 initialisation
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1tmZjr-004uJP-82@rmk-PC.armlinux.org.uk>
Date: Mon, 24 Feb 2025 14:47:19 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_064743_272905_9A60A7BC 
X-CRM114-Status: GOOD (  14.91  )
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

Clean up the clock initialisation by providing a helper to find a
named clock in the bulk clocks, and provide the name of the stmmac
clock in match data so we can locate the stmmac clock in generic
code.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../stmicro/stmmac/dwmac-dwc-qos-eth.c        | 32 +++++++++++--------
 1 file changed, 18 insertions(+), 14 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c
index acb0a2e1664f..45021dfaa787 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c
@@ -35,6 +35,16 @@ struct tegra_eqos {
 	struct gpio_desc *reset;
 };
 
+static struct clk *dwc_eth_find_clk(struct plat_stmmacenet_data *plat_dat,
+				    const char *name)
+{
+	for (int i = 0; i < plat_dat->num_clks; i++)
+		if (strcmp(plat_dat->clks[i].id, name) == 0)
+			return plat_dat->clks[i].clk;
+
+	return 0;
+}
+
 static int dwc_eth_dwmac_config_dt(struct platform_device *pdev,
 				   struct plat_stmmacenet_data *plat_dat)
 {
@@ -121,12 +131,7 @@ static int dwc_qos_probe(struct platform_device *pdev,
 			 struct plat_stmmacenet_data *plat_dat,
 			 struct stmmac_resources *stmmac_res)
 {
-	for (int i = 0; i < plat_dat->num_clks; i++) {
-		if (strcmp(plat_dat->clks[i].id, "apb_pclk") == 0)
-			plat_dat->stmmac_clk = plat_dat->clks[i].clk;
-		else if (strcmp(plat_dat->clks[i].id, "phy_ref_clk") == 0)
-			plat_dat->pclk = plat_dat->clks[i].clk;
-	}
+	plat_dat->pclk = dwc_eth_find_clk(plat_dat, "phy_ref_clk");
 
 	return 0;
 }
@@ -237,18 +242,12 @@ static int tegra_eqos_probe(struct platform_device *pdev,
 
 	eqos->dev = &pdev->dev;
 	eqos->regs = res->addr;
+	eqos->clk_slave = plat_dat->stmmac_clk;
 
 	if (!is_of_node(dev->fwnode))
 		goto bypass_clk_reset_gpio;
 
-	for (int i = 0; i < plat_dat->num_clks; i++) {
-		if (strcmp(plat_dat->clks[i].id, "slave_bus") == 0) {
-			eqos->clk_slave = plat_dat->clks[i].clk;
-			plat_dat->stmmac_clk = eqos->clk_slave;
-		} else if (strcmp(plat_dat->clks[i].id, "tx") == 0) {
-			eqos->clk_tx = plat_dat->clks[i].clk;
-		}
-	}
+	eqos->clk_tx = dwc_eth_find_clk(plat_dat, "tx");
 
 	eqos->reset = devm_gpiod_get(&pdev->dev, "phy-reset", GPIOD_OUT_HIGH);
 	if (IS_ERR(eqos->reset)) {
@@ -312,15 +311,18 @@ struct dwc_eth_dwmac_data {
 		     struct plat_stmmacenet_data *plat_dat,
 		     struct stmmac_resources *res);
 	void (*remove)(struct platform_device *pdev);
+	const char *stmmac_clk_name;
 };
 
 static const struct dwc_eth_dwmac_data dwc_qos_data = {
 	.probe = dwc_qos_probe,
+	.stmmac_clk_name = "apb_pclk",
 };
 
 static const struct dwc_eth_dwmac_data tegra_eqos_data = {
 	.probe = tegra_eqos_probe,
 	.remove = tegra_eqos_remove,
+	.stmmac_clk_name = "slave_bus",
 };
 
 static int dwc_eth_dwmac_probe(struct platform_device *pdev)
@@ -360,6 +362,8 @@ static int dwc_eth_dwmac_probe(struct platform_device *pdev)
 	if (ret)
 		return dev_err_probe(&pdev->dev, ret, "Failed to enable clocks\n");
 
+	plat_dat->stmmac_clk = dwc_eth_find_clk(plat_dat, data->stmmac_clk_name);
+
 	ret = data->probe(pdev, plat_dat, &stmmac_res);
 	if (ret < 0) {
 		dev_err_probe(&pdev->dev, ret, "failed to probe subdriver\n");
-- 
2.30.2


