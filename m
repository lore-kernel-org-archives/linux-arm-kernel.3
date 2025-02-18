Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58B6FC02198
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 11:22:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z6JrrogbArX3EwFwjiBuFp6vVepOdYswoCOinStaIO8=; b=0JwBTJkUmJsLzi5IKUSpQrOwpO
	ICOC13u3ywrDV/bPiVJ4BYQRww6zPVp/5A6zkc3SRmC1+5ttGFAhVWw36jUs+D8zBj3Evipx/UpJV
	PIxZJFzvdS6V4IrmwH8mf0OCROlcmZfGvEWnoS9dkpIhBRm+X91CoOxAwMPd+y5yJxvuc4z5CVS9T
	uueEPnd7dyPbXT0leqEqaB5zb1wXGj3Bj38ebcQuf9oL+LqoZ4Sn/CA9wFlIoV4PHg0GT4W+Gvztq
	UzyfTiGkLhGVR5qg92VqDX02ikMuNslUgC0L5GynBT890DbWjNBEOA26zRs5uQkyFQISeUA9o/snN
	CEqfmffw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkLgI-00000007wGD-4AE0;
	Tue, 18 Feb 2025 11:22:26 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkLZZ-00000007uF2-1pPA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Feb 2025 11:15:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=z6JrrogbArX3EwFwjiBuFp6vVepOdYswoCOinStaIO8=; b=tgNGnRszu7KRQVhPsRSiPbUQnN
	2jqrw/fF1aEgjDY6+hiFyt5hv9Pea+7JKyP9erfYrpn95M2bx2tHzI/zmKJkZpPXvBt+V9ZENGXdy
	jDO9jdH9KiblQ54w5p3mCP6FjT4TEhMDDRWD2hNjTW7UF+p3RDGiEfHt7rzGzkyzoZeDxmtOemDZZ
	MVdl/XSiGYzjO4be4wgFNuF/lEoc3Drx7X+aKLKJr4EmbYdBOrMNpE+FsMaDa9MDSPjQ5gC+aUZJR
	Jjw5XxKKJxs0Bk/MZv7SuIwVo3Tze5qVq4/OowF7HnslVfOTw42rCNUebXHQOR3bC4NUJydKUzxHc
	P8gMRr0g==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:51248 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1tkLZL-0001j4-1N;
	Tue, 18 Feb 2025 11:15:15 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1tkLZ0-004RZH-SL; Tue, 18 Feb 2025 11:14:54 +0000
In-Reply-To: <Z7RrnyER5ewy0f3T@shell.armlinux.org.uk>
References: <Z7RrnyER5ewy0f3T@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Eric Dumazet <edumazet@google.com>,
	Fabio Estevam <festevam@gmail.com>,
	imx@lists.linux.dev,
	Inochi Amaoto <inochiama@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Jan Petrous <jan.petrous@oss.nxp.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Minda Chen <minda.chen@starfivetech.com>,
	netdev@vger.kernel.org,
	NXP S32 Linux Team <s32@nxp.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Thierry Reding <treding@nvidia.com>
Subject: [PATCH RFC net-next 4/7] net: stmmac: starfive: use generic
 stmmac_set_clk_tx_rate()
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1tkLZ0-004RZH-SL@rmk-PC.armlinux.org.uk>
Date: Tue, 18 Feb 2025 11:14:54 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_031529_474939_2D1BE77C 
X-CRM114-Status: GOOD (  12.05  )
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


