Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0840C28B2E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Mar 2025 12:20:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C2J7It/Oz8V/6DJlCuoWioo0hdYA+fgxJxCsMcwHZ74=; b=SAiSHWvJpqphtI/ZL15cTha37+
	z02beECISFxYZezt7jXF1DJdjtzS8u4MNUjB3YE2BKwukciddlHZsbxI2LpoG8PcxmQgyLJaLDGMu
	2fPupXuUc1erVZHyC5s2d9E7DxhobxltHHR29UbRfKCSu7teb5rpcOepX4zkk8wOqR7PqWxq34btf
	uxE7WkUDnmDoWUYSyZZTSNsjg45qxJQgfId+KsR6lfrCsogMnQJPSY7WM7p3EOXUsS24X3mDXg7tg
	oxOsef+E7HXGOYibou/ZYxJsrfQLPraFXV8ZmTK3iOjMuPxTD8evCjcWzdHKHeX7hJVeW1SIE3UJ7
	DARObcJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trc7H-00000002aRv-3iqc;
	Mon, 10 Mar 2025 12:20:19 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trbyF-00000002Y54-3xd6;
	Mon, 10 Mar 2025 12:11:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=C2J7It/Oz8V/6DJlCuoWioo0hdYA+fgxJxCsMcwHZ74=; b=nrlJ7efd6dbrK9/guO02Apk4yu
	RdDwTm5R7ex3gOpEqaLrUIt45MO0DFIWWYcjh/Ed9fXu2bmvuye50gjqAtG9PG99RZ6ijLgWlPYzc
	BXUfQFNXSseemeVHN8n6bDjozznBHLdaGXpcQ4WQyIzhiZ+H+iVegitWNleZusMapGSr4h9dMOtLI
	J3vTWPBCN8ugusgJSF49sp8wrKSbHLdQwnNtM+s6JDLOfPpkaOtle5eG66s4aDoHhnRHd4oTbhKMy
	niz2dz12fSbm6xm6/QzQLUdHIl/jBZ0z3qCAmJrlNLehoBt3yUiC55TT71hAmCFh2dxalkIQM/f/C
	teRrYfIA==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:40480 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1trby0-0002YH-0g;
	Mon, 10 Mar 2025 12:10:44 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1trbxf-005qY4-QD; Mon, 10 Mar 2025 12:10:23 +0000
In-Reply-To: <Z87WVk0NzMUyaxDj@shell.armlinux.org.uk>
References: <Z87WVk0NzMUyaxDj@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chen-Yu Tsai <wens@csie.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-sunxi@lists.linux.dev,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	Samuel Holland <samuel@sholland.org>,
	Vinod Koul <vkoul@kernel.org>
Subject: [PATCH net-next 2/9] net: stmmac: mediatek: remove of_get_phy_mode()
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1trbxf-005qY4-QD@rmk-PC.armlinux.org.uk>
Date: Mon, 10 Mar 2025 12:10:23 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_051059_979897_8C11D161 
X-CRM114-Status: GOOD (  10.63  )
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

devm_stmmac_probe_config_dt() already gets the PHY mode from firmware,
which is stored in plat_dat->phy_interface. Therefore, we don't need to
get it in platform code.

Initialise priv_plat->phy_mode from plat->phy_interface
inmediatek_dwmac_common_data().

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
index c9636832a570..d178d5ddc7c7 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
@@ -456,7 +456,6 @@ static int mediatek_dwmac_config_dt(struct mediatek_dwmac_plat_data *plat)
 {
 	struct mac_delay_struct *mac_delay = &plat->mac_delay;
 	u32 tx_delay_ps, rx_delay_ps;
-	int err;
 
 	plat->peri_regmap = syscon_regmap_lookup_by_phandle(plat->np, "mediatek,pericfg");
 	if (IS_ERR(plat->peri_regmap)) {
@@ -464,12 +463,6 @@ static int mediatek_dwmac_config_dt(struct mediatek_dwmac_plat_data *plat)
 		return PTR_ERR(plat->peri_regmap);
 	}
 
-	err = of_get_phy_mode(plat->np, &plat->phy_mode);
-	if (err) {
-		dev_err(plat->dev, "not find phy-mode\n");
-		return err;
-	}
-
 	if (!of_property_read_u32(plat->np, "mediatek,tx-delay-ps", &tx_delay_ps)) {
 		if (tx_delay_ps < plat->variant->tx_delay_max) {
 			mac_delay->tx_delay = tx_delay_ps;
@@ -587,6 +580,7 @@ static int mediatek_dwmac_common_data(struct platform_device *pdev,
 {
 	int i;
 
+	priv_plat->phy_mode = plat->phy_interface;
 	plat->mac_interface = priv_plat->phy_mode;
 	if (priv_plat->mac_wol)
 		plat->flags &= ~STMMAC_FLAG_USE_PHY_WOL;
-- 
2.30.2


