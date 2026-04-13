Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C331EBFD1C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Apr 2026 08:54:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=sM5WJLmS187eu3PK+ekpM6wWlyHbe6xu3h3jsuzh92s=; b=4ZY6LIw1knXcyoD4WX5B91F0Lw
	FTFWXTG9oGG4JqJjv2QvdiWqY3SxPEdGE+DPDlP1Vo+61SngfBttChuK8+328phJD65QFw4rPY26Y
	yzBMNFJ7PinUDDdoBWK9Eaav934oHv3Oz4XKzHZd10o/THc/avjt8u7SGD0/mQFaRvOiRGS+HTHT0
	I3Y9+e3TDM9M2bh/cj7FFpPKoFnLzREcRZ6ml19018STvLz7ffxLTqdIPUviZpFid+IoQ1gfvb6p1
	zlO/2IRWMkRY6LS8hkE350GQSHz9bLZsJhNaFjR9FyXcPrB3cQ0Ygkq1cCH+qqyoPQQQtYRkPvmFR
	gZW4i1fQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCD3w-0000000FJ8V-0WPu;
	Mon, 13 Apr 2026 08:54:32 +0000
Received: from canpmsgout09.his.huawei.com ([113.46.200.224])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCD3s-0000000FJ7W-3NY4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Apr 2026 08:54:31 +0000
dkim-signature: v=1; a=rsa-sha256; d=h-partners.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=sM5WJLmS187eu3PK+ekpM6wWlyHbe6xu3h3jsuzh92s=;
	b=bXekAH/EKoUsWU5aAWB6tGtLSsbK6OQ3acsYhixH9hjO5S83Q7U1c6TiON06nTO5a/LlQe5HH
	GPgGzYtWVAB4s/yMLRaiXabAzkZmlJHyGeHkkddCShAL1re8nxQ3Rd85KEeYsTSkRWWC1AiKwfZ
	RIh+29cnlw8eKvaFSkdBe4k=
Received: from mail.maildlp.com (unknown [172.19.163.127])
	by canpmsgout09.his.huawei.com (SkyGuard) with ESMTPS id 4fvLdq646Dz1cyPZ;
	Mon, 13 Apr 2026 16:47:59 +0800 (CST)
Received: from kwepemf100008.china.huawei.com (unknown [7.202.181.222])
	by mail.maildlp.com (Postfix) with ESMTPS id 28C1B40572;
	Mon, 13 Apr 2026 16:54:16 +0800 (CST)
Received: from huawei.com (10.50.87.109) by kwepemf100008.china.huawei.com
 (7.202.181.222) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Mon, 13 Apr
 2026 16:54:15 +0800
From: Zeng Heng <zengheng4@huawei.com>
To: <ben.horgan@arm.com>, <Dave.Martin@arm.com>, <james.morse@arm.com>,
	<tan.shaopeng@jp.fujitsu.com>, <reinette.chatre@intel.com>,
	<fenghuay@nvidia.com>, <tglx@kernel.org>, <will@kernel.org>, <hpa@zytor.com>,
	<bp@alien8.de>, <babu.moger@amd.com>, <dave.hansen@linux.intel.com>,
	<mingo@redhat.com>, <tony.luck@intel.com>, <gshan@redhat.com>,
	<catalin.marinas@arm.com>
CC: <linux-arm-kernel@lists.infradead.org>, <x86@kernel.org>,
	<linux-kernel@vger.kernel.org>, <wangkefeng.wang@huawei.com>
Subject: [PATCH v8 next 00/10] arm_mpam: Introduce Narrow-PARTID feature
Date: Mon, 13 Apr 2026 16:53:55 +0800
Message-ID: <20260413085405.1166412-1-zengheng4@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.50.87.109]
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 kwepemf100008.china.huawei.com (7.202.181.222)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260413_015429_517028_0594DF7B 
X-CRM114-Status: GOOD (  15.89  )
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

Background
==========

On x86, the resctrl allows creating up to num_rmids monitoring groups
under parent control group. However, ARM64 MPAM is currently limited by
the PMG (Performance Monitoring Group) count, which is typically much
smaller than the theoretical RMID limit. This creates a significant
scalability gap: users expecting fine-grained per-process or per-thread
monitoring quickly exhaust the PMG space, even when plenty of reqPARTIDs
remain available.

The Narrow-PARTID feature, defined in the ARM MPAM architecture,
addresses this by associating reqPARTIDs with intPARTIDs through a
programmable many-to-one mapping. This allows the kernel to present more
logical monitoring contexts.

Design Overview
===============

The implementation extends the RMID encoding to carry reqPARTID
information:

  RMID = reqPARTID * NUM_PMG + PMG

In this patchset, a monitoring group is uniquely identified by the
combination of reqPARTID and PMG. The closid is represented by intPARTID,
which is exactly the original PARTID.

For systems with homogeneous MSCs (all supporting Narrow-PARTID), the
driver exposes the full reqPARTID range directly. For heterogeneous
systems where some MSCs lack Narrow-PARTID support, the driver utilizes
PARTIDs beyond the intPARTID range as reqPARTIDs to expand monitoring
capability. The sole exception is when any type of MSCs lack Narrow-PARTID
support, their percentage-based control mechanism prevents the use of
PARTIDs as reqPARTIDs.

Capability Improvements
=======================

--------------------------------------------------------------------------
The maximum        |  Sub-monitoring groups            | System-wide
number of          |  under a control group            | monitoring groups
--------------------------------------------------------------------------
Without reqPARTID  |  PMG                              | intPARTID * PMG
--------------------------------------------------------------------------
reqPARTID          |                                   |
static allocation  | (reqPARTID // intPARTID) * PMG    | reqPARTID * PMG
--------------------------------------------------------------------------
reqPARTID          |                                   |
dynamic allocation | (reqPARTID - intPARTID + 1) * PMG | reqPARTID * PMG
--------------------------------------------------------------------------

Note: The number of intPARTIDs can be capped via the boot parameter
mpam.intpartid_max. Under MPAM, reqPARTID count is always greater than
or equal to intPARTID count.

Series Structure
================

Patch 1: Fix pre-existing out-of-range PARTID issue between mount sessions.
Patches 2-6: Implement static reqPARTID allocation.
Patches 7-10: Implement dynamic reqPARTID allocation.

Changes
=======

Compared with v7:
  - Add boot parameter to limit mpam_intpartid_max.
  - Update the Narrow-PARTID enablement condition checks.
  - Add default group detection in mpam_thread_switch().
  - Correct patch series revision tag for consistency.

Compared with v6:
  - Add dynamic reqPARTID allocation implementation.
  - Add Patch 1 to fix pre-existing out-of-range PARTID issue.
  - Drop original patch 4 which has been merged into the baseline.

Compared with v5:
  - Redefine the RMID information.
  - Refactor the resctrl_arch_rmid_idx_decode() and
    resctrl_arch_rmid_idx_encode().
  - Simplify closid_rmid2reqpartid() to rmid2reqpartid() and replace it
    accordingly.

Compared with RFC-v4:
  - Rebase the patch set on the v6.14-rc1 branch.

Compared with RFC-v3:
  - Add limitation of the Narrow-PARTID feature (See Patch 2).
  - Remove redundant reqpartid2closid() and reqpartid_pmg2rmid().
  - Refactor closid_rmid2reqpartid() partially.
  - Merge the PARTID conversion-related patches into a single patch for
    bisectability.
  - Skip adaptation of resctrl_arch_set_rmid() which is going to be
    removed.

Compared with RFC-v2:
  - Refactor closid/rmid pair translation.
  - Simplify the logic of synchronize configuration.
  - Remove reqPARTID source bitmap.

Compared with RFC-v1:
  - Rebase this patch set on latest MPAM driver of the v6.12-rc1 branch.

Previous Versions
=================

    v7: https://lore.kernel.org/all/20260317132141.1272506-1-zengheng4@huawei.com/
    v6: https://lore.kernel.org/all/20250222112448.2438586-1-zengheng4@huawei.com/
    v5: https://lore.kernel.org/all/20250217031852.2014939-1-zengheng4@huawei.com/
RFC-v4: https://lore.kernel.org/all/20250104101224.873926-1-zengheng4@huawei.com/
RFC-v3: https://lore.kernel.org/all/20241207092136.2488426-1-zengheng4@huawei.com/
RFC-v2: https://lore.kernel.org/all/20241119135104.595630-1-zengheng4@huawei.com/
RFC-v1: https://lore.kernel.org/all/20241114135037.918470-1-zengheng4@huawei.com/

---

Zeng Heng (10):
  fs/resctrl: Fix MPAM Partid parsing errors by preserving CDP state
    during umount
  arm_mpam: Add intPARTID and reqPARTID support for Narrow-PARTID
    feature
  arm_mpam: Disable reqPARTID expansion when Narrow-PARTID is
    unavailable
  arm_mpam: Refactor rmid to reqPARTID/PMG mapping
  arm_mpam: Propagate control group config to sub-monitoring groups
  arm_mpam: Add boot parameter to limit mpam_intpartid_max
  fs/resctrl: Add rmid_entry state helpers
  arm_mpam: Implement dynamic reqPARTID allocation for monitoring groups
  fs/resctrl: Wire up rmid expansion and reclaim functions
  arm_mpam: Add mpam_sync_config() for dynamic rmid expansion

 arch/arm64/include/asm/mpam.h   |  12 +-
 arch/x86/include/asm/resctrl.h  |   7 +
 drivers/resctrl/mpam_devices.c  | 103 ++++++++---
 drivers/resctrl/mpam_internal.h |   6 +-
 drivers/resctrl/mpam_resctrl.c  | 294 ++++++++++++++++++++++++++++----
 fs/resctrl/monitor.c            |  50 +++++-
 fs/resctrl/rdtgroup.c           |  24 ++-
 include/linux/arm_mpam.h        |  17 ++
 include/linux/resctrl.h         |  21 +++
 9 files changed, 469 insertions(+), 65 deletions(-)

--
2.25.1


