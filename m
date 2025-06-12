Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7F8AC61CE8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 19:45:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cZnvOnHtbSmTRkDQY5OMcUHswqrZh6xf9n5dNyGk7Nw=; b=CD2uuYJeqbVybX+2uuFheknN9m
	J8GO7Fv4UAug8Cm5xvJSC6Yuw+GYhuHM1JkumW3Y53zTXi8HKwKTGqm+pOrvYdJOIJrGTz68+S7kx
	VXlDoWJu+pcSrM2oKl7kNzHZCeWB/S4XgCv1GcMn7y0S8ebIAwqtl5nqYZU2EdNw65YpLrNYEXmUi
	MlPYMnz8aw3VGcExwnxmqh6OsADD3yZwpP3YPFP1BpZxGMljb/8wspEniAPBjPAGuUSaEcY5aw2pV
	4Hnvxis1X3xmzWQLjZNs8q0buP2WPgq2kGf2C++wFS3SratcpUnLho8T9kpD0XfegwDe4vuDmMnKk
	OWV6DG7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPnrW-0000000EKVW-424K;
	Thu, 12 Jun 2025 19:45:22 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPk47-0000000DpII-0tny
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Jun 2025 15:42:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=cZnvOnHtbSmTRkDQY5OMcUHswqrZh6xf9n5dNyGk7Nw=; b=sHIPscLDJe2PxlFKqqldN0N61g
	9eMwdItQ/K45eKRVOY9dFpQYtJYYO6gHd6+qgOD4kbdXK0fxqMRvX9kt0bQiIE2cuSKLJaBxaDchy
	YauesJ/+zfnj+mr6OuJ4fJ7kk9cZOcEKDJyxveXbeQ2Rxvau7NNTYQBoRlcTdgNd3f335LmmNCBXp
	YtB0ImDWdzH87emHvyHdeCati/P/swpV0q3xhbe5OpnFbpfxLmrMu2LPLB7lnFjLsCKGzD4bLAvw9
	vSS1RHTq3OQ2CX8wQ92N3s7OICM48tcD3GSoZaVjWZ/WG65b3h4qjLMnbkbCJ3KJDgwZWyWv9SlCh
	6P2jOglg==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:44308 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1uPk42-00085O-2N;
	Thu, 12 Jun 2025 16:42:02 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1uPk3O-004CFx-Ir; Thu, 12 Jun 2025 16:41:22 +0100
In-Reply-To: <aEr1BhIoC6-UM2XV@shell.armlinux.org.uk>
References: <aEr1BhIoC6-UM2XV@shell.armlinux.org.uk>
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
Subject: [PATCH net-next 9/9] net: stmmac: rk: remove obsolete .set_*_speed()
 methods
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1uPk3O-004CFx-Ir@rmk-PC.armlinux.org.uk>
Date: Thu, 12 Jun 2025 16:41:22 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_084207_252971_1C1AD24E 
X-CRM114-Status: GOOD (  13.87  )
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

Now that no SoC implements the .set_*_speed() methods, we can get rid
of these methods and the now unused code in rk_set_clk_tx_rate().
Arrange for the function to return an error when the .set_speed()
method is not implemented.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../net/ethernet/stmicro/stmmac/dwmac-rk.c    | 21 +------------------
 1 file changed, 1 insertion(+), 20 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
index 7cdb09037da0..18ae12df4a85 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
@@ -37,8 +37,6 @@ struct rk_gmac_ops {
 	void (*set_to_rgmii)(struct rk_priv_data *bsp_priv,
 			     int tx_delay, int rx_delay);
 	void (*set_to_rmii)(struct rk_priv_data *bsp_priv);
-	void (*set_rgmii_speed)(struct rk_priv_data *bsp_priv, int speed);
-	void (*set_rmii_speed)(struct rk_priv_data *bsp_priv, int speed);
 	int (*set_speed)(struct rk_priv_data *bsp_priv,
 			 phy_interface_t interface, int speed);
 	void (*set_clock_selection)(struct rk_priv_data *bsp_priv, bool input,
@@ -1707,29 +1705,12 @@ static int rk_set_clk_tx_rate(void *bsp_priv_, struct clk *clk_tx_i,
 			      phy_interface_t interface, int speed)
 {
 	struct rk_priv_data *bsp_priv = bsp_priv_;
-	struct device *dev = &bsp_priv->pdev->dev;
 
 	if (bsp_priv->ops->set_speed)
 		return bsp_priv->ops->set_speed(bsp_priv, bsp_priv->phy_iface,
 						speed);
 
-	switch (bsp_priv->phy_iface) {
-	case PHY_INTERFACE_MODE_RGMII:
-	case PHY_INTERFACE_MODE_RGMII_ID:
-	case PHY_INTERFACE_MODE_RGMII_RXID:
-	case PHY_INTERFACE_MODE_RGMII_TXID:
-		if (bsp_priv->ops->set_rgmii_speed)
-			bsp_priv->ops->set_rgmii_speed(bsp_priv, speed);
-		break;
-	case PHY_INTERFACE_MODE_RMII:
-		if (bsp_priv->ops->set_rmii_speed)
-			bsp_priv->ops->set_rmii_speed(bsp_priv, speed);
-		break;
-	default:
-		dev_err(dev, "unsupported interface %d", bsp_priv->phy_iface);
-	}
-
-	return 0;
+	return -EINVAL;
 }
 
 static int rk_gmac_probe(struct platform_device *pdev)
-- 
2.30.2


