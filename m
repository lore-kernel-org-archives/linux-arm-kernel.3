Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07345C71157
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Jun 2025 04:35:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oFoW3AOc+QuFugacj5s9TiS04hgfBImIEFygFMt/Gog=; b=VxBN2rGF3yipg2jUys2z4mF6JS
	KKfJWdCl6FeW2rgqdGGyEwLm7tx/IrU/ZUxMKwO+2oMwKY2o1KU8P33NdSg2P+3mF4DqquofI67je
	GQ1RiQpBHTSLDqWwDj0nMUsdaw/v7wC8fpjoG3nRHXqupUHcXH5qhqv/DCEemozgboQ5DAa7jVd0a
	iD4wUxlP6e5v+t6GiXgeFGbnpUtwOVPZJ5JLEEH5hke12p5/MocQ7cVcYl7pC3sJfBosjthVgivgB
	NDni8zbTbKS62We20zE52qKOyQqNXF+j/AuoqoBpYYZ/WNusVkdiZZpckx/0iacb1IVvghOrTIQtC
	z0wEPuEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRkWR-000000091gs-2ZJH;
	Wed, 18 Jun 2025 04:35:39 +0000
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRkLi-00000008zox-3Flr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Jun 2025 04:24:35 +0000
Received: by mail-pf1-x44a.google.com with SMTP id d2e1a72fcca58-748cf01de06so2320611b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Jun 2025 21:24:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750220673; x=1750825473; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=oFoW3AOc+QuFugacj5s9TiS04hgfBImIEFygFMt/Gog=;
        b=y6ruF7VdsU3UUzBQZRU9Xx8+zJ4Z23Fe06DplhhNbrvMIHjSb4I3RGrRHDD6kgZChg
         Yj3oF5RdI8Eu4cnCxVfGD15EtA6V6vbSFCDQRpmRi8Da3oKAX83FTNtn06HMbEHrrjlA
         z+SfnD8W5sSNF3v1D5yxznkrKhmiU8qPYIow3oGI/EqkrNCM4BwiYct7gE4ScOBKSpss
         GAD5qStdKlbsuVGoKGQMu28degdxnXCw6ZujXmnqe+2AZPKQ4QGZAEgZOie+6Qtoej0x
         FoarY3fiom447Ly9W1QwzSH5d7xr+t6PqsAFRSx2gXrm9R4YPNXWDPuvQ5FJWg3g1onw
         VdTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750220673; x=1750825473;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oFoW3AOc+QuFugacj5s9TiS04hgfBImIEFygFMt/Gog=;
        b=WYWl8x5qDJ8eU9PCh9V7ihDOh1Z5vfIP7KMCDC6NxwtcHT/xvyB5NoXErtBb6/1F4E
         6IpsAxAL8rDVsFj5NGugwDd2oyQJiGNMFuVeapTttCDkUpJRykKU0c8RHijpzdlxD0LF
         MCMMX8EzzpdrMBks+gZ1/Sa9gbeY4q8p8VV9rAq3hQCJXG2wHbXA0gKkJMSyilWU07xp
         eAjEzjvY3/sfl1gOvi0CZ/K8KA5Zk9NRG2n0xXkfBacSP56QOSF5PoTJFhuWsGZF5/hn
         bUiU07t2U0g8N1/R911xSHq+KSy1N1r15miz0aCfM5CKTdI1tvkSx99NwKelKL3Td4vl
         lzKA==
X-Forwarded-Encrypted: i=1; AJvYcCU+C8Ptbilzy+ayfcyVVkNV+3Qjg4bQYxxUlzJAPbVXxGbXwQAyLpaD90Ho594rhrRVA3Ma9H2wHyMNI0wT7J14@lists.infradead.org
X-Gm-Message-State: AOJu0Yw48V45BGuyVKdP8j56OqJeTHRt/SrAv4FUML5YsgXtgMQCvVby
	0BPY4EcasvitbUcfB+DVssyb7uFEGz75rVJuqBEjjVnuItQEyXgI2K6IOGTMbK7b8BiF1INy1n5
	wGgGm3mm3pbQj86l4wSfgBg==
X-Google-Smtp-Source: AGHT+IFbfVtTMrlDGyQ0S31hA6FZ725AcPC2U4LvoTBYCTExhfd2YSckOKywCjqOOmu17hz/wpGpnzKXQhdQJMVq
X-Received: from pgan185.prod.google.com ([2002:a63:40c2:0:b0:b31:cd5e:6d0e])
 (user=jthoughton job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a20:e687:b0:1f5:9330:29fe with SMTP id adf61e73a8af0-21fbd4c7e08mr20135116637.17.1750220673296;
 Tue, 17 Jun 2025 21:24:33 -0700 (PDT)
Date: Wed, 18 Jun 2025 04:24:13 +0000
In-Reply-To: <20250618042424.330664-1-jthoughton@google.com>
Mime-Version: 1.0
References: <20250618042424.330664-1-jthoughton@google.com>
X-Mailer: git-send-email 2.50.0.rc2.696.g1fc2a0284f-goog
Message-ID: <20250618042424.330664-5-jthoughton@google.com>
Subject: [PATCH v3 04/15] KVM: Add common infrastructure for KVM Userfaults
From: James Houghton <jthoughton@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>, 
	Oliver Upton <oliver.upton@linux.dev>
Cc: Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>, Yan Zhao <yan.y.zhao@intel.com>, 
	James Houghton <jthoughton@google.com>, Nikita Kalyazin <kalyazin@amazon.com>, 
	Anish Moorthy <amoorthy@google.com>, Peter Gonda <pgonda@google.com>, Peter Xu <peterx@redhat.com>, 
	David Matlack <dmatlack@google.com>, wei.w.wang@intel.com, kvm@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_212434_813327_A0E9167F 
X-CRM114-Status: GOOD (  22.16  )
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

KVM Userfault consists of a bitmap in userspace that describes which
pages the user wants exits on (when KVM_MEM_USERFAULT is enabled). To
get those exits, the memslot where KVM_MEM_USERFAULT is being enabled
must drop (at least) all of the translations that the bitmap says should
generate faults. Today, simply drop all translations for the memslot. Do
so with a new arch interface, kvm_arch_userfault_enabled(), which can be
specialized in the future by any architecture for which optimizations
make sense.

Make some changes to kvm_set_memory_region() to support setting
KVM_MEM_USERFAULT on KVM_MEM_GUEST_MEMFD memslots, including relaxing
the retrictions on guest_memfd memslots from only deletion to no moving.

Signed-off-by: James Houghton <jthoughton@google.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 include/linux/kvm_host.h | 23 ++++++++++++++++++
 include/uapi/linux/kvm.h |  5 +++-
 virt/kvm/kvm_main.c      | 51 ++++++++++++++++++++++++++++++++++++----
 3 files changed, 74 insertions(+), 5 deletions(-)

diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 9a85500cd5c50..bd5fb5ae10d05 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -597,6 +597,7 @@ struct kvm_memory_slot {
 	unsigned long *dirty_bitmap;
 	struct kvm_arch_memory_slot arch;
 	unsigned long userspace_addr;
+	unsigned long __user *userfault_bitmap;
 	u32 flags;
 	short id;
 	u16 as_id;
@@ -1236,6 +1237,20 @@ void kvm_arch_flush_shadow_all(struct kvm *kvm);
 void kvm_arch_flush_shadow_memslot(struct kvm *kvm,
 				   struct kvm_memory_slot *slot);
 
+#ifndef __KVM_HAVE_ARCH_USERFAULT_ENABLED
+static inline void kvm_arch_userfault_enabled(struct kvm *kvm,
+					      struct kvm_memory_slot *slot)
+{
+	/*
+	 * kvm_arch_userfault_enabled() must ensure that new faults on pages
+	 * marked as userfault will exit to userspace. Dropping all
+	 * translations is sufficient; architectures may choose to optimize
+	 * this.
+	 */
+	return kvm_arch_flush_shadow_memslot(kvm, slot);
+}
+#endif
+
 int kvm_prefetch_pages(struct kvm_memory_slot *slot, gfn_t gfn,
 		       struct page **pages, int nr_pages);
 
@@ -2524,6 +2539,14 @@ static inline void kvm_prepare_memory_fault_exit(struct kvm_vcpu *vcpu,
 	if (fault->is_private)
 		vcpu->run->memory_fault.flags |= KVM_MEMORY_EXIT_FLAG_PRIVATE;
 }
+
+bool kvm_do_userfault(struct kvm_vcpu *vcpu, struct kvm_page_fault *fault);
+
+static inline bool kvm_is_userfault_memslot(struct kvm_memory_slot *memslot)
+{
+	return memslot && memslot->flags & KVM_MEM_USERFAULT;
+}
+
 #endif
 
 #ifdef CONFIG_KVM_GENERIC_MEMORY_ATTRIBUTES
diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
index d00b85cb168c3..e3b871506ec85 100644
--- a/include/uapi/linux/kvm.h
+++ b/include/uapi/linux/kvm.h
@@ -40,7 +40,8 @@ struct kvm_userspace_memory_region2 {
 	__u64 guest_memfd_offset;
 	__u32 guest_memfd;
 	__u32 pad1;
-	__u64 pad2[14];
+	__u64 userfault_bitmap;
+	__u64 pad2[13];
 };
 
 /*
@@ -51,6 +52,7 @@ struct kvm_userspace_memory_region2 {
 #define KVM_MEM_LOG_DIRTY_PAGES	(1UL << 0)
 #define KVM_MEM_READONLY	(1UL << 1)
 #define KVM_MEM_GUEST_MEMFD	(1UL << 2)
+#define KVM_MEM_USERFAULT	(1UL << 3)
 
 /* for KVM_IRQ_LINE */
 struct kvm_irq_level {
@@ -443,6 +445,7 @@ struct kvm_run {
 		/* KVM_EXIT_MEMORY_FAULT */
 		struct {
 #define KVM_MEMORY_EXIT_FLAG_PRIVATE	(1ULL << 3)
+#define KVM_MEMORY_EXIT_FLAG_USERFAULT	(1ULL << 4)
 			__u64 flags;
 			__u64 gpa;
 			__u64 size;
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index eec82775c5bfb..bef6760cd1c0e 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -1747,6 +1747,14 @@ static void kvm_commit_memory_region(struct kvm *kvm,
 		if (old->dirty_bitmap && !new->dirty_bitmap)
 			kvm_destroy_dirty_bitmap(old);
 
+		/*
+		 * If KVM_MEM_USERFAULT is being enabled for the slot, drop the
+		 * translations that are marked as userfault.
+		 */
+		if (!(old_flags & KVM_MEM_USERFAULT) &&
+		    (new_flags & KVM_MEM_USERFAULT))
+			kvm_arch_userfault_enabled(kvm, old);
+
 		/*
 		 * The final quirk.  Free the detached, old slot, but only its
 		 * memory, not any metadata.  Metadata, including arch specific
@@ -2039,6 +2047,12 @@ static int kvm_set_memory_region(struct kvm *kvm,
 	if (id < KVM_USER_MEM_SLOTS &&
 	    (mem->memory_size >> PAGE_SHIFT) > KVM_MEM_MAX_NR_PAGES)
 		return -EINVAL;
+	if (mem->flags & KVM_MEM_USERFAULT &&
+	    ((mem->userfault_bitmap != untagged_addr(mem->userfault_bitmap)) ||
+	     !access_ok(u64_to_user_ptr(mem->userfault_bitmap),
+			DIV_ROUND_UP(mem->memory_size >> PAGE_SHIFT, BITS_PER_LONG)
+			 * sizeof(long))))
+		return -EINVAL;
 
 	slots = __kvm_memslots(kvm, as_id);
 
@@ -2071,14 +2085,15 @@ static int kvm_set_memory_region(struct kvm *kvm,
 		if ((kvm->nr_memslot_pages + npages) < kvm->nr_memslot_pages)
 			return -EINVAL;
 	} else { /* Modify an existing slot. */
-		/* Private memslots are immutable, they can only be deleted. */
-		if (mem->flags & KVM_MEM_GUEST_MEMFD)
-			return -EINVAL;
 		if ((mem->userspace_addr != old->userspace_addr) ||
 		    (npages != old->npages) ||
 		    ((mem->flags ^ old->flags) & KVM_MEM_READONLY))
 			return -EINVAL;
 
+		/* Moving a guest_memfd memslot isn't supported. */
+		if (base_gfn != old->base_gfn && mem->flags & KVM_MEM_GUEST_MEMFD)
+			return -EINVAL;
+
 		if (base_gfn != old->base_gfn)
 			change = KVM_MR_MOVE;
 		else if (mem->flags != old->flags)
@@ -2102,11 +2117,13 @@ static int kvm_set_memory_region(struct kvm *kvm,
 	new->npages = npages;
 	new->flags = mem->flags;
 	new->userspace_addr = mem->userspace_addr;
-	if (mem->flags & KVM_MEM_GUEST_MEMFD) {
+	if (mem->flags & KVM_MEM_GUEST_MEMFD && change == KVM_MR_CREATE) {
 		r = kvm_gmem_bind(kvm, new, mem->guest_memfd, mem->guest_memfd_offset);
 		if (r)
 			goto out;
 	}
+	if (mem->flags & KVM_MEM_USERFAULT)
+		new->userfault_bitmap = u64_to_user_ptr(mem->userfault_bitmap);
 
 	r = kvm_set_memslot(kvm, old, new, change);
 	if (r)
@@ -4980,6 +4997,32 @@ static int kvm_vm_ioctl_reset_dirty_pages(struct kvm *kvm)
 	return cleared;
 }
 
+#ifdef CONFIG_KVM_GENERIC_PAGE_FAULT
+bool kvm_do_userfault(struct kvm_vcpu *vcpu, struct kvm_page_fault *fault)
+{
+	struct kvm_memory_slot *slot = fault->slot;
+	unsigned long __user *user_chunk;
+	unsigned long chunk;
+	gfn_t offset;
+
+	if (!kvm_is_userfault_memslot(slot))
+		return false;
+
+	offset = fault->gfn - slot->base_gfn;
+	user_chunk = slot->userfault_bitmap + (offset / BITS_PER_LONG);
+
+	if (__get_user(chunk, user_chunk))
+		return true;
+
+	if (!test_bit(offset % BITS_PER_LONG, &chunk))
+		return false;
+
+	kvm_prepare_memory_fault_exit(vcpu, fault);
+	vcpu->run->memory_fault.flags |= KVM_MEMORY_EXIT_FLAG_USERFAULT;
+	return true;
+}
+#endif
+
 int __attribute__((weak)) kvm_vm_ioctl_enable_cap(struct kvm *kvm,
 						  struct kvm_enable_cap *cap)
 {
-- 
2.50.0.rc2.692.g299adb8693-goog


