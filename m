Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74A38EB7EA5
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 10:22:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BA8aS99WMPj3OT7Rzlgq2AHc4SAU+sTCqlYuVCyMfo8=; b=poXdX+sUAIA1rnR17eKhRfrtp1
	xENTPloNDwbNBGpCl3hP+YBsnAEAtjfw5TsVTaKVL2ffEtCujjBzoGwcnhWr/L9/6Cf8QZF3vMvnk
	Dx1h1x6a8GUTfm3MLyveueZ9jLvQS3aAWsO1LqmFW0tdKBClkWziEEubeq6W3gt6zlmTuhUmxwxAY
	V4msK4Fn0GsxinwgZJB6K1/WCe3llQ1jRFP8h3zTA54UEInLK6u5NEvILMJWit82zJRQ1wofwUGl8
	HrY2Y2B3HGyLUOT6DWCCZ6GUS6ED3Rhr6NU9AY4gJYOaFnoV3Txjz+LyIfb/redl+avZmDA5hHrfN
	mWwyxNCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxjNH-0000000GyRJ-2QFq;
	Wed, 04 Mar 2026 10:22:39 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxjNF-0000000GyQj-2jbG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Mar 2026 10:22:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=BA8aS99WMPj3OT7Rzlgq2AHc4SAU+sTCqlYuVCyMfo8=; b=kOgdy9zKS7ihSGRjp59Nt8RoLF
	uF0g4eU7mh2xPHiFcGyKv32ay4uutrFZtOU7P/5VaIexrx1Eb+qvgkaJRMN6NkByDljKoAd+QVRla
	0Z9nhpnOcqN3CM2gWt7vqT0PCVDp3zeN6EVBCRZmt4ZaJy5oqtzw8OlIHglrkIz/CHjxnw0naSaLi
	heyGvDyenDuEm4tXcgnMVsgwsHVEPir05zwHibc08rBEpyFV9qZ0tPnmlZ6dBDx2wJ3J2ky7t8bNx
	xkpZEzpFSLT1bHhJ4kTgK3PBIO0q+bloAihRVqLJuTIY8Twb4dMfV8+7QgspykApIn6NSpCcQqcg4
	wGQn9XZA==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:33518 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vxjNA-000000006Kv-1X5x;
	Wed, 04 Mar 2026 10:22:32 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vxjN9-0000000Br0t-2aUO;
	Wed, 04 Mar 2026 10:22:31 +0000
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
Subject: [PATCH net-next 1/8] net: stmmac: mdio: convert MDC clock divisor
 selection to tables
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1vxjN9-0000000Br0t-2aUO@rmk-PC.armlinux.org.uk>
Date: Wed, 04 Mar 2026 10:22:31 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_022237_694142_EA6E0651 
X-CRM114-Status: GOOD (  17.94  )
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

Convert the MDC clock divisor selection to tabular format.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../net/ethernet/stmicro/stmmac/stmmac_mdio.c | 98 ++++++++++++-------
 1 file changed, 62 insertions(+), 36 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
index 485a0d790baa..c4123d2260bd 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
@@ -473,6 +473,52 @@ void stmmac_pcs_clean(struct net_device *ndev)
 	priv->hw->xpcs = NULL;
 }
 
+struct stmmac_clk_rate {
+	unsigned long rate;
+	u8 cr;
+};
+
+/* The standard clk_csr_i to GMII_Address CR field mapping. The rate provided
+ * in this table is the exclusive maximum frequency for the divisor. The
+ * comments for each entry give the divisor and the resulting range of MDC
+ * clock frequencies.
+ */
+static const struct stmmac_clk_rate stmmac_std_csr_to_mdc[] = {
+	{ CSR_F_35M, STMMAC_CSR_20_35M },
+	{ CSR_F_60M, STMMAC_CSR_35_60M },
+	{ CSR_F_100M, STMMAC_CSR_60_100M },
+	{ CSR_F_150M, STMMAC_CSR_100_150M },
+	{ CSR_F_250M, STMMAC_CSR_150_250M },
+	{ CSR_F_300M, STMMAC_CSR_250_300M },
+	{ CSR_F_500M, STMMAC_CSR_300_500M },
+	{ CSR_F_800M, STMMAC_CSR_500_800M },
+	{ },
+};
+
+/* The sun8i clk_csr_i to GMII_Address CR field mapping uses rate as the
+ * exclusive minimum frequency for the divisor. Note that the last entry
+ * is valid and also acts as the sentinel.
+ */
+static const struct stmmac_clk_rate stmmac_sun8i_csr_to_mdc[] = {
+	{ 160000000, 3 },
+	{ 80000000, 2 },
+	{ 40000000, 1 },
+	{ 0, 0 },
+};
+
+/* The xgmac clk_csr_i to GMII_Address CR field mapping similarly uses rate
+ * as the exclusive minimum frequency for the divisor, and again the last
+ * entry is valid and also the sentinel.
+ */
+static const struct stmmac_clk_rate stmmac_xgmac_csr_to_mdc[] = {
+	{ 400000000, 5 },
+	{ 350000000, 4 },
+	{ 300000000, 3 },
+	{ 250000000, 2 },
+	{ 150000000, 1 },
+	{ 0, 0 },
+};
+
 /**
  * stmmac_clk_csr_set - dynamically set the MDC clock
  * @priv: driver private structure
@@ -490,6 +536,7 @@ static u32 stmmac_clk_csr_set(struct stmmac_priv *priv)
 {
 	unsigned long clk_rate;
 	u32 value = ~0;
+	int i;
 
 	clk_rate = clk_get_rate(priv->plat->stmmac_clk);
 
@@ -500,47 +547,26 @@ static u32 stmmac_clk_csr_set(struct stmmac_priv *priv)
 	 * the frequency of clk_csr_i. So we do not change the default
 	 * divider.
 	 */
-	if (clk_rate < CSR_F_35M)
-		value = STMMAC_CSR_20_35M;
-	else if (clk_rate < CSR_F_60M)
-		value = STMMAC_CSR_35_60M;
-	else if (clk_rate < CSR_F_100M)
-		value = STMMAC_CSR_60_100M;
-	else if (clk_rate < CSR_F_150M)
-		value = STMMAC_CSR_100_150M;
-	else if (clk_rate < CSR_F_250M)
-		value = STMMAC_CSR_150_250M;
-	else if (clk_rate <= CSR_F_300M)
-		value = STMMAC_CSR_250_300M;
-	else if (clk_rate < CSR_F_500M)
-		value = STMMAC_CSR_300_500M;
-	else if (clk_rate < CSR_F_800M)
-		value = STMMAC_CSR_500_800M;
+	for (i = 0; stmmac_std_csr_to_mdc[i].rate; i++)
+		if (clk_rate < stmmac_std_csr_to_mdc[i].rate) {
+			value = stmmac_std_csr_to_mdc[i].cr;
+			break;
+		}
 
 	if (priv->plat->flags & STMMAC_FLAG_HAS_SUN8I) {
-		if (clk_rate > 160000000)
-			value = 0x03;
-		else if (clk_rate > 80000000)
-			value = 0x02;
-		else if (clk_rate > 40000000)
-			value = 0x01;
-		else
-			value = 0;
+		/* Note the different test - this is intentional. */
+		for (i = 0; stmmac_sun8i_csr_to_mdc[i].rate; i++)
+			if (clk_rate > stmmac_sun8i_csr_to_mdc[i].rate)
+				break;
+		value = stmmac_sun8i_csr_to_mdc[i].cr;
 	}
 
 	if (priv->plat->core_type == DWMAC_CORE_XGMAC) {
-		if (clk_rate > 400000000)
-			value = 0x5;
-		else if (clk_rate > 350000000)
-			value = 0x4;
-		else if (clk_rate > 300000000)
-			value = 0x3;
-		else if (clk_rate > 250000000)
-			value = 0x2;
-		else if (clk_rate > 150000000)
-			value = 0x1;
-		else
-			value = 0x0;
+		/* Note the different test - this is intentional. */
+		for (i = 0; stmmac_xgmac_csr_to_mdc[i].rate; i++)
+			if (clk_rate > stmmac_xgmac_csr_to_mdc[i].rate)
+				break;
+		value = stmmac_xgmac_csr_to_mdc[i].cr;
 	}
 
 	return value;
-- 
2.47.3


