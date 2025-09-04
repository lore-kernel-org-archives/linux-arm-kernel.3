Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0818FCA1002
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Sep 2025 16:24:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dR3WUhoFWhd1z7sdM3kjhT3dBvcJlZs6M5V3z6Dz+vM=; b=mbc7QfSSaoH5CUk2GVX+kVeO3C
	A35n+NIfPDh9ULy/siO+T4v6J6W7tQEO9jJNvyR7GOR/rpUpYZ29cB6KVnb0tVgAhwgi9jmEb5nMh
	Fo5a6Y+O+2msxk4sQAetTkASHKtMovvg3sEls1468BNcy+cMJANqccgy2E1H4lx4CQmwY9k0X40Bj
	fq/V5+AqNsmTLho6h+R7c/rFr7M3MXpwJoiHSBc8qztVrFeGDkA5LEp18TJb2AjmQUGzfbLmMqVYM
	MXxwQ43vUZs4L7Uy0CRfBTIYKiX0jMFC/sKkvJnJ45XErmh4X8yKe+RiPqJcxirdRq+0sti0CNAU5
	YcxsZniA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuClJ-0000000CqZQ-1Q1L;
	Thu, 04 Sep 2025 16:24:37 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu8oc-0000000BTO8-2mL7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Sep 2025 12:11:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=dR3WUhoFWhd1z7sdM3kjhT3dBvcJlZs6M5V3z6Dz+vM=; b=EQuNG/nVIilAa0KiwZ4MmjfLWU
	kOfp+BFym/TO7qW6KrCssHzwH1vcYKKis2dl/vL4lklWvY3+lsVrJZDB9nw3ucHe/p8NI+VBqWNw3
	3QUxTKJZaJGZKpec0v1EM8CDmytOSnEUuSupiPuwK/SM2QLnCb655P+p46wmyuQsW2v1uJguyEerS
	3s9G9SzM6MP9a55QUmpxhNIZqa6P/M7rOZQ6HxoFdoDpXcAwk2iSfL2CDynN1JOC+NmjclbgXPv0H
	yMBoa5U6RNI+0tuovUyvk8RRNbSGFtnXzt+86yjnXz/CKzRujfVJgHpM6U/egi4BgL/aXY3gB8ixP
	/9VtJHRg==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:35662 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1uu8oX-000000001zA-3X30;
	Thu, 04 Sep 2025 13:11:41 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1uu8oW-00000001vpH-46zf;
	Thu, 04 Sep 2025 13:11:41 +0100
In-Reply-To: <aLmBwsMdW__XBv7g@shell.armlinux.org.uk>
References: <aLmBwsMdW__XBv7g@shell.armlinux.org.uk>
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
Subject: [PATCH net-next v2 09/11] net: stmmac: mdio: return clk_csr value
 from stmmac_clk_csr_set()
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1uu8oW-00000001vpH-46zf@rmk-PC.armlinux.org.uk>
Date: Thu, 04 Sep 2025 13:11:40 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_051146_701603_81B5F64F 
X-CRM114-Status: GOOD (  17.93  )
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

Return the clk_csr value from stmmac_clk_csr_set() rather than
using priv->clk_csr, as this struct member now serves very little
purpose. This allows us to remove priv->clk_csr.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac.h  |  1 -
 .../net/ethernet/stmicro/stmmac/stmmac_mdio.c | 68 +++++++++----------
 2 files changed, 34 insertions(+), 35 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac.h b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
index 4d5577935b13..ec6bccb13710 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac.h
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
@@ -289,7 +289,6 @@ struct stmmac_priv {
 	u32 msg_enable;
 	int wolopts;
 	int wol_irq;
-	int clk_csr;
 	u32 gmii_address_bus_config;
 	struct timer_list eee_ctrl_timer;
 	int lpi_irq;
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
index 0b5282bf6d1e..e5ca206ee46f 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
@@ -478,6 +478,7 @@ void stmmac_pcs_clean(struct net_device *ndev)
  * @priv: driver private structure
  * Description: this is to dynamically set the MDC clock according to the csr
  * clock input.
+ * Return: MII register CR field value
  * Note:
  *	If a specific clk_csr value is passed from the platform
  *	this means that the CSR Clock Range selection cannot be
@@ -485,9 +486,10 @@ void stmmac_pcs_clean(struct net_device *ndev)
  *	documentation). Viceversa the driver will try to set the MDC
  *	clock dynamically according to the actual clock input.
  */
-static void stmmac_clk_csr_set(struct stmmac_priv *priv)
+static u32 stmmac_clk_csr_set(struct stmmac_priv *priv)
 {
 	unsigned long clk_rate;
+	u32 value = ~0;
 
 	clk_rate = clk_get_rate(priv->plat->stmmac_clk);
 
@@ -498,50 +500,50 @@ static void stmmac_clk_csr_set(struct stmmac_priv *priv)
 	 * the frequency of clk_csr_i. So we do not change the default
 	 * divider.
 	 */
-	if (!(priv->clk_csr & MAC_CSR_H_FRQ_MASK)) {
-		if (clk_rate < CSR_F_35M)
-			priv->clk_csr = STMMAC_CSR_20_35M;
-		else if ((clk_rate >= CSR_F_35M) && (clk_rate < CSR_F_60M))
-			priv->clk_csr = STMMAC_CSR_35_60M;
-		else if ((clk_rate >= CSR_F_60M) && (clk_rate < CSR_F_100M))
-			priv->clk_csr = STMMAC_CSR_60_100M;
-		else if ((clk_rate >= CSR_F_100M) && (clk_rate < CSR_F_150M))
-			priv->clk_csr = STMMAC_CSR_100_150M;
-		else if ((clk_rate >= CSR_F_150M) && (clk_rate < CSR_F_250M))
-			priv->clk_csr = STMMAC_CSR_150_250M;
-		else if ((clk_rate >= CSR_F_250M) && (clk_rate <= CSR_F_300M))
-			priv->clk_csr = STMMAC_CSR_250_300M;
-		else if ((clk_rate >= CSR_F_300M) && (clk_rate < CSR_F_500M))
-			priv->clk_csr = STMMAC_CSR_300_500M;
-		else if ((clk_rate >= CSR_F_500M) && (clk_rate < CSR_F_800M))
-			priv->clk_csr = STMMAC_CSR_500_800M;
-	}
+	if (clk_rate < CSR_F_35M)
+		value = STMMAC_CSR_20_35M;
+	else if ((clk_rate >= CSR_F_35M) && (clk_rate < CSR_F_60M))
+		value = STMMAC_CSR_35_60M;
+	else if ((clk_rate >= CSR_F_60M) && (clk_rate < CSR_F_100M))
+		value = STMMAC_CSR_60_100M;
+	else if ((clk_rate >= CSR_F_100M) && (clk_rate < CSR_F_150M))
+		value = STMMAC_CSR_100_150M;
+	else if ((clk_rate >= CSR_F_150M) && (clk_rate < CSR_F_250M))
+		value = STMMAC_CSR_150_250M;
+	else if ((clk_rate >= CSR_F_250M) && (clk_rate <= CSR_F_300M))
+		value = STMMAC_CSR_250_300M;
+	else if ((clk_rate >= CSR_F_300M) && (clk_rate < CSR_F_500M))
+		value = STMMAC_CSR_300_500M;
+	else if ((clk_rate >= CSR_F_500M) && (clk_rate < CSR_F_800M))
+		value = STMMAC_CSR_500_800M;
 
 	if (priv->plat->flags & STMMAC_FLAG_HAS_SUN8I) {
 		if (clk_rate > 160000000)
-			priv->clk_csr = 0x03;
+			value = 0x03;
 		else if (clk_rate > 80000000)
-			priv->clk_csr = 0x02;
+			value = 0x02;
 		else if (clk_rate > 40000000)
-			priv->clk_csr = 0x01;
+			value = 0x01;
 		else
-			priv->clk_csr = 0;
+			value = 0;
 	}
 
 	if (priv->plat->has_xgmac) {
 		if (clk_rate > 400000000)
-			priv->clk_csr = 0x5;
+			value = 0x5;
 		else if (clk_rate > 350000000)
-			priv->clk_csr = 0x4;
+			value = 0x4;
 		else if (clk_rate > 300000000)
-			priv->clk_csr = 0x3;
+			value = 0x3;
 		else if (clk_rate > 250000000)
-			priv->clk_csr = 0x2;
+			value = 0x2;
 		else if (clk_rate > 150000000)
-			priv->clk_csr = 0x1;
+			value = 0x1;
 		else
-			priv->clk_csr = 0x0;
+			value = 0x0;
 	}
+
+	return value;
 }
 
 static void stmmac_mdio_bus_config(struct stmmac_priv *priv)
@@ -552,12 +554,10 @@ static void stmmac_mdio_bus_config(struct stmmac_priv *priv)
 	 * that the CSR Clock Range value should not be computed from the CSR
 	 * clock.
 	 */
-	if (priv->plat->clk_csr >= 0) {
+	if (priv->plat->clk_csr >= 0)
 		value = priv->plat->clk_csr;
-	} else {
-		stmmac_clk_csr_set(priv);
-		value = priv->clk_csr;
-	}
+	else
+		value = stmmac_clk_csr_set(priv);
 
 	value <<= priv->hw->mii.clk_csr_shift;
 
-- 
2.47.2


