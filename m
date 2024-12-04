Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6B82E7716D
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Dec 2024 19:17:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zrj0l+L1/XMejjcdAt6Cg23oGRx5OMh6hw9EKc02Jsg=; b=Uhtgp0Xds0HxPX6vqEDhjhYeOf
	R7VDaxewB2jfa6HQ8IQ31oQMXqQNXK0WmO4IHSwd/RDYhAfClZ5HprNYb3aXb2z6VADhdUiaiwicy
	CwwPEZnJ/f3fqlB6nPcun8yr6LMaUTZGKtEfX5efJ8B6ZDCHC0bU67qke7vk8JJLIn+e9YttnHuun
	JBkXDjiHt5lsLoRd2qDw3ll2oQPc+9fKH8AWsz4DU9xs6Ufu8JkkHuHzu2O4QXIL2UcvBUDbqoL3m
	d7D7dPuTcjVGleVD8S6g2RIdCt3/J7MLpEQBHDrpTN3Gw051snRr7jG/BJLFif7GyieFhqVI+yQQ+
	IsXfCmFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIusH-0000000Dedy-0u1D;
	Wed, 04 Dec 2024 19:17:25 +0000
Received: from mail-qk1-x749.google.com ([2607:f8b0:4864:20::749])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIupG-0000000Ddfl-0jLf
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Dec 2024 19:14:19 +0000
Received: by mail-qk1-x749.google.com with SMTP id af79cd13be357-7b674755f8eso20367685a.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Dec 2024 11:14:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733339656; x=1733944456; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Zrj0l+L1/XMejjcdAt6Cg23oGRx5OMh6hw9EKc02Jsg=;
        b=bbej1dcRpf9ru1HjUUX+dInLstD0suztd8pJjz9aBZ0AEGDj98DfN9b22rbYkoEY4g
         /ev8BYuGcslfRvBl1i0ckZQtouK52+wPxl2zWAv1Y7v9neEVM8OJID5iXz+S/O1R/NqJ
         l7IjwbCrKJBT9sUpRXO3Bxcfxd01cct4y12cPdAYGPeO/xf+PpZWy8BsuwBhyTJEtbb0
         lAp1rmEKDfDy5mucHtSw/NLh+acbg4GbMIxpI+Xj+/e4hOw/6q3v8L+gXNoZH8AB4hFi
         7NLG/kdsctknekJWKguxrBl8+ODOywPpML9SvuywlLomIFtEL4IxYfwBbvWOvS28xtMm
         E3qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733339656; x=1733944456;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Zrj0l+L1/XMejjcdAt6Cg23oGRx5OMh6hw9EKc02Jsg=;
        b=p+Dus2iGcEypr/LagTmbS2ABAn1v8HX9aXKYMzrCtx6y3JRdZg06qDCB6MDxb8qLNk
         2li1fd7jYTiK3UOB24rMHv9foRM/TFiUGt2D+/LDYfAysWA7ZVmVQuInPjqIplSF2o6W
         ff3wy6gE4cqeRc9IU4tufG16+vpQ9cA9kb7rKNwi4ajvV4CyELF7tQtoH+NdxIikyP/x
         aHDr9rvApr1eKtAFdS+eHXvcGG59VngypilrdOVT6vWc5tVgOFXQ3aIt8BWVJHj0QZJZ
         5RxNW4LLouVj8GLpw0wDjUTRs4T9uEb2Lbrgj+r2pd0NN2msnkcspagOmJWUdp8H9bir
         DZ7A==
X-Forwarded-Encrypted: i=1; AJvYcCUHCGamAUIFbwHCSEVmmvalCcr3iYu0pifHT4QUljKuQA3g8b3hSVdVfeljOM7YXePQAux3Njs6QDm15OUj0OAl@lists.infradead.org
X-Gm-Message-State: AOJu0Yx9EwAe8gAXdC6b5qpEV2XI8oPuQSw0Hm2SAerRRVrMwpFX+iBy
	KFjYK/rG+Nuoh9yCMeh/Ox064DMFunRczsPu7O1hBiqxQ4ufpy9NgtOduE+XhWpk+8KKMzlE9Kq
	VXvroM6oEHKTRe7CZDw==
X-Google-Smtp-Source: AGHT+IEsH4AhFxEPswA6HSpr3bvQoscIWPYhswjH6B0ZmAUwG6NVAuJoyTvkHIFeYc2jG+fxyhqARW7A5Wn5aFvO
X-Received: from uabib8.prod.google.com ([2002:a05:6130:1c88:b0:85b:d490:f925])
 (user=jthoughton job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:620a:2685:b0:7a9:acd5:1b21 with SMTP id af79cd13be357-7b6a61cb6e2mr738681685a.50.1733339656100;
 Wed, 04 Dec 2024 11:14:16 -0800 (PST)
Date: Wed,  4 Dec 2024 19:13:36 +0000
In-Reply-To: <20241204191349.1730936-1-jthoughton@google.com>
Mime-Version: 1.0
References: <20241204191349.1730936-1-jthoughton@google.com>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
Message-ID: <20241204191349.1730936-2-jthoughton@google.com>
Subject: [PATCH v1 01/13] KVM: Add KVM_MEM_USERFAULT memslot flag and bitmap
From: James Houghton <jthoughton@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Yan Zhao <yan.y.zhao@intel.com>, 
	James Houghton <jthoughton@google.com>, Nikita Kalyazin <kalyazin@amazon.com>, 
	Anish Moorthy <amoorthy@google.com>, Peter Gonda <pgonda@google.com>, Peter Xu <peterx@redhat.com>, 
	David Matlack <dmatlack@google.com>, Wang@google.com, Wei W <wei.w.wang@intel.com>, 
	kvm@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_111418_210141_0174B3DB 
X-CRM114-Status: GOOD (  19.28  )
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
 virt/kvm/kvm_main.c      | 28 ++++++++++++++++++++++++++++
 4 files changed, 48 insertions(+), 1 deletion(-)

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
index 502ea63b5d2e..94be7e8b46a4 100644
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
index de2c11dae231..23fa3e911c4e 100644
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
 
@@ -2042,6 +2045,8 @@ int __kvm_set_memory_region(struct kvm *kvm,
 		if (r)
 			goto out;
 	}
+	if (mem->flags & KVM_MEM_USERFAULT)
+		new->userfault_bitmap = (unsigned long *)mem->userfault_bitmap;
 
 	r = kvm_set_memslot(kvm, old, new, change);
 	if (r)
@@ -6426,3 +6431,26 @@ void kvm_exit(void)
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
2.47.0.338.g60cca15819-goog


