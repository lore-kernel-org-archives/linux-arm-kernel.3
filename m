Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98CA8CF45CE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Jan 2026 20:21:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=My1MVquru2POB/BJNlg8mqMX5saKSCQgi1bApfAbPrU=; b=dz51en7XgAlw1lz1ZuomDL9idU
	3peIKd25qkbfFbM4DsmnRk5ZXNjk+Ulo56VPqstzKpZ0NMFBIEWpAGdINNwBl1JH6lVNXMlFD3i3H
	GgaSQPeQMfGjkitjg5sdsdIeMXJahcUFMCMn1OaOTO/t4/yVybhiWTAhaRjItzlqO6K4/rJlYktCM
	dOrO9c/L29xUON0KygZVuFyi97tuIqhW4A/hUq3GUejpXaXiyKr5ksRvLvsFA+PXBTemIC3dCHS/l
	5iuYko/i5MDqwps1g+U1xwlmpWrzFiTGMIXTjlKw75wHraFyVyrKL1j3ueSxVoucNjazMx7OjWmiB
	xRcgHw0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfOPW-000000069rM-1B31;
	Mon, 12 Jan 2026 20:21:10 +0000
Received: from mail-westusazon11010063.outbound.protection.outlook.com ([52.101.85.63] helo=BYAPR05CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfOPS-000000069oT-05sP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Jan 2026 20:21:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RahVfkLQCILo4+gSGJ9qra1obqNLOb7oLQorCwjFMp6UqRUXoQdp9q1f/jA4CXhzZUrS+FLuLv4kpCv1DvEtWMHmVSCVSMAbVi3drNVUbnFrc8Bm1pGuHUzKmT898/r42+8uqua+Pp866RO57eWWN9ajmSUvw2zK+9t1KpooZR5ibfLmYG50gyGSHOBdUZ4l2cRKhp626XCjQqdv8J6/vrjQiaABFJ3hsoGNK+CzoEWlQlut+v5kZ/r+jio3UYN7ypCxSBLs+ZDtQ4j4Iz804nyE10d5ji1eO2Kdb3UDf11jvQ76/WiLp5rBTNXbTmmK5g+1sd4352QZJok4+KOopw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=My1MVquru2POB/BJNlg8mqMX5saKSCQgi1bApfAbPrU=;
 b=tSRsZ1pl1Plf8TIFOUNt+SY1/f8aP/vWRNmYhrgUHPyISKp8yOT/XNvi8ITCJCNcDS5Y+MzjT0mjFJcTVzELbmdmfCB8M9I65W5PdYy3ukyIuLFAYoMrDNnPyd6hR4X191t+QJLKYy/KwPgqnVU1ttVEeHBBLETozVKaIjeyPN18FdbH/HHKXhiFVcUKpmMGTIWIu6884yQGD+V9FNjrfKhy/e72eiduLUrqfjrTLAE48L0/2Xx3vk/8i135emdoRJ5BVRApJrTN2r1akC5veUpERlFw6X/9yh0/wZdjUabOO2XD7uiHcYFva4iA90LYcXhoi/ejFB7Ex1GwwaAkZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=My1MVquru2POB/BJNlg8mqMX5saKSCQgi1bApfAbPrU=;
 b=FctS+/KfGL4JFz8yPtdW6aLI9dx1nE5zj0gyxBkZ8hLeIFi1T/wsEl3zxqDZqok3Qwa3i5pmqQw00LAV9qjcyVyU+tC3UmbSbtNozUVIVjUBT3FWKrs3/VNFDz4XxhC6GqqkmsooZOdIugzAXTOajpTrhDtZ+dkowNFqWUgmRxAhZ8JYrFi4VVL/QTqhGNaQgg/WnGXPcwsTAIo/2LQEfzTk0nkBaR76bjc9ph6Gxs8PxGTRsdI9inewYgs8bCEYsNLv6/TymT3QBa6RGYjtiRb/0hNbd7MMkVRHSGBGia0F/dCR/pZI4IQ93vgK7+D97L0j4iD5L8j+kg+aLp0dGw==
Received: from BN9PR03CA0422.namprd03.prod.outlook.com (2603:10b6:408:113::7)
 by SA3PR12MB7805.namprd12.prod.outlook.com (2603:10b6:806:319::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Mon, 12 Jan
 2026 20:20:58 +0000
Received: from BN3PEPF0000B071.namprd04.prod.outlook.com
 (2603:10b6:408:113:cafe::9) by BN9PR03CA0422.outlook.office365.com
 (2603:10b6:408:113::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.7 via Frontend Transport; Mon,
 12 Jan 2026 20:21:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN3PEPF0000B071.mail.protection.outlook.com (10.167.243.116) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Mon, 12 Jan 2026 20:20:56 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 12 Jan
 2026 12:20:35 -0800
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 12 Jan
 2026 12:20:35 -0800
Received: from Asurada-Nvidia.nvidia.com (10.127.8.14) by mail.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Mon, 12 Jan 2026 12:20:34 -0800
From: Nicolin Chen <nicolinc@nvidia.com>
To: <will@kernel.org>
CC: <jgg@nvidia.com>, <robin.murphy@arm.com>, <joro@8bytes.org>,
	<linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, <skolothumtho@nvidia.com>,
	<praan@google.com>, <xueshuai@linux.alibaba.com>, <smostafa@google.com>
Subject: [PATCH rc v6 4/4] iommu/arm-smmu-v3-test: Add nested s1bypass/s1dssbypass coverage
Date: Mon, 12 Jan 2026 12:20:17 -0800
Message-ID: <a72a60a36c9831bd91f369de5af0ccd96d180dbf.1768248467.git.nicolinc@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1768248467.git.nicolinc@nvidia.com>
References: <cover.1768248467.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B071:EE_|SA3PR12MB7805:EE_
X-MS-Office365-Filtering-Correlation-Id: 4486b22f-e160-48c6-7f49-08de521817cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?/k/Wwwtxn7dPli8dVzukKP+eYd/Fk2W2ntFf8GxQA3I0W0D0ol3jVcfZEjzf?=
 =?us-ascii?Q?IcRtu4bycvY7GWxlsbWbVE04hhThwy3hvg5efRwJmLj7XTLef1Dpe8+QUjre?=
 =?us-ascii?Q?4+QRSFlivvdTGJXZfBcpZdo/ShDZGX+7DdEbW48JC3pn6UQ9xdjvsQgCbwfV?=
 =?us-ascii?Q?OFMY+ezQbeEFres8GJRsiBjlcbufx3aj1jB++p9VIiDr/nODRsdrpkGfCCa5?=
 =?us-ascii?Q?6Y9K76q1aY8T/aE+vgnp9xuAdB0wr3ztSED3gwvfzcaknKGGVqISc4JefrYS?=
 =?us-ascii?Q?bmcL4MxjTmAOBoiQ9GNr1UO+vzcBkmvS85rfxg5uM+1lVB5oGGyNEg8Gt3bN?=
 =?us-ascii?Q?ywjGHG1PJzyuPJP7vBAEXYZq4grEoXFWONyp7BRmJRzyXxREga8ir3QN8DmD?=
 =?us-ascii?Q?O+S9NeOnt2O1PX4LyozXMbizJsSv+kGc2K31BGSjXkCttTVWDMvpHMQatdo2?=
 =?us-ascii?Q?DG4crFQP5Jn/E2vaNhoggb0D1ow4yxRrNEDzZutYKktwS6eD2a2U5ynbS59N?=
 =?us-ascii?Q?R7iyHmq2PhoDodViHYRrI5ZnB3XNcdK8kZ+EHXKixyvJKW1Vh9qNPKVrY5fa?=
 =?us-ascii?Q?JHhXN6b0OjIacaBajSs3Mxy7rONZQHTCw04KfKr3hJWHctqdrsUb5R/ySNVZ?=
 =?us-ascii?Q?vY9eijXDP+/9/+Z+rKxU8YKmeSJo7LqIMlwrE7LF1Qr0sJuM8Pb1FWagsyHJ?=
 =?us-ascii?Q?L6qC4exAE7HYH1YvukNQsoJmekaAVACQCTjyUkC/7jPLq9UfqvW8a4NJeXGr?=
 =?us-ascii?Q?79grqapHVBp85Z5j/ORHe5+CkDU5CTQLRJc0+WXW2VorwgUvEzYW0for6ZI+?=
 =?us-ascii?Q?/JQ4wxMD01/Wq2cj4Hwe+/7C99Sp1+qrdDMISVlgYaWaSxKTqb+EvsC0p7ze?=
 =?us-ascii?Q?6TmQn4hmSowjfDp7YcMpZ1k0/9DdnzfcGwZJ8s65uDGz/V7O8AHEzhAe1jJr?=
 =?us-ascii?Q?DYUboD/iL3EkA7zqd+Z/NoJFPn8528G591UvrMHB9CN788MS98/ElIA1fACZ?=
 =?us-ascii?Q?gyefKUjByz9+sexNBozMSXPdTaVkV3aWyRMp3CnGqiERG8M7Q9UUNYVwa2R2?=
 =?us-ascii?Q?FjeXP3/0PqtKZaPZJZoZ6Qvx5JCgBLQTRrDSmDBVmz+s9iGxJqDlAtvxT4HA?=
 =?us-ascii?Q?g6G6AvsvYdcyvU8KCs+/zDNIERB6+avZOON233NXet8bXFifvapqRIfuwfP5?=
 =?us-ascii?Q?dw6L1hqEaX0V4Knl8s/HdlTlGtcW501gqIhGbJWDuGAn/L5F2f8ds78e+YlB?=
 =?us-ascii?Q?9OEdjmrjpAhy7mD5U9lX+msE8s5y1/54IMZJvwLWrUFcb5XaR2RF2ehMUFo/?=
 =?us-ascii?Q?U2zpoQawMmhDh1/kPw3TnHxgVPgZAlnvJ+S8tknxQoIOsJwOWS6n6w8Qdk8R?=
 =?us-ascii?Q?IuvCtoqSnrv8K8u4Zb7hNveuPnUkMF5H6/SAByEKe7FV0JQelhXX8oY20Dtp?=
 =?us-ascii?Q?dTDg0vGQAKTU9E3Moin4z70p8u9sk5otbQ9uNSMWLgv2yERSm26bmSN4ofYv?=
 =?us-ascii?Q?oiNRPsF0NibulQyEXCnpSG1okF9ajGHCY77V/oM0aYPzQSys0yMd4dhExe9Z?=
 =?us-ascii?Q?oiezw4da7Z8fgWMV/CQ=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2026 20:20:56.3379
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4486b22f-e160-48c6-7f49-08de521817cd
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF0000B071.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7805
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_122106_082895_5CACB9CA 
X-CRM114-Status: GOOD (  11.89  )
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


