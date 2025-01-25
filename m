Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8181C02181
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Jan 2025 00:49:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6kBvxlHxD0rht59Ejz1JUb2WPgVPcywQt7tRWPoQiy8=; b=z3XCQnuB0kfu+y7LokfNQ2oN5R
	91BaWpbnncy4ll6MCNJppzz0BVnkXuku5e4MPD1jVm2qMGh16H4457HZiSAaD9RfwrZezGOhGLsiS
	rW2epNihbOkP49VNVYl6IAIdSgwMQ8rQ0lSKfj3IKbl7a5cDTZrMEkUn9FhQq/Nf02LyHzkjYjJLR
	FznEjlvR0GGOOYfDCmQ9CiPypEF0LvCqRgEWPnTERFBuDZL6OJIEuQjap03mWso4/sFYRf9ABAv5s
	qXYrOYmWsBpKkyBopaGskqq/LY5xXsQbya6uGp2Z6VmqpNHIId+tyiX0ME+WdUgLKA8PJ/4eZYE7E
	1TsSvQ0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tbUMk-0000000Fpq9-1YHb;
	Sat, 25 Jan 2025 00:49:38 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tbU5S-0000000Fnav-1z83
	for linux-arm-kernel@bombadil.infradead.org;
	Sat, 25 Jan 2025 00:31:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=6kBvxlHxD0rht59Ejz1JUb2WPgVPcywQt7tRWPoQiy8=; b=NvTxk2+NNvmVZccIMh2Gtu1Rti
	a3bacP4+ZzvTgOuaUijiP1PSm1n3HPtruK/m/awM5Elm1joy85q5Yu7XpRGTyzPr4S9zLQbUCGIXU
	icF1CIKoq2NzEvz8ggZwKFaf3hAFXdOgKwNKjXHEyIkUFpTWVALITyzSW4mL37PPra/uruJ72VVcq
	Dk6+vTrOf5t7cQ6/aJyHJzg/mtgBgHMqWHDdJ6llBCDnTDU4Z9HzYjfDQp4/7Iukq2lEtQPRsIw1K
	McW9z+KrnH9T8lSW2luPUG7DerftMOWtbixpP8Ev4GqBOJvNoWzawwdhbpMvn+bZKur9hfhAq5RiU
	h6pfWETQ==;
Received: from mail-mw2nam12on20612.outbound.protection.outlook.com ([2a01:111:f403:200a::612] helo=NAM12-MW2-obe.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tbU54-0000000E5pE-0TOJ
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Jan 2025 00:31:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WUKRQTMAPxSHmh81axheBiItvCzV4Xs7I0xsG6eXWbX8at3EJHr5eI678m8ldEc9QhSHcnGOGol1G5YbKXYrzhz8x9aYTGQmMhH+52w12UM8bK625/R+S/CdD2VwOr1QDUh4LgBscvvOckadCBv0LlEA1/8Jk2jFeDvGj0TFonNNYrq1ZqQ9FmvHgzL2kk+0dFQrKFrkjoy19u3UiJQSduB0uUEPjO120+Uo0po1BHKJ7dBDEdyvG4yJoZX1UsEC7uLYYKg5zDhtvxXvT+HQIArT7h13KvfA28/p6rrXLzFnzoUYvsfxJ0EHVa18yH8QyTesHOyULx1h51OYqAgotA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6kBvxlHxD0rht59Ejz1JUb2WPgVPcywQt7tRWPoQiy8=;
 b=xY8m3Bq6zbFQhXjB6i5mUhcYdCVn2EId5RQGhUUnShSnXzhwpikYXcxZIYmVsxZSoDOo0aOb2i1AuWg+J+zl0Qu6MAexIXXlzLTMBQ6JYx1kajdt4BKLA6V/bhs9wwMQ17HJLMEAgYF41mI8CQXT3nW0kX0Deo9q8QZQ2PRZ+O151+bgPPYKd5Nxa2pRDsivY7mEWzRaS+fNH4bwPoJVYMjAbzQSjWYkKbK2FhIEuVL/giGFU9jOfY8tZbXpejcTmsK5emSwRyIbC3c/MpzA+rA7/bege4gjgo4uTTrXYCF4NhlPNHoQYfIUt8BuZGCAVqQsrn6tso4ZvSwNIzkUug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6kBvxlHxD0rht59Ejz1JUb2WPgVPcywQt7tRWPoQiy8=;
 b=NGHn5cKs7pI9uJKqiYtVn49C1/mHjzmoP8W3DrBi9QPy0zSlEl86RPvDbQ8zCVdU0u0Bog1rgcXTYvgGI4+2rJTUaiUb41vomYhrgwvvdEL3TdtGj8sOmFCsJicOHj58P6PMV/mWXnIHDiJWbmo7VowsWQPzrYer3e7INoom+VJmMtXvE9IiXbu0fmsiie85CecUNdR4BZsYTGkQeLyKg9mAr+ybxr6R6qtOQ2u3uRi14uK5RTVFNIkRVq00U0Wg0NM/3sRP1dsoujUjFSSJHeDxyiOsCVdUcHuINfRj4K+3xGcinH1WY7pKXezYbhOxI4JI137Xta+YvcswaTkk6w==
Received: from MW4PR04CA0033.namprd04.prod.outlook.com (2603:10b6:303:6a::8)
 by DS7PR12MB5983.namprd12.prod.outlook.com (2603:10b6:8:7e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.21; Sat, 25 Jan
 2025 00:31:08 +0000
Received: from SJ5PEPF00000206.namprd05.prod.outlook.com
 (2603:10b6:303:6a:cafe::df) by MW4PR04CA0033.outlook.office365.com
 (2603:10b6:303:6a::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8377.19 via Frontend Transport; Sat,
 25 Jan 2025 00:31:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 SJ5PEPF00000206.mail.protection.outlook.com (10.167.244.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8377.8 via Frontend Transport; Sat, 25 Jan 2025 00:31:07 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 24 Jan
 2025 16:30:54 -0800
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 24 Jan 2025 16:30:53 -0800
Received: from Asurada-Nvidia.nvidia.com (10.127.8.12) by mail.nvidia.com
 (10.126.190.180) with Microsoft SMTP Server id 15.2.1544.14 via Frontend
 Transport; Fri, 24 Jan 2025 16:30:52 -0800
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
	<ddutile@redhat.com>, <yi.l.liu@intel.com>, <patches@lists.linux.dev>
Subject: [PATCH v6 01/14] iommufd/fault: Move two fault functions out of the header
Date: Fri, 24 Jan 2025 16:30:30 -0800
Message-ID: <d47fb648e36a6a5f04e0d98d02fa71e47c4a77e8.1737754129.git.nicolinc@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1737754129.git.nicolinc@nvidia.com>
References: <cover.1737754129.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF00000206:EE_|DS7PR12MB5983:EE_
X-MS-Office365-Filtering-Correlation-Id: 83e46a2b-8f23-46e0-3579-08dd3cd78f44
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?bNhjurGHZktGPER9hWmHw8GBZa+tJyV1bWbsvrQWwSz1f5QzzYYBnhEMF2SY?=
 =?us-ascii?Q?y8F6zKktgvGtei8SPhFq1ysNyOLk56qbF41zyvgYvaavKR8UMZjMZI/dKhHH?=
 =?us-ascii?Q?cOWeg5eDHX9OgTmPNBdA+DaR7rKXJYXynW/HaxfHBokuBzUK+ONltSx4XBtN?=
 =?us-ascii?Q?HzI9/2PHGzz+8u/j0fwMtYbFXnizfk40762NPI5u9ESvfYolVxzgjP9X5WNb?=
 =?us-ascii?Q?q42r1HYKbwifBpMYG6aehVLxGGQosIVorhD9430Na3L3u28mXbBiLewgqFWq?=
 =?us-ascii?Q?ZgLPXj8bfaQhu7tTDG+VHk3XR8tAZ7TbZ3G6S3vgOM3RHNMUSZulg71LQljb?=
 =?us-ascii?Q?7eHkBN3Nqzv71HRc33zdhyivjHkPMb3y0ZDcqKI3n2/vMGPOhgO5b4kfxY7D?=
 =?us-ascii?Q?B6DHIwtmutAh8vLeHJcsdsXOYazwVAM2oJHa5GjF/kYS9xh8DEtTE9WquOcr?=
 =?us-ascii?Q?oh9YjRNP7xMQkilU2JH9cnxMZvcYk60vcjKXmZGWWkkUdQ7/rcl/6rHICh6B?=
 =?us-ascii?Q?o2YnDNYSn07h2xkeBr+5hrnklKG1QUVMiYe6XGARaYps1RWN7nXNYWYWmkKV?=
 =?us-ascii?Q?ZxDJ4HE3LJ+EAaYhvwQa2cd93PDE1cwFw63lPefTF1maHgFRITQzkVI+Di8F?=
 =?us-ascii?Q?/WIC1w5BbCTRdkTKL//WV7YLeWr0RgSnpo5VagEn+zI4pkYXhhzUpBRDMbi9?=
 =?us-ascii?Q?hl6V6ynWTo007mLgocvSxtUbx2K6ww9iJHmuMz57jLjabncus86bOaw2UPA/?=
 =?us-ascii?Q?Vip5qGbCyaj4CoJRyQEKUtzpmN+vGPNHffyNip6sWCWjOHwqpFf//Afq4ppg?=
 =?us-ascii?Q?TwJnIWHnJipQAP+CIk6Ne3pT/BTF+qHoADh1dcNdjcKbtiwYGbR0OFNRpXop?=
 =?us-ascii?Q?3knfgZtm8w/CBScjyKdqzcSVmbq5p4rTIJoiDrf1pScMWv6cE7h6xviLfyHM?=
 =?us-ascii?Q?7rGUgu0dAwS2NfEQ6PQBPkywiQG+OFkuuguLTOZubJW4wSi7WO6/a9Ek1qI3?=
 =?us-ascii?Q?loGoJDk0cRHgmc3RL/hm6w+teHNj0I135Hy66kiLaWFLdkebP/AqebEqxx8V?=
 =?us-ascii?Q?a7uH7EdoWca1AsfXjnkOsFtsFpcpGBxMoJGoVFr+T19jAa3hvSaxtS34vpXo?=
 =?us-ascii?Q?fC8bxGsNxokQ5i7zxdA2gK0wbm36oz/XcIXtkitDtVw5iFMzasuVILzuNi0S?=
 =?us-ascii?Q?JnAJ5/8XbWCJT/cevJBFsyuboLa+4JgxVmke+zSKSthUO149plfqLpP2EUKy?=
 =?us-ascii?Q?GOqG6rcQezAc1Ks72VASQ8zltZEEx6iF0VJwwVTcTcF2xDE62ZuOmlRGPR4P?=
 =?us-ascii?Q?y1HioO+xq3M5Oe9quVrljIUnqJM4aQhz/G3QZugNX6QtsjTXfFaw76g6Njmd?=
 =?us-ascii?Q?xw4o7hNiDNI4hLFabQ3KEKjZLSQxMxzZ9VvUAWUocsnfEuX2m7giwvtmGOO4?=
 =?us-ascii?Q?dyHAIlEjFUp1SlIbiy5oss9095RmImfJ2nEny/cbh+xQIc+gz484IaflCr9t?=
 =?us-ascii?Q?Ic8aFcMW2TjEEjg=3D?=
X-Forefront-Antispam-Report: CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2025 00:31:07.5413
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 83e46a2b-8f23-46e0-3579-08dd3cd78f44
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF00000206.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5983
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250125_003140_850528_576002AE 
X-CRM114-Status: GOOD (  13.88  )
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

Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
---
 drivers/iommu/iommufd/iommufd_private.h | 25 -------------------------
 drivers/iommu/iommufd/fault.c           | 25 +++++++++++++++++++++++++
 2 files changed, 25 insertions(+), 25 deletions(-)

diff --git a/drivers/iommu/iommufd/iommufd_private.h b/drivers/iommu/iommufd/iommufd_private.h
index 0b1bafc7fd99..034df9b256f4 100644
--- a/drivers/iommu/iommufd/iommufd_private.h
+++ b/drivers/iommu/iommufd/iommufd_private.h
@@ -451,31 +451,6 @@ struct iommufd_fault {
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
index d9a937450e55..e89d27bb9548 100644
--- a/drivers/iommu/iommufd/fault.c
+++ b/drivers/iommu/iommufd/fault.c
@@ -258,6 +258,31 @@ static void iommufd_compose_fault_message(struct iommu_fault *fault,
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


