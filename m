Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65737C369A1
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Apr 2025 21:47:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ljtxhmEe2XvSJFPRZLmLhm9oOIVAqvWReFSOt396pAs=; b=b1ULURfhKPZgs0IIVqENUR11sE
	3I+qH1Zbcmuix4I53UHael4+mW3KOjpn+L31RrqowqV5n8dFH0RnAIvceDbb4HGtQwBY5ohO9RTWq
	CrQTwpvhagaa78GvS+LnjGCoHJALSg8bwQbVx6YHybbqm+mr0iF8fZtwFRDgwLdstvlMllGWn/pqS
	z/yNNDIV0E9bPHZBbgEAGXM3gk/98W0OJpm0mBLvf7rCMrieBheNWf+62iMnpSBtpWtWgkHRWw28g
	xkj5zDNCwY4e0idPU9Wg9+ctyaHLVkJeQGaW0+aJRFOLPG38omqjUWXptiSO8BQ42jV1BUzTSjza+
	omquFH1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1uJV-000000025Ft-2uwx;
	Mon, 07 Apr 2025 21:47:29 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1rx8-00000001mGv-1A6E
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Apr 2025 19:16:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:Reply-To:Content-ID
	:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
	Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=ljtxhmEe2XvSJFPRZLmLhm9oOIVAqvWReFSOt396pAs=; b=enbxzDpuPpTP2xGri0KCGBzPmZ
	XYfDC8qA1fW9POEr90NwD5fCBu7Z63r54v9REz9bg8BjgJcVZ61XoJGQNTrHIeCoS3XT3+5q+24th
	j+xT2NHJPOq1eDho0j8BS+3z2dVxe7pgEIIVI2VFkGkdPDtQmv6TJZOsGopPb4HvZnn0yowTBxeiR
	XpLSENbZCNPfZCCXqZllhqUYKRKtxv9dbpr5hrokdch3YNhafQG+2iuGcxps6m/8m4ifUBY+10fHz
	FyAqiRty2RBgaHJE798ng34eYiBX/gGZMaybF6tQzrtHifLtAOlOY9ZRRlkYqV/7RMIC6A2ssRWat
	v/9OBB8A==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:37898 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1u1rx1-0006Cc-1e;
	Mon, 07 Apr 2025 20:16:07 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1u1rwV-0013jc-Ez; Mon, 07 Apr 2025 20:15:35 +0100
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
Subject: [PATCH net-next] net: stmmac: stm32: simplify clock handling
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1u1rwV-0013jc-Ez@rmk-PC.armlinux.org.uk>
Date: Mon, 07 Apr 2025 20:15:35 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_121614_324216_B3ECE563 
X-CRM114-Status: GOOD (  22.55  )
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

Some stm32 implementations need the receive clock running in suspend,
as indicated by dwmac->ops->clk_rx_enable_in_suspend. The existing
code achieved this in a rather complex way, by passing a flag around.

However, the clk API prepare/enables are counted - which means that a
clock won't be stopped as long as there are more prepare and enables
than disables and unprepares, just like a reference count.

Therefore, we can simplify this logic by calling clk_prepare_enable()
an additional time in the probe function if this flag is set, and then
balancing that at remove time.

With this, we can avoid passing a "are we suspending" and "are we
resuming" flag to various functions in the driver.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
This patch has been only build tested, so I would be grateful if
someone with the hardware could run-test this change please.

 .../net/ethernet/stmicro/stmmac/dwmac-stm32.c | 57 ++++++++++++-------
 1 file changed, 37 insertions(+), 20 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c
index c3d321192581..1eb16eec9c0d 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c
@@ -119,7 +119,7 @@ struct stm32_ops {
 	u32 syscfg_clr_off;
 };
 
-static int stm32_dwmac_clk_enable(struct stm32_dwmac *dwmac, bool resume)
+static int stm32_dwmac_clk_enable(struct stm32_dwmac *dwmac)
 {
 	int ret;
 
@@ -127,11 +127,9 @@ static int stm32_dwmac_clk_enable(struct stm32_dwmac *dwmac, bool resume)
 	if (ret)
 		goto err_clk_tx;
 
-	if (!dwmac->ops->clk_rx_enable_in_suspend || !resume) {
-		ret = clk_prepare_enable(dwmac->clk_rx);
-		if (ret)
-			goto err_clk_rx;
-	}
+	ret = clk_prepare_enable(dwmac->clk_rx);
+	if (ret)
+		goto err_clk_rx;
 
 	ret = clk_prepare_enable(dwmac->syscfg_clk);
 	if (ret)
@@ -148,15 +146,14 @@ static int stm32_dwmac_clk_enable(struct stm32_dwmac *dwmac, bool resume)
 err_clk_eth_ck:
 	clk_disable_unprepare(dwmac->syscfg_clk);
 err_syscfg_clk:
-	if (!dwmac->ops->clk_rx_enable_in_suspend || !resume)
-		clk_disable_unprepare(dwmac->clk_rx);
+	clk_disable_unprepare(dwmac->clk_rx);
 err_clk_rx:
 	clk_disable_unprepare(dwmac->clk_tx);
 err_clk_tx:
 	return ret;
 }
 
-static int stm32_dwmac_init(struct plat_stmmacenet_data *plat_dat, bool resume)
+static int stm32_dwmac_init(struct plat_stmmacenet_data *plat_dat)
 {
 	struct stm32_dwmac *dwmac = plat_dat->bsp_priv;
 	int ret;
@@ -167,7 +164,7 @@ static int stm32_dwmac_init(struct plat_stmmacenet_data *plat_dat, bool resume)
 			return ret;
 	}
 
-	return stm32_dwmac_clk_enable(dwmac, resume);
+	return stm32_dwmac_clk_enable(dwmac);
 }
 
 static int stm32mp1_select_ethck_external(struct plat_stmmacenet_data *plat_dat)
@@ -382,12 +379,10 @@ static int stm32mcu_set_mode(struct plat_stmmacenet_data *plat_dat)
 				 SYSCFG_MCU_ETH_MASK, val << 23);
 }
 
-static void stm32_dwmac_clk_disable(struct stm32_dwmac *dwmac, bool suspend)
+static void stm32_dwmac_clk_disable(struct stm32_dwmac *dwmac)
 {
 	clk_disable_unprepare(dwmac->clk_tx);
-	if (!dwmac->ops->clk_rx_enable_in_suspend || !suspend)
-		clk_disable_unprepare(dwmac->clk_rx);
-
+	clk_disable_unprepare(dwmac->clk_rx);
 	clk_disable_unprepare(dwmac->syscfg_clk);
 	if (dwmac->enable_eth_ck)
 		clk_disable_unprepare(dwmac->clk_eth_ck);
@@ -541,18 +536,32 @@ static int stm32_dwmac_probe(struct platform_device *pdev)
 	plat_dat->flags |= STMMAC_FLAG_EN_TX_LPI_CLK_PHY_CAP;
 	plat_dat->bsp_priv = dwmac;
 
-	ret = stm32_dwmac_init(plat_dat, false);
+	ret = stm32_dwmac_init(plat_dat);
 	if (ret)
 		return ret;
 
+	/* If this platform requires the clock to be running in suspend,
+	 * prepare and enable the receive clock an additional time to keep
+	 * it running.
+	 */
+	if (dwmac->ops->clk_rx_enable_in_suspend) {
+		ret = clk_prepare_enable(dwmac->clk_rx);
+		if (ret)
+			goto err_clk_disable;
+	}
+
 	ret = stmmac_dvr_probe(&pdev->dev, plat_dat, &stmmac_res);
 	if (ret)
-		goto err_clk_disable;
+		goto err_clk_disable_suspend;
 
 	return 0;
 
+err_clk_disable_suspend:
+	if (dwmac->ops->clk_rx_enable_in_suspend)
+		clk_disable_unprepare(dwmac->clk_rx);
+
 err_clk_disable:
-	stm32_dwmac_clk_disable(dwmac, false);
+	stm32_dwmac_clk_disable(dwmac);
 
 	return ret;
 }
@@ -565,7 +574,15 @@ static void stm32_dwmac_remove(struct platform_device *pdev)
 
 	stmmac_dvr_remove(&pdev->dev);
 
-	stm32_dwmac_clk_disable(dwmac, false);
+	/* If this platform requires the clock to be running in suspend,
+	 * we need to disable and unprepare the receive clock an additional
+	 * time to balance the extra clk_prepare_enable() in the probe
+	 * function.
+	 */
+	if (dwmac->ops->clk_rx_enable_in_suspend)
+		clk_disable_unprepare(dwmac->clk_rx);
+
+	stm32_dwmac_clk_disable(dwmac);
 
 	if (dwmac->irq_pwr_wakeup >= 0) {
 		dev_pm_clear_wake_irq(&pdev->dev);
@@ -596,7 +613,7 @@ static int stm32_dwmac_suspend(struct device *dev)
 	if (ret)
 		return ret;
 
-	stm32_dwmac_clk_disable(dwmac, true);
+	stm32_dwmac_clk_disable(dwmac);
 
 	if (dwmac->ops->suspend)
 		ret = dwmac->ops->suspend(dwmac);
@@ -614,7 +631,7 @@ static int stm32_dwmac_resume(struct device *dev)
 	if (dwmac->ops->resume)
 		dwmac->ops->resume(dwmac);
 
-	ret = stm32_dwmac_init(priv->plat, true);
+	ret = stm32_dwmac_init(priv->plat);
 	if (ret)
 		return ret;
 
-- 
2.30.2


