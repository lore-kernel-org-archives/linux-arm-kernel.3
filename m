Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A641F3092A
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 10:42:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ogTF0nwdsw9SfsXkkXPmG+1dcoUkKCrfCK9EtBt6iXY=; b=26dgzi0NS7sBx1wAbwIzEHbZzt
	VI5XZDO/Fb63KrTqXBjIPFDqTmgvOygZJ/8LDHkLjXsKpCOn7l8kzbggSutNdWm/7cUAo5fslrkjD
	vRC+x35YHSfoyuzUMiWrzFVYTp3As9qp+Kx14SmZp54tpmJVuOi2IoLXFDiVEE3tFF/h9SWNZhWAI
	zNqWm03rafd9hWxfHyhIM6dOS0lF0MbrsAaJnpR+sajY2h+Y6vZ98kYdzoeq/Q5+KGiaqKrPVODPp
	acZ8ToosDSEL3uBuX40Ei+3DEKQJXF/5OYdadHhiZDkC9nsZLqpr/la2eNFXh2aw3vF/MCW8VrVTF
	7N7kGIeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy6AK-00000001bPp-0fkm;
	Thu, 05 Mar 2026 10:42:48 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy6AI-00000001bNo-0wKP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 10:42:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=ogTF0nwdsw9SfsXkkXPmG+1dcoUkKCrfCK9EtBt6iXY=; b=mzd9Vi17Y8fsq1lbF7B6trNGzX
	XciP0EMRAq+KpqWqEoCSGQ2Efb0n7upecnA6cu5jov3LMwAlOg7JEnqBADsb9eVXVBHxDcdg11t6A
	PDZ4aCfxNVsoVXEsiucJ8biSaKIWh3sI2EineFZopP5PTr6Q858Z20o1rANsAK8nShLGKo550I8dQ
	EzHooF4548FFvurv6hc2Rn5VZAj6khnDCe1OLf4NNFf+fYMceVwjxac0tXQW+fgQZ60UquqOmNalG
	be6aQojUFJ+M+fMAHFd3qj3eEWbv6tqCkR0E0xmDRmMbUcdm4EXtDxNLUwpR42Ov5cSI1wY6OwJWd
	GxoAg6Yg==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:46580 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vy6AA-000000007nC-10GC;
	Thu, 05 Mar 2026 10:42:38 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vy6A9-0000000Btwp-0lxY;
	Thu, 05 Mar 2026 10:42:37 +0000
In-Reply-To: <aald--qJquWGIvmO@shell.armlinux.org.uk>
References: <aald--qJquWGIvmO@shell.armlinux.org.uk>
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
Subject: [PATCH net-next v2 3/8] net: stmmac: mdio: simplify MDC clock divisor
 lookup
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1vy6A9-0000000Btwp-0lxY@rmk-PC.armlinux.org.uk>
Date: Thu, 05 Mar 2026 10:42:37 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_024246_263136_70C3ED22 
X-CRM114-Status: GOOD (  13.79  )
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
 .../net/ethernet/stmicro/stmmac/stmmac_mdio.c | 29 +++++++------------
 1 file changed, 11 insertions(+), 18 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
index 6292911fb54b..c9f0b8b601d2 100644
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
@@ -548,25 +549,17 @@ static u32 stmmac_clk_csr_set(struct stmmac_priv *priv)
 	 * the frequency of clk_csr_i. So we do not change the default
 	 * divider.
 	 */
-	for (i = 0; stmmac_std_csr_to_mdc[i].rate; i++)
-		if (clk_rate > stmmac_std_csr_to_mdc[i].rate)
-			break;
-	if (stmmac_std_csr_to_mdc[i].cr != (u8)~0)
-		value = stmmac_std_csr_to_mdc[i].cr;
-
-	if (priv->plat->flags & STMMAC_FLAG_HAS_SUN8I) {
-		for (i = 0; stmmac_sun8i_csr_to_mdc[i].rate; i++)
-			if (clk_rate > stmmac_sun8i_csr_to_mdc[i].rate)
-				break;
-		value = stmmac_sun8i_csr_to_mdc[i].cr;
-	}
+	rates = stmmac_std_csr_to_mdc;
+	if (priv->plat->flags & STMMAC_FLAG_HAS_SUN8I)
+		rates = stmmac_sun8i_csr_to_mdc;
+	if (priv->plat->core_type == DWMAC_CORE_XGMAC)
+		rates = stmmac_xgmac_csr_to_mdc;
 
-	if (priv->plat->core_type == DWMAC_CORE_XGMAC) {
-		for (i = 0; stmmac_xgmac_csr_to_mdc[i].rate; i++)
-			if (clk_rate > stmmac_xgmac_csr_to_mdc[i].rate)
-				break;
-		value = stmmac_xgmac_csr_to_mdc[i].cr;
-	}
+	for (i = 0; rates[i].rate; i++)
+		if (clk_rate > rates[i].rate)
+			break;
+	if (rates[i].cr != (u8)~0)
+		value = rates[i].cr;
 
 	return value;
 }
-- 
2.47.3


