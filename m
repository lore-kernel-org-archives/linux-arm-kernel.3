Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B18BCD4660B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Jan 2026 18:24:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5/iEWqcngyDwHzBhCXp1aWe1h/qcBakXkiXFj4dN7bw=; b=1POhM1du6OUFqW9ceuNLrlnmDh
	KpNZym0oNdJXPh22C3rm2KcV1poW05mxq+I9MufBsJW4cAto8O9mAArWr1XQUcxFqcJKPTNSsg7Bb
	gvEpDP7ENMmZUn6hYYSwmcctB7TH7ZLz40s6hsoJ7rETcFlQMuLsc+UFH8rULeCitRvWB6mcsi22W
	OM48vkyvnfw84TAsH0cwJ3u1F6XpL40va8cIdHILB3Yw8W8PBpS3wm6/Ow5DwPgOTXtiiTOzhJ0KB
	1n4tOY55gX1Fd7jna0GOcbyVz9ndodrhR/41C0ntT6iT4MwxINd0/ozaioXzqA4CEVVovKPkbA7BO
	+S/sOMFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgS10-0000000CxRL-3dQi;
	Thu, 15 Jan 2026 18:24:14 +0000
Received: from mail-northcentralusazon11012031.outbound.protection.outlook.com ([40.107.200.31] helo=CH5PR02CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgS0q-0000000CxLF-2cu1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Jan 2026 18:24:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q1M7cqH5vHrdSgWpP54AE3XP1Nh790wmwC+zJBCFjDK9bdSpqF4lILUkeSPuZvR/+VHcHxKcYvAe1ZEGQIZY5L5V3tmMLKPZsNAwEVOWye5AOLaSxgaP6ET1DOWopZhPC0DSNjfqLgoKdqMuGKaP3kk+4pcrFtlCT97RicciW+El8u/SD9u2f824TQk1QLqVqCXlmjNCxqZ+tdvWMtCliIooTbUgVNdbv9DH5NcOLuf61aJyGPy72wYszjK+ZWfo/m7Bl2LWFltzQj7pVITtxMvSqil2wXESn6d4zb946tEWFBYMBdqgYXruyD6UXhqu/JhBa8Ztyg1Z5FaWsEy8UQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5/iEWqcngyDwHzBhCXp1aWe1h/qcBakXkiXFj4dN7bw=;
 b=MiYsVKPSJdmOZ50d/7aqpLEvZGInaoWH/ogdibyZPpN+uPetPXpXEyI28hxfLB7cWmxsjLmJ5CKQnR9eBoxvqDian/eHzS0IvBC58i7lPiFuhy/i3+feAzhBB8PsPjAt4Gl3Jxx5/sWSyAdYLpDHW9YVTfTUk+Q53cTyqKTkoNicZE80puAihFiaY8R01Z9zvf5v/pGe/FsUpcQazJDyOlumwr+DKGN0WpyIPxpb3qm6jdN+RBGiPSVOVToCUdeR9NsFLD4GlrFF11eZlzKPdIXqh4NOdmaF5Givg4xbTPksnpppSkEbHBNxzv6SOtCHNyDM1LP9K/m64LtvZ4cR/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5/iEWqcngyDwHzBhCXp1aWe1h/qcBakXkiXFj4dN7bw=;
 b=JvvD/dUkl8G6X7mfL4c6BGrQjn8ckQ6lnb/btGPMA5/ObvFISM3/9H8czR3DbuqzY3LRJk7LEFh3T6giYSLK71MgjXthqR7FZV8KWMx5EcA3Ima3Kk8AJ9GZ1GNyn+XIv8YpS+7hZJ+leIbp0btdsBqRj0NHLNriFxwrCbKxuafA6q7nZD0PYttn19IX+1Gja51U53mHIFEVc31vaVbRzv8NMYRssg3MpeZIG15uaVdQb3qjfLt/U6t4u6838Hjr1TpxIWowh7WMxixNJV/5Dvn3okPNFdWXTyr93IM71k2XnGgQ2aCyWylXqG8aL//vp2YLXF+BVFL7fUucnCM4OQ==
Received: from SJ0PR13CA0107.namprd13.prod.outlook.com (2603:10b6:a03:2c5::22)
 by CY8PR12MB7660.namprd12.prod.outlook.com (2603:10b6:930:84::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Thu, 15 Jan
 2026 18:23:56 +0000
Received: from SJ1PEPF00001CEA.namprd03.prod.outlook.com
 (2603:10b6:a03:2c5:cafe::f5) by SJ0PR13CA0107.outlook.office365.com
 (2603:10b6:a03:2c5::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.2 via Frontend Transport; Thu,
 15 Jan 2026 18:23:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 SJ1PEPF00001CEA.mail.protection.outlook.com (10.167.242.26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Thu, 15 Jan 2026 18:23:56 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 15 Jan
 2026 10:23:39 -0800
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Thu, 15 Jan 2026 10:23:38 -0800
Received: from Asurada-Nvidia.nvidia.com (10.127.8.14) by mail.nvidia.com
 (10.126.190.182) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Thu, 15 Jan 2026 10:23:38 -0800
From: Nicolin Chen <nicolinc@nvidia.com>
To: <will@kernel.org>
CC: <jgg@nvidia.com>, <robin.murphy@arm.com>, <joro@8bytes.org>,
	<linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, <skolothumtho@nvidia.com>,
	<praan@google.com>, <xueshuai@linux.alibaba.com>, <smostafa@google.com>
Subject: [PATCH rc v7 4/4] iommu/arm-smmu-v3-test: Add nested s1bypass/s1dssbypass coverage
Date: Thu, 15 Jan 2026 10:23:31 -0800
Message-ID: <95f813482d7acf6de45e85c9e0caa3bec52a6a65.1768501336.git.nicolinc@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1768501336.git.nicolinc@nvidia.com>
References: <cover.1768501336.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CEA:EE_|CY8PR12MB7660:EE_
X-MS-Office365-Filtering-Correlation-Id: 97709389-c673-4902-6654-08de54633eda
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700013;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?6Zcl0kDEsYBlVTOZQIbCJwcY3nL4i8bvydc5uDTrZUekn40N+iX2GyevBTvU?=
 =?us-ascii?Q?pJIspiEQnGxG9CybgT4Ais9TvtZmxGieuEgoMBIxQivhrb3Fvb9HJwuHE4Jv?=
 =?us-ascii?Q?g/t2JxoIxfJt4nu4/8W6cfTkLAMU6MntliyQc8YUuQGHRtrMqInawcM8OEJC?=
 =?us-ascii?Q?WmQvxspYyfY/SpV8s6/s3RxtOnAMNltJinSxzLVpUTDCh0cIMbiv6T1p0TXt?=
 =?us-ascii?Q?OZfquBprtsE6STC1kjg31GwrKP25kiZh7cH9FYEjGpKtHJ2GgyOEgk86QPNm?=
 =?us-ascii?Q?aigTvtaIyNiYg44+C5pdXD/nb45EuiBWtjjgcXlYhcnNMIy/P1TRu5dCs/OH?=
 =?us-ascii?Q?xas2HPAX+fz66zLffgNXRZm0fzD5k1azNaGRIevvrsmaD+4IfpdVuj9z2xe2?=
 =?us-ascii?Q?TxyeocIkKXXgUFRKbseBD7hzjlAQ6+xVJk7+7omF3t1v+Kr9/5KJrmtRVfw4?=
 =?us-ascii?Q?CXdJGAjxQN/HJehknt49KgujPsb9S7sLjeSMsI/lIVJzTDKCUi3dOEo2/+We?=
 =?us-ascii?Q?0yUuPh01NlWJGOGSxlBTsXzsp6nqt2wCihZYdZMX0z6Gh1H08se1Imd32yDc?=
 =?us-ascii?Q?NcZ3CgyWKsFx5v4qsooHYeYk/Td5kwGgnbmK4WZ4YPykPZSM9hEd0GEwWapb?=
 =?us-ascii?Q?NJdCBl19X5QInwfaUUdVW5AeekGs9baQJybOgTWt5wTAzkliAZcOTQsprZhy?=
 =?us-ascii?Q?ue/Vg9Vw+5LfvQYvzqefz09vMkexhzeiFv2pjaOAuiDyc12hTjVKzm3EQ2MG?=
 =?us-ascii?Q?vQLLPa++7BSOEYvcSeMPgsmGaEcnkxIdwn29W0XHvj84BylC1wnm63hnpYzE?=
 =?us-ascii?Q?e5ZXFmoqkSv3uyXe7kLYVYJO1DszvC+2glMSWtyY7xQNpKOTraLOt9AuugtL?=
 =?us-ascii?Q?6T2Y3M18xLIbVVFblAjuBwDfq+5yjLrFrM4slTxZ7WC9g1dt2W4njQi5dHoP?=
 =?us-ascii?Q?PIQyttfZDzRnWhZBnTH+EpxUtSVVnepA+bbcUBW6gj2O3UkpQ+/6XT0mdzAs?=
 =?us-ascii?Q?kLvawMWYZqUbqyZfU9SUinPJVq2eFTvG+ZMHJcwTvfE8Ykdp7VzTQfWR8BwA?=
 =?us-ascii?Q?/UiLzZ1NSs8vCv8qq0hOSnddT9tfwLQ9gTC5+IbubQw1ZAs6USDzlREJfB+B?=
 =?us-ascii?Q?nK3RedLuL2syB5UidO/QBe4oN0hAoP3eYEiyr2MS5/5/Kf9hnq5yn+vKukRg?=
 =?us-ascii?Q?BbLkNOJjs5JSeoJrro1O79xFGx9jvcCX6ZnnbuputY3Un9Q4ds6Yr37Niw6t?=
 =?us-ascii?Q?ue0VQBrtCkhb3hxIcz203LAC31LrZHqiuGAqBIytiztidgBztsGdejcczQ/E?=
 =?us-ascii?Q?uKHS911H1C1NJkKNkFBv2MAYHAei+isNZlI5+B8TEkabRpjMsxJi0s8LTpxu?=
 =?us-ascii?Q?vU3MSHM8q+XpKqOJI9HvoqJBfGvm24HQZpAQRhLIeXUEl0E1EHa8134r+6dx?=
 =?us-ascii?Q?bgMdasRS9bYp2VypqpnPLkXOev4/Do2gA05aALDl5627NCl4qUBTWi/k7l+O?=
 =?us-ascii?Q?AdWlWtz+hhatEQuqkRIBJurhW8FXgG+Xm4ZR6aEOFHqQpMaNnMjFGzHTsW/W?=
 =?us-ascii?Q?IVRZX5C/Ti3W4lr65K0vp4qNuZw5u4ukF2o1Xm7NWBO+5QkTTT967KyGVLKH?=
 =?us-ascii?Q?R+OYqH4Ff44l15z7W7wm8M/bf6kCSEvgzsuvo9O07pCHwA9mDcMULpFE6ITf?=
 =?us-ascii?Q?m4wq3Q=3D=3D?=
X-Forefront-Antispam-Report: CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2026 18:23:56.5912
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 97709389-c673-4902-6654-08de54633eda
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00001CEA.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7660
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_102405_903343_C0707444 
X-CRM114-Status: GOOD (  11.58  )
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

STE in a nested case requires both S1 and S2 fields. And this makes the use
case different from the existing one.

Add coverage for previously failed cases shifting between S2-only and S1+S2
STEs.

Reviewed-by: Shuai Xue <xueshuai@linux.alibaba.com>
Reviewed-by: Mostafa Saleh <smostafa@google.com>
Reviewed-by: Pranjal Shrivastava <praan@google.com>
Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
---
 .../iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c  | 47 +++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c
index b254a94b2003..69c9ef441fc1 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c
@@ -33,8 +33,12 @@ static struct mm_struct sva_mm = {
 enum arm_smmu_test_master_feat {
 	ARM_SMMU_MASTER_TEST_ATS = BIT(0),
 	ARM_SMMU_MASTER_TEST_STALL = BIT(1),
+	ARM_SMMU_MASTER_TEST_NESTED = BIT(2),
 };
 
+static void arm_smmu_test_make_s2_ste(struct arm_smmu_ste *ste,
+				      enum arm_smmu_test_master_feat feat);
+
 static bool arm_smmu_entry_differs_in_used_bits(const __le64 *entry,
 						const __le64 *used_bits,
 						const __le64 *target,
@@ -210,6 +214,18 @@ static void arm_smmu_test_make_cdtable_ste(struct arm_smmu_ste *ste,
 	};
 
 	arm_smmu_make_cdtable_ste(ste, &master, ats_enabled, s1dss);
+	if (feat & ARM_SMMU_MASTER_TEST_NESTED) {
+		struct arm_smmu_ste s2ste;
+		int i;
+
+		arm_smmu_test_make_s2_ste(&s2ste,
+					  feat & ~ARM_SMMU_MASTER_TEST_NESTED);
+		ste->data[0] |= cpu_to_le64(
+			FIELD_PREP(STRTAB_STE_0_CFG, STRTAB_STE_0_CFG_NESTED));
+		ste->data[1] |= cpu_to_le64(STRTAB_STE_1_MEV);
+		for (i = 2; i < NUM_ENTRY_QWORDS; i++)
+			ste->data[i] = s2ste.data[i];
+	}
 }
 
 static void arm_smmu_v3_write_ste_test_bypass_to_abort(struct kunit *test)
@@ -567,6 +583,35 @@ static void arm_smmu_v3_write_ste_test_s2_to_s1_stall(struct kunit *test)
 						       NUM_EXPECTED_SYNCS(3));
 }
 
+static void
+arm_smmu_v3_write_ste_test_nested_s1dssbypass_to_s1bypass(struct kunit *test)
+{
+	struct arm_smmu_ste s1_ste;
+	struct arm_smmu_ste s2_ste;
+
+	arm_smmu_test_make_cdtable_ste(
+		&s1_ste, STRTAB_STE_1_S1DSS_BYPASS, fake_cdtab_dma_addr,
+		ARM_SMMU_MASTER_TEST_ATS | ARM_SMMU_MASTER_TEST_NESTED);
+	arm_smmu_test_make_s2_ste(&s2_ste, 0);
+	/* Expect an additional sync to unset ignored bits: EATS and MEV */
+	arm_smmu_v3_test_ste_expect_hitless_transition(test, &s1_ste, &s2_ste,
+						       NUM_EXPECTED_SYNCS(3));
+}
+
+static void
+arm_smmu_v3_write_ste_test_nested_s1bypass_to_s1dssbypass(struct kunit *test)
+{
+	struct arm_smmu_ste s1_ste;
+	struct arm_smmu_ste s2_ste;
+
+	arm_smmu_test_make_cdtable_ste(
+		&s1_ste, STRTAB_STE_1_S1DSS_BYPASS, fake_cdtab_dma_addr,
+		ARM_SMMU_MASTER_TEST_ATS | ARM_SMMU_MASTER_TEST_NESTED);
+	arm_smmu_test_make_s2_ste(&s2_ste, 0);
+	arm_smmu_v3_test_ste_expect_hitless_transition(test, &s2_ste, &s1_ste,
+						       NUM_EXPECTED_SYNCS(2));
+}
+
 static void arm_smmu_v3_write_cd_test_sva_clear(struct kunit *test)
 {
 	struct arm_smmu_cd cd = {};
@@ -613,6 +658,8 @@ static struct kunit_case arm_smmu_v3_test_cases[] = {
 	KUNIT_CASE(arm_smmu_v3_write_cd_test_s1_change_asid),
 	KUNIT_CASE(arm_smmu_v3_write_ste_test_s1_to_s2_stall),
 	KUNIT_CASE(arm_smmu_v3_write_ste_test_s2_to_s1_stall),
+	KUNIT_CASE(arm_smmu_v3_write_ste_test_nested_s1dssbypass_to_s1bypass),
+	KUNIT_CASE(arm_smmu_v3_write_ste_test_nested_s1bypass_to_s1dssbypass),
 	KUNIT_CASE(arm_smmu_v3_write_cd_test_sva_clear),
 	KUNIT_CASE(arm_smmu_v3_write_cd_test_sva_release),
 	{},
-- 
2.43.0


