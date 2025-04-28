Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFCB9C369D5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Apr 2025 12:44:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uI+faJIxceA72XkODz4Mw86ruNESeEOpXr0xnsfEFzM=; b=iXrsrXEpA+SbtA5cymSyrtd7li
	hNk94d9KAMo4gVti+RpbeOi/7Ur8U28DFQahlIjMG2ZXOdWRLYUGdFtbWAE7UBQtZvpZQUxaz6cKa
	o6o+93wWbT0vm92iO6dD4XqDMs3DgeFNAm0zy09/U68hlaONdY6pnPXpSvKTwhFYzxSsTS3HXkrI9
	nrOPoeUkIxxkcIkeT2Jbi+ZybMgTcpMs76V8hx8k7nP8DByw95nfgsXd95eAnhqzbih2LPMmgNnHr
	b+1HGvwvBF/X9Y1X3kdxZXhNQYuvfCcl46DGnqmBKiWm282F8i4p43bLQghe4vWXN4syw/GIiU2jm
	IRir3mZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9Nq3-00000006F6B-1dVu;
	Mon, 28 Apr 2025 12:43:59 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9NEm-000000065yT-0Txx
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Apr 2025 12:05:30 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53SC5BI83531559
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 28 Apr 2025 07:05:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745841911;
	bh=uI+faJIxceA72XkODz4Mw86ruNESeEOpXr0xnsfEFzM=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=rPAT4xJqh+Yb/tPaodYVGiunw2ySTAXQfxfUMXG2GjYNMrmgfFPGYen0b8lL5f5GH
	 gI+OdPgRmnVJvxEZPri39iy6iX1d9HWwGmZbzduZ1F0HrDUqBVzsVi8M6W9PSnSH6P
	 LfJS3iUmMX8WnfXpSWWOCYecAF6cr/5zxgJynFQs=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53SC5BO1038306
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 28 Apr 2025 07:05:11 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 28
 Apr 2025 07:05:11 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 28 Apr 2025 07:05:11 -0500
Received: from lelv0854.itg.ti.com (lelv0854.itg.ti.com [10.181.64.140])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53SC5Abt009667;
	Mon, 28 Apr 2025 07:05:10 -0500
Received: from localhost (meghana-pc.dhcp.ti.com [10.24.69.13] (may be forged))
	by lelv0854.itg.ti.com (8.14.7/8.14.7) with ESMTP id 53SC59ag026337;
	Mon, 28 Apr 2025 07:05:10 -0500
From: Meghana Malladi <m-malladi@ti.com>
To: <dan.carpenter@linaro.org>, <m-malladi@ti.com>, <john.fastabend@gmail.com>,
        <hawk@kernel.org>, <daniel@iogearbox.net>, <ast@kernel.org>,
        <pabeni@redhat.com>, <kuba@kernel.org>, <edumazet@google.com>,
        <davem@davemloft.net>, <andrew+netdev@lunn.ch>
CC: <bpf@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <netdev@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <srk@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
        Roger Quadros
	<rogerq@kernel.org>, <danishanwar@ti.com>
Subject: [PATCH net 2/4] net: ti: icssg-prueth: Report BQL before sending XDP packets
Date: Mon, 28 Apr 2025 17:34:57 +0530
Message-ID: <20250428120459.244525-3-m-malladi@ti.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250428120459.244525-1-m-malladi@ti.com>
References: <20250428120459.244525-1-m-malladi@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_050528_253365_296D34AE 
X-CRM114-Status: GOOD (  12.87  )
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

When sending out any kind of traffic, it is essential that the driver
keeps reporting BQL of the number of bytes that have been sent so that
BQL can track the amount of data in the queue and prevents it from
overflowing. If BQL is not reported, the driver may continue sending
packets even when the queue is full, leading to packet loss, congestion
and decreased network performance. Currently this is missing in
emac_xmit_xdp_frame() and this patch fixes it.

Fixes: 62aa3246f462 ("net: ti: icssg-prueth: Add XDP support")
Signed-off-by: Meghana Malladi <m-malladi@ti.com>
---
 drivers/net/ethernet/ti/icssg/icssg_common.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/ti/icssg/icssg_common.c b/drivers/net/ethernet/ti/icssg/icssg_common.c
index b4be76e13a2f..4f45f2b6b67f 100644
--- a/drivers/net/ethernet/ti/icssg/icssg_common.c
+++ b/drivers/net/ethernet/ti/icssg/icssg_common.c
@@ -187,7 +187,6 @@ int emac_tx_complete_packets(struct prueth_emac *emac, int chn,
 			xdp_return_frame(xdpf);
 			break;
 		default:
-			netdev_err(ndev, "tx_complete: invalid swdata type %d\n", swdata->type);
 			prueth_xmit_free(tx_chn, desc_tx);
 			ndev->stats.tx_dropped++;
 			continue;
@@ -567,6 +566,7 @@ u32 emac_xmit_xdp_frame(struct prueth_emac *emac,
 {
 	struct cppi5_host_desc_t *first_desc;
 	struct net_device *ndev = emac->ndev;
+	struct netdev_queue *netif_txq;
 	struct prueth_tx_chn *tx_chn;
 	dma_addr_t desc_dma, buf_dma;
 	struct prueth_swdata *swdata;
@@ -620,12 +620,17 @@ u32 emac_xmit_xdp_frame(struct prueth_emac *emac,
 		swdata->data.xdpf = xdpf;
 	}
 
+	/* Report BQL before sending the packet */
+	netif_txq = netdev_get_tx_queue(ndev, tx_chn->id);
+	netdev_tx_sent_queue(netif_txq, xdpf->len);
+
 	cppi5_hdesc_set_pktlen(first_desc, xdpf->len);
 	desc_dma = k3_cppi_desc_pool_virt2dma(tx_chn->desc_pool, first_desc);
 
 	ret = k3_udma_glue_push_tx_chn(tx_chn->tx_chn, first_desc, desc_dma);
 	if (ret) {
 		netdev_err(ndev, "xdp tx: push failed: %d\n", ret);
+		netdev_tx_completed_queue(netif_txq, 1, xdpf->len);
 		goto drop_free_descs;
 	}
 
@@ -979,6 +984,7 @@ enum netdev_tx icssg_ndo_start_xmit(struct sk_buff *skb, struct net_device *ndev
 	ret = k3_udma_glue_push_tx_chn(tx_chn->tx_chn, first_desc, desc_dma);
 	if (ret) {
 		netdev_err(ndev, "tx: push failed: %d\n", ret);
+		netdev_tx_completed_queue(netif_txq, 1, pkt_len);
 		goto drop_free_descs;
 	}
 
-- 
2.43.0


