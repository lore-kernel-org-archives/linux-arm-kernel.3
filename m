Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3612810AB802
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 18:55:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2OkNDbfqNYkWEd6na3FA+WiA8ea+lgrEfpBKAoleC1I=; b=QhjtwCWOitEk6DuY7u/bY7oEHn
	++xuOfGlGUI9LVMVsmivlh7BAEBltl1uFQmF0xeQHq/cPmP6J1pUhe6XwFiKBqz0e4WSMN9D7AmrK
	qoXIOmWMCkjvwqyfrHSamOrNHdlkWOCnUedjtPt+O9KwPzIKZISz0R1MnjgNQV84eCQsv1RiG35dU
	Q3RGs7ugt186V/cg+6tKnQ2dnHwSeMm1RwMeYbrp5gds2vplfJHW9iF0Q8QSpKSgqRdqv5Qhm4H/r
	z50IjXECS393OFJJmPoylQZXIcQ+a/rG/KBgfOOcEBiXHImVUXm2Vryg5KfoZpenukividoyXWqFK
	huy7gmIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5prl-000000064Xt-1ZjY;
	Thu, 26 Mar 2026 18:55:37 +0000
Received: from mail-westus3azon11012067.outbound.protection.outlook.com ([40.107.209.67] helo=PH8PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5prf-000000064Va-1Z1q
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Mar 2026 18:55:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hJte43xrv/jxqMne5foj8yjpDC/oJzV5fsIMbpGParBYS4xLlfLlD5OUUT83ui0SdDSvt/Vy0WOfeLJMizzNabh3RHmgvvSe3AsMIdqauz5wF/73agWf4G9SFZ6gN+IHp+N7pc5QtZDzYL+qxf4UOcqebiBHoXYBS2x+f1yUkAf+6ViR4uLPzx72f7B7FHPsvjMoHh/vGHTboVk3AQTcVrlBgE9LpaUmW6OT4/RRGwAYP0IAlXyXhK0CT3OQPZir/UVWfLvp+K5VpCLCfM2h++9sX0xlNR/kHhhIYyGoQdvy4rYborv0y1KmM/eeoQSqlxODIQ9JwvXWWBsEXnqC0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2OkNDbfqNYkWEd6na3FA+WiA8ea+lgrEfpBKAoleC1I=;
 b=bhSyRhHjzsabrE5colKoPk5rEYBLSCXDeguZKbrFhIMTvbww2JSTffIqfUOaYHDHgk7sFVPuNk8smxD+lMNqNzCsIOCyoQuYYF7asI1PL4WnEvcFxBZW/HeGWRMzKLWuQyBNKjthAy6GvKl4SxT7Z06AAFfXcHDrcXTSD1ScmYrVuWaAwl314m/FOJr6O/FgKHpQ/kLNecGjWOkAo4pAKuDECClbN+/449UIVNc4K/wHf2Cqtg1iBjAdFfxiSlNTYVvxsxyf79MnnCgvT86ZcrpNJkeX+9qAk5tX6Z78KB6ULMBfrpOPgBGLCSOFkla1FqdbCENOYGy15+VgLoJgew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lunn.ch smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2OkNDbfqNYkWEd6na3FA+WiA8ea+lgrEfpBKAoleC1I=;
 b=QU6otSQL4uuOr+O4uhhZg9qMyLK4nQNrtNpz1kZcfGO7YJ0cO+yw9GDuwJKDzIblfKYS0vtn8KibI+I01VfmBFySI1nw4nhijiw0/3dPuZKUrBTMfITbE5+VyU1afVD34PmEBwf4G8SIPkh3vSSDhgqJPtvvQADjO1w9Sn3YXZ0=
Received: from DS7PR03CA0312.namprd03.prod.outlook.com (2603:10b6:8:2b::21) by
 DS7PR12MB6007.namprd12.prod.outlook.com (2603:10b6:8:7e::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.6; Thu, 26 Mar 2026 18:55:24 +0000
Received: from CH3PEPF00000017.namprd21.prod.outlook.com
 (2603:10b6:8:2b:cafe::95) by DS7PR03CA0312.outlook.office365.com
 (2603:10b6:8:2b::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.33 via Frontend Transport; Thu,
 26 Mar 2026 18:55:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CH3PEPF00000017.mail.protection.outlook.com (10.167.244.122) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.0 via Frontend Transport; Thu, 26 Mar 2026 18:55:21 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 26 Mar
 2026 13:55:21 -0500
Received: from xhdsuragupt40.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Thu, 26 Mar 2026 13:55:18 -0500
From: Suraj Gupta <suraj.gupta2@amd.com>
To: <andrew+netdev@lunn.ch>, <davem@davemloft.net>, <edumazet@google.com>,
	<kuba@kernel.org>, <pabeni@redhat.com>, <michal.simek@amd.com>,
	<sean.anderson@linux.dev>, <radhey.shyam.pandey@amd.com>, <horms@kernel.org>
CC: <netdev@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <harini.katakam@amd.com>
Subject: [PATCH net V2 2/2] net: xilinx: axienet: Fix BQL accounting for multi-BD TX packets
Date: Fri, 27 Mar 2026 00:25:09 +0530
Message-ID: <20260326185510.3840084-3-suraj.gupta2@amd.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20260326185510.3840084-1-suraj.gupta2@amd.com>
References: <20260326185510.3840084-1-suraj.gupta2@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000017:EE_|DS7PR12MB6007:EE_
X-MS-Office365-Filtering-Correlation-Id: 32e6ab47-3ba3-4f24-9abe-08de8b693b3f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|1800799024|376014|7416014|82310400026|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: /Tem4Aw+1kkUbhJdesgrdIs2kkOfJWecpuCfM9VZRgaKH1xLSgf0caoqkKGuvE5x13NxqYCHqBnTexNwTZYXDCVm0G83qzQu04lDKwVzbk3/J4Asu4hFjWD7pK2f0FwvJxXyJxn9QEbTxZqwRNXB7pZZeEYLY29532FFhOlwLwxYu/WjaBPqFc2gS7qKS3uUudECvUTqEw6ufe3Xgzrm2GxF9UymR33KRclttBCChieMQosQKtE0IZD6cmjzJwasGzDBhNGyNYSwOJwF22MmfmktHRIEx7h9fYdBQ2OnRHs2+dbahXYIBaVleB7uW9ko7RibsbL5H6teOgsYfIKMHVg6feyNeNkYmGTUwVFXbAfoMGxe/gI9DyIbiYiM9r+rVQBtDKE/IwtLCLx5nbXZoQIcoDxIPaF1QTJXrgCM08xSCXPPCybH2adj6E2YzeMzAJeR8kQanD3heaA4vI+bb/JqJth82eOggUSZsXJdzd1INvDYSRdcHdTQHtaij+u7RJJIual8VpW93Ye8dVRDQgU+r7dclE3s1l0KC/ZKoLXrEQ3SGB0IU7kS7k5X1nRRAyVIXFzB2Hp7jKTalIfDp0zPYJb6EQDTPWK47FTIkINBeUY5xkSDo5+Rzp69CqXqH8swkvt7hXv4Y+MJvxPfw5+bgICks2oqqimXDogmLnMndj3M/oOJPri0wfCOZVr7PtyR2r5BPOQdpgUGN5kmjnZ/VlTY0RK0z6hTUxtVj6Pi/ee4p5Vszdja7D3pM9Y1kKPbxy5uT48/JhTPJJzHsA==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(376014)(7416014)(82310400026)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: u2QNeneyxFvgt8X3JbyGc6aImdZA2mK0duCPGtaWioM9sONQOKfueMnE9IIYtEBi6NLUCYo1MPHiZfGh53ko+kgUfDjyUMp/xECCeh9qBFvQwS6qibRh1Q+DI9T4tJLDacJM/zyN5NQEbQvoHqJh3tmFXZEmOylidKu1JpoHVHauUMVU+Cvc1M3UFrmw9A43cycTs9LCjfLDNUROZzhVUjb3E0OhIXx1lqHiD1HpeMUPa9+kGAWQuSqi5TL3FpzaxItNsblA/qXkCLzGo7jzf1+dJ/uCSu+F/z85MZUVxEAnYmLPcFtSkZoDzdz+nIHbWwmSzuC5TV4qq0EC29XcHqQJ2/QIvWPLA462MmAIsIEmCHAgffX44LuDIcDCiLSH7ACkdDdgF9jmZFW2aRDn/I7m5INBFQZYHPc7tsrHGlJMXODC5+T2V4/IizTB31Kr
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2026 18:55:21.4710
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 32e6ab47-3ba3-4f24-9abe-08de8b693b3f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH3PEPF00000017.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6007
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_115531_408196_9330F864 
X-CRM114-Status: GOOD (  16.83  )
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

When a TX packet spans multiple buffer descriptors (scatter-gather),
the per-BD byte count is accumulated into a local variable that resets
on each NAPI poll. If the BDs for a single packet complete across
different polls, the earlier bytes are lost and never credited to BQL.
This causes BQL to think bytes are permanently in-flight, eventually
stalling the TX queue.

Fix this by replacing the local accumulator with a persistent counter
(tx_compl_bytes) that survives across polls and is reset only after
updating BQL and stats.

Fixes: c900e49d58eb ("net: xilinx: axienet: Implement BQL")
Signed-off-by: Suraj Gupta <suraj.gupta2@amd.com>
---
 drivers/net/ethernet/xilinx/xilinx_axienet.h  |  3 +++
 .../net/ethernet/xilinx/xilinx_axienet_main.c | 20 +++++++++----------
 2 files changed, 13 insertions(+), 10 deletions(-)

diff --git a/drivers/net/ethernet/xilinx/xilinx_axienet.h b/drivers/net/ethernet/xilinx/xilinx_axienet.h
index 602389843342..a4444c939451 100644
--- a/drivers/net/ethernet/xilinx/xilinx_axienet.h
+++ b/drivers/net/ethernet/xilinx/xilinx_axienet.h
@@ -509,6 +509,8 @@ struct skbuf_dma_descriptor {
  *		complete. Only updated at runtime by TX NAPI poll.
  * @tx_bd_tail:	Stores the index of the next Tx buffer descriptor in the ring
  *              to be populated.
+ * @tx_compl_bytes: Accumulates TX completion length until a full packet is
+ *              reported to the stack.
  * @tx_packets: TX packet count for statistics
  * @tx_bytes:	TX byte count for statistics
  * @tx_stat_sync: Synchronization object for TX stats
@@ -592,6 +594,7 @@ struct axienet_local {
 	u32 tx_bd_num;
 	u32 tx_bd_ci;
 	u32 tx_bd_tail;
+	u32 tx_compl_bytes;
 	u64_stats_t tx_packets;
 	u64_stats_t tx_bytes;
 	struct u64_stats_sync tx_stat_sync;
diff --git a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
index b06e4c37ff61..95bf61986cb7 100644
--- a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
+++ b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
@@ -692,6 +692,8 @@ static void axienet_dma_stop(struct axienet_local *lp)
 	axienet_lock_mii(lp);
 	__axienet_device_reset(lp);
 	axienet_unlock_mii(lp);
+
+	lp->tx_compl_bytes = 0;
 }
 
 /**
@@ -770,8 +772,6 @@ static int axienet_device_reset(struct net_device *ndev)
  * @first_bd:	Index of first descriptor to clean up
  * @nr_bds:	Max number of descriptors to clean up
  * @force:	Whether to clean descriptors even if not complete
- * @sizep:	Pointer to a u32 filled with the total sum of all bytes
- *		in all cleaned-up descriptors. Ignored if NULL.
  * @budget:	NAPI budget (use 0 when not called from NAPI poll)
  *
  * Would either be called after a successful transmit operation, or after
@@ -780,7 +780,7 @@ static int axienet_device_reset(struct net_device *ndev)
  * Return: The number of packets handled.
  */
 static int axienet_free_tx_chain(struct axienet_local *lp, u32 first_bd,
-				 int nr_bds, bool force, u32 *sizep, int budget)
+				 int nr_bds, bool force, int budget)
 {
 	struct axidma_bd *cur_p;
 	unsigned int status;
@@ -819,8 +819,8 @@ static int axienet_free_tx_chain(struct axienet_local *lp, u32 first_bd,
 		cur_p->cntrl = 0;
 		cur_p->status = 0;
 
-		if (sizep)
-			*sizep += status & XAXIDMA_BD_STS_ACTUAL_LEN_MASK;
+		if (!force)
+			lp->tx_compl_bytes += status & XAXIDMA_BD_STS_ACTUAL_LEN_MASK;
 	}
 
 	if (!force) {
@@ -999,18 +999,18 @@ static int axienet_tx_poll(struct napi_struct *napi, int budget)
 {
 	struct axienet_local *lp = container_of(napi, struct axienet_local, napi_tx);
 	struct net_device *ndev = lp->ndev;
-	u32 size = 0;
 	int packets;
 
 	packets = axienet_free_tx_chain(lp, lp->tx_bd_ci, lp->tx_bd_num, false,
-					&size, budget);
+					budget);
 
 	if (packets) {
-		netdev_completed_queue(ndev, packets, size);
+		netdev_completed_queue(ndev, packets, lp->tx_compl_bytes);
 		u64_stats_update_begin(&lp->tx_stat_sync);
 		u64_stats_add(&lp->tx_packets, packets);
-		u64_stats_add(&lp->tx_bytes, size);
+		u64_stats_add(&lp->tx_bytes, lp->tx_compl_bytes);
 		u64_stats_update_end(&lp->tx_stat_sync);
+		lp->tx_compl_bytes = 0;
 
 		/* Matches barrier in axienet_start_xmit */
 		smp_mb();
@@ -1115,7 +1115,7 @@ axienet_start_xmit(struct sk_buff *skb, struct net_device *ndev)
 				netdev_err(ndev, "TX DMA mapping error\n");
 			ndev->stats.tx_dropped++;
 			axienet_free_tx_chain(lp, orig_tail_ptr, ii + 1,
-					      true, NULL, 0);
+					      true, 0);
 			dev_kfree_skb_any(skb);
 			return NETDEV_TX_OK;
 		}
-- 
2.49.1


