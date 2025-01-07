Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 883A4E77197
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 16:55:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7d7BQ/BETeIV65nPIiOzm00NlijFDRQ+qTkPLKa/GqA=; b=ru+o7MHtiTzfQDjN7V2ugmAI2/
	x/McdmT/38zQ9WKPLGgAMNIyP2/h6pj0ZGzlF7SsOS3qvz/vqHCIi+eOdhbb/YPGaMaJtMCWNwGt0
	hMrd5VfhVOd5maoKZyb/QczhCaowROjzbyOzONA2ffSD85gc2ZntjffANH08SyhjqQh5/sy5/ChPg
	C8gcQGjA3dMypkHQh6xyXaCS72zmh/w5nmtsyzsTd4KNoWEoqsOd6+FUK0jtoBe2dIkShT7kHLi0f
	+Bj31elHuNMxxXSGDLCYJNZNz0KZOEtHnEznatROn4eBNOmjA2TdQs0emt/yV0PN0TE+iB+mE+ZFo
	67P8qq1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVCrE-00000005jCf-1FIT;
	Tue, 07 Jan 2025 16:55:08 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVCSL-00000005dWb-47Tv
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jan 2025 16:29:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=7d7BQ/BETeIV65nPIiOzm00NlijFDRQ+qTkPLKa/GqA=; b=nT36DyoO7lQAsXQtF3lEL6XxzT
	b8nLupooWuvs9EvGJA9qpperJjbyL8XznPcoKtDDA2IOGxa1T8tBq4LCCrzoLwUYOY7qFqzSWbqLb
	Ol1CsoxA40XUEDqGRjPwC0j+Fc+oJfu+jAubAGMce2ml5GNrVQTfFNjeCyG0nc59QgGqGDpx+ZoSC
	oN/+oHKPqnfCHVyIv7dg+tsEhar0wZ3ObggT82HIsXla0guTZwOskzL2u11Y/XVMgN4O7yXDytTh9
	gCqiCWUJozg1rP6jsWsIcG0UVo0FNUy9EmzrG9rGFq7yOGKuHR5nfUuLxTgCJRdOY57JuYwaKzy8S
	JpuFNzlw==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:43520 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1tVCSH-0007nN-0v;
	Tue, 07 Jan 2025 16:29:21 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1tVCSE-007Y3r-8D; Tue, 07 Jan 2025 16:29:18 +0000
In-Reply-To: <Z31V9O8SATRbu2L3@shell.armlinux.org.uk>
References: <Z31V9O8SATRbu2L3@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Jose Abreu <joabreu@synopsys.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH net-next v3 10/18] net: stmmac: convert to use
 phy_eee_rx_clock_stop()
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1tVCSE-007Y3r-8D@rmk-PC.armlinux.org.uk>
Date: Tue, 07 Jan 2025 16:29:18 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_082926_047045_9DA11E2A 
X-CRM114-Status: GOOD (  10.18  )
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

Convert stmmac to use phy_eee_rx_clock_stop() to set the PHY receive
clock stop in LPI setting, rather than calling the legacy
phy_init_eee() function.

Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index fc80ed101a79..adc51087f2ba 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -1077,10 +1077,10 @@ static void stmmac_mac_link_up(struct phylink_config *config,
 
 	stmmac_mac_set(priv, priv->ioaddr, true);
 	if (phy && priv->dma_cap.eee) {
-		priv->eee_active = phy->enable_tx_lpi &&
-			phy_init_eee(phy, !(priv->plat->flags &
-				STMMAC_FLAG_RX_CLK_RUNS_IN_LPI)) >= 0;
+		phy_eee_rx_clock_stop(phy, !(priv->plat->flags &
+					     STMMAC_FLAG_RX_CLK_RUNS_IN_LPI));
 		priv->tx_lpi_timer = phy->eee_cfg.tx_lpi_timer;
+		priv->eee_active = phy->enable_tx_lpi;
 		priv->eee_enabled = stmmac_eee_init(priv);
 		stmmac_set_eee_pls(priv, priv->hw, true);
 	}
-- 
2.30.2


