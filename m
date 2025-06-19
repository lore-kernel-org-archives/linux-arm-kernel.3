Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EECE7C7EE2A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Jun 2025 15:44:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=AApn2ot00InFaDW5pjrmd9wr1a+/4qJM2q8x8u9VFeM=; b=FDTkOAhI1mGPws2bMM6zIvNbYv
	wzDdgO98F7tDiXAfRofDOqV7tK+IEBSK8kQW5H7rBRLC6qnR1i6hD58g0LgyPFlBIcbBlPzTGWJPM
	TjK9T+BdwiBKewtZFU3AAiOePYEnucK7wgX+RDUBcXMvCm9RTPiVXz1pignn8vW406lOmY3Cam8Gt
	FehcsunJJlhmOAlAAukWepyVtNtXBFrmlKBQfY8+8ARw3ZMrbaGpbgqjdiR7pULOVlILeHaM2/wbG
	qeImBiSo5wK+3OzJT83JW29is/iUrmH6BvJM4Frh/DFf6POqDNrYeCgtaOMV3rfJPD/zilbV74rNw
	M6//mwMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSHRU-0000000DRRl-3tNV;
	Thu, 19 Jun 2025 15:44:44 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSBsV-0000000CfDc-3A10
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Jun 2025 09:48:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:Reply-To:Content-ID
	:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
	Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=AApn2ot00InFaDW5pjrmd9wr1a+/4qJM2q8x8u9VFeM=; b=fdRbQF6MGkCqD0lNx0zAhb1Dqz
	W0tjVHZaO82AfU5sMTZ3dCl0inJV9nwPOx0IW42nB3xqZfYC1Mve+iKAYTU46+V2hMQ6xXHNEpNGt
	TZPtEfLnRZMDLTEdSQIjR5GgxcKB6rKMfgvxPAtCNMvOTeEoYm4Hjk8aQS/pI0Nxn7eaKhJJZIIlp
	V+vW3PAl0K6CoRtA2Pd2C1BndrqbF33ov76LDDxqhNbKfiRPbh+tnwFeIhKiybTaaBkoPnyX59PlR
	JyZh7hVsMQzH05c+d8QJ85xR8cH7zd0yO3YMN0sT//qZb/FlszBqolVK3yolSZGkjSrXFaaEEk7f6
	Gh7KVPTg==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:51446 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1uSBsM-0007jW-3D;
	Thu, 19 Jun 2025 10:48:07 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1uSBri-004fL5-FI; Thu, 19 Jun 2025 10:47:26 +0100
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
	Paolo Abeni <pabeni@redhat.com>,
	Vladimir Zapolskiy <vz@mleia.com>
Subject: [PATCH net-next] net: stmmac: lpc18xx: use plat_dat->phy_interface
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1uSBri-004fL5-FI@rmk-PC.armlinux.org.uk>
Date: Thu, 19 Jun 2025 10:47:26 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_024816_067844_D1571F20 
X-CRM114-Status: GOOD (  15.38  )
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

lpc18xx uses plat_dat->mac_interface, despite wanting to validate the
PHY interface. Checking the DT files (arch/arm/boot/dts/nxp/lpc/), none
of them specify mac-mode which means mac_interface and phy_interface
will be identical.

mac_interface is only used when there is some kind of MII converter
between the DesignWare MAC and PHY, and describes the interface mode
that the DW MAC needs to use, whereas phy_interface describes the
interface mode that the PHY uses.

Noting that lpc18xx only supports MII and RMII interface modes, switch
this glue driver to use plat_dat->phy_interface, and to mark that the
mac_interface is not used, explicitly set it to PHY_INTERFACE_MODE_NA.
The latter is safe as the only user of mac_interface for this platform
would be in stmmac_check_pcs_mode(), which only checks for RGMII or
SGMII.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-lpc18xx.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-lpc18xx.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-lpc18xx.c
index 22653ffd2a04..c0c44916f849 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-lpc18xx.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-lpc18xx.c
@@ -41,6 +41,7 @@ static int lpc18xx_dwmac_probe(struct platform_device *pdev)
 	if (IS_ERR(plat_dat))
 		return PTR_ERR(plat_dat);
 
+	plat_dat->mac_interface = PHY_INTERFACE_MODE_NA;
 	plat_dat->has_gmac = true;
 
 	reg = syscon_regmap_lookup_by_compatible("nxp,lpc1850-creg");
@@ -49,9 +50,9 @@ static int lpc18xx_dwmac_probe(struct platform_device *pdev)
 		return PTR_ERR(reg);
 	}
 
-	if (plat_dat->mac_interface == PHY_INTERFACE_MODE_MII) {
+	if (plat_dat->phy_interface == PHY_INTERFACE_MODE_MII) {
 		ethmode = LPC18XX_CREG_CREG6_ETHMODE_MII;
-	} else if (plat_dat->mac_interface == PHY_INTERFACE_MODE_RMII) {
+	} else if (plat_dat->phy_interface == PHY_INTERFACE_MODE_RMII) {
 		ethmode = LPC18XX_CREG_CREG6_ETHMODE_RMII;
 	} else {
 		dev_err(&pdev->dev, "Only MII and RMII mode supported\n");
-- 
2.30.2


