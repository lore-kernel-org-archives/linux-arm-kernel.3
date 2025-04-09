Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74474C36002
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Apr 2025 08:20:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8/xV1cO2oXV+b6Bf/7SmXDB+ZKmv25NuBLYX/vUrYxc=; b=G7oADo73D7FjicJaPyW1xSceeV
	NbgT6NTiwgGniBN/0QjNvNFItMAtwHNTGHXAL4s2JMyShOxLJuy/LhyXvYxhKUaz6WXUY8+U8B9B6
	//nh068BuCoSxG+lMTFYOCzEM/ZW60UtXHYfZSmVFPFSvXrgxIU9sN4HAqbeptm1cMN7/VEOLIJEF
	8lXkCr1Pl51vgMWW4f1aCHAZS6Vj4HT+CoNhffRrDzidrCwFdyvIhgXCmlKwazsTSTchQtBfwJ3uG
	m9oAwESEpiM0sKnBRSX41+xJwW7Z+ENwLWDxsk7MeXrXiiPC2kBuU6NSxfajuTnZP7uuIrVzbBSv0
	qkueVv5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2QfL-00000006YZe-04ne;
	Wed, 09 Apr 2025 08:20:11 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2QQj-00000006Vos-02bO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Apr 2025 08:05:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=8/xV1cO2oXV+b6Bf/7SmXDB+ZKmv25NuBLYX/vUrYxc=; b=bfE9L77hrHJjWsg2AqAViMnX9S
	wwQqkHYlkwWowvtVlet1lLhxFkSHrLg3Et9ujnLIwKewuWLjiSpfBppTA3iuhEyc/JErOxBe/hICY
	/XE2gbvrCyqLxiW8mMlwD+oZIvurWpd4828MMpHQLnWaOQkDWE8DdaxuNmn7/PtsGG/pEj0vfCn2s
	77bqiSoh0iFcBFgyQQE1IadExhGiulwsLo8Bp0TLDxfOVscbA/UI6yocUG/SWciye7tO1aAqgJp64
	1AJVyZcR8+bF2FqRT/QxAfejVe8mAJFG/c9KWHHq1ykcxF1tb33y+Vd8sh6ldmVN0kLMuudt3P/ny
	sqnvG7bw==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:39196 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1u2QOf-0000Cq-2h;
	Wed, 09 Apr 2025 09:02:57 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1u2QO9-001Rp8-Ii; Wed, 09 Apr 2025 09:02:25 +0100
In-Reply-To: <Z_Yn3dJjzcOi32uU@shell.armlinux.org.uk>
References: <Z_Yn3dJjzcOi32uU@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Thierry Reding <treding@nvidia.com>
Subject: [PATCH net-next v2 2/2] net: stmmac: dwc-qos: use
 stmmac_pltfr_find_clk()
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1u2QO9-001Rp8-Ii@rmk-PC.armlinux.org.uk>
Date: Wed, 09 Apr 2025 09:02:25 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_010505_042747_06BB099B 
X-CRM114-Status: GOOD (  11.90  )
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

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../stmicro/stmmac/dwmac-dwc-qos-eth.c         | 18 ++++--------------
 1 file changed, 4 insertions(+), 14 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c
index cd431f84f34f..5db318327d33 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c
@@ -34,16 +34,6 @@ struct tegra_eqos {
 	struct gpio_desc *reset;
 };
 
-static struct clk *dwc_eth_find_clk(struct plat_stmmacenet_data *plat_dat,
-				    const char *name)
-{
-	for (int i = 0; i < plat_dat->num_clks; i++)
-		if (strcmp(plat_dat->clks[i].id, name) == 0)
-			return plat_dat->clks[i].clk;
-
-	return NULL;
-}
-
 static int dwc_eth_dwmac_config_dt(struct platform_device *pdev,
 				   struct plat_stmmacenet_data *plat_dat)
 {
@@ -132,7 +122,7 @@ static int dwc_qos_probe(struct platform_device *pdev,
 			 struct plat_stmmacenet_data *plat_dat,
 			 struct stmmac_resources *stmmac_res)
 {
-	plat_dat->pclk = dwc_eth_find_clk(plat_dat, "phy_ref_clk");
+	plat_dat->pclk = stmmac_pltfr_find_clk(plat_dat, "phy_ref_clk");
 
 	return 0;
 }
@@ -242,7 +232,7 @@ static int tegra_eqos_probe(struct platform_device *pdev,
 	if (!is_of_node(dev->fwnode))
 		goto bypass_clk_reset_gpio;
 
-	plat_dat->clk_tx_i = dwc_eth_find_clk(plat_dat, "tx");
+	plat_dat->clk_tx_i = stmmac_pltfr_find_clk(plat_dat, "tx");
 
 	eqos->reset = devm_gpiod_get(&pdev->dev, "phy-reset", GPIOD_OUT_HIGH);
 	if (IS_ERR(eqos->reset)) {
@@ -362,8 +352,8 @@ static int dwc_eth_dwmac_probe(struct platform_device *pdev)
 	if (ret)
 		return dev_err_probe(&pdev->dev, ret, "Failed to enable clocks\n");
 
-	plat_dat->stmmac_clk = dwc_eth_find_clk(plat_dat,
-						data->stmmac_clk_name);
+	plat_dat->stmmac_clk = stmmac_pltfr_find_clk(plat_dat,
+						     data->stmmac_clk_name);
 
 	if (data->probe)
 		ret = data->probe(pdev, plat_dat, &stmmac_res);
-- 
2.30.2


