Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E40AEC369C9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Apr 2025 17:36:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aTp3apWKdtVXSepo83cIFV0LN+laPuM1G8F4Zxr1ELk=; b=vrPu3bds/pMPPoTJocCzW1HALA
	WfurCjJDq0e112+o8VZz7VDzvgXZD5AGbQdhQrkz+DewFRMTNVST0xyNx6MssTuXcNA72yRriCM08
	dUfDyFAgtIRHmLUbW0JLseNUCApzWleS/WixK+WrZxId40eOG6T4KkzSs3W/AfcRduOWNuYnjfiVs
	1TbF10fTEC+NM41Qtqa0hVDUByLs9SF4ZcW9W2gVZBdlm0oa/LRs2cEbSA/wiK/8NcvXMt8m4d0ZX
	1yXLeGASC2RhxBU4MIARdXvgFetATuWNs1PjIuWgbswDi9Po6FQ0I8RIZt73m52RIso7rU2SuIHAn
	8KirsjEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5TA4-0000000DsaZ-1Fx7;
	Thu, 17 Apr 2025 17:36:28 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5SqP-0000000Do0r-3nU5
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 17 Apr 2025 17:16:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description;
	bh=aTp3apWKdtVXSepo83cIFV0LN+laPuM1G8F4Zxr1ELk=; b=GGSD7FailZDS6Cq5p/ZcDBr/47
	3ybYyIBaWn6UJGsFbID+4g67FIEOsiGTjAaajHp2KgVr8VPTsr9tPg3OiFSuO3BeMnhWnvmg1Tv2V
	EXlc33rkb4Maaiuw7aQrg//bzKmrkkak+0RsLEwAR/n4Oh3DU/L1KbN+1KZJvP8LSZ+uKjqfM9VT7
	xicXPgRGRNol1YYauI7xo3E1SumC7+B8lEDL87jzZ7iHzC/T5+QjVSHmJpb+o5hX7RilpOR4iIAnM
	qJqDstswhLvfYUINY3WCt2+iAMdKg/m435CRUBvCo4Vx1Ogqra3fSZa0Jojw8m+kyBr1k83zWxTwt
	KMzEixhg==;
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u5SqM-0000000AL6j-3PkV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Apr 2025 17:16:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=aTp3apWKdtVXSepo83cIFV0LN+laPuM1G8F4Zxr1ELk=; b=nUZQyTokrg0CL2fzLiTm6Tm+sB
	gGoSVwKKHRQb4N3nJMxV6JCJOzfVMpmOv6dpE2NeI40pUo3QDvfXO+yauheknpVSnKFtkMYwAY9Ao
	10Zru9d8v2rN7wGXYbPlHhXLVWA4Njn9xEYfLlI2nlE9pd8k0oCiNOd6LccoEGFdxCffNMtfunUDE
	pRD0LwV0GnA9vfaOn4c5VuNa9eRKnUiDNgwahRO0j/C6IXzsKa8DecUjYEsh+AtyDtpgDaI2il8yv
	8x91NJ/hTF2bkwzE9wuQ4hDN8zxm02Ff38RGBVkvviENKdy8x7oXJDLpToRKFBdmzMx9n5lcF8FLe
	UAVVY/Eg==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:53518 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1u5SoK-0007gx-0o;
	Thu, 17 Apr 2025 18:14:00 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1u5Sni-001IJk-Gi; Thu, 17 Apr 2025 18:13:22 +0100
In-Reply-To: <aAE2tKlImhwKySq_@shell.armlinux.org.uk>
References: <aAE2tKlImhwKySq_@shell.armlinux.org.uk>
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
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH net-next v3 3/5] net: stmmac: socfpga: convert to
 stmmac_pltfr_pm_ops
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1u5Sni-001IJk-Gi@rmk-PC.armlinux.org.uk>
Date: Thu, 17 Apr 2025 18:13:22 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_181606_916273_E32D092A 
X-CRM114-Status: GOOD (  11.94  )
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
 .../ethernet/stmicro/stmmac/dwmac-socfpga.c   | 37 +------------------
 1 file changed, 2 insertions(+), 35 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
index c333ec07d15f..69ffc52c0275 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
@@ -493,6 +493,7 @@ static int socfpga_dwmac_probe(struct platform_device *pdev)
 
 	plat_dat->bsp_priv = dwmac;
 	plat_dat->fix_mac_speed = socfpga_dwmac_fix_mac_speed;
+	plat_dat->init = socfpga_dwmac_init;
 	plat_dat->pcs_init = socfpga_dwmac_pcs_init;
 	plat_dat->pcs_exit = socfpga_dwmac_pcs_exit;
 	plat_dat->select_pcs = socfpga_dwmac_select_pcs;
@@ -516,40 +517,6 @@ static int socfpga_dwmac_probe(struct platform_device *pdev)
 	return ret;
 }
 
-#ifdef CONFIG_PM_SLEEP
-static int socfpga_dwmac_resume(struct device *dev)
-{
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
@@ -570,7 +537,7 @@ static struct platform_driver socfpga_dwmac_driver = {
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


