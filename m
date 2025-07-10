Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 203D9C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jul 2025 06:46:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vP4++gMVso6NJgCf4yKAKkzqkAKXxdKz2sTcPjJo/tU=; b=x05wRn7UHpqg8ZqOS674f9J1jG
	6i5bGhFQes1zZHeJllCHZlInoS+GBilwIBuM9vYVLs3SjsLgw7j+pweWmZ/RQN3gkefbqqhThnf6d
	AUelS6Di6uJ7QoahqDcQIpzRfl6nU1oI32C69SxCjvq1yrEvWMQQUEPXc3jSYnZ5LesNrIuXEOHHa
	1G+VM70Jt4a/m1MN4abBb4DK30J8j6mUlfGCY+jY4hKy1pzT7ARHlfDl0Ay3TlYwo9TibhTk3m7TT
	WGy1aISAwMixfhOKDAHnN8sZqFNqGrFiJiqd2xckf9uaIbi70hkwws+C8mq6uBXGRuw6Wlwobs+2t
	a/JN9y8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZl2y-0000000Au6z-10lV;
	Thu, 10 Jul 2025 06:46:20 +0000
Received: from mail-mw2nam12on2061b.outbound.protection.outlook.com ([2a01:111:f403:200a::61b] helo=NAM12-MW2-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZkKs-0000000AmAm-1WDo
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Jul 2025 06:00:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=okRjkcaLlNaEgL2bi2vU3HCkcP6hcjDvz4cgKY+Gr7hs7ll50uzfd9MKtxwERe8rrn030zSdCMokEgqadJyPia9eEFeQ7Aslmb8kfH5nfxqyCT7f+7jYX921KlyFtOTbUTbRi31u+3axkR0KI4BzZpBOcHdmdSQmyi6B19r+w74DVh2Sx/UTLT6sCTWLN2gagLxQStJzXca0AwzC9cH09hKvCYReM0j+lNpisrcHG0DqUL4XtgD4TjhfNkjh3ln8ZS3NMBAzE9IAGlttnKcpTgHabkrMgD8k+xxwbo/e4mOW4ePScBoHf+4XjUxvcgSrEcEX3Qz7A7rTFD/xmT5Eag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vP4++gMVso6NJgCf4yKAKkzqkAKXxdKz2sTcPjJo/tU=;
 b=XdnV6f18gFfYu84xbJqdBm4ITprlWHxGGLhkZTDa0aTEF7yjItG9IYa9RTZhoSb1oigwMbnAU8i9iYG8GAJZTjabTaIIqtTUPYHHNMLGSq7h+DEKqJQPDMiKWpmcVXI4CnVv4ox4uHImagUUuezPCtyUd+DDcNWkb/TsfIiX07HGIUozuetByh+0rQu+uaCmAdlYY4EILHwA4ig2hL3/Omq0ZPBcrS7/1jczyoo3fzcGzlbVZ4JN/FBx1g8s+ZLaMYC8ULcp1cltMqxkc7oBBXL9d36CMI8ulrd/1Nx5fdNvgWBiomNtNcuIVLNDFDdTqpcuY0gz5flMEm2E8P0icA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=amd.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vP4++gMVso6NJgCf4yKAKkzqkAKXxdKz2sTcPjJo/tU=;
 b=tEE++2dfMDlTJzM8Ningz0Y7zdMulXPkYYEh9lT+IWOnuPMQ3C7nU9fnt8Mb1xaLZaT8I7DVfSERJerzRKHktXcm/BGxEzeS7XQmdC4XtE8Z6Ca+CnEixqDArKouNd/JYtHtiRAGKL1BGSrPgj49YP4mkuTe0lolVihWRhZfI6IKBrTzJ/67LKcY9V2DYl8JPUbztdgQGy7h1XlRCgWf+N0wcpAkdSTd9VQ8OOoswwFH6clQz1r44imsIpDbm4N9TxC5sw4JycRdT+dEPh8F2kwGH6UMH5x8SWE7FO/vXgbPRbO5eHu/jgirkBeGBEfrCQKqYRiqke4Qoxr0JI+DUQ==
Received: from CH2PR18CA0021.namprd18.prod.outlook.com (2603:10b6:610:4f::31)
 by DS4PR12MB9820.namprd12.prod.outlook.com (2603:10b6:8:2a7::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.27; Thu, 10 Jul
 2025 06:00:42 +0000
Received: from CH2PEPF00000148.namprd02.prod.outlook.com
 (2603:10b6:610:4f:cafe::1c) by CH2PR18CA0021.outlook.office365.com
 (2603:10b6:610:4f::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8922.21 via Frontend Transport; Thu,
 10 Jul 2025 06:00:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CH2PEPF00000148.mail.protection.outlook.com (10.167.244.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8922.22 via Frontend Transport; Thu, 10 Jul 2025 06:00:41 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Wed, 9 Jul 2025
 23:00:21 -0700
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Wed, 9 Jul
 2025 23:00:21 -0700
Received: from Asurada-Nvidia.nvidia.com (10.127.8.14) by mail.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server id 15.2.1544.14 via Frontend
 Transport; Wed, 9 Jul 2025 23:00:19 -0700
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
Subject: [PATCH v9 19/29] Documentation: userspace-api: iommufd: Update HW QUEUE
Date: Wed, 9 Jul 2025 22:59:11 -0700
Message-ID: <caa3ddc0d9bacf05c5b3e02c5f306ff3172cc54d.1752126748.git.nicolinc@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1752126748.git.nicolinc@nvidia.com>
References: <cover.1752126748.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000148:EE_|DS4PR12MB9820:EE_
X-MS-Office365-Filtering-Correlation-Id: be660bcc-5d0e-42f0-e9c0-08ddbf771a44
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?bW7VireCVAH5sxEXAgWz6H3O/5Vy63iNithyX3DBrLRS0cuAtpS7LCoAMXrf?=
 =?us-ascii?Q?+FuwMgXEWMkzBAPVVXnDOI9gbOwC9hzxnTYdzkKsIYoZPdAIkNvxeQWbZnh5?=
 =?us-ascii?Q?/arkZ6w7M5xcerTQDlRVk2J13lrjNj8QtcmohaLMi0hWxLZ7k+i1hchmUFbo?=
 =?us-ascii?Q?eVsHnLxE0lgefMTvizYhKFW9CSvdTA4cHU5bEUaKeAwwo2yabOchhaMqDe5y?=
 =?us-ascii?Q?isZ7+VWqK/gVzCBWLs+NyDi+slhNYbVbiUQwHp7KwlO0GmCqX+4zVhVaTuL6?=
 =?us-ascii?Q?0dppSjdStGUU8N4kS8SVQBY36GSbTytkoVixkgVzhZMrTnpd+eGSzRCHrBTx?=
 =?us-ascii?Q?+xiZjsPKOnICKJMYGX0BTMsZ9KadNDvzXBDij1d1D2UkhYRfARN/Z+v1T6gN?=
 =?us-ascii?Q?Qcwribbi8AQObVaBHd0Az8lTxI/K6mr3DuMYiiNWw80VFSdUJwsaLwDYVqx9?=
 =?us-ascii?Q?uqOsx1LGn2Q0CT3OGHS+NAxHY3kPn5A14xtQsTSAg19P8IH4netXvLlOqoNl?=
 =?us-ascii?Q?VFqdr6xvtSc9HM2p8ik5DI/uO6C/J8DB/rUtYyw0cXjERRxVel3z/CpKZWek?=
 =?us-ascii?Q?TrIy/mRlJOygE3O61ixE686C14+HZ5QlbZDLJxXQ38sCvA+diacTSf2Erxy3?=
 =?us-ascii?Q?ROquV1f1PWc8H0VFISDtBav9QX8QVrxr4kSMvkT1zhZFX8Q1AqBOKyHHhxOY?=
 =?us-ascii?Q?3JSMqSa5IRh2+kgtgY2JaxArs5M8mJ5pD41Ur8RhtJ+RKpppLG4myMm2cNSF?=
 =?us-ascii?Q?q3mBU7fsVe56nctTaymQcvTbfATymzrrnDlP6874Nn+BastS4y4PJVfka2K1?=
 =?us-ascii?Q?6CP4PblRnZs7fd6FUxfntcGToIHhqrCQlP3qP+RIUcu+ZwOcBQ/+P+viBk6A?=
 =?us-ascii?Q?tjK+epmnx3ICIAWmqggnz8OrBGCRAfgFJVqTV0pj6CXXTQhulklaUuzy7bHf?=
 =?us-ascii?Q?fHgOZ6NlPx2Q0GyXzyTMjrDG4I9dwIRVhO/QxUbV8924dp2NS8Qn1fd/AD4y?=
 =?us-ascii?Q?mfD0Z9upOIvRqZ0335J/3/AXIpJ85733b6zil9vdKWMrrk/K9DG26GwwOFYd?=
 =?us-ascii?Q?NzrHFzrdCgBuhkiR1R9zR85h44R/ghf2zXoi5WwXONggOvl0qUonR3SXw1sw?=
 =?us-ascii?Q?vfMjyV/byDUJRAgb8Hss3D4A68mt+AdM0ku5UjtAtAUOV01Cb9yAXgdxNVn4?=
 =?us-ascii?Q?n0/NmqD/cYNZ5rumDetGkd6AS0/STRnCaunVLJ0Ij3XtKBsx97Xh6LM7oJ8V?=
 =?us-ascii?Q?YiCGa3pw5SgafKlUhjmY+B18w/0sQmkUzJUId4DGWWrBVbjs5ppB3euAdMHy?=
 =?us-ascii?Q?lGiWa3w0FkGtRpWkLMgazGwstHKgyqX37G8mWmPc1sQYhcbJaXzQ/I3RrqA1?=
 =?us-ascii?Q?FCeK2nO2tnS+Qz8VYfu1J/g9JBrOlKKLp+mpo7pss9MTEfOHl6eqSvbCjJhl?=
 =?us-ascii?Q?zCYdsg4kwvk4uDPtObJ43wz47Q2qIQhZSMUulX8X2byT/KatgImT/aIqlE9/?=
 =?us-ascii?Q?7PxSCUiPJOUDUUdFPcWzB9/QcBIGwOlOvZTx?=
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014)(7416014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2025 06:00:41.7114
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: be660bcc-5d0e-42f0-e9c0-08ddbf771a44
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF00000148.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR12MB9820
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_230046_405993_93B2DE7F 
X-CRM114-Status: GOOD (  11.74  )
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

With the introduction of the new object and its infrastructure, update the
doc to reflect that.

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Reviewed-by: Kevin Tian <kevin.tian@intel.com>
Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>
Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
---
 Documentation/userspace-api/iommufd.rst | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/userspace-api/iommufd.rst b/Documentation/userspace-api/iommufd.rst
index b0df15865dec..03f7510384d2 100644
--- a/Documentation/userspace-api/iommufd.rst
+++ b/Documentation/userspace-api/iommufd.rst
@@ -124,6 +124,17 @@ Following IOMMUFD objects are exposed to userspace:
   used to allocate a vEVENTQ. Each vIOMMU can support multiple types of vEVENTS,
   but is confined to one vEVENTQ per vEVENTQ type.
 
+- IOMMUFD_OBJ_HW_QUEUE, representing a hardware accelerated queue, as a subset
+  of IOMMU's virtualization features, for the IOMMU HW to directly read or write
+  the virtual queue memory owned by a guest OS. This HW-acceleration feature can
+  allow VM to work with the IOMMU HW directly without a VM Exit, so as to reduce
+  overhead from the hypercalls. Along with the HW QUEUE object, iommufd provides
+  user space an mmap interface for VMM to mmap a physical MMIO region from the
+  host physical address space to the guest physical address space, allowing the
+  guest OS to directly control the allocated HW QUEUE. Thus, when allocating a
+  HW QUEUE, the VMM must request a pair of mmap info (offset/length) and pass in
+  exactly to an mmap syscall via its offset and length arguments.
+
 All user-visible objects are destroyed via the IOMMU_DESTROY uAPI.
 
 The diagrams below show relationships between user-visible objects and kernel
@@ -270,6 +281,7 @@ User visible objects are backed by following datastructures:
 - iommufd_viommu for IOMMUFD_OBJ_VIOMMU.
 - iommufd_vdevice for IOMMUFD_OBJ_VDEVICE.
 - iommufd_veventq for IOMMUFD_OBJ_VEVENTQ.
+- iommufd_hw_queue for IOMMUFD_OBJ_HW_QUEUE.
 
 Several terminologies when looking at these datastructures:
 
-- 
2.43.0


