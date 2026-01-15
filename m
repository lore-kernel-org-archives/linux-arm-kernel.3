Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A24FD4660B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Jan 2026 18:24:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7Gff+En3ripedg/Ulvw5Goqa//BqaAjPKx4zoh6h/OI=; b=YvvQTjQltfn35S7JKIndlqUBrC
	7EfQPm5b9hhX16oLzBoIdciamVU7BchKhUWjqjtdF+rHGj5xMG2E6jBa81IYoso5Xky/1ZdguwKXf
	1PnfLqQPgMGzJHkhFCgnfTUYl2fd7+PbOWbKsgSx5BJ3xGDNuQsI0fiPVz+QGhUt2Sl1O+XDXytr4
	iHI4kLpjhaOKlgc47ui3+LPql4Z7ZA1nkGG9F+yJyQepnGn+tVQxeyhIWAKWWDWgD0WeMeQCa43Ev
	X15EESgVH45QNMoWX9OIn33DnwnUOJT6+amMUTd0Od+R4UIFw0U3LsCrjVm/p9pVpnqbLbPr7Rpyn
	GGbdOCxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgS0s-0000000CxMt-2iDA;
	Thu, 15 Jan 2026 18:24:06 +0000
Received: from mail-westusazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c000::1] helo=BYAPR05CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgS0o-0000000CxLG-2WYo
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Jan 2026 18:24:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J4He9tqEyw6OO8STmIzmnwSaVpYs1Kd4/6xzGoRPPz6YWSPEg6Xuho91msQuwwoU8OAyiq6G7FLJeh8TWTJP4FhmONNDw5SgSHHSUQSV7FzgTfowme48FRtIb7dLRd3IiQTxGda7XuDESeZ4JkFRByfhen21UKSiw+4tgfAizSeQHtCJxFCwDUDSxJYh9opvBgMaCdY+NRFwzVZR/1EL/xSZ71oUHmLstcXvzVqM1F4Lg0HyoRnjfN5p+/hrzCD4M95HYKZmSsTjPz2qrWYxSswx3ffTC785wmxJld2yEa2e/I6nA/DGuexL4HRVe5mHY6Kmuzs5GFpeJdDmhsss3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7Gff+En3ripedg/Ulvw5Goqa//BqaAjPKx4zoh6h/OI=;
 b=wKVyZ5WAByF5WS2HdhsQR3im9vNDBOf2bbl7rc7irBqe+emnWb8Vm1Arumm6sUnILK1nB8YvDUbMOC5VFKEhteiuELFNg075/ptWW/IsOCzr0/t2nLI4oW3k5wEK2eghLvNbWMX2S8QJAjLjzYnzX56ScUx+gzG0FZO5wbJQDBW7vQCnZtGunmreTHr+w3EQ9oJP8/TiiJ/G8SH2PJi+Sec89kyKMrDPpVYhzB8NCiq6iBhssEEdQWOk+utFoMt05mLacbxBcfsmzkutLluDc+G6G8Mi64UShjXA8VcJqKy8gMuPKNaCweeUxYxRVLs6ku+um0Q1WUjWBDKA8suMLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7Gff+En3ripedg/Ulvw5Goqa//BqaAjPKx4zoh6h/OI=;
 b=Cn9mIs1E66k9/NHAWaIqEqdAzpZQA87dOV66ZAblxqje/hAjk/EFHtGLHDqH0U1V/dVVStqjk+hltMNOS5S2S6bEOAiCAn8BMhRqFHJ8/LgZyut4N5Rc0VJXJkk0hAyS178WiyfJg5x8FS2RMSx+fzW1cyyAJPSL+3xN/SZYy/f9qu2w9rvi1pJSApMD1E0gwtsQ9mPDYJx+++cYuddnNnUw9Xn7ORr4KOlpaVk5laQDGueu8K7fNvvoSCpu2W0Dses+Eakt0SzBD2OuurE5gy2fXBUmjRuo1BfW11WsalFgPJ05JWnThL6RbcaAGQdfPmn76omDYdSo5LriOxb/KQ==
Received: from BN9PR03CA0854.namprd03.prod.outlook.com (2603:10b6:408:13d::19)
 by MN2PR12MB4093.namprd12.prod.outlook.com (2603:10b6:208:198::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.6; Thu, 15 Jan
 2026 18:23:54 +0000
Received: from BN2PEPF00004FBA.namprd04.prod.outlook.com
 (2603:10b6:408:13d:cafe::5a) by BN9PR03CA0854.outlook.office365.com
 (2603:10b6:408:13d::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.4 via Frontend Transport; Thu,
 15 Jan 2026 18:23:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 BN2PEPF00004FBA.mail.protection.outlook.com (10.167.243.180) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Thu, 15 Jan 2026 18:23:54 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 15 Jan
 2026 10:23:36 -0800
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Thu, 15 Jan 2026 10:23:36 -0800
Received: from Asurada-Nvidia.nvidia.com (10.127.8.14) by mail.nvidia.com
 (10.126.190.182) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Thu, 15 Jan 2026 10:23:35 -0800
From: Nicolin Chen <nicolinc@nvidia.com>
To: <will@kernel.org>
CC: <jgg@nvidia.com>, <robin.murphy@arm.com>, <joro@8bytes.org>,
	<linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, <skolothumtho@nvidia.com>,
	<praan@google.com>, <xueshuai@linux.alibaba.com>, <smostafa@google.com>
Subject: [PATCH rc v7 1/4] iommu/arm-smmu-v3: Add update_safe bits to fix STE update sequence
Date: Thu, 15 Jan 2026 10:23:28 -0800
Message-ID: <3ce89fec0dc1a108c07e1dd56c552b79fe38f25e.1768501336.git.nicolinc@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1768501336.git.nicolinc@nvidia.com>
References: <cover.1768501336.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FBA:EE_|MN2PR12MB4093:EE_
X-MS-Office365-Filtering-Correlation-Id: 682ab6da-ee95-47b4-afbc-08de54633dbd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Owjpl8xPioqA0q29effajJuxMkD75eGoQijztxGCFNm9RzVdRvHRXi44GX9u?=
 =?us-ascii?Q?vnl+sd/5NVlc23KA4kRqTwM/xMrtUgVkZm6NpqhrVv9XDiSbXwGYmEtUNVHP?=
 =?us-ascii?Q?rg5wgs4yArCj3ZSxYAJTo6tBy9mSZg7WaIu4Isjb3v+lDNqd+nFMQP0jhzfN?=
 =?us-ascii?Q?ZbBQ5PX7ErCvRtlFQRgrdh6uQ1QiVZ85VIh+7NBsbCsCI0dwizv7UeSgpoDG?=
 =?us-ascii?Q?xAKgSR4dKqZLQS0oMFGkyk390XZV0uSV7ojTP/WVtw1YaYJ3wqAk5Te5apCK?=
 =?us-ascii?Q?9BRJgeiH9oDX4KDcygX2bt/jIyJPd2VHNpqNfrwITS7q47kb47Tm+80cuHsq?=
 =?us-ascii?Q?mko/ljlW+dnze1H7Z5JGycfHul5ecosDMHnbrPQONzEFQYpYhEIfHpDxthoK?=
 =?us-ascii?Q?3NjxwAnfrY7fVj+dbGN9/DFuLa3HjAzUMrwjvG2xxkzM6szZXau4ZqqAGyfU?=
 =?us-ascii?Q?IMxl4bRNAB1yvvATMOyYQdWYgoLBYRR/tgs/Ov4as7b5bR2GzCRvMrlu3jmO?=
 =?us-ascii?Q?6nRzoxaTlE4wMj1PFC8wQ0czzMtPVT7KQ8ufPrgFHNPXhH38g/lyfFP2X0PU?=
 =?us-ascii?Q?YvExjzOMWyryQMWESs3/S5vA7WMFok33hs80P5FvtelZbuMTqH8iOeO1QMr0?=
 =?us-ascii?Q?tYmDAfPAm1Pd/rMrgQjiQwNar+mRP30JtIAGIBgXxLTfAlQQN9n9zjk7yUnk?=
 =?us-ascii?Q?4L4xb0qIClmqJ2PjUsBluJX9ZNTUnUFBSfP5KyaHXolZ1KqrzBUw3LBMf1YN?=
 =?us-ascii?Q?sWTnOghqofejQZ3NhcStoK/XeRhV0htPhrGmqTzWSWeDWKrsi+e/GkSqh1Hw?=
 =?us-ascii?Q?W5K5eEC2P1qwe4H6NQqu1d9438TCPwuYQqZGoR3RAedfcughOo7dqefIN+tl?=
 =?us-ascii?Q?Sddj2UbpL9xhnzD7UZ4FqrKze1Ww0pxbelM2ea0kGs1EwDQBc9O32Q4rHrig?=
 =?us-ascii?Q?rsfb5t/hFwB3HONma8MRhkac0OH8dNBhM8ptk1Kk0cY0GUDOoxtkBDrNezw9?=
 =?us-ascii?Q?87eVhB/FAmqsiY9NQAcnFNlQp0P/gjRJ2RLbd6ZpX0ppWAFb/ObO70PpbUfy?=
 =?us-ascii?Q?D9VL0kg9a4B+TYLbXczp5Omd8zsYiv29LJLrI5p5mV6BuXVgXOC88eYVvV0a?=
 =?us-ascii?Q?gMPkCYKAQZpT6F6QANp56Bkwn2md9Jgh2jpZFVwpe/eH9Dg0aow6FsXDnlxC?=
 =?us-ascii?Q?lsfFL9hKAa8aqsnnwKkGg2tJMPltWqCnhyUuGd7S9RVzbnb9DY+Rz+zRkPbf?=
 =?us-ascii?Q?Nz7WWS0MBvvGUAbZi7th5AOtz96weB11d0a2FWVGuUyrBhfVwHm/SppI6aDI?=
 =?us-ascii?Q?uLm5DzPEX0sT/Y7N6oA9lN6BkTX5dhFjUbTbT/oZL+uqh3V+vwYVhWGtPgXB?=
 =?us-ascii?Q?SISRNSDH+56ZchJSUW5nmPKIKZVQy/+WXxvmEJ0fZHkWuIpRiac2O6H63BVZ?=
 =?us-ascii?Q?n9fZdLjD3hkaMeHvdCWeJiTCFzkaEONxJRTFhwo/BPSTtdxrWwCW8Q0W5vt1?=
 =?us-ascii?Q?DgaHkwMDOQbB8ihWPI6b/a2lPg3nQlQ70KKvX52adqrIv3N87h6sNRg+QQ2i?=
 =?us-ascii?Q?XlqExEVEazl/GyZH+C2WZOQIqe4MJ3PguO6MKC+F5NzG98n++q4FfN4lYFI6?=
 =?us-ascii?Q?LMQEUFiQ4ud5bWNokvGXqrw00vvOKA7vumCsut28wvflnq/Yxzsex60IsHLz?=
 =?us-ascii?Q?yu3tpA=3D=3D?=
X-Forefront-Antispam-Report: CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2026 18:23:54.5822
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 682ab6da-ee95-47b4-afbc-08de54633dbd
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF00004FBA.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4093
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_102404_275628_CC5C03FC 
X-CRM114-Status: GOOD (  20.95  )
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

C_BAD_STE was observed when updating nested STE from an S1-bypass mode to
an S1DSS-bypass mode. As both modes enabled S2, the used bit is slightly
different than the normal S1-bypass and S1DSS-bypass modes. As a result,
fields like MEV and EATS in S2's used list marked the word1 as a critical
word that requested a STE.V=0. This breaks a hitless update.

However, both MEV and EATS aren't critical in terms of STE update. One
controls the merge of the events and the other controls the ATS that is
managed by the driver at the same time via pci_enable_ats().

Add an arm_smmu_get_ste_update_safe() to allow STE update algorithm to
relax those fields, avoiding the STE update breakages.

After this change, entry_set has no caller checking its return value, so
change it to void.

Note that this change is required by both MEV and EATS fields, which were
introduced in different kernel versions. So add get_update_safe() first.
MEV and EATS will be added to arm_smmu_get_ste_update_safe() separately.

Fixes: 1e8be08d1c91 ("iommu/arm-smmu-v3: Support IOMMU_DOMAIN_NESTED")
Cc: stable@vger.kernel.org
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
Reviewed-by: Shuai Xue <xueshuai@linux.alibaba.com>
Reviewed-by: Mostafa Saleh <smostafa@google.com>
Reviewed-by: Pranjal Shrivastava <praan@google.com>
Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h   |  4 +++
 .../iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c  | 31 +++++++++++++++++--
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c   | 28 ++++++++++++-----
 3 files changed, 53 insertions(+), 10 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
index ae23aacc3840..287e223c054d 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
@@ -900,6 +900,8 @@ struct arm_smmu_entry_writer {
 
 struct arm_smmu_entry_writer_ops {
 	void (*get_used)(const __le64 *entry, __le64 *used);
+	void (*get_update_safe)(const __le64 *cur, const __le64 *target,
+				__le64 *safe_bits);
 	void (*sync)(struct arm_smmu_entry_writer *writer);
 };
 
@@ -911,6 +913,8 @@ void arm_smmu_make_s2_domain_ste(struct arm_smmu_ste *target,
 
 #if IS_ENABLED(CONFIG_KUNIT)
 void arm_smmu_get_ste_used(const __le64 *ent, __le64 *used_bits);
+void arm_smmu_get_ste_update_safe(const __le64 *cur, const __le64 *target,
+				  __le64 *safe_bits);
 void arm_smmu_write_entry(struct arm_smmu_entry_writer *writer, __le64 *cur,
 			  const __le64 *target);
 void arm_smmu_get_cd_used(const __le64 *ent, __le64 *used_bits);
diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c
index d2671bfd3798..b254a94b2003 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c
@@ -38,13 +38,16 @@ enum arm_smmu_test_master_feat {
 static bool arm_smmu_entry_differs_in_used_bits(const __le64 *entry,
 						const __le64 *used_bits,
 						const __le64 *target,
+						const __le64 *safe,
 						unsigned int length)
 {
 	bool differs = false;
 	unsigned int i;
 
 	for (i = 0; i < length; i++) {
-		if ((entry[i] & used_bits[i]) != target[i])
+		__le64 used = used_bits[i] & ~safe[i];
+
+		if ((entry[i] & used) != (target[i] & used))
 			differs = true;
 	}
 	return differs;
@@ -56,12 +59,24 @@ arm_smmu_test_writer_record_syncs(struct arm_smmu_entry_writer *writer)
 	struct arm_smmu_test_writer *test_writer =
 		container_of(writer, struct arm_smmu_test_writer, writer);
 	__le64 *entry_used_bits;
+	__le64 *safe_target;
+	__le64 *safe_init;
 
 	entry_used_bits = kunit_kzalloc(
 		test_writer->test, sizeof(*entry_used_bits) * NUM_ENTRY_QWORDS,
 		GFP_KERNEL);
 	KUNIT_ASSERT_NOT_NULL(test_writer->test, entry_used_bits);
 
+	safe_target = kunit_kzalloc(test_writer->test,
+				    sizeof(*safe_target) * NUM_ENTRY_QWORDS,
+				    GFP_KERNEL);
+	KUNIT_ASSERT_NOT_NULL(test_writer->test, safe_target);
+
+	safe_init = kunit_kzalloc(test_writer->test,
+				  sizeof(*safe_init) * NUM_ENTRY_QWORDS,
+				  GFP_KERNEL);
+	KUNIT_ASSERT_NOT_NULL(test_writer->test, safe_init);
+
 	pr_debug("STE value is now set to: ");
 	print_hex_dump_debug("    ", DUMP_PREFIX_NONE, 16, 8,
 			     test_writer->entry,
@@ -79,14 +94,23 @@ arm_smmu_test_writer_record_syncs(struct arm_smmu_entry_writer *writer)
 		 * configuration.
 		 */
 		writer->ops->get_used(test_writer->entry, entry_used_bits);
+		if (writer->ops->get_update_safe)
+			writer->ops->get_update_safe(test_writer->entry,
+						     test_writer->init_entry,
+						     safe_init);
+		if (writer->ops->get_update_safe)
+			writer->ops->get_update_safe(test_writer->entry,
+						     test_writer->target_entry,
+						     safe_target);
 		KUNIT_EXPECT_FALSE(
 			test_writer->test,
 			arm_smmu_entry_differs_in_used_bits(
 				test_writer->entry, entry_used_bits,
-				test_writer->init_entry, NUM_ENTRY_QWORDS) &&
+				test_writer->init_entry, safe_init,
+				NUM_ENTRY_QWORDS) &&
 				arm_smmu_entry_differs_in_used_bits(
 					test_writer->entry, entry_used_bits,
-					test_writer->target_entry,
+					test_writer->target_entry, safe_target,
 					NUM_ENTRY_QWORDS));
 	}
 }
@@ -106,6 +130,7 @@ arm_smmu_v3_test_debug_print_used_bits(struct arm_smmu_entry_writer *writer,
 static const struct arm_smmu_entry_writer_ops test_ste_ops = {
 	.sync = arm_smmu_test_writer_record_syncs,
 	.get_used = arm_smmu_get_ste_used,
+	.get_update_safe = arm_smmu_get_ste_update_safe,
 };
 
 static const struct arm_smmu_entry_writer_ops test_cd_ops = {
diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index d16d35c78c06..390446d259ab 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -1082,6 +1082,13 @@ void arm_smmu_get_ste_used(const __le64 *ent, __le64 *used_bits)
 }
 EXPORT_SYMBOL_IF_KUNIT(arm_smmu_get_ste_used);
 
+VISIBLE_IF_KUNIT
+void arm_smmu_get_ste_update_safe(const __le64 *cur, const __le64 *target,
+				  __le64 *safe_bits)
+{
+}
+EXPORT_SYMBOL_IF_KUNIT(arm_smmu_get_ste_update_safe);
+
 /*
  * Figure out if we can do a hitless update of entry to become target. Returns a
  * bit mask where 1 indicates that qword needs to be set disruptively.
@@ -1094,13 +1101,22 @@ static u8 arm_smmu_entry_qword_diff(struct arm_smmu_entry_writer *writer,
 {
 	__le64 target_used[NUM_ENTRY_QWORDS] = {};
 	__le64 cur_used[NUM_ENTRY_QWORDS] = {};
+	__le64 safe[NUM_ENTRY_QWORDS] = {};
 	u8 used_qword_diff = 0;
 	unsigned int i;
 
 	writer->ops->get_used(entry, cur_used);
 	writer->ops->get_used(target, target_used);
+	if (writer->ops->get_update_safe)
+		writer->ops->get_update_safe(entry, target, safe);
 
 	for (i = 0; i != NUM_ENTRY_QWORDS; i++) {
+		/*
+		 * Safe is only used for bits that are used by both entries,
+		 * otherwise it is sequenced according to the unused entry.
+		 */
+		safe[i] &= target_used[i] & cur_used[i];
+
 		/*
 		 * Check that masks are up to date, the make functions are not
 		 * allowed to set a bit to 1 if the used function doesn't say it
@@ -1109,6 +1125,7 @@ static u8 arm_smmu_entry_qword_diff(struct arm_smmu_entry_writer *writer,
 		WARN_ON_ONCE(target[i] & ~target_used[i]);
 
 		/* Bits can change because they are not currently being used */
+		cur_used[i] &= ~safe[i];
 		unused_update[i] = (entry[i] & cur_used[i]) |
 				   (target[i] & ~cur_used[i]);
 		/*
@@ -1121,7 +1138,7 @@ static u8 arm_smmu_entry_qword_diff(struct arm_smmu_entry_writer *writer,
 	return used_qword_diff;
 }
 
-static bool entry_set(struct arm_smmu_entry_writer *writer, __le64 *entry,
+static void entry_set(struct arm_smmu_entry_writer *writer, __le64 *entry,
 		      const __le64 *target, unsigned int start,
 		      unsigned int len)
 {
@@ -1137,7 +1154,6 @@ static bool entry_set(struct arm_smmu_entry_writer *writer, __le64 *entry,
 
 	if (changed)
 		writer->ops->sync(writer);
-	return changed;
 }
 
 /*
@@ -1207,12 +1223,9 @@ void arm_smmu_write_entry(struct arm_smmu_entry_writer *writer, __le64 *entry,
 		entry_set(writer, entry, target, 0, 1);
 	} else {
 		/*
-		 * No inuse bit changed. Sanity check that all unused bits are 0
-		 * in the entry. The target was already sanity checked by
-		 * compute_qword_diff().
+		 * No inuse bit changed, though safe bits may have changed.
 		 */
-		WARN_ON_ONCE(
-			entry_set(writer, entry, target, 0, NUM_ENTRY_QWORDS));
+		entry_set(writer, entry, target, 0, NUM_ENTRY_QWORDS);
 	}
 }
 EXPORT_SYMBOL_IF_KUNIT(arm_smmu_write_entry);
@@ -1543,6 +1556,7 @@ static void arm_smmu_ste_writer_sync_entry(struct arm_smmu_entry_writer *writer)
 static const struct arm_smmu_entry_writer_ops arm_smmu_ste_writer_ops = {
 	.sync = arm_smmu_ste_writer_sync_entry,
 	.get_used = arm_smmu_get_ste_used,
+	.get_update_safe = arm_smmu_get_ste_update_safe,
 };
 
 static void arm_smmu_write_ste(struct arm_smmu_master *master, u32 sid,
-- 
2.43.0


