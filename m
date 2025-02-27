Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C15AC021BE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 09:29:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ar9U8vywYkCzFOSigD5N+dM7En/CQg4G4NArSWcUyqA=; b=uwlZYCj0eN+1nfAFI697rBg3d2
	a1qETGhyFoTV3Eex7VW3Z49GzB1DI/0Nd1tbqdvI5BhhtOJNJTXdIvg53mfD6xBokUxQYAMUli93z
	lcrI2AtIkiaJBuOietE6wxwq9FW4iEvrLmr9kx1GZKosZqcW8DIgpflWEnLONtmko74H1g1CP/weM
	Jx12TLXlUcywgcXfB67qoAh0CUxWkh71oPbWv+w+ltvOdE+tcjVrHokFtpVXvxl2zoDbNtds/vJTo
	OwwgSdAsU3DBBTHY8p3ujOGc1LE5Wcd64OJrmrRHQ/nTwvUyd5otBGCgzxnr0nmQ9PHKoWvUlYBYT
	J6cdw32Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnaCg-00000006rcF-00q5;
	Thu, 27 Feb 2025 09:29:14 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tna1E-00000006pmV-0ZFz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Feb 2025 09:17:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=ar9U8vywYkCzFOSigD5N+dM7En/CQg4G4NArSWcUyqA=; b=Fswkmnpdej517Pxe4qm3+867fC
	YjMWTko7DumqM0dYbTHSfmWUvEsMMwez+VmXNT0H724SaEjJ0i5QF0Z+Wk534JzumAZrFDAFJ+n4p
	7ndEDI1ssF+PcDmbutDyLrenDuiDRU17oyV10mibL6i8amtVllQ2e5odagkGof/eqzAfUkmHdZ+7J
	WwwBUoL6/+JPphc8TC5kV4D7pDGPS8IqVwjlL92vT6ethTUizdoH3JV9WGZqb6c48ClSDKcwHMbFh
	fnFa3/21IFQnpP1b1LtsPiETuPucc1ULQKZ/HYyb4ja2jFP6G7pNm+CKDOsrAdqMCRCyQX5HylAsQ
	WljGscJQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:38772 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1tna19-0006dT-1c;
	Thu, 27 Feb 2025 09:17:19 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1tna0p-0052t8-Gn; Thu, 27 Feb 2025 09:16:59 +0000
In-Reply-To: <Z8AtX-wyPal1auVO@shell.armlinux.org.uk>
References: <Z8AtX-wyPal1auVO@shell.armlinux.org.uk>
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
Subject: [PATCH net-next 08/11] net: stmmac: rk: switch to use
 set_clk_tx_rate() hook
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1tna0p-0052t8-Gn@rmk-PC.armlinux.org.uk>
Date: Thu, 27 Feb 2025 09:16:59 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_011724_175036_3FE69351 
X-CRM114-Status: GOOD (  11.47  )
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

Switch from using the fix_mac_speed() hook to set_clk_tx_rate() to
manage the transmit clock.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
index 83d104a274c5..003fa5cf42c3 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
@@ -1920,9 +1920,10 @@ static void rk_gmac_powerdown(struct rk_priv_data *gmac)
 	gmac_clk_enable(gmac, false);
 }
 
-static void rk_fix_speed(void *priv, int speed, unsigned int mode)
+static int rk_set_clk_tx_rate(void *bsp_priv_, struct clk *clk_tx_i,
+			      phy_interface_t interface, int speed)
 {
-	struct rk_priv_data *bsp_priv = priv;
+	struct rk_priv_data *bsp_priv = bsp_priv_;
 	struct device *dev = &bsp_priv->pdev->dev;
 
 	switch (bsp_priv->phy_iface) {
@@ -1940,6 +1941,8 @@ static void rk_fix_speed(void *priv, int speed, unsigned int mode)
 	default:
 		dev_err(dev, "unsupported interface %d", bsp_priv->phy_iface);
 	}
+
+	return 0;
 }
 
 static int rk_gmac_probe(struct platform_device *pdev)
@@ -1968,7 +1971,8 @@ static int rk_gmac_probe(struct platform_device *pdev)
 	 */
 	if (!plat_dat->has_gmac4)
 		plat_dat->has_gmac = true;
-	plat_dat->fix_mac_speed = rk_fix_speed;
+
+	plat_dat->set_clk_tx_rate = rk_set_clk_tx_rate;
 
 	plat_dat->bsp_priv = rk_gmac_setup(pdev, plat_dat, data);
 	if (IS_ERR(plat_dat->bsp_priv))
-- 
2.30.2


