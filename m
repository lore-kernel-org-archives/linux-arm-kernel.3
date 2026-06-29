Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67BDAC43602
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Jun 2026 11:19:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L0ZV5hseQGCgrkC0y4t7H9GiEeC1qClRf6gd2i6ZaHA=; b=Lz4FYRR19NT7AgS3Le8C4vCcGD
	r+he8ID/F0VhaSfBiM8KEKV7ZRaKtNg1XewzoPZYhOesvUR8xItFUXVchjmcCS/Elxjr+orkAl5ee
	8wGP9DeDYj/3KdrFRJp5SUhUZ5AQj/T/8uFE68eucOxPEb45smXNMx4GTKepq1yy6BOU6l4fCaJxq
	l7LuhH5JxDrEzye1lBc5fJ9ZvnNXmv3VKEd+wxyBtOJYeS2LDF/9829Zsitv955ENW4JCuJHYWgwt
	gx/b2meJFgNEEQPT4HdLlL2bjnfW0p9hzen/sGASqASm+5Lplpl7+edvrP2ani275peN8m4oAm7Rr
	95F0VoYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weA1P-0000000EQ53-2dsj;
	Mon, 29 Jun 2026 11:19:27 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weA1E-0000000EPwc-3bcW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Jun 2026 11:19:18 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BE09D32AC;
	Mon, 29 Jun 2026 04:19:11 -0700 (PDT)
Received: from LeoBrasDK.cambridge.arm.com (LeoBrasDK.cambridge.arm.com [10.2.212.21])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0B31B3F905;
	Mon, 29 Jun 2026 04:19:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1782731956; bh=apX31aX3iTxnqVqPT2O4LiYfeU4l9w4m9edAsv7k7qM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=U8Lbf3sX5LP25onz2hzUf4wCNX4aF7nUps2R4V0K6JQ/mBc+U4361+4Ko8IbgN68n
	 5OH+Y5IIRymaIoMgl5USccO5KsErYf0OoZw83Fn2poTgOserRYjqZ/EuL8m/AQ8ZeP
	 GKYCWt2FUNislPOs12WMQapCDmMvMDch/tIz6cdg=
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
Subject: [PATCH v2 10/13] kvm/dirty_ring: Introduce get_memslot and move helpers to header
Date: Mon, 29 Jun 2026 12:17:58 +0100
Message-ID: <20260629111820.1873540-11-leo.bras@arm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260629111820.1873540-1-leo.bras@arm.com>
References: <20260629111820.1873540-1-leo.bras@arm.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4993; i=leo.bras@arm.com; h=from:subject; bh=apX31aX3iTxnqVqPT2O4LiYfeU4l9w4m9edAsv7k7qM=; b=owGbwMvMwCX2pizjszvTwvWMp9WSGLKcQhLd+x7eCLHyv9idbzB5h9LNsvl1nsuy5r13lmbgE YrabqbdUcrCIMbFICumyCL7aP4qnu9TMo5c+bEAZg4rE8gQBi5OAZiI7ERGhp6DqoLLmvN9FdtV rC1d+Cbf3PspaitPe0und9+OV3x3lzD8L7k9SyZKcsPbF7bPGa7/aeZbd9jmYtiBVy8rWAJfZsU 8YQcA
X-Developer-Key: i=leo.bras@arm.com; a=openpgp; fpr=36E6C95AE0F111CC5B6F4D2E688C33F8A0C5B0C5
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_041916_974386_39A457FC 
X-CRM114-Status: GOOD (  16.97  )
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
index 572b854edf74..42de1a511037 100644
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
+		return 0;
 
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
2.54.0


