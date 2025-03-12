Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F7EBC28B28
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Mar 2025 09:38:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KNEx5jzwPvwr7ykDlaOKF6gqglD3Hpy85JFTNBLEoE0=; b=jFV4BUtE+uJ57GInNbZHRu9voC
	+8PgDBOfrk5GkaeZU8FinvalRgxcolrAPfmwtF3UtOA+uABLyO6bKEzx7cUyiCPWB69qr8KU8DKHH
	Dg9sHFL1DGw9WCTPBupC45hcjFDMFYs4Hx5sQHmfN7RLUcHV7IkK0Igs1sb3MRUqWN10ON3E7qWzd
	gQSnHHQDomdF+ImHAchvUq7ae+v7izYweYlwkgnfrt6jT29gXPdo2aY3xzvWla1dHciceKhRJcSXn
	MyAhwGYt/y28z2+wicjdb9KkWfqhWzmnvaEUEORCg7ouki1WBuHehwIdCJX/XZZNQxVA7zmVnDZEv
	ExG80BjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsIXv-0000000807j-0eLy;
	Wed, 12 Mar 2025 09:38:39 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsIIr-00000007wDy-2smi;
	Wed, 12 Mar 2025 09:23:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=KNEx5jzwPvwr7ykDlaOKF6gqglD3Hpy85JFTNBLEoE0=; b=jBcSywxCqB/W8XhBRI64/ZCifq
	/E7pDVm/9rG1Cpvnsgantc1dpBTFBrWYn3ANxeT+QhpW3qyMw+ctpcXtIF1aDkpX8gXwYFuKeebog
	aK1XXzHiGeKOmoRb4BE5E7U+lvdjSGi9A/c0liJgX5EuUdjTE6Vd6f5udnpRI/wtW9YYYe8S24816
	L9WeRPGM/qhUADHV1ZypzvrjURk3Mc6bJjWvHtWQZ+aZbd+redGf6rTAKIn11JmZPUVjSXB1q1hbe
	uZXWmn4FX/0xOmB09NukpAYNIKBaY1W4RZBLubRe7xcjRRqUyk1zsn7V7CK6dVYZ7RnIYTp4qo9QW
	y+/SYyGQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:39526 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1tsIGi-0005BT-2O;
	Wed, 12 Mar 2025 09:20:52 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1tsIGN-005uzZ-NG; Wed, 12 Mar 2025 09:20:31 +0000
In-Reply-To: <Z9FQjQZb0IMaQJ9H@shell.armlinux.org.uk>
References: <Z9FQjQZb0IMaQJ9H@shell.armlinux.org.uk>
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
Subject: [PATCH net-next v2 2/9] net: stmmac: mediatek: remove
 of_get_phy_mode()
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1tsIGN-005uzZ-NG@rmk-PC.armlinux.org.uk>
Date: Wed, 12 Mar 2025 09:20:31 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_022305_718248_16F78C18 
X-CRM114-Status: GOOD (  10.70  )
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

Reviewed-by: Michal Kubiak <michal.kubiak@intel.com>
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


