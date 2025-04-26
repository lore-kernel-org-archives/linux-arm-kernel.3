Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93A43C369CB
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Apr 2025 06:29:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RVYw/LCG3F/q+xym+iAug0uqNnmWqcMHCyidBQEONys=; b=zKvQxMS6zeXvHs9wN5jp0MM7uB
	+6qdhWXx8AxqjiWy97pCOuRDUY7Oyxxv1udg8I3fb8+8fihxTxLufzhYTGCMZJERgnF0pHo1e0hEH
	+gkt6lCeNAJaYCTiEe9VdkwXvsBunOqmIuMy8zrH7oLbCbZw+O6mROeSB0B3DUAB8x4fHez4OMsET
	pFqC9EIFQIf0i9srwb8bj54heA8HuEoteusT8VVv7zzYQR8LTtiC6Yg1VZHeK1+VI0+1ifPrwddsS
	HMdRDllYQE0Y8kVgk+ThQEU+EJ223+k1Fqbdb+ZLsHHN/aXWU2tVdl2OJBzBHSrkJ2COYISDuqK24
	SmcVPJ5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8Z2K-00000001Yos-1syI;
	Sat, 26 Apr 2025 06:29:16 +0000
Received: from mail-co1nam11on20611.outbound.protection.outlook.com ([2a01:111:f403:2416::611] helo=NAM11-CO1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8YZY-00000001TtT-3ept
	for linux-arm-kernel@lists.infradead.org;
	Sat, 26 Apr 2025 05:59:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rHyGErgb9mwx1uq2v2l6GRcnCfS6FrjDxcMDMqhiGpmEanP8LexvkmBtNMWjHSMFYeTBqpTtaTZac2wTxPGioJzwLzJ2g7A7czmTXFu6W0ApkFzw90P7fLXKG2pyFOTd/xW/iWkzki4ZvBXy5SOTCg3CvHweXP6FKZfzjbq+HX/fsXdhT9IZO5j0rpeJTZ4d4ld/9RZGag3rnEFb3ZEM3PGH/GxelPAXDPTNW1ghNJA8SSsp65XWHj4yEVn88UYNbJYvCexcIQJCTv8+J6ViJOBtgWItSdBUkRFrp9GPuUxowbRGpxHc2MpodyLSXQXNLcOQngXtMjZmdukP6BrEGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RVYw/LCG3F/q+xym+iAug0uqNnmWqcMHCyidBQEONys=;
 b=uZEEfs19GalmSvQRzPmQH0mvfV3gDxl0fQWjk1x5PNsnTPRgC2Kdoy+OhgbH3+58XJlIJ13RrBh3AXQ4wDE3Fk+XcpAzr/cQJgLo5xfxx/7anClOI7GTtwY5cK3BmBRs60tPmjtWfol4k+q0spWAXy5xavkJiTcKAYWwaUWMQikKUNVs8bdES0dofiFhEoFsFQROgX1APSnFkP4R6zqMCcy06pztyV8OHHbCP2i68cN9tKS7Ql3+C76NO/Bse2kP1UVx19zL1Uvw5cG+oMv1l2DSnqvuRXUqlWJG6zDE12oiOZdAsKovIKtU4vKbAffrCR7qLkx2Sf1+1Uqtfftz/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RVYw/LCG3F/q+xym+iAug0uqNnmWqcMHCyidBQEONys=;
 b=IQfO5iw6W+jY8kfiWfmsAmyVX5a6eRBXoSBlHVG64O4NAWmQDF8MGuBK8V0cY+z3MaPiF97+k8hzey+5e/WukcOPFJoar9LeSLTdwrGNQHAEBM2+DOBEoM/VSNpPG5vz8uDHe+36yBvw5pXhzEni9dFJwAJ9R84gJnF9LP4i/0ONeym5H/OXQPL2g50oDnMclofs6piwJ7G0MZQlMuHC22m1DkyUGh3hEPNJcydp+SOlNhsdnhMm8/7uAdGbe/FpJWpOyKvJewOWUZryV/+nN6wbQhlVo6zKytQjRVjhcvROUA7iJt6GIkWoSShujcQMGF4XFLCsg4T4jjBC9Q/qXQ==
Received: from SA9PR13CA0042.namprd13.prod.outlook.com (2603:10b6:806:22::17)
 by SJ2PR12MB9164.namprd12.prod.outlook.com (2603:10b6:a03:556::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.27; Sat, 26 Apr
 2025 05:59:27 +0000
Received: from SA2PEPF00001505.namprd04.prod.outlook.com
 (2603:10b6:806:22:cafe::29) by SA9PR13CA0042.outlook.office365.com
 (2603:10b6:806:22::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.34 via Frontend Transport; Sat,
 26 Apr 2025 05:59:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SA2PEPF00001505.mail.protection.outlook.com (10.167.242.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8655.12 via Frontend Transport; Sat, 26 Apr 2025 05:59:27 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 25 Apr
 2025 22:59:19 -0700
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Fri, 25 Apr
 2025 22:59:18 -0700
Received: from Asurada-Nvidia.nvidia.com (10.127.8.12) by mail.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server id 15.2.1544.14 via Frontend
 Transport; Fri, 25 Apr 2025 22:59:16 -0700
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
Subject: [PATCH v2 15/22] Documentation: userspace-api: iommufd: Update vCMDQ
Date: Fri, 25 Apr 2025 22:58:10 -0700
Message-ID: <820dfdee121292fe4cf891feb86f82ceea521e22.1745646960.git.nicolinc@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1745646960.git.nicolinc@nvidia.com>
References: <cover.1745646960.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00001505:EE_|SJ2PR12MB9164:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e5349e7-6805-4fbf-b5ac-08dd848780fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?3P7cWS+CX9k9gTmXjgD5Fp1fxr8Y15ZYLbW349zAMf1Peh/6Ux4yW5Y4RGnY?=
 =?us-ascii?Q?rvsirReMJ1n0BVwe/DuanjCLH7w8Ftdng2GbKk/60yGNiCxOHgDKJOmJp9fJ?=
 =?us-ascii?Q?VWhsKWtXvofBhCaoUuFXVWKMELTWH7MOV5eTIA8AMoHxObCGJbKqxXj1a+Qz?=
 =?us-ascii?Q?/OChnT5Tnr4kP1N8yaZukvoujst+qI1QmnbJsOp2zoKM4ljUjKSWacIUCXtV?=
 =?us-ascii?Q?cLXv2w3MZ87qSu56xaoSM7sOEPbgrKvqCkYnhEEJZUNGMOBnI/U0vTtdDxiB?=
 =?us-ascii?Q?48i7RS/Cj8ddNmk8bm53fIWhO66svSYQkcgmSZ0LFr2cplHkvI7BK+bPYk3z?=
 =?us-ascii?Q?21biUk54tEx9tjUPNzYTq40+natfS3QP6TSNS7je1OJMkkflLazG1JBcvbDI?=
 =?us-ascii?Q?pjxmoBY+rWdAjQ8o4w7/A7i/0mmZAODeoRe1ow8uT77P+CtcAHvh0QuSUy4v?=
 =?us-ascii?Q?dcG8bbnfTRdJqD7KWLjK9rVHHyODAt11sYVd2nZLDbez1N/IORbTxdLX/EZG?=
 =?us-ascii?Q?UBDqwvx8OYlvvfWk0+sptfalXhD0907monGcHDfBNmIitsosGvZkVRJHLkaG?=
 =?us-ascii?Q?lLQqZytbVRdSLGYEmLof0ILvme8WiDQVX87KlMyyhK8QSNr/e8GRK8JBCDbQ?=
 =?us-ascii?Q?+nsjS5yw+vswGE7gMMAdn7HVtfOpmoSHIf/N5tnaIBZU88fkQq5hBYQrRw9N?=
 =?us-ascii?Q?ajwIabNhzNzX8stRzINAks6nk+WBddaAJYZ9HSf3wMJOP0kAHgrkZmw8oKZ3?=
 =?us-ascii?Q?baCIQp2fyURK0smfwmsoFpeznrd+PrYhQh/utA5c5sj7y5Yt1mBvEQ2GU9Qh?=
 =?us-ascii?Q?MJrixjM788bPlzMLKEogNRxxTFH4v/Lm6az/MLv0SDr3LPIWy3cALJYTCKA8?=
 =?us-ascii?Q?n5ZE94jnHvbkky5osaY0bsLo710NAfKya4qDo9A8UpUpCnxTEAMP0Sd82d5p?=
 =?us-ascii?Q?VlZ7q4sRWy77qfmcv/P2UavRHzicnXbE0S8CyyAHEOk7V0qzs/MVHyGa0/E4?=
 =?us-ascii?Q?Y1oKGxBWMHlwcXHIbfHtM/B7XT7dFGq5GOaqGzGO2ROoqR+dPWrFdTlEK42I?=
 =?us-ascii?Q?utjY7cpZ6RMr8PsUYm1wlhFKzkC1sRWmymSgzez9X1yjEI5M2NOtMYenS/bg?=
 =?us-ascii?Q?aYjWf4cg1JF/r2UL+QLS+eZXQwF1yI+F27r74Cc6wx+5hUV4fm1OOmfRzPV0?=
 =?us-ascii?Q?ShJ12PUbFeh01k+Hj0rQBWe74Vt9Lay4VH3HgQG+FRKEwGEi/NZMWu+hd7Cb?=
 =?us-ascii?Q?s8/CnGVn/wwNHOyqL9/kPICBZHUmh7pTH7VOr4S3Gw7ZGLLSUpDbx8DaySXU?=
 =?us-ascii?Q?DZP1iLFnkjRFADVnycuZrE384PsyESflw0R0OqnvqXhlpk0+rytLuN5O93CD?=
 =?us-ascii?Q?MJ5WNEhhLFi04bZUiNWj0SdLUIZJvq96PH8wgpn7vaA3f98lVIIbfJV/0ZB5?=
 =?us-ascii?Q?HAQx2fOugpBrkJQNWUzJrxtuPQ7PpVOm5EMp7+xQ70zib2ehplBHEqGUdfNv?=
 =?us-ascii?Q?JxcBOtCJYkpFDuYgIeQliRqpKAasVWQUzKyX?=
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2025 05:59:27.5012
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e5349e7-6805-4fbf-b5ac-08dd848780fe
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF00001505.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9164
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_225932_912327_A25006E6 
X-CRM114-Status: GOOD (  12.08  )
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

Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
---
 Documentation/userspace-api/iommufd.rst | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/Documentation/userspace-api/iommufd.rst b/Documentation/userspace-api/iommufd.rst
index b0df15865dec..afca749652ee 100644
--- a/Documentation/userspace-api/iommufd.rst
+++ b/Documentation/userspace-api/iommufd.rst
@@ -124,6 +124,19 @@ Following IOMMUFD objects are exposed to userspace:
   used to allocate a vEVENTQ. Each vIOMMU can support multiple types of vEVENTS,
   but is confined to one vEVENTQ per vEVENTQ type.
 
+- IOMMUFD_OBJ_VCMDQ, representing a hardware queue as a subset of a vIOMMU's
+  virtualization feature for a VM to directly execute guest-issued commands to
+  invalidate HW cache entries holding the mappings or translations of a guest-
+  owned stage-1 page table. Along with this queue object, iommufd provides the
+  user space an mmap interface for VMM to mmap a physical MMIO region from the
+  host physical address space to a guest physical address space, to exclusively
+  control the allocated vCMDQ HW. Thus, when allocating a vCMDQ, the VMM must
+  request a pair of VMA info (vm_pgoff/size) for a later mmap call. The length
+  argument of an mmap call could be smaller than the given size for a paritial
+  mmap, but the given vm_pgoff (as the addr argument of the mmap call) should
+  never be offsetted, which also implies that the mmap will always start from
+  the beginning of the physical MMIO region.
+
 All user-visible objects are destroyed via the IOMMU_DESTROY uAPI.
 
 The diagrams below show relationships between user-visible objects and kernel
@@ -270,6 +283,7 @@ User visible objects are backed by following datastructures:
 - iommufd_viommu for IOMMUFD_OBJ_VIOMMU.
 - iommufd_vdevice for IOMMUFD_OBJ_VDEVICE.
 - iommufd_veventq for IOMMUFD_OBJ_VEVENTQ.
+- iommufd_vcmdq for IOMMUFD_OBJ_VCMDQ.
 
 Several terminologies when looking at these datastructures:
 
-- 
2.43.0


