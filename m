Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7558D3B98D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Nov 2024 13:13:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4HBoc1V84zZZDTw2ZJjLSZ/1JxmRHpoM8xEarjHfrSs=; b=vWVAM/0OumSGhSKFoTp1i7EQJY
	IyV83P6uEX9vM1zFmdQuUd7j4czXjUmikoVeLf4Fu+BkEA3MVd1OMNtPSGljVDCcbQdc+/ZpuI42g
	mo1vnfF2yrOZrNAwWesdsAqAXmcK1zHSOAqr9216yMC7SrQ3YCb0W97FYDvx/wYQ22lmhKAPRo7lo
	ZjGhWLzPe02f9wk/8BpvkF1Rn4uhXzu3cMboRtPGb6zsfNb2ffiFz2vTRoafaPko6T2S/u5hmjIHw
	X0+Lo7oP8iJ3FChx+qru2C4EZpqV510SJpEXrmKZcMTopn80RauNx5IqpKDyYqsLcfFTu79/+9sXH
	cy08ZjQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFvNS-0000000AfhE-2HPX;
	Tue, 26 Nov 2024 13:13:14 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFv4m-0000000AcMP-2R2U
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 Nov 2024 12:53:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=4HBoc1V84zZZDTw2ZJjLSZ/1JxmRHpoM8xEarjHfrSs=; b=QJGFpZxwR4D9EBF3+JrGABH3EP
	5KH7U7iku5i1vl9dQNEFjRTYERdidDETQalarU35kpaQ2SiKnU2nPj7eDxlcedTAbHkkxd/n0JQyj
	aSP0sZK2PN8oZYCq0UvWEyHVj07M79NSF1EYlM2BnGKR0Zg9NnhyMJtTKolrVRU7sbzxYOofB3+8g
	nHN4m4jHK+j8oHNHnyGN4BIrwEs6ELHxJjgrLdQKthYv3xBKFVHBRXJiBAqLlQPD1bWvN43k94gGg
	3vguL9I0eUMOM1ZpOK9/2RF9UMb474wLdWy5aTSGdsOZelNcXlytPFSVmvwhZ6kxHBucCagzLvFc5
	bp5OVUWg==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:42622 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1tFv4f-0006xX-1I;
	Tue, 26 Nov 2024 12:53:49 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1tFv4e-005yjE-7Z; Tue, 26 Nov 2024 12:53:48 +0000
In-Reply-To: <Z0XEWGqLJ8okNSIr@shell.armlinux.org.uk>
References: <Z0XEWGqLJ8okNSIr@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Bryan Whitehead <bryan.whitehead@microchip.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Jose Abreu <joabreu@synopsys.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Marcin Wojtas <marcin.s.wojtas@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	netdev@vger.kernel.org,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	Paolo Abeni <pabeni@redhat.com>,
	UNGLinuxDriver@microchip.com
Subject: [PATCH RFC net-next 19/23] net: stmmac: remove redundant code from
 ethtool EEE ops
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1tFv4e-005yjE-7Z@rmk-PC.armlinux.org.uk>
Date: Tue, 26 Nov 2024 12:53:48 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241126_045356_619323_088C7A1C 
X-CRM114-Status: UNSURE (   9.15  )
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

Now that stmmac is using the result of phylib's evaluation of EEE,
there is no need to handle anything in the ethtool EEE ops other than
calling through to the appropriate phylink function, which will pass
on to phylib the users request.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
index 5ce095a62feb..3a10788bb210 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
@@ -898,8 +898,6 @@ static int stmmac_ethtool_op_get_eee(struct net_device *dev,
 	if (!priv->dma_cap.eee)
 		return -EOPNOTSUPP;
 
-	edata->tx_lpi_enabled = priv->tx_lpi_enabled;
-
 	return phylink_ethtool_get_eee(priv->phylink, edata);
 }
 
@@ -911,13 +909,6 @@ static int stmmac_ethtool_op_set_eee(struct net_device *dev,
 	if (!priv->dma_cap.eee)
 		return -EOPNOTSUPP;
 
-	if (priv->tx_lpi_enabled != edata->tx_lpi_enabled)
-		netdev_warn(priv->dev,
-			    "Setting EEE tx-lpi is not supported\n");
-
-	if (!edata->eee_enabled)
-		stmmac_disable_eee_mode(priv);
-
 	return phylink_ethtool_set_eee(priv->phylink, edata);
 }
 
-- 
2.30.2


