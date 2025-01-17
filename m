Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B644DC02183
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jan 2025 15:27:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Lq9Ja3q2HAGhuTV/S89I3M8NImSD6GwahDE9+HxPv5k=; b=M7mwaiI4VMdXd6N/vL9btN6v55
	JjksivjyF6qQFXJkri0sLx2Z7WLaLNhsdZRiGoCusSFQdgjHWjQzazW6blPAM2Zr9fp26W7lzdII4
	JUhLhpiA13QDU/HAU2IL1AFPsC35fbfi8DwUgKoqxDC/HAZfjKaXxE7LwDl6o+7YVwf+uKisvKAPL
	ZeqGeKqB06uY3b0KRNmcoQqZBq+12FfTftlDuBzCJa3LFqhKkCRfXzBKzlh0n4DqIPRD2vSKc21yo
	SH2ca2CnRZI19WY9I9bG1rAgfjV7mtJfNxKszaD4cWgeY03ibSyjf1saTeFB41gTaT7FgMNPWtHrk
	YOQB6lLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYoFv-00000000cNx-43gO;
	Fri, 17 Jan 2025 15:27:31 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYo00-00000000ZFe-05EO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jan 2025 15:11:05 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 403992247;
	Fri, 17 Jan 2025 07:11:32 -0800 (PST)
Received: from e133380.cambridge.arm.com (e133380.arm.com [10.1.197.43])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 218DE3F73F;
	Fri, 17 Jan 2025 07:11:03 -0800 (PST)
From: Dave Martin <Dave.Martin@arm.com>
To: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	Zeng Heng <zengheng4@huawei.com>,
	Shaopeng Tan <tan.shaopeng@fujitsu.com>,
	James Morse <james.morse@arm.com>
Subject: [RFC PATCH v2 00/11] Introduce PARTID grouping support
Date: Fri, 17 Jan 2025 15:10:22 +0000
Message-Id: <20250117151033.1517882-13-Dave.Martin@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250117151033.1517882-1-Dave.Martin@arm.com>
References: <20250117151033.1517882-1-Dave.Martin@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250117_071104_135265_31AA3734 
X-CRM114-Status: GOOD (  32.84  )
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

(Was: Introduce flexible CLOSID/RMID translation) [5]

This series introduces an ID remapping scheme for mapping multiple MPAM
PARTIDs to each resctrl control group, and programs the intPARTID
appropriately on MSCs that require and support PARTID Narrowing.
Rudimentary support is included for detecting whether this
configuration will work correctly on the detected hardware, but this
detection is currently inflexible and may disable this multiple PARTID
mapping behaviour unnecessarily on some platforms.

(Feedback would be appreciated from anyone who knows of hardware where
this approach is insufficient.)


On supported platforms, this allows the number of monitoring groups per
resctrl control group to be scaled up by the value of the (provisional)
mpam.partid_per_closid kernel command-line parameter, at the expense of
reducing the number of control groups that can be created.

See "Background" below, and the subsequent sections, for more details.	

This series is not a complete implementation, but should be sufficient
to provide additional resctrl monitoring groups beyond the number of
PMGs supported by the hardware (with some limitations; see
"Limitations", below).


Based on:
git://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git mpam/snapshot/v6.12-rc1
4d17b37b670795954fd7a70c8ec83fb705a5e2ad ("arm64: mpam: Restore the expected MPAM sysregs on cpuhp")


Changes Since RFCv1: [5]

---
DROPPED:

 * arm_mpam: Clean up config update checks in mpam_apply_config()

      (present in the base branch)

CHANGED:

 * arm_mpam: Introduce flexible CLOSID/RMID translation

    * [bug fix] Add CDP index properly in mpam_resctrl_partid_range().

      (Also reported independently by Shaopeng Tan.)

    * [relaxation] Remove requirement that mpam_pmg_max + 1 is a power
      of two.

      (This constraint is redundant, due to the use of multiply/add
      transformations of MPAM IDs in place of shift/OR.)

NEW:

 * arm_mpam: Set INTERNAL as needed when setting MSC controls

      (resurrected from my local MPAM fixes branch; previously posted,
      but was not included in RFC v1 of this series)

 * fs/resctrl: Add arch hook to set up the default CLOSID
 * arm_mpam: resctrl: Implement arch hook to set up the default CLOSID

      Add and wire up a hook to update reprogram intPARTID everywhere
      when the resctrl<->MPAM ID mappings change.  This is needed for
      clean initialisation of the hardware, since the MPAM architecture
      doesn't specify the default mappings -- purging everything to a
      consistent state avoids the possibility of spurious aliasing.

 * arm_mpam: Add control partition identifier to mpam_config

      Add a mpam_config field to tell mpam_devices.c what to program
      for intPARTID.  (The idea is to keep the mapping logic in
      mpam_resctrl.c so that mpam_devices.c does not need to understand
      how this value is determined.)
      
 * arm_mpam: Skip inapplicable cases when reprogramming a resctrl domain

      To simplify programming of intPARTIDs, never try to program a
      PARTID with controls for the wrong resctrl_conf_type.  (If
      resctrl passed any control changes for the wrong
      resctrl_conf_type, that's a bug anyway...)

 * arm_mpam: Detect whether the system can alias PARTIDs

      Initial attempt to detect whether it is safe a map multiple
      PARTIDs to the same resctrl control group: if not, the
      user-specified mpam.partid_per_closid parameter is ignored, and
      the driver reverts back to the default behaviour of mapping a
      single PARTID to each CLOSID.
      
      This is currently simplistic, and only considers all MPAM MSCs
      and controls in the system (irrespective if they are going to be
      exposed through resctrl or not).
      

Background
==========

An MPAM Memory System Component (MSC) that does not implement the
PARTID Narrowing feature (Narrowing) provides independently
programmable resource controls for each PARTID up to the maximum PARTID
that the MSC supports.

An MSC that _does_ implement Narrowing performs a remapping step to
convert the PARTID from the incoming memory transaction ("request
PARTID", or "reqPARTID") to an internal ID ("internal PARTID", or
"intPARTID") before looking up and applying resource controls.  Such an
MSC does not necessarily need to provide the same number of
independently programmable resource control partitions (indexed by the
intPARTID) as that which the size of the supported PARTID ("reqPARTID")
space would otherwise require.  Instead, independently programmable
resource controls are provided for each intPARTID, accompanied by a
software programmable mapping that allows each reqPARTID to be mapped
independently to a selected intPARTID.

Typically, the number of intPARTIDs supported by a Narrowing MSC is
smaller than the number of reqPARTIDs.  Narrowing permits multiple
reqPARTIDs to be mapped to each intPARTID, so allowing the whole MPAM
PARTID space to be served.

A non-Narrowing MSC can be understood as implementing special case of
Narrowing, where the reqPARTID-to-intPARTID mapping is the identity
function and is not programmable.


The number of independently configurable control partitions at a given
MSC cannot exceed the number of intPARTIDs available, so the number of
resctrl CLOSIDs (which need to be independently controllable) must
typically be limited not to exceed the maximum number of intPARTIDs
available on any Narrowing MSC.

However, the presence of a programmable reqPARTID-to-intPARTID mapping
in each MSC creates an opportunity: because a group of multiple MPAM
PARTIDs can be mapped onto the same controls, they behave as a single
resource control partition.  Because the PARTID is used as a match
criterion for monitoring purposes along with the MPAM Performance
Monitoring Group (PMG) identifier assigned each memory system
transaction, the specific PARTID in the group can be used to
distinguish transactions for monitoring purposes, even within the same
resctrl control group and when the PMGs of the transactions are the
same.

This means that it becomes possible to provide a larger number of
resctrl monitoring groups than the number of PMGs supported by the MPAM
hardware implementation.


In order to take advantage of this, a more flexible mapping scheme is
required for mapping resctrl CLOSIDs and RMIDs to MPAM PARTIDs and PMGs
than the current MPAM driver provides.

Similar approaches have been suggested by other people
(see Acknowledgements).

However, since I was already working on this, I'm posting my approach
for comparison.


This Series
===========

This series introduces a remapping scheme as follows:

1) The resctrl partition identifiers are combined into a single
identifier (formally the Cartesian product of the CLOSID, Code/Data
partition where applicable, and RMID ID spaces).

2) The resulting identifier is then broken down into the MPAM PARTID
and PMG, in such a way that each possible <CLOSID, CDP index, RMID>
maps to a unique <PARTID, PMG> pair and vice versa, and so that any two
<PARTID, PMG> that differ only in the PMG value, map onto the same
<CLOSID, CDP index> pair.


This transformation could be done in intuitive way using bitwise
concatenation, shift and masking operations, but since the size of the
MPAM hardware ID spaces may limited, I have tried to generalise this
approach using multiplication in place of bit-shifts, to permit ID
spaces whose size is not a power of two.


Limitations
===========

This series aims to contain all translations within the mpam_resctrl.c
code.  This seems the most sensible place for it, since this is a
conversion scheme that will be used to interface the MPAM hardware with
the resctrl core code (but has nothing to do with the "pure" MPAM
architecture or the resctrl core code itself).

To simplify the interface between mpam_resctrl.c and mpam_devices.c,
the ID conversion scheme is arranged so that each resctrl CLOSID maps
to a contiguous sequence of MPAM PARTIDs.  This means that programming
controls for a CLOSID can be achieved by iterating over the appropriate
range of PARTIDs.

This series provides a basic configuration interface that may be too
inflexible for real hardware.


Acknowledgements
================

Thanks to Shaopeng Tan for pointing out this opportunity and suggesting
a related idea, and to Zeng Heng who has also implemented something
similar, albeit with a slightly different mapping scheme [2], [3], [4];
this has continued to develop. [1]


References
==========

Zeng Heng <zengheng4@huawei.com>:

[1] (v4) arm_mpam: Introduce the Narrow-PARTID feature for MPAM driver
https://lore.kernel.org/linux-arm-kernel/20250104101224.873926-1-zengheng4@huawei.com/

[2] (v3) arm_mpam: Introduce the Narrow-PARTID feature for MPAM driver
https://lore.kernel.org/linux-arm-kernel/20241207092136.2488426-1-zengheng4@huawei.com/

[3] (v2) arm_mpam: Introduce the Narrow-PARTID feature for MPAM driver
https://lore.kernel.org/linux-arm-kernel/20241119135104.595630-1-zengheng4@huawei.com/

[4] (v1) arm_mpam: Introduce the definitions of intPARTID and reqPARTID
https://lore.kernel.org/linux-arm-kernel/20241114135037.918470-1-zengheng4@huawei.com/

Dave Martin <Dave.Martin@arm.com>:

[5] (previous post) [RFC PATCH 0/6] Introduce flexible CLOSID/RMID translation
https://lore.kernel.org/lkml/20241212154000.330467-1-Dave.Martin@arm.com/


Dave Martin (11):
  arm_mpam: Fix read-back of cloned resource controls under CDP
    emulation
  arm_mpam: Delete unused function resctrl_arch_set_rmid()
  arm_mpam: Set INTERNAL as needed when setting MSC controls
  fs/resctrl: Add arch hook to set up the default CLOSID
  arm_mpam: resctrl: Implement arch hook to set up the default CLOSID
  arm_mpam: Introduce flexible CLOSID/RMID translation
  arm_mpam: [NFU] Rework ID remapping to use a kernel command-line
    argument
  arm_mpam: [NFU] Development diagnostics for MPAM ID assignments
  arm_mpam: Add control partition identifier to mpam_config
  arm_mpam: Skip inapplicable cases when reprogramming a resctrl domain
  arm_mpam: Detect whether the system can alias PARTIDs

 arch/arm64/include/asm/mpam.h               |  21 +-
 arch/x86/include/asm/resctrl.h              |  12 +
 drivers/platform/arm64/mpam/mpam_devices.c  |  88 +++++--
 drivers/platform/arm64/mpam/mpam_internal.h |   9 +
 drivers/platform/arm64/mpam/mpam_resctrl.c  | 260 +++++++++++++-------
 fs/resctrl/rdtgroup.c                       |  26 +-
 include/linux/arm_mpam.h                    |   5 +
 include/linux/resctrl.h                     |   2 +
 8 files changed, 299 insertions(+), 124 deletions(-)


base-commit: 4d17b37b670795954fd7a70c8ec83fb705a5e2ad
-- 
2.34.1

