Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B69B3C021BE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 09:23:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iSE22LVh+dFamqFu+57YNBKHdlZfHa5HwfTk/WcYS+I=; b=OBpNjqOidWUdNnhwtNxClS0T49
	wsFXr07e6JlKs4IjP5WoenB9p4BCZXz3iE89kjCnl9/LcuKviQbiYADi2R7/iK1SkCWByXCCUqsTt
	uCCmrakiqjCdzdpydN/yejZZqqh7nQYDFOPJ0fs2HBGV740xS4vV8s9m6PZYjP35fKMcVopkk0vs9
	rmz30gepv1RXDxNrp4gMv5jb6ncV0U7W1RCf/Ji6jwDSAONgqb77LTyigngwEALgczqtI+sThhhaH
	hLIiNaFYEZ6s5SPZpD6dRWFf5HPdKERhTu+mjl8X9cqNzv86KFsKfjEAe4N2/bzLWZyc7g7ODYnox
	EHIb6/Lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tna6e-00000006qbx-143u;
	Thu, 27 Feb 2025 09:23:00 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tna0y-00000006phx-1z16
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Feb 2025 09:17:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=iSE22LVh+dFamqFu+57YNBKHdlZfHa5HwfTk/WcYS+I=; b=OGiRwbA/UGuzeD0bjVXhiqXTvP
	XZusDLdv3S/a4M36B5BW2ACyjvGF3M/FeSpW30j5gF/aXjO3kAT/mXRQY+B6txZaFSMgR14aZuA6Q
	Yar2hsWyvywBj8+3B13bMtRsaY+53yd9t9yI2IMTr/wa3TRqSygREfe9IUdnD2fELUBhnkJmEZuBm
	iI/m8XeJAsNjGTc+EoS885RQtxDasiGqU59DYMcWeBU35qYfWvVgVzYO3P0s0LZfA/oi/B1B+AUIj
	aCHwMy31bJZS1rfo6TgSMycSz6hAsu8l1kOG1+OrLxXrDd9ZROHC4PtsmzQqM7qBGnQ3gSUIN1G7S
	MelWWqxA==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:41910 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1tna0p-0006cK-1y;
	Thu, 27 Feb 2025 09:16:59 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1tna0V-0052sk-1L; Thu, 27 Feb 2025 09:16:39 +0000
In-Reply-To: <Z8AtX-wyPal1auVO@shell.armlinux.org.uk>
References: <Z8AtX-wyPal1auVO@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Minda Chen <minda.chen@starfivetech.com>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH net-next 04/11] net: stmmac: starfive: use generic
 stmmac_set_clk_tx_rate()
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1tna0V-0052sk-1L@rmk-PC.armlinux.org.uk>
Date: Thu, 27 Feb 2025 09:16:39 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_011708_508745_CD1BD7A1 
X-CRM114-Status: GOOD (  11.72  )
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

Use the generic stmmac_set_clk_tx_rate() to configure the MAC transmit
clock.

Reviewed-by: Thierry Reding <treding@nvidia.com>
Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../ethernet/stmicro/stmmac/dwmac-starfive.c  | 26 +++----------------
 1 file changed, 4 insertions(+), 22 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c
index 282c846dad0b..5e31cb3bb4b8 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c
@@ -27,27 +27,9 @@ struct starfive_dwmac_data {
 
 struct starfive_dwmac {
 	struct device *dev;
-	struct clk *clk_tx;
 	const struct starfive_dwmac_data *data;
 };
 
-static void starfive_dwmac_fix_mac_speed(void *priv, int speed, unsigned int mode)
-{
-	struct starfive_dwmac *dwmac = priv;
-	long rate;
-	int err;
-
-	rate = rgmii_clock(speed);
-	if (rate < 0) {
-		dev_err(dwmac->dev, "invalid speed %d\n", speed);
-		return;
-	}
-
-	err = clk_set_rate(dwmac->clk_tx, rate);
-	if (err)
-		dev_err(dwmac->dev, "failed to set tx rate %lu\n", rate);
-}
-
 static int starfive_dwmac_set_mode(struct plat_stmmacenet_data *plat_dat)
 {
 	struct starfive_dwmac *dwmac = plat_dat->bsp_priv;
@@ -122,9 +104,9 @@ static int starfive_dwmac_probe(struct platform_device *pdev)
 
 	dwmac->data = device_get_match_data(&pdev->dev);
 
-	dwmac->clk_tx = devm_clk_get_enabled(&pdev->dev, "tx");
-	if (IS_ERR(dwmac->clk_tx))
-		return dev_err_probe(&pdev->dev, PTR_ERR(dwmac->clk_tx),
+	plat_dat->clk_tx_i = devm_clk_get_enabled(&pdev->dev, "tx");
+	if (IS_ERR(plat_dat->clk_tx_i))
+		return dev_err_probe(&pdev->dev, PTR_ERR(plat_dat->clk_tx_i),
 				     "error getting tx clock\n");
 
 	clk_gtx = devm_clk_get_enabled(&pdev->dev, "gtx");
@@ -139,7 +121,7 @@ static int starfive_dwmac_probe(struct platform_device *pdev)
 	 * internally, because rgmii_rxin will be adaptively adjusted.
 	 */
 	if (!device_property_read_bool(&pdev->dev, "starfive,tx-use-rgmii-clk"))
-		plat_dat->fix_mac_speed = starfive_dwmac_fix_mac_speed;
+		plat_dat->set_clk_tx_rate = stmmac_set_clk_tx_rate;
 
 	dwmac->dev = &pdev->dev;
 	plat_dat->bsp_priv = dwmac;
-- 
2.30.2


