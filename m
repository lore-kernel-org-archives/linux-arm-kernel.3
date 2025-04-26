Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0167C369CB
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Apr 2025 06:33:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eq4oT32cLZt3wUif0J4fmHx0WwtW4+Ygt0HlQdJGHWw=; b=3/vDy+EHS0GmMdlRlclyroE9YL
	wDgQMW7L9Q0DkQBlbXRDJWi5F8N5vdALsEzp7QtAHaAWPhbPJAVqB+iBMTF30Qf2xNoP9XkaV1b2t
	RM5f3MOZ4xAQVF/rIB/68lLEK8fC4ZwbBqvmR4VXWemYZIxoZjcMgQZ6foFouoI5TjCeN59UFjRFN
	ZXMtlcPcMYbBwOvGX55l/d+VQylLHr+/uHbzM4/tG5Hv71C8AAAU+X8iyzsG5DwsEKUENWN4DN0Mr
	bJefzbtg+Mto7IF6T7IaN6r/OThe3LoBFbY67vN76aqI2y2YGvDyOGy3Z1ctpZGVsVCcQK4P0GafV
	kbn6FHsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8Z5z-00000001ZIg-3buP;
	Sat, 26 Apr 2025 06:33:03 +0000
Received: from mail-bn8nam11on20616.outbound.protection.outlook.com ([2a01:111:f403:2414::616] helo=NAM11-BN8-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8YZd-00000001Tx7-2RX3
	for linux-arm-kernel@lists.infradead.org;
	Sat, 26 Apr 2025 05:59:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MYNJFcHxggzYAlEkGT7Y6kSfEeThslAk5Z5oSS1dFU01xVjhCvG4qAmiVXZxxYlAjQnLxppTzBsi0bFcYhQPYuuWuFfvlbQPMQjKn8iJADe79oVb4IcbSp8R4Ij0BXubZhs6niw92JVIrKJagsuKH2njK+ZkOXv2HFEQJYhyc92dVCvwU5swc3alV9u4vG7aVcqfarmDHOSArc3ub4LQrrPrpyFhidhEAGGuGRLtwy4oWAHmatE2CZbabDF5NVL0rctHhaCYU2dn+3EXKqayVnSlHfBAqEcF2GpduUdMH84zEXdzsFAdWLB6VxZUN4YouYiiEISYfi+zS7GSwv6bdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eq4oT32cLZt3wUif0J4fmHx0WwtW4+Ygt0HlQdJGHWw=;
 b=jxyLY/V8GO562joehlNYUJoPsgz6M6Q5jWzroOdTtJnTJC/DHosn5y5eU3RZ1NB+XMJbcBIo7QQTO0MOTif2e2eczitilyig3f18GRzG/7le2lC7ymNQLTySxmdqOeh2hPMENMEi4H5uKVaPxblgwLIY1mNU9nE7kwrpm3raiFNksQ+itdb4wVb5mnSWbzZ9Besna43a8qWotraGGbWq5UhEPklNhexFEm2NAhOVyvWD2naUNT+VyyzSIXGF9Iv7AcW0C2+/GQkw1wCsBJz38GlnZGsA3KylQ0ZHnTxwrP+rXfW7Xdiiu8vILcxTWgvlro+sr7y6rpT9csej9c+zeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eq4oT32cLZt3wUif0J4fmHx0WwtW4+Ygt0HlQdJGHWw=;
 b=HyREg18geLTLWLAf3i/6darQ8yXz1v4fXSJgSbLZF5aCZIYPixVxjr2fyCCvg+SKxABE1xW9sl2cFLLJhPKNmV/gV1K1uLPJdli8LhFWJtTDBfVlwB05OZswj1f5kYQ7Y824O0s9z+G+6atMvLs3JRm2leDCRQ55Z1JMQCHHem36dk1ivbuo1c8oCoCiya82/iCq8XCH10mtG7pb8CltG8ZiQ1V4AyMgYCfN74ujyHkptJc8Pgi7jyemvsWE/4zxAYX1P9yOdrR7mMJTFp8QC2I/T1nf4TD/G1vwUQTDwQroHRyr5z7on0ifzPLRRp/89qlLnf9kMIeSwJ23nyCxLA==
Received: from SA9PR13CA0039.namprd13.prod.outlook.com (2603:10b6:806:22::14)
 by CYYPR12MB8853.namprd12.prod.outlook.com (2603:10b6:930:cb::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.27; Sat, 26 Apr
 2025 05:59:31 +0000
Received: from SA2PEPF00001505.namprd04.prod.outlook.com
 (2603:10b6:806:22:cafe::60) by SA9PR13CA0039.outlook.office365.com
 (2603:10b6:806:22::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.31 via Frontend Transport; Sat,
 26 Apr 2025 05:59:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SA2PEPF00001505.mail.protection.outlook.com (10.167.242.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8655.12 via Frontend Transport; Sat, 26 Apr 2025 05:59:31 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 25 Apr
 2025 22:59:25 -0700
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Fri, 25 Apr
 2025 22:59:25 -0700
Received: from Asurada-Nvidia.nvidia.com (10.127.8.12) by mail.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server id 15.2.1544.14 via Frontend
 Transport; Fri, 25 Apr 2025 22:59:22 -0700
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
	<mochs@nvidia.com>, <alok.a.tiwari@oracle.com>, <vasant.hegde@amd.com>
Subject: [PATCH v2 17/22] iommu/arm-smmu-v3-iommufd: Support implementation-defined hw_info
Date: Fri, 25 Apr 2025 22:58:12 -0700
Message-ID: <56f048cdc9cd8bf1569434633d709d07a78e9430.1745646960.git.nicolinc@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1745646960.git.nicolinc@nvidia.com>
References: <cover.1745646960.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00001505:EE_|CYYPR12MB8853:EE_
X-MS-Office365-Filtering-Correlation-Id: f3eca068-21e1-4f69-fbfc-08dd8487836c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|82310400026|36860700013|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?t/Y6bmeQvwe2pO6PKlxDbk67JdzLCC62dfjn4R5OiXp475sE4mbpKGbySyW1?=
 =?us-ascii?Q?EU0b3zgs2/aNmS8yWV/dokqs2yu6fUdPg9jb1EuKE+nDqK8Oc4+D3t14Fu3N?=
 =?us-ascii?Q?jg9HpU9VKruK7eriiOr8myH9UE/3+JrUP581TM8XbhQV3bzPBLHyD5w8mWdr?=
 =?us-ascii?Q?oA8eSMDFtzYNAwGkgpfKLvVeH1W4JHKq2D3jBDdGquuSVcJjfxtSVj3Sk5P3?=
 =?us-ascii?Q?4UME7ZCGnEAUyaofIot6hQWFswurHUUtzb6/RE0EwcF7NkvGy/HjsXFL7toi?=
 =?us-ascii?Q?TTsmbWUPKzUSFrmV2wPexKqiF0KQQE0q9Ibf3WV+YeirHKf6Xer/8izi+q6h?=
 =?us-ascii?Q?7buDsgz703rWtW0SJtVX1w/ssiWDnnqEgTgO+2EeElcFOP8mowoDK86zZwWP?=
 =?us-ascii?Q?cvcDnx8FZtaLACPSnA2VPIU0kckiDmusdujLa4x64kW0/jWaKPB+Ur/CW0ln?=
 =?us-ascii?Q?GyKeA/3KK8IPeReYHR9BHGcWDNImv2hzCKQu5HqsVg4BuG1g5bR5pE4rdZnz?=
 =?us-ascii?Q?PDyObrqPUbWJGKH5rT3EgYgPa+gWFnKEZtDR973I6dprZD5uTip1ZuencAkS?=
 =?us-ascii?Q?SNDZn46krpmioVJGNHs4aCtT/b7sDllJcRqQ4Zb1p1UrWmpfLiGE7ww5m+k5?=
 =?us-ascii?Q?ijO9oDgs1ddrSu9QjjrQBqTsuiZkEZAH2ZVY6o1zE4pe2SmjxqHh5itjisV0?=
 =?us-ascii?Q?6l3VeoOTRB2wgmlfcJRjKy/v63GYpk8eBJLJRoGobbGE5/qGpA70nucVGdv7?=
 =?us-ascii?Q?h7USO4LlUbDEsE8m09iPa4zR4fKi+AZ+rAaJ+Es7DmBBET0I4oFX4staUQtY?=
 =?us-ascii?Q?Qc+2m01KICCs37BunewyIg9KNH3KC9CJZr2JCGrNjs/SshsfbfUphRy0MERG?=
 =?us-ascii?Q?LoCO9fTV1u5+RLRcpcG1X0mTCtoxB8BY9vmppGN0PXgsksavPSKMcYaaoQ9f?=
 =?us-ascii?Q?9Ybaq0ZhwrBsdRgYrnxSMqEtew3R6nee2t1C0v6fxI6V8P1finDCm0lf2RKt?=
 =?us-ascii?Q?eGtHk/i/Rf9eioVC+a6ltK7YqRM2BmgAR4Ijh7yvth0j7UPX2S4O1HezR5ZK?=
 =?us-ascii?Q?fT7sn86QJxo1nPVfw2QkzBkfpjGsXwHpOodHLi5FdOtgilevODjZuhaYM4pR?=
 =?us-ascii?Q?yV6834wSroIu4bUVEzWg/BWIMa2kp4A85QpWAxrCo+VH3VkQAs13lTc9zj26?=
 =?us-ascii?Q?3MDcoFcaUF8B8OR+5cyzpOR+MTxBAUmHPuoBW8h0nozpdWm4FHzZC8Sjr64m?=
 =?us-ascii?Q?Q7V9G2yDYOZOK0yZW3vVjLS3bCJgf/4d+BeJTBhZ/Nt0RoTgJJHOX/fD7ji5?=
 =?us-ascii?Q?9WUb+PI0GmWA1LDmGgc2cFPpaHBHdGKhTXm2ykAJppo9DbmbdKq7H9Sx+4YI?=
 =?us-ascii?Q?FZqHTwYfWyX8Wl27HwMutt669hUj4D/eo/5bpyf5tCJo6DUY4FqrM/di7FTU?=
 =?us-ascii?Q?xXZQK2CHj0luvdy+++vy/sWfKmE4KggfWhbDawcvkWrZjv6612coFZhZpJL2?=
 =?us-ascii?Q?hSUecSuueScJqBIFD1zxUoCKMmjPYuvxgELS?=
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(7416014)(82310400026)(36860700013)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2025 05:59:31.5481
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f3eca068-21e1-4f69-fbfc-08dd8487836c
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF00001505.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8853
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_225937_614593_017838E1 
X-CRM114-Status: GOOD (  14.87  )
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

Repurpose the @__reserved field in the struct iommu_hw_info_arm_smmuv3,
to an HW implementation-defined field @impl.

This will be used by Tegra241 CMDQV implementation on top of a standard
ARM SMMUv3 IOMMU. The @impl will be only valid if @flags is set with an
implementation-defined flag.

Thus in the driver-level, add an hw_info impl op that will return such
a flag to use the impl field.

Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h      |  1 +
 include/uapi/linux/iommufd.h                     |  4 ++--
 .../iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c  | 16 +++++++++++++---
 3 files changed, 16 insertions(+), 5 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
index a5835af72417..bab7a9ce1283 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
@@ -726,6 +726,7 @@ struct arm_smmu_impl_ops {
 		struct arm_smmu_domain *smmu_domain, struct iommufd_ctx *ictx,
 		unsigned int viommu_type,
 		const struct iommu_user_data *user_data);
+	u32 (*hw_info)(struct arm_smmu_device *smmu, u32 *impl);
 };
 
 /* An SMMUv3 instance */
diff --git a/include/uapi/linux/iommufd.h b/include/uapi/linux/iommufd.h
index 06a763fda47f..b2614f0f1547 100644
--- a/include/uapi/linux/iommufd.h
+++ b/include/uapi/linux/iommufd.h
@@ -554,7 +554,7 @@ struct iommu_hw_info_vtd {
  *                                   (IOMMU_HW_INFO_TYPE_ARM_SMMUV3)
  *
  * @flags: Must be set to 0
- * @__reserved: Must be 0
+ * @impl: Must be 0
  * @idr: Implemented features for ARM SMMU Non-secure programming interface
  * @iidr: Information about the implementation and implementer of ARM SMMU,
  *        and architecture version supported
@@ -585,7 +585,7 @@ struct iommu_hw_info_vtd {
  */
 struct iommu_hw_info_arm_smmuv3 {
 	__u32 flags;
-	__u32 __reserved;
+	__u32 impl;
 	__u32 idr[6];
 	__u32 iidr;
 	__u32 aidr;
diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c
index a8a78131702d..63861c60b615 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c
@@ -10,7 +10,9 @@
 void *arm_smmu_hw_info(struct device *dev, u32 *length, u32 *type)
 {
 	struct arm_smmu_master *master = dev_iommu_priv_get(dev);
+	struct arm_smmu_device *smmu = master->smmu;
 	struct iommu_hw_info_arm_smmuv3 *info;
+	u32 flags = 0, impl = 0;
 	u32 __iomem *base_idr;
 	unsigned int i;
 
@@ -18,15 +20,23 @@ void *arm_smmu_hw_info(struct device *dev, u32 *length, u32 *type)
 	if (!info)
 		return ERR_PTR(-ENOMEM);
 
-	base_idr = master->smmu->base + ARM_SMMU_IDR0;
+	base_idr = smmu->base + ARM_SMMU_IDR0;
 	for (i = 0; i <= 5; i++)
 		info->idr[i] = readl_relaxed(base_idr + i);
-	info->iidr = readl_relaxed(master->smmu->base + ARM_SMMU_IIDR);
-	info->aidr = readl_relaxed(master->smmu->base + ARM_SMMU_AIDR);
+	info->iidr = readl_relaxed(smmu->base + ARM_SMMU_IIDR);
+	info->aidr = readl_relaxed(smmu->base + ARM_SMMU_AIDR);
 
 	*length = sizeof(*info);
 	*type = IOMMU_HW_INFO_TYPE_ARM_SMMUV3;
 
+	if (smmu->impl_ops && smmu->impl_ops->hw_info) {
+		flags = smmu->impl_ops->hw_info(smmu, &impl);
+		if (flags) {
+			info->impl = impl;
+			info->flags |= flags;
+		}
+	}
+
 	return info;
 }
 
-- 
2.43.0


