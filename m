Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C442CA0EC4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Aug 2025 22:04:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M/S0cJbJg5QrypEk+l+ONw5GMA5PTBkjJDdcSmQljP8=; b=A0SLpVS9AcXS4LFzp2eqSrnPle
	QFAfKalukGciDfYmPlN4PxUSARVevMp3O+h710795cfGAH5C5ntyR3GbPKyzSnTE+RQOQfkw6yH5+
	U0HDdpbSc0gunbTLO0VG5Wc8pNKYdDrifvGPZ8GWthRZzdqQJjtBIl+/4lSIrbx66gXWzBsPzJwux
	ANdXCMWrRwfhi1iLypU1GRaMVR4ikiCzhTyFrrfbA9KbsME7VzpUQTt6Q3TDnTA5B0En2SbQ62EjC
	hQQ0UmJbSDRRV/hY/Z6X/LeYt6SYIaFviHJDD3O+zlEhcBzEFsaGHTN3c7OBkB8N/bZJEIZk5rRXg
	tOty6DZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulacu-00000009D1m-1G2y;
	Mon, 11 Aug 2025 22:04:20 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulXd7-00000008qKN-3XhN;
	Mon, 11 Aug 2025 18:52:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=M/S0cJbJg5QrypEk+l+ONw5GMA5PTBkjJDdcSmQljP8=; b=t0rlPxPGDH5hefPQCFywuhyeMV
	3u4/KinXn1lXtGJzStGXo0GOzimLzSy82f8lXcrSc5tVYFymIhKAd34+OJpjJQ4FWOTlmurw+RRY8
	19BELTfMZ+RNlXQfwfhMeIyv7zkD+zO/FlSYsKjcKypS1I7usZgMm0mIJzzqS3AXngMYn+NmwZpnI
	V5ius7P0Aff0wDeAXQaeEfkw/Ern8maQTVhqPKw7TwxqlpbjvKnvsBqcutBNx3t0u6cOlyt9V1w16
	+zboN9a7GeydNKBTtJ8GbEkS8ufMyswDWjMkoJkNzasmWLVpHWPC/dFYSqmkhJRu05vBQFpTqc4TY
	Y50M6npQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:36320 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1ulXcw-0003cQ-1b;
	Mon, 11 Aug 2025 19:52:10 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1ulXcC-008grN-Hc; Mon, 11 Aug 2025 19:51:24 +0100
In-Reply-To: <aJo7kvoub5voHOUQ@shell.armlinux.org.uk>
References: <aJo7kvoub5voHOUQ@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH net-next 9/9] net: stmmac: mediatek: convert to resume()
 method
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1ulXcC-008grN-Hc@rmk-PC.armlinux.org.uk>
Date: Mon, 11 Aug 2025 19:51:24 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_115221_882454_5D3E1020 
X-CRM114-Status: GOOD (  13.79  )
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

Convert mediatek to use the resume() platform method rather than the
init() platform method as mediatek_dwmac_init() is only called from
the resume paths.

This will ensure that in a future commit, mediatek_dwmac_init() won't
be called when probing the main part of the stmmac driver.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
index 39421d6a34e4..f1b36f0a401d 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
@@ -523,7 +523,7 @@ static int mediatek_dwmac_clk_init(struct mediatek_dwmac_plat_data *plat)
 	return ret;
 }
 
-static int mediatek_dwmac_init(struct platform_device *pdev, void *priv)
+static int mediatek_dwmac_init(struct device *dev, void *priv)
 {
 	struct mediatek_dwmac_plat_data *plat = priv;
 	const struct mediatek_dwmac_variant *variant = plat->variant;
@@ -532,7 +532,7 @@ static int mediatek_dwmac_init(struct platform_device *pdev, void *priv)
 	if (variant->dwmac_set_phy_interface) {
 		ret = variant->dwmac_set_phy_interface(plat);
 		if (ret) {
-			dev_err(plat->dev, "failed to set phy interface, err = %d\n", ret);
+			dev_err(dev, "failed to set phy interface, err = %d\n", ret);
 			return ret;
 		}
 	}
@@ -540,7 +540,7 @@ static int mediatek_dwmac_init(struct platform_device *pdev, void *priv)
 	if (variant->dwmac_set_delay) {
 		ret = variant->dwmac_set_delay(plat);
 		if (ret) {
-			dev_err(plat->dev, "failed to set delay value, err = %d\n", ret);
+			dev_err(dev, "failed to set delay value, err = %d\n", ret);
 			return ret;
 		}
 	}
@@ -589,7 +589,7 @@ static int mediatek_dwmac_common_data(struct platform_device *pdev,
 	plat->maxmtu = ETH_DATA_LEN;
 	plat->host_dma_width = priv_plat->variant->dma_bit_mask;
 	plat->bsp_priv = priv_plat;
-	plat->init = mediatek_dwmac_init;
+	plat->resume = mediatek_dwmac_init;
 	plat->clks_config = mediatek_dwmac_clks_config;
 
 	plat->safety_feat_cfg = devm_kzalloc(&pdev->dev,
@@ -654,7 +654,7 @@ static int mediatek_dwmac_probe(struct platform_device *pdev)
 		return PTR_ERR(plat_dat);
 
 	mediatek_dwmac_common_data(pdev, plat_dat, priv_plat);
-	mediatek_dwmac_init(pdev, priv_plat);
+	mediatek_dwmac_init(&pdev->dev, priv_plat);
 
 	ret = mediatek_dwmac_clks_config(priv_plat, true);
 	if (ret)
-- 
2.30.2


