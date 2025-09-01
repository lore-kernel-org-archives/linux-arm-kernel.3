Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AD4ECA1002
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Sep 2025 11:27:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mezemkz3qEN85uCSR/gFF2SBsPuVzs2DVq2YLAEIpTk=; b=2T5euPxQLV1iWopHI4JQYZwGFd
	dw+cPR8nQWuA0wu2FyiOF2befvS/OJXMORcEjy1ORU2hhWEepPkYYkNqEClb1LE6grjdgbmPr425v
	VeMkUqdo62VDOogrfAV15dcfgjzNOLaFK9FmtYbtUmlla512bxmjycA1EvusHVercsDFmjEO708QS
	k4puIRA1E5fgI92nqv8xLHJ4aLr9qjh85oHpMmqL/cjzLGwgNRYsrtnNc/UrxQyEi6470Vnv7V0rX
	n3qCiD3xP1m9kjdwKsJsbnCWdJyC+dBsF0enALWxQQ/CdOLD7gAjBR90fUbtvViUqKNYyBN9jh/V2
	5AH1fvgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut2gn-0000000C3JS-2TNx;
	Mon, 01 Sep 2025 11:27:09 +0000
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut1Ni-0000000BqVX-2KJw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Sep 2025 10:03:24 +0000
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 581A2hKC2750352;
	Mon, 1 Sep 2025 05:02:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1756720963;
	bh=mezemkz3qEN85uCSR/gFF2SBsPuVzs2DVq2YLAEIpTk=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=TJDTQQw6EQGYrtTw5xVVhY0sBsTwrVU2ldCTMh5mmRn4/tBrdJCxy/EBjyQin6geV
	 sFPxwdbetib+LL9aMOYp4X09BeYcmA3digVKWNClazhDtAyCtAiinWl8i3Q6GWmu4k
	 y82chDfBMW3U4V2fb3jaQYlgIbN77hqO9J0gd11w=
Received: from DLEE106.ent.ti.com (dlee106.ent.ti.com [157.170.170.36])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 581A2hEb1467222
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Mon, 1 Sep 2025 05:02:43 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Mon, 1
 Sep 2025 05:02:42 -0500
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Mon, 1 Sep 2025 05:02:42 -0500
Received: from fllv0122.itg.ti.com (fllv0122.itg.ti.com [10.247.120.72])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 581A2gpJ159821;
	Mon, 1 Sep 2025 05:02:42 -0500
Received: from localhost (meghana-pc.dhcp.ti.com [10.24.69.13] (may be forged))
	by fllv0122.itg.ti.com (8.14.7/8.14.7) with ESMTP id 581A2fTE011172;
	Mon, 1 Sep 2025 05:02:41 -0500
From: Meghana Malladi <m-malladi@ti.com>
To: <namcao@linutronix.de>, <jacob.e.keller@intel.com>, <m-malladi@ti.com>,
        <christian.koenig@amd.com>, <sumit.semwal@linaro.org>,
        <sdf@fomichev.me>, <john.fastabend@gmail.com>, <hawk@kernel.org>,
        <daniel@iogearbox.net>, <ast@kernel.org>, <pabeni@redhat.com>,
        <kuba@kernel.org>, <edumazet@google.com>, <davem@davemloft.net>,
        <andrew+netdev@lunn.ch>
CC: <linaro-mm-sig@lists.linaro.org>, <dri-devel@lists.freedesktop.org>,
        <linux-media@vger.kernel.org>, <bpf@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <netdev@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <srk@ti.com>,
        Vignesh Raghavendra
	<vigneshr@ti.com>,
        Roger Quadros <rogerq@kernel.org>, <danishanwar@ti.com>
Subject: [PATCH net-next v2 3/6] net: ti: icssg-prueth: Add AF_XDP zero copy for TX
Date: Mon, 1 Sep 2025 15:32:24 +0530
Message-ID: <20250901100227.1150567-4-m-malladi@ti.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250901100227.1150567-1-m-malladi@ti.com>
References: <20250901100227.1150567-1-m-malladi@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_030322_694790_726A03F5 
X-CRM114-Status: GOOD (  24.56  )
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

Use xsk_qid to check if a given port+qid has been registered
for xsk zero copy and populate it inside tx channel xsk_pool.

If xsk_pool is set, get frames from the pool in NAPI
context and submit them to the Tx channel. Tx completion
is also handled in the NAPI context.

Signed-off-by: Meghana Malladi <m-malladi@ti.com>
---
 drivers/net/ethernet/ti/icssg/icssg_common.c | 122 ++++++++++++++++++-
 drivers/net/ethernet/ti/icssg/icssg_prueth.c |  16 +++
 drivers/net/ethernet/ti/icssg/icssg_prueth.h |   5 +
 3 files changed, 141 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/ti/icssg/icssg_common.c b/drivers/net/ethernet/ti/icssg/icssg_common.c
index 8a0ebe011960..8ff1707a2328 100644
--- a/drivers/net/ethernet/ti/icssg/icssg_common.c
+++ b/drivers/net/ethernet/ti/icssg/icssg_common.c
@@ -93,15 +93,91 @@ void prueth_ndev_del_tx_napi(struct prueth_emac *emac, int num)
 }
 EXPORT_SYMBOL_GPL(prueth_ndev_del_tx_napi);
 
+static int emac_xsk_xmit_zc(struct prueth_emac *emac,
+			    unsigned int q_idx)
+{
+	struct prueth_tx_chn *tx_chn = &emac->tx_chns[q_idx];
+	struct xsk_buff_pool *pool = tx_chn->xsk_pool;
+	struct net_device *ndev = emac->ndev;
+	struct cppi5_host_desc_t *host_desc;
+	dma_addr_t dma_desc, dma_buf;
+	struct prueth_swdata *swdata;
+	struct xdp_desc xdp_desc;
+	int num_tx = 0, pkt_len;
+	int descs_avail, ret;
+	u32 *epib;
+	int i;
+
+	descs_avail = k3_cppi_desc_pool_avail(tx_chn->desc_pool);
+	/* ensure that TX ring is not filled up by XDP, always MAX_SKB_FRAGS
+	 * will be available for normal TX path and queue is stopped there if
+	 * necessary
+	 */
+	if (descs_avail <= MAX_SKB_FRAGS)
+		return 0;
+
+	descs_avail -= MAX_SKB_FRAGS;
+
+	for (i = 0; i < descs_avail; i++) {
+		if (!xsk_tx_peek_desc(pool, &xdp_desc))
+			break;
+
+		dma_buf = xsk_buff_raw_get_dma(pool, xdp_desc.addr);
+		pkt_len = xdp_desc.len;
+		xsk_buff_raw_dma_sync_for_device(pool, dma_buf, pkt_len);
+
+		host_desc = k3_cppi_desc_pool_alloc(tx_chn->desc_pool);
+		if (unlikely(!host_desc))
+			break;
+
+		cppi5_hdesc_init(host_desc, CPPI5_INFO0_HDESC_EPIB_PRESENT,
+				 PRUETH_NAV_PS_DATA_SIZE);
+		cppi5_hdesc_set_pkttype(host_desc, 0);
+		epib = host_desc->epib;
+		epib[0] = 0;
+		epib[1] = 0;
+		cppi5_hdesc_set_pktlen(host_desc, pkt_len);
+		cppi5_desc_set_tags_ids(&host_desc->hdr, 0,
+					(emac->port_id | (q_idx << 8)));
+
+		k3_udma_glue_tx_dma_to_cppi5_addr(tx_chn->tx_chn, &dma_buf);
+		cppi5_hdesc_attach_buf(host_desc, dma_buf, pkt_len, dma_buf,
+				       pkt_len);
+
+		swdata = cppi5_hdesc_get_swdata(host_desc);
+		swdata->type = PRUETH_SWDATA_XSK;
+
+		dma_desc = k3_cppi_desc_pool_virt2dma(tx_chn->desc_pool,
+						      host_desc);
+		ret = k3_udma_glue_push_tx_chn(tx_chn->tx_chn,
+					       host_desc, dma_desc);
+
+		if (ret) {
+			ndev->stats.tx_errors++;
+			k3_cppi_desc_pool_free(tx_chn->desc_pool, host_desc);
+			break;
+		}
+
+		num_tx++;
+	}
+
+	xsk_tx_release(tx_chn->xsk_pool);
+	return num_tx;
+}
+
 void prueth_xmit_free(struct prueth_tx_chn *tx_chn,
 		      struct cppi5_host_desc_t *desc)
 {
 	struct cppi5_host_desc_t *first_desc, *next_desc;
 	dma_addr_t buf_dma, next_desc_dma;
 	u32 buf_dma_len;
+	struct prueth_swdata *swdata;
 
 	first_desc = desc;
 	next_desc = first_desc;
+	swdata = cppi5_hdesc_get_swdata(first_desc);
+	if (swdata->type == PRUETH_SWDATA_XSK)
+		goto free_pool;
 
 	cppi5_hdesc_get_obuf(first_desc, &buf_dma, &buf_dma_len);
 	k3_udma_glue_tx_cppi5_to_dma_addr(tx_chn->tx_chn, &buf_dma);
@@ -126,6 +202,7 @@ void prueth_xmit_free(struct prueth_tx_chn *tx_chn,
 		k3_cppi_desc_pool_free(tx_chn->desc_pool, next_desc);
 	}
 
+free_pool:
 	k3_cppi_desc_pool_free(tx_chn->desc_pool, first_desc);
 }
 EXPORT_SYMBOL_GPL(prueth_xmit_free);
@@ -139,7 +216,9 @@ int emac_tx_complete_packets(struct prueth_emac *emac, int chn,
 	struct prueth_swdata *swdata;
 	struct prueth_tx_chn *tx_chn;
 	unsigned int total_bytes = 0;
+	int xsk_frames_done = 0;
 	struct xdp_frame *xdpf;
+	unsigned int pkt_len;
 	struct sk_buff *skb;
 	dma_addr_t desc_dma;
 	int res, num_tx = 0;
@@ -176,6 +255,11 @@ int emac_tx_complete_packets(struct prueth_emac *emac, int chn,
 			total_bytes += xdpf->len;
 			xdp_return_frame(xdpf);
 			break;
+		case PRUETH_SWDATA_XSK:
+			pkt_len = cppi5_hdesc_get_pktlen(desc_tx);
+			dev_sw_netstats_tx_add(ndev, 1, pkt_len);
+			xsk_frames_done++;
+			break;
 		default:
 			prueth_xmit_free(tx_chn, desc_tx);
 			ndev->stats.tx_dropped++;
@@ -204,6 +288,18 @@ int emac_tx_complete_packets(struct prueth_emac *emac, int chn,
 		__netif_tx_unlock(netif_txq);
 	}
 
+	if (tx_chn->xsk_pool) {
+		if (xsk_frames_done)
+			xsk_tx_completed(tx_chn->xsk_pool, xsk_frames_done);
+
+		if (xsk_uses_need_wakeup(tx_chn->xsk_pool))
+			xsk_set_tx_need_wakeup(tx_chn->xsk_pool);
+
+		netif_txq = netdev_get_tx_queue(ndev, chn);
+		txq_trans_cond_update(netif_txq);
+		emac_xsk_xmit_zc(emac, chn);
+	}
+
 	return num_tx;
 }
 
@@ -212,7 +308,10 @@ static enum hrtimer_restart emac_tx_timer_callback(struct hrtimer *timer)
 	struct prueth_tx_chn *tx_chns =
 			container_of(timer, struct prueth_tx_chn, tx_hrtimer);
 
-	enable_irq(tx_chns->irq);
+	if (tx_chns->irq_disabled) {
+		tx_chns->irq_disabled = false;
+		enable_irq(tx_chns->irq);
+	}
 	return HRTIMER_NORESTART;
 }
 
@@ -235,7 +334,10 @@ static int emac_napi_tx_poll(struct napi_struct *napi_tx, int budget)
 				      ns_to_ktime(tx_chn->tx_pace_timeout_ns),
 				      HRTIMER_MODE_REL_PINNED);
 		} else {
-			enable_irq(tx_chn->irq);
+			if (tx_chn->irq_disabled) {
+				tx_chn->irq_disabled = false;
+				enable_irq(tx_chn->irq);
+			}
 		}
 	}
 
@@ -246,6 +348,7 @@ static irqreturn_t prueth_tx_irq(int irq, void *dev_id)
 {
 	struct prueth_tx_chn *tx_chn = dev_id;
 
+	tx_chn->irq_disabled = true;
 	disable_irq_nosync(irq);
 	napi_schedule(&tx_chn->napi_tx);
 
@@ -1030,6 +1133,7 @@ void prueth_tx_cleanup(void *data, dma_addr_t desc_dma)
 {
 	struct prueth_tx_chn *tx_chn = data;
 	struct cppi5_host_desc_t *desc_tx;
+	struct xsk_buff_pool *xsk_pool;
 	struct prueth_swdata *swdata;
 	struct xdp_frame *xdpf;
 	struct sk_buff *skb;
@@ -1046,6 +1150,10 @@ void prueth_tx_cleanup(void *data, dma_addr_t desc_dma)
 		xdpf = swdata->data.xdpf;
 		xdp_return_frame(xdpf);
 		break;
+	case PRUETH_SWDATA_XSK:
+		xsk_pool = tx_chn->xsk_pool;
+		xsk_tx_completed(xsk_pool, 1);
+		break;
 	default:
 		break;
 	}
@@ -1123,6 +1231,16 @@ int icssg_napi_rx_poll(struct napi_struct *napi_rx, int budget)
 }
 EXPORT_SYMBOL_GPL(icssg_napi_rx_poll);
 
+struct xsk_buff_pool *prueth_get_xsk_pool(struct prueth_emac *emac, u32 qid)
+{
+	if (!prueth_xdp_is_enabled(emac) ||
+	    emac->xsk_qid != qid)
+		return NULL;
+
+	return xsk_get_pool_from_qid(emac->ndev, qid);
+}
+EXPORT_SYMBOL_GPL(prueth_get_xsk_pool);
+
 static struct page_pool *prueth_create_page_pool(struct prueth_emac *emac,
 						 struct device *dma_dev,
 						 int size)
diff --git a/drivers/net/ethernet/ti/icssg/icssg_prueth.c b/drivers/net/ethernet/ti/icssg/icssg_prueth.c
index 942f78a9016b..5d2896f74987 100644
--- a/drivers/net/ethernet/ti/icssg/icssg_prueth.c
+++ b/drivers/net/ethernet/ti/icssg/icssg_prueth.c
@@ -754,6 +754,7 @@ static void prueth_destroy_txq(struct prueth_emac *emac)
 		k3_udma_glue_disable_tx_chn(emac->tx_chns[i].tx_chn);
 		napi_disable(&emac->tx_chns[i].napi_tx);
 		hrtimer_cancel(&emac->tx_chns[i].tx_hrtimer);
+		emac->tx_chns[i].xsk_pool = NULL;
 	}
 }
 
@@ -790,6 +791,7 @@ static int prueth_create_txq(struct prueth_emac *emac)
 		if (ret)
 			goto reset_tx_chan;
 		napi_enable(&emac->tx_chns[i].napi_tx);
+		emac->tx_chns[i].xsk_pool = prueth_get_xsk_pool(emac, i);
 	}
 	return 0;
 
@@ -859,6 +861,7 @@ static int emac_ndo_open(struct net_device *ndev)
 		return ret;
 	}
 
+	emac->xsk_qid = -EINVAL;
 	init_completion(&emac->cmd_complete);
 	ret = prueth_init_tx_chns(emac);
 	if (ret) {
@@ -1340,6 +1343,7 @@ static int emac_ndo_bpf(struct net_device *ndev, struct netdev_bpf *bpf)
 static int prueth_xsk_wakeup(struct net_device *ndev, u32 qid, u32 flags)
 {
 	struct prueth_emac *emac = netdev_priv(ndev);
+	struct prueth_tx_chn *tx_chn = &emac->tx_chns[qid];
 
 	if (!netif_running(ndev) || !netif_carrier_ok(ndev))
 		return -ENETDOWN;
@@ -1354,6 +1358,18 @@ static int prueth_xsk_wakeup(struct net_device *ndev, u32 qid, u32 flags)
 		return -EINVAL;
 	}
 
+	if (!tx_chn->xsk_pool) {
+		netdev_err(ndev, "XSK pool not registered for queue %d\n", qid);
+		return -EINVAL;
+	}
+
+	if (flags & XDP_WAKEUP_TX) {
+		if (!napi_if_scheduled_mark_missed(&tx_chn->napi_tx)) {
+			if (likely(napi_schedule_prep(&tx_chn->napi_tx)))
+				__napi_schedule(&tx_chn->napi_tx);
+		}
+	}
+
 	return 0;
 }
 
diff --git a/drivers/net/ethernet/ti/icssg/icssg_prueth.h b/drivers/net/ethernet/ti/icssg/icssg_prueth.h
index 2f64ec97b454..d8b068194fb6 100644
--- a/drivers/net/ethernet/ti/icssg/icssg_prueth.h
+++ b/drivers/net/ethernet/ti/icssg/icssg_prueth.h
@@ -128,6 +128,8 @@ struct prueth_tx_chn {
 	char name[32];
 	struct hrtimer tx_hrtimer;
 	unsigned long tx_pace_timeout_ns;
+	struct xsk_buff_pool *xsk_pool;
+	bool irq_disabled;
 };
 
 struct prueth_rx_chn {
@@ -148,6 +150,7 @@ enum prueth_swdata_type {
 	PRUETH_SWDATA_PAGE,
 	PRUETH_SWDATA_CMD,
 	PRUETH_SWDATA_XDPF,
+	PRUETH_SWDATA_XSK,
 };
 
 struct prueth_swdata {
@@ -507,4 +510,6 @@ static inline bool prueth_xdp_is_enabled(struct prueth_emac *emac)
 	return !!READ_ONCE(emac->xdp_prog);
 }
 
+struct xsk_buff_pool *prueth_get_xsk_pool(struct prueth_emac *emac, u32 qid);
+
 #endif /* __NET_TI_ICSSG_PRUETH_H */
-- 
2.43.0


