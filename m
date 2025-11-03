Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 592CECCF9FE
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 11:50:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CbjiE3yRrQYHEu8s8D+tBXPqnkwgsI3CtvhQkXXPRzA=; b=s7sLxtcE5pk7hY/OkPte/WMYff
	xyz0ltzwqVZB8YKt3IYMBb1eY5PRjaLv/5wo8mP/BJxM4BSdxKlUxQkZYCL9TprMfrvWIt/1AulYz
	BXXCKllF3a9JWSDlHa1ZWmmDhnWZZaxtqNeDGWr3YihtEBB0SxbLZy1fsT+s0HJXDqmMzE2CQa11r
	90F/6xA4mK8RyjJ+HwkFdj0SSi+1+VZ1rV/8Haxd/ze5YUBTKmdNBPitAlSzvzBNggoe2AZcE9OS0
	TcSTeaAlHRAt0d0m9myb7VSxiqHNzpbqSJ9yhzRuTy4yVIWZRsaR4uArH7FCJSJVseHLlFk/7dqc3
	QBMRyi+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFt4s-00000009m6C-1RSe;
	Mon, 03 Nov 2025 11:50:26 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFt4n-00000009m2j-2Pq8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Nov 2025 11:50:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=CbjiE3yRrQYHEu8s8D+tBXPqnkwgsI3CtvhQkXXPRzA=; b=yITtMUXjG26H2n/Mr982LDhvyf
	WKaKSxb9G17jARSSsPhcBzmQfZHX72t5vsWFakEXzrUeSdAdYAl12hXv9WpkkQVgwEeYHAJmaphva
	IohLp+0Lb9nBcihPhl0cRm6yHmboGYW314eodCQtAPlu+59wUeQSnNKixWqkGs3/cmOLHKzzp6/B9
	S/IHGOep+9Px+rEq4G2F5sfbxfkvd5nVRQ9c+Gf1AqwwsCKHSpBbawKPlwogScTwgynQj2wkwF/5V
	T/vzBd1ORmuDHvH3BGOwrxnqoyLfsukbs9+aRpA0EmMtDnaJHhdaVxHEFgfScovqbR7+QQs3+SR4/
	ZcuirTVg==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:56282 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vFt4e-000000000g4-0oMe;
	Mon, 03 Nov 2025 11:50:12 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vFt4c-0000000Choe-3SII;
	Mon, 03 Nov 2025 11:50:10 +0000
In-Reply-To: <aQiWzyrXU_2hGJ4j@shell.armlinux.org.uk>
References: <aQiWzyrXU_2hGJ4j@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Fabio Estevam <festevam@gmail.com>,
	imx@lists.linux.dev,
	Jakub Kicinski <kuba@kernel.org>,
	Jan Petrous <jan.petrous@oss.nxp.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	s32@nxp.com,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>
Subject: [PATCH net-next 04/11] net: stmmac: add stmmac_get_phy_intf_sel()
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1vFt4c-0000000Choe-3SII@rmk-PC.armlinux.org.uk>
Date: Mon, 03 Nov 2025 11:50:10 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_035021_616738_47C1BC7F 
X-CRM114-Status: GOOD (  10.93  )
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

Provide a function to translate the PHY interface mode to the
phy_intf_sel pin configuration for dwmac1000 and dwmac4 cores that
support multiple interfaces. We currently handle MII, GMII, RGMII,
SGMII, RMII and REVMII, but not TBI, RTBI nor SMII as drivers do not
appear to use these three and the driver doesn't currently support
these.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac.h  |  1 +
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 20 +++++++++++++++++++
 2 files changed, 21 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac.h b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
index 3ea680cc63d8..0ea74c88a779 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac.h
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
@@ -396,6 +396,7 @@ void stmmac_ptp_register(struct stmmac_priv *priv);
 void stmmac_ptp_unregister(struct stmmac_priv *priv);
 int stmmac_xdp_open(struct net_device *dev);
 void stmmac_xdp_release(struct net_device *dev);
+int stmmac_get_phy_intf_sel(phy_interface_t interface);
 int stmmac_resume(struct device *dev);
 int stmmac_suspend(struct device *dev);
 void stmmac_dvr_remove(struct device *dev);
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 1e69c1a7dc6c..95d2cd020a0c 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -3082,6 +3082,26 @@ static void stmmac_check_ether_addr(struct stmmac_priv *priv)
 	}
 }
 
+int stmmac_get_phy_intf_sel(phy_interface_t interface)
+{
+	int phy_intf_sel = -EINVAL;
+
+	if (interface == PHY_INTERFACE_MODE_MII ||
+	    interface == PHY_INTERFACE_MODE_GMII)
+		phy_intf_sel = PHY_INTF_SEL_GMII_MII;
+	else if (phy_interface_mode_is_rgmii(interface))
+		phy_intf_sel = PHY_INTF_SEL_RGMII;
+	else if (interface == PHY_INTERFACE_MODE_SGMII)
+		phy_intf_sel = PHY_INTF_SEL_SGMII;
+	else if (interface == PHY_INTERFACE_MODE_RMII)
+		phy_intf_sel = PHY_INTF_SEL_RMII;
+	else if (interface == PHY_INTERFACE_MODE_REVMII)
+		phy_intf_sel = PHY_INTF_SEL_REVMII;
+
+	return phy_intf_sel;
+}
+EXPORT_SYMBOL_GPL(stmmac_get_phy_intf_sel);
+
 /**
  * stmmac_init_dma_engine - DMA init.
  * @priv: driver private structure
-- 
2.47.3


