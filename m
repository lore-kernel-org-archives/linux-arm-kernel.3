Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83BF1CAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 13:36:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=OCtAyihfhsIfd3hXDp0jrlC5GG5ccLZNVwPCiKMwrGs=; b=I4EuzqrsFOBW+JuCoq0ft5hkEy
	4uc8AurpqXP8nwLIMRTxm1mYWCj2cSsP70YPKh6+QKRp2SpjJMUTmWRzH+vHnj/X6CMj2kwYoRbg0
	Os44niUnGJdh0EGZi9GNpMnPPwX9O/3TPjPFv0vD6ONBIb1r3FRPFv7A9qht6084qfz/bDgkiIEXB
	GjDa/JmHPXrybF18KqGmZ/i82SY0RVmopOkh+/4bcJBhKtoKgmiUwaOQ6NG9ge0HpNA+qUmnsZM3+
	SYOCq8LeXjUm23AqwQ5U0dPeP58H7nCiijhXBAK6SEJY92rfwKsEhJ93lnJVDzSFs0DmXmta1p9qU
	QXBGrVOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uysKt-0000000Bl3h-0YKt;
	Wed, 17 Sep 2025 13:36:39 +0000
Received: from mail-westusazlp170120002.outbound.protection.outlook.com ([2a01:111:f403:c001::2] helo=SJ2PR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uysKn-0000000Bkxb-1Itx
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Sep 2025 13:36:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j9nemgRvg8ZO5I8kk0iXp+NsUq1BDzm59g8RRp+aQRcfBo2Y88W49Ki06UeDYishdFLDAuL3ee7OZWAlLuz0lAv7x2fXZ8WirqBaoRyMlEPeLX02G16qB28GoyNAnvEPEeM5ke89uoK5gi6Qn5dnLyt+ePJLSL1AgbMffB0RklGno35n3FQNo/Urzfi5VTjuZg8MMlxv+F3LMc88eCMMYuZP5QikpVHVxS/WZ315taGo+NZW2pNJ/WtVhywLcMy31PlZrDr9tuxEy8YmW2rkKZipS6dw1sB9xvAMaVIs+u9C+UKq/1sRbv7M/ycobYc4y3vYeK7U3QcRu69eeuv85A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OCtAyihfhsIfd3hXDp0jrlC5GG5ccLZNVwPCiKMwrGs=;
 b=aTiCJEwm2wnFbfxOaryribcqTwcbqzA4Zv0FMPvcufT1URetfIhDE3XVtmAXoQP+CQpoh2N+tD3cVplYft6Ig6dQaTYct88c79YupQ7uKh820uO+BeO2M/hzlQFhJDTOeicxJIHMFy1Y8daqbHiosZ0WIS1b1/yaqyy1JS/D381/dJoCmnY6xUp6V9zFdraTQuyokDwPLyEfhvdMqA0uYOKr38/M5VdowG/BYmaJj62xARME+71Of5iIzfEE5pNkUcNzwWjXRxq7ZBcDNcyh+xulUBvMP7ZJ+vInAvzVSVcsSozVSmm3CN34tSoG+fm5WkScO0ZnBtOrqo4brzOYQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OCtAyihfhsIfd3hXDp0jrlC5GG5ccLZNVwPCiKMwrGs=;
 b=LIkrUNV+bxCHQjfvmLPLcb77MHA5Y0C5tgFM51tvz6QgpPC0SeQ4Q5m6GYEYYaukPwOTdQ2RwjasP+U8E/W3Stv14gK3VcTuoYbRoLk7M/ODkP1aiOJD4r028tl9K8ZjTu9LPjTFpxf2EVB4LqFIjgE9KXhYWdlrmhXNk9BSrPs=
Received: from BN9PR03CA0496.namprd03.prod.outlook.com (2603:10b6:408:130::21)
 by CY8PR12MB7267.namprd12.prod.outlook.com (2603:10b6:930:55::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Wed, 17 Sep
 2025 13:36:14 +0000
Received: from MN1PEPF0000F0E3.namprd04.prod.outlook.com
 (2603:10b6:408:130:cafe::95) by BN9PR03CA0496.outlook.office365.com
 (2603:10b6:408:130::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9137.13 via Frontend Transport; Wed,
 17 Sep 2025 13:36:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 MN1PEPF0000F0E3.mail.protection.outlook.com (10.167.242.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9137.12 via Frontend Transport; Wed, 17 Sep 2025 13:36:13 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 17 Sep
 2025 06:36:13 -0700
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 17 Sep
 2025 06:36:12 -0700
Received: from xhdsuragupt40.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 17 Sep 2025 06:36:10 -0700
From: Suraj Gupta <suraj.gupta2@amd.com>
To: <vkoul@kernel.org>, <radhey.shyam.pandey@amd.com>, <michal.simek@amd.com>
CC: <dmaengine@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH 0/3] dmaengine: xilinx_dma: Fixes and optimizations for channel management
Date: Wed, 17 Sep 2025 19:06:06 +0530
Message-ID: <20250917133609.231316-1-suraj.gupta2@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0E3:EE_|CY8PR12MB7267:EE_
X-MS-Office365-Filtering-Correlation-Id: 21898e5e-6b85-4f31-38da-08ddf5ef2bbb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?WEY9W3/QQNbNbjwmTfydNJJZ1XG/nyxqFzyXPWqmcPdnyr6OLdVeI0+WPmCD?=
 =?us-ascii?Q?C0P/nu19/ciH8ZkylgySExX4UqinTtSZcS3GOHtlRwxaqW3xlxPVP9xO5TfT?=
 =?us-ascii?Q?7GzuXfoOG2iQWYTVlb+D/v71ch6swafFvE91+x4bp+bp19UxVSyu/C1akW45?=
 =?us-ascii?Q?8qA4KUY0pXodi00i74vT6gVNlXxGDgCN7+mWBCcovidgl0254ziC2Zpb49Ha?=
 =?us-ascii?Q?7JRITJYNqBOr3IcTa8JBRs6EsMMnN5i2bVls0lQ/A1MB+ZbXyvYLXrAQyHpY?=
 =?us-ascii?Q?OCg2eZuPWiaeRgFI2H0SZmRxfMuR4G30WVRpdHmT9Ps+nwpJLPuyC2amFAnJ?=
 =?us-ascii?Q?dpPoXbuIc73hEek2uLrTAwjy0i9EVI4rgvr38kYZrE92xGOBSmiyy4eAK9N0?=
 =?us-ascii?Q?oCAXQEjFLsfWC+PSO0TIFAvCCeOPqRLlNZ27uE9ixR4q1lSL89j+vcPW11+P?=
 =?us-ascii?Q?dVvXxa4pF2ScQifivkkFUS39FbSdufeTOR4EQOZyQpjWLxvvoutzMfoi2ZKu?=
 =?us-ascii?Q?mL9LreLMGgim6jNzL9rqWf1PlA3eKLlMt7vLNecB9k23S0ntz/G32OVwnVSA?=
 =?us-ascii?Q?YV27F/a+FWW3kD1ZRnc6TraGc3giIB0x4AyNHaSECB0KcobmZQnz9FcBvzQE?=
 =?us-ascii?Q?RYlhlYM1MPH0F1sknVddUhIV5griMgjuEUuNmMLS8KVSMPHyx16hglyW5kIK?=
 =?us-ascii?Q?MSIeKa++IsTp9KsUOvB1yM1XaPmeJNa230Ww7713cdizFx44++H34wWHuF8P?=
 =?us-ascii?Q?vylb5/4t3vTDGc9iPk/rQ412r2b+mI48rR5Oooo2PCHYCJKyfmeGatpl2hDs?=
 =?us-ascii?Q?A1NhBwLkky2xMs7OUHrEcqItwUcEhaFuVRBkDTGX9aRl422gAqInHVLpkaZt?=
 =?us-ascii?Q?xd1NlIVYbNVWEElmMgAfXytyIWmW6cYe/XpzTrZBA8HUVuvv3IlFM7uMVlmJ?=
 =?us-ascii?Q?j2mcG5kkXCsobkPAnf98wY631Tg1QlUFpR4oMSAmOlLp5uLkGHkcgAKZbMBK?=
 =?us-ascii?Q?DuZehG0NMWmPJqENOY7r9walIaPDhKuaikr16V1NIlScTjv3313oZRWtsTrs?=
 =?us-ascii?Q?MTwg14GNKsGnPbijKcCF5vBtM+0FoH9y6HWjWXEiVRDVTi043UwKmR1FuK3M?=
 =?us-ascii?Q?qTjDGi9zeXlOBLtXB8WgmyShwM7ZnuQXS2esUbyHmVZgN9GJ32NMKQPkpYBJ?=
 =?us-ascii?Q?nMC8c7lhIdSFl278l6YQcXefDRJySp1ujtcHMZ5v+8Z3VyFB9pQNw5rUyzeB?=
 =?us-ascii?Q?hYd4HsqEAAuqaK4TiTikaJ7sSHIK+O4X4ww5lTFECbD5I9FeUE0oXrGia94N?=
 =?us-ascii?Q?e41I5CExnmPHuxy4htXzmzMK/x6jbcBP483gnp46eZOWZkrHdgpEN8BJ2GMN?=
 =?us-ascii?Q?HYTLI+5T4CURjmMB+6KHwjm2BoMF/YIAOd1GdExzIRlqjlgJMq2zTurNqrEM?=
 =?us-ascii?Q?x57vRnz+EXrxwEAqrfAi9IBhj/9iXqL/708IGH9ctxfYiE5vCOuEYw=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2025 13:36:13.5739
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 21898e5e-6b85-4f31-38da-08ddf5ef2bbb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MN1PEPF0000F0E3.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7267
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_063633_463173_CC1DA60D 
X-CRM114-Status: UNSURE (   8.23  )
X-CRM114-Notice: Please train this message.
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

This patch series addresses issues and optimizations in the Xilinx
AXI DMA driver:
1. Fix channel idle state management in the interrupt handler.
2. Enable transfer chaining by removing unnecessary idle restrictions.
3. Optimize control register writes and channel start logic.

Note: The patches in this series were part of following IRQ coalescing
series which is under discussion:
https://lore.kernel.org/all/20250710101229.804183-1-suraj.gupta2@amd.com/

Suraj Gupta (3):
  dmaengine: xilinx_dma: Fix channel idle state management in interrupt
    handler
  dmaengine: xilinx_dma: Enable transfer chaining by removing idle
    restriction
  dmaengine: xilinx_dma: Optimize control register write and channel
    start logic in xilinx_dma_start_transfer

 drivers/dma/xilinx/xilinx_dma.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

-- 
2.25.1


