Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8BFCCD4F26
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 20 Jun 2026 21:45:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kyy19G3UAGpqNpZJRFtz4WPWcaaqaP4tOOJJnrBVNEo=; b=PNsjWe65zd87HrUSTVsgCXSpyr
	m5GBMHDb45Tx9/+sggv1gYJvzehJsePWcFAF4jCtRB3dbR5HYoTF1I9znUv2u/+jXfXmxd09cdbOS
	lfB/vGN5epx/L+BAi8xOBncCHbCp3AYhpzdn4ztqEi3S4aOhXnvR84he+ZBfAIRGvIrNX6TOuCRcM
	J1/4iasDG/30MmguxG24wr/R/pyHUUna5ZjH879JvTkqoK2NixiUNyIMbP10xA7CRkgRvv+piKE2z
	xYEFoCsram/jheA8UkfX+grE/TJTxLv/srRi4BRRgiup9LNa1xU6Ctcd62DrduXN7yeBhZ4Fv1tuX
	atLzCKOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wb3OA-00000003a2B-2n0O;
	Sat, 20 Jun 2026 21:38:06 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wb3O7-00000003a1q-3SHu
	for linux-arm-kernel@lists.infradead.org;
	Sat, 20 Jun 2026 21:38:04 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-4645995069bso1761114f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 20 Jun 2026 14:38:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781991482; x=1782596282; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kyy19G3UAGpqNpZJRFtz4WPWcaaqaP4tOOJJnrBVNEo=;
        b=j4Mqf17vWqMTiBWiThHA254BP+AS+LEPImehgC1E7NVm3JnQaOOenk+j0LlJfHq96o
         y+8i55mU+Zc8v9JAXwMUFUddR9QtN1xwQV2fgMiMWxXV3lC+ZMXnZHbop815sfsSlYPT
         pJ9kNpWr82CeMMZnDUwYmMgx6FXW4swVF5D/N3wH2tw9PtSigdYNv99cdNxvIJRq0zuh
         5fey1TtrhZYDpWFD3oY97IclmqTlIXDare+TxSLo4QDphanN/l9ywYVv7ru5YytZGGJ2
         +QJ+bwn6VpLJwuOu4kOmkt7fUZF1N03w+e7ub7YYt0biYBXAf6F7WBfqs08JM6HqATRY
         Ob7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781991482; x=1782596282;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kyy19G3UAGpqNpZJRFtz4WPWcaaqaP4tOOJJnrBVNEo=;
        b=bO/46WLbTkqrl2R3cR20/P+Y1VmWwdPSQe5jQgCjrZCyS2lNluINP6lB04Et6tpjXw
         qFBv2djruxHn5v3Ozr8SDBzjaW1TEPmAX3ZbJB8EGqUep2975FD2AxxPYky+jGKI8can
         4mUqpZjGxwLRZeLUcM5J0ShcLGY2ZLo6rZvb7uFwhEBp9qaNJBOOxOgQ7bb24yYejCNJ
         H6TgB0b/K2VHdWrXo9JozzAeVwORCZ/tfwKbUFVYYyY3FZ5NaoVhip00AkNxmgtVs5sY
         YjbDbYNWBGT4ndxYuP5hx7Oaz9Xx9pBZjSDIMXCT2rLVBsEw6q5biRaxVrYWdI3sfhqt
         E8zw==
X-Forwarded-Encrypted: i=1; AHgh+Roa5B8XeJBz+/58HXqYy7SX8IQErOpQFO7j3b6Vl2lUBUtjWO6cJhmAn6RQZ1UPLdvjYd8JOaVwTCUC2OmwcsLe@lists.infradead.org
X-Gm-Message-State: AOJu0Yy0RQ88hJXY0eJHHA2jWQ2blRT/Z6xUWrsjKXQ08fR7s2hf0YTj
	o4fk5JtQFKV3GzW+kaWdVTVj0OzLxfOPkw0fwvvckk5SWFJVwGxP+trV
X-Gm-Gg: AfdE7cnlRZ9459SUBRPjQUX3R8ERnir3ktQQsOSvAByHhKKhsNRhmqSWjzYu1rdmXqW
	tbk0bbauGm0OaeTkrFepzGZfo0obBbqGTcRI0a3gRg5D+QGf2YIFU0h/uCa257JOFbvBIMxomxR
	hqVvP5l75eGG5ql5pTk5QWfCBdmgXRLqSqygbO1rx1ZY6Ml1IDtJ5r30cQaRIly+i+20FPDW9h6
	cKSQx8ZhxPVFzHFjz7ac1CZtqeGvpoeR1tayqsM5LY2r+fY6GCc3LDDJS4LSb0ZehWLLayl9oon
	vZB4b4/YUfELVbD8uABOxhk25tyaTcloo6RKY20sXBRFos75Ipdnr9SR1L2ZBP7xCPMgpwfUxPo
	MNDN1cbo75LRu0QpUEvIVLMlk3Qy5bBQrUr3AEdxb6ZWkg266/TIO6x2cGvrwWMPIZbtUTzu6Ku
	EC2SnWEjSCpu6DxwQ3f4Zim9/2P4RjXTUY1Fd3anfsIyTubD6m0UwTES5aFhwtJdosTGUR3RNw
X-Received: by 2002:a05:6000:2b01:b0:45e:e1a4:c4c3 with SMTP id ffacd0b85a97d-4650043b85amr9392338f8f.15.1781991481496;
        Sat, 20 Jun 2026 14:38:01 -0700 (PDT)
Received: from dohko.chello.ie (188-141-5-72.dynamic.upc.ie. [188.141.5.72])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-466648c698dsm12128189f8f.16.2026.06.20.14.38.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Jun 2026 14:38:01 -0700 (PDT)
From: David Carlier <devnexen@gmail.com>
To: danishanwar@ti.com,
	rogerq@kernel.org,
	andrew+netdev@lunn.ch,
	netdev@vger.kernel.org
Cc: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	m-malladi@ti.com,
	hawk@kernel.org,
	john.fastabend@gmail.com,
	sdf@fomichev.me,
	ast@kernel.org,
	daniel@iogearbox.net,
	bpf@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	David Carlier <devnexen@gmail.com>
Subject: [PATCH net] net: ti: icssg-prueth: fix XDP_TX from the AF_XDP zero-copy RX path
Date: Sat, 20 Jun 2026 22:37:56 +0100
Message-ID: <20260620213756.87499-1-devnexen@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260620_143803_902836_10715D97 
X-CRM114-Status: GOOD (  13.13  )
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

On XDP_TX from the zero-copy RX path, emac_run_xdp() converts the xsk
buffer via xdp_convert_zc_to_xdp_frame(), which clones the data into a
fresh MEM_TYPE_PAGE_ORDER0 page that is not DMA mapped. Transmitting it
as PRUETH_TX_BUFF_TYPE_XDP_TX derives the DMA address with
page_pool_get_dma_addr(), reading an uninitialized page->dma_addr, so
the device DMAs from a bogus address (corrupt TX, or an IOMMU fault).

Pick the TX buffer type from the frame's memory type: keep
PRUETH_TX_BUFF_TYPE_XDP_TX for page_pool frames and use
PRUETH_TX_BUFF_TYPE_XDP_NDO for the cloned zero-copy frame. The
completion path already unmaps PRUETH_SWDATA_XDPF buffers.

Fixes: 7a64bb388df3 ("net: ti: icssg-prueth: Add AF_XDP zero copy for RX")
Cc: stable@vger.kernel.org
Signed-off-by: David Carlier <devnexen@gmail.com>
---
 drivers/net/ethernet/ti/icssg/icssg_common.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/ti/icssg/icssg_common.c b/drivers/net/ethernet/ti/icssg/icssg_common.c
index 82ddef9c17d5..302e700ea17d 100644
--- a/drivers/net/ethernet/ti/icssg/icssg_common.c
+++ b/drivers/net/ethernet/ti/icssg/icssg_common.c
@@ -804,6 +804,7 @@ EXPORT_SYMBOL_GPL(emac_xmit_xdp_frame);
  */
 static u32 emac_run_xdp(struct prueth_emac *emac, struct xdp_buff *xdp, u32 *len)
 {
+	enum prueth_tx_buff_type tx_buff_type;
 	struct net_device *ndev = emac->ndev;
 	struct netdev_queue *netif_txq;
 	int cpu = smp_processor_id();
@@ -826,11 +827,21 @@ static u32 emac_run_xdp(struct prueth_emac *emac, struct xdp_buff *xdp, u32 *len
 			goto drop;
 		}
 
+		/* In AF_XDP zero-copy mode xdp_convert_buff_to_frame()
+		 * clones the xsk buffer into a fresh MEM_TYPE_PAGE_ORDER0
+		 * page that is not DMA mapped. Such a frame must be mapped
+		 * via the NDO path; only a page pool-backed frame already
+		 * carries a usable page_pool DMA address.
+		 */
+		tx_buff_type = xdpf->mem_type == MEM_TYPE_PAGE_POOL ?
+				PRUETH_TX_BUFF_TYPE_XDP_TX :
+				PRUETH_TX_BUFF_TYPE_XDP_NDO;
+
 		q_idx = cpu % emac->tx_ch_num;
 		netif_txq = netdev_get_tx_queue(ndev, q_idx);
 		__netif_tx_lock(netif_txq, cpu);
 		result = emac_xmit_xdp_frame(emac, xdpf, q_idx,
-					     PRUETH_TX_BUFF_TYPE_XDP_TX);
+					     tx_buff_type);
 		__netif_tx_unlock(netif_txq);
 		if (result == ICSSG_XDP_CONSUMED) {
 			ndev->stats.tx_dropped++;
-- 
2.53.0


