Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F770C19F2E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 09:27:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/+jnfv4T4k7CTh7+WrQNUNK6eoyhvoxfgqp97EMPQ8g=; b=P7Jj/+mAyKWBSjCz5kz+uQeidU
	4dd/4dopmLT/LdgxoRmKYP9e3nm7OjIdnx55GeMr8ipr9X8zX9COLbMc69sch59CFa4RMq3/NyopP
	g3YHEo1Pmw0V05q1zyLNiikT+1QJE/GoceUoedPu780X/WEk6I3v6QzI/P2j+jUvGf/tINTpTgZFb
	8RUh5kBKLDBr/ARyNtI6uGDnoMjuacMm0MXv5TR3Zhig0YoxkAQ0u0t3TF0f5KWi8mcU+IxGZDAxp
	6ZZGmF2zCUGWxWyMi5b8vCRw+KA/hp5ghq646Pcks06Dojy6b2vna6IGSH+jHN8FI+zqhTRu2nFt/
	2f1S5gDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnaBA-00000006rLQ-151Z;
	Thu, 27 Feb 2025 09:27:40 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tna19-00000006plI-2T8a
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Feb 2025 09:17:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=/+jnfv4T4k7CTh7+WrQNUNK6eoyhvoxfgqp97EMPQ8g=; b=PJkQgzSIApM+YosfnFFysQpIXi
	246rbKLo/IRljGDTaHaXhM1d6ONggo3ihSiYFXVUct0NoR8RL4s8aUesdXrLTFaoFHXEoR7tDBt59
	xDc33IWpRdHqvAJqB8eVCXTKpQfeDhrZO0ya5D33+Dg+IrAUfbwiD/wMNDD0D/4yiO0TT9niP0Oa+
	CJlbxtxNdOq4nG8aZwYVFyDPZ/rYafS9FI8LFbSL31qQalFFtItcD2MW7s7bCxAurR/8Hu8Xp/d73
	/ypmP89JqkuuJGBtf/lavvs95PZc4ueLojD0FINQvwnMapricEqQVzA2AdkkO0uzQq0FWXOThpnc7
	htiRLAYg==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:38762 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1tna14-0006dC-2R;
	Thu, 27 Feb 2025 09:17:14 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1tna0k-0052t2-Cc; Thu, 27 Feb 2025 09:16:54 +0000
In-Reply-To: <Z8AtX-wyPal1auVO@shell.armlinux.org.uk>
References: <Z8AtX-wyPal1auVO@shell.armlinux.org.uk>
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
Subject: [PATCH net-next 07/11] net: stmmac: imx: use generic
 stmmac_set_clk_tx_rate()
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1tna0k-0052t2-Cc@rmk-PC.armlinux.org.uk>
Date: Thu, 27 Feb 2025 09:16:54 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_011719_625891_4F598E0E 
X-CRM114-Status: GOOD (  14.10  )
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
 .../net/ethernet/stmicro/stmmac/dwmac-imx.c   | 21 +++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c
index 610204b51e3f..5d279fa54b3e 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c
@@ -192,6 +192,19 @@ static void imx_dwmac_exit(struct platform_device *pdev, void *priv)
 	/* nothing to do now */
 }
 
+static int imx_dwmac_set_clk_tx_rate(void *bsp_priv, struct clk *clk_tx_i,
+				     phy_interface_t interface, int speed)
+{
+	struct imx_priv_data *dwmac = bsp_priv;
+
+	interface = dwmac->plat_dat->mac_interface;
+	if (interface == PHY_INTERFACE_MODE_RMII ||
+	    interface == PHY_INTERFACE_MODE_MII)
+		return 0;
+
+	return stmmac_set_clk_tx_rate(bsp_priv, clk_tx_i, interface, speed);
+}
+
 static void imx_dwmac_fix_speed(void *priv, int speed, unsigned int mode)
 {
 	struct plat_stmmacenet_data *plat_dat;
@@ -358,7 +371,6 @@ static int imx_dwmac_probe(struct platform_device *pdev)
 	plat_dat->init = imx_dwmac_init;
 	plat_dat->exit = imx_dwmac_exit;
 	plat_dat->clks_config = imx_dwmac_clks_config;
-	plat_dat->fix_mac_speed = imx_dwmac_fix_speed;
 	plat_dat->bsp_priv = dwmac;
 	dwmac->plat_dat = plat_dat;
 	dwmac->base_addr = stmmac_res.addr;
@@ -371,8 +383,13 @@ static int imx_dwmac_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_dwmac_init;
 
-	if (dwmac->ops->fix_mac_speed)
+	if (dwmac->ops->fix_mac_speed) {
 		plat_dat->fix_mac_speed = dwmac->ops->fix_mac_speed;
+	} else if (!dwmac->ops->mac_rgmii_txclk_auto_adj) {
+		plat_dat->clk_tx_i = dwmac->clk_tx;
+		plat_dat->set_clk_tx_rate = imx_dwmac_set_clk_tx_rate;
+	}
+
 	dwmac->plat_dat->fix_soc_reset = dwmac->ops->fix_soc_reset;
 
 	ret = stmmac_dvr_probe(&pdev->dev, plat_dat, &stmmac_res);
-- 
2.30.2


