Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05EE0C54F52
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 10:47:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1GUhHvNgssZ2AXYt8VqyIutMVu+TKXKtjkFZFs0JjUs=; b=WwUCZrMWDnc5nVTsVOoMnVY87Y
	za7zEsLU+5jkK5oBxEH+RIrx+A7rP9ZBSWyU6yCnQIR0pnGf7LYTYXvX4fj/9D53ZwXjEiRWjTpV+
	Pz/dSecusTFbBjmQBegU5rPz/8bCiNZgGXQA50aB677UnzYT7WFLLCvtO0s7UgGDFiYeNinHicrSA
	CKh2ueHJOl8kLlQmAJ8+p6wQkJ0qgJjgdN5JBF0ynp5vFAE3Edn02HDYS81BVjOzXr5HWJ0K5UDs5
	mqeBENpgj9ls/lmewztYTMvajrpCdX/EYgM0gWWv3aM6hwsmFoo+MC7tnxLxQsR3G8SYA4VS6dNFN
	1xk+oszQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp1oP-00000007aVf-2VC3;
	Wed, 29 Jul 2026 10:46:57 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp1oL-00000007aS8-1y1T
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jul 2026 10:46:54 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C4A6A1688;
	Wed, 29 Jul 2026 03:46:48 -0700 (PDT)
Received: from LeoBrasDK.cambridge.arm.com (LeoBrasDK.cambridge.arm.com [10.2.212.21])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 10C553F66F;
	Wed, 29 Jul 2026 03:46:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785322012; bh=bZDXjHEwJQPT1x7IW48rJE1aQjLeiRavudNPamkB5AY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OLe5I7KYce+mv/wWPqFlQk23F/9n45aMnOH9pomP4sftQrx9zJUscelJ84R6YANVk
	 b5Ay3V41hylJctJC9N/CbYTSir2hxQmmlVi8Aa3yw2T0yoEhrJhDfQnLEs45Sm9n1y
	 WGFyrgDuHkE28ZxEs5arKjBjPaJgzwrWB+MkZdpU=
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
Subject: [PATCH v3 08/11] kvm/dirty_ring: Introduce get_memslot and move helpers to header
Date: Wed, 29 Jul 2026 11:45:43 +0100
Message-ID: <20260729104548.3439958-9-leo.bras@arm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260729104548.3439958-1-leo.bras@arm.com>
References: <20260729104548.3439958-1-leo.bras@arm.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4996; i=leo.bras@arm.com; h=from:subject; bh=bZDXjHEwJQPT1x7IW48rJE1aQjLeiRavudNPamkB5AY=; b=owGbwMvMwCX2pizjszvTwvWMp9WSGLIyb17rki/LVDs1i2vqmuvupaFBvievtL/cnySRevW3f bj645VXOkpZGMS4GGTFFFlkH81fxfN9SsaRKz8WwMxhZQIZwsDFKQATqb/H8N9PLqpmyj91hWn/ CmcYn1zPdHZCf/ydiTfMPL6KMs++5BDN8M/AcK+9u/j8TyEWhg6XfIpmOEneuSMcEBAqMW+f7eW te7gB
X-Developer-Key: i=leo.bras@arm.com; a=openpgp; fpr=36E6C95AE0F111CC5B6F4D2E688C33F8A0C5B0C5
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_034653_583199_432A1586 
X-CRM114-Status: GOOD (  17.32  )
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

Dirty-ring entry struct carries a slot number which is used to return
a struct memslot*. That struct carry important information such as
memory offset of that memory slot, which is used to calculate the guest
physical address of the page which needs to be marked clean.

In order to fetch that memslot information without duplicating code, split
that part of kvm_reset_dirty_gfn() into a new helper
kvm_dirty_ring_get_memslot().

Along with that, make it available on kvm_dirty_ring.h other helpers such
as kvm_dirty_gfn_harvested() and kvm_dirty_gfn_set_invalid() which will be
useful on implementing arch specific dirty-ring cleaning accelerators.

Signed-off-by: Leonardo Bras <leo.bras@arm.com>
---
 include/linux/kvm_dirty_ring.h | 12 ++++++++++++
 virt/kvm/dirty_ring.c          | 30 ++++++++++++++++--------------
 2 files changed, 28 insertions(+), 14 deletions(-)

diff --git a/include/linux/kvm_dirty_ring.h b/include/linux/kvm_dirty_ring.h
index eb10d87adf7d..190d97fce4a4 100644
--- a/include/linux/kvm_dirty_ring.h
+++ b/include/linux/kvm_dirty_ring.h
@@ -77,18 +77,30 @@ bool kvm_use_dirty_bitmap(struct kvm *kvm);
 bool kvm_arch_allow_write_without_running_vcpu(struct kvm *kvm);
 u32 kvm_dirty_ring_get_rsvd_entries(struct kvm *kvm);
 int kvm_dirty_ring_alloc(struct kvm *kvm, struct kvm_dirty_ring *ring,
 			 int index, u32 size);
 int kvm_dirty_ring_reset(struct kvm *kvm, struct kvm_dirty_ring *ring,
 			 int *nr_entries_reset);
 void kvm_dirty_ring_push(struct kvm_vcpu *vcpu, u32 slot, u64 offset);
 
 bool kvm_dirty_ring_check_request(struct kvm_vcpu *vcpu);
 
+static inline bool kvm_dirty_gfn_harvested(struct kvm_dirty_gfn *gfn)
+{
+	return smp_load_acquire(&gfn->flags) & KVM_DIRTY_GFN_F_RESET;
+}
+
+static inline void kvm_dirty_gfn_set_invalid(struct kvm_dirty_gfn *gfn)
+{
+	smp_store_release(&gfn->flags, 0);
+}
+
+struct kvm_memory_slot *kvm_dirty_ring_get_memslot(struct kvm *kvm, u32 slot);
+
 /* for use in vm_operations_struct */
 struct page *kvm_dirty_ring_get_page(struct kvm_dirty_ring *ring, u32 offset);
 
 void kvm_dirty_ring_free(struct kvm_dirty_ring *ring);
 
 #endif /* CONFIG_HAVE_KVM_DIRTY_RING */
 
 #endif	/* KVM_DIRTY_RING_H */
diff --git a/virt/kvm/dirty_ring.c b/virt/kvm/dirty_ring.c
index 572b854edf74..807c45fb1fc7 100644
--- a/virt/kvm/dirty_ring.c
+++ b/virt/kvm/dirty_ring.c
@@ -43,32 +43,44 @@ static u32 kvm_dirty_ring_used(struct kvm_dirty_ring *ring)
 static bool kvm_dirty_ring_soft_full(struct kvm_dirty_ring *ring)
 {
 	return kvm_dirty_ring_used(ring) >= ring->soft_limit;
 }
 
 static bool kvm_dirty_ring_full(struct kvm_dirty_ring *ring)
 {
 	return kvm_dirty_ring_used(ring) >= ring->size;
 }
 
-static void kvm_reset_dirty_gfn(struct kvm *kvm, u32 slot, u64 offset, u64 mask)
+static inline struct kvm_memory_slot *
+__kvm_dirty_ring_get_memslot(struct kvm *kvm, u32 slot)
 {
-	struct kvm_memory_slot *memslot;
 	int as_id, id;
 
 	as_id = slot >> 16;
 	id = (u16)slot;
 
 	if (as_id >= kvm_arch_nr_memslot_as_ids(kvm) || id >= KVM_USER_MEM_SLOTS)
-		return;
+		return NULL;
 
-	memslot = id_to_memslot(__kvm_memslots(kvm, as_id), id);
+	return id_to_memslot(__kvm_memslots(kvm, as_id), id);
+}
+
+struct kvm_memory_slot *kvm_dirty_ring_get_memslot(struct kvm *kvm, u32 slot)
+{
+	return __kvm_dirty_ring_get_memslot(kvm, slot);
+}
+
+static void kvm_reset_dirty_gfn(struct kvm *kvm, u32 slot, u64 offset, u64 mask)
+{
+	struct kvm_memory_slot *memslot;
+
+	memslot = __kvm_dirty_ring_get_memslot(kvm, slot);
 
 	if (!memslot || offset >= memslot->npages ||
 	    offset + __fls(mask) >= memslot->npages)
 		return;
 
 	KVM_MMU_LOCK(kvm);
 	kvm_arch_mmu_enable_log_dirty_pt_masked(kvm, memslot, offset, mask);
 	KVM_MMU_UNLOCK(kvm);
 }
 
@@ -81,35 +93,25 @@ int kvm_dirty_ring_alloc(struct kvm *kvm, struct kvm_dirty_ring *ring,
 
 	ring->size = size / sizeof(struct kvm_dirty_gfn);
 	ring->soft_limit = ring->size - kvm_dirty_ring_get_rsvd_entries(kvm);
 	ring->dirty_index = 0;
 	ring->reset_index = 0;
 	ring->index = index;
 
 	return 0;
 }
 
-static inline void kvm_dirty_gfn_set_invalid(struct kvm_dirty_gfn *gfn)
-{
-	smp_store_release(&gfn->flags, 0);
-}
-
 static inline void kvm_dirty_gfn_set_dirtied(struct kvm_dirty_gfn *gfn)
 {
 	gfn->flags = KVM_DIRTY_GFN_F_DIRTY;
 }
 
-static inline bool kvm_dirty_gfn_harvested(struct kvm_dirty_gfn *gfn)
-{
-	return smp_load_acquire(&gfn->flags) & KVM_DIRTY_GFN_F_RESET;
-}
-
 int kvm_dirty_ring_reset(struct kvm *kvm, struct kvm_dirty_ring *ring,
 			 int *nr_entries_reset)
 {
 	/*
 	 * To minimize mmu_lock contention, batch resets for harvested entries
 	 * whose gfns are in the same slot, and are within N frame numbers of
 	 * each other, where N is the number of bits in an unsigned long.  For
 	 * simplicity, process the current set of entries when the next entry
 	 * can't be included in the batch.
 	 *
-- 
2.55.0


