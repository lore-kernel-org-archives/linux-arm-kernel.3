Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4D271091913
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Mar 2026 19:52:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=nrxpmzdIuuXIqpNuKF4WqqxrfP0iAVCGsGE9lPHuuHg=; b=Fa15ZENPRQg9CveIqCE45QFhco
	mM5MqlI77TJZpHSlKJaz/LjecbQf2wKwE4tjd3RJ3QkVWqcec2qt6pdz42wmJT6eMfICEHCYh2ftn
	Q/JlyAfBclXtytj1NlspIEqq/0LMdD3G9h3UHjVAvAO6e7DHSZeay52+uBliZg4U8CHfYwnqoCNit
	KTkItLgqrOwRibBru7s0pVyVxdT5Po16Ay215WtaPDvmtAIrk8ODYyCwP1mkWKiegR2f5RKBwDQTd
	2k/cKjgKe7Oc94lv7V1CWPuaVx5pLN7VwiuoQda5n1yL/xHuel9LpwgysBb3h/XF0tJTKLHCudSc2
	UXn9SnsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3JQC-0000000BTO1-39bA;
	Thu, 19 Mar 2026 19:52:44 +0000
Received: from mail-eastus2azon11011011.outbound.protection.outlook.com ([52.101.57.11] helo=BN8PR05CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3JQ4-0000000BTIx-0ZrY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Mar 2026 19:52:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TzJ8IFS7Az3Hzm6EzAd5LAxWfG8EJjzFT8L5OlM3pm5R40ke+xArM4GTDzFN6BlZ6SBqBsjbbtIdGA7RX5cluHEgvAKPT4U5XHncQpO5CYIzNtyllUy8Fy4zzQx3pdT5P5G2VtIWtBT4WA7a/Jy3fLW3JTOd/2XtA6lFlDL/AAr3aW5Xp6Ep21IdeyFVm2kbvwFnBEEpj3IzVt6dcm2XYDLeU5gv3mRPc7V6EZB1DNKTFqjC26mNA8cQsPfpT20sCTLx5dY01ptmTG41zyYD1vMn2Xe14lBKS46Ll85j6OlCY0CioTK2lrdfwRc0yxsZvGy6xERIsdUS2APfAFTn9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nrxpmzdIuuXIqpNuKF4WqqxrfP0iAVCGsGE9lPHuuHg=;
 b=GRsc6xltA+kBm4FMUQpBLNlDI0mI0xCINaV5hnG1v15pGNTYL2wGJcXZ1fxBA1YMkaFn1vYbqY1JaLGkrx3e1SsG3FjVJ+GnFrVKP4askxyvfSiiWG6SmMilKBRP6GQs8pn/7Av90thtO8myCaGrAJpHI73tnM6xDS5V2qDKfe+eVAp6xk5nzHmWfHY1tc6kNpvV4AOHdxS29hLtESe121c3OHqVqxGEgIQHbRr4u2lU+6GcR0FXz2Dfmnrm7qCqkGfcOEdNUUoFhxxsdyDfTvTxgFlJCsld9oPKa2ic4qVGkNbrXKcW+PkWYOgdfXjBnjPErJIDOoTz1/7BtFYi4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nrxpmzdIuuXIqpNuKF4WqqxrfP0iAVCGsGE9lPHuuHg=;
 b=sw3DiSzgCWLji+Kl3l/HZvbIpcMmduOoAYa/puXzJaZhWzcmLhl+VJm/1GFV4quXVrvxW5cOhYgDw6Z9oAJywGidRb13skp5FOIkV4PWwiK33zl+uBjHRDvmVSkVhyabyHy5dG10p0vx+Yr7k/Pcq+rPHqW0hWs98PXfOft6lz7IZrTzt8mgCtMB9uBekCjAaKZpLKxoZp1FACuDxqETdRLtJULeUQtQ5DkLJL/2C01r0s2CeXttx98a6ofVEWLowdq+ZVrI3T56g59uBi4lf1D9eXcOkZdSHhns1V/NBf1awB9QekW9UPEr6LSGLd9cRNU0605MBnKSoodpb8gl8A==
Received: from BLAPR03CA0019.namprd03.prod.outlook.com (2603:10b6:208:32b::24)
 by DM3PR12MB9413.namprd12.prod.outlook.com (2603:10b6:8:1af::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.9; Thu, 19 Mar
 2026 19:52:27 +0000
Received: from BL02EPF0001A0FB.namprd03.prod.outlook.com
 (2603:10b6:208:32b:cafe::15) by BLAPR03CA0019.outlook.office365.com
 (2603:10b6:208:32b::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.27 via Frontend Transport; Thu,
 19 Mar 2026 19:52:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BL02EPF0001A0FB.mail.protection.outlook.com (10.167.242.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.19 via Frontend Transport; Thu, 19 Mar 2026 19:52:27 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 19 Mar
 2026 12:52:03 -0700
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 19 Mar
 2026 12:52:03 -0700
Received: from Asurada-Nvidia.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Thu, 19 Mar 2026 12:52:02 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: <will@kernel.org>, <jgg@nvidia.com>
CC: <robin.murphy@arm.com>, <joro@8bytes.org>, <jpb@kernel.org>,
	<praan@google.com>, <smostafa@google.com>,
	<linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
	<jonathan.cameron@huawei.com>
Subject: [PATCH v4 00/10] iommu/arm-smmu-v3: Share domain across SMMU/vSMMU instances
Date: Thu, 19 Mar 2026 12:51:46 -0700
Message-ID: <cover.1773949042.git.nicolinc@nvidia.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A0FB:EE_|DM3PR12MB9413:EE_
X-MS-Office365-Filtering-Correlation-Id: b9022153-86be-4d94-7baf-08de85f10c48
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|36860700016|82310400026|1800799024|13003099007|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: EEz8FJ1C/q2z/l89W+zhoNSYadRnpDXvYXAesxmLrvlK12A+6u354T8C3MFifHfbAuZJjOzxIEMDwbdsh1qIy/E9p9LrlRNKWZd/d2/ySr9agmVjSED6PRhiHBwIRST1NLf27FZA8ciaCG1AClPSRufHfEqpAdEreP9hzFHP0sC/add7lE6JFguOR/3zmJOcpurGZf3UxasG5vxRN+arDFJoFjxElbZuoyH1GFoVF5b9nLXlSnyjfedjc/ZlO/NtJZ86MzWH5uB/Zc5aslvgdpwhRbMqvVPDiFuvTk5R37DmwAfisBHvZQfbK/OZyL/2kpmvPKXIeKj+euOG4faV+2LgVgawawx03UUKzYlL5o/EuOwjuuouAAABw3BGuA0QoZq1FT7L9AORo04WtdSACxKyahVJT3dopvVKpV+BgPdyTKGNJM6z28RcBfgVWeZNzIAnN6tFkuieXLUuTw+weMDnylPiDfkLCZCD2MQdh2AY1yieXNHAl5wb3S+nNcuBaSUG2Bqh7Az5TpbE2TxEFM3sAMArKGJk27gVwxYoivCQxj1FwrBEaSA1gy5Nq5JX2HYI3gQgI94Pqj65vE68ROCSUEmdLPN6/ENAZGnx+BT6k/oCSNjjx1G9qkx6vMfowIa2yYne/Vo2j1f9L6xy4k+cyk8/eJ0hBCBqnahwERY6KR1Dk67VtUMQ4GHnKthl7gvmAnthxn8XL3v9oWC/X+xMeOTIfMS5MNQf+CN2Y43HuCG6vujGp++6QD1LNhW3wy/EzDJrhrI4If4zdxT8aQ==
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(7416014)(36860700016)(82310400026)(1800799024)(13003099007)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: TW4R4blp7bcjzqZYK/4X7Kmd/dWvqqIg2XA43qEJifN77zZDv9t64qI3ZIbDOFblcWxjCtSNFO/oKYJSf4KAJjDSYiG4HdYjNnFuUBNBP6sb0PCbUR1nYxqlQoFoyIOG9xorskazppqzBYT69uJYj9/pvWCCibfVbVoUqgar04L+xeZ0BWHWwQKv29GtZzlXzoaTmk4EXSxF4+9eqGGCZA4Kv+ZHYyvzx5XdzJE91s088iWcFMPMJAa9+WptlnubjyXO4D579SflmflTM7vxCOxjf+iAwcipCOsgka2ABf118hIqFp1bwzbeuV/tGfQ2gHTs1NixE3FHMMQ5+aM7TQPGpuNe1MQAa8YLtpAqvkIfXurIwUmL86WJ/kgPwFD+9ihgIrcbVcR5gths2tayjLL6YuyoHefrUBEAWYjC515Bqc/Vm010RjRTBltOe5L1
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2026 19:52:27.1483
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b9022153-86be-4d94-7baf-08de85f10c48
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0001A0FB.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR12MB9413
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_125236_178461_898A89AB 
X-CRM114-Status: GOOD (  19.79  )
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

In a system with multiple physical SMMU instances, multiple devices can be
passed through to a VM. Currently, a VM would allocate one domain per SMMU
instance that might be shared across devices that sit behind the same SMMU
instance. However, the gPA->PA mappings (either an S1 unmanaged domain or
an S2 nesting parent domain) can be shared across all the devices that sit
behind different SMMU instances as well, provided that the shared I/O page
table is compatible with all the SMMU instances.

The major difficulty in sharing the domain has been invalidation, since a
change to the shared I/O page table results in an invalidation on all SMMU
instances. A traditional approach involves building a linked list of SMMUs
within the domain, which is very inefficient for the invalidation path as
the linked list has to be locked.

To address this, the SMMUv3 driver now uses an RCU-protected invalidation
array. Any new device (and its SMMU) is preloaded into the array during a
device attachment. This array maintains all necessary information, such as
ASID/VMID and which SMMU instance (CMDQ) to issue the command to.

The second issue concerns the lifecycle of the iotlb tag. Currently, ASID
or VMID is allocated per domain and kept in the domain structure (cd->asid
or s2_cfg->vmid). This does not work ideally when the domain (e.g. S2) is
shared, as the VMID will have to be global across all SMMU instances, even
if a VM is not using all of them. This results in wasted VMID resources in
the bitmaps of unused SMMU instances.

Instead, an iotlb tag should be allocated per SMMU instance. Consequently,
these tags must be allocated and maintained separately. Since ASID or VMID
is only used when a CD or STE is installed to the HW (which happens during
device attachment), and the invalidation array is built right before that,
it is ideal to allocate a new iotlb tag before arm_smmu_invs_merge():
 - when a device attaches, the driver first searches for an existing iotlb
   tag for the SMMU the device sits behind
 - If a match is found, the "users" counter is incremented
 - otherwise, a new tag is allocated.

A nested domain case is slightly unique as certain HW requires the VMID at
the vSMMU init stage v.s. a device attachment (to the nested domain). Thus
 - allocate/free a vmid in vsmmu_init/vsmmu_destroy and store in vSMMU
 - introduce an INV_TYPE_S2_VMID_VSMMU to separate it from a naked S2 case
 - retrieve the vmid from the vSMMU during attachment instead of allocation

With this, deprecate the cd->asid and s2_cfg->vmid from struct smmu_domain,
and replace them with the iotlb tag stored in the smmu_domain->invs array.

Finally, allow sharing a domain across the SMMU instances, so long as they
passes a compatibility test.

This is on Github:
https://github.com/nicolinc/iommufd/commits/smmuv3_share_domain-v4

An earlier effort to share S2 domain can be found:
https://lore.kernel.org/all/cover.1744692494.git.nicolinc@nvidia.com/

Changelog
v4
 * Rebase on arm/smmu/updates branch
 * Update commit messages
 * Drop unnecessary mutex around ida_alloc/free
 * Rename arm_smmu_make_cd_fn parameter to mak_cd_fn
 * Call ida_free() to the revert path in arm_vsmmu_init()
v3
 https://lore.kernel.org/all/cover.1771877893.git.nicolinc@nvidia.com/
 * Rebase on arm_smmu_invs-v12
 * Add Reviewed-by tags from Jason
 * Avoid Boolean function parameters
 * Set users counter in arm_smmu_ins_unref()
 * Add arm_smmu_inv_assert_iotlb_tag() helper
 * Fix the return values in arm_smmu_alloc_iotlb_tag()
 * Reorder the patches introducing INV_TYPE_S2_VMID_VSMMU
 * Add a note explaining the lifecycle of vSMMU-owned iotlb tag
 * Compare pgtbl with the new smmu in arm_smmu_domain_can_share()
 * Pass in a function pointer to arm_smmu_set_pasid() for CD making
 * Pass the raw domain pointer down to arm_smmu_domain_get_iotlb_tag()
v2
 https://lore.kernel.org/all/cover.1769044718.git.nicolinc@nvidia.com/
 * Add arm_smmu_domain_get_iotlb_tag()
 * Drop asid array and vmid from master structure, and get the iotlb
   tag in the smmu_domain->invs array
 * Introduce INV_TYPE_S2_VMID_VSMMU for vSMMU type, and separate the
   nested attach case from a naked S2 attach case
v1
 https://lore.kernel.org/all/cover.1766088962.git.nicolinc@nvidia.com/

Thanks
Nicolin

Nicolin Chen (10):
  iommu/arm-smmu-v3: Add a wrapper for arm_smmu_make_sva_cd()
  iommu/arm-smmu-v3: Pass in arm_smmu_make_cd_fn to arm_smmu_set_pasid()
  iommu/arm-smmu-v3: Store IOTLB cache tags in struct
    arm_smmu_attach_state
  iommu/arm-smmu-v3: Pass in IOTLB cache tag to
    arm_smmu_master_build_invs()
  iommu/arm-smmu-v3: Pass in IOTLB cache tag to CD and STE
  iommu/arm-smmu-v3: Introduce INV_TYPE_S2_VMID_VSMMU
  iommu/arm-smmu-v3: Allocate IOTLB cache tag if no id to reuse
  iommu/arm-smmu-v3: Allocate INV_TYPE_S2_VMID_VSMMU in arm_vsmmu_init
  iommu/arm-smmu-v3: Remove ASID/VMID from arm_smmu_domain
  iommu/arm-smmu-v3: Allow sharing domain across SMMUs

 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h   |  76 ++++-
 .../arm/arm-smmu-v3/arm-smmu-v3-iommufd.c     |  54 +++-
 .../iommu/arm/arm-smmu-v3/arm-smmu-v3-sva.c   |  57 ++--
 .../iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c  |  19 +-
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c   | 289 ++++++++++--------
 .../iommu/arm/arm-smmu-v3/tegra241-cmdqv.c    |   1 +
 6 files changed, 305 insertions(+), 191 deletions(-)

-- 
2.43.0


