Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 512E7CCFA03
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 16:32:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wAY8l3bu3+GaxF8DCGrITK7SZgVqSrHSIK8VPl8KsD8=; b=5CYApBKzTi+ZOFEjxONOEMHFuq
	IE88BUU4kuGAXVo6PwxntlNt5AAi8eWK6Ajc0Y6C2rrknSAs12dX30+NWV02Ox4avzXlmNcZAA1l9
	UkH/lZOGu26Q3wAx7WD09KB0RL26KscVj9K1ywzZrzNJgku0N61sHIW+6aD72QrZD2R04S+IgOgNe
	qibdFPjmSTR9569FNcsIlmSG2Gs88yHIEcwvVBL5yW8VPi0ji+c0ymNFzN6cudyPuSpQpmo8RpevH
	mk9daCZUPJMmLdrNdEDy05Lue4wJmQ3SFHLqgY3AIElTqU+08lH/qwDgd+Im8o5GE6j0hH3mD30fc
	9HQJvOaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFxTv-0000000AGeO-1Z9B;
	Mon, 03 Nov 2025 16:32:35 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFxTs-0000000AGdj-3ElZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Nov 2025 16:32:34 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0BE2B1D14;
	Mon,  3 Nov 2025 08:32:22 -0800 (PST)
Received: from e129823.cambridge.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id A43833F694;
	Mon,  3 Nov 2025 08:32:26 -0800 (PST)
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: catalin.marinas@arm.com,
	will@kernel.org,
	maz@kernel.org,
	broonie@kernel.org,
	oliver.upton@linux.dev,
	miko.lenczewski@arm.com,
	kevin.brodsky@arm.com,
	ardb@kernel.org,
	suzuki.poulose@arm.com,
	lpieralisi@kernel.org,
	yangyicong@hisilicon.com,
	scott@os.amperecomputing.com,
	joey.gouly@arm.com,
	yuzenghui@huawei.com,
	pbonzini@redhat.com,
	shuah@kernel.org,
	mark.rutland@arm.com
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Yeoreum Yun <yeoreum.yun@arm.com>
Subject: [PATCH v10 0/9] support FEAT_LSUI
Date: Mon,  3 Nov 2025 16:32:15 +0000
Message-Id: <20251103163224.818353-1-yeoreum.yun@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_083232_938507_B86CE24C 
X-CRM114-Status: UNSURE (   9.60  )
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

Since Armv9.6, FEAT_LSUI supplies the load/store instructions for
previleged level to access to access user memory without clearing
PSTATE.PAN bit.

This patchset support FEAT_LSUI and applies in futex atomic operation
and user_swpX emulation where can replace from ldxr/st{l}xr
pair implmentation with clearing PSTATE.PAN bit to correspondant
load/store unprevileged atomic operation without clearing PSTATE.PAN bit.


Patch Sequences
================

Patch #1 adds cpufeature for FEAT_LSUI

Patch #2-#3 expose FEAT_LSUI to guest

Patch #4 adds Kconfig for FEAT_LSUI

Patch #5-#6 support futex atomic-op with FEAT_LSUI

Patch #7-#9 support user_swpX emulation with FEAT_LSUI


Patch History
==============
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
  - expose FEAT_LUSI to guest
  - add help section for LUSI Kconfig
  - https://lore.kernel.org/all/20250611151154.46362-1-yeoreum.yun@arm.com/

from v1 to v2:
  - remove empty v9.6 menu entry
  - locate HAS_LUSI in cpucaps in order
  - https://lore.kernel.org/all/20250611104916.10636-1-yeoreum.yun@arm.com/


Yeoreum Yun (9):
  arm64: cpufeature: add FEAT_LSUI
  KVM: arm64: expose FEAT_LSUI to guest
  KVM: arm64: kselftest: set_id_regs: add test for FEAT_LSUI
  arm64: Kconfig: Detect toolchain support for LSUI
  arm64: futex: refactor futex atomic operation
  arm64: futex: support futex with FEAT_LSUI
  arm64: separate common LSUI definitions into lsui.h
  arm64: armv8_deprecated: convert user_swpX to inline function
  arm64: armv8_deprecated: apply FEAT_LSUI for swpX emulation.

 arch/arm64/Kconfig                            |   5 +
 arch/arm64/include/asm/futex.h                | 291 +++++++++++++++---
 arch/arm64/include/asm/lsui.h                 |  25 ++
 arch/arm64/kernel/armv8_deprecated.c          |  86 +++++-
 arch/arm64/kernel/cpufeature.c                |  10 +
 arch/arm64/kvm/sys_regs.c                     |   3 +-
 arch/arm64/tools/cpucaps                      |   1 +
 .../testing/selftests/kvm/arm64/set_id_regs.c |   1 +
 8 files changed, 360 insertions(+), 62 deletions(-)
 create mode 100644 arch/arm64/include/asm/lsui.h


base-commit: 6146a0f1dfae5d37442a9ddcba012add260bceb0
--
LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}


