Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8E75CA5FA5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 12:30:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=OdWMiN2jy8drBuF4VcdQsXqyjFoMik5zdyy8hzyUDhs=; b=3UGsLQS9xnC9SpO47EKesNE2oT
	CyhkWypcEyPONOzM5wggC0mBoZfuLOgfW7/KIn4VaRqmTnY07Io0XCGOgnW94AT4RSLlr+h0zj8VU
	3AA31EyQ859MTIfAlzDrGzSH0IgxU6wWS6fTnx5IIYUN5Ip7h1rULzCCFDQ5X6e2/XEbE4iZzFslL
	XYjq5FbLlYifQt25cN0hqExR8KNhvGsLY8qKvkE7wSpYu8IsYXhlxH6cOuuBp7uafMi3GiuVu9dK7
	NGXYe/0UNTxIVoFVqAbhcBHnBwfoDRpoTa7Y1t10rd+are3DhKHHVJ5M/zLC4o+vl+6QOi9gj1QoA
	9PGXV8Ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBWyf-00000003XCQ-23g9;
	Tue, 29 Sep 2026 12:30:33 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBWya-00000003XBb-3N8D
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 12:30:28 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 8D672402E3;
	Tue, 29 Sep 2026 12:30:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15C231F000FF;
	Tue, 29 Sep 2026 12:30:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790685028;
	bh=OdWMiN2jy8drBuF4VcdQsXqyjFoMik5zdyy8hzyUDhs=;
	h=From:To:Cc:Subject:Date;
	b=XqBJnEEbUt3oKV0abXmH2olHDmY+UxSrhGgS48apvMIfxMxajtovtT1nl8H3oacX4
	 Wxf8KGySXgKIMW6IlIfbfYBb9+yRU7EIYGZFMzJY5ynMgFtNlwodTCM4XlEIwuznNz
	 o9OcT8LSA5u7H2JuXdlSbikTAIY1LquP8XR8j64Gcxrl1L31EEFpLShB/fCHF/gFek
	 G+E+hSI0Xop/7Z4MnIvFRn+u6wFCDlsH/OQYvBUu4brLeep0G+7D0jCVuXfzqvSgRy
	 hWXEQiUlJINKA+FlIaDmxgYJGMJo93bjcBRcPxjh5mHhb9nRgg6y+hhCoxaNXAqnQp
	 YhGjNrTvQY4jA==
From: Jisheng Zhang <jszhang@kernel.org>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] net: stmmac: Disable unsolicited checksum insertion for AF_XDP TX
Date: Tue, 29 Sep 2026 20:10:32 +0800
Message-ID: <20260929121032.20835-1-jszhang@kernel.org>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

stmmac enables TX checksum insertion for every AF_XDP packet on queues
that support it. The driver does not implement tmo_request_checksum(), so
it enables the offload regardless of whether the application requested it
and ignores the requested checksum offsets.

Disable checksum insertion in the AF_XDP TX path. Applications must supply
complete checksums until the driver can honor AF_XDP checksum metadata.

Fixes: 132c32ee5bc0 ("net: stmmac: Add TX via XDP zero-copy socket")
Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 8fe75b00974f..2db862f5abdb 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -2683,7 +2683,6 @@ static bool stmmac_xdp_xmit_zc(struct stmmac_priv *priv, u32 queue, u32 budget)
 	struct netdev_queue *nq = netdev_get_tx_queue(priv->dev, queue);
 	struct stmmac_tx_queue *tx_q = &priv->dma_conf.tx_queue[queue];
 	struct stmmac_txq_stats *txq_stats = &priv->xstats.txq_stats[queue];
-	bool csum = !priv->plat->tx_queues_cfg[queue].coe_unsupported;
 	struct xsk_buff_pool *pool = tx_q->xsk_pool;
 	unsigned int entry = tx_q->cur_tx;
 	struct dma_desc *tx_desc = NULL;
@@ -2762,7 +2761,7 @@ static bool stmmac_xdp_xmit_zc(struct stmmac_priv *priv, u32 queue, u32 budget)
 		}
 
 		stmmac_prepare_tx_desc(priv, tx_desc, 1, xdp_desc.len,
-				       csum, priv->descriptor_mode, true, true,
+				       false, priv->descriptor_mode, true, true,
 				       xdp_desc.len);
 
 		stmmac_enable_dma_transmission(priv, priv->ioaddr, queue);
-- 
2.53.0


