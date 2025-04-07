Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79637C36018
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Apr 2025 19:16:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9nhON7d7ilA53RmXCxpTrqwKr6s5RmBvqbzbh5d99wA=; b=b+KNBYz3CHgnxdnaHiYYoE/DZV
	EKQ2D7YOQL+0ltv/IHUUq0fkUDgszbkycaatPnKcZ6j64KsgU4OaDuNx+fqN6YerMT7hAr7ARnSvz
	UQkR4m3mlwrP4wMIW0Sl68t4QEkkRMxAPFkv6qXdd/KCLGW0L7JhigGXri2DV007RvMUFqtoFO1UM
	O1X62fILUgwOinSW6VBKuirB+PO+WNJVQELIWHD0GhLn6hOqYs4dh/m6mQrIeX2uGSR1EaxaHWRMV
	St/9GKe3kCcylNuY0LlVBhM1YlfbsMybjpzkN6JshWZ5JwUeSJWuTTxV36k50TPyN/edGLgYmtT6+
	l4cnQA9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1rx6-00000001mGP-0rR5;
	Mon, 07 Apr 2025 19:16:12 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1rNW-00000001aWN-2ZBa
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Apr 2025 18:39:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=9nhON7d7ilA53RmXCxpTrqwKr6s5RmBvqbzbh5d99wA=; b=1RecS8ALc+mHMxlJNcMSQQHhel
	f2nJLUB2XfwBYx7xtIafEm0jwHCAWMysXqJod4EiSGsZ1C6cl8o3vWsJdUJBrk3n0Ac08O5/rE9d7
	dUTLKvEBagPE5Sk7P9GzV89jhI1VFaempRJ+r7nQHzW8sgXSFFft4Lp4SSXjHidvJ0BEZS+TZm3sz
	PsL1GMKpraPZEZJw0Ro7lK7AQMlvYSfsZB+JV7yaPa+JvSqSt+X7Ol61IbNsm67sn1UpgNBv0cWFF
	SIfwnFe4UZWhb9SOsUayyJo6CHh38eCqhTU14A7jwz0uscgQicVDIrwdDudYg6aWg5INDFerzKYVo
	W4SFbtgw==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:37868 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1u1rNR-0005rq-2x;
	Mon, 07 Apr 2025 19:39:21 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1u1rMv-0013ON-TJ; Mon, 07 Apr 2025 19:38:49 +0100
In-Reply-To: <Z_Qbw0tZ2ktgBf7c@shell.armlinux.org.uk>
References: <Z_Qbw0tZ2ktgBf7c@shell.armlinux.org.uk>
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
Subject: [PATCH net-next 2/2] net: stmmac: dwc-qos: use
 stmmac_pltfr_find_clk()
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1u1rMv-0013ON-TJ@rmk-PC.armlinux.org.uk>
Date: Mon, 07 Apr 2025 19:38:49 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_113926_647942_6E72DEDB 
X-CRM114-Status: GOOD (  11.27  )
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
 .../ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c    | 14 ++------------
 1 file changed, 2 insertions(+), 12 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c
index cd431f84f34f..f5c68e3b4354 100644
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
-- 
2.30.2


