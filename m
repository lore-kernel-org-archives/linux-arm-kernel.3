Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BA26C369DC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Apr 2025 17:17:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kruR6bWWOlnzfkA4gkSvY4hRWIKumokxk7j7hVm+VWo=; b=nNNpUXL3fmLevY+lh0Ve7Cfwar
	lygH+xv/eB5CMJcw4Y4kEm3IX75+q4OWGtQV7TSGzFBlZPnZLolsycwDYq/sQgCBQ/c4NxX7M2gPY
	gXVHDeJz2hsm/TxyZHaq/9rJ2XjDnuOWPoRb2UFyW7hD3uiZgK4fgudNfqCpmq2mLOAn6tTe3AOzu
	kDuk/23Cb/3BZYTQqE/FicT2tVOqEuz/fMi3Y2nEfSn5F/u/Ij7s30TxhJEcyeGdbxWVc4SnW0GaS
	tXr0SvDWKo+FMNr5O66aCaiHg81903gokcykFvLWLhIUSYY7Me1qVPjrIVv47thJur4HtcRFLfSBx
	yGmQgkxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9oa0-0000000ANlK-1z9I;
	Tue, 29 Apr 2025 17:17:12 +0000
Received: from mail-dm6nam10on20610.outbound.protection.outlook.com ([2a01:111:f403:2413::610] helo=NAM10-DM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9oY4-0000000ANVh-0ouu
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Apr 2025 17:15:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NGjNwyiD15y7GeASIlru+9BoKsj2DlovVZUrQfkJICNmUVIwR5erToeXMrBtc/rPhffpQIkHaNtudEjF8Ik9YItynAqVGD5wBOVlTLjRxRXz8myh1hdOCyh6KdcmOWDDLqwhBj8K0m0PZwxBu+ObYlDW6u2VCVnyuo+64lp7xgymqjr2D1fZA+9vfOf+GWvdrQQtaYeuYN1A3PMDVNcLoqNHOeKjc+ZApHM5c/ErpE+niQEizmrqfONYyJZ7B09t9pRrYNvkmDKkj4Lo6sdkbSlMIRrP6Zfh8dUmG3Qpif1c24QQq3KfvHtCf9QYVtpWn/jS0rI/uwJZCv9ha1hvfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kruR6bWWOlnzfkA4gkSvY4hRWIKumokxk7j7hVm+VWo=;
 b=lHd4xW0t6hFr4Rqr5eE0VL1ythFVH+HAAPSw1Glo00AyB9H6a+y5nqCOb0iPrkEtzW6JeEzmMOW5KXUIXaEePNQmkfJOlQkF2ipyHVS5dty7H8ChjaeF5Clz/4aPy/smL/N6R+6cxufHRsACsc4TvIq6xWMy0ziJY9FUXY1URRnxFAIgStD8cY4/lHRN4xHHEMD7z7745yzeLKdbT9iGr+qsGnAnHHOS2zK72Q2Wr1g3M81sU9AHgLQmeGSI4FzTwT86pSJ7wbZDq9mmpbSCVhyUzneqcKjweFdFRJS/clDsTPFSrI0QQrFvp8dcwn1CkOgc+1rsV9P2Uy1miNkr9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kruR6bWWOlnzfkA4gkSvY4hRWIKumokxk7j7hVm+VWo=;
 b=TQzKFRugDRaVFKxp45hPCnEDJ5cLP0FSJ/1zAjhXCMntRZrlYba0723VOSnq3tLqsc0TAiNrmHVo06uFCE60/+dXudV7OmIWlCr09Z2YLQsQmfH9hKFvpr6Un6aeTk9h3uE1ONWpeGZ+zFaIMr6mpETZYMRGWkrfsvFqWTaxEG0Fd0hb0lG7RMPK2FObxWynFxA3xAKabJnmF7xaYmb2UeIx97+4XB26yeaUGkHFMpPgOO4z8QhmQVEghvBWXHq7rNauW+FNtECheM5vJklMQ+xuSDMsAMk83ioO6c8HNkI2uboaNjaV14b2h3XcT1ZtteYzN5V+FzuT0+99mz4B4Q==
Received: from CH2PR08CA0015.namprd08.prod.outlook.com (2603:10b6:610:5a::25)
 by MW4PR12MB6778.namprd12.prod.outlook.com (2603:10b6:303:1e8::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.29; Tue, 29 Apr
 2025 17:14:54 +0000
Received: from CH2PEPF0000013C.namprd02.prod.outlook.com
 (2603:10b6:610:5a:cafe::67) by CH2PR08CA0015.outlook.office365.com
 (2603:10b6:610:5a::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.35 via Frontend Transport; Tue,
 29 Apr 2025 17:14:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CH2PEPF0000013C.mail.protection.outlook.com (10.167.244.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8699.20 via Frontend Transport; Tue, 29 Apr 2025 17:14:53 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 29 Apr
 2025 10:14:38 -0700
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Tue, 29 Apr
 2025 10:14:38 -0700
Received: from Asurada-Nvidia (10.127.8.14) by mail.nvidia.com (10.129.68.6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14 via Frontend
 Transport; Tue, 29 Apr 2025 10:14:35 -0700
Date: Tue, 29 Apr 2025 10:14:33 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: <jgg@nvidia.com>, <kevin.tian@intel.com>, Vasant Hegde
	<vasant.hegde@amd.com>
CC: <corbet@lwn.net>, <will@kernel.org>, <bagasdotme@gmail.com>,
	<robin.murphy@arm.com>, <joro@8bytes.org>, <thierry.reding@gmail.com>,
	<vdumpa@nvidia.com>, <jonathanh@nvidia.com>, <shuah@kernel.org>,
	<jsnitsel@redhat.com>, <nathan@kernel.org>, <peterz@infradead.org>,
	<yi.l.liu@intel.com>, <mshavit@google.com>, <praan@google.com>,
	<zhangzekun11@huawei.com>, <iommu@lists.linux.dev>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-tegra@vger.kernel.org>,
	<linux-kselftest@vger.kernel.org>, <patches@lists.linux.dev>,
	<mochs@nvidia.com>, <alok.a.tiwari@oracle.com>, Suravee Suthikulpanit
	<suravee.suthikulpanit@amd.com>
Subject: Re: [PATCH v2 10/22] iommufd/viommmu: Add IOMMUFD_CMD_VCMDQ_ALLOC
 ioctl
Message-ID: <aBEI+T7P+hV8Y6tU@Asurada-Nvidia>
References: <cover.1745646960.git.nicolinc@nvidia.com>
 <094992b874190ffdcf6012104b419c8649b5e4b4.1745646960.git.nicolinc@nvidia.com>
 <b0d01609-bdda-49a3-af0c-ca828a9c4cea@amd.com>
 <aA/exylmYJhIhEVL@Asurada-Nvidia>
 <b8338b47-6fbf-44ac-9b99-3555997c9f36@amd.com>
 <aBB1gLfahnLmn0N1@Asurada-Nvidia>
 <a3860aed-5b6b-4e68-a8fd-1a6ee28ba022@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <a3860aed-5b6b-4e68-a8fd-1a6ee28ba022@amd.com>
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000013C:EE_|MW4PR12MB6778:EE_
X-MS-Office365-Filtering-Correlation-Id: 5dd9d4b4-c0da-4a37-1524-08dd87415bc1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026|7416014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?6M/IA226Rb5OOncApanguEvg5AxubrK6K9Mf10xDj54L2kMbXLCTdPdZGVV9?=
 =?us-ascii?Q?h8F+LtUniHBw6E7PO9Zfd2jeutyYyLEZ7WmL2RIEQL62hw+Ug8qb1V442fzc?=
 =?us-ascii?Q?3ygfohHmBC7VAZrrvk1RZ2QEkC16E+4K335CPKQAXxdQaDXMNUbS/0q3GMN/?=
 =?us-ascii?Q?lPjFvJzGlzR6OSCxuWv15MsGCdWKquiwb+Mh4do2cYDxCVJ8HETgFz50qXEf?=
 =?us-ascii?Q?bjbU3y6H75DdlCNlQ9+YXt8rDVRW6zqOJOpud2vOnbFEUCv8nO4J7CjIGmvV?=
 =?us-ascii?Q?cIZK08lcHPhBRlYBNZlMhTu4n/5MWJU/TG7lJsp3iB44OX2fciBn4ZBlgPzU?=
 =?us-ascii?Q?nhIgx1+QjUirMSzVNYfIXuIC71sQ/NiAMtaYFDv/Uv9z0KchoKqlLU/5DLE7?=
 =?us-ascii?Q?PCvb39pHUns2y6/w6b/h6rL4frFH255LUlNZlPMfDVkDTg4Y4pz71/LNJBx4?=
 =?us-ascii?Q?yFql9fasCkC+orfrAEuhp8hbLulZywaXy5LhAT79JGY6CT18Scm/xYaoZmrA?=
 =?us-ascii?Q?hPtSJELIFuAvpdfXu/5ZXAJ6dbmHWmj/LyfRU1QRiTAjKD4PajMNvTvT9VlW?=
 =?us-ascii?Q?nFYx965d4vWXzsdrAVEcIR/ThsjqPYnRwp1mP8YMC84PScHuZGfbFS2EllSc?=
 =?us-ascii?Q?ejru1dNvBDSsfSk95Z/eYWzsCdmB5XNhC2m4QB1+JvRnOUjsEEOD0qqJMwDz?=
 =?us-ascii?Q?Xon5AoP09BaLaztsanE2pdGNSHeOfOxehyGkW0GO9Q7JhczTAU2anllqLKjc?=
 =?us-ascii?Q?rr9ftT0rNVjbeO9VEY51Ee3WGKHJSsGSCrNv8bQEdxAUUMmC1RowxUk+zNy9?=
 =?us-ascii?Q?zvwiWbxU5+YoXcGzORxDI/UlwD3T23SdqhynOtlxwthz59sm/ZgLHJibsCP5?=
 =?us-ascii?Q?ddskBkuKv48Alz2LkrwiACPTKUaiLvzSjTt5R2k5QCHwhcpH3W+LnkCKWrZ0?=
 =?us-ascii?Q?HvLi3NsVLjJ5+WDD7Y8/Pcd0E5jsvDbX5Wqks0weJeDFwdunmfC7/s8k0LI3?=
 =?us-ascii?Q?8xP7nHtQlkcUdch7qpSVFjyB3jkFay0/sO+5oL9AXPA7jNScNu17kwNglOVb?=
 =?us-ascii?Q?QANG0yT+ZUFnLgOKU/4Ycgz3luyb8c1Qmp1AdtRhwsoon0CHvNkmB+gveAQY?=
 =?us-ascii?Q?HSzx+5yFlbq7/lRcd3LN8Ev0Teez/T737+UE2+MbN6rh39yP4ZgGKcWkRGr4?=
 =?us-ascii?Q?uZrqdolrlF8fJluXPGyhdMbXVN5LKNFsQbQNjaEU2ym5JjHH3a0+Xu5rRaGP?=
 =?us-ascii?Q?+a59bNDu3H0TaAEgt0y2FpBNMA6kpUjeFFsvQPdAxZU0z91bthJNhnraxnVc?=
 =?us-ascii?Q?Dcl2H2rkr+7AfVHH0yy+b4q+u7OLLMRiwi6zIhztrFQdnTIe8eGvR17AZeqp?=
 =?us-ascii?Q?A9COUwF7bPwcUQCsG+KJ0kyIFnkXAAcOufTq2TMof3yY/cBXJh1eBNY2gJq1?=
 =?us-ascii?Q?pBtpIgyXa5bESaVZduODZ42dTP2EJ1FL2KtMqgOhj3rfXHGDaEJBX3NNDVR3?=
 =?us-ascii?Q?7rVJOYTyPSyTMMLPlEAcTy6y3zxzAeIgxMDf?=
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026)(7416014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2025 17:14:53.7238
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5dd9d4b4-c0da-4a37-1524-08dd87415bc1
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF0000013C.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6778
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_101512_230442_2D956FEE 
X-CRM114-Status: GOOD (  21.08  )
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

On Tue, Apr 29, 2025 at 03:52:48PM +0530, Vasant Hegde wrote:
> On 4/29/2025 12:15 PM, Nicolin Chen wrote:
> > On Tue, Apr 29, 2025 at 11:04:06AM +0530, Vasant Hegde wrote:
> >> On 4/29/2025 1:32 AM, Nicolin Chen wrote:
> >>> On Mon, Apr 28, 2025 at 05:42:27PM +0530, Vasant Hegde wrote:
> >>> Yes. For AMD "vIOMMU", it needs a new type for iommufd vIOMMU:
> >>> 	IOMMU_VIOMMU_TYPE_AMD_VIOMMU,
> >>>
> >>> For AMD "vIOMMU" command buffer, it needs a new type too:
> >>> 	IOMMU_VCMDQ_TYPE_AMD_VIOMMU, /* Kdoc it to be Command Buffer */
> >>
> >> You are suggesting we define one type for AMD and use it for all buffers like
> >> command buffer, event log, PPR buffet etc? and use iommu_vcmdq_alloc->index to
> >> identity different buffer type?
> > 
> > We have vEVENTQ for event logging and FAULT_QUEUE for PRI, but both
> > are not for hardware accelerated use cases.
> > 
> > I didn't check the details of AMD's event log and PPR buffers. But
> > they seem to be the same ring buffers and can be consumed by guest
> > kernel directly?
> 
> Right. Event log is accelerated and consumed by guest directly. Also we have
> Event Log B !
> 
> > 
> > Will the hardware replace the physical device ID in the event with
> > the virtual device ID when injecting the event to a guest event/PPR
> > queue? 
> > If so, yea, I think you can define them separately using the> vCMDQ
> infrastructures:
> >  - IOMMU_VCMDQ_TYPE_AMD_VIOMMU_CMDBUF
> >  - IOMMU_VCMDQ_TYPE_AMD_VIOMMU_EVENTLOG
> >  - IOMMU_VCMDQ_TYPE_AMD_VIOMMU_PPRLOG
> > (@Kevin @Jason Hmm, in this case we might want to revert the naming
> >  "vCMDQ" back to "vQEUEUE", once Vasant confirms.)

I think I should rename IOMMUFD_OBJ_VCMDQ back to IOMMUFD_OBJ_VQUEUE
since the same object fits three types of queue now in the AMD case.

Or any better naming suggestion?

Thanks
Nicolin

