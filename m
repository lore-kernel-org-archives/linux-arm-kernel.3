Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D227ACAC591
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 17:25:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=W2tyPj55H9MQ8kwggHT+s8YzFXmBWHiBW64cPrku9as=; b=oRAZmv8WgGvqT6RsknuJThJ6Tf
	o7E/Tz4cFoHEUcG8z4JFVMwK8z9+WrB9FQkrth63J7ZOahwdM4jNzYG1oVRlJR543L2oduV2o3R0i
	Ffp7eBOUEsKg+iJMCp3U0/9S+L0O1+c7GBOCSpiKUqe6TDs3LqV7PA6Qu6Qiqa08Xk2py90H01Glc
	mQveb/TSjyuzavuBR3eDJvYhP375SVoiew5OZ7P1Qcrzuya+vmvNB1FrxiD/gQwLmgtHEkyOF2owH
	Rr7Lur29hmsqNiIN4ksSD1VJwFQO6kpc9pxMH2yIdUUYseJMDTkAbtP7RLqOGpoSHxvjIG4eUj0Bk
	P1xPjLBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw26G-000000094L2-0TXE;
	Tue, 09 Sep 2025 17:25:48 +0000
Received: from pandora.armlinux.org.uk ([78.32.30.218])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw0fo-00000008LAf-0KFr
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 15:54:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:Reply-To:Content-ID
	:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
	Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=W2tyPj55H9MQ8kwggHT+s8YzFXmBWHiBW64cPrku9as=; b=G1YABSDuRV/hzOrgl2arLN8vUY
	r/j8C9Vh55rJVM9plobhjWAe+hL/C74Ha5yQbRPag7NZUsz5HLMv7mqor9nYC9gQoRpN83L4mJFeb
	AaxqBZtvMPrRQw0UtUgFAAmDgsPLvkSIYBGSRal2XinrY5lPv2HQrublh9VIBTyWILMbQ/Nc3TbX8
	APLnuHnsC77/bRqBRcA9+18JYxEqbC7CFT82CvV+67RE+YSJ+bSH70YbrIhVR6UNfu9xFPPjWi1Xe
	oq68lDlRItDqM+jyusCWh+07Pomt17m83WZ/O1dxoDFYq9NJjazMOsnAOg3m+r4MZNjcqC8n/ANq+
	RjkdUCdA==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:49956 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1uw0fg-000000008QV-2BSv;
	Tue, 09 Sep 2025 16:54:16 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1uw0ff-00000004IQJ-3AMp;
	Tue, 09 Sep 2025 16:54:15 +0100
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
Subject: [PATCH net-next] net: stmmac: dwc-qos: use PHY WoL
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1uw0ff-00000004IQJ-3AMp@rmk-PC.armlinux.org.uk>
Date: Tue, 09 Sep 2025 16:54:15 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_085424_114312_A4E84A86 
X-CRM114-Status: GOOD (  11.01  )
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

Mark Tegra platforms to use PHY's wake-on-Lan capabilities rather than
the stmmac wake-on-Lan.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
This is the last patch that is needed to WoL on the Jetson Xavier NX
to be functional - the only patch that hasn't been through netdev
is the DT patch that's being merged through a different route. Once
all patches come together (in other words, at the next -rc1), then
WoL will be functional on this platform.

 drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c
index 6c363f9b0ce2..e8539cad4602 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c
@@ -261,7 +261,8 @@ static int tegra_eqos_probe(struct platform_device *pdev,
 	plat_dat->set_clk_tx_rate = stmmac_set_clk_tx_rate;
 	plat_dat->bsp_priv = eqos;
 	plat_dat->flags |= STMMAC_FLAG_SPH_DISABLE |
-			   STMMAC_FLAG_EN_TX_LPI_CLK_PHY_CAP;
+			   STMMAC_FLAG_EN_TX_LPI_CLK_PHY_CAP |
+			   STMMAC_FLAG_USE_PHY_WOL;
 
 	return 0;
 
-- 
2.47.3


