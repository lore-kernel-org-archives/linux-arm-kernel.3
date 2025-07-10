Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D1F2C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jul 2025 07:08:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5yG4YicJuyOLO3kZqwyH0YHYzughxDEpZvc3rLH9H90=; b=FmtCBbgojv2EgZRQuwJCJwQ+zS
	dZnIqXSfZ76XihiwvaS8nm53nshWIzQbXJ6SwTnfu65qnTXb9Oi7lGmu+1gWqCbd9zGIBPXA2o7cM
	TH8NYRc92w+m+sR3Kiid9GzMG2I84YWlXha7bxyIsrGn9JNgj3c3d3bCly5yAr8MNIynhkHv4AcAz
	ZJYyTITipW4qfvLtT4Waq8uwiwSWu6Snd4HXtImUyn2lupu04pH/rjiXYUK5r5qXMyzV3YNfE+LCX
	vDxDSeuJ6n3z3roHsIaHfqd5gvAb9IlxngFk2X+90Fl9PXZiwhPMIeFPlMdgke6p/7xqyWYdF1DJQ
	8CGTSSzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZlNz-0000000Ax5p-1xGV;
	Thu, 10 Jul 2025 07:08:03 +0000
Received: from mail-bn8nam11on2062f.outbound.protection.outlook.com ([2a01:111:f403:2414::62f] helo=NAM11-BN8-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZkL8-0000000AmLz-0JE7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Jul 2025 06:01:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jKDZnFOwZ7m9SSjACkDlRA6UEubfB+AtmuX1MTozaloykYNNVeQ6WsuMeD0QvO1BpvUATBqlHrerLT/7rAc8ySoUbb6WtdFKQtCwfbpSmji8U3BDEejH8sRtKkJJd/PJ+l8a1vKqnMUf3LkxDPj7sDflfLfgNm+ALbB7zPkFW9PoOM+eWUtMZ8E5WVL35C/9M7V8P+odo+/SF1Wl53JW0c4vFuKDo0yG1i/eiGoiErgODQ7PHDyr0aAQcqIIJFeQPfMlRV3zoMIPU1uoVrXa1n5iuUUY6Fb03FIhHob6+8G1yjrMDu3Mysv+BfCb8MYvn4XzBIFhoqkAv1ocIKSBbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5yG4YicJuyOLO3kZqwyH0YHYzughxDEpZvc3rLH9H90=;
 b=nrJ4oVrFfGchQeg148HBZczltF7CKpEI8xZCDqWSbiZNWeznKN0wUXeLkZZh3BJO3IsKbhTy4Xsln3hoqD0kcYQYs4VSt872p0XNcYNLJ3Wx6s9o4A3tcAmLpIUXzoDKHQVAvR6K5yb+1bbg7lhaqqiySS3wWkTjJ0nnDzT3F0lEh40U5FbCtpGPv5C9TbFf50llRZFVrje/Abmo8ahOzLq/fxmVYLIIG8+pkvHKQcaOt0dcvI8Px/eOTtXT7W3COhc7kPeubQxN/K0yGC4htOv7CpdHYKQfKRBNIxWnys1O0A86xzDaRYN8klpp5rZdjkQxHSX0SWsCq0HYYzoP1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=amd.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5yG4YicJuyOLO3kZqwyH0YHYzughxDEpZvc3rLH9H90=;
 b=rMYjerqI+kNw2exmz+SugPwJOTGuUqdlq3PrA3ZAqLK9sTb4DxjTntYTA8PdUVULUidD2dS5bEukVMh8GTyPFaAmaYaI/113O9k12K+c9MhJDvqEsSO1ZwvZYg1SdoV0Ly75qpvljEZLvkupMjvv2e0NAYufqv1yeMdGa8Oy/a0bTTmVA/gNev4hqvw98noH3D2zhgbhnHXwHzfJb0kgKCFcUP4xU43un99f5fZBbDBvDYYhnrNUR0VhJVqei3MgFUFnPCFDj+UG4ZMs5gZxeoqYKOkAAX8VEthsgXqVOSgCvaiY0qYm9jQrR/5usQSyn8Ioe2wvPhylc44UpKDl4A==
Received: from CH2PR17CA0012.namprd17.prod.outlook.com (2603:10b6:610:53::22)
 by IA0PR12MB8423.namprd12.prod.outlook.com (2603:10b6:208:3dc::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.27; Thu, 10 Jul
 2025 06:00:57 +0000
Received: from CH2PEPF00000146.namprd02.prod.outlook.com
 (2603:10b6:610:53:cafe::10) by CH2PR17CA0012.outlook.office365.com
 (2603:10b6:610:53::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8922.22 via Frontend Transport; Thu,
 10 Jul 2025 06:00:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CH2PEPF00000146.mail.protection.outlook.com (10.167.244.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8922.22 via Frontend Transport; Thu, 10 Jul 2025 06:00:56 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Wed, 9 Jul 2025
 23:00:39 -0700
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Wed, 9 Jul
 2025 23:00:39 -0700
Received: from Asurada-Nvidia.nvidia.com (10.127.8.14) by mail.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server id 15.2.1544.14 via Frontend
 Transport; Wed, 9 Jul 2025 23:00:37 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: <jgg@nvidia.com>
CC: <kevin.tian@intel.com>, <corbet@lwn.net>, <bagasdotme@gmail.com>,
	<will@kernel.org>, <robin.murphy@arm.com>, <joro@8bytes.org>,
	<thierry.reding@gmail.com>, <vdumpa@nvidia.com>, <jonathanh@nvidia.com>,
	<shuah@kernel.org>, <jsnitsel@redhat.com>, <nathan@kernel.org>,
	<peterz@infradead.org>, <yi.l.liu@intel.com>, <mshavit@google.com>,
	<praan@google.com>, <zhangzekun11@huawei.com>, <iommu@lists.linux.dev>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-tegra@vger.kernel.org>,
	<linux-kselftest@vger.kernel.org>, <patches@lists.linux.dev>,
	<mochs@nvidia.com>, <alok.a.tiwari@oracle.com>, <vasant.hegde@amd.com>,
	<dwmw2@infradead.org>, <baolu.lu@linux.intel.com>
Subject: [PATCH v9 29/29] iommu/tegra241-cmdqv: Add IOMMU_VEVENTQ_TYPE_TEGRA241_CMDQV support
Date: Wed, 9 Jul 2025 22:59:21 -0700
Message-ID: <68161a980da41fa5022841209638aeff258557b5.1752126748.git.nicolinc@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1752126748.git.nicolinc@nvidia.com>
References: <cover.1752126748.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000146:EE_|IA0PR12MB8423:EE_
X-MS-Office365-Filtering-Correlation-Id: f6e9762d-fc4d-4ce6-4af8-08ddbf772300
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?xvfLv8+4q+qFcugrt96eCbPQ2U9MdfMoJQVPZc5iafSsGMag52He9aLAEZww?=
 =?us-ascii?Q?NJpKxF69DaJCNgX7dFotNP3bpDbrqdRUOWRwCvfDLnBHUsgo79WshnwN3B+X?=
 =?us-ascii?Q?1pY5Ljg7Ih3l/4U0k6xHNdhKu46gROSBSXWgX/OTuXH85SKsYqf1CyzOQw1y?=
 =?us-ascii?Q?JRIIsgrqI3GXryI2BBO0QYefEAkre30wpeeeCqtGRtulzDVVnwmbVftQ0fdx?=
 =?us-ascii?Q?JXwzk+ULg6ngdwV8OecQPKmzCaTTSKI103F6TmYPQ9+95mPUjNUIhaS/y9WO?=
 =?us-ascii?Q?nsKByhZwyTDfJEoC2ED7d1OpgCWRfPIgoroHzGxYgd4SKKUOEI7AIu8ynUeF?=
 =?us-ascii?Q?PR2u+47alwVVyXbCOi0TsozGTpJQ9Z6Gu6m61tFD2cf6mNVI4/V99KkNphpo?=
 =?us-ascii?Q?MSHqsiHF8EmcVjJI+HkWL8xanBBt2vOiDYGKieszChfpDGa8p7EmM0mxefKE?=
 =?us-ascii?Q?JEiEbHvCpnPLShemWPe58jpHUMtjvfofM2MCAVDXhdtU4fyGL0RwdQaqY8Jq?=
 =?us-ascii?Q?rzh80rO+SZRmothB1cVeCHu9YGcOUddh+JrBXB36hZkM9pjkAv+EHsJen4lO?=
 =?us-ascii?Q?kkChQJuH4VfMV0nsD6clZ9runUCsNeDT2y7Ty0oNx0nBinZc10G9iHKKVQF/?=
 =?us-ascii?Q?B7Nu7pmID31q4ePqexG5nPinq4J281g3pxaROkgWfuE8jYSBWkraZBfnc85t?=
 =?us-ascii?Q?X2M7hHOP3Pqay5BZqL3PA0X+qpmfqu11oeWcu486dVymFkWDQMYS97N+yolP?=
 =?us-ascii?Q?sNfeOyeuPmXfph1xB++k9FCAIV8c0sA64XUoLazRpnTpfh8S6HWe+heJPaiU?=
 =?us-ascii?Q?Uzn/7/wJseUHMc4fKqnBcIV8LfbxVCCcfWPylWIdPNnOWc9b+8uBHgPr1ebn?=
 =?us-ascii?Q?BnfmGftTarRTLmTEGGalxyghZxF3wQ5FjJ091Dz2QYqIQMprvqwcKnQMGTjp?=
 =?us-ascii?Q?RkQ0xAl/JqBNFdFtxquoLWS1+gD6aGZliBDxP7QzJYt9LqSiQzTZ7Ij0430/?=
 =?us-ascii?Q?xm/v/atma2mgtjaSGnEcVoRjDSgQpB0ccjjwQ48gVuzZsOVRifi5xF9rTsW9?=
 =?us-ascii?Q?vAshZPWSvkqsJsYA/ue4JiZU258tVm8gRGh5gKJ2onXQW9YCxiH/U9IJ4P9a?=
 =?us-ascii?Q?FgtCxcOOTL7oLD2q974Scc4fF7rVm2EC0BoyVrgravNJXM+zRSTzv8RZXI7I?=
 =?us-ascii?Q?+den1vIT1IbGIT+Nk7pS4RoBLIX4xdBIn5fsfJVEGxzxhgP7uw98v4feXRkw?=
 =?us-ascii?Q?p5LL5Hx5VaUIDmdAgaXwuO35tHNUf1qxiCMxRDQTUP5z45SGOykKt4Ip+dVn?=
 =?us-ascii?Q?3VVb9bkV7UUq3v2haHHh8zNGcis2YKgxnS6Z9O1tZT163QZsLZIMVcs7JpCe?=
 =?us-ascii?Q?7MmIkwNJu1NK2Rm/ebiOoSQ28uj+TGl47mIDLq44m7g7crZgj5+8DEI/uzbW?=
 =?us-ascii?Q?AHGnt48C80jDYX2iw1EmVJDWcAqPGvVRgbabnbNBC8CInfXpZuca8avczvhS?=
 =?us-ascii?Q?0M7Bz0YDiOAbz7bXhTAVF5OMR6Zdwt7gCUQL?=
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014)(7416014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2025 06:00:56.4136
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f6e9762d-fc4d-4ce6-4af8-08ddbf772300
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF00000146.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8423
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_230102_117309_FAACA6FC 
X-CRM114-Status: GOOD (  14.61  )
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

Add a new vEVENTQ type for VINTFs that are assigned to the user space.
Simply report the two 64-bit LVCMDQ_ERR_MAPs register values.

Reviewed-by: Alok Tiwari <alok.a.tiwari@oracle.com>
Reviewed-by: Pranjal Shrivastava <praan@google.com>
Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
---
 include/uapi/linux/iommufd.h                  | 15 +++++++++++++
 .../iommu/arm/arm-smmu-v3/tegra241-cmdqv.c    | 22 +++++++++++++++++++
 2 files changed, 37 insertions(+)

diff --git a/include/uapi/linux/iommufd.h b/include/uapi/linux/iommufd.h
index 4e81610390c7..111ea81f91a2 100644
--- a/include/uapi/linux/iommufd.h
+++ b/include/uapi/linux/iommufd.h
@@ -1145,10 +1145,12 @@ struct iommufd_vevent_header {
  * enum iommu_veventq_type - Virtual Event Queue Type
  * @IOMMU_VEVENTQ_TYPE_DEFAULT: Reserved for future use
  * @IOMMU_VEVENTQ_TYPE_ARM_SMMUV3: ARM SMMUv3 Virtual Event Queue
+ * @IOMMU_VEVENTQ_TYPE_TEGRA241_CMDQV: NVIDIA Tegra241 CMDQV Extension IRQ
  */
 enum iommu_veventq_type {
 	IOMMU_VEVENTQ_TYPE_DEFAULT = 0,
 	IOMMU_VEVENTQ_TYPE_ARM_SMMUV3 = 1,
+	IOMMU_VEVENTQ_TYPE_TEGRA241_CMDQV = 2,
 };
 
 /**
@@ -1172,6 +1174,19 @@ struct iommu_vevent_arm_smmuv3 {
 	__aligned_le64 evt[4];
 };
 
+/**
+ * struct iommu_vevent_tegra241_cmdqv - Tegra241 CMDQV IRQ
+ *                                      (IOMMU_VEVENTQ_TYPE_TEGRA241_CMDQV)
+ * @lvcmdq_err_map: 128-bit logical vcmdq error map, little-endian.
+ *                  (Refer to register LVCMDQ_ERR_MAPs per VINTF )
+ *
+ * The 128-bit register value from HW exclusively reflect the error bits for a
+ * Virtual Interface represented by a vIOMMU object. Read and report directly.
+ */
+struct iommu_vevent_tegra241_cmdqv {
+	__aligned_le64 lvcmdq_err_map[2];
+};
+
 /**
  * struct iommu_veventq_alloc - ioctl(IOMMU_VEVENTQ_ALLOC)
  * @size: sizeof(struct iommu_veventq_alloc)
diff --git a/drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c b/drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c
index 3eeb8444fadf..d5d43a1c7708 100644
--- a/drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c
+++ b/drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c
@@ -295,6 +295,20 @@ static inline int vcmdq_write_config(struct tegra241_vcmdq *vcmdq, u32 regval)
 
 /* ISR Functions */
 
+static void tegra241_vintf_user_handle_error(struct tegra241_vintf *vintf)
+{
+	struct iommufd_viommu *viommu = &vintf->vsmmu.core;
+	struct iommu_vevent_tegra241_cmdqv vevent_data;
+	int i;
+
+	for (i = 0; i < LVCMDQ_ERR_MAP_NUM_64; i++)
+		vevent_data.lvcmdq_err_map[i] =
+			readq_relaxed(REG_VINTF(vintf, LVCMDQ_ERR_MAP_64(i)));
+
+	iommufd_viommu_report_event(viommu, IOMMU_VEVENTQ_TYPE_TEGRA241_CMDQV,
+				    &vevent_data, sizeof(vevent_data));
+}
+
 static void tegra241_vintf0_handle_error(struct tegra241_vintf *vintf)
 {
 	int i;
@@ -340,6 +354,14 @@ static irqreturn_t tegra241_cmdqv_isr(int irq, void *devid)
 		vintf_map &= ~BIT_ULL(0);
 	}
 
+	/* Handle other user VINTFs and their LVCMDQs */
+	while (vintf_map) {
+		unsigned long idx = __ffs64(vintf_map);
+
+		tegra241_vintf_user_handle_error(cmdqv->vintfs[idx]);
+		vintf_map &= ~BIT_ULL(idx);
+	}
+
 	return IRQ_HANDLED;
 }
 
-- 
2.43.0


