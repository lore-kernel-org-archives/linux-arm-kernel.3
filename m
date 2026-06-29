Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFF16C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Jun 2026 11:18:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=IL5pZ6DyBsZfDuN8IFhUMG8btkrqqV3rrIbzsjC0n5I=; b=qaBO0rCqZwRJZAu7+54g4crkBf
	Mpndw2yojF1voOZEXBusfOUeByozdJnJy42S82oP8Tn6sRDZ0fREsiOrONutGc+B+gN7s2NYlVPsb
	B0a9mSURMymXDQumZlZOpSQAn6UPpGCCswJQAQc0qdmOy27cIgNgdWEBJet/gE37BGvIqYS3evtzI
	TxZfCcxD8aF54k/k2jryyxqO+zxnHniqxkXafN0UJtfqNWSXysKsP7iV1WY/+eM953A35yh9VkmIg
	6YxEvI9zpO1kRjatLXoh6r7/xnvdwLzwNkHFSd1Q4GHCf2Z1n7ChtdvZrZ2bPlK4uFe98KjD1I2/9
	aBp4yLbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weA0Z-0000000EPWv-3WF1;
	Mon, 29 Jun 2026 11:18:35 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weA0X-0000000EPWK-3F9o
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Jun 2026 11:18:35 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 09E361655;
	Mon, 29 Jun 2026 04:18:26 -0700 (PDT)
Received: from LeoBrasDK.cambridge.arm.com (LeoBrasDK.cambridge.arm.com [10.2.212.21])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0DB273F905;
	Mon, 29 Jun 2026 04:18:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1782731910; bh=bjTI/f/n56/Fet0evzkJ68kz+ryPn+5y70fPRs2V5wA=;
	h=From:To:Cc:Subject:Date:From;
	b=vcpBNJcTiDlNBeEnJYl9HwTNgevqUpNYYJUku/hZ9+hzbG7dPtCnZ2wDCHh9KoK7v
	 1BypgwHAtmUBqeHsQHb4KvwMQvJc7Nj1GLhfugu/17jMXIefZeB0rUd3WVAkXRiOyy
	 2xCBmvCFbvbjurkFasOoaZgJd5peEg+bpdWIZRCA=
From: Leonardo Bras <leo.bras@arm.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>,
	Saket Dumbre <saket.dumbre@intel.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Chengwen Feng <fengchengwen@huawei.com>,
	Leonardo Bras <leo.bras@arm.com>,
	Kees Cook <kees@kernel.org>,
	=?UTF-8?q?Miko=C5=82aj=20Lenczewski?= <miko.lenczewski@arm.com>,
	James Morse <james.morse@arm.com>,
	Zeng Heng <zengheng4@huawei.com>,
	mrigendrachaubey <mrigendra.chaubey@gmail.com>,
	Thomas Huth <thuth@redhat.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Yeoreum Yun <yeoreum.yun@arm.com>,
	Mark Brown <broonie@kernel.org>,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	James Clark <james.clark@linaro.org>,
	Fuad Tabba <tabba@google.com>,
	Raghavendra Rao Ananta <rananta@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Sascha Bischoff <Sascha.Bischoff@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Tian Zheng <zhengtian10@huawei.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev,
	linux-acpi@vger.kernel.org,
	acpica-devel@lists.linux.dev,
	kvm@vger.kernel.org
Subject: [PATCH v2 00/13] KVM Dirty-bit cleaning hw accelerator (HACDBS)
Date: Mon, 29 Jun 2026 12:17:48 +0100
Message-ID: <20260629111820.1873540-1-leo.bras@arm.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5680; i=leo.bras@arm.com; h=from:subject; bh=Jp5vKmq1QYgozZwl/v/dth/msI72XuhmrAqKkgXOajg=; b=owGbwMvMwCX2pizjszvTwvWMp9WSGLKcQuI5FsypOnXm/syrR2/fmb7t2Mu6fRJNlrtk5vQZF IcyXJ+5vaOUhUGMi0FWTJFF9tH8VTzfp2QcufJjAcwcViaQIQxcnAIwkYomRoYl1fV3CnN/Tl7L tOHa7NxmZ9ubS9gEXK5c0v+w7m82068fjAwnl9bqvFz6bdk57rtZ7NEXduzlPF8i8Zrh5/97Fb7 bTQ4xAgA=
X-Developer-Key: i=leo.bras@arm.com; a=openpgp; fpr=36E6C95AE0F111CC5B6F4D2E688C33F8A0C5B0C5
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_041833_921747_CF73A788 
X-CRM114-Status: GOOD (  19.38  )
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
patchset that will superseed the one in [0], and will enable HDBSS.
See note below on patches 1,2.

My expectation on sharing this earlier is to gather feedback on
implementation and testing methods, to make sure it's sure it's ready
when [0] becomes ready.

===

Create an arch-generic dirty-bit cleaning acceleration interface, which
compiles-out if the arch does not implement it, and creates no new API.
Using that, implement an arm64 accelerator based on HACDBS.

This implementation is able to accelerate the cleaning on both
dirty-bitmap and dirty-ring tracking mechanisms on KVM.

Patch 1 & 2 are here just to make this testable, as this patchset
depends on bits from HDBSS that are not upstream yet.

Patch 2 should be included in the HDBSS patchset, and patch 1
is a bunch of bits that I collected across other patches so this can
work. So few free to ignore them on review, as they should be reviewed
in the HDBSS patchset.

To be able to properly use HACDBS, it requires a PPI IRQ that triggers
either on error, or when processing is complete. It's called
HACDBSIRQ, and there is currently no upstream way of announcing it on
ACPI tables, so this patchset uses the suggested table/index in [1],
which at the moment is not merged.

Kernel v7.2-rc1 + this patchset builds properly, passing both kvm selftests
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
-(a) 82.19% (0.16% stdev) for 1GB memory, and
     82.45% (0.02% stdev) for 3GB memory
-(b) 81.74% (0.19% stdev) for 1GB memory, and
     82.40% (0.38% stdev) for 3GB memory
-(b) 70.90% (0.18% stdev) for 1GB memory, and
     70.92% (0.01% stdev) for 3GB memory

Above numbers already take into account the improvements in S2
hugepage-splitting that is implemented by [4].

Please let me know of any question :)

Thanks for reviewing!
Leo


Changes since v1:
- Improvements on splitting with manual protect, skipping when cleaning
  pages from the same level-2 entry. (new patch)
- Got the correct concept of chunk_size and thus:
  - Corrected it to a reasonable chunk to do page splitting before
    rescheduling, considering new improvements from [4].
  - TTWL is not based in chunk size, so fix it in LAST_LEVEL
- Minor fixes, removing debugging traces
v1 Link: https://lore.kernel.org/all/20260430111424.3479613-2-leo.bras@arm.com/


[0]: https://lore.kernel.org/all/20260225040421.2683931-1-zhengtian10@huawei.com/
[1]: https://github.com/tianocore/edk2/issues/12409
[2]: dirty_log_test && dirty_log_perf_test
[3]: using this patchset to enable dirty-ring on dirty_log_perf_test:
     https://lore.kernel.org/all/20260629105950.1790259-1-leo.bras@arm.com/
[4]: https://lore.kernel.org/all/20260618131447.764085-1-leo.bras@arm.com/

Leonardo Bras (13):
  KVM: arm64: HDBSS bits
  KVM: arm64: Enable eager hugepage splitting if HDBSS is available
  arm64/cpufeature: Add system-wide FEAT_HACDBS detection
  arm64/sysreg: Add HACDBS consumer and base registers
  KVM: arm64: Detect (via ACPI) and initialize HACDBSIRQ
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
 arch/arm64/kvm/dirty_bit.c             | 411 +++++++++++++++++++++++++
 arch/arm64/kvm/hyp/pgtable.c           |  15 +-
 arch/arm64/kvm/mmu.c                   |  12 +-
 virt/kvm/dirty_ring.c                  |  34 +-
 virt/kvm/kvm_main.c                    |  13 +-
 arch/arm64/kvm/Kconfig                 |   1 +
 arch/arm64/kvm/Makefile                |   2 +-
 arch/arm64/tools/cpucaps               |   2 +
 arch/arm64/tools/sysreg                |  30 ++
 virt/kvm/Kconfig                       |   3 +
 20 files changed, 659 insertions(+), 22 deletions(-)
 create mode 100644 arch/arm64/include/asm/kvm_dirty_bit.h
 create mode 100644 include/linux/kvm_dirty_bit.h
 create mode 100644 arch/arm64/kvm/dirty_bit.c


base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
-- 
2.54.0


