Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72CA1C7115B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Jun 2025 05:42:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=elLIf7fn3ROfjQByGp/TsTtfayAS/aLZr2yQStBrTrY=; b=yHobtEgnfcA1UaO0i3bXBptAAr
	IwYkdbNb5zWn21edsr21Aa5UkGDz73XwWasuhn00wv849zz23C8zvfGnQDo7EU9LdgKjlb4v0uD/V
	Mvp39tnURHk1nRb+kgytnN6QkdgT56bdlm0qKehvNjoYkZ2YmV5KF7wzB8kf2qIzj01bn9xf4TARJ
	po/eVSnXixx7C7mN2KTk8j5R6n8p5ATuMSJGKhVzh7loyobN41p3F9a+hdJ7DxPE/MmanXo+9DOlh
	ZmMxYJSJ+y/62wDT0wP6hC+z6RcSYBRGRmeKWASwfwUPF8HUgia3sAWgJatYtnO83R9IpPPQnPFyI
	f6/uBjRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTZwp-00000001eQL-3ekB;
	Mon, 23 Jun 2025 05:42:27 +0000
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTZsM-00000001dLZ-3rNe
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Jun 2025 05:37:52 +0000
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55N5bdYU1447048;
	Mon, 23 Jun 2025 00:37:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1750657059;
	bh=elLIf7fn3ROfjQByGp/TsTtfayAS/aLZr2yQStBrTrY=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=BXOV/gccj91Q6DVbXf/CU2JsTbbZ2EvMxEXbXMjdt7/8aI6y0saGhiM+kF3QMBklD
	 t17bVhz1GDEVT9OrXhBQQdGVh3PYRTxG1XGrwDI+sQmodV/2W2l4dRpn7xhCifWw7h
	 sLMO035NufGGuM+fqW1MslPyNdr4BQ/zY23Se574=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55N5bdm0183338
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Mon, 23 Jun 2025 00:37:39 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Mon, 23
 Jun 2025 00:37:39 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Mon, 23 Jun 2025 00:37:39 -0500
Received: from uda0498651.dhcp.ti.com (uda0498651.dhcp.ti.com [172.24.227.7])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55N5bSqQ3428603;
	Mon, 23 Jun 2025 00:37:34 -0500
From: Sai Sree Kartheek Adivi <s-adivi@ti.com>
To: Peter Ujfalusi <peter.ujfalusi@gmail.com>, Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Nishanth Menon <nm@ti.com>,
        Santosh
 Shilimkar <ssantosh@kernel.org>,
        Sai Sree Kartheek Adivi <s-adivi@ti.com>, <dmaengine@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <praneeth@ti.com>,
        <vigneshr@ti.com>, <u-kumar1@ti.com>, <a-chavda@ti.com>,
        <p-mantena@ti.com>
Subject: [PATCH v3 01/17] dmaengine: ti: k3-udma: move macros to header file
Date: Mon, 23 Jun 2025 11:07:00 +0530
Message-ID: <20250623053716.1493974-2-s-adivi@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250623053716.1493974-1-s-adivi@ti.com>
References: <20250623053716.1493974-1-s-adivi@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250622_223751_050378_39518B22 
X-CRM114-Status: GOOD (  12.23  )
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

Move macros defined in k3-udma.c to k3-udma.h for better separation and
re-use.

Signed-off-by: Sai Sree Kartheek Adivi <s-adivi@ti.com>
---
 drivers/dma/ti/k3-udma.c | 62 ---------------------------------------
 drivers/dma/ti/k3-udma.h | 63 ++++++++++++++++++++++++++++++++++++++++
 2 files changed, 63 insertions(+), 62 deletions(-)

diff --git a/drivers/dma/ti/k3-udma.c b/drivers/dma/ti/k3-udma.c
index aa2dc762140f6..4cc64763de1f6 100644
--- a/drivers/dma/ti/k3-udma.c
+++ b/drivers/dma/ti/k3-udma.c
@@ -39,21 +39,6 @@ struct udma_static_tr {
 	u16 bstcnt; /* RPSTR1 */
 };
 
-#define K3_UDMA_MAX_RFLOWS		1024
-#define K3_UDMA_DEFAULT_RING_SIZE	16
-
-/* How SRC/DST tag should be updated by UDMA in the descriptor's Word 3 */
-#define UDMA_RFLOW_SRCTAG_NONE		0
-#define UDMA_RFLOW_SRCTAG_CFG_TAG	1
-#define UDMA_RFLOW_SRCTAG_FLOW_ID	2
-#define UDMA_RFLOW_SRCTAG_SRC_TAG	4
-
-#define UDMA_RFLOW_DSTTAG_NONE		0
-#define UDMA_RFLOW_DSTTAG_CFG_TAG	1
-#define UDMA_RFLOW_DSTTAG_FLOW_ID	2
-#define UDMA_RFLOW_DSTTAG_DST_TAG_LO	4
-#define UDMA_RFLOW_DSTTAG_DST_TAG_HI	5
-
 struct udma_chan;
 
 enum k3_dma_type {
@@ -118,15 +103,6 @@ struct udma_oes_offsets {
 	u32 pktdma_rchan_flow;
 };
 
-#define UDMA_FLAG_PDMA_ACC32		BIT(0)
-#define UDMA_FLAG_PDMA_BURST		BIT(1)
-#define UDMA_FLAG_TDTYPE		BIT(2)
-#define UDMA_FLAG_BURST_SIZE		BIT(3)
-#define UDMA_FLAGS_J7_CLASS		(UDMA_FLAG_PDMA_ACC32 | \
-					 UDMA_FLAG_PDMA_BURST | \
-					 UDMA_FLAG_TDTYPE | \
-					 UDMA_FLAG_BURST_SIZE)
-
 struct udma_match_data {
 	enum k3_dma_type type;
 	u32 psil_base;
@@ -1837,38 +1813,6 @@ static int udma_alloc_rx_resources(struct udma_chan *uc)
 	return ret;
 }
 
-#define TISCI_BCDMA_BCHAN_VALID_PARAMS (			\
-	TI_SCI_MSG_VALUE_RM_UDMAP_CH_PAUSE_ON_ERR_VALID |	\
-	TI_SCI_MSG_VALUE_RM_UDMAP_CH_EXTENDED_CH_TYPE_VALID)
-
-#define TISCI_BCDMA_TCHAN_VALID_PARAMS (			\
-	TI_SCI_MSG_VALUE_RM_UDMAP_CH_PAUSE_ON_ERR_VALID |	\
-	TI_SCI_MSG_VALUE_RM_UDMAP_CH_TX_SUPR_TDPKT_VALID)
-
-#define TISCI_BCDMA_RCHAN_VALID_PARAMS (			\
-	TI_SCI_MSG_VALUE_RM_UDMAP_CH_PAUSE_ON_ERR_VALID)
-
-#define TISCI_UDMA_TCHAN_VALID_PARAMS (				\
-	TI_SCI_MSG_VALUE_RM_UDMAP_CH_PAUSE_ON_ERR_VALID |	\
-	TI_SCI_MSG_VALUE_RM_UDMAP_CH_TX_FILT_EINFO_VALID |	\
-	TI_SCI_MSG_VALUE_RM_UDMAP_CH_TX_FILT_PSWORDS_VALID |	\
-	TI_SCI_MSG_VALUE_RM_UDMAP_CH_CHAN_TYPE_VALID |		\
-	TI_SCI_MSG_VALUE_RM_UDMAP_CH_TX_SUPR_TDPKT_VALID |	\
-	TI_SCI_MSG_VALUE_RM_UDMAP_CH_FETCH_SIZE_VALID |		\
-	TI_SCI_MSG_VALUE_RM_UDMAP_CH_CQ_QNUM_VALID |		\
-	TI_SCI_MSG_VALUE_RM_UDMAP_CH_ATYPE_VALID)
-
-#define TISCI_UDMA_RCHAN_VALID_PARAMS (				\
-	TI_SCI_MSG_VALUE_RM_UDMAP_CH_PAUSE_ON_ERR_VALID |	\
-	TI_SCI_MSG_VALUE_RM_UDMAP_CH_FETCH_SIZE_VALID |		\
-	TI_SCI_MSG_VALUE_RM_UDMAP_CH_CQ_QNUM_VALID |		\
-	TI_SCI_MSG_VALUE_RM_UDMAP_CH_CHAN_TYPE_VALID |		\
-	TI_SCI_MSG_VALUE_RM_UDMAP_CH_RX_IGNORE_SHORT_VALID |	\
-	TI_SCI_MSG_VALUE_RM_UDMAP_CH_RX_IGNORE_LONG_VALID |	\
-	TI_SCI_MSG_VALUE_RM_UDMAP_CH_RX_FLOWID_START_VALID |	\
-	TI_SCI_MSG_VALUE_RM_UDMAP_CH_RX_FLOWID_CNT_VALID |	\
-	TI_SCI_MSG_VALUE_RM_UDMAP_CH_ATYPE_VALID)
-
 static int udma_tisci_m2m_channel_config(struct udma_chan *uc)
 {
 	struct udma_dev *ud = uc->ud;
@@ -5398,12 +5342,6 @@ static enum dmaengine_alignment udma_get_copy_align(struct udma_dev *ud)
 	}
 }
 
-#define TI_UDMAC_BUSWIDTHS	(BIT(DMA_SLAVE_BUSWIDTH_1_BYTE) | \
-				 BIT(DMA_SLAVE_BUSWIDTH_2_BYTES) | \
-				 BIT(DMA_SLAVE_BUSWIDTH_3_BYTES) | \
-				 BIT(DMA_SLAVE_BUSWIDTH_4_BYTES) | \
-				 BIT(DMA_SLAVE_BUSWIDTH_8_BYTES))
-
 static int udma_probe(struct platform_device *pdev)
 {
 	struct device_node *navss_node = pdev->dev.parent->of_node;
diff --git a/drivers/dma/ti/k3-udma.h b/drivers/dma/ti/k3-udma.h
index 9062a237cd167..750720cd06911 100644
--- a/drivers/dma/ti/k3-udma.h
+++ b/drivers/dma/ti/k3-udma.h
@@ -97,6 +97,69 @@
 /* Address Space Select */
 #define K3_ADDRESS_ASEL_SHIFT		48
 
+#define K3_UDMA_MAX_RFLOWS		1024
+#define K3_UDMA_DEFAULT_RING_SIZE	16
+
+/* How SRC/DST tag should be updated by UDMA in the descriptor's Word 3 */
+#define UDMA_RFLOW_SRCTAG_NONE		0
+#define UDMA_RFLOW_SRCTAG_CFG_TAG	1
+#define UDMA_RFLOW_SRCTAG_FLOW_ID	2
+#define UDMA_RFLOW_SRCTAG_SRC_TAG	4
+
+#define UDMA_RFLOW_DSTTAG_NONE		0
+#define UDMA_RFLOW_DSTTAG_CFG_TAG	1
+#define UDMA_RFLOW_DSTTAG_FLOW_ID	2
+#define UDMA_RFLOW_DSTTAG_DST_TAG_LO	4
+#define UDMA_RFLOW_DSTTAG_DST_TAG_HI	5
+
+#define UDMA_FLAG_PDMA_ACC32		BIT(0)
+#define UDMA_FLAG_PDMA_BURST		BIT(1)
+#define UDMA_FLAG_TDTYPE		BIT(2)
+#define UDMA_FLAG_BURST_SIZE		BIT(3)
+#define UDMA_FLAGS_J7_CLASS		(UDMA_FLAG_PDMA_ACC32 | \
+					 UDMA_FLAG_PDMA_BURST | \
+					 UDMA_FLAG_TDTYPE | \
+					 UDMA_FLAG_BURST_SIZE)
+
+#define TI_UDMAC_BUSWIDTHS	(BIT(DMA_SLAVE_BUSWIDTH_1_BYTE) | \
+				 BIT(DMA_SLAVE_BUSWIDTH_2_BYTES) | \
+				 BIT(DMA_SLAVE_BUSWIDTH_3_BYTES) | \
+				 BIT(DMA_SLAVE_BUSWIDTH_4_BYTES) | \
+				 BIT(DMA_SLAVE_BUSWIDTH_8_BYTES))
+
+/* TI_SCI Params */
+#define TISCI_BCDMA_BCHAN_VALID_PARAMS (			\
+	TI_SCI_MSG_VALUE_RM_UDMAP_CH_PAUSE_ON_ERR_VALID |	\
+	TI_SCI_MSG_VALUE_RM_UDMAP_CH_EXTENDED_CH_TYPE_VALID)
+
+#define TISCI_BCDMA_TCHAN_VALID_PARAMS (			\
+	TI_SCI_MSG_VALUE_RM_UDMAP_CH_PAUSE_ON_ERR_VALID |	\
+	TI_SCI_MSG_VALUE_RM_UDMAP_CH_TX_SUPR_TDPKT_VALID)
+
+#define TISCI_BCDMA_RCHAN_VALID_PARAMS (			\
+	TI_SCI_MSG_VALUE_RM_UDMAP_CH_PAUSE_ON_ERR_VALID)
+
+#define TISCI_UDMA_TCHAN_VALID_PARAMS (				\
+	TI_SCI_MSG_VALUE_RM_UDMAP_CH_PAUSE_ON_ERR_VALID |	\
+	TI_SCI_MSG_VALUE_RM_UDMAP_CH_TX_FILT_EINFO_VALID |	\
+	TI_SCI_MSG_VALUE_RM_UDMAP_CH_TX_FILT_PSWORDS_VALID |	\
+	TI_SCI_MSG_VALUE_RM_UDMAP_CH_CHAN_TYPE_VALID |		\
+	TI_SCI_MSG_VALUE_RM_UDMAP_CH_TX_SUPR_TDPKT_VALID |	\
+	TI_SCI_MSG_VALUE_RM_UDMAP_CH_FETCH_SIZE_VALID |		\
+	TI_SCI_MSG_VALUE_RM_UDMAP_CH_CQ_QNUM_VALID |		\
+	TI_SCI_MSG_VALUE_RM_UDMAP_CH_ATYPE_VALID)
+
+#define TISCI_UDMA_RCHAN_VALID_PARAMS (				\
+	TI_SCI_MSG_VALUE_RM_UDMAP_CH_PAUSE_ON_ERR_VALID |	\
+	TI_SCI_MSG_VALUE_RM_UDMAP_CH_FETCH_SIZE_VALID |		\
+	TI_SCI_MSG_VALUE_RM_UDMAP_CH_CQ_QNUM_VALID |		\
+	TI_SCI_MSG_VALUE_RM_UDMAP_CH_CHAN_TYPE_VALID |		\
+	TI_SCI_MSG_VALUE_RM_UDMAP_CH_RX_IGNORE_SHORT_VALID |	\
+	TI_SCI_MSG_VALUE_RM_UDMAP_CH_RX_IGNORE_LONG_VALID |	\
+	TI_SCI_MSG_VALUE_RM_UDMAP_CH_RX_FLOWID_START_VALID |	\
+	TI_SCI_MSG_VALUE_RM_UDMAP_CH_RX_FLOWID_CNT_VALID |	\
+	TI_SCI_MSG_VALUE_RM_UDMAP_CH_ATYPE_VALID)
+
 struct udma_dev;
 struct udma_tchan;
 struct udma_rchan;
-- 
2.34.1


