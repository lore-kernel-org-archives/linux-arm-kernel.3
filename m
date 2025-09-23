Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 351FACAC5B0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Sep 2025 11:26:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S1UnBS/udUDw2oFqICie23zcbp8kBYeEaJ1ff4koAi4=; b=xyObNJsi5H185cNcMZcmqDlAaH
	cgkGhmUhs0lI+2kA0NImY7HccCcgB1+ZTxhlcp5S+Q5MWNFFiPH14H+3hhPCvv9JkMZpFzKcoBGsb
	0NdVPHNshLQA9LyDRMjpCHWIFxJKzszgQaxMkvzHuSFoA1yTY9jADqj1YtIgUhEQRJ1mkDEAU1pep
	l8Chmv6Jf4C+crinfSmi2GLZ1ZvLGFsqg57zgwdlozIj01BLSJZDw5KWz1LHDnztuHvGfuD8gr7Kb
	u3zZdeermD88asRac/FPZ1Ohx1FW6EbTyZL74wna1ovuwObk1VcjPvPIjxcZJ+QlZsoMwfYHcy/4E
	/oz8EVVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v11A1-0000000DADN-1yte;
	Tue, 23 Sep 2025 11:26:17 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v119u-0000000DA9K-1aZE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Sep 2025 11:26:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=S1UnBS/udUDw2oFqICie23zcbp8kBYeEaJ1ff4koAi4=; b=icr6MKXc7MHzrUWRDtWH6tq4er
	FCpPaZnDzajBGYQNNuvgiOQqc65bxFEajXzGbbW9IBDwOsKM0ai3NnpIVzQ169FPGfgr3Vr2Ort2S
	Mxi61kFMG0ZqyHaKAGhU77QtOi5rm6F7KP0Q2KHK4My9U7X8zqMnI+DT0bhBipZM7alHgXl/FyR5m
	6wtMtmDAcr4gV7a4nE0V/6HbxeXem2ElBlFTm8dbqHFNYzaC4s6q4d3AvFnony8FXw2/bEIIPijDX
	DHDeozJIBLS/bI5MAF2GoVT+wUgkDa0fxDUIQfxx7Y1vd+rJi4e4b0BiXCbGYpoZI3oDAtXYCybkF
	EpafMbsQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:38072 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1v119p-0000000078L-1iX6;
	Tue, 23 Sep 2025 12:26:05 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1v119o-0000000773y-21gs;
	Tue, 23 Sep 2025 12:26:04 +0100
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
Subject: [PATCH net-next 2/6] net: stmmac: move xpcs clause 73 test into
 stmmac_init_phy()
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1v119o-0000000773y-21gs@rmk-PC.armlinux.org.uk>
Date: Tue, 23 Sep 2025 12:26:04 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250923_042610_416468_CD61509B 
X-CRM114-Status: GOOD (  13.35  )
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

We avoid binding a PHY if the XPCS is using clause 73 negotiation.
Rather than having this complexity in __stmmac_open(), move it to
stmmac_init_phy() instead. There is no point checking the XPCS
state this unless phylink wants a PHY, so place this appropriately.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 21 ++++++++++---------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 517b25b2bcae..3b47d4ca24ca 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -1112,6 +1112,7 @@ static void stmmac_check_pcs_mode(struct stmmac_priv *priv)
 static int stmmac_init_phy(struct net_device *dev)
 {
 	struct stmmac_priv *priv = netdev_priv(dev);
+	int mode = priv->plat->phy_interface;
 	struct fwnode_handle *phy_fwnode;
 	struct fwnode_handle *fwnode;
 	int ret;
@@ -1119,6 +1120,10 @@ static int stmmac_init_phy(struct net_device *dev)
 	if (!phylink_expects_phy(priv->phylink))
 		return 0;
 
+	if (priv->hw->xpcs &&
+	    xpcs_get_an_mode(priv->hw->xpcs, mode) == DW_AN_C73)
+		return 0;
+
 	fwnode = priv->plat->port_node;
 	if (!fwnode)
 		fwnode = dev_fwnode(priv->device);
@@ -3926,7 +3931,6 @@ static int __stmmac_open(struct net_device *dev,
 			 struct stmmac_dma_conf *dma_conf)
 {
 	struct stmmac_priv *priv = netdev_priv(dev);
-	int mode = priv->plat->phy_interface;
 	u32 chan;
 	int ret;
 
@@ -3934,15 +3938,12 @@ static int __stmmac_open(struct net_device *dev,
 	if (!priv->tx_lpi_timer)
 		priv->tx_lpi_timer = eee_timer * 1000;
 
-	if ((!priv->hw->xpcs ||
-	     xpcs_get_an_mode(priv->hw->xpcs, mode) != DW_AN_C73)) {
-		ret = stmmac_init_phy(dev);
-		if (ret) {
-			netdev_err(priv->dev,
-				   "%s: Cannot attach to PHY (error: %d)\n",
-				   __func__, ret);
-			return ret;
-		}
+	ret = stmmac_init_phy(dev);
+	if (ret) {
+		netdev_err(priv->dev,
+			   "%s: Cannot attach to PHY (error: %d)\n",
+			   __func__, ret);
+		return ret;
 	}
 
 	for (int i = 0; i < MTL_MAX_TX_QUEUES; i++)
-- 
2.47.3


