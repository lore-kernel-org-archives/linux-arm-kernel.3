Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 537FECCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Nov 2025 13:27:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xj/bA4YiE91gjTI/ZRKfRaV6kuiSzvsAX6um4VA4U2I=; b=IABO1dUEgAuo9s2IEPuuA2cu2r
	iQdsT2A5/tupRpnliqiwmExhxmdhs7hkVc3ADdeqqR34JfheSJHSb3nWhQWsHhgEkQB7TQV3qc+IN
	yXxu2cT3FiIyjkbwBPojOGCMVCmIKTYB23C8hRDL/HBPp8oybffzh9+tOt9Pg1prWswC/9v+mnEiV
	2rRaeW+3AbUdC1AXA/Nd69nLU+3WrbirAOl3w6JD22odAxRh+gQcNyImyi3afOend7YF4SecXnUB0
	o44/4/h1v+ZIryZFldQm3xhJdh7VyEf7dG90TTR1TXfabTxOhkd3dp2Xfqwpl8NLdM/cz70Dw0+mO
	fo4ZfdvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGdXe-0000000Dm6i-37Dn;
	Wed, 05 Nov 2025 13:27:14 +0000
Received: from pandora.armlinux.org.uk ([78.32.30.218])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGdXc-0000000Dm3X-2cg7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Nov 2025 13:27:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=xj/bA4YiE91gjTI/ZRKfRaV6kuiSzvsAX6um4VA4U2I=; b=S60fujAcZUB3o8B/3JwWbng5Ac
	OGMmz2mA+igVyVhFGhhcZDjeaxMaHqXf208AEWWpglvfZISB/jZRephM8/7akCPceFFXQgP7pdps1
	17Jq7xrsaAHwmXpEYfSviyQCC7MvaNN1nr/au4QKW6oPPhazHeLQ3lGnIvG8sxTqGVEwbesm3nf+J
	S3SL0CDSAqzxisQ1smA8Br2Snx14lqHePg4WU/z/9WMn9Qpub3iURDpxT5zDEcYdLqK2OdMFUV3ti
	NPAyeZTbhviYg5yOc2Zm+8t5RNx9oKvmiCeBf77dW+0UtaYsZfANCvpGVhYiT3hD9vQvhA26FLmYQ
	Mxp7FE+g==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:50744 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vGdXV-000000003Ui-1Gpg;
	Wed, 05 Nov 2025 13:27:05 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vGdXU-0000000CloN-0lOu;
	Wed, 05 Nov 2025 13:27:04 +0000
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
Subject: [PATCH net-next 11/11] net: stmmac: ingenic: use ->set_phy_intf_sel()
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1vGdXU-0000000CloN-0lOu@rmk-PC.armlinux.org.uk>
Date: Wed, 05 Nov 2025 13:27:04 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_052712_761187_6C76E6B8 
X-CRM114-Status: GOOD (  11.69  )
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

Rather than placing the phy_intf_sel() setup in the ->init() method,
move it to the new ->set_phy_intf_sel() method.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../ethernet/stmicro/stmmac/dwmac-ingenic.c   | 33 +++++++------------
 1 file changed, 11 insertions(+), 22 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-ingenic.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-ingenic.c
index 5ea26ee8e9d8..28548d0000ae 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-ingenic.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-ingenic.c
@@ -134,32 +134,21 @@ static int x2000_mac_set_mode(struct ingenic_mac *mac, u8 phy_intf_sel)
 	return regmap_update_bits(mac->regmap, 0, mac->soc_info->mask, val);
 }
 
-static int ingenic_mac_init(struct platform_device *pdev, void *bsp_priv)
+static int ingenic_set_phy_intf_sel(void *bsp_priv, u8 phy_intf_sel)
 {
 	struct ingenic_mac *mac = bsp_priv;
-	phy_interface_t interface;
-	int phy_intf_sel, ret;
-
-	if (mac->soc_info->set_mode) {
-		interface = mac->plat_dat->phy_interface;
-
-		phy_intf_sel = stmmac_get_phy_intf_sel(interface);
-		if (phy_intf_sel < 0 || phy_intf_sel >= BITS_PER_BYTE ||
-		    ~mac->soc_info->valid_phy_intf_sel & BIT(phy_intf_sel)) {
-			dev_err(mac->dev, "unsupported interface %s\n",
-				phy_modes(interface));
-			return phy_intf_sel < 0 ? phy_intf_sel : -EINVAL;
-		}
 
-		dev_dbg(mac->dev, "MAC PHY control register: interface %s\n",
-			phy_modes(interface));
+	if (!mac->soc_info->set_mode)
+		return 0;
 
-		ret = mac->soc_info->set_mode(mac, phy_intf_sel);
-		if (ret)
-			return ret;
-	}
+	if (phy_intf_sel >= BITS_PER_BYTE ||
+	    ~mac->soc_info->valid_phy_intf_sel & BIT(phy_intf_sel))
+		return phy_intf_sel < 0 ? phy_intf_sel : -EINVAL;
+
+	dev_dbg(mac->dev, "MAC PHY control register: interface %s\n",
+		phy_modes(mac->plat_dat->phy_interface));
 
-	return 0;
+	return mac->soc_info->set_mode(mac, phy_intf_sel);
 }
 
 static int ingenic_mac_probe(struct platform_device *pdev)
@@ -221,7 +210,7 @@ static int ingenic_mac_probe(struct platform_device *pdev)
 	mac->plat_dat = plat_dat;
 
 	plat_dat->bsp_priv = mac;
-	plat_dat->init = ingenic_mac_init;
+	plat_dat->set_phy_intf_sel = ingenic_set_phy_intf_sel;
 
 	return devm_stmmac_pltfr_probe(pdev, plat_dat, &stmmac_res);
 }
-- 
2.47.3


