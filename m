Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 800B7C02198
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 11:27:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=egE6Imi9/zFZI6ddMfGQj0O+zjcfKqrXVuMKePa4lo8=; b=N8Hhb33RokgeFR9gpidS6ppPbC
	gGGWGgAsTIjRSPM8FHBz8Tv26Jm92DjEhbPqL4Sbxoj64CAMU/cv0WWjrDy1VPVrs2fU8k4IWRF/K
	zr8JjAEK3IT8F+Hywr/yzVZOFQMm03iluglrPm3iurnXSLzwP2Ru5PEE7WDlAUKdyD647asR/bggG
	bdnYeCL5SvRXGpkj0TYrDDQt7Ee0sCb/8wF6H7inAu73H/mIzljUxsEJLF2Rb6bj8uIUW65BnIqnf
	QIsFBQWJGJ+/aZqjWz3nTESOOYjyAz0Ovu1DlPDmZB5/MkC6KJIKMjYvXB8tsljx1bJYb/dlUvjhn
	FIBvcXSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkLkb-00000007wxF-0AQZ;
	Tue, 18 Feb 2025 11:26:53 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkLZk-00000007uII-3VJJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Feb 2025 11:15:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=egE6Imi9/zFZI6ddMfGQj0O+zjcfKqrXVuMKePa4lo8=; b=J8ENV8RBGRDX/flzYkVySAFGgB
	3yzDo91onefKLd7za2XkSoq0Chw3noLRPML7aRmb42941+E0g9nOHT7lUqE2x9K2CS3Bq9ARRpI+a
	3UH6MDc4/mBkkjv66nQGDlqvFS+7rLJDWPrTJUKyU0OhXo4vgqeIHKVPkwHANbGcNbOyEryzszV0c
	FHexS9szRpIOtTvPPqgG/AWXSZtwh/se0VtaAQBpiW8MAybzQLv3IQaVZtm7NCLfFS9dl/S54PvNm
	C1oiHL+QfTpbLLDQbdEtNStozNg6DTSWLAr8vqzEmGeYkNGxDtXos550ZNk+FbvkTza9VdMIc7fiH
	xY4wvSIw==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:50890 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1tkLZb-0001kF-11;
	Tue, 18 Feb 2025 11:15:31 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1tkLZG-004RZb-8Y; Tue, 18 Feb 2025 11:15:10 +0000
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
Subject: [PATCH RFC net-next 7/7] net: stmmac: imx: use generic
 stmmac_set_clk_tx_rate()
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1tkLZG-004RZb-8Y@rmk-PC.armlinux.org.uk>
Date: Tue, 18 Feb 2025 11:15:10 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_031540_870880_9FE798FE 
X-CRM114-Status: GOOD (  12.12  )
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

Convert non-i.MX93 users to use the generic stmmac_set_clk_tx_rate() to
configure the MAC transmit clock rate.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c
index 610204b51e3f..927ce8d97f78 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c
@@ -358,7 +358,6 @@ static int imx_dwmac_probe(struct platform_device *pdev)
 	plat_dat->init = imx_dwmac_init;
 	plat_dat->exit = imx_dwmac_exit;
 	plat_dat->clks_config = imx_dwmac_clks_config;
-	plat_dat->fix_mac_speed = imx_dwmac_fix_speed;
 	plat_dat->bsp_priv = dwmac;
 	dwmac->plat_dat = plat_dat;
 	dwmac->base_addr = stmmac_res.addr;
@@ -371,8 +370,12 @@ static int imx_dwmac_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_dwmac_init;
 
+	plat_dat->clk_tx_i = dwmac->clk_tx;
 	if (dwmac->ops->fix_mac_speed)
 		plat_dat->fix_mac_speed = dwmac->ops->fix_mac_speed;
+	else
+		plat_dat->set_clk_tx_rate = stmmac_set_clk_tx_rate;
+
 	dwmac->plat_dat->fix_soc_reset = dwmac->ops->fix_soc_reset;
 
 	ret = stmmac_dvr_probe(&pdev->dev, plat_dat, &stmmac_res);
-- 
2.30.2


