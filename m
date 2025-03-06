Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B53BC282D1
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 20:44:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YyDWZm/uji1wnOwzLL0mO19G3wOIsbkpkj7q10ooChs=; b=e27dotnMzpq+5k00WkX5mn3dW/
	jvb9oyYYz/Sz1bH73iGraqwfz4+AHfM5wR6MVV8WII+o0SipU22+1sgtCdWBjCohxReg0ElRx/v+b
	30TprC9sZjhb+Mcv/ihU7EIN7PUclirat5KcB9DmRJnwuOitWVLckHkqwlzTlM8Ii9Oc14h2WeLYa
	QeBoPcTLLYLKpTpjHIc4FtwXQd2NVBr/j5kUyoou30eSylPr6IXswdFb/RDzH8Z0vmxRmv3RW2S8m
	B2MFO6S3kU13HHyYfAFUGDa2Cwqr7Swn/NRFYGKWWlrC2fCtnCgutSx4evS1klTGVt2aMJczP52h5
	Fj+nV6sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqI4f-0000000C9LC-3xte;
	Thu, 06 Mar 2025 20:44:09 +0000
Received: from smtp.forwardemail.net ([121.127.44.73])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqHzw-0000000C8ei-2ba1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Mar 2025 20:39:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From; q=dns/txt; s=fe-e1b5cab7be;
 t=1741293555; bh=YyDWZm/uji1wnOwzLL0mO19G3wOIsbkpkj7q10ooChs=;
 b=0qj696Mys7I+j4bRWRd5PH3mdm3yo7WNIYutudch75jBkWqHLFRbb7BMUV/lIz5LsaMcQCDHr
 TDYEqEO3VU69aclPqhWMteXB7XhCSME4q83fL8mjWThsVBMfgX/NAXM6GabiSlK40imFT7WIb8r
 C8EWofbhnQimdV2E/Ew4Onf7SRqOftVgWf4saaO2A8DTujkMhWsQREhEO2ezcxQWYxm3pKhauxf
 9OJtGOM6bjP6RLa9pSg8iuj8Kkhzj8Dn8xqc7TmI0mxqeMMqgzg/vI9FCFa13dV/f/q1HCE4s8w
 g5raOO6Lgtl31DpFMBpKmfRLtmDPA+S9b9eeedusBEdA==
X-Forward-Email-ID: 67ca07f0deafcb1458af9276
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 121.127.44.73
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
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	David Wu <david.wu@rock-chips.com>
Cc: netdev@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jonas Karlman <jonas@kwiboo.se>,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH 2/3] net: stmmac: dwmac-rk: Use DELAY_ENABLE macro for RK3566/RK3568
Date: Thu,  6 Mar 2025 20:38:53 +0000
Message-ID: <20250306203858.1677595-3-jonas@kwiboo.se>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250306203858.1677595-1-jonas@kwiboo.se>
References: <20250306203858.1677595-1-jonas@kwiboo.se>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_123916_762248_436C40F3 
X-CRM114-Status: UNSURE (   9.72  )
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

Support for Rockchip RK3566/RK3568 GMAC was added without use of the
DELAY_ENABLE macro to assist with enable/disable use of MAC rx/tx delay.

Change to use the DELAY_ENABLE macro to help disable MAC delay when
RGMII_ID/RXID/TXID is used. This also re-order to enable/disable before
the delay is written to match all other GMAC and vendor kernel.

Fixes: 3bb3d6b1c195 ("net: stmmac: Add RK3566/RK3568 SoC support")
Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
index 297fa93e4a39..37eb86e4e325 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
@@ -1049,14 +1049,13 @@ static void rk3568_set_to_rgmii(struct rk_priv_data *bsp_priv,
 	con1 = (bsp_priv->id == 1) ? RK3568_GRF_GMAC1_CON1 :
 				     RK3568_GRF_GMAC0_CON1;
 
+	regmap_write(bsp_priv->grf, con1,
+		     RK3568_GMAC_PHY_INTF_SEL_RGMII |
+		     DELAY_ENABLE(RK3568, tx_delay, rx_delay));
+
 	regmap_write(bsp_priv->grf, con0,
 		     RK3568_GMAC_CLK_RX_DL_CFG(rx_delay) |
 		     RK3568_GMAC_CLK_TX_DL_CFG(tx_delay));
-
-	regmap_write(bsp_priv->grf, con1,
-		     RK3568_GMAC_PHY_INTF_SEL_RGMII |
-		     RK3568_GMAC_RXCLK_DLY_ENABLE |
-		     RK3568_GMAC_TXCLK_DLY_ENABLE);
 }
 
 static void rk3568_set_to_rmii(struct rk_priv_data *bsp_priv)
-- 
2.48.1


