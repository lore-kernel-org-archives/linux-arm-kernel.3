Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75BBBC88E72
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 10:05:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=HYP+JJbTwiiywbiVz0a+yBLv0Q156v+PDNkFJvDV15o=; b=0UIETttzI81im/5lrPh/p1+bdE
	g2HMe0BBXDSj23hprpzzQwBAKbYXN6Mv1wKEiMFpavLhu7OH2AIliiozZZ80Kt8MnT//4/KvraKsl
	hpMlub7QCGcRdCMevSN1yEugd8y8zsnz00d7mMa1eRLK+zAYmhJM5AdyT1C48voHFPsH5zbPI4sLK
	EuFBs97a6KqLgHZf0wpMku4TBJW9GpFbvR46KiR7SzQ2cfpFuwM46aH4EKbAwWI0JEXSYwAAQouSH
	qJQIwCdAg+lqaidlP8C7gd/xr6pekCGlKCp0mKFRNR4Jl9tcYPtKoqWH20jBbfP4IRc8aWMCF5xQ4
	LixlVkVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x78zu-0000000B4Nb-3f5L;
	Thu, 17 Sep 2026 10:05:42 +0000
Received: from mail-eastusazlp170120007.outbound.protection.outlook.com ([2a01:111:f403:c101::7] helo=BL0PR03CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x78zr-0000000B4M9-2T9u
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 10:05:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uj9CXSmz0z1FlCGh9XRU/nUqAK1eSf9UVZt5hJocih2Pxc64p8u5fgxhV9b+/JEhmkhkDuqF7dIGE5ozi7rtqY2XbSKevzYBgZaHfYFfEDMU5eAf0Al950D9wsFaQa4Von6xfwOFGyDt17KlXFF6rRcJ3LtxzCd03UOshZ92yRiCoGoT+oE3nEOtcBiHXpQcC67Y0MOhT7TnsdY99I+aJJmTdIb8WT2pn8yigsFjhXI+nWftlzmVkqIRQcdAAQiK8YLlntmt1qo1VPTz/pG+Nk4L8e/95PC1sXWj0sMNZqrqiIIps4AIdl0anTycnOmXhvsxqTqChbox+lhFnIeHPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HYP+JJbTwiiywbiVz0a+yBLv0Q156v+PDNkFJvDV15o=;
 b=Tb1gBDzJM88JWqB2KqIn6Ex5cn52AWhpYfSgrE/R66GbpNHqo3a1XGBzcu5d+WA9ccNCoYgUkuF7xsk3fuFK1zFdijxOokcB1VkmVj701jBtua2NlyfUVN//uw71iShqcTm/goAzUyW/O+Dye8Dn4qAx0TJFPDbRPVVefZmYur58MHkOB2fbOnv5Ggh9N41FFRmPMy2el8DOqVWhBfDmmk/BFIgv1ULuwxnDy5En8Y3S79pb8cnG4Mg1Qq51Pk9JfBbSxSy4l01DK0eOeLrI48SPFGoJNh2N842upMjQ5jPuAL6RhbTEQ1L55otFt55T0/jEec8Vf3qFjXbopN16jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lunn.ch smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HYP+JJbTwiiywbiVz0a+yBLv0Q156v+PDNkFJvDV15o=;
 b=VifTluwi+sXq3Vm34bj+G3Y3CJxg3FYUIzOqLxXN6bKDWtlbPUmJzCPyaO9eE0FIrORD+1kk7xxYTeVGUR/PeK+Ap17hdb18G/xjzOqbvHuASMx8uqBWMHhi9NaPcHKpGg11WdVMxjPbcp9BH+uQPzxw1kHzh/rMyCzv2liaXCM=
Received: from BN9P222CA0007.NAMP222.PROD.OUTLOOK.COM (2603:10b6:408:10c::12)
 by PH7PR12MB9223.namprd12.prod.outlook.com (2603:10b6:510:2f2::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.9; Thu, 17 Sep
 2026 10:05:30 +0000
Received: from BN2PEPF0000A994.namprd04.prod.outlook.com
 (2603:10b6:408:10c:cafe::7c) by BN9P222CA0007.outlook.office365.com
 (2603:10b6:408:10c::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.11 via Frontend Transport; Thu,
 17 Sep 2026 10:05:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN2PEPF0000A994.mail.protection.outlook.com (10.167.248.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Thu, 17 Sep 2026 10:05:29 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Thu, 17 Sep
 2026 05:05:28 -0500
Received: from xhdsuragupt40.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.49 via Frontend
 Transport; Thu, 17 Sep 2026 05:05:25 -0500
From: Suraj Gupta <suraj.gupta2@amd.com>
To: <radhey.shyam.pandey@amd.com>, <andrew+netdev@lunn.ch>,
	<davem@davemloft.net>, <edumazet@google.com>, <kuba@kernel.org>,
	<pabeni@redhat.com>, <michal.simek@amd.com>
CC: <netdev@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH net v2] net: xilinx: axienet: Free outstanding DMA buffers on dmaengine stop
Date: Thu, 17 Sep 2026 15:35:25 +0530
Message-ID: <20260917100525.250952-1-suraj.gupta2@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF0000A994:EE_|PH7PR12MB9223:EE_
X-MS-Office365-Filtering-Correlation-Id: fe3d6617-a221-49d5-f7c6-08df14a333eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|23010399003|82310400026|36860700016|1800799024|13003099007|3023799007|10067099003|11063799006|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info: uaFHMSY49pHiYmJKYeujMJY91I3MLwFkYWZpuS8ijF5toGANPRNusOn6XirFK85lwo3iWVaapZDpP0GM6N/aqSRSHQctNv3VJcLSeCd1ZyDRf2mVwJ7zf+MEaM+F4mqrWpb3nGuN6jV1vnh1pxg6IMEvGbAEZogiTGQ30OwvPPgYgFyMQlBDiYemoJK3z+IBbe1Sx9gHqUWIVZl72RnVKHkJZZrYQHtKcrqzKm/T1cwwoyPH2NhSx//Klb/5E+89MJ7Wf1GWEB0MI3L515vh2X46o/EVdT/5Rp171UbaC7+VsSgbJyWNwiLSp2s2nBDZK9Bxd9whhPCLvgo06ABXg9F8rKWtFEGYqiT+p6ZXv41GW7EwxoSvfbioWttfEx3eC/hWSvnXfNRFV+fCRqUTZVWytrgQ5JERH/fTL/y+DVky3Ws0nKxGjddsFPbrZQ19JG65lqBD9bd9H74OtQpz248v6ZyMitU7iizbLLJAy4ZFFLGeSBB+Ylu+oHPeqdPy2yW1314HCpfOIA1RYAS+Fdi/gn/KGtY4UlzEijJ8PZbHwRO7tCAkNlAOZ7k4dGecq0nyxGrTa7gU3scfN84QE3QWMPyg+Sw9BRdellbVxY+QjWdXcIOWO+u/YOArNIEuHC62XAWQJvTv6EmJDWKK1zaMgyvRVST8mYRoKQ9LS0aeEenTfCUsVPSIxUhy5mtmoW7FnEGHRcuO1il83VmbEg==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(23010399003)(82310400026)(36860700016)(1800799024)(13003099007)(3023799007)(10067099003)(11063799006)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: jBMJbwguj4Kso2gv16+f/G1oCHQMty+7LUV3prF8YqRaW6q9CAR3Ugn5ASMql77oqhUHyJ43YTspTuDp2DL7/WXgp0UrVL79cBDoOjoh1hyv6uMJCHjF1w8F/kmL872TRP4Z/3HH/hLT8CaDTgxqwHYxzKaBvyOLoRAAdGZ8TbssGO7wfilmeX9oQVFPoqYWHaug6wKQm5K18oq/bjLOAtVPT8Yj4vxKi/2CWM2lVBm6H3Wzkmt9EiIuZKI5MHRQeoC94jy1k2ikZQbBJ7fXAJDDrMwb1DN6+ksYCix/qTY7sAlEG3Sm8DLQdiGkvRXTlQ+oZ5bjbOaFOjUyT6pSvjmq9994fLhdWa6NKiRPT6z4YI4MeNnTjq2KQ0uPcIVwPuMeng3CEFq6txqnZw4Dx4gpw5LVQ1iWwz7X1q+1Ganq+vvARgEI5oLoqo4pxZXl
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2026 10:05:29.2810
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fe3d6617-a221-49d5-f7c6-08df14a333eb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF0000A994.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB9223
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_030539_663083_35B2A778 
X-CRM114-Status: GOOD (  24.25  )
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

In the dmaengine path the driver pre-submits RX buffers and holds
in-flight TX buffers whose SKBs are DMA-mapped by the driver and freed
only in the completion callbacks. On ndo_stop() the driver calls
dmaengine_terminate_sync(), which aborts these descriptors without
running their callbacks, and then frees only the ring shells with
kfree(). Every SKB still owned by the engine, and its DMA mapping, is
thus leaked on each ifdown. With 128 RX buffers pre-posted per channel,
the mapping leak can eventually exhaust a limited IOMMU aperture.

Clear the slot's skb pointer in the TX and RX callbacks so a non-NULL
skb marks a slot that still owns a live, DMA-mapped buffer, and on stop
unmap and free every such buffer.

axienet_dma_rx_cb() re-arms the RX ring on every completion, so a
completion racing with axienet_stop() could resubmit a buffer after the
terminate that the teardown then frees while the engine still owns it.
Set @stopping before terminating and check it in the callback to fence
resubmission, and release the channels before freeing the rings so a
late completion cannot touch a freed ring.

Fixes: 6a91b846af85 ("net: axienet: Introduce dmaengine support")
Cc: stable@vger.kernel.org
Signed-off-by: Suraj Gupta <suraj.gupta2@amd.com>
---
Changes in v2:
- Fence RX descriptor resubmission in axienet_dma_rx_cb() against a stop
  in progress via the existing @stopping flag, and release the DMA
  channels before freeing the rings (Jakub Kicinski).
- Drop the redundant dmaengine_synchronize() calls that followed
  dmaengine_terminate_sync(), which already ends with a synchronize
  (Jakub Kicinski).
- Expand the commit message to describe the race fix.

v1: https://lore.kernel.org/netdev/20260910141946.3017164-1-suraj.gupta2@amd.com/
---
 drivers/net/ethernet/xilinx/xilinx_axienet.h  |  5 +-
 .../net/ethernet/xilinx/xilinx_axienet_main.c | 50 +++++++++++++++----
 2 files changed, 44 insertions(+), 11 deletions(-)

diff --git a/drivers/net/ethernet/xilinx/xilinx_axienet.h b/drivers/net/ethernet/xilinx/xilinx_axienet.h
index fcd3aaef27fc..7c75e313dd33 100644
--- a/drivers/net/ethernet/xilinx/xilinx_axienet.h
+++ b/drivers/net/ethernet/xilinx/xilinx_axienet.h
@@ -523,8 +523,9 @@ struct skbuf_dma_descriptor {
  * @stats_work: Work for reading the hardware statistics counters often enough
  *              to catch overflows.
  * @dma_err_task: Work structure to process Axi DMA errors
- * @stopping:   Set when @dma_err_task shouldn't do anything because we are
- *              about to stop the device.
+ * @stopping:   Set when we are about to stop the device: makes @dma_err_task
+ *              a no-op (legacy DMA path) and fences RX descriptor
+ *              resubmission in axienet_dma_rx_cb() (dmaengine path).
  * @tx_irq:	Axidma TX IRQ number
  * @rx_irq:	Axidma RX IRQ number
  * @eth_irq:	Ethernet core IRQ number
diff --git a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
index 782f903d318f..36a487f791a2 100644
--- a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
+++ b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
@@ -881,6 +881,7 @@ static void axienet_dma_tx_cb(void *data, const struct dmaengine_result *result)
 	u64_stats_update_end(&lp->tx_stat_sync);
 	dma_unmap_sg(lp->dev, skbuf_dma->sgl, skbuf_dma->sg_len, DMA_TO_DEVICE);
 	dev_consume_skb_any(skbuf_dma->skb);
+	skbuf_dma->skb = NULL;
 	netif_txq_completed_wake(txq, 1, len,
 				 CIRC_SPACE(lp->tx_ring_head, lp->tx_ring_tail, TX_BD_NUM_MAX),
 				 2);
@@ -1171,6 +1172,7 @@ static void axienet_dma_rx_cb(void *data, const struct dmaengine_result *result)
 						       &meta_max_len);
 	dma_unmap_single(lp->dev, skbuf_dma->dma_address, lp->max_frm_size,
 			 DMA_FROM_DEVICE);
+	skbuf_dma->skb = NULL;
 
 	if (IS_ERR(app_metadata)) {
 		if (net_ratelimit())
@@ -1193,6 +1195,12 @@ static void axienet_dma_rx_cb(void *data, const struct dmaengine_result *result)
 	u64_stats_update_end(&lp->rx_stat_sync);
 
 rx_submit:
+	/* Do not re-arm the RX ring while a stop is in progress, or the
+	 * teardown could free a buffer still handed to the engine.
+	 */
+	if (READ_ONCE(lp->stopping))
+		return;
+
 	for (i = 0; i < CIRC_SPACE(lp->rx_ring_head, lp->rx_ring_tail,
 				   RX_BUF_NUM_DEFAULT); i++)
 		axienet_rx_submit_desc(lp->ndev);
@@ -1541,6 +1549,7 @@ static int axienet_init_dmaengine(struct net_device *ndev)
 	lp->tx_ring_head = 0;
 	lp->rx_ring_tail = 0;
 	lp->rx_ring_head = 0;
+	lp->stopping = false;
 	lp->tx_skb_ring = kzalloc_objs(*lp->tx_skb_ring, TX_BD_NUM_MAX);
 	if (!lp->tx_skb_ring) {
 		ret = -ENOMEM;
@@ -1752,20 +1761,43 @@ static int axienet_stop(struct net_device *ndev)
 		free_irq(lp->rx_irq, ndev);
 		axienet_dma_bd_release(ndev);
 	} else {
+		struct skbuf_dma_descriptor *skbuf_dma;
+
+		WRITE_ONCE(lp->stopping, true);
 		dmaengine_terminate_sync(lp->tx_chan);
-		dmaengine_synchronize(lp->tx_chan);
 		dmaengine_terminate_sync(lp->rx_chan);
-		dmaengine_synchronize(lp->rx_chan);
-
-		for (i = 0; i < TX_BD_NUM_MAX; i++)
-			kfree(lp->tx_skb_ring[i]);
-		kfree(lp->tx_skb_ring);
-		for (i = 0; i < RX_BUF_NUM_DEFAULT; i++)
-			kfree(lp->rx_skb_ring[i]);
-		kfree(lp->rx_skb_ring);
 
+		/* Release the channels before freeing the rings, so the DMA is
+		 * fully torn down before the memory its descriptors reference is
+		 * freed.
+		 */
 		dma_release_channel(lp->rx_chan);
 		dma_release_channel(lp->tx_chan);
+
+		/* Unmap and free any buffer the terminate did not reclaim, so it
+		 * is not leaked; a non-NULL skb marks such a slot.
+		 */
+		for (i = 0; i < TX_BD_NUM_MAX; i++) {
+			skbuf_dma = lp->tx_skb_ring[i];
+			if (skbuf_dma && skbuf_dma->skb) {
+				dma_unmap_sg(lp->dev, skbuf_dma->sgl,
+					     skbuf_dma->sg_len, DMA_TO_DEVICE);
+				dev_kfree_skb_any(skbuf_dma->skb);
+			}
+			kfree(skbuf_dma);
+		}
+		kfree(lp->tx_skb_ring);
+
+		for (i = 0; i < RX_BUF_NUM_DEFAULT; i++) {
+			skbuf_dma = lp->rx_skb_ring[i];
+			if (skbuf_dma && skbuf_dma->skb) {
+				dma_unmap_single(lp->dev, skbuf_dma->dma_address,
+						 lp->max_frm_size, DMA_FROM_DEVICE);
+				dev_kfree_skb_any(skbuf_dma->skb);
+			}
+			kfree(skbuf_dma);
+		}
+		kfree(lp->rx_skb_ring);
 	}
 
 	netdev_reset_queue(ndev);
-- 
2.25.1


