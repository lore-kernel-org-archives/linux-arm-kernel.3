Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E417BFF8873
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Apr 2026 14:14:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wp0BldTQifRcCZ9DUZ6RbPMbwQHu6eZhpAGrRRM0Aho=; b=VI6LjdwBBw1HMjw/tVBfTXQNgV
	C+Gacjfs0HQ+AfXKD9FOnGuydS2ZToX567QGiwBv4TY2Y2EbZ/LTZFEtzbdutwnfgcoS7d5xCOO4g
	amoLDDQeQ4AMZYdcjRF6y3+5p+5qlPBdrWcMT3p/5+tuC1FxHm0dSnUFmTbX1440pYG7gZX7nmW3n
	XnMApaFkuB5CDQ/IAjc8OS1BM+txY1mtBPRJrrUaIsyrPittzFpip84AV6z6s2TWP/5QdkLAVAaFc
	ldelTPYmQgUHsok/ZPojK8gTgH6naPLpUhu/ldgnbCYB3dGb1rSoS4lqNbRzGe2X9hzFcDKhIu6zR
	l0CusGiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI5ga-00000003jrL-24Mv;
	Wed, 29 Apr 2026 14:14:44 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI5gX-00000003jqO-1HvD
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Apr 2026 14:14:42 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B2B1D1BCB;
	Wed, 29 Apr 2026 07:14:31 -0700 (PDT)
Received: from e142021.munich.arm.com (e142021.arm.com [10.41.150.154])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 04B953F62B;
	Wed, 29 Apr 2026 07:14:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1777472077; bh=Nm1JJiUwtF2SIt4FxjyGKG7BQYGelRR8KSdWEBQmk+s=;
	h=From:To:Cc:Subject:Date:From;
	b=AJiMTIvfYgjBuIFs8gz+fwIaYmaFii7/ZThE9mDsSCaNNIHOIiIG5cBU6BWbCCQkP
	 JHIzzKWgMw80DuPUzM6ESYMSNIr8JEm77JPf0jgn+HBiAOrrkZ4U35TxDjhr/ZgpMN
	 ZDcKtHeZso+KUF9ychGXkLe2VuoQU4K9BLfQTd3k=
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
	linux-acpi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/5] arm_mpam: Add MPAM-Fb firmware support
Date: Wed, 29 Apr 2026 16:13:34 +0200
Message-ID: <20260429141339.3171205-1-andre.przywara@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_071441_496718_2B77AA28 
X-CRM114-Status: GOOD (  17.90  )
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

Patch 1/5 adds more ACPI parsing code, to be able to learn all the
information we need.
Patch 2/5 solves a nasty problem: At the moment we protect stateful MSC
register accesses (mon_sel) through a spinlock. Unfortunately the mailbox
subsystem and the slow nature of the communication through this channel
forbid MPAM-Fb access in atomic context. So this patch splits the lock
in two: the "outer" one is a mutex, and only the inner one is a
spinlock, which would need to be taken when programming MSCs inside an
interrupt handler, for instance. We just deny the latter when using
MPAM-Fb, ideally we wouldn't need that (no need to IPI another core when
the MSC access does not need to be local to one particular core), or we
simply deny that part of the functionality (access through perf).
Patch 3/5 adds the code to redirect MSC accesses through the
shmem/mailbox system.
Patch 4/5 avoids the error IRQ handler to do an MSC access when using
MPAM_Fb, since those accesses cannot run in atomic context.
The final patch 5/5 then adds the code to detect and store the PCC
channel information from the ACPI tables, and eventually enables
MPAM-Fb accesses.

This would enable systems where some MSCs are not accessible via MMIO to
use those components anyway.

Please have a look and test!

Cheers,
Andre

[1] https://developer.arm.com/documentation/den0144/latest

Andre Przywara (3):
  arm_mpam: add MPAM-Fb MSC firmware access support
  arm_mpam: prevent MPAM-Fb accesses inside IRQ handler
  arm_mpam: detect and enable MPAM-Fb PCC support

James Morse (2):
  arm_mpam: Parse the rest of the ACPI table
  arm_mpam: Split the locking around the mon_sel registers

 drivers/acpi/arm64/mpam.c       |  93 ++++++++++++++++++-
 drivers/resctrl/Makefile        |   2 +-
 drivers/resctrl/mpam_devices.c  | 148 ++++++++++++++++++++++++------
 drivers/resctrl/mpam_fb.c       | 158 ++++++++++++++++++++++++++++++++
 drivers/resctrl/mpam_fb.h       |  17 ++++
 drivers/resctrl/mpam_internal.h |  72 +++++++++++----
 include/linux/arm_mpam.h        |   2 +-
 7 files changed, 439 insertions(+), 53 deletions(-)
 create mode 100644 drivers/resctrl/mpam_fb.c
 create mode 100644 drivers/resctrl/mpam_fb.h

-- 
2.43.0


