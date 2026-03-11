Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A43861049524
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Mar 2026 09:55:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=p+L2EtX2EkdEP5PMBHKpy4L8IX2sSQ3Pyxu4KTM2VmA=; b=ankm/EzM1wgxwIfheAktYTS5MV
	ZdJU0C+qnBMsxW2rymR2AGiWKbiYRXSYSHB/PA7MRegWWBPuw5qUYUalpT7zrWkgsE9FlOHaHdrOZ
	F0d77zNRpuWWDpLFZUvMHTa6vl7zj89nBVJIYR8mcml/iBgfOxOZkzc1Lw7yYXSYgpjzRbGyMljtT
	rjeM/cX0yoFiM39Bgy6AM7SD8vw+xqdGYdUsKNujGzEUSOhCmAnlpvaz5Fo27WIkDTsiSBIRtpi2o
	cAbou7gKRboPiT69pX03icG+eBPZLvZWSqHOn4F/iiEoIvLgy4h5cIskgxcUM/BHr6YAWexu3fumj
	nBzkEnrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0GHL-0000000BLkm-0OSS;
	Wed, 11 Mar 2026 09:54:59 +0000
Received: from mail-centralusazlp170100005.outbound.protection.outlook.com ([2a01:111:f403:c111::5] helo=DM1PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0GHH-0000000BLkS-3nnJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Mar 2026 09:54:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NaOcl4YdLAXsfm6W5i8bZXor30F9M7Fi4EO4X3aNXD7XlU4Nh+R9Jt2Zcqv2HMrzRaOaDhOOvSZwz5XXBeLQF/c9kOwiqh3NFAEFlYOIh1/vl4x3XWH0H5mFHDvTdi4LuxC2pPfyLNarfm6A9cZi9J1GkhT+UQTrm94HkC9C+1RjGmNMaHeOMRpofSx+xVxK+3chKn7TAzgzYh/kSiCg8LGB5ut45ghEbrk/HYLWBx5uKJs6p1T1D4MW5DMAJ0IGmeVbzgwiBa8IVW8ECDy5Tq9CPUiVYO6uRDiEJKT7BtQ29lIRcHyXJTy6+9lQ/FfpFHH5U1jmDYfBDfZsDN12sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p+L2EtX2EkdEP5PMBHKpy4L8IX2sSQ3Pyxu4KTM2VmA=;
 b=R9a+xrGCJOCZXgCJjABYTFfuhEqkwa1omlx+x5nFatU5zg3ddmcMIgX+SminfDLzzMOf70lWBQRkAO94hG6Bn3Iffr3sgc/mWOb2QHQPYD60Demdj6EH07Gj92KLwwFUxazXkIY3teeROLDeAtCJIv+mVFWV2wANrFKx3ADrgd8BEfYVf8QqD2L+cZFBpd1uDwxMDQjJ+oSQeLMFMW5ZZqxIW7uA+NTfSuNhabqP7Y3XWi6Fx9Sor5vjYXXC8MhqaOZ4Dfat3CX5nf86W0ADc7wFCjinCgCrvjmdPTQvQUjmki/KBXC0pOGyBpgSpvbnar+OTSlSVlP3C3DSKUIyYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=linux.dev smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p+L2EtX2EkdEP5PMBHKpy4L8IX2sSQ3Pyxu4KTM2VmA=;
 b=eeHWkhLZPTm+H8iHzIzBC2KlCrvIXUefP2IY5BsZ3X2KQRiaQQkQrSOpSSYcLvmcpCWIYgF70qB93pnSOYR2PM9Zhnjt8PlUsNotKv1INDjCsxUB/gmaL/IA+xKcPVphpx9xcy3eRjAzcUHZ2F3Ggywo2vhT8LPoAS1Bhsaj2ek=
Received: from BN9PR03CA0139.namprd03.prod.outlook.com (2603:10b6:408:fe::24)
 by MW4PR10MB6677.namprd10.prod.outlook.com (2603:10b6:303:22f::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.12; Wed, 11 Mar
 2026 09:54:50 +0000
Received: from BN2PEPF00004FBB.namprd04.prod.outlook.com
 (2603:10b6:408:fe:cafe::8) by BN9PR03CA0139.outlook.office365.com
 (2603:10b6:408:fe::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.26 via Frontend Transport; Wed,
 11 Mar 2026 09:54:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BN2PEPF00004FBB.mail.protection.outlook.com (10.167.243.181) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Wed, 11 Mar 2026 09:54:49 +0000
Received: from DLEE211.ent.ti.com (157.170.170.113) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 11 Mar
 2026 04:54:47 -0500
Received: from DLEE208.ent.ti.com (157.170.170.97) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 11 Mar
 2026 04:54:47 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 11 Mar 2026 04:54:47 -0500
Received: from fllv0122.itg.ti.com (fllv0122.itg.ti.com [10.247.120.72])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62B9slMw116637;
	Wed, 11 Mar 2026 04:54:47 -0500
Received: from localhost (meghana-pc.dhcp.ti.com [10.24.69.13] (may be forged))
	by fllv0122.itg.ti.com (8.14.7/8.14.7) with ESMTP id 62B9sjp5019904;
	Wed, 11 Mar 2026 04:54:46 -0500
From: Meghana Malladi <m-malladi@ti.com>
To: <vadim.fedorenko@linux.dev>, <haokexin@gmail.com>,
	<jacob.e.keller@intel.com>, <m-malladi@ti.com>, <sdf@fomichev.me>,
	<john.fastabend@gmail.com>, <hawk@kernel.org>, <daniel@iogearbox.net>,
	<ast@kernel.org>, <pabeni@redhat.com>, <kuba@kernel.org>,
	<edumazet@google.com>, <davem@davemloft.net>, <andrew+netdev@lunn.ch>
CC: <bpf@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<netdev@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<srk@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, Roger Quadros
	<rogerq@kernel.org>, <danishanwar@ti.com>
Subject: [PATCH net] net: ti: icssg-prueth: Fix memory leak in XDP_DROP for non-zero-copy mode
Date: Wed, 11 Mar 2026 15:24:41 +0530
Message-ID: <20260311095441.1691636-1-m-malladi@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FBB:EE_|MW4PR10MB6677:EE_
X-MS-Office365-Filtering-Correlation-Id: a69546e4-97a9-43d0-8bb3-08de7f543c35
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|36860700016|1800799024|376014|7416014|921020|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: C+9Vak+fFnFyuZoVao6QKptpLkXXva0s6i0SEVE+eXvVUViYhupBEwaM35qQuHx03BHvRPLZQ606cTPwj3Y+ordnH8OF7d96HlNbssaUKyLKNSinTQPmtx/OTwGVKJgjfFHseSW32G+XeClVanQQoC5lfDbkksJPGdOcXQnr1eS4j+g/GeXm1P4YT/EbivumomzByKIqPGztc9mm3zZqtdoN1YHXMVPLnq/7AKdazCc4n1a2s8mjvktJ2WjSVvyUu6LeHC+JjjdqSZdTbftdaFN4XS01lgik1Qs6LHRnEwasgoVMjUZXm67kykR/C1zk5OTQsN/ldW864ZgNkUC+Nkos7h8+nCtleLRHgYV0j5np2cmIggVNnobOVC/mzmTnZxDhsPRIhHdR6mH8ns3AkjlVULVy3ql1EEvse+uMhhHpDZn00Z7OnYV0weN90eDYHmKGbsbTliCiOILSkqWv9hYTVrL+AREgm4k4fCwWEldwIvuwQiMRBxAojl+G7n5whltqh8eBFSD8CHIfOPrlcHJsxldj5oTWdMMIKjwzFD/JpSGTW+RtkOAfyWTDw3oCKmxT4hNPCzciTrRu7JypY8NIGKH0mqPuN6DFe/qQLmejYWKEvJomZ47k7AumERJfsaxZTzVMA2iYSJBqI6MZIvkkl8RX0Yg00okfyc6VpzZsJwYUQZ5HVBuFiBJvuKzZeIDpyhhAkxDLQkEUSEdwiGqasPBKITpktbs4qzSF7q6GE+EEnkrzhc4KSj2AIZd0KINUrObfgoaUTSSSrW+1CzcUHvFqz8ZSCnfURG8//oMyZWGXlgSIaDbwdP5JhAmR
X-Forefront-Antispam-Report: CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(1800799024)(376014)(7416014)(921020)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: hY4BO04SbH6dNGo8Cpd3SMg8ywoWNEGkA3sgA0YG4v+7o+eZVZOEcXM/72zelCR8r4yhtqdlk84Oqwo05r1YhLzpb2eM3lqrx8XX6T0KSeNwsUukJC1zOLag/QZn/6wN7766FqBks9xHqRHkoGr8wGTScUft5d+8Ffz3kAfT2Z4lI96bWAB8AlbU3HQKRNGdyBee4E4QOzLWjD/cZFmLzNLSUto7pMsJz0MPGa4bjNbz+2yDsxX09OtwseURWLoASA1sj5olJapsaFDMK2Ar78x234AKhfwRTLqPtjWJzd+RfDgs6nSmN3yqZHU0RCJrKw/Q2El79VOhKvoYDHmSkWWug1GR6JRPL/S21bcOsvcQ2t1VOzhD/oa4yPo3PgnztOoBh3fr61ZuSP/BLwpg3lemUhwQqH5pGudjUewtFzc+VIam0ITt8XrzdW5jLiFp
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2026 09:54:49.6208
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a69546e4-97a9-43d0-8bb3-08de7f543c35
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF00004FBB.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB6677
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_025456_057556_D7BC19B6 
X-CRM114-Status: GOOD (  11.45  )
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

Page recycling was removed from the XDP_DROP path in emac_run_xdp() to
avoid conflicts with AF_XDP zero-copy mode, which uses xsk_buff_free()
instead.

However, this causes a memory leak when running XDP programs that drop
packets in non-zero-copy mode (standard page pool mode). The pages are
never returned to the page pool, leading to OOM conditions.

Fix this by handling cleanup in the caller, emac_rx_packet().
When emac_run_xdp() returns ICSSG_XDP_CONSUMED for XDP_DROP, the
caller now recycles the page back to the page pool. The zero-copy
path, emac_rx_packet_zc() already handles cleanup correctly with
xsk_buff_free().

Fixes: 7a64bb388df3 ("net: ti: icssg-prueth: Add AF_XDP zero copy for RX")
Signed-off-by: Meghana Malladi <m-malladi@ti.com>
---
 drivers/net/ethernet/ti/icssg/icssg_common.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/net/ethernet/ti/icssg/icssg_common.c b/drivers/net/ethernet/ti/icssg/icssg_common.c
index 0cf9dfe0fa36..0a3cf2f848a5 100644
--- a/drivers/net/ethernet/ti/icssg/icssg_common.c
+++ b/drivers/net/ethernet/ti/icssg/icssg_common.c
@@ -1075,6 +1075,11 @@ static int emac_rx_packet(struct prueth_emac *emac, u32 flow_id, u32 *xdp_state)
 		xdp_prepare_buff(&xdp, pa, PRUETH_HEADROOM, pkt_len, false);
 
 		*xdp_state = emac_run_xdp(emac, &xdp, &pkt_len);
+		if (*xdp_state == ICSSG_XDP_CONSUMED) {
+			page_pool_recycle_direct(pool, page);
+			goto requeue;
+		}
+
 		if (*xdp_state != ICSSG_XDP_PASS)
 			goto requeue;
 		headroom = xdp.data - xdp.data_hard_start;

base-commit: 908c344d5cfac4160f49715da9efacdf5b6a28bd
-- 
2.43.0


