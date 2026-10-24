Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82CA7606A31D
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 24 Oct 2026 07:14:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zVNeQ8JT;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=fCn+K8Qi
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=FFBN4jVBSpK7+XAViyBm0X7EI9kVp/5kh3B0b5bkumc=; b=zVNeQ8JTX1BeeH
	aPJ1LZVkibQF8OAPXnZxy0TOnsFxtQU+bA+JFhH3eik/Z6AaiEGfktzNLbjZyfuOx949Z+SeiHT2q
	J+EtIhduisjXE1m/vMfQAYwiLUcjQnsm2APzNilYm2jOqwXvnDwtiXhDSDTRs4cs6W7MemZaZ6mU+
	8AtFBnsueGOer32zNvcJ6Z6VAsZioZSXPyzwuiGLEDbXeLZr3ZLa618xu0ofizUmal/Jlbma09V+x
	rvyMQSbaBvKYkh07wdCPhoI2p/YgbwpBvY78DpqQPYg15dZWZToAeU5e8OtzSDL1WFcTqy2NCsc/v
	fpV7pdkTcgNeGlu7oFgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKVxD-0000000HXCc-3fpo;
	Sat, 24 Oct 2026 07:14:11 +0000
Received: from m16.mail.163.com ([220.197.31.5])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKVxA-0000000HXBR-3hsE
	for linux-arm-kernel@lists.infradead.org;
	Sat, 24 Oct 2026 07:14:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=FF
	BN4jVBSpK7+XAViyBm0X7EI9kVp/5kh3B0b5bkumc=; b=fCn+K8QibR6Z5tEdpc
	afXewiIa6YOcSF788pOp9f2FGC8qkMuOKfbBkXigEmUPz3voyZOK4HW9BjNFr1y2
	VwtBddsM0fxOfEOM8AiD/nRRQXVVJ+z7OPt8gvUloUEfHEjNi7vgOAULAg8d59A+
	wieLfa2TzRiEf5lHQ+IJgjQ8U=
Received: from 4CV529F122.company.local (unknown [])
	by gzga-smtp-mtada-g0-0 (Coremail) with SMTP id _____wD310ySWtxq_y0rCg--.41124S4;
	Sat, 24 Oct 2026 15:13:40 +0800 (CST)
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
Subject: [PATCH net-next v6 2/4] net: stmmac: clean up partially allocated DMA rings on error
Date: Sat, 24 Oct 2026 15:13:16 +0800
Message-Id: <20261024071319.875921-3-dinghui1111@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261024071319.875921-1-dinghui1111@163.com>
References: <20261024071319.875921-1-dinghui1111@163.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wD310ySWtxq_y0rCg--.41124S4
X-Coremail-Antispam: 1Uf129KBjvJXoWxCr45JryrWFy3Ar4kWry5twb_yoWrJr47pF
	4xCw4qkryjqr13Jw4DJw48X3Z0kayFyr4YgF47uw4S93ZFyry0kF1YvryUWry8JrykuF1S
	v3yDC3W5CF1DJwUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jJManUUUUU=
X-CM-SenderInfo: pglqwx1xlriiqr6rljoofrz/xtbC9ASRvWrcWqReYwAA3p
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261024_001409_465287_9B9A59DC 
X-CRM114-Status: GOOD (  11.88  )
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

__alloc_dma_rx_desc_resources() and __alloc_dma_tx_desc_resources()
allocate resources in multiple steps but return early on failure
without cleaning up what they have already allocated. The outer
error paths then call the free helpers on partially-initialized
queues, relying on the NULL guards added previously.

Fix this by making each allocation function responsible for undoing
its own allocations on error, following the standard kernel error
handling pattern of cleaning up in reverse order of allocation.

Also free the RX resources in alloc_dma_desc_resources() when the TX
allocation fails, as the callers only free dma_conf itself on that
path.

Signed-off-by: Ding Hui <dinghui@lixiang.com>
---
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 40 +++++++++++++++----
 1 file changed, 33 insertions(+), 7 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 2f03600cc5bd..a8401b04d79f 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -2333,15 +2333,19 @@ static int __alloc_dma_rx_desc_resources(struct stmmac_priv *priv,
 	}
 
 	rx_q->buf_pool = kzalloc_objs(*rx_q->buf_pool, dma_conf->dma_rx_size);
-	if (!rx_q->buf_pool)
-		return -ENOMEM;
+	if (!rx_q->buf_pool) {
+		ret = -ENOMEM;
+		goto err_destroy_pool;
+	}
 
 	size = stmmac_get_rx_desc_size(priv) * dma_conf->dma_rx_size;
 
 	addr = dma_alloc_coherent(priv->device, size, &rx_q->dma_rx_phy,
 				  GFP_KERNEL);
-	if (!addr)
-		return -ENOMEM;
+	if (!addr) {
+		ret = -ENOMEM;
+		goto err_free_buf_pool;
+	}
 
 	if (priv->extend_desc)
 		rx_q->dma_erx = addr;
@@ -2357,10 +2361,22 @@ static int __alloc_dma_rx_desc_resources(struct stmmac_priv *priv,
 	ret = xdp_rxq_info_reg(&rx_q->xdp_rxq, priv->dev, queue, napi_id);
 	if (ret) {
 		netdev_err(priv->dev, "Failed to register xdp rxq info\n");
-		return -EINVAL;
+		goto err_free_dma;
 	}
 
 	return 0;
+
+err_free_dma:
+	dma_free_coherent(priv->device, size, addr, rx_q->dma_rx_phy);
+	rx_q->dma_erx = NULL;
+	rx_q->dma_rx = NULL;
+err_free_buf_pool:
+	kfree(rx_q->buf_pool);
+	rx_q->buf_pool = NULL;
+err_destroy_pool:
+	page_pool_destroy(rx_q->page_pool);
+	rx_q->page_pool = NULL;
+	return ret;
 }
 
 static int alloc_dma_rx_desc_resources(struct stmmac_priv *priv,
@@ -2413,14 +2429,14 @@ static int __alloc_dma_tx_desc_resources(struct stmmac_priv *priv,
 
 	tx_q->tx_skbuff = kzalloc_objs(struct sk_buff *, dma_conf->dma_tx_size);
 	if (!tx_q->tx_skbuff)
-		return -ENOMEM;
+		goto err_free_skbuff_dma;
 
 	size = stmmac_get_tx_desc_size(priv, tx_q) * dma_conf->dma_tx_size;
 
 	addr = dma_alloc_coherent(priv->device, size,
 				  &tx_q->dma_tx_phy, GFP_KERNEL);
 	if (!addr)
-		return -ENOMEM;
+		goto err_free_skbuff;
 
 	if (priv->extend_desc)
 		tx_q->dma_etx = addr;
@@ -2430,6 +2446,14 @@ static int __alloc_dma_tx_desc_resources(struct stmmac_priv *priv,
 		tx_q->dma_tx = addr;
 
 	return 0;
+
+err_free_skbuff:
+	kfree(tx_q->tx_skbuff);
+	tx_q->tx_skbuff = NULL;
+err_free_skbuff_dma:
+	kfree(tx_q->tx_skbuff_dma);
+	tx_q->tx_skbuff_dma = NULL;
+	return -ENOMEM;
 }
 
 static int alloc_dma_tx_desc_resources(struct stmmac_priv *priv,
@@ -2472,6 +2496,8 @@ static int alloc_dma_desc_resources(struct stmmac_priv *priv,
 		return ret;
 
 	ret = alloc_dma_tx_desc_resources(priv, dma_conf);
+	if (ret)
+		free_dma_rx_desc_resources(priv, dma_conf);
 
 	return ret;
 }
-- 
2.34.1


