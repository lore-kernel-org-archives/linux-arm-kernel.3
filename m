Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FD79C71136
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 11:24:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i+lsTaU7RwEBcehbNbGo3qJpxDvpz1hEP91DuwXf27E=; b=v7+ikHOsFYK8QlHg/uEIX7usX3
	h7UsHTqqyxVqY9E7qCy81PN28ozf48WnxVHy3DCQN6denzQchdL7HfSWmXO4F+kSUiPf/ebUXBey3
	ceVzTwKZ7EOWIvFKqgfYvOeLbX2KxZ0gv/WA9htxM6DmPUe6TvGyMsdap5wyYoQLul6ucdQJg6xha
	xhT74+dUQjAUiSpEjgY9h5kAtWztISx0qzqxoWM16PK+O2LxkIkvv/nyKucT83YmTjXLdMUgWxHaD
	NGandxWes3MdEwvPwYMxRZBx0phHEU9xBZ/iSjV4HwzQ7zbXHhMJLyjcopJV7Qmpw/LIFCN+eWAHM
	aiekthWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR7wt-00000004BmT-2Ns4;
	Mon, 16 Jun 2025 11:24:23 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR6tT-0000000433G-2Wg3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Jun 2025 10:16:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=i+lsTaU7RwEBcehbNbGo3qJpxDvpz1hEP91DuwXf27E=; b=Sb8NJi1j1wgs7rxo26V4o5kf62
	XTTZPvRGMz8tmy+BNl0LNU+jR41N5229OcAza2loD1++lP9ssFHKFKoPo9cDBCiODeDUmT6v5TXD7
	RC1cClZmi45lb0pQQ85lQCmL/i72Lr91HkhgbwPwuh877xuPG9+bLXjk3DWadQJ+MeIivlXl74mO+
	4SQH2H/FxhwF+SY0++A9sHDFgaOdaLCzRiDGSnNWszpUByb9OLJqurxK0f4Ci76vWyo3jAaVwZiFy
	zWs9xxah18W+hXTLSPeCrKVJ+U0Qh7yttPkRDFPP3WOTujyjTlC9uroa2TjWwXzgRFfHCKt/VGEQF
	NxtcwG0g==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:50820 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1uR6tO-0003aw-14;
	Mon, 16 Jun 2025 11:16:42 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1uR6sj-004Ku5-HR; Mon, 16 Jun 2025 11:16:01 +0100
In-Reply-To: <aE_u8mCkUXEWTzJe@shell.armlinux.org.uk>
References: <aE_u8mCkUXEWTzJe@shell.armlinux.org.uk>
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
Subject: [PATCH net-next 3/3] net: stmmac: rk: remove unnecessary clk_mac
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1uR6sj-004Ku5-HR@rmk-PC.armlinux.org.uk>
Date: Mon, 16 Jun 2025 11:16:01 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_031647_637632_D04227D5 
X-CRM114-Status: GOOD (  11.27  )
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

The stmmac platform code already gets the "stmmaceth" clock, so there
is no need for drivers to get it. Use the stored pointer in struct
plat_stmmacenet_data instead of getting and storing our own pointer.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
index 7ee101a6cfcf..79b92130a03f 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
@@ -80,7 +80,6 @@ struct rk_priv_data {
 
 	struct clk_bulk_data *clks;
 	int num_clks;
-	struct clk *clk_mac;
 	struct clk *clk_phy;
 
 	struct reset_control *phy_reset;
@@ -1408,16 +1407,10 @@ static int rk_gmac_clk_init(struct plat_stmmacenet_data *plat)
 	if (ret)
 		return dev_err_probe(dev, ret, "Failed to get clocks\n");
 
-	/* "stmmaceth" will be enabled by the core */
-	bsp_priv->clk_mac = devm_clk_get(dev, "stmmaceth");
-	ret = PTR_ERR_OR_ZERO(bsp_priv->clk_mac);
-	if (ret)
-		return dev_err_probe(dev, ret, "Cannot get stmmaceth clock\n");
-
 	if (bsp_priv->clock_input) {
 		dev_info(dev, "clock input from PHY\n");
 	} else if (phy_iface == PHY_INTERFACE_MODE_RMII) {
-		clk_set_rate(bsp_priv->clk_mac, 50000000);
+		clk_set_rate(plat->stmmac_clk, 50000000);
 	}
 
 	if (plat->phy_node && bsp_priv->integrated_phy) {
-- 
2.30.2


