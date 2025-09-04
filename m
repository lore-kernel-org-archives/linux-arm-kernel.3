Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4007DCA1015
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Sep 2025 16:24:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iCaCMsSJc416KNNOsR6umJzwEx2Z6ECrOMgYqcR6Xzg=; b=e/u96xoKRx0ikGASqoXZFb8vQa
	9mbcn5zNiSoXBXNf1LiSsSwwaneyi7AuBFMe3yrQ2cALkTrLxxbH5kxH6e2M2Pomma2pAQbXMXBpg
	XL62lut0Edwhts81DfXwCObd2gn9kCdOVEqRuOwxHzkQXPD+B2wgwp9SbgMCG+h9sbM+/pi6D7agA
	pq4U2+ER3qNpdbKvUUC84JeM1vc0vXiKNhUAXHHolFaoOmwStH3SK7ScHUab2bJc6cEAnwgEHnaD3
	SnJ6OETUVTUHOUpZcKy7m8VaVaDLNMl1qnUDVdGjdY4pKaNhSEFrDaGKeQYgek5FiEQTtezxtEu+c
	i15u73rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuClK-0000000CqaJ-0BcJ;
	Thu, 04 Sep 2025 16:24:38 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu8oi-0000000BTRT-3WEb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Sep 2025 12:11:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=iCaCMsSJc416KNNOsR6umJzwEx2Z6ECrOMgYqcR6Xzg=; b=PZdtOp7mwRZsx8WGWLvbliHNE+
	am6UMi13hymA7YzerDEsV4Vt00ZNO7CvNJrKgbwRvBDtSnbXE5pCyDl0yYpO9Cd5hPX8YzpBzlGg5
	GqTNlDUQ9lfZAeYvbjulpTA6z97MSE5BxRZ2xaXX1Pt1NuVi7ig7EVnJwoCO0lkrVNhoPpf3sttqC
	2zPdTyFM4n4laxdYI9aEx5gVh5VKrHq4FEcU2MgUG/0Yol7GdAK+kDsHmkKiINUMAGNKSLkX/vlYm
	4Iu9Lqng9kahEBITvnv9ogD4PeuBzuQXxWn7ITacUWOgwl4vOFwkZPS23e035hWcZ/8PXYca4qkAd
	yxgF8uPA==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:35666 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1uu8oc-000000001zQ-3wQ9;
	Thu, 04 Sep 2025 13:11:46 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1uu8oc-00000001vpN-0S1A;
	Thu, 04 Sep 2025 13:11:46 +0100
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
Subject: [PATCH net-next v2 10/11] net: stmmac: mdio: remove redundant clock
 rate tests
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1uu8oc-00000001vpN-0S1A@rmk-PC.armlinux.org.uk>
Date: Thu, 04 Sep 2025 13:11:46 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_051152_875353_F6B384AD 
X-CRM114-Status: UNSURE (   9.07  )
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

The pattern:

	... if (v < A)
		...
	else if (v >= A && v < B)
		...

can be simplified to:

	... if (v < A)
		...
	else if (v < B)
		...

which makes the string of ifelse more readable.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
index e5ca206ee46f..f408737f6fc7 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
@@ -502,19 +502,19 @@ static u32 stmmac_clk_csr_set(struct stmmac_priv *priv)
 	 */
 	if (clk_rate < CSR_F_35M)
 		value = STMMAC_CSR_20_35M;
-	else if ((clk_rate >= CSR_F_35M) && (clk_rate < CSR_F_60M))
+	else if (clk_rate < CSR_F_60M)
 		value = STMMAC_CSR_35_60M;
-	else if ((clk_rate >= CSR_F_60M) && (clk_rate < CSR_F_100M))
+	else if (clk_rate < CSR_F_100M)
 		value = STMMAC_CSR_60_100M;
-	else if ((clk_rate >= CSR_F_100M) && (clk_rate < CSR_F_150M))
+	else if (clk_rate < CSR_F_150M)
 		value = STMMAC_CSR_100_150M;
-	else if ((clk_rate >= CSR_F_150M) && (clk_rate < CSR_F_250M))
+	else if (clk_rate < CSR_F_250M)
 		value = STMMAC_CSR_150_250M;
-	else if ((clk_rate >= CSR_F_250M) && (clk_rate <= CSR_F_300M))
+	else if (clk_rate <= CSR_F_300M)
 		value = STMMAC_CSR_250_300M;
-	else if ((clk_rate >= CSR_F_300M) && (clk_rate < CSR_F_500M))
+	else if (clk_rate < CSR_F_500M)
 		value = STMMAC_CSR_300_500M;
-	else if ((clk_rate >= CSR_F_500M) && (clk_rate < CSR_F_800M))
+	else if (clk_rate < CSR_F_800M)
 		value = STMMAC_CSR_500_800M;
 
 	if (priv->plat->flags & STMMAC_FLAG_HAS_SUN8I) {
-- 
2.47.2


