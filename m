Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7E84C02181
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Jan 2025 00:41:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uMfNg1hPh2mOg0OlvPZ9wMRhkAHnTAAVx+IL0zUPw5Q=; b=EEExvnL3nw8uGrC4u9IuGpCkGq
	TgfIXTk8Wx0WA2xztZo5al5Jq/pRNzZoi5b05JnJgZf3ZoLAF164wLgoMRqDqBUnJjxxCZY8yCiFc
	D3qo1eEFnnje6AB965ppm7p56QIukUpc9MTgeHKJyVwWy2LWR9I3e3WwCogVtADpZxCVfjrGTebve
	qTwplYm9CYIQpRLavX6iy7p6mvW+uwLyioaw2FLh5WklnKtD9NGDowqtQ1DSi8Uz0i9FIa2c5/HxY
	pEbQZgFzce4Ut8ujSsSPmuqX5y6jZG9M4jkgxgNIaQse7jN+Dh+93BUw4rndb2/Cndmb8SN3xgpBS
	jhWKUriw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tbUF9-0000000Fp7T-1MBb;
	Sat, 25 Jan 2025 00:41:47 +0000
Received: from mail-mw2nam10on20617.outbound.protection.outlook.com ([2a01:111:f403:2412::617] helo=NAM10-MW2-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tbU5A-0000000FnSK-0GQg
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Jan 2025 00:31:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r/uwCoOrXM6mAATvwcXLNjRb1IIjEQDp3rhvpF91EWAm/hdyaM1rm62uDAII9MEpf7f/4ytp0mc0ODCSYM9bY4DPTVC0dg/i04dZX8boLNpdspCwFEgQQBvy5caR7qeMdCHnKpJf509lfnjgMS1ux9cnDbJo8f+OT6MY/X1xmy5MqcNIkeUiIizGjpzOzwwcRuuW+C+ga+BgI+wPtWS1kFLxyfTAqQRoxoTuXtviD9aC7SvK/zz4C1S4vU4xpBBjY4pjpb6repg1zg+jiWJ3uujPxqSFVRbQuRMMhUqzplNnIRY76118vr9JgI85I7L3CvrQt/VDYR3U4DkjvsNVzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uMfNg1hPh2mOg0OlvPZ9wMRhkAHnTAAVx+IL0zUPw5Q=;
 b=eXBkMFIl3PuF3jzV7WSyyYLj4l6gVfM1gaujSBr0nRTwnw6JVB/2+1tjf6CG2cOi+z8vOtHEFGZSSn0/FuZre+rXCsWsMTt/14HwkfYlKfjSL8VkxrM6wFb1sB3LH2qjgDN3mfh4QCVNWbVKumsuZIxsMaANI6A7oxMfUr18RsVEqAhtKcK4DC6YXtPez3/Km4pHFcR77qpPQtzkpu5Oqhz4ujXR3Q1optQQeZzEj2wQzHTd7cY2+97Ubel786oy2mI+8nD+dyhW4+1rjizZVXGGikN/tblOlYh4lTuvh0NjGKXNVnP3B3SOvIRJbhZ9OjSxdieQdT1ohrwuMjKeCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uMfNg1hPh2mOg0OlvPZ9wMRhkAHnTAAVx+IL0zUPw5Q=;
 b=lmvkuoJU5YRzLISbqrp0EiALsAXE23DaOHYxJRbCJ0iJdOzgsgBi86smFEbeZ1zCl2MtfXhL6kY7rXUS8FrNsgTOWn2MNcmvylSwZzZM5hcNPwNHtCTgv/LQqc2MQVnb1Eous5YdqsTk8OJBDhuSTwL/WrHs9+Huvp59tB0dZ427zDuKZPNfwb/T8zig6+Zu5+O6ny9cqxMLJBJjo6Ab+71pXWROZKibtRUKrjuGFC+4J7x+A3VupDTZYjCRSi2D+AlAMAlG4obmbCpsqIVH2pNfX1iX1+bT41n9DTus0YfiUy+YVI/RK0vHiFlHmCy3zNJGmCFulGCZK5wbzyynnQ==
Received: from BLAPR03CA0146.namprd03.prod.outlook.com (2603:10b6:208:32e::31)
 by PH8PR12MB8429.namprd12.prod.outlook.com (2603:10b6:510:258::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.18; Sat, 25 Jan
 2025 00:31:20 +0000
Received: from BL02EPF0001A0FD.namprd03.prod.outlook.com
 (2603:10b6:208:32e:cafe::41) by BLAPR03CA0146.outlook.office365.com
 (2603:10b6:208:32e::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8377.20 via Frontend Transport; Sat,
 25 Jan 2025 00:31:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 BL02EPF0001A0FD.mail.protection.outlook.com (10.167.242.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8377.8 via Frontend Transport; Sat, 25 Jan 2025 00:31:20 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 24 Jan
 2025 16:31:07 -0800
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 24 Jan 2025 16:31:07 -0800
Received: from Asurada-Nvidia.nvidia.com (10.127.8.12) by mail.nvidia.com
 (10.126.190.180) with Microsoft SMTP Server id 15.2.1544.14 via Frontend
 Transport; Fri, 24 Jan 2025 16:31:06 -0800
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
Subject: [PATCH v6 11/14] Documentation: userspace-api: iommufd: Update FAULT and VEVENTQ
Date: Fri, 24 Jan 2025 16:30:40 -0800
Message-ID: <300d03449b9420d756c1589e1c24bb8b4d508293.1737754129.git.nicolinc@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1737754129.git.nicolinc@nvidia.com>
References: <cover.1737754129.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A0FD:EE_|PH8PR12MB8429:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d0ea4ec-a468-4070-cd44-08dd3cd796cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|36860700013|376014|7416014|82310400026;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?XPcr5vSbV5LTFzS7K/KrKPRCv6bx/KDLYXFUeNnGpetG1XFuNURNci4ZPnzi?=
 =?us-ascii?Q?WNaH35RYC1QRU02r3tma4+hhRvkxS4ylMptMlsJAdfnhoV56LBhF5PufykOF?=
 =?us-ascii?Q?o523rIy8KYtDwNKC+Jy39N9vgcF//TjnSxIAkfI3IfAbMhx95MCHsUfeYdmR?=
 =?us-ascii?Q?QJkqgcJEVqcWBchJP8Mdmpwy3r5nLrZhdiE28fT8uoEaol3FyYqZGIov6jsC?=
 =?us-ascii?Q?+hcDodxA5GwfTk/KRFa1rT8momFNA0X5gI3tA0x8fIBa1GRuDqat+2Nr8aU2?=
 =?us-ascii?Q?XIX/NSuFF/R3K/KF1w0lvhkP8jWiHulGohi9g8Jv6oenh686YcKtSG4tgzeS?=
 =?us-ascii?Q?hocucirGtnHLzkyUv2MOM5mnURS6PWffl3AnxuvFkxYjbdP7htZ5mXaJdofS?=
 =?us-ascii?Q?s9k+PIHWxC4gxQ/kp3gIG12Fo7uH0nD1aXMLQBRR9XGRPulWhNd7cvjalJor?=
 =?us-ascii?Q?qykdI2BnEA16oTA60d4FTJ2dAAxhT5GZ2obNYrXJIMlGTVxIm+yBnF20Hc88?=
 =?us-ascii?Q?GTavvdVvShpp+AI2fEG2FDf9w4e9F44hikdsHb3FAfEAnSqLJK1VwZL/zE4T?=
 =?us-ascii?Q?jqnl11Rovk/dQLZVTbtiQ4KVqlDWrTMBu/FHev0Ocg3GVK732viH/3T3Ubb3?=
 =?us-ascii?Q?6lPv9XeCJoubbelxsq/nCvAU732QpPmpjNJQM/YZfQ8Y2fFWaoekQEM5VUje?=
 =?us-ascii?Q?4xLqzwXi2oGXQ7BUubAYdifeHQ0+mEMk2fMfN+DnmlcPUKwk+kz58gCQbxz7?=
 =?us-ascii?Q?I4qcHSQqQ7bj7WTnqpbuuZbSm7uW2FaLz+o0ra8nSJ4QCqzgr8Ruz7u6jD/x?=
 =?us-ascii?Q?sAKhtxuvfwS/JEd0o4Jyc+6fOBC6db1Lad7TGGS7OPKEqEw+qBdTuljPUv9/?=
 =?us-ascii?Q?XZlNFNFtiIHCjLU7YD/M2vTq2AzwgHXWi2/bxzwXcYuhB2PekzzMsfwU/B8w?=
 =?us-ascii?Q?h9Axs7WAg78JCL57tO+ab8EAyKonOuUkxstjT1XnmPNIcn8jZ4NjDiqrmjOX?=
 =?us-ascii?Q?Z27QI368EMqaDMDlsA6zjmIkrDq35LgkFL1akro5SnAwzTj+LXl2un7PKy2o?=
 =?us-ascii?Q?grDWXaxVvcMCaV4atoKh4STDbhEd33HJ9Y6CvUJbcjhHcnI6jhyvQjp2Pb2+?=
 =?us-ascii?Q?AowduQ4OCIBVWBx64ETBEsWWiHJuWBpeCUHYVJtMdRe134J3tp8CRJPM2aFE?=
 =?us-ascii?Q?Ny8AxqNkKIBMFQi3Ixz4j6nZ3EHhJ07UYvT5XiztKOQrQWnOlj7AVf3rFRVt?=
 =?us-ascii?Q?3cTCYocvZw/wh+oqhVIFatLFbZCgbtgLqiL6+TG1YFjco5y6Kk59z3JNr6Ut?=
 =?us-ascii?Q?ZZbth0VyFPMUXmyk3j42QnIGghzD3aC2YiWa8n1JnE8jGSaPNkIG5cPDHUlS?=
 =?us-ascii?Q?O03uBCE7ohDQWB2b4Rtx9bk/Eb1xaMA6+HHwqcc0traHlirhMtRiCOJF8gq7?=
 =?us-ascii?Q?90bGqBgHDN5i7B8NkzdwBehMIg0ntmeXp/DfkobWVu5g61NeGa5QpzQomeSW?=
 =?us-ascii?Q?aMzv9XfOt3mNBlA=3D?=
X-Forefront-Antispam-Report: CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(7416014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2025 00:31:20.0308
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d0ea4ec-a468-4070-cd44-08dd3cd796cd
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0001A0FD.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB8429
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250124_163128_103610_59016896 
X-CRM114-Status: GOOD (  15.58  )
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

With the introduction of the new objects, update the doc to reflect that.

Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>
Reviewed-by: Kevin Tian <kevin.tian@intel.com>
Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
---
 Documentation/userspace-api/iommufd.rst | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/Documentation/userspace-api/iommufd.rst b/Documentation/userspace-api/iommufd.rst
index 70289d6815d2..b0df15865dec 100644
--- a/Documentation/userspace-api/iommufd.rst
+++ b/Documentation/userspace-api/iommufd.rst
@@ -63,6 +63,13 @@ Following IOMMUFD objects are exposed to userspace:
   space usually has mappings from guest-level I/O virtual addresses to guest-
   level physical addresses.
 
+- IOMMUFD_FAULT, representing a software queue for an HWPT reporting IO page
+  faults using the IOMMU HW's PRI (Page Request Interface). This queue object
+  provides user space an FD to poll the page fault events and also to respond
+  to those events. A FAULT object must be created first to get a fault_id that
+  could be then used to allocate a fault-enabled HWPT via the IOMMU_HWPT_ALLOC
+  command by setting the IOMMU_HWPT_FAULT_ID_VALID bit in its flags field.
+
 - IOMMUFD_OBJ_VIOMMU, representing a slice of the physical IOMMU instance,
   passed to or shared with a VM. It may be some HW-accelerated virtualization
   features and some SW resources used by the VM. For examples:
@@ -109,6 +116,14 @@ Following IOMMUFD objects are exposed to userspace:
   vIOMMU, which is a separate ioctl call from attaching the same device to an
   HWPT_PAGING that the vIOMMU holds.
 
+- IOMMUFD_OBJ_VEVENTQ, representing a software queue for a vIOMMU to report its
+  events such as translation faults occurred to a nested stage-1 (excluding I/O
+  page faults that should go through IOMMUFD_OBJ_FAULT) and HW-specific events.
+  This queue object provides user space an FD to poll/read the vIOMMU events. A
+  vIOMMU object must be created first to get its viommu_id, which could be then
+  used to allocate a vEVENTQ. Each vIOMMU can support multiple types of vEVENTS,
+  but is confined to one vEVENTQ per vEVENTQ type.
+
 All user-visible objects are destroyed via the IOMMU_DESTROY uAPI.
 
 The diagrams below show relationships between user-visible objects and kernel
@@ -251,8 +266,10 @@ User visible objects are backed by following datastructures:
 - iommufd_device for IOMMUFD_OBJ_DEVICE.
 - iommufd_hwpt_paging for IOMMUFD_OBJ_HWPT_PAGING.
 - iommufd_hwpt_nested for IOMMUFD_OBJ_HWPT_NESTED.
+- iommufd_fault for IOMMUFD_OBJ_FAULT.
 - iommufd_viommu for IOMMUFD_OBJ_VIOMMU.
 - iommufd_vdevice for IOMMUFD_OBJ_VDEVICE.
+- iommufd_veventq for IOMMUFD_OBJ_VEVENTQ.
 
 Several terminologies when looking at these datastructures:
 
-- 
2.43.0


