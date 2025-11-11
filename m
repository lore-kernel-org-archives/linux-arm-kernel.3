Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7856BCCFA1A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Nov 2025 10:15:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=u/g10OXeyFVYDRWSv01A8reEIOYXEZwVJLGHlt+4yIc=; b=pIMSbAcY7N/EmN2M5sJ3iU1YrX
	3F15YDt9wo++7+VpmrgwTSqDianA6dLmYBbonysN/AyBH5mrBqqxSQOx6ZB7WoXIhIRcVI8xV7s5S
	eXzG8I/ye6Ep0sB/7Y1+4J0kBxSBl5y0vBljCMSP/1hRVQmkM0LA1HpjeRuHFZ0AQyJTSf/dpg6sx
	/yu+jiEdaUsZp9BdPQr8T2Cva795w8FFgheqIC4uVU2R14RtzspfuvEiAKMqes3yY/sbGQ1VZKESR
	OTFmOpe5AfElT8KJbX6ABczzB+tLZB2eDmVgiXpGOVGVScRjPTo1RINMK2TNJB0K3v0mi+34xEYwc
	R29eKo/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIlPf-00000006vGq-0oj6;
	Tue, 11 Nov 2025 10:15:47 +0000
Received: from mail-southcentralusazon11011035.outbound.protection.outlook.com ([40.93.194.35] helo=SN4PR0501CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIlPb-00000006vFF-4710
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Nov 2025 10:15:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HLyDF9r+bMnMZQF+tiodsEfJTweWh11PfMW4ITjEnnYVn8VlToL88DJnjiuU+tWHqw9pFWv+yt9t/UXwtdlqB3uod4SO6CLYLU6kWxB2zU2dcfyDXfUoUUhttpe8yx4JvOEwpNp2z4LXz7Ig+bjvWYz52JJN8xCvIAMXPf+ere9+9AX36fZoRON6TwyLd1mRrSNvJ5eXyYR4gIXmEwM1Yu/qEFGTEnDDsXC3Idg7A2INJuVeL0xhrcXxde2O0Zvf86p5h0BBPo7yOO1zXdxchDVtUzZio4OTmsG1lgNnQi6BYB6WZTIWZWe1JXOiB2PQhLgE6qY457mYCUxR6XfKxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u/g10OXeyFVYDRWSv01A8reEIOYXEZwVJLGHlt+4yIc=;
 b=MOGUcK6Qc3rGqQjJSFn1F7Xl2cqwoeExp3KfArkEvZdh6A7yeW5mmoBnV3PW+mPOlALv6wIzS4z1bypVIiUTchAb6nPbWjgV/fuKy1RpYDBn84EDvp8YWVJoUWo1+hIBWbC5dtlwhJLTMzf2w5gCWyHoJQ0LbjNlfh154lK3byVkwvF+9Ja659RWQW6Tc+Ie56tBcmsEyWn/E9bUOjIr+XLenGMYXTHB85PZFXiEOA0AVfOQMlTVxXgrOmT5bWN/ZESTsDgKt84Fo6HZpmTe1sygfZK7OZPpqIli5O82+Nu+KSXuAbNZMFakDsBJSZCLLlc/r2eK8q6p/LGb8jtThg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=kernel.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u/g10OXeyFVYDRWSv01A8reEIOYXEZwVJLGHlt+4yIc=;
 b=kdHVOZWOE52EMXpEkLvx5cbUkSE/YxJZ8yOIEDpyB2hBkU1AeRQuD4iUimhZjguzNsELnSAoJF1Ms1XpJToG2ojJFOpEVhbVv1QEEsevOgPlLi/UN7G6mpgVF4q1mKb+PRMu79RSuKrO40UA5GsFFYBu1BE565dW6dbhy0twn6w=
Received: from BY3PR05CA0042.namprd05.prod.outlook.com (2603:10b6:a03:39b::17)
 by SA1PR10MB7815.namprd10.prod.outlook.com (2603:10b6:806:3ac::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Tue, 11 Nov
 2025 10:15:37 +0000
Received: from SJ1PEPF00002311.namprd03.prod.outlook.com
 (2603:10b6:a03:39b:cafe::86) by BY3PR05CA0042.outlook.office365.com
 (2603:10b6:a03:39b::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.15 via Frontend Transport; Tue,
 11 Nov 2025 10:15:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SJ1PEPF00002311.mail.protection.outlook.com (10.167.242.165) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Tue, 11 Nov 2025 10:15:37 +0000
Received: from DLEE211.ent.ti.com (157.170.170.113) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 11 Nov
 2025 04:15:29 -0600
Received: from DLEE207.ent.ti.com (157.170.170.95) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 11 Nov
 2025 04:15:29 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 11 Nov 2025 04:15:29 -0600
Received: from fllv0122.itg.ti.com (fllv0122.itg.ti.com [10.247.120.72])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5ABAFTkb751480;
	Tue, 11 Nov 2025 04:15:29 -0600
Received: from localhost (meghana-pc.dhcp.ti.com [10.24.69.13] (may be forged))
	by fllv0122.itg.ti.com (8.14.7/8.14.7) with ESMTP id 5ABAFRQj011888;
	Tue, 11 Nov 2025 04:15:28 -0600
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
Subject: [PATCH net-next v5 0/6] Add AF_XDP zero copy support
Date: Tue, 11 Nov 2025 15:45:17 +0530
Message-ID: <20251111101523.3160680-1-m-malladi@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002311:EE_|SA1PR10MB7815:EE_
X-MS-Office365-Filtering-Correlation-Id: 31d7b8c4-9d52-4619-f3d5-08de210b4235
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|36860700013|1800799024|82310400026|921020;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?AWnrbSmOnAhZNlFv1GCQqafgr3yS/7mxg4Uiy4F14sbk26IU/i905lp0KFOL?=
 =?us-ascii?Q?vbz7R3Ex+hgrRxfnpWvSyji41Lz4jVlZQrznReRn449O8s5o6C0nwyLF7pEk?=
 =?us-ascii?Q?GC5G5t3tQNLEEd0u1jF+64gdybHnQV5MA5oQY4ksptdtour1OGLz3+4dZ/6w?=
 =?us-ascii?Q?rDw8KhZn+XXvI/wQa13nUMc1kX0uNwtkgdVZ4qKwk3qv8V99S2XdjgupUzoC?=
 =?us-ascii?Q?E9kalPbkJE0Mae+bDx54Nz0FIUS41Yfz/IX8WgiiUk658T1tIfN1vbU4mE8w?=
 =?us-ascii?Q?zVvfv7JlJiZSgf83+wchL7lNM9MBF5hiEyYrDSR8b3Eu4Cr3UmPTzoCwBGq8?=
 =?us-ascii?Q?MS1n4MmJGqG6CqycgyZ9w5cXiAP7CEODeBsQOEtfJPNFTU5PGV9DCK2GgAIT?=
 =?us-ascii?Q?Hjzr3mmhotiX0iEAZ3uRD5gAqTFy/8aFtK2FkBokaPd4PHDZXNBQ7qm6Gn+N?=
 =?us-ascii?Q?D+bCrpy1zkpZUq1j5PL25MOiANbioiDN2H/XTuRu9pJQB99uoq29JbIpfZkh?=
 =?us-ascii?Q?7Jj2CBpkx/4jrih/vAapHZOFuJDfR9Bo/0zTTJf6RObdb/FUrv/a02Uo/cCk?=
 =?us-ascii?Q?HAQ51b4YEFwqwRhdwqAA+t65IfuSIT5/oLroSt0U1pSDcSYYa3eVcUviyhS0?=
 =?us-ascii?Q?mXhudZl+u85zvFS3HTv8VO1ULeAKk/8a3GCdN2mR4bF3WbJtSb58Smxlmekk?=
 =?us-ascii?Q?cHJlJO0D3tPaUMGEEhikUJQMNp1iaUElEJvIB8VJ04aIuPvFcLmYXn/HVgot?=
 =?us-ascii?Q?HHPTY0SvxvxrHsUioJulwro7RXz6Dg33LHmiTFHSw2ttrom4JavU2Flb9pVZ?=
 =?us-ascii?Q?2rJFTNPT5Re3x0UY++wFV0WCGVc7bbLjvtnpW43WtoXaStMHRxvDLmGG+yrt?=
 =?us-ascii?Q?qYI8iCRgikye0q4g4pXhnLC3yh/q47jFXnfPIm0teyMY8opZ61EQXGW3pp1l?=
 =?us-ascii?Q?yUfOzpLW+Qq0pfz1JCUNeTd+HR/Sc/m0dIxzH+EI3TrYYgba/M1fB3dQYt9f?=
 =?us-ascii?Q?hm5/jQo3QP8rwMKhlxFJZhbQEcEd0k7CJsnR/iMamkAD5j60uAZYzXRl4uiD?=
 =?us-ascii?Q?ymitTdyebvjbjN6kZrs6V1aH14VVEqL6IZbUqDTX2qZ79Vc6QQyGf4nJopNd?=
 =?us-ascii?Q?Etcdg0kZyaMY28nkLqYYXqQlRXIcVTSOGN4YgBNKOWOWdNSpMF1hKrN7Xdsk?=
 =?us-ascii?Q?pLHdY620AN6L5N5gp2ZfIufj9AMF+JErWcGqwMeHJg9vO4rQQSGeJcwGLkIK?=
 =?us-ascii?Q?vV+7eHJVE1gwDaMLd+RmZYhLqjzuq8m/knAMM5ltycubzU1VHzNA9OaOizV8?=
 =?us-ascii?Q?1M7Hn8Z+HjzPZdsQVREG1LGniURf6blZ/DGl+yq+ZKn5Fn/XOhgZbY6CId8f?=
 =?us-ascii?Q?+6+N3XIu+uaIe7/+x/HZQn75H0ppB7SOCSzCtGEKJKjNxYt/1KjgxsBPMRQT?=
 =?us-ascii?Q?ZLfzj/pXwpi+7WymZ2rQsx0Nk/qUDFbtCgztuze/7RhR+BCWroYMmxbOE7xO?=
 =?us-ascii?Q?D5AnzxinHh4lJtL2ZZwtsKWD2Rgin6ROKl6CfmCxaGlO1fhIxpZsZ7yShqSi?=
 =?us-ascii?Q?NXLP2hud5pRMLgUDBBIkHiaUz7mgGGXKvG6QtbIz?=
X-Forefront-Antispam-Report: CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(36860700013)(1800799024)(82310400026)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 10:15:37.1722
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 31d7b8c4-9d52-4619-f3d5-08de210b4235
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00002311.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB7815
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251111_021544_021720_10EF434C 
X-CRM114-Status: UNSURE (   8.07  )
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

This series adds AF_XDP zero coppy support to icssg driver.

Tests were performed on AM64x-EVM with xdpsock application [1].

A clear improvement is seen Transmit (txonly) and receive (rxdrop)
for 64 byte packets. 1500 byte test seems to be limited by line
rate (1G link) so no improvement seen there in packet rate

Having some issue with l2fwd as the benchmarking numbers show 0
for 64 byte packets after forwading first batch packets and I am
currently looking into it.

AF_XDP performance using 64 byte packets in Kpps.
AF_XDP performance using 64 byte packets in Kpps.
Benchmark:	XDP-SKB		XDP-Native	XDP-Native(ZeroCopy)
rxdrop		253		473		656
txonly		350		354		855
l2fwd 		178		240		0

AF_XDP performance using 1500 byte packets in Kpps.
Benchmark:	XDP-SKB		XDP-Native	XDP-Native(ZeroCopy)
rxdrop		82		82		82
txonly		81		82		82
l2fwd 		81		82		82

[1]: https://github.com/xdp-project/bpf-examples/tree/master/AF_XDP-example
v4: https://lore.kernel.org/all/20251023093927.1878411-1-m-malladi@ti.com/

v5-v4:
- Rebased to the latest tip
- Collected Reviewed-by from Jacob Keller <jacob.e.keller@intel.com>

Meghana Malladi (6):
  net: ti: icssg-prueth: Add functions to create and destroy Rx/Tx
    queues
  net: ti: icssg-prueth: Add XSK pool helpers
  net: ti: icssg-prueth: Add AF_XDP zero copy for TX
  net: ti: icssg-prueth: Make emac_run_xdp function independent of page
  net: ti: icssg-prueth: Add AF_XDP zero copy for RX
  net: ti: icssg-prueth: Enable zero copy in XDP features

 drivers/net/ethernet/ti/icssg/icssg_common.c | 471 ++++++++++++++++---
 drivers/net/ethernet/ti/icssg/icssg_prueth.c | 394 +++++++++++++---
 drivers/net/ethernet/ti/icssg/icssg_prueth.h |  25 +-
 3 files changed, 741 insertions(+), 149 deletions(-)


base-commit: b981e100c19dcd91ce8cca8562c3cdabd4fcf28c
-- 
2.43.0


