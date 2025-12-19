Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B690E66884
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Dec 2025 20:12:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tLWt469JsF9rL9Hoc50mHEEJoZ+8JvHFZ0fl7qmtv3I=; b=RsNDzSpIGIGmymAvDlQ3H+ncrT
	Yb/+OYh8IXe9NS1op3twiISr0F7JH7j0RAnnjmFfc0UZKjY+CITZqALm0nxcunQSo+6OR5I1Z7U6D
	U+vLXCsgTppkVTjmvYZLJi3YnnNH/m8pOLvu5oIBXJr6RXdN7PnUJQFj5HKhmG4UINuLYuTt5HgLZ
	anS+SmoKIHIrgZXdOZJqF0E/KK6axEhotsUAx9j72xyyiawANXIBzzwZ0dXA+fIh6sg7xPeUBBjh9
	NFm0aUztpObuhEfbNA3MF8x0E2R4OKGrPwTeULoWHi8pksV78ZOT1Il6lnwUx3Strq1KZWWr+6pl/
	C5OVWKNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWgq7-0000000AvXR-3Q0t;
	Fri, 19 Dec 2025 20:12:39 +0000
Received: from mail-southcentralusazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c10d::3] helo=SN4PR0501CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWgq5-0000000AvVa-2UIO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Dec 2025 20:12:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ejQ0ghx+5Ja1TT2ajclEWOF7EFbJcWIivD958JU3TFF3RSXsS5xmKCTYl8Tuspw6LRhu307Xx7o0QZFIsSn4vg+PasyTVEExDlLCKHGzBx9S2m/TcKLBmAwC9S/WOPZ+m6yLkKwGrgQA+qQSfdGrXOOWbfeJ+IqADb4xRxlYp+tcukUrTR1m13NfmsNkv7tso16Ml8BDsHTbG+NoNBAPjvasyu5MXqtIO7dqLWNpe7f1TXQtjGoLkQQuOSnlkvuQCvO3OXgMiOeXmxtlzQO78NHA29jftl9dobdk2HLNL79G/CBhQ9agwEenbKO1Qd1Tonfv/fORJ8/idQhr//If2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tLWt469JsF9rL9Hoc50mHEEJoZ+8JvHFZ0fl7qmtv3I=;
 b=b9D9SvqbFBOmnN/w7Q66wqKgmp6KGmyLPWLydMM9G0pyMYH4y1U5C8YhL/NWvsL6baPQUKuHqtEiQKUff0aRYZiZD1/xlreEAgpY7D60RiHx7GE0QoMWc7XthBrWmohSzM1ShhSOM59xDPbJlFPw5CHF/Sb6Fy/jCGWfIvUZlLq3gkqMPTvvlfmjVM+HQepe46TrviCC2DhWnl1o7PAwG163pUjsJrLPO2j/M4TZ+kTrUy3TeaeBPVRa5j+Flw01q33n2yi4iq5BktidDOQMTj6nnMCwm+SiqlMGyFUPN6TvARF5dLmpIECgw6PjTTha8UtkFbHWMbepuMwHYNtcNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tLWt469JsF9rL9Hoc50mHEEJoZ+8JvHFZ0fl7qmtv3I=;
 b=JGbTuypVxAE4H0wdTieLFO01DQF/JSVB0y8vnPIV+BG4TnPG98wNsUJTIIqCbAULxd0Ucs/uL4KPsAgc46vykBoc2/BaL394sPvnq78+YbcXTAc67gMMAPQf9vRHdJN7JX2GOhQd4F8aaDJVVhIOkZQzwIK19itzVes8NA4wKW0aP6vOf35YlvtLqsD5j2RwShADz7Mc+E2agrER4M/a7r0HRJaJpzUPos983yfz8hUCUyI5LtwxclDjqzBoqi2DtpZfnA5mFp9W4/J1N3ePwJYq9Xh/A45yBBlbFkWl6U+G/j4BCL4OfSSEaYo5pRSE8eEQp1RduaJzkLOEgKW/ag==
Received: from BYAPR02CA0033.namprd02.prod.outlook.com (2603:10b6:a02:ee::46)
 by BY5PR12MB4212.namprd12.prod.outlook.com (2603:10b6:a03:202::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.9; Fri, 19 Dec
 2025 20:12:26 +0000
Received: from SJ1PEPF000026C7.namprd04.prod.outlook.com
 (2603:10b6:a02:ee:cafe::be) by BYAPR02CA0033.outlook.office365.com
 (2603:10b6:a02:ee::46) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.9 via Frontend Transport; Fri,
 19 Dec 2025 20:12:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SJ1PEPF000026C7.mail.protection.outlook.com (10.167.244.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.6 via Frontend Transport; Fri, 19 Dec 2025 20:12:26 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 19 Dec
 2025 12:12:08 -0800
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 19 Dec
 2025 12:12:08 -0800
Received: from Asurada-Nvidia.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Fri, 19 Dec 2025 12:12:07 -0800
From: Nicolin Chen <nicolinc@nvidia.com>
To: <will@kernel.org>
CC: <jean-philippe@linaro.org>, <robin.murphy@arm.com>, <joro@8bytes.org>,
	<jgg@nvidia.com>, <balbirs@nvidia.com>, <miko.lenczewski@arm.com>,
	<peterz@infradead.org>, <kevin.tian@intel.com>, <praan@google.com>,
	<linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v9 0/7] iommu/arm-smmu-v3: Introduce an RCU-protected invalidation array
Date: Fri, 19 Dec 2025 12:11:22 -0800
Message-ID: <cover.1766174731.git.nicolinc@nvidia.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000026C7:EE_|BY5PR12MB4212:EE_
X-MS-Office365-Filtering-Correlation-Id: cbf3bcde-afbf-4fa6-8fc1-08de3f3aedea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|82310400026|36860700013|13003099007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Mz/xDgBaGE2ZtsyeSLxWyuiS+/0rlzIVtmkDQAmYzh3iT9Zw3aB72bXGHX2X?=
 =?us-ascii?Q?jIF3SEnsR/sew4HJ2hmHyw1kP40YaBxHEHGQ1Glv+N6ziLiFciZXtvRAJnSc?=
 =?us-ascii?Q?Dr70pprrtIJ/SB2s/c1uQrjNmcEh9jAkbGJgp/vVFp/cIVCT/Dq7RjQwF/sG?=
 =?us-ascii?Q?sMsFV88U2ES1r54Gdr2+6b75wLCw3a6Od9psmLJ9VdPqO/czo02t3YMWY/vs?=
 =?us-ascii?Q?IPYIJDliH+QeemlbMmb995fkzLehjbGT2eu5I0mYVYHQMEc072bVkJzgvM7y?=
 =?us-ascii?Q?XNzzFVqTUy58AFz+NEXvB0AnA17v+cCbkUDmFgjz4O3qbXSsllI88yDw1Txx?=
 =?us-ascii?Q?Xn23eatVqULBqMT45MuwaIyRsoEi0YbTmWZ1mEtNM9nPIkyp9reHpzhp+NLV?=
 =?us-ascii?Q?nzkxmhtJ4uqG7Erk+/L1W6IVWbjRu1qgRclV5bEIPDWSMWjmg1YqitBR6tsx?=
 =?us-ascii?Q?APzWtaGy3BlHtghqkgcIE6X8jYVzDGcY26A8ZQ4gljYSy5txfkN9ahBvMCmy?=
 =?us-ascii?Q?JHUcLStBkZx6najgsOsD7MqYMvSbvN6DFq8vTzpOio/ZvfkrdJk0XT9T4ihT?=
 =?us-ascii?Q?dED+Y7CJRzy9NgtWu4i6FqjOh/KtdutyBZewgQhK/jJG/D1egrwdcK2+Z9X1?=
 =?us-ascii?Q?nDoEzThbpOHgnb1Ygqsg1FbWdQMT5ZzOOK3Wxu3d1lpwTzU54CUdiIO/QTC2?=
 =?us-ascii?Q?EoA07G9U/kGoApma1hs37+8KA7EBWkRWTLwWgN6GNrT0BogKQJbO5b3KPgBC?=
 =?us-ascii?Q?OUeSub280lqssaQus2vps2L9FE/Q3UgsynSVIIij+z0q+qfNQ6tykK3bFnpT?=
 =?us-ascii?Q?BUbj0KcQxfsei3YuJopsHEmsa6SPJR8LH5zJ/WRbowq+24BDL8Jt5Gr4/tR7?=
 =?us-ascii?Q?LC1c64VvY9ovPqJUdZsCUoSmyyqbxzPAw6kFr8FuRb+LBJsxJ2+rbXVmbAwK?=
 =?us-ascii?Q?bewOtPcQt0cJUFh2Tl4aEi0CqCoOJMRq5Ah8Chb6TV5+rPym9dUBQR/KdrPw?=
 =?us-ascii?Q?7ybh7o6qGJlCW526RnBSfZfHNTx2wFel57Nojk0LC3qvfc5bxneWffi0qx1w?=
 =?us-ascii?Q?sdp2Te5/ipHvOvhyxAe/WSufdcdpddvqwCUaXcG0DX9wzXRGDm2rBUZX1sKf?=
 =?us-ascii?Q?M8I17mcOPaqx3CAsYW90zJ7HGXrXWkJA74kOlqE9ctBz92GZmxaxg3pM1xMd?=
 =?us-ascii?Q?+uGWsSQU0sKipnmcWlQDBtTSHw3F+wowXIkI2Ossk1NWcR0eomHJolUUOOyb?=
 =?us-ascii?Q?9ZKtmyX0p6PyNu2tDXu+mxdOuIE3IXp0EZjAZgDkf4snjPeFSC3f1tS+zNiR?=
 =?us-ascii?Q?zro+1HHcRAS/sdXKtPnSi96NqEHwBKMe+nd7kg42TF2ri1n/qV2ehZERiL8x?=
 =?us-ascii?Q?KZTixfA7NAAErNncQi68h7uz9soV87xK2rpv0cb1oGLAzzkKVQz5jlgbK5OW?=
 =?us-ascii?Q?m8tY1KUCsG8ziFt9o/cDzfHD1BTsbpXJt1apT3eM9R7DFSnzKMbeyJcx1uiv?=
 =?us-ascii?Q?4M2HAzy/dVaL12dJIMMXlLZeBZCgvjL+HOTkTFET2jU+VChgmL7LeH4/822C?=
 =?us-ascii?Q?/xIQlvOM+GXuiOmL0gc=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(82310400026)(36860700013)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2025 20:12:26.5149
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cbf3bcde-afbf-4fa6-8fc1-08de3f3aedea
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF000026C7.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4212
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_121237_676953_DA9D939B 
X-CRM114-Status: GOOD (  20.33  )
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
follows his initial draft and revising as well.

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
https://github.com/nicolinc/iommufd/commits/arm_smmu_invs-v9

Changelog
v9:
 * Set cur->ssid correctly in arm_smmu_master_build_inv()
 * Add comments for INV_TYPE_S1_ASID in arm_smmu_master_build_inv()
v8:
 https://lore.kernel.org/all/cover.1766013662.git.nicolinc@nvidia.com/
 * Update comments for smp_mb() in arm_smmu_install_new/old_domain_invs()
v7:
 https://lore.kernel.org/all/cover.1765850465.git.nicolinc@nvidia.com/
 * Rebase on v6.19-rc1
 * Fix has_ats in arm_smmu_invs_merge()
 * Fix a re-attach case with a different ats_enabled
 * Constify the inv parameter in arm_smmu_inv_is_ats()
 * Update kunit test data to be closer to real-world use cases
 * Clean up SVA domain's invs in arm_smmu_blocking_set_dev_pasid()
v6:
 https://lore.kernel.org/all/cover.1764119291.git.nicolinc@nvidia.com/
 * Fix typo in kdocs
 * Fix arm_smmu_domain_free() in SVA
 * Add arm_smmu_master_build_inv() helper
 * Add max_invs and __counted_by(max_invs)
 * Return NULL if arm_smmu_invs_alloc() fails
 * Sort master->streams instead of fwspec->ids
 * s/flush_fn/free_fn (prepare for future patches)
 * s/arm_smmu_invs_flush_iotlb_tags/arm_smmu_inv_flush_iotlb_tag
 * Define arm_smmu_invs macros and helpers to reduce duplications
 * Save num_trashes in "struct arm_smmu_invs" (to avoid a re-scan)
 * Move smp_mb() in install() to PATCH-6 that adds the pairing barrier
   and description
v5:
 https://lore.kernel.org/all/cover.1762588839.git.nicolinc@nvidia.com/
 * Add Reviewed/Acked-by from Jason and Balbir
 * Add two inline comments
 * Move cmp after the trash entry validation
 * Batch commands in arm_smmu_inv_size_too_big case
 * Replace kfree_rcu() with kfree() in arm_smmu_domain_free()
v4:
 https://lore.kernel.org/all/cover.1761590851.git.nicolinc@nvidia.com/
 * Fix build errors with CONFIG_KUNIT=n
 * Fix uninitialized cmp in arm_smmu_invs_unref()
 * Add missing "__rcu" in struct arm_smmu_inv_state
 * Add missing rcu_derference_protected() in arm_smmu_domain_free()
 * Bisect two paths for the conditional lock in arm_smmu_domain_inv_range()
   to fix a sparse waring
v3:
 https://lore.kernel.org/all/cover.1760555863.git.nicolinc@nvidia.com/
 * Add Reviewed/Acked-by from Jason and Balbir
 * Rebase on v6.18-rc1
 * Drop arm_smmu_invs_dbg()
 * Improve kdocs and inline/commit comments
 * Rename arm_smmu_invs_cmp to arm_smmu_inv_cmp
 * Rename arm_smmu_invs_merge_cmp to arm_smmu_invs_cmp
 * Call arm_smmu_invs_flush_iotlb_tags() from arm_smmu_invs_unref()
 * Unconditionally trim the invs->num_invs inside arm_smmu_invs_unref(),
   and simplify arm_smmu_install_old_domain_invs().
v2:
 https://lore.kernel.org/all/cover.1757373449.git.nicolinc@nvidia.com/
 * Rebase on v6.17-rc5
 * Improve kdocs and inline comments
 * Add arm_smmu_invs_dbg() for tracing
 * Use users refcount to replace todel flag
 * Initialize num_invs in arm_smmu_invs_alloc()
 * Add a struct arm_smmu_inv_state to group invs pointers
 * Add in struct arm_smmu_invs two flags (has_ats and old)
 * Rename master->invs to master->build_invs, and sort the array
 * Rework arm_smmu_domain_inv_range() and arm_smmu_invs_end_batch()
 * Copy entries by struct arm_smmu_inv in arm_smmu_master_build_invs()
 * Add arm_smmu_invs_flush_iotlb_tags() for IOTLB flush by last device
 * Rework three invs mutation helpers, and prioritize use the in-place
   mutation for detach
 * Take writer's lock unconditionally but keep it short, and only take
   reader's lock conditionally on a has_ats flag
v1:
 https://lore.kernel.org/all/cover.1755131672.git.nicolinc@nvidia.com/

Thanks
Nicolin

Jason Gunthorpe (1):
  iommu/arm-smmu-v3: Introduce a per-domain arm_smmu_invs array

Nicolin Chen (6):
  iommu/arm-smmu-v3: Explicitly set smmu_domain->stage for SVA
  iommu/arm-smmu-v3: Add an inline arm_smmu_domain_free()
  iommu/arm-smmu-v3: Pre-allocate a per-master invalidation array
  iommu/arm-smmu-v3: Populate smmu_domain->invs when attaching masters
  iommu/arm-smmu-v3: Add arm_smmu_invs based arm_smmu_domain_inv_range()
  iommu/arm-smmu-v3: Perform per-domain invalidations using
    arm_smmu_invs

 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h   | 143 ++-
 .../iommu/arm/arm-smmu-v3/arm-smmu-v3-sva.c   |  35 +-
 .../iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c  |  92 ++
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c   | 925 +++++++++++++++---
 4 files changed, 1015 insertions(+), 180 deletions(-)

-- 
2.43.0


