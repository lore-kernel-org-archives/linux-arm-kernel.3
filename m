Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BA23CCD187
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Oct 2025 10:57:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sCHZYq1/dA9W7drhx6BA1jO6pyoYF8kkcVEYzpeeDXU=; b=ZDCT9O/v/VRyH0O9+XGJsNX+wX
	NQ0A+iIa17oHfXoQ+ZD9wgSwe4Adi8/EzLgzTE7Aec8aVbJhcImQ5jlEtE78EAweJ444xY1oenjtH
	qD0DSU06snQfIi3OOpjn+RFGhgY5r5d1tw9V7yDtflA0rRKAyxw01eA/aCioXNoQY9NkInvnkZS87
	ND5E7UmbjLpmuab/0fiAbUvCC9UMHuXKOqd6uxT/yL2YBowVuU62FMZd6VocNPT/SgVsbL0MbD4cX
	GQW1xj+DJF1PySUUXFnoPT4MwWl39rO2opxOY1mSiXu1aqWHdXXAPnrDD+aSHodDOdRVrZdcWfQ8z
	0a2T35Sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8ciJ-0000000FyBR-3d6C;
	Tue, 14 Oct 2025 10:57:07 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8ciF-0000000Fy7L-4BND
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Oct 2025 10:57:06 +0000
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 59EAuMeh1130388;
	Tue, 14 Oct 2025 05:56:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1760439382;
	bh=sCHZYq1/dA9W7drhx6BA1jO6pyoYF8kkcVEYzpeeDXU=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=G2LjK4e4jhqd+WmuG1b3S4absJTCn6itsK/J6SOLc/01SDrYUTLKJys+n7NhN1y3B
	 qTV6T1dXwqZTxOCV3czuNNhYvulU/5pzvNBUIZ3a7D/Q36zkLeQmLG3bTTRnS997yp
	 2t1M7TDeSXiZleSKBd3U83VOQsoFqQKSV8GjdykI=
Received: from DLEE208.ent.ti.com (dlee208.ent.ti.com [157.170.170.97])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 59EAuLDM386970
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 14 Oct 2025 05:56:21 -0500
Received: from DLEE210.ent.ti.com (157.170.170.112) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 14 Oct
 2025 05:56:21 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 14 Oct 2025 05:56:21 -0500
Received: from fllv0122.itg.ti.com (fllv0122.itg.ti.com [10.247.120.72])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59EAuLla3439694;
	Tue, 14 Oct 2025 05:56:21 -0500
Received: from localhost (meghana-pc.dhcp.ti.com [10.24.69.13] (may be forged))
	by fllv0122.itg.ti.com (8.14.7/8.14.7) with ESMTP id 59EAuKTN009016;
	Tue, 14 Oct 2025 05:56:21 -0500
From: Meghana Malladi <m-malladi@ti.com>
To: <horms@kernel.org>, <namcao@linutronix.de>, <jacob.e.keller@intel.com>,
        <m-malladi@ti.com>, <christian.koenig@amd.com>,
        <sumit.semwal@linaro.org>, <sdf@fomichev.me>,
        <john.fastabend@gmail.com>, <hawk@kernel.org>, <daniel@iogearbox.net>,
        <ast@kernel.org>, <pabeni@redhat.com>, <kuba@kernel.org>,
        <edumazet@google.com>, <davem@davemloft.net>, <andrew+netdev@lunn.ch>
CC: <linaro-mm-sig@lists.linaro.org>, <dri-devel@lists.freedesktop.org>,
        <linux-media@vger.kernel.org>, <bpf@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <netdev@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <srk@ti.com>,
        Vignesh Raghavendra
	<vigneshr@ti.com>,
        Roger Quadros <rogerq@kernel.org>, <danishanwar@ti.com>
Subject: [PATCH net-next v3 1/6] net: ti: icssg-prueth: Add functions to create and destroy Rx/Tx queues
Date: Tue, 14 Oct 2025 16:26:07 +0530
Message-ID: <20251014105613.2808674-2-m-malladi@ti.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251014105613.2808674-1-m-malladi@ti.com>
References: <20251014105613.2808674-1-m-malladi@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_035704_510567_02B0E0D2 
X-CRM114-Status: GOOD (  23.51  )
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

Each port for a given ICSSG instance has their own set of
Tx and Rx queues. Add functions to create and destroy these
queues, which will be further used while performing ndo_bpf
operations to set up XSK Tx/Rx queues for a given port.

In the destroy Rx queue sequence add teardown wait to ensure
that all the descriptors including the TDCM (teardown completion
marker) have been serviced and freed to avoid any sort of descriptor
leaks.

Signed-off-by: Meghana Malladi <m-malladi@ti.com>
---
 drivers/net/ethernet/ti/icssg/icssg_common.c |  10 +-
 drivers/net/ethernet/ti/icssg/icssg_prueth.c | 177 ++++++++++++-------
 drivers/net/ethernet/ti/icssg/icssg_prueth.h |   2 +
 3 files changed, 127 insertions(+), 62 deletions(-)

diff --git a/drivers/net/ethernet/ti/icssg/icssg_common.c b/drivers/net/ethernet/ti/icssg/icssg_common.c
index 57e5f1c88f50..580a968594fc 100644
--- a/drivers/net/ethernet/ti/icssg/icssg_common.c
+++ b/drivers/net/ethernet/ti/icssg/icssg_common.c
@@ -719,8 +719,10 @@ static int emac_rx_packet(struct prueth_emac *emac, u32 flow_id, u32 *xdp_state)
 		return ret;
 	}
 
-	if (cppi5_desc_is_tdcm(desc_dma)) /* Teardown ? */
+	if (cppi5_desc_is_tdcm(desc_dma)) {
+		complete(&emac->tdown_complete);
 		return 0;
+	}
 
 	desc_rx = k3_cppi_desc_pool_dma2virt(rx_chn->desc_pool, desc_dma);
 	swdata = cppi5_hdesc_get_swdata(desc_rx);
@@ -804,7 +806,7 @@ static int emac_rx_packet(struct prueth_emac *emac, u32 flow_id, u32 *xdp_state)
 	return ret;
 }
 
-static void prueth_rx_cleanup(void *data, dma_addr_t desc_dma)
+void prueth_rx_cleanup(void *data, dma_addr_t desc_dma)
 {
 	struct prueth_rx_chn *rx_chn = data;
 	struct cppi5_host_desc_t *desc_rx;
@@ -822,6 +824,7 @@ static void prueth_rx_cleanup(void *data, dma_addr_t desc_dma)
 
 	k3_cppi_desc_pool_free(rx_chn->desc_pool, desc_rx);
 }
+EXPORT_SYMBOL_GPL(prueth_rx_cleanup);
 
 static int prueth_tx_ts_cookie_get(struct prueth_emac *emac)
 {
@@ -1025,7 +1028,7 @@ enum netdev_tx icssg_ndo_start_xmit(struct sk_buff *skb, struct net_device *ndev
 }
 EXPORT_SYMBOL_GPL(icssg_ndo_start_xmit);
 
-static void prueth_tx_cleanup(void *data, dma_addr_t desc_dma)
+void prueth_tx_cleanup(void *data, dma_addr_t desc_dma)
 {
 	struct prueth_tx_chn *tx_chn = data;
 	struct cppi5_host_desc_t *desc_tx;
@@ -1051,6 +1054,7 @@ static void prueth_tx_cleanup(void *data, dma_addr_t desc_dma)
 
 	prueth_xmit_free(tx_chn, desc_tx);
 }
+EXPORT_SYMBOL_GPL(prueth_tx_cleanup);
 
 irqreturn_t prueth_rx_irq(int irq, void *dev_id)
 {
diff --git a/drivers/net/ethernet/ti/icssg/icssg_prueth.c b/drivers/net/ethernet/ti/icssg/icssg_prueth.c
index dadce6009791..5e9926699805 100644
--- a/drivers/net/ethernet/ti/icssg/icssg_prueth.c
+++ b/drivers/net/ethernet/ti/icssg/icssg_prueth.c
@@ -727,6 +727,114 @@ static int icssg_update_vlan_mcast(struct net_device *vdev, int vid,
 	return 0;
 }
 
+static void prueth_destroy_txq(struct prueth_emac *emac)
+{
+	int ret, i;
+
+	atomic_set(&emac->tdown_cnt, emac->tx_ch_num);
+	/* ensure new tdown_cnt value is visible */
+	smp_mb__after_atomic();
+	/* tear down and disable UDMA channels */
+	reinit_completion(&emac->tdown_complete);
+	for (i = 0; i < emac->tx_ch_num; i++)
+		k3_udma_glue_tdown_tx_chn(emac->tx_chns[i].tx_chn, false);
+
+	ret = wait_for_completion_timeout(&emac->tdown_complete,
+					  msecs_to_jiffies(1000));
+	if (!ret)
+		netdev_err(emac->ndev, "tx teardown timeout\n");
+
+	for (i = 0; i < emac->tx_ch_num; i++) {
+		napi_disable(&emac->tx_chns[i].napi_tx);
+		hrtimer_cancel(&emac->tx_chns[i].tx_hrtimer);
+		k3_udma_glue_reset_tx_chn(emac->tx_chns[i].tx_chn,
+					  &emac->tx_chns[i],
+					  prueth_tx_cleanup);
+		k3_udma_glue_disable_tx_chn(emac->tx_chns[i].tx_chn);
+	}
+}
+
+static void prueth_destroy_rxq(struct prueth_emac *emac)
+{
+	int i, ret;
+
+	/* tear down and disable UDMA channels */
+	reinit_completion(&emac->tdown_complete);
+	k3_udma_glue_tdown_rx_chn(emac->rx_chns.rx_chn, true);
+
+	/* When RX DMA Channel Teardown is initiated, it will result in an
+	 * interrupt and a Teardown Completion Marker (TDCM) is queued into
+	 * the RX Completion queue. Acknowledging the interrupt involves
+	 * popping the TDCM descriptor from the RX Completion queue via the
+	 * RX NAPI Handler. To avoid timing out when waiting for the TDCM to
+	 * be popped, schedule the RX NAPI handler to run immediately.
+	 */
+	if (!napi_if_scheduled_mark_missed(&emac->napi_rx)) {
+		if (napi_schedule_prep(&emac->napi_rx))
+			__napi_schedule(&emac->napi_rx);
+	}
+
+	ret = wait_for_completion_timeout(&emac->tdown_complete,
+					  msecs_to_jiffies(1000));
+	if (!ret)
+		netdev_err(emac->ndev, "rx teardown timeout\n");
+
+	for (i = 0; i < PRUETH_MAX_RX_FLOWS; i++) {
+		napi_disable(&emac->napi_rx);
+		hrtimer_cancel(&emac->rx_hrtimer);
+		k3_udma_glue_reset_rx_chn(emac->rx_chns.rx_chn, i,
+					  &emac->rx_chns,
+					  prueth_rx_cleanup);
+	}
+
+	prueth_destroy_xdp_rxqs(emac);
+	k3_udma_glue_disable_rx_chn(emac->rx_chns.rx_chn);
+}
+
+static int prueth_create_txq(struct prueth_emac *emac)
+{
+	int ret, i;
+
+	for (i = 0; i < emac->tx_ch_num; i++) {
+		ret = k3_udma_glue_enable_tx_chn(emac->tx_chns[i].tx_chn);
+		if (ret)
+			goto reset_tx_chan;
+		napi_enable(&emac->tx_chns[i].napi_tx);
+	}
+	return 0;
+
+reset_tx_chan:
+	/* Since interface is not yet up, there is wouldn't be
+	 * any SKB for completion. So set false to free_skb
+	 */
+	prueth_reset_tx_chan(emac, i, false);
+	return ret;
+}
+
+static int prueth_create_rxq(struct prueth_emac *emac)
+{
+	int ret;
+
+	ret = prueth_prepare_rx_chan(emac, &emac->rx_chns, PRUETH_MAX_PKT_SIZE);
+	if (ret)
+		return ret;
+
+	ret = k3_udma_glue_enable_rx_chn(emac->rx_chns.rx_chn);
+	if (ret)
+		goto reset_rx_chn;
+
+	ret = prueth_create_xdp_rxqs(emac);
+	if (ret)
+		goto reset_rx_chn;
+
+	napi_enable(&emac->napi_rx);
+	return 0;
+
+reset_rx_chn:
+	prueth_reset_rx_chan(&emac->rx_chns, PRUETH_MAX_RX_FLOWS, false);
+	return ret;
+}
+
 /**
  * emac_ndo_open - EMAC device open
  * @ndev: network adapter device
@@ -738,7 +846,7 @@ static int icssg_update_vlan_mcast(struct net_device *vdev, int vid,
 static int emac_ndo_open(struct net_device *ndev)
 {
 	struct prueth_emac *emac = netdev_priv(ndev);
-	int ret, i, num_data_chn = emac->tx_ch_num;
+	int ret, num_data_chn = emac->tx_ch_num;
 	struct icssg_flow_cfg __iomem *flow_cfg;
 	struct prueth *prueth = emac->prueth;
 	int slice = prueth_emac_slice(emac);
@@ -811,28 +919,13 @@ static int emac_ndo_open(struct net_device *ndev)
 		goto stop;
 
 	/* Prepare RX */
-	ret = prueth_prepare_rx_chan(emac, &emac->rx_chns, PRUETH_MAX_PKT_SIZE);
+	ret = prueth_create_rxq(emac);
 	if (ret)
 		goto free_tx_ts_irq;
 
-	ret = prueth_create_xdp_rxqs(emac);
-	if (ret)
-		goto reset_rx_chn;
-
-	ret = k3_udma_glue_enable_rx_chn(emac->rx_chns.rx_chn);
+	ret = prueth_create_txq(emac);
 	if (ret)
-		goto destroy_xdp_rxqs;
-
-	for (i = 0; i < emac->tx_ch_num; i++) {
-		ret = k3_udma_glue_enable_tx_chn(emac->tx_chns[i].tx_chn);
-		if (ret)
-			goto reset_tx_chan;
-	}
-
-	/* Enable NAPI in Tx and Rx direction */
-	for (i = 0; i < emac->tx_ch_num; i++)
-		napi_enable(&emac->tx_chns[i].napi_tx);
-	napi_enable(&emac->napi_rx);
+		goto destroy_rxq;
 
 	/* start PHY */
 	phy_start(ndev->phydev);
@@ -843,15 +936,8 @@ static int emac_ndo_open(struct net_device *ndev)
 
 	return 0;
 
-reset_tx_chan:
-	/* Since interface is not yet up, there is wouldn't be
-	 * any SKB for completion. So set false to free_skb
-	 */
-	prueth_reset_tx_chan(emac, i, false);
-destroy_xdp_rxqs:
-	prueth_destroy_xdp_rxqs(emac);
-reset_rx_chn:
-	prueth_reset_rx_chan(&emac->rx_chns, max_rx_flows, false);
+destroy_rxq:
+	prueth_destroy_rxq(emac);
 free_tx_ts_irq:
 	free_irq(emac->tx_ts_irq, emac);
 stop:
@@ -881,9 +967,6 @@ static int emac_ndo_stop(struct net_device *ndev)
 {
 	struct prueth_emac *emac = netdev_priv(ndev);
 	struct prueth *prueth = emac->prueth;
-	int rx_flow = PRUETH_RX_FLOW_DATA;
-	int max_rx_flows;
-	int ret, i;
 
 	/* inform the upper layers. */
 	netif_tx_stop_all_queues(ndev);
@@ -897,32 +980,8 @@ static int emac_ndo_stop(struct net_device *ndev)
 	else
 		__dev_mc_unsync(ndev, icssg_prueth_del_mcast);
 
-	atomic_set(&emac->tdown_cnt, emac->tx_ch_num);
-	/* ensure new tdown_cnt value is visible */
-	smp_mb__after_atomic();
-	/* tear down and disable UDMA channels */
-	reinit_completion(&emac->tdown_complete);
-	for (i = 0; i < emac->tx_ch_num; i++)
-		k3_udma_glue_tdown_tx_chn(emac->tx_chns[i].tx_chn, false);
-
-	ret = wait_for_completion_timeout(&emac->tdown_complete,
-					  msecs_to_jiffies(1000));
-	if (!ret)
-		netdev_err(ndev, "tx teardown timeout\n");
-
-	prueth_reset_tx_chan(emac, emac->tx_ch_num, true);
-	for (i = 0; i < emac->tx_ch_num; i++) {
-		napi_disable(&emac->tx_chns[i].napi_tx);
-		hrtimer_cancel(&emac->tx_chns[i].tx_hrtimer);
-	}
-
-	max_rx_flows = PRUETH_MAX_RX_FLOWS;
-	k3_udma_glue_tdown_rx_chn(emac->rx_chns.rx_chn, true);
-
-	prueth_reset_rx_chan(&emac->rx_chns, max_rx_flows, true);
-	prueth_destroy_xdp_rxqs(emac);
-	napi_disable(&emac->napi_rx);
-	hrtimer_cancel(&emac->rx_hrtimer);
+	prueth_destroy_txq(emac);
+	prueth_destroy_rxq(emac);
 
 	cancel_work_sync(&emac->rx_mode_work);
 
@@ -935,10 +994,10 @@ static int emac_ndo_stop(struct net_device *ndev)
 
 	free_irq(emac->tx_ts_irq, emac);
 
-	free_irq(emac->rx_chns.irq[rx_flow], emac);
+	free_irq(emac->rx_chns.irq[PRUETH_RX_FLOW_DATA], emac);
 	prueth_ndev_del_tx_napi(emac, emac->tx_ch_num);
 
-	prueth_cleanup_rx_chns(emac, &emac->rx_chns, max_rx_flows);
+	prueth_cleanup_rx_chns(emac, &emac->rx_chns, PRUETH_MAX_RX_FLOWS);
 	prueth_cleanup_tx_chns(emac);
 
 	prueth->emacs_initialized--;
diff --git a/drivers/net/ethernet/ti/icssg/icssg_prueth.h b/drivers/net/ethernet/ti/icssg/icssg_prueth.h
index ca8a22a4a5da..e0dadbfca45a 100644
--- a/drivers/net/ethernet/ti/icssg/icssg_prueth.h
+++ b/drivers/net/ethernet/ti/icssg/icssg_prueth.h
@@ -497,5 +497,7 @@ u32 emac_xmit_xdp_frame(struct prueth_emac *emac,
 			struct xdp_frame *xdpf,
 			struct page *page,
 			unsigned int q_idx);
+void prueth_rx_cleanup(void *data, dma_addr_t desc_dma);
+void prueth_tx_cleanup(void *data, dma_addr_t desc_dma);
 
 #endif /* __NET_TI_ICSSG_PRUETH_H */
-- 
2.43.0


