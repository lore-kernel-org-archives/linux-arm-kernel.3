Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8459CE98E0F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 09:35:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D+r2O9TDkv2B1RgekoZmNt5y+3kSqTj3CgLoC/xyn3w=; b=pbB8gWjcTSFWnQU3bBoVHHPy+k
	khu+ZjHFsLBsw2QO4+u+PzE4D/JSmXTt3a/U3vMic7kHXjNta5LZQEfyDw7vjXbqLylNWaDnBjb2F
	elJau601sJL5LpNvgXc3khUpg27FUJaHWapkJwRfVKEesZjPwQ8tqTqSBlh+3OHAbimY0rxtJg7PC
	q/YAx+N+hw6+CaDseS4jk8Pe3p/YKUkDP4T397FPIpFh7WRHx4CtK9eVkBU8hp+uN1BCs0JhTPRu5
	QXYHzlMZqSYYJvmOZWqVtbOWJYbMqFGc62ySK1c/Qm3h6tVbKim7UJnwWaaBhjBcZvtT4eSUX1x58
	xTr4kqyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuSLV-0000000HYAw-0bS9;
	Mon, 23 Feb 2026 09:35:17 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuSLS-0000000HY70-06hB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Feb 2026 09:35:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=D+r2O9TDkv2B1RgekoZmNt5y+3kSqTj3CgLoC/xyn3w=; b=GmK/P9nWAgETRakxO3QLOlTlN9
	ToZjx8U99dsXy8udQ1iegHVS4GHiSp2BadkexENr2dgevK8AtjChhyyf1aEBrEt9FXyvlnZuQ6qXD
	HbxGTcaobV6qQnWCIOTsu181mpj2cgUbho3gy/yMMTtmvo+f99uekZcA2XnusuTdmLyOGJpN5vemf
	EOogg9DNYg+jZi2esfleNeiCFSdR1Ti4GaFvlJ/nZqqx81g6pRNrakhhgQQtG+E9pEJQyGUH/CYsz
	06vdBxZp/xccCCJC6abR2g6W5O8o0TOas7NdfufjVsm8loucT16uMb4da2/xTuvq+5HrfXV+7S/SQ
	OHrMoxMg==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:59756 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vuSL5-000000003nm-00Np;
	Mon, 23 Feb 2026 09:34:51 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vuSL0-0000000AScM-2TN0;
	Mon, 23 Feb 2026 09:34:46 +0000
In-Reply-To: <aZwfAFJQcp9f0niI@shell.armlinux.org.uk>
References: <aZwfAFJQcp9f0niI@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Frank Li <Frank.Li@nxp.com>,
	imx@lists.linux.dev,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Vinod Koul <vkoul@kernel.org>
Subject: [PATCH net-next 07/10] net: stmmac: qcom-ethqos: pass phy interface
 mode to configs
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1vuSL0-0000000AScM-2TN0@rmk-PC.armlinux.org.uk>
Date: Mon, 23 Feb 2026 09:34:46 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_013514_092913_E6B69F08 
X-CRM114-Status: GOOD (  11.48  )
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

Pass the current phylink phy interface mode to the RGMII and "SGMII"
configuration functions.

Reviewed-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Tested-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c  | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index 9b29516a5a7c..e2dd334ffd31 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -100,7 +100,8 @@ struct ethqos_emac_driver_data {
 struct qcom_ethqos {
 	struct platform_device *pdev;
 	void __iomem *rgmii_base;
-	void (*configure_func)(struct qcom_ethqos *ethqos, int speed);
+	void (*configure_func)(struct qcom_ethqos *ethqos,
+			       phy_interface_t interface, int speed);
 
 	unsigned int link_clk_rate;
 	struct clk *link_clk;
@@ -521,7 +522,8 @@ static int ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos, int speed)
 	return 0;
 }
 
-static void ethqos_configure_rgmii(struct qcom_ethqos *ethqos, int speed)
+static void ethqos_configure_rgmii(struct qcom_ethqos *ethqos,
+				   phy_interface_t interface, int speed)
 {
 	struct device *dev = &ethqos->pdev->dev;
 	unsigned int i;
@@ -605,7 +607,8 @@ static void ethqos_pcs_set_inband(struct stmmac_priv *priv, bool enable)
 /* On interface toggle MAC registers gets reset.
  * Configure MAC block for SGMII on ethernet phy link up
  */
-static void ethqos_configure_sgmii(struct qcom_ethqos *ethqos, int speed)
+static void ethqos_configure_sgmii(struct qcom_ethqos *ethqos,
+				   phy_interface_t interface, int speed)
 {
 	struct net_device *dev = platform_get_drvdata(ethqos->pdev);
 	struct stmmac_priv *priv = netdev_priv(dev);
@@ -638,9 +641,10 @@ static void ethqos_configure_sgmii(struct qcom_ethqos *ethqos, int speed)
 	}
 }
 
-static void ethqos_configure(struct qcom_ethqos *ethqos, int speed)
+static void ethqos_configure(struct qcom_ethqos *ethqos,
+			     phy_interface_t interface, int speed)
 {
-	return ethqos->configure_func(ethqos, speed);
+	return ethqos->configure_func(ethqos, interface, speed);
 }
 
 static void ethqos_fix_mac_speed(void *priv, phy_interface_t interface,
@@ -649,7 +653,7 @@ static void ethqos_fix_mac_speed(void *priv, phy_interface_t interface,
 	struct qcom_ethqos *ethqos = priv;
 
 	ethqos_update_link_clk(ethqos, speed);
-	ethqos_configure(ethqos, speed);
+	ethqos_configure(ethqos, interface, speed);
 }
 
 static int qcom_ethqos_serdes_powerup(struct net_device *ndev, void *priv)
-- 
2.47.3


