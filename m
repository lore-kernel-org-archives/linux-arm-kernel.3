Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06771D61037
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Jan 2026 11:10:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C3OuEF25Keq79i8iVFT8CdTNsLkq8BlZmrX/o6VdmNM=; b=TRkMuzU4+jP1nKuHYlS8e+wJ1H
	r+1/vQTYB+iRn52U1CWcNVhdzXDZrOgMYuwUc/fi01zby7nAEiEK3FPX4mA6RGQ5J0nAHkdo9D0wq
	GRbMbhYJEzjT6pMFl4pMxsfgAFyiRkqSaaHFn1trANWnsjcdjfvhVsaLk4bJoi/FEwGNOqxWeCFFV
	ph0lpyCXi4/cdNQyghJlP66Ip0nAJPzIwDF5Uw9hr7gJrdkeEFFSNcgIkvKt7V9iTr7mN16FvQvXz
	2N8uaYbEzf4OhymRMQBS5w/lBmdmg2J7Plj53PcIznby6zf4P/6jvsENlKCZAPf+D7Lqdf+vioIEr
	tnwA161A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlmOX-00000001P98-1IMt;
	Fri, 30 Jan 2026 11:10:33 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlmOV-00000001P8c-0d2y
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Jan 2026 11:10:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=C3OuEF25Keq79i8iVFT8CdTNsLkq8BlZmrX/o6VdmNM=; b=hA0eoi/d+YovpQhF4LoYL2riaU
	7KP9aVTOiZ7WkH0EJI3zQ5kFjx5MTC4Zu2160q2gdn7P1E1xYXf+NXg9ZkyEHw8YrHV+yfCq64JUF
	TTvKWCOiNiuFh8ZgMFFRJhcr9c4VRLP4nsNi1KBGPhRz9tNvEaSHpZ9+f25gRuAKex5yttRyzs20g
	JzaeK0oByMlt4V6h8QceA0shP7tEtJvSZ5SMN+qrhH0XS5bxckJ+9nOiN/Fx6YJZ0s19WVxG1efaN
	IjQdI9QnUVza26YvI4BDjxAT9EqazS5LrtTCbYOBIdvZUnipDqmwAVn+q9qVWFZOyhbVg8/Ve+YEw
	otddi6gQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:60546 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vlmOQ-0000000012t-44Tg;
	Fri, 30 Jan 2026 11:10:27 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vlmOQ-00000006zuz-0ffN;
	Fri, 30 Jan 2026 11:10:26 +0000
In-Reply-To: <aXyRlFw7ZuhRPiKo@shell.armlinux.org.uk>
References: <aXyRlFw7ZuhRPiKo@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH net-next 1/3] net: stmmac: clear half-duplex caps where
 unsupported
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1vlmOQ-00000006zuz-0ffN@rmk-PC.armlinux.org.uk>
Date: Fri, 30 Jan 2026 11:10:26 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260130_031031_192610_FC951E98 
X-CRM114-Status: GOOD (  13.34  )
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

Where a core supports hardware features, but does not indicate support
for half-duplex, clear phylink's half-duplex 1G, 100M and 10M
capability bits to disallow half-duplex operation and advertisement of
these link modes.

This will avoid the need for special code in the PCS driver to do this
based on the ESTATUS register bits, as the support in the PCS is
dependent on the same synthesis choice as the MAC core.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c | 2 --
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c   | 3 +++
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
index ca81bb1cae39..49893b9fb88c 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
@@ -46,8 +46,6 @@ static void dwxgmac2_update_caps(struct stmmac_priv *priv)
 {
 	if (!priv->dma_cap.mbps_10_100)
 		priv->hw->link.caps &= ~(MAC_10 | MAC_100);
-	else if (!priv->dma_cap.half_duplex)
-		priv->hw->link.caps &= ~(MAC_10HD | MAC_100HD);
 }
 
 static void dwxgmac2_set_mac(void __iomem *ioaddr, bool enable)
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 788b884f9c89..a3c155cccd9b 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -906,6 +906,9 @@ static unsigned long stmmac_mac_get_caps(struct phylink_config *config,
 	/* Refresh the MAC-specific capabilities */
 	stmmac_mac_update_caps(priv);
 
+	if (priv->hw_cap_support && !priv->dma_cap.half_duplex)
+		priv->hw->link.caps &= ~(MAC_1000HD | MAC_100HD | MAC_10HD);
+
 	config->mac_capabilities = priv->hw->link.caps;
 
 	if (priv->plat->max_speed)
-- 
2.47.3


