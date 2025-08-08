Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE327C87FD3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Aug 2025 12:42:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2FzBoXIxcZVkbVHJFLWQcEdWdrkGqtJVfXXxBAhEpkU=; b=BysbFX9euqU/NpWHLV+8h2Sk9e
	tgW9rpffhvAwMOcRWF9IoT3mRsoc6Y+NN0w5Dg8EdnWKk7aClNdb42eNShS0GHKwgkCdDmQXpaC9u
	mhPOs/VxtH1pbUwkLKxIWZB/f0FRK5inP2lS3eTfpPnHBWWUvCvqEL1MqkIY/kQP2hF19r70qj/XM
	2Je0FZ95hyRaBAt1yLTDzyiLZs/qmeJ5ppNb8PFsu1Y9xfXUdtKiOGRNB2XpBvgogvJPbFpL6yg/q
	JSaVsv4jycfyoVOSj4q0386DT5ef7P4+M4aINtM+XCgoecvsrJoz3QrwL/z4ebCUgug3SMt7hUfPe
	d3ApLrpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukMQL-00000002paB-3NAS;
	Fri, 08 Aug 2025 12:42:17 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukM4K-00000002mXS-3JWk
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Aug 2025 12:19:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:Reply-To:Content-ID
	:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
	Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=2FzBoXIxcZVkbVHJFLWQcEdWdrkGqtJVfXXxBAhEpkU=; b=zhtgFgOTmNI0iXvJmndtzAHEfz
	JP1V5GKLViXtZAOPj5hiniBuJPdLs7vRYITMXoXN0nOAOsP91CyOiWZ/Y53vFoX8gY/hDMxuEm2k1
	Bcu4H1tYP3jBZjACeZxXmCkrc6HccX6SQAfJ3oTk4eLC06xEE4lvq6cTejMAaQbQbegCwA4cvxKfh
	WS7EDZ/Qk5s/1E6PwF2LYi2rvS5Gts9O4KU1ULN0dMup4vElCcCHqZMKZez2FpCwdj0TGtjRqr58d
	rexwQQsLSrii+Ctb2XWMC79E4+7ObgXNpxCxpzgwhDmfaNpDDYMXbn46I/V/f8aB6OPRMEd7aLM21
	M9qh50GA==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:41686 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1ukM2G-0007Zg-0D;
	Fri, 08 Aug 2025 13:17:24 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1ukM1X-0086qu-Td; Fri, 08 Aug 2025 13:16:39 +0100
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	Thierry Reding <treding@nvidia.com>
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
Subject: [PATCH net] net: stmmac: dwc-qos: fix clk prepare/enable leak on
 probe failure
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1ukM1X-0086qu-Td@rmk-PC.armlinux.org.uk>
Date: Fri, 08 Aug 2025 13:16:39 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250808_051932_827574_06E4EC01 
X-CRM114-Status: GOOD (  11.95  )
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

dwc_eth_dwmac_probe() gets bulk clocks, and then prepares and enables
them. Unfortunately, if dwc_eth_dwmac_config_dt() or stmmac_dvr_probe()
fail, we leave the clocks prepared and enabled. Fix this by using
devm_clk_bulk_get_all_enabled() to combine the steps and provide devm
based release of the prepare and enable state.

This also fixes a similar leakin dwc_eth_dwmac_remove() which wasn't
correctly retrieving the struct plat_stmmacenet_data. This becomes
unnecessary.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c | 13 ++-----------
 1 file changed, 2 insertions(+), 11 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c
index 09ae16e026eb..6c363f9b0ce2 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c
@@ -330,15 +330,11 @@ static int dwc_eth_dwmac_probe(struct platform_device *pdev)
 	if (IS_ERR(plat_dat))
 		return PTR_ERR(plat_dat);
 
-	ret = devm_clk_bulk_get_all(&pdev->dev, &plat_dat->clks);
+	ret = devm_clk_bulk_get_all_enabled(&pdev->dev, &plat_dat->clks);
 	if (ret < 0)
-		return dev_err_probe(&pdev->dev, ret, "Failed to retrieve all required clocks\n");
+		return dev_err_probe(&pdev->dev, ret, "Failed to retrieve and enable all required clocks\n");
 	plat_dat->num_clks = ret;
 
-	ret = clk_bulk_prepare_enable(plat_dat->num_clks, plat_dat->clks);
-	if (ret)
-		return dev_err_probe(&pdev->dev, ret, "Failed to enable clocks\n");
-
 	plat_dat->stmmac_clk = stmmac_pltfr_find_clk(plat_dat,
 						     data->stmmac_clk_name);
 
@@ -346,7 +342,6 @@ static int dwc_eth_dwmac_probe(struct platform_device *pdev)
 		ret = data->probe(pdev, plat_dat, &stmmac_res);
 	if (ret < 0) {
 		dev_err_probe(&pdev->dev, ret, "failed to probe subdriver\n");
-		clk_bulk_disable_unprepare(plat_dat->num_clks, plat_dat->clks);
 		return ret;
 	}
 
@@ -370,15 +365,11 @@ static int dwc_eth_dwmac_probe(struct platform_device *pdev)
 static void dwc_eth_dwmac_remove(struct platform_device *pdev)
 {
 	const struct dwc_eth_dwmac_data *data = device_get_match_data(&pdev->dev);
-	struct plat_stmmacenet_data *plat_dat = dev_get_platdata(&pdev->dev);
 
 	stmmac_dvr_remove(&pdev->dev);
 
 	if (data->remove)
 		data->remove(pdev);
-
-	if (plat_dat)
-		clk_bulk_disable_unprepare(plat_dat->num_clks, plat_dat->clks);
 }
 
 static const struct of_device_id dwc_eth_dwmac_match[] = {
-- 
2.30.2


