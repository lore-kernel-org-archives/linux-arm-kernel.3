Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1A3DC3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 03:48:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DtZ2mFoQ9hZw+sCYX1rCAZ+SM5r81951jUIc5O1KorE=; b=EyE0+TkB2elmDNzxGGwhXOIqgj
	WesKMh2h81M5Rzil2u9PRC7hQsEmesZ+u39frBcJcqHgQ+MyxUFvUwYcHX6rY+0s5iJWr6xveC9QU
	Gx0mqUs2KwYGann3vANGFvcFcXuxwa29vZyOxeXh+w6Ty94+p+IkOtKY8Swz3LVIIN4fDbClTrkKq
	mW6145ihyNBKBmB5Rcy3ZJ7FBZjIfZEXfxFC66jKG25lIUw035+WWG2LMdRlGVfIVfOWVieGWCf+b
	ilOOZ2C9QF2ZgmffAaNPCSxqPjP70X0a9hYgQGs1nCNFklXbcq3F60F9+4zDjmcQwoaA9E4kNy2XN
	FYP1TSzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDEic-00000002Oqc-05lr;
	Fri, 09 May 2025 03:48:14 +0000
Received: from mail-mw2nam10on20628.outbound.protection.outlook.com ([2a01:111:f403:2412::628] helo=NAM10-MW2-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDE1s-00000002Iwc-2a4T
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 May 2025 03:04:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yqJ7hZDyKw+spgbBwvkVPj2ElI/Vt4Do2kMDfdGJxr5A5snD4cjjsnea/ET0g9BA2TfJ3Rca3O76YdqwsPnHs9q21YbS7D+M8Jiw1jBtHhWUuxRZlWQCzlFhyGuz2/JE6CrXb3zsxdDWVcAixUJ9kwRfGJyp97YBQ3w2b9+SbUuVr8811rB9jk2xV9MuFVvT1uHq7L/b2lBkmWP8mCtGcKNsmHNu6PEjgSrC11uoM8kxaFaMF0sJsHBTO6QSgM0BReig4YTrbzev3TvoWAEP1EAbgA1i7zWm5jmncuzWoaK4L8adPPXrCiDcArWkf0lpXjSPDxPkqGaYCJGCwLeuhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DtZ2mFoQ9hZw+sCYX1rCAZ+SM5r81951jUIc5O1KorE=;
 b=YbgrH8AHhpVXN04Qdfg84NPfP2khtmMdQ3ZavW165rDJKjFLGyQqYqmO/9SKvV/28uwcSQd/Zh+hwvoiJmXYl/HnLQmzoFFPgW7UYAiNhHsene+sqsn+Brym0CPolVqjeYMVV5nls/WurvPx3IxeKM66n0OqlTRE/8vxT720q/9Dn5AIJ2fDoPDscxKrFM2dg+c1NH84MvUziLUV9fKaUe/AK0w0ZQ66FiGdRp+jHY052zA2/0NzaByqh51mM5nMz4Al8dRomDdxzXiQG+wZ8slHoMwgwBM1Ykams1tVprPDJgcjGRSF42CRtd9WwsyCfSZcSmoKrj9G7CNrno+waw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DtZ2mFoQ9hZw+sCYX1rCAZ+SM5r81951jUIc5O1KorE=;
 b=q3LmxetLNp45vd4fiI40e5pjTunv3F6LweNYu4KDdHf37CiJ35/uGFqP/gqplF4ICg4FWxtJBV/Oz+sGzp41MT12nEWz+X0uDshHWBt6jdX3aQXU56bAgLycAKzA4iI0qVYx3HhjWHOjta9OJ4HXM+fhhp001oMUhMJLLMwiKl/01TSHDq6LY6luZXnKT/p6653aB86+MsoG1tXs4ou0PEXO/H6f7RIGYzR+9HACfhXDDsxnIMye8R7/Yr49bShDMsACnS2Ktw4Zr4mYkl1x89BLOASHIwXCVfxT1p6FS6wjcT8Pl/ozm0MFQWryqGSX4aG6pKK3ObTecPWD0z6OZw==
Received: from SN7P220CA0007.NAMP220.PROD.OUTLOOK.COM (2603:10b6:806:123::12)
 by SA0PR12MB7461.namprd12.prod.outlook.com (2603:10b6:806:24b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.21; Fri, 9 May
 2025 03:03:57 +0000
Received: from SN1PEPF000397AE.namprd05.prod.outlook.com
 (2603:10b6:806:123:cafe::db) by SN7P220CA0007.outlook.office365.com
 (2603:10b6:806:123::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8699.29 via Frontend Transport; Fri,
 9 May 2025 03:03:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 SN1PEPF000397AE.mail.protection.outlook.com (10.167.248.52) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8722.18 via Frontend Transport; Fri, 9 May 2025 03:03:57 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 8 May 2025
 20:03:47 -0700
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 8 May 2025 20:03:47 -0700
Received: from Asurada-Nvidia.nvidia.com (10.127.8.14) by mail.nvidia.com
 (10.126.190.182) with Microsoft SMTP Server id 15.2.1544.14 via Frontend
 Transport; Thu, 8 May 2025 20:03:45 -0700
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
Subject: [PATCH v4 21/23] iommu/tegra241-cmdqv: Do not statically map LVCMDQs
Date: Thu, 8 May 2025 20:02:42 -0700
Message-ID: <80d41b740635b40dd0f9ed4279dc1cdeb3c8942c.1746757630.git.nicolinc@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1746757630.git.nicolinc@nvidia.com>
References: <cover.1746757630.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000397AE:EE_|SA0PR12MB7461:EE_
X-MS-Office365-Filtering-Correlation-Id: c5998a92-2205-4dc4-d8a5-08dd8ea623de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|82310400026|7416014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?202ETSjcH2gfVCUgOCPEZfdKZ/EvhJYTh/42eNuyyI3bc5lFZsI/nM5g/o/+?=
 =?us-ascii?Q?8EgX2UVUntgFGVK/CYfKyvGE2Z3/f//WULqe0UdZdn2fVV20KzLomKEuCYIG?=
 =?us-ascii?Q?4mWzOFEBtjIVhxRm07Ads9lG7jtiZXjyTjSnEnTlgcDRLlsEAD7xSMNwWuTN?=
 =?us-ascii?Q?ifEWq3Y+VO5jEwlvHxQ07QIlgcmTvxhpk6BTUIjFUp2lsYCEbz9TXwQsFDOX?=
 =?us-ascii?Q?HFOw1DPADvN8OFq/Dskhn0p7vGz3RjzZ2wTEUvkCdSyaRz1JzvGlKn/I9YaZ?=
 =?us-ascii?Q?GBlra2RkEW7WCnvA85j9XuFl+FQtJEVwyUzaOoIhrM9rXyoZnmByw61X/lc4?=
 =?us-ascii?Q?yo/YktNowLlKqYhjHleXALzKgYNtyOuINlnbbAKgVHhNIZTNQPoi0eKN6T99?=
 =?us-ascii?Q?ZoXsxDRy2ljwkhse1nrNRnJlsgh689biCQ7tcly5V6/GdkVb99jZ5cQLQUKR?=
 =?us-ascii?Q?PbyAJZGNKzdl3Xpwiksvya483PwlPLTooVWlt2jHE7RzQ1tK/TFwsUWMs/Do?=
 =?us-ascii?Q?5H3jAWu++1xdBmy1tfAf/OOnE++h3GCEDLo6DXpK/+WuWrcNO31y8hVMeBst?=
 =?us-ascii?Q?q0qT2OZ0hveXrGI32q6LCUJD6ar30CnavzOLHcp4/5qCgpqMGrU96UvkDRv0?=
 =?us-ascii?Q?r0GpluKjJrrzk032+bcFO9h+gtJq0aI6KbRXq/zZF6mG114s7HEoBhZ2ZntR?=
 =?us-ascii?Q?gnq+lyNXQxaYE9C41uVy0GhDbIKu6QnzATLlCJxRGJX+BsiQSemR4YFmuZIS?=
 =?us-ascii?Q?glPYVGaAS2t+d/GA/5tWMXnx7ULMEDP9gOTrR/Fj6bIGw0zoM6/aPBEqVmPG?=
 =?us-ascii?Q?BtlyuUQmqUH3lmQaOvoQHLmpdPgrKpxhzMSd9ZynKU2jQMYSv0mxiPEJI17a?=
 =?us-ascii?Q?/gfVCBAvqZQqM2MJ70K146V2k/Qux5SwzBn4cIUm9skl39OZhQiiEtlLW32K?=
 =?us-ascii?Q?AstxFged5mSadYBo/SnqbNmW7bHdMofls52lnEkLmA/SJhABjoRh9rihO3S7?=
 =?us-ascii?Q?P+nMmj94StgghWgT9ReBUI5q0nLW/lu4du3UHaGsC0yfzrdsvYWtZd2g2wYd?=
 =?us-ascii?Q?X36UilcL6dHn6XOv2GqXof8ZY5j5nM70+awyET5sbXJAI2dj2pyoR3GEqzQs?=
 =?us-ascii?Q?U2Khmxc2M4dwQehXqKkinPuU5eQ5/rHzQhIKSUCM6WCoc2EtyCt7scG/N2kc?=
 =?us-ascii?Q?OEZ/nhoxtw4KMqBGzdmRYkkjgPZd3atrNuCr6TyEZbbah/QFHuetsfc3+H3S?=
 =?us-ascii?Q?DTODDKIUNX476K6GY5O6oYKYwqx7ktWbZZMNgOOIeWlVcVz+eR9wwxdED273?=
 =?us-ascii?Q?K++dOaixAGTbqxnUl6bwltyqQxUiYzRjuBBUpbnqZbAfTvz37gygtXicnJzA?=
 =?us-ascii?Q?fVC/EODmWOuE9ZXWI8QziO0Uy7ar63Y3BlEJN+sl/oZJASDdf/e2USS5CNjp?=
 =?us-ascii?Q?I1dHGIkZ6e+iqy/T1l/RW7ex/l3sl674mOpN1ocvI0p8VkX9KgMtcnfw3agW?=
 =?us-ascii?Q?oy/Kw1akW2zIP+DxpwIJfTq3rqOl8goeezMs?=
X-Forefront-Antispam-Report: CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(82310400026)(7416014)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2025 03:03:57.2682
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c5998a92-2205-4dc4-d8a5-08dd8ea623de
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF000397AE.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB7461
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_200404_652457_9DCDA696 
X-CRM114-Status: GOOD (  15.65  )
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

To simplify the mappings from global VCMDQs to VINTFs' LVCMDQs, the design
chose to do static allocations and mappings in the global reset function.

However, with the user-owned VINTF support, it exposes a security concern:
if user space VM only wants one LVCMDQ for a VINTF, statically mapping two
or more LVCMDQs creates a hidden VCMDQ that user space could DoS attack by
writing random stuff to overwhelm the kernel with unhandleable IRQs.

Thus, to support the user-owned VINTF feature, a LVCMDQ mapping has to be
done dynamically.

HW allows pre-assigning global VCMDQs in the CMDQ_ALLOC registers, without
finalizing the mappings by keeping CMDQV_CMDQ_ALLOCATED=0. So, add a pair
of map/unmap helper that simply sets/clears that bit.

Delay the LVCMDQ mappings to tegra241_vintf_hw_init(), and the unmappings
to tegra241_vintf_hw_deinit().

However, the dynamic LVCMDQ mapping/unmapping can complicate the timing of
calling tegra241_vcmdq_hw_init/deinit(), which write LVCMDQ address space,
i.e. requiring LVCMDQ to be mapped. Highlight that with a note to the top
of either of them.

Acked-by: Pranjal Shrivastava <praan@google.com>
Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
---
 .../iommu/arm/arm-smmu-v3/tegra241-cmdqv.c    | 37 +++++++++++++++++--
 1 file changed, 33 insertions(+), 4 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c b/drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c
index 8d418c131b1b..869c90b660c1 100644
--- a/drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c
+++ b/drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c
@@ -351,6 +351,7 @@ tegra241_cmdqv_get_cmdq(struct arm_smmu_device *smmu,
 
 /* HW Reset Functions */
 
+/* This function is for LVCMDQ, so @vcmdq must not be unmapped yet */
 static void tegra241_vcmdq_hw_deinit(struct tegra241_vcmdq *vcmdq)
 {
 	char header[64], *h = lvcmdq_error_header(vcmdq, header, 64);
@@ -379,6 +380,7 @@ static void tegra241_vcmdq_hw_deinit(struct tegra241_vcmdq *vcmdq)
 	dev_dbg(vcmdq->cmdqv->dev, "%sdeinited\n", h);
 }
 
+/* This function is for LVCMDQ, so @vcmdq must be mapped prior */
 static int tegra241_vcmdq_hw_init(struct tegra241_vcmdq *vcmdq)
 {
 	char header[64], *h = lvcmdq_error_header(vcmdq, header, 64);
@@ -404,16 +406,42 @@ static int tegra241_vcmdq_hw_init(struct tegra241_vcmdq *vcmdq)
 	return 0;
 }
 
+/* Unmap a global VCMDQ from the pre-assigned LVCMDQ */
+static void tegra241_vcmdq_unmap_lvcmdq(struct tegra241_vcmdq *vcmdq)
+{
+	u32 regval = readl(REG_CMDQV(vcmdq->cmdqv, CMDQ_ALLOC(vcmdq->idx)));
+	char header[64], *h = lvcmdq_error_header(vcmdq, header, 64);
+
+	writel(regval & ~CMDQV_CMDQ_ALLOCATED,
+	       REG_CMDQV(vcmdq->cmdqv, CMDQ_ALLOC(vcmdq->idx)));
+	dev_dbg(vcmdq->cmdqv->dev, "%sunmapped\n", h);
+}
+
 static void tegra241_vintf_hw_deinit(struct tegra241_vintf *vintf)
 {
-	u16 lidx;
+	u16 lidx = vintf->cmdqv->num_lvcmdqs_per_vintf;
 
-	for (lidx = 0; lidx < vintf->cmdqv->num_lvcmdqs_per_vintf; lidx++)
-		if (vintf->lvcmdqs && vintf->lvcmdqs[lidx])
+	/* HW requires to unmap LVCMDQs in descending order */
+	while (lidx--) {
+		if (vintf->lvcmdqs && vintf->lvcmdqs[lidx]) {
 			tegra241_vcmdq_hw_deinit(vintf->lvcmdqs[lidx]);
+			tegra241_vcmdq_unmap_lvcmdq(vintf->lvcmdqs[lidx]);
+		}
+	}
 	vintf_write_config(vintf, 0);
 }
 
+/* Map a global VCMDQ to the pre-assigned LVCMDQ */
+static void tegra241_vcmdq_map_lvcmdq(struct tegra241_vcmdq *vcmdq)
+{
+	u32 regval = readl(REG_CMDQV(vcmdq->cmdqv, CMDQ_ALLOC(vcmdq->idx)));
+	char header[64], *h = lvcmdq_error_header(vcmdq, header, 64);
+
+	writel(regval | CMDQV_CMDQ_ALLOCATED,
+	       REG_CMDQV(vcmdq->cmdqv, CMDQ_ALLOC(vcmdq->idx)));
+	dev_dbg(vcmdq->cmdqv->dev, "%smapped\n", h);
+}
+
 static int tegra241_vintf_hw_init(struct tegra241_vintf *vintf, bool hyp_own)
 {
 	u32 regval;
@@ -441,8 +469,10 @@ static int tegra241_vintf_hw_init(struct tegra241_vintf *vintf, bool hyp_own)
 	 */
 	vintf->hyp_own = !!(VINTF_HYP_OWN & readl(REG_VINTF(vintf, CONFIG)));
 
+	/* HW requires to map LVCMDQs in ascending order */
 	for (lidx = 0; lidx < vintf->cmdqv->num_lvcmdqs_per_vintf; lidx++) {
 		if (vintf->lvcmdqs && vintf->lvcmdqs[lidx]) {
+			tegra241_vcmdq_map_lvcmdq(vintf->lvcmdqs[lidx]);
 			ret = tegra241_vcmdq_hw_init(vintf->lvcmdqs[lidx]);
 			if (ret) {
 				tegra241_vintf_hw_deinit(vintf);
@@ -476,7 +506,6 @@ static int tegra241_cmdqv_hw_reset(struct arm_smmu_device *smmu)
 		for (lidx = 0; lidx < cmdqv->num_lvcmdqs_per_vintf; lidx++) {
 			regval  = FIELD_PREP(CMDQV_CMDQ_ALLOC_VINTF, idx);
 			regval |= FIELD_PREP(CMDQV_CMDQ_ALLOC_LVCMDQ, lidx);
-			regval |= CMDQV_CMDQ_ALLOCATED;
 			writel_relaxed(regval,
 				       REG_CMDQV(cmdqv, CMDQ_ALLOC(qidx++)));
 		}
-- 
2.43.0


