Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF699C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Jul 2025 08:22:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Lxc5zi9+QDcZlypcmgVheb0h9CsCjzaPr30eGJxjJxk=; b=wR1nQ7BfE7cixJSufajMJh50b7
	vFe0T47KV70ESMrIYj+3Y4i0Qhss8eGEYykt0V0KGHmXW9uX73ZIYy8eglK6qCOyeLs6K280ylufl
	dGjFHpwUPx1NU/nCChksA7dmwS0GMgYSR5r0jDGtGriLlyJAYFs/i+5ZD3dhd1IpQCSYG3zbqCS95
	3JjezeuQa/ybNPDie8SAXEhF42z0dXIEDBJ2xexxnqfFuSavfGSdmqFLvtvsy9K3NwJ39o9FFkbFI
	RXMDYHv+v5pUFcTR9+Z/ZWwKn3qE7J5i1aDbPkET+CopgV1/CA3r7zZtxfrKqdEJySTsgyoh1JQI9
	/lvjDNOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubERu-00000001cnX-1xiW;
	Mon, 14 Jul 2025 08:22:10 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubE6v-00000001YCS-02R3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Jul 2025 08:00:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 47C7F5C5AD2;
	Mon, 14 Jul 2025 08:00:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E15EDC4CEF5;
	Mon, 14 Jul 2025 08:00:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752480028;
	bh=XpzvAHUxAzYVFgTQa2ypdhi4koHcoO778v2ak/zqA4E=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=HDrDuibBTCydpiKJ0NbveuCOlz7D3WxJr3Rf8dLFGuFGFjp0wpaLejaB8MuItUD+1
	 BL2dih69sQ6thOdZodL3eqIvpYNdPD396Pdhi5xkWqsuTcRN6lzycgmgC5oi8+4jif
	 BN77iEwF2KWHaOVGfgkndxiPW3c3yc7Z3UyaEv7MHbMQdaOdRwWUB9Bbe3MyUEBEPB
	 CfoQaBRoa3BxpUVICYUgQzyOt6HW2nAzvm1rersBHsjZ8JS2t9eQZaExlXZcfaMgQ+
	 4+yL/dJACiSGqixmATbMO6Ufr50HRhEZzHxnt2Ndt+mZSt1Xz3I5Z9V8HqlGvXwzyZ
	 m+jMqI87e1UmA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D094CC83F1B;
	Mon, 14 Jul 2025 08:00:27 +0000 (UTC)
From: Rohan G Thomas via B4 Relay <devnull+rohan.g.thomas.altera.com@kernel.org>
Date: Mon, 14 Jul 2025 15:59:17 +0800
Subject: [PATCH net-next 1/3] net: stmmac: xgmac: Disable RX FIFO Overflow
 interrupts
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250714-xgmac-minor-fixes-v1-1-c34092a88a72@altera.com>
References: <20250714-xgmac-minor-fixes-v1-0-c34092a88a72@altera.com>
In-Reply-To: <20250714-xgmac-minor-fixes-v1-0-c34092a88a72@altera.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Serge Semin <fancer.lancer@gmail.com>, 
 Romain Gantois <romain.gantois@bootlin.com>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Rohan G Thomas <rohan.g.thomas@altera.com>, 
 Matthew Gerlach <matthew.gerlach@altera.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752480026; l=1448;
 i=rohan.g.thomas@altera.com; s=20250415; h=from:subject:message-id;
 bh=oFA2+kb2AvW4R/3k8yiyiYdyPGfCRckJUe8sIarPelM=;
 b=EpWkcMwrFCOnahq0Sl2yqqNCuHkZ5+aiumNQUuGm3nIiRP/zrTLO8zBmThd3neqcinM6oKkYO
 eznyo+EFxqaBHNVY5L+WIa8S1nkwy9pKMLTjSZ2QiRppcCei+eDBdO+
X-Developer-Key: i=rohan.g.thomas@altera.com; a=ed25519;
 pk=TLFM1xzY5sPOABaIaXHDNxCAiDwRegVWoy1tP842z5E=
X-Endpoint-Received: by B4 Relay for rohan.g.thomas@altera.com/20250415
 with auth_id=460
X-Original-From: Rohan G Thomas <rohan.g.thomas@altera.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_010029_142325_2AD4351C 
X-CRM114-Status: GOOD (  11.03  )
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
Reply-To: rohan.g.thomas@altera.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Rohan G Thomas <rohan.g.thomas@altera.com>

Enabling RX FIFO Overflow interrupts is counterproductive
and causes an interrupt storm when RX FIFO overflows.
Disabling this interrupt has no side effect and eliminates
interrupt storms when the RX FIFO overflows.

Commit 8a7cb245cf28 ("net: stmmac: Do not enable RX FIFO
overflow interrupts") disables RX FIFO overflow interrupts
for DWMAC4 IP and removes the corresponding handling of
this interrupt. This patch is doing the same thing for
XGMAC IP.

Signed-off-by: Rohan G Thomas <rohan.g.thomas@altera.com>
Reviewed-by: Matthew Gerlach <matthew.gerlach@altera.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c
index 5dcc95bc0ad28b756accf9670c5fa00aa94fcfe3..7201a38842651a865493fce0cefe757d6ae9bafa 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c
@@ -203,10 +203,6 @@ static void dwxgmac2_dma_rx_mode(struct stmmac_priv *priv, void __iomem *ioaddr,
 	}
 
 	writel(value, ioaddr + XGMAC_MTL_RXQ_OPMODE(channel));
-
-	/* Enable MTL RX overflow */
-	value = readl(ioaddr + XGMAC_MTL_QINTEN(channel));
-	writel(value | XGMAC_RXOIE, ioaddr + XGMAC_MTL_QINTEN(channel));
 }
 
 static void dwxgmac2_dma_tx_mode(struct stmmac_priv *priv, void __iomem *ioaddr,

-- 
2.25.1



