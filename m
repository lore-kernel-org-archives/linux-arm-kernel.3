Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DED6D74977
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Oct 2024 06:31:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LMVmU4MBABheMRbk3xan0ghiQL2l3TGAHIzWCQFRoJI=; b=YggO4Mjeg8QLB/4JNwjuQ1Qsmt
	GIz94arz/1z43p3Eb726hFER8eVxXxejKR0dlZZI5iSpuzXvFcyyIdgWfENPwRTI/XUp6TKv6CAKD
	1G1tHyDFxegvqb28WjzP32ZNTmoHGuMkmOe3evpZf1Fhnb3Gb9No2tg1ELsS1ar9UMvodlRiEe0kx
	2aN6C+k1/2n3pucjw331t2ZjdazN62CRT0fHXcSDIJ9wwFbYaLL/AGSUrQ7Q9IWx5HT2Ac40K3S8E
	cyb336JB2V8GWVVFY9HEAt91K2XsOamxOWq9XCCsoP98zK4VvUB+psBIxpJhn0BYq8PSrjtAisYSG
	D9vZ9eKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t62EO-0000000GxFN-1pa1;
	Wed, 30 Oct 2024 06:31:00 +0000
Received: from mail-bn8nam11on2061b.outbound.protection.outlook.com ([2a01:111:f403:2414::61b] helo=NAM11-BN8-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t62A2-0000000Gvzz-0V0M
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Oct 2024 06:26:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J74Gflkjsgs077tMnWlxXOkL/Ns1eXBnGoS+GNZoDOe563BaZjEwJB32DMk9PAxCE2peUX6FfIUbJAuEnsvkFs+7nl45xg9yTfTbO+V3xjHU6JSmxKtBxm8clFjOHXALbFu8i+WQsH1s9i0WKHvOJgApIxGRQ07o5//fuBA0Lkp+d0gAg0vlUqEZJPhfneY0WVhkuNXFFjjQDKbQvEPbPXRB5lLvnUYE3EOjyhJ1QLbW7Vp2ZcPUF7A3Ev/g/q62KdyyBdYaIi/A3LgMhGW8krHVmari4+a0c5ngB0GeNWDlzDsf52T/QTPAA5jL1Ob2rmZD+7VcBbg0tAQWoHU4aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LMVmU4MBABheMRbk3xan0ghiQL2l3TGAHIzWCQFRoJI=;
 b=Ux5atxz+hamZilPVqbTziIz/ZOYzapnRkkGCk8t8ouQpSgUuQtjLA8NjdZ7P7uAASg4xPdKf5ivJU3VkoZnx3/sfnaQgOZfLzhBnC0WmRXWKyS5S2ijbKX1Gnvi/UxM0BujJ1T+8cf7/GHuhlcVnI1d8BpSRbqWK+05GYETyBIRbXFncfr8nz69L8WFGT1RcCZfi2BFlGsG2E+dAxU2x6jhBrjh07L6oiv+uLpDKly6HHGCA8NCgI5TBYSWOy4Zca2riJnmz7FuRwBYM79radWlUO+DBvdyTL6slhvNz3ebU28n4n0mh/CfRqG6h1CgOD5gE2j/ry1k63uznVZcI2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lunn.ch smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LMVmU4MBABheMRbk3xan0ghiQL2l3TGAHIzWCQFRoJI=;
 b=kToyckQAKxsa5An6UdiNoySbZw73Vg48V9kQfp7xv1vUmXjuOxOXK65GzS2tJiszZ06liOZ+FzP0JzoWEp08vGcnvDbvrBRLecELwIyGuR2qYBXw+v1q6cv2u9As5Pv3frDAewMKG7jkr+6pJ7vDhZv+fRfdAzcg9NQJP+FtZkE=
Received: from BN9P220CA0021.NAMP220.PROD.OUTLOOK.COM (2603:10b6:408:13e::26)
 by SJ0PR12MB6925.namprd12.prod.outlook.com (2603:10b6:a03:483::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.27; Wed, 30 Oct
 2024 06:26:21 +0000
Received: from BL6PEPF0001AB51.namprd04.prod.outlook.com
 (2603:10b6:408:13e:cafe::f9) by BN9P220CA0021.outlook.office365.com
 (2603:10b6:408:13e::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.26 via Frontend
 Transport; Wed, 30 Oct 2024 06:26:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL6PEPF0001AB51.mail.protection.outlook.com (10.167.242.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8114.16 via Frontend Transport; Wed, 30 Oct 2024 06:26:20 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 30 Oct
 2024 01:25:44 -0500
Received: from xhdsuragupt40.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 30 Oct 2024 01:25:41 -0500
From: Suraj Gupta <suraj.gupta2@amd.com>
To: <radhey.shyam.pandey@amd.com>, <andrew+netdev@lunn.ch>,
	<davem@davemloft.net>, <edumazet@google.com>, <kuba@kernel.org>,
	<pabeni@redhat.com>, <michal.simek@amd.com>, <netdev@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: <git@amd.com>, <harini.katakam@amd.com>
Subject: [PATCH net 2/2] net: xilinx: axienet: Check if Tx queue enabled
Date: Wed, 30 Oct 2024 11:55:33 +0530
Message-ID: <20241030062533.2527042-3-suraj.gupta2@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241030062533.2527042-1-suraj.gupta2@amd.com>
References: <20241030062533.2527042-1-suraj.gupta2@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: suraj.gupta2@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB51:EE_|SJ0PR12MB6925:EE_
X-MS-Office365-Filtering-Correlation-Id: cca3a678-0761-46d2-855f-08dcf8abc4dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026|921020;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?sCEoELnb4qM1jyGynUoW1RdL+AbCOEwalxQ/vHMrmov98mzrgpIrxeVtOZpa?=
 =?us-ascii?Q?NcyhG7Wl5O6Uv5vYIJPKoe0kGCFSJWrRuG8NQGSLs4w5wxWDryYPfpHqFNXf?=
 =?us-ascii?Q?XHf/OG5uGGbS7KLxuUuUc1vuI3tWdWsrGgwEcBkUHWgnzTneJ86+NDZR+mQj?=
 =?us-ascii?Q?aU4VMvVp924aHHvb90q87iiO4J1cQwotrb+1ZXJpu0wepWQnBLE1eCwJOQhg?=
 =?us-ascii?Q?X7qYRBy1tCUsvK3TaDKMd/G+qCGtF5abC+ubHNCGizi5e3g7nMzq+nP9jo0W?=
 =?us-ascii?Q?yfys9lmbuBQTSsORwoqGB8QgyrcU1dNG4lJu9KVjnDJedFTLJhM+HxdWqrCg?=
 =?us-ascii?Q?408vdPNWuvdsM3hAUNhMMRsAgS4VBLwFUmi2uBaHJ5c3O8IWBcvM4PKG6O2Z?=
 =?us-ascii?Q?7zmh6HbYKq184WO2OC4xuxCJjCd5u2WnNZj+UKExVu1vW4LHbMlKlvKOKs87?=
 =?us-ascii?Q?8PmJFoKpuCLGrf5/ca4WC0n4/Y8bmabC/8nl+iTCAttVzYrAEHRCjLAyyZao?=
 =?us-ascii?Q?fFxljU06VmZp2YeVFXAE+s1BvLy1UxUk5w8eCJjr9bw188yPWEXS1nXzu2HF?=
 =?us-ascii?Q?cqOrqcwTBx9Z4rWOQ/+Kqxac1FYRg4Qer24KiCDLcNN2dNCgUZxOoEVBP04S?=
 =?us-ascii?Q?u01c7RbBpDoHpX797HF8EOrpimujMKT6cHByL7pPMlEq4tE7crR6UZs2N/NM?=
 =?us-ascii?Q?2sdQe7dpxhSFamTv0PHhwvi8aHJOJehszTs5o1fsx5dFLmiJqstQPaJp2Bj9?=
 =?us-ascii?Q?BM7p86PZ+Wl61kPGUbJNCy2JPUni5XdJ+hkWOx7SGKfaXz0yB0lG8Rs31Z0y?=
 =?us-ascii?Q?mR9oYFOI5pSYwSSK3Ri90mqMTauj1ZpKMt0zYVqX/vJZt6rzZyARS7BpqmrU?=
 =?us-ascii?Q?wI+UBbA/PUQwAUGXBnX1XIybiootzVY5ma0AEdxxfxTr0wiA3CbR4Qbf+MHz?=
 =?us-ascii?Q?MAfzC3nX1SQIv/ZhVMNeV776qHiIb53KOarfyiYAILPdm0CNiXR0ZT8w5+8u?=
 =?us-ascii?Q?5Ixel7cdvmBecnu/In204vKst3QT847hYK2g04i9fcMvByto8v7KhhPjMymf?=
 =?us-ascii?Q?rSUPkLM79++jI5mTytopeahqhH8yyQrKLTW8kCTcyv+0YNWb6r57ST53FqSk?=
 =?us-ascii?Q?d9q1pZt1YbuJaKDBedRA/mJAOM/K4ZqRhB73T3zTmYzIn7koERB+9N3ORpkj?=
 =?us-ascii?Q?qHHNoTXtmZaj4rtuZgzl972xJyj0PVISk04KhIEbg6Rsdm0Q7Bia6cUPVe+L?=
 =?us-ascii?Q?NQbTBtrt7ccevNpwJncDutokndX7FtOb/bM4hIUmcQe6Rr7X7YBzFeLW9AxM?=
 =?us-ascii?Q?IEXTUPqmvgnX6ie4IvhXc1M7IgLE+6b9y/vbzvp5WGNigcafvc5CQN7BuS6r?=
 =?us-ascii?Q?Ls8swLCCGIEVmUDudh/8PHp9IaiFxgQcwh5Lr8alTLcsess7L70K/wYw7k8z?=
 =?us-ascii?Q?nrLaG/qNrcI=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2024 06:26:20.5090
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cca3a678-0761-46d2-855f-08dcf8abc4dd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB51.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6925
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_232630_182578_7F2586C4 
X-CRM114-Status: GOOD (  11.42  )
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

Check return value of netif_txq_maybe_stop() in transmit
direction and start dma engine only if queue is enabled.

Fixes: 6a91b846af85 ("net: axienet: Introduce dmaengine support")
Signed-off-by: Suraj Gupta <suraj.gupta2@amd.com>
---
 drivers/net/ethernet/xilinx/xilinx_axienet_main.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
index 0f4b02fe6f85..620c19edeeee 100644
--- a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
+++ b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
@@ -926,8 +926,14 @@ axienet_start_xmit_dmaengine(struct sk_buff *skb, struct net_device *ndev)
 	dma_tx_desc->callback_result = axienet_dma_tx_cb;
 	txq = skb_get_tx_queue(lp->ndev, skb);
 	netdev_tx_sent_queue(txq, skb->len);
-	netif_txq_maybe_stop(txq, CIRC_SPACE(lp->tx_ring_head, lp->tx_ring_tail, TX_BD_NUM_MAX),
-			     MAX_SKB_FRAGS + 1, 2 * MAX_SKB_FRAGS);
+
+	/* Check if queue stopped */
+	if (!netif_txq_maybe_stop(txq, CIRC_SPACE(lp->tx_ring_head, lp->tx_ring_tail,
+						  TX_BD_NUM_MAX),
+						  MAX_SKB_FRAGS + 1, 2 * MAX_SKB_FRAGS)) {
+		dma_unmap_sg(lp->dev, skbuf_dma->sgl, sg_len, DMA_TO_DEVICE);
+		return NETDEV_TX_BUSY;
+	}
 
 	dmaengine_submit(dma_tx_desc);
 	dma_async_issue_pending(lp->tx_chan);
-- 
2.25.1


