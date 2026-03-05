Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E144F30934
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 10:42:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bckk18FEL/WKB1zH3bibgFcRIdBT/iIOu/cwDyzcVjY=; b=Px+C0rUYmzWAnsTz8JrTXoPfzz
	Tic7aIyWcLsmy1gAm+14/XqJOzBYCTYor5TIDEAAu9zbKtwm5/ztGaca4jtB9LOvBzvsAiQUQWf3H
	5v5wutwKG0k2cqEDs8OZFKRRuszdVGxnmFww6my74z1yrLi6KPWVqiI7Xls5Z/w29Io2/CdY35GM/
	qFmSDIAqrpMVz+Pse3AIE9Zm3yQqJUXu1s+fDHn3T10sR5CQZvDa1v0DAT0sJAdn7+6wXTCq69HrE
	V4UHTzHH6VklMU6sEgx1rtx7oY+v+Kr3du+MN1jnogn1QoibgqGc94uhMQJS4f83OwI8mxPVG3E+v
	Z+2+8Mjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy6AD-00000001bMc-3W7r;
	Thu, 05 Mar 2026 10:42:41 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy6AB-00000001bL1-37oj
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 10:42:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=bckk18FEL/WKB1zH3bibgFcRIdBT/iIOu/cwDyzcVjY=; b=iTtKyiVMO8W1OSo+yK6hNRTFug
	2qZM8FDfj1nmDoRu/xzHeQK0UGj/yaqAXxqaH8NErn+D3fSLKqrqEAFGMU8sgXp3Ls8IJ05mP8ss/
	nP7aSWvG1HP22pEez6OlkZE76E71cB6HH5xcjjzwlgVKtniZqNIvPz+40hhZ0mgCOxDuCazjv0yTF
	wi86LHNMqk4Bpqq5/1UKTioUBhKiFWiB04TQddFhtBCOiCLS70QTCuq6PcEb0Gtpzxm4MMj1X6Xin
	jaQjrVP64VVkpw16/hRTQxvkN4gHL1shmaWYU8Mzsot3sdokpkjH4OovhSpW2PWCo5/xt5brTi0W/
	Ag8/faNA==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:46568 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vy6A4-000000007mw-3k7y;
	Thu, 05 Mar 2026 10:42:32 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vy6A4-0000000Btwj-0ATB;
	Thu, 05 Mar 2026 10:42:32 +0000
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
Subject: [PATCH net-next v2 2/8] net: stmmac: mdio: use same test for MDC
 clock divisor lookups
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1vy6A4-0000000Btwj-0ATB@rmk-PC.armlinux.org.uk>
Date: Thu, 05 Mar 2026 10:42:32 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_024239_781342_B707DA01 
X-CRM114-Status: GOOD (  16.03  )
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

Use the same frequency test for all clk_csr value lookups (clock
rate > table rate). This has the side effect that the standard rate
table results in the divider being used for the maximum frequency
for the divider rather than the next higher divider. This still
allows MDC to meet the IEE 802.3 specification, but at a rate closer
to 2.5MHz for these frequencies.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/common.h  |  1 +
 .../net/ethernet/stmicro/stmmac/stmmac_mdio.c | 27 +++++++++----------
 2 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/common.h b/drivers/net/ethernet/stmicro/stmmac/common.h
index 42a48f655849..e4ce1167ebab 100644
--- a/drivers/net/ethernet/stmicro/stmmac/common.h
+++ b/drivers/net/ethernet/stmicro/stmmac/common.h
@@ -257,6 +257,7 @@ struct stmmac_safety_stats {
 	(sizeof(struct stmmac_safety_stats) / sizeof(unsigned long))
 
 /* CSR Frequency Access Defines*/
+#define CSR_F_20M	20000000
 #define CSR_F_35M	35000000
 #define CSR_F_60M	60000000
 #define CSR_F_100M	100000000
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
index c4123d2260bd..6292911fb54b 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
@@ -484,15 +484,16 @@ struct stmmac_clk_rate {
  * clock frequencies.
  */
 static const struct stmmac_clk_rate stmmac_std_csr_to_mdc[] = {
-	{ CSR_F_35M, STMMAC_CSR_20_35M },
-	{ CSR_F_60M, STMMAC_CSR_35_60M },
-	{ CSR_F_100M, STMMAC_CSR_60_100M },
-	{ CSR_F_150M, STMMAC_CSR_100_150M },
-	{ CSR_F_250M, STMMAC_CSR_150_250M },
-	{ CSR_F_300M, STMMAC_CSR_250_300M },
-	{ CSR_F_500M, STMMAC_CSR_300_500M },
-	{ CSR_F_800M, STMMAC_CSR_500_800M },
-	{ },
+	{ CSR_F_800M, ~0 },
+	{ CSR_F_500M, STMMAC_CSR_500_800M },
+	{ CSR_F_300M, STMMAC_CSR_300_500M },
+	{ CSR_F_250M, STMMAC_CSR_250_300M },
+	{ CSR_F_150M, STMMAC_CSR_150_250M },
+	{ CSR_F_100M, STMMAC_CSR_100_150M },
+	{ CSR_F_60M,  STMMAC_CSR_60_100M },
+	{ CSR_F_35M,  STMMAC_CSR_35_60M },
+	{ CSR_F_20M,  STMMAC_CSR_20_35M },
+	{ 0, ~0 },
 };
 
 /* The sun8i clk_csr_i to GMII_Address CR field mapping uses rate as the
@@ -548,13 +549,12 @@ static u32 stmmac_clk_csr_set(struct stmmac_priv *priv)
 	 * divider.
 	 */
 	for (i = 0; stmmac_std_csr_to_mdc[i].rate; i++)
-		if (clk_rate < stmmac_std_csr_to_mdc[i].rate) {
-			value = stmmac_std_csr_to_mdc[i].cr;
+		if (clk_rate > stmmac_std_csr_to_mdc[i].rate)
 			break;
-		}
+	if (stmmac_std_csr_to_mdc[i].cr != (u8)~0)
+		value = stmmac_std_csr_to_mdc[i].cr;
 
 	if (priv->plat->flags & STMMAC_FLAG_HAS_SUN8I) {
-		/* Note the different test - this is intentional. */
 		for (i = 0; stmmac_sun8i_csr_to_mdc[i].rate; i++)
 			if (clk_rate > stmmac_sun8i_csr_to_mdc[i].rate)
 				break;
@@ -562,7 +562,6 @@ static u32 stmmac_clk_csr_set(struct stmmac_priv *priv)
 	}
 
 	if (priv->plat->core_type == DWMAC_CORE_XGMAC) {
-		/* Note the different test - this is intentional. */
 		for (i = 0; stmmac_xgmac_csr_to_mdc[i].rate; i++)
 			if (clk_rate > stmmac_xgmac_csr_to_mdc[i].rate)
 				break;
-- 
2.47.3


