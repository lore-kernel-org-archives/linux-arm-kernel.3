Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 786E6CAC5A7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Sep 2025 11:26:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RlGoGEht7ZRuLU+Ywhrh7DNB0TyNx63riRsUGVVjf2s=; b=TjLXIsTZOOp96grQnQyf8i8L+5
	QRTNsGTxEzoN/oSGqLV/8961kOUTetnB5oJ78nh0iB0gVdpRsQxPrwoHQBZ2R2YXsHji0hY4xbDnY
	x7iSbx10ecllLoW/Vn5f5oe/+NBqUCltqfrIFeI80yc0frb3zc1D1yl0M874F/ul9sEhY7joiQh89
	0ZI26JeLCLbGkyFWF17rCpQGx7Pc4g/QkzwJsJhRyjsguw5F2Leci/uA08vONoAF7HilVYI7wIdwV
	uS7P0ZNYXRUHmqF9/j06C00BLBhT3SfMtRJUkZRPHGrMNwoLYNuVmd53J+nSY5CWw2q3Vo1b1X8GD
	Hvyw3u+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v119v-0000000DAAL-0aDk;
	Tue, 23 Sep 2025 11:26:11 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v119s-0000000DA8e-0SqJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Sep 2025 11:26:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=RlGoGEht7ZRuLU+Ywhrh7DNB0TyNx63riRsUGVVjf2s=; b=PNAy1DJiSOzjGYwtVAnDewa46v
	9AV04v8lddEsGD3QGpPPKPll7T6X+Y5qTMTRfSvt7orVeOxfgPiyzrcPB8punQphn7R8owD2ajo8C
	F8z2VzIk/wNRFEztHgng0Zf2lA/+Awq1hY4/SS48REejkFMUDbdR+bTNt80cmAX7xiL2KWPHWsJPh
	58ol3bWI/a4gUMyRlFqNVPF6WLYY1FPL12G2+rXbWuHiL+Gj81LSPpxz+wh73uGed+BgPgFsWZJIk
	VluYW8Mdfgu3ueQUkn17EagSlzuJ2GOHUNWb153xG45O2rYJlHfWEy+eqNQFJCQ5XSgnLBTC4mgzI
	UnMDCCuw==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:38064 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1v119k-00000000789-0PxJ;
	Tue, 23 Sep 2025 12:26:00 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1v119j-0000000773s-1R2v;
	Tue, 23 Sep 2025 12:25:59 +0100
In-Reply-To: <aNKDqqI7aLsuDD52@shell.armlinux.org.uk>
References: <aNKDqqI7aLsuDD52@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH net-next 1/6] net: stmmac: move stmmac_bus_clks_config() to
 stmmac_platform.c
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1v119j-0000000773s-1R2v@rmk-PC.armlinux.org.uk>
Date: Tue, 23 Sep 2025 12:25:59 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250923_042608_147350_2BC1DA8A 
X-CRM114-Status: GOOD (  13.43  )
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

stmmac_bus_clks_config() is only used by stmmac_platform.c, so rather
than having it in stmmac_main.c and needing to export the symbol,
move it to where it's used.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac.h  |  1 -
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 33 -------------------
 .../ethernet/stmicro/stmmac/stmmac_platform.c | 32 ++++++++++++++++++
 3 files changed, 32 insertions(+), 34 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac.h b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
index 151f08e5e85d..7ca5477be390 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac.h
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
@@ -404,7 +404,6 @@ int stmmac_dvr_probe(struct device *device,
 		     struct stmmac_resources *res);
 int stmmac_reinit_queues(struct net_device *dev, u32 rx_cnt, u32 tx_cnt);
 int stmmac_reinit_ringparam(struct net_device *dev, u32 rx_size, u32 tx_size);
-int stmmac_bus_clks_config(struct stmmac_priv *priv, bool enabled);
 int stmmac_set_clk_tx_rate(void *bsp_priv, struct clk *clk_tx_i,
 			   phy_interface_t interface, int speed);
 
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index d17820d9e7f1..517b25b2bcae 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -147,39 +147,6 @@ static void stmmac_exit_fs(struct net_device *dev);
 
 #define STMMAC_COAL_TIMER(x) (ns_to_ktime((x) * NSEC_PER_USEC))
 
-int stmmac_bus_clks_config(struct stmmac_priv *priv, bool enabled)
-{
-	struct plat_stmmacenet_data *plat_dat = priv->plat;
-	int ret;
-
-	if (enabled) {
-		ret = clk_prepare_enable(plat_dat->stmmac_clk);
-		if (ret)
-			return ret;
-		ret = clk_prepare_enable(plat_dat->pclk);
-		if (ret) {
-			clk_disable_unprepare(plat_dat->stmmac_clk);
-			return ret;
-		}
-		if (plat_dat->clks_config) {
-			ret = plat_dat->clks_config(plat_dat->bsp_priv, enabled);
-			if (ret) {
-				clk_disable_unprepare(plat_dat->stmmac_clk);
-				clk_disable_unprepare(plat_dat->pclk);
-				return ret;
-			}
-		}
-	} else {
-		clk_disable_unprepare(plat_dat->stmmac_clk);
-		clk_disable_unprepare(plat_dat->pclk);
-		if (plat_dat->clks_config)
-			plat_dat->clks_config(plat_dat->bsp_priv, enabled);
-	}
-
-	return 0;
-}
-EXPORT_SYMBOL_GPL(stmmac_bus_clks_config);
-
 /**
  * stmmac_set_clk_tx_rate() - set the clock rate for the MAC transmit clock
  * @bsp_priv: BSP private data structure (unused)
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
index 712ef235f0f4..27bcaae07a7f 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
@@ -911,6 +911,38 @@ void stmmac_pltfr_remove(struct platform_device *pdev)
 }
 EXPORT_SYMBOL_GPL(stmmac_pltfr_remove);
 
+static int stmmac_bus_clks_config(struct stmmac_priv *priv, bool enabled)
+{
+	struct plat_stmmacenet_data *plat_dat = priv->plat;
+	int ret;
+
+	if (enabled) {
+		ret = clk_prepare_enable(plat_dat->stmmac_clk);
+		if (ret)
+			return ret;
+		ret = clk_prepare_enable(plat_dat->pclk);
+		if (ret) {
+			clk_disable_unprepare(plat_dat->stmmac_clk);
+			return ret;
+		}
+		if (plat_dat->clks_config) {
+			ret = plat_dat->clks_config(plat_dat->bsp_priv, enabled);
+			if (ret) {
+				clk_disable_unprepare(plat_dat->stmmac_clk);
+				clk_disable_unprepare(plat_dat->pclk);
+				return ret;
+			}
+		}
+	} else {
+		clk_disable_unprepare(plat_dat->stmmac_clk);
+		clk_disable_unprepare(plat_dat->pclk);
+		if (plat_dat->clks_config)
+			plat_dat->clks_config(plat_dat->bsp_priv, enabled);
+	}
+
+	return 0;
+}
+
 static int __maybe_unused stmmac_runtime_suspend(struct device *dev)
 {
 	struct net_device *ndev = dev_get_drvdata(dev);
-- 
2.47.3


