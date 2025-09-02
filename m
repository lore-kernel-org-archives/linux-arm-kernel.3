Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D3C5CA1002
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 01:35:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=BVVNzRh8T8JLyCNoAZ79IEkQcS/VJTNo8wJjeji3QLI=; b=jJTdX9dwdmdYOpGGkpJw05dqwS
	1Wgo/D4hb9UoHyzri3pmzP1mPbNiVcYJnjS3/iqnIfIpSMEpKYREnwadxKnT/jmetxm4XFaJ3a5vv
	w5uEHp1uDXeJslOpGiT6AOD4x6k+nXjPuVxETdBamGYxubP9QFwhdqtVAgXZ7R7kyIpHrsYfaJz/O
	DjfLKqpEfnENtSAiOexFQgKb4x5FaNs815GEs90niZq8ivpw37Z1/+quYI6NX+tHKZwPSiE+Tto7Z
	LAAY0drzuZJc4cK7HQ30qL/WCo/zSvSbH0G94kujJYAEdwTiSTDhhqqkDOvB2De2XkTLJHz97v9UO
	1lzJe2Mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utFvd-0000000EiVt-1Vcv;
	Tue, 02 Sep 2025 01:35:21 +0000
Received: from mail-mw2nam04on2061e.outbound.protection.outlook.com ([2a01:111:f403:240a::61e] helo=NAM04-MW2-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utFsw-0000000Ei04-0E5v
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Sep 2025 01:32:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XiqGjJICPDKiUAYkW88lsWJXdSFjU2nXvDj/xPjkjo1U+oSCH1T0XGw8BOLBDMaHfSQLNXr9ax/SYtFefmGyRiBN0yxdykJg5RNl+jAJ2x6HaGl2s+3A15qtuAR+9EXpuSgoejV1nEHOaL5VAOrqZQ1bE2hjoTDTpGVUG9IkRekf+SmqNX5NcivDeJwBDKZPIYy1WC7bk3YJ9VtC4NI+TTdxR1vcTB6grpG+VHR+EiKLLtkgqOLtXXuzY/oxsacoRxBDdTmuTfpvd5xAF2e7YMCokLux6tqUdReuRsfrH1vH0xUIRKRjc25E1rHEq3oAIMmyPon8vUI7FVDxUIGG+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BVVNzRh8T8JLyCNoAZ79IEkQcS/VJTNo8wJjeji3QLI=;
 b=bQqcYbmUV7G4E6Klo0wU+NlupPzQdlAZ6k3iky3cgWJU+5lfpCG6O9TPRabjzvZmmBOU/qkDieRGK4BRdsoGD3jpTDlSlvIbKfnE16cfM3fE7yQdhe4UYlABLQzODRgIgODVl+Ui4JUGNCYL7yRvKh4nH1CKiXjEDFzGq3NVIDCNAkDczJ2czA/6qENwviNtkW+Eg4B6busb7FpApnAx6XHb0yZrbmZOU2LaEUCQLuSZnsnwZNZKawEf3naBAfkFbg/KTL2ux4J2pavzYrKRaYvxGse2EFisDFtW/9q7ShzIrBxgC6ue45SVwgsxD14mgklLuh32+8BxELuMtKzMZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lunn.ch smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BVVNzRh8T8JLyCNoAZ79IEkQcS/VJTNo8wJjeji3QLI=;
 b=SDfo6bmwUZsmD7INo1WTQlIT53v+3TFY9oXZfC4na2ubu/RDnRCIyi/cTlM1cb78oI4C/0rPqSKF5R+dOHiBMYHl1vvapeUSGka2DpqZdOZ9/3sC3qaPrd1Y7OWcrdyQ2EP/WIzRxIo5ts2Qn6dH9rEnzRnwe+RfNKjctaN3d3w=
Received: from SA0PR11CA0117.namprd11.prod.outlook.com (2603:10b6:806:d1::32)
 by DM4PR12MB7598.namprd12.prod.outlook.com (2603:10b6:8:10a::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.25; Tue, 2 Sep
 2025 01:32:20 +0000
Received: from SA2PEPF00003F65.namprd04.prod.outlook.com
 (2603:10b6:806:d1:cafe::c8) by SA0PR11CA0117.outlook.office365.com
 (2603:10b6:806:d1::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9073.27 via Frontend Transport; Tue,
 2 Sep 2025 01:32:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF00003F65.mail.protection.outlook.com (10.167.248.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9094.14 via Frontend Transport; Tue, 2 Sep 2025 01:32:19 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 1 Sep
 2025 20:32:18 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 1 Sep
 2025 20:32:17 -0500
Received: from xhdradheys41.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 1 Sep 2025 20:32:07 -0500
From: Abin Joseph <abin.joseph@amd.com>
To: <radhey.shyam.pandey@amd.com>, <andrew+netdev@lunn.ch>,
	<davem@davemloft.net>, <edumazet@google.com>, <kuba@kernel.org>,
	<pabeni@redhat.com>, <michal.simek@amd.com>
CC: <git@amd.com>, <abin.joseph@amd.com>, <netdev@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<stable@vger.kernel.org>
Subject: [PATCH net v2] net: xilinx: axienet: Add error handling for RX metadata pointer retrieval
Date: Tue, 2 Sep 2025 07:02:05 +0530
Message-ID: <20250902013205.2849707-1-abin.joseph@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003F65:EE_|DM4PR12MB7598:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d29c0bb-ae93-4a3f-50e9-08dde9c08ec7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?+rQ+gKSEWeN5D3j20nuT2TmErrBsk7L2u05Pf6uUL4AIG6ygdR81HfvGqT1s?=
 =?us-ascii?Q?VxTeV5KpiXzZkJTIsqX0CqiK75fpgOk5T09QgQQ/HTxdl+9usRE2UBL9OVkZ?=
 =?us-ascii?Q?TgzF/qa5vjUQv8yS+6LWSeSFXtuOx/I0lMNzKbh0Q0UCEiZE44ecxWhuQVLt?=
 =?us-ascii?Q?A4FoMs44RFeGH07z7I61m2v2Bst/YyFBa9h1jbn/qfoLJEbveQ9Fe78udc87?=
 =?us-ascii?Q?4BKCgYzFPAwFJeN3meacylgNvPxQVHmfxp0dR9zh815xdAoE56kD2LCqLwV1?=
 =?us-ascii?Q?zKWmSLdhYEeYYRYsHH1VHs00nsJHg2T4yeCMwz1ElwLRn2QhKt6679T7zTy8?=
 =?us-ascii?Q?L2Yv7BWuKEzcsQM4fhgnLfAxDfh6TsGAzAqkNCvVI9DkZQoCUnkpTxjMcIVI?=
 =?us-ascii?Q?SIj30GeRmiM4DMhxTLRDGsi3BqYHVDT0Vc5ShbPldT8QRJzigwh4sxz/ek9R?=
 =?us-ascii?Q?L+DGLBG4BfDWGJO4zMyTsiZZeDGEKX2fR5rCerPKyQYffByma+i9Qt7atquH?=
 =?us-ascii?Q?0qg7GlJx1SorN0YtHodt2W7yQ7IRaCuAUe4Ay2pXxnUAe3eE1jePXtckm079?=
 =?us-ascii?Q?WrGBkiNOzTiNptLjeqgFCdBq290h3QusiyxwZQS3EBduSwEMcw9rmFHma0ou?=
 =?us-ascii?Q?EJv18HQpUv53UBQNcTLviCEv4LtmmQbCDZxZji/A5owZF0s88Ss4uAEVgo1z?=
 =?us-ascii?Q?o4WK6Z6c+jYtCYqujSwB5l5IbYfJNgPSGs9g2FS/W9aQayfOeTsmTQpnRtXN?=
 =?us-ascii?Q?e4Fzd4Nz70hDRdrEBeEgDxESmytK1L7bRFMsfxaqc8S+1Jjgbrv1nkyOh/UL?=
 =?us-ascii?Q?zUYU1+2bgxkm9MUNXWPn6efbAtoSzLstv4U3hLQJDSShvcgKRYYHUjlOXXpa?=
 =?us-ascii?Q?j+LY2yl+IQC4NxsA1lK2d4GyRcFArtlUbiSarxdo0qTl295fjO1vFu0AqlpH?=
 =?us-ascii?Q?dJN5qCH+nm+ZRnKjVo4gUiT3yUinB6VF9pQidiapBaSBptBEGxipNTb8KWEP?=
 =?us-ascii?Q?ZvkNe/YAqJ+nKfj4ljhJFTddTpDfQ6fjcY0d/xN/iu23yzku7Ey8qphLHTWa?=
 =?us-ascii?Q?QUqs7zr9HljkDhnUzo/jFsDUWL3pPYtSZPPgZSTG0DO/enVGQYckqQHoo/zB?=
 =?us-ascii?Q?vT4+ztLQ78n3xjOcdwPigpR1ZXPsmg00FpOC6Zv+7MPVczVhAMK6aZqd4ZBx?=
 =?us-ascii?Q?Uq7eLZ8eQPpBqUYbvtC2YrzcWwyasklS0fgEm3dXvNkrIyCDzcwWnudcLJKS?=
 =?us-ascii?Q?Am6IDakCURoOzH0ZRk3spoT5ykPPzUykFvO+yXyr45r2cmGbaYL7myHVMUCz?=
 =?us-ascii?Q?r8IkKTKhzCKMDOmpt2Wusu3XAu0oGFPdDidIp3YsgsL+D0FhOMOw2jgQEwYR?=
 =?us-ascii?Q?IQtELYYHgSeBxokqjsL3aUnWlF4CW3tYJWLANBUjIzJ5rjPLWg+9irFN0sm7?=
 =?us-ascii?Q?u/B1J1WEiCf8jkQEZdKEBMsn32t1O87SgXe4qu3BtegcOMrQgwqNfmUCkP8d?=
 =?us-ascii?Q?EpUQlcffVGbneCYW4l7U5wCxbAhuCMhUTCgM?=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2025 01:32:19.4221
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d29c0bb-ae93-4a3f-50e9-08dde9c08ec7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF00003F65.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7598
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_183234_084882_57736133 
X-CRM114-Status: GOOD (  12.18  )
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

Add proper error checking for dmaengine_desc_get_metadata_ptr() which
can return an error pointer and lead to potential crashes or undefined
behaviour if the pointer retrieval fails.

Properly handle the error by unmapping DMA buffer, freeing the skb and
returning early to prevent further processing with invalid data.

Fixes: 6a91b846af85 ("net: axienet: Introduce dmaengine support")
Signed-off-by: Abin Joseph <abin.joseph@amd.com>
---

Changes in v2:
Update the alias to net

---
 drivers/net/ethernet/xilinx/xilinx_axienet_main.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
index 0d8a05fe541a..83469f7f08d1 100644
--- a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
+++ b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
@@ -1166,8 +1166,18 @@ static void axienet_dma_rx_cb(void *data, const struct dmaengine_result *result)
 	skb = skbuf_dma->skb;
 	app_metadata = dmaengine_desc_get_metadata_ptr(skbuf_dma->desc, &meta_len,
 						       &meta_max_len);
+
 	dma_unmap_single(lp->dev, skbuf_dma->dma_address, lp->max_frm_size,
 			 DMA_FROM_DEVICE);
+
+	if (IS_ERR(app_metadata)) {
+		if (net_ratelimit())
+			netdev_err(lp->ndev, "Failed to get RX metadata pointer\n");
+		dev_kfree_skb_any(skb);
+		lp->ndev->stats.rx_dropped++;
+		goto rx_submit;
+	}
+
 	/* TODO: Derive app word index programmatically */
 	rx_len = (app_metadata[LEN_APP] & 0xFFFF);
 	skb_put(skb, rx_len);
@@ -1180,6 +1190,7 @@ static void axienet_dma_rx_cb(void *data, const struct dmaengine_result *result)
 	u64_stats_add(&lp->rx_bytes, rx_len);
 	u64_stats_update_end(&lp->rx_stat_sync);
 
+rx_submit:
 	for (i = 0; i < CIRC_SPACE(lp->rx_ring_head, lp->rx_ring_tail,
 				   RX_BUF_NUM_DEFAULT); i++)
 		axienet_rx_submit_desc(lp->ndev);
-- 
2.34.1


