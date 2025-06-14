Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CADD3C71135
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Jun 2025 07:01:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+5JCoVXo3rI46p+RcSpC0xkILX6eZK7K0tyZOd5uu6o=; b=UkO2H9+Cna3XwbSwtvlQkwaKYn
	tk/Us7WaD1R8BYqKaQ3pVQTHz6phJWFJl62zdSERtmbs/ELkEFe2bRxNKfJ/x8Y/MkNPw7mBOhza4
	B4JQ2Ffds21ipzRa7cUzVOuBHGJcpjTxNg3YW3r9l0mb6xAePwW8wY4SpRKMh+OjMklzTF0JrwTUa
	j83fIH6C1E91Atq2uf8rXY0nKLCZi2YE8oco5XBnqwnUi9lRR0JYJkk+xuifKSixIaq5sXzXJ7cDk
	ar9R6qjddJS3ShSVhZ99T8a0PcmZEAcTbYonUhcL5keBInoVuHu3p4R9Z7VkgmhqYryuG9G2OAhyv
	spI5MUyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQKtK-00000000qQt-1kf4;
	Sat, 14 Jun 2025 07:01:26 +0000
Received: from mail-bn7nam10on2061d.outbound.protection.outlook.com ([2a01:111:f403:2009::61d] helo=NAM10-BN7-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQKUi-00000000lrd-2VMj
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Jun 2025 06:36:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pwJcVThuIp8esQTPbcipvlQS72x9iSa6tu9uGyGLsy8apO6Pr8WjjDsv9pwgvzzPdfaZPfGncIMxRx9C+ym2/NgWCr5oL6lInLb7NtCp149N9v5C6NR7bwCT+awN96jVBXrqOwsMYwUNUWFTX7GTDjlml7+fTiWgss418oRQa77mLDXwc2xXku/pmtkdaBmCuwtkiXT2LDqXBL1o2OaGHcke9H4DgHBSZ+YSCisu4tBtOpPXXqaatdb8A7Re6kxkAaT8+xPq/SQj2BBOrJA3dnB8t+RjZKYilrkWNLcBafkqQUsVtvBjTZrmDIjXaWNURZ7hQxiLxPKCUXe3IF7yIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+5JCoVXo3rI46p+RcSpC0xkILX6eZK7K0tyZOd5uu6o=;
 b=NdPY22Vbj1EgKVZN2n+e4jzaGiicjTcK360fUv0/7XFAYOTzBSX9XQmKALDGow5kYx3iFmHMOFyJGou3GVZo37JWegMIpc1u5OxdzAPzsPtJOJKESKVZZ5Fh5UAkjuky7VLqLzx7pXuVgbFPCfVg8bJesMG/Jg9JPQ/ZItdAeGqjnh0aZlU7/g3sKfEkwXCGZXTHoLMyHaG+S293G9bHisg0su16WABpn1x4XK2QEc+qBH5SKKzA4We8TwkBi1lvaXJW+0ReVerrVneqBlXbQ/uXdOHyrgmLW12Y+5JyexI9ajkN2PWrmQ9s1vNIDA6xVSCwfShg2YFf5D0QGGGeeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=intel.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+5JCoVXo3rI46p+RcSpC0xkILX6eZK7K0tyZOd5uu6o=;
 b=Ye8exowZWWCzhOyfnmoOWjxRpw/MG4oGDV1THU4jDdQWVi7nXXf9RTwBs2waffyMHM7nfTPw8RnS40b66V6BT/dySsPd6dxOX06Ck5gHsk8GQK+qqG5K4yOo/t3+n/REFdXOEJQ14cVMCh4Wm/PVyrfmT/oJyohjoonMUQMaA7N8o3GSl8tPCdbap+cOCfrS+Gy8GGFXx7pejT4Q51hZ0Uk6SVrT+pE6UwO8OLGgsgXDoh9oNy0M1fI79tVI3Kia7sCwGTrpV/DKUnVojy/Un0vWGWYXTmvZJdlyPC/fQY5Efmfiw+kdvut6qlxyGoF+3RedMJcEWbOoO8EDwNmz3Q==
Received: from CH2PR02CA0020.namprd02.prod.outlook.com (2603:10b6:610:4e::30)
 by IA0PR12MB8256.namprd12.prod.outlook.com (2603:10b6:208:407::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.18; Sat, 14 Jun
 2025 06:35:55 +0000
Received: from CH2PEPF0000014A.namprd02.prod.outlook.com
 (2603:10b6:610:4e:cafe::70) by CH2PR02CA0020.outlook.office365.com
 (2603:10b6:610:4e::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.25 via Frontend Transport; Sat,
 14 Jun 2025 06:35:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CH2PEPF0000014A.mail.protection.outlook.com (10.167.244.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8835.15 via Frontend Transport; Sat, 14 Jun 2025 06:35:54 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 13 Jun
 2025 23:35:43 -0700
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Fri, 13 Jun
 2025 23:35:43 -0700
Received: from Asurada-Nvidia.nvidia.com (10.127.8.11) by mail.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server id 15.2.1544.14 via Frontend
 Transport; Fri, 13 Jun 2025 23:35:42 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: <jgg@nvidia.com>, <kevin.tian@intel.com>
CC: <will@kernel.org>, <robin.murphy@arm.com>, <joro@8bytes.org>,
	<praan@google.com>, <yi.l.liu@intel.com>, <peterz@infradead.org>,
	<jsnitsel@redhat.com>, <linux-arm-kernel@lists.infradead.org>,
	<iommu@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
	<patches@lists.linux.dev>, <baolu.lu@linux.intel.com>
Subject: [PATCH v2 12/14] iommufd: Move _iommufd_object_alloc out of driver.c
Date: Fri, 13 Jun 2025 23:35:24 -0700
Message-ID: <79e630c7b911930cf36e3c8a775a04e66c528d65.1749882255.git.nicolinc@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1749882255.git.nicolinc@nvidia.com>
References: <cover.1749882255.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000014A:EE_|IA0PR12MB8256:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b92f0dc-d294-47a8-7bc6-08ddab0db718
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|82310400026|7416014|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Jp8SEXWewHle4TDFHfAWgl4FfC++NeOLrxoWJvHXU0/1UABoX8Cfn8ajE9zY?=
 =?us-ascii?Q?wCw1DFoAG+bUX8J8u+LPDYy/WBVRxjizUMVH+OiA3DtOwMPhVFg0XVFm0RPU?=
 =?us-ascii?Q?n01+MLx5wGkxnRDsfBmrzBbdfV3wG3s9gEbr1HaO7bWhNJWR1ambybmTQpcS?=
 =?us-ascii?Q?TNY1gm1vA7ztre7jY0FpFW5aatNUVY3sqvSbZt3sJQenyyp2maveh5pzM/cN?=
 =?us-ascii?Q?JEa6H/UP0sVTS16h/E8q/sL5dO8aG7qzO0mJcAZ+tv1REGVCHFXoFF97jkX/?=
 =?us-ascii?Q?A5yGLY6ZJ7ggqxtvxrp2GMR2a+Z+gU8RylEd05KnShcgce/sBaYYd2s/NhnW?=
 =?us-ascii?Q?d2oHHgCYL/RNNMeFFmJq4el+4RY6VD1pmB54g0eo2F4gtCK6kG+yqcXPoMCz?=
 =?us-ascii?Q?kGE1CB3TOIeTqHZA/N2tVWgFIcSbX8tkQWMfS6qXeejC3GZ+b9F8nprPfX2m?=
 =?us-ascii?Q?DMvBYbTuQ/fP//I5CmNkAdsczT2DPBlKrPP7z/wv5dwN8z2QQPwlOrSm2uVF?=
 =?us-ascii?Q?fq7kr8rvLFS1OEA61uynccS7sKgmCMY3GD8kMz0TL6MiAlxcTURyBXGB5WxR?=
 =?us-ascii?Q?FhcyiaGv97D4ZINCP6clJmCaOZ7lPlSDdsTPZRhB2uEXKtPvyRGfk5HYiCmk?=
 =?us-ascii?Q?/BT5DOcajtj826YNi7GK/44CKSEDfqADxQCe6A8IXBXzlTv+icfVHEAIg8Nm?=
 =?us-ascii?Q?BS7M21ENiIQ/v+PN/xu8hRgsm477aAn5gFL28dRY/Cb1I7Y++pEqg4ZROBS8?=
 =?us-ascii?Q?suFCGRN2PD6IfWVvMzsyfDKiKC3gOVoHppU7YARmBNRj1bjSWxLG84KGzNfh?=
 =?us-ascii?Q?bVQZS16UTrj0LfFQ4zqGHFb7NF7n/UkjQ94KctMif6M9LsMyMGbTrxK9sfQe?=
 =?us-ascii?Q?hHegckN0/mHjQALMvjeN8WrNIOmL2TK0ZgQIH0SKhKSEeY//TDpgHVfDehcC?=
 =?us-ascii?Q?ySLXaWMBFJ12rEoWpJfaoYF8Kc7ewb4jGuvbvWZILD3xKKQbTD8GL6/OFssr?=
 =?us-ascii?Q?hAJ7AUC/3fSXzUx7/NK/jx/idzscW9Edd2HiejHslwfzcYd6VndEW67665yW?=
 =?us-ascii?Q?LJzulP+jy0+jt37C0TizuauDDIkNCtqbkjxJgydOfOXsfRhfg9L9GbfrkDPG?=
 =?us-ascii?Q?5qyJr1XDXI+beLOOf4cPsmg0qfMvfKs56f8DY4qDlvDz+X+s2CFEt3MNT2fI?=
 =?us-ascii?Q?1pmGgsYDShw4Hg1ZHHuGuGmSMMaCvHYVHuTZEMrpfAS3KuoXth8B+qIGSnWn?=
 =?us-ascii?Q?ScVlHAnpDReXlh5PyBe/7QLGsSQAEl/Febl71DHnPA2B58BXawF1OtVhtCrh?=
 =?us-ascii?Q?y2l6+WbpdCZPj1Kw4rlHYai+PDiJ7F0YVuXNdsqyw1Qa6Ki2LejKwFNkB61f?=
 =?us-ascii?Q?n+cL1N8eRWxy/lpEcrh+vAbCNmkKfFSqqyWdfDlSjDKSPaAiPq+5iTcjtXJ7?=
 =?us-ascii?Q?P4fDaRjeEOjaiPcFYNym1q72PhHvl+HE4IgOBjQB3QEYWDvYYxG7nMMPzsZb?=
 =?us-ascii?Q?By1aAtxxqKMrCQxkuuy2PPUP6gY2L1kR/WBn?=
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(7416014)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2025 06:35:54.9368
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b92f0dc-d294-47a8-7bc6-08ddab0db718
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF0000014A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8256
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250613_233600_640241_4082CC3B 
X-CRM114-Status: GOOD (  18.73  )
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

Now, all driver structures will be allocated by the core, i.e. no longer a
need of driver calling _iommufd_object_alloc. Thus, move it back.

Before:
   text	   data	    bss	    dec	    hex	filename
   3024	    180	      0	   3204	    c84	drivers/iommu/iommufd/driver.o
   9074	    610	     64	   9748	   2614	drivers/iommu/iommufd/main.o
After:
   text	   data	    bss	    dec	    hex	filename
   2665	    164	      0	   2829	    b0d	drivers/iommu/iommufd/driver.o
   9410	    618	     64	  10092	   276c	drivers/iommu/iommufd/main.o

Reviewed-by: Kevin Tian <kevin.tian@intel.com>
Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
---
 drivers/iommu/iommufd/iommufd_private.h |  4 +++
 include/linux/iommufd.h                 | 10 --------
 drivers/iommu/iommufd/driver.c          | 33 -------------------------
 drivers/iommu/iommufd/main.c            | 32 ++++++++++++++++++++++++
 4 files changed, 36 insertions(+), 43 deletions(-)

diff --git a/drivers/iommu/iommufd/iommufd_private.h b/drivers/iommu/iommufd/iommufd_private.h
index 32f0631368e1..ec5b499d139c 100644
--- a/drivers/iommu/iommufd/iommufd_private.h
+++ b/drivers/iommu/iommufd/iommufd_private.h
@@ -230,6 +230,10 @@ iommufd_object_put_and_try_destroy(struct iommufd_ctx *ictx,
 	iommufd_object_remove(ictx, obj, obj->id, 0);
 }
 
+struct iommufd_object *_iommufd_object_alloc(struct iommufd_ctx *ictx,
+					     size_t size,
+					     enum iommufd_object_type type);
+
 #define __iommufd_object_alloc(ictx, ptr, type, obj)                           \
 	container_of(_iommufd_object_alloc(                                    \
 			     ictx,                                             \
diff --git a/include/linux/iommufd.h b/include/linux/iommufd.h
index bf41b242b9f6..2d1bf2f97ee3 100644
--- a/include/linux/iommufd.h
+++ b/include/linux/iommufd.h
@@ -190,9 +190,6 @@ static inline int iommufd_vfio_compat_set_no_iommu(struct iommufd_ctx *ictx)
 #endif /* CONFIG_IOMMUFD */
 
 #if IS_ENABLED(CONFIG_IOMMUFD_DRIVER_CORE)
-struct iommufd_object *_iommufd_object_alloc(struct iommufd_ctx *ictx,
-					     size_t size,
-					     enum iommufd_object_type type);
 struct device *iommufd_viommu_find_dev(struct iommufd_viommu *viommu,
 				       unsigned long vdev_id);
 int iommufd_viommu_get_vdev_id(struct iommufd_viommu *viommu,
@@ -201,13 +198,6 @@ int iommufd_viommu_report_event(struct iommufd_viommu *viommu,
 				enum iommu_veventq_type type, void *event_data,
 				size_t data_len);
 #else /* !CONFIG_IOMMUFD_DRIVER_CORE */
-static inline struct iommufd_object *
-_iommufd_object_alloc(struct iommufd_ctx *ictx, size_t size,
-		      enum iommufd_object_type type)
-{
-	return ERR_PTR(-EOPNOTSUPP);
-}
-
 static inline struct device *
 iommufd_viommu_find_dev(struct iommufd_viommu *viommu, unsigned long vdev_id)
 {
diff --git a/drivers/iommu/iommufd/driver.c b/drivers/iommu/iommufd/driver.c
index 922cd1fe7ec2..2fee399a148e 100644
--- a/drivers/iommu/iommufd/driver.c
+++ b/drivers/iommu/iommufd/driver.c
@@ -3,39 +3,6 @@
  */
 #include "iommufd_private.h"
 
-struct iommufd_object *_iommufd_object_alloc(struct iommufd_ctx *ictx,
-					     size_t size,
-					     enum iommufd_object_type type)
-{
-	struct iommufd_object *obj;
-	int rc;
-
-	obj = kzalloc(size, GFP_KERNEL_ACCOUNT);
-	if (!obj)
-		return ERR_PTR(-ENOMEM);
-	obj->type = type;
-	/* Starts out bias'd by 1 until it is removed from the xarray */
-	refcount_set(&obj->shortterm_users, 1);
-	refcount_set(&obj->users, 1);
-
-	/*
-	 * Reserve an ID in the xarray but do not publish the pointer yet since
-	 * the caller hasn't initialized it yet. Once the pointer is published
-	 * in the xarray and visible to other threads we can't reliably destroy
-	 * it anymore, so the caller must complete all errorable operations
-	 * before calling iommufd_object_finalize().
-	 */
-	rc = xa_alloc(&ictx->objects, &obj->id, XA_ZERO_ENTRY, xa_limit_31b,
-		      GFP_KERNEL_ACCOUNT);
-	if (rc)
-		goto out_free;
-	return obj;
-out_free:
-	kfree(obj);
-	return ERR_PTR(rc);
-}
-EXPORT_SYMBOL_NS_GPL(_iommufd_object_alloc, "IOMMUFD");
-
 /* Caller should xa_lock(&viommu->vdevs) to protect the return value */
 struct device *iommufd_viommu_find_dev(struct iommufd_viommu *viommu,
 				       unsigned long vdev_id)
diff --git a/drivers/iommu/iommufd/main.c b/drivers/iommu/iommufd/main.c
index 347c56ef44d8..85ad2853da0b 100644
--- a/drivers/iommu/iommufd/main.c
+++ b/drivers/iommu/iommufd/main.c
@@ -29,6 +29,38 @@ struct iommufd_object_ops {
 static const struct iommufd_object_ops iommufd_object_ops[];
 static struct miscdevice vfio_misc_dev;
 
+struct iommufd_object *_iommufd_object_alloc(struct iommufd_ctx *ictx,
+					     size_t size,
+					     enum iommufd_object_type type)
+{
+	struct iommufd_object *obj;
+	int rc;
+
+	obj = kzalloc(size, GFP_KERNEL_ACCOUNT);
+	if (!obj)
+		return ERR_PTR(-ENOMEM);
+	obj->type = type;
+	/* Starts out bias'd by 1 until it is removed from the xarray */
+	refcount_set(&obj->shortterm_users, 1);
+	refcount_set(&obj->users, 1);
+
+	/*
+	 * Reserve an ID in the xarray but do not publish the pointer yet since
+	 * the caller hasn't initialized it yet. Once the pointer is published
+	 * in the xarray and visible to other threads we can't reliably destroy
+	 * it anymore, so the caller must complete all errorable operations
+	 * before calling iommufd_object_finalize().
+	 */
+	rc = xa_alloc(&ictx->objects, &obj->id, XA_ZERO_ENTRY, xa_limit_31b,
+		      GFP_KERNEL_ACCOUNT);
+	if (rc)
+		goto out_free;
+	return obj;
+out_free:
+	kfree(obj);
+	return ERR_PTR(rc);
+}
+
 /*
  * Allow concurrent access to the object.
  *
-- 
2.43.0


