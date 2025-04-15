Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ECE0C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Apr 2025 17:05:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3D1RJ0/Ps/DvFGgzYJpHiZKHJVAnkqEv0/IjI/ebBHM=; b=YFsjvTtt5SGM5nvhttXYwn0ZVJ
	Y4ramewY60lr74shQSJ6fYY480LmMtDgFHPyeqRqopN1c5A4EmqX7NjUIEnMQwotuC+ke1vz1qmKS
	E1QvQmwsseSiqasugYVTPpw1jG9hdHjwAhOuvu8akqvkI2sLYw2wgQx3niSDf4SlVEqKpdBN95adu
	phY//ajbSe52UI+qM1rpK4SI5pFqj2zoKm8rxdV4GHEU5Y0BI7bPDY6mR7qNRs5SDJC6GEJFeGxhv
	WEJmqwEgSP1zqv4UgZFLdE4KuozSAKUzOIwD+46E+eqNzY6mbyjUzBLOc6KXfw7lVKcdjqquA/dre
	z6DUxz2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4jiQ-00000006VQh-0QzV;
	Tue, 15 Apr 2025 17:04:54 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4jNP-00000006RyR-1XIe
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Apr 2025 16:43:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=3D1RJ0/Ps/DvFGgzYJpHiZKHJVAnkqEv0/IjI/ebBHM=; b=qKUEAxtBHWydPkd/XUkJulqAuq
	USPeyYYN9yYJ+kE4Io4U/4NCtbXseSPJbQh1d855r/jVbfGK5MGB3/LtFBVyGngH4OXZh7XJoFcC8
	+2Jof+xiTsFMEm21T4txvRrZxx0k+UqA+/e/gwF9qmu8A60ILslyaAJyHp8lZu84ALBs6vmAnOLJa
	hMEV+TwLVNttPutLTAULdZ3K1O5VhqkSP+7UjJW1b75ulunlGSFOQ167HfTplV9GbVn8XSFy4psOw
	TtVwrdDuiVvaH6wP1huLvoo05no2pw4wfRSgeRzxVFUDcbu0LF7a1LbDMG5D1XLN7wXui+3fuqIXp
	jfi9uX3Q==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:35474 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1u4jNK-0008W4-1c;
	Tue, 15 Apr 2025 17:43:06 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1u4jMj-000rCM-31; Tue, 15 Apr 2025 17:42:29 +0100
In-Reply-To: <Z_6Mfx_SrionoU-e@shell.armlinux.org.uk>
References: <Z_6Mfx_SrionoU-e@shell.armlinux.org.uk>
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
Subject: [PATCH net-next 2/3] net: stmmac: sti: convert to
 devm_stmmac_pltfr_probe()
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1u4jMj-000rCM-31@rmk-PC.armlinux.org.uk>
Date: Tue, 15 Apr 2025 17:42:29 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_094311_404795_4C6CD20E 
X-CRM114-Status: GOOD (  13.69  )
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

Convert sti to use the generic devm_stmmac_pltfr_probe() which will
call plat_dat->init()/plat_dat->exit() as appropriate, thus
simplifying the code.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../net/ethernet/stmicro/stmmac/dwmac-sti.c   | 54 +++++++++----------
 1 file changed, 26 insertions(+), 28 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sti.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sti.c
index c580647ff9dc..b6e09bd33894 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sti.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sti.c
@@ -233,6 +233,29 @@ static int sti_dwmac_parse_data(struct sti_dwmac *dwmac,
 	return 0;
 }
 
+static int sti_dwmac_init(struct platform_device *pdev, void *bsp_priv)
+{
+	struct sti_dwmac *dwmac = bsp_priv;
+	int ret;
+
+	ret = clk_prepare_enable(dwmac->clk);
+	if (ret)
+		return ret;
+
+	ret = sti_dwmac_set_mode(dwmac);
+	if (ret)
+		clk_disable_unprepare(dwmac->clk);
+
+	return ret;
+}
+
+static void sti_dwmac_exit(struct platform_device *pdev, void *bsp_priv)
+{
+	struct sti_dwmac *dwmac = bsp_priv;
+
+	clk_disable_unprepare(dwmac->clk);
+}
+
 static int sti_dwmac_probe(struct platform_device *pdev)
 {
 	struct plat_stmmacenet_data *plat_dat;
@@ -269,34 +292,10 @@ static int sti_dwmac_probe(struct platform_device *pdev)
 
 	plat_dat->bsp_priv = dwmac;
 	plat_dat->fix_mac_speed = data->fix_retime_src;
+	plat_dat->init = sti_dwmac_init;
+	plat_dat->exit = sti_dwmac_exit;
 
-	ret = clk_prepare_enable(dwmac->clk);
-	if (ret)
-		return ret;
-
-	ret = sti_dwmac_set_mode(dwmac);
-	if (ret)
-		goto disable_clk;
-
-	ret = stmmac_dvr_probe(&pdev->dev, plat_dat, &stmmac_res);
-	if (ret)
-		goto disable_clk;
-
-	return 0;
-
-disable_clk:
-	clk_disable_unprepare(dwmac->clk);
-
-	return ret;
-}
-
-static void sti_dwmac_remove(struct platform_device *pdev)
-{
-	struct sti_dwmac *dwmac = get_stmmac_bsp_priv(&pdev->dev);
-
-	stmmac_dvr_remove(&pdev->dev);
-
-	clk_disable_unprepare(dwmac->clk);
+	return devm_stmmac_pltfr_probe(pdev, plat_dat, &stmmac_res);
 }
 
 static int sti_dwmac_suspend(struct device *dev)
@@ -334,7 +333,6 @@ MODULE_DEVICE_TABLE(of, sti_dwmac_match);
 
 static struct platform_driver sti_dwmac_driver = {
 	.probe  = sti_dwmac_probe,
-	.remove = sti_dwmac_remove,
 	.driver = {
 		.name           = "sti-dwmac",
 		.pm		= pm_sleep_ptr(&sti_dwmac_pm_ops),
-- 
2.30.2


