Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A525CCCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Nov 2025 08:29:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WD62xUP/T2Mw7V+znRa1dwNt/ZSLS3fdpXY/nmG7E2I=; b=1KFtNokTex1Yv1hZjeF/KM3PBA
	fIABi+1zz4Kd5Irqd7TVDQukvvDlnsAY4GbG3bmMxHM6PBaf0DGJIWJJ5gbRpyt9bVKqzoIsfwvK0
	VahQ40wdapxsrCau8SiNVc8T5ONdggQfMtojY+YDWCBQEJ5BRxvQZrvfkvuiSXdWYTVJGn+IkBQBe
	pIgdBQrhHwWJOP7/3Puds+EdyJm8zSbv5TAgZop0w1RzDW0hxG7GKHUeP0/Sv0gAUAsZhEw/yzq8E
	FgKaB2iQlLINu9Luc2YFvX3A7ZHKGt5blZzCZolFVW+awDmkUxRKGcU72EerRcRAcevlZHU6lRjyw
	LsIEJ6ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHHqe-0000000GsiH-2uNt;
	Fri, 07 Nov 2025 08:29:32 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHHqc-0000000Gsdx-0EX9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Nov 2025 08:29:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=WD62xUP/T2Mw7V+znRa1dwNt/ZSLS3fdpXY/nmG7E2I=; b=znNfCcyVEG3EoEy5cOqpR9t9zr
	z5lOh1KluztqqLZQ4NUnKcJzTrJhBFIJ20clkLTe5b5GivO98D49sp2W9YkHrt6ktOKtDmvE8LnNN
	3Do23P0idblmgBtxbOSfZ8nXIiMgZP7Styh7RyLIo8GVykF68CnwLPI5VcMdmgtGzL6A3PeXOb2xP
	7ERH+byg1hfP/rxVtPdG2Pw8Nn90HQRNScwpD9NAyXEbYCCFu889LoatVuns7dGEupYzIkz5SG7DM
	Oa7pRm+PMDDq6htak4SvBGts7Q2f23UCH72oQEd/hjWpG5KCxcmgwfh+QlbCYuqMs7XonY025CB5D
	JyTbvyEw==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:33942 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vHHqU-000000006BL-20Ng;
	Fri, 07 Nov 2025 08:29:23 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vHHqT-0000000Djrh-0ka3;
	Fri, 07 Nov 2025 08:29:21 +0000
In-Reply-To: <aQ2tgEu-dudzlZlg@shell.armlinux.org.uk>
References: <aQ2tgEu-dudzlZlg@shell.armlinux.org.uk>
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
Subject: [PATCH net-next v3 10/11] net: stmmac: ingenic: pass ingenic_mac
 struct rather than plat_dat
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1vHHqT-0000000Djrh-0ka3@rmk-PC.armlinux.org.uk>
Date: Fri, 07 Nov 2025 08:29:21 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251107_002930_125417_26BB198D 
X-CRM114-Status: GOOD (  11.54  )
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

It no longer makes sense to pass a pointer to struct
plat_stmmacenet_data when calling the set_mode() methods to only use it
to get a pointer to the ingenic_mac structure that we already had in
the caller. Simplify this by passing the struct ingenic_mac pointer.

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../ethernet/stmicro/stmmac/dwmac-ingenic.c   | 25 ++++++-------------
 1 file changed, 7 insertions(+), 18 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-ingenic.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-ingenic.c
index eb5744e0b9ea..41a2071262bc 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-ingenic.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-ingenic.c
@@ -64,15 +64,13 @@ struct ingenic_soc_info {
 	enum ingenic_mac_version version;
 	u32 mask;
 
-	int (*set_mode)(struct plat_stmmacenet_data *plat_dat, u8 phy_intf_sel);
+	int (*set_mode)(struct ingenic_mac *mac, u8 phy_intf_sel);
 
 	u8 valid_phy_intf_sel;
 };
 
-static int jz4775_mac_set_mode(struct plat_stmmacenet_data *plat_dat,
-			       u8 phy_intf_sel)
+static int jz4775_mac_set_mode(struct ingenic_mac *mac, u8 phy_intf_sel)
 {
-	struct ingenic_mac *mac = plat_dat->bsp_priv;
 	unsigned int val;
 
 	val = FIELD_PREP(MACPHYC_PHY_INFT_MASK, phy_intf_sel) |
@@ -82,19 +80,14 @@ static int jz4775_mac_set_mode(struct plat_stmmacenet_data *plat_dat,
 	return regmap_update_bits(mac->regmap, 0, mac->soc_info->mask, val);
 }
 
-static int x1000_mac_set_mode(struct plat_stmmacenet_data *plat_dat,
-			      u8 phy_intf_sel)
+static int x1000_mac_set_mode(struct ingenic_mac *mac, u8 phy_intf_sel)
 {
-	struct ingenic_mac *mac = plat_dat->bsp_priv;
-
 	/* Update MAC PHY control register */
 	return regmap_update_bits(mac->regmap, 0, mac->soc_info->mask, 0);
 }
 
-static int x1600_mac_set_mode(struct plat_stmmacenet_data *plat_dat,
-			      u8 phy_intf_sel)
+static int x1600_mac_set_mode(struct ingenic_mac *mac, u8 phy_intf_sel)
 {
-	struct ingenic_mac *mac = plat_dat->bsp_priv;
 	unsigned int val;
 
 	val = FIELD_PREP(MACPHYC_PHY_INFT_MASK, phy_intf_sel);
@@ -103,10 +96,8 @@ static int x1600_mac_set_mode(struct plat_stmmacenet_data *plat_dat,
 	return regmap_update_bits(mac->regmap, 0, mac->soc_info->mask, val);
 }
 
-static int x1830_mac_set_mode(struct plat_stmmacenet_data *plat_dat,
-			      u8 phy_intf_sel)
+static int x1830_mac_set_mode(struct ingenic_mac *mac, u8 phy_intf_sel)
 {
-	struct ingenic_mac *mac = plat_dat->bsp_priv;
 	unsigned int val;
 
 	val = FIELD_PREP(MACPHYC_MODE_SEL_MASK, MACPHYC_MODE_SEL_RMII) |
@@ -116,10 +107,8 @@ static int x1830_mac_set_mode(struct plat_stmmacenet_data *plat_dat,
 	return regmap_update_bits(mac->regmap, 0, mac->soc_info->mask, val);
 }
 
-static int x2000_mac_set_mode(struct plat_stmmacenet_data *plat_dat,
-			      u8 phy_intf_sel)
+static int x2000_mac_set_mode(struct ingenic_mac *mac, u8 phy_intf_sel)
 {
-	struct ingenic_mac *mac = plat_dat->bsp_priv;
 	unsigned int val;
 
 	val = FIELD_PREP(MACPHYC_PHY_INFT_MASK, phy_intf_sel);
@@ -165,7 +154,7 @@ static int ingenic_mac_init(struct platform_device *pdev, void *bsp_priv)
 		dev_dbg(mac->dev, "MAC PHY control register: interface %s\n",
 			phy_modes(interface));
 
-		ret = mac->soc_info->set_mode(mac->plat_dat, phy_intf_sel);
+		ret = mac->soc_info->set_mode(mac, phy_intf_sel);
 		if (ret)
 			return ret;
 	}
-- 
2.47.3


