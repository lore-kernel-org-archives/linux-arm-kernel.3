Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B6AED1CDC6
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  7 Dec 2025 20:50:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5qWvhE6QDvbp3O+rwC8ldGyxvYCOerpYXR2/9BWkKnM=; b=FT/BP3LMWNdDQAzohr9QdbIgd9
	Meku9zXFU2MsqcxonSp4GMTY7+SWl1Q8qAHY0xcCMoD4qVRbPmSJELSngXBPzsXGZSAU58cNqeBKS
	3Vcdvt+CnalNrXKBbaKOOJBvxkojddmWV670R9RXuIcl1Zglxs9O4/j7ElyYRu6M3tIUyrLZ0lkdb
	d34Yf/Su7afYXNTS4abQYkd6xxDy9loJ1pvaP8XdV+mibO6wWvv7NW/22PCd/gh/TwH4+8HIS9nHS
	ooNw9SYFHs1FHuN9HtpzI6LCMcUXPu5D9h5jhYA+FJjGWF9Fu0ZsOa4/KEk+6w67cHHGPz8hM5/6w
	NtTagWqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSLhl-0000000CEVt-1JT1;
	Sun, 07 Dec 2025 20:50:05 +0000
Received: from mail-westus2azlp170100005.outbound.protection.outlook.com ([2a01:111:f403:c005::5] helo=CO1PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSLhi-0000000CEUe-37hs
	for linux-arm-kernel@lists.infradead.org;
	Sun, 07 Dec 2025 20:50:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hSXMc0iA1fI2IvduixZTN8Fz2Fgs6Il4BEAaDo8chZmqOaylkkLxTgolnOZPsnKa3KfNGXRzO9YuxA9+M82jMLAOpAFIK52M23EtfVTjFaLOJxc4ZF573iXVCBz3HGIm3rgkO4vkgL7WOWAJfwx4GGNVjniy6OLalPjhDgTCChfRHdHHHdz1Pt93MELGQpFIje8hEm8VktzRml7qix8L10AYrq1LdGSfiDY1OqNNMBPILElIvhQ8uCyKJyxoksHzVjdw+ER5WiDjEmwE38dTrT87rhbZK7KlnCpaG2msDrv22x6wjeCZwiH/ve4EUx58vbsauCRSRqjrAzMiofiVmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5qWvhE6QDvbp3O+rwC8ldGyxvYCOerpYXR2/9BWkKnM=;
 b=S9bqbAXQ63j6ZprzgqNjX2AJw4gd2YlQVqgzgtiy6V1BLaeIyyJF0TTxCZMFCcY9bcf9wOHb2lpcdqpnAgnjUH6TAv/JWkf+fFcKtSGuma4Mx1Uf5q7q7k7jjrGadTQhg2XJTO41UofMRzuYXEEkrpCeIxTMpsanINASkepAD24nt5rT3yKcja1j549ihnObQaqVyXpUcqkA0Ov3fYlPbiFDbB0bR+u2AwLX/90VgK2rmHV35kR3qXKpVddeRuhPyHrmAfTwK+ErmY4KiWY+Qt4x37J+yYkHtPiaZBuvfJcfZWcnI9AIwwWsv+eGuYGqPuckFcC5SPaONe7rZSYUgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5qWvhE6QDvbp3O+rwC8ldGyxvYCOerpYXR2/9BWkKnM=;
 b=Q7377ZkF5Vrh92ECYktGcPLsL4B6UTbzdS2VIepYN1nu19oI0phsPKymSSU7Ud/Oc7z6Ex9iLNd44abMZGPkN79agtK1LHS1sC/9uY+k457UXbGBE17FvJGaomIIRRKeYveTmXMILcLUue0HvvbWVvRNF8c3/sUky5Fd1N9zmj6ca2jGLVsuAM3fGc1APcm0+azoYvrmfu5qxXaWdX/RKgLFQ8eP8a/F4U+y80OrbY8gYMLCxhDAt7Ww1GddIqInjoV1k1B3qAg2gGwejQEoCw4OM1ICoCg3jR/R6mOCIbEKhpvw3SS7i27RxmSc2cjDwN6GxQzR5pO01FTwfCBy0w==
Received: from DM6PR02CA0142.namprd02.prod.outlook.com (2603:10b6:5:332::9) by
 DM6PR12MB4092.namprd12.prod.outlook.com (2603:10b6:5:214::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.14; Sun, 7 Dec 2025 20:49:53 +0000
Received: from DS1PEPF00017098.namprd05.prod.outlook.com
 (2603:10b6:5:332:cafe::db) by DM6PR02CA0142.outlook.office365.com
 (2603:10b6:5:332::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.14 via Frontend Transport; Sun,
 7 Dec 2025 20:49:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 DS1PEPF00017098.mail.protection.outlook.com (10.167.18.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.4 via Frontend Transport; Sun, 7 Dec 2025 20:49:53 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Sun, 7 Dec
 2025 12:49:47 -0800
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Sun, 7 Dec
 2025 12:49:47 -0800
Received: from Asurada-Nvidia.nvidia.com (10.127.8.11) by mail.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Sun, 7 Dec 2025 12:49:46 -0800
From: Nicolin Chen <nicolinc@nvidia.com>
To: <jgg@nvidia.com>, <will@kernel.org>, <robin.murphy@arm.com>
CC: <joro@8bytes.org>, <linux-arm-kernel@lists.infradead.org>,
	<iommu@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
	<skolothumtho@nvidia.com>, <praan@google.com>, <xueshuai@linux.alibaba.com>
Subject: [PATCH rc v2 2/4] iommu/arm-smmu-v3: Ignore STE MEV when computing the update sequence
Date: Sun, 7 Dec 2025 12:49:14 -0800
Message-ID: <08fd4d48e684732ad58064f690195f31a64979c4.1765140287.git.nicolinc@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1765140287.git.nicolinc@nvidia.com>
References: <cover.1765140287.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017098:EE_|DM6PR12MB4092:EE_
X-MS-Office365-Filtering-Correlation-Id: 132e9914-56a9-453c-6d0f-08de35d22c0f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?TXjfKqM6aaCicmrrt3qvMRhsTDKua6phZ3YNpWvqpAePDn/a6URDpLtQ9BQH?=
 =?us-ascii?Q?1Jk9cM2kRxWrITn2MYGfonRymKR+UPa+4+5zqnC6fgBQ+YLAgGQECDnaDetJ?=
 =?us-ascii?Q?J9A2RCgAbqOkt7BfjgbIJ0yJjV0yh2EKXe49pRpuPRz684vx1eC+YEUTbiDQ?=
 =?us-ascii?Q?HLT+L5Ve98dgrz6fmvDY+4SqbITG8F5yw7NuRkZHCTtpBZJfJBYTqbPo5ity?=
 =?us-ascii?Q?t9jrJ0FWyrZeHQPECKLKulL0hLvndI1TBmtIn0ugAkFrZTR4C1cM6IG4Rvyh?=
 =?us-ascii?Q?DzzjFj3Cd8BYRmA4mv+4FtFw7z7j4W4/SnDTfGBqHOArfETtlwCzUDEY0yRM?=
 =?us-ascii?Q?SYXYH4wJqOBM1Vbv3srIaT8W0Emr1eGeu09vDVosWx3mCLhLXdCVjuTU5y8m?=
 =?us-ascii?Q?Jo+8jy60WYNYzF0vo8dAHHyZw0DwexHxMBD0HwccdqDVhAc9Jb3ED0lmE31E?=
 =?us-ascii?Q?E3S/6ACHO+xUxPkUmFB1QwrgS4IJz7wIyxRqE3aBNRyfkg/L19IKeHlOvrs7?=
 =?us-ascii?Q?JGkcRzR9hftEq0ge91D64QzdZHg9C/u4xnMSFVXjan+ZDZ1xSzv0zX2B/wES?=
 =?us-ascii?Q?K4NIl3Cahffw04yygaZ3ABVlEubsSO8ugKolZxRtsav5ZVRhiwWMahLiX5Th?=
 =?us-ascii?Q?RajoyMolCUB91piEX4TBJZMQA2Mj3/pyXqYUhD035KmZ4URt0zEZ7kJfQZMZ?=
 =?us-ascii?Q?CI2RV6V2UcbCZBlvfHjg0bJVZrecm26dsP5oWK6Vw26DazZM265A0KBGosSu?=
 =?us-ascii?Q?FcpBTaWA4agXzgLKPaw1Ntqkr7FKgUtewTwoMiOPOiB8zfUsut21IRFRw4Yu?=
 =?us-ascii?Q?tr6HqhGPhdjXo+W7bOwgD91LSFy828wHsuuzUnYHepCvFaTupbOVXdXIrjYA?=
 =?us-ascii?Q?4knmKTBhNcgoTvOwU0MwHyWw900cbKdCjT7JXIoH8XGA7dN1tUPV5XxVaSuk?=
 =?us-ascii?Q?8fUQCuD9NREcshpOd9B9qYpKQVX23weWOl2oYJjWERBrOHUZ6MbI2QIKzhyq?=
 =?us-ascii?Q?0105KdzDDHrvnawH+4XQt4GQ8AvkbDi+/8ia2ACwOMhPu63ICFQdi11r61+E?=
 =?us-ascii?Q?YA2/LStzaF9azke3KtxXnfctLAUsskY55hogWp1HH7P1M5rRTc9KVnYholKu?=
 =?us-ascii?Q?J1vc7eUibbGmGH4kRTqrtVjvpqlhofNEh7Z5DBHEcjqOWTdFUmDEainTTYns?=
 =?us-ascii?Q?zg8dD+EjSf4C08wTMIgWCXI9wBpSFzBxtXlXwfMZzfCm1Q+yK5eLBwJkikkf?=
 =?us-ascii?Q?H4PIorHmRoqggjc+Q2kBAuhUNwHPZXCGQ5Mg7TqJDzrZ/D7vJTNrjCMNmiNm?=
 =?us-ascii?Q?u6p9CtYKFctaWNbvMOpNQH9c7chLPdCLnD+DlLmU3VWOME1PPrQIod5OHYeP?=
 =?us-ascii?Q?MUWtYiFEH87RQpI7oEYERiaq3hbtn5yBUtWVvY5p6HEoiQ9xxQTRIDw/8J2c?=
 =?us-ascii?Q?fFB1lT7bKI9wu3pr/8xwlWILPUogz/MKco1Wq5MddR8JHQiVUX0Na3z3yetX?=
 =?us-ascii?Q?sfYZp0lvQl/rBmKqVq/4aAnyu/2l6V9bDWI1y37Vkp/Ja+QuTc018tpHbL2/?=
 =?us-ascii?Q?qOQ7JzhSbZjyPs+Pg8g=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Dec 2025 20:49:53.0212
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 132e9914-56a9-453c-6d0f-08de35d22c0f
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF00017098.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4092
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251207_125002_787155_BEFA5F82 
X-CRM114-Status: GOOD (  11.86  )
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

From: Jason Gunthorpe <jgg@nvidia.com>

Nested CD tables set the MEV bit to try to reduce multi-fault spamming on
the hypervisor. Since MEV is in STE word 1 this causes a breaking update
sequence that is not required and impacts real workloads.

For the purposes of STE updates the value of MEV doesn't matter, if it is
set/cleared early or late it just results in a change to the fault reports
that must be supported by the kernel anyhow. The spec says:

 Note: Software must expect, and be able to deal with, coalesced fault
 records even when MEV == 0.

So ignore MEV when computing the update sequence to avoid creating a
breaking update.

Fixes: da0c56520e88 ("iommu/arm-smmu-v3: Set MEV bit in nested STE for DoS mitigations")
Cc: stable@vger.kernel.org
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index e22c0890041b..3e161d8298d9 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -1085,6 +1085,16 @@ EXPORT_SYMBOL_IF_KUNIT(arm_smmu_get_ste_used);
 VISIBLE_IF_KUNIT
 void arm_smmu_get_ste_ignored(__le64 *ignored_bits)
 {
+	/*
+	 * MEV does not meaningfully impact the operation of the HW, it only
+	 * changes how many fault events are generated, thus we can ignore it
+	 * when computing the ordering. The spec notes the device can act like
+	 * MEV=1 anyhow:
+	 *
+	 *  Note: Software must expect, and be able to deal with, coalesced
+	 *  fault records even when MEV == 0.
+	 */
+	ignored_bits[1] |= cpu_to_le64(STRTAB_STE_1_MEV);
 }
 EXPORT_SYMBOL_IF_KUNIT(arm_smmu_get_ste_ignored);
 
-- 
2.43.0


