Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7B13C71157
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Jun 2025 12:57:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6mgaMI7KGD4pS6alDlp2sBmddfdxQnXyO5MWUiHeyco=; b=HddF76Pfq0gik5Hox1ZE4NjFnl
	oF65DP4FcxpB2mwpIXwfu3YNlBwxsAv8O+ZUOayoec1XGxqEk+n6RJleZqAp9DrKBujBDfXFGyxtU
	lnTTJ1C9YaoSlC8ivDHN2Q3un1nE74NaYNWbuJIwLMpD4p49mzoHG0Vc/4fOdSARVpwgUiltYXL86
	tHcSjuJDmJU0AmkFrDMFgan4iHg+PvZhr/5zZACaU3Tzuld+y9xmbHoMYkO73IQabeplmphUIMYQF
	PrfXmAKJL7+U7Eff48njx1RcwtQjyyoRj26F8Bkrv4ugYs0ZT1NugqkvTXvnRvsCmvmxDJMiy22Dt
	UQRL2ySA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRsLf-0000000ACWV-3xEJ;
	Wed, 18 Jun 2025 12:57:03 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRqF1-00000009pAm-3Kq7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Jun 2025 10:42:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=6mgaMI7KGD4pS6alDlp2sBmddfdxQnXyO5MWUiHeyco=; b=i4DE1g+8ScfscRCh/k2xpefEJ1
	UI6NDd71UiLzgRKm73RURSRGirlStEveQZyNdvhDwPLgiPndLJHSalVwCXDqVZr/5Qa36qNmZoaS+
	mvsl1uV/+VuSTUZRgYTqVdxwSR2s10Q+ZCe2Ot7uv8b/rwOwkjHQVG6FmqT6glt1GhjmUXfklWmaY
	Z8IKLbkGMxb6S2e12kPGuUxYXNGlbPt/5MvEc4QyIlpYd4qb2roG8M+PuJD8M9bfWiycjNBbJIIom
	A4EAWlVRVSfPLDIRuFBowBCYP+UjXVpzP3Nzb+JVtcVLZz4TiNzlP8HfFhDWMmhfokDqmHwF0aBpY
	wuxjfvYA==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:39068 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1uRqEt-0006In-02;
	Wed, 18 Jun 2025 11:41:55 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1uRqEE-004c7M-Go; Wed, 18 Jun 2025 11:41:14 +0100
In-Reply-To: <aFKXzlno7HkG-cNh@shell.armlinux.org.uk>
References: <aFKXzlno7HkG-cNh@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Keguang Zhang <keguang.zhang@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH net-next 2/2] net: stmmac: loongson1: get ls1b resource only
 once
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1uRqEE-004c7M-Go@rmk-PC.armlinux.org.uk>
Date: Wed, 18 Jun 2025 11:41:14 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_034203_835131_CF2D7F9C 
X-CRM114-Status: GOOD (  17.72  )
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

ls1b_dwmac_syscon_init() was getting the stmmac iomem resource to detect
which GMAC block is being used. Move this to a separate setup() function
that only runs at probe time, so it can sensibly behave with an
unrecognised resource adress. Use this to set a MAC index (id) which is
then used in place of testing the base address.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../ethernet/stmicro/stmmac/dwmac-loongson1.c | 49 ++++++++++++++-----
 1 file changed, 37 insertions(+), 12 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson1.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson1.c
index 78d9540be10c..32b5d1492e2e 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson1.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson1.c
@@ -44,28 +44,50 @@
 struct ls1x_dwmac {
 	struct plat_stmmacenet_data *plat_dat;
 	struct regmap *regmap;
+	unsigned int id;
 };
 
 struct ls1x_data {
+	int (*setup)(struct platform_device *pdev,
+		     struct plat_stmmacenet_data *plat_dat);
 	int (*init)(struct platform_device *pdev, void *bsp_priv);
 };
 
-static int ls1b_dwmac_syscon_init(struct platform_device *pdev, void *priv)
+static int ls1b_dwmac_setup(struct platform_device *pdev,
+			    struct plat_stmmacenet_data *plat_dat)
 {
-	struct ls1x_dwmac *dwmac = priv;
-	struct plat_stmmacenet_data *plat = dwmac->plat_dat;
-	struct regmap *regmap = dwmac->regmap;
+	struct ls1x_dwmac *dwmac = plat_dat->bsp_priv;
 	struct resource *res;
-	unsigned long reg_base;
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	if (!res) {
+		/* This shouldn't fail - stmmac_get_platform_resources()
+		 * already mapped this resource.
+		 */
 		dev_err(&pdev->dev, "Could not get IO_MEM resources\n");
 		return -EINVAL;
 	}
-	reg_base = (unsigned long)res->start;
 
-	if (reg_base == LS1B_GMAC0_BASE) {
+	if (res->start == LS1B_GMAC0_BASE) {
+		dwmac->id = 0;
+	} else if (res->start == LS1B_GMAC1_BASE) {
+		dwmac->id = 1;
+	} else {
+		dev_err(&pdev->dev, "Invalid Ethernet MAC base address %pR",
+			res);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int ls1b_dwmac_syscon_init(struct platform_device *pdev, void *priv)
+{
+	struct ls1x_dwmac *dwmac = priv;
+	struct plat_stmmacenet_data *plat = dwmac->plat_dat;
+	struct regmap *regmap = dwmac->regmap;
+
+	if (dwmac->id == 0) {
 		switch (plat->phy_interface) {
 		case PHY_INTERFACE_MODE_RGMII_ID:
 			regmap_update_bits(regmap, LS1X_SYSCON0,
@@ -84,7 +106,7 @@ static int ls1b_dwmac_syscon_init(struct platform_device *pdev, void *priv)
 		}
 
 		regmap_update_bits(regmap, LS1X_SYSCON0, GMAC0_SHUT, 0);
-	} else if (reg_base == LS1B_GMAC1_BASE) {
+	} else if (dwmac->id == 1) {
 		regmap_update_bits(regmap, LS1X_SYSCON0,
 				   GMAC1_USE_UART1 | GMAC1_USE_UART0,
 				   GMAC1_USE_UART1 | GMAC1_USE_UART0);
@@ -108,10 +130,6 @@ static int ls1b_dwmac_syscon_init(struct platform_device *pdev, void *priv)
 		}
 
 		regmap_update_bits(regmap, LS1X_SYSCON1, GMAC1_SHUT, 0);
-	} else {
-		dev_err(&pdev->dev, "Invalid Ethernet MAC base address %lx",
-			reg_base);
-		return -EINVAL;
 	}
 
 	return 0;
@@ -183,10 +201,17 @@ static int ls1x_dwmac_probe(struct platform_device *pdev)
 	dwmac->plat_dat = plat_dat;
 	dwmac->regmap = regmap;
 
+	if (data->setup) {
+		ret = data->setup(pdev, plat_dat);
+		if (ret)
+			return ret;
+	}
+
 	return devm_stmmac_pltfr_probe(pdev, plat_dat, &stmmac_res);
 }
 
 static const struct ls1x_data ls1b_dwmac_data = {
+	.setup = ls1b_dwmac_setup,
 	.init = ls1b_dwmac_syscon_init,
 };
 
-- 
2.30.2


