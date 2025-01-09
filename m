Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CBE8E77197
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jan 2025 20:53:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4wiJ4r6U+4DKwl7a0Sm0LZeZPdZmNUbmXckiwF/fu60=; b=AwYTyufSEXmPy5bv+HXoOW2Erd
	fGW30ZcCVCHFxTWJpRAuVJA2dQcFm28jy+aq+HSO8NYBf8AEkZKGc3c4lFvtuIRgC+qTdRM46DqIx
	MWIBkJDoo8RBKaZ5SnOYPtQU00JrRSZPrkzPzZ55Z5P9VuZgh0sD2WDAUZ34ZpMnRgF27fNWPiNIi
	e/zYQlydGjsUj/DMMxx1T5LFrdPV3kI2TSdwsy0XcYXlT4cmV1948QBtyzekTwXHyvL0QSyshDFMU
	O47MU+U8jIostYBFa+E8LGs+G+HP5YrxaRln8UeVz+7VKHsv3eP5Eloe66W0T9Hl+XC4pUS0sBMn1
	KBWr+HOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVzWy-0000000DHpo-1jpm;
	Thu, 09 Jan 2025 20:53:28 +0000
Received: from mail-qk1-x749.google.com ([2607:f8b0:4864:20::749])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVzTZ-0000000DGUv-48PD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jan 2025 20:49:59 +0000
Received: by mail-qk1-x749.google.com with SMTP id af79cd13be357-7b864496708so312522185a.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Jan 2025 12:49:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736455796; x=1737060596; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=4wiJ4r6U+4DKwl7a0Sm0LZeZPdZmNUbmXckiwF/fu60=;
        b=Fo2wADit8FqpFy46QbTgE0lqXNJS9pFZ2QDGqGx3l39ALPd1cNWIqfPSbiwWDa2bZM
         M3xK5e7gZk9f9zTfg7L5lpkB2+0a8+djKYzBHsyxT/9CL6Y6WEIHYasj1n3cDtAxHrCj
         vByx6sWS6+ENGJXqAc4gb6fopoXGCG7mQsAg/eZF0fbCj4a4mF02qpmpoS8F9P/vdU5i
         FzDBdFnzSFur24Q7IP9+/zgaZrlTx1iuu8G7/DqcfuKztB+dTxd9gOCc2lEVzmiVmbPy
         BbYJ0GMilNDKgc12tuRYe15KFrTopKROb0KKmKQtzxmoYBVohC0bd13fPdv/BSOi8uX4
         i1lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736455796; x=1737060596;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4wiJ4r6U+4DKwl7a0Sm0LZeZPdZmNUbmXckiwF/fu60=;
        b=PZ9Ez3z9W5ckRJkWP/1CBbfZPP8c26pfPfIs/T/F36mDVqnunhW8QyRWA4FfoG3o0r
         yw7aup4+oZT9Qteule9Zj/nO6JgFGbqc3QtD1lV8A1oyaV33GVRy6WEwv0pKK/4OnXsF
         xc2slek62EBTwel2sL2EVj/mBPKsz274knx7PTsnSclDdCcfrLN8AMb+dmpCwEWXuUNm
         +58lKTsQeTgzn536ENt2qNbZritJWxZ8aPMO/8K9pTRXn1VP0pANbdQjkiLlXnW0P+RZ
         VMDzVbUlXLs1s7A3rJZ4WpAkjHPmmBoGoLaf7CvT7te2Lsm/VXqfEkdVSfkAM7zUj63d
         qlRw==
X-Forwarded-Encrypted: i=1; AJvYcCW25bi6Eo+fTv/6iC7sb6s44PDR3Pw5Cqtz3aGRtzvn2Ap0oAEb/vrwn540fLyJZ30R8bqUsMPZOrYgLKYFI0Iq@lists.infradead.org
X-Gm-Message-State: AOJu0YyErV/Qrdai8o1c86k39ko7CotB27pRgxSvw8Q+uBhA84cD0X1z
	TS1ttnWf1qh4PEbpZMCTx5lXupzkZPcLLS85Mdh5xWgGAESwiuxJHJ9cCvfJD2QCY+kQULMLIHB
	6WiRap6SLB1BbDzRA+w==
X-Google-Smtp-Source: AGHT+IG26IPp3qbl2E13g/CbVexbYg/eWO5E84o5Ua+axOZx93ciuXt5lAWy60cQgF+PsXPiSlHQOVHo5aFaWyuK
X-Received: from qkkl1.prod.google.com ([2002:a37:f501:0:b0:7b6:e209:1c29])
 (user=jthoughton job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:620a:d87:b0:7b6:d632:37cf with SMTP id af79cd13be357-7bcd9729affmr1146945885a.3.1736455796215;
 Thu, 09 Jan 2025 12:49:56 -0800 (PST)
Date: Thu,  9 Jan 2025 20:49:17 +0000
In-Reply-To: <20250109204929.1106563-1-jthoughton@google.com>
Mime-Version: 1.0
References: <20250109204929.1106563-1-jthoughton@google.com>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20250109204929.1106563-2-jthoughton@google.com>
Subject: [PATCH v2 01/13] KVM: Add KVM_MEM_USERFAULT memslot flag and bitmap
From: James Houghton <jthoughton@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Yan Zhao <yan.y.zhao@intel.com>, 
	James Houghton <jthoughton@google.com>, Nikita Kalyazin <kalyazin@amazon.com>, 
	Anish Moorthy <amoorthy@google.com>, Peter Gonda <pgonda@google.com>, Peter Xu <peterx@redhat.com>, 
	David Matlack <dmatlack@google.com>, wei.w.wang@intel.com, kvm@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_124958_023038_8CBC9F74 
X-CRM114-Status: GOOD (  19.42  )
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

Use one of the 14 reserved u64s in struct kvm_userspace_memory_region2
for the user to provide `userfault_bitmap`.

The memslot flag indicates if KVM should be reading from the
`userfault_bitmap` field from the memslot. The user is permitted to
provide a bogus pointer. If the pointer cannot be read from, we will
return -EFAULT (with no other information) back to the user.

Signed-off-by: James Houghton <jthoughton@google.com>
---
 include/linux/kvm_host.h | 14 ++++++++++++++
 include/uapi/linux/kvm.h |  4 +++-
 virt/kvm/Kconfig         |  3 +++
 virt/kvm/kvm_main.c      | 35 +++++++++++++++++++++++++++++++++++
 4 files changed, 55 insertions(+), 1 deletion(-)

diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 401439bb21e3..f7a3dfd5e224 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -590,6 +590,7 @@ struct kvm_memory_slot {
 	unsigned long *dirty_bitmap;
 	struct kvm_arch_memory_slot arch;
 	unsigned long userspace_addr;
+	unsigned long __user *userfault_bitmap;
 	u32 flags;
 	short id;
 	u16 as_id;
@@ -724,6 +725,11 @@ static inline bool kvm_arch_has_readonly_mem(struct kvm *kvm)
 }
 #endif
 
+static inline bool kvm_has_userfault(struct kvm *kvm)
+{
+	return IS_ENABLED(CONFIG_HAVE_KVM_USERFAULT);
+}
+
 struct kvm_memslots {
 	u64 generation;
 	atomic_long_t last_used_slot;
@@ -2553,4 +2559,12 @@ long kvm_arch_vcpu_pre_fault_memory(struct kvm_vcpu *vcpu,
 				    struct kvm_pre_fault_memory *range);
 #endif
 
+int kvm_gfn_userfault(struct kvm *kvm, struct kvm_memory_slot *memslot,
+		      gfn_t gfn);
+
+static inline bool kvm_memslot_userfault(struct kvm_memory_slot *memslot)
+{
+	return memslot->flags & KVM_MEM_USERFAULT;
+}
+
 #endif
diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
index 343de0a51797..7ade5169d373 100644
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
diff --git a/virt/kvm/Kconfig b/virt/kvm/Kconfig
index 54e959e7d68f..9eb1fae238b1 100644
--- a/virt/kvm/Kconfig
+++ b/virt/kvm/Kconfig
@@ -124,3 +124,6 @@ config HAVE_KVM_ARCH_GMEM_PREPARE
 config HAVE_KVM_ARCH_GMEM_INVALIDATE
        bool
        depends on KVM_PRIVATE_MEM
+
+config HAVE_KVM_USERFAULT
+       bool
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index de2c11dae231..4bceae6a6401 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -1541,6 +1541,9 @@ static int check_memory_region_flags(struct kvm *kvm,
 	    !(mem->flags & KVM_MEM_GUEST_MEMFD))
 		valid_flags |= KVM_MEM_READONLY;
 
+	if (kvm_has_userfault(kvm))
+		valid_flags |= KVM_MEM_USERFAULT;
+
 	if (mem->flags & ~valid_flags)
 		return -EINVAL;
 
@@ -1974,6 +1977,12 @@ int __kvm_set_memory_region(struct kvm *kvm,
 		return -EINVAL;
 	if ((mem->memory_size >> PAGE_SHIFT) > KVM_MEM_MAX_NR_PAGES)
 		return -EINVAL;
+	if (mem->flags & KVM_MEM_USERFAULT &&
+	    ((mem->userfault_bitmap != untagged_addr(mem->userfault_bitmap)) ||
+	     !access_ok((void __user *)(unsigned long)mem->userfault_bitmap,
+			DIV_ROUND_UP(mem->memory_size >> PAGE_SHIFT, BITS_PER_LONG)
+			 * sizeof(long))))
+		return -EINVAL;
 
 	slots = __kvm_memslots(kvm, as_id);
 
@@ -2042,6 +2051,9 @@ int __kvm_set_memory_region(struct kvm *kvm,
 		if (r)
 			goto out;
 	}
+	if (mem->flags & KVM_MEM_USERFAULT)
+		new->userfault_bitmap =
+		  (unsigned long __user *)(unsigned long)mem->userfault_bitmap;
 
 	r = kvm_set_memslot(kvm, old, new, change);
 	if (r)
@@ -6426,3 +6438,26 @@ void kvm_exit(void)
 	kvm_irqfd_exit();
 }
 EXPORT_SYMBOL_GPL(kvm_exit);
+
+int kvm_gfn_userfault(struct kvm *kvm, struct kvm_memory_slot *memslot,
+		       gfn_t gfn)
+{
+	unsigned long bitmap_chunk = 0;
+	off_t offset;
+
+	if (!kvm_memslot_userfault(memslot))
+		return 0;
+
+	if (WARN_ON_ONCE(!memslot->userfault_bitmap))
+		return 0;
+
+	offset = gfn - memslot->base_gfn;
+
+	if (copy_from_user(&bitmap_chunk,
+			   memslot->userfault_bitmap + offset / BITS_PER_LONG,
+			   sizeof(bitmap_chunk)))
+		return -EFAULT;
+
+	/* Set in the bitmap means that the gfn is userfault */
+	return !!(bitmap_chunk & (1ul << (offset % BITS_PER_LONG)));
+}
-- 
2.47.1.613.gc27f4b7a9f-goog


