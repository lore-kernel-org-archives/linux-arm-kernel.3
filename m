Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5E79C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 05:37:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ssfL058koFxLPmF6fdACP+cHYck4AkFPClFGn8a8Guw=; b=vd30iafb9V7/1HMxJU1ngJavq5
	EWKT5nKSsFZbummW6eqZBucHPmcvmCRvABBHVvJzgtrHK1Qf5Mgky8i2tRisybp13ExyhE8Kw5wY2
	rOyimJbnBSOOwSpocm3vBd2OC+cO5RXZ4auNlF4N7BeNvAdIt0TfXCSyxVmRuCq0aGwFaPHYkCmuC
	6SJWhL85aTjl20QEA4D+OBj+NgH0CVpEeT37MCUm2SoF1COw2Wzp8YRepjvBJ3plUfxVvu3y3y9+m
	/hPhV+MY6MVjxDLib9FRnwsxolq0CKviEbmfrE53fydJHsUAxidkXc3NaA9HmKM33GqDPTxtHgEvb
	Yw2S8mvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgc0x-0000000BXcf-21x9;
	Mon, 06 Jul 2026 05:37:07 +0000
Received: from mail-westus3azon11012038.outbound.protection.outlook.com ([40.107.209.38] helo=PH8PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgc0r-0000000BXYt-2uOL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 05:37:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cxTtPQAYNqu00F5P4caX6NSccMbdYKrPlUfATg6xoom59eIXavL33pVG6sVHsyZkr5mw3I7n0+d/zi114s01932Qocmn8Xv4OSd1AbwbCdxS39D1JVN7ye+vr6w2Oasq85z/ocr6tkkY181FFspSnDTaR6MnYnUKArhr9Vmo2sodYIe8wbbgzODBV563QT2KRuvyXKqLVOPYDyos7hYQaF7KBxg5N0550cZ5QApwVUEowecd5+jM6No5mv5qNITrxlwBGU5cO8yv+aCJ9a07icy7xEeQfQ0HvsHc5UEYqmeJTZJIeFWIIn1aeLOf2Aiu9wq6mzk3QUqHzd7bPBx1sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ssfL058koFxLPmF6fdACP+cHYck4AkFPClFGn8a8Guw=;
 b=XnfQVgR4srlM4EAQS8XWhPR+KGcP2tluCUQtQ0wyOU6QsRhM+Z9CUxikHg4d8CmjG++8stTFrzcQlv03h4ZZxValQfjbntnxSTEFDwdW5hqB0bj1t8N/FWVgX6heRKi6kaotTeRk+StpkvO3ioj+8QGxY8LkWhDhgncAzCtva94JC6DPGp/FGDfmb5W51SfhnKxIZBIYLJaQly14+51YoICwz0S5oyUGQ2thk0R5Ka/Bkt8JPqrs35r4OdTzWjs/etM5pUWkxcBswHPTPeArznFCjgrKwU1qbSCfA61lO9kr+rq4cPQXlq9FW4cuXJ3g3NnKNC30MkD5feKcinwblQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ssfL058koFxLPmF6fdACP+cHYck4AkFPClFGn8a8Guw=;
 b=uS5KSTICORvJfQabuRMJVIS87+v+nYfi7kByOXBhVMCTw/MHS+ZL9FNBLZs/gOiOoNJmZttbKfXNSZZNrt8qtX5oNXKUgV/+V1apXHp7CDZ147QBwLqKWsSy5Jcnz6XVQtDmMfNjYJSmvnHLDu+T7Q/Ar9lwpJupoI8qH+x/dp42u83WvFPNP2+0scldHnBQ7YY4T4VcE27uJyk9cSe92MHc0N3a9tQP38Ai1CdZmB8/NMYeJ4DUVnfIN7BmSIuz1Ei372pwE8fClCNaBV7WkzG50iR7oYmXH82al35Ub0ijj8AzB9J9CbVH0/dCRlVnZ59jLMyZ3kQkUr8qbWVSLQ==
Received: from DS1PR07CA0005.namprd07.prod.outlook.com (2603:10b6:8:456::9) by
 BY5PR12MB4082.namprd12.prod.outlook.com (2603:10b6:a03:212::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.12; Mon, 6 Jul
 2026 05:36:56 +0000
Received: from CY4PEPF0000EE3C.namprd03.prod.outlook.com
 (2603:10b6:8:456:cafe::13) by DS1PR07CA0005.outlook.office365.com
 (2603:10b6:8:456::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.13 via Frontend Transport; Mon, 6
 Jul 2026 05:36:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CY4PEPF0000EE3C.mail.protection.outlook.com (10.167.242.13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Mon, 6 Jul 2026 05:36:55 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Sun, 5 Jul
 2026 22:36:37 -0700
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Sun, 5 Jul
 2026 22:36:36 -0700
Received: from Asurada-Nvidia.nvidia.com (10.127.8.10) by mail.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Sun, 5 Jul 2026 22:36:36 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: Will Deacon <will@kernel.org>, Jason Gunthorpe <jgg@nvidia.com>
CC: Robin Murphy <robin.murphy@arm.com>, <joro@8bytes.org>, Kevin Tian
	<kevin.tian@intel.com>, <linux-arm-kernel@lists.infradead.org>,
	<iommu@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 3/3] iommu/arm-smmu-v3-iommufd: Require exactly one Stream ID for a vDEVICE
Date: Sun, 5 Jul 2026 22:36:11 -0700
Message-ID: <b15f2b73520f389f3f57881da2f040e7bdc18876.1783311134.git.nicolinc@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1783311134.git.nicolinc@nvidia.com>
References: <cover.1783311134.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE3C:EE_|BY5PR12MB4082:EE_
X-MS-Office365-Filtering-Correlation-Id: c8bf372e-376d-4dfd-bebf-08dedb209766
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|82310400026|36860700016|1800799024|376014|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: /S8czn5HyMKrWkcsv7Qjb/wkut87A5Ay9Q+LA9jAL63+jbcQV2JrmTKMR8tx8LMJcLcamj+LcXYU1p6Tc1tA2WuZHMhBFP1owKYwJajwlPAUWowjRip6p2L1nAM2Cuogfe3q/l3I1j29o/EBanNWRboh8xq/lcPulr9skO6qgq1j232Tc5TTWSbDoQjwYsCRT6UflDdz3lnbJOXGRMPMezFTAbEdYKFYe0oNRpCU++U+33CBh8AtdXXgEDiBkLMQwJA/54gVq978FfHQD4d953lyOyhQtt2mSH/uh/VwBbND8ZJDuD94MgqW6s2Ep6iUUGgB8tD30X1VjKWagNx4W+3YMrNzjv+JkyCaMmQSDDM+gxAsjD6iH8ZnBaFYC7yYFPDgrv+VXso9+WvNMv+WnUJQtggCTKo+56J9F8GvcerlHKcVTd+FzpmI9K5vvJEddzobsMjgtq9Jipwy+4b0nUtc0XCP5iMmvMMK7ICUOKYFH4jTxXw8KYq5mjnGgOBb9eCYxuBc0JwFHh+Pp2URxQjvIYI/w9TzegpvLH2B5/BP1ncLgfLfc8WoP1xcvQVADpSuYBjSstmyGv/ucMLUKE5/AMzoGbwji+STNmbvLbZU/NEE2fbLij2+upargQlAo7Ou2H7aZKR/K3Wgi43J325fse+GJwtsATFGZ3NvuoLGuNSrta6r/Bta+KxzbEsx0ylTMM8OhqPtqoAM0t9E3g==
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(36860700016)(1800799024)(376014)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: i6SkR8SWQKvTVuB4fO4EHzyaCgyVsA8NQI4j1Xw7oNwspFXTBmd/webbwfyBdH2yBIy7fluare+n6tEbHLsUpVVLhhXUVjjq5xEcCVWNjc1zMNqHBH5EtylUDhGPzvZxKwkiLRx0RRUHkXcMrrlqfCIIrXamCsBzKalIdClWZmhDQouY+hi/iUNLmLtSeeCtgLeCc1BUcnOuICQVfnZnZV+2vc7RBJSL6LpRJzOm4N+w4Ps9wZOl0yKLeS1ksrlGCzC5QysI4ttZbRoI5Jl0fqSZUz8Zut28QNDkVTE7Dy4SIV0g3C5BKMdwy95hwgX/tJdjxIOHH4TBxrmuRKJPeTDRZyPl+O3uZrQo6CVpoMzMaLou0yG1iDM/iDKj3fSIczLOmEOzp0m75be5ud7CfQcHJDXiXVLN4aSRjyd4Z8GG8lyKPUJ+UAxQ9dDOGo8l
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2026 05:36:55.7629
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c8bf372e-376d-4dfd-bebf-08dedb209766
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EE3C.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4082
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260705_223701_733996_D0178D49 
X-CRM114-Status: GOOD (  13.92  )
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

arm_vsmmu_vsid_to_sid() maps a guest's vSID to a single physical Stream ID
taken from master->streams[0], assuming a device has exactly one stream. A
device with several streams gets only its first one mapped, so a guest vSID
invalidation cannot reach the others' ATC and IOTLB entries; a device with
none makes master->streams a ZERO_SIZE_PTR, read out of bounds.

Add an arm_vsmmu_vdevice_init() op to reject the vDEVICE with -EOPNOTSUPP
when master->num_streams is not one, rather than mapping it silently.

Fixes: d68beb276ba26 ("iommu/arm-smmu-v3: Support IOMMU_HWPT_INVALIDATE using a VIOMMU object")
Reviewed-by: Kevin Tian <kevin.tian@intel.com>
Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
---
 .../iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c   | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c
index 1e9f7d2de3441..85ebfdb3d2a7a 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c
@@ -297,6 +297,20 @@ static int arm_vsmmu_vsid_to_sid(struct arm_vsmmu *vsmmu, u32 vsid, u32 *sid)
 	return ret;
 }
 
+static int arm_vsmmu_vdevice_init(struct iommufd_vdevice *vdev)
+{
+	struct device *dev = iommufd_vdevice_to_device(vdev);
+	struct arm_smmu_master *master = dev_iommu_priv_get(dev);
+
+	/*
+	 * arm_vsmmu_vsid_to_sid() maps a vSID to master->streams[0] alone, so
+	 * more streams would leave the rest stale and none reads out of bounds.
+	 */
+	if (master->num_streams != 1)
+		return -EOPNOTSUPP;
+	return 0;
+}
+
 /* This is basically iommu_viommu_arm_smmuv3_invalidate in u64 for conversion */
 struct arm_vsmmu_invalidation_cmd {
 	union {
@@ -403,6 +417,7 @@ int arm_vsmmu_cache_invalidate(struct iommufd_viommu *viommu,
 static const struct iommufd_viommu_ops arm_vsmmu_ops = {
 	.alloc_domain_nested = arm_vsmmu_alloc_domain_nested,
 	.cache_invalidate = arm_vsmmu_cache_invalidate,
+	.vdevice_init = arm_vsmmu_vdevice_init,
 };
 
 size_t arm_smmu_get_viommu_size(struct device *dev,
-- 
2.43.0


