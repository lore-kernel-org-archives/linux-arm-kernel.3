Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADD52C28B28
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Mar 2025 09:30:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W0NbgiSVxZElbT/GJasxYhblixLWxPwWj25QtFWdosQ=; b=KU5dUgb6WAoKmQlnFs4vkr79x4
	75TWsEHFGfcPlXl1BCs/3V8G2+f8wv0eXNjoo2+jfCUZA6vYIytM8q1nRakvKGCSYMsyY1dIN0XQU
	U5moYbzJfVJ5Do0NrjbHhh8fQn0lUKtoew335j0p0aSqjcYacK3m6Tu732RDftNIxGRDOUMQUXLoe
	7h9RXQPdkQN9ikh/ZftFa+pU9eoCr68k1CVD4vLT0gf10SBwIzstECuKlWSz/hV8DDO5/ko/AMQl0
	fZy21lZSX8ft62DfS6Ux2paJklggFlVyPT9jaieT/q5Bclkr3E+kO8m1So36Oso9GsiKSx0KBv4Xm
	SNyq/m3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsIPm-00000007yhD-2SnG;
	Wed, 12 Mar 2025 09:30:14 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsIHO-00000007wL3-3LdM;
	Wed, 12 Mar 2025 09:21:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=W0NbgiSVxZElbT/GJasxYhblixLWxPwWj25QtFWdosQ=; b=kuJac0fqff2B52fdjv7KGalsnw
	89oXdP9CjUkgUc2mcQdThOQf2Z9BB+f+eOZKdP1rAE6Dy30plm7U0q+QlqVq3lFDvnJ9yLSHqaLTm
	kll+5JUgnWRTr7mw65CAg4cyHni0FBUepse5OQccIel0bJlyfw5YO0Q+dnCKLSEOgoOJnETPNGWkB
	X9+HACLxpp+KWgfLg3X9un5jMoi1gnwg3wSdu/yw5b2fbY8Hi1TerMD/KFGaKaJy+2ccplyRZE50E
	0mvHw0H2ceWh8JCsFhu7una8FvFvn9rshmjET/jMcB6MjJsQORyFOe8g72kFdYY6dQqXnw5sSth8m
	UGRnT4Vg==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:53868 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1tsIH6-0005Cl-1w;
	Wed, 12 Mar 2025 09:21:16 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1tsIGi-005uzx-3p; Wed, 12 Mar 2025 09:20:52 +0000
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
Subject: [PATCH net-next v2 6/9] net: stmmac: rk: remove of_get_phy_mode()
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1tsIGi-005uzx-3p@rmk-PC.armlinux.org.uk>
Date: Wed, 12 Mar 2025 09:20:52 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_022134_834365_0AC355F4 
X-CRM114-Status: GOOD (  11.01  )
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

Set bsp_priv->phy_iface from plat->phy_interface.

Reviewed-by: Michal Kubiak <michal.kubiak@intel.com>
Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
index 003fa5cf42c3..40e8197812e2 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
@@ -1749,7 +1749,7 @@ static struct rk_priv_data *rk_gmac_setup(struct platform_device *pdev,
 	if (!bsp_priv)
 		return ERR_PTR(-ENOMEM);
 
-	of_get_phy_mode(dev->of_node, &bsp_priv->phy_iface);
+	bsp_priv->phy_iface = plat->phy_interface;
 	bsp_priv->ops = ops;
 
 	/* Some SoCs have multiple MAC controllers, which need
-- 
2.30.2


