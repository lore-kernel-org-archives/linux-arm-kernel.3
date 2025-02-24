Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DD10C021A4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Feb 2025 16:56:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mi3v7W3xohiNhzfx1zdXOCiB1GcuHJ50d4F7oExM8oE=; b=L90X3fsfQCcuth31kpMCA6CX5O
	9wt+5VPz+Y7bpdE8ed8nV2PWKjSyNnrX2pkaTgKryiSuYxC4ErseblE0e8L4l4QbkFdsARw7hEjvw
	nYqbxC3WBEJDOpKNylv7GuVLpKTZRJRQsRl4uwXYnTQv7ewDuN0svD5gSQ7vLP+b+ykLmFBho3ieu
	Xga9kOC2CscE/03MSc9mlzAzok6wgXSzgYH6wguwm8Bxc1aP3Q7500TX4H+tkUFt5Xn/KYN1TorYz
	OF0SIepR8bogxlAduVpV16PsEDFPcJPPSGm/zQAysoFpcqC/DpT+HzIqX8d+dPxckAm1a9zo10Qwo
	XW7nmFcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmbkv-0000000EVmY-48dG;
	Mon, 24 Feb 2025 16:56:33 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmbi2-0000000EVA4-129J
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Feb 2025 16:53:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=mi3v7W3xohiNhzfx1zdXOCiB1GcuHJ50d4F7oExM8oE=; b=PlY6BO7crp/CZKUaGmHlIcU8en
	ioX7bfvMnCkvS5XEuvmmDGRHjuoP9oH9XSwYaIs+nyAzPDd5DNpHP82tDDs6xd83R7Pq2REXOF/5O
	e9KipfXeAjrNc+q860CGchJp9iH/TKHZ0T4VMUqpY8lFDra5WJpv0t4NpdaXfrRUdzuGj5JFk7wJd
	WJZQZNZmfC5OmgMmnG9sXWpujU/jCXY+5YuRQD5CS009/SRnOCWbsZ17Pq+tVfxnpYZZt3swEQoVG
	ydreNd4H9HjI8tK2E78e9OaPyEMS+PlLBGsr+lBZMZ/YHaiR584Wli5rSGN/mexibwYZGY4m6oJSv
	t1/eJSig==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:41598 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1tmbhy-00070I-1v;
	Mon, 24 Feb 2025 16:53:30 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1tmbhe-004vSt-M3; Mon, 24 Feb 2025 16:53:10 +0000
In-Reply-To: <Z7yj_BZa6yG02KcI@shell.armlinux.org.uk>
References: <Z7yj_BZa6yG02KcI@shell.armlinux.org.uk>
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
Subject: [PATCH net-next v3 1/2] net: stmmac: dwc-qos: name struct
 plat_stmmacenet_data consistently
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1tmbhe-004vSt-M3@rmk-PC.armlinux.org.uk>
Date: Mon, 24 Feb 2025 16:53:10 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_085334_280314_4B03C8BC 
X-CRM114-Status: GOOD (  15.17  )
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

Most of the stmmac driver uses "plat_dat" to name the platform data,
and "data" is used for the glue driver data. make dwc-qos follow
this pattern to avoid silly mistakes.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../stmicro/stmmac/dwmac-dwc-qos-eth.c        | 32 +++++++++----------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c
index 392574bdd4a4..acb0a2e1664f 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c
@@ -224,7 +224,7 @@ static int tegra_eqos_init(struct platform_device *pdev, void *priv)
 }
 
 static int tegra_eqos_probe(struct platform_device *pdev,
-			    struct plat_stmmacenet_data *data,
+			    struct plat_stmmacenet_data *plat_dat,
 			    struct stmmac_resources *res)
 {
 	struct device *dev = &pdev->dev;
@@ -241,12 +241,12 @@ static int tegra_eqos_probe(struct platform_device *pdev,
 	if (!is_of_node(dev->fwnode))
 		goto bypass_clk_reset_gpio;
 
-	for (int i = 0; i < data->num_clks; i++) {
-		if (strcmp(data->clks[i].id, "slave_bus") == 0) {
-			eqos->clk_slave = data->clks[i].clk;
-			data->stmmac_clk = eqos->clk_slave;
-		} else if (strcmp(data->clks[i].id, "tx") == 0) {
-			eqos->clk_tx = data->clks[i].clk;
+	for (int i = 0; i < plat_dat->num_clks; i++) {
+		if (strcmp(plat_dat->clks[i].id, "slave_bus") == 0) {
+			eqos->clk_slave = plat_dat->clks[i].clk;
+			plat_dat->stmmac_clk = eqos->clk_slave;
+		} else if (strcmp(plat_dat->clks[i].id, "tx") == 0) {
+			eqos->clk_tx = plat_dat->clks[i].clk;
 		}
 	}
 
@@ -260,7 +260,7 @@ static int tegra_eqos_probe(struct platform_device *pdev,
 	gpiod_set_value(eqos->reset, 0);
 
 	/* MDIO bus was already reset just above */
-	data->mdio_bus_data->needs_reset = false;
+	plat_dat->mdio_bus_data->needs_reset = false;
 
 	eqos->rst = devm_reset_control_get(&pdev->dev, "eqos");
 	if (IS_ERR(eqos->rst)) {
@@ -281,10 +281,10 @@ static int tegra_eqos_probe(struct platform_device *pdev,
 	usleep_range(2000, 4000);
 
 bypass_clk_reset_gpio:
-	data->fix_mac_speed = tegra_eqos_fix_speed;
-	data->init = tegra_eqos_init;
-	data->bsp_priv = eqos;
-	data->flags |= STMMAC_FLAG_SPH_DISABLE;
+	plat_dat->fix_mac_speed = tegra_eqos_fix_speed;
+	plat_dat->init = tegra_eqos_init;
+	plat_dat->bsp_priv = eqos;
+	plat_dat->flags |= STMMAC_FLAG_SPH_DISABLE;
 
 	err = tegra_eqos_init(pdev, eqos);
 	if (err < 0)
@@ -309,7 +309,7 @@ static void tegra_eqos_remove(struct platform_device *pdev)
 
 struct dwc_eth_dwmac_data {
 	int (*probe)(struct platform_device *pdev,
-		     struct plat_stmmacenet_data *data,
+		     struct plat_stmmacenet_data *plat_dat,
 		     struct stmmac_resources *res);
 	void (*remove)(struct platform_device *pdev);
 };
@@ -387,15 +387,15 @@ static int dwc_eth_dwmac_probe(struct platform_device *pdev)
 static void dwc_eth_dwmac_remove(struct platform_device *pdev)
 {
 	const struct dwc_eth_dwmac_data *data = device_get_match_data(&pdev->dev);
-	struct plat_stmmacenet_data *plat_data = dev_get_platdata(&pdev->dev);
+	struct plat_stmmacenet_data *plat_dat = dev_get_platdata(&pdev->dev);
 
 	stmmac_dvr_remove(&pdev->dev);
 
 	if (data->remove)
 		data->remove(pdev);
 
-	if (plat_data)
-		clk_bulk_disable_unprepare(plat_data->num_clks, plat_data->clks);
+	if (plat_dat)
+		clk_bulk_disable_unprepare(plat_dat->num_clks, plat_dat->clks);
 }
 
 static const struct of_device_id dwc_eth_dwmac_match[] = {
-- 
2.30.2


