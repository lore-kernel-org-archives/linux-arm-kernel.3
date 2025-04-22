Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63B7DC369C2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 15:48:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=UGzgge4Cct38yOd3/tCKvJ3b1vaJwT3ZIRj1lNpp1cE=; b=aOlWi/ExwOxDd2x0CX6Ob65Tto
	5GajaTwie2Gf4+5eSi3A9fzA46/40GPQiaDHtmqVX1rhbq36+DeKU7SSElD8O18cjW2bvrRcNYF7j
	HqLYU1mjywCyln5tGjP1UaScmm0NdJqNW1p1nqTeR0TY5vi8tkNyyFbd4yFpfuk0wpVMSikfbv8mF
	vh2wRb/r7KR17YZeoODCEQE0eImeTsTM7c8NNZywdjjn01y2rYKvvPBuITN61nitBMU8rLK9snHd1
	5lhfSE1jq5D/CPEtKZU2Ub/Olhr8cigHvoksdYWU8SukbOuS5VEBLudvEMlJlJM0CtsQBDX5jORxF
	MksVCr0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7FrU-00000007n0W-3JVQ;
	Tue, 22 Apr 2025 15:48:40 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7EbA-00000007TyO-1Kif
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Apr 2025 14:27:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:Reply-To:Content-ID
	:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
	Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=UGzgge4Cct38yOd3/tCKvJ3b1vaJwT3ZIRj1lNpp1cE=; b=Pz1Pef2mUjNlncbUlh4coJX08W
	syEuOi4qCz9N+6w/3/C0Q2wH1XYMGHiKOgUslqVcaq68uujJmdmybQThAOKqPHirQ5k2XNBTDf5Qj
	ST7xWSIleEJX8ROMiyV3e+BAoLmG45LBY4qZkAUNOk+hcUSdlOSmy5Q/EJWvpemv7fjn4MpBnlK59
	LCcIlymVpdDXLyASzJW1jDCff4YLc/8SKSVU37eOB3DeIWvghUj7ybqvuSutMLvMYfKvszKm75jEb
	kjG7SjdMNfQEi92KAB1taIsfMsel4aqkxaRpDzX0YSqjseFXjICIALzo3IHU6J5iCOJrELUycaLAi
	XB00jkNw==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:53204 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1u7EZ3-0004WB-04;
	Tue, 22 Apr 2025 15:25:33 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1u7EYR-001ZAS-Cr; Tue, 22 Apr 2025 15:24:55 +0100
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	Thierry Reding <treding@nvidia.com>
Subject: [PATCH net-next] net: stmmac: dwc-qos: calibrate tegra with mdio bus
 idle
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1u7EYR-001ZAS-Cr@rmk-PC.armlinux.org.uk>
Date: Tue, 22 Apr 2025 15:24:55 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_072744_347023_ED7B3A0F 
X-CRM114-Status: GOOD (  12.85  )
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

Thierry states that there are prerequists for Tegra's calibration
that should be met before starting calibration - both the RGMII and
MDIO interfaces should be idle.

This commit adds the necessary MII bus locking to ensure that the MDIO
interface is idle during calibration.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c  | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c
index fa900b4991d0..09ae16e026eb 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c
@@ -136,10 +136,11 @@ static int dwc_qos_probe(struct platform_device *pdev,
 #define AUTO_CAL_STATUS 0x880c
 #define  AUTO_CAL_STATUS_ACTIVE BIT(31)
 
-static void tegra_eqos_fix_speed(void *priv, int speed, unsigned int mode)
+static void tegra_eqos_fix_speed(void *bsp_priv, int speed, unsigned int mode)
 {
-	struct tegra_eqos *eqos = priv;
+	struct tegra_eqos *eqos = bsp_priv;
 	bool needs_calibration = false;
+	struct stmmac_priv *priv;
 	u32 value;
 	int err;
 
@@ -158,6 +159,11 @@ static void tegra_eqos_fix_speed(void *priv, int speed, unsigned int mode)
 	}
 
 	if (needs_calibration) {
+		priv = netdev_priv(dev_get_drvdata(eqos->dev));
+
+		/* Calibration should be done with the MDIO bus idle */
+		mutex_lock(&priv->mii->mdio_lock);
+
 		/* calibrate */
 		value = readl(eqos->regs + SDMEMCOMPPADCTRL);
 		value |= SDMEMCOMPPADCTRL_PAD_E_INPUT_OR_E_PWRD;
@@ -191,6 +197,8 @@ static void tegra_eqos_fix_speed(void *priv, int speed, unsigned int mode)
 		value = readl(eqos->regs + SDMEMCOMPPADCTRL);
 		value &= ~SDMEMCOMPPADCTRL_PAD_E_INPUT_OR_E_PWRD;
 		writel(value, eqos->regs + SDMEMCOMPPADCTRL);
+
+		mutex_unlock(&priv->mii->mdio_lock);
 	} else {
 		value = readl(eqos->regs + AUTO_CAL_CONFIG);
 		value &= ~AUTO_CAL_CONFIG_ENABLE;
-- 
2.30.2


