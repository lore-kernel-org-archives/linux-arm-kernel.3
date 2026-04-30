Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78AEAFF8875
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Apr 2026 11:15:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=P3yeMguUmrYpqVPuw8xTS5zInPUfukYaRjdwHAwI5E8=; b=yRXSn+SeyTYKW0G4qVom+hHMJw
	DS/oZJ8SxvwGQ8bSAyC5AcR5WwDLt4pR8qtIqv8AwQZa4eS1iFxhe6vz7JllPRiifNsQdQyvJkj/r
	HN+UmVkWuKQwbJ9/nft7NVZTRa+bTOaH+byKXalfqLP8bm5OvA9wiCRlfI2YdScMrubHXDz5eglo6
	VT9nQU1oEvmMcOeQGOf7Gn65xqLWuX58ujRSXuI7r4LmtCTCQt9v5dE8bHpCSj34Daj2lo/MIVFTK
	vJ2gZ1dKSqVE/y2V3Oi8V6/vGl9r+RZc41LYHt8Abu7HuqkwxEL0lHlf9bf3mlcrt54gAL8faM4tn
	yNPNKC7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIPMb-00000005L5K-1A1g;
	Thu, 30 Apr 2026 11:15:25 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIPMY-00000005L3I-3zyi
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Apr 2026 11:15:24 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 795201AED;
	Thu, 30 Apr 2026 04:15:13 -0700 (PDT)
Received: from devkitleo.cambridge.arm.com (devkitleo.cambridge.arm.com [10.1.196.90])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7F5BD3F763;
	Thu, 30 Apr 2026 04:15:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1777547718; bh=DS9iix7VCwpek3rRia7jXvITJ4YRw/Mrhu3VT4B73bI=;
	h=From:To:Cc:Subject:Date:From;
	b=vB5CZ1ckBlKPz0ugF95Z5KetcQxvkNWEO3iWLtN9GmWKSWO4DRhVa5zfcdyPQgS12
	 Y7LzCja3BJbyd80kS9M3DerCNybXnL2X9wvg8eY1JxwRvauCkRwLA2EylLZdQX2cEb
	 BpCjERyV/NhTPnrSxRDzP9DI2SYTHh8igCZcbvio=
From: Leonardo Bras <leo.bras@arm.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Leonardo Bras <leo.bras@arm.com>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>,
	Saket Dumbre <saket.dumbre@intel.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Chengwen Feng <fengchengwen@huawei.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Kees Cook <kees@kernel.org>,
	=?UTF-8?q?Miko=C5=82aj=20Lenczewski?= <miko.lenczewski@arm.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Yang Shi <yang@os.amperecomputing.com>,
	Thomas Huth <thuth@redhat.com>,
	mrigendrachaubey <mrigendra.chaubey@gmail.com>,
	Yeoreum Yun <yeoreum.yun@arm.com>,
	Mark Brown <broonie@kernel.org>,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	James Clark <james.clark@linaro.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Fuad Tabba <tabba@google.com>,
	Raghavendra Rao Ananta <rananta@google.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Vincent Donnefort <vdonnefort@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Sascha Bischoff <Sascha.Bischoff@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Tian Zheng <zhengtian10@huawei.com>,
	Wei-Lin Chang <weilin.chang@arm.com>
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-acpi@vger.kernel.org,
	acpica-devel@lists.linux.dev,
	kvm@vger.kernel.org
Subject: [PATCH v1 00/12] KVM Dirty-bit cleaning accelerator (HACDBS)
Date: Thu, 30 Apr 2026 12:14:04 +0100
Message-ID: <20260430111424.3479613-2-leo.bras@arm.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260430_041523_167221_111139ED 
X-CRM114-Status: GOOD (  21.43  )
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

This patchset intends to create an arm64-specific dirty-bit cleaning
accelerator based on HACDBS. To do so, it's needed to add a few
snippets in arch-generic kvm code, and to do so properly, it makes
them compile-out if the arch does not implement them.

Patch 1 & 2 are here just to make this testable, as this patchset
depends on bits from HDBSS that are not upstream yet. 

Patch 1 should be included in the HDBSS patchset, and patch 2
is a bunch of bits that I collected across other patches so this can
work. So few free to ignore them.

To be able to properly use HACDBS, it requires a PPI IRQ that triggers
either on error, or when processing is complete. It's called
HACDBSIRQ, and there is currently no upstream way of announcing it on
ACPI tables, so it uses the suggested table/index in [1].

It is able to accelerate the cleaning on both dirty-bitmap and
dirty-ring tracking mechanisms on KVM, and that require different
functions to be made accessible outside KVM code.

On top of finding issues, there are a few questions I would like help with:
a - Is the distribution between patches ok? should I merge or split
    any of them?
b - checkpatch.pl keeps bothering me to add an entry in MAINTAINERS file,
    and I like the idea of maintaining this. Is there any rule or
    common sense on this? Should I add this entry, or should I leave it
    in the arch/arm64/kvm/ general rule?
c - There are some trace_prink() I have left in the code, as they could
    be helpful to check when HACDBS is not performing as well as it
    should. Should I introduce a tracepoint instead? or just ignore it?
    (it's triggered on HACDBS error, but as it falls back to software in
    that case, it should not impact correctness, only performance).
d - In __kvm_arch_dirty_log_clear() there is no way to predict how long
    should be the buffer, so I used 1x PAGE_SIZE, and when it gets full
    it's cleaned and reused. Should I let users configure that over a
    parameter, or is it overthinking?

Kernel v7.0.0 + this patchset builds properly, passing both kvm selftests
for dirty-bit tracking[2], on HW HACDBS enabled or disabled.

Please let me know of any question :)

Thanks for reviewing!
Leo


[1]: https://github.com/tianocore/edk2/issues/12409
[2]: dirty_log_test && dirty_log_perf_test

Leonardo Bras (12):
  KVM: arm64: Enable eager hugepage splitting if HDBSS is available
  KVM: arm64: HDBSS bits
  arm64/cpufeature: Add system-wide FEAT_HACDBS detection
  arm64/sysreg: Add HACDBS consumer and base registers
  KVM: arm64: Detect (via ACPI) and initialize HACDBSIRQ
  KVM: arm64: dirty_bit: Add base FEAT_HACDBS cleaning routine
  kvm: Add arch-generic interface for hw-accelerated dirty-bitmap
    cleaning
  KVM: arm64: Add hardware-accelerated dirty-bitmap cleaning routine
  kvm/dirty_ring: Introduce get_memslot and move helpers to header
  kvm/dirty_ring: Add arch-generic interface for hw-accelerated
    dirty-ring cleaning
  KVM: arm64: Add hardware-accelerated dirty-ring cleaning routine
  KVM: arm64: Enable KVM_HW_DIRTY_BIT

 MAINTAINERS                            |   7 +
 arch/arm64/include/asm/acpi.h          |   3 +
 arch/arm64/include/asm/cpufeature.h    |  10 +
 arch/arm64/include/asm/kvm_dirty_bit.h |  67 ++++
 arch/arm64/include/asm/kvm_pgtable.h   |   3 +
 include/acpi/actbl2.h                  |   1 +
 include/linux/kvm_dirty_bit.h          |  34 ++
 include/linux/kvm_dirty_ring.h         |  12 +
 include/linux/kvm_host.h               |   3 +
 arch/arm64/kernel/cpufeature.c         |  20 ++
 arch/arm64/kvm/arm.c                   |   5 +
 arch/arm64/kvm/dirty_bit.c             | 418 +++++++++++++++++++++++++
 arch/arm64/kvm/hyp/pgtable.c           |  15 +-
 arch/arm64/kvm/mmu.c                   |  12 +-
 virt/kvm/dirty_ring.c                  |  34 +-
 virt/kvm/kvm_main.c                    |  13 +-
 arch/arm64/kvm/Kconfig                 |   1 +
 arch/arm64/kvm/Makefile                |   2 +-
 arch/arm64/tools/cpucaps               |   2 +
 arch/arm64/tools/sysreg                |  30 ++
 virt/kvm/Kconfig                       |   3 +
 21 files changed, 673 insertions(+), 22 deletions(-)
 create mode 100644 arch/arm64/include/asm/kvm_dirty_bit.h
 create mode 100644 include/linux/kvm_dirty_bit.h
 create mode 100644 arch/arm64/kvm/dirty_bit.c

-- 
2.54.0


