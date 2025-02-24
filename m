Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0626C021A4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Feb 2025 11:25:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KlNindiLiNDrAm9cNMK4Q1NQ8biRJ2A3jRBYZMn6i+M=; b=lDeD4zz4BJAGI7ebjIZ2kRoM3n
	Xu3XK2lH4ixujwJfET55FJ2dmydeAXdDnANmcxd1LiCdohT/m32oKMD2i8Rww3dJOH5nJmAF2MhH6
	x9v9FWGwVVsiu0UAe9BlSFuvrdZOIAWaSs3L4i/f40517m8qhTk1Xvm7UnkPtXNyEvAfheu8PDe/Z
	81xjEfW7bGandGINeeSHvyNiY+iowPEVUGyjt86/jMkoYM+SAHK1eLxym55nHdYFxZUB1xFxVz8/U
	xpamzRDb030pqQ8AhGzK5rQHV8jaBk3ucEKZxDwiXXyiOUHAK+Bh8EWlQ2P+qMXtlxJXPaw6zac/z
	zUBsYq1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmWaN-0000000DMhs-3dMP;
	Mon, 24 Feb 2025 11:25:19 +0000
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmWIK-0000000DHKr-2cY7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Feb 2025 11:06:41 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 51OB1DAD1472233
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 24 Feb 2025 05:01:13 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1740394873;
	bh=KlNindiLiNDrAm9cNMK4Q1NQ8biRJ2A3jRBYZMn6i+M=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=PYNqGX4WxmMAY8lbFER3qkomd+86glllFiK1aeZh4GJN8CvRc8BHtUy0774n7dJJ0
	 nXqKlEUwPLY6WP9nlGtf12XaZQg2Si/2sl2qvf6LCvAEfYMI1KnoF1ClERUG494zbw
	 AzX16fkvQah9/c1NjYtj9/xWaMv6iUVoMxvYdCI8=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 51OB1Dtf000969
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 24 Feb 2025 05:01:13 -0600
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 24
 Feb 2025 05:01:12 -0600
Received: from fllvsmtp8.itg.ti.com (10.64.41.158) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 24 Feb 2025 05:01:12 -0600
Received: from lelv0854.itg.ti.com (lelv0854.itg.ti.com [10.181.64.140])
	by fllvsmtp8.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51OB1C6k093085;
	Mon, 24 Feb 2025 05:01:12 -0600
Received: from localhost (meghana-pc.dhcp.ti.com [10.24.69.13] (may be forged))
	by lelv0854.itg.ti.com (8.14.7/8.14.7) with ESMTP id 51OB1Bib002041;
	Mon, 24 Feb 2025 05:01:12 -0600
From: Meghana Malladi <m-malladi@ti.com>
To: <rogerq@kernel.org>, <danishanwar@ti.com>, <pabeni@redhat.com>,
        <kuba@kernel.org>, <edumazet@google.com>, <davem@davemloft.net>,
        <andrew+netdev@lunn.ch>
CC: <bpf@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <netdev@vger.kernel.org>,
        <u.kleine-koenig@baylibre.com>, <matthias.schiffer@ew.tq-group.com>,
        <dan.carpenter@linaro.org>, <m-malladi@ti.com>,
        <schnelle@linux.ibm.com>, <diogo.ivo@siemens.com>,
        <glaroque@baylibre.com>, <macro@orcam.me.uk>,
        <john.fastabend@gmail.com>, <hawk@kernel.org>, <daniel@iogearbox.net>,
        <ast@kernel.org>, <srk@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>
Subject: [PATCH net-next v3 2/3] net: ti: icssg-prueth: introduce and use prueth_swdata struct for SWDATA
Date: Mon, 24 Feb 2025 16:31:01 +0530
Message-ID: <20250224110102.1528552-3-m-malladi@ti.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250224110102.1528552-1-m-malladi@ti.com>
References: <20250224110102.1528552-1-m-malladi@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_030640_790665_6D5F0F36 
X-CRM114-Status: GOOD (  22.31  )
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

From: Roger Quadros <rogerq@kernel.org>

We have different cases for SWDATA (skb, page, cmd, etc)
so it is better to have a dedicated data structure for that.
We can embed the type field inside the struct and use it
to interpret the data in completion handlers.

Increase SWDATA size to 48 so we have some room to add
more data if required.

Signed-off-by: Roger Quadros <rogerq@kernel.org>
Signed-off-by: MD Danish Anwar <danishanwar@ti.com>
Signed-off-by: Meghana Malladi <m-malladi@ti.com>
---
Changes since v2 (v3-v2):
- Fix leaking tx descriptor in emac_tx_complete_packets()
- Free rx descriptor if swdata type is not page in emac_rx_packet()
- Revert back the size of PRUETH_NAV_SW_DATA_SIZE
- Use build time check for prueth_swdata size
- re-write prueth_swdata to have enum type as first member in the struct
and prueth_data union embedded in the struct

All the above changes have been suggested by Roger Quadros <rogerq@kernel.org>

 drivers/net/ethernet/ti/icssg/icssg_common.c  | 52 +++++++++++++------
 drivers/net/ethernet/ti/icssg/icssg_prueth.c  |  3 ++
 drivers/net/ethernet/ti/icssg/icssg_prueth.h  | 16 ++++++
 .../net/ethernet/ti/icssg/icssg_prueth_sr1.c  |  4 +-
 4 files changed, 57 insertions(+), 18 deletions(-)

diff --git a/drivers/net/ethernet/ti/icssg/icssg_common.c b/drivers/net/ethernet/ti/icssg/icssg_common.c
index acbb79ad8b0c..01eeabe83eff 100644
--- a/drivers/net/ethernet/ti/icssg/icssg_common.c
+++ b/drivers/net/ethernet/ti/icssg/icssg_common.c
@@ -136,12 +136,12 @@ int emac_tx_complete_packets(struct prueth_emac *emac, int chn,
 	struct net_device *ndev = emac->ndev;
 	struct cppi5_host_desc_t *desc_tx;
 	struct netdev_queue *netif_txq;
+	struct prueth_swdata *swdata;
 	struct prueth_tx_chn *tx_chn;
 	unsigned int total_bytes = 0;
 	struct sk_buff *skb;
 	dma_addr_t desc_dma;
 	int res, num_tx = 0;
-	void **swdata;
 
 	tx_chn = &emac->tx_chns[chn];
 
@@ -163,12 +163,19 @@ int emac_tx_complete_packets(struct prueth_emac *emac, int chn,
 		swdata = cppi5_hdesc_get_swdata(desc_tx);
 
 		/* was this command's TX complete? */
-		if (emac->is_sr1 && *(swdata) == emac->cmd_data) {
+		if (emac->is_sr1 && (void *)(swdata) == emac->cmd_data) {
 			prueth_xmit_free(tx_chn, desc_tx);
 			continue;
 		}
 
-		skb = *(swdata);
+		if (swdata->type != PRUETH_SWDATA_SKB) {
+			netdev_err(ndev, "tx_complete: invalid swdata type %d\n", swdata->type);
+			prueth_xmit_free(tx_chn, desc_tx);
+			budget++;
+			continue;
+		}
+
+		skb = swdata->data.skb;
 		prueth_xmit_free(tx_chn, desc_tx);
 
 		ndev = skb->dev;
@@ -472,9 +479,9 @@ int prueth_dma_rx_push_mapped(struct prueth_emac *emac,
 {
 	struct net_device *ndev = emac->ndev;
 	struct cppi5_host_desc_t *desc_rx;
+	struct prueth_swdata *swdata;
 	dma_addr_t desc_dma;
 	dma_addr_t buf_dma;
-	void **swdata;
 
 	buf_dma = page_pool_get_dma_addr(page) + PRUETH_HEADROOM;
 	desc_rx = k3_cppi_desc_pool_alloc(rx_chn->desc_pool);
@@ -490,7 +497,8 @@ int prueth_dma_rx_push_mapped(struct prueth_emac *emac,
 	cppi5_hdesc_attach_buf(desc_rx, buf_dma, buf_len, buf_dma, buf_len);
 
 	swdata = cppi5_hdesc_get_swdata(desc_rx);
-	*swdata = page;
+	swdata->type = PRUETH_SWDATA_PAGE;
+	swdata->data.page = page;
 
 	return k3_udma_glue_push_rx_chn(rx_chn->rx_chn, PRUETH_RX_FLOW_DATA,
 					desc_rx, desc_dma);
@@ -539,11 +547,11 @@ static int emac_rx_packet(struct prueth_emac *emac, u32 flow_id)
 	u32 buf_dma_len, pkt_len, port_id = 0;
 	struct net_device *ndev = emac->ndev;
 	struct cppi5_host_desc_t *desc_rx;
+	struct prueth_swdata *swdata;
 	dma_addr_t desc_dma, buf_dma;
 	struct page *page, *new_page;
 	struct page_pool *pool;
 	struct sk_buff *skb;
-	void **swdata;
 	u32 *psdata;
 	void *pa;
 	int ret;
@@ -561,7 +569,13 @@ static int emac_rx_packet(struct prueth_emac *emac, u32 flow_id)
 
 	desc_rx = k3_cppi_desc_pool_dma2virt(rx_chn->desc_pool, desc_dma);
 	swdata = cppi5_hdesc_get_swdata(desc_rx);
-	page = *swdata;
+	if (swdata->type != PRUETH_SWDATA_PAGE) {
+		netdev_err(ndev, "rx_pkt: invalid swdata->type %d\n", swdata->type);
+		k3_cppi_desc_pool_free(rx_chn->desc_pool, desc_rx);
+		return 0;
+	}
+
+	page = swdata->data.page;
 	page_pool_dma_sync_for_cpu(pool, page, 0, PAGE_SIZE);
 	cppi5_hdesc_get_obuf(desc_rx, &buf_dma, &buf_dma_len);
 	k3_udma_glue_rx_cppi5_to_dma_addr(rx_chn->rx_chn, &buf_dma);
@@ -626,15 +640,18 @@ static void prueth_rx_cleanup(void *data, dma_addr_t desc_dma)
 {
 	struct prueth_rx_chn *rx_chn = data;
 	struct cppi5_host_desc_t *desc_rx;
+	struct prueth_swdata *swdata;
 	struct page_pool *pool;
 	struct page *page;
-	void **swdata;
 
 	pool = rx_chn->pg_pool;
 	desc_rx = k3_cppi_desc_pool_dma2virt(rx_chn->desc_pool, desc_dma);
 	swdata = cppi5_hdesc_get_swdata(desc_rx);
-	page = *swdata;
-	page_pool_recycle_direct(pool, page);
+	if (swdata->type == PRUETH_SWDATA_PAGE) {
+		page = swdata->data.page;
+		page_pool_recycle_direct(pool, page);
+	}
+
 	k3_cppi_desc_pool_free(rx_chn->desc_pool, desc_rx);
 }
 
@@ -671,13 +688,13 @@ enum netdev_tx icssg_ndo_start_xmit(struct sk_buff *skb, struct net_device *ndev
 	struct prueth_emac *emac = netdev_priv(ndev);
 	struct prueth *prueth = emac->prueth;
 	struct netdev_queue *netif_txq;
+	struct prueth_swdata *swdata;
 	struct prueth_tx_chn *tx_chn;
 	dma_addr_t desc_dma, buf_dma;
 	u32 pkt_len, dst_tag_id;
 	int i, ret = 0, q_idx;
 	bool in_tx_ts = 0;
 	int tx_ts_cookie;
-	void **swdata;
 	u32 *epib;
 
 	pkt_len = skb_headlen(skb);
@@ -739,7 +756,8 @@ enum netdev_tx icssg_ndo_start_xmit(struct sk_buff *skb, struct net_device *ndev
 	k3_udma_glue_tx_dma_to_cppi5_addr(tx_chn->tx_chn, &buf_dma);
 	cppi5_hdesc_attach_buf(first_desc, buf_dma, pkt_len, buf_dma, pkt_len);
 	swdata = cppi5_hdesc_get_swdata(first_desc);
-	*swdata = skb;
+	swdata->type = PRUETH_SWDATA_SKB;
+	swdata->data.skb = skb;
 
 	/* Handle the case where skb is fragmented in pages */
 	cur_desc = first_desc;
@@ -842,15 +860,17 @@ static void prueth_tx_cleanup(void *data, dma_addr_t desc_dma)
 {
 	struct prueth_tx_chn *tx_chn = data;
 	struct cppi5_host_desc_t *desc_tx;
+	struct prueth_swdata *swdata;
 	struct sk_buff *skb;
-	void **swdata;
 
 	desc_tx = k3_cppi_desc_pool_dma2virt(tx_chn->desc_pool, desc_dma);
 	swdata = cppi5_hdesc_get_swdata(desc_tx);
-	skb = *(swdata);
-	prueth_xmit_free(tx_chn, desc_tx);
+	if (swdata->type == PRUETH_SWDATA_SKB) {
+		skb = swdata->data.skb;
+		dev_kfree_skb_any(skb);
+	}
 
-	dev_kfree_skb_any(skb);
+	prueth_xmit_free(tx_chn, desc_tx);
 }
 
 irqreturn_t prueth_rx_irq(int irq, void *dev_id)
diff --git a/drivers/net/ethernet/ti/icssg/icssg_prueth.c b/drivers/net/ethernet/ti/icssg/icssg_prueth.c
index 00ed97860547..3ff8c322f9d9 100644
--- a/drivers/net/ethernet/ti/icssg/icssg_prueth.c
+++ b/drivers/net/ethernet/ti/icssg/icssg_prueth.c
@@ -1522,6 +1522,9 @@ static int prueth_probe(struct platform_device *pdev)
 
 	np = dev->of_node;
 
+	BUILD_BUG_ON_MSG((sizeof(struct prueth_swdata) > PRUETH_NAV_SW_DATA_SIZE),
+			 "insufficient SW_DATA size");
+
 	prueth = devm_kzalloc(dev, sizeof(*prueth), GFP_KERNEL);
 	if (!prueth)
 		return -ENOMEM;
diff --git a/drivers/net/ethernet/ti/icssg/icssg_prueth.h b/drivers/net/ethernet/ti/icssg/icssg_prueth.h
index c7b906de18af..3bbabd007129 100644
--- a/drivers/net/ethernet/ti/icssg/icssg_prueth.h
+++ b/drivers/net/ethernet/ti/icssg/icssg_prueth.h
@@ -136,6 +136,22 @@ struct prueth_rx_chn {
 	struct page_pool *pg_pool;
 };
 
+enum prueth_swdata_type {
+	PRUETH_SWDATA_INVALID = 0,
+	PRUETH_SWDATA_SKB,
+	PRUETH_SWDATA_PAGE,
+	PRUETH_SWDATA_CMD,
+};
+
+struct prueth_swdata {
+	enum prueth_swdata_type type;
+	union prueth_data {
+		struct sk_buff *skb;
+		struct page *page;
+		u32 cmd;
+	} data;
+};
+
 /* There are 4 Tx DMA channels, but the highest priority is CH3 (thread 3)
  * and lower three are lower priority channels or threads.
  */
diff --git a/drivers/net/ethernet/ti/icssg/icssg_prueth_sr1.c b/drivers/net/ethernet/ti/icssg/icssg_prueth_sr1.c
index aeeb8a50376b..7bbe0808b3ec 100644
--- a/drivers/net/ethernet/ti/icssg/icssg_prueth_sr1.c
+++ b/drivers/net/ethernet/ti/icssg/icssg_prueth_sr1.c
@@ -275,10 +275,10 @@ static struct sk_buff *prueth_process_rx_mgm(struct prueth_emac *emac,
 	struct net_device *ndev = emac->ndev;
 	struct cppi5_host_desc_t *desc_rx;
 	struct page *page, *new_page;
+	struct prueth_swdata *swdata;
 	dma_addr_t desc_dma, buf_dma;
 	u32 buf_dma_len, pkt_len;
 	struct sk_buff *skb;
-	void **swdata;
 	void *pa;
 	int ret;
 
@@ -301,7 +301,7 @@ static struct sk_buff *prueth_process_rx_mgm(struct prueth_emac *emac,
 	}
 
 	swdata = cppi5_hdesc_get_swdata(desc_rx);
-	page = *swdata;
+	page = swdata->data.page;
 	cppi5_hdesc_get_obuf(desc_rx, &buf_dma, &buf_dma_len);
 	pkt_len = cppi5_hdesc_get_pktlen(desc_rx);
 
-- 
2.43.0


