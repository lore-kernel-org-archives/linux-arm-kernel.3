Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C9B0C87FCF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Aug 2025 01:47:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=IBYJdBV7/VYnqfE4t+qLAMz9uRW3GD+kPVLhtJEjY4E=; b=O79+uZ6fqyLeILm2ARV+MYdR7v
	Pp6K0wdLjE4GQ9WXCCOCW3+gfZSuVMLg+NKARSbhyBNNhMfTS+PcgDLsrVPiXEQrjJzT/2oaovpgv
	8SIcuYIoJtSk/YvmO9HGstmqQczrKc1ZHSHuyJoUQhmOjhP2HIjrLX8I83nLio25s2UNgeKh0VCBU
	0kgNcT1aeXmss/UoNzXu31boCUTKRBIs7dak0d/L7mqJs2dxjaLl2M038uvs+yhf5yUUt2JSX6TS0
	S5qM8ThTJV+iB6v6xdZV6FvU75FswB/QnTYLcpo2IX/aqul49zU4ADgflIH3SAKroikqINb6O7XRF
	7tlfygBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umN43-0000000FX4J-2XLe;
	Thu, 14 Aug 2025 01:47:35 +0000
Received: from mail-bn7nam10on20607.outbound.protection.outlook.com ([2a01:111:f403:2009::607] helo=NAM10-BN7-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umMjh-0000000FUJj-39cG
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Aug 2025 01:26:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kboNUTTYB4gJeibtbnaj1etEjEcsBrW917a6bYNmWnMG85s191c70mu66KeeD8jstHDOdenNO5kloRP48JUcWnqCfXc0ZtjGH0Tj9VLahjwk+8VJ8CLFwbFliD2pz9gkIXDHIxcWi75GVBvf8OU2PRrr6/SrM6tchrgddkGZWZOqDrzJFz+qaB4iFgr+BBpNRLZIdoNfsoqrnbtAM2aP/NDSeWogKgd2Tgd/vFc+p7UqDFfzCLcmlbVZoKJc7Ry7pcaMLpB/W5zM+PLQlS15o4r0sJ4rB76jJnjOmJznmtcY1tpHvWcpIKy6qdO69WxcY1USOtM/N0dXgWP8T6DJvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IBYJdBV7/VYnqfE4t+qLAMz9uRW3GD+kPVLhtJEjY4E=;
 b=NvJe9PyI7sx7rdyMmxp7lzP7DJSIcFVxSngWTouILGbPtiF/8CXp99IwU8kuUJGVmXhmEz1rF48q/0iaMGdH+TiIiWtle++wPcfJTjUKS0rN6In2n2ZHgc7Nt2Vu+Jr8yQzzCBXPRyDexPCMOIXzAjJZiHw6rkrI+S7IWPdDL1DN34o0E0qtr0R/jXrQtV8sbvG8nnamKHdld34b6JH2YZqb0u8112JtIbfBatCyuPDEgE77UxrtEtJt0WXHVhxPDQqiu61VPPlDHQoSQSAYKRRBTfyguCFI35SZCLx0f2h9iTqOJETC5D01P/xNGqQIn3e0EuUyweN1Axi7Q2rp5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IBYJdBV7/VYnqfE4t+qLAMz9uRW3GD+kPVLhtJEjY4E=;
 b=U9AMc5djLcPVhn17rWv+U5XYANazriuxB9znRzXY8jiPxQB7f07VWiauTOnBNC0gVmJwoTqxTPmzXogdImz+nJayGV7wrEabkLDcZEndVSrGChUJDCI/Eo0XKMIP9wFWs8vCEdSLXxehCpW18DU4iagTPdvOfh6u1zRVjG0y8ply44WRtK+BWXhcnMhuobKsy23Ap539byv/sk9tWpQgt21NzEXouIMJKHXP5q8g8zp2mqWh2tY/P3f1DBMPDBbu1FdZf8vypU84uWgxRP4gTSrSbBw5+cW0kaiXvaDSNsROsMH3Z7uH0BBBloUBzNtCaFcwkcXv3lV/QxF/6qbz6Q==
Received: from BYAPR08CA0037.namprd08.prod.outlook.com (2603:10b6:a03:117::14)
 by SA3PR12MB7807.namprd12.prod.outlook.com (2603:10b6:806:304::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.21; Thu, 14 Aug
 2025 01:26:15 +0000
Received: from SJ5PEPF000001F4.namprd05.prod.outlook.com
 (2603:10b6:a03:117:cafe::5c) by BYAPR08CA0037.outlook.office365.com
 (2603:10b6:a03:117::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9031.17 via Frontend Transport; Thu,
 14 Aug 2025 01:26:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SJ5PEPF000001F4.mail.protection.outlook.com (10.167.242.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9031.11 via Frontend Transport; Thu, 14 Aug 2025 01:26:15 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Wed, 13 Aug
 2025 18:26:01 -0700
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Wed, 13 Aug
 2025 18:26:01 -0700
Received: from Asurada-Nvidia.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server id 15.2.1544.14 via Frontend
 Transport; Wed, 13 Aug 2025 18:26:00 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: <jgg@nvidia.com>, <will@kernel.org>, <robin.murphy@arm.com>
CC: <joro@8bytes.org>, <jean-philippe@linaro.org>, <miko.lenczewski@arm.com>,
	<balbirs@nvidia.com>, <peterz@infradead.org>, <smostafa@google.com>,
	<kevin.tian@intel.com>, <praan@google.com>, <zhangzekun11@huawei.com>,
	<linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, <patches@lists.linux.dev>
Subject: [PATCH rfcv1 0/8] iommu/arm-smmu-v3: Introduce an RCU-protected invalidation array
Date: Wed, 13 Aug 2025 18:25:31 -0700
Message-ID: <cover.1755131672.git.nicolinc@nvidia.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F4:EE_|SA3PR12MB7807:EE_
X-MS-Office365-Filtering-Correlation-Id: fa62d104-ef5d-41d0-85a9-08dddad19002
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|36860700013|7416014|376014|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?usL2Ytmr3SuZQex9DVkC9jordt3NSJPCElcLNOGU5J3tghlFdwxHRHSdowR8?=
 =?us-ascii?Q?bsAtOddLZoVbloanf6CU+Se5Vici7V5y0GY+Y/VfWp/mouO7cAFrA+k4UzIX?=
 =?us-ascii?Q?vlX2kSXswlUXOy2KXd5GxDjgWH9XdaM9glunE6x+ZTiCKQX6+srIz/tKRzqU?=
 =?us-ascii?Q?tHsJ+hYqN6pdDvHkAGOuc6tHZrgJw05Xpn/Yi+kxIRaC0cBBO78acnhu1EyZ?=
 =?us-ascii?Q?7JcC+1P3hsCgC+dnc3v3quvRau+MXE3rZoO0OvDCzlU0uOgsm6SU/FqdgWm4?=
 =?us-ascii?Q?BtQWKnL02XnQcVRvzmHQQIiVVAdfWIeMi6P/zQ56VSX0Ova/NogZTlvz547t?=
 =?us-ascii?Q?PM+xTb3pXLYTds2GEKOnngMLQTXvvuRDzQJeCMiAxPJ/7CWLyFXgBw9CnaKA?=
 =?us-ascii?Q?0p6X0WTUlRvZR97hx2YGl4Qja6o9Dqvqr1cNAb7bTYg0qvVp52ngG4Zqk7q0?=
 =?us-ascii?Q?xQuFA2uFdQhAo9uvtjaOXasypne8JKiSzo07TFg8xEzoeYA9i2tRQuzOFLw4?=
 =?us-ascii?Q?w5Le2CfF8sc+JS4ZiFj+xBoii749VbVKg07iwZrSS+xjX4lPC+82UXwueqHJ?=
 =?us-ascii?Q?sVppo/a4EXRwjjqHWjhLAn7O55yFnRYcE3JwsQtdaNeUXZmPHo5WQ3Dtk0Hf?=
 =?us-ascii?Q?DBrlFMLmi9JvCbyqkWHebYaBHMfiBmwYLK9M+DDN/i6pEFASIJ4D+oxu1HTd?=
 =?us-ascii?Q?/g5N7UrSpmZ9lJgo7rZm9+XnBXtegIZjuXO/Tq0MEFppdUB+gk10UoBwt4HY?=
 =?us-ascii?Q?96aEQH9vhHvIDUzm9n/YJ4vukdek+AvNa9vLi0z8EL6NaMG6tXkRXa6+/xqm?=
 =?us-ascii?Q?2BM1Xb+E7BxNe8NN8KxJEqga62NoVfchgLTaLBZ8QBNDXfI6L8NqYu9Du/Bp?=
 =?us-ascii?Q?WPNublK5o7vd/a3oXA2adhZPIpOOK7cioeljtf1TeBkkNOqfGDESSAHrwAbY?=
 =?us-ascii?Q?mk/09bGMmdrUlR9vixydyiJYLHUOt8sHSGKt507XdHf1EYJlIibC3+qBVLDe?=
 =?us-ascii?Q?KwoYL/NY0J9Dzd5ymFxfbp7FYyqtFyoIeKLxQStifMVecY3lWqg9E4R+kenL?=
 =?us-ascii?Q?oKh3lLxA9muFFzUw0mbOe7/eY3gJiqCZgaBLLwxfxxmGq3qVnYyLGjRVD4o3?=
 =?us-ascii?Q?GeaJIvaA3oJiSwyHWfltPdnwWvkFn6+UN1wPJdWwW048M4jDfMM3Es74mPC3?=
 =?us-ascii?Q?LrcpKdasgZfiAiLQtAZfS11jojtWaZBLnQhYYsS7ya4ufgV9UfAZDKJZV+RF?=
 =?us-ascii?Q?RBQelNaJxZvU9QoMJI8JiPQWoBI3p29zqYPXcYTeHftQ0QI4ostmgEJ+FD4W?=
 =?us-ascii?Q?wl1dliwX1E4UFxQsLJ3DL33YN/TfW2aUzrdDAsYTYShIKoZud0WSVwsFbZES?=
 =?us-ascii?Q?atlalIMFmpf4LfjrNOSPffINSJth4UrwVRUxAAHeakTmnEu1qt4htw17K0l/?=
 =?us-ascii?Q?PqP9fTwH0A8BzwV5ER7MbG90DIeeFAhHqrWqtxEj8hdEghwondUTm/rWNwj3?=
 =?us-ascii?Q?jnCA/Mf7cMBXlV+ApMPdEyJhvg/OqT7prtJC7u5FSDLkCO0GwSuuj0hObQ?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(7416014)(376014)(1800799024)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2025 01:26:15.4266
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fa62d104-ef5d-41d0-85a9-08dddad19002
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001F4.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7807
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_182633_792272_C61B4B3B 
X-CRM114-Status: GOOD (  16.55  )
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

This is a work based on Jason's design and algorithm. This implementation
follows his initial draft as well.

The new arm_smmu_invs array is an RCU-protected array, mutated when device
attach to the domain, iterated when an invalidation is required for IOPTE
changes in this domain. This keeps the current invalidation efficiency of
a smb_mb() followed by a conditional rwlock replacing the atomic/spinlock
combination.

A new data structure is defined for the array and its entry, representing
invalidation operations, such as S1_ASID, S2_VMID, and ATS. The algorithm
adds and deletes array entries efficiently and also keeps the array sorted
so as to group similar invalidations into batches.

During an invalidation, a new invalidation function iterates domain->invs,
and converts each entry to the corresponding invalidation command(s). This
new function is fully compatible with all the existing use cases, allowing
a simple rework/replacement.

Some races to keep in mind:

1) A domain can be shared across SMMU instances. When an SMMU instance is
   removed, the updated invs array has to be sync-ed via synchronize_rcu()
   to prevent an concurrent invalidation routine that is accessing the old
   array from issuing commands to the removed SMMU instance.

2) When there are concurrent IOPTE changes (followed by invalidations) and
   a domain attachment, the new attachment must not become out of sync at
   the HW level, meaning that an STE store and invalidation array load must
   be sequenced by the CPU's memory model.

3) When an ATS-enabled device attaches to a blocking domain, the core code
   requires a hard fence to ensure all ATS invalidations to the device are
   completed. Relying on RCU alone requires calling synchronize_rcu() that
   can be too slow. Instead, when ATS is in use, hold a conditional rwlock
   till all concurrent invalidations are finished.

Related future work and dependent projects:

 * NVIDIA is building systems with > 10 SMMU instances where > 8 are being
   used concurrently in a single VM. So having 8 copies of an identical S2
   page table is not efficient. Instead, all vSMMU instances should check
   compatibility on a shared S2 iopt, to eliminate 7 copies.

   Previous attempt based on the list/spinlock design:
     iommu/arm-smmu-v3: Allocate vmid per vsmmu instead of s2_parent
     https://lore.kernel.org/all/cover.1744692494.git.nicolinc@nvidia.com/
   now can adopt this invs array, avoiding adding complex lists/locks.

 * The guest support for BTM requires temporarily invalidating two ASIDs
   for a single instance. When it renumbers ASIDs this can now be done via
   the invs array.

 * SVA with multiple devices being used by a single process (NVIDIA today
   has 4-8) sequentially iterates the invalidations through all instances.
   This ignores the HW concurrency available in each instance. It would be
   nice to not spin on each sync but go forward and issue batches to other
   instances also. Reducing to a single SVA domain shared across instances
   is required to look at this.

This is on Github:
https://github.com/nicolinc/iommufd/commits/arm_smmu_invs-rfcv1

Thanks
Nicolin

Jason Gunthorpe (1):
  iommu/arm-smmu-v3: Introduce a per-domain arm_smmu_invs array

Nicolin Chen (7):
  iommu/arm-smmu-v3: Clear cmds->num after arm_smmu_cmdq_batch_submit
  iommu/arm-smmu-v3: Explicitly set smmu_domain->stage for SVA
  iommu/arm-smmu-v3: Add an inline arm_smmu_domain_free()
  iommu/arm-smmu-v3: Pre-allocate a per-master invalidation array
  iommu/arm-smmu-v3: Populate smmu_domain->invs when attaching masters
  iommu/arm-smmu-v3: Add arm_smmu_invs based arm_smmu_domain_inv_range()
  iommu/arm-smmu-v3: Perform per-domain invalidations using
    arm_smmu_invs

 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h   | 106 ++-
 .../iommu/arm/arm-smmu-v3/arm-smmu-v3-sva.c   |  32 +-
 .../iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c  |  85 ++
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c   | 829 +++++++++++++++---
 4 files changed, 876 insertions(+), 176 deletions(-)

-- 
2.43.0


