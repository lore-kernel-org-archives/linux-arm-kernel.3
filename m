Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67762CCFA18
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Nov 2025 08:12:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=azUidkZnPCh9Mafb2lBwoV+zJ7JDUMj3PRcpXOZ0GqQ=; b=02naxz2aLfzu+FqO/RE2tfRxZS
	BDbibBIy4hO/2/uaqT0hZqp4e8SRMs14ioShVw5Nol/XY6L/B0ClgdVJUaZeqI+fBab3flJOwflAa
	DFx+aWaIEsNOglMyLP0ni9hlF0votODjn10QKZHZEPDNt7qwIblUqyzwzck2D/dZWr8qlbd6I0BnF
	NbS/axdvF8svmHrWJpe79Si6Jidd8jtJouw/nSEvotu+7TLDpGtG8Eq6d7c1bTJtk1/mB4/5ijxgn
	TLXVOoR5kUJBN+PCqPsLkKGCTwKetp2Ye3AsuDPh+8skwfXHO0/TMwSZsIdlz9wl5ME2vRJpmqkze
	Z9sb2Iug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIjUV-00000006l4P-0Jqg;
	Tue, 11 Nov 2025 08:12:39 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIjUS-00000006kzV-1O0S;
	Tue, 11 Nov 2025 08:12:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=azUidkZnPCh9Mafb2lBwoV+zJ7JDUMj3PRcpXOZ0GqQ=; b=GpTBojM3bk8m3Wsj/lsgOXV5nm
	tyO/7KGNbs0fZaKrXFGSmWEjB+eycVFDJA3fVqtZM+11xXwgQeRGEpP+Dhcv6jQG+jFewql4JM/0l
	jNP6YhfsvUt6bTgxNXJhUcceC1TYwCFlL/rONv6ap+PedlYTDo0Hjgy2B6iY28ChWdZLtgUBm0ac8
	3ZB8EGP057qPA4gdpshfz8jt08xDbZUQkEi1rXZgXqPi7XD5XwqgqisakG5IL6n2QwUzm67sGpfTg
	oq54wA/9BRuUoDjkSNMdZDnPbANYcPhJPLRQ5dIpyhEVJuSS9hevZBXhgGdJ+uQws+GmcevCvZNzo
	nmLYRaew==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:53550 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vIjUG-000000002Bi-3khQ;
	Tue, 11 Nov 2025 08:12:25 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vIjUF-0000000Dqth-0gwD;
	Tue, 11 Nov 2025 08:12:23 +0000
In-Reply-To: <aRLvrfx6tOa-RhrY@shell.armlinux.org.uk>
References: <aRLvrfx6tOa-RhrY@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"David S. Miller" <davem@davemloft.net>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Keguang Zhang <keguang.zhang@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Minda Chen <minda.chen@starfivetech.com>,
	netdev@vger.kernel.org,
	Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH net-next v2 08/13] net: stmmac: starfive: use
 stmmac_get_phy_intf_sel()
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1vIjUF-0000000Dqth-0gwD@rmk-PC.armlinux.org.uk>
Date: Tue, 11 Nov 2025 08:12:23 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251111_001236_371499_2128CD70 
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

Use stmmac_get_phy_intf_sel() to decode the PHY interface mode to the
phy_intf_sel value, validate the result and use that to set the
control register to select the operating mode for the DWMAC core.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../ethernet/stmicro/stmmac/dwmac-starfive.c  | 24 +++++--------------
 1 file changed, 6 insertions(+), 18 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c
index 1ef72576c6f1..16b955a6d77b 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c
@@ -15,8 +15,6 @@
 
 #include "stmmac_platform.h"
 
-#define STARFIVE_DWMAC_PHY_INFT_RGMII		PHY_INTF_SEL_RGMII
-#define STARFIVE_DWMAC_PHY_INFT_RMII		PHY_INTF_SEL_RMII
 #define STARFIVE_DWMAC_PHY_INFT_FIELD		0x7U
 
 #define JH7100_SYSMAIN_REGISTER49_DLYCHAIN	0xc8
@@ -35,25 +33,15 @@ static int starfive_dwmac_set_mode(struct plat_stmmacenet_data *plat_dat)
 	struct starfive_dwmac *dwmac = plat_dat->bsp_priv;
 	struct regmap *regmap;
 	unsigned int args[2];
-	unsigned int mode;
+	int phy_intf_sel;
 	int err;
 
-	switch (plat_dat->phy_interface) {
-	case PHY_INTERFACE_MODE_RMII:
-		mode = STARFIVE_DWMAC_PHY_INFT_RMII;
-		break;
-
-	case PHY_INTERFACE_MODE_RGMII:
-	case PHY_INTERFACE_MODE_RGMII_ID:
-	case PHY_INTERFACE_MODE_RGMII_RXID:
-	case PHY_INTERFACE_MODE_RGMII_TXID:
-		mode = STARFIVE_DWMAC_PHY_INFT_RGMII;
-		break;
-
-	default:
+	phy_intf_sel = stmmac_get_phy_intf_sel(plat_dat->phy_interface);
+	if (phy_intf_sel != PHY_INTF_SEL_RGMII &&
+	    phy_intf_sel != PHY_INTF_SEL_RMII) {
 		dev_err(dwmac->dev, "unsupported interface %s\n",
 			phy_modes(plat_dat->phy_interface));
-		return -EINVAL;
+		return phy_intf_sel < 0 ? phy_intf_sel : -EINVAL;
 	}
 
 	regmap = syscon_regmap_lookup_by_phandle_args(dwmac->dev->of_node,
@@ -65,7 +53,7 @@ static int starfive_dwmac_set_mode(struct plat_stmmacenet_data *plat_dat)
 	/* args[0]:offset  args[1]: shift */
 	err = regmap_update_bits(regmap, args[0],
 				 STARFIVE_DWMAC_PHY_INFT_FIELD << args[1],
-				 mode << args[1]);
+				 phy_intf_sel << args[1]);
 	if (err)
 		return dev_err_probe(dwmac->dev, err, "error setting phy mode\n");
 
-- 
2.47.3


