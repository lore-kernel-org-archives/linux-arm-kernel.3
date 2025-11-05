Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A6FFCCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Nov 2025 13:27:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IaRml5eM8v0sO8/PyuoNQT9vv7q3YfUnikJJQRvPq9w=; b=yZE8xdfbKValBC2hP4HcJKdFrj
	OqBCdu+c89E4JFPT7CYAcPqwb6CAGaF/YviAk9pLEOssFb7G0xdmWApBT8xfjrQbg+2rGEvO1hjZC
	tO0zZ9gdVRWztQnlglErmJyhzGE86Thtc6hMD6xDM5nQHW+hCtl54oZ4+Y5bkKha9idgdXWR1mIX0
	1m0YkB1/VRaAnzp6wGLiUqqtWvjPA5s5wxNfgYlixXfSq52TumGwPazcMxjLKZtU2ae2kv56BS4++
	pWBPHVxN2V5+8PwKAdqzJhwVKRWpsK3VLOPKhSZubocKyNpfNBP3TH+e6lBWg7mK1j1KFIrONFHDE
	EP5POAEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGdXR-0000000DlvD-06lA;
	Wed, 05 Nov 2025 13:27:01 +0000
Received: from pandora.armlinux.org.uk ([78.32.30.218])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGdXN-0000000DlqL-0xkJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Nov 2025 13:26:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=IaRml5eM8v0sO8/PyuoNQT9vv7q3YfUnikJJQRvPq9w=; b=p8pPMRPgR+r4X3uf5qXbPOHmzu
	YNsrQTR0HXMBZsMZPWtexK5XBdTMdqu8kk+vuz3E0ujQa4abUbxmS+Hc/QwHeB51esHG5+BS+fBCI
	wLl3QM6pUavJOIOwAJ1EP9FcojTiWXmTF9lMIhls0wg28CAWbsP8o8WD9wV8PWAwRgU+7/dpMTNwe
	ffwC3Q1/SXmZYODSp5UfNempSS/eSOLL5OS2sjI3IWJA4ZlaPq7FxqbLNbJ8NHTvWWs4Fa3RovYZ3
	Xhr1lAi4X1HWKONwyc18ppsTA3/kaWBUs3b+FLv0SzjkBSR6b6wFsqN79XEnuV00qhkzrNFQDTolz
	vkyy1hlg==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:56816 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vGdXG-000000003Tj-2G5W;
	Wed, 05 Nov 2025 13:26:50 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vGdXE-0000000Clo4-3Yct;
	Wed, 05 Nov 2025 13:26:48 +0000
In-Reply-To: <aQtQYlEY9crH0IKo@shell.armlinux.org.uk>
References: <aQtQYlEY9crH0IKo@shell.armlinux.org.uk>
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
Subject: [PATCH net-next 08/11] net: stmmac: ingenic: simplify mac_set_mode()
 methods
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1vGdXE-0000000Clo4-3Yct@rmk-PC.armlinux.org.uk>
Date: Wed, 05 Nov 2025 13:26:48 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_052657_312052_14A05CDF 
X-CRM114-Status: UNSURE (   9.73  )
X-CRM114-Notice: Please train this message.
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

x1000, x1600 and x1830 only accept RMII mode. PHY_INTF_SEL_RMII is only
selected with PHY_INTERFACE_MODE_RMII, and PHY_INTF_SEL_RMII has been
validated by the SoC's .valid_phy_intf_sel bitmask. Thus, checking the
interface mode in these functions becomes unnecessary. Remove these.

jz4775 is similar, except for a greater set of PHY_INTF_SEL_x valies.
Also remove the switch statement here.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../ethernet/stmicro/stmmac/dwmac-ingenic.c   | 50 +------------------
 1 file changed, 2 insertions(+), 48 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-ingenic.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-ingenic.c
index 539513890db1..7b2576fbb1e1 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-ingenic.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-ingenic.c
@@ -75,22 +75,6 @@ static int jz4775_mac_set_mode(struct plat_stmmacenet_data *plat_dat,
 	struct ingenic_mac *mac = plat_dat->bsp_priv;
 	unsigned int val;
 
-	switch (plat_dat->phy_interface) {
-	case PHY_INTERFACE_MODE_MII:
-	case PHY_INTERFACE_MODE_GMII:
-	case PHY_INTERFACE_MODE_RMII:
-	case PHY_INTERFACE_MODE_RGMII:
-	case PHY_INTERFACE_MODE_RGMII_ID:
-	case PHY_INTERFACE_MODE_RGMII_TXID:
-	case PHY_INTERFACE_MODE_RGMII_RXID:
-		break;
-
-	default:
-		dev_err(mac->dev, "Unsupported interface %s\n",
-			phy_modes(plat_dat->phy_interface));
-		return -EINVAL;
-	}
-
 	val = FIELD_PREP(MACPHYC_PHY_INFT_MASK, phy_intf_sel) |
 	      FIELD_PREP(MACPHYC_TXCLK_SEL_MASK, MACPHYC_TXCLK_SEL_INPUT);
 
@@ -103,16 +87,6 @@ static int x1000_mac_set_mode(struct plat_stmmacenet_data *plat_dat,
 {
 	struct ingenic_mac *mac = plat_dat->bsp_priv;
 
-	switch (plat_dat->phy_interface) {
-	case PHY_INTERFACE_MODE_RMII:
-		break;
-
-	default:
-		dev_err(mac->dev, "Unsupported interface %s\n",
-			phy_modes(plat_dat->phy_interface));
-		return -EINVAL;
-	}
-
 	/* Update MAC PHY control register */
 	return regmap_update_bits(mac->regmap, 0, mac->soc_info->mask, 0);
 }
@@ -123,16 +97,6 @@ static int x1600_mac_set_mode(struct plat_stmmacenet_data *plat_dat,
 	struct ingenic_mac *mac = plat_dat->bsp_priv;
 	unsigned int val;
 
-	switch (plat_dat->phy_interface) {
-	case PHY_INTERFACE_MODE_RMII:
-		break;
-
-	default:
-		dev_err(mac->dev, "Unsupported interface %s\n",
-			phy_modes(plat_dat->phy_interface));
-		return -EINVAL;
-	}
-
 	val = FIELD_PREP(MACPHYC_PHY_INFT_MASK, phy_intf_sel);
 
 	/* Update MAC PHY control register */
@@ -145,18 +109,8 @@ static int x1830_mac_set_mode(struct plat_stmmacenet_data *plat_dat,
 	struct ingenic_mac *mac = plat_dat->bsp_priv;
 	unsigned int val;
 
-	switch (plat_dat->phy_interface) {
-	case PHY_INTERFACE_MODE_RMII:
-		val = FIELD_PREP(MACPHYC_MODE_SEL_MASK, MACPHYC_MODE_SEL_RMII);
-		break;
-
-	default:
-		dev_err(mac->dev, "Unsupported interface %s\n",
-			phy_modes(plat_dat->phy_interface));
-		return -EINVAL;
-	}
-
-	val |= FIELD_PREP(MACPHYC_PHY_INFT_MASK, phy_intf_sel);
+	val = FIELD_PREP(MACPHYC_MODE_SEL_MASK, MACPHYC_MODE_SEL_RMII) |
+	      FIELD_PREP(MACPHYC_PHY_INFT_MASK, phy_intf_sel);
 
 	/* Update MAC PHY control register */
 	return regmap_update_bits(mac->regmap, 0, mac->soc_info->mask, val);
-- 
2.47.3


