Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94495D2502E
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 11 Jan 2026 13:15:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mhHZZmL/NcTBBpVOifiOT25mcW059BgaRnaZdAmQTz8=; b=y0dw6O07UM2ea/PMcoILIT30tU
	G+nRVxltivNVP1uPYB6QhfxJtlgqZXoTc+96+TwUAaZXnJVydQdA+v4Bx8/qBvIQPrCGfkB9UNFMA
	M2xQaAUyeuSTQ3lGO+Hpg3pL02x4KQvcwJYHUFVke6HwyF5OjBuHZ8yYl4yASQsu0ktot2j+GD0ka
	OIi/XPLQ7Xos54skmsfEJKBBJYcf0L8qkhb07DLD+MRibmRc7asCjA98NQfaFG54e6wFORgeKXIKW
	KATNpoZ+yd24KMcm1n2XFMdQK2jaWgvG0nsBHCJ1hcCQOkc6AJOsc6iIcg655LPk7BR+rB1Dvi1CT
	onUableQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vevIB-00000004F3P-1LOj;
	Sun, 11 Jan 2026 13:15:39 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vevI9-00000004F1f-1ybm
	for linux-arm-kernel@lists.infradead.org;
	Sun, 11 Jan 2026 13:15:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=mhHZZmL/NcTBBpVOifiOT25mcW059BgaRnaZdAmQTz8=; b=EV/49LMBt6VNFsFdpMQS8rgGvP
	3EZCbcdowNm30Qx4X/rGGaAzNvX24gj4Od6dqcYBsDuKu2d435qDJ0QGIr4oXPWT4Uk3r77U+vjXG
	WepGdjMn/fAFgatj+IpYBgY+4+nO+sfnj1ke3ch/DKGd85eQj+GBGRFlb3S8fH3qu6jSKyl718e34
	MOcWu5wspOxCURrtrMyCpyLHG2gc523QyC44AHjsa4c4uSkRL9NPh8dye1ucb0v/XDrbgO++IQM7g
	sLe1qQk+0bLUsK4wYi350fW5mRCt34gF+qRd9UsLAoD/EqiaxyGiVQDteML20UiPGAdtcQ08U1lRH
	OEbkPkNQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:48912 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vevI3-000000005Uz-0nSI;
	Sun, 11 Jan 2026 13:15:31 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vevI1-00000002Yp8-3cM3;
	Sun, 11 Jan 2026 13:15:29 +0000
In-Reply-To: <aWOiOfDQkMXDwtPp@shell.armlinux.org.uk>
References: <aWOiOfDQkMXDwtPp@shell.armlinux.org.uk>
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
Subject: [PATCH net-next 5/5] net: stmmac: report PCS link changes to phylink
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1vevI1-00000002Yp8-3cM3@rmk-PC.armlinux.org.uk>
Date: Sun, 11 Jan 2026 13:15:29 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260111_051537_519437_036BABAD 
X-CRM114-Status: UNSURE (   9.50  )
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

Report PCS link changes to phylink, which will allow phylink's inband
support to respoind to link events once the PCS is appropriately
configured.

An expected behavioural change is that should the PCS report that its
link has failed, but phylink is operating in outband mode and the PHY
reports that link is up, this event will cause the netdev's link to
momentarily drop, making the event more noticable, rather than just
producing a "stmmac_pcs: Link Down" message.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c
index 28748e7ef7dd..2f826fe7229b 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c
@@ -62,6 +62,8 @@ void stmmac_integrated_pcs_irq(struct stmmac_priv *priv, u32 status,
 		x->irq_pcs_link_n++;
 		dev_info(priv->device, "PCS Link %s\n",
 			 val & GMAC_AN_STATUS_LS ? "Up" : "Down");
+
+		phylink_pcs_change(&spcs->pcs, val & GMAC_AN_STATUS_LS);
 	}
 }
 
-- 
2.47.3


