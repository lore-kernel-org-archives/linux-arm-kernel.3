Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0BD9CFD625
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Jan 2026 12:51:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=aZ3M1AjR4Y4FTXf8eFzy+J9iWVW9O65nej7Pvhixqlo=; b=q9wt3XFmmQit9qxBGop4xlIniz
	xY1iaq0vSP9NrLHqVvrsjn0Uwej+NcNLRd0Fv7Ea6bk1MCZJgs8OfoorjWxi95n1Er8xlAUTy+kBa
	DWg2LiHwopt2JrY2Qvjn3GFgv/F+VQP07NFznLRJ7LqiJjZQz0xgf1UEftQDXjb30DX4hQfA3e2Hj
	eBZZ8x3M5cLj6bhvZVTkLYMVgwsmfZqPDMILkvuRRHnPnm17ZdYy0uMlpBoUV2SLZgnxHnbHzFwus
	rQh8A9pQw6OEX0HpdXd01M/5RUA/6x0sQCsZJ2MfgeZJ6U/n/dSf00qBjUcW++m4bo6ZwsJG64IEK
	XclZbRKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdT0e-0000000Evtx-2gtn;
	Wed, 07 Jan 2026 12:51:32 +0000
Received: from mail-northcentralusazon11010045.outbound.protection.outlook.com ([52.101.193.45] helo=CH1PR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdT0a-0000000Evss-2yLc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Jan 2026 12:51:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hIKCPFE23+mVXMonCTzCANCzTb8kgMOgbhBy0WlSz8+jokM9sdh+Q62Nps4+i92hRoaj6vRGaRf+JMQkE+BXN7SJwhRfB1Yv9AVkaPicLgs00ePDAeiiVoW/7jd5TsxE/ExI1ZLCAbHVF3keiuILYw5HxjfpyXNIbBMrw/DSG1D4Ndm+sSALqgHUJoQd0P51wCglFYWJQECc8TYOrryUBgiUr8J8ynxSCndxkNgjnpJL3p5acBTOzZb4u7bMyXG67Akv8OthlvQM40PUvrMPi4ihJnS7CmPYe+GYJApAoKtI8m/z+P0hZdDCOaN3xSqiXslHrOziJRAwjhuAt0V5hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aZ3M1AjR4Y4FTXf8eFzy+J9iWVW9O65nej7Pvhixqlo=;
 b=ne7Zbilu7XUz36RR27CNzSW/jVKHUrFjOyQSxugs/2k4AAh/xfKAY7tj99JRQZzOYlJ6Np3t7I50wzwC2eHlCnzjS14ff7+h12wBQLjP2C4EMraW0aH3uh7INwloK4jkUIHj59Z9CcoBD9xe/6mYu+SBkWdzN86KB75En+a9pW1P2hxyY7wP7zv3x/D8g/I7sM5Hz5do1Rg4jg2gVgiSjs9+Zgjb0RZeirmP/iloPVGLCwlaoYmbxaUm8ITEZILGy4ec6Sk64WnLGYOQMHsK74NRXi/y7B/179kQLPOnmSgurL6ipxr0k1R+yBc7aMn/xvUf5+cy/WHTJvFbmmbFIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=linux.dev smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aZ3M1AjR4Y4FTXf8eFzy+J9iWVW9O65nej7Pvhixqlo=;
 b=jTc6u+XzcOHi3XY4jAuY1UW1Ffsz2jxHLYt5jlcUB7EAzCVVU5uuUiHSxxs2K9MJdpWqRBbki5DWOfWbLTAJ94Fnt4Rx80ld+w1hh+DrKH6SJaJ+u8AnVJRVPQedq+KGskofPpjAAiaL7mjQl9w5IA8Dbd0K9+nvLICLjW5Lwtk=
Received: from CH0PR03CA0051.namprd03.prod.outlook.com (2603:10b6:610:b3::26)
 by IA1PR10MB6899.namprd10.prod.outlook.com (2603:10b6:208:421::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Wed, 7 Jan
 2026 12:51:22 +0000
Received: from CH1PEPF0000AD79.namprd04.prod.outlook.com
 (2603:10b6:610:b3:cafe::2d) by CH0PR03CA0051.outlook.office365.com
 (2603:10b6:610:b3::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.2 via Frontend Transport; Wed, 7
 Jan 2026 12:51:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CH1PEPF0000AD79.mail.protection.outlook.com (10.167.244.57) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9499.1 via Frontend Transport; Wed, 7 Jan 2026 12:51:21 +0000
Received: from DLEE201.ent.ti.com (157.170.170.76) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 7 Jan
 2026 06:51:17 -0600
Received: from DLEE209.ent.ti.com (157.170.170.98) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 7 Jan
 2026 06:51:17 -0600
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 7 Jan 2026 06:51:17 -0600
Received: from lelv0854.itg.ti.com (lelv0854.itg.ti.com [10.181.64.140])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 607CpHBC035689;
	Wed, 7 Jan 2026 06:51:17 -0600
Received: from localhost (meghana-pc.dhcp.ti.com [10.24.69.13] (may be forged))
	by lelv0854.itg.ti.com (8.14.7/8.14.7) with ESMTP id 607CpFRo027892;
	Wed, 7 Jan 2026 06:51:16 -0600
From: Meghana Malladi <m-malladi@ti.com>
To: <vadim.fedorenko@linux.dev>, <horms@kernel.org>,
	<jacob.e.keller@intel.com>, <afd@ti.com>, <pmohan@couthit.com>,
	<m-malladi@ti.com>, <basharath@couthit.com>, <vladimir.oltean@nxp.com>,
	<rogerq@kernel.org>, <danishanwar@ti.com>, <pabeni@redhat.com>,
	<kuba@kernel.org>, <edumazet@google.com>, <davem@davemloft.net>,
	<andrew+netdev@lunn.ch>
CC: <linux-arm-kernel@lists.infradead.org>, <netdev@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <srk@ti.com>, Vignesh Raghavendra
	<vigneshr@ti.com>
Subject: [PATCH net-next 0/2] Add Frame Preemption MAC Merge support for ICSSG
Date: Wed, 7 Jan 2026 18:21:09 +0530
Message-ID: <20260107125111.2372254-1-m-malladi@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD79:EE_|IA1PR10MB6899:EE_
X-MS-Office365-Filtering-Correlation-Id: f9bb7792-2e15-4601-4fa2-08de4deb7593
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026|7416014|921020;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?uILZCTkthYyyS2CIy7iDA0VKrN+MTstmfRZLa87UwUREWu0bUxRW9Qht87R0?=
 =?us-ascii?Q?Mq2+H6yXHhv3i+qfLP0WCvbrc9ya/GmMtJBc6Yp30tdLz2FEAWFdyl/UP6J8?=
 =?us-ascii?Q?TW3iqsrFS7wzpv7eONWpYiKVGDonX7r7lXZ6eAO1ex9aKGSTbKY5qdQCIW6j?=
 =?us-ascii?Q?2lgnS9ox1faOm5qfhNkHYmWQ9Fj2e0sC0ebqXBzDenmLh6Qv1a2e+iH0u3zj?=
 =?us-ascii?Q?cKjWVBn+iqLn+FVbSD8IuS6kbknEIAThFAvPOr15Ot9PYdhsgM3n5fHfyHSi?=
 =?us-ascii?Q?wwdQa7vf3zCO5PAShDKwFKPPRxqdp6oj1HwgR8QO1l0IxvOv2yILMGPqjmmj?=
 =?us-ascii?Q?sPst2ymFkmnsZr0YRq6db3iGeyH0Vdp0f4jBq1ZS+M9VhEIepiaNZZ3bWbes?=
 =?us-ascii?Q?+ccqjiuT8c3/XcEWWP3XXqcWEJZNIEnA4fl0G/Zo7yBKDzzGleoFNOOLSwRN?=
 =?us-ascii?Q?PlxctKSly6SlGGkFnM09n/zgntUUFQMK6qT9ddW3CdWuhAc2P6NJAqsZjPpr?=
 =?us-ascii?Q?8gfyi3ssIp1/wXUhSalfJd3QVz2pb6R+6UgvwIvUEgbVCokxZatNaKxALqHo?=
 =?us-ascii?Q?cCYH108KvLAM2Dxfwn2f3rBmBdjtQ+IwGbOaVuv8dNIO6k7YOdnrGcPl540J?=
 =?us-ascii?Q?HL1hl2tj6MBpTliBhfFPZ0jBjjPjBWIDSpZrxy0cR2/Aqa0SGlKY/KCawBqp?=
 =?us-ascii?Q?sbck+Ym6UYU3LrOyOhJyRqFs24lBtV35ODRq1iNWwK6Vg0ErQj1qEm+GU1Ni?=
 =?us-ascii?Q?khz+cvJSTDyOr6fEhJw0YTEYv7+mRz8Kc+1PAR708yomnVzHm2b4T8rqtv7O?=
 =?us-ascii?Q?IotdIPxhLaqQlsNEfGOar/g0U2B8BqGFaaOEGOiAiN5Zlk9UhSIklkznrd+N?=
 =?us-ascii?Q?FWepcABXM/iJ1DRzhsDMqJQQnBQYrcHvnZbjMMQ/V3COV7Y9lzKUvNGmMhj3?=
 =?us-ascii?Q?zvl1EdeY5HqVNQEmUHbUutd4LFugQtYxzOvPs+3OoBwFUPrwTdmTqWpKHlQC?=
 =?us-ascii?Q?OPvhzZuF3pmepxbu3+jU5emCz/m19dAZm3Le9HwWkmM6g+xO4DI24yUyKDnq?=
 =?us-ascii?Q?3O+NLxnUd+TfvEYw9FY2WyhBXEdFcVc7iee47aD6Mfzqlz+LENWlXJ+JwHat?=
 =?us-ascii?Q?L6MiYk8MmsjZTAevMPVad9svcgTmOdpb5AZsU2iu0RoNLGaSOlUC4rNcSxbp?=
 =?us-ascii?Q?BT7aft/Iqsht29mjzOEqHkXYeodzsF2p/Plwtg2jETvT4mGtRpMUETeGfS4e?=
 =?us-ascii?Q?u10LCIHkVgYSnhJUyE71Plul2fvGEZ5MaHYuCX1EuMCwe2yQcz34VItt00Cg?=
 =?us-ascii?Q?UUrgilh6b8H7EkkMiJlgf9QTr+18DhgPcc5OIA0nZ0+4AP1muxNjd1EApu3Z?=
 =?us-ascii?Q?B5RPGwcv3Fd9GC294qZiE0g4uqba7mFlpAhViSG7/7hXc/vmOYJvfnhV5RrX?=
 =?us-ascii?Q?gWqqTe2+VAWmwkHxGRsElYPUTEu/Naq1vGguhUxhiOZIBGnuvJKmwIF1toxE?=
 =?us-ascii?Q?85Xr1vDLkUv7m4r9v6/2Qu/29cSDjamhYDUgH5i/jLJOzTeL1Q6K11IjrT51?=
 =?us-ascii?Q?q8To2Qvof2Bw7JiIlkhDA4cAH3Iiym1SuCR3O/t3?=
X-Forefront-Antispam-Report: CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026)(7416014)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2026 12:51:21.7743
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f9bb7792-2e15-4601-4fa2-08de4deb7593
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: CH1PEPF0000AD79.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB6899
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_045128_862937_4352C5F7 
X-CRM114-Status: GOOD (  12.19  )
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

Intersperse Express Traffic (IET) Frame preemption (FPE) feature is
defined by IEEE 802.3 2018 and IEEE 802.1Q standards and is supported
by ICSSG firmware.

This series adds driver support for viewing / changing the MAC Merge
sublayer parameters and seeing the verification state machine's
current state via ethtool.

Driver configures the verify state machine in the firmware to check
the remote peer capability. If remote fails to respond to the verify
command, then FPE is disabled by firmware and TX FPE active status
is disabled.

Meghana Malladi (2):
  net: ti: icssg-prueth: Add Frame Preemption MAC Merge support
  net: ti: icssg-prueth: Add ethtool ops for Frame Preemption MAC Merge

 drivers/net/ethernet/ti/Makefile              |   2 +-
 drivers/net/ethernet/ti/icssg/icssg_ethtool.c |  58 ++++
 drivers/net/ethernet/ti/icssg/icssg_prueth.c  |   9 +
 drivers/net/ethernet/ti/icssg/icssg_prueth.h  |   4 +-
 drivers/net/ethernet/ti/icssg/icssg_qos.c     | 319 ++++++++++++++++++
 drivers/net/ethernet/ti/icssg/icssg_qos.h     |  48 +++
 drivers/net/ethernet/ti/icssg/icssg_stats.h   |   5 +
 .../net/ethernet/ti/icssg/icssg_switch_map.h  |   5 +
 8 files changed, 448 insertions(+), 2 deletions(-)
 create mode 100644 drivers/net/ethernet/ti/icssg/icssg_qos.c
 create mode 100644 drivers/net/ethernet/ti/icssg/icssg_qos.h


base-commit: 8e7148b5602321be48614bcde048cbe1c738ce3e
-- 
2.43.0


