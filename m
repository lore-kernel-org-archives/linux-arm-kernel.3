Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FF3EC43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 10:40:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TzxDX/ygReeQrlk1sYNRilh77KKsz9bv6yNc9K4h0lw=; b=zuuB1lj8EpE1OB0+41MrZ4I/uO
	8JrBWTJpUm0OY7UXu3CZIr9NwCGzto5Vv+o824F1evjJS0BMmgX0K3+GDxEABMH16K87ammqpnqPD
	/2o12NVrZfzUov+B+u5AG6oTdl3ealSebjv6TnJaLvwLLDSuGaKNRrp5W0KWtUTA+I8XKFSdRdyOR
	WrRL99aoWTEqcS/kCojZaW2dvsSYu7ORzC5N1GhvUsldMIh9E31safbKOyfNv48imgCZd1zVwGQHV
	KaNPWbNILdAQMgDOFLPvHo6QQa2q7y3PSntyioa4Rh9fK6SY5SmpVjobVFc0mZ3gYk/kvyAOyZL3M
	RNRdRuzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whmBU-00000001zoL-05yd;
	Thu, 09 Jul 2026 10:40:48 +0000
Received: from canpmsgout06.his.huawei.com ([113.46.200.221])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whmBL-00000001zfR-1K13
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 10:40:43 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=TzxDX/ygReeQrlk1sYNRilh77KKsz9bv6yNc9K4h0lw=;
	b=JItTGwbYHXyulRItA9RnQv+CqUdyX1fM8UlAGlM4b9F+aUA1pw54Uqbz1GTeiuFuA7eU7b8+k
	kQSSZKH+AuhLmhcHpyQLEz5g/ChpAzLTU1nvTMWjg1KK3hGa6YnyI2HqCynAyHf2g06GQuH46XT
	Cb1dNkFZA2dAUhDkglSI758=
Received: from mail.maildlp.com (unknown [172.19.162.197])
	by canpmsgout06.his.huawei.com (SkyGuard) with ESMTPS id 4gwrpp1CXBzRhQS;
	Thu,  9 Jul 2026 18:31:14 +0800 (CST)
Received: from kwepemr100010.china.huawei.com (unknown [7.202.195.125])
	by mail.maildlp.com (Postfix) with ESMTPS id 8C2A740579;
	Thu,  9 Jul 2026 18:40:27 +0800 (CST)
Received: from huawei.com (10.50.163.32) by kwepemr100010.china.huawei.com
 (7.202.195.125) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Thu, 9 Jul
 2026 18:40:26 +0800
From: Tian Zheng <zhengtian10@huawei.com>
To: <maz@kernel.org>, <oupton@kernel.org>, <catalin.marinas@arm.com>,
	<will@kernel.org>, <zhengtian10@huawei.com>
CC: <yuzenghui@huawei.com>, <wangzhou1@hisilicon.com>,
	<yangjinqian1@huawei.com>, <caijian11@h-partners.com>,
	<liuyonglong@huawei.com>, <yezhenyu2@huawei.com>, <yubihong@huawei.com>,
	<linuxarm@huawei.com>, <joey.gouly@arm.com>, <kvmarm@lists.linux.dev>,
	<kvm@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <seiden@linux.ibm.com>,
	<suzuki.poulose@arm.com>, <leo.bras@arm.com>
Subject: [PATCH v4 0/6] Support the FEAT_HDBSS introduced in Armv9.5
Date: Thu, 9 Jul 2026 18:40:20 +0800
Message-ID: <20260709104026.2612599-1-zhengtian10@huawei.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.50.163.32]
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 kwepemr100010.china.huawei.com (7.202.195.125)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_034039_645308_1DF238D5 
X-CRM114-Status: GOOD (  17.62  )
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

This series of patches add support to the Hardware Dirty state tracking
Structure (HDBSS) feature, which is introduced by the ARM architecture
in the DDI0601 (ID121123) version.

The HDBSS feature is an extension to the architecture that enhances
tracking translation table descriptors' dirty state, identified as
FEAT_HDBSS. This feature utilizes hardware assistance to achieve dirty
page tracking, aiming to significantly reduce the overhead of scanning
for dirty pages.

The purpose of this feature is to make the execution overhead of live
migration lower to both the guest and the host, compared to existing
approaches (write-protect or search stage-2 tables).

The required sysreg definitions for FEAT_HDBSS have been merged into
arm64 /sysregs:
  [1/5] arm64/sysreg: Add HDBSS related register information
        https://git.kernel.org/arm64/c/72f7be0c2e30


After these patches, the kernel automatically enables HDBSS when dirty
logging is enabled on any memslot, and disables HDBSS when dirty logging
is disabled on all memslots. This series does not support dirty ring
mode.

Depends-on: "KVM: arm64: Enable eager hugepage splitting if HDBSS is available"
	https://lore.kernel.org/linux-arm-kernel/20260629111820.1873540-3-leo.bras@arm.com/

This dependency is mandatory. Unlike v3, where DBM was added lazily on
the first dirty access via a page fault, v4 injects DBM into pgt->flags
at stage-2 MMU initialization time. Combined with HDBSS being auto-enabled
during migration setup, the first dirty access no longer triggers a page
fault. Consequently, if lazy hugepage splitting were relied upon (which
requires a page fault to trigger splitting), hugepages would never be
split, leading to guest hang after migration. Leonardo's patch above
ensures eager hugepage splitting is enabled (chunk_size != 0) when HDBSS
is available, guaranteeing that hugepages are properly split before
migration starts.

v3: https://lore.kernel.org/linux-arm-kernel/20260225040421.2683931-1-zhengtian10@huawei.com/

v3->v4 changes:
- Merge sysreg definitions into the FEAT_HDBSS detection patch (was a
  separate patch in v3).
- Add auto DBM (Dirty Bit Modifier) support as a new patch, suggested
  by Leonardo Bras. DBM is now controlled as a page-table level flag
  (KVM_PGTABLE_S2_DBM) rather than per-PTE. Note that DBM is injected
  at stage-2 MMU creation time, not lazily on first dirty access. This
  means the first write to a dirty-logged page does not generate a
  page fault, which is a key reason for the mandatory dependency on
  Leonardo's eager hugepage splitting patch (see Depends-on above).
- Split the v3 "Enable HDBSS support and handle HDBSSF events" patch
  into three patches: per-vCPU buffer management, fault handling and
  buffer flush, and auto enable/disable on dirty logging change. This
  implements kernel-managed automatic HDBSS enable/disable.
- Remove the KVM_CAP_ARM_HW_DIRTY_STATE_TRACK ioctl for manual HDBSS
  on/off. HDBSS is now automatically enabled/disabled based on dirty
  logging state via kvm_arch_commit_memory_region().
- Change HDBSS buffer flush triggers to vcpu_put, check_vcpu_requests,
  and kvm_handle_guest_abort.
- Store hdbss_order at VM level (kvm->arch.hdbss_order) instead of
  per-vCPU, since all vCPUs share the same order.
- Document patch is not included in this version; will be sent in a
  follow-up series.

Leonardo Bras (1):
  KVM: arm64: Enable eager hugepage splitting if HDBSS is available

Tian Zheng (2):
  KVM: arm64: Add support for FEAT_HDBSS
  KVM: arm64: Add auto DBM support for hardware dirty tracking

eillon (3):
  KVM: arm64: Add HDBSS per-vCPU buffer management
  KVM: arm64: Add HDBSS fault handling and buffer flush
  KVM: arm64: Add auto HDBSS enable/disable on dirty logging change

 arch/arm64/include/asm/cpufeature.h    |   5 +
 arch/arm64/include/asm/esr.h           |   5 +
 arch/arm64/include/asm/kvm_dirty_bit.h |  29 ++++
 arch/arm64/include/asm/kvm_host.h      |  14 ++
 arch/arm64/include/asm/kvm_pgtable.h   |   4 +
 arch/arm64/include/asm/sysreg.h        |  11 ++
 arch/arm64/kernel/cpufeature.c         |  12 ++
 arch/arm64/kvm/Makefile                |   1 +
 arch/arm64/kvm/arm.c                   |  29 ++++
 arch/arm64/kvm/dirty_bit.c             | 219 +++++++++++++++++++++++++
 arch/arm64/kvm/hyp/pgtable.c           |  35 +++-
 arch/arm64/kvm/hyp/vhe/switch.c        |  15 ++
 arch/arm64/kvm/mmu.c                   |  19 ++-
 arch/arm64/kvm/reset.c                 |   4 +
 arch/arm64/tools/cpucaps               |   1 +
 15 files changed, 399 insertions(+), 4 deletions(-)
 create mode 100644 arch/arm64/include/asm/kvm_dirty_bit.h
 create mode 100644 arch/arm64/kvm/dirty_bit.c

--
2.33.0


