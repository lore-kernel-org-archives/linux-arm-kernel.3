Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BA58CF3189
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 10:04:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5V2uzI+1et/pfg0laFa3ARS/PjNLaLny1e5YwBh3QzM=; b=GPV/lgIekyDlJEPfJ3My5vRkAb
	9iMu+k2agJ8+cesb7pGq96rw5Uw4NszoR0gnHHMfwjqE276TJUBQsUoZF4p4LJGmzBzo1W7LMxu+a
	ufTT3JsXv1+WC9WPtZTj2EPzxYVfYD4P5tynN57KpWLa3kC1L77EzBbUN9JojzQQ1jZQkytTtFF6O
	zKiOdiCybqji3DsrB3Ob4rMHrWaF5s697hk37jvyvOxc0Gfv13CQIVOfKq5P6iF9mapnjyCgNyU1Q
	EB/zxJXho9VhwB5xesjfkIUDQHenp57kyOA5TDU/sjohAw2aMISKWDlK1FPET3i2NsKKB99m0TmxN
	K3wNC0pQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLf3M-00000002vGn-2M0f;
	Wed, 19 Nov 2025 10:04:44 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLf3G-00000002vCJ-3pOj;
	Wed, 19 Nov 2025 10:04:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=5V2uzI+1et/pfg0laFa3ARS/PjNLaLny1e5YwBh3QzM=; b=P3p760nGwF+ypC/xZA4/96ZX7u
	kImF96bFCQenuZWCzfFehLqSMqNHzwfb0wdKBv8VQMhMNXohcdS8+ESSF++scFbKyRRactdaxrkWe
	DNqSKkbamd90NDaM5w7t8T09k+vJR78DfSjACLIqS7HJ/mb73tT2rqKNe+CHZ50Sz8l8m4ey8oV5W
	Ox/MQ03dXae5BzH+XK0NkOrRBFymUusjVXe0idFtM0XAznCUee9hTJnHZMPVA60LHp1vek1ZXZLvO
	DfY/PDbU6RgvIlWl1Grlj6LgJCJvGnpj6Q4IFBfMVrcyBHSrNmy0emM23xCbxRd2vA+FT5Ac9wSYp
	E1uMIW+Q==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:45658 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vLf2h-000000004RN-0FF2;
	Wed, 19 Nov 2025 10:04:03 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vLf2e-0000000FMNN-1Xnh;
	Wed, 19 Nov 2025 10:04:00 +0000
In-Reply-To: <aR2V0Kib7j0L4FNN@shell.armlinux.org.uk>
References: <aR2V0Kib7j0L4FNN@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Chen-Yu Tsai <wens@csie.org>,
	"David S. Miller" <davem@davemloft.net>,
	Drew Fustini <fustini@kernel.org>,
	Eric Dumazet <edumazet@google.com>,
	Fu Wei <wefu@redhat.com>,
	Guo Ren <guoren@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Jakub Kicinski <kuba@kernel.org>,
	Jan Petrous <jan.petrous@oss.nxp.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Keguang Zhang <keguang.zhang@gmail.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-sunxi@lists.linux.dev,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	s32@nxp.com,
	Samuel Holland <samuel@sholland.org>
Subject: [PATCH net-next 3/3] net: stmmac: rk: convert to init()/exit()
 methods
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1vLf2e-0000000FMNN-1Xnh@rmk-PC.armlinux.org.uk>
Date: Wed, 19 Nov 2025 10:04:00 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_020438_978064_390E090B 
X-CRM114-Status: GOOD (  14.78  )
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

Convert rk to use the init() and exit() methods for powering up and
down the device. This allows us to use the pltfr versions of probe()
and remove().

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../net/ethernet/stmicro/stmmac/dwmac-rk.c    | 47 ++++++++-----------
 1 file changed, 19 insertions(+), 28 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
index 6e75da577af5..6bfe82d7001a 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
@@ -1763,6 +1763,22 @@ static int rk_gmac_resume(struct device *dev, void *bsp_priv_)
 	return 0;
 }
 
+static int rk_gmac_init(struct device *dev, void *bsp_priv)
+{
+	return rk_gmac_powerup(bsp_priv);
+}
+
+static void rk_gmac_exit(struct device *dev, void *bsp_priv_)
+{
+	struct stmmac_priv *priv = netdev_priv(dev_get_drvdata(dev));
+	struct rk_priv_data *bsp_priv = bsp_priv_;
+
+	rk_gmac_powerdown(bsp_priv);
+
+	if (priv->plat->phy_node && bsp_priv->integrated_phy)
+		clk_put(bsp_priv->clk_phy);
+}
+
 static int rk_gmac_probe(struct platform_device *pdev)
 {
 	struct plat_stmmacenet_data *plat_dat;
@@ -1795,6 +1811,8 @@ static int rk_gmac_probe(struct platform_device *pdev)
 
 	plat_dat->get_interfaces = rk_get_interfaces;
 	plat_dat->set_clk_tx_rate = rk_set_clk_tx_rate;
+	plat_dat->init = rk_gmac_init;
+	plat_dat->exit = rk_gmac_exit;
 	plat_dat->suspend = rk_gmac_suspend;
 	plat_dat->resume = rk_gmac_resume;
 
@@ -1806,33 +1824,7 @@ static int rk_gmac_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	ret = rk_gmac_powerup(plat_dat->bsp_priv);
-	if (ret)
-		return ret;
-
-	ret = stmmac_dvr_probe(&pdev->dev, plat_dat, &stmmac_res);
-	if (ret)
-		goto err_gmac_powerdown;
-
-	return 0;
-
-err_gmac_powerdown:
-	rk_gmac_powerdown(plat_dat->bsp_priv);
-
-	return ret;
-}
-
-static void rk_gmac_remove(struct platform_device *pdev)
-{
-	struct stmmac_priv *priv = netdev_priv(platform_get_drvdata(pdev));
-	struct rk_priv_data *bsp_priv = priv->plat->bsp_priv;
-
-	stmmac_dvr_remove(&pdev->dev);
-
-	rk_gmac_powerdown(bsp_priv);
-
-	if (priv->plat->phy_node && bsp_priv->integrated_phy)
-		clk_put(bsp_priv->clk_phy);
+	return devm_stmmac_pltfr_probe(pdev, plat_dat, &stmmac_res);
 }
 
 static const struct of_device_id rk_gmac_dwmac_match[] = {
@@ -1858,7 +1850,6 @@ MODULE_DEVICE_TABLE(of, rk_gmac_dwmac_match);
 
 static struct platform_driver rk_gmac_dwmac_driver = {
 	.probe  = rk_gmac_probe,
-	.remove = rk_gmac_remove,
 	.driver = {
 		.name           = "rk_gmac-dwmac",
 		.pm		= &stmmac_simple_pm_ops,
-- 
2.47.3


