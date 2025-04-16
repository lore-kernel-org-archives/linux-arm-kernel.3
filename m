Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15511C369BD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Apr 2025 10:32:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VbzIJjZ9JRmtU3xRpmTgeptOfjJrc8wP+yXsF4MdjLc=; b=JYJSFsuY7dL39QpQrcIycSFTE9
	3qhbD+3YZ1AKuWQQ9VTA2L+KWOpSy8ijPoF/jdM9kwGYJrqJ14FTqKsLNNonO7X8k64gWqRjNyOIm
	ygxFf1r8SVEqY5biYglU8ut65kYRQO7puUMITLa+12gs7FS4zTOgrGnjLYHSrg00DQOjHX/dmDJSy
	MMRRY0uWC4CC+i37hnerHb9pcJVxnn6paYKtug3Y3/bf34ZMXxNgGL1l8hqyysFiihVSyvY8hx4MN
	vChLEaxR+OrmjsdSSAV3Nh1a+3jfNzA/t3mTRAHxdIWjWBZ8sUEdNHnoAjt/aJq4T0rigGqHfB3wg
	kDznXPhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u503x-00000009Anc-1m9H;
	Wed, 16 Apr 2025 10:32:13 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4z7w-00000008z7i-42XP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Apr 2025 09:32:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=VbzIJjZ9JRmtU3xRpmTgeptOfjJrc8wP+yXsF4MdjLc=; b=hOvvGwKaNJrI53vdcENdKi+/f/
	yli82WgrZJstnsuP4VqAc1IK1x10JwdCgV1ozWc0ly0BmMLKVC4W++4qs6v2OHa0ln86L16N7CgBj
	Cn20lqaGxOT8YlqVm0jS14Ohj+zDZZfvAq4ZOE97Jnia6MvmpKkyzMrfTH48ae/v1b0jkJLYebYgj
	1EqxIifcWd41+XtKhGLwzrxSk0BCx8AEOtCcTO1j/PEFwZ9t6SpuoIrY9/tT8ko4zgYauOb8i3cXq
	Sk/3sMt5wJAG8M+3+xSc+nAsxZybhnM4+HMzOMaVEIE0XcWZOm4Tqo0sVYQ4s0yFAX8ZLfH4q3n4J
	D2tMWjgA==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:38772 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1u4z7q-0000z3-24;
	Wed, 16 Apr 2025 10:32:10 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1u4z7F-000xBo-26; Wed, 16 Apr 2025 10:31:33 +0100
In-Reply-To: <Z_95AM64tt_4ri1j@shell.armlinux.org.uk>
References: <Z_95AM64tt_4ri1j@shell.armlinux.org.uk>
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
Subject: [PATCH net-next v2 3/5] net: stmmac: socfpga: convert to
 stmmac_pltfr_pm_ops
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1u4z7F-000xBo-26@rmk-PC.armlinux.org.uk>
Date: Wed, 16 Apr 2025 10:31:33 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_023216_994163_15904958 
X-CRM114-Status: GOOD (  12.44  )
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

Convert socfpga to use the generic stmmac_pltfr_pm_ops, which can be
achieved by adding an appropriate plat_dat->init function to do the
setup.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../ethernet/stmicro/stmmac/dwmac-socfpga.c   | 39 +------------------
 1 file changed, 2 insertions(+), 37 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
index 000d349a6d4c..69ffc52c0275 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
@@ -493,6 +493,7 @@ static int socfpga_dwmac_probe(struct platform_device *pdev)
 
 	plat_dat->bsp_priv = dwmac;
 	plat_dat->fix_mac_speed = socfpga_dwmac_fix_mac_speed;
+	plat_dat->init = socfpga_dwmac_init;
 	plat_dat->pcs_init = socfpga_dwmac_pcs_init;
 	plat_dat->pcs_exit = socfpga_dwmac_pcs_exit;
 	plat_dat->select_pcs = socfpga_dwmac_select_pcs;
@@ -516,42 +517,6 @@ static int socfpga_dwmac_probe(struct platform_device *pdev)
 	return ret;
 }
 
-#ifdef CONFIG_PM_SLEEP
-static int socfpga_dwmac_resume(struct device *dev)
-{
-	struct net_device *ndev = dev_get_drvdata(dev);
-	struct stmmac_priv *priv = netdev_priv(ndev);
-	struct socfpga_dwmac *dwmac_priv = get_stmmac_bsp_priv(dev);
-
-	socfpga_dwmac_init(to_platform_device(dev), dwmac_priv);
-
-	return stmmac_resume(dev);
-}
-#endif /* CONFIG_PM_SLEEP */
-
-static int __maybe_unused socfpga_dwmac_runtime_suspend(struct device *dev)
-{
-	struct net_device *ndev = dev_get_drvdata(dev);
-	struct stmmac_priv *priv = netdev_priv(ndev);
-
-	stmmac_bus_clks_config(priv, false);
-
-	return 0;
-}
-
-static int __maybe_unused socfpga_dwmac_runtime_resume(struct device *dev)
-{
-	struct net_device *ndev = dev_get_drvdata(dev);
-	struct stmmac_priv *priv = netdev_priv(ndev);
-
-	return stmmac_bus_clks_config(priv, true);
-}
-
-static const struct dev_pm_ops socfpga_dwmac_pm_ops = {
-	SET_SYSTEM_SLEEP_PM_OPS(stmmac_suspend, socfpga_dwmac_resume)
-	SET_RUNTIME_PM_OPS(socfpga_dwmac_runtime_suspend, socfpga_dwmac_runtime_resume, NULL)
-};
-
 static const struct socfpga_dwmac_ops socfpga_gen5_ops = {
 	.set_phy_mode = socfpga_gen5_set_phy_mode,
 };
@@ -572,7 +537,7 @@ static struct platform_driver socfpga_dwmac_driver = {
 	.remove = stmmac_pltfr_remove,
 	.driver = {
 		.name           = "socfpga-dwmac",
-		.pm		= &socfpga_dwmac_pm_ops,
+		.pm		= &stmmac_pltfr_pm_ops,
 		.of_match_table = socfpga_dwmac_match,
 	},
 };
-- 
2.30.2


