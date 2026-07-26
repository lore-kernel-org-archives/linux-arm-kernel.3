Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1AFCC531C9
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 26 Jul 2026 12:04:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=iZpRf6aScaUdLDvh92S+vrO4ytvijIkOmsYMrHcUwgs=; b=b/KuQacHcWUf8elYpj8WT55rHj
	UHEQ1oXrDvz6B/nDZ0UL1l3G6EMZaP7dfuZjYMpM5Rt8i902U0Rk9UbhJGPVngv2/DcRSTRFokVL+
	mwdLrDGua7DDO4mO3nJYTNBWgy6Er0zu3PjA7lCYcg+ekLVcN+yN6a5lpaIqytv26rakuLb/ffk2l
	Zr3H464BQKXcVX4M37DFsrVyv4+VhRarbkP++JJks5OcT2k+ercenxk0w4Vx/XR51NU4uuZu679Yj
	ds24On8QWdv00bVu3NPqer12oiNOG855G8jhCzq0UTtltarEKZjKRHK9oznjtcxPNfFaX4bXX0zxb
	sN+zrXmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnxaw-000000018x6-0UmA;
	Sun, 26 Jul 2026 12:04:38 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnxau-000000018wo-3nue
	for linux-arm-kernel@lists.infradead.org;
	Sun, 26 Jul 2026 12:04:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0BE956001D;
	Sun, 26 Jul 2026 12:04:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id AD4D2C2BCB3;
	Sun, 26 Jul 2026 12:04:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1785067475;
	bh=XUpky9SHESFRxGpBv/gTdG7LnkM1eer2OeWe8DcnWbk=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=tgOWMB5KC0/pFE88oXmBWhySke1okpF7S7n+2zBqKrc2TNNJ6avIm1/KyVyXLYIxB
	 8BqPdzswJLNUBbeJHHMdBWwOpIJFAibvhwiM6Sa5nvwEmRAYYrb8wyUXvauXEd5F+h
	 CZxoUMGiAEcCJvaT+W8Td+8KOAUaPS8GKDFCJsK0mekpLWwZYT9cjVJudmcmZIcQsS
	 3pX8Zp/OmDJuPBm6LGtFT3ukkP7degZAh6i9Hwr2FG5pSr+2rt02tIbMbTI9fRB0Z3
	 bCbh47gMQL6imdQ1LOQMFAejMzsfk7bFfVD9YLcNCE67uFxqNOFu4hJ9AHw35azHxx
	 qB3N/GMBuxXrw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92327C531C9;
	Sun, 26 Jul 2026 12:04:35 +0000 (UTC)
From: Abid Ali via B4 Relay <devnull+dev.taqnialabs.gmail.com@kernel.org>
Date: Sun, 26 Jul 2026 12:04:34 +0000
Subject: [PATCH] net: stmmac: enable MAC rx/tx after DMA start
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260726-stmmac-rx-fifo-block-v1-1-45ab094b6c02@gmail.com>
X-B4-Tracking: v=1; b=H4sIANH3ZWoC/x3MSQqAMAxA0atI1ga0Yh2uIi5qTTQ4VFoRQby7x
 eVb/P9AIC8UoE0e8HRJELdH5GkCdjb7RChjNKhM6axSGsO5bcaiv5GFHQ6rswsSl3Vji5obPUB
 MD08s97/t+vf9ALBD3ZJmAAAA
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Abid Ali <dev.taqnialabs@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785067474; l=2359;
 i=dev.taqnialabs@gmail.com; s=20260425; h=from:subject:message-id;
 bh=SYBqbShplWdCVt+fGumv17qSs19wA9Tb1TT3Co1778Q=;
 b=HBLO350ZWNiXc38atPEIzzRpXtBg197VJBplYerakeOfgYl1gr3Q6dkTYiv15f5g6xVm57x4g
 4M2J8HHxUNSDEzKJ3TVCOBsDZgEr0W/QC4+5+40iWKgfvDch1DsoWAM
X-Developer-Key: i=dev.taqnialabs@gmail.com; a=ed25519;
 pk=4Syx51HH/MOySSUpi79M2ToLOdwt1yiNb338eKZBJNk=
X-Endpoint-Received: by B4 Relay for dev.taqnialabs@gmail.com/20260425 with
 auth_id=752
X-Original-From: Abid Ali <dev.taqnialabs@gmail.com>
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
Reply-To: dev.taqnialabs@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Abid Ali <dev.taqnialabs@gmail.com>

When the MAC receiver is enabled before the DMA channels are started,
incoming frames fill the MTL FIFO with no DMA engine to drain it.
If the PHY/Switch is already up at this point, and there is inflow
of packets towards EMAC, the per-queue FIFO overflows within this window.

Once the FIFO is full, the MTL read controller goes idle and never
retries delivery even if the DMA comes alive later on.
This behaviour happens due to enabling the MAC RX path before
the DMA setup is ready, and any delay between these events increases
the chances of blocking the rx path permanently.

The EMAC should only accept packets after the DMAs are enabled.

Signed-off-by: Abid Ali <dev.taqnialabs@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 3591755ea..1213cb216 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -3692,9 +3692,6 @@ static int stmmac_hw_setup(struct net_device *dev)
 		priv->hw->rx_csum = 0;
 	}
 
-	/* Enable the MAC Rx/Tx */
-	stmmac_mac_set(priv, priv->ioaddr, true);
-
 	/* Set the HW DMA mode and the COE */
 	stmmac_dma_operation_mode(priv);
 
@@ -3750,6 +3747,9 @@ static int stmmac_hw_setup(struct net_device *dev)
 	/* Start the ball rolling... */
 	stmmac_start_all_dma(priv);
 
+	/* Enable the MAC Rx/Tx */
+	stmmac_mac_set(priv, priv->ioaddr, true);
+
 	phylink_rx_clk_stop_block(priv->phylink);
 	stmmac_set_hw_vlan_mode(priv, priv->hw);
 	phylink_rx_clk_stop_unblock(priv->phylink);
@@ -7189,12 +7189,12 @@ int stmmac_xdp_open(struct net_device *dev)
 		hrtimer_setup(&tx_q->txtimer, stmmac_tx_timer, CLOCK_MONOTONIC, HRTIMER_MODE_REL);
 	}
 
-	/* Enable the MAC Rx/Tx */
-	stmmac_mac_set(priv, priv->ioaddr, true);
-
 	/* Start Rx & Tx DMA Channels */
 	stmmac_start_all_dma(priv);
 
+	/* Enable the MAC Rx/Tx */
+	stmmac_mac_set(priv, priv->ioaddr, true);
+
 	ret = stmmac_request_irq(dev);
 	if (ret)
 		goto irq_error;

---
base-commit: 8cd9520d35a6c38db6567e97dd93b1f11f185dc6
change-id: 20260726-stmmac-rx-fifo-block-ef589c38f96b

Best regards,
-- 
Abid Ali <dev.taqnialabs@gmail.com>



