Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A8F1C369B5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Apr 2025 09:30:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Px4QFGrKJWtbtdsi+c1vt/WEwND1NnX28cuVBKiVNEk=; b=MUM2LAdGSsCv1wWg5268jjZlkr
	D5nI+a58tw1IPXoiYv3pl5NaXfkXYe9OeImR9nlgUU4XnMvyWT7SNJEQbfDkMKWyvMBKnD/LiWfGB
	+uIaUtwISr43/rIVxMcLnAeAQHQNmTUy7jsBsL0CQUG+zfnbol/jkZyclSIU89ess34YzgxjxABlu
	rTk4N/XnozO5Tid/LC+3cjxxBVQa7dcDICLW9dwyD02QK4BsdJQuwaCUr5oP2gUoSl4J+j8WIA5ek
	ns32n67vDeioLcHvAbl6bcQLP4UrIQp2S3DvafKWPRzKw6sYwuwYh1fyoSV6ecMvjo2LbLavsBoke
	+C1vQ+vQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4G8X-00000001HI0-2e2F;
	Mon, 14 Apr 2025 09:29:53 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4Fmn-00000001Djk-2Hnf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Apr 2025 09:07:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:Reply-To:Content-ID
	:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
	Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Px4QFGrKJWtbtdsi+c1vt/WEwND1NnX28cuVBKiVNEk=; b=xcSBKWI5TmOKz5Gxr4tNMhNkFJ
	ZhioFfRMcU/hVAvkR85LhHSFVEQCvlffVyrCyVtrSvPveuN6lqePKWqa8Qkd9tWVNpYsjUh0DzoLq
	9FXkDibIBeIXB+2QcCRDpZhWhWGtii2O2WpusvjsbMg13FLWSZt++7E2U+m3Ym6hNbinzhIy46dZP
	pmmkbyzsoVt81xYlkVeNpP3xpV2Z9dkyP5Q1a05Gzq/FAPT65pcFqqdrxH8LspqVgGAhsXv2DRLs3
	k99CQoicutHze6S4rlcZihKhweeoIKaLB1ncAsGnHqfLjbQLu314UVuM/8r9IhQmH0BfoYnXUovCI
	McJVv1iQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:57824 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1u4Fmc-0006Da-1k;
	Mon, 14 Apr 2025 10:07:14 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1u4Flp-000XlM-Tb; Mon, 14 Apr 2025 10:06:25 +0100
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
Subject: [PATCH net-next v2] net: stmmac: imx: use stmmac_pltfr_probe()
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1u4Flp-000XlM-Tb@rmk-PC.armlinux.org.uk>
Date: Mon, 14 Apr 2025 10:06:25 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_020725_587953_E1F5B350 
X-CRM114-Status: GOOD (  10.79  )
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

Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c | 14 ++------------
 1 file changed, 2 insertions(+), 12 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c
index 5d279fa54b3e..889e2bb6f7f5 100644
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
+	ret = stmmac_pltfr_probe(pdev, plat_dat, &stmmac_res);
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


