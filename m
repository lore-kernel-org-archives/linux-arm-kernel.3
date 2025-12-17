Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64DC1D64074
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Dec 2025 04:26:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=alq7ejvcsbJ8ppP6ZtINrqIGPJWo5WAdUPgV0n4BVWE=; b=W237mMCz4wXcMbLutgLY/r48P0
	CwLR6QyvqAx/9W11Gq1nu3lR/twkEC4zglAwiT+ziPfGrbsGZBhlnOntt/ZTPXfnRS94yqjRwb+IS
	2+oIqOlg1RpNAnebS2ginIqBYLR2Ra9F8HnDdWRNzvGU9MEwTD1N8a973LgBwQsEYKoz7KbX4BJBt
	prD3gMhyRz6SMK4fbTycVwwQ5L0fYPAPAw9AEozUXezN1sRoOTMhye3ncImmzPoZlqdMAayeOLTGr
	PKsIzcLuZcLLDcRAlfbcJAM0KaYAexSdUVlMe8I5qtQLB1jacIW58rAnogZCOMEMNFO0yjtkubhbs
	0hWHvN7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVj7V-000000069MV-0eYg;
	Wed, 17 Dec 2025 04:26:37 +0000
Received: from mail-eastusazon11012031.outbound.protection.outlook.com ([52.101.53.31] helo=BL0PR03CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVj7S-000000069Kp-28DB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Dec 2025 04:26:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IUClMmZ8V0eQfvE7Hq5Jmv9MMvVB9X9tgjnz9aFUeeS0JtGuNMBVqmFSlS34dWJ1AQ8B0685V4ugHJIPAHzOSyyfJwAVDK/NXBd28S50p1AdVttAm9q2aAUX8jmaw/tzSlb+V3ZWbfTYbMIWoEp2eLteJ9NaLvowznfYKZTB96MVnPAFYI4y1fZ9MPhbCKSF6hm9Uhy1Lpmh4kNYIfM+Q3Co17Bt7LQ0JrY9eGV0KGE3jWqJMIFyGa+MUh7vCnNTtrBtWJBNWW/bO3L5V2bzh7Mqih2rLbfZUOdi+Os8unpOJ1TFTDb8IMuwRRZAaJDL5up56nHg/2bkRclT6+veRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=alq7ejvcsbJ8ppP6ZtINrqIGPJWo5WAdUPgV0n4BVWE=;
 b=yu3YM0XaAqZ0sWTsRyCI49XzfZ02Ftdxaq2q+5x0WazmXlDSHjn2CD3ANvlo7yfr0cGXEJn7cbALK41QNAAFFfDuWD6At0KISDxI+gSF/GHWA1FEB1L89YSLuN5Eo9v6wot+o8VLew//4/uBXHUUXYCqBn3BqhwlOvXNmaZtdIqV7HwIZMoZbBD00EjLoQc1TdjZiMoC+rDJWssHgeW+g2EyixcNFdqLqYkCZbw9Xm0mXelYnJh71nQx3dx5pqLTfDn4im6S7OXdrlA8Twy9I9rcDRZKLpsYBze7UHnTBuS1oLwhJ1Mi4ZQVpGZw0li6Z1VWyT2rxSimF4p7RNrl4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=alq7ejvcsbJ8ppP6ZtINrqIGPJWo5WAdUPgV0n4BVWE=;
 b=hYiYmv+PRvvjLBS2YP1cDNL18R/FlBgeKC50UUR1bc4iK8FAkJ2bJw7cCBAQErSeZNKzIQBotkUk40eyZthx936o5KyjygT7YuMZrfPnxdS242N6T+6wNfCPyAdo177WW+rrrfF1J6HgLIwAd2D2vwsDFGQyO9xDyiy31yVHeEW2UUP1acnQHIR7p+rV6MAiY2zl0SVsASiz2xdnCcrEdfpS8ydhOTnJ5xxpYsFX9T4lTNajT4OpKo5sZ54hrYkgLipIuJdqzfF7+zjED6fwV6jM33MUYLy078yLDJzpJOjVC0Wmlvhfmle3gI2RkWcUZ4v7c4BADKQ00zF4VTU0Gg==
Received: from CH0PR03CA0036.namprd03.prod.outlook.com (2603:10b6:610:b3::11)
 by IA4PR12MB9764.namprd12.prod.outlook.com (2603:10b6:208:5d0::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Wed, 17 Dec
 2025 04:26:29 +0000
Received: from CH1PEPF0000AD7C.namprd04.prod.outlook.com
 (2603:10b6:610:b3:cafe::71) by CH0PR03CA0036.outlook.office365.com
 (2603:10b6:610:b3::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.6 via Frontend Transport; Wed,
 17 Dec 2025 04:26:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CH1PEPF0000AD7C.mail.protection.outlook.com (10.167.244.84) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.6 via Frontend Transport; Wed, 17 Dec 2025 04:26:29 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 16 Dec
 2025 20:26:19 -0800
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 16 Dec
 2025 20:26:19 -0800
Received: from Asurada-Nvidia.nvidia.com (10.127.8.12) by mail.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Tue, 16 Dec 2025 20:26:18 -0800
From: Nicolin Chen <nicolinc@nvidia.com>
To: <jgg@nvidia.com>, <will@kernel.org>, <robin.murphy@arm.com>
CC: <smostafa@google.com>, <joro@8bytes.org>,
	<linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, <skolothumtho@nvidia.com>,
	<praan@google.com>, <xueshuai@linux.alibaba.com>
Subject: [PATCH rc v4 4/4] iommu/arm-smmu-v3-test: Add nested s1bypass/s1dssbypass coverage
Date: Tue, 16 Dec 2025 20:26:02 -0800
Message-ID: <6fcdd663d62dcab4005401bac2d23d18dd28e0c4.1765945258.git.nicolinc@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1765945258.git.nicolinc@nvidia.com>
References: <cover.1765945258.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD7C:EE_|IA4PR12MB9764:EE_
X-MS-Office365-Filtering-Correlation-Id: ec2016ce-ec44-425a-4177-08de3d24731b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?BjKVYW7v4rkd/sF9+WlZmyZqhw+nUU0WTCqqq0QACkq8qjoxmrL2ezw1hpXb?=
 =?us-ascii?Q?Sj1Zg5LA69mYbfmPgDNZ9TMOLoR12o220KhFV05dHVMVOKSKbRYBr4qnNLVB?=
 =?us-ascii?Q?Zfmd3rVRSks8CPeJuabETfX4deKSItDqBVHMeiPVZDgpD6XQDStIqb5Nyn8W?=
 =?us-ascii?Q?t4QtgpQcgfYhfctdHdAN2Pa8ZiIS2+7CS1uPLBUL3xX5RiMDvCtlAFVgknG2?=
 =?us-ascii?Q?b2bM4OUfWJ2OIzQSZDoYBWUvlB/m9cIjlcj19z1qAtdEbf5bN+ytyAAg4Bgi?=
 =?us-ascii?Q?ffEdlugNw4yHV6Amd7Dae7aA5fR0rW726wac3GAOTLwz/KzTIHk2wBlczI4G?=
 =?us-ascii?Q?yJK2DcrEdz9y8aeQmaXO2sMRpdZuYXbKraCozFTEI0OjK3N6HWtJXyJa3eif?=
 =?us-ascii?Q?6JngYN4QQEKDM8t1xE4BftS8WaHtYW1On89Q3MakABHX8EfA1y571r51ZzB9?=
 =?us-ascii?Q?zuu/Q14Zkz8n1PXTAmYjlg1/FvloX11bq1eDvZnT5BIGs9VcTtZVIkRsKCuB?=
 =?us-ascii?Q?NNCHr3f+ew3Ly/bvD0+Cs/46g3HB3T1rCcHB989D5o3SJ/dPeZOoQqeSddTy?=
 =?us-ascii?Q?j+nGh6gYO9Gw2ApWdkZ1hnUbtOTzxEE9nJtSidlJEflP74gKiEra9xXXQEUM?=
 =?us-ascii?Q?sEEpsesFR67SfIUwjTbE7yyHgZE9w1NNiEtt+uAHfjYXs8P3+YXzxKYOCEnj?=
 =?us-ascii?Q?xWUP891NmqRPYDFvl6PKEoprSdOZW2LDYLVXnBBHHQCCD7Xjs2fJJXmayYyr?=
 =?us-ascii?Q?q+1aUGMyQJNMyST4ilvkYMlarch+yI68j5yj8GzKqfXciXjR0Eyh6dnhY71I?=
 =?us-ascii?Q?K9nQlincDgJ9p2TD36x39t2knev+IbvisRHwx2C57xFuev/QmiWX2UsNZYgR?=
 =?us-ascii?Q?HBSwxDJGjDKtZmA0gDUXdmfaCZq5hXgwfVZ44D1TMyvNCrej5hVxMwaVuVN/?=
 =?us-ascii?Q?LYoCPYBsUxbcB4AfOsrKhog6IZ4nCSLBQJhp/0BisvvqA5aMMD6wbPqWG2lB?=
 =?us-ascii?Q?NC3aySnmy37jsQVOAUuolH2+97by7bmSM/Z666XN9guqXyvCGKg2Ft+nfgL5?=
 =?us-ascii?Q?jTyGHpyB/nzMKiMLveCzGgPERLXjGXp5OyrT/y1310LagyQyBarjbXoaqNc/?=
 =?us-ascii?Q?AmdjgOfBKst3E9aiHRdP50oU3dvCqWj0qSOhKAuF1qhfwbe13Kh7JJxgcqcE?=
 =?us-ascii?Q?p/EWmcPZskzwimwv9Xg7IKEcxeChGDDFv90ovkMoOSWxXd9pi9hoLD6PGjrz?=
 =?us-ascii?Q?OOCY6Wmpxd7rLVxDD4zxWEXL/pYjPdSEY+QRILyWcTRdK53C/LPJHP7GEp1N?=
 =?us-ascii?Q?wBN6ogJSTarYDeEgBulwp7AJ8mIMzQmNtEJMtqsXNLctV+7rszTECVkj6B/b?=
 =?us-ascii?Q?Hj5oEfSY8utfk53DjDdCh04V2QVG55tS9GqG4OSwddSOFhAXWd+Y5Umk1ztB?=
 =?us-ascii?Q?ZzAw4Ufcdd/77W0NSyvU4ptUaFPlOgvsREIycQXe3srSDopMyrCI99H/+gsH?=
 =?us-ascii?Q?bTFkBGk7x1K/cfNVHW4l7aZ0+SVJtgEqRuaMeg8jK9znJMsIrx6kGay9ZeKe?=
 =?us-ascii?Q?PrCLS09eqBDuWN7fl8g=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2025 04:26:29.0941
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ec2016ce-ec44-425a-4177-08de3d24731b
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CH1PEPF0000AD7C.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR12MB9764
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251216_202634_551243_7941D36F 
X-CRM114-Status: GOOD (  11.03  )
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
Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
---
 .../iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c  | 46 +++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c
index 5db14718fdd6..8255a02f4efa 100644
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
@@ -197,6 +201,17 @@ static void arm_smmu_test_make_cdtable_ste(struct arm_smmu_ste *ste,
 	};
 
 	arm_smmu_make_cdtable_ste(ste, &master, ats_enabled, s1dss);
+	if (feat & ARM_SMMU_MASTER_TEST_NESTED) {
+		struct arm_smmu_ste s2ste;
+		int i;
+
+		arm_smmu_test_make_s2_ste(&s2ste, ARM_SMMU_MASTER_TEST_ATS);
+		ste->data[0] |= cpu_to_le64(
+			FIELD_PREP(STRTAB_STE_0_CFG, STRTAB_STE_0_CFG_NESTED));
+		ste->data[1] |= cpu_to_le64(STRTAB_STE_1_MEV);
+		for (i = 2; i < NUM_ENTRY_QWORDS; i++)
+			ste->data[i] = s2ste.data[i];
+	}
 }
 
 static void arm_smmu_v3_write_ste_test_bypass_to_abort(struct kunit *test)
@@ -554,6 +569,35 @@ static void arm_smmu_v3_write_ste_test_s2_to_s1_stall(struct kunit *test)
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
@@ -600,6 +644,8 @@ static struct kunit_case arm_smmu_v3_test_cases[] = {
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


