Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 987BACA5FE1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 02:31:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=LLtfnaSADh4KKLm5CDtYMWgbkHR29nEoVi88j2Uze6U=; b=MIfp7zA7ZReIExzeURaVUSFjhv
	DO/ZuRywuFqFFiKHVesg0Ay9DAdCM5PETeprHNeFLBBeyM6/3nN+E6Dgzq1iINdM2T9Q1O9qVJ7eI
	299wRz8hhwwq6ZFSiG1MP448VASA4xigdFBiOZrnScDOr3uQPSy2A1aLlXwkxMoSUoXZIiyO0/S8p
	L7gz7nF7Q7enI0FBb1Awan4bVa3rHekZAtfyr7hlwSn+MQGDMHYbcSy347IpneIDNsCv6bFRCwYd6
	DDiaweEdNOgP8RiSACBYjzrIyDj5CQ0I2ZLY3vjDtrhpSQNLgHAyFIeOAgleY1jj0SKguVpnDUt5E
	W2xcKHYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhf2y-00000001GOU-0lby;
	Mon, 19 Jan 2026 02:31:16 +0000
Received: from canpmsgout12.his.huawei.com ([113.46.200.227])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhf2r-00000001GLu-1p5Z
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Jan 2026 02:31:12 +0000
Received: from mail.maildlp.com (unknown [172.19.163.163])
	by canpmsgout12.his.huawei.com (SkyGuard) with ESMTPS id 4dvZ8z2bbXznTZb;
	Mon, 19 Jan 2026 10:26:59 +0800 (CST)
Received: from dggemv706-chm.china.huawei.com (unknown [10.3.19.33])
	by mail.maildlp.com (Postfix) with ESMTPS id AF7E640565;
	Mon, 19 Jan 2026 10:30:58 +0800 (CST)
Received: from kwepemq200004.china.huawei.com (7.202.195.237) by
 dggemv706-chm.china.huawei.com (10.3.19.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 19 Jan 2026 10:30:58 +0800
Received: from huawei.com (10.90.31.46) by kwepemq200004.china.huawei.com
 (7.202.195.237) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 19 Jan
 2026 10:30:57 +0800
From: Zhou Wang <wangzhou1@hisilicon.com>
To: <catalin.marinas@arm.com>, <will@kernel.org>, <maz@kernel.org>,
	<oliver.upton@linux.dev>, <arnd@arndb.de>, <joey.gouly@arm.com>,
	<suzuki.poulose@arm.com>, <yuzenghui@huawei.com>
CC: <linux-arm-kernel@lists.infradead.org>, <kvmarm@lists.linux.dev>,
	<yangyccccc@gmail.com>, <prime.zeng@hisilicon.com>, <xuwei5@huawei.com>,
	<wangzhou1@hisilicon.com>
Subject: [PATCH v8 RESEND 0/7] Add support for FEAT_{LS64, LS64_V} and related tests
Date: Mon, 19 Jan 2026 10:29:21 +0800
Message-ID: <20260119022928.149358-1-wangzhou1@hisilicon.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.31.46]
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 kwepemq200004.china.huawei.com (7.202.195.237)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260118_183109_775863_69B0AB83 
X-CRM114-Status: GOOD (  15.25  )
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

Armv8.7 introduces single-copy atomic 64-byte loads and stores
instructions and its variants named under FEAT_{LS64, LS64_V}.
Add support for Armv8.7 FEAT_{LS64, LS64_V}:
- Add identifying and enabling in the cpufeature list
- Expose the support of FEAT_LS64 to userspace through HWCAP3 and cpuinfo
- Add related hwcap test
- Handle the trap of unsupported memory (normal/uncacheable) access in a VM

A real scenario for this feature is that the userspace driver can make use of
this to implement direct WQE (workqueue entry) - a mechanism to fill WQE
directly into the hardware.

Picked Marc's 2 patches form [1] for handling the LS64 trap in a VM on emulated
MMIO and the introduce of KVM_EXIT_ARM_LDST64B.

[1] https://lore.kernel.org/linux-arm-kernel/20240815125959.2097734-1-maz@kernel.org/

Tested with updated hwcap test(host in VHE):
[root@localhost tmp]# ./hwcap
[...]
# LS64 present
ok 226 cpuinfo_match_LS64
ok 227 sigill_LS64
ok 228 # SKIP sigbus_LS64
# 120 skipped test(s) detected. Consider enabling relevant config options to improve coverage.
# Totals: pass:108 fail:0 xfail:0 xpass:0 skip:120 error:0

Tested with updated hwcap test(guest in VHE):
root@localhost:/mnt# ./hwcap
[...]
# LS64 present
ok 226 cpuinfo_match_LS64
ok 227 sigill_LS64
ok 228 # SKIP sigbus_LS64
# 120 skipped test(s) detected. Consider enabling relevant config options to improve coverage.
# Totals: pass:108 fail:0 xfail:0 xpass:0 skip:120 error:0

Tested nVHE case as well, same log as above.

Change since v7:
- Tiny spelling fix in 1/7
- Change the order between 5/7 and 6/7
- Remove has_ls64, use has_cpuid_feature directly in 6/7
- Add Acked-by from Arnd and Oliver
- Trap st64bv from EL0 to EL1/EL2
- Rebase on v6.19-rc5
Link: https://lore.kernel.org/all/20251107072127.448953-1-wangzhou1@hisilicon.com/

Change since v6:
- Add exception inject about nested VM in 3/7
- Remove __maybe_unused related codes in 7/7, replace to use asm clobber
- Add my signoff in each patch
- Rebase on v6.18-rc4
Link: https://lore.kernel.org/all/20251024090819.4097819-1-wangzhou1@hisilicon.com/

Change since v5:
- Rebase on v6.18-rc2 and fix the conflicts
- Add more description in elf_hwcaps.rst as suggested by Catalin Marinas
Link: https://lore.kernel.org/all/20250818064806.25417-1-yangyicong@huawei.com/

Change since v4:
- Rebase on v6.17-rc2 and fix the conflicts
Link: https://lore.kernel.org/linux-arm-kernel/20250715081356.12442-1-yangyicong@huawei.com/

Change since v3:
- Inject DABT fault for LS64 fault on unsupported memory but with valid memslot
Link: https://lore.kernel.org/linux-arm-kernel/20250626080906.64230-1-yangyicong@huawei.com/

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
  arm64: Provide basic EL2 setup for FEAT_{LS64, LS64_V} usage at EL0/1
  KVM: arm64: Enable FEAT_{LS64, LS64_V} in the supported guest
  arm64: Add support for FEAT_{LS64, LS64_V}
  kselftest/arm64: Add HWCAP test for FEAT_LS64

 Documentation/arch/arm64/booting.rst      | 12 ++++++
 Documentation/arch/arm64/elf_hwcaps.rst   |  7 ++++
 Documentation/virt/kvm/api.rst            | 43 ++++++++++++++++----
 arch/arm64/include/asm/el2_setup.h        | 12 +++++-
 arch/arm64/include/asm/esr.h              |  8 ++++
 arch/arm64/include/asm/hwcap.h            |  1 +
 arch/arm64/include/asm/kvm_emulate.h      |  7 ++++
 arch/arm64/include/uapi/asm/hwcap.h       |  1 +
 arch/arm64/kernel/cpufeature.c            | 28 +++++++++++++
 arch/arm64/kernel/cpuinfo.c               |  1 +
 arch/arm64/kvm/inject_fault.c             | 34 ++++++++++++++++
 arch/arm64/kvm/mmio.c                     | 27 ++++++++++++-
 arch/arm64/kvm/mmu.c                      | 14 ++++++-
 arch/arm64/tools/cpucaps                  |  2 +
 include/uapi/linux/kvm.h                  |  3 +-
 tools/testing/selftests/arm64/abi/hwcap.c | 49 +++++++++++++++++++++++
 16 files changed, 238 insertions(+), 11 deletions(-)

-- 
2.33.0


