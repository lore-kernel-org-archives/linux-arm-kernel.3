Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 718FECCD199
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Oct 2025 17:30:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KbValAQi3mVPkQeBnxJpdOpCqapDSSet7GA9qMeIyHY=; b=Q8Rmqjo0d36F8Th0vmDIkhIY4W
	U8wYndTk84ISYTTJv9M+2BtyhJachlUhHz7jRow9uoDA45tUL7Kh7k+MPmQ6SiByABWAEZn+itc6l
	GmfPdBMeMxMDjwkee7Q7d3pmnrKGj2erpPuOmO91ubo2G2ebQH9/izQSuLgmhCW1m9ar2R/+6TFLQ
	AVmku1fn9/61Dvo5UxpbWmOodEgM2K4UcIRy9vldzIgJdwRe0da1XmGrciBi9RGL5AB8sq0oifnlQ
	ZKWFQPwwcVVOZXJUgjpgVM0M55yWxF78C+CiR1h/7Qi6joI8ZGwXrcfG0OjrV2/wd1L3ZwiUzky9B
	sLks6CTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9Rns-00000005ZaY-2lHY;
	Thu, 16 Oct 2025 17:30:16 +0000
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9Rnn-00000005ZYU-0vGV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Oct 2025 17:30:12 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-33ba9047881so1480467a91.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Oct 2025 10:30:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760635810; x=1761240610; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=KbValAQi3mVPkQeBnxJpdOpCqapDSSet7GA9qMeIyHY=;
        b=lYziIZokG1Q1VaQrSTxhbsosdV8xBNI12CUCHbBRiSKjbAWqWhBw0tptxkesmFIZeS
         1P1w5FsgZI58BFY5iLFRxn3esMwOXLsfUwm2FpKA5z1QTl4jq6aPPMrGBdw04EIqoYoc
         hgyguDnMTekCGd7Ww344au5f1yXRziz7k0zbjtNq7VNoWrKssrKJYB55ECsQMeLqWUXz
         7lzxL6C42bMAgZrdf1v8vaifEWhCU/2J1Tkm0DGX+v2ctb28pZdNrydSYo5CqSa7heya
         hLUISNsvr+Pa517LopHgkKAXcJFyqWUmCmmZaqmF1LTMae2TGs2uJUcop93EqvaSoz8i
         dBuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760635810; x=1761240610;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KbValAQi3mVPkQeBnxJpdOpCqapDSSet7GA9qMeIyHY=;
        b=t3nckzvqjf+k9mABSdIXTK0UAPEzm/9pJVrl7F1GjjhLKaKIuLehHFEXPZbXqs8qGX
         HCTJq9hNGU6RBqH2cZqsSEOggNt3YIRjJFzHgkD3oNn1f6NJ3YPpFU8gRNpmgP3Zij1M
         GjbMbMcBxBk0mV19Biq6uzO0fF95/tHpIQVygYHV98PVzQIBVbSeEMaPfbr+mY1+zOmF
         mXg+bukl4ZrTbtZCYHgcakBWlHabdbjQ+wp6XptUDH6PRarL6t//IBXqFUWmjQUCsm+P
         B7yw4XcOHb6yVCj0tsLDcK1ZN/LEScXaTNZLr6G6vDAfmO3ARr8gT8zT+547EbXnpcU2
         frmg==
X-Gm-Message-State: AOJu0YxgxHCIfaLWDM/5gbAC+iKDOCL25ERtuWtL20TwNNseTtXMnbxc
	lqCYjrGyRBlNuw9BeUtqqHSAq9uhv4Z3krTx4Q8yMjvyb0KDQfvjD99TB3uxJYOa6JGiWyPHu1b
	IGH0Nsg==
X-Google-Smtp-Source: AGHT+IF8IBthLJ6j6SkHq4SrSxFmPl9P4miDt7bIY6TTq8tVebOV0t9zTlMTT00ono8S6O8EZ924QZsF6IQ=
X-Received: from pjre3.prod.google.com ([2002:a17:90a:b383:b0:33b:51fe:1a75])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:1dc4:b0:32e:716d:4d2b
 with SMTP id 98e67ed59e1d1-33bc9b77638mr1287133a91.3.1760635810154; Thu, 16
 Oct 2025 10:30:10 -0700 (PDT)
Date: Thu, 16 Oct 2025 10:28:42 -0700
In-Reply-To: <20251016172853.52451-1-seanjc@google.com>
Mime-Version: 1.0
References: <20251016172853.52451-1-seanjc@google.com>
X-Mailer: git-send-email 2.51.0.858.gf9c4a03a3a-goog
Message-ID: <20251016172853.52451-2-seanjc@google.com>
Subject: [PATCH v13 01/12] KVM: guest_memfd: Rename "struct kvm_gmem" to
 "struct gmem_file"
From: Sean Christopherson <seanjc@google.com>
To: Miguel Ojeda <ojeda@kernel.org>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Paolo Bonzini <pbonzini@redhat.com>, 
	Sean Christopherson <seanjc@google.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Ackerley Tng <ackerleytng@google.com>, Shivank Garg <shivankg@amd.com>, 
	David Hildenbrand <david@redhat.com>, Fuad Tabba <tabba@google.com>, Ashish Kalra <ashish.kalra@amd.com>, 
	Vlastimil Babka <vbabka@suse.cz>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_103011_270619_5D46CDC4 
X-CRM114-Status: GOOD (  19.84  )
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
Reply-To: Sean Christopherson <seanjc@google.com>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Rename the "kvm_gmem" structure to "gmem_file" in anticipation of using
dedicated guest_memfd inodes instead of anonyomous inodes, at which point
the "kvm_gmem" nomenclature becomes quite misleading.  In guest_memfd,
inodes are effectively the raw underlying physical storage, and will be
used to track properties of the physical memory, while each gmem file is
effectively a single VM's view of that storage, and is used to track assets
specific to its associated VM, e.g. memslots=>gmem bindings.

Using "kvm_gmem" suggests that the per-VM/per-file structures are _the_
guest_memfd instance, which almost the exact opposite of reality.

Opportunistically rename local variables from "gmem" to "f", again to
avoid confusion once guest_memfd specific inodes come along.

No functional change intended.

Reviewed-by: Ackerley Tng <ackerleytng@google.com>
Tested-by: Ackerley Tng <ackerleytng@google.com>
Reviewed-by: Shivank Garg <shivankg@amd.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 virt/kvm/guest_memfd.c | 98 +++++++++++++++++++++++-------------------
 1 file changed, 53 insertions(+), 45 deletions(-)

diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
index 1e4af29159ea..2989c5fe426f 100644
--- a/virt/kvm/guest_memfd.c
+++ b/virt/kvm/guest_memfd.c
@@ -7,7 +7,16 @@
 
 #include "kvm_mm.h"
 
-struct kvm_gmem {
+/*
+ * A guest_memfd instance can be associated multiple VMs, each with its own
+ * "view" of the underlying physical memory.
+ *
+ * The gmem's inode is effectively the raw underlying physical storage, and is
+ * used to track properties of the physical memory, while each gmem file is
+ * effectively a single VM's view of that storage, and is used to track assets
+ * specific to its associated VM, e.g. memslots=>gmem bindings.
+ */
+struct gmem_file {
 	struct kvm *kvm;
 	struct xarray bindings;
 	struct list_head entry;
@@ -115,16 +124,16 @@ static enum kvm_gfn_range_filter kvm_gmem_get_invalidate_filter(struct inode *in
 	return KVM_FILTER_PRIVATE;
 }
 
-static void __kvm_gmem_invalidate_begin(struct kvm_gmem *gmem, pgoff_t start,
+static void __kvm_gmem_invalidate_begin(struct gmem_file *f, pgoff_t start,
 					pgoff_t end,
 					enum kvm_gfn_range_filter attr_filter)
 {
 	bool flush = false, found_memslot = false;
 	struct kvm_memory_slot *slot;
-	struct kvm *kvm = gmem->kvm;
+	struct kvm *kvm = f->kvm;
 	unsigned long index;
 
-	xa_for_each_range(&gmem->bindings, index, slot, start, end - 1) {
+	xa_for_each_range(&f->bindings, index, slot, start, end - 1) {
 		pgoff_t pgoff = slot->gmem.pgoff;
 
 		struct kvm_gfn_range gfn_range = {
@@ -157,20 +166,20 @@ static void kvm_gmem_invalidate_begin(struct inode *inode, pgoff_t start,
 {
 	struct list_head *gmem_list = &inode->i_mapping->i_private_list;
 	enum kvm_gfn_range_filter attr_filter;
-	struct kvm_gmem *gmem;
+	struct gmem_file *f;
 
 	attr_filter = kvm_gmem_get_invalidate_filter(inode);
 
-	list_for_each_entry(gmem, gmem_list, entry)
-		__kvm_gmem_invalidate_begin(gmem, start, end, attr_filter);
+	list_for_each_entry(f, gmem_list, entry)
+		__kvm_gmem_invalidate_begin(f, start, end, attr_filter);
 }
 
-static void __kvm_gmem_invalidate_end(struct kvm_gmem *gmem, pgoff_t start,
+static void __kvm_gmem_invalidate_end(struct gmem_file *f, pgoff_t start,
 				      pgoff_t end)
 {
-	struct kvm *kvm = gmem->kvm;
+	struct kvm *kvm = f->kvm;
 
-	if (xa_find(&gmem->bindings, &start, end - 1, XA_PRESENT)) {
+	if (xa_find(&f->bindings, &start, end - 1, XA_PRESENT)) {
 		KVM_MMU_LOCK(kvm);
 		kvm_mmu_invalidate_end(kvm);
 		KVM_MMU_UNLOCK(kvm);
@@ -181,10 +190,10 @@ static void kvm_gmem_invalidate_end(struct inode *inode, pgoff_t start,
 				    pgoff_t end)
 {
 	struct list_head *gmem_list = &inode->i_mapping->i_private_list;
-	struct kvm_gmem *gmem;
+	struct gmem_file *f;
 
-	list_for_each_entry(gmem, gmem_list, entry)
-		__kvm_gmem_invalidate_end(gmem, start, end);
+	list_for_each_entry(f, gmem_list, entry)
+		__kvm_gmem_invalidate_end(f, start, end);
 }
 
 static long kvm_gmem_punch_hole(struct inode *inode, loff_t offset, loff_t len)
@@ -282,9 +291,9 @@ static long kvm_gmem_fallocate(struct file *file, int mode, loff_t offset,
 
 static int kvm_gmem_release(struct inode *inode, struct file *file)
 {
-	struct kvm_gmem *gmem = file->private_data;
+	struct gmem_file *f = file->private_data;
 	struct kvm_memory_slot *slot;
-	struct kvm *kvm = gmem->kvm;
+	struct kvm *kvm = f->kvm;
 	unsigned long index;
 
 	/*
@@ -304,7 +313,7 @@ static int kvm_gmem_release(struct inode *inode, struct file *file)
 
 	filemap_invalidate_lock(inode->i_mapping);
 
-	xa_for_each(&gmem->bindings, index, slot)
+	xa_for_each(&f->bindings, index, slot)
 		WRITE_ONCE(slot->gmem.file, NULL);
 
 	/*
@@ -312,18 +321,18 @@ static int kvm_gmem_release(struct inode *inode, struct file *file)
 	 * Zap all SPTEs pointed at by this file.  Do not free the backing
 	 * memory, as its lifetime is associated with the inode, not the file.
 	 */
-	__kvm_gmem_invalidate_begin(gmem, 0, -1ul,
+	__kvm_gmem_invalidate_begin(f, 0, -1ul,
 				    kvm_gmem_get_invalidate_filter(inode));
-	__kvm_gmem_invalidate_end(gmem, 0, -1ul);
+	__kvm_gmem_invalidate_end(f, 0, -1ul);
 
-	list_del(&gmem->entry);
+	list_del(&f->entry);
 
 	filemap_invalidate_unlock(inode->i_mapping);
 
 	mutex_unlock(&kvm->slots_lock);
 
-	xa_destroy(&gmem->bindings);
-	kfree(gmem);
+	xa_destroy(&f->bindings);
+	kfree(f);
 
 	kvm_put_kvm(kvm);
 
@@ -491,7 +500,7 @@ bool __weak kvm_arch_supports_gmem_init_shared(struct kvm *kvm)
 static int __kvm_gmem_create(struct kvm *kvm, loff_t size, u64 flags)
 {
 	const char *anon_name = "[kvm-gmem]";
-	struct kvm_gmem *gmem;
+	struct gmem_file *f;
 	struct inode *inode;
 	struct file *file;
 	int fd, err;
@@ -500,14 +509,13 @@ static int __kvm_gmem_create(struct kvm *kvm, loff_t size, u64 flags)
 	if (fd < 0)
 		return fd;
 
-	gmem = kzalloc(sizeof(*gmem), GFP_KERNEL);
-	if (!gmem) {
+	f = kzalloc(sizeof(*f), GFP_KERNEL);
+	if (!f) {
 		err = -ENOMEM;
 		goto err_fd;
 	}
 
-	file = anon_inode_create_getfile(anon_name, &kvm_gmem_fops, gmem,
-					 O_RDWR, NULL);
+	file = anon_inode_create_getfile(anon_name, &kvm_gmem_fops, f, O_RDWR, NULL);
 	if (IS_ERR(file)) {
 		err = PTR_ERR(file);
 		goto err_gmem;
@@ -529,15 +537,15 @@ static int __kvm_gmem_create(struct kvm *kvm, loff_t size, u64 flags)
 	WARN_ON_ONCE(!mapping_unevictable(inode->i_mapping));
 
 	kvm_get_kvm(kvm);
-	gmem->kvm = kvm;
-	xa_init(&gmem->bindings);
-	list_add(&gmem->entry, &inode->i_mapping->i_private_list);
+	f->kvm = kvm;
+	xa_init(&f->bindings);
+	list_add(&f->entry, &inode->i_mapping->i_private_list);
 
 	fd_install(fd, file);
 	return fd;
 
 err_gmem:
-	kfree(gmem);
+	kfree(f);
 err_fd:
 	put_unused_fd(fd);
 	return err;
@@ -562,7 +570,7 @@ int kvm_gmem_bind(struct kvm *kvm, struct kvm_memory_slot *slot,
 {
 	loff_t size = slot->npages << PAGE_SHIFT;
 	unsigned long start, end;
-	struct kvm_gmem *gmem;
+	struct gmem_file *f;
 	struct inode *inode;
 	struct file *file;
 	int r = -EINVAL;
@@ -576,8 +584,8 @@ int kvm_gmem_bind(struct kvm *kvm, struct kvm_memory_slot *slot,
 	if (file->f_op != &kvm_gmem_fops)
 		goto err;
 
-	gmem = file->private_data;
-	if (gmem->kvm != kvm)
+	f = file->private_data;
+	if (f->kvm != kvm)
 		goto err;
 
 	inode = file_inode(file);
@@ -591,8 +599,8 @@ int kvm_gmem_bind(struct kvm *kvm, struct kvm_memory_slot *slot,
 	start = offset >> PAGE_SHIFT;
 	end = start + slot->npages;
 
-	if (!xa_empty(&gmem->bindings) &&
-	    xa_find(&gmem->bindings, &start, end - 1, XA_PRESENT)) {
+	if (!xa_empty(&f->bindings) &&
+	    xa_find(&f->bindings, &start, end - 1, XA_PRESENT)) {
 		filemap_invalidate_unlock(inode->i_mapping);
 		goto err;
 	}
@@ -607,7 +615,7 @@ int kvm_gmem_bind(struct kvm *kvm, struct kvm_memory_slot *slot,
 	if (kvm_gmem_supports_mmap(inode))
 		slot->flags |= KVM_MEMSLOT_GMEM_ONLY;
 
-	xa_store_range(&gmem->bindings, start, end - 1, slot, GFP_KERNEL);
+	xa_store_range(&f->bindings, start, end - 1, slot, GFP_KERNEL);
 	filemap_invalidate_unlock(inode->i_mapping);
 
 	/*
@@ -625,7 +633,7 @@ void kvm_gmem_unbind(struct kvm_memory_slot *slot)
 {
 	unsigned long start = slot->gmem.pgoff;
 	unsigned long end = start + slot->npages;
-	struct kvm_gmem *gmem;
+	struct gmem_file *f;
 	struct file *file;
 
 	/*
@@ -636,10 +644,10 @@ void kvm_gmem_unbind(struct kvm_memory_slot *slot)
 	if (!file)
 		return;
 
-	gmem = file->private_data;
+	f = file->private_data;
 
 	filemap_invalidate_lock(file->f_mapping);
-	xa_store_range(&gmem->bindings, start, end - 1, NULL, GFP_KERNEL);
+	xa_store_range(&f->bindings, start, end - 1, NULL, GFP_KERNEL);
 
 	/*
 	 * synchronize_srcu(&kvm->srcu) ensured that kvm_gmem_get_pfn()
@@ -657,17 +665,17 @@ static struct folio *__kvm_gmem_get_pfn(struct file *file,
 					pgoff_t index, kvm_pfn_t *pfn,
 					bool *is_prepared, int *max_order)
 {
-	struct file *gmem_file = READ_ONCE(slot->gmem.file);
-	struct kvm_gmem *gmem = file->private_data;
+	struct file *slot_file = READ_ONCE(slot->gmem.file);
+	struct gmem_file *f = file->private_data;
 	struct folio *folio;
 
-	if (file != gmem_file) {
-		WARN_ON_ONCE(gmem_file);
+	if (file != slot_file) {
+		WARN_ON_ONCE(slot_file);
 		return ERR_PTR(-EFAULT);
 	}
 
-	if (xa_load(&gmem->bindings, index) != slot) {
-		WARN_ON_ONCE(xa_load(&gmem->bindings, index));
+	if (xa_load(&f->bindings, index) != slot) {
+		WARN_ON_ONCE(xa_load(&f->bindings, index));
 		return ERR_PTR(-EIO);
 	}
 
-- 
2.51.0.858.gf9c4a03a3a-goog


