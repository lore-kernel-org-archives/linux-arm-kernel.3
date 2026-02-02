Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90532E73152
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Feb 2026 10:04:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w31F9JUFJE+0N+bTbS7S8ywu2RW/bdjBCgySGMXNG4k=; b=WdrFLsLzmzmwxiiDcPjwq3RyRl
	U1dSts5mDsUmUIhmEsKYlEdAsiVN7CsDKyg0I0M1m+LT2f8HEoHzF2nvlcFeIkxHmeIQDspXIT9fC
	nsdzWOT43uuS74yXzU8Ujm+VlfOEf0Nt5W0+0PDYEDtzqOjjw+/8OYyIpkUPWpIUWzZTwIoqn39RQ
	mmuUucfs+MuSG0PEj7PvRAyDiZk+W0SCAz9eK5lKVpIRUL5SK6ux2nzNKBwQPPBjzMP3N1r8CbKcp
	NKU4A7Ky34ynoD3G5r9iN11fMLEzWSsy7zh0TqTchJCXqCOabldUm8x+6YZjfvRhBt5tIO8WVgEjb
	j9luZasQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmqnK-00000004m8u-1b5O;
	Mon, 02 Feb 2026 10:04:34 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmqnF-00000004m2a-3iAB;
	Mon, 02 Feb 2026 10:04:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=w31F9JUFJE+0N+bTbS7S8ywu2RW/bdjBCgySGMXNG4k=; b=OIswVnop/upAUUehSyehLcehzq
	69fWPnAvfh2MX15udUvrG3J/m5C95aseOyKaJVXoWLt0krFdAVlP2z09wmXtxXs5Gs5193TvEpp8H
	RHqOzrLS3BoUgKXxpPm+1W/ZYxUA8JjFGf+ACHKQpEr5d1A8cUZgzh4ceD+fU+wqVW4lKX6i2XDAl
	oMlpvB1zQzK0YmCU3NLGivhvL7Js1trCPV92aoj+B/XhjlsIwK7qrNnDfjYDoPM1wwag5HN0KkVvC
	fA0wWyF5pXKmcRGlWKZTta+i5n86cIePiwrFqH2tic8seTUaHiOcpwgaS2R1Wmb28RWmr0EnGRk+k
	B9QdTQSw==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:51232 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vmqn3-000000003nE-3Rih;
	Mon, 02 Feb 2026 10:04:17 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vmqn1-00000007VCh-47Sv;
	Mon, 02 Feb 2026 10:04:16 +0000
In-Reply-To: <aYB2cKRu3DQh6yXK@shell.armlinux.org.uk>
References: <aYB2cKRu3DQh6yXK@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH net-next v2 05/10] net: stmmac: rk: remove rk3528 RMII clock
 initialisation
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1vmqn1-00000007VCh-47Sv@rmk-PC.armlinux.org.uk>
Date: Mon, 02 Feb 2026 10:04:15 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260202_020429_954120_0BD3B54E 
X-CRM114-Status: UNSURE (   9.89  )
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

There is no need to pre-initialise the rk3528 RMII clock when
selecting RMII mode on gmac0.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
index f00f4ffdc2f2..c7e88948c705 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
@@ -1003,8 +1003,7 @@ static void rk3528_set_to_rmii(struct rk_priv_data *bsp_priv)
 			     RK3528_GMAC1_PHY_INTF_SEL_RMII);
 	else
 		regmap_write(bsp_priv->grf, RK3528_VO_GRF_GMAC_CON,
-			     RK3528_GMAC0_PHY_INTF_SEL_RMII |
-			     RK3528_GMAC0_CLK_RMII_DIV2);
+			     RK3528_GMAC0_PHY_INTF_SEL_RMII);
 }
 
 static const struct rk_reg_speed_data rk3528_gmac0_reg_speed_data = {
-- 
2.47.3


