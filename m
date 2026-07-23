Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E297AC531F8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 15:55:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=sGoe/gmrtJCrgtyTXzN4t34OIlv1gkV0QmTLq0aBHSc=; b=ZDfBywTTXpX8pT7pSvHmMAtY0/
	wES6Whj0PXZD9XcYWdfCoQOMvPiF5/j1tU3V0OpMjYn/dj2Ry3/F0nSWkzBI1c3K92TzQLG66adBe
	oEhsHeuTkvavIlHsbbLfa+yGN4REkdA2Np3WVpiPT1r/x3/QJL3+GSh2/GT4NsNJGemTwFKZ+8IvK
	flPDjUBW3Y0qDtfOwtxldZw5bSXDnuRRipkwCWmVJMAk+qVoxZtCAXb5JV5/z6rgcQP5DWzwVEVH/
	a6/yXUyPc0HkxpfL0ccjAvCOjah4PUHeSYopdsjfFcZuK7yTrIZmwqW8iGeqAtXeH20B7Fom1WH0T
	yLt1770A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmvlL-0000000EeMY-1SJu;
	Thu, 23 Jul 2026 15:55:07 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmvlH-0000000EeLp-2foc
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jul 2026 15:55:05 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1B7A41477;
	Thu, 23 Jul 2026 08:54:56 -0700 (PDT)
Received: from e142021.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D128A3F66F;
	Thu, 23 Jul 2026 08:54:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784822100; bh=+JUD8bEyu5CuRUUbzQgW2C8blvrGcxqCXiio59X2jAo=;
	h=From:To:Cc:Subject:Date:From;
	b=oV73lmb83PxbSoAJZoUr/8WKG+9xoA1ltUBlW2MNzoZoSUqzs9JKBtlSnyQ7xFjE3
	 iFBEQZiSDketqzX6XvZWFA+01ZW4jQwPBnfbfvA//64OS9A5bw7sh1rzBxhX9EA5uc
	 JS4DfXop7QZAKmoX44z064moBTmKESbEB322Xl/I=
From: Andre Przywara <andre.przywara@arm.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Hanjun Guo <guohanjun@huawei.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>,
	James Morse <james.morse@arm.com>,
	Ben Horgan <ben.horgan@arm.com>,
	Reinette Chatre <reinette.chatre@intel.com>,
	Fenghua Yu <fenghuay@nvidia.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
	Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>,
	Ganapatrao Kulkarni <ganapatrao.kulkarni@oss.qualcomm.com>,
	Trilok Soni <tsoni@quicinc.com>,
	Srinivas Ramana <sramana@qti.qualcomm.com>,
	Niyas Sait <niyas.sait@arm.com>,
	Lee Trager <lee@trager.us>,
	linux-acpi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 00/10] arm_mpam: Add MPAM-Fb firmware support
Date: Thu, 23 Jul 2026 17:54:44 +0200
Message-ID: <20260723155454.1760823-1-andre.przywara@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_085503_864782_2BAFFE1F 
X-CRM114-Status: GOOD (  27.42  )
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

Hi,

this is version 4 of the MPAM-Fb code, for firmware based MSC accesses.
Thanks to Jonathan's fearless review, a lot of the error handling has
been improved, mostly courtesy of new kernel toys like scoped_guard and
ACQUIRE(). Also the error handling pattern has been unified, to be
consistent within this series, but also to match common kernel patterns.
However I did not reorder the changes significantly, although some
patches have been squashed to avoid touching a line multiple times.
Also Ben, Niyas and Lee noticed bugs and other subtle issues, which have
been fixed. On top of that, the "nrdy" handling optimisation has been
dropped (for now).
Find a changelog below. Based on v7.2-rc1.

=======================
The Arm MPAM specification defines Memory System Components (MSCs),
which are devices that are programmed through an MMIO register frame. In
some occasions this turned out to be too limiting: the MSC might be
located behind a separate bus system (for instance inside an on-board
controller), it might be mapped secure-only, or in a different processor
socket without direct MMIO mapping. Also the MMIO access might be too slow
or it would need to be filtered or otherwise access controlled. Finally
there might be bugs in the MSC integration, which require a mediating
firmware to be accessible.

To accommodate all those different use cases, the MPAM-Fb specification
[1] describes an alternative way to access MSCs. Accesses to an MSC
would be wrapped in a message and communicated to the system using a
shared-memory/mailbox system mostly mimicking the Arm SCMI spec.
For ACPI systems, this would be abstracted through an ACPI PCC channel,
which provides the shared-memory region and the mailbox trigger. We can
lean on existing ACPI parsing code to register with these two
subsystems, but cannot rely on the existing SCMI code in the kernel.
This means we somewhat need to open code a very simplified SCMI handler,
which just provides enough functionality for the very basic subset of
SCMI that the MPAM-Fb spec requires.

The first six patches rework all MSC access wrappers to propagate error
information. Pure MMIO based MSC accesses would never fail, but the
MPAM-Fb access can go wrong in multiple ways. The patches have been split
up purely for reviewing reasons, if the number is a problem, we could as
well squash them.
Patch 7/10 solves a nasty problem: At the moment we protect stateful MSC
register accesses (mon_sel) through a spinlock. Unfortunately the mailbox
subsystem and the slow nature of the communication through this channel
forbid MPAM-Fb access in atomic context. So this patch keeps using a
spinlock for MMIO based accesses, but reverts to a mutex otherwise.
We just deny taking the lock for MPAM-Fb in atomic context, ideally we
wouldn't need that (no need to IPI another core when the MSC access does
not need to be local to one particular core), or we simply deny that part
of the functionality (access through perf).
Patch 8/10 adds the code to redirect MSC accesses through the
PCC shmem/mailbox system.
Patch 9/10 avoids the error IRQ handler to do an MSC access when using
MPAM_Fb, since those accesses cannot run in atomic context.
The final patch 10/10 then adds the code to detect and store the PCC
channel information from the ACPI tables, and eventually enables
MPAM-Fb accesses.

This would enable systems where some MSCs are not accessible via MMIO to
use those components anyway.

Please have a look and test!

Cheers,
Andre

[1] https://developer.arm.com/documentation/den0144/latest

Changes in v4:
- unify error check patterns
- use scoped_guard(mutex) and ACQUIRE to simplify error handling
- use struct kref for PCC channel refcount
- drop unused mailbox rx_callback function
- increase size of props[] array to hold new msc_id property
- set mailbox TX timeout based on ACPI MPAM table field
- use devm_mutex_init() to allow automatic cleanup
- avoid overwriting error value for arm,not-ready-us property read
- prune MPAM-Fb protocol token to fit into bitmask inside register
- check return value for AIDR read
- use two separate MPAM-Fb protocol payload structs
- prune header list for mpam_fb.c
- drop "nrdy handled as an error" change
- fix message size field in MPAM-Fb protocol shmem area
- drop message size return from MPAM-Fb message build functions
- bring back IRQ flag in MPAM-Fb protocol header

Changes in v3:
- drop inner/outer mon_sel lock patch, replace with simpler version
- harmonise code patterns in error propagation changes
- drop mon_sel lock before erroring out in mpam_ris_hw_probe_csu_nrdy()
- refactor mpam_msc_read_mbwu_l() to return an error
- drop special NRDY handling in __ris_msmon_read()
- add IRQ numbers in error interrupt handler to help pinpoint failure
- refactor MPAM-Fb message generation to accommodate more than read/write
- check MPAM-Fb protocol version at probe time
- drop mpam_fb.h header, merge into mpam_internal.h
- translate MPAM-Fb error code in Linux codes where needed
- clear IRQ flag bit in MPAM-Fb protocol header
- drop unneeded endianness conversions when crafting MPAM-Fb message
- use C struct to model MPAM-Fb message payload

Changes in v2:
- add patches to add error propagation to MSC access wrappers
- drop former patch 1/5 (not needed)
- drop lock in mpam_reprogram_msc(), to avoid double lock
- add support for multiple MSCs per PCC channel
- adjust SCMI protocol code to use a PCC subtype 3 channel
- let PCC code handle the PCC channel negotiation (due to subtype 3)
- drop SCMI names in shmem offsets, and use existing PCC type 3 struct
- adjust shmem field offsets to match MPAM-Fb spec, not pure SCMI
- prevent MPAM-Fb calls inside atomic smp_call_function_any() payload
- skip all MSC accesses inside the IRQ handler when using MPAM-Fb


Andre Przywara (10):
  arm_mpam: let low level MSC accessors return an error
  arm_mpam: propagate MSC access errors for hw_probe functions
  arm_mpam: propagate MSC access errors for MBWU counters
  arm_mpam: propagate MSC access errors for msmon helpers
  arm_mpam: propagate MSC access errors for __ris_msmon_read()
  arm_mpam: propagate MSC access errors for state saving function
  arm_mpam: prepare mon_sel locking for MPAM-Fb
  arm_mpam: add MPAM-Fb MSC firmware access support
  arm_mpam: prevent MPAM-Fb accesses inside IRQ handler
  arm_mpam: detect and enable MPAM-Fb PCC support

 drivers/acpi/arm64/mpam.c       |   6 +-
 drivers/resctrl/Makefile        |   2 +-
 drivers/resctrl/mpam_devices.c  | 648 ++++++++++++++++++++++++--------
 drivers/resctrl/mpam_fb.c       | 197 ++++++++++
 drivers/resctrl/mpam_internal.h |  60 ++-
 include/linux/arm_mpam.h        |   2 +-
 6 files changed, 739 insertions(+), 176 deletions(-)
 create mode 100644 drivers/resctrl/mpam_fb.c

-- 
2.43.0


