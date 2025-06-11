Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC33DC71134
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 19:54:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ocmMt/JbRi06gee9MOU+VVdTi0Ui2qg8PHPc4JZahAY=; b=JB2QKeM+s7QEn+stBqxMwaorIr
	NzHHWDI4V/nr2u/tMkcJYK8DojVzWYHt9mEHc/jHgaZDERB3+bP6Qof1qtmw31LxnQ4i6z2QI3eap
	h9J5ovm9Q7UTS/PIJIgvfOiwXcaxIepjHajAWZlo6WnrppnAL2d5hA540wfoGaaGBZ3Ndspv4Ign2
	eC8GW61ZuQwR5wxvrFR7sZabVZqGIigxPWDWQ9SIzASRzixTCm7y0sq+/r0QB6U8p8/ngVTg5T4v6
	okwZzeYkrNtcIBQHA7F8AJUphChirZJYcTuck/LDbZwwKq32Z2418Hr8ptZz+9Zpv5pSZY0RvZqN4
	+yeExZRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPRWC-0000000B0tv-2p59;
	Wed, 11 Jun 2025 19:53:52 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPN0A-0000000AK5u-1SE2
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 11 Jun 2025 15:04:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=ocmMt/JbRi06gee9MOU+VVdTi0Ui2qg8PHPc4JZahAY=; b=abDx48XZPBTCAeBJqEGivjAj6i
	2l72t8XpQaws5x8SSLThPyCgp+Ute57yiDWbjK9SR3RbHgbOnwqXqB8dyp1JR875oTFt0NWRuUkQY
	DswM2v3a5tolApcjCNsCaAYUlnREKMQrtqE6ooFo4Oxw7XWxLNXLiSpYTSwc4yAbS6Ie1oHVTLBhK
	Dz4agi0vbUi4A/6R5Yy+mj/wChdFISsO3IDE900TAm1WhNE5giHK6PTZ1chEz4N4ZqUID6B+HExtX
	+ksSJZs5giVvTrL+mo7v1gkxkIo/nYM+lHiYcKSYb7G36TpB9POO1p1wX48cCAmKO7kcjgbntSu0u
	Hw41XDLw==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPN07-00000002Pgn-0AaM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Jun 2025 15:04:29 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8952F15A1;
	Wed, 11 Jun 2025 08:04:02 -0700 (PDT)
Received: from e129823.cambridge.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E38D23F59E;
	Wed, 11 Jun 2025 08:04:18 -0700 (PDT)
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: catalin.marinas@arm.com,
	pcc@google.com,
	will@kernel.org,
	broonie@kernel.org,
	anshuman.khandual@arm.com,
	joey.gouly@arm.com,
	maz@kernel.org,
	oliver.upton@linux.dev,
	frederic@kernel.org,
	hardevsinh.palaniya@siliconsignals.io,
	samuel.holland@sifive.com,
	palmer@rivosinc.com,
	charlie@rivosinc.com,
	thiago.bauermann@linaro.org,
	bgray@linux.ibm.com,
	tglx@linutronix.de,
	puranjay@kernel.org,
	david@redhat.com,
	yang@os.amperecomputing.com,
	mbenes@suse.cz,
	joel.granados@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Yeoreum Yun <yeoreum.yun@arm.com>
Subject: [PATCH v6 0/7] support FEAT_MTE_STORE_ONLY feature
Date: Wed, 11 Jun 2025 16:04:10 +0100
Message-Id: <20250611150417.44850-1-yeoreum.yun@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_160427_473057_91F9FA7C 
X-CRM114-Status: GOOD (  12.37  )
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

ARMv8.5 based processors introduce the Memory Tagging Extension (MTE) feature.
MTE is built on top of the ARMv8.0 virtual address tagging TBI
(Top Byte Ignore) feature and allows software to access a 4-bit
allocation tag for each 16-byte granule in the physical address space.
A logical tag is derived from bits 59-56 of the virtual
address used for the memory access. A CPU with MTE enabled will compare
the logical tag against the allocation tag and potentially raise an
tag check fault on mismatch, subject to system registers configuration.

Since ARMv8.9, FEAT_MTE_STORE_ONLY can be used to restrict raise of tag
check fault on store operation only.
For this, application can use PR_MTE_STORE_ONLY flag
when it sets the MTE setting with prctl().

This feature omits tag check for fetch/read operation.
So it might be used not only debugging purpose but also be used
in runtime requiring strong memory safty in normal env.

Patch Sequences
================

Patch #1 adds cpufeature FEAT_MTE_STORE_ONLY

Patch #2 introduce new flag -- PR_MTE_STORE_ONLY

Patch #3 support MTE_STORE_ONLY feature

Patch #4 add HWCAP for MTE_STORE_ONLY

Patch #5 adds mte store-only hwcap test

Patch #6 preparation for adding mte store-only testcase

Patch #7 adds mte store-only testcases

Patch History
================
v5 to v6:
  - fix testcase constant
  - fix subject of Patch #5
  - https://lore.kernel.org/all/20250611094802.929332-1-yeoreum.yun@arm.com/

v4 to v5:
  - rebase to v6.16-rc1
  - refactor the check_mmap_options for STORE_ONLY testcases.
  - https://lore.kernel.org/linux-arm-kernel/20250507154654.1937588-1-yeoreum.yun@arm.com/

v3 to v4:
  - separate cpufeature and hwcap commit.
  - add mte store-only testcases in check_mmap_options
  - https://lore.kernel.org/linux-arm-kernel/aApBk8eGA2Eo57fq@e129823.arm.com/

v2 to v3:
  - rebase to 6.15-rc1
  - https://lore.kernel.org/linux-arm-kernel/20250403174701.74312-1-yeoreum.yun@arm.com/

v1 to v2:
  - add doc to elf_hwcaps.rst
  - add MTE_STORE_ONLY hwcap test
  - https://lore.kernel.org/linux-arm-kernel/20250403142707.26397-1-yeoreum.yun@arm.com/

NOTE:
  This patch based on https://lore.kernel.org/all/20250611135818.31070-1-yeoreum.yun@arm.com/

Yeoreum Yun (7):
  arm64/cpufeature: add MTE_STORE_ONLY feature
  prctl: introduce PR_MTE_STORE_ONLY
  arm64/kernel: support store-only mte tag check
  arm64/hwcaps: add MTE_STORE_ONLY hwcaps
  kselftest/arm64/abi: add MTE_STORE_ONLY feature hwcap test
  kselftest/arm64/mte: preparation for mte store only test
  kselftest/arm64/mte: add MTE_STORE_ONLY testcases

 Documentation/arch/arm64/elf_hwcaps.rst       |   3 +
 arch/arm64/include/asm/hwcap.h                |   1 +
 arch/arm64/include/asm/processor.h            |   2 +
 arch/arm64/include/uapi/asm/hwcap.h           |   1 +
 arch/arm64/kernel/cpufeature.c                |   9 +
 arch/arm64/kernel/cpuinfo.c                   |   1 +
 arch/arm64/kernel/mte.c                       |  11 +-
 arch/arm64/kernel/process.c                   |   6 +-
 arch/arm64/tools/cpucaps                      |   1 +
 include/uapi/linux/prctl.h                    |   2 +
 tools/testing/selftests/arm64/abi/hwcap.c     |   6 +
 .../selftests/arm64/mte/check_buffer_fill.c   |  10 +-
 .../selftests/arm64/mte/check_child_memory.c  |   4 +-
 .../arm64/mte/check_hugetlb_options.c         |   6 +-
 .../selftests/arm64/mte/check_ksm_options.c   |   2 +-
 .../selftests/arm64/mte/check_mmap_options.c  | 363 +++++++++++++++++-
 .../testing/selftests/arm64/mte/check_prctl.c |  25 +-
 .../arm64/mte/check_tags_inclusion.c          |   8 +-
 .../selftests/arm64/mte/check_user_mem.c      |   2 +-
 .../selftests/arm64/mte/mte_common_util.c     |  14 +-
 .../selftests/arm64/mte/mte_common_util.h     |   3 +-
 21 files changed, 438 insertions(+), 42 deletions(-)

--
LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}


