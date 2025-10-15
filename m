Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E49FDCCD194
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Oct 2025 16:10:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rD9sxXXcMPCdPzJUHRNkbrU7OVhc+3FqTiQbvaq4qKA=; b=rVR93XkbDqU2IHVsi3B9UtUtGs
	EjLyUXBkw7X6meZC9dCqfraDtglrOQOaOSFm2bxMD95Dkv+E9D4PFxpz1Zfy7IaHEgzr24VgD8ewU
	Be70hnYusFqjryvroPBZI8n2wHZyno5fbCr7k72lYl/uTPVnoUUy6/PIEKwl2O7jmItdpw/76nL23
	KKdt4nmvbMShDdXMEydjW90MosFBP8vgPrKn8GVi2tNdr/Tdsww/RSAJtaxR/ckCfHOSM3i3vA9lD
	2V9kWyaIsqHwpCj9cqySnMH/JocWSHMTLUDVamum+4V3SuuQp0kKOOq3v/cbhJ6gSnMu5SxZpIuZO
	iB8yjbcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v945S-00000002FAK-1Mns;
	Wed, 15 Oct 2025 16:10:50 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v945Q-00000002F9V-2nT4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Oct 2025 16:10:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=rD9sxXXcMPCdPzJUHRNkbrU7OVhc+3FqTiQbvaq4qKA=; b=zPIbxYT2T4pXpUpYZgf1evBIL8
	jisw/dzamHSTXVee/35trO3vQnd3oafAsZiH55/E+MYSdOA4nrwS4e/EguiWjg+ujbT3FRgIM015L
	/Ngz4fuS/DOBdbbkr5hDM6cQN7bCrP5hOBLDo36YmJpeAfqGbZVH004xz9Rw7PbeJ80O1bqYOwQCf
	bKmqkoV38Vx0QwNGVnusn3scCNtUGvDpk8+fKM7rR/7ly73pZM2fITEA7QwNnV84lHKjJT2JHBf65
	jdDp6KfWRN6zMXngWSbF7uLPtEmuuveTEzYr3Ny0NhMzOGWl0Vr2Q9pRy19j1ldNDxeY8f9MnqM2o
	C70FcEDQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:38608 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1v945K-0000000059q-0yvh;
	Wed, 15 Oct 2025 17:10:42 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1v945J-0000000AmeJ-1GOb;
	Wed, 15 Oct 2025 17:10:41 +0100
In-Reply-To: <aO_HIwT_YvxkDS8D@shell.armlinux.org.uk>
References: <aO_HIwT_YvxkDS8D@shell.armlinux.org.uk>
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
Subject: [PATCH net-next 1/5] net: stmmac: dwc-qos-eth: move MDIO bus locking
 into stmmac_mdio
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1v945J-0000000AmeJ-1GOb@rmk-PC.armlinux.org.uk>
Date: Wed, 15 Oct 2025 17:10:41 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_091048_727675_B9F2D78F 
X-CRM114-Status: GOOD (  11.87  )
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

Rather than dwc-qos-eth manipulating the MDIO bus lock directly, add
helpers to the stmmac MDIO layer and use them in dwc-qos-eth. This
improves my commit 87f43e6f06a2 ("net: stmmac: dwc-qos: calibrate tegra
with mdio bus idle").

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c    |  4 ++--
 drivers/net/ethernet/stmicro/stmmac/stmmac.h       |  2 ++
 drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c  | 14 ++++++++++++++
 3 files changed, 18 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c
index e8539cad4602..f1c2e35badf7 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c
@@ -162,7 +162,7 @@ static void tegra_eqos_fix_speed(void *bsp_priv, int speed, unsigned int mode)
 		priv = netdev_priv(dev_get_drvdata(eqos->dev));
 
 		/* Calibration should be done with the MDIO bus idle */
-		mutex_lock(&priv->mii->mdio_lock);
+		stmmac_mdio_lock(priv);
 
 		/* calibrate */
 		value = readl(eqos->regs + SDMEMCOMPPADCTRL);
@@ -198,7 +198,7 @@ static void tegra_eqos_fix_speed(void *bsp_priv, int speed, unsigned int mode)
 		value &= ~SDMEMCOMPPADCTRL_PAD_E_INPUT_OR_E_PWRD;
 		writel(value, eqos->regs + SDMEMCOMPPADCTRL);
 
-		mutex_unlock(&priv->mii->mdio_lock);
+		stmmac_mdio_unlock(priv);
 	} else {
 		value = readl(eqos->regs + AUTO_CAL_CONFIG);
 		value &= ~AUTO_CAL_CONFIG_ENABLE;
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac.h b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
index 7ca5477be390..ec8bddc1c37f 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac.h
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
@@ -388,6 +388,8 @@ static inline bool stmmac_wol_enabled_phy(struct stmmac_priv *priv)
 int stmmac_mdio_unregister(struct net_device *ndev);
 int stmmac_mdio_register(struct net_device *ndev);
 int stmmac_mdio_reset(struct mii_bus *mii);
+void stmmac_mdio_lock(struct stmmac_priv *priv);
+void stmmac_mdio_unlock(struct stmmac_priv *priv);
 int stmmac_pcs_setup(struct net_device *ndev);
 void stmmac_pcs_clean(struct net_device *ndev);
 void stmmac_set_ethtool_ops(struct net_device *netdev);
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
index f408737f6fc7..d62b2870899d 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
@@ -734,3 +734,17 @@ int stmmac_mdio_unregister(struct net_device *ndev)
 
 	return 0;
 }
+
+void stmmac_mdio_lock(struct stmmac_priv *priv)
+{
+	if (priv->mii)
+		mutex_lock(&priv->mii->mdio_lock);
+}
+EXPORT_SYMBOL_GPL(stmmac_mdio_lock);
+
+void stmmac_mdio_unlock(struct stmmac_priv *priv)
+{
+	if (priv->mii)
+		mutex_unlock(&priv->mii->mdio_lock);
+}
+EXPORT_SYMBOL_GPL(stmmac_mdio_unlock);
-- 
2.47.3


