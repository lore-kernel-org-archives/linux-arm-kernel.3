Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91A90C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Jun 2026 11:19:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0j4K0TpfdZKBRb8JjWZ7NPmF2L0ooAV7k1LgIBKVfAc=; b=WcLbGdhKCFQX8O6+mknsxsRhnH
	+6hk09rAvS+we3Mw1C7jYVcSBzq7K+qauJnu5wGfb3Ot3k6zZ9JDDyt2YRMcrua903tvhg5r3sNO4
	ez7LHT506oH0UCPixPUC1uKUP8wPygVSBPn5+K0C00gf1TgK9wA5C5DuClZL9DoVosc1DEtFVwBaX
	SBg5kqkc9sDNVmvQD2tiGc7S0hSDIiHFDOojHJ0w+B20KZkkXKz1+dKwX0owXy+lCAUKi4nNa8yWX
	71rYrMP0BK8RzVygRuYWGc9s8/bbzOcXAc6IWFPhvwJBABYybOzEgMBrbj+Z6Vt13hNcTCcyAxGDO
	KQlvVLaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weA1Z-0000000EQE3-3miE;
	Mon, 29 Jun 2026 11:19:37 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weA1O-0000000EQ3J-0O5t
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Jun 2026 11:19:27 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B77C832AF;
	Mon, 29 Jun 2026 04:19:20 -0700 (PDT)
Received: from LeoBrasDK.cambridge.arm.com (LeoBrasDK.cambridge.arm.com [10.2.212.21])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 038203F905;
	Mon, 29 Jun 2026 04:19:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1782731965; bh=0BT6xkKkyRpPO9LoAIWT5gYB0FU0QBBavMO9aKHShH8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BJ0rjjU785IpHXwgPXR4T2yWRIhhwNBQHIAfI4imFJybdaxDkCNTuCFVQ0djG3yUx
	 0GEdFs/QgJO002KWAgtDQ5CedoTl/swwp+Sfni2QaYmINAJ4S7gRQXUlWV+yt7j6rw
	 qvVZssig7eQzQbhFDCPSPBR7RAN5hgSo8IPpjcZE=
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
Subject: [PATCH v2 12/13] KVM: arm64: Add hardware-accelerated dirty-ring cleaning routine
Date: Mon, 29 Jun 2026 12:18:00 +0100
Message-ID: <20260629111820.1873540-13-leo.bras@arm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260629111820.1873540-1-leo.bras@arm.com>
References: <20260629111820.1873540-1-leo.bras@arm.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4605; i=leo.bras@arm.com; h=from:subject; bh=0BT6xkKkyRpPO9LoAIWT5gYB0FU0QBBavMO9aKHShH8=; b=owGbwMvMwCX2pizjszvTwvWMp9WSGLKcQhJD99/qfKrh3jRP53r7b947qV8uJSznPJL7fAbTT xff2vuHOkpZGMS4GGTFFFlkH81fxfN9SsaRKz8WwMxhZQIZwsDFKQAT+SLMyPDuWt/8Hdtmztnd OP2/uHI3s7m+sfoe3X2vmtW+cP6NjbFjZLg5ddItp9yzIa1Wb8pXBcybtU1lyoXrMt2FP25KfPA WOM0OAA==
X-Developer-Key: i=leo.bras@arm.com; a=openpgp; fpr=36E6C95AE0F111CC5B6F4D2E688C33F8A0C5B0C5
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_041926_221197_A0983540 
X-CRM114-Status: GOOD (  17.90  )
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

Implement arm64 version of kvm_arch_dirty_ring_clear() making use of
FEAT_HACDBS.

It works by transversing the dirty-ring and converting its entries into
HDBSS entries based on the slot offset.

The resulting HDBSS array is then fed to the HACDBS mechanism that walks
the pagetable marking writable-dirty pages as writable-clean.

Only successfully cleaned entries are set as invalid on the dirty-ring, so
in case of error, falling back to generic software cleaning will take care
of any remaining entry in the dirty-ring.

Signed-off-by: Leonardo Bras <leo.bras@arm.com>
---
 arch/arm64/include/asm/kvm_dirty_bit.h | 13 +++++
 arch/arm64/kvm/dirty_bit.c             | 66 ++++++++++++++++++++++++++
 2 files changed, 79 insertions(+)

diff --git a/arch/arm64/include/asm/kvm_dirty_bit.h b/arch/arm64/include/asm/kvm_dirty_bit.h
index 3d749f979c67..d76c109937d8 100644
--- a/arch/arm64/include/asm/kvm_dirty_bit.h
+++ b/arch/arm64/include/asm/kvm_dirty_bit.h
@@ -26,29 +26,42 @@ DECLARE_PER_CPU(struct hacdbs, hacdbs_pcp);
 void __init kvm_hacdbs_init(void);
 void kvm_hacdbs_cpu_up(void);
 void kvm_hacdbs_cpu_down(void);
 
 int __kvm_arch_dirty_log_clear(struct kvm *kvm,
 			       struct kvm_memory_slot *memslot,
 			       struct kvm_clear_dirty_log *log,
 			       unsigned long *bitmap,
 			       bool *flush);
 
+int __kvm_arch_dirty_ring_clear(struct kvm *kvm, struct kvm_dirty_ring *ring,
+				int *nr_entries_reset);
+
 static inline bool kvm_arch_dirty_clear_enabled(struct kvm *kvm)
 {
 	return this_cpu_read(hacdbs_pcp.status) == HACDBS_IDLE &&
 	       (kvm->arch.mmu.pgt->flags & KVM_PGTABLE_S2_DBM);
 }
 
 static inline int kvm_arch_dirty_log_clear(struct kvm *kvm,
 					   struct kvm_memory_slot *memslot,
 					   struct kvm_clear_dirty_log *log,
 					   unsigned long *bitmap,
 					   bool *flush)
 {
 	if (!kvm_arch_dirty_clear_enabled(kvm))
 		return -EPERM;
 
 	return __kvm_arch_dirty_log_clear(kvm, memslot, log, bitmap, flush);
 }
 
+static inline int kvm_arch_dirty_ring_clear(struct kvm *kvm,
+					    struct kvm_dirty_ring *ring,
+					    int *nr_entries_reset)
+{
+	if (!kvm_arch_dirty_clear_enabled(kvm))
+		return -EPERM;
+
+	return __kvm_arch_dirty_ring_clear(kvm, ring, nr_entries_reset);
+}
+
 #endif /* __ARM64_KVM_DIRTY_BIT_H__ */
diff --git a/arch/arm64/kvm/dirty_bit.c b/arch/arm64/kvm/dirty_bit.c
index 6c928677ce12..19289ea73d96 100644
--- a/arch/arm64/kvm/dirty_bit.c
+++ b/arch/arm64/kvm/dirty_bit.c
@@ -249,20 +249,86 @@ int __kvm_arch_dirty_log_clear(struct kvm *kvm,
 
 		ret = -EAGAIN;
 	}
 
 	write_unlock(&kvm->mmu_lock);
 	kfree(hw_entries);
 
 	return ret;
 }
 
+int __kvm_arch_dirty_ring_clear(struct kvm *kvm, struct kvm_dirty_ring *ring,
+				int *nr_entries_reset)
+{
+	u64 *hw_entries;
+	u64 slot_offset = 0;
+	u64 ttwl;
+	int i, ret;
+	u32 slot = -1;
+
+	if (signal_pending(current))
+		return -EINTR;
+
+	ttwl = HDBSS_ENTRY_TTWL(KVM_PGTABLE_LAST_LEVEL);
+
+	hw_entries = kmalloc(max(ring->size * sizeof(u64), PAGE_SIZE), GFP_KERNEL);
+	if (!hw_entries)
+		return -ENOMEM;
+
+	for (i = 0; i < ring->size; i++) {
+		struct kvm_dirty_gfn *entry;
+		gfn_t gfn;
+
+		entry = &ring->dirty_gfns[(ring->reset_index + i) &
+					  (ring->size - 1)];
+
+		if (!kvm_dirty_gfn_harvested(entry))
+			break;
+
+		if (entry->slot != slot) {
+			struct kvm_memory_slot *memslot;
+
+			memslot = kvm_dirty_ring_get_memslot(kvm, entry->slot);
+			slot = entry->slot;
+			slot_offset = memslot->base_gfn;
+		}
+
+		gfn = slot_offset + entry->offset;
+
+		hw_entries[i] = (gfn_to_gpa(gfn) & HDBSS_ENTRY_IPA) |
+				ttwl | HDBSS_ENTRY_VALID;
+	}
+
+	ret = dirty_bit_clear(kvm, hw_entries, i);
+
+	/* Set as invalid all successfully cleaned entries */
+	for (int j = 0; j < ret; j++) {
+		struct kvm_dirty_gfn *entry;
+
+		entry = &ring->dirty_gfns[(ring->reset_index + j) &
+					  (ring->size - 1)];
+
+		kvm_dirty_gfn_set_invalid(entry);
+	}
+
+	/* In case of error, try software cleaning from the faulting entry */
+	ring->reset_index += ret;
+	*nr_entries_reset += ret;
+
+	kfree(hw_entries);
+
+	if (ret < i)
+		return -EFAULT;
+
+	return ret;
+}
+
 static irqreturn_t hacdbsirq_handler(int irq, void *pcpu)
 {
 	u64 cons = read_sysreg_s(SYS_HACDBSCONS_EL2);
 	unsigned long err = FIELD_GET(HACDBSCONS_EL2_ERR_REASON, cons);
 
 	switch (err) {
 	case HACDBSCONS_EL2_ERR_REASON_NOF:
 		this_cpu_write(hacdbs_pcp.status, HACDBS_IDLE);
 		break;
 	case HACDBSCONS_EL2_ERR_REASON_IPAHACF:
-- 
2.54.0


