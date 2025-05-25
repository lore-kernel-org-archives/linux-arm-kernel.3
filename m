Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB585C54E90
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 25 May 2025 10:20:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=caB6il4exItnqlVYj9Fp/M/FQOJVmcd8pkpGOmiOTuU=; b=PSqh/eU6SkSmBRs2RWNmakWuzL
	+oOkYqQzWLy/HqvsXbzkqrpGlk/fp87qS+QQJaIqg3oRjtJrwwoi69UtyHBBRLBTSKCr7xi7tOSp2
	KjCeWTQ3MZUCkjWSS13ednfcpUL/V2uOfU+nDPlYEo4HaYG2r5f5mImawawWvMoqERGDgHZEYnpF9
	975MToeFtWofSLB7nTLNvIupXlhma582S//L8CFzxBZyPCp6/oTcTdrnFEmo/886T6IMY1NG0eItq
	5xkr/2/kCj1++8ujahjQP1JtV1Tt9PYKtoyxleNJn6iXhogJkALPnS2QnSmyYS3NXim2OmVoMXfT0
	X3jjH/RQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJ8TI-00000006wVH-0PIU;
	Sun, 25 May 2025 10:20:48 +0000
Received: from mail-dm6nam11on2060e.outbound.protection.outlook.com ([2a01:111:f403:2415::60e] helo=NAM11-DM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJ8PE-00000006wDD-3B7w
	for linux-arm-kernel@lists.infradead.org;
	Sun, 25 May 2025 10:16:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=USL9azgy80a5ywbUxRrYZnogU1W5BF0q9olMejnPmYsqipB3+Jd/A0KKJxCRhSvCMmtRgzYRJL1jxt1nvH+HrwU7z8UTPYQPfCvjSS7r+ZyaGzAEEpO4FwsWh4Dij7up4B4BmDdHuAAS8RKyr6JKXGPJ5OtoHaqYODq239jsY38URrN9hRHk8o/d229JFgTVdKlEBTDsJlXp4F5Jw/MmzP+ZhLTUzzQXMnVKt+P58YuvzN9Jtk7todrqsHBS0RVatEm8aS2pU64qqJIfwomxeUQ5Oak0m1HTyyMSrUcgK3L9WWxiz/3KmIxZHUAZPYkm45Ap8zwHvy0+pb1u2N3uYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=caB6il4exItnqlVYj9Fp/M/FQOJVmcd8pkpGOmiOTuU=;
 b=hfGxIfTUEd6cTRU8coiZrHnmsEk8uDudfp6xaxHUFRUzz/HCvPeKxja9as1y6OmKAmlQkXeZRFG1GXzVyP0PVWzZAVGY5yQKLCmIZhARkLEwHu5/dJvbxmPDer6tDNhfEdxE3rocmhN1mef6/lBCJv5VJPTODL6UAP3ayoB9mFcsyMOrzgeDFoBha1kFkTtTwM/9z4NMd8PLv9YlO1LJ+Xd49Pr15Rp/aHjKAKEPi7z6Q4AmKzCPSIA/FYTpjL/Pka09Bcv38opDxpyisIcf+IgoFe1u+BEg4A019GMsc6Q9bhOVTXlKYof8UD3lD3QUnXkfWfKUAuX2fG4vOikhjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=caB6il4exItnqlVYj9Fp/M/FQOJVmcd8pkpGOmiOTuU=;
 b=5nrNw68pOfyxCtwOyxT6ycFXS7HHG8GDV+IAtzT8BQRcRW4pgwbybfymBw46EaZXz4/qxz+anPB+Uh/ga5iCL9uKicXYhyOKu59rOF2eGHvXcjWPmf+UhvHB+VQWPPMav/e5O1mKUG8unrYRpAEX/NE8ypzX42gbzIWAoIOM6W0=
Received: from SJ0PR13CA0029.namprd13.prod.outlook.com (2603:10b6:a03:2c0::34)
 by IA1PR12MB7494.namprd12.prod.outlook.com (2603:10b6:208:41a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.25; Sun, 25 May
 2025 10:16:30 +0000
Received: from SJ5PEPF00000203.namprd05.prod.outlook.com
 (2603:10b6:a03:2c0:cafe::12) by SJ0PR13CA0029.outlook.office365.com
 (2603:10b6:a03:2c0::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.16 via Frontend Transport; Sun,
 25 May 2025 10:16:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF00000203.mail.protection.outlook.com (10.167.244.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8769.18 via Frontend Transport; Sun, 25 May 2025 10:16:30 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Sun, 25 May
 2025 05:16:27 -0500
Received: from xhdsuragupt40.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Sun, 25 May 2025 05:16:25 -0500
From: Suraj Gupta <suraj.gupta2@amd.com>
To: <vkoul@kernel.org>, <michal.simek@amd.com>, <radhey.shyam.pandey@amd.com>,
	<thomas.gessler@brueckmann-gmbh.de>
CC: <dmaengine@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <harini.katakam@amd.com>
Subject: [PATCH 1/2] dmaengine: Add support to configure and read IRQ coalescing parameters
Date: Sun, 25 May 2025 15:46:16 +0530
Message-ID: <20250525101617.1168991-2-suraj.gupta2@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250525101617.1168991-1-suraj.gupta2@amd.com>
References: <20250525101617.1168991-1-suraj.gupta2@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: suraj.gupta2@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF00000203:EE_|IA1PR12MB7494:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e47a392-b841-4037-c246-08dd9b753793
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?K2ca958qKNteiOFPBJEDRwzp+4/Uf6/YmGWuS/PrWB2OAa5yTrJX8wiLZi6V?=
 =?us-ascii?Q?2XYxY13V7D9EWX/P7iGv5RsLwfp9clmiYEDiau+Wdq7nuUaVFnPng4RdJdd8?=
 =?us-ascii?Q?00Cs+e3OjtXP6wSw2fJYEWahsxz7lg5laoIBOwongN8sYoETx0Z98HnXk0su?=
 =?us-ascii?Q?hta5DMY49PPpg3z6KE45w0r/hRtDiVd6A4JDg979b5zKIUt/skEYxXm8jhi8?=
 =?us-ascii?Q?gZ7bu8eFxaGmtl1Um7EBAQjTo1P++zXd20id338ZAbtdqt9c2iKEJ6uBcJi9?=
 =?us-ascii?Q?4aqrLE39GSqwKOExosJXaNx0O50+QtArm0dhsgcJ8IPoHlK2sr3m6iR09NCW?=
 =?us-ascii?Q?qtG3hfVr69x2Vvlqi8RetwD5ddzlnPxC1OJ3rjuq2inqZ3FHio7pIRhP3jQZ?=
 =?us-ascii?Q?dk31vnU0CdixLwK+H0B+LEGYjidsH0RQ20YBC4kQsIzw0mgJdl0nLmvnKwRA?=
 =?us-ascii?Q?oJ819b5Leq00pvKbxaDQXf2DosYIOC73lmIIKKZsKvvD5OpLk21Kn2mkJZQy?=
 =?us-ascii?Q?4Zi3OGWuyd0stmJxaDApCpkJBIaKTK/+ogAnxD03MIW9heAAMkAthVWvM6hm?=
 =?us-ascii?Q?tFtoHGDD6Gr7gdA2fNnw8bcUu+u0EKPUhgmkylzxMZ66N2L+s+jLxtDsemIn?=
 =?us-ascii?Q?6ITGBXPSKRR8bpgbnM4r+FmsLh8SSLWXzOFmV3EG/KEyx6EGG6mqUg45yNli?=
 =?us-ascii?Q?kezfXylkLpKOdUVky0kEE/lam5GCk8m99CcI+C3gR7u+DVtiwRgD1q7qSlZb?=
 =?us-ascii?Q?oEWWY6PkJpK+b70AsgVyWccgDHqvPpD2jqwdf71V1kGgNm8RywjQBCXbaj4r?=
 =?us-ascii?Q?XpmZymtN696VqeOawiE8UkdCgt4FV75u8t7AczH1ylUyWUYTRMIVVmq6gRUC?=
 =?us-ascii?Q?pdJD3Re5bilzkYTnDTTFgx8vDw6MIDuXGbOa9LZd5bLxOxnn86dq5xIBnpc0?=
 =?us-ascii?Q?SPBKicFHH9jKi7wkRPErX/6blLBzfx7cODpqJtDt8ZcQHn92hZNcurWesZYM?=
 =?us-ascii?Q?9XSJMK1L2l69aGORRSpvv3Osvo0jItSFCaXfnZzxf4HxpaRnCUF8pzV7rn5W?=
 =?us-ascii?Q?KfzRgYQk28q3yDifDU2kS1wrZF3I67qnq+nxrNzsoUnkFVhsGQJpTtHl6713?=
 =?us-ascii?Q?95ddzNKxi2YiUtmtTmnYNTaYb3ToNz0dzcsRzpfPjGGsJ01wd2qduoV1dzCl?=
 =?us-ascii?Q?5hR5xzm6L00i4p7BbwTvv9ZRGNzyC6MCVgTtQBrmsSHZBSkg19NFu25GtrVM?=
 =?us-ascii?Q?UZ4xNd8+9zLzJs0p8MZVA4mCasYqb619iU1z4IV5RiFE1bD6nUGybAz8H3EF?=
 =?us-ascii?Q?5CwoP7NWRLV6F0ZDmAP+5JaMhFZwomPQrmEEhqplwamD7BbzvY4xtEtAGd0j?=
 =?us-ascii?Q?vO9OJgFkeOZcBXLaB82P8oOaQg+pK91JuYAJU6TqUtfhoZ+11X3eJvZLH8lz?=
 =?us-ascii?Q?J5fGu34GGoiecZ/wv+yePec3OJAdr0myIOZUfhRXXAqGREOuB0x64faFL2X0?=
 =?us-ascii?Q?bRtFr13s+urps2QpLTYmHbgGM4KQ01yHmK/b?=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2025 10:16:30.1120
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e47a392-b841-4037-c246-08dd9b753793
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF00000203.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7494
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250525_031636_797155_F9702AAE 
X-CRM114-Status: GOOD (  12.25  )
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

Interrupt coalescing is a mechanism to reduce the number of hardware
interrupts triggered ether until a certain amount of work is pending,
or a timeout timer triggers. Tuning the interrupt coalesce settings
involves adjusting the amount of work and timeout delay.
Many DMA controllers support to configure coalesce count and delay.
Add support to configure them via dma_slave_config and read
using dma_slave_caps.

Signed-off-by: Suraj Gupta <suraj.gupta2@amd.com>
---
 include/linux/dmaengine.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/include/linux/dmaengine.h b/include/linux/dmaengine.h
index bb146c5ac3e4..c7c1adb8e571 100644
--- a/include/linux/dmaengine.h
+++ b/include/linux/dmaengine.h
@@ -431,6 +431,9 @@ enum dma_slave_buswidth {
  * @peripheral_config: peripheral configuration for programming peripheral
  * for dmaengine transfer
  * @peripheral_size: peripheral configuration buffer size
+ * @coalesce_cnt: Maximum number of transfers before receiving an interrupt.
+ * @coalesce_usecs: How many usecs to delay an interrupt after a transfer
+ * is completed.
  *
  * This struct is passed in as configuration data to a DMA engine
  * in order to set up a certain channel for DMA transport at runtime.
@@ -457,6 +460,8 @@ struct dma_slave_config {
 	bool device_fc;
 	void *peripheral_config;
 	size_t peripheral_size;
+	u32 coalesce_cnt;
+	u32 coalesce_usecs;
 };
 
 /**
@@ -507,6 +512,9 @@ enum dma_residue_granularity {
  * @residue_granularity: granularity of the reported transfer residue
  * @descriptor_reuse: if a descriptor can be reused by client and
  * resubmitted multiple times
+ * @coalesce_cnt: Maximum number of transfers before receiving an interrupt.
+ * @coalesce_usecs: How many usecs to delay an interrupt after a transfer
+ * is completed.
  */
 struct dma_slave_caps {
 	u32 src_addr_widths;
@@ -520,6 +528,8 @@ struct dma_slave_caps {
 	bool cmd_terminate;
 	enum dma_residue_granularity residue_granularity;
 	bool descriptor_reuse;
+	u32 coalesce_cnt;
+	u32 coalesce_usecs;
 };
 
 static inline const char *dma_chan_name(struct dma_chan *chan)
-- 
2.25.1


