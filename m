Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFE79D1D485
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 17:36:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4swCpEsMETErqjmraoTIImTXFzbpne/fke6a4dj7clA=; b=d6eNOaq48wk0ZwUS2OTHSy3mSR
	ml2CWkhCg6nxzLIJRsoTIEuXnuK1uQySNevEASPt2b+2I8DRL5T+A4vm3MqfFznJrAWPY5vFrIzDJ
	UVRKlLDqNFTIDerwCWu5Xqbjsfn45+7oVrXasL/5ok9s6kWeEmIqilDBTHmAwPeZ93O70HZ+FpRRC
	FVq2gtuXgLliqZeCpoAXDa34NDGpm33Qj2sDcSwCGch2G+trMkIZMhUETNsQnJPsiqSwAvatWHrmY
	RQnAMtHq/llsCrhFkk1vE8LpK2KL4optUsy6qDU8HLg1l5pw+TMPGxTwN7BKnF4omZAEEBt/ggao9
	gMJpY83A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdtvs-00000000Rro-3HVp;
	Thu, 08 Jan 2026 17:36:24 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdtvn-00000000RpI-2YRd
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Jan 2026 17:36:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=4swCpEsMETErqjmraoTIImTXFzbpne/fke6a4dj7clA=; b=PBsmcABZFG07ucaIH8wRqo3Mym
	lUKZKndyPlFRWRUJY/fTvkBZVZTLEfEJyksEcSsJkr6Ydr7EBDW0boSwZ9ybdOvGGxQZmxYzcxUiX
	KXpFV13GrEsU9sJFJgEpEyQFI3ToUWLAWZCVSZWkY2SGx9I20GmKeAXukfa3bwbaubrhriEvnX2/D
	TfntcshXEsIUYwaze3IZxm4gOuhaEFYI1IzEoEKZKr6RnjUHVpUFGcCLylwJhtK/h7iwNczhA8Dch
	iqHmixGEwJEXAdHAC7lzJCIYECoW0PrScv4fpRs9dELTKNs/y9tgp8e8ncn2UJ4QiD2TafZ22mz1a
	d8p1TZng==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:52368 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vdtvj-000000002yq-0wCF;
	Thu, 08 Jan 2026 17:36:15 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vdtvi-00000002GtP-1Os1;
	Thu, 08 Jan 2026 17:36:14 +0000
In-Reply-To: <aV_q2Kneinrk3Z-W@shell.armlinux.org.uk>
References: <aV_q2Kneinrk3Z-W@shell.armlinux.org.uk>
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
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH net-next v2 2/9] net: stmmac: dwmac4: fix RX FIFO fill
 statistics
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1vdtvi-00000002GtP-1Os1@rmk-PC.armlinux.org.uk>
Date: Thu, 08 Jan 2026 17:36:14 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_093621_269500_3BB4333D 
X-CRM114-Status: GOOD (  12.99  )
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

In dwmac4_debug(), the wrong shift is used with the RXFSTS mask:

 #define MTL_DEBUG_RXFSTS_MASK          GENMASK(5, 4)
 #define MTL_DEBUG_RXFSTS_SHIFT         4
 #define MTL_DEBUG_RRCSTS_SHIFT         1

                       u32 rxfsts = (value & MTL_DEBUG_RXFSTS_MASK)
                                    >> MTL_DEBUG_RRCSTS_SHIFT;

where rxfsts is tested against small integers 1 .. 3. This results in
the tests always failing, causing the "mtl_rx_fifo__fill_level_empty"
statistic counter to always be incremented no matter what the fill
level actually is.

Fix this by using FIELD_GET() and remove the unnecessary
MTL_DEBUG_RXFSTS_SHIFT definition as FIELD_GET() will shift according
to the least siginificant set bit in the supplied field mask.

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac4.h      | 1 -
 drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c | 3 +--
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4.h b/drivers/net/ethernet/stmicro/stmmac/dwmac4.h
index fa27639895ce..3da6891b9df7 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac4.h
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4.h
@@ -460,7 +460,6 @@ static inline u32 mtl_low_credx_base_addr(const struct dwmac4_addrs *addrs,
 
 /* MAC debug: GMII or MII Transmit Protocol Engine Status */
 #define MTL_DEBUG_RXFSTS_MASK		GENMASK(5, 4)
-#define MTL_DEBUG_RXFSTS_SHIFT		4
 #define MTL_DEBUG_RXFSTS_EMPTY		0
 #define MTL_DEBUG_RXFSTS_BT		1
 #define MTL_DEBUG_RXFSTS_AT		2
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c b/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
index a4282fd7c3c7..bd5f48d0b9fc 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
@@ -700,8 +700,7 @@ static void dwmac4_debug(struct stmmac_priv *priv, void __iomem *ioaddr,
 		value = readl(ioaddr + MTL_CHAN_RX_DEBUG(dwmac4_addrs, queue));
 
 		if (value & MTL_DEBUG_RXFSTS_MASK) {
-			u32 rxfsts = (value & MTL_DEBUG_RXFSTS_MASK)
-				     >> MTL_DEBUG_RRCSTS_SHIFT;
+			u32 rxfsts = FIELD_GET(MTL_DEBUG_RXFSTS_MASK, value);
 
 			if (rxfsts == MTL_DEBUG_RXFSTS_FULL)
 				x->mtl_rx_fifo_fill_level_full++;
-- 
2.47.3


