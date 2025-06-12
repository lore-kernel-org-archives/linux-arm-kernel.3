Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE3B3C61CE8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 20:55:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/wF+9Ix/fwH4D/k6aun5wQuB8ja0uch/p72DUM3MFBM=; b=Zmq+VP3f4jSkxCQOIVFPyd4QKz
	VOPSt8EwmThXBNNvSQQE9TfpwHPOrJOLIQ8alNpAMrRiPenJ2/pJ4qg3oejwiZoCpo/cp7z/EczJ2
	zr3ttLTBgQhM2Ln3QUzarOhoNSvVAzRt7gT5T4kmkql0vnhW6auw1Y2DZVtRLHPMOPgMB/pQLVXQ4
	xRatpjvL8P63DWK7yqxAcTao35ZhlbfxxmnZ61q3+IckTSiE56/Fpm/ih1ELtmpdng6ZJTYKODHYb
	c0K5UQkSpBaoQbkbvgrG2RHcjkyAaNRCVdgIhABgYdRtgD0G4ajrnHQ1afqug5btCPTWzAPtZ7g1f
	gwL9nENg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPox7-0000000EYql-39Vz;
	Thu, 12 Jun 2025 20:55:13 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPjml-0000000Dlu0-22F6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Jun 2025 15:24:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:Reply-To:Content-ID
	:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
	Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=/wF+9Ix/fwH4D/k6aun5wQuB8ja0uch/p72DUM3MFBM=; b=voQbuYRqlPaJqX/FwxM/fkp+7R
	hMhKVZSsMFUVlN3Zr+Cu0s5GByPE+NcxB1GCoctgc7gY+uoJ9CfNsQwXZVI28dT9iBhClE7lgTwnk
	It/xsQd/s35I6/1wRLIe50yQ8SXGdtQaf6npVcOWE7E26uTnI3aIk9MqTpgbTGMnQ2YkJy/PrQe5f
	mwa2DdSxNahrhVthWaStNC14QwiCw+vIjS3kgye/Yur67kpoK2y5Jtyt9fz6z/BfTjOFf0YyHgPhA
	vNNHl7tkLx4s+Y73/N+Vu+1cKPOJPaElYnu5XP/msghik8tvCBG3XUfXT1+BybMSVLwcWyvtu87j/
	OouAJA0Q==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:33414 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1uPjkb-00081Y-2V;
	Thu, 12 Jun 2025 16:21:57 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1uPjjx-0049r5-NN; Thu, 12 Jun 2025 16:21:17 +0100
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
Subject: [PATCH net-next] net: stmmac: improve .set_clk_tx_rate() method error
 message
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1uPjjx-0049r5-NN@rmk-PC.armlinux.org.uk>
Date: Thu, 12 Jun 2025 16:21:17 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_082411_792645_84A58FD0 
X-CRM114-Status: UNSURE (   9.84  )
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

Improve the .set_clk_tx_rate() method error message to include the
PHY interface mode along with the speed, which will be helpful to
the RK implementations.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 1369fa70bc58..24a4b82e934b 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -1062,8 +1062,8 @@ static void stmmac_mac_link_up(struct phylink_config *config,
 						interface, speed);
 		if (ret < 0)
 			netdev_err(priv->dev,
-				   "failed to configure transmit clock for %dMbps: %pe\n",
-				   speed, ERR_PTR(ret));
+				   "failed to configure %s transmit clock for %dMbps: %pe\n",
+				   phy_modes(interface), speed, ERR_PTR(ret));
 	}
 
 	stmmac_mac_set(priv, priv->ioaddr, true);
-- 
2.30.2


