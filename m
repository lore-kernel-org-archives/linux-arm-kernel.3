Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53522C71157
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Jun 2025 08:49:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=biH8JucYT8uM2QISDJm0VmIH97asnTTJnSv0zs7sYtc=; b=Wl1e3NV3GY+pdoHoPEAH6GyvUX
	Pw5Syb9Anv6IvTNHgx1i24vllTBKOE8utov6Lf3R2HS994lyseik07JX60KmPgyf1byaul70h6xZc
	Odj5t/bYIks/0xByQib8cmzWg1hSGlezzAwKHDlDTKvqTir3lbQT7FS1EFX/FpaV2m9uhlBQFQa3t
	ID6b6lmfvnnnpKlXXF5yOatNiJP1nd9mEv4RhyxAxqfCITgK2S2jnpwynEt+Klc9RZygJAXMbauGA
	ngrLmcftTvspEuu/1i4IMSTardD1QIzw1uGLSXM8vuY1vSIZJ7DeTMcUDkzXjtpBrw3yxgx6c6nol
	oz2wsdqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRoTr-00000009THh-122P;
	Wed, 18 Jun 2025 08:49:15 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRoQ2-00000009SFS-1wG0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Jun 2025 08:45:19 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 53A1B14BF;
	Wed, 18 Jun 2025 01:44:57 -0700 (PDT)
Received: from e129823.cambridge.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id AD2B73F66E;
	Wed, 18 Jun 2025 01:45:15 -0700 (PDT)
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: catalin.marinas@arm.com,
	pcc@google.com,
	will@kernel.org,
	broonie@kernel.org,
	anshuman.khandual@arm.com,
	joey.gouly@arm.com,
	yury.khrustalev@arm.com,
	maz@kernel.org,
	oliver.upton@linux.dev,
	frederic@kernel.org,
	akpm@linux-foundation.org,
	surenb@google.com
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Yeoreum Yun <yeoreum.yun@arm.com>
Subject: [PATCH v9 00/10] support FEAT_MTE_TAGGED_FAR feature
Date: Wed, 18 Jun 2025 09:45:03 +0100
Message-Id: <20250618084513.1761345-1-yeoreum.yun@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_014518_591032_36C8C668 
X-CRM114-Status: UNSURE (   9.54  )
X-CRM114-Notice: Please train this message.
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

The FEAT_MTE_TAGGED_FAR feature provides support for
reporting all non-address bits during a synchronous MTE tag check fault.

This patchset extends the reporting tag to include
not only the memory tag (logical tag) but also the address tag via
si_addr when FEAT_MTE_TAGGED_FAR feature is supported.

Patch Sequences
================

Patch #1 adds cpufeature FEAT_MTE_TAGGED_FAR

Patch #2 adds MTE_FAR hwcaps and export address tag when it supports

Patch #3 expose MTE_FAR feature to guest

Patch #4 adds mtefar hwcap test

Patch #5 to #8 prepares to add mtefar testcase

Patch #9 refactor check_mmap_option using general testcase pattern

Patch #10 adds mtefar test cases corresponding to
each testcase of check_mmap_options

Patch History
================
v8 to v9:
  - expose MTE_FAR feature to guest
  - https://lore.kernel.org/linux-arm-kernel/20250611180734.63657-1-yeoreum.yun@arm.com/

v7 to v8:
  - rewording some comment word.
  - https://lore.kernel.org/all/20250611135818.31070-1-yeoreum.yun@arm.com/

v6 to v7:
  - fix some error on testcase.
  - https://lore.kernel.org/all/20250611094107.928457-1-yeoreum.yun@arm.com/

v5 to v6:
  - split Patch #4.
  - refactor check_mmap_option using general testcase pattern
  - https://lore.kernel.org/linux-arm-kernel/20250610150144.2523945-1-yeoreum.yun@arm.com/

v4 to v5:
  - rebased on v6.16-rc1
  - https://lore.kernel.org/linux-arm-kernel/20250507095757.1663684-1-yeoreum.yun@arm.com/

v3 to v4:
  - fix hwcap string for FEAT_MTE_TAGGED_FAR
  - split cpufeature and hwcap modification and merge hwcap's
    modification with exporting address tag patch
  - add mtefar testcase on check_mmap_options
  - https://lore.kernel.org/all/20250410074721.947380-1-yeoreum.yun@arm.com/

v2 to v3:
  - Rebase to 6.15-rc1
  - https://lore.kernel.org/all/20250403172758.67106-1-yeoreum.yun@arm.com/

v1 to v2:
  - add hwcap test for MTE_FAR feature.
  - add MTE_FAR doc into elf_hwcap.rst
  - https://lore.kernel.org/all/20250403142707.26397-1-yeoreum.yun@arm.com/


Yeoreum Yun (10):
  arm64/cpufeature: add FEAT_MTE_TAGGED_FAR feature
  arm64: report address tag when FEAT_MTE_TAGGED_FAR is supported
  arm64/kvm: expose FEAT_MTE_TAGGED_FAR feature to guest
  tools/kselftest: add MTE_FAR hwcap test
  kselftest/arm64/mte: register mte signal handler with
    SA_EXPOSE_TAGBITS
  kselftest/arm64/mte: check MTE_FAR feature is supported
  kselftest/arm64/mte: add address tag related macro and function
  kselftest/arm64/mte: add verification for address tag in signal
    handler
  kselftest/arm64/mte: refactor check_mmap_option test
  kselftest/arm64/mte: add mtefar tests on check_mmap_options

 Documentation/arch/arm64/elf_hwcaps.rst       |   3 +
 Documentation/arch/arm64/tagged-pointers.rst  |  11 +-
 arch/arm64/include/asm/hwcap.h                |   1 +
 arch/arm64/include/uapi/asm/hwcap.h           |   1 +
 arch/arm64/kernel/cpufeature.c                |   9 +
 arch/arm64/kernel/cpuinfo.c                   |   1 +
 arch/arm64/kvm/sys_regs.c                     |  14 +-
 arch/arm64/mm/fault.c                         |   7 +-
 arch/arm64/tools/cpucaps                      |   1 +
 tools/testing/selftests/arm64/abi/hwcap.c     |   6 +
 .../selftests/arm64/mte/check_buffer_fill.c   |   2 +-
 .../selftests/arm64/mte/check_child_memory.c  |   4 +-
 .../arm64/mte/check_hugetlb_options.c         |   4 +-
 .../selftests/arm64/mte/check_ksm_options.c   |   4 +-
 .../selftests/arm64/mte/check_mmap_options.c  | 551 +++++++++++++++---
 .../arm64/mte/check_tags_inclusion.c          |   2 +-
 .../selftests/arm64/mte/check_user_mem.c      |   2 +-
 .../selftests/arm64/mte/mte_common_util.c     |  70 ++-
 .../selftests/arm64/mte/mte_common_util.h     |   6 +-
 tools/testing/selftests/arm64/mte/mte_def.h   |   8 +
 20 files changed, 603 insertions(+), 104 deletions(-)

--
LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}


