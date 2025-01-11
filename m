Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C8CBE7719A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 11 Jan 2025 03:43:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jW6Pq5BvBZxpZfbTA763N6VG9QhIse02tukp7etJk50=; b=Jl393MjPcv5fpPoCHRHOQp+NfY
	8ybeOujCtPHci1LbH9x6GgwcxSRGQhtdbPJjmEFPaBSvkgFGvIN34Db4JXVs3GZOC3o/KP2EI8kBe
	DzY/i2QQoX98j7US1rKKEWeQohQNjFpaEh3z5L5TdHEm/f1mCscnlWilwVWvJoy4s/3Rv3KB2Kq/y
	ADq8bmnCyHOqwQEsEZ3ttPDgHibeoTVPcPPNM0YkWLYcLEL3veItF98HeSMuXfC8L13lRw1cxYRsY
	E64gZmJJvRv5o1bdof+F6Dk1+zzlJUmrlNBE8Bklcb0ZeZuffhBwPiPIwa1uRIzKvNEFsF7IEvxr2
	n6xE1J2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWSOn-000000005HH-2g42;
	Sat, 11 Jan 2025 03:42:57 +0000
Received: from mail-co1nam11on20631.outbound.protection.outlook.com ([2a01:111:f403:2416::631] helo=NAM11-CO1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWSFS-00000000337-0MlF
	for linux-arm-kernel@lists.infradead.org;
	Sat, 11 Jan 2025 03:33:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pL3a3H5b2vRNTV8xFXZ/vJHDXjAlHsfiAhlBkz/0pRXWV2mhoCglH71qcYNlkdZ1TJB/4hoy+vxZ3QbHbtVbN3K9xCP/kwhnfEUmiD5Vm+X24XJGrYW3SDHz5m4HZUM3kaFmB/rfDT39iMg093mX84Qs1S1zoRqz0kgB9eZ9gdrmheBC/kSUa4C0eUu0GVEIV1S+mDfxGVBUUoyhMCsW0UHmy2sX2tu5KYQM5R4DBOzfoKT6aw5dzbxCCFsIpIQnVQZRZCkgC7UjFuCS2nXRyr2IwDA/syCGlUd73r4sPmjutVC8GVTF03YqC7MeUzjMWqpJ2pcMMFhGVHTjwD2ZqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jW6Pq5BvBZxpZfbTA763N6VG9QhIse02tukp7etJk50=;
 b=dWwiGjlECsk9WPYb0WU7GXoX760ayOfCpT4FjU/Cfy0qRuMRAb9EWm/ypyzrfQTAcdjx355n0m/TfQ/wRcS0ICdSlMPU0+rOKM+9xWJmQC4WFs62XWVDTmQLiiOkUIC8O+ZExcJ35sc3ctZofRlTJaK9uVN78eAcKDXm5Q1egVmxgJzSRT1k+2Pp15HkYE4FBFmLhv7+eSZicZfBMz4wL9gfET8j4dlvEBr6LXbmdDSCshfOMt7CSzHWElA6VuUTJ9HmZXrguzqUb+Se6Sg356bIpsOTge+iDRJOJAqFyaBY7oMuE0P4demGMrJyJaYT6LXl2qC5PB+WCsb5wto4JA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jW6Pq5BvBZxpZfbTA763N6VG9QhIse02tukp7etJk50=;
 b=nzdsDzOrSEsxnidomxeL3GKOhNbWD1S0rKdSY2QGYSHQFGA0GyT8vm/jvfNgLGQUWRB0pErCBOJ5I8qUIugZe1OgpS05oxzgE/D+GFHJi/Y6xKKMjw621PZLFZjlpwZ2x6P57n878G++17EDM6sMybN7ad8cS7DbRKAROoubso6kDjwKFQFwLHk5IF08Fjpx1bMFINSFOAiZ0Ffipoe2AlH9ENf0Y0hhHX2R93yBJYCmdmXzPkYy6ptdXkIdnXEk26S/vYJSMhb64ObWxucA6/cHRSqId/kLp5lbvwfC9KyxMmebAlKkIkyUnITsdhJZBlgreYScjfzCx9JeawSakA==
Received: from CH2PR12CA0025.namprd12.prod.outlook.com (2603:10b6:610:57::35)
 by DM6PR12MB4171.namprd12.prod.outlook.com (2603:10b6:5:21f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.13; Sat, 11 Jan
 2025 03:33:11 +0000
Received: from DS3PEPF0000C380.namprd04.prod.outlook.com
 (2603:10b6:610:57:cafe::1b) by CH2PR12CA0025.outlook.office365.com
 (2603:10b6:610:57::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8335.13 via Frontend Transport; Sat,
 11 Jan 2025 03:33:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 DS3PEPF0000C380.mail.protection.outlook.com (10.167.23.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8335.7 via Frontend Transport; Sat, 11 Jan 2025 03:33:10 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 10 Jan
 2025 19:33:07 -0800
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Fri, 10 Jan 2025 19:33:06 -0800
Received: from Asurada-Nvidia.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.126.190.182) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Fri, 10 Jan 2025 19:33:04 -0800
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
Subject: [PATCH RFCv2 08/13] iommu: Turn iova_cookie to dma-iommu private pointer
Date: Fri, 10 Jan 2025 19:32:24 -0800
Message-ID: <42c6ff3090636146a86501528eb03df99f83381c.1736550979.git.nicolinc@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1736550979.git.nicolinc@nvidia.com>
References: <cover.1736550979.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF0000C380:EE_|DM6PR12MB4171:EE_
X-MS-Office365-Filtering-Correlation-Id: e27f3bc0-32d3-4dfa-9fd3-08dd31f0ac23
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?p/7aD+KdzgB12mQvC2Sxvfow+QtR3y/tPgA9Ucqob9ECHIBQcQP8DlBGIChG?=
 =?us-ascii?Q?ylVc/0KmrcbB5PNIUIlUMQo2ges7QudHo/bT5V+KUFjSRyfBdK1N0Rs95o7P?=
 =?us-ascii?Q?OOt1fVNAfbE///+aZnnoPuV8ENLQVnySlRLeZJo3XPUKSE0/Y8bnqkbzGzVs?=
 =?us-ascii?Q?GQSip+fsXridSDhe6c6Nq/ziW59cLdY7xzHQWEup5C2mKify0Nv1jmH8mYUy?=
 =?us-ascii?Q?o7BwQo3eCeDnFjU8SttnFV+Or06kI/KxDTI0WRJTBVYO+MDA2fbOm22qPnyB?=
 =?us-ascii?Q?aUXwxa6bhVF6DNVBUzzYGihx0kcroONVtvKEDZPjC7taU30yIhvfqU6DA909?=
 =?us-ascii?Q?2k0/ImE9QiZ6iXWSd0N5ZYC8TFBniQga1oXwKA141b8znIYRNHMcklZ1okPd?=
 =?us-ascii?Q?TUU4nojxV+r+wJ9Jsy3n8PBjN+SWcn5iZITHy65fN7GCOYjojfgKNjpnNTei?=
 =?us-ascii?Q?zgQ+OwL35OVM9fah1ihE9zbWsa0D4e/be4S7vTTK3nU4UttSbob8KpvR/mMs?=
 =?us-ascii?Q?BlbUyDfMh2eDRLjQbo1iYyewfALvt9cg2KL7xkt4dR4CFkKoXBgqi3AIWAt/?=
 =?us-ascii?Q?OtdXiJaA4VGhN4RoPQ5Ztgf/24fzeSnr9CrNwsPNJru5TEsJm8ABkqPtGO52?=
 =?us-ascii?Q?jLMlEHSwmz1sn6hY294dYHYR7rOleNkncYpoffz1PmjK0Gvh5pD55D5bF/Cu?=
 =?us-ascii?Q?6Uv8H45/hNGzVfzP3VrYQDNNWIPuvZiUTNdCnsbdiVrap6mnNDlqfsg0brsk?=
 =?us-ascii?Q?RNscjapSBFdPyizRQlIHMdREx/lQpZZ9rXGC/HFxJqly61qJ5UltH8e814jm?=
 =?us-ascii?Q?EyuTaTer1rt7VMUFJiz74arcnfD7flfoUimW/bDOPRVH2o+PpTQ8DbuTqpma?=
 =?us-ascii?Q?0mgp4fEF7HP5LEW3YhaRcrqxp0HWy+H3BuTfoYq8fll3SS7Bo3E20MpdC4HB?=
 =?us-ascii?Q?hCqohRBmzwBLxPDmzvkNyJwoZ8aO1MoqmVP+L2SexuF0T53ZNkliE+3pqbol?=
 =?us-ascii?Q?au5cgKgj0dbEQRk/us+2b2OW7pOb3LIHo+nmKhj8+kTfdWd+IndFOwMLKntB?=
 =?us-ascii?Q?hD0GUbGJx776vvlvLkZ221qDGPV1NxaAbd/Im1fXvONdPTHQgerJJYQWIGMs?=
 =?us-ascii?Q?m8RVcw3Km1DvC21zqQlZVCCizueVxWvJaksxI4oHA+PQZRWl6NBiAJLHuhYa?=
 =?us-ascii?Q?ZGI0XMlSYVkMQO/FsTanJV7vZUoSdVp60q1cR1jbewg9Sjh/W+LIXpTfa2Mv?=
 =?us-ascii?Q?P7qBRIVUYO4TMUS+d49jTF3omu0fR2gMR9mzCzWDeDvigOVgOA5AI8z//eXT?=
 =?us-ascii?Q?8+q9MWLuf7WZrlXLcLyl6Al6ZRAa0hjPsB3PJ5uK25pxvwxVu7JO5yIrx+jx?=
 =?us-ascii?Q?vlvQdN9Cc44pJ5Ble8lONHhHqgQZK6kATjjdmFVQkLKV/+zEx3anxpiz+Cuf?=
 =?us-ascii?Q?U+tZq1ni4ONENO1mTVRfUUQZURBCQecXlYEm+ImagJam0XxWFjM1xjBprkIY?=
 =?us-ascii?Q?ReUMlUAPeNe2CRw=3D?=
X-Forefront-Antispam-Report: CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2025 03:33:10.5312
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e27f3bc0-32d3-4dfa-9fd3-08dd31f0ac23
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF0000C380.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4171
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_193318_167137_A7ED5B6E 
X-CRM114-Status: GOOD (  11.84  )
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

Now, iommufd has its own iommufd_sw_msi using iommufd_hwpt, the iommufd
owned domain's private pointer. Similarly, iova_cookie can be seen as a
dma-iommu owned domain's private pointer. So, move iova_cookie into the
union.

Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
---
 include/linux/iommu.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/iommu.h b/include/linux/iommu.h
index b6526d734f30..284c40fe0e12 100644
--- a/include/linux/iommu.h
+++ b/include/linux/iommu.h
@@ -216,7 +216,6 @@ struct iommu_domain {
 	const struct iommu_ops *owner; /* Whose domain_alloc we came from */
 	unsigned long pgsize_bitmap;	/* Bitmap of page sizes in use */
 	struct iommu_domain_geometry geometry;
-	struct iommu_dma_cookie *iova_cookie;
 	int (*iopf_handler)(struct iopf_group *group);
 
 #if IS_ENABLED(CONFIG_IRQ_MSI_IOMMU)
@@ -225,6 +224,7 @@ struct iommu_domain {
 #endif
 
 	union { /* Pointer usable by owner of the domain */
+		struct iommu_dma_cookie *iova_cookie; /* dma-iommu */
 		struct iommufd_hw_pagetable *iommufd_hwpt; /* iommufd */
 	};
 	union { /* Fault handler */
-- 
2.43.0


