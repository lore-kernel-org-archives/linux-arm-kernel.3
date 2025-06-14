Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 737D8C71135
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Jun 2025 08:06:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kOZQSg6s1XFxdh6WUtP7ofdJND5RNxHt/jz2yshHVds=; b=3SHHMHXBMyYDdG7ThsPSqhgxai
	QA5Fa1wm+xks6LQNa35lcT/6lPWR+0P/JFPGVacPywlEjZ4U1jE28Ewl0+HM2axZ/AyJuBKia+I1b
	oHJk9dyIieodBbbHd5s8FkMqKgU68eaCtpEIX32cdpCzzTuzSWXnW5dwweND9ASJ6yXdutDi0ytwe
	yisxXkKTDv2+ngJw2VjzHBZdwlOCsWkQZdBoU4JEZeSgLNy2YfJcactynsXeOH9IydXWwmm9+RcYj
	MumQT8G82f/gDM8yhIZKzsAP8zX2IbVfxs2ai4SI0HXsE1adG693qspurqvb6GGi7SdzRJZnfAtm+
	r1ALZNjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQLuJ-00000000xlj-18me;
	Sat, 14 Jun 2025 08:06:31 +0000
Received: from mail-dm6nam04on20615.outbound.protection.outlook.com ([2a01:111:f403:2409::615] helo=NAM04-DM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQL7N-00000000raB-3N8Z
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Jun 2025 07:15:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z0Rj5C2bur8NSiP6a2/zDIPLZBw33Lt6bLX86QrnoZyQrpqXPW9lpUoC6dAY0X4x2lItt0Aqph0cyv9qscNQxlLfosPZCAZz94/JFiP/PqHc1sIlaOPsVr3aFi5UMOZ5DsMecXDj6XKhXcvog8cJQzXFDv6NhdquVZJ6XYi/3Rg1Cm+ADY+gOeMKTj/If4xDVsZDL9M7Pd4hANTl7czwsgDbT7QX9i5BRJ2DadniJ3Uuve5j43l4wAp1hE1vFnzgqU/fQ6Y93mAgOMkwvv5T7YwUymKIvkWZ+N0kKUpDAqgkdOyvOU1qPC8nPRSJZkwNY87J8ve/4rQPLY7BrSg9Vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kOZQSg6s1XFxdh6WUtP7ofdJND5RNxHt/jz2yshHVds=;
 b=aDUh0gNUZZ+gfP9MB6nxejvSl8NhRw7tv8Um3NMh82CsUJ/ad/u2H4XrYGRDFTUaAnEPjgayPQp+DCLZmt5P8iTK8txLgubRkK/MKvICNRbN7TjygjcJgB+1YVl+fEDIdLol+AkpBLMdbc3u5CtvHhxn6IQln6nKQa3LTQC4ciTHXGN+YYohPGiQkjwwa5Qd3OyZn1Byv+bd8ED640vR8V6V7uJH45yJCoqGPBiaqLqbnDadaiRC/1d55+7H9LtLigJCMNN9QcD+FZuMk5G1+S/KyzJskA4HG2CzTtugWaTQEMDEj49NKQ2pM8SwrcvEsXezw+HwihbdzfsbMp4vyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=amd.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kOZQSg6s1XFxdh6WUtP7ofdJND5RNxHt/jz2yshHVds=;
 b=TUet7c8yIxYFsoNGLrz1vKT+Q8c57RXD0fDax/IKlxFgr+LBkb80UrL1KniIaeeUBhg575VCI8cAb9NK/V3fHylC8yMbNMFiKoFYenTYwbodY6EGkzZ8kMNsEIAOBAG5vxsjPzsas7uSJcE14LdGAphPp+KVHFAbNVO7qhzo7AW5DIW+uVchoQ/vo1oyojLaZJiMWqS/IcRcwVBUb95Ce2EFod3+XNrvBOb4aRARgxGGMYyxX2E0JWnmeKYGykNM7uyzjg1BR2Ibj6PIMISvp43N/okHDU/ySJwVFq12hmtA1rpAk10co46YYEc/kYowqbh2SUtfUtl5RTmhcY+ZLQ==
Received: from BN9PR03CA0603.namprd03.prod.outlook.com (2603:10b6:408:106::8)
 by PH7PR12MB9066.namprd12.prod.outlook.com (2603:10b6:510:1f6::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.19; Sat, 14 Jun
 2025 07:15:48 +0000
Received: from BL02EPF0001A0FD.namprd03.prod.outlook.com
 (2603:10b6:408:106:cafe::27) by BN9PR03CA0603.outlook.office365.com
 (2603:10b6:408:106::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.23 via Frontend Transport; Sat,
 14 Jun 2025 07:15:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BL02EPF0001A0FD.mail.protection.outlook.com (10.167.242.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8835.15 via Frontend Transport; Sat, 14 Jun 2025 07:15:48 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Sat, 14 Jun
 2025 00:15:35 -0700
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Sat, 14 Jun
 2025 00:15:34 -0700
Received: from Asurada-Nvidia.nvidia.com (10.127.8.11) by mail.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server id 15.2.1544.14 via Frontend
 Transport; Sat, 14 Jun 2025 00:15:32 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: <jgg@nvidia.com>, <kevin.tian@intel.com>, <corbet@lwn.net>,
	<will@kernel.org>
CC: <bagasdotme@gmail.com>, <robin.murphy@arm.com>, <joro@8bytes.org>,
	<thierry.reding@gmail.com>, <vdumpa@nvidia.com>, <jonathanh@nvidia.com>,
	<shuah@kernel.org>, <jsnitsel@redhat.com>, <nathan@kernel.org>,
	<peterz@infradead.org>, <yi.l.liu@intel.com>, <mshavit@google.com>,
	<praan@google.com>, <zhangzekun11@huawei.com>, <iommu@lists.linux.dev>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-tegra@vger.kernel.org>,
	<linux-kselftest@vger.kernel.org>, <patches@lists.linux.dev>,
	<mochs@nvidia.com>, <alok.a.tiwari@oracle.com>, <vasant.hegde@amd.com>,
	<dwmw2@infradead.org>, <baolu.lu@linux.intel.com>
Subject: [PATCH v6 19/25] iommu/arm-smmu-v3-iommufd: Add vsmmu_size/type and vsmmu_init impl ops
Date: Sat, 14 Jun 2025 00:14:44 -0700
Message-ID: <fec2ae84501938503d892ebe80ae332604c57b6c.1749884998.git.nicolinc@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1749884998.git.nicolinc@nvidia.com>
References: <cover.1749884998.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A0FD:EE_|PH7PR12MB9066:EE_
X-MS-Office365-Filtering-Correlation-Id: a162a9dd-5e1c-4e94-c7ec-08ddab13497f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?tMWtcaoWvvT72LEocU0ay8+WFoqSq6bSFEYSFhobtWpQ5dZOr3joNier8f8o?=
 =?us-ascii?Q?n9ozVc1EGRXVddJOhTy1GfseL6USagmEeekytKq3I/RbcyUtLCHW7QgyOTa6?=
 =?us-ascii?Q?DTk5Ve1CCexKSkL3zDFyO7GV61uu/faoWZq7qJ23HNMor/hd5H8D4FjCum99?=
 =?us-ascii?Q?VGy0ogMSsi1qhjZeFygaf4gRaZRVg6ClbbXEoWsgCFoFY6FD58PjpkfhE9yl?=
 =?us-ascii?Q?/bQDrkozw6C+nImd2B2GKpcBiG4RbyVEacqEjy3l1fa5uuGYiliQ27LeAo7z?=
 =?us-ascii?Q?9gP5GMcrMvMU+Yr7XmA12/FWetDTN3q7+xmi0dC342/LCElJadZQ8i0C8OuV?=
 =?us-ascii?Q?ze/wGlEX4/wUDhdAiD78TRTDkVRPZXiAZX5+TsQgV3RS4YyUZ9l3R60QJZy9?=
 =?us-ascii?Q?UxfmWuSgO3/v27qxblvcMY9dcaNMeTy7GGSyaa8MkVBC9KH3oh6wF/FBod5Z?=
 =?us-ascii?Q?6RYwkffJuTzr1l8zynRcGhTCzZf94+eAnsgShLLlVk0y6mSTDqmqEJvHd/WD?=
 =?us-ascii?Q?MOd1mBZ4/zrfYxgkYlsjM4z1TTWgMfqurZo6dT8sVqFz+v5TPcqSSuRY1eDx?=
 =?us-ascii?Q?5cDuR7tRNxScVty4m/0aTWXea/P58R1ODEcf7ApcyG2uj16A/2SggXRDKP77?=
 =?us-ascii?Q?NFMu5YkwOt04UtEH8xl9U2f8RsXD6wNHvgkpsdhRqDWTvB3HN62ITMXV/2sW?=
 =?us-ascii?Q?y1RRSKuA9B6prTZWqRNOe4v/e4Feyje9cwJ0xlTOln8OmQ0lDI0Nk19dqOzR?=
 =?us-ascii?Q?GM1FnixkI8ACbe6wmzHa6KieERu/bNDSXdo/xxOgivprbKu0ebLvKFy4g9FN?=
 =?us-ascii?Q?eKXiCHoUOxOqN4kpFVu40ScdvxFf6/nUvHfgZeMQHIfsUFjAQPTPoeBV+iLB?=
 =?us-ascii?Q?RDS2x2WQC+7aBxrRW1Npv2ojreMlQM9iSfDlXWlpaWOEj7LtTGSo5xpIb/yE?=
 =?us-ascii?Q?b+0wEe0INjBIGu7uFLabAPwkVU9Y3kDRaJ3+q41ZkQuPMX6eLX2qjLmOx5uI?=
 =?us-ascii?Q?V2KKVr4nJDw3Ibag+xoQ7/BpovNZsHMHDnFQ1h2YkhTdLW2QMXTXEddv57Uf?=
 =?us-ascii?Q?3Cq/DOMyewJWTI9cpstK34KsjDnyRjFAaA+T+z8yUsx4Y+ZZfY7IiT/vSKXP?=
 =?us-ascii?Q?qIJkIQRTYquZSPSZ1U3NNem6aJzUqJTIAEhc75kQqby2cmD0VYXWuhByuQGf?=
 =?us-ascii?Q?wbZmfiW8HFeODe+UoMj4P/kFgqBzsy8RiF+GD66rnimA0FO3trusTJkKHXES?=
 =?us-ascii?Q?v0JTX+HzT4Qx0TMhEQvhDeXy27Ctrnq9IXFppqzrjx5yar4/rSv/WrcLRYJ5?=
 =?us-ascii?Q?ggGho6RsZVUn01ECqYjxMkGxiiUn8gfQMZqp0iMLrGpX8XKnGe9P+0Mlito4?=
 =?us-ascii?Q?cF8R14thXe6j/j/FGheRcelquTYnUQcCf2ORYnYVNxXBKwmi7EtucVyRcwyO?=
 =?us-ascii?Q?Gv2JUYF72cvvIRLfsAHEF6V3WyrC6jW8QMu7i1SoivSEGKhRVDgnjLeTg6qz?=
 =?us-ascii?Q?GtmNEM2XAHGuCQrJ9C55ywHshia9UYTYXeMT?=
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(7416014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2025 07:15:48.0355
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a162a9dd-5e1c-4e94-c7ec-08ddab13497f
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0001A0FD.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB9066
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250614_001557_853872_4776980F 
X-CRM114-Status: GOOD (  12.24  )
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

An impl driver might want to allocate its own type of vIOMMU object or the
standard IOMMU_VIOMMU_TYPE_ARM_SMMUV3 by setting up its own SW/HW bits, as
the tegra241-cmdqv driver will add IOMMU_VIOMMU_TYPE_TEGRA241_CMDQV.

Add vsmmu_size/type and vsmmu_init to struct arm_smmu_impl_ops. Prioritize
them in arm_smmu_get_viommu_size() and arm_vsmmu_init().

Reviewed-by: Pranjal Shrivastava <praan@google.com>
Reviewed-by: Kevin Tian <kevin.tian@intel.com>
Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h         | 5 +++++
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c | 8 ++++++++
 2 files changed, 13 insertions(+)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
index 7eed5c8c72dd..07589350b2a1 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
@@ -16,6 +16,7 @@
 #include <linux/sizes.h>
 
 struct arm_smmu_device;
+struct arm_vsmmu;
 
 /* MMIO registers */
 #define ARM_SMMU_IDR0			0x0
@@ -720,6 +721,10 @@ struct arm_smmu_impl_ops {
 	int (*init_structures)(struct arm_smmu_device *smmu);
 	struct arm_smmu_cmdq *(*get_secondary_cmdq)(
 		struct arm_smmu_device *smmu, struct arm_smmu_cmdq_ent *ent);
+	const size_t vsmmu_size;
+	const enum iommu_viommu_type vsmmu_type;
+	int (*vsmmu_init)(struct arm_vsmmu *vsmmu,
+			  const struct iommu_user_data *user_data);
 };
 
 /* An SMMUv3 instance */
diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c
index c14f7e6b4dae..445365ae19e0 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c
@@ -415,6 +415,10 @@ size_t arm_smmu_get_viommu_size(struct device *dev,
 	    !(smmu->features & ARM_SMMU_FEAT_S2FWB))
 		return 0;
 
+	if (smmu->impl_ops && smmu->impl_ops->vsmmu_size &&
+	    viommu_type == smmu->impl_ops->vsmmu_type)
+		return smmu->impl_ops->vsmmu_size;
+
 	if (viommu_type != IOMMU_VIOMMU_TYPE_ARM_SMMUV3)
 		return 0;
 
@@ -438,6 +442,10 @@ int arm_vsmmu_init(struct iommufd_viommu *viommu,
 	/* FIXME Move VMID allocation from the S2 domain allocation to here */
 	vsmmu->vmid = s2_parent->s2_cfg.vmid;
 
+	if (smmu->impl_ops && smmu->impl_ops->vsmmu_init &&
+	    viommu->type == smmu->impl_ops->vsmmu_type)
+		return smmu->impl_ops->vsmmu_init(vsmmu, user_data);
+
 	viommu->ops = &arm_vsmmu_ops;
 	return 0;
 }
-- 
2.43.0


