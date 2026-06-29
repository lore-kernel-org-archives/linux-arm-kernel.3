Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41CAFC43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Jun 2026 21:16:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=GGZa4SswBraBpw7nGg17AqrGN0M3bXqq4hzF5f9EWVk=; b=bH0G0leqy1fb6L+5JUwQf3wAMz
	5GjuBd8JM8o9q3/o9F6WVGKGaha0xZQ3A0u/EMkw/MM/jRAC1D+vhVHtwz7SLaBjjHLLyAKtIPwxf
	fKt9NiZxKLNqKRdovtGHtmBFs37lpwg/XQ45WoUfiy4U5g+mXIKClLy4RLtiDMVpgpn8zWs5hpyit
	hEMS4SCFCf4qwMnovxW7uPt42MlX5QtmAgnyOdNjYpxAiHSQfnpyPbkejyIntw3ppG2Qhnd1qYwac
	V3MXVVkEvybV28N15oPANbnkysaKtJ1r2txH4LJ3E0i3yFoogSPUPJoE9STXSCJI6DPxwoJK/t+kV
	Ze7extLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weJLA-0000000FUYd-3ogO;
	Mon, 29 Jun 2026 21:16:28 +0000
Received: from mail-westus3azlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c107::3] helo=PH0PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weJL7-0000000FUXe-3TtK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Jun 2026 21:16:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=omBRZk3zOIdvacpgKGGm1ATORoTULnckVtjKbMTzQLGT7/gYa0xJIGwpJuAqgwdepoesCOvGCEfulSJU4+K67mSGwLalEfffdyxZLFogpufD+VrpeO8AwLX732L7rmaj3wUMyt3DPhmDqzXVSKCGrFQTTn/V7zFrB2Zrz8KkD8cqlFneNeaez76WsJ3m9jKE/MADSCyDo6Z+N0O/MCUWETiYdPFsI2/JFFAQrgHYwTrsuTwTQ949bKplTdFdxtCFSYvnb5eD9RFC8brdPfT5WYI/Nn3+otsXx1cj9//Us6GcStD+OuvYeiszQwcLSOJmUbl1Qf4VrOJHnFtbJdevuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GGZa4SswBraBpw7nGg17AqrGN0M3bXqq4hzF5f9EWVk=;
 b=CE5yGL/3o6ITHsumpMoEOBMjQZ7y9yhX6QAM93nKmZnrzRB+T1oFnsT3LCfoSc/7JY6G20AlyGLO22IQLKoN4XfaOmL9D3BFkGJ+zjUzawOLjPGspDCITYmZlhvoAnWviZ+ELSazL8bA+zg7ueBlvRBFx+/M6MWgPJ1GDMoOVYm5r8e2/+CfiJtNpZ0KH0AyB3UzOZ2y6HyWZxGKDsA+zswJUySZPbFbyKLvW/I1xvQuTSWHngAYlLpHdoHJV7gR4Lvd3bEg0/6A8CQkZEPbzE6xUy5KQK2xS+UxMHSPXPtB0DyJu6RMV9Lv3uPbhC6XSArCXUAhJtmtyQGXqs1HGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GGZa4SswBraBpw7nGg17AqrGN0M3bXqq4hzF5f9EWVk=;
 b=d/+DU/e/DUKKADChwTF7bB8/jkD9Qf4y3Fixy8UJ1JQjJryeC2Ss+LbvU6thKPRJZ47fRjJjjrsblhr+G7pnenQtaXSNiZEgMH89WebICNHr1aWUiKiP0MJgxOn4mJG7FNft1a+cAu0LOLfJPI0N53llfWJMw3V3S+neg69tBtF//qpdbqBgSijH/SysxSwXAe0mJG3cZGii7kmpzIlRqfii+gnsbsP+SGbkok8D+6CagSpoYFPJAQ1lZVUOfOCIe9hTAW2gwS//0YPmM3gQybJfRSfR5vsjKKZNJTV/88m4mNfqYISjW8J6C3sUKI0U0bo5nQ03XJbfIlEqLgl7iQ==
Received: from BL1PR13CA0010.namprd13.prod.outlook.com (2603:10b6:208:256::15)
 by PH7PR12MB5925.namprd12.prod.outlook.com (2603:10b6:510:1d8::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Mon, 29 Jun
 2026 21:16:18 +0000
Received: from BL6PEPF0001AB54.namprd02.prod.outlook.com
 (2603:10b6:208:256:cafe::2) by BL1PR13CA0010.outlook.office365.com
 (2603:10b6:208:256::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.8 via Frontend Transport; Mon, 29
 Jun 2026 21:16:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BL6PEPF0001AB54.mail.protection.outlook.com (10.167.241.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Mon, 29 Jun 2026 21:16:18 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 29 Jun
 2026 14:15:55 -0700
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 29 Jun
 2026 14:15:55 -0700
Received: from Asurada-Nvidia.nvidia.com (10.127.8.11) by mail.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Mon, 29 Jun 2026 14:15:55 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: Will Deacon <will@kernel.org>, Jason Gunthorpe <jgg@nvidia.com>, "Kevin
 Tian" <kevin.tian@intel.com>, Lu Baolu <baolu.lu@linux.intel.com>
CC: Robin Murphy <robin.murphy@arm.com>, <joro@8bytes.org>, David Woodhouse
	<dwmw2@infradead.org>, <linux-arm-kernel@lists.infradead.org>,
	<iommu@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v1 0/5] iommufd: Iterate the cache invalidation array in the core
Date: Mon, 29 Jun 2026 14:15:35 -0700
Message-ID: <cover.1782767398.git.nicolinc@nvidia.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB54:EE_|PH7PR12MB5925:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a93f73b-560a-4231-6233-08ded623a938
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|23010399003|82310400026|36860700016|3023799007|56012099006|18002099003|11063799006|5023799004|6133799003;
X-Microsoft-Antispam-Message-Info: i+Umneuxwgd8i0gOqLbzN6x6DNLf7N3729k/TpdMpigKDyFhBHGwAvsPEbHR5ZsrtwIey7ec5ien6Sc0p3cep65y2cVAJRqGhB8WKNkn+aKUj37lQZJiaLCnbLlXYZGkTa/w10V2h1yHQX/HoPDWABzv36ilsp4lQydr87jThKQM0Ix3AmVxedcMowa6Xxilbs1Yi9fBpap4iHxcuNYhF2eKIa6Lwd3x7ubfk+5v6WzqKg1Izf7kHbbiM6yoNzgc+1SC/oIj2938fVE4QsrqzHL1XJjAZT/Cd4w/Mv6WudigebQPa2glbmECVi+iVD+y06Q8EV6WgXGq7kEJUtTNfnENpP4325/NKMWAOvZeuROIHXgd7rcLFrm4cNu7XSvFOZD/mVqwv3I81tWIeENa1vhuGMNTyFrD3xDEbTiBGDFem0ZI5BxYgX5IE7Cd/ZFd3HaLl8WUSwwv1TBvzjIMudN/Or25zH+YUq32/TvgE8c1vrIs3ZsCiYAPWI9hrN1sP70NJwDKKNttaFgQt9vH48H/PKxIf4YHRh5x+FVI7Np4Q6+mFqkEDy0LzoDUKBwXD7tS60E9ssyF4pTd7zOiI2SsYsbLUsDFmq2NYKnD+50hgX5Twwlu1gB1rW4XUFbhyx3TBaLWaRerfk5qWKTrZJvU0OMG0R+4KolFB0qyADXpJpppSUPOWNptW8AsSKcjU63TKsfjWaHZrXZzurxwMA==
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(82310400026)(36860700016)(3023799007)(56012099006)(18002099003)(11063799006)(5023799004)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: MdhfD7B5zx61O+VbqsjF9CrgELtbulDn4vyPGJXLg/b7qfOM4+lbLOorj5FE+70s3HSIbRjc4koL9cA7z9oNKrE4TDcE5YdIeddmWOq6ksw3MQw+kbOpbinOotGDZH9mKLaSpx6JOYAZre43E8IckyDJoMn7B+nDp2yBSve9VQ4zuYvCpYP6EtCjh07odnkxErQF9+dzUEzo5r/lYjPsb9Tp4k//Sk6ThFufHXygW7H2u/nS9el1kHJCPJn1yxZXsZJrrJ8YpmxJhl2E3uKujR5JngJORIij3htZPA+cAO5wYZ2VJzBudG6hTu4Z8HhXWrPpQ/XWUeXXljp8IsvfhQzQQm+JPturUzgvG+YflqAp6T7Z5M7Bg/kB78d5yx6aUpmdepEjT+fhvUx2IP3EOSCXAcLpJIoODCGl36VlBOEWQCR+SiWzvoXCpJ+gVvrL
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2026 21:16:18.2500
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a93f73b-560a-4231-6233-08ded623a938
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB54.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5925
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_141625_887378_3B8F2C82 
X-CRM114-Status: GOOD (  11.06  )
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

The vIOMMU cache_invalidate() and the nested-HWPT cache_invalidate_user()
ops are each handed the full user invalidation array and must report, via
array->entry_num, how many of its entries they handled. That makes every
driver open-code the same array walk, with real downsides:

 - each driver carries its own loop and sub-array bookkeeping;
 - the ARM SMMUv3 driver allocates a buffer sized to the whole array just
   to iterate over it;
 - hand-rolling the loop left the ARM SMMUv3 driver with two long-standing
   bugs:
    1) on a conversion failure it counts commands that it converted but
       never issued, so user space skips invalidations that never reached
       the cmdq;
    2) it rejects a zero-length array, which the uAPI documents as a valid
       request that only probes the data type.

The walk is identical for every driver, so move it into the iommufd core.

The core now drives the iteration:

 - it invokes the op on a sub-array starting at the first not-yet-handled
   entry;
 - the op handles one chunk from the front of that sub-array and reports
   the count via array->entry_num;
 - the core advances and re-invokes until the whole array is consumed or
   the op returns an error.

A driver then only has to handle one bounded chunk per call, e.g. the ARM
SMMUv3 op copies a single cmdq batch into a fixed on-stack buffer and drops
its whole-array allocation. An op still handling the entire array in one
call keeps working, so each driver converts independently.

These are long-standing corner cases, so this targets for-next, not for-rc.

This is on Github:
https://github.com/nicolinc/iommufd/commits/iommufd_invalidation_loop-v1

[Note to Jason and Will]
This has some conflicts with Ashish's ARM_SMMU_OPT_REPEAT_TLBI_CFGI series:
https://lore.kernel.org/all/20260609073204.1760077-1-amhetre@nvidia.com/

Nicolin Chen (5):
  iommu/arm-smmu-v3-iommufd: Reject unsupported bits in invalidation
    commands
  iommufd: Iterate the cache invalidation array in the core
  iommufd/selftest: Convert cache invalidation mocks to the core array
    loop
  iommu/arm-smmu-v3-iommufd: Convert cache invalidation to the core
    array loop
  iommu/vt-d: Convert nested cache invalidation to the core array loop

 include/linux/iommu.h                         |   6 +-
 include/linux/iommufd.h                       |   2 +
 .../arm/arm-smmu-v3/arm-smmu-v3-iommufd.c     | 131 ++++++++++++----
 drivers/iommu/intel/nested.c                  |  54 ++++---
 drivers/iommu/iommufd/hw_pagetable.c          |  22 ++-
 drivers/iommu/iommufd/selftest.c              | 147 +++++++++---------
 6 files changed, 222 insertions(+), 140 deletions(-)


base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
-- 
2.43.0


