Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80663C02192
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Feb 2025 22:58:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yXbZTfV7enqU/d0Qu+wv66UV1AX70M5onR0V5YskAKU=; b=vXTbAavYUQ+BfxuCzsKZoJNtfY
	IEnnPjf9yUi484+vGqMwKHoqhqi3g5AQSolPVP2CTBU6Xmh8gS7T4/cYocEQAonw5BaVQa/bx8vlv
	nKz1rOHQpO/OA6plJKloi8JyBUGx8ItFarbMT/B/vKKpOjZgMXfOtRAB56haKb3IetW7XdnqMlQvb
	IfroXYZChcfFycBLeqoxLu5UbyHrPQTXiiikytUMug0mz33vaniMhYnalC4D3+4McXTungZzmu3xk
	4MtJ/4F2MNuVJChnTbKiynX4LoeBHYbV6Fr1NVeYMmW/odQUUo8Ug0jhRfPZs8wuWRBqvGFjnLswX
	ZXlZGRQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfoLJ-00000004mgd-34UR;
	Wed, 05 Feb 2025 22:58:01 +0000
Received: from mail-dm6nam04on2060a.outbound.protection.outlook.com ([2a01:111:f403:2409::60a] helo=NAM04-DM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfoJw-00000004mXb-3Uev
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Feb 2025 22:56:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X3C0DG82sZibRXIn17vWjWEG05s/8boA0jStOe9RaHLNnGGdJEt0DP9tUHfqGVoN6nYor2hQ5pbgJP9HiEKBScPgMQYpQoMNb/eiFTIUyOHu4HMk4TEzdEYOH76PCzF2JIdNK6ynDdLjmwVtkggAvUVjBTck/kQWK43Ad0X/T0OdcBSgTwLiH71GanhoJFaWSbc6v7axIxssooqVUnPWlzPk6bmH2EICi/N0vO5/wAXSSn1e4pmtslmpCoawqYN7gDi+mE1fL4t+Cm5V7xZQr4NQEAVnR/MV646sbze3SuUppS+pu/Mqy18TUHx9a6ahJ5pvjFmAQ+C9zHG1KLrCTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yXbZTfV7enqU/d0Qu+wv66UV1AX70M5onR0V5YskAKU=;
 b=aae2QkssgcUgjGw7iEytu/LNjlFqJnDo2pgUZMAoWiQMTJOKWXZIEBIxoEzRlAprxOiP/zWHlC1Y+VEOHXYsJUhsOxz20zZiSWx7cfa12PfCPoi3m/qgFudgoW4QB01yqeVD3EpvzThqNdXRw7tBHNEmm5HnxpbdXb418U5rLrBzQ1YjTbwMVm7JrTrBAQVa6Shu5nXddWlyMxuPHT5TrVKMsm7gGYfF5uUYZ0Vg9EMDlAtVHrIVWTEr/S4b8w7QzMnNgcNl4+3XsFrp5G/hbPGYuwL6yT0NfjLh2jwk1mUkcBf+5eAguKansvVihGLpfDuHoGhblsm+q30KzIRJdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=linux.microsoft.com
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yXbZTfV7enqU/d0Qu+wv66UV1AX70M5onR0V5YskAKU=;
 b=ofHOPQO6q4UQ49GJe2vpMJgui5EQErm01m3w6QD/avtHPTXk4nzt13b7gEaCaW1AfNyVOH/VJd6LqGehci9PT5u+bLnrb8PbJOr77GQSIFGr8uYJaR3DGOASOTJkVsWkbUOGvqfObS5yaG+aWhJcxd9Vfn03jBtshOS/QVg/QIft5gr+k/5gYLMxJRKRj5LpyP3Sxq2bbun4Gu/eS3yWze4mg9jT5yBSta3VXr0SODH/jsT90kWTerTZsGWOvTmvANuFtrhTXwQD8cQMuXox+l+9gDHpgajvkIOEWDU211P7gGYF3gHnQmNlZijt3jlXAf2F8FZt2zfbRYtAo8Hn3g==
Received: from DM6PR18CA0023.namprd18.prod.outlook.com (2603:10b6:5:15b::36)
 by IA1PR12MB6209.namprd12.prod.outlook.com (2603:10b6:208:3e7::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.25; Wed, 5 Feb
 2025 22:56:28 +0000
Received: from DS1PEPF00017099.namprd05.prod.outlook.com
 (2603:10b6:5:15b:cafe::c4) by DM6PR18CA0023.outlook.office365.com
 (2603:10b6:5:15b::36) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.24 via Frontend Transport; Wed,
 5 Feb 2025 22:56:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 DS1PEPF00017099.mail.protection.outlook.com (10.167.18.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8398.14 via Frontend Transport; Wed, 5 Feb 2025 22:56:28 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Wed, 5 Feb 2025
 14:56:18 -0800
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 5 Feb 2025 14:56:18 -0800
Received: from Asurada-Nvidia (10.127.8.12) by mail.nvidia.com
 (10.126.190.180) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14 via Frontend
 Transport; Wed, 5 Feb 2025 14:56:16 -0800
Date: Wed, 5 Feb 2025 14:56:15 -0800
From: Nicolin Chen <nicolinc@nvidia.com>
To: Jacob Pan <jacob.pan@linux.microsoft.com>
CC: <will@kernel.org>, <robin.murphy@arm.com>, <jgg@nvidia.com>,
	<kevin.tian@intel.com>, <tglx@linutronix.de>, <maz@kernel.org>,
	<alex.williamson@redhat.com>, <joro@8bytes.org>, <shuah@kernel.org>,
	<reinette.chatre@intel.com>, <eric.auger@redhat.com>, <yebin10@huawei.com>,
	<apatel@ventanamicro.com>, <shivamurthy.shastri@linutronix.de>,
	<bhelgaas@google.com>, <anna-maria@linutronix.de>, <yury.norov@gmail.com>,
	<nipun.gupta@amd.com>, <iommu@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<kvm@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
	<patches@lists.linux.dev>, <jean-philippe@linaro.org>, <mdf@kernel.org>,
	<mshavit@google.com>, <shameerali.kolothum.thodi@huawei.com>,
	<smostafa@google.com>, <ddutile@redhat.com>
Subject: Re: [PATCH RFCv2 00/13] iommu: Add MSI mapping support with nested
 SMMU
Message-ID: <Z6Psj2+ingBos0Bn@Asurada-Nvidia>
References: <cover.1736550979.git.nicolinc@nvidia.com>
 <20250205144904.39285de4@DESKTOP-0403QTC.>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250205144904.39285de4@DESKTOP-0403QTC.>
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017099:EE_|IA1PR12MB6209:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b115ee8-02df-4c0b-6c9d-08dd4638531c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?cF4RTl/n3hGhuaYBhJJ3EsaOYA9gA9CBXTwy0/1OtVp3e/c6BR/Li6ntYeIq?=
 =?us-ascii?Q?N1GYLl7h6kUdfdBSDybUMvKqcjM4W3s8Li5GG6/JV9ceOWscnCMP2Z3+ZLfq?=
 =?us-ascii?Q?NTb/+x6XASO30XMhnEnAIeL3Eq4fI15A2yBpF44ChLX9sO9KuWnFujwUV6wB?=
 =?us-ascii?Q?EvXCpEjBCkaShfrmJPExb1924ugYTFsuwddCwVEmu+aL97U7ZDOgIFPiDiel?=
 =?us-ascii?Q?tZgJK4s9na2UnkW56tMnkZLckUWYj6flSWvYt8PSKkerPW8oLaV0GW0x+FGc?=
 =?us-ascii?Q?LElaVlo+uqe8VTRnnriJicc94kyFvVDejfqwCWjrncRAiZXcFhlAQD9FnQ+c?=
 =?us-ascii?Q?HCZdhUZNXZe/LK1y9487fAC1nn5e21tV8xZ4yuebqrDL2lnaPV5r+aLWaRrd?=
 =?us-ascii?Q?OlELZhdjRNsUC/Uk+ZvedYs7RMS6Z1vMVJl1oyOVgaivwPxu8bbHy6YHzz2z?=
 =?us-ascii?Q?7is9PoC7qnXE6hdBRu8jFsIFiFlzFmUyBb/NNb31jm6qWnmnBT43unc39uq4?=
 =?us-ascii?Q?R0ojpEeUV/5BL610uxaiTeR53p+HzVssqTrLOTqwgK7+FyM6weslSH0kk703?=
 =?us-ascii?Q?odPzl4xIYXlq3TKIhsyKDTzpI+L1MSMSu08IwoegyOgNYndqtt/qT9S1tJWz?=
 =?us-ascii?Q?UEk75JVSoH/sxY35x0gs+lzlmi/QntZ3/gYzfSxAxDoYwdgTw85i/KmqQSj/?=
 =?us-ascii?Q?Plv456LPYheQ6QUOb39lPcvbejjJG+4UDpZn0Cpug0Hn/69FGnYV+W8XyMXO?=
 =?us-ascii?Q?YR6sIiWusn6WRGMwcQkMJHyNciuYeCLxCTed4E5KJuJ4TDtfZPE6FMSTceKR?=
 =?us-ascii?Q?qbzMtLq4Qb47TbJN10Ko0GZrt6ZI+LdK6DoHksskgYkC1UWc0TYQMIo3TLE0?=
 =?us-ascii?Q?F5de+uZePBk106hitJnJsuTNglKYgVmdIRPZQ1qUluFOv7IvFlvASTqBmxGl?=
 =?us-ascii?Q?FStkHtXntIhtuTtyzG/ihJT0D1Afmb1q2wXI0lYOI6RLwD9qAJ+1mNAIjdO9?=
 =?us-ascii?Q?qPpgE5lU2MWgNUEz5JafwNNGEwDrutsxindI18hbEbM9RJyMNkyE1+LLoDvi?=
 =?us-ascii?Q?KBrdH2RvXDfmh3RjfnjYJy9d2GgnbQh7s9PAEHGhC1c+PtbVTnXlLGktRCiB?=
 =?us-ascii?Q?mAdr/GPmQFDSLrQBAS6i2VXOS9ASNG+lxVzw3YS+GjoKvw5sGYC5ae2tpesD?=
 =?us-ascii?Q?S0NYUVLAF/JKf8aG9PMbUGciBIUIWiJ79NdeMDfdQPCflbuwKSlC/7WAWf1q?=
 =?us-ascii?Q?KCsSZ5V7LgK3qdXrBKfUC0b/c/07AkDkzjj4WDDJTg9oHFCj4+bMEKgbxhJh?=
 =?us-ascii?Q?evx6x2mXDqgYhJFlhHPzXNQXebNymPkzWzpKLi9rflkLxG/lnc9YUGPc1Wv9?=
 =?us-ascii?Q?dIa8ccUKdKK+QqQewzfq+E/HJ/zz8566jCDCTOxVFeBKVlTG0OahWlaADiu8?=
 =?us-ascii?Q?cbCAs2d01WmHQMtuYzmqRFISKyOsJQ+bN++JgQ+VOcCHvIXA4J+kY7Z7rIjs?=
 =?us-ascii?Q?f2SkUYgY/XUh++Y=3D?=
X-Forefront-Antispam-Report: CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2025 22:56:28.1869
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b115ee8-02df-4c0b-6c9d-08dd4638531c
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF00017099.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6209
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_145636_871656_63F128EC 
X-CRM114-Status: GOOD (  14.24  )
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

On Wed, Feb 05, 2025 at 02:49:04PM -0800, Jacob Pan wrote:
> > There have been two approaches to solve this problem:
> > 1. Create an identity mapping in the stage-1. VMM could insert a few
> > RMRs (Reserved Memory Regions) in guest's IORT. Then the guest kernel
> > would fetch these RMR entries from the IORT and create an
> > IOMMU_RESV_DIRECT region per iommu group for a direct mapping.
> > Eventually, the mappings would look like: IOVA (0x8000000) === IPA
> > (0x8000000) ===> 0x20200000 This requires an IOMMUFD ioctl for kernel
> > and VMM to agree on the IPA.
> 
> Should this RMR be in a separate range than MSI_IOVA_BASE? The guest
> will have MSI_IOVA_BASE in a reserved region already, no?
> e.g. # cat
> /sys/bus/pci/devices/0015\:01\:00.0/iommu_group/reserved_regions
> 0x0000000008000000 0x00000000080fffff msi

No. In Patch-9, the driver-defined MSI_IOVA_BASE will be ignored if
userspace has assigned IOMMU_OPTION_SW_MSI_START/SIZE, even if they
might have the same values as the MSI_IOVA_BASE window.

The idea of MSI_IOVA_BASE in this series is a kernel default that'd
be only effective when user space doesn't care to set anything.

Thanks
Nicolin

