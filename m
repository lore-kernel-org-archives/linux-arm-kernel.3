Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39DE9C02198
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 21:14:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=p2wzRXm7QAsa6gYMN0V+PftNHpoKOXWltWFcIe8BjkY=; b=zQoEYkLGFW3YHuGjuvVMTDGBJa
	aND7aEBtnbYBnziKZYUEsW1CPUTK7qUYudNA4SlmLGYgl0flrcVFp+MNbWf9PQVBuGNSVhneBRJjI
	CFTUpEWwNKRyT08ItxRLbwWkQbdQjMGDHOBNW4Veijn/5DdrycNTYiCjrBlsjZr9tc2426Vnz2eoi
	6TgbCinQQxhVVI/Ppb4LuELoPN+9bwig2I6jxdp51EYty9UrjSZq0dJxDK/52ZrPTT6LyAl4v1xjz
	SwARLXxtNrWb8qTQmU9tT4ZdiO7FLYxqje/ngAELSRiqMebbpn0G0MAgxhvh4IM3qJ3OzFx8l5np3
	ghPVpRlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tj31I-0000000GF00-1awI;
	Fri, 14 Feb 2025 21:14:44 +0000
Received: from out-184.mta0.migadu.com ([91.218.175.184])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tj2zp-0000000GEjS-4BxZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Feb 2025 21:13:15 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1739567588;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=p2wzRXm7QAsa6gYMN0V+PftNHpoKOXWltWFcIe8BjkY=;
	b=RwrD6OszqtC7ow6NcqQULCNirHcDdR6iHYzN5e7xfUOhhVU0+nwGBWn2N1eYq9nPU8a9mz
	lk8LCY5KTscMXErzxhk6Yd3WPyWMRlgTcwHTr5rfo5XA7mUdGzHHL1aESFG4GEOtDWqTFd
	pYf6xelsh2bxQrlGWsnsot2gmVVYOZ0=
From: Sean Anderson <sean.anderson@linux.dev>
To: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
	netdev@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	"David S . Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	linux-arm-kernel@lists.infradead.org,
	Eric Dumazet <edumazet@google.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Sean Anderson <sean.anderson@linux.dev>
Subject: [PATCH net-next] net: xilinx: axienet: Implement BQL
Date: Fri, 14 Feb 2025 16:12:52 -0500
Message-Id: <20250214211252.2615573-1-sean.anderson@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_131314_243019_F4AA11BF 
X-CRM114-Status: UNSURE (   8.75  )
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

Implement byte queue limits to allow queueing disciplines to account for
packets enqueued in the ring buffers but not yet transmitted.

Signed-off-by: Sean Anderson <sean.anderson@linux.dev>
---

 drivers/net/ethernet/xilinx/xilinx_axienet_main.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
index 0673b2694e4c..7406e00de0fb 100644
--- a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
+++ b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
@@ -1002,6 +1002,7 @@ static int axienet_tx_poll(struct napi_struct *napi, int budget)
 					&size, budget);
 
 	if (packets) {
+		netdev_completed_queue(ndev, packets, size);
 		u64_stats_update_begin(&lp->tx_stat_sync);
 		u64_stats_add(&lp->tx_packets, packets);
 		u64_stats_add(&lp->tx_bytes, size);
@@ -1125,6 +1126,7 @@ axienet_start_xmit(struct sk_buff *skb, struct net_device *ndev)
 	if (++new_tail_ptr >= lp->tx_bd_num)
 		new_tail_ptr = 0;
 	WRITE_ONCE(lp->tx_bd_tail, new_tail_ptr);
+	netdev_sent_queue(ndev, skb->len);
 
 	/* Start the transfer */
 	axienet_dma_out_addr(lp, XAXIDMA_TX_TDESC_OFFSET, tail_p);
@@ -1751,6 +1753,7 @@ static int axienet_stop(struct net_device *ndev)
 		dma_release_channel(lp->tx_chan);
 	}
 
+	netdev_reset_queue(ndev);
 	axienet_iow(lp, XAE_IE_OFFSET, 0);
 
 	if (lp->eth_irq > 0)
@@ -2676,6 +2679,7 @@ static void axienet_dma_err_handler(struct work_struct *work)
 			   ~(XAE_OPTION_TXEN | XAE_OPTION_RXEN));
 
 	axienet_dma_stop(lp);
+	netdev_reset_queue(ndev);
 
 	for (i = 0; i < lp->tx_bd_num; i++) {
 		cur_p = &lp->tx_bd_v[i];
-- 
2.35.1.1320.gc452695387.dirty


