Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7694C369C9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Apr 2025 17:34:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qs3bhE6uUgMBinRJFnKVkihDTKmcBoybWogUQr0C6RM=; b=4I6swjzbLWdBTYRkTD/gVcnB4f
	ujnBaH8oHm9S5QhtpPu59qvD0Tb0Q98g2MJrylkXTrqkWpsj7UqLmoUr/UR7F/3Pf+8KrOGsZe9me
	95ICvbgOR5KHRHrK9ZrHfbPao2aAkx+IB/sEqG1QZrtxP0Qe8X1rQVyzeR/EF+smYrJkvQIX8Po+I
	LULfYWhGPIGbXNnwq3rdMMvrvqH1O/V1L8iqEi0DFxDo+aqV+OiTWykhQ/bka/mjaebwzw7nSloyC
	o0I14ivyzLXcLxlyXT7hjMORk+wOdgkSHwnM8dKBmMcn6eZunDorcY5wUOp30y/t3Tf/WgWLD0TZU
	/soouosA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5T8E-0000000DsIk-1GIT;
	Thu, 17 Apr 2025 17:34:34 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5SqN-0000000Do0T-21YW
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 17 Apr 2025 17:16:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description;
	bh=Qs3bhE6uUgMBinRJFnKVkihDTKmcBoybWogUQr0C6RM=; b=ooqXd+Ml3lhRME6JhpdZ0SPzAY
	OfPAQLBDtUGhFlSs0aAPM5ori3HLTi9GXAcQk2CjLT3mmUnbV4Vz79GvkIsqmpBIndK4ZB+30QsUr
	+95K+IQYzPm09XoF7KivXeZnfXXjjpTC90T/uEyYIGfWoWDA3fXy1DtNbVx4GeYqiyn0c0i3u3msR
	mdZc/ulQY72+wSjtbHAqX354FXU2wTo/raZxHeLVLTbcWj99x2Jdp/FTsfIzZbor75fDf9NzsBQ+W
	HwKqeu0m85nbCYHYAQNigaMMGsT3xAW0vw+F3QyskrhhOakIw05w6aS1aTuxoQgeKX1Bn72g+xAZv
	gtMwrgZw==;
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u5SqJ-0000000AL5z-16O3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Apr 2025 17:16:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Qs3bhE6uUgMBinRJFnKVkihDTKmcBoybWogUQr0C6RM=; b=NoEUGe70RGA9XXGB8WOyb+PB7P
	ts5AUJttVBh5m5nLbni3h0BvuiDSANV54/dPm/h0R9EK5tFjWHAEaIOUGhfjdcZR2rkF+RYo62z50
	MIMAbBKp0UavvuqbSN28aipbqzHfiSf3GKYnGkwiRkYxCH7EF6aKqpmO638Yi6+Sgi0IBs1tgOK9q
	hdfqP0qO0oebZwnGkj3wEH4npo4/PbF6y7UUcaxvrMeaYiXcqfDhvPkg9wTUB7EaaW+hL28TcauA/
	aiC71/0mii/t1CmEh1UnfwCqP0OiMYcsJvOXTvgttCo4gfwR5gBII7/PIJa4prHQ/tvTcUqT2TOmH
	pvcWYkbg==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:48402 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1u5SoE-0007gf-3D;
	Thu, 17 Apr 2025 18:13:55 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1u5Snd-001IJe-Cx; Thu, 17 Apr 2025 18:13:17 +0100
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
Subject: [PATCH net-next v3 2/5] net: stmmac: socfpga: provide init function
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1u5Snd-001IJe-Cx@rmk-PC.armlinux.org.uk>
Date: Thu, 17 Apr 2025 18:13:17 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_181603_392587_2ACB6DCD 
X-CRM114-Status: GOOD (  11.55  )
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

Both the resume and probe path needs to configure the phy mode, so
provide a common function to do this which can later be hooked into
plat_dat->init.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
index bcdb25ee2a33..c333ec07d15f 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
@@ -435,6 +435,13 @@ static struct phylink_pcs *socfpga_dwmac_select_pcs(struct stmmac_priv *priv,
 	return priv->hw->phylink_pcs;
 }
 
+static int socfpga_dwmac_init(struct platform_device *pdev, void *bsp_priv)
+{
+	struct socfpga_dwmac *dwmac = bsp_priv;
+
+	return dwmac->ops->set_phy_mode(dwmac);
+}
+
 static int socfpga_dwmac_probe(struct platform_device *pdev)
 {
 	struct plat_stmmacenet_data *plat_dat;
@@ -497,7 +504,7 @@ static int socfpga_dwmac_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	ret = ops->set_phy_mode(dwmac);
+	ret = socfpga_dwmac_init(pdev, dwmac);
 	if (ret)
 		goto err_dvr_remove;
 
@@ -512,11 +519,9 @@ static int socfpga_dwmac_probe(struct platform_device *pdev)
 #ifdef CONFIG_PM_SLEEP
 static int socfpga_dwmac_resume(struct device *dev)
 {
-	struct net_device *ndev = dev_get_drvdata(dev);
-	struct stmmac_priv *priv = netdev_priv(ndev);
 	struct socfpga_dwmac *dwmac_priv = get_stmmac_bsp_priv(dev);
 
-	dwmac_priv->ops->set_phy_mode(priv->plat->bsp_priv);
+	socfpga_dwmac_init(to_platform_device(dev), dwmac_priv);
 
 	return stmmac_resume(dev);
 }
-- 
2.30.2


