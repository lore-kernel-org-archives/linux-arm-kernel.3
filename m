Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A40DE7719A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 11 Jan 2025 03:49:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s3OuRMyWRZ4vump7DhyVSCF2/jP2PM5yuTjXtTnbCac=; b=3DdT9Iu1ZkcBsMrKq9Y/UI0MD+
	zJZXzUfByWGkZXZ26ZUDbD80V1tcLlGMHhys2Y56zI9c+buyHZLYrzE0zTg9ulQsfX7/XMkXS92N3
	/fYfaRgjndFqGeXX5cqtxzD4P3+Qz2iVo24wALKB7q7DyqeE84eK/EI4Ktod7GZHKpFN3BaZnBld0
	usY1uD0xk+gqlXUNjn3YJAZuvIJz3smzNBjJHHJPXeTdgE7BO6pi08I8yz8TPo1LWM8ZME/rKso8a
	2pSWKnKSA2uIewQ+peU96m5RCsELg/aDz9VblrIkW7dyBxMojDsaLc0eGOisSMEvLEefJoyKh9CdX
	n+Z9nqDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWSUo-000000005pp-2Cu5;
	Sat, 11 Jan 2025 03:49:10 +0000
Received: from mail-dm3nam02on20611.outbound.protection.outlook.com ([2a01:111:f403:2405::611] helo=NAM02-DM3-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWSFk-000000003An-47oa
	for linux-arm-kernel@lists.infradead.org;
	Sat, 11 Jan 2025 03:33:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k5JHs7B6MtqyveclGR19DhLC1KNopmPh6LzJNyQUOGF1ikjhGFtTffNY+eSVJfNBO1brJp7B53QvbttIfR3N1FHKQcZa3IJyYd3sMVruw8vRjEOPpa3N2S0lcXfcd9NKfRh8mpbGemwmo8vdA4Acdn4XP+KX47D9C8f1ojSptYAKlDdTtmYL42BCn1lmB3t3Wr+gPXe2P1Ayj3q5uiaQm6Yhvq50p5fYeN+b6l07zL4blfH+OPXuByVwfSf36cKMzH557AhNKh+Q1inBKfkyKdl7sj50ODayHRFwsSVa/yIUYeBkGpMf/MfcsfFtffgvlPbuPHeZY7xhC+xlhnX5LA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s3OuRMyWRZ4vump7DhyVSCF2/jP2PM5yuTjXtTnbCac=;
 b=qUsJStILeNOnyPrp7OtQ8BGFTdbAgLwr4nmyvxxa20tDvurGlRVAv6nZ9XGO9tPBPm8OVMORZJHlDSIarfmFTtWETH58mauau7ZlIx+X22v5qccMrW7WZsEhS1f9wZaGS0JUAjfBBRYyPx5BKnjCZ0Hi6ogUpJdLRANaZnf3QGl94jm6e+ilRpFdCi+l3nj8wpmw3Gr+7HqWocTwFxAcYK75nN+YTeqr8CWu+Rq4hGx9umIKFl5XLzdtaSyDdRXIUrkpRYLCyeWcVnVkVW6vHhqzm3bcsT8UL1pIoFsZel10C2l1D5E76EtMXSYyWHooApVf0grkBOH1OAeBwRcJDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s3OuRMyWRZ4vump7DhyVSCF2/jP2PM5yuTjXtTnbCac=;
 b=fjwWFYRS+P/QTfj3qVvGmH4fjn/Zt5q+W7Nm8gIG13zYio+vIQLsQ1FoCROnUtP7KKWZsSoI8b8JPzkrnsfWLa1ifXd4sxYAH9vbE7rZyw+7gqEeC5dauiDXImhstkZfdt9WDNzNg1FUgDdkiEIhVBnzo0t2fUK+dBGIHaji6fcfunI5WoswAKJPJK+pqwcK4D/DEqQGEYIeTn7uZHjIVn9Eeyz37/NoVHaRaRM2kMDGzpkzdj/tfrZ/LdulrbJ/hXw3BAA4N/2vpqscwKbbxle8lX6NfZr6v9FgBNEvRlSybqstIjIykn4IfR3KfJnQjRZNOxmqSVoSCW4dMVFNtQ==
Received: from DM5PR08CA0057.namprd08.prod.outlook.com (2603:10b6:4:60::46) by
 SJ2PR12MB9190.namprd12.prod.outlook.com (2603:10b6:a03:554::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8335.13; Sat, 11 Jan 2025 03:33:31 +0000
Received: from DS1PEPF0001709B.namprd05.prod.outlook.com
 (2603:10b6:4:60:cafe::76) by DM5PR08CA0057.outlook.office365.com
 (2603:10b6:4:60::46) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8335.11 via Frontend Transport; Sat,
 11 Jan 2025 03:33:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 DS1PEPF0001709B.mail.protection.outlook.com (10.167.18.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8335.7 via Frontend Transport; Sat, 11 Jan 2025 03:33:30 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 10 Jan
 2025 19:33:17 -0800
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Fri, 10 Jan 2025 19:33:17 -0800
Received: from Asurada-Nvidia.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.126.190.182) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Fri, 10 Jan 2025 19:33:14 -0800
From: Nicolin Chen <nicolinc@nvidia.com>
To: <will@kernel.org>, <robin.murphy@arm.com>, <jgg@nvidia.com>,
	<kevin.tian@intel.com>, <tglx@linutronix.de>, <maz@kernel.org>,
	<alex.williamson@redhat.com>
CC: <joro@8bytes.org>, <shuah@kernel.org>, <reinette.chatre@intel.com>,
	<eric.auger@redhat.com>, <yebin10@huawei.com>, <apatel@ventanamicro.com>,
	<shivamurthy.shastri@linutronix.de>, <bhelgaas@google.com>,
	<anna-maria@linutronix.de>, <yury.norov@gmail.com>, <nipun.gupta@amd.com>,
	<iommu@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <kvm@vger.kernel.org>,
	<linux-kselftest@vger.kernel.org>, <patches@lists.linux.dev>,
	<jean-philippe@linaro.org>, <mdf@kernel.org>, <mshavit@google.com>,
	<shameerali.kolothum.thodi@huawei.com>, <smostafa@google.com>,
	<ddutile@redhat.com>
Subject: [PATCH RFCv2 12/13] vfio-iommufd: Provide another layer of msi_iova helpers
Date: Fri, 10 Jan 2025 19:32:28 -0800
Message-ID: <02a1e86d551fa1660d3e64be33bed4d7d5b8ab94.1736550979.git.nicolinc@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1736550979.git.nicolinc@nvidia.com>
References: <cover.1736550979.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0001709B:EE_|SJ2PR12MB9190:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c6fdd93-2332-4100-ddf9-08dd31f0b858
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|36860700013|82310400026|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ccagOI0OhmH6ciat5nm6Y3Z7M7F+RmxbUdIgFDUPRxMK9froonoL0EV+JeS3?=
 =?us-ascii?Q?sf+dLn1dyjIM/qfwPfLFya9jfdfpiN7LouYr7PLUUKy3n30HgkivF8+ObSJm?=
 =?us-ascii?Q?1CKjwUHELkwnlDtCy1daPn51G+zKRSkXZ6cATdmRv8j8BgDz5N/zk56AH7AI?=
 =?us-ascii?Q?cXLcj7zjH4C3RUMYwoOOSaxaHNzHsBLSCj15PAJ+4/iRVO7mJZzzehABGeZP?=
 =?us-ascii?Q?w8z0sEg7/y/gJMGcbwyIsKRREODT74lJkObssQ4pZUW8gjP3jnI58jownlKK?=
 =?us-ascii?Q?pGGtPQ6iVdRDfgvPcEs7mOJa+kcR65RmzzLWNxN30jHv5TSVexd6E5sqAeP2?=
 =?us-ascii?Q?3egtJHZ4xkrvaJ36OnuxldJRsl1oI23d2kzNMPQJc5gcuqReUidqXAfbAsdl?=
 =?us-ascii?Q?SAw9hd5kjOUgLswV4hKs22WV940evZ8VCHLD1AC3q9nXAmQeDdXsxnLdZF8B?=
 =?us-ascii?Q?fkQb91eJ/T3y3QVkVXFbdo4uVpxn42Ybk+hrsfU0/TILdYn+15T26R3x7Toy?=
 =?us-ascii?Q?10UrCxwoYZ0ysZpLXdIMqKvqf7qW6kyO8nbji7vnonI6JBMxrDuaJSWhXGJs?=
 =?us-ascii?Q?2HjzxXf1EIS47n6LMmxoatBSQmxWabBS8Byj0QfxNrJLOZlKmCQ2UAvHeLGU?=
 =?us-ascii?Q?NwaWRhELyleYtFDL2aYBncxcPbseijX2iYHknHrEm2wSt0/aW8uet7QUtRhQ?=
 =?us-ascii?Q?wYc88uOklGn+jg1tVjYYNEBR2dOYQI6Ti+/MPhmtx1I5nkQ3Tn6JpmkWcLQv?=
 =?us-ascii?Q?/bQTt4zWSdA3jVXFzmucIq+XD+GjihZ2F+wHPm2+RBCecVAqagakA4VgbxI9?=
 =?us-ascii?Q?+4FwpCMbaIRDELg/w/4pI9Q5NAV1nHBOq6/gsk8onCR1CSG4FDs5d3TTKh8i?=
 =?us-ascii?Q?y0FQezW2PJBnvQ0fA7h53SIyXJMStTfW/dSXn1WnoU0QZnHgTB5rJ0oXh2bA?=
 =?us-ascii?Q?82HC1gJ3BX6o5eZExs9mmFmx6HZb6hytFUgCyWix824eHuazwSesHnWzcZV1?=
 =?us-ascii?Q?PLTMRx44Re2iRLJTsG9CD1pzxQ22ypXBhF/gnTi5OfTAu2MDMpl/YKnQ8Y1Z?=
 =?us-ascii?Q?VTwsdfZNChlBuJLnK5HxHoc0BhnT5VrhZDKAbMkXdegt/w5MKvfwqWdBgMS7?=
 =?us-ascii?Q?sKa93yb1WY2RNafpiowvkHXJsz8yrxOucTX2v3uTspaI9hzNtRtzLuaOEYyE?=
 =?us-ascii?Q?Gtgz1TADWB/NspQowx4xLkAOzpAtnD3SH32yPXkcY5Kz8Icyg1GF0VvwOb/k?=
 =?us-ascii?Q?1/5iANbotd97hRvtgPdfgkAs5qzetem4wxWDH8KgIvfWNp9rw0m7xdyPDEgy?=
 =?us-ascii?Q?HoZuQPDYrAcALLIrYinzDe75rYKRD/kS42uAuU9GPFtK/ncI6rPQi2YriVp2?=
 =?us-ascii?Q?xL11MrBtDcAqKm4RY8yy2gEcsKWBWlyDy8twjegnAOJTNovwvoI7lBSpJxwb?=
 =?us-ascii?Q?dFlDLh9rDJxsYZpfWlbM2S8oWs2gVVgzrHjbORBhumYzWrfMhvoUURYWiBxd?=
 =?us-ascii?Q?tavr+ZtDuB0RC7k=3D?=
X-Forefront-Antispam-Report: CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(7416014)(36860700013)(82310400026)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2025 03:33:30.9972
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c6fdd93-2332-4100-ddf9-08dd31f0b858
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF0001709B.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9190
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_193337_024358_3B296DDE 
X-CRM114-Status: GOOD (  10.64  )
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

As the bridge between iommufd core and vfio core, add a set of msi_iova
helpers to call the new msi_iova helpers from the iommufd_device level.

The next patch will use this bridging helpers in vfio-pci code.

Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
---
 include/linux/vfio.h   | 25 +++++++++++++++++++++++++
 drivers/vfio/iommufd.c | 27 +++++++++++++++++++++++++++
 2 files changed, 52 insertions(+)

diff --git a/include/linux/vfio.h b/include/linux/vfio.h
index 000a6cab2d31..f38a1e910a2f 100644
--- a/include/linux/vfio.h
+++ b/include/linux/vfio.h
@@ -133,6 +133,12 @@ struct vfio_device_ops {
 
 #if IS_ENABLED(CONFIG_IOMMUFD)
 struct iommufd_ctx *vfio_iommufd_device_ictx(struct vfio_device *vdev);
+int vfio_iommufd_device_set_num_msi_iovas(struct vfio_device *vdev,
+					  unsigned int num);
+int vfio_iommufd_device_set_msi_iova(struct vfio_device *vdev,
+				     unsigned int index, dma_addr_t iova);
+void vfio_iommufd_device_unset_msi_iova(struct vfio_device *vdev,
+					unsigned int index);
 int vfio_iommufd_get_dev_id(struct vfio_device *vdev, struct iommufd_ctx *ictx);
 int vfio_iommufd_physical_bind(struct vfio_device *vdev,
 			       struct iommufd_ctx *ictx, u32 *out_device_id);
@@ -151,6 +157,25 @@ vfio_iommufd_device_ictx(struct vfio_device *vdev)
 	return NULL;
 }
 
+static inline int
+vfio_iommufd_device_set_num_msi_iovas(struct vfio_device *vdev,
+				      unsigned int num)
+{
+	return -EOPNOTSUPP;
+}
+
+static inline int vfio_iommufd_device_set_msi_iova(struct vfio_device *vdev,
+						   unsigned int index,
+						   dma_addr_t iova)
+{
+	return -EOPNOTSUPP;
+}
+
+static inline void vfio_iommufd_device_unset_msi_iova(struct vfio_device *vdev,
+						      unsigned int index)
+{
+}
+
 static inline int
 vfio_iommufd_get_dev_id(struct vfio_device *vdev, struct iommufd_ctx *ictx)
 {
diff --git a/drivers/vfio/iommufd.c b/drivers/vfio/iommufd.c
index 516294fd901b..805efdbccc97 100644
--- a/drivers/vfio/iommufd.c
+++ b/drivers/vfio/iommufd.c
@@ -69,6 +69,33 @@ struct iommufd_ctx *vfio_iommufd_device_ictx(struct vfio_device *vdev)
 }
 EXPORT_SYMBOL_GPL(vfio_iommufd_device_ictx);
 
+int vfio_iommufd_device_set_num_msi_iovas(struct vfio_device *vdev,
+					  unsigned int num)
+{
+	if (!vdev->iommufd_device)
+		return -ENODEV;
+	return iommufd_device_set_num_msi_iovas(vdev->iommufd_device, num);
+}
+EXPORT_SYMBOL_GPL(vfio_iommufd_device_set_num_msi_iovas);
+
+int vfio_iommufd_device_set_msi_iova(struct vfio_device *vdev,
+				     unsigned int index, dma_addr_t iova)
+{
+	if (!vdev->iommufd_device)
+		return -ENODEV;
+	return iommufd_device_set_msi_iova(vdev->iommufd_device, index, iova);
+}
+EXPORT_SYMBOL_GPL(vfio_iommufd_device_set_msi_iova);
+
+void vfio_iommufd_device_unset_msi_iova(struct vfio_device *vdev,
+					unsigned int index)
+{
+	if (!vdev->iommufd_device)
+		return;
+	iommufd_device_unset_msi_iova(vdev->iommufd_device, index);
+}
+EXPORT_SYMBOL_GPL(vfio_iommufd_device_unset_msi_iova);
+
 static int vfio_iommufd_device_id(struct vfio_device *vdev)
 {
 	if (vdev->iommufd_device)
-- 
2.43.0


