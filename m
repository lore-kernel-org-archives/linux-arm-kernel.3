Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EF0EC282D1
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 20:41:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7JyxP8FBRDIO7vgzFTNLCIrseIO0xPkXO1N8Yvb5Wzo=; b=w/+evuLgEaazpo3oxTE22EpXkV
	+7g1Edhp+jBjRruKfkhDlIlya06ppixrO4IHdWInwpSBe9sgiA9K3oBZgLmpMN9qW9ntnoUnKJqt5
	m/hMxm1nu/Aik2SzrnBllAzpJJtHqUUig7ayaOMFPslBxLj1SUvLPvXzKkci5lnr2bBfWL+RNV//3
	Gg5oZ/bOhZF+1a3uF3zzcLvBPQ/yWnrIeGskWi1AogHE01qQlS9LGrA5BUQzyPx53x2GAPs4+uXSt
	nVpi1zTThKiTqFJ/bamC+el4XIHxS6t93H8ggZtX6g5C44gapKzhlPRvDhhUaJ5rzH3XSvWPmdsY4
	zTS5HvvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqI1V-0000000C8xo-0oJO;
	Thu, 06 Mar 2025 20:40:53 +0000
Received: from smtp.forwardemail.net ([121.127.44.59])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqHzs-0000000C8dY-06zc
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Mar 2025 20:39:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From; q=dns/txt; s=fe-e1b5cab7be;
 t=1741293551; bh=7JyxP8FBRDIO7vgzFTNLCIrseIO0xPkXO1N8Yvb5Wzo=;
 b=IMwd2ph58mPQiONElVhaN1kGWelHLE/HsoQgQJOVELhIsafBOn3JS7Fxm9HyUb3Ysg0FCKUEl
 WX91+74IgVqnMvP9ucJd7Ab5rRST8RDny65NVjnTeaxw+kPgkUC3+41BHT4qth7XIm1x5ylyc1+
 WvtDtUvyVhWNj/MtiM82WdqQSCVf5zK8puNpoF81HAAs2ora/gF2mn0bnEHfY3BqdZkIrcF4Kds
 Qewhd8VNpcjL3YOa6+JqsbYYUcsD4oLkEq9IK1ciTqnQhMWVz7gExV38pXrZkaU6pLpx4qKDegI
 2dRdngDLQ059e0HuNskk/DayZpoix0yAICOaRgCxmJRw==
X-Forward-Email-ID: 67ca07ecdeafcb1458af9261
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 121.127.44.59
X-Forward-Email-Version: 0.4.40
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
From: Jonas Karlman <jonas@kwiboo.se>
To: Heiko Stuebner <heiko@sntech.de>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Wadim Egorov <w.egorov@phytec.de>
Cc: netdev@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jonas Karlman <jonas@kwiboo.se>,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH 1/3] net: stmmac: dwmac-rk: Use DELAY_ENABLE macro for RK3328
Date: Thu,  6 Mar 2025 20:38:52 +0000
Message-ID: <20250306203858.1677595-2-jonas@kwiboo.se>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250306203858.1677595-1-jonas@kwiboo.se>
References: <20250306203858.1677595-1-jonas@kwiboo.se>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_123912_149744_DD4697EF 
X-CRM114-Status: GOOD (  10.08  )
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

Support for Rockchip RK3328 GMAC and addition of the DELAY_ENABLE macro
was merged in the same merge window. This resulted in RK3328 not being
converted to use the new DELAY_ENABLE macro.

Change to use the DELAY_ENABLE macro to help disable MAC delay when
RGMII_ID/RXID/TXID is used.

Fixes: eaf70ad14cbb ("net: stmmac: dwmac-rk: Add handling for RGMII_ID/RXID/TXID")
Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
index 003fa5cf42c3..297fa93e4a39 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
@@ -593,8 +593,7 @@ static void rk3328_set_to_rgmii(struct rk_priv_data *bsp_priv,
 	regmap_write(bsp_priv->grf, RK3328_GRF_MAC_CON1,
 		     RK3328_GMAC_PHY_INTF_SEL_RGMII |
 		     RK3328_GMAC_RMII_MODE_CLR |
-		     RK3328_GMAC_RXCLK_DLY_ENABLE |
-		     RK3328_GMAC_TXCLK_DLY_ENABLE);
+		     DELAY_ENABLE(RK3328, tx_delay, rx_delay));
 
 	regmap_write(bsp_priv->grf, RK3328_GRF_MAC_CON0,
 		     RK3328_GMAC_CLK_RX_DL_CFG(rx_delay) |
-- 
2.48.1


