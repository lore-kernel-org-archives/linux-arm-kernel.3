Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66234C021B3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Feb 2025 14:39:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YmtTGwJJXhwMoenv9f1jJWRnRB0B2anyfjKqb6F0t6g=; b=ham77h3h0ZDBjFwznolRDlgYO7
	WqLoHCF+G1JQ5eXG7AIn/np8oCIYDlPBGQq1n0TS/xH8KiFVHZaM3MKj3ypeMHrXy64j+TodzFusT
	sRJODVtCQRxuMUXidxML8M9Oz/KRf6uySMPuKhvYl9uXApKFHP/3SkjHlsg3DbmSUWvFjYs1fehcH
	M+ZR8Jg/EqqflqyMgG+yGIIdHelbtaWS/SIvLhjhqYpaQvUgd/lzBPHIhmh6L+FNbWdL9ET3o58KG
	IqOixUbnAawOccUfMbtzhgyuJ2GvrUouZU81UxyOZ4LqUH3jkcuLQqbj3iQ19rdaM+G/s4NIUbZOG
	XPLdGtvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlUBi-00000005r4p-1YeU;
	Fri, 21 Feb 2025 14:39:34 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlTqc-00000005n8S-0JRG;
	Fri, 21 Feb 2025 14:17:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=YmtTGwJJXhwMoenv9f1jJWRnRB0B2anyfjKqb6F0t6g=; b=i7UoQF2blTPs6VW1UGIaXkZX+k
	IJh5rrOMM3jtyTYE0yyIPfqvAgr5J7kr8tlhOag8TsD7uog8dTn/hrI9Zonguyry25QPpZ6Macig8
	Hnfw5IrCLzLsHbISCogcINMGXG0py/E+l9QG6MhzVO2xlW5UhzyKnu3PEP0H0JRM4QI1524TREqMO
	tV9vQsuHBH7ZBNmMBz9SoBHIM1/vgqeF6ghyFxiJBucJK2OlbNDI03ABq7My+5Y2QHYmErA/5CQsd
	UBZEl6/LX14f1p5R6sq5zrh3OTMqFZRvRu8MJh3bAJVUpaeM9S93akICrUQNRteaalKd0QlFOXt0x
	Gp6cO1Pw==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:50498 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1tlToX-0004o0-1B;
	Fri, 21 Feb 2025 14:15:37 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1tlToD-004W3g-HB; Fri, 21 Feb 2025 14:15:17 +0000
In-Reply-To: <Z7iKdaCp4hLWWgJ2@shell.armlinux.org.uk>
References: <Z7iKdaCp4hLWWgJ2@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Drew Fustini <drew@pdp7.com>,
	Eric Dumazet <edumazet@google.com>,
	Fu Wei <wefu@redhat.com>,
	Guo Ren <guoren@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH net-next 2/2] net: stmmac: thead: ensure divisor gives proper
 rate
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1tlToD-004W3g-HB@rmk-PC.armlinux.org.uk>
Date: Fri, 21 Feb 2025 14:15:17 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250221_061746_107008_BC5408AC 
X-CRM114-Status: UNSURE (   9.80  )
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

thead was checking that the stmmac_clk rate was a multiple of the
RGMII rates for 1G and 100M, but didn't check for 10M. Rather than
use this with hard-coded speeds, check that the calculated divisor
gives the required rate by multplying the transmit clock rate back
up to the stmmac clock rate and checking that it agrees.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-thead.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-thead.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-thead.c
index f16fa341aadb..f9f2bd65959f 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-thead.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-thead.c
@@ -45,9 +45,6 @@
 #define  TXCLK_DIR_OUTPUT		FIELD_PREP(TXCLK_DIR_MASK, 0)
 #define  TXCLK_DIR_INPUT		FIELD_PREP(TXCLK_DIR_MASK, 1)
 
-#define GMAC_GMII_RGMII_RATE	125000000
-#define GMAC_MII_RATE		25000000
-
 struct thead_dwmac {
 	struct plat_stmmacenet_data *plat;
 	void __iomem *apb_base;
@@ -124,11 +121,6 @@ static void thead_dwmac_fix_speed(void *priv, int speed, unsigned int mode)
 	case PHY_INTERFACE_MODE_RGMII_RXID:
 	case PHY_INTERFACE_MODE_RGMII_TXID:
 		rate = clk_get_rate(plat->stmmac_clk);
-		if (!rate || rate % GMAC_GMII_RGMII_RATE != 0 ||
-		    rate % GMAC_MII_RATE != 0) {
-			dev_err(dwmac->dev, "invalid gmac rate %ld\n", rate);
-			return;
-		}
 
 		writel(0, dwmac->apb_base + GMAC_PLLCLK_DIV);
 
@@ -139,6 +131,10 @@ static void thead_dwmac_fix_speed(void *priv, int speed, unsigned int mode)
 		}
 
 		div = rate / tx_rate;
+		if (rate != tx_rate * div) {
+			dev_err(dwmac->dev, "invalid gmac rate %lu\n", rate);
+			return;
+		}
 
 		reg = FIELD_PREP(GMAC_PLLCLK_DIV_EN, 1) |
 		      FIELD_PREP(GMAC_PLLCLK_DIV_NUM, div);
-- 
2.30.2


