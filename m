Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E582C3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 03:23:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bRetIdPJGwSneyTAd1YrA23inoaIzueZDbrTLLUyHOs=; b=AHJFBqrd+0RU3zk9ra8ufrFzGo
	xzvf6y1nYarBRNXhZgWbJCy7b3bjxuR/4DRcDbW2F/4AZVpsjOi2qpYZxLiC3swDL13tojkr9eo7i
	x72xxUwk5QByr+l0gLCpvq4pnqvw2NQQvCjv//ojzvX5JlhsXmEAXtcBup8xf3Owi1y7juO07UgZZ
	q6Oz3RPFihXyrPuf8aMXKEazRHPz1SowDkMY593N1aWjtV0xplQi1hO96UXUTjpUztKGAm5GgFofr
	5/YDM3WBWULFxoBy28b9MgXp389ksuYRIrDH04PAQxFJIJdcdWNEVnwz3d5qtFCNizVpPSwJKuY1u
	nk79zzWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDEL0-00000002MXI-3JaN;
	Fri, 09 May 2025 03:23:50 +0000
Received: from mail-dm3nam02on20631.outbound.protection.outlook.com ([2a01:111:f403:2405::631] helo=NAM02-DM3-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDE1W-00000002Iiq-0r2H
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 May 2025 03:03:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f1Qyk7ffIvXFmUcSV7grH/86/Kvfu9FtTtedxHNt3RMu2ZXRswGKECL/usH8nugwGeiomqj4h03fz0kEWUoJpMCbwQ3g2ANomNciGJLzVsn0O6J+bZo6QS1OKVqeGw5RTfT6sawRDF0LxLcSNFogFDs+FA6ljeFIkCSj9BOqGtLEfphYAkKJvsSywaLeqf0uzEMwK7tZVeE1XoFserY3FT8Z5y3bjfT4JgIDlRJcvc0E2Lb+vgRLOuVnOOZIpDKCSi6BOrHBpIq2rj1ZL/Tz/wcl/tvC9FCgDPjk7o+iU+RjRmOxQlJr+rhRj/TP7lF8WCheZ/FHfnVjXCYr5i4Ojg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bRetIdPJGwSneyTAd1YrA23inoaIzueZDbrTLLUyHOs=;
 b=mm/4t5g2GZHnFMH7Nt+UOPfHSpctGEmLVw4zHxysLtnt9RbdDiY9t+XAfMjPcjkAZzfEy5pF7OuLNXroDXV6AC+MzhpbrHqn43Cm4juPdZpETo6Nz2uEx2Y0mMadGSBAlqxg5dEjgHjAmTneCi4fesKIVcvIBWf1AHrOhyghRAlgUoS8kdabu6bB3tLR9ETTLgOSMt9fBpfEwnvYymXSR/jv4/5xU2fBtBquQUDT33o3x9/4LVHUjZ3+Ockodr73RmUpNDda4F+TvWmagx67YnHDTUtTmLlAH0ObREKORYjoTPGsNiDgesvXgIQmvTSI5K2DB4G2ZJeaHAIlEqZoqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bRetIdPJGwSneyTAd1YrA23inoaIzueZDbrTLLUyHOs=;
 b=N7t5F+LhbDEJzNnzA7qhu7JGiU1vQK7HNF4CsFEmeLKRXxgFDQ9wuLFUviJ6sbpAbcK8boOJSoMQP5Q/n4HvEzQ44ZJls/i+n28CGzyLwwaSMZNdwxbEvwCp3GbE84P07hvoTxwHINQxz2HjxCHocgVg9kX7BxCp7imAaWV2dv1A3vIOe0SjSX0uNCZ0BP90XYikdvis+hNC11E2PJUFMpbLb8Wwmaof+yQaq4+LmnEnEq70ZSbtmgPAnLB1TqxHw70yH7YPd+WQNZzWd7Rbok3ZvLlQ98Y9H8VJEBsNCXMcOtLDy0Nx3/3S7xNfy2eWMifBo2kPzX5tLtVMjm2Lyw==
Received: from PH7PR02CA0029.namprd02.prod.outlook.com (2603:10b6:510:33d::6)
 by MW4PR12MB6802.namprd12.prod.outlook.com (2603:10b6:303:20f::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.26; Fri, 9 May
 2025 03:03:32 +0000
Received: from SN1PEPF000397B0.namprd05.prod.outlook.com
 (2603:10b6:510:33d:cafe::2) by PH7PR02CA0029.outlook.office365.com
 (2603:10b6:510:33d::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8699.33 via Frontend Transport; Fri,
 9 May 2025 03:03:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 SN1PEPF000397B0.mail.protection.outlook.com (10.167.248.54) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8722.18 via Frontend Transport; Fri, 9 May 2025 03:03:32 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 8 May 2025
 20:03:21 -0700
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 8 May 2025 20:03:21 -0700
Received: from Asurada-Nvidia.nvidia.com (10.127.8.14) by mail.nvidia.com
 (10.126.190.182) with Microsoft SMTP Server id 15.2.1544.14 via Frontend
 Transport; Thu, 8 May 2025 20:03:19 -0700
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
Subject: [PATCH v4 10/23] iommufd/viommu: Introduce IOMMUFD_OBJ_HW_QUEUE and its related struct
Date: Thu, 8 May 2025 20:02:31 -0700
Message-ID: <bedd9de4e24bb89f18f4b13b52c5fdb6db6bd889.1746757630.git.nicolinc@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1746757630.git.nicolinc@nvidia.com>
References: <cover.1746757630.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000397B0:EE_|MW4PR12MB6802:EE_
X-MS-Office365-Filtering-Correlation-Id: 269ed921-163f-4526-6fb9-08dd8ea614ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?M9FuqVONbGypXXgEnr53GYvSQ/XwYr5UKdHSR2HRc+8YzdPsLb5NkgZCFDZW?=
 =?us-ascii?Q?xts8HyxICUk/sYAw/28EAQFqd2jfNXZR9mOC6Sel8rz0DF725pUx5h9nsNJs?=
 =?us-ascii?Q?MgBSjtDV6JDp0haKn3b/tczIEP2BeY/eXfLPcuVeaCS/55Lc/YDqvLcvMBqg?=
 =?us-ascii?Q?RK/UkMmIpI6JrRGWxyZHWkAZ6nNkqibnnLrp+lszKDD8S8sPQDmtAMLTcpP4?=
 =?us-ascii?Q?8y1tBr3UqzDbCPgoR7qyJ0tbCsU+cBdiks/mp+ixufpJi04ThVVe/VPcbNK5?=
 =?us-ascii?Q?7fDqcyxkm9UIBY16g2mF7v0U2nL/zNcsU3kcQfjiQKEeNrlQTpbTH1jZcHCr?=
 =?us-ascii?Q?h8By7Z1AB/6tRjADrzQXRILqPEIf2EeOq3SP4URnt2tz64mAO0wcmhCNNiQK?=
 =?us-ascii?Q?AqTCVa+zsd/OE06jKlbAnAirWvqnZfV5XIk964uAIvkTHRoT6OlbjEQhc0CN?=
 =?us-ascii?Q?VndH/Lsb/qoG0cjUKer9FSEgZOA0bxG9kiZb+uxfFYQh4Cv6YyBo2ec4yHBm?=
 =?us-ascii?Q?ApWEltNCHcvsPnlOWd5RoGywjrFdsEgCH165k4aQq2hiylsqHjn+2Gha4/De?=
 =?us-ascii?Q?A/Luii50RfobOByfVGchH3aLpnn9/FAzaMAlTmsWf775UrPXK46eqh/sGFRS?=
 =?us-ascii?Q?BjV7fNljPODcvx5hHNWQ++cDCzE1gdhpnOdtwRukNE7/xq/5z6nrZQC8YPjq?=
 =?us-ascii?Q?fOj9YYyVw2/uIFM3GuNHgyvFcq8k88hqMFn7oPC+H85UlQS1StX9/ZDlwk6Z?=
 =?us-ascii?Q?U35rjFur3h1PKr3WYaxFyISdbu4ZbmQXdIC2VpGksC89Ns+iH/TVlDKcY94N?=
 =?us-ascii?Q?Fq4q7zccHmy0E3kPJcB3NrvVoX7edar/JqYIlF/s3XkUviAGClAq208D1ToZ?=
 =?us-ascii?Q?+xyLznyExpdIADsmpWWp3s+pV2/yeke07LRTrajpwmndpD//ibvMaFn062gC?=
 =?us-ascii?Q?jiFcPiwAFCDNIOk6hR+bOJumtgAAbJlE7wm+VYtXywIG2lhKkA9oSpzS9hpF?=
 =?us-ascii?Q?sy9R+kU03kej9jbQP1UWakvgWqL+MV7Ddks2gkcaeVQQ+ezyZlXRiZkDST/T?=
 =?us-ascii?Q?WyZKl2gMkpARbnjvc5yP9ndCEoLKB+CJtEq7axJUIHTZyJWeoanWCcbJzoyn?=
 =?us-ascii?Q?gaqbFqJlVGgjkynsc5cZg/RAJCM5S4tK4xAH8aQ2b3qpUpFcctA/hX7ddlOD?=
 =?us-ascii?Q?sR3GzZp4mF4C+NJQpbzG0AfbBJ8fDGKzB76ApnyWY/k/1RyR7wTjxhxwLiXd?=
 =?us-ascii?Q?4M97elgSii6S9MTUC7dBkj5UvMXaIMbGvoS3OL7EoNkYBRJSh7LFSiFOCYCi?=
 =?us-ascii?Q?E1xfS31Zd2nwiK/gp3ZFPXhN2x5foDJlpGlO5BPejiECYigLapFPsL0PdQbM?=
 =?us-ascii?Q?ROkgwSCmeddKP8mAhiGokvb4BgNXrx73GQMYhy0XOR1FD4/0gbpeo0cE0WOt?=
 =?us-ascii?Q?Xv4tCfR/A2IA9o52FhZN8wJpRGJwpH/UrpV2EbcjsWTjsaNoxDmyoGXiAkaC?=
 =?us-ascii?Q?HnHXPattSL5vOSv+JOTwx6rKmUh84ZZ4hTDW?=
X-Forefront-Antispam-Report: CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(7416014)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2025 03:03:32.1576
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 269ed921-163f-4526-6fb9-08dd8ea614ee
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF000397B0.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6802
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_200342_245662_C1D5DDB6 
X-CRM114-Status: GOOD (  17.22  )
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

Add IOMMUFD_OBJ_HW_QUEUE with an iommufd_hw_queue structure, representing
a HW-accelerated queue type of IOMMU's physical queue that can be passed
through to a user space VM for direct hardware control, such as:
 - NVIDIA's Virtual Command Queue
 - AMD vIOMMU's Command Buffer, Event Log Buffer, and PPR Log Buffer

Introduce an allocator iommufd_hw_queue_alloc(). And add a pair of viommu
ops for iommufd to forward user space ioctls to IOMMU drivers.

Given that the first user of this HW QUEUE (tegra241-cmdqv) will need to
ensure the queue memory to be physically contiguous, add a flag property
in iommufd_viommu_ops and IOMMUFD_VIOMMU_FLAG_HW_QUEUE_READS_PA to allow
driver to flag it so that the core will validate the physical pages of a
given guest queue.

Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>
Reviewed-by: Pranjal Shrivastava <praan@google.com>
Reviewed-by: Vasant Hegde <vasant.hegde@amd.com>
Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
---
 include/linux/iommufd.h | 45 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/include/linux/iommufd.h b/include/linux/iommufd.h
index f6f333eaaae3..0b5bea7286b8 100644
--- a/include/linux/iommufd.h
+++ b/include/linux/iommufd.h
@@ -37,6 +37,7 @@ enum iommufd_object_type {
 	IOMMUFD_OBJ_VIOMMU,
 	IOMMUFD_OBJ_VDEVICE,
 	IOMMUFD_OBJ_VEVENTQ,
+	IOMMUFD_OBJ_HW_QUEUE,
 #ifdef CONFIG_IOMMUFD_TEST
 	IOMMUFD_OBJ_SELFTEST,
 #endif
@@ -112,6 +113,18 @@ struct iommufd_vdevice {
 	u64 id; /* per-vIOMMU virtual ID */
 };
 
+struct iommufd_hw_queue {
+	struct iommufd_object obj;
+	struct iommufd_ctx *ictx;
+	struct iommufd_viommu *viommu;
+	u64 base_addr; /* in guest physical address space */
+	size_t length;
+};
+
+enum iommufd_viommu_flags {
+	IOMMUFD_VIOMMU_FLAG_HW_QUEUE_READS_PA = 1 << 0,
+};
+
 /**
  * struct iommufd_viommu_ops - vIOMMU specific operations
  * @destroy: Clean up all driver-specific parts of an iommufd_viommu. The memory
@@ -137,8 +150,18 @@ struct iommufd_vdevice {
  * @vdevice_destroy: Clean up all driver-specific parts of an iommufd_vdevice.
  *                   The memory of the vDEVICE will be free-ed by iommufd core
  *                   after calling this op
+ * @hw_queue_alloc: Allocate a HW QUEUE object for a HW-accelerated queue given
+ *                  the @type (must be defined in include/uapi/linux/iommufd.h)
+ *                  for the @viommu. @index carries the logical HW QUEUE ID per
+ *                  @viommu in a guest VM, for a multi-queue case; @addr carries
+ *                  the guest physical base address of the queue memory; @length
+ *                  carries the size of the queue
+ * @hw_queue_destroy: Clean up all driver-specific parts of an iommufd_hw_queue.
+ *                    The memory of the HW QUEUE will be free-ed by iommufd core
+ *                    after calling this op
  */
 struct iommufd_viommu_ops {
+	u32 flags;
 	void (*destroy)(struct iommufd_viommu *viommu);
 	struct iommu_domain *(*alloc_domain_nested)(
 		struct iommufd_viommu *viommu, u32 flags,
@@ -149,6 +172,10 @@ struct iommufd_viommu_ops {
 						 struct device *dev,
 						 u64 virt_id);
 	void (*vdevice_destroy)(struct iommufd_vdevice *vdev);
+	struct iommufd_hw_queue *(*hw_queue_alloc)(
+		struct iommufd_viommu *viommu, unsigned int type, u32 index,
+		u64 base_addr, size_t length);
+	void (*hw_queue_destroy)(struct iommufd_hw_queue *hw_queue);
 };
 
 #if IS_ENABLED(CONFIG_IOMMUFD)
@@ -292,6 +319,24 @@ static inline int iommufd_viommu_report_event(struct iommufd_viommu *viommu,
 		ret;                                                           \
 	})
 
+#define iommufd_hw_queue_alloc(viommu, drv_struct, member)                     \
+	({                                                                     \
+		drv_struct *ret;                                               \
+									       \
+		static_assert(__same_type(struct iommufd_viommu, *viommu));    \
+		static_assert(__same_type(struct iommufd_hw_queue,             \
+					  ((drv_struct *)NULL)->member));      \
+		static_assert(offsetof(drv_struct, member.obj) == 0);          \
+		ret = (drv_struct *)_iommufd_object_alloc(                     \
+			viommu->ictx, sizeof(drv_struct),                      \
+			IOMMUFD_OBJ_HW_QUEUE);                                 \
+		if (!IS_ERR(ret)) {                                            \
+			ret->member.viommu = viommu;                           \
+			ret->member.ictx = viommu->ictx;                       \
+		}                                                              \
+		ret;                                                           \
+	})
+
 /* Helper for IOMMU driver to destroy structures created by allocators above */
 #define iommufd_struct_destroy(drv_struct, member)                             \
 	({                                                                     \
-- 
2.43.0


