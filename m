Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 440EAD72373
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Jan 2026 11:02:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=siUz6Rf39Wszy8PXQnr6b5myc2YgOaPjeYFvBM/YHms=; b=Tj9wHmItOgd2aTytt94dh1GBcE
	WY1PusW1L8vol9VCGxql5NBEytjVkEDeISnMW5VgqwUIGJ1wTow698MGg89Ci3Tlq1dnDA5octfGM
	FZJgeNNobNlOyNhjNqRLpBbnTjIxJWbsoJzafuM4wvAY3Ghf53hg52J5J8StLMpYMMuO+cefh2jPk
	X1II4cR14Ip28Z5MSMmVKU9hXT72lViq+gDLJnyX205Z0nN90YxjL6N68s/3ha9Js0SW0iC61Yt3E
	vVBDy4ENW/ZhevQmGvLLh/uEA8NaSd1qCIE+/DGmuK3AABdvDIVl6otW9Q9T4DzxHkwqETCgkkRxn
	QgotGrkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjEvQ-00000008mns-1Xpp;
	Fri, 23 Jan 2026 11:02:00 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjEvO-00000008mkF-22Df;
	Fri, 23 Jan 2026 11:01:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description;
	bh=siUz6Rf39Wszy8PXQnr6b5myc2YgOaPjeYFvBM/YHms=; b=ovIo9jMuMh4u5jD6mCKZffmvR6
	AJzCmViUZzIjF+Ecbz4txhH5/gMh9XZ3LaBf8aeA2stkiXau9Or+68GHgPZZ3wceQdLLJLbA7VD4I
	C50EQoPJ75FY+Lzl6T/f290pLJ6Xi3ty1drzh4lIQUudgAz3gCGPe9k3l4EQdkKobJX9zG5dRbn4T
	Dq0uYSKmjZ+hjEpFpSdgb2GVJAjx+m2upydCPP0Fg3uWbSMX7UAGzxRUWrXEBNfwQQ1G+XhjAQmiC
	JsDlzgiXxhhYfu+fY80+a7lK38PR1qsRgEstfZr408n31qbLHseaghnXQTWiEUBGdXdlo7nZulPvK
	SaeggIXg==;
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjEvJ-00000002DWZ-1v1a;
	Fri, 23 Jan 2026 11:01:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=siUz6Rf39Wszy8PXQnr6b5myc2YgOaPjeYFvBM/YHms=; b=wkf36Y/We+O9BoSAbwiShH/wpx
	UgcPb/+75jDKT2hRYQUBi2ORSc+o9URPsQSvqccKSyHisF3n0kGvqN/OsGgNyxcoel8nz1xbIuTz5
	iCxhWoLLyiS3aAxBHtkbp07nO24xT9SR8tU4M9elXAQEoMiI9jnGUK9nczycusnMU/v8N86vJLRZ3
	Kd4K7wAeCNOc/AxQnfDS48FnL8JWeM/Y+Me4lStQyrT2Iyg9TuDtziQHmVYchuFCmswhL5YOoKW/X
	3uHYJ5BhH/FkrXguhlCXgDzeITkPgErcD5GOt848drkCqUxBLI4F8NpuE9YYSaGv3suBGbnPveZRU
	mY0MunsA==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:48478 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vjEv4-000000001qV-0w8r;
	Fri, 23 Jan 2026 11:01:38 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vjEv0-00000005gh1-1dTz;
	Fri, 23 Jan 2026 11:01:34 +0000
In-Reply-To: <aXNUlVZilT-CTgph@shell.armlinux.org.uk>
References: <aXNUlVZilT-CTgph@shell.armlinux.org.uk>
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
Subject: [PATCH net-next 15/21] net: stmmac: rk: convert px30
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1vjEv0-00000005gh1-1dTz@rmk-PC.armlinux.org.uk>
Date: Fri, 23 Jan 2026 11:01:34 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260123_110153_996264_DDE9A96A 
X-CRM114-Status: GOOD (  10.42  )
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

Use rk_set_clk_mac_speed() rather than px30 specific function for
configuring RMII clock.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../net/ethernet/stmicro/stmmac/dwmac-rk.c    | 38 ++-----------------
 1 file changed, 4 insertions(+), 34 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
index 812e6729a703..802052beb668 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
@@ -251,49 +251,19 @@ static void rk_gmac_integrated_fephy_powerdown(struct rk_priv_data *priv,
 
 #define PX30_GRF_GMAC_CON1		0x0904
 
-/* PX30_GRF_GMAC_CON1 */
-#define PX30_GMAC_SPEED_10M		GRF_CLR_BIT(2)
-#define PX30_GMAC_SPEED_100M		GRF_BIT(2)
-
 static void px30_set_to_rmii(struct rk_priv_data *bsp_priv)
 {
 }
 
-static int px30_set_speed(struct rk_priv_data *bsp_priv,
-			  phy_interface_t interface, int speed)
-{
-	struct clk *clk_mac_speed = bsp_priv->clks[RK_CLK_MAC_SPEED].clk;
-	struct device *dev = bsp_priv->dev;
-	unsigned int con1;
-	long rate;
-
-	if (!clk_mac_speed) {
-		dev_err(dev, "%s: Missing clk_mac_speed clock\n", __func__);
-		return -EINVAL;
-	}
-
-	if (speed == 10) {
-		con1 = PX30_GMAC_SPEED_10M;
-		rate = 2500000;
-	} else if (speed == 100) {
-		con1 = PX30_GMAC_SPEED_100M;
-		rate = 25000000;
-	} else {
-		dev_err(dev, "unknown speed value for RMII! speed=%d", speed);
-		return -EINVAL;
-	}
-
-	regmap_write(bsp_priv->grf, PX30_GRF_GMAC_CON1, con1);
-
-	return clk_set_rate(clk_mac_speed, rate);
-}
-
 static const struct rk_gmac_ops px30_ops = {
 	.set_to_rmii = px30_set_to_rmii,
-	.set_speed = px30_set_speed,
+	.set_speed = rk_set_clk_mac_speed,
 
 	.gmac_grf_reg = PX30_GRF_GMAC_CON1,
 	.gmac_phy_intf_sel_mask = GENMASK_U16(6, 4),
+
+	.clock_grf_reg = PX30_GRF_GMAC_CON1,
+	.clock.mac_speed_mask = BIT_U16(2),
 };
 
 #define RK3128_GRF_MAC_CON0	0x0168
-- 
2.47.3


