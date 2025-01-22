Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DC42C02182
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jan 2025 12:54:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=je83FJj0IzC6LC+46p3LwRCIRvhSxGtnvZqDyTMWl9M=; b=T9Y8RVbGBe8knuESvoHk+JRP3/
	TNi5QxqVoSIswnBMS8CZoYEQzRfFbV2fE0EHkEjYeV1BFuXHCoONH2uOhrmHSW7/bDuhxDg4u8/Fl
	uX+5LBDAU+hSjREfUA3q0/YdTlQPrAnI3ExBj+s94tmQXOSMdLbOhKMDUNknZsQram/alUwwiGx8h
	9aNJqqOyfBH1FQ5bg2ZxAfmDjN6BD3X2gKZYoASkX3tYKXaQ+jh/3kxIddWp+wlo3WmS+h3gSkFYL
	esl9sSD8Md/tKrLPk74hoOtcmsHloqVZgfQvEVTZMPb1bbmBNbUBP+wRK+WQQ0DuM/167E+3nCImY
	x8af/R5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taaF2-0000000AD5f-23de;
	Wed, 22 Jan 2025 12:53:56 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taaCQ-0000000ACT9-3nry
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jan 2025 12:51:16 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 50MCoT5F1012945
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 22 Jan 2025 06:50:30 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1737550230;
	bh=je83FJj0IzC6LC+46p3LwRCIRvhSxGtnvZqDyTMWl9M=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=kwxSXACUUSIC3+wvZT4d3EcfVg6y4UzIJQ/pZs3q+GCpzcmFioV8Tq/wihAY2TmMR
	 qTb0vFhaKMYdqopUoqAstEw/KVNC8fuan1D4hxcI9HEo425oSXYDTgld2b1L9zVYxf
	 5iFNRj0Ewnh/eNCCmKiYKjB13NdinY3lWWWtjguQ=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 50MCoT6B024981
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 22 Jan 2025 06:50:29 -0600
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 22
 Jan 2025 06:50:29 -0600
Received: from fllvsmtp8.itg.ti.com (10.64.41.158) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 22 Jan 2025 06:50:29 -0600
Received: from fllv0122.itg.ti.com (fllv0122.itg.ti.com [10.247.120.72])
	by fllvsmtp8.itg.ti.com (8.15.2/8.15.2) with ESMTP id 50MCoT9Y076789;
	Wed, 22 Jan 2025 06:50:29 -0600
Received: from localhost (meghana-pc.dhcp.ti.com [10.24.69.13] (may be forged))
	by fllv0122.itg.ti.com (8.14.7/8.14.7) with ESMTP id 50MCoS6P026498;
	Wed, 22 Jan 2025 06:50:29 -0600
From: Meghana Malladi <m-malladi@ti.com>
To: <rogerq@kernel.org>, <danishanwar@ti.com>, <pabeni@redhat.com>,
        <kuba@kernel.org>, <edumazet@google.com>, <davem@davemloft.net>,
        <andrew+netdev@lunn.ch>
CC: <bpf@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <netdev@vger.kernel.org>,
        <robh@kernel.org>, <matthias.schiffer@ew.tq-group.com>,
        <m-malladi@ti.com>, <dan.carpenter@linaro.org>,
        <rdunlap@infradead.org>, <diogo.ivo@siemens.com>,
        <schnelle@linux.ibm.com>, <glaroque@baylibre.com>,
        <john.fastabend@gmail.com>, <hawk@kernel.org>, <daniel@iogearbox.net>,
        <ast@kernel.org>, <srk@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>
Subject: [PATCH net 1/3] net: ti: icssg-prueth: Use page_pool API for RX buffer allocation
Date: Wed, 22 Jan 2025 18:19:49 +0530
Message-ID: <20250122124951.3072410-2-m-malladi@ti.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250122124951.3072410-1-m-malladi@ti.com>
References: <20250122124951.3072410-1-m-malladi@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250122_045115_036322_490D6D90 
X-CRM114-Status: GOOD (  27.84  )
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

This is to prepare for native XDP support.

The page pool API is more faster in allocating pages than
__alloc_skb(). Drawback is that it works at PAGE_SIZE granularity
so we are not efficient in memory usage.
i.e. we are using PAGE_SIZE (4KB) memory for 1.5KB max packet size.

Signed-off-by: Roger Quadros <rogerq@kernel.org>
Signed-off-by: MD Danish Anwar <danishanwar@ti.com>
---
 drivers/net/ethernet/ti/Kconfig               |   1 +
 drivers/net/ethernet/ti/icssg/icssg_common.c  | 180 ++++++++++++------
 drivers/net/ethernet/ti/icssg/icssg_prueth.h  |  14 +-
 .../net/ethernet/ti/icssg/icssg_prueth_sr1.c  |  21 +-
 4 files changed, 146 insertions(+), 70 deletions(-)

diff --git a/drivers/net/ethernet/ti/Kconfig b/drivers/net/ethernet/ti/Kconfig
index 0d5a862cd78a..b461281d31b6 100644
--- a/drivers/net/ethernet/ti/Kconfig
+++ b/drivers/net/ethernet/ti/Kconfig
@@ -204,6 +204,7 @@ config TI_ICSSG_PRUETH_SR1
 	select PHYLIB
 	select TI_ICSS_IEP
 	select TI_K3_CPPI_DESC_POOL
+	select PAGE_POOL
 	depends on PRU_REMOTEPROC
 	depends on NET_SWITCHDEV
 	depends on ARCH_K3 && OF && TI_K3_UDMA_GLUE_LAYER
diff --git a/drivers/net/ethernet/ti/icssg/icssg_common.c b/drivers/net/ethernet/ti/icssg/icssg_common.c
index 74f0f200a89d..313667ce24c3 100644
--- a/drivers/net/ethernet/ti/icssg/icssg_common.c
+++ b/drivers/net/ethernet/ti/icssg/icssg_common.c
@@ -45,6 +45,11 @@ void prueth_cleanup_rx_chns(struct prueth_emac *emac,
 			    struct prueth_rx_chn *rx_chn,
 			    int max_rflows)
 {
+	if (rx_chn->pg_pool) {
+		page_pool_destroy(rx_chn->pg_pool);
+		rx_chn->pg_pool = NULL;
+	}
+
 	if (rx_chn->desc_pool)
 		k3_cppi_desc_pool_destroy(rx_chn->desc_pool);
 
@@ -461,17 +466,17 @@ int prueth_init_rx_chns(struct prueth_emac *emac,
 }
 EXPORT_SYMBOL_GPL(prueth_init_rx_chns);
 
-int prueth_dma_rx_push(struct prueth_emac *emac,
-		       struct sk_buff *skb,
-		       struct prueth_rx_chn *rx_chn)
+int prueth_dma_rx_push_mapped(struct prueth_emac *emac,
+			      struct prueth_rx_chn *rx_chn,
+			      struct page *page, u32 buf_len)
 {
 	struct net_device *ndev = emac->ndev;
 	struct cppi5_host_desc_t *desc_rx;
-	u32 pkt_len = skb_tailroom(skb);
 	dma_addr_t desc_dma;
 	dma_addr_t buf_dma;
 	void **swdata;
 
+	buf_dma = page_pool_get_dma_addr(page) + PRUETH_HEADROOM;
 	desc_rx = k3_cppi_desc_pool_alloc(rx_chn->desc_pool);
 	if (!desc_rx) {
 		netdev_err(ndev, "rx push: failed to allocate descriptor\n");
@@ -479,25 +484,18 @@ int prueth_dma_rx_push(struct prueth_emac *emac,
 	}
 	desc_dma = k3_cppi_desc_pool_virt2dma(rx_chn->desc_pool, desc_rx);
 
-	buf_dma = dma_map_single(rx_chn->dma_dev, skb->data, pkt_len, DMA_FROM_DEVICE);
-	if (unlikely(dma_mapping_error(rx_chn->dma_dev, buf_dma))) {
-		k3_cppi_desc_pool_free(rx_chn->desc_pool, desc_rx);
-		netdev_err(ndev, "rx push: failed to map rx pkt buffer\n");
-		return -EINVAL;
-	}
-
 	cppi5_hdesc_init(desc_rx, CPPI5_INFO0_HDESC_EPIB_PRESENT,
 			 PRUETH_NAV_PS_DATA_SIZE);
 	k3_udma_glue_rx_dma_to_cppi5_addr(rx_chn->rx_chn, &buf_dma);
-	cppi5_hdesc_attach_buf(desc_rx, buf_dma, skb_tailroom(skb), buf_dma, skb_tailroom(skb));
+	cppi5_hdesc_attach_buf(desc_rx, buf_dma, buf_len, buf_dma, buf_len);
 
 	swdata = cppi5_hdesc_get_swdata(desc_rx);
-	*swdata = skb;
+	*swdata = page;
 
-	return k3_udma_glue_push_rx_chn(rx_chn->rx_chn, 0,
+	return k3_udma_glue_push_rx_chn(rx_chn->rx_chn, PRUETH_RX_FLOW_DATA,
 					desc_rx, desc_dma);
 }
-EXPORT_SYMBOL_GPL(prueth_dma_rx_push);
+EXPORT_SYMBOL_GPL(prueth_dma_rx_push_mapped);
 
 u64 icssg_ts_to_ns(u32 hi_sw, u32 hi, u32 lo, u32 cycle_time_ns)
 {
@@ -535,18 +533,31 @@ void emac_rx_timestamp(struct prueth_emac *emac,
 	ssh->hwtstamp = ns_to_ktime(ns);
 }
 
+unsigned int prueth_rxbuf_total_len(unsigned int len)
+{
+	len += PRUETH_HEADROOM;
+	len += SKB_DATA_ALIGN(sizeof(struct skb_shared_info));
+
+	return SKB_DATA_ALIGN(len);
+}
+EXPORT_SYMBOL_GPL(prueth_rxbuf_total_len);
+
 static int emac_rx_packet(struct prueth_emac *emac, u32 flow_id)
 {
 	struct prueth_rx_chn *rx_chn = &emac->rx_chns;
 	u32 buf_dma_len, pkt_len, port_id = 0;
 	struct net_device *ndev = emac->ndev;
 	struct cppi5_host_desc_t *desc_rx;
-	struct sk_buff *skb, *new_skb;
 	dma_addr_t desc_dma, buf_dma;
+	struct page *page, *new_page;
+	struct page_pool *pool;
+	struct sk_buff *skb;
 	void **swdata;
 	u32 *psdata;
+	void *pa;
 	int ret;
 
+	pool = rx_chn->pg_pool;
 	ret = k3_udma_glue_pop_rx_chn(rx_chn->rx_chn, flow_id, &desc_dma);
 	if (ret) {
 		if (ret != -ENODATA)
@@ -558,14 +569,8 @@ static int emac_rx_packet(struct prueth_emac *emac, u32 flow_id)
 		return 0;
 
 	desc_rx = k3_cppi_desc_pool_dma2virt(rx_chn->desc_pool, desc_dma);
-
 	swdata = cppi5_hdesc_get_swdata(desc_rx);
-	skb = *swdata;
-
-	psdata = cppi5_hdesc_get_psdata(desc_rx);
-	/* RX HW timestamp */
-	if (emac->rx_ts_enabled)
-		emac_rx_timestamp(emac, skb, psdata);
+	page = *swdata;
 
 	cppi5_hdesc_get_obuf(desc_rx, &buf_dma, &buf_dma_len);
 	k3_udma_glue_rx_cppi5_to_dma_addr(rx_chn->rx_chn, &buf_dma);
@@ -574,32 +579,50 @@ static int emac_rx_packet(struct prueth_emac *emac, u32 flow_id)
 	pkt_len -= 4;
 	cppi5_desc_get_tags_ids(&desc_rx->hdr, &port_id, NULL);
 
-	dma_unmap_single(rx_chn->dma_dev, buf_dma, buf_dma_len, DMA_FROM_DEVICE);
 	k3_cppi_desc_pool_free(rx_chn->desc_pool, desc_rx);
 
-	skb->dev = ndev;
-	new_skb = netdev_alloc_skb_ip_align(ndev, PRUETH_MAX_PKT_SIZE);
 	/* if allocation fails we drop the packet but push the
-	 * descriptor back to the ring with old skb to prevent a stall
+	 * descriptor back to the ring with old page to prevent a stall
 	 */
-	if (!new_skb) {
+	new_page = page_pool_dev_alloc_pages(pool);
+	if (unlikely(!new_page)) {
+		new_page = page;
 		ndev->stats.rx_dropped++;
-		new_skb = skb;
-	} else {
-		/* send the filled skb up the n/w stack */
-		skb_put(skb, pkt_len);
-		if (emac->prueth->is_switch_mode)
-			skb->offload_fwd_mark = emac->offload_fwd_mark;
-		skb->protocol = eth_type_trans(skb, ndev);
-		napi_gro_receive(&emac->napi_rx, skb);
-		ndev->stats.rx_bytes += pkt_len;
-		ndev->stats.rx_packets++;
+		goto requeue;
 	}
 
+	/* prepare skb and send to n/w stack */
+	pa = page_address(page);
+	skb = build_skb(pa, prueth_rxbuf_total_len(pkt_len));
+	if (!skb) {
+		ndev->stats.rx_dropped++;
+		page_pool_recycle_direct(pool, page);
+		goto requeue;
+	}
+
+	skb_reserve(skb, PRUETH_HEADROOM);
+	skb_put(skb, pkt_len);
+	skb->dev = ndev;
+
+	psdata = cppi5_hdesc_get_psdata(desc_rx);
+	/* RX HW timestamp */
+	if (emac->rx_ts_enabled)
+		emac_rx_timestamp(emac, skb, psdata);
+
+	if (emac->prueth->is_switch_mode)
+		skb->offload_fwd_mark = emac->offload_fwd_mark;
+	skb->protocol = eth_type_trans(skb, ndev);
+
+	netif_receive_skb(skb);
+	ndev->stats.rx_bytes += pkt_len;
+	ndev->stats.rx_packets++;
+
+requeue:
 	/* queue another RX DMA */
-	ret = prueth_dma_rx_push(emac, new_skb, &emac->rx_chns);
+	ret = prueth_dma_rx_push_mapped(emac, &emac->rx_chns, new_page,
+					PRUETH_MAX_PKT_SIZE);
 	if (WARN_ON(ret < 0)) {
-		dev_kfree_skb_any(new_skb);
+		page_pool_recycle_direct(pool, new_page);
 		ndev->stats.rx_errors++;
 		ndev->stats.rx_dropped++;
 	}
@@ -611,22 +634,17 @@ static void prueth_rx_cleanup(void *data, dma_addr_t desc_dma)
 {
 	struct prueth_rx_chn *rx_chn = data;
 	struct cppi5_host_desc_t *desc_rx;
-	struct sk_buff *skb;
-	dma_addr_t buf_dma;
-	u32 buf_dma_len;
+	struct page_pool *pool;
+	struct page *page;
 	void **swdata;
 
+	pool = rx_chn->pg_pool;
+
 	desc_rx = k3_cppi_desc_pool_dma2virt(rx_chn->desc_pool, desc_dma);
 	swdata = cppi5_hdesc_get_swdata(desc_rx);
-	skb = *swdata;
-	cppi5_hdesc_get_obuf(desc_rx, &buf_dma, &buf_dma_len);
-	k3_udma_glue_rx_cppi5_to_dma_addr(rx_chn->rx_chn, &buf_dma);
-
-	dma_unmap_single(rx_chn->dma_dev, buf_dma, buf_dma_len,
-			 DMA_FROM_DEVICE);
+	page = *swdata;
+	page_pool_recycle_direct(pool, page);
 	k3_cppi_desc_pool_free(rx_chn->desc_pool, desc_rx);
-
-	dev_kfree_skb_any(skb);
 }
 
 static int prueth_tx_ts_cookie_get(struct prueth_emac *emac)
@@ -907,29 +925,70 @@ int icssg_napi_rx_poll(struct napi_struct *napi_rx, int budget)
 }
 EXPORT_SYMBOL_GPL(icssg_napi_rx_poll);
 
+static struct page_pool *prueth_create_page_pool(struct prueth_emac *emac,
+						 struct device *dma_dev,
+						 int size)
+{
+	struct page_pool_params pp_params = { 0 };
+	struct page_pool *pool;
+
+	pp_params.order = 0;
+	pp_params.flags = PP_FLAG_DMA_MAP;
+	pp_params.pool_size = size;
+	pp_params.nid = dev_to_node(emac->prueth->dev);
+	pp_params.dma_dir = DMA_BIDIRECTIONAL;
+	pp_params.dev = dma_dev;
+	pp_params.napi = &emac->napi_rx;
+
+	pool = page_pool_create(&pp_params);
+	if (IS_ERR(pool))
+		netdev_err(emac->ndev, "cannot create rx page pool\n");
+
+	return pool;
+}
+
 int prueth_prepare_rx_chan(struct prueth_emac *emac,
 			   struct prueth_rx_chn *chn,
 			   int buf_size)
 {
-	struct sk_buff *skb;
+	struct page_pool *pool;
+	struct page *page;
 	int i, ret;
 
+	pool = prueth_create_page_pool(emac, chn->dma_dev, chn->descs_num);
+	if (IS_ERR(pool))
+		return PTR_ERR(pool);
+
+	chn->pg_pool = pool;
+
 	for (i = 0; i < chn->descs_num; i++) {
-		skb = __netdev_alloc_skb_ip_align(NULL, buf_size, GFP_KERNEL);
-		if (!skb)
-			return -ENOMEM;
+		/* NOTE: we're not using memory efficiently here.
+		 * 1 full page (4KB?) used here instead of
+		 * PRUETH_MAX_PKT_SIZE (~1.5KB?)
+		 */
+		page = page_pool_dev_alloc_pages(pool);
+		if (!page) {
+			netdev_err(emac->ndev, "couldn't allocate rx page\n");
+			ret = -ENOMEM;
+			goto recycle_alloc_pg;
+		}
 
-		ret = prueth_dma_rx_push(emac, skb, chn);
+		ret = prueth_dma_rx_push_mapped(emac, chn, page, buf_size);
 		if (ret < 0) {
 			netdev_err(emac->ndev,
-				   "cannot submit skb for rx chan %s ret %d\n",
+				   "cannot submit page for rx chan %s ret %d\n",
 				   chn->name, ret);
-			kfree_skb(skb);
-			return ret;
+			page_pool_recycle_direct(pool, page);
+			goto recycle_alloc_pg;
 		}
 	}
 
 	return 0;
+
+recycle_alloc_pg:
+	prueth_reset_rx_chan(&emac->rx_chns, PRUETH_MAX_RX_FLOWS, false);
+
+	return ret;
 }
 EXPORT_SYMBOL_GPL(prueth_prepare_rx_chan);
 
@@ -958,6 +1017,9 @@ void prueth_reset_rx_chan(struct prueth_rx_chn *chn,
 					  prueth_rx_cleanup, !!i);
 	if (disable)
 		k3_udma_glue_disable_rx_chn(chn->rx_chn);
+
+	page_pool_destroy(chn->pg_pool);
+	chn->pg_pool = NULL;
 }
 EXPORT_SYMBOL_GPL(prueth_reset_rx_chan);
 
diff --git a/drivers/net/ethernet/ti/icssg/icssg_prueth.h b/drivers/net/ethernet/ti/icssg/icssg_prueth.h
index 5473315ea204..62f3d04af222 100644
--- a/drivers/net/ethernet/ti/icssg/icssg_prueth.h
+++ b/drivers/net/ethernet/ti/icssg/icssg_prueth.h
@@ -33,6 +33,8 @@
 #include <linux/dma/k3-udma-glue.h>
 
 #include <net/devlink.h>
+#include <net/xdp.h>
+#include <net/page_pool/helpers.h>
 
 #include "icssg_config.h"
 #include "icss_iep.h"
@@ -125,6 +127,7 @@ struct prueth_rx_chn {
 	u32 descs_num;
 	unsigned int irq[ICSSG_MAX_RFLOWS];	/* separate irq per flow */
 	char name[32];
+	struct page_pool *pg_pool;
 };
 
 /* There are 4 Tx DMA channels, but the highest priority is CH3 (thread 3)
@@ -202,6 +205,10 @@ struct prueth_emac {
 	unsigned long rx_pace_timeout_ns;
 };
 
+/* The buf includes headroom compatible with both skb and xdpf */
+#define PRUETH_HEADROOM_NA (max(XDP_PACKET_HEADROOM, NET_SKB_PAD) + NET_IP_ALIGN)
+#define PRUETH_HEADROOM  ALIGN(PRUETH_HEADROOM_NA, sizeof(long))
+
 /**
  * struct prueth_pdata - PRUeth platform data
  * @fdqring_mode: Free desc queue mode
@@ -402,9 +409,10 @@ int prueth_init_rx_chns(struct prueth_emac *emac,
 			struct prueth_rx_chn *rx_chn,
 			char *name, u32 max_rflows,
 			u32 max_desc_num);
-int prueth_dma_rx_push(struct prueth_emac *emac,
-		       struct sk_buff *skb,
-		       struct prueth_rx_chn *rx_chn);
+int prueth_dma_rx_push_mapped(struct prueth_emac *emac,
+			      struct prueth_rx_chn *rx_chn,
+			      struct page *page, u32 buf_len);
+unsigned int prueth_rxbuf_total_len(unsigned int len);
 void emac_rx_timestamp(struct prueth_emac *emac,
 		       struct sk_buff *skb, u32 *psdata);
 enum netdev_tx icssg_ndo_start_xmit(struct sk_buff *skb, struct net_device *ndev);
diff --git a/drivers/net/ethernet/ti/icssg/icssg_prueth_sr1.c b/drivers/net/ethernet/ti/icssg/icssg_prueth_sr1.c
index 3dc86397c367..c2bc7169355a 100644
--- a/drivers/net/ethernet/ti/icssg/icssg_prueth_sr1.c
+++ b/drivers/net/ethernet/ti/icssg/icssg_prueth_sr1.c
@@ -274,10 +274,12 @@ static struct sk_buff *prueth_process_rx_mgm(struct prueth_emac *emac,
 	struct prueth_rx_chn *rx_chn = &emac->rx_mgm_chn;
 	struct net_device *ndev = emac->ndev;
 	struct cppi5_host_desc_t *desc_rx;
-	struct sk_buff *skb, *new_skb;
+	struct page *page, *new_page;
 	dma_addr_t desc_dma, buf_dma;
 	u32 buf_dma_len, pkt_len;
+	struct sk_buff *skb;
 	void **swdata;
+	void *pa;
 	int ret;
 
 	ret = k3_udma_glue_pop_rx_chn(rx_chn->rx_chn, flow_id, &desc_dma);
@@ -299,32 +301,35 @@ static struct sk_buff *prueth_process_rx_mgm(struct prueth_emac *emac,
 	}
 
 	swdata = cppi5_hdesc_get_swdata(desc_rx);
-	skb = *swdata;
+	page = *swdata;
 	cppi5_hdesc_get_obuf(desc_rx, &buf_dma, &buf_dma_len);
 	pkt_len = cppi5_hdesc_get_pktlen(desc_rx);
 
 	dma_unmap_single(rx_chn->dma_dev, buf_dma, buf_dma_len, DMA_FROM_DEVICE);
 	k3_cppi_desc_pool_free(rx_chn->desc_pool, desc_rx);
 
-	new_skb = netdev_alloc_skb_ip_align(ndev, PRUETH_MAX_PKT_SIZE);
+	new_page = page_pool_dev_alloc_pages(rx_chn->pg_pool);
 	/* if allocation fails we drop the packet but push the
 	 * descriptor back to the ring with old skb to prevent a stall
 	 */
-	if (!new_skb) {
+	if (!new_page) {
 		netdev_err(ndev,
-			   "skb alloc failed, dropped mgm pkt from flow %d\n",
+			   "page alloc failed, dropped mgm pkt from flow %d\n",
 			   flow_id);
-		new_skb = skb;
+		new_page = page;
 		skb = NULL;	/* return NULL */
 	} else {
 		/* return the filled skb */
+		pa = page_address(page);
+		skb = build_skb(pa, prueth_rxbuf_total_len(pkt_len));
 		skb_put(skb, pkt_len);
 	}
 
 	/* queue another DMA */
-	ret = prueth_dma_rx_push(emac, new_skb, &emac->rx_mgm_chn);
+	ret = prueth_dma_rx_push_mapped(emac, &emac->rx_chns, new_page,
+					PRUETH_MAX_PKT_SIZE);
 	if (WARN_ON(ret < 0))
-		dev_kfree_skb_any(new_skb);
+		page_pool_recycle_direct(rx_chn->pg_pool, new_page);
 
 	return skb;
 }
-- 
2.25.1


