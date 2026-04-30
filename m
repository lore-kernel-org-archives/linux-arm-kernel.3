Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A795CD13DE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Apr 2026 11:16:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1TfU/RabNm1a28424/7ZHtEu2aEIGTPFEzCsUDzP9/4=; b=hgu9mvB+8HHrglw5ItuUiQzgMI
	rZuzOEPTuTvt6BQLt23J8iT2HPMhZakQbeAgZgIMelvf9MZ+0SaNcwfEA8ou3wHrODyqlWUKE4uPe
	L6V3oknFf6ldU/ahrwrYhD8/6Gabmy352LCAOGEYtZe9cqWx9NvMt7OcwJYT4bYSJoSbnD1XCScZp
	+f5x91SFrHZc6bkGYu1SRBvvf5lKBbpG52x4iyt2MT78j85OGGN6WDOm1HsCnOUl5WXATq149IjVg
	sSKA220Gflc1d13omb64V9uvBKslk2BvTt43Ugasazh3oemX063yMcrz4OccLqCPaXBsXHamJOong
	lavmDpBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIPNQ-00000005Las-3jWy;
	Thu, 30 Apr 2026 11:16:16 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIPNG-00000005LU0-0kN6
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 30 Apr 2026 11:16:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=1TfU/RabNm1a28424/7ZHtEu2aEIGTPFEzCsUDzP9/4=; b=PH3fjfq9//dTuU30ojdId8paCd
	kSOJM1Qx9NO8hDfLOmUaCzJPagGYE2exebEn1ddGOEP+cNnysDzemLsK3XFLzQqmVnwlSPizyVu7V
	312smAwLklMT/j98iaDVMkhDKm3iXGv8su9FSYLKl1Eanw7FnYPjX37gBeAnbKpmDfYrISMTzYY2x
	XkyCBCzgP3BzYeUIM0LKMoKiT0WjiDqJSMb7ecw4J6gXnwk1VU8iNpi1XJ9OkfLJnY4VhjUREGoro
	LT12D9BxXIbmpHHQozQ8IN+zVaSwWQQr1FyMGFsBQdgOvYicMOXmiSphL8ARYCV680pWrX/iq/TJP
	uBmuHhEg==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIPNC-00000007Dos-3NNK
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Apr 2026 11:16:04 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E5BE33569;
	Thu, 30 Apr 2026 04:15:55 -0700 (PDT)
Received: from devkitleo.cambridge.arm.com (devkitleo.cambridge.arm.com [10.1.196.90])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F0F6D3F763;
	Thu, 30 Apr 2026 04:15:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1777547761; bh=Zmni17ql/oXEfVlvG4MsyK+AbWgGCuAnsUIgkHp6qlI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=K5yulkkv6ef2FoG2tHcMYukCH1/RbPACOnFFVdnpwDBETk19/K8H8xLDGqjkyTF2j
	 g8nLkN62ZqybnOHXVqrbrNmC5h91CoSZ6GnSiFoS37HlTAujvYD6bu6R9HVMzGXeZE
	 oIcsvLzH/zsKujlc3ZR9HSynF7dpG7wyQP4Pevw4=
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
Subject: [PATCH v1 09/12] kvm/dirty_ring: Introduce get_memslot and move helpers to header
Date: Thu, 30 Apr 2026 12:14:13 +0100
Message-ID: <20260430111424.3479613-11-leo.bras@arm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260430111424.3479613-2-leo.bras@arm.com>
References: <20260430111424.3479613-2-leo.bras@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260430_121603_483242_F72A924D 
X-CRM114-Status: GOOD (  16.92  )
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
index 02bc6b00d76c..83ac5ac907c1 100644
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
 
 	if (!memslot || (offset + __fls(mask)) >= memslot->npages)
 		return;
 
 	KVM_MMU_LOCK(kvm);
 	kvm_arch_mmu_enable_log_dirty_pt_masked(kvm, memslot, offset, mask);
 	KVM_MMU_UNLOCK(kvm);
 }
 
 int kvm_dirty_ring_alloc(struct kvm *kvm, struct kvm_dirty_ring *ring,
@@ -80,35 +92,25 @@ int kvm_dirty_ring_alloc(struct kvm *kvm, struct kvm_dirty_ring *ring,
 
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


