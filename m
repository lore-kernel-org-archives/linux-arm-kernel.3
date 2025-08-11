Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C024CA0EDE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Aug 2025 22:04:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rt9Yy6R8MPl+O9p7xSfuOwLgdGUHQrVEfhCC9Y5SaqU=; b=jKDvbhG0MXnfBQsu2Amz0fF/MK
	X4J0W95toNam0Gy8u3ieHH+EGFuLl0c7W6FXBuVYoQpn6OQP1mB6RX4fl5rdPXrqNW7aSWYQ4IBMQ
	6v8OxXR35xnAMQ6CI8JQmPtnJwUwx4NiOuEMXXwkilxN+BW5rhAAPWLUl7CmpW0Ttd5vY7MhyKZE+
	y+P0WnfktK6M1KnwpxJ2TaLz6ShFFKMXDQemE24f3VqqZKrmWotAIqvt10/pmfQcZv6nX8Mjl1xZn
	ud150tO5Lu63Vvpu8c1uGnsEN2RRirPXcD1vkPJBfERhe9jQNIEmD+w91xSxzDjM8ybnQEAJAjUaN
	ghDxGK9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulacp-00000009CsT-2Xcw;
	Mon, 11 Aug 2025 22:04:15 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulXcY-00000008qE1-1x9K;
	Mon, 11 Aug 2025 18:51:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Rt9Yy6R8MPl+O9p7xSfuOwLgdGUHQrVEfhCC9Y5SaqU=; b=ZclpzZR87eO8oSI9PCC/xzcO/Q
	4Wf4j71P2pGrb3AqlwoVYrLeUZF6RxH9FMHgdP9oBNpEE3RnXRcYJbZdGtU8oDa1DaPEJ8g3AEDD7
	wyLBrSrm7/jDAzsVfq/7+Gzna6Dk77yKNATBgAOll6rV6EMut8mNIs3Vx81Mq0mREkyvZ+if+OLCQ
	odb5RxfcoqBEYqO2ifMCij0CE+U1nPDARLXmZeF4deWupqUtfM1DPMxspMPOgWrynrTcUNS8D3Fih
	QgmjlcDCDANkNfU34NwT+CUBm3qftjxQyCshORNGBwnoLgnDXvljXvycBilOhbs+SH6AXQwnBC+1N
	1+8dFugA==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:41012 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1ulXcQ-0003au-1g;
	Mon, 11 Aug 2025 19:51:38 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1ulXbh-008gql-LO; Mon, 11 Aug 2025 19:50:53 +0100
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
Subject: [PATCH net-next 3/9] net: stmmac: platform: legacy hooks for
 suspend()/resume() methods
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1ulXbh-008gql-LO@rmk-PC.armlinux.org.uk>
Date: Mon, 11 Aug 2025 19:50:53 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_115146_504441_3E0E4896 
X-CRM114-Status: GOOD (  15.71  )
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

Add legacy hooks for the suspend() and resume() methods to forward
these calls to the init() and exit() methods when the platform code
hasn't populated the two former methods. This allows us to get rid
of stmmac_pltfr_suspend() and stmmac_pltfr_resume().

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../ethernet/stmicro/stmmac/stmmac_platform.c | 68 ++++++-------------
 1 file changed, 22 insertions(+), 46 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
index 21df052eeed0..c849676d98e8 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
@@ -811,6 +811,22 @@ static void stmmac_pltfr_exit(struct platform_device *pdev,
 		plat->exit(pdev, plat->bsp_priv);
 }
 
+static int stmmac_plat_suspend(struct device *dev, void *bsp_priv)
+{
+	struct stmmac_priv *priv = netdev_priv(dev_get_drvdata(dev));
+
+	stmmac_pltfr_exit(to_platform_device(dev), priv->plat);
+
+	return 0;
+}
+
+static int stmmac_plat_resume(struct device *dev, void *bsp_priv)
+{
+	struct stmmac_priv *priv = netdev_priv(dev_get_drvdata(dev));
+
+	return stmmac_pltfr_init(to_platform_device(dev), priv->plat);
+}
+
 /**
  * stmmac_pltfr_probe
  * @pdev: platform device pointer
@@ -825,6 +841,11 @@ int stmmac_pltfr_probe(struct platform_device *pdev,
 {
 	int ret;
 
+	if (!plat->suspend && plat->exit)
+		plat->suspend = stmmac_plat_suspend;
+	if (!plat->resume && plat->init)
+		plat->resume = stmmac_plat_resume;
+
 	ret = stmmac_pltfr_init(pdev, plat);
 	if (ret)
 		return ret;
@@ -886,51 +907,6 @@ void stmmac_pltfr_remove(struct platform_device *pdev)
 }
 EXPORT_SYMBOL_GPL(stmmac_pltfr_remove);
 
-/**
- * stmmac_pltfr_suspend
- * @dev: device pointer
- * Description: this function is invoked when suspend the driver and it direcly
- * call the main suspend function and then, if required, on some platform, it
- * can call an exit helper.
- */
-static int __maybe_unused stmmac_pltfr_suspend(struct device *dev)
-{
-	int ret;
-	struct net_device *ndev = dev_get_drvdata(dev);
-	struct stmmac_priv *priv = netdev_priv(ndev);
-	struct platform_device *pdev = to_platform_device(dev);
-
-	ret = stmmac_suspend(dev);
-
-	if (!priv->plat->suspend)
-		stmmac_pltfr_exit(pdev, priv->plat);
-
-	return ret;
-}
-
-/**
- * stmmac_pltfr_resume
- * @dev: device pointer
- * Description: this function is invoked when resume the driver before calling
- * the main resume function, on some platforms, it can call own init helper
- * if required.
- */
-static int __maybe_unused stmmac_pltfr_resume(struct device *dev)
-{
-	struct net_device *ndev = dev_get_drvdata(dev);
-	struct stmmac_priv *priv = netdev_priv(ndev);
-	struct platform_device *pdev = to_platform_device(dev);
-	int ret;
-
-	if (!priv->plat->resume) {
-		ret = stmmac_pltfr_init(pdev, priv->plat);
-		if (ret)
-			return ret;
-	}
-
-	return stmmac_resume(dev);
-}
-
 static int __maybe_unused stmmac_runtime_suspend(struct device *dev)
 {
 	struct net_device *ndev = dev_get_drvdata(dev);
@@ -998,7 +974,7 @@ static int __maybe_unused stmmac_pltfr_noirq_resume(struct device *dev)
 }
 
 const struct dev_pm_ops stmmac_pltfr_pm_ops = {
-	SET_SYSTEM_SLEEP_PM_OPS(stmmac_pltfr_suspend, stmmac_pltfr_resume)
+	SET_SYSTEM_SLEEP_PM_OPS(stmmac_suspend, stmmac_resume)
 	SET_RUNTIME_PM_OPS(stmmac_runtime_suspend, stmmac_runtime_resume, NULL)
 	SET_NOIRQ_SYSTEM_SLEEP_PM_OPS(stmmac_pltfr_noirq_suspend, stmmac_pltfr_noirq_resume)
 };
-- 
2.30.2


