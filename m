Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7E1FC3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 23:46:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cY/K5+FoK+Mfk4GXFhnHQwdewYfg96+/eD0ihF2U13M=; b=ri9BNuTgBK+kLbxRI5dkfvyzNI
	CCp7f1WFMhke/UR4z6zA9cvo2LiNcq6GpSKV39Ual8j6hJybGo/hEi3w7GGxVT48Vx+YAZZnSbBxp
	3nX+MJfO3GDn1zsTMG7Ue+qcNgWSBoLuGjLwOVP60VjsUujEEWywYsvFjS/un199yRm6AgtHFnr++
	THZUP+WsS/gYnaXVdkN5HP4iZ2HsZ0kmrmEoC6ChsvjJJ/t/OXoh/VWZgxWGYEKB1rG5juf7UwPaA
	76S5wh/3+9YvIq17pu9ZxmhQvRguImRB+nULtyxUPjMrESKTJfd9fTacKD/96gw5R7UB7nGGTE4YM
	Wy/qqcOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCRz6-0000000DjR5-21PP;
	Tue, 06 May 2025 23:46:00 +0000
Received: from mail-bn8nam12on20628.outbound.protection.outlook.com ([2a01:111:f403:2418::628] helo=NAM12-BN8-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCNo6-0000000DDCx-1YV9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 19:18:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h2cROMUIRTALtAr/6XdSK5c2HqKeajYMBQNLsCfBxFEVnAh/FGZCM9/ePesNW/ZWhnmNTSNjNMjb8HyhwsThcdgEQzZ38HFBo7iwusZ2n/2/dZSUuJbJpL9anVPp6Zxb8urDZUx4ULAS/AQDo7gMpxfkZheK3vEKCgC/1iHhOQ3o7c4NBJOaO76KdFTuryr0xZ3g5jI0yo1KmMIs6kWYeJK0DlqFN7oqHY3D9RLNYLP3lqHnTZIA9d7g3xvfoUC96sTRv+yzy/9JCiSGB5ZsBSx59QyLSG0urteTX7oEIx1PiLmun9BsoyvfnNAOQr6juqX4og2kyCSbD3FyeVrIIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cY/K5+FoK+Mfk4GXFhnHQwdewYfg96+/eD0ihF2U13M=;
 b=gEmGPaVN4JukG3AUJJRfDOwFu/WkNiCiiw+xhd1kK8PxTqRnMb4XlwFhk27HCD1Oyr6ljqbzAHiIysq/azdrjOufok0dOdzRHKp+/onc4lWjgVXb6U8OZih9ZDSPplAbATMV3iMfu5uvqeK+tyyYBzaQkCprwHzdXa+FbWp2SO/Nnx6griWzMefufyMuWx7oUWbA7E+c//QBM/QS1XLH3Etbd8Cz4KqH9r54uxPg8ISvqfPp/nYUNR1wsa7bFbACsxajJ0NQLfbwxjlV/nYh9Kd42RmZYR0Im1MvGvEX8C+5KvJ/aefuHg0mwUPjHWjj+z0lXQoiVRV/dKJooKxuMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=intel.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cY/K5+FoK+Mfk4GXFhnHQwdewYfg96+/eD0ihF2U13M=;
 b=QrKTfV6lHJKiH0wwyk+RNbt4kAqvfMGYWP0i7v0k7aYFTc6QKEIBvV76+N+hxVTXY2Rcrz8CHJn5hVhp5wJIUht7RU8AR9JgEzjvKHCk7es0AOXR9SwclA2qSMONKafjIRQ0PeP2khihSx/KOfomW+FdH8tKqLShRVqy9zYQ5uaZONtlEszLMFWnoB6a0XXRUktjNRb8VkNd1Z25pvop5Ni+N2BeQr+CkKYCe/9khRBsRLStUzpxIO+ZHkYcwMNyMVmoaZZxYeCpESA1FCRxaaIZfPUmJyLdn3+kg/+opnuh6TeQHxkKLcuy5UVFsu2CUytVcyPqhWr2JkDuynumwQ==
Received: from SA9PR13CA0135.namprd13.prod.outlook.com (2603:10b6:806:27::20)
 by CY5PR12MB6381.namprd12.prod.outlook.com (2603:10b6:930:3f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.26; Tue, 6 May
 2025 19:18:01 +0000
Received: from SN1PEPF000397B5.namprd05.prod.outlook.com
 (2603:10b6:806:27:cafe::c8) by SA9PR13CA0135.outlook.office365.com
 (2603:10b6:806:27::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.16 via Frontend Transport; Tue,
 6 May 2025 19:18:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 SN1PEPF000397B5.mail.protection.outlook.com (10.167.248.59) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8722.18 via Frontend Transport; Tue, 6 May 2025 19:18:00 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 6 May 2025
 12:17:49 -0700
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 6 May 2025 12:17:51 -0700
Received: from nvidia.com (10.127.8.14) by mail.nvidia.com (10.126.190.182)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14 via Frontend
 Transport; Tue, 6 May 2025 12:17:47 -0700
Date: Tue, 6 May 2025 12:17:44 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: "Tian, Kevin" <kevin.tian@intel.com>
CC: "jgg@nvidia.com" <jgg@nvidia.com>, "corbet@lwn.net" <corbet@lwn.net>,
	"will@kernel.org" <will@kernel.org>, "bagasdotme@gmail.com"
	<bagasdotme@gmail.com>, "robin.murphy@arm.com" <robin.murphy@arm.com>,
	"joro@8bytes.org" <joro@8bytes.org>, "thierry.reding@gmail.com"
	<thierry.reding@gmail.com>, "vdumpa@nvidia.com" <vdumpa@nvidia.com>,
	"jonathanh@nvidia.com" <jonathanh@nvidia.com>, "shuah@kernel.org"
	<shuah@kernel.org>, "jsnitsel@redhat.com" <jsnitsel@redhat.com>,
	"nathan@kernel.org" <nathan@kernel.org>, "peterz@infradead.org"
	<peterz@infradead.org>, "Liu, Yi L" <yi.l.liu@intel.com>,
	"mshavit@google.com" <mshavit@google.com>, "praan@google.com"
	<praan@google.com>, "zhangzekun11@huawei.com" <zhangzekun11@huawei.com>,
	"iommu@lists.linux.dev" <iommu@lists.linux.dev>, "linux-doc@vger.kernel.org"
	<linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-tegra@vger.kernel.org"
	<linux-tegra@vger.kernel.org>, "linux-kselftest@vger.kernel.org"
	<linux-kselftest@vger.kernel.org>, "patches@lists.linux.dev"
	<patches@lists.linux.dev>, "mochs@nvidia.com" <mochs@nvidia.com>,
	"alok.a.tiwari@oracle.com" <alok.a.tiwari@oracle.com>, "vasant.hegde@amd.com"
	<vasant.hegde@amd.com>
Subject: Re: [PATCH v2 08/22] iommufd: Abstract iopt_pin_pages and
 iopt_unpin_pages helpers
Message-ID: <aBpgWNitAgNenOPY@nvidia.com>
References: <cover.1745646960.git.nicolinc@nvidia.com>
 <d44272c153e7596c3cef716044de3dc6c2a8254a.1745646960.git.nicolinc@nvidia.com>
 <BN9PR11MB52762F5A464ACC68D78465578C892@BN9PR11MB5276.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <BN9PR11MB52762F5A464ACC68D78465578C892@BN9PR11MB5276.namprd11.prod.outlook.com>
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000397B5:EE_|CY5PR12MB6381:EE_
X-MS-Office365-Filtering-Correlation-Id: ff6b5a81-9fb8-41a4-5515-08dd8cd2b7af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014|7416014|13003099007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?0EVZvUx26scwIWvQqjcVvpB/aaKp7RocTh0pbM9PzbU4rpProl4ZNB5+dSnG?=
 =?us-ascii?Q?M6Qe3e2nApJJFpl6xVaIFnmNVjzietBtGFrm/X37XXw9KisM2IIuJq0JwTeP?=
 =?us-ascii?Q?Jl9UEzRNBlpyHjUAJfIQH0MMNpB51IVEd0Dhh6RK/9Iz8w7tQQJD06Hjy5hR?=
 =?us-ascii?Q?JcCj/BYB3DRpo+9rMHMFgEiFkaUQCw8CP1KAn9BzsWSZeswROgbZVhvOCxPx?=
 =?us-ascii?Q?dMSHcAXHaBBEuYKO0SIqf3NCwTIGGOtNmOVOGIYwku6TOhacLT2Hy55ArqV+?=
 =?us-ascii?Q?hUyhx/QHflCYKVvrN0EiFmT6DWm5rIQPpP8IVECKSH0Zh4xnvdQkIdB5m2F5?=
 =?us-ascii?Q?usZ//oZTWPFGSzfBh6f/P4FFtqcMPubb806lXbEdW9cszAtoyrGTMzWUf5CS?=
 =?us-ascii?Q?AXy64W6pSnHm6CNHF1ENZ1BQzIECz5M40sHRJWL/NbU2yP38iEEO0nsSfT7i?=
 =?us-ascii?Q?W8HKPd6MWLVvcvNwiWVawqQU8uMPHvbX0DdeZZerpbovxWPDXcxmMT0KsB2y?=
 =?us-ascii?Q?IvYw8iSfAOaClprazN3c2lCJ4xMWUlNU7TM/EIdXSkMUsZirP6hW8S5ENXuV?=
 =?us-ascii?Q?zDn7qBriuWArnvHoaGMrYRVnDKDsYbt0asw2gDf7MvDhxb+IvypZcFQSqnOW?=
 =?us-ascii?Q?1aF6b7RuVLkQ5OnKdXQgd602f7KiaDdRzp05lUYOo8Sqp3KsM6YJ/FCi3FvF?=
 =?us-ascii?Q?DnJ3JRuIKa3yqUhZ2TsmiDrohuOoG+seb9cHU++ClByQbd+8QX1zfEy4SMWw?=
 =?us-ascii?Q?IzEA3bnzEv4lgpO00TvVFr4MBq4U/nPx1lHVPxn2r2al38og+4AF+zK6QYbJ?=
 =?us-ascii?Q?86bHxzDUhGnLI5cNw5lhhF6XuWhll/gXLlcaQCvwBMrgMHrtAjwvWjhPX95z?=
 =?us-ascii?Q?orzuWmo4Tscn2cWQs7pS8CljXgzXfF1r5d+LqtnLQ1yb6r1FTf/zKS38RrrE?=
 =?us-ascii?Q?VA69KheHrnWC7PHJwrrrWPTVvTVnw7SWSBR4vCjRnEcPizPNcLfB01Vsdr6G?=
 =?us-ascii?Q?Wd7tyQQMIlFLDDTtLk4Fr0bJOxK4WHJFytt4whs0qZKBYXC+E9ArAJ3HmPMQ?=
 =?us-ascii?Q?WpQPR8K8ujsRhZx/+s/Yruu8XqY7sIhHLtI+YDtR/cqXCt49DthBhQRshszU?=
 =?us-ascii?Q?gyqxn6nQst01RvJD+yOhNAZgJc45b2P2uwOgloXnImIMrJb/w8TxBBBBEvAY?=
 =?us-ascii?Q?UXe+pgyHrMScg8Gf32s7CvUPNrtx4sBc1PJpQV+bnNVODNsoFCzK6MC1JvYn?=
 =?us-ascii?Q?iY0NMMBvqdCdRk2emoJn6dJTnMNOICFVKRelcHx3QeRvEDh5kjmQaBS5tmlj?=
 =?us-ascii?Q?N+OOqJv2+YgOn/XykPsDOBMOrPItXYjCHcuo6oosqVIOhsHWQJ0gdba32XnO?=
 =?us-ascii?Q?6gtEDr4RNlijbDrN08+C3VqRireW7WX2E7jvQyJ4FuuqstuRUcIpO2yXKoAy?=
 =?us-ascii?Q?ePCbK1KfTNelzDu9Jhlr/vv6jx5QAJdDouN2W/dxdUao9p7UhkGSv41GRq8i?=
 =?us-ascii?Q?2mADEv4H3OUidHMYAVGeVa034A098slr93qvgRgqrFW8/MAvaOeETsuUAg?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report: CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014)(7416014)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2025 19:18:00.7981
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ff6b5a81-9fb8-41a4-5515-08dd8cd2b7af
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF000397B5.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6381
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_121822_411168_8C8FC6D4 
X-CRM114-Status: GOOD (  23.23  )
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

On Tue, May 06, 2025 at 09:36:38AM +0000, Tian, Kevin wrote:
> > From: Nicolin Chen <nicolinc@nvidia.com>
> > Sent: Saturday, April 26, 2025 1:58 PM
> > 
> > The new vCMDQ object will be added for HW to access the guest memory for
> > a
> > HW-accelerated virtualization feature. It needs to ensure the guest memory
> > pages are pinned when HW accesses them and they are contiguous in
> > physical
> > address space.
> > 
> > This is very like the existing iommufd_access_pin_pages() that outputs the
> > pinned page list for the caller to test its contiguity.
> > 
> > Move those code from iommufd_access_pin/unpin_pages() and related
> > function
> > for a pair of iopt helpers that can be shared with the vCMDQ allocator. As
> > the vCMDQ allocator will be a user-space triggered ioctl function, WARN_ON
> > would not be a good fit in the new iopt_unpin_pages(), thus change them to
> > use WARN_ON_ONCE instead.
> > 
> > Rename check_area_prot() to align with the existing iopt_area helpers, and
> > inline it to the header since iommufd_access_rw() still uses it.
> > 
> > Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> 
> any reason why this cannot be done by the core? all types of vcmd
> queues need to pin the guest buffer pages, no matter the IOMMU
> accesses GPA or HPA.
> 
> Jason made a similar comment earlier [1]. 
> 
> check of continuity is still done by the driver, if HPA is being accessed.
> 
> [1] https://lore.kernel.org/all/20250424134049.GP1648741@nvidia.com/

But I am doing in the core. I have iopt_pin_pages() called in the
core ioctl handler iommufd_vqueue_alloc_ioctl():

https://lore.kernel.org/linux-iommu/1ef2e242ee1d844f823581a5365823d78c67ec6a.1746139811.git.nicolinc@nvidia.com/

Thanks
Nicolin

