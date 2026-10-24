Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2841606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 24 Oct 2026 07:14:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wzITfOwu;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=c3Z34Gwt
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=qTD9uv7EbNta/9xuGWhItT6sXbpcUOA9/0K6CzF3X6A=; b=wzITfOwunzyNNb
	7aQfqjrOcqx+pSS8GSdolOBys/1e3wj6hng1KsECkfY5T6lNPs/Bu7lMKqD/VzwYSQKJlu/ExL/LL
	wQCJZPdj+gJXeZXDuJ8IjIR2B7K8pLxHWrKjapf+8nuVoIOQcpkBc+lfZiCogVWIi+vNRwOpM5cxe
	1zahkb910LoEknSQhd/HXNJ8Or+h0B2m6nfanNKZajCruWIdj7t6ZsFz65ENKXTzXxWnnSslidN9i
	3eE1+WA0HZVQAMRhyTAuTCYKJd42zxxqjJaP7dkyn6tGT0Nq+xX2SfnwXPvz2Wcp9rlWDObj+zEAo
	+0qz/zu3dJ+cz3+A4/1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKVxK-0000000HXEY-00FT;
	Sat, 24 Oct 2026 07:14:18 +0000
Received: from m16.mail.163.com ([220.197.31.5])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKVxD-0000000HXC5-1tWB
	for linux-arm-kernel@lists.infradead.org;
	Sat, 24 Oct 2026 07:14:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=qT
	D9uv7EbNta/9xuGWhItT6sXbpcUOA9/0K6CzF3X6A=; b=c3Z34Gwtt2GA9NwDAf
	67I0m73LktLuwM+frRE1EzKZBLwzkmmnmh0DsEElmTKEK7YdUbxeNHxOGBIAE24Q
	gqiB4IzS/pEZC45JO5L/AjC50rjt0xhI9gAnCTjx72IjdEnh1ZpBRpMU4qgPxije
	2aAsgCxvo1ds/KQ7av18HdAJg=
Received: from 4CV529F122.company.local (unknown [])
	by gzga-smtp-mtada-g0-0 (Coremail) with SMTP id _____wD310ySWtxq_y0rCg--.41124S3;
	Sat, 24 Oct 2026 15:13:37 +0800 (CST)
From: Ding Hui <dinghui1111@163.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
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
Subject: [PATCH net-next v6 1/4] net: stmmac: guard against NULL pointers when freeing TX/RX buffers
Date: Sat, 24 Oct 2026 15:13:15 +0800
Message-Id: <20261024071319.875921-2-dinghui1111@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261024071319.875921-1-dinghui1111@163.com>
References: <20261024071319.875921-1-dinghui1111@163.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wD310ySWtxq_y0rCg--.41124S3
X-Coremail-Antispam: 1Uf129KBjvJXoWxCF43GF4fXw4xurWfuF1Utrb_yoWrur1rpr
	srC3yvy34UtrnxGa1DJr48Xa45Jayrtr4YgayfKwnxZF1akryIgF45AryUCrykCrWkuF1f
	KrZ8C3Z8Ar18JrUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jV6wAUUUUU=
X-CM-SenderInfo: pglqwx1xlriiqr6rljoofrz/xtbC9AGQvGrcWqFeLwAA3l
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261024_001411_823150_443A5A05 
X-CRM114-Status: GOOD (  14.95  )
X-Spam-Score: -1.7 (-)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Ding Hui <dinghui@lixiang.com>

The DMA resource free helpers may be invoked on queues whose buffers
were never allocated:

  - dma_free_rx_skbufs() and dma_free_rx_xskbufs() dereference
    rx_q->buf_pool[i] via stmmac_free_rx_buffer(), but buf_pool may
    be NULL if its kzalloc_objs() failed.

  - dma_free_tx_skbufs() dereferences tx_q->tx_skbuff_dma[i] via
    stmmac_free_tx_buffer(), but tx_skbuff_dma may be NULL if its
    kzalloc_objs() failed.

  - stmmac_free_tx_buffer() dereferences tx_q->xdpf[i] and
    tx_q->tx_skbuff[i] (aliased through a union), but tx_skbuff may
    be NULL if its allocation failed while tx_skbuff_dma succeeded.

Add NULL checks in the free helpers as a defensive measure, since they may
be called on partially-initialized queues.
Additionally, make __free_dma_rx_desc_resources() and
__free_dma_tx_desc_resources() clear the pointers they free, so that
the NULL guards in the free helpers hold reliably when the long-lived
priv->dma_conf is reused across XDP open/release cycles.

Signed-off-by: Ding Hui <dinghui@lixiang.com>
---
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 32 +++++++++++++++++--
 1 file changed, 29 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index b20e5038eead..2f03600cc5bd 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -1766,7 +1766,7 @@ static void stmmac_free_tx_buffer(struct stmmac_priv *priv,
 					 DMA_TO_DEVICE);
 	}
 
-	if (tx_q->xdpf[i] &&
+	if (tx_q->xdpf && tx_q->xdpf[i] &&
 	    (tx_q->tx_skbuff_dma[i].buf_type == STMMAC_TXBUF_T_XDP_TX ||
 	     tx_q->tx_skbuff_dma[i].buf_type == STMMAC_TXBUF_T_XDP_NDO)) {
 		xdp_return_frame(tx_q->xdpf[i]);
@@ -1778,7 +1778,7 @@ static void stmmac_free_tx_buffer(struct stmmac_priv *priv,
 		tx_q->tx_skbuff_dma[i].buf_type = STMMAC_TXBUF_T_SKB;
 	}
 
-	if (tx_q->tx_skbuff[i] &&
+	if (tx_q->tx_skbuff && tx_q->tx_skbuff[i] &&
 	    tx_q->tx_skbuff_dma[i].buf_type == STMMAC_TXBUF_T_SKB) {
 		dev_kfree_skb_any(tx_q->tx_skbuff[i]);
 		tx_q->tx_skbuff[i] = NULL;
@@ -1801,6 +1801,10 @@ static void dma_free_rx_skbufs(struct stmmac_priv *priv,
 	struct stmmac_rx_queue *rx_q = &dma_conf->rx_queue[queue];
 	int i;
 
+	/* buf_pool may not be allocated if alloc failed early */
+	if (!rx_q->buf_pool)
+		return;
+
 	for (i = 0; i < dma_conf->dma_rx_size; i++)
 		stmmac_free_rx_buffer(priv, rx_q, i);
 }
@@ -1842,6 +1846,10 @@ static void dma_free_rx_xskbufs(struct stmmac_priv *priv,
 	struct stmmac_rx_queue *rx_q = &dma_conf->rx_queue[queue];
 	int i;
 
+	/* buf_pool may not be allocated if alloc failed early */
+	if (!rx_q->buf_pool)
+		return;
+
 	for (i = 0; i < dma_conf->dma_rx_size; i++) {
 		struct stmmac_rx_buffer *buf = &rx_q->buf_pool[i];
 
@@ -2137,6 +2145,10 @@ static void dma_free_tx_skbufs(struct stmmac_priv *priv,
 	struct stmmac_tx_queue *tx_q = &dma_conf->tx_queue[queue];
 	int i;
 
+	/* tx_skbuff_dma may not be allocated if alloc failed early */
+	if (!tx_q->tx_skbuff_dma)
+		return;
+
 	tx_q->xsk_frames_done = 0;
 
 	for (i = 0; i < dma_conf->dma_tx_size; i++)
@@ -2194,13 +2206,20 @@ static void __free_dma_rx_desc_resources(struct stmmac_priv *priv,
 	size = stmmac_get_rx_desc_size(priv) * dma_conf->dma_rx_size;
 
 	dma_free_coherent(priv->device, size, addr, rx_q->dma_rx_phy);
+	rx_q->dma_erx = NULL;
+	rx_q->dma_rx = NULL;
+	rx_q->dma_rx_phy = 0;
 
 	if (xdp_rxq_info_is_reg(&rx_q->xdp_rxq))
 		xdp_rxq_info_unreg(&rx_q->xdp_rxq);
 
 	kfree(rx_q->buf_pool);
-	if (rx_q->page_pool)
+	rx_q->buf_pool = NULL;
+
+	if (rx_q->page_pool) {
 		page_pool_destroy(rx_q->page_pool);
+		rx_q->page_pool = NULL;
+	}
 }
 
 static void free_dma_rx_desc_resources(struct stmmac_priv *priv,
@@ -2242,9 +2261,16 @@ static void __free_dma_tx_desc_resources(struct stmmac_priv *priv,
 	size = stmmac_get_tx_desc_size(priv, tx_q) * dma_conf->dma_tx_size;
 
 	dma_free_coherent(priv->device, size, addr, tx_q->dma_tx_phy);
+	tx_q->dma_etx = NULL;
+	tx_q->dma_entx = NULL;
+	tx_q->dma_tx = NULL;
+	tx_q->dma_tx_phy = 0;
 
 	kfree(tx_q->tx_skbuff_dma);
+	tx_q->tx_skbuff_dma = NULL;
+
 	kfree(tx_q->tx_skbuff);
+	tx_q->tx_skbuff = NULL;
 }
 
 static void free_dma_tx_desc_resources(struct stmmac_priv *priv,
-- 
2.34.1


