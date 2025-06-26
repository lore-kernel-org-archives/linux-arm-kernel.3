Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DA91C7EE31
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Jun 2025 19:42:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DKiycyCwzyrv3fsMPpqdG0OmZs1BpJ9fDYeeyvmNYuo=; b=fazT/OLHuzsnogvL0AiipNXE5i
	VmPQKrhSqyrbxIWypUMoef1ReP7tn9xkqiHumMUKi52bwwLPdzkfFgGYI3YSfhGJNKg4XeqT9pyGh
	KqLl5i9pQwEEHOZTa+SXyn6KdCPXjrmwlW1UY9avcLohDpbJf3eDy8t2kPLqUd1EYibSqsPYWZ2iT
	dpFlcInknb3v4OHG2mMWpVmVh/fjxqnyTT/NTRlqkMzsK64buXjzFkI5HqRYxzBR22kUmKmV2b9Xe
	sAxn3Zz0c3o1NX4lb9sMlFRGmVFE/SZ7m+7Wug7wuuGTFsvR/4p0rLfK1wFnx+dyQQ+75MuiQz8SU
	xwyD9Tew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUsUL-0000000CcTV-2sof;
	Thu, 26 Jun 2025 19:42:25 +0000
Received: from mail-dm6nam12on2060a.outbound.protection.outlook.com ([2a01:111:f403:2417::60a] helo=NAM12-DM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUsNe-0000000Ca8M-1v56
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Jun 2025 19:35:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aANxjytF0Ll9LTSpoowHiYLNrV+WlhtIJORzd/D7wYJf+JZVE6h7nEMiGrR1GJJ/TarKTlJRXqePNnfYiTKAV+75s9gIXi3lqrdun/ibPR+2SLm3n3wfGSfToLLOOy1FRblm3PR7MDFBl6a+3VGR3n6IMu4MfryI22xr4v4wOek0hbLDZw4DVuGQb1LuLvW0hM5PwJbQyWmdFIb9mAj4Rtkjnb51PdE/+qpSGMgoL+TbvfivX1efqpYnzE8rg1NSJD2h0GefeoUnb/iqEa95caI3PYE4KWTR3m5wMxGcpvN8nNQSGHaqgv5s0ZuOxf7fHKaOYPOuknjX1fhAVzPACg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DKiycyCwzyrv3fsMPpqdG0OmZs1BpJ9fDYeeyvmNYuo=;
 b=Y0JwdATjfkMJjH+t0mabIVzaPPc/2cml+w6WV1Rv99fgq8NQ/oY3K97Fte8CPb1MH/J1b9X7MeqlxWkI0lsfGsXvI2iy6R1Bezh8Ey8jtEM3Xiw83fnl0vWj1r1Cy8uXQwi3rAM3tznX5Eh3nkshKmvWq6DlGuiZEQKhmQF871sgvlvn1nRG8Da6LhgyCl5VX9SChqxODq7SZP+QsMWv6h8QyLoEmFBR+CvK1rTsNe1fh6MQV0uXA2TzSAXya0pHmaS4njSJ6bea4HTAoIAjK9RTycI1AZVFDvh242OPPWN0y/0kSVeZA2FLYmCECb6MJ3ya/XmC3LgPNF3DFJCvrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=amd.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DKiycyCwzyrv3fsMPpqdG0OmZs1BpJ9fDYeeyvmNYuo=;
 b=ue3fR3U3egarZfjcM/rSDLSZDjKP3/xN9HFt8CmfOnKioTOWmREdYjrVA/PgoW3ddWQrdb5FdYTOKjBgxVxAaBgzG12fRF3PYubQ6ucH/WU4vVXJzJKR/yUacGK++X/f1xvGGJBFbsAqFYk29c6/vPAaR1TKbbyOvsW/J49qNCWMjOznedouYejZqIFzrqI793f0nMhA/ujU3q5RclGA9q5PfiiL6cQcvfF4rweUbvKkVN/HYd4ySfgR2S+aKRln/zndKzjjODrcUGjn+Z98vf2if3wH/K2a+FoXBdPxf4iNB8ypht1Z8tHtEuwaHQbL0Su6+GMQO7YvxV999TSiKQ==
Received: from BN0PR02CA0037.namprd02.prod.outlook.com (2603:10b6:408:e5::12)
 by PH0PR12MB7472.namprd12.prod.outlook.com (2603:10b6:510:1e9::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.21; Thu, 26 Jun
 2025 19:35:26 +0000
Received: from MN1PEPF0000ECDB.namprd02.prod.outlook.com
 (2603:10b6:408:e5:cafe::a9) by BN0PR02CA0037.outlook.office365.com
 (2603:10b6:408:e5::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.17 via Frontend Transport; Thu,
 26 Jun 2025 19:35:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 MN1PEPF0000ECDB.mail.protection.outlook.com (10.167.242.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8880.14 via Frontend Transport; Thu, 26 Jun 2025 19:35:25 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 26 Jun
 2025 12:35:08 -0700
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 26 Jun 2025 12:35:08 -0700
Received: from Asurada-Nvidia.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.126.190.180) with Microsoft SMTP Server id 15.2.1544.14 via Frontend
 Transport; Thu, 26 Jun 2025 12:35:06 -0700
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
Subject: [PATCH v7 02/28] iommufd/viommu: Explicitly define vdev->virt_id
Date: Thu, 26 Jun 2025 12:34:33 -0700
Message-ID: <cc7a558bfcdce5c2ea0d53b0c9c382f944df33ce.1750966133.git.nicolinc@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1750966133.git.nicolinc@nvidia.com>
References: <cover.1750966133.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECDB:EE_|PH0PR12MB7472:EE_
X-MS-Office365-Filtering-Correlation-Id: df7d8340-8864-429a-d935-08ddb4e8996c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|36860700013|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?gnsbw9uURhdZyV9PZmvvkekM6ejOmRPtfalHByLt1mF+vGEKlNwSf/YIFUsj?=
 =?us-ascii?Q?BI3fFF+EdIJoBETBtLfKDGsRFlrE511GZ1BRJdlmKpxA8GNyQmxxZXhL33wO?=
 =?us-ascii?Q?LRgM8HMQD5LQxnDGkuXU1UErJhCoCPTwn0kBH9Xy/alRZuyEEPuGC0czf0Ui?=
 =?us-ascii?Q?98aLO2Y1eGpPD86uWv5H3PIkdfb/JRFQ+19FMshkZWClYo65tGiJtAH2nfXI?=
 =?us-ascii?Q?z7ls4ww3tWCeFAR1fHC0TVKbSZ/+Im/t44Df232E7O0cjWxHVPUEBuHfctCl?=
 =?us-ascii?Q?tfHHH1ZPaDYHniMvY5cIHhkexB9lGogFp2CoB+INbBsnQVE/dFINtQVWZoa8?=
 =?us-ascii?Q?7LnGVzkiM3unZr51zyLulqd8rGol8LHe25/eRZnQkVvUWCUHW9ozdMcOVhM+?=
 =?us-ascii?Q?3VA5aHgJNa6cuqBIsfhKz0fBo/mpTrPUxvQBNMMj+yhnQcjKqCDlSsUhogTd?=
 =?us-ascii?Q?7HktkLAwnGb6GKjXMiP8bmGXc3Ch/lkmd6loXvOphc5W8XHGgn/Y3C8l9Nyj?=
 =?us-ascii?Q?KOVGFAWXTuVnEB6G/aAByFPN3YByGArbQgTwnlCq7Uf93fnH6gtKdAQyy2Ue?=
 =?us-ascii?Q?WeqTG2jFKtIQS3EGaphS8ws7VRwEh3R9dC089KxHV7FsnBk78DQjr6AoYbsS?=
 =?us-ascii?Q?ULMd5nIjT7edpzUxvZGe586/gsMx2r0Md5vfRRQQipFZ80l/oMVDkT+wa1LD?=
 =?us-ascii?Q?PSnBovRXMn1MyJ8lRWx4YT9kltpligeI6McMiCSnlciKhEesNZktLY3fR3fR?=
 =?us-ascii?Q?2juRnujs3EEsLyC07s9pvU0BIo0S8H6v3bsTZgS9pkVfD3qsTsdWsMViv1yw?=
 =?us-ascii?Q?65ze2Zh0/IFgcgjj9qXq/d+15mwn2QaHwDH7L8OX2RiQaG+01ZWbczHUds3u?=
 =?us-ascii?Q?QNJJZutJBwnS2704uJeuVpIjCCkfX7bBYSmevWU8rC4jpFI+96PH3MeJe6iZ?=
 =?us-ascii?Q?B4sUAt7RLUs5Bhk+Lu3B0rhBAyk3F50jRrSWZ0FrNcZFrs8GVO73HlsXsTL4?=
 =?us-ascii?Q?ttuI9Nhafpeo/1AOyCf246tjLkCfxpuWnsQFFEjSkKhmY/E4Jb8xJfBmY7Hi?=
 =?us-ascii?Q?D/qVvuieHVgxQPNskpac2udVBHWOIIqGbTRAIjQfTln0QUf1BLzvuemdeLwX?=
 =?us-ascii?Q?wRPIxXGT5exxzN+O09VNEMebCc7187OKuK3QufmoZ1BASObJxxBw6GpHmesb?=
 =?us-ascii?Q?QkcQhEEnIjbHISTNpUOZk+drxgVPa3hMlzNvkVprGpT/YvBu7+afO7RYqH2s?=
 =?us-ascii?Q?NMbw144XElEu87HuybCmjLcA+Bfne133TVqnr2zxM/tDmnChQYyvIMBlgCWt?=
 =?us-ascii?Q?h8vtOM4YJpPvQor0KXqeYFA8VYVfRjTtHlZMjp5n/oHhybKoLYwzYZv1MvRO?=
 =?us-ascii?Q?PZLKMY+JaXy03VnfA0YiG268PgJ7dwB6AdpgCsI4ECXxlQJRxZTgfm4/uVLF?=
 =?us-ascii?Q?JlkQlKIztjy/tiCElqJI7WFkCRjy1xPzQGQeuncqUj4AYwFGXNLQMzMopNbg?=
 =?us-ascii?Q?18c9V/uHfc6fNDvNza2hJ+zfIPrzQ4x5E/5z?=
X-Forefront-Antispam-Report: CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2025 19:35:25.4125
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: df7d8340-8864-429a-d935-08ddb4e8996c
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: MN1PEPF0000ECDB.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7472
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_123530_503519_8EA19B9D 
X-CRM114-Status: GOOD (  13.07  )
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

The "id" is too genernal to get its meaning easily. Rename it explicitly to
"virt_id" and update the kdocs for readability. No functional changes.

Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
---
 drivers/iommu/iommufd/iommufd_private.h | 7 ++++++-
 drivers/iommu/iommufd/driver.c          | 2 +-
 drivers/iommu/iommufd/viommu.c          | 4 ++--
 3 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/iommu/iommufd/iommufd_private.h b/drivers/iommu/iommufd/iommufd_private.h
index 4f5e8cd99c96..09f895638f68 100644
--- a/drivers/iommu/iommufd/iommufd_private.h
+++ b/drivers/iommu/iommufd/iommufd_private.h
@@ -634,7 +634,12 @@ struct iommufd_vdevice {
 	struct iommufd_object obj;
 	struct iommufd_viommu *viommu;
 	struct device *dev;
-	u64 id; /* per-vIOMMU virtual ID */
+
+	/*
+	 * Virtual device ID per vIOMMU, e.g. vSID of ARM SMMUv3, vDeviceID of
+	 * AMD IOMMU, and vRID of a nested Intel VT-d to a Context Table
+	 */
+	u64 virt_id;
 };
 
 #ifdef CONFIG_IOMMUFD_TEST
diff --git a/drivers/iommu/iommufd/driver.c b/drivers/iommu/iommufd/driver.c
index 2fee399a148e..887719016804 100644
--- a/drivers/iommu/iommufd/driver.c
+++ b/drivers/iommu/iommufd/driver.c
@@ -30,7 +30,7 @@ int iommufd_viommu_get_vdev_id(struct iommufd_viommu *viommu,
 	xa_lock(&viommu->vdevs);
 	xa_for_each(&viommu->vdevs, index, vdev) {
 		if (vdev->dev == dev) {
-			*vdev_id = vdev->id;
+			*vdev_id = vdev->virt_id;
 			rc = 0;
 			break;
 		}
diff --git a/drivers/iommu/iommufd/viommu.c b/drivers/iommu/iommufd/viommu.c
index 25ac08fbb52a..bc8796e6684e 100644
--- a/drivers/iommu/iommufd/viommu.c
+++ b/drivers/iommu/iommufd/viommu.c
@@ -111,7 +111,7 @@ void iommufd_vdevice_destroy(struct iommufd_object *obj)
 	struct iommufd_viommu *viommu = vdev->viommu;
 
 	/* xa_cmpxchg is okay to fail if alloc failed xa_cmpxchg previously */
-	xa_cmpxchg(&viommu->vdevs, vdev->id, vdev, NULL, GFP_KERNEL);
+	xa_cmpxchg(&viommu->vdevs, vdev->virt_id, vdev, NULL, GFP_KERNEL);
 	refcount_dec(&viommu->obj.users);
 	put_device(vdev->dev);
 }
@@ -150,7 +150,7 @@ int iommufd_vdevice_alloc_ioctl(struct iommufd_ucmd *ucmd)
 		goto out_put_idev;
 	}
 
-	vdev->id = virt_id;
+	vdev->virt_id = virt_id;
 	vdev->dev = idev->dev;
 	get_device(idev->dev);
 	vdev->viommu = viommu;
-- 
2.43.0


