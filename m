Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64B8AC369B4
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 12 Apr 2025 14:19:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AjpPx4diUTD55faBtP4P4XYjVA7r8a4pIDQt1k+4gFo=; b=xhJpVhZlHJXh4h8cMDiDfe+bWi
	eRCFCz3i26ggecrZ8rso6r6xdaXAEaaGRh+AR2z/UQr4+Bmo3gASaxYwFuMSdipIeTHM7DXNVUpiF
	RZukNVGCe9YBkyD0uWX5n8xBniYWEoepBEbLquxT+uYbAJ8GOz8qGXVmWwjEm1+4Mw2dYXiyR78jE
	0gCuUWqWnDl4ErFA1vQPcT4CQHXYLGbWlEWhCUZPlrv+D4EU4UlFPDSheNZ97tAsLCTaEmksvugJB
	MpJgob+F43jXb+71CdfSkPEcrrKn9/1J0xyMzSoWr0LCoN0AbF6AJgzX9Mdl10OJOaXU83n8M12nb
	yzjcqsMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3bhc-0000000G09k-10zJ;
	Sat, 12 Apr 2025 14:19:24 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3bZG-0000000FzIr-216c
	for linux-arm-kernel@lists.infradead.org;
	Sat, 12 Apr 2025 14:10:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=AjpPx4diUTD55faBtP4P4XYjVA7r8a4pIDQt1k+4gFo=; b=W7pGDeRsVYz/bLC54KhffjdXao
	qUE9VUc2SW30decX6bDS+huRGHympzQaT3nviRrKPfsk44bET76kjQxbG8G7gDrG+qBqIRmZfn5Gx
	0302N+RzkVlzUSraDNkrL1JaxkVfjSNT+c6KlnB65appcts3xDojgF4RuTRskmX47OWKZS0FBp9bf
	amIXzlSnEqCdxyzOO3gUIQ8Pf75uxLoLrKq3pZDKYgmAxHdQFtOUHCoYqUIq46nD8rK7Ot9Iyzk5b
	1t7/NSKRES7BJfIoh8y7kyi/n43T3/iJX0myCxCyiipkbeDsuze3Vy69/ye+hOYuWtpvyEQoVyd+3
	L2vw1wHQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:43894 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1u3bZB-0004az-2M;
	Sat, 12 Apr 2025 15:10:41 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1u3bYa-000EcW-H1; Sat, 12 Apr 2025 15:10:04 +0100
In-Reply-To: <Z_p0LzY2_HFupWK0@shell.armlinux.org.uk>
References: <Z_p0LzY2_HFupWK0@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	Vinod Koul <vkoul@kernel.org>
Subject: [PATCH net-next 4/4] net: stmmac: qcom-ethqos: remove
 speed_mode_2500() method
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1u3bYa-000EcW-H1@rmk-PC.armlinux.org.uk>
Date: Sat, 12 Apr 2025 15:10:04 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250412_071046_515635_F12E059C 
X-CRM114-Status: UNSURE (   9.55  )
X-CRM114-Notice: Please train this message.
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

qcom-ethqos doesn't need to implement the speed_mode_2500() method as
it is only setting priv->plat->phy_interface to 2500BASE-X, which is
already a pre-condition for assigning speed_mode_2500 in
qcom_ethqos_probe(). So, qcom_ethqos_speed_mode_2500() has no effect.
Remove it.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index e8d4925be21c..e30bdf72331a 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -672,13 +672,6 @@ static int ethqos_configure_sgmii(struct qcom_ethqos *ethqos, int speed)
 	return val;
 }
 
-static void qcom_ethqos_speed_mode_2500(struct net_device *ndev, void *data)
-{
-	struct stmmac_priv *priv = netdev_priv(ndev);
-
-	priv->plat->phy_interface = PHY_INTERFACE_MODE_2500BASEX;
-}
-
 static int ethqos_configure(struct qcom_ethqos *ethqos, int speed)
 {
 	return ethqos->configure_func(ethqos, speed);
@@ -800,8 +793,6 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 		ethqos->configure_func = ethqos_configure_rgmii;
 		break;
 	case PHY_INTERFACE_MODE_2500BASEX:
-		plat_dat->speed_mode_2500 = qcom_ethqos_speed_mode_2500;
-		fallthrough;
 	case PHY_INTERFACE_MODE_SGMII:
 		ethqos->configure_func = ethqos_configure_sgmii;
 		break;
-- 
2.30.2


