Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14B11C02198
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 11:21:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2/XmkhtAV+FFIrfL1mhnGOI2K1euQozYUfSv7gmJ9co=; b=LieFMBmS1xkRIkDNtTPxgROXpe
	Agc2quYjMuH84A/NZ4nZrFENYNFnIw2Fq4E1wayNZOHoShv2KrMpTa4P+3fASTh84uLea1eEcaQKK
	CMe5BSwa5suLgewscgYBwdvlAFoTS/giqzRCutKcDEU0lyn91ppbNsongGSUDaExuiJHzkC5e7RxB
	4wCC+VIi90wO6pK6+xXTBrru2OiFjrIib3CFqnkXZKedM/0vAtV31vErZgVntBV1Q5L9QJ95TFY1J
	Ab+wiF+/N70qTNa7noDU0XVFcI/pxXzKH5b54llOISrE7psZvTfuPdKKLp8d6i7pnIhlKXNt6K0F6
	dWmmK29A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkLes-00000007vrz-11kb;
	Tue, 18 Feb 2025 11:20:58 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkLZS-00000007uDc-0UmJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Feb 2025 11:15:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=2/XmkhtAV+FFIrfL1mhnGOI2K1euQozYUfSv7gmJ9co=; b=uv9rtdpwhiejEz7za9uMb8NeEP
	T8sqYCrF2FK1nOq2k3i69Zn4D9jcQdyiUoVFaDyDH341bsUxurlO34kwJY1kwsHEnGdbtsuuB380d
	10cJ0dc1cYBh7NFv9er7l+XjWCZG/Q+XdrQa7ImH/p78W2lMmb7Su3NFOispLhDG4odjaBvftIANj
	mQ2jsO4yfa5oJ3IHKNKonLXN8XrMwn33i/Df21BO/CqUrOvct1lxSk4IwOdVwmkyCZAz8VDB8O0rE
	fTA5/YCgmF7uyWGOqmTn6jth30rYvy2RLC4CeUzPjvUOxR11Jq+8Hnqf+XTXWywftyOFI7ovH+Ste
	7WaWUNdA==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:42754 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1tkLZG-0001iW-1L;
	Tue, 18 Feb 2025 11:15:10 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1tkLYv-004RZ7-Ot; Tue, 18 Feb 2025 11:14:49 +0000
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
Subject: [PATCH RFC net-next 3/7] net: stmmac: dwc-qos-eth: use generic
 stmmac_set_clk_tx_rate()
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1tkLYv-004RZ7-Ot@rmk-PC.armlinux.org.uk>
Date: Tue, 18 Feb 2025 11:14:49 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_031522_155202_59811A3D 
X-CRM114-Status: GOOD (  12.73  )
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
 .../net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c    | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c
index 392574bdd4a4..581c0b40db57 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c
@@ -30,7 +30,6 @@ struct tegra_eqos {
 
 	struct reset_control *rst;
 	struct clk *clk_slave;
-	struct clk *clk_tx;
 
 	struct gpio_desc *reset;
 };
@@ -145,7 +144,6 @@ static void tegra_eqos_fix_speed(void *priv, int speed, unsigned int mode)
 {
 	struct tegra_eqos *eqos = priv;
 	bool needs_calibration = false;
-	long rate = 125000000;
 	u32 value;
 	int err;
 
@@ -156,7 +154,6 @@ static void tegra_eqos_fix_speed(void *priv, int speed, unsigned int mode)
 		fallthrough;
 
 	case SPEED_10:
-		rate = rgmii_clock(speed);
 		break;
 
 	default:
@@ -203,10 +200,6 @@ static void tegra_eqos_fix_speed(void *priv, int speed, unsigned int mode)
 		value &= ~AUTO_CAL_CONFIG_ENABLE;
 		writel(value, eqos->regs + AUTO_CAL_CONFIG);
 	}
-
-	err = clk_set_rate(eqos->clk_tx, rate);
-	if (err < 0)
-		dev_err(eqos->dev, "failed to set TX rate: %d\n", err);
 }
 
 static int tegra_eqos_init(struct platform_device *pdev, void *priv)
@@ -246,7 +239,7 @@ static int tegra_eqos_probe(struct platform_device *pdev,
 			eqos->clk_slave = data->clks[i].clk;
 			data->stmmac_clk = eqos->clk_slave;
 		} else if (strcmp(data->clks[i].id, "tx") == 0) {
-			eqos->clk_tx = data->clks[i].clk;
+			data->clk_tx_i = data->clks[i].clk;
 		}
 	}
 
@@ -282,6 +275,7 @@ static int tegra_eqos_probe(struct platform_device *pdev,
 
 bypass_clk_reset_gpio:
 	data->fix_mac_speed = tegra_eqos_fix_speed;
+	data->set_clk_tx_rate = stmmac_set_clk_tx_rate;
 	data->init = tegra_eqos_init;
 	data->bsp_priv = eqos;
 	data->flags |= STMMAC_FLAG_SPH_DISABLE;
-- 
2.30.2


