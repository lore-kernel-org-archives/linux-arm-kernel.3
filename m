Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB12FC44501
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 14:45:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gfwVhHIGfMBNOBfZc0fhHxICCN5j24zeLO5FX4Jz0vg=; b=F5g25UwOLsPVeOX1/7ptThhsFN
	poKV9FIwaNrnBQRC0gGr+Lz1DR+zMQ2M4Jkv2bpesIliYIzuHhfdZkKHXhbz1gWnhWKfhlqrpa+KY
	+pO+wWk8jOmk1ftpnLpTyImW9MZY3kxaKMGdkXljG5x38+4/xx/kZzC+yCjP0gnh/CFeRawgAtcMu
	5mwhx8J45lx748SIms/SqvJFGlcaWu7x4VZKUN3c/EAI3ptPI0/feSWG2xjBbRAkPnkKhUSP5I54A
	PygiK6HW/rAf+vzLsHWfQo5/Zn6Wm3Zru0l+r5PHpCX5QD/HXcTK8CuNjS2afN27z/ePyjQHXsV/s
	JqadL36g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiCTv-000000056dl-1vNZ;
	Fri, 10 Jul 2026 14:45:35 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiCTr-000000056dD-2qPd
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jul 2026 14:45:34 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C1F1D176A;
	Fri, 10 Jul 2026 07:45:25 -0700 (PDT)
Received: from e142021.munich.arm.com (e142021.arm.com [10.41.150.148])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 264303F7B4;
	Fri, 10 Jul 2026 07:45:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783694730; bh=CmdEpFOqkxTtojFznvI3aUnHE9v/vrA/bSFWceNGWKw=;
	h=From:To:Cc:Subject:Date:From;
	b=hU4t0MAOlVRsDZ9fS5W6NdeAqiELD1hdUT8ENG0u/XyPaZQS960+ifvS6uwuZyd7Z
	 5F4N76VuqVlQmouXV6N6NYLcBw+7if0q9JOPVtEXMdOox/vknFiYa4fX5oRnF2+3wo
	 lpwGXSFsSkAHNQbAgi6EHSF4ygUtRYD60wj6H5zQ=
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
	linux-acpi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 00/16] arm_mpam: Add MPAM-Fb firmware support
Date: Fri, 10 Jul 2026 16:45:04 +0200
Message-ID: <20260710144520.917375-1-andre.przywara@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260710_074531_822959_22062407 
X-CRM114-Status: GOOD (  25.81  )
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

meet version 3 of the MPAM-Fb code, for firmware based MSC accesses.
Compared to last week's drop, this fixes many bugs that Ben's diligent
review revealed, many thanks for that!
No real major changes this time, though the revised mon_sel locking has
changed to a simpler scheme, and the MPAM-Fb protocol version is now checked
for compatibility at probe time. For the remaining smaller changes, find a
changelog below. Based on v7.2-rc1.

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

The first 12 patches rework all MSC access wrappers to propagate error
information. Pure MMIO based MSC accesses would never fail, but the
MPAM-Fb access can go wrong in multiple ways. The patches have been split
up purely for reviewing reasons, if the number is a problem, we could as
well squash them.
Patch 13/16 solves a nasty problem: At the moment we protect stateful MSC
register accesses (mon_sel) through a spinlock. Unfortunately the mailbox
subsystem and the slow nature of the communication through this channel
forbid MPAM-Fb access in atomic context. So this patch uses a mutex when
using MPAM-Fb, and the locking fails when trying to grab that mutex in
atomic context, for instance when programming MSCs inside an interrupt
handler. We just deny the latter when using MPAM-Fb, ideally we wouldn't
need that (no need to IPI another core when the MSC access does not need
to be local to one particular core), or we simply deny that part of the
functionality (access through perf).
Patch 14/16 adds the code to redirect MSC accesses through the
PCC shmem/mailbox system.
Patch 15/16 avoids the error IRQ handler to do an MSC access when using
MPAM_Fb, since those accesses cannot run in atomic context.
The final patch 16/16 then adds the code to detect and store the PCC
channel information from the ACPI tables, and eventually enables
MPAM-Fb accesses.

This would enable systems where some MSCs are not accessible via MMIO to
use those components anyway.

Please have a look and test!

Cheers,
Andre

[1] https://developer.arm.com/documentation/den0144/latest

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

Andre Przywara (16):
  arm_mpam: let low level MSC read accessors return an error
  arm_mpam: propagate MSC read errors for wrapper functions
  arm_mpam: propagate MSC read errors for hw_probe functions
  arm_mpam: propagate MSC read errors for mpam_msc_read_mbwu_l()
  arm_mpam: propagate MSC read errors for msmon helpers
  arm_mpam: propagate MSC read errors for __ris_msmon_read()
  arm_mpam: __ris_msmon_read(): get rid of nrdy special handling
  arm_mpam: propagate MSC read errors for state saving functions
  arm_mpam: let low level MSC write accessors return an error
  arm_mpam: propagate MSC write errors for ESR and part_sel wrappers
  arm_mpam: propagate MSC write errors for hardware probe functions
  arm_mpam: propagate MSC write errors for remaining MSC write users
  arm_mpam: prepare mon_sel locking for MPAM-Fb
  arm_mpam: add MPAM-Fb MSC firmware access support
  arm_mpam: prevent MPAM-Fb accesses inside IRQ handler
  arm_mpam: detect and enable MPAM-Fb PCC support

 drivers/acpi/arm64/mpam.c       |   2 +
 drivers/resctrl/Makefile        |   2 +-
 drivers/resctrl/mpam_devices.c  | 651 ++++++++++++++++++++++++--------
 drivers/resctrl/mpam_fb.c       | 208 ++++++++++
 drivers/resctrl/mpam_internal.h |  48 ++-
 include/linux/arm_mpam.h        |   2 +-
 6 files changed, 740 insertions(+), 173 deletions(-)
 create mode 100644 drivers/resctrl/mpam_fb.c

-- 
2.43.0


