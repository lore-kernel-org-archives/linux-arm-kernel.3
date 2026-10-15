Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 147F5CC6B34
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 11:25:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=irDLkuEmIxis+kWy0Pk+JokcZYIiUeB3kJUm7BL7l3I=; b=VvJL7kextsO5shL76ZG14zmhw+
	nVoAvJtCZLwl+e7YVUIuOgcK+EleRzoQp/ATwjlfOXEyZywaaayr4CM7SSWzKEw0UaPOhiaChKA/9
	Oq8sx31HeROXXXZbqQBS7eI4eZxmSGw19o8cJ5UPevL7toDigL+xoLwO98isNOuPGbOt57fixujEP
	rLLwchnLj1dZIpJlZxRN0bKd1cUe7MnoDa+VbGEHycKsL972mVNTfoLnXoNxzVJt0fj3Njuvx78Q7
	uHxlc6iN2FedxtYN82QvwqQbe43d5FFTalKkKUfTXlO5qcholBysFEQ1logGdQz9lB/6NlHErP8BM
	VSsXJ14w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHJa5-0000000HYuU-1NB5;
	Thu, 15 Oct 2026 11:25:05 +0000
Received: from m16.mail.163.com ([220.197.31.5])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHJa2-0000000HYsk-3K5B
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Oct 2026 11:25:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=ir
	DLkuEmIxis+kWy0Pk+JokcZYIiUeB3kJUm7BL7l3I=; b=hEWXsBzZ9YeLLYo3JA
	9RK91C3v3/UsQK3sGqEylcLx/0UbbqtUYbSyLjZObJDeRAnfd+ZTsYltRPeSszNg
	IoJhEijWxiueOxfQJVYlg2erj11fUP6KSWCin7qUHcIgPTKvi8nsDkAZAOePbRTz
	S6bE1LGkClk2fjd1MOazqsl9Y=
Received: from caesarPC.. (unknown [])
	by gzga-smtp-mtada-g0-0 (Coremail) with SMTP id _____wD3X0vht9BqzMwBAQ--.38709S2;
	Thu, 15 Oct 2026 19:24:18 +0800 (CST)
From: Xiaochuan Li <chuanx2070@163.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	Xiaochuan Li <chuanx2070@163.com>
Subject: [PATCH] net: stmmac: remove STMMAC_DOWN check to avoid irq storm
Date: Thu, 15 Oct 2026 19:24:15 +0800
Message-ID: <20261015112415.437900-1-chuanx2070@163.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wD3X0vht9BqzMwBAQ--.38709S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxXF43Cw1DtF45tFWfWFyxuFg_yoWrAFy8pF
	ZrAa90vrWvqrnrXa1DGr4UZryYya4Syay5W3Z7Jay7Ga1akryYqryrtFyjqF1fCFWUWw1S
	y3yYvr43u3W7Xw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UxCzNUUUUU=
X-CM-SenderInfo: pfkxt0j0sqlii6rwjhhfrp/xtbC7QL012rQt+LyPwAA3u
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_042503_190644_CD4E38BF 
X-CRM114-Status: GOOD (  15.86  )
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

The stmmac interrupt handlers return IRQ_HANDLED immediately when
STMMAC_DOWN is set, without reading or clearing any device status
register.

STMMAC_DOWN is set by stmmac_reset_subtask() before dev_close(). The
device interrupt is level triggered, so if it fires after STMMAC_DOWN
is set and before the IRQs are masked/freed in __stmmac_release(), the
pending status is never cleared, the line stays asserted and the handler
is re-entered forever. Since the handler returns IRQ_HANDLED,
note_interrupt() never flags the IRQ as spurious and never disables it,
resulting in an interrupt storm.

Signed-off-by: Xiaochuan Li <chuanx2070@163.com>
---
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 33 ++++++++-----------
 1 file changed, 13 insertions(+), 20 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 56d89a696272..520c1b8d736c 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -3091,6 +3091,13 @@ static bool stmmac_safety_feat_interrupt(struct stmmac_priv *priv)
 
 	ret = stmmac_safety_feat_irq_status(priv, priv->dev,
 			priv->ioaddr, priv->dma_cap.asp, &priv->sstats);
+
+	/* Status is read/cleared; do not escalate to a global error reset
+	 * while the interface is going down.
+	 */
+	if (test_bit(STMMAC_DOWN, &priv->state))
+		return false;
+
 	if (ret && (ret != -EINVAL)) {
 		stmmac_global_err(priv);
 		return true;
@@ -3113,6 +3120,12 @@ static int stmmac_napi_check(struct stmmac_priv *priv, u32 chan, u32 dir)
 	rx_napi = rx_q->xsk_pool ? &ch->rxtx_napi : &ch->rx_napi;
 	tx_napi = tx_q->xsk_pool ? &ch->rxtx_napi : &ch->tx_napi;
 
+	/* Status was already read (and clear) above, so the irq line is
+	 * deasserted, Drop the event while the interface is going down.
+	 */
+	if (test_bit(STMMAC_DOWN, &priv->state))
+		return 0;
+
 	if ((status & handle_rx) && (chan < priv->plat->rx_queues_to_use)) {
 		if (napi_schedule_prep(rx_napi)) {
 			spin_lock_irqsave(&ch->lock, flags);
@@ -6408,10 +6421,6 @@ static irqreturn_t stmmac_interrupt(int irq, void *dev_id)
 	struct net_device *dev = (struct net_device *)dev_id;
 	struct stmmac_priv *priv = netdev_priv(dev);
 
-	/* Check if adapter is up */
-	if (test_bit(STMMAC_DOWN, &priv->state))
-		return IRQ_HANDLED;
-
 	/* Check ASP error if it isn't delivered via an individual IRQ */
 	if (priv->sfty_irq <= 0 && stmmac_safety_feat_interrupt(priv))
 		return IRQ_HANDLED;
@@ -6430,10 +6439,6 @@ static irqreturn_t stmmac_mac_interrupt(int irq, void *dev_id)
 	struct net_device *dev = (struct net_device *)dev_id;
 	struct stmmac_priv *priv = netdev_priv(dev);
 
-	/* Check if adapter is up */
-	if (test_bit(STMMAC_DOWN, &priv->state))
-		return IRQ_HANDLED;
-
 	/* To handle Common interrupts */
 	stmmac_common_interrupt(priv);
 
@@ -6445,10 +6450,6 @@ static irqreturn_t stmmac_safety_interrupt(int irq, void *dev_id)
 	struct net_device *dev = (struct net_device *)dev_id;
 	struct stmmac_priv *priv = netdev_priv(dev);
 
-	/* Check if adapter is up */
-	if (test_bit(STMMAC_DOWN, &priv->state))
-		return IRQ_HANDLED;
-
 	/* Check if a fatal error happened */
 	stmmac_safety_feat_interrupt(priv);
 
@@ -6466,10 +6467,6 @@ static irqreturn_t stmmac_msi_intr_tx(int irq, void *data)
 	dma_conf = container_of(tx_q, struct stmmac_dma_conf, tx_queue[chan]);
 	priv = container_of(dma_conf, struct stmmac_priv, dma_conf);
 
-	/* Check if adapter is up */
-	if (test_bit(STMMAC_DOWN, &priv->state))
-		return IRQ_HANDLED;
-
 	status = stmmac_napi_check(priv, chan, DMA_DIR_TX);
 
 	if (unlikely(status & tx_hard_error_bump_tc)) {
@@ -6492,10 +6489,6 @@ static irqreturn_t stmmac_msi_intr_rx(int irq, void *data)
 	dma_conf = container_of(rx_q, struct stmmac_dma_conf, rx_queue[chan]);
 	priv = container_of(dma_conf, struct stmmac_priv, dma_conf);
 
-	/* Check if adapter is up */
-	if (test_bit(STMMAC_DOWN, &priv->state))
-		return IRQ_HANDLED;
-
 	stmmac_napi_check(priv, chan, DMA_DIR_RX);
 
 	return IRQ_HANDLED;
-- 
2.43.0


