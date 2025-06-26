Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFB48C7115B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Jun 2025 08:25:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=piwMmUpJCofTq4B0vAuuOKX5iYfRGcfGYQQYpHEAlFo=; b=MkJ+XSSN7+XAks09miKOYb6ItN
	7YN5eTVyiGHGIUakp9boyxNuE9F642mAs+1uEVf3I770hTbhi3JYHGus5yiEIzOBOoY2fbsXFQc7M
	uOg7cVHAz/zTuzl83jY2BOwRqV6PGrwJtKt2PLP6X4ADS3uSmHErvNvY8bnlif/LTSncvZHAYG9vh
	DbA7cVUjIUeuZPrtpkdUAKcPXSCgIizU0PS5gTr8/a7KkMHk34uO8Zvy7DNseur6Wqr0mzCtO5v2t
	8L51VPA9yFEFm25+U7HUe4eazKAgEXMIB48mwlLFBB1FDacZyeKB+beSbH+Ioe1s6XcmdrI/PiGNJ
	N1DXPb6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUhuu-0000000Axcd-2IHf;
	Thu, 26 Jun 2025 08:25:08 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUhfj-0000000AtwD-3ieY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Jun 2025 08:09:29 +0000
Received: from mail.maildlp.com (unknown [172.19.88.214])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4bSWSw2MzLz2CfD1;
	Thu, 26 Jun 2025 16:05:20 +0800 (CST)
Received: from dggemv712-chm.china.huawei.com (unknown [10.1.198.32])
	by mail.maildlp.com (Postfix) with ESMTPS id 4CA191A016C;
	Thu, 26 Jun 2025 16:09:18 +0800 (CST)
Received: from kwepemq200018.china.huawei.com (7.202.195.108) by
 dggemv712-chm.china.huawei.com (10.1.198.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 26 Jun 2025 16:09:18 +0800
Received: from localhost.localdomain (10.50.165.33) by
 kwepemq200018.china.huawei.com (7.202.195.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 26 Jun 2025 16:09:17 +0800
From: Yicong Yang <yangyicong@huawei.com>
To: <catalin.marinas@arm.com>, <will@kernel.org>, <maz@kernel.org>,
	<oliver.upton@linux.dev>, <corbet@lwn.net>,
	<linux-arm-kernel@lists.infradead.org>, <kvmarm@lists.linux.dev>,
	<linux-kselftest@vger.kernel.org>, <linux-doc@vger.kernel.org>
CC: <joey.gouly@arm.com>, <suzuki.poulose@arm.com>, <yuzenghui@huawei.com>,
	<shuah@kernel.org>, <jonathan.cameron@huawei.com>,
	<shameerali.kolothum.thodi@huawei.com>, <linuxarm@huawei.com>,
	<prime.zeng@hisilicon.com>, <xuwei5@huawei.com>, <yangyicong@hisilicon.com>,
	<tangchengchang@huawei.com>, <wangzhou1@hisilicon.com>
Subject: [PATCH v3 0/7] Add support for FEAT_{LS64, LS64_V} and related tests
Date: Thu, 26 Jun 2025 16:08:59 +0800
Message-ID: <20250626080906.64230-1-yangyicong@huawei.com>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.50.165.33]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemq200018.china.huawei.com (7.202.195.108)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_010928_264950_32347459 
X-CRM114-Status: GOOD (  13.21  )
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

From: Yicong Yang <yangyicong@hisilicon.com>

Armv8.7 introduces single-copy atomic 64-byte loads and stores
instructions and its variants named under FEAT_{LS64, LS64_V}.
Add support for Armv8.7 FEAT_{LS64, LS64_V}:
- Add identifying and enabling in the cpufeature list
- Expose the support of these features to userspace through HWCAP3
  and cpuinfo
- Add related hwcap test
- Handle the trap of unsupported memory (normal/uncacheable) access in a VM

A real scenario for this feature is that the userspace driver can make use of
this to implement direct WQE (workqueue entry) - a mechanism to fill WQE
directly into the hardware.

Picked Marc's 2 patches form [1] for handling the LS64 trap in a VM on emulated
MMIO and the introduce of KVM_EXIT_ARM_LDST64B.

[1] https://lore.kernel.org/linux-arm-kernel/20240815125959.2097734-1-maz@kernel.org/

Tested with hwcap test [*]:
[*] https://lore.kernel.org/linux-arm-kernel/20250331094320.35226-5-yangyicong@huawei.com/
On host:
root@localhost:/tmp# dmesg | grep "All CPU(s) started"
[    0.504846] CPU: All CPU(s) started at EL2
root@localhost:/tmp# ./hwcap
[...]
# LS64 present
ok 217 cpuinfo_match_LS64
ok 218 sigill_LS64
ok 219 # SKIP sigbus_LS64
# LS64_V present
ok 220 cpuinfo_match_LS64_V
ok 221 sigill_LS64_V
ok 222 # SKIP sigbus_LS64_V
# 115 skipped test(s) detected. Consider enabling relevant config options to improve coverage.
# Totals: pass:107 fail:0 xfail:0 xpass:0 skip:115 error:0

On guest:
root@localhost:/# dmesg | grep "All CPU(s) started"
[    0.451482] CPU: All CPU(s) started at EL1
root@localhost:/mnt# ./hwcap
[...]
# LS64 present
ok 217 cpuinfo_match_LS64
ok 218 sigill_LS64
ok 219 # SKIP sigbus_LS64
# LS64_V present
ok 220 cpuinfo_match_LS64_V
ok 221 sigill_LS64_V
ok 222 # SKIP sigbus_LS64_V
# 115 skipped test(s) detected. Consider enabling relevant config options to improve coverage.
# Totals: pass:107 fail:0 xfail:0 xpass:0 skip:115 error:0

Change since v2:
- Handle the LS64 fault to userspace and allow userspace to inject LS64 fault
- Reorder the patches to make KVM handling prior to feature support
Link: https://lore.kernel.org/linux-arm-kernel/20250331094320.35226-1-yangyicong@huawei.com/

Change since v1:
- Drop the support for LS64_ACCDATA
- handle the DABT of unsupported memory type after checking the memory attributes
Link: https://lore.kernel.org/linux-arm-kernel/20241202135504.14252-1-yangyicong@huawei.com/

Marc Zyngier (2):
  KVM: arm64: Add exit to userspace on {LD,ST}64B* outside of memslots
  KVM: arm64: Add documentation for KVM_EXIT_ARM_LDST64B

Yicong Yang (5):
  KVM: arm64: Handle DABT caused by LS64* instructions on unsupported
    memory
  KVM: arm/arm64: Allow user injection of unsupported exclusive/atomic
    DABT
  arm64: Provide basic EL2 setup for FEAT_{LS64, LS64_V} usage at EL0/1
  arm64: Add support for FEAT_{LS64, LS64_V}
  KVM: arm64: Enable FEAT_{LS64, LS64_V} in the supported guest

 Documentation/arch/arm64/booting.rst    | 12 ++++++
 Documentation/arch/arm64/elf_hwcaps.rst |  6 +++
 Documentation/virt/kvm/api.rst          | 43 +++++++++++++++++----
 arch/arm64/include/asm/el2_setup.h      | 12 +++++-
 arch/arm64/include/asm/esr.h            |  8 ++++
 arch/arm64/include/asm/hwcap.h          |  2 +
 arch/arm64/include/asm/kvm_emulate.h    |  7 ++++
 arch/arm64/include/uapi/asm/hwcap.h     |  2 +
 arch/arm64/include/uapi/asm/kvm.h       |  3 +-
 arch/arm64/kernel/cpufeature.c          | 51 +++++++++++++++++++++++++
 arch/arm64/kernel/cpuinfo.c             |  2 +
 arch/arm64/kvm/guest.c                  |  4 ++
 arch/arm64/kvm/inject_fault.c           | 29 ++++++++++++++
 arch/arm64/kvm/mmio.c                   | 27 ++++++++++++-
 arch/arm64/kvm/mmu.c                    | 21 +++++++++-
 arch/arm64/tools/cpucaps                |  2 +
 include/uapi/linux/kvm.h                |  3 +-
 17 files changed, 222 insertions(+), 12 deletions(-)

-- 
2.24.0


