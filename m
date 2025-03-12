Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7118CC28B28
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Mar 2025 09:33:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zdQ05E0CCJC6d2gqbE2jKk/Dzk1xwVqyvMSRnAmbTXA=; b=oaAD/WVpFVoAAdOY0peNUUphOi
	KXnySKYVCLMLAw58bTmJ7UGIKe4Mgmf+IzZvQrkjagnCdz8N/I4sW2tVyRjN7w7yy15n96yLvOOJi
	419OUAsiO1PIYS+rKtjBhAT52rZB67EKtbN4KxFZ9/D++YaRzD2Rp64oQsQ0PKwKgDu1CgNEw4HNs
	6MJxQDVmoBsddAqEwOJaqSkoFNZ4Lvj9jydpqyTJoNcUWmBMN56y851olQONlJkwDRFpfYb1p+fkH
	tq9l0mGsqYfeQZZrDx4ZPFRnumcLG4cY5uvqdAwfJK0jnLBL51LdH2VIQvOzPP7g5BpGZBK+asQF0
	5lZK6FAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsIT1-00000007z8L-3uRk;
	Wed, 12 Mar 2025 09:33:35 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsIHa-00000007wQa-32a7;
	Wed, 12 Mar 2025 09:21:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description;
	bh=zdQ05E0CCJC6d2gqbE2jKk/Dzk1xwVqyvMSRnAmbTXA=; b=QqppiRXA4p+QalxP0LKi82/N+3
	fMVsW51DHtckqbOr7zBc7LjEfZuk+S3GI/XUls8t1qqMZ4PcjoiE4LxXswyiX4C+UzL+2hpK68UzA
	tzJtYLmCZPFYOneaeEHOLNfLicS+N5kNN9wjvAkpDniIZTSgyOAyonajc4pjbfN1JG+x20sKV4+N1
	uYmOhOIYU7Dv4MaU8P1TJYKhWIfNoukcU2T9pWVvKoxzOKEZ6yK1GCBvbQ+VxCfxbb7L8+qMh3mOy
	tMJIgeC+BIRR0tSLVEXR3zmEUosesqI3RfKjDW9ejjeFULqQrIeRD0yqr2xaqy+q0nXCFjf3h9Gnv
	7zuRCeXg==;
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsIHX-00000002LLR-3tBt;
	Wed, 12 Mar 2025 09:21:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=zdQ05E0CCJC6d2gqbE2jKk/Dzk1xwVqyvMSRnAmbTXA=; b=hgH4JP9fiiQhoHscRKxBJxWw7v
	5T0kdiYJ6Q1Zi/U7CMQSSAxc386U1wORQslxF+r84IscKwdL/6y98pb7m451yzHlNRbCffM4iQSEN
	TWoNBb/qZbIEKNrgRix13/kV9+n0Kz9bnw9ajnzOIXoYr1YTgYu8iOBy0RwYToSi1OzULusZOeSHZ
	a7Z3Y58pTRJzhxp8eIDKhrUtlMQfs973lyjkdXkHgeacYRYBM5qP7/8r0rgrCQXdhDPlRyaE+kqsb
	UeYt/XY5xKSnMSq7yhgZjfDcZC1gdjr+JPGOcp5HrS30b0AfahPgEC8xlY2lVJZyA8VLkN/X1UqyN
	Hd73XOdQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:35446 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1tsIHF-0005DJ-2N;
	Wed, 12 Mar 2025 09:21:25 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1tsIGs-005v09-CD; Wed, 12 Mar 2025 09:21:02 +0000
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
Subject: [PATCH net-next v2 8/9] net: stmmac: sun8i: remove of_get_phy_mode()
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1tsIGs-005v09-CD@rmk-PC.armlinux.org.uk>
Date: Wed, 12 Mar 2025 09:21:02 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_092144_109914_467A90A5 
X-CRM114-Status: GOOD (  11.70  )
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

sun8i was using of_get_phy_mode() to set plat_dat->mac_interface, which
defaults to plat_dat->phy_interface when the mac-mode DT property is
not present. As nothing in arch/*/boot/dts sets the mac-mode property,
it is highly likely that these two will be identical, and thus there
is no need for this glue driver to set plat_dat->mac_interface.

Reviewed-by: Andre Przywara <andre.przywara@arm.com>
Reviewed-by: Michal Kubiak <michal.kubiak@intel.com>
Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
index 4b7b2582a120..85723a78793a 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
@@ -1155,11 +1155,10 @@ static int sun8i_dwmac_probe(struct platform_device *pdev)
 	struct stmmac_resources stmmac_res;
 	struct sunxi_priv_data *gmac;
 	struct device *dev = &pdev->dev;
-	phy_interface_t interface;
-	int ret;
 	struct stmmac_priv *priv;
 	struct net_device *ndev;
 	struct regmap *regmap;
+	int ret;
 
 	ret = stmmac_get_platform_resources(pdev, &stmmac_res);
 	if (ret)
@@ -1219,10 +1218,6 @@ static int sun8i_dwmac_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	ret = of_get_phy_mode(dev->of_node, &interface);
-	if (ret)
-		return -EINVAL;
-
 	plat_dat = devm_stmmac_probe_config_dt(pdev, stmmac_res.mac);
 	if (IS_ERR(plat_dat))
 		return PTR_ERR(plat_dat);
@@ -1230,7 +1225,6 @@ static int sun8i_dwmac_probe(struct platform_device *pdev)
 	/* platform data specifying hardware features and callbacks.
 	 * hardware features were copied from Allwinner drivers.
 	 */
-	plat_dat->mac_interface = interface;
 	plat_dat->rx_coe = STMMAC_RX_COE_TYPE2;
 	plat_dat->tx_coe = 1;
 	plat_dat->flags |= STMMAC_FLAG_HAS_SUN8I;
-- 
2.30.2


