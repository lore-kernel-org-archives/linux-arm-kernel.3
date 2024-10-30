Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD3B7D74963
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Oct 2024 06:29:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=KM9EiVroMALcUxodR2rRdxFvVaaT3eOp/EHuyeyuut0=; b=Hi4MV9oSY6pumXKrlVittTrxWR
	n8WXST0pL4G6+0g+P1A1DI3+/ccpFrmc1uA8zKrsHFxNBqCaBHDD7sCrr5AuFlVM1aqnHU36rEOJ6
	Mnmb5ujgwzGy9GweRNh3/110MZtesJ51aGIDZTQNqMKHM0A5RjyQGSU0we/9Jmvnq1vsQC4/Cf3ZI
	asAGwHaZWNl6p72rhcsYIs+A3fi1fYECHop1kAKLbTioBKdziTscunGTjX7f7TtuoC/57PtF0MW6R
	QKb7cRTOh0/uMuJhi+52CmQnn/HHPKJkIu663QWN4S5xGIzvOEemOlBp0dQEN3TwuCIJffJWvHimJ
	shiGfs1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t62Cl-0000000Gwl6-1Aea;
	Wed, 30 Oct 2024 06:29:19 +0000
Received: from mail-dm6nam11on20603.outbound.protection.outlook.com ([2a01:111:f403:2415::603] helo=NAM11-DM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t629W-0000000Gvn1-16WP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Oct 2024 06:25:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mr04A0cxI/qO1IYQTWvqhew3Q8u2r06X7Q6sxgVkMIobNiCTpocKlLjyLXQR0H6W+L8oaVa3xa8nEEHlfFUiRmoqsCtqeyEM+6NZ/lIjRQWRiFZOI6rW72wm6cUu/6n1HEx/V8Wo1gFfg4tdkHS4U2DEvGImyiPfka9YySDXDhsqpbA/Bi/vVPPdcxeFIsL7D0WLIgTisVIFPl2TNpFnSrvO/5jGmQGygf5BGMgEsgHFoN/2EK/eOHv/4gtrUaJLa5aYrnZtDXDuyXljEixp8efGTPovNQr0cL+5z1qOG45zBbZQST2YihLm4rLhNRVKyYUgHTElcg5tQTUfx1OfhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KM9EiVroMALcUxodR2rRdxFvVaaT3eOp/EHuyeyuut0=;
 b=U/n+Emjz2SCn6ATDhbkNwbdea8Gd26u3JtrgK6BqNyoUcezXhW/Jc8KxFTglyVL5+LSGjf+I+zF/QkOCBO8OQrMVAVXoZiEnXMXA5+QK16nsLfkMAPlyTEj/535Rt8xt422qYYDPXAStnEZEIOja83pWwSgOHM6XM/ekgIAw9+K+nPdouH4zGp+fo7KsaFzaCekldYc1mHzxnF+d+vmDCZxClKkbZkJp+TEpjyGgok0G4aY1wfv7wV1o+6ZTs3nKhz+6A8iaDCJbAEgIRSTlv3HfPIEaqAu8kkwbEJcN9NC2ytogPYL/+kMP66OSB99gWYtbJhFtvockQFBnhkeKAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lunn.ch smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KM9EiVroMALcUxodR2rRdxFvVaaT3eOp/EHuyeyuut0=;
 b=MkQ4HCbxH/HbywLMj9t3XKr1AGgRyDNHZyrmB/+BFXjR6+jVuoBN88R1mS16XUwjL6R2/bUo+koQp7i90aeObsD9BCqKAbFt5hHoshNVGGy92JusAcEqcHWhw8uS51WP+eXQp4+BINZn/O/bhhHqYb/pSWLOvl5wRa66QVDsocY=
Received: from BL0PR02CA0060.namprd02.prod.outlook.com (2603:10b6:207:3d::37)
 by SJ0PR12MB5675.namprd12.prod.outlook.com (2603:10b6:a03:42d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.32; Wed, 30 Oct
 2024 06:25:39 +0000
Received: from BL6PEPF0001AB4F.namprd04.prod.outlook.com
 (2603:10b6:207:3d:cafe::59) by BL0PR02CA0060.outlook.office365.com
 (2603:10b6:207:3d::37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.17 via Frontend
 Transport; Wed, 30 Oct 2024 06:25:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL6PEPF0001AB4F.mail.protection.outlook.com (10.167.242.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8114.16 via Frontend Transport; Wed, 30 Oct 2024 06:25:39 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 30 Oct
 2024 01:25:37 -0500
Received: from xhdsuragupt40.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 30 Oct 2024 01:25:34 -0500
From: Suraj Gupta <suraj.gupta2@amd.com>
To: <radhey.shyam.pandey@amd.com>, <andrew+netdev@lunn.ch>,
	<davem@davemloft.net>, <edumazet@google.com>, <kuba@kernel.org>,
	<pabeni@redhat.com>, <michal.simek@amd.com>, <netdev@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: <git@amd.com>, <harini.katakam@amd.com>
Subject: [PATCH net 0/2] net: xilinx: axienet: Fix kernel crash in dmaengine transmit path
Date: Wed, 30 Oct 2024 11:55:31 +0530
Message-ID: <20241030062533.2527042-1-suraj.gupta2@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: suraj.gupta2@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB4F:EE_|SJ0PR12MB5675:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c3b840f-2d39-4dba-9f4f-08dcf8abac68
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700013|921020;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?i2Wt5b9+6krWJhWl8bAP49uof6FCh5+Z5IqM2Dwot91ppaYulEvwklMhvrx1?=
 =?us-ascii?Q?UrX91wyeCal/OTL7rnk71RPfoPLOHjraa/RUjSUHG2SXDMXcaIeMJ4vY11sE?=
 =?us-ascii?Q?SQlwNQuFxy8FuCLgQ0fwsN40YBM4mksI5/gP1lTZaQ450UjXDWuWNcosQQNL?=
 =?us-ascii?Q?LX1vHb/mrWvpDKd0Xi/EzNF11I21sYy9LZjLZlwzBiaNd+CJXH5nn37ig3ZA?=
 =?us-ascii?Q?dd/v7A60wUvXGD3oXq/SKjffveKXt7U+PhG9INHO3ouR3Y/52Q10cK3qA83Q?=
 =?us-ascii?Q?EgtEiAlXiZF2UHAHUP5yOwlirJOdDJCOLTPFhajxAcs0zFn4uVXCLnTrS+Qm?=
 =?us-ascii?Q?wVFlKRU4AP73wwxC0VQz0Xb3ASmA5u6e1BUC40nE8cmL0rcPa1/45xz2BPo6?=
 =?us-ascii?Q?vDjvxzgg+5YpqEyM+VxN+GmLKm6RQcSQRzEnlnMYxp+DkJctWXwakVvxC6Zl?=
 =?us-ascii?Q?uuP7kLtRZaTIwBnOpqCDEBWBk+Qr+BF0b1X9mSRBfOb/zuT9OQWRlogu4dII?=
 =?us-ascii?Q?b88Q4UYdO3iuP9Q99ZeHbNDjf/FeYJzHX6xycrepu5OwGf496jgferuhtHmO?=
 =?us-ascii?Q?T0Tc77/q5RPpV5pntBs9Xwlt+fexJzgjUrDMa2QhTORQ/ME2NUwN00mEUwKF?=
 =?us-ascii?Q?y7Du9/p3BdgAsj+dGfY3jqK6YVWv5Vq73IiDKFplfiHsk1pKsa6xoeU1ZHI2?=
 =?us-ascii?Q?dU318x9X1X74Mo0HfKGMNG2we7QLFPMDZa+++0c4U1oZy6xE9pZRTP0bgkG8?=
 =?us-ascii?Q?d/TVLx4BKcWhMLRTngpy3IaQLMxvHdSdIP/oCFViMQKM/61rkYXZieBsc087?=
 =?us-ascii?Q?cQB4oW6YQEed9KEpnq/pF2mfUAJhhPop/+ye5kTwgxjkPEhhZN1Q7rNdKrYC?=
 =?us-ascii?Q?c7YmffemgGaw7SeauBuCGWLAMh9IkdYorQB4Rzf/cMRQyjAS6Insal+vzeB7?=
 =?us-ascii?Q?oUxJ+K2OIPgKQQZ8a7quJsuQ8oi2Oq5PRSqG3Q/Qp+7BAT9pk7WarD6qvfyh?=
 =?us-ascii?Q?kUmPjVf7psMg5J48/yRiczwgfZeE2xAEbOzTdXgPLJLOR6LgT3+NwuNSJoSD?=
 =?us-ascii?Q?i/Q2ulXtiSkaGy012bEDGyiXeRHHCbEA2jz4TPJnVUbSbVdY2N/YZ3hfqbuk?=
 =?us-ascii?Q?Aeh4BNzHpUF+BYRygLU5IEugAYX28eF/Q76G/3k2iC6QzBmQPsvr1QzGtB1p?=
 =?us-ascii?Q?Yt/rJMjR03xIt0MPJy4Ucc4snftHlp3pVCWJPzu9Sml3ywXP5KzHXauNqkeQ?=
 =?us-ascii?Q?6OdEuDctRta8JqkOmQvbxtimU7fXf9vBmf3OPphe2O3LNnx0LKjEaLCLJptu?=
 =?us-ascii?Q?cZjGq5hv5flVRxBv8y/Ygpid9kI0j82tLaHdkf5PrnSsax4JlMV7zOs2xkP5?=
 =?us-ascii?Q?vhNKkcA0z4YYmJz3VvawyIJLi828B/D4naulQw7YcjQJyNP9HWO6fRCU9qfN?=
 =?us-ascii?Q?MoRUUU8F0tE=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2024 06:25:39.4776
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c3b840f-2d39-4dba-9f4f-08dcf8abac68
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB4F.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB5675
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_232558_345850_77449E54 
X-CRM114-Status: UNSURE (   6.97  )
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

This series fixes kernel crash in dmaengine transmit path. To fix it,
enqueue Tx packets in dql before starting dmaengine and check if queue is
not stopped.

Suraj Gupta (2):
  net: xilinx: axienet: Enqueue Tx packets in dql before dmaengine
    starts
  net: xilinx: axienet: Check if Tx queue enabled

 drivers/net/ethernet/xilinx/xilinx_axienet_main.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

-- 
2.25.1


