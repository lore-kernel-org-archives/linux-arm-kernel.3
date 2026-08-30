Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 273FFC61DD9
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 30 Aug 2026 04:07:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=C1+JnvyqaVA+UAjiMQvWP+cLjPrU80LwmL6ro4MPd+8=; b=RsLPattZ3uyJyMRXU1wZ0aNWJs
	RxYzon0Fxm+pkNbZpwcHTMtmwIo6fGoQDmavo1+RX4MixkH6Ta8rCouz3E6L1wQkQcejetmSFjd5e
	nmlSYlwFWIOrw/PMc0U+MzMErLWeYl/fKEjEwwWtjtn+dDxpbyxn73l2DFlUVeuvJVhypw0aVE+e7
	XCv9V8OzZ48oP17Mre4CgrvrDeF/H1jGbmXKx9B/+Vqh9hXnawDQzU56mIPv0xWLhXlbzh2+rpDa/
	gkcMgErQ8tFGpqEy4kgyBABey7GjdRJwjRzglH7S5ZL7qTvW+blvUKTXi1sNkjwggHcS96UTbTOSx
	JLI+LMDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0WpM-00000007Tfw-2x9a;
	Sun, 30 Aug 2026 04:07:28 +0000
Received: from m16.mail.163.com ([117.135.210.2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0WpH-00000007TfV-3WZJ
	for linux-arm-kernel@lists.infradead.org;
	Sun, 30 Aug 2026 04:07:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=C1
	+JnvyqaVA+UAjiMQvWP+cLjPrU80LwmL6ro4MPd+8=; b=BFRHuCU6EfZoRw4NLw
	zm7V24/mCcsuoeGXPVWFqIdA+zkXcY9yuHXKCyuAUZ8t9YBbPWh/fJmGZTUbdeI3
	szwyGukcrNpTUVpzmq4d9hfWihImq1Pf4z69dD4o7ckZL0hTwIejRCV03Y3QDk8F
	anWVoh/CO+b/sNWMDzypC0MXU=
Received: from 4CV529F122.company.local (unknown [])
	by gzsmtp2 (Coremail) with SMTP id PSgvCgAHZPI1rJNqKOTDNg--.46715S2;
	Sun, 30 Aug 2026 12:06:26 +0800 (CST)
From: Ding Hui <dinghui1111@163.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	netdev@vger.kernel.org (open list:STMMAC ETHERNET DRIVER),
	linux-stm32@st-md-mailman.stormreply.com (moderated list:ARM/STM32 ARCHITECTURE),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/STM32 ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Cc: dinghui@lixiang.com,
	xiasanbo@lixiang.com,
	yangchen11@lixiang.com,
	liuxuanjun@lixiang.com
Subject: [PATCH] net: stmmac: fix NULL pointer dereference in tx/rx resource cleanup
Date: Sun, 30 Aug 2026 12:06:08 +0800
Message-Id: <20260830040610.1156008-1-dinghui1111@163.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: PSgvCgAHZPI1rJNqKOTDNg--.46715S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxGw1xAry3JF4fAF4DWw1xKrg_yoW5Kw47pr
	ZFk3yjy34Utr13Ga1DJw48Xa45Ja95tr43WayIgwnxZF4ayryvgF4jvryjkr95CrykZa4x
	KrZ8CF9xCr18JrDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07j2UDJUUUUU=
X-Originating-IP: [220.248.55.70]
X-CM-SenderInfo: pglqwx1xlriiqr6rljoofrz/xtbC0QK65mqTrELcIAAA3k
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260829_210724_655653_B417639C 
X-CRM114-Status: GOOD (  15.15  )
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

From: Ding Hui <dinghui@lixiang.com>

The DMA descriptor ring allocation in __init_dma_rx_desc_rings() and
__alloc_dma_tx_desc_resources() is split into multiple steps, each of
which may fail and return early while the per-queue cleanup paths still
call the free helpers for the partially-initialized queue.

When an intermediate allocation fails, several ring buffers may never
have been allocated and their pointers remain NULL:

  - rx_q->buf_pool can be NULL if its kzalloc_objs() failed, yet
    dma_free_rx_skbufs()/dma_free_rx_xskbufs() dereference
    rx_q->buf_pool[i] via stmmac_free_rx_buffer().

  - tx_q->tx_skbuff_dma can be NULL if its kzalloc_objs() failed, yet
    dma_free_tx_skbufs() dereferences tx_q->tx_skbuff_dma[i] via
    stmmac_free_tx_buffer().

  - tx_q->tx_skbuff (aliased with tx_q->xdpf through a union) can be
    NULL if its allocation failed while tx_skbuff_dma succeeded; in that
    case dma_free_tx_skbufs() does not bail out and
    stmmac_free_tx_buffer() dereferences tx_q->xdpf[i] / tx_skbuff[i].

Guard all of these accesses with NULL checks so the cleanup paths are
safe to run on a queue whose allocations failed part-way through.

Fixes: 2af6106ae949 ("net: stmmac: Introducing support for Page Pool")
Fixes: be8b38a722e6 ("net: stmmac: Add support for XDP_TX action")

Signed-off-by: Ding Hui <dinghui@lixiang.com>
---
 .../net/ethernet/stmicro/stmmac/stmmac_main.c    | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index f2fc89176654..71c6a941fb91 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -1728,7 +1728,7 @@ static void stmmac_free_tx_buffer(struct stmmac_priv *priv,
 					 DMA_TO_DEVICE);
 	}
 
-	if (tx_q->xdpf[i] &&
+	if (tx_q->xdpf && tx_q->xdpf[i] &&
 	    (tx_q->tx_skbuff_dma[i].buf_type == STMMAC_TXBUF_T_XDP_TX ||
 	     tx_q->tx_skbuff_dma[i].buf_type == STMMAC_TXBUF_T_XDP_NDO)) {
 		xdp_return_frame(tx_q->xdpf[i]);
@@ -1738,7 +1738,7 @@ static void stmmac_free_tx_buffer(struct stmmac_priv *priv,
 	if (tx_q->tx_skbuff_dma[i].buf_type == STMMAC_TXBUF_T_XSK_TX)
 		tx_q->xsk_frames_done++;
 
-	if (tx_q->tx_skbuff[i] &&
+	if (tx_q->tx_skbuff && tx_q->tx_skbuff[i] &&
 	    tx_q->tx_skbuff_dma[i].buf_type == STMMAC_TXBUF_T_SKB) {
 		dev_kfree_skb_any(tx_q->tx_skbuff[i]);
 		tx_q->tx_skbuff[i] = NULL;
@@ -1761,6 +1761,10 @@ static void dma_free_rx_skbufs(struct stmmac_priv *priv,
 	struct stmmac_rx_queue *rx_q = &dma_conf->rx_queue[queue];
 	int i;
 
+	/* buf_pool may not be allocated if alloc failed early */
+	if (!rx_q->buf_pool)
+		return;
+
 	for (i = 0; i < dma_conf->dma_rx_size; i++)
 		stmmac_free_rx_buffer(priv, rx_q, i);
 }
@@ -1802,6 +1806,10 @@ static void dma_free_rx_xskbufs(struct stmmac_priv *priv,
 	struct stmmac_rx_queue *rx_q = &dma_conf->rx_queue[queue];
 	int i;
 
+	/* buf_pool may not be allocated if alloc failed early */
+	if (!rx_q->buf_pool)
+		return;
+
 	for (i = 0; i < dma_conf->dma_rx_size; i++) {
 		struct stmmac_rx_buffer *buf = &rx_q->buf_pool[i];
 
@@ -2097,6 +2105,10 @@ static void dma_free_tx_skbufs(struct stmmac_priv *priv,
 	struct stmmac_tx_queue *tx_q = &dma_conf->tx_queue[queue];
 	int i;
 
+	/* tx_skbuff_dma may not be allocated if alloc failed early */
+	if (!tx_q->tx_skbuff_dma)
+		return;
+
 	tx_q->xsk_frames_done = 0;
 
 	for (i = 0; i < dma_conf->dma_tx_size; i++)
-- 
2.34.1


