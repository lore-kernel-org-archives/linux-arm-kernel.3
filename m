Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BAA6EB7EB6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 10:22:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=52X/BulkGNjlU03mY+rQgB6PxxV/PyTPUJEYegWdRoA=; b=0208zKWW8OtDVdOlIAIsAdTQCM
	zetwvBhwaf/CyRgn3Bvrpotw4iM4kNsIhjOTIJ5eeW0bCOX52r3HB4s0JQ5ejua8GcvVqng3gb8S9
	C7T7O91dnv1euNt1+eUTJSRHPCJZqHsV2MYMF6Qe8Yty+6a95xMVSlMaB/itsHh8iai6k4TI6/6lc
	s84vXiZIV5H6KPNuRvMobAZUaFkz8d3B3e2wEqnmFpqbnRl3ysdqlaf1LVAGy3TCkDF9/jgYh2f0e
	pdORKz19naqG5OKNUYgPqIom5CoMPOOnnOkC5StXgNd2rqPmmv1uxm8uBdRsaVj/ScuvpM0RhiMMr
	mSkXIovw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxjNV-0000000GyVx-0gek;
	Wed, 04 Mar 2026 10:22:53 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxjNS-0000000GyUk-2fDa
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Mar 2026 10:22:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=52X/BulkGNjlU03mY+rQgB6PxxV/PyTPUJEYegWdRoA=; b=pvhRUhSCwKSrU0FHSuokqIX3uG
	ZkPYB7XI7k1n+B8DKM2hah20K5GSGmCZ1q2kagLVVQitT8WHkUE+nzoaR+Np5z9ugFqAgE9FM8g3L
	Q9QuFKRnAFk+r2cYz9r9YiLSCjm9YlldKFeOxYdT2T7Sn8SGWN4uYICNsK+/0m0/TaQiuJ2Lx0sPe
	Lq9tscgSqhtUZXKt6Cf+LtjUU/553bZzsjDFZanAMoA4xdEbDmJJLyiUZXRk/Qc4YOnP3RHKNgO6z
	OEGlxa0kkHZrc2VP7UBlunfF8q3XFbxIwiAVJQqN8lK4GwGdde4YYcKYNhxcc6mdVd0I1ukb5mA7V
	kOWC0WRQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:43038 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vxjNK-000000006LP-3kJM;
	Wed, 04 Mar 2026 10:22:42 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vxjNJ-0000000Br18-3sVv;
	Wed, 04 Mar 2026 10:22:41 +0000
In-Reply-To: <aagH023pvswd0tlT@shell.armlinux.org.uk>
References: <aagH023pvswd0tlT@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Chen-Yu Tsai <wens@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-sunxi@lists.linux.dev,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	Samuel Holland <samuel@sholland.org>
Subject: [PATCH net-next 3/8] net: stmmac: mdio: simplify MDC clock divisor
 lookup
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1vxjNJ-0000000Br18-3sVv@rmk-PC.armlinux.org.uk>
Date: Wed, 04 Mar 2026 10:22:41 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_022250_675763_28CB560F 
X-CRM114-Status: GOOD (  13.75  )
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

As each lookup now iterates over each table in the same way, simplfy
the code to select the table, and then walk that table.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../net/ethernet/stmicro/stmmac/stmmac_mdio.c | 27 +++++++------------
 1 file changed, 10 insertions(+), 17 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
index 6292911fb54b..55dd3e07223d 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
@@ -535,6 +535,7 @@ static const struct stmmac_clk_rate stmmac_xgmac_csr_to_mdc[] = {
  */
 static u32 stmmac_clk_csr_set(struct stmmac_priv *priv)
 {
+	const struct stmmac_clk_rate *rates;
 	unsigned long clk_rate;
 	u32 value = ~0;
 	int i;
@@ -548,26 +549,18 @@ static u32 stmmac_clk_csr_set(struct stmmac_priv *priv)
 	 * the frequency of clk_csr_i. So we do not change the default
 	 * divider.
 	 */
-	for (i = 0; stmmac_std_csr_to_mdc[i].rate; i++)
-		if (clk_rate > stmmac_std_csr_to_mdc[i].rate)
+	rates = stmmac_std_csr_to_mdc;
+	if (priv->plat->flags & STMMAC_FLAG_HAS_SUN8I)
+		rates = stmmac_sun8i_csr_to_mdc;
+	if (priv->plat->core_type == DWMAC_CORE_XGMAC)
+		rates = stmmac_xgmac_csr_to_mdc;
+
+	for (i = 0; rates[i].rate; i++)
+		if (clk_rate > rates[i].rate)
 			break;
-	if (stmmac_std_csr_to_mdc[i].cr != (u8)~0)
+	if (rates[i].cr != (u8)~0)
 		value = stmmac_std_csr_to_mdc[i].cr;
 
-	if (priv->plat->flags & STMMAC_FLAG_HAS_SUN8I) {
-		for (i = 0; stmmac_sun8i_csr_to_mdc[i].rate; i++)
-			if (clk_rate > stmmac_sun8i_csr_to_mdc[i].rate)
-				break;
-		value = stmmac_sun8i_csr_to_mdc[i].cr;
-	}
-
-	if (priv->plat->core_type == DWMAC_CORE_XGMAC) {
-		for (i = 0; stmmac_xgmac_csr_to_mdc[i].rate; i++)
-			if (clk_rate > stmmac_xgmac_csr_to_mdc[i].rate)
-				break;
-		value = stmmac_xgmac_csr_to_mdc[i].cr;
-	}
-
 	return value;
 }
 
-- 
2.47.3


