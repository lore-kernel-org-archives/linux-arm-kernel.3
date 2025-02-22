Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A08E4C021B2
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 22 Feb 2025 15:57:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HUNM+8Bv5Nfzbqa7qDebAIwRc+J2TKyqV+0Ykxi7QjI=; b=WdOFmWjyLnfwyW91lzbIzYYfhB
	/ZCcC7aPR8dEJ9qIDtM5FWkVCIV8rJphOM+B9p9nlT32JidTXp6Az1ENGqzjNOosnaSLckYpJrmH6
	lkGOjpyuxUiW7UI1h3wv/uMi2xKpTAoiMXrsPZ9ZT3kgfg44cPGMT0lN35Wyi5ZkmEjsxe+6Zb9bk
	5GTqPPDTNumweJPjZt5ifx74n9WK7H1bHyAFAS9Te6q/5+0FyF21oSfNkXvLBxBqqs8i6LtDAl1ko
	4T69Y4eDVP6tpJu/mMtGzgf9i0vgluG1u00x1wAiiYT1aGq5NG2Zaha8crimOz1tZkfJsyz+d7Yx4
	KmSF72DA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlrsp-00000008J3d-0Xz7;
	Sat, 22 Feb 2025 15:57:39 +0000
Received: from mail-mw2nam10on2062c.outbound.protection.outlook.com ([2a01:111:f403:2412::62c] helo=NAM10-MW2-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlrps-00000008IB0-3d7K
	for linux-arm-kernel@lists.infradead.org;
	Sat, 22 Feb 2025 15:54:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TmxPLJkjA9NafZBACh6vdpXnNJhuSg2lI/aKCcPDKElJ2pbf8zt9yrjzwTRgrGZ1htmmj8E3mfhEsUvbj8lH0lU6tYb9mzr7dz/hO2dHe2LRwdBMefEVho4Z1N6W2G5ZoORG759Yjdp3p3dIWxjEJxRdOrv5qHEzxhQ1N/FMsU2exOd/NvUpPn7v2YFbfMOLF/kCxZX8iVQ/Nx9CdZuSSomerHa2LFjDJgl5LRXBCT0aidy4800Gvunai8S6NRs38PUqsAOakq3k1ePE4AYlSQ7OMolPeML0qe6/bJIwyo8LioIzn6RvtkJf74kU46LEcXbW6zFbWXo1mToQDqm98Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HUNM+8Bv5Nfzbqa7qDebAIwRc+J2TKyqV+0Ykxi7QjI=;
 b=mIhad3JB2ANzoh+jf0Ri4A/jJxYyu43gp/2b1p/f1z6Tz/IQmkVAw3EfanjHPqreKDf7ZVywXf6dNbJoxRdQ33sXpM6aCdZJub++GVV1vIfHHvJ1kO8pDtBk3IaG7MljgRdCaBADgvk7dNGamrQg0TLXkFgQJQFMgACWIA4OSgde4YdCeYESULy9jyQq5o3GbAalO+lsLThkM3GCSRqMhKUc6JBg3a4tW4rInHrzn8HvkgBtS8KvphdD4fcSKbiNKd/55keqsbXaPzX3ztdj35JNpPeIeWrg8JLuIyl46F8XvWIUcL/Vxq1wOp+Uo54mTJmTwoIimOrDB2SMD869tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=intel.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HUNM+8Bv5Nfzbqa7qDebAIwRc+J2TKyqV+0Ykxi7QjI=;
 b=lZUu0XuX+sUo6xzzfoGFHGBZgkSq91ia+WHRFWT/Vq/dSQMa0wV56pDjLrwYkyXI6CELAnVsGxUhfuP7CrJxbig6Gml5QKYWXsahaFIKIoiFm6oilx7+E1Y6UHEQdm+RRrFTf2+pj8NPJMQVdEsw9mXF73EJZoNNfdf2xbZlqMeiaJ3NpnzrI707nxjY7G3lgitqGZzsSYgxNkwR8R1s3nMWhu7Z7iCR5MvvTuMiU2LjYMyTyxxgUNApUuKEwWu1B+r3aiLFQb/YS0JgqNvuiZk69SnzybukmtUgSrXKjcgcLKhKuYZDhrlbR8i03zFMrFSbZWlaTKfsR8vLatC9ww==
Received: from DM6PR17CA0010.namprd17.prod.outlook.com (2603:10b6:5:1b3::23)
 by SA1PR12MB7247.namprd12.prod.outlook.com (2603:10b6:806:2bb::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.15; Sat, 22 Feb
 2025 15:54:25 +0000
Received: from DS2PEPF0000343B.namprd02.prod.outlook.com
 (2603:10b6:5:1b3:cafe::f9) by DM6PR17CA0010.outlook.office365.com
 (2603:10b6:5:1b3::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8466.17 via Frontend Transport; Sat,
 22 Feb 2025 15:54:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 DS2PEPF0000343B.mail.protection.outlook.com (10.167.18.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8466.11 via Frontend Transport; Sat, 22 Feb 2025 15:54:24 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Sat, 22 Feb
 2025 07:54:16 -0800
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Sat, 22 Feb
 2025 07:54:16 -0800
Received: from Asurada-Nvidia.nvidia.com (10.127.8.10) by mail.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server id 15.2.1544.14 via Frontend
 Transport; Sat, 22 Feb 2025 07:54:14 -0800
From: Nicolin Chen <nicolinc@nvidia.com>
To: <jgg@nvidia.com>, <kevin.tian@intel.com>, <corbet@lwn.net>,
	<will@kernel.org>
CC: <joro@8bytes.org>, <suravee.suthikulpanit@amd.com>,
	<robin.murphy@arm.com>, <dwmw2@infradead.org>, <baolu.lu@linux.intel.com>,
	<shuah@kernel.org>, <linux-kernel@vger.kernel.org>, <iommu@lists.linux.dev>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kselftest@vger.kernel.org>,
	<linux-doc@vger.kernel.org>, <eric.auger@redhat.com>,
	<jean-philippe@linaro.org>, <mdf@kernel.org>, <mshavit@google.com>,
	<shameerali.kolothum.thodi@huawei.com>, <smostafa@google.com>,
	<ddutile@redhat.com>, <yi.l.liu@intel.com>, <praan@google.com>,
	<patches@lists.linux.dev>
Subject: [PATCH v7 01/14] iommufd/fault: Move two fault functions out of the header
Date: Sat, 22 Feb 2025 07:53:58 -0800
Message-ID: <e87300713163c561580d79f08eb6a89762af4fde.1740238876.git.nicolinc@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1740238876.git.nicolinc@nvidia.com>
References: <cover.1740238876.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343B:EE_|SA1PR12MB7247:EE_
X-MS-Office365-Filtering-Correlation-Id: 8191abdb-da61-4281-507f-08dd53592e53
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?M6PSmU9xp3LgCxIuV17O5CcMtn92KB8jfaOtsd0ePq9o/9CGHv5eBoV0g8Wj?=
 =?us-ascii?Q?lU4niPDCaPtIHSleFZkh8qqf+LCF2yubW/S6+1TK4t9XEHd1rwmsmJxHCDzh?=
 =?us-ascii?Q?axYCHvsvI/zg+8giDa5mt0hwWgu8GzVQqZ7t0OEJRs++hxtbO2lAQnHKfzoD?=
 =?us-ascii?Q?Q10PeMcRryliHjAB1XUF++8rkzWebfVYcYgL4WXvmhBXrhNY6XKAHE4nxuu8?=
 =?us-ascii?Q?s/ylxyDHITHfxONvTRZb20qSS7erGxPVrnXvUJZ2msUHBmZuNLGd/napnWwO?=
 =?us-ascii?Q?1oeRPJtRNt9+EQE5VhmcufEU6GVfp1M6tc9T28lXlE5hPgYqyD6OLzqQ781d?=
 =?us-ascii?Q?bCeC7dwrma/z3EjR9cMmGV/vOMebbhb0oRL5GY6XS/ioapqX40fPFIYKc9gl?=
 =?us-ascii?Q?Qtp/mD6bSn2xPQgQxD4K4vdjBZ+Q1sJLqrvo4nF/JEfB1pY0L61Sz9IfHgbZ?=
 =?us-ascii?Q?nv1BYeKI+QfCW1I4mcE3zKh+byYaNes20TqFCOwWZS2NhNuMPVkQGz82k+7i?=
 =?us-ascii?Q?jZrMoSO/RopKAx5aq2pJryzz3USJKvol6MP4nfSC8Rn0xUlZvZNZbS8QsNPs?=
 =?us-ascii?Q?WK5cxUW0z5cKNUG12rktnrsVjpCBBkEKKJsb2Lj9u45kiYKynJKgIBE5AlIY?=
 =?us-ascii?Q?Y4wh6bgbrZ+qR3Bjm0+CWYphLGU8DZukr7dI2Tjbmp7LWvH5WBhqjMv83lvx?=
 =?us-ascii?Q?QG690zrZ92Ogoyt3g/FGcn4c2aloe6cWJf8YjhzgIriCnlLS2X3PAs+thNsB?=
 =?us-ascii?Q?V+ub6naLfceml0rCVLkp8JQo+qq1fG8UtxdoJJxDP2Nsv1RJIrpcJbEdITlN?=
 =?us-ascii?Q?iXPKuzmZPO23jjpIs2yYG0K+wGYVPpbIMB3RmTVZtoe8GEhLPsJ9fRVCMSyL?=
 =?us-ascii?Q?wAn1dxGCJDM1L/v2E9H5SvdVYav3P97KERvhxsQqzgoR1xQFGYd1sOJ3AIYh?=
 =?us-ascii?Q?e5g5XpKIh+aAm4KZLe1TB5mk9SE6ZmLEQvruauGqlyS2wewJw8+PIQzYwssN?=
 =?us-ascii?Q?cven6rfg7uuzGw5RZWz0KgoG8iW/wWRtqdwM0qIUxsACzUpZwHygtplVlkeA?=
 =?us-ascii?Q?8WYTncuKvRWuH26GIx7QYqcuIvGzNWaAqwHfbvBx6IuxMkJAv5/XGzps+yxb?=
 =?us-ascii?Q?OAPTvBbaMoKUSa/P/WYUp028nOpBpRo41H9fGu91lCdPVWJvYaIjXX9g61g7?=
 =?us-ascii?Q?OiojW/xV2gI4xpHCN/6g5e8jbVUfj9AOgEge9YY45Sp+iLHh6h331OmyB/b2?=
 =?us-ascii?Q?+obknTaiGfAWyyKKMgwz2CcsEKQKju/Zxg/7rJZl/f/CJd8OpYY0I0qL3NmO?=
 =?us-ascii?Q?cegMoO0/th/IrBtAag1GgLYGSOT5zj8KZu71fFcT1TQoF2mG8cmVZjyzoIBG?=
 =?us-ascii?Q?q6O5xgNLcD7Q+DxH+qFid7NPOTM9hTuF9bhDbh4FbGazyFRLRJCvKU+aOHTz?=
 =?us-ascii?Q?w2SD4qTjZ8Gb5cAMnH9JfZsG1DTv6K0/xi0z2B1+8pW2Wa/yf3sHE2TwUrR2?=
 =?us-ascii?Q?DnQz3mYJy01kIo0=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(7416014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2025 15:54:24.9478
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8191abdb-da61-4281-507f-08dd53592e53
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF0000343B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7247
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250222_075436_949093_A1E8844C 
X-CRM114-Status: GOOD (  12.84  )
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

There is no need to keep them in the header. The vEVENTQ version of these
two functions will turn out to be a different implementation and will not
share with this fault version. Thus, move them out of the header.

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Reviewed-by: Kevin Tian <kevin.tian@intel.com>
Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
---
 drivers/iommu/iommufd/iommufd_private.h | 25 -------------------------
 drivers/iommu/iommufd/fault.c           | 25 +++++++++++++++++++++++++
 2 files changed, 25 insertions(+), 25 deletions(-)

diff --git a/drivers/iommu/iommufd/iommufd_private.h b/drivers/iommu/iommufd/iommufd_private.h
index 246297452a44..1c58f5fe17b4 100644
--- a/drivers/iommu/iommufd/iommufd_private.h
+++ b/drivers/iommu/iommufd/iommufd_private.h
@@ -472,31 +472,6 @@ struct iommufd_fault {
 	struct wait_queue_head wait_queue;
 };
 
-/* Fetch the first node out of the fault->deliver list */
-static inline struct iopf_group *
-iommufd_fault_deliver_fetch(struct iommufd_fault *fault)
-{
-	struct list_head *list = &fault->deliver;
-	struct iopf_group *group = NULL;
-
-	spin_lock(&fault->lock);
-	if (!list_empty(list)) {
-		group = list_first_entry(list, struct iopf_group, node);
-		list_del(&group->node);
-	}
-	spin_unlock(&fault->lock);
-	return group;
-}
-
-/* Restore a node back to the head of the fault->deliver list */
-static inline void iommufd_fault_deliver_restore(struct iommufd_fault *fault,
-						 struct iopf_group *group)
-{
-	spin_lock(&fault->lock);
-	list_add(&group->node, &fault->deliver);
-	spin_unlock(&fault->lock);
-}
-
 struct iommufd_attach_handle {
 	struct iommu_attach_handle handle;
 	struct iommufd_device *idev;
diff --git a/drivers/iommu/iommufd/fault.c b/drivers/iommu/iommufd/fault.c
index c48d72c9668c..29e3a97c73c6 100644
--- a/drivers/iommu/iommufd/fault.c
+++ b/drivers/iommu/iommufd/fault.c
@@ -138,6 +138,31 @@ static void iommufd_compose_fault_message(struct iommu_fault *fault,
 	hwpt_fault->cookie = cookie;
 }
 
+/* Fetch the first node out of the fault->deliver list */
+static struct iopf_group *
+iommufd_fault_deliver_fetch(struct iommufd_fault *fault)
+{
+	struct list_head *list = &fault->deliver;
+	struct iopf_group *group = NULL;
+
+	spin_lock(&fault->lock);
+	if (!list_empty(list)) {
+		group = list_first_entry(list, struct iopf_group, node);
+		list_del(&group->node);
+	}
+	spin_unlock(&fault->lock);
+	return group;
+}
+
+/* Restore a node back to the head of the fault->deliver list */
+static void iommufd_fault_deliver_restore(struct iommufd_fault *fault,
+					  struct iopf_group *group)
+{
+	spin_lock(&fault->lock);
+	list_add(&group->node, &fault->deliver);
+	spin_unlock(&fault->lock);
+}
+
 static ssize_t iommufd_fault_fops_read(struct file *filep, char __user *buf,
 				       size_t count, loff_t *ppos)
 {
-- 
2.43.0


