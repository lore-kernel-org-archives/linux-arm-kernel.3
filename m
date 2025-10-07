Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3668BCCD186
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Oct 2025 22:14:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=icsR5rcCxPu2mbO19M+4yBFFv/b0hAKJOcgfFqtENIY=; b=ocQ0UECnd8NlGuDSSUf30mFipW
	+hXDY6qcdczPFHgEZSY8stoNUNNv6bxPhwpMeJBh5/GqFPap3LAz1Y/Xa26lpme3WaCwJh1aKG19P
	EEkuumOo1z3R+DIcheRrIr3bjT4ReFtJCR06OvsCDJmvCt2VEGqsfMAzIDOyNzKIRNDDgoZYS6CdB
	psnQLdP6O1J+EmwPkgqhiHDJ8PTTDDSHzy8LsMf3tDOTLVe5lDgy/WVF8CAu8QRl4L3je0vZHO/HI
	RLO01U10UFQIXvHMQyNGH34MJ0LOscTjtboTAuq8Xx1EOg5N0ZhWYVtyP68phjZX7vkp24uMb+qUp
	YqkcdGSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6FxD-00000002qSO-1fNs;
	Tue, 07 Oct 2025 22:14:43 +0000
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6FxA-00000002qRO-1D7f
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Oct 2025 22:14:41 +0000
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-28bd8b3fa67so61336485ad.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Oct 2025 15:14:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1759875279; x=1760480079; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=icsR5rcCxPu2mbO19M+4yBFFv/b0hAKJOcgfFqtENIY=;
        b=cXHAnLRGFrJN8TXrSoqAB1sWg+FGcorMuny15LtY7G4jcUmqp4hFu4wQulhQj0tN4q
         4hwymyJg1Np9v32Ae2fAoSQci77mYeUhpYJ796pp/Tpi2i5JWnaZBKy8zx5fPzw5di2k
         3g1Vsk3k/oOBfM14ZeKxeugSGGW35dfJN02QcgUjxNeH+v4wu8ecMluT9uovntUeCszx
         AfhESjHqyERrucms0NkmdOATrkcoL4CehHihp646fPAuAkXe2tWSQ2S42qIICfkxmvSz
         uBmG1arIRNN2Fy3L8F31R0cgz7NYRrdD6xSygZaNCpgGNRiYnf2Q+C+DjkWpDCKBzau2
         X6xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759875279; x=1760480079;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=icsR5rcCxPu2mbO19M+4yBFFv/b0hAKJOcgfFqtENIY=;
        b=hnm1U5qKp35xVU6eTT2W6V7N/Zxa/1pBmmZo5MOWh1dQVMtWD3VOJls74dS6hTimI7
         We8j/cKZKT2J0CX+6kS0CALj5sRy2dHB83xvUQJDiIjZub7JybpSFu0AQ2fleNKTy6YM
         70UwRRzkG/v+57M50OKkQQ5bKCMsROq/eM2uNmyZsGoNj9fIZwrTaVNNKS90auuk38yp
         DnsAqtskW7I2KuZYUkYQagS05bOMacKHvCdPExkgeQwjyjYJZ1+bZJco5ke9gAZa2Poo
         sQQEHhSycJ3NY9UWNxo+Uo1wtlEceOZbW2+uX4cB3FgBQw/EBCh/jow/Irahvvpo5o2C
         u+Ig==
X-Gm-Message-State: AOJu0Ywx7kK8iGLgGg34Tay1PmYoaXMW335bYtNBzReeYm+d6m4WKXl/
	RfXW891EhK0x5jqpTVSq0uz0D0hGu5oj0jUhGq3wfstMJaDITQJUDU5Um6ddPtD6bbMNNEkmjjJ
	Sta9/Dw==
X-Google-Smtp-Source: AGHT+IFzjZnIWMgQjMlS5yIf3CAjQgFHrvUBdvw28xfclFFsf//YAI6F0Vd324LvQxWiJFyU7jWQTlDOCyA=
X-Received: from plbcp5.prod.google.com ([2002:a17:902:e785:b0:290:28e2:ce55])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:1aa4:b0:27c:a35a:1321
 with SMTP id d9443c01a7336-290272e6f79mr13157245ad.51.1759875278814; Tue, 07
 Oct 2025 15:14:38 -0700 (PDT)
Date: Tue,  7 Oct 2025 15:14:09 -0700
In-Reply-To: <20251007221420.344669-1-seanjc@google.com>
Mime-Version: 1.0
References: <20251007221420.344669-1-seanjc@google.com>
X-Mailer: git-send-email 2.51.0.710.ga91ca5db03-goog
Message-ID: <20251007221420.344669-2-seanjc@google.com>
Subject: [PATCH v12 01/12] KVM: guest_memfd: Rename "struct kvm_gmem" to
 "struct gmem_file"
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	David Hildenbrand <david@redhat.com>, Fuad Tabba <tabba@google.com>, 
	Ackerley Tng <ackerleytng@google.com>, Shivank Garg <shivankg@amd.com>, 
	Ashish Kalra <ashish.kalra@amd.com>, Vlastimil Babka <vbabka@suse.cz>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251007_151440_336865_D7EDF36C 
X-CRM114-Status: GOOD (  20.50  )
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

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 virt/kvm/guest_memfd.c | 100 ++++++++++++++++++++++-------------------
 1 file changed, 54 insertions(+), 46 deletions(-)

diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
index fbca8c0972da..3c57fb42f12c 100644
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
@@ -110,16 +119,16 @@ static enum kvm_gfn_range_filter kvm_gmem_get_invalidate_filter(struct inode *in
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
@@ -152,20 +161,20 @@ static void kvm_gmem_invalidate_begin(struct inode *inode, pgoff_t start,
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
@@ -176,10 +185,10 @@ static void kvm_gmem_invalidate_end(struct inode *inode, pgoff_t start,
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
@@ -277,9 +286,9 @@ static long kvm_gmem_fallocate(struct file *file, int mode, loff_t offset,
 
 static int kvm_gmem_release(struct inode *inode, struct file *file)
 {
-	struct kvm_gmem *gmem = file->private_data;
+	struct gmem_file *f = file->private_data;
 	struct kvm_memory_slot *slot;
-	struct kvm *kvm = gmem->kvm;
+	struct kvm *kvm = f->kvm;
 	unsigned long index;
 
 	/*
@@ -299,7 +308,7 @@ static int kvm_gmem_release(struct inode *inode, struct file *file)
 
 	filemap_invalidate_lock(inode->i_mapping);
 
-	xa_for_each(&gmem->bindings, index, slot)
+	xa_for_each(&f->bindings, index, slot)
 		WRITE_ONCE(slot->gmem.file, NULL);
 
 	/*
@@ -307,18 +316,18 @@ static int kvm_gmem_release(struct inode *inode, struct file *file)
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
 
@@ -493,7 +502,7 @@ bool __weak kvm_arch_supports_gmem_init_shared(struct kvm *kvm)
 static int __kvm_gmem_create(struct kvm *kvm, loff_t size, u64 flags)
 {
 	const char *anon_name = "[kvm-gmem]";
-	struct kvm_gmem *gmem;
+	struct gmem_file *f;
 	struct inode *inode;
 	struct file *file;
 	int fd, err;
@@ -502,14 +511,13 @@ static int __kvm_gmem_create(struct kvm *kvm, loff_t size, u64 flags)
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
@@ -531,15 +539,15 @@ static int __kvm_gmem_create(struct kvm *kvm, loff_t size, u64 flags)
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
@@ -564,7 +572,7 @@ int kvm_gmem_bind(struct kvm *kvm, struct kvm_memory_slot *slot,
 {
 	loff_t size = slot->npages << PAGE_SHIFT;
 	unsigned long start, end;
-	struct kvm_gmem *gmem;
+	struct gmem_file *f;
 	struct inode *inode;
 	struct file *file;
 	int r = -EINVAL;
@@ -578,8 +586,8 @@ int kvm_gmem_bind(struct kvm *kvm, struct kvm_memory_slot *slot,
 	if (file->f_op != &kvm_gmem_fops)
 		goto err;
 
-	gmem = file->private_data;
-	if (gmem->kvm != kvm)
+	f = file->private_data;
+	if (f->kvm != kvm)
 		goto err;
 
 	inode = file_inode(file);
@@ -593,8 +601,8 @@ int kvm_gmem_bind(struct kvm *kvm, struct kvm_memory_slot *slot,
 	start = offset >> PAGE_SHIFT;
 	end = start + slot->npages;
 
-	if (!xa_empty(&gmem->bindings) &&
-	    xa_find(&gmem->bindings, &start, end - 1, XA_PRESENT)) {
+	if (!xa_empty(&f->bindings) &&
+	    xa_find(&f->bindings, &start, end - 1, XA_PRESENT)) {
 		filemap_invalidate_unlock(inode->i_mapping);
 		goto err;
 	}
@@ -609,7 +617,7 @@ int kvm_gmem_bind(struct kvm *kvm, struct kvm_memory_slot *slot,
 	if (kvm_gmem_supports_mmap(inode))
 		slot->flags |= KVM_MEMSLOT_GMEM_ONLY;
 
-	xa_store_range(&gmem->bindings, start, end - 1, slot, GFP_KERNEL);
+	xa_store_range(&f->bindings, start, end - 1, slot, GFP_KERNEL);
 	filemap_invalidate_unlock(inode->i_mapping);
 
 	/*
@@ -627,7 +635,7 @@ void kvm_gmem_unbind(struct kvm_memory_slot *slot)
 {
 	unsigned long start = slot->gmem.pgoff;
 	unsigned long end = start + slot->npages;
-	struct kvm_gmem *gmem;
+	struct gmem_file *f;
 	struct file *file;
 
 	/*
@@ -638,10 +646,10 @@ void kvm_gmem_unbind(struct kvm_memory_slot *slot)
 	if (!file)
 		return;
 
-	gmem = file->private_data;
+	f = file->private_data;
 
 	filemap_invalidate_lock(file->f_mapping);
-	xa_store_range(&gmem->bindings, start, end - 1, NULL, GFP_KERNEL);
+	xa_store_range(&f->bindings, start, end - 1, NULL, GFP_KERNEL);
 
 	/*
 	 * synchronize_srcu(&kvm->srcu) ensured that kvm_gmem_get_pfn()
@@ -659,18 +667,18 @@ static struct folio *__kvm_gmem_get_pfn(struct file *file,
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
 
-	gmem = file->private_data;
-	if (xa_load(&gmem->bindings, index) != slot) {
-		WARN_ON_ONCE(xa_load(&gmem->bindings, index));
+	f = file->private_data;
+	if (xa_load(&f->bindings, index) != slot) {
+		WARN_ON_ONCE(xa_load(&f->bindings, index));
 		return ERR_PTR(-EIO);
 	}
 
-- 
2.51.0.710.ga91ca5db03-goog


