Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02C25CD4851
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 May 2026 05:40:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=iizYTJX5EmybqG8LJ5U61c42f+3Bl+gwgY9z3qf5SUk=; b=r7bKpiSq5We37043mdQDfKI6jX
	53QO/pO4dB2A3uJgtRVMKAscqZAymM72MIVT5Qi8VJ7PAXykeJGn1kE2p8jF5QmQRiHnvaAcXvNHh
	1uE3GR8b6nFgPfKN/R2RUogV+Hi8fuIZHJ8gZENra7vWRvMHhKAasc01PPl3fGKg5H56JwzZY5QvK
	d4tonMjkVQAUEVTzh7qT5EVYfj9FI7RmS0Pfmds7xN5nYFW+NtCaEEOjpxFjtq8K8tm0yZsgTzbnA
	Mpi45hX8ZxVyaFSnPm1W273Y/5/loVvK3rBnh3dU8N48u26/Bm9kSes7sS6hSJeo0WuXM16H71QVR
	gJZqM2og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNlHg-00000007QZf-23EF;
	Fri, 15 May 2026 05:40:28 +0000
Received: from m16.mail.163.com ([220.197.31.5])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNlHd-00000007QYr-1YBJ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 May 2026 05:40:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=ii
	zYTJX5EmybqG8LJ5U61c42f+3Bl+gwgY9z3qf5SUk=; b=ZgvlwtMbvG5zdcwKM1
	bEcBP1pCGEoye4D0eALrnDkBR3EqjbXMyYhyXkdYrBLw4MInHo4EsX/rgGK0dfbS
	Fxy3xuBLGRgTn02mrX7dxRRJt7whzWIK8CT1oL8xXUFO1m0jg1gWKc5SL/7zEucT
	qwl7fSzVxeDaLnhWJibFu6vrU=
Received: from PC-YLX4CAEK.company.local (unknown [])
	by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id _____wD3n5GCsQZqBgrWBQ--.2418S2;
	Fri, 15 May 2026 13:39:15 +0800 (CST)
From: Ding Hui <dinghui1111@163.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	netdev@vger.kernel.org (open list:STMMAC ETHERNET DRIVER),
	linux-stm32@st-md-mailman.stormreply.com (moderated list:ARM/STM32 ARCHITECTURE),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/STM32 ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Cc: dinghui@lixiang.com,
	xiasanbo@lixiang.com,
	yangchen11@lixiang.com,
	liuxuanjun@lixiang.com
Subject: [PATCH] net: stmmac: fix fatal bus error on resume by reinitializing RX buffers
Date: Fri, 15 May 2026 13:38:37 +0800
Message-Id: <20260515053856.2310369-1-dinghui1111@163.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wD3n5GCsQZqBgrWBQ--.2418S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxGw1Dtw47Ww4DGw4rCr1ftFb_yoW5Kr1rpa
	9Ik3y2yw1ktF4xJw43Jw48ZFy5XayrtF45G3s7Gws3ua1avF9Yvr13trWjva48CFn5AF1f
	tFW5Caykua1UArJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jEsjbUUUUU=
X-Originating-IP: [220.248.55.69]
X-CM-SenderInfo: pglqwx1xlriiqr6rljoofrz/xtbC8wOo1GoGsYOaZwAA3v
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_224025_809074_689C0E73 
X-CRM114-Status: GOOD (  17.51  )
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

On suspend, stmmac_suspend() calls stmmac_disable_all_queues() which
stops the RX NAPI, but the RX DMA engine may still be running for a
short window before stmmac_stop_all_dma() takes effect. During that
window the hardware can write incoming frames into the buffers pointed
to by the RX descriptors and write back the descriptors (clearing the
OWN bit, updating length/status). Because NAPI is already disabled,
the driver never refills these descriptors, so the RX ring is left in
a "consumed but not refilled" state with HW-written content in the
descriptor buffer-address fields.

On resume, stmmac_clear_descriptors() only re-arms the OWN bit (rdes3)
and does not repopulate the RX buffer address fields. As a result the
descriptors still contain whatever the hardware wrote back during the
suspend race. When the DMA is restarted, it dereferences these stale
addresses and triggers a fatal bus error.

Fix this by treating the RX ring the same way as on close/open around
a PM transition:

 - In stmmac_suspend(), after stmmac_stop_all_dma(), walk every RX
   queue and free its buffers via dma_free_rx_xskbufs() when an XSK
   pool is attached or dma_free_rx_skbufs() otherwise, then reset
   rx_q->buf_alloc_num and clear rx_q->xsk_pool so the queue state
   matches a freshly closed queue.

 - In stmmac_resume(), call init_dma_rx_desc_rings() before
   stmmac_reset_queues_param() so RX buffers are re-allocated and
   the descriptor buffer-address fields are properly repopulated
   before the DMA is restarted.

After this change, post-resume RX descriptors always reference freshly
allocated, driver-owned buffers, and the bus error no longer occurs.

Signed-off-by: Ding Hui <dinghui@lixiang.com>
---
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 24 +++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 3591755ea30b..8ed43187cf20 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -8176,6 +8176,9 @@ int stmmac_suspend(struct device *dev)
 {
 	struct net_device *ndev = dev_get_drvdata(dev);
 	struct stmmac_priv *priv = netdev_priv(ndev);
+	u32 rx_count = priv->plat->rx_queues_to_use;
+	struct stmmac_rx_queue *rx_q;
+	u32 queue;
 	u8 chan;
 
 	if (!ndev || !netif_running(ndev))
@@ -8198,6 +8201,19 @@ int stmmac_suspend(struct device *dev)
 	/* Stop TX/RX DMA */
 	stmmac_stop_all_dma(priv);
 
+	/* Free RX queue resources */
+	for (queue = 0; queue < rx_count; queue++) {
+		rx_q = &priv->dma_conf.rx_queue[queue];
+
+		/* Release the DMA RX socket buffers */
+		if (rx_q->xsk_pool)
+			dma_free_rx_xskbufs(priv, &priv->dma_conf, queue);
+		else
+			dma_free_rx_skbufs(priv, &priv->dma_conf, queue);
+		rx_q->buf_alloc_num = 0;
+		rx_q->xsk_pool = NULL;
+	}
+
 	stmmac_legacy_serdes_power_down(priv);
 
 	/* Enable Power down mode by programming the PMT regs */
@@ -8316,6 +8332,14 @@ int stmmac_resume(struct device *dev)
 
 	mutex_lock(&priv->lock);
 
+	ret = init_dma_rx_desc_rings(ndev, &priv->dma_conf, GFP_KERNEL);
+	if (ret < 0) {
+		netdev_err(priv->dev, "%s: rx dma desc rings init failed\n", __func__);
+		mutex_unlock(&priv->lock);
+		rtnl_unlock();
+		return ret;
+	}
+
 	stmmac_reset_queues_param(priv);
 
 	stmmac_free_tx_skbufs(priv);
-- 
2.34.1


