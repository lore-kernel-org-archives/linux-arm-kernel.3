Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9F24CF65E9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jan 2026 11:46:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nIUJockBf7udn5LkGLJV/ycidZ6LHdxsz1QDYW3jmOI=; b=O5EAE44SlHEsf2RLgqBu7LuLGd
	Kq3N4MF0nwNc35mSKwBFBdAh10of2sCfMQQJPjXtj8wyuiuiFv6Lio7Kej7r25Ln1PSf1bmfNvl14
	rldJVBaR6k+jaYSHJNzupX+YdjLi1q6/bftsvs3l1j2fANZ9FXxYoGhloD3j0UicQvErT2A1qsYFL
	q/HvHNGsQ/oBTqDyGPFrUWeobvykr2AsYP/JVIVYQfIMSubWiNsx+8c1pDUQcYns6q0yDBPtgNXbO
	lhz9A0480rpSi+SlJnzA2BoLpSu8VPrL9FSEWuZ5+YDDPZ9Fc+BskKLyeF0GEt3xZ+1tGG0+QMwlJ
	OyQgMhDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkL3L-0000000CRxn-40QB;
	Mon, 26 Jan 2026 11:46:43 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkL3D-0000000CRnA-3mId;
	Mon, 26 Jan 2026 11:46:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description;
	bh=nIUJockBf7udn5LkGLJV/ycidZ6LHdxsz1QDYW3jmOI=; b=igvoS+PhVPkz9gCRIcBo3+vN2r
	T8rqr1n9g3eH5UIdEVKgIdSUbicniuXIAzekD0wwgWR8NDST9DrdpBQy+Q++WLR9IJt6ihYD5VpZr
	dhlK6g/CgOlKYQwnTOvBqqbymL4g/C9+SAt4G4BHk1vwOb+J4qiis7lZChu40uNHCSKpHJt19Szzq
	BHrE6ByCecvU2oI/ggluxBj5P7UsW7W45ex8MvrJOaBwPrCAy8abIsBk7KMyFpamNqN609NPNlr1u
	lQz7xthxtz2XWJGv7yYDTMY0UXfeXyZISsivQnj2o29hlEjf+q0d6fkmhOqriIkE+kIvY9Vy8rCpG
	AHkLU/5A==;
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkL3B-000000058fc-0FoA;
	Mon, 26 Jan 2026 11:46:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=nIUJockBf7udn5LkGLJV/ycidZ6LHdxsz1QDYW3jmOI=; b=ibtOSGU77x/QxsKbVQWHJ+I5Vt
	htcNCzm0EHvbVtamEgEvhyfu+iohypE4YAr38zqxgq6q2SaIULIEqSxLK6M4yJKtE5sgdPsjXOeMg
	p6OmFrRXFgZAw8Z0wQrQTp1uCP7bQgj2pE+Lv5eULaSkUjSCN3MptdR+gO3u4ypFvkqA4bckYe2DL
	4vnymTpqaZKxYY/IRqANWAf0WQYNSUGjpJoi4Ojpc/UgVaR2uWIsCW+GJNiLSdlQha46lEPjr3CcZ
	mIyyj2RksD+X7GBCsvSTS82wDpyb477nXWBRuFgLm8U0ZX2AfdHn/jR/VLrPFBms2GrcFr2Vn/yvt
	9p26khgw==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:34026 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vkL31-000000004hx-0Fdb;
	Mon, 26 Jan 2026 11:46:23 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vkL2x-00000005utg-3zXY;
	Mon, 26 Jan 2026 11:46:19 +0000
In-Reply-To: <aXdTi4ViCkhhXvFI@shell.armlinux.org.uk>
References: <aXdTi4ViCkhhXvFI@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH net-next v2 16/22] net: stmmac: rk: convert px30
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1vkL2x-00000005utg-3zXY@rmk-PC.armlinux.org.uk>
Date: Mon, 26 Jan 2026 11:46:19 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_114633_245901_9B92EDAE 
X-CRM114-Status: GOOD (  11.06  )
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

Use rk_set_clk_mac_speed() rather than px30 specific function for
configuring RMII clock.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../net/ethernet/stmicro/stmmac/dwmac-rk.c    | 38 ++-----------------
 1 file changed, 4 insertions(+), 34 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
index 2a7fd82de848..9211260a86ff 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
@@ -264,49 +264,19 @@ static void rk_gmac_integrated_fephy_powerdown(struct rk_priv_data *priv,
 
 #define PX30_GRF_GMAC_CON1		0x0904
 
-/* PX30_GRF_GMAC_CON1 */
-#define PX30_GMAC_SPEED_10M		GRF_CLR_BIT(2)
-#define PX30_GMAC_SPEED_100M		GRF_BIT(2)
-
 static void px30_set_to_rmii(struct rk_priv_data *bsp_priv)
 {
 }
 
-static int px30_set_speed(struct rk_priv_data *bsp_priv,
-			  phy_interface_t interface, int speed)
-{
-	struct clk *clk_mac_speed = bsp_priv->clks[RK_CLK_MAC_SPEED].clk;
-	struct device *dev = bsp_priv->dev;
-	unsigned int con1;
-	long rate;
-
-	if (!clk_mac_speed) {
-		dev_err(dev, "%s: Missing clk_mac_speed clock\n", __func__);
-		return -EINVAL;
-	}
-
-	if (speed == 10) {
-		con1 = PX30_GMAC_SPEED_10M;
-		rate = 2500000;
-	} else if (speed == 100) {
-		con1 = PX30_GMAC_SPEED_100M;
-		rate = 25000000;
-	} else {
-		dev_err(dev, "unknown speed value for RMII! speed=%d", speed);
-		return -EINVAL;
-	}
-
-	regmap_write(bsp_priv->grf, PX30_GRF_GMAC_CON1, con1);
-
-	return clk_set_rate(clk_mac_speed, rate);
-}
-
 static const struct rk_gmac_ops px30_ops = {
 	.set_to_rmii = px30_set_to_rmii,
-	.set_speed = px30_set_speed,
+	.set_speed = rk_set_clk_mac_speed,
 
 	.gmac_grf_reg = PX30_GRF_GMAC_CON1,
 	.gmac_phy_intf_sel_mask = GENMASK_U16(6, 4),
+
+	.clock_grf_reg = PX30_GRF_GMAC_CON1,
+	.clock.mac_speed_mask = BIT_U16(2),
 };
 
 #define RK3128_GRF_MAC_CON0	0x0168
-- 
2.47.3


