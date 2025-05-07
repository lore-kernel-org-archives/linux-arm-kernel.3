Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F6A8C3ABBF
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 10:06:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qToc0botS6KRiI2vNTvVXpU4+kL+cf6GKnhi+Z7FaFk=; b=mhKoJ1oR1ohOVRYTj8IE0VSg3M
	6FEoFCoOvBX1sYvS1/2wPUVp1KSgsb42seahl/5fHWhM7QVFNU+g0LvI75upjpGxHY0O6NMlinT6q
	0xsKAinQCR7DBAazLMTwEZCw2Ne1RxNVHgBBP5f5N27BUqmbZvEsdggmzoyTIh0loENqLtSwSeiND
	B8x/3OytfxMZETTh3q+553E9ax5Bmk/aCJy6rMAkyyIZJqo7afPiUUvmvDmvUuXIs/dzNeVaOaTrR
	Z1cc+KG8s1zXqiXsCPXIVi88dyGSIMKyYsEML2h/foIKgoH2aheir3fo4oTBGkQMshm0DiLid40hz
	Ti1rLyNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCbfm-0000000F4HY-0r25;
	Wed, 07 May 2025 10:06:42 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCbXT-0000000F2NM-3xos
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 May 2025 09:58:09 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A0D1A339;
	Wed,  7 May 2025 02:57:55 -0700 (PDT)
Received: from e129823.cambridge.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id A99063F5A1;
	Wed,  7 May 2025 02:58:02 -0700 (PDT)
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
	shmeerali.kolothum.thodi@huawei.com,
	james.morse@arm.com,
	mark.rutland@arm.com,
	huangxiaojia2@huawei.com,
	akpm@linux-foundation.org,
	surenb@google.com,
	robin.murphy@arm.com
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Yeoreum Yun <yeoreum.yun@arm.com>
Subject: [PATCH v4 0/6] support FEAT_MTE_TAGGED_FAR feature
Date: Wed,  7 May 2025 10:57:51 +0100
Message-Id: <20250507095757.1663684-1-yeoreum.yun@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_025808_078490_9A9811C8 
X-CRM114-Status: UNSURE (   9.45  )
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

Patch #3 adds mtefar hwcap test

Patch #4 prepares to add mtefar testcase

Patch #5 refactor check_mmap_option with loop to add mtefar testcase

Patch #6 adds mtefar test cases corresponding to
each testcase of check_mmap_options

Patch History
================
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


Yeoreum Yun (6):
  arm64/cpufeature: add FEAT_MTE_TAGGED_FAR feature
  arm64: report address tag when FEAT_MTE_TAGGED_FAR is supported
  tools/kselftest: add MTE_FAR hwcap test
  kselftest/arm64/mte: preparation for mtefar test
  kselftest/arm64/mte: refactor check_mmap_option test
  kselftest/arm64/mte: add mtefar test on check_mmap_option

 Documentation/arch/arm64/elf_hwcaps.rst       |   3 +
 Documentation/arch/arm64/tagged-pointers.rst  |  11 +-
 arch/arm64/include/asm/hwcap.h                |   1 +
 arch/arm64/include/uapi/asm/hwcap.h           |   1 +
 arch/arm64/kernel/cpufeature.c                |   9 +
 arch/arm64/kernel/cpuinfo.c                   |   1 +
 arch/arm64/mm/fault.c                         |   7 +-
 arch/arm64/tools/cpucaps                      |   1 +
 tools/testing/selftests/arm64/abi/hwcap.c     |   6 +
 .../selftests/arm64/mte/check_buffer_fill.c   |   2 +-
 .../selftests/arm64/mte/check_child_memory.c  |   4 +-
 .../arm64/mte/check_hugetlb_options.c         |   4 +-
 .../selftests/arm64/mte/check_ksm_options.c   |   4 +-
 .../selftests/arm64/mte/check_mmap_options.c  | 244 +++++++++++++-----
 .../arm64/mte/check_tags_inclusion.c          |   2 +-
 .../selftests/arm64/mte/check_user_mem.c      |   2 +-
 .../selftests/arm64/mte/mte_common_util.c     |  70 ++++-
 .../selftests/arm64/mte/mte_common_util.h     |   8 +-
 tools/testing/selftests/arm64/mte/mte_def.h   |   8 +
 19 files changed, 291 insertions(+), 97 deletions(-)

--
LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}


