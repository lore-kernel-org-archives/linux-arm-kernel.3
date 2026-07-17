Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B4FEC4450A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 02:23:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=a3JqH5R6aAe2D3XZtgdrEzInTdqObFpNQmvDf5kqSx0=; b=tPpayLQHtJh9cjB0/BNA71OWnx
	rX9Co+Ii2KaUeAsnKAx+9jRhlHHSEnb+DgEZA0vseKdw7I9uWDCgBOBIxwQ5AxpXaWYGwL8/eYk95
	NNNt0XZosUQ9b6X6hyjozgT8VvoAUZ6+dcYvLhGs4O//i4vHIb17ViFI0FWpULcRz3ysU+C8XTN+j
	RBiqi/hPuQPEJafQTQOsqp3vVkX0y6Bt8SrxvUhacso68lZ7j9HKEuc8tBbT1lm01BxFqzx0P69pG
	ios03Z+G9/2J3BHGOekDpulrzaaVZAhumZOLFJX6b02mwqHZ3j+c1cUOI0yOiFmDnq64h4ESShHa9
	nayIvYXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkYEm-00000000xqG-23Ti;
	Fri, 17 Jul 2026 02:23:40 +0000
Received: from out-179.mta0.migadu.com ([2001:41d0:1004:224b::b3])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkYEk-00000000xpE-1Lf6;
	Fri, 17 Jul 2026 02:23:39 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1784255012;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=a3JqH5R6aAe2D3XZtgdrEzInTdqObFpNQmvDf5kqSx0=;
	b=fZE2HN0AXFnIX6zXdr5iF/QYuWVyQHLknV56DlJmgswEISfHL6OEENaUO0iF3JjWJNGn6g
	jKgqlU2HoHyJZRGwYwF0wIsL5CizeeOLy/JJ8YA4/7/4bTaKol72aK76WqgMQXL9mzUF1O
	Cn8cExAPODYUR1svwU9jKd2iJzqt+x8=
From: Chenguang Zhao <chenguang.zhao@linux.dev>
To: nbd@nbd.name,
	lorenzo@kernel.org,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com
Cc: netdev@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	chenguang.zhao@linux.dev,
	Chenguang Zhao <zhaochenguang@kylinos.cn>
Subject: [PATCH net] net: ethernet: mtk_eth_soc: pass eth to mtk_handle_irq_rx in poll_controller
Date: Fri, 17 Jul 2026 10:23:39 +0800
Message-Id: <20260717022339.301914-1-chenguang.zhao@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_192338_601034_17B0AA80 
X-CRM114-Status: UNSURE (   7.32  )
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

From: Chenguang Zhao <zhaochenguang@kylinos.cn>

mtk_handle_irq_rx expects a struct mtk_eth * (matching the request_irq
cookie), but mtk_poll_controller incorrectly passed the net_device *.
Calling ndo_poll_controller with CONFIG_NET_POLL_CONTROLLER enabled
would then crash.
---
 drivers/net/ethernet/mediatek/mtk_eth_soc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
index 5d291e50a47b..351444fb4871 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
@@ -3467,7 +3467,7 @@ static void mtk_poll_controller(struct net_device *dev)
 
 	mtk_tx_irq_disable(eth, MTK_TX_DONE_INT);
 	mtk_rx_irq_disable(eth, eth->soc->rx.irq_done_mask);
-	mtk_handle_irq_rx(eth->irq[MTK_FE_IRQ_RX], dev);
+	mtk_handle_irq_rx(eth->irq[MTK_FE_IRQ_RX], eth);
 	mtk_tx_irq_enable(eth, MTK_TX_DONE_INT);
 	mtk_rx_irq_enable(eth, eth->soc->rx.irq_done_mask);
 }
-- 
2.25.1


