Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0357C54F52
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 10:46:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Dz+MiuXqCk9nJezbBoG+wbjauzAqZQtRcWi/Ol0DmU4=; b=Er6MeU8cA83n+3fo/hmuKI182d
	gTWP3illR8ME44mfSiMFV2c05wtws3/hPbW1CyFbdTURIUC4Pdzy9xnYFAoR2XsKUek7By9DXyL9b
	0HEj03ZcXDkjQNIOrchgM4coVU05Y9VukcjHmwo6EnVQKRYpi/oWrwG13DX4/4pVWeH1tXMu68jZd
	5untijGC9GUES5i4PrrkaFeIrpPHfCB66Xtnwp0Vfm0BoFxNswNMNTM5X8QaH/NeckNzmGR/2epif
	i9pB03EU3o7po1qH+dqzA/Anbn4PvA/MROGYAItL+S2OhdSa624UuPGLBG0PzDT2i1m8JEqc8UtQZ
	wbXUoRag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp1nl-00000007a64-09b6;
	Wed, 29 Jul 2026 10:46:17 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp1ni-00000007a5S-05GR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jul 2026 10:46:15 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D9B7E1688;
	Wed, 29 Jul 2026 03:46:06 -0700 (PDT)
Received: from LeoBrasDK.cambridge.arm.com (LeoBrasDK.cambridge.arm.com [10.2.212.21])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 210293F66F;
	Wed, 29 Jul 2026 03:46:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785321970; bh=Md75CJuQbNrNXweyKclKuVtPBisDFWbMVxT23AUx+HY=;
	h=From:To:Cc:Subject:Date:From;
	b=kMsb8Czr355RusnK2H73RUNtSxOQXFprjaE1M0Y8357cDpeL3p9tKhfQ+ZEh5UFQE
	 7Md886P0jyikqGDNGtJULxr5aibbFeTOm2eYu6MKd9Uxu2j0/+N752qF6uxgJW8aqe
	 ENGeepirCHjSv8ntuKqcZhVl0WfxiZ7wRBkbfRK8=
From: Leonardo Bras <leo.bras@arm.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Fuad Tabba <tabba@google.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	James Morse <james.morse@arm.com>,
	Leonardo Bras <leo.bras@arm.com>,
	Yang Shi <yang@os.amperecomputing.com>,
	mrigendrachaubey <mrigendra.chaubey@gmail.com>,
	Thomas Huth <thuth@redhat.com>,
	Zeng Heng <zengheng4@huawei.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Mark Brown <broonie@kernel.org>,
	Sascha Bischoff <Sascha.Bischoff@arm.com>,
	Yicong Yang <yangyicong@hisilicon.com>,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	James Clark <james.clark@linaro.org>,
	Raghavendra Rao Ananta <rananta@google.com>,
	Yeoreum Yun <yeoreum.yun@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Tian Zheng <zhengtian10@huawei.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev,
	kvm@vger.kernel.org
Subject: [PATCH v3 00/11] KVM Dirty-bit cleaning hw accelerator (HACDBS)
Date: Wed, 29 Jul 2026 11:45:35 +0100
Message-ID: <20260729104548.3439958-1-leo.bras@arm.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=6173; i=leo.bras@arm.com; h=from:subject; bh=Md75CJuQbNrNXweyKclKuVtPBisDFWbMVxT23AUx+HY=; b=owGbwMvMwCX2pizjszvTwvWMp9WSGLIyb15l3bp9hWEz56P3H5SXVZbtYu9ymTJnm4JcYlU3X 3b+28nfO0pZGMS4GGTFFFlkH81fxfN9SsaRKz8WwMxhZQIZwsDFKQATSVzLyPB407wI5gMPJ7pz xnuubpVwe6OwS/S6ygnJh3JFuj9P/pjM8D/+aMi8qfkfo9s8LrgaFv5gldw/Z7/qzkkt9SsXMkW xJXEBAA==
X-Developer-Key: i=leo.bras@arm.com; a=openpgp; fpr=36E6C95AE0F111CC5B6F4D2E688C33F8A0C5B0C5
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_034614_137500_68145111 
X-CRM114-Status: GOOD (  22.98  )
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

Disclaimer: While this patchset is buildable and testable on it's own,
it is not ready to be merged, as it depends on bits from another
patchset that will superseed the one in [1], and will enable HDBSS.
See note below on patch 1.

My expectation on sharing this earlier is to gather feedback on
implementation and testing methods, to make sure it's sure it's ready
when [1] becomes ready. It should work for both lazy-splitting 
and eager-splitting scenarios.

===

Create an arch-generic dirty-bit cleaning acceleration interface, which
compiles-out if the arch does not implement it, and creates no new API.
Using that, implement an arm64 accelerator based on HACDBS.

This implementation is able to accelerate the cleaning on both
dirty-bitmap and dirty-ring tracking mechanisms on KVM.

Patch 1 is here just to make this testable, as this patchset
depends on bits from HDBSS that are not upstream yet. It is composed
of a bunch of bits that I collected across HDBSS patches so this can
work, so few free to ignore it on review. Patch 1 enables eager-splitting
by default, but that's for testing purposes only, this should work with 
both eager and lazy splitting, as both mark the page to be clean with
the DBM bit. 

This version relies on polling HACDBS registers to verify if the processing
is done, an thus HACDBSIRQ is not enabled/used.

Kernel v7.2-rc5 + this patchset builds properly, passing both kvm selftests
for dirty-bit tracking[2] and a qemu live migration test, with both
HW HACDBS enabled or disabled.

On terms of performance improvement, tests were done using
dirty_log_perf_test[3] to measure the time spent on the following ioctl:
a - KVM_GET_DIRTY_LOG,     using dirty-bitmap without manual protect
    command:    ./dirty_log_perf_test -m 3 -m 6 -m 12 -g
b - KVM_CLEAR_DIRTY_LOG,   using dirty-bitmap with manual protect
    command:    ./dirty_log_perf_test -m 3 -m 6 -m 12
c - KVM_RESET_DIRTY_RINGS, using dirty-ring, using 4096 entries/vcpu.
    command:    ./dirty_log_perf_test -m 3 -m 6 -m 12 -d 4096

Tests ran in the model show that runtime was reduced by:
-(a) 87.36% (0.08% stdev) for 1GB memory, and
     87.22% (0.01% stdev) for 3GB memory
-(b) 85.72% (0.08% stdev) for 1GB memory, and
     86.10% (0.04% stdev) for 3GB memory
-(b) 70.08% (0.24% stdev) for 1GB memory, and
     69.99% (0.03% stdev) for 3GB memory

Which means those syscalls are from 3.3x to 8x faster.
Above numbers already take into account the improvements in S2
hugepage-splitting that is implemented by [4].

Please let me know of any question :)

Thanks for reviewing!
Leo


Changes since v2:
- HACDBS completion is detected by polling registers instead of HACDBSIRQ
  - No need for ACPI enablement any longer
  - Fixes issue with possibly waiting forever on wfi()
- Cleaning routine now protected by preempt_notifiers,
  - Save reg status on preemption, and restore when it's back.
  - Was preempt_disable(), which was not good in case of long buffers
- Improved error paths in case of invalid memslot/range on dirty_ring
- Added dsb() barrier to make sure the cpu finishes writting to array
  before HACDBS starts.
- Fixed page-splitting skipping ranges for dirty-bit.
- Patches 1 & 2 from v2 merged into patch 1 of v3, as it's only about 
  setting enough bits to test it. 
v2 Link: https://lore.kernel.org/all/20260629111820.1873540-1-leo.bras@arm.com/

Changes since v1:
- Improvements on splitting with manual protect, skipping when cleaning
  pages from the same level-2 entry. (new patch)
- Got the correct concept of chunk_size and thus:
  - Corrected it to a reasonable chunk to do page splitting before
    rescheduling, considering new improvements from [4].
  - TTWL is not based in chunk size, so fix it in LAST_LEVEL
- Minor fixes, removing debugging traces
v1 Link: https://lore.kernel.org/all/20260430111424.3479613-2-leo.bras@arm.com/


[1]: https://lore.kernel.org/all/20260709104026.2612599-1-zhengtian10@huawei.com/
[2]: dirty_log_test && dirty_log_perf_test
[3]: using this patchset to enable dirty-ring on dirty_log_perf_test:
     https://lore.kernel.org/all/20260629105950.1790259-1-leo.bras@arm.com/
[4]: https://lore.kernel.org/all/20260618131447.764085-1-leo.bras@arm.com/

Leonardo Bras (11):
  KVM: arm64: HDBSS bits
  arm64/cpufeature: Add system-wide FEAT_HACDBS detection
  arm64/sysreg: Add HACDBS consumer and base registers
  KVM: arm64: dirty_bit: Add base FEAT_HACDBS cleaning routine
  kvm: Add arch-generic interface for hw-accelerated dirty-bitmap
    cleaning
  KVM: arm64: Add hardware-accelerated dirty-bitmap cleaning routine
  KVM: arm64: Dirty-bitmap: avoid splitting previously split blocks
  kvm/dirty_ring: Introduce get_memslot and move helpers to header
  kvm/dirty_ring: Add arch-generic interface for hw-accelerated
    dirty-ring cleaning
  KVM: arm64: Add hardware-accelerated dirty-ring cleaning routine
  KVM: arm64: Enable KVM_HW_DIRTY_BIT

 arch/arm64/include/asm/cpufeature.h    |  10 +
 arch/arm64/include/asm/kvm_dirty_bit.h |  49 +++
 arch/arm64/include/asm/kvm_pgtable.h   |   3 +
 include/linux/kvm_dirty_bit.h          |  34 ++
 include/linux/kvm_dirty_ring.h         |  12 +
 include/linux/kvm_host.h               |   3 +
 arch/arm64/kernel/cpufeature.c         |  20 ++
 arch/arm64/kvm/dirty_bit.c             | 438 +++++++++++++++++++++++++
 arch/arm64/kvm/hyp/pgtable.c           |  15 +-
 arch/arm64/kvm/mmu.c                   |  12 +-
 virt/kvm/dirty_ring.c                  |  35 +-
 virt/kvm/kvm_main.c                    |  13 +-
 arch/arm64/kvm/Kconfig                 |   1 +
 arch/arm64/kvm/Makefile                |   2 +-
 arch/arm64/tools/cpucaps               |   2 +
 arch/arm64/tools/sysreg                |  30 ++
 virt/kvm/Kconfig                       |   3 +
 17 files changed, 660 insertions(+), 22 deletions(-)
 create mode 100644 arch/arm64/include/asm/kvm_dirty_bit.h
 create mode 100644 include/linux/kvm_dirty_bit.h
 create mode 100644 arch/arm64/kvm/dirty_bit.c


base-commit: f5098b6bae761e346ebcd9da7f95622c04733cff
-- 
2.55.0


