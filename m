Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F5C1C0218B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jan 2025 10:39:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2lUtNZQslyHUn8r1mI2CtzRhyYSYs+k/lefUiZNuwt0=; b=OTvAUWQserNCPbC76lQfMwu0Jy
	GipJQNRH3ot3vTx90ELm8FXn0qE5qQZbZ2l2w3NbrvGSrIQmghEed9BCToTlhdemi+kABcdqFGzeQ
	7nHQUxfC8ZZKnWkNg+MI2ty96m2BjZUyYCf5lLgsKbboJcfmWZV5wB4rfuD8UA+baxMD1FA62ZUej
	jL1Kkk/pVaWSBBbgSWzunT+UOdIeBjEH+iPqrbjvaoOMnJWsVrmZRD4Bf3ocnzSpXLvh1LXf9Levp
	9YXluF9Iv504sTKxR2LbmpdXOXDxNkuiFI0j401Od4jw9S1aSbmFjPKdabhSjCUq/o85CFAA/S7RL
	oCeBfZBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taucV-0000000CEbc-212u;
	Thu, 23 Jan 2025 10:39:31 +0000
Received: from mail-dm6nam11on20612.outbound.protection.outlook.com ([2a01:111:f403:2415::612] helo=NAM11-DM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tauYj-0000000CEAH-0yk4
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jan 2025 10:35:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WbRdwlXjX1WY80MW2PpzutYsYYK2Irahr/NVYXyVFGHFC6oTJkGJV1AvbFHFMgwRmDCSnT8fqAIIDOfrnybZJiStFsfHRtRsMYBtTHvx+fKAUhoOUWrYgCiA2YEaei9vBg9Jz7EzQtwH8kM4pnC40nuDXclU6+FF6B4qH4wF7sstA12i7c3jQsXLcOf/V7ysS1VcsIMDOPQt1R3e7VUYIo9yVBNsYA1VbXcHLUaAH1/N4H+jQLsWf5vUwbodyShjg5u4feNwZpS97YnP9A+5nP4ok/AkCyulUDAx9U+Rs+zKQhMKpF1hIwsh6e+R+jKG59hNzDgsq8dxwVVzn5kR0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2lUtNZQslyHUn8r1mI2CtzRhyYSYs+k/lefUiZNuwt0=;
 b=xMMuymXNQtr0E3QBL+5Gfx6qQm9E5+ngK9PfHwIJq8RlLCCta03NnYYUE7BVmG2aTA/LXKKE/zK8oMwKGAWWrkvFyCueCV6OnLUoC5jAjEv59oC0wOdtDQt7ofVe/5rf7DTj/gnORZ0ekTZllJ0KMA5gnUR7eNwV4wsNZB9lcvgUwk33/rYUrXYlYv29tMMdth3ezg7cmXv3osTm7RnA+nZddd3MqTVJA9SHHfrvV8m3827BVj/e6282mgmRA2FAT9lSmm3eNUO18hadmOfDCquEdlkTzhq7AuGzGWcwqoD492Hz0aoRdKGPl/431/MTbXFQ6ZQcryn53fjOp/RiBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linuxfoundation.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2lUtNZQslyHUn8r1mI2CtzRhyYSYs+k/lefUiZNuwt0=;
 b=OH8HL742xp+1Dam62KJDfNOFEUl7PwHGs1nOoL0QO4CUmV57WaBySK6hKq2b41jbPsFZ+vU3QNIleucX3G4rZmKCzsq1WmG3S9K5Oo5cECJxBxGyedsffvWjbTv/ZSeB1Qr1fP0Z5StEuY8W+NYTI4F7mH9pm1BNllXrWNitwE0=
Received: from MN2PR20CA0056.namprd20.prod.outlook.com (2603:10b6:208:235::25)
 by CY5PR12MB6201.namprd12.prod.outlook.com (2603:10b6:930:26::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.17; Thu, 23 Jan
 2025 10:35:32 +0000
Received: from BL6PEPF0001AB4A.namprd04.prod.outlook.com
 (2603:10b6:208:235:cafe::1d) by MN2PR20CA0056.outlook.office365.com
 (2603:10b6:208:235::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8377.14 via Frontend Transport; Thu,
 23 Jan 2025 10:35:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF0001AB4A.mail.protection.outlook.com (10.167.242.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8377.8 via Frontend Transport; Thu, 23 Jan 2025 10:35:32 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 23 Jan
 2025 04:35:31 -0600
From: Nava kishore Manne <nava.kishore.manne@amd.com>
To: <michal.simek@amd.com>, <ronak.jain@amd.com>,
	<nava.kishore.manne@amd.com>, <gregkh@linuxfoundation.org>,
	<jay.buddhabhatti@amd.com>, <praveen.teja.kundanala@amd.com>,
	<siva.durga.prasad.paladugu@amd.com>, <u.kleine-koenig@baylibre.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 2/2] firmware: xilinx: Dont send linux address to get fpga config get status
Date: Thu, 23 Jan 2025 16:05:22 +0530
Message-ID: <20250123103522.1258499-3-nava.kishore.manne@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250123103522.1258499-1-nava.kishore.manne@amd.com>
References: <20250123103522.1258499-1-nava.kishore.manne@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB4A:EE_|CY5PR12MB6201:EE_
X-MS-Office365-Filtering-Correlation-Id: f12d71fb-00fc-474e-ba66-08dd3b99a9f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014|921020;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?RYGq+tSXHYw/fRQuK3W8ATTP4SvGFCZ1QsT0EJDhtZPMSOHUJ908YO++eJZL?=
 =?us-ascii?Q?cWzKuhw9UdTsOhkh3Qx9V6f0qESuYLjmOw+mZZjgxLU/oUe/4P/e2K23zLwA?=
 =?us-ascii?Q?psDvFumQHXCDQNo8n2zttz5EtUwZwoPrphDk+pB+ONHp8EHa3A5GcHYmua0j?=
 =?us-ascii?Q?ObMNG4+CzA15XEkqpM6fQ+e+YvUgLjmDsqSlIZ1912ze3y+/MEHfTEnmgtZj?=
 =?us-ascii?Q?hA4lI9ooPl/Xnu0gixNQjQghborBerby3e71ECPJy6QRUexbKYOYi+oDnq3i?=
 =?us-ascii?Q?cb7hVCqrNYa3q9LZr61fTj5pJAgqW+pAcSZaXSC91x7qKjrbmKuUuuuWXwRK?=
 =?us-ascii?Q?pXvwo89Z0yA7NSKI33FrA1C1UKLokbuViRZFWW4Pou37Qw3X9gRW/5XcQQOA?=
 =?us-ascii?Q?3/UjNCnvEgYX9pZFmAH4VUSc5h33976QvaaI9rFvRnwa3v4BO2v9O5TsePS8?=
 =?us-ascii?Q?SBM0gdqFF0o0bxEDGl+PWKeONt/XsW+4enIxv1Xd7jPlBD0vnh70MyZMy+aX?=
 =?us-ascii?Q?RBBfI8wHIw3jSq7D/kDyzOE1lSJcuC8bJPSLsiZiup5qMBD5jM/ZD639GpGF?=
 =?us-ascii?Q?bVpq4saUbEW9/3BcOadq0ciWUDUfQHl4GJllrnO1zrXDPxShePBQTwPQmcdn?=
 =?us-ascii?Q?LsMjUAB9P61f8dlz+9LgK7bGPiSv2/pDhcefhy9+DtuyBUCETe1r1uHplJ82?=
 =?us-ascii?Q?apl3aTt5xH6EY3TIk8pQPUxTxcQyWtQRqLhVUUZapcp0ZGsB7tuTgcCfrON2?=
 =?us-ascii?Q?RA61MPnMONyAC9zZVU5rGwfNh7wZu83BgZ8Go2yVQXYeleg5GBLrMKn9WR4l?=
 =?us-ascii?Q?pjGqxKIbmfAQGvPXY1E2ZSWzhg+mtG5pmPBa6M0Eoh7rrGC+64kn2t5NqWYS?=
 =?us-ascii?Q?QzGBr6dH9vXfY1Es+aB2Em73dzz/6KgxHy76mrIAgVRIFaNU2eSneAfElCS4?=
 =?us-ascii?Q?kvFrZmaw1dVeglqshR5TtuRzW206j965RHwgDSbe0hcGwZu7Rm2RmgHo56vy?=
 =?us-ascii?Q?W2Lan8pTHhQCAfHpcfz+dI89pqkeEvWoVts5td5m3FFiJgYprBfCpFyYAvIl?=
 =?us-ascii?Q?kWp0urwk8WoiaGZEYlrkKs37yDIcwCO2cjKLssjpzE8vkPbSg9SipgHMrFqr?=
 =?us-ascii?Q?dcJuvJAR2X6VOdYvjwHIkoB88cW8YZf+bNve3khqyERLc4bUFZYrCj9M0ILm?=
 =?us-ascii?Q?Jo+z+uj32bw4KO8wLnASETkU3Z1o+DLiLFglwHj/i443F/XKSd//PWfd8Khb?=
 =?us-ascii?Q?Hbxii2bcoDU9adpqtSSOzRI6h1R6UIBLsIjUXDkFUrILvfWcgT6wFLoMM56Q?=
 =?us-ascii?Q?SMqVSV5byyvlAD7FiO/VN+pfwCj1lJJyBiLEg4ncHuSXPBCszzwsYbiU08gC?=
 =?us-ascii?Q?igR6dd6TNZII1Web7qDG4Wa1rqU+/5T5pUcguLkG+mwAoID8MyaaIx2Nxxfz?=
 =?us-ascii?Q?Rp0WiuLD76U847Khwq8cKvv3//ff4CsWWftbVPkA9MkBapoXjbQMsEfxaf1y?=
 =?us-ascii?Q?QVT9pXDDoBWNgh8F1jR/AZj4/jiAE9Xrgvzt?=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2025 10:35:32.3382
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f12d71fb-00fc-474e-ba66-08dd3b99a9f8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB4A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6201
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250123_023537_273502_67E84DA2 
X-CRM114-Status: GOOD (  12.11  )
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

From: Siva Durga Prasad Paladugu <siva.durga.prasad.paladugu@amd.com>

Fpga get config status just returns status through ret_payload and there
is no need to allocate local buf and send its address through SMC args.
Moreover, the address that is being passed till now is linux virtual
address and is incorrect.
Corresponding modification has been done in the firmware to avoid using the
address sent by linux.

Signed-off-by: Siva Durga Prasad Paladugu <siva.durga.prasad.paladugu@amd.com>
Signed-off-by: Nava kishore Manne <nava.kishore.manne@amd.com>
---
 drivers/firmware/xilinx/zynqmp.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/firmware/xilinx/zynqmp.c b/drivers/firmware/xilinx/zynqmp.c
index ea04a6ac402d..406b4bd10894 100644
--- a/drivers/firmware/xilinx/zynqmp.c
+++ b/drivers/firmware/xilinx/zynqmp.c
@@ -1139,17 +1139,13 @@ EXPORT_SYMBOL_GPL(zynqmp_pm_fpga_get_status);
 int zynqmp_pm_fpga_get_config_status(u32 *value)
 {
 	u32 ret_payload[PAYLOAD_ARG_CNT];
-	u32 buf, lower_addr, upper_addr;
 	int ret;
 
 	if (!value)
 		return -EINVAL;
 
-	lower_addr = lower_32_bits((u64)&buf);
-	upper_addr = upper_32_bits((u64)&buf);
-
 	ret = zynqmp_pm_invoke_fn(PM_FPGA_READ, ret_payload, 4,
-				  XILINX_ZYNQMP_PM_FPGA_CONFIG_STAT_OFFSET, lower_addr, upper_addr,
+				  XILINX_ZYNQMP_PM_FPGA_CONFIG_STAT_OFFSET, 0, 0,
 				  XILINX_ZYNQMP_PM_FPGA_READ_CONFIG_REG);
 
 	*value = ret_payload[1];
-- 
2.25.1


