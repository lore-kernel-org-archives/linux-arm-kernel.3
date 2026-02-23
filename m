Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E186EC1116
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 17:48:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=GMOvldHSi72+GsOik6+6lwgF7IiFcmC9RJkZn+j/dOM=; b=L0qd3mJAcjS3Hiy7g8qGpHeemS
	FGreJW1d0fMB+XzY+9N6H8GJM/unQ8/3aTQNKOlqoBr0CCwqbVxKjaYy1mX+jMZl6l+Mqrs0xa5Tx
	qurL6jtFpFHtfYpylxvwBlbQI4JouTB7UjOqkpFtZo1RiRDwaregyF9vK67FyOiXHmQsmwXWteitQ
	Z8vDRgBk1nbtU9shGQGLZ5pruMmllaG/vF7rOA+p1B2Fht9ZltPvJpM3Da/gURfqyWmG5WNxkSUC9
	EqvsqibGPOTvKP6FObV724yC5k3zDnJKld6qLgmKpepOmdGkgrDSwrZErO+XpBKIFyedyR8k4MJtV
	xHbgpiZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vua2X-00000000onI-36gm;
	Mon, 23 Feb 2026 17:48:13 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vua2U-00000000omN-2ozw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Feb 2026 17:48:12 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 13ADD339;
	Mon, 23 Feb 2026 09:48:01 -0800 (PST)
Received: from e129823.cambridge.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B2BE43F59E;
	Mon, 23 Feb 2026 09:48:04 -0800 (PST)
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	maz@kernel.org,
	oupton@kernel.org,
	miko.lenczewski@arm.com,
	kevin.brodsky@arm.com,
	broonie@kernel.org,
	ardb@kernel.org,
	suzuki.poulose@arm.com,
	lpieralisi@kernel.org,
	yangyicong@hisilicon.com,
	joey.gouly@arm.com,
	yuzenghui@huawei.com,
	yeoreum.yun@arm.com
Subject: [PATCH v13 0/8] support FEAT_LSUI
Date: Mon, 23 Feb 2026 17:47:54 +0000
Message-Id: <20260223174802.458411-1-yeoreum.yun@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_094810_860017_19D641F3 
X-CRM114-Status: GOOD (  10.58  )
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

Since Armv9.6, FEAT_LSUI supplies the load/store instructions for
previleged level to access to access user memory without clearing
PSTATE.PAN bit.

This patchset support FEAT_LSUI and applies it mainly in
futex atomic operation and others.

This patch based on v7.0-rc1


Patch History
==============
form v12 to v13:
  - rebase to v7.0-rc1
  - apply CASLT for swapping guest descriptor
  - remove has_lsui() for checking cpu feature.
  - simplify __lsui_cmpxchg32() according to @Catalin's suggestion.
  - use uaccess_ttbr0_enable()/disable() for LSUI instructions.
  - https://lore.kernel.org/all/aYWuqTqM5MvudI5V@e129823.arm.com/

from v11 to v12:
  - rebase to v6.19-rc6
  - add CONFIG_ARM64_LSUI
  - enable LSUI when !CPU_BIG_ENDIAN and PAN presents.
  - drop the swp emulation with LSUI insns instead, disable it
    when LSUI presents.
  - some of small fixes (useless prefix and suffix and etc).
  - https://lore.kernel.org/all/20251214112248.901769-1-yeoreum.yun@arm.com/

from v10 to v11:
  - rebase to v6.19-rc1
  - use cast instruction to emulate deprecated swpb instruction
  - https://lore.kernel.org/all/20251103163224.818353-1-yeoreum.yun@arm.com/

from v9 to v10:
  - apply FEAT_LSUI to user_swpX emulation.
  - add test coverage for LSUI bit in ID_AA64ISAR3_EL1
  - rebase to v6.18-rc4
  - https://lore.kernel.org/all/20250922102244.2068414-1-yeoreum.yun@arm.com/

from v8 to v9:
  - refotoring __lsui_cmpxchg64()
  - rebase to v6.17-rc7
  - https://lore.kernel.org/all/20250917110838.917281-1-yeoreum.yun@arm.com/

from v7 to v8:
  - implements futex_atomic_eor() and futex_atomic_cmpxchg() with casalt
    with C helper.
  - Drop the small optimisation on ll/sc futex_atomic_set operation.
  - modify some commit message.
  - https://lore.kernel.org/all/20250816151929.197589-1-yeoreum.yun@arm.com/

from v6 to v7:
  - wrap FEAT_LSUI with CONFIG_AS_HAS_LSUI in cpufeature
  - remove unnecessary addition of indentation.
  - remove unnecessary mte_tco_enable()/disable() on LSUI operation.
  - https://lore.kernel.org/all/20250811163635.1562145-1-yeoreum.yun@arm.com/

from v5 to v6:
  - rebase to v6.17-rc1
  - https://lore.kernel.org/all/20250722121956.1509403-1-yeoreum.yun@arm.com/

from v4 to v5:
  - remove futex_ll_sc.h futext_lsui and lsui.h and move them to futex.h
  - reorganize the patches.
  - https://lore.kernel.org/all/20250721083618.2743569-1-yeoreum.yun@arm.com/

from v3 to v4:
  - rebase to v6.16-rc7
  - modify some patch's title.
  - https://lore.kernel.org/all/20250617183635.1266015-1-yeoreum.yun@arm.com/

from v2 to v3:
  - expose FEAT_LSUI to guest
  - add help section for LSUI Kconfig
  - https://lore.kernel.org/all/20250611151154.46362-1-yeoreum.yun@arm.com/

from v1 to v2:
  - remove empty v9.6 menu entry
  - locate HAS_LSUI in cpucaps in order
  - https://lore.kernel.org/all/20250611104916.10636-1-yeoreum.yun@arm.com/


Yeoreum Yun (8):
  arm64: cpufeature: add FEAT_LSUI
  KVM: arm64: expose FEAT_LSUI to guest
  KVM: arm64: kselftest: set_id_regs: add test for FEAT_LSUI
  arm64: futex: refactor futex atomic operation
  arm64: futex: support futex with FEAT_LSUI
  arm64: armv8_deprecated: disable swp emulation when FEAT_LSUI present
  KVM: arm64: use CASLT instruction for swapping guest descriptor
  arm64: Kconfig: add support for LSUI

 arch/arm64/Kconfig                            |  20 ++
 arch/arm64/include/asm/futex.h                | 284 +++++++++++++++---
 arch/arm64/include/asm/lsui.h                 |  27 ++
 arch/arm64/kernel/armv8_deprecated.c          |  16 +
 arch/arm64/kernel/cpufeature.c                |  10 +
 arch/arm64/kvm/at.c                           |  32 +-
 arch/arm64/kvm/sys_regs.c                     |   3 +-
 arch/arm64/tools/cpucaps                      |   1 +
 .../testing/selftests/kvm/arm64/set_id_regs.c |   1 +
 9 files changed, 342 insertions(+), 52 deletions(-)
 create mode 100644 arch/arm64/include/asm/lsui.h

--
LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}


