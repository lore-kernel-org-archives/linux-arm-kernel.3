Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0218CEDD8A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 13:56:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fxLTEw1wbmrYbdIYn+VHy3lKwPk7oPIOcjhjOIOC5uI=; b=bWhvWkJvT6ay1ArChYOxoIq6Eh
	GgRN9YHvAT4pm3YuE2lHX3pm/cGgFmrbrUvuScqsDeK/fpgegG9KrPsZGb8g4yU6muBzqlQGhYfYE
	RI0LA27mFe6MyfL7tsdmJxz88Tk3bHzZ6Mh74jMH/ELWIPg3XB720+YDqBYLEqF286JlYUOl7wHEK
	bMQChhaT1N/bPSfbT1oeEmpwHKqDqOM11gDkXRH0Eh0jAUUS7ybYQeZYIC90LH7DS4OV98WIN8ydT
	lT1LNFroQo1H2tAcRcltA+SCUN0AW6P0TW11ZQR9rHk8jXMeipQHpHK2bYJuB54Pb/2BtGhjVnFfq
	uw6/cAqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLMC3-00000000V8s-1xSi;
	Tue, 18 Nov 2025 13:56:27 +0000
Received: from mail-centralusazlp170100005.outbound.protection.outlook.com ([2a01:111:f403:c111::5] helo=DM1PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLMBt-00000000Ux1-3faO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Nov 2025 13:56:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GZ/lXjAKoRk0iDpadU+PFfWYUfeDHlNAiDYn2IFehv+RhPpVtTI6K0bSuGaO0dAn8az9k0ZVPSBTbnKy0jqbwthTlfN5CRdFqeToV8Tbcp3Undov6cHhKPmnhrl4kjN7wKz1yRfFVC1os10VL8qKipX+9zPbgvcJIPKbH1z0/wELmFqLs5+xnJvAKAdjNTkqNZKqSWP3ASg0CVdVnZx61jfYkZopdUBKwyAKa0W5z6uz88rr//rijd3D2Fp9wIJcYgUp+wOze3ZQyozv5LSW+Otya3IqzQBSyja7wEJRxmc3H8Fw7hNRpantIPvEtiukjNyu+qgUmxwIRhVNJ/PHwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fxLTEw1wbmrYbdIYn+VHy3lKwPk7oPIOcjhjOIOC5uI=;
 b=GBfnnbiXqDfyCBg5doo2BBkxuKS8voHGcfjwYBna0FQ075232GR7vBoAd9mi80Z7Rhsftjg+NsFTt0TxE7al/mUO2nRL9XT1l/+uSOBDmbaWqBkaII/HkAyYma1RwmwI7U609a4E6P1HykwSDiftIvYbBam6EV8GaUay9LEBlN/2V1SRWEb2ATVc4UrzkARrYmBRT8LMDProOMIN2112dlp+zkMTK5CuBE6JiicfdSqzC6aYFcrF+T0EJiQLESjjaUE/Y8mxdvU/bJG9vT8SZZrLNiYClmlxZziVB9/OAYUax7aByFC4oWcATsnpM5ZjHrfi5/JJ5XJhL9VdKU2Yow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=kernel.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fxLTEw1wbmrYbdIYn+VHy3lKwPk7oPIOcjhjOIOC5uI=;
 b=HVYBoUEIvnBpD8Ccdq0HvmRSGZdw34svYRADKmmQeumS+9G/IgRgShsf46eiINsWn4fcvjlqnYjSnjmw/vhpl+xgn7TCcBtmpM7AR4zo1UrEpmbfxKuHuHx0CTThPrmRKzZlGJpsnQPujBYfjBbfvyrPvMyQcM7c+tX/zYOvVLU=
Received: from SA0PR11CA0200.namprd11.prod.outlook.com (2603:10b6:806:1bc::25)
 by CO1PR10MB4756.namprd10.prod.outlook.com (2603:10b6:303:9b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.21; Tue, 18 Nov
 2025 13:56:11 +0000
Received: from SA2PEPF00003AE6.namprd02.prod.outlook.com
 (2603:10b6:806:1bc:cafe::66) by SA0PR11CA0200.outlook.office365.com
 (2603:10b6:806:1bc::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.10 via Frontend Transport; Tue,
 18 Nov 2025 13:56:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SA2PEPF00003AE6.mail.protection.outlook.com (10.167.248.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Tue, 18 Nov 2025 13:56:10 +0000
Received: from DLEE210.ent.ti.com (157.170.170.112) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 18 Nov
 2025 07:56:06 -0600
Received: from DLEE211.ent.ti.com (157.170.170.113) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 18 Nov
 2025 07:56:05 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 18 Nov 2025 07:56:05 -0600
Received: from lelv0854.itg.ti.com (lelv0854.itg.ti.com [10.181.64.140])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5AIDu5c5153023;
	Tue, 18 Nov 2025 07:56:05 -0600
Received: from localhost (meghana-pc.dhcp.ti.com [10.24.69.13] (may be forged))
	by lelv0854.itg.ti.com (8.14.7/8.14.7) with ESMTP id 5AIDu4Uu004206;
	Tue, 18 Nov 2025 07:56:05 -0600
From: Meghana Malladi <m-malladi@ti.com>
To: <horms@kernel.org>, <namcao@linutronix.de>, <vadim.fedorenko@linux.dev>,
	<jacob.e.keller@intel.com>, <m-malladi@ti.com>, <christian.koenig@amd.com>,
	<sumit.semwal@linaro.org>, <sdf@fomichev.me>, <john.fastabend@gmail.com>,
	<hawk@kernel.org>, <daniel@iogearbox.net>, <ast@kernel.org>,
	<pabeni@redhat.com>, <kuba@kernel.org>, <edumazet@google.com>,
	<davem@davemloft.net>, <andrew+netdev@lunn.ch>
CC: <linaro-mm-sig@lists.linaro.org>, <dri-devel@lists.freedesktop.org>,
	<linux-media@vger.kernel.org>, <bpf@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <netdev@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <srk@ti.com>, Vignesh Raghavendra
	<vigneshr@ti.com>, Roger Quadros <rogerq@kernel.org>, <danishanwar@ti.com>
Subject: [PATCH net-next v6 6/6] net: ti: icssg-prueth: Enable zero copy in XDP features
Date: Tue, 18 Nov 2025 19:25:42 +0530
Message-ID: <20251118135542.380574-7-m-malladi@ti.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251118135542.380574-1-m-malladi@ti.com>
References: <20251118135542.380574-1-m-malladi@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003AE6:EE_|CO1PR10MB4756:EE_
X-MS-Office365-Filtering-Correlation-Id: 3068230c-339c-4521-e158-08de26aa3ada
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014|7416014|921020;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?+i9xOXwKXy/BAY3oF2z7Ot8SQD/Q4pWo2OI8n4un9AwcR2mVUd9dHGTO32Zk?=
 =?us-ascii?Q?7GLNdGDOzP2+xSKPt5rN7Eo7aflYaudklZtIfegX2pOdEJo7d/FDk7+Uw8ol?=
 =?us-ascii?Q?Np86eBMgIAf/V8vw6PoamWyNsMakvf15E+3i9GMW3B0ZoarM5mSR/b63lHyn?=
 =?us-ascii?Q?aw9byXCrcyebvb5T1gBsrP+3plwXNxGwUb0+/zclywd2uxouQBr7VvPyKzAt?=
 =?us-ascii?Q?KKVfciMAqEBsv0a/3rt+N7EgYSPxz/1sWTi8fzMM2OFMYiULag6Ey6Dj3esi?=
 =?us-ascii?Q?Hh7MjR1RcajZjjQeacF9dlSGhiaE45M+L/Qf3iFIAjEhochSk2JLY33fjk2t?=
 =?us-ascii?Q?7cAAA82Pq+8WggHwwFoLGdXSozK5ZLV42zYmQqqC549gk/rgJlpUlc/vfprP?=
 =?us-ascii?Q?zwgRwYQ+WAN6QTITwQA9qTA5HY16aJJ6oEB9ULNpPtvuiU+fRPafPBQA/o71?=
 =?us-ascii?Q?VycAK8APkKcXLeN8o/1V0525nRgu4Hb7xe7q2Sg5oBfEeeibfApSMerfODXV?=
 =?us-ascii?Q?E/yDMUH77tq7/HmlWn4b66VagT7Of1PrbL2UeN+9Y6ERFLjsTGRZx0pIJFaV?=
 =?us-ascii?Q?+GTwPdIDeqxfJaVTDascN9vRyAt2wuveXkfgi2vSy2vSXjxAeF3OPoEFTTXW?=
 =?us-ascii?Q?8lQs3Ti34rhInhsXlSZRku6L6NT/O7BIAWrBaKbBnJFCuFn7MZ2A18o/dj0u?=
 =?us-ascii?Q?BgkHsX1okkhKWHZ0u7SbDlrRKOhPbHHiTXDstPMS7qJy7E1wNutjuAvJpSWh?=
 =?us-ascii?Q?hz4oe6iyF7vcLk6ymxwdiiUU/itAzvsNfCnE7mjf3tMdES8Edtlk7EQwONKF?=
 =?us-ascii?Q?YrY39qy3QdafiKooq+oVjMU2ldo+kXWY7fTPWQFveR1kz/jpSFYKEme04kcg?=
 =?us-ascii?Q?Rk5aD/xzLKwvi+t9A6ZtO3KEYwCLxQXR1u+r7s4k1dzGCKbZwlf9abAsMVla?=
 =?us-ascii?Q?+OV70WPN/aqR8p2hJuGEyCX63YDUg4ZCjCt8qoM/vAwsPmxXPxdTmXbh3Yy3?=
 =?us-ascii?Q?nelOMu1Wu+RG4s8tLO3HGnac50Rn/2Ax1y/3iGADCjEeOLyUk+25lnBLAK2U?=
 =?us-ascii?Q?wTxvMLSGdjXU/e6Eb+ozv5Q2O8TfO31Ilk96rplHozr26iTBoETotEx8OpAp?=
 =?us-ascii?Q?YODgyZsfx7N5tSMyo4ZN61JjkB68JH7/Wk86k1oC4f38ljSGnwggIeXDfEGh?=
 =?us-ascii?Q?ADVavkaBGWj6jVJ6R4FgsD23s6y84qASC1kvEwbvi9OzZr2yEal0XM71M5MB?=
 =?us-ascii?Q?BQxEDb/mMTXsdteSe4SnDb9P0BUoja8F5sGP7fwIIPqKpMGkv7JqtWhK/w/R?=
 =?us-ascii?Q?khl5h1Dgnrai9M24sbCFF6WrGB1ZLpzcr6gaDV217IkDYZDaemHrhIEk21Pd?=
 =?us-ascii?Q?ubAiYLDgEWGm6e+lQHQqLHM0E+YTA4wrUnfX5YSsriTf6keTurFG02ENvaMq?=
 =?us-ascii?Q?1DdNcfELLu4o9NX3D9d4/gg/MBmZqRN6C7sxHF0nk72eC1iwCrgR5aYnTFk+?=
 =?us-ascii?Q?kv3OjS3Js4as7FGgofXFkINuHEHjo5VzgqYWK+UXcwqNBa5NTnjp8I7dI6FH?=
 =?us-ascii?Q?C2Gwy7xlxeqpqIDr7L8=3D?=
X-Forefront-Antispam-Report: CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014)(7416014)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2025 13:56:10.6481
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3068230c-339c-4521-e158-08de26aa3ada
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF00003AE6.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4756
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_055617_928417_1703BD8A 
X-CRM114-Status: GOOD (  10.25  )
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

Enable the zero copy feature flag in xdp_set_features_flag()
for a given ndev to get the AF-XDP zero copy support running
for both Tx and Rx.

Reviewed-by: Jacob Keller <jacob.e.keller@intel.com>
Signed-off-by: Meghana Malladi <m-malladi@ti.com>
---
 drivers/net/ethernet/ti/icssg/icssg_prueth.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/ti/icssg/icssg_prueth.c b/drivers/net/ethernet/ti/icssg/icssg_prueth.c
index 22de04ac18cb..f65041662173 100644
--- a/drivers/net/ethernet/ti/icssg/icssg_prueth.c
+++ b/drivers/net/ethernet/ti/icssg/icssg_prueth.c
@@ -1554,7 +1554,8 @@ static int prueth_netdev_init(struct prueth *prueth,
 	xdp_set_features_flag(ndev,
 			      NETDEV_XDP_ACT_BASIC |
 			      NETDEV_XDP_ACT_REDIRECT |
-			      NETDEV_XDP_ACT_NDO_XMIT);
+			      NETDEV_XDP_ACT_NDO_XMIT |
+			      NETDEV_XDP_ACT_XSK_ZEROCOPY);
 
 	netif_napi_add(ndev, &emac->napi_rx, icssg_napi_rx_poll);
 	hrtimer_setup(&emac->rx_hrtimer, &emac_rx_timer_callback, CLOCK_MONOTONIC,
-- 
2.43.0


