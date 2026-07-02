Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8B4AC43327
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 14:29:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cZbpGXjhuTMfortISFFf2SDAQzN/nd45frIvH0s/wjA=; b=RVvD38sueipaaOWqgsYZJ+rkmN
	MqdZrfC6HHcukGruYZDDBaWdgYI5GhR3FB+KVY9Sj3GjS97UAr5cR9emC2A2A4PzhBKgLVOyJ9tKP
	BEXyxd0fJ2kaYamsy3E5jRSZeGry/wHO9oyhDFfvtsmO6ekLZ8Tt3lll1Nrr+JiF70yEJqM2flqB+
	4kB7MIcAwu4FbuDN7i9AD3H6wJPTfhprvmbUmX3G6tvAM169ddNaAKmEgFG8T826kcsUIqh1zhajb
	/cKCZrHovyTV/uzLrUyh05+YKc5DnV15iBUdqBLjJ3dKEc/g+jEYCcOsrvewZkWK+8ZNL3GdQ99iS
	cnsGLpoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfIQ9-00000004dAe-22Go;
	Thu, 02 Jul 2026 14:29:41 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfIQ5-00000004d97-2FRf
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jul 2026 14:29:38 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E535C35A0;
	Thu,  2 Jul 2026 07:29:30 -0700 (PDT)
Received: from e140010.cambridge.arm.com (e140010.arm.com [10.2.213.25])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4A9953F673;
	Thu,  2 Jul 2026 07:29:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783002575; bh=bjWD2vILSQXIZllhkioupcthlnL7s1U2P1SakfeewUE=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=n5jPsuAGxaJvyFWYOBivmVwo1hy8kcMU+dIpAnL6KCNpTniMBSYF0O2ektk4QdFs0
	 ymIHc5zH47Txs2+jTW2Gga/4cE2r/o4GzwnotQ+PRyIlyilhJd2IM6nWkFvaFcAQlz
	 1bdNfTYx0c6BENyB5etfbcE99noabmEqimHMgNME=
From: Alexandru Elisei <alexandru.elisei@arm.com>
To: pbonzini@redhat.com,
	kvm@vger.kernel.org,
	seanjc@google.com,
	david.hildenbrand@arm.com,
	maz@kernel.org,
	oupton@kernel.org,
	joey.gouly@arm.com,
	seiden@linux.ibm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	fuad.tabba@linux.dev,
	mark.rutland@arm.com
Subject: [RFC PATCH 1/3] KVM: guest_memfd: Use memslot id to keep track of associated memslots
Date: Thu,  2 Jul 2026 15:29:10 +0100
Message-ID: <20260702142912.6395-2-alexandru.elisei@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260702142912.6395-1-alexandru.elisei@arm.com>
References: <20260702142912.6395-1-alexandru.elisei@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_072937_654612_8BCA02F5 
X-CRM114-Status: GOOD (  26.65  )
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

To enable memslot operations, KVM maintains two arrays of memslots, and an
RCU pointer to the active (in use) array. Changes are made first to the
inactive array, and the RCU pointer is updated to point to the inactive
array, which becomes active.

The guest_memfd file maintains an xarray of pointers to memslots that use
it as the memory provider. After the RCU pointer to the active memslots is
updated and until SRCU is synchronized, readers can observe the old or the
new value for the active array, and therefore the old or the new pointer
for a given memslot.  For memslot creation or deletion that is not an issue
for guest_memfd, as readers will either read the same memslot pointer saved
by the guest_memfd file, or a non-existing memslot.

But when changing the flags for a memslot, readers can read two different
and non-NULL memslot pointers. Since there is no easy way to ensure that
the memslot pointer that the guest_memfd stores is consistent with both
views at the same time, modify how the guest_memfd file keeps track of the
associated memslots: instead of storing the pointer directly, store the
memslot id and address space id (as_id), and use that to reach the memslot
in the active list of memslots.

This only changes how guest_memfd keeps track of memslots, userspace is not
allowed to make changes to a memslot yet.

Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
---
 virt/kvm/guest_memfd.c | 95 +++++++++++++++++++++++++++++++++++-------
 1 file changed, 80 insertions(+), 15 deletions(-)

diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
index db57c5766ab6..43ef8e908aaf 100644
--- a/virt/kvm/guest_memfd.c
+++ b/virt/kvm/guest_memfd.c
@@ -25,6 +25,7 @@ struct gmem_file {
 	struct kvm *kvm;
 	struct xarray bindings;
 	struct list_head entry;
+	bool found_memslot;	/* Used for balancing invalidations when punching a hole */
 };
 
 struct gmem_inode {
@@ -43,6 +44,29 @@ static __always_inline struct gmem_inode *GMEM_I(struct inode *inode)
 #define kvm_gmem_for_each_file(f, inode) \
 	list_for_each_entry(f, &GMEM_I(inode)->gmem_file_list, entry)
 
+static void *memslot_to_xa_value(struct kvm_memory_slot *slot)
+{
+	WARN_ON_ONCE(sizeof(slot->as_id) > 16);
+	WARN_ON_ONCE(sizeof(slot->id) > 16);
+	WARN_ON_ONCE(sizeof(slot->as_id) + sizeof(slot->id) > sizeof(unsigned long));
+
+	return xa_mk_value(((unsigned long)slot->as_id) << 16 | (unsigned long)slot->id);
+}
+
+static struct kvm_memory_slot *xa_value_to_memslot(struct kvm *kvm, const void *entry)
+{
+	unsigned long full_id = xa_to_value(entry);
+	u16 as_id = (full_id >> 16) & U16_MAX;
+	short id = full_id & U16_MAX;
+
+	/*
+	 * Do not ignore KVM_MEMSLOT_INVALID memslots, as we want
+	 * ->error_remove_folio(), when it races with memslot deletion, to have
+	 *  unmapped the memory upon completion.
+	 */
+	return id_to_memslot(__kvm_memslots(kvm, as_id), id);
+}
+
 /**
  * folio_file_pfn - like folio_file_page, but return a pfn.
  * @folio: The folio which contains this index.
@@ -157,7 +181,7 @@ static enum kvm_gfn_range_filter kvm_gmem_get_invalidate_filter(struct inode *in
 	return KVM_FILTER_PRIVATE;
 }
 
-static void __kvm_gmem_invalidate_start(struct gmem_file *f, pgoff_t start,
+static bool __kvm_gmem_invalidate_start(struct gmem_file *f, pgoff_t start,
 					pgoff_t end,
 					enum kvm_gfn_range_filter attr_filter)
 {
@@ -165,9 +189,15 @@ static void __kvm_gmem_invalidate_start(struct gmem_file *f, pgoff_t start,
 	struct kvm_memory_slot *slot;
 	struct kvm *kvm = f->kvm;
 	unsigned long index;
+	void *entry;
+
+	xa_for_each_range(&f->bindings, index, entry, start, end - 1) {
+		pgoff_t pgoff;
 
-	xa_for_each_range(&f->bindings, index, slot, start, end - 1) {
-		pgoff_t pgoff = slot->gmem.pgoff;
+		slot = xa_value_to_memslot(kvm, entry);
+		if (!slot)
+			continue;
+		pgoff = slot->gmem.pgoff;
 
 		struct kvm_gfn_range gfn_range = {
 			.start = slot->base_gfn + max(pgoff, start) - pgoff,
@@ -192,6 +222,8 @@ static void __kvm_gmem_invalidate_start(struct gmem_file *f, pgoff_t start,
 
 	if (found_memslot)
 		KVM_MMU_UNLOCK(kvm);
+
+	return found_memslot;
 }
 
 static void kvm_gmem_invalidate_start(struct inode *inode, pgoff_t start,
@@ -199,11 +231,22 @@ static void kvm_gmem_invalidate_start(struct inode *inode, pgoff_t start,
 {
 	enum kvm_gfn_range_filter attr_filter;
 	struct gmem_file *f;
+	struct kvm *kvm;
+	int idx;
 
 	attr_filter = kvm_gmem_get_invalidate_filter(inode);
 
-	kvm_gmem_for_each_file(f, inode)
-		__kvm_gmem_invalidate_start(f, start, end, attr_filter);
+	kvm_gmem_for_each_file(f, inode) {
+		kvm = f->kvm;
+		idx = srcu_read_lock(&kvm->srcu);
+		/*
+		 * This is safe to do because calls to
+		 * kvm_gmem_invalidate_start() are serialized by
+		 * filemap_invalidate_lock().
+		 */
+		f->found_memslot = __kvm_gmem_invalidate_start(f, start, end, attr_filter);
+		srcu_read_unlock(&kvm->srcu, idx);
+	}
 }
 
 static void __kvm_gmem_invalidate_end(struct gmem_file *f, pgoff_t start,
@@ -223,8 +266,11 @@ static void kvm_gmem_invalidate_end(struct inode *inode, pgoff_t start,
 {
 	struct gmem_file *f;
 
-	kvm_gmem_for_each_file(f, inode)
+	kvm_gmem_for_each_file(f, inode) {
+		if (!f->found_memslot)
+			continue;
 		__kvm_gmem_invalidate_end(f, start, end);
+	}
 }
 
 static long kvm_gmem_punch_hole(struct inode *inode, loff_t offset, loff_t len)
@@ -326,6 +372,7 @@ static int kvm_gmem_release(struct inode *inode, struct file *file)
 	struct kvm_memory_slot *slot;
 	struct kvm *kvm = f->kvm;
 	unsigned long index;
+	void *entry;
 
 	/*
 	 * Prevent concurrent attempts to *unbind* a memslot.  This is the last
@@ -344,17 +391,18 @@ static int kvm_gmem_release(struct inode *inode, struct file *file)
 
 	filemap_invalidate_lock(inode->i_mapping);
 
-	xa_for_each(&f->bindings, index, slot)
+	xa_for_each(&f->bindings, index, entry) {
+		slot = xa_value_to_memslot(kvm, entry);
 		WRITE_ONCE(slot->gmem.file, NULL);
+	}
 
 	/*
 	 * All in-flight operations are gone and new bindings can be created.
 	 * Zap all SPTEs pointed at by this file.  Do not free the backing
 	 * memory, as its lifetime is associated with the inode, not the file.
 	 */
-	__kvm_gmem_invalidate_start(f, 0, -1ul,
-				    kvm_gmem_get_invalidate_filter(inode));
-	__kvm_gmem_invalidate_end(f, 0, -1ul);
+	if (__kvm_gmem_invalidate_start(f, 0, -1ul, kvm_gmem_get_invalidate_filter(inode)))
+		__kvm_gmem_invalidate_end(f, 0, -1ul);
 
 	list_del(&f->entry);
 
@@ -498,14 +546,20 @@ static int kvm_gmem_migrate_folio(struct address_space *mapping,
 
 static int kvm_gmem_error_folio(struct address_space *mapping, struct folio *folio)
 {
+	enum kvm_gfn_range_filter attr_filter;
+	struct inode *inode = mapping->host;
+	struct gmem_file *f;
 	pgoff_t start, end;
+	bool found_memslot;
+	struct kvm *kvm;
+	int idx;
 
 	filemap_invalidate_lock_shared(mapping);
 
 	start = folio->index;
 	end = start + folio_nr_pages(folio);
 
-	kvm_gmem_invalidate_start(mapping->host, start, end);
+	attr_filter = kvm_gmem_get_invalidate_filter(inode);
 
 	/*
 	 * Do not truncate the range, what action is taken in response to the
@@ -515,8 +569,19 @@ static int kvm_gmem_error_folio(struct address_space *mapping, struct folio *fol
 	 * at which point KVM can either terminate the VM or propagate the
 	 * error to userspace.
 	 */
+	kvm_gmem_for_each_file(f, inode) {
+		kvm = f->kvm;
+
+		idx = srcu_read_lock(&kvm->srcu);
+		found_memslot = __kvm_gmem_invalidate_start(f, start, end, attr_filter);
+		srcu_read_unlock(&kvm->srcu, idx);
 
-	kvm_gmem_invalidate_end(mapping->host, start, end);
+		if (found_memslot) {
+			KVM_MMU_LOCK(kvm);
+			kvm_mmu_invalidate_end(kvm);
+			KVM_MMU_UNLOCK(kvm);
+		}
+	}
 
 	filemap_invalidate_unlock_shared(mapping);
 
@@ -691,7 +756,7 @@ int kvm_gmem_bind(struct kvm *kvm, struct kvm_memory_slot *slot,
 	if (kvm_gmem_supports_mmap(inode))
 		slot->flags |= KVM_MEMSLOT_GMEM_ONLY;
 
-	xa_store_range(&f->bindings, start, end - 1, slot, GFP_KERNEL);
+	xa_store_range(&f->bindings, start, end - 1, memslot_to_xa_value(slot), GFP_KERNEL);
 	filemap_invalidate_unlock(inode->i_mapping);
 
 	/*
@@ -765,8 +830,8 @@ static struct folio *__kvm_gmem_get_pfn(struct file *file,
 		return ERR_PTR(-EFAULT);
 	}
 
-	if (xa_load(&f->bindings, index) != slot) {
-		WARN_ON_ONCE(xa_load(&f->bindings, index));
+	if (xa_load(&f->bindings, index) != memslot_to_xa_value(slot)) {
+		WARN_ON_ONCE(xa_to_value(xa_load(&f->bindings, index)));
 		return ERR_PTR(-EIO);
 	}
 
-- 
2.43.0


