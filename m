Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E97AC282DE
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 20:45:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qK3GcAy1T7b7ZQP5vAw6ojWgGkMIfURsR+RxPTcGPYs=; b=bV7O3S/oJ3A6UMXAx4m2KMVE86
	171NJEHW4WbdUVWRDldmjpvkhPll5K9lEJihHaj3tO23wagq08DZILFwJqDYeDun4p6PviEkko89+
	I6RhCMmuJowC4gs5qOHGq/Qh339f5d2HtKwwgeE7hiBcRlWamsKcFnaB0ROYsFaTeaXz7UBLE2eQ4
	t8ag5H5AcX5uxvz3hdEoDU9pFVA36pUxxQls98sLrDnECLfa2KR6z9Q+AAEBP4xPd/u2OqNC7t9sR
	su3RiKX+BzJIQMK2xz7yUNolfev1hzQYQ5QVwFlDenzoIEi8ck47ibKJP3xl1FoSmB92TNNQXjlOF
	b//uIV2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqI6G-0000000C9b4-2GXd;
	Thu, 06 Mar 2025 20:45:48 +0000
Received: from smtp.forwardemail.net ([149.28.215.223])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqI06-0000000C8hb-1D5U
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Mar 2025 20:39:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From; q=dns/txt; s=fe-e1b5cab7be;
 t=1741293565; bh=qK3GcAy1T7b7ZQP5vAw6ojWgGkMIfURsR+RxPTcGPYs=;
 b=dOpCFaE/HW4BZDw1+wRTcslAyYkItZ2SiABmkq8gQbdq+TMawFaQQa9N76Q8RKxp5el2gVQcm
 vgsJzIguqLC0TRhVkTrrHvRlyzblsIXDt9+F2WRLS29wCzxMk66qRXhhHMJgcSoZgGRDllAxK01
 lBiq6OqGhiOH+Jw0D+unYM4PdopI068488wvm8kUBWTKsEUGc8fViVGtTDKKC11YIeoW6Hufbfq
 fvArE+nVDTno8YrngLTfe2S5G8Wetg9pn0kq4P0rwix6eyqK5sTAWUe7UyUB4dT0Y6CuFj0YP+/
 dBx6FW+C8nIRbMncmEqmdqm/b4MzTQ/XUIMioChSD5Ww==
X-Forward-Email-ID: 67ca07f4deafcb1458af928b
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
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
	David Wu <david.wu@rock-chips.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: netdev@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jonas Karlman <jonas@kwiboo.se>,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH 3/3] net: stmmac: dwmac-rk: Use DELAY_ENABLE macro for RK3588
Date: Thu,  6 Mar 2025 20:38:54 +0000
Message-ID: <20250306203858.1677595-4-jonas@kwiboo.se>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250306203858.1677595-1-jonas@kwiboo.se>
References: <20250306203858.1677595-1-jonas@kwiboo.se>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_123926_354267_0E3ED6D6 
X-CRM114-Status: GOOD (  10.27  )
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

Support for Rockchip RK3588 GMAC was added without use of the
DELAY_ENABLE macro to assist with enable/disable use of MAC rx/tx delay.

Change to use a variant of the DELAY_ENABLE macro to help disable MAC
delay when RGMII_ID/RXID/TXID is used.

Fixes: 2f2b60a0ec28 ("net: ethernet: stmmac: dwmac-rk: Add gmac support for rk3588")
Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
index 37eb86e4e325..79db81d68afd 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
@@ -91,6 +91,10 @@ struct rk_priv_data {
 	(((tx) ? soc##_GMAC_TXCLK_DLY_ENABLE : soc##_GMAC_TXCLK_DLY_DISABLE) | \
 	 ((rx) ? soc##_GMAC_RXCLK_DLY_ENABLE : soc##_GMAC_RXCLK_DLY_DISABLE))
 
+#define DELAY_ENABLE_BY_ID(soc, tx, rx, id) \
+	(((tx) ? soc##_GMAC_TXCLK_DLY_ENABLE(id) : soc##_GMAC_TXCLK_DLY_DISABLE(id)) | \
+	 ((rx) ? soc##_GMAC_RXCLK_DLY_ENABLE(id) : soc##_GMAC_RXCLK_DLY_DISABLE(id)))
+
 #define PX30_GRF_GMAC_CON1		0x0904
 
 /* PX30_GRF_GMAC_CON1 */
@@ -1322,8 +1326,7 @@ static void rk3588_set_to_rgmii(struct rk_priv_data *bsp_priv,
 		     RK3588_GMAC_CLK_RGMII_MODE(id));
 
 	regmap_write(bsp_priv->grf, RK3588_GRF_GMAC_CON7,
-		     RK3588_GMAC_RXCLK_DLY_ENABLE(id) |
-		     RK3588_GMAC_TXCLK_DLY_ENABLE(id));
+		     DELAY_ENABLE_BY_ID(RK3588, tx_delay, rx_delay, id));
 
 	regmap_write(bsp_priv->grf, offset_con,
 		     RK3588_GMAC_CLK_RX_DL_CFG(rx_delay) |
-- 
2.48.1


