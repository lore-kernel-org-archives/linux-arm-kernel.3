Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13A6DD3C523
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Dec 2025 02:46:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xuMlzyngnH1lstBDP1yGJsUTpUNWw9TxMjAdGAHF8mk=; b=KNQb3rmvI1RAtzgs/xhYpoomUg
	1HaNZ1SwdjGffwI07nK3nkkJJockuP+dTsi0dwBEQG1/J3kOyBpTzyVbKAS+A1CaYNcm+3B8S+R45
	V6sXsNip0hHPljRxgDEBpkMxtUiOX9OmKB/ci8vX46tXoHN0wMTnZ4Tfag8w0NQx1DnhSYvm+K6Bq
	pIA9cqnxg9Ll3zj7EJzxeQucZAvg5owUoNdK7VNdgTSV3zxjXCQABUrUlDL42Lc951sVGh84G5vIT
	xsPhuyU2uhJggjzOH9+dUp7eGvj0Erb1SDt1jwc2zEXKHd2cbep5DTEsDRq+0YqzXkx8DY1qlg/jO
	uw32+Jvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTADQ-0000000F1PX-4C2A;
	Wed, 10 Dec 2025 02:46:09 +0000
Received: from mail-centralusazon11011010.outbound.protection.outlook.com ([52.101.62.10] helo=DM5PR21CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTADP-0000000F1NY-12J4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Dec 2025 02:46:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ynmcArGiQ+M7zf8DT5dLBScvAqabEEPWHkoa0TFpPJb6LMVk3WxZPJgwXcHBwoerp0Ra0Rc/RO4nBHFBl6RUuN78QkSk1R+Bhh8V1oJdovS7omJtIb9LsIeFu0HX6E5f5pDlkc69gLNirSIvfOS3xQpvZ92nr33HRQzpHwTvi4M6DNFZreRnCZ7CD6lPKFUssmFfnJ1xedXC9NNqK1XrCdr/QFQQRkyFFRZ6NBL34F0RvwOQh0myWkqdq3Yf69dz2EM4yvlTyDT7Wtp5QZSASyQWhUKZMFV16ubt+KVNbNrht/Fpn4mGiL9MRkXEDqwlRwwFyzk3OhCnavKDs+xsEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xuMlzyngnH1lstBDP1yGJsUTpUNWw9TxMjAdGAHF8mk=;
 b=EyrGgd4byAzZcNpVbvEV6EKuEE8fPtnHwLe+4R1vPpmPvZ5v9hk5/WtmvcV1X2z7D9kV/qu4IpDBjTaLg3l1u3J8VkD/6d7Q/V69cMaEETcMCEsWF3RzuURrirctAUKAUSiZWF7cfEGa7bwElvixhSQqIijVXFMlbQkc+W3YF91qGxbmI9FMcD2P0zgNQY/18m3vw+KjiWWJpQVcvOKoAWIYg/cUuJrUqMG1cTCKSVweEVwL+an93defsoYfl74tTKXy/vyZjhcHgznZ/V4B3DqWOaGo4vX7DA+BtgeXPR+DA2ASHyKcuo8yZadiU0Fu2fwfhmt4eERPa6JGYl4G0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xuMlzyngnH1lstBDP1yGJsUTpUNWw9TxMjAdGAHF8mk=;
 b=miTpw47h04gaiIbWN1ym9HFvzDpUcuel10Y2BJO/i0TwbDK+HgCYlihVSVTNgszvhxBQjkobbanDvFknlcdkkYLAJKicjU1m33Ab0VLKrGmZAd3VzFx7cqJ+VQ8huSmt69BI5lrw6d+c1cw/E7jMJRY3H4ArtPFkMKNGadc5RYcqRPWIyMDHM+7kiXoLb0gsqjXLMJ1Wsbas1YFwIAQOaSl6YPFVVZPTyUs6BE3XF5z6HMtcJdRwHf1wLqIumAVQh3VfuYeRcrhx6zgshSxNqyuK9BcRv7TU34TzKL7K4SXw2TpoU1uzxjUBw+10OkismTeOfkyHMWwb2HvsVsK6eQ==
Received: from MN2PR01CA0043.prod.exchangelabs.com (2603:10b6:208:23f::12) by
 SJ1PR12MB6074.namprd12.prod.outlook.com (2603:10b6:a03:45f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Wed, 10 Dec
 2025 02:45:55 +0000
Received: from BL02EPF0001A107.namprd05.prod.outlook.com
 (2603:10b6:208:23f:cafe::66) by MN2PR01CA0043.outlook.office365.com
 (2603:10b6:208:23f::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.14 via Frontend Transport; Wed,
 10 Dec 2025 02:46:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 BL02EPF0001A107.mail.protection.outlook.com (10.167.241.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.4 via Frontend Transport; Wed, 10 Dec 2025 02:45:54 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 9 Dec
 2025 18:45:53 -0800
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Tue, 9 Dec 2025 18:45:52 -0800
Received: from Asurada-Nvidia.nvidia.com (10.127.8.11) by mail.nvidia.com
 (10.126.190.181) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Tue, 9 Dec 2025 18:45:52 -0800
From: Nicolin Chen <nicolinc@nvidia.com>
To: <jgg@nvidia.com>, <will@kernel.org>, <robin.murphy@arm.com>
CC: <joro@8bytes.org>, <linux-arm-kernel@lists.infradead.org>,
	<iommu@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
	<skolothumtho@nvidia.com>, <praan@google.com>, <xueshuai@linux.alibaba.com>
Subject: [PATCH rc v3 4/4] iommu/arm-smmu-v3-test: Add nested s1bypass/s1dssbypass coverage
Date: Tue, 9 Dec 2025 18:45:19 -0800
Message-ID: <229cbb478c40a031a0399d1037e07195139cdeba.1765334527.git.nicolinc@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1765334526.git.nicolinc@nvidia.com>
References: <cover.1765334526.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A107:EE_|SJ1PR12MB6074:EE_
X-MS-Office365-Filtering-Correlation-Id: a322130d-5f53-4833-7c69-08de37963d5a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?3GWVB7/CTGo6Topi91k25n6ouEZM4i3+SPLhao9uYmK8myIamPW/fkBlkfMc?=
 =?us-ascii?Q?QFZepfO2Y61MI+dna4zJzCQC364DafXV2nKHxXUCt4MiZQCMuz/Qi4ePdsP7?=
 =?us-ascii?Q?+FfEVsgXtgA5wAUAnrtQydstfAq9+TDwkBD5PLsMMzVRcU8xe0YbQ7yuAiYg?=
 =?us-ascii?Q?y/7sG+ObT9VjLmX7TW/qTl5V43C0x5desKToJ9CEcyFmhcEQUZLnBCABEM1l?=
 =?us-ascii?Q?r9JSCNfiFTfMpH6CfdgGqA1OhsaCHqGs177ivH4HLQtml4DHyi3YsaMUNK3o?=
 =?us-ascii?Q?1j5T/TH9EzoqHlAEQLQv5WV50UhR1Rwh2kq6TUjmA/iEXZl81q2M9GEP9xpP?=
 =?us-ascii?Q?AZ1yE5fA8ymPZ9TEnOglJm/MKawNF0OuXqLMgk0XTdfn0UjQa0Vsg4uMIzBk?=
 =?us-ascii?Q?p2HI/Wwzd/ll3KwtMa9zxSJGqYtC6KxJd5VG9vOa3LAWr2eqffQaE/dMzPUJ?=
 =?us-ascii?Q?84H9QI6/mL/c0hEfurOSc5je7BRtTkZo3nvxkUCDwppvJ5m2Z7znzDf52El5?=
 =?us-ascii?Q?7oJgSYfG/xfOXWZSzi5xM1K/jq82let8EOM5PDv9Ej7ebhfgSLznCcJCDXBX?=
 =?us-ascii?Q?Z7iNlZGtPJPUhucg4t/A5npJbyHExFTe6TGXnL7eQm2OK41bmck6TWnMGFDx?=
 =?us-ascii?Q?5VaV0zSqo9Zai1CrAwk83v4IX4894d1wOUDTqGHPAbd9s5yYWjpCSu79DLuv?=
 =?us-ascii?Q?FmJZg5mZjyrfjbKFM83lxRwkfalMaQPufdlYKc5pKhutLpnHr5ehOxYET1AI?=
 =?us-ascii?Q?g5JpGZwtiKPnxwSy9ArFJbvETDcCxmx3DdyTyxxxWjDfvPCvcOjSs4TDWC8V?=
 =?us-ascii?Q?xC9Okm5jss/VPFKnsLFQEq1ujvTtxFrD5SwOwoUW38x5JS+I4fZSvJISbiZh?=
 =?us-ascii?Q?tIfuy4GUWtAoDU7pbBI6wzo0dh6WSNAS+mGjYPqUvkgdvS4atZGK620pvfcE?=
 =?us-ascii?Q?3zrExpTXYUUc4lspHydmrwt8I+2u9e3LbEmd0HsjZzuD3s+EOFH+3mNmV5aL?=
 =?us-ascii?Q?cxbvBjQaDaCYP4ONA9UqqkXO02Smfas85hVz8ejymYGfm+IDb/IQ+EDnYkCN?=
 =?us-ascii?Q?Qy98CeJssR7/aXJXUTL5fIM343KRxaPrKltvN4d4/R2E45Djo4m1PtLuNixX?=
 =?us-ascii?Q?qqEFiOalx0z6l16AonNeBSp32uIH3RddvbbTMWXMlmZYLNwktjpF/sYuMwJk?=
 =?us-ascii?Q?CggmMeixC5k53jnHOfJFOUaxGYTKHN6V5aOdJThI2FB0BMP/A8KuOu6AfHHf?=
 =?us-ascii?Q?ANkBdkJFcrSusUdQ2SsapM2RIEuaLJBbClBwxRhf2uEuwaX49yd4lFOkrhNy?=
 =?us-ascii?Q?hglW2ZGk/UBwQPRmokW2528hEXanerEqdTHD5I6c6Ml+ez7Vu2uXHmG670/w?=
 =?us-ascii?Q?GT5P9qh26IeAKfQMkh/ArCxAc3BJ+GVFEUhH4ccc/f4oI3o6+VXaUOF/UoGt?=
 =?us-ascii?Q?pvxTIuzqet+b+ft1vNKcMBWJ8+ew/gEEUdgOXvkoH3tkEFvA6gZMRYCEnGvC?=
 =?us-ascii?Q?SyF5jNDoVMdbR/+7ZLnGMK/CF9YuXVBm0TuHwVNEntfOxZt/jaSTksHYf2r9?=
 =?us-ascii?Q?iHSuuWbi6zjcviwztEk=3D?=
X-Forefront-Antispam-Report: CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2025 02:45:54.5376
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a322130d-5f53-4833-7c69-08de37963d5a
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0001A107.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6074
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251209_184607_289477_E4542D74 
X-CRM114-Status: GOOD (  11.17  )
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
index 3556e65cf9ac..ffa43e103692 100644
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
@@ -198,6 +202,17 @@ static void arm_smmu_test_make_cdtable_ste(struct arm_smmu_ste *ste,
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
@@ -555,6 +570,35 @@ static void arm_smmu_v3_write_ste_test_s2_to_s1_stall(struct kunit *test)
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
@@ -601,6 +645,8 @@ static struct kunit_case arm_smmu_v3_test_cases[] = {
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


