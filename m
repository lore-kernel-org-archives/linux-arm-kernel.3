Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BEBEC369AE
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 12 Apr 2025 14:30:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+J4kgIiOlyNlscSmyi+M0ndzlA6RBERVMIHPWwh9j+o=; b=zWJjnUMhecw9z7WWpdTCZauzQM
	vQTAj5OhNOcKav8nk6Us5FfK8kEougPHVLzyRuqrRsMvRes5gZAJnlywgNR+3CkB9ARtVjqRgRKUt
	tQNIPf5t5aHkEVXtNI3skJPeB7m6VczgRAPfdy3d/Jz3jEcJlKUrBNRYCcwqnr8Le+KghW3XLoUzG
	0DcjGENEmrYQuEogiUrx//NSucu+k9ZwQeuxi4trdson6sShCDKaNpv31N0XVeGEYLZpYx+pDO6Ei
	Ojdor/aUip1amZxvB8mO1xUmMQ+0CQvEtk4tVwBqKIu2abwRw4TLMoG48LQrCQUsxWqMaqE0gEGeK
	tHF7VS0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3bsP-0000000G1SY-04Ay;
	Sat, 12 Apr 2025 14:30:33 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3bgS-0000000G035-3QPp
	for linux-arm-kernel@lists.infradead.org;
	Sat, 12 Apr 2025 14:18:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:Reply-To:Content-ID
	:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
	Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=+J4kgIiOlyNlscSmyi+M0ndzlA6RBERVMIHPWwh9j+o=; b=Ry9twFidwSXnbS6fXWRxRsLBZB
	PUPEgc0BboLgzsr6LszdT47ZcKA9kQqcK3YA6nhBDBDaBQb5D0WUNVgnNCb1dCO8XE1MITHTuQtVa
	mLrnFaWh2NU7DTLo6htzPaiNd56p/HPjRqT7H1brXYrO4ZznO61ton3ZBwFbE/KmvWU0NFbk5A4YI
	QyTOjmYoH3K64IpH1JdwUywLJk6e/MrHgtvxos9qABZ7RMZ4TgQLZHaNBvoHwVUUrUV9JRnwX+RFL
	7pIx6i8Z5B8jDZixdEKmzTM1BeFkXxBdzYtR26u+MWIs+sqVAj3kLy7es1NjAAHtPCaVQGSoN/85c
	ISHIv8fg==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:41112 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1u3bgN-0004d8-30;
	Sat, 12 Apr 2025 15:18:07 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1u3bfm-000Enq-MC; Sat, 12 Apr 2025 15:17:30 +0100
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Fabio Estevam <festevam@gmail.com>,
	imx@lists.linux.dev,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>
Subject: [PATCH net-next] net: stmmac: imx: use stmmac_pltfr_probe()
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1u3bfm-000Enq-MC@rmk-PC.armlinux.org.uk>
Date: Sat, 12 Apr 2025 15:17:30 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250412_071812_853405_157FFDCC 
X-CRM114-Status: GOOD (  10.56  )
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

Using stmmac_pltfr_probe() simplifies the probe function. This will not
only call plat_dat->init (imx_dwmac_init), but also plat_dat->exit
(imx_dwmac_exit) appropriately if stmmac_dvr_probe() fails. This
results in an overall simplification of the glue driver.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c | 14 ++------------
 1 file changed, 2 insertions(+), 12 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c
index 5d279fa54b3e..b07d6f85ea90 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c
@@ -379,10 +379,6 @@ static int imx_dwmac_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	ret = imx_dwmac_init(pdev, dwmac);
-	if (ret)
-		goto err_dwmac_init;
-
 	if (dwmac->ops->fix_mac_speed) {
 		plat_dat->fix_mac_speed = dwmac->ops->fix_mac_speed;
 	} else if (!dwmac->ops->mac_rgmii_txclk_auto_adj) {
@@ -392,16 +388,10 @@ static int imx_dwmac_probe(struct platform_device *pdev)
 
 	dwmac->plat_dat->fix_soc_reset = dwmac->ops->fix_soc_reset;
 
-	ret = stmmac_dvr_probe(&pdev->dev, plat_dat, &stmmac_res);
+	ret = stmmac_pltfr_probe(&pdev->dev, plat_dat, &stmmac_res);
 	if (ret)
-		goto err_drv_probe;
-
-	return 0;
+		imx_dwmac_clks_config(dwmac, false);
 
-err_drv_probe:
-	imx_dwmac_exit(pdev, plat_dat->bsp_priv);
-err_dwmac_init:
-	imx_dwmac_clks_config(dwmac, false);
 	return ret;
 }
 
-- 
2.30.2


