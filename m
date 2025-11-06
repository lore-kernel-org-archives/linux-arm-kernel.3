Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03B05CCFA05
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 11:23:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Pm3M/GkwAlHdRzJaOCKAH5BeWyh6teUGh1ibpL2tD7I=; b=uhDfeR9qLQiu3tjgCAA+CqmqCj
	Bu1D5kRh/6uaHdL6XQV14mcCCd3E6w7Kn0gzg7yJdxtoPQ+n1uZ7Wlg51lmvnoEBkZhz+CQ/219jK
	ouEAZxC+OTShtTmFt+miD1wst1vdYETqoHqObI9tBpV/rRPMP7QTK5Q+m/Yw6YZWMByAXDfcnUoe6
	OEjAXIkfSZbS74T7SzBzvPEzzHjWr+udGT116s315kMU9rVb8XoUBR80uoER3htYBuJZ5Ef8qJKBP
	c+oZHxioGWiW+r3llY5ycmLDtpChvsx4gc7SrOe9X+1e/qvuTXvabb9YuaJbwc8k0M3H/RUZGnDJc
	DjI1cJxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGy5c-0000000FNWp-1Pkn;
	Thu, 06 Nov 2025 11:23:40 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGy5a-0000000FNVO-2WOf
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Nov 2025 11:23:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Pm3M/GkwAlHdRzJaOCKAH5BeWyh6teUGh1ibpL2tD7I=; b=xCxiD2W5WoDjma1U32cRXi0Z98
	m7N1XQNJINfJqlct9VjhLk0lknOuakFec2B+HirRWbu5kLNbY7GwpiO1xpH3lOn19xkEFHO26twcX
	8Eunx0cWitlALSVMHFfz7F7dTd79Tq5ntzyumajWUHB7nm71gOC5uqqlwk9MZtOwb+Ir/+nh++xN5
	YHA+kEoNwoWCJt7XvEhxdmSpLOaTzxOuUBtE/I4dq+IPd7ovCVsNpOY2SDA4iCHPB7HJtT+hM3AN/
	+ekExdH2xvktv49yd3cjVgNZe83qqC27QFdRZcxcTtdKSuenle20S6Y0pwmX0H3AWFFfLlpPTT8gS
	whXK9X2g==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:53554 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vGy5V-000000004vP-0N8H;
	Thu, 06 Nov 2025 11:23:33 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vGy5U-0000000DhQP-19Hd;
	Thu, 06 Nov 2025 11:23:32 +0000
In-Reply-To: <aQyEs4DAZRWpAz32@shell.armlinux.org.uk>
References: <aQyEs4DAZRWpAz32@shell.armlinux.org.uk>
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
Subject: [PATCH net-next 5/9] net: stmmac: lpc18xx: use ->set_phy_intf_sel()
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1vGy5U-0000000DhQP-19Hd@rmk-PC.armlinux.org.uk>
Date: Thu, 06 Nov 2025 11:23:32 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_032338_644011_6C3D1088 
X-CRM114-Status: GOOD (  12.34  )
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

Move the configuration of the dwmac PHY interface selection to the new
->set_phy_intf_sel() method.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../ethernet/stmicro/stmmac/dwmac-lpc18xx.c   | 36 +++++++++++--------
 1 file changed, 22 insertions(+), 14 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-lpc18xx.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-lpc18xx.c
index ec60968113b8..c68d7de1f8ac 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-lpc18xx.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-lpc18xx.c
@@ -23,12 +23,27 @@
 #define LPC18XX_CREG_CREG6			0x12c
 # define LPC18XX_CREG_CREG6_ETHMODE_MASK	GENMASK(2, 0)
 
+static int lpc18xx_set_phy_intf_sel(void *bsp_priv, u8 phy_intf_sel)
+{
+	struct regmap *reg = bsp_priv;
+
+	if (phy_intf_sel != PHY_INTF_SEL_GMII_MII &&
+	    phy_intf_sel != PHY_INTF_SEL_RMII)
+		return -EINVAL;
+
+	regmap_update_bits(reg, LPC18XX_CREG_CREG6,
+			   LPC18XX_CREG_CREG6_ETHMODE_MASK,
+			   FIELD_PREP(LPC18XX_CREG_CREG6_ETHMODE_MASK,
+				      phy_intf_sel));
+
+	return 0;
+}
+
 static int lpc18xx_dwmac_probe(struct platform_device *pdev)
 {
 	struct plat_stmmacenet_data *plat_dat;
 	struct stmmac_resources stmmac_res;
-	struct regmap *reg;
-	u8 ethmode;
+	struct regmap *regmap;
 	int ret;
 
 	ret = stmmac_get_platform_resources(pdev, &stmmac_res);
@@ -41,21 +56,14 @@ static int lpc18xx_dwmac_probe(struct platform_device *pdev)
 
 	plat_dat->core_type = DWMAC_CORE_GMAC;
 
-	reg = syscon_regmap_lookup_by_compatible("nxp,lpc1850-creg");
-	if (IS_ERR(reg)) {
+	regmap = syscon_regmap_lookup_by_compatible("nxp,lpc1850-creg");
+	if (IS_ERR(regmap)) {
 		dev_err(&pdev->dev, "syscon lookup failed\n");
-		return PTR_ERR(reg);
-	}
-
-	ethmode = stmmac_get_phy_intf_sel(plat_dat->phy_interface);
-	if (ethmode != PHY_INTF_SEL_GMII_MII &&
-	    ethmode != PHY_INTF_SEL_RMII) {
-		dev_err(&pdev->dev, "Only MII and RMII mode supported\n");
-		return -EINVAL;
+		return PTR_ERR(regmap);
 	}
 
-	regmap_update_bits(reg, LPC18XX_CREG_CREG6,
-			   LPC18XX_CREG_CREG6_ETHMODE_MASK, ethmode);
+	plat_dat->bsp_priv = regmap;
+	plat_dat->set_phy_intf_sel = lpc18xx_set_phy_intf_sel;
 
 	return stmmac_dvr_probe(&pdev->dev, plat_dat, &stmmac_res);
 }
-- 
2.47.3


