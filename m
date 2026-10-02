Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A5AECA5FDD
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 17:40:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5ivS2IKFp+oi9e9HgqllYmPlXhiT1574w8ipYcXx5vg=; b=r8dq4eHPQsV+4EUtHAHcqzHxiZ
	f6fBerYwJ369oYNylXyQSV0crxpYRnpW2Qy0Tfau+eqGwzugz+/y7qPpo2Ui19u6B+eaB6/lVWluU
	1W6Mx/bB0vZQkbVWrm35MNs095GID3sNfGOOCU+Sn6sh0lgCS5XAidZDpj0rlFVal6AEks69Sicee
	ofhJ9i0p8TUS3WKPgVTJj8PyjzuWU74DS1Kn0zFw428oAxu5BN2qRtahCm15vWqAVA9r0MJSfQnDW
	bSWiFlhwzTZRnkck2RW6uN7qYqsej47UnnKDyit/G4N8JQJrUJRQqGM1QQlgqnrW30GdadJf4+TAJ
	c7HyJAxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xChEi-0000000CB9z-1hQq;
	Fri, 02 Oct 2026 17:39:56 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xChEg-0000000CB8S-0oJT
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 17:39:55 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 00A021476;
	Fri,  2 Oct 2026 10:39:49 -0700 (PDT)
Received: from eglon.cambridge.arm.com (eglon.cambridge.arm.com [10.2.212.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 71B0F3F85F;
	Fri,  2 Oct 2026 10:39:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790962792; bh=Thm7HB8yfR7hbpCLx3Egj1hWNG5VcXaY9qiSQ1XBCB4=;
	h=From:To:Cc:Subject:Date:From;
	b=TV5uYRdYP9E9m7w2biORRih95JtlXjkLhM9LdKwel5W/8YGHlNiIEwcu+lA602iIX
	 QZIMtf9S+49+sNQaidnmRj5bUw7WbBXsoO0Jx8nrl4lRrBBTfWY4ejPGlU1bNEcCVn
	 6Hu6QpLGg+6zxkxegQ4kKo4uF/iV1+OUd1ZvDaeU=
From: James Morse <james.morse@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Ben Horgan <ben.horgan@arm.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	James Morse <james.morse@arm.com>
Subject: [GIT PULL/PATCH 00/27] MPAM driver changes for v7.4
Date: Fri,  2 Oct 2026 18:39:13 +0100
Message-ID: <20261002173941.292319-1-james.morse@arm.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_103954_323270_F7CED57D 
X-CRM114-Status: GOOD (  15.69  )
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

Hi Catalin, Will,

These are the MPAM driver change for v7.4 to either pick or pull the signed tag.

I don't think the drivers/acpi/arm64/mpam.c change needs an ACK from the ACPI
folk. It only affects the MPAM driver by adding an mpam-fb-id we're expecting
to need in the future. (that whole pattern is to be future proof for DT).

Sudeep originally thought it unnecessary, but after some clarification:
https://lore.kernel.org/linux-arm-kernel/20260924-snobbish-brainy-velociraptor-06bdd4@sudeepholla/


Thanks,

James
---
The following changes since commit eb0fde98fee407118bfcb10e38400494e0699201:

  arm64: mpam: Document when to set arm64.nompam (2026-10-01 17:00:43 +0100)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git tags/mpam/for-next/v7.4_v2

for you to fetch changes up to cb351e3f304b260fc2f11cca5ed819fc9ac7c46d:

  arm_mpam: detect and enable MPAM-Fb PCC support (2026-10-02 18:27:11 +0100)

----------------------------------------------------------------
 - Fix a list of theoretical issues with the driver.
 - Add mailing list and a missing file to MAINTAINERS.
 - Add support for a firmware-backed MPAM interface.

----------------------------------------------------------------

Andre Przywara (13):
  arm_mpam: let low level MSC accessors return an error
  arm_mpam: propagate MSC access errors for hw_probe functions
  arm_mpam: propagate MSC access errors for MBWU counters
  arm_mpam: propagate MSC access errors for msmon helpers
  arm_mpam: propagate MSC access errors for __ris_msmon_read()
  arm_mpam: propagate MSC access errors for state saving function
  arm_mpam: propagate MSC access errors for mpam_reprogram_ris_partid()
  arm_mpam: propagate MSC access errors for interrupt control
  arm_mpam: propagate MSC access errors in mpam_reset_class_locked()
  arm_mpam: prepare mon_sel locking for MPAM-Fb
  arm_mpam: add MPAM-Fb MSC firmware access support
  arm_mpam: change MPAM-Fb error IRQ to use a threaded IRQ handler
  arm_mpam: detect and enable MPAM-Fb PCC support

Ben Horgan (13):
  arm_mpam: Move MPAMF_ECR write helpers to allow reuse
  arm_mpam: Restore the error interrupt enable from mpam_cpu_online()
  arm_mpam: Set mpam_feat_msmon_mbwu_31counter when there are bandwidth
    counters
  arm_mpam: Add missing mon_sel locking in MBWU save and restore
  arm_mpam: Ensure MBWU counters are reset on restore
  arm_mpam: Use __ris_msmon_read() for saving MBWU state
  arm_mpam: Initialize all of struct mon_read in
    mpam_restore_mbwu_state()
  arm_mpam: resctrl: Correct check that existing class is L3
  arm_mpam: resctrl: Make read_mon_cdp_safe() self consistent
  arm_mpam: Don't loop forever if there is the maximum possible amount
    of PARTIDs
  arm_mpam: Switch to kvzmalloc_objs() for allocation of component cfg
  arm_mpam: resctrl: Don't stop early when tearing down a class
  MAINTAINERS: Use linux-arm-kernel list for the MPAM driver

Fuad Tabba (1):
  MAINTAINERS: Add mpam.rst to the MPAM DRIVER entry

 MAINTAINERS                     |    2 +
 drivers/acpi/arm64/mpam.c       |    6 +-
 drivers/resctrl/Kconfig         |    2 +
 drivers/resctrl/Makefile        |    2 +-
 drivers/resctrl/mpam_devices.c  | 1049 +++++++++++++++++++++++--------
 drivers/resctrl/mpam_fb.c       |  258 ++++++++
 drivers/resctrl/mpam_internal.h |   70 ++-
 drivers/resctrl/mpam_resctrl.c  |   13 +-
 include/linux/arm_mpam.h        |    2 +-
 9 files changed, 1104 insertions(+), 300 deletions(-)
 create mode 100644 drivers/resctrl/mpam_fb.c

-- 
2.53.0


