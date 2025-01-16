Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EA21C02180
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jan 2025 02:10:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rohLUY0QvqQVeJE5jxrdGwsuBMzOmXK+mD/AVZem0Fk=; b=ewspF/8s6jsqxLp6R85bu9OVri
	ffGhA1/MJ9JhY8DTF1lAW8hR/ZKZ8Hmp7kksuSBPgRBmlTbYenitEEE+X+sK8H4WfnDiOQjDxFKZw
	U+1XpbIFCG3g5bHohqS76qrIuBIKJkSuPT83W1nAFDr/JTQiiPvT94B95H0TBfZ5xGixWuKnzqSci
	kbMzORlly1J5DK/QValelaO/nCwEiqas2uTiOkvYlOJGJ9Tzkca20miHAMftn3NkoBMi7uHO8Iu1z
	eZG2PvwptJNzlJoyGqR1SIHei0QHyMq/94xG1P/e4kZsfda3Cz6nSKnYY/2e7Ui5a9ehYTPi+oLqu
	Uql/Se2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYFKx-0000000DbrW-3knO;
	Thu, 16 Jan 2025 02:10:23 +0000
Received: from mx.socionext.com ([202.248.49.38])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYFJh-0000000DbhV-1NiB
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jan 2025 02:09:06 +0000
Received: from unknown (HELO kinkan2-ex.css.socionext.com) ([172.31.9.52])
  by mx.socionext.com with ESMTP; 16 Jan 2025 11:08:59 +0900
Received: from mail.mfilter.local (mail-arc02.css.socionext.com [10.213.46.40])
	by kinkan2-ex.css.socionext.com (Postfix) with ESMTP id 9AF1D200C4F1;
	Thu, 16 Jan 2025 11:08:59 +0900 (JST)
Received: from kinkan2.css.socionext.com ([172.31.9.51]) by m-FILTER with ESMTP; Thu, 16 Jan 2025 11:08:59 +0900
Received: from plum.e01.socionext.com (unknown [10.212.245.39])
	by kinkan2.css.socionext.com (Postfix) with ESMTP id 01B83AB187;
	Thu, 16 Jan 2025 11:08:58 +0900 (JST)
From: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
Subject: [PATCH net 1/2] net: stmmac: Limit FIFO size by hardware feature value
Date: Thu, 16 Jan 2025 11:08:52 +0900
Message-Id: <20250116020853.2835521-1-hayashi.kunihiko@socionext.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_180905_475513_074E5A8C 
X-CRM114-Status: GOOD (  13.96  )
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

Tx/Rx FIFO size is specified by the parameter "{tx,rx}-fifo-depth" from
the platform layer.

However, these values are constrained by upper limits determined by the
capabilities of each hardware feature. There is a risk that the upper
bits will be truncated due to the calculation, so it's appropriate to
limit them to the upper limit values.

Signed-off-by: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 7bf275f127c9..2d69c3c4b329 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -2375,9 +2375,9 @@ static void stmmac_dma_operation_mode(struct stmmac_priv *priv)
 	u32 chan = 0;
 	u8 qmode = 0;
 
-	if (rxfifosz == 0)
+	if (!rxfifosz || rxfifosz > priv->dma_cap.rx_fifo_size)
 		rxfifosz = priv->dma_cap.rx_fifo_size;
-	if (txfifosz == 0)
+	if (!txfifosz || txfifosz > priv->dma_cap.tx_fifo_size)
 		txfifosz = priv->dma_cap.tx_fifo_size;
 
 	/* Split up the shared Tx/Rx FIFO memory on DW QoS Eth and DW XGMAC */
@@ -2851,9 +2851,9 @@ static void stmmac_set_dma_operation_mode(struct stmmac_priv *priv, u32 txmode,
 	int rxfifosz = priv->plat->rx_fifo_size;
 	int txfifosz = priv->plat->tx_fifo_size;
 
-	if (rxfifosz == 0)
+	if (!rxfifosz || rxfifosz > priv->dma_cap.rx_fifo_size)
 		rxfifosz = priv->dma_cap.rx_fifo_size;
-	if (txfifosz == 0)
+	if (!txfifosz || txfifosz > priv->dma_cap.tx_fifo_size)
 		txfifosz = priv->dma_cap.tx_fifo_size;
 
 	/* Adjust for real per queue fifo size */
-- 
2.25.1


