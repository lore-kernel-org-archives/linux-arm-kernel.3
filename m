Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83C13C87FC9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Jul 2025 23:02:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rCpQGzwMKFK4ptMSW9GdDXyar1lj92zeXPJ/+yaFJX4=; b=UcdREju4HWOK611pU6peo2ZLTV
	PbsJgyo4tn7Kg27nKTKS/7Exfbvdt4/8pcDpt1v9xAdxmMd+zKnOwTIzrC0mzL2rwLZbWbQxaCNHR
	rZbJueW4TOMwWbEFXZS/kBUfq767Qaw88qT/tkk53XXk07tZLL/amuA2jyvBWpKlMclnJk57hWo3V
	r8QReyaG+467KoCDLKCHJva/4TzyzRXu/7mGw8cRUXftQ8IFr7dItJw6JMPqfJreLlZPJFlLFCWZX
	n3nmnl7NOWCf/XClv9kd7sw8j5gWueKi5MkCwFqItXpUvo3B7cTZ3FhwHVWOomKkEJJBMwk3RyQas
	B6NalM7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugtL1-00000000FQG-1XIg;
	Tue, 29 Jul 2025 23:02:27 +0000
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugtEK-00000000Dje-3Kaf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Jul 2025 22:55:33 +0000
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-23ff063d087so26647015ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Jul 2025 15:55:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753829731; x=1754434531; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=rCpQGzwMKFK4ptMSW9GdDXyar1lj92zeXPJ/+yaFJX4=;
        b=MJjWWYxWQc91Sl42bAftxrWOEuU6f87mG7m86wXgYqA8bHaJvE2roJSU0doCRE0oM3
         tYec47TJeUoL5E8dPx/txuK51OQUVGLDIB/XARhH0ApKsHhJBSV9vx1zrCEDz0AcBDvq
         Cd8FSTYZjT1Z1NzcbhhhuCcl2sidbxGYucfUoQUwOKUlLHr8cVOUURyzfTfc1dZ0BZRk
         bhtWSUUNSjqDsRd+lyrIqwpmH/LxvOtWsw0lXaS5NeHAvVaRoW1HkNLg+x9dhSlaXS4n
         CHX5wTilplqPeL+b4C1rQe6rjDVnfcTiteFoeYzM4r+9bCDawSlC7FXwHm6jFuiAYOQR
         61ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753829731; x=1754434531;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rCpQGzwMKFK4ptMSW9GdDXyar1lj92zeXPJ/+yaFJX4=;
        b=gGsQsUBFWkKWlUPzHHPG8L8KIk3ZPtcv29oEwDqHnAgV0r+EN2gEXStlMzWLg63KTR
         d91TLuGOMOwCLo+FImcUXIF/1D32jOx95qH7cegN478ut0dgO68H7jOdm8VwmoeSDkQs
         uotcj53ATPcUmIbpkLQFrFpKN9N25tuSa4cdF49PbfGCzC9LM3AmJdy+DBpQQ5eiYEKF
         zXJnDKNfk42JyU36pPePJ+WNwDSZtZKIqIXxF4awA5Ex58XdviVJRmflR2VQzpr273Ge
         v8p8HOfPJ9cjmxFAEQzq1v4dK8V2hn8j9MqmqQKhQloCUNGVy3MDXwQ+bYhAb+Zepkgn
         gGkQ==
X-Forwarded-Encrypted: i=1; AJvYcCVQG9dKUYxwAR2kAU9ogJPmU/JU5GqOW6MDYAdo9gbWdHIaVoFGtOG4wd/jIatASj4lFgsN9hqdKOxe/qAT2CQ7@lists.infradead.org
X-Gm-Message-State: AOJu0YyjJu8cQ2bYsMI+fF3ozUWtAYpibQob6iW6JaiIGxDHygFIXW5B
	ImBBN6J33kbLiJ5p329rEPFc2Xeb7/jft1um8QN/COGRtMBKdMEq/ZZdsezo5Isc25J8FBvrA46
	d2Ao6Jg==
X-Google-Smtp-Source: AGHT+IFbj44B83iSbE5A+vqSrciKuaygxoH40sCo6SkWHfvt5hELe3GEpiiE21IydS3tBnU29mqnLgsJFnM=
X-Received: from pjbqa11.prod.google.com ([2002:a17:90b:4fcb:b0:31c:2fe4:33bd])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:2a8c:b0:23f:dc56:66e2
 with SMTP id d9443c01a7336-24096b2a372mr19186465ad.38.1753829731380; Tue, 29
 Jul 2025 15:55:31 -0700 (PDT)
Date: Tue, 29 Jul 2025 15:54:32 -0700
In-Reply-To: <20250729225455.670324-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250729225455.670324-1-seanjc@google.com>
X-Mailer: git-send-email 2.50.1.552.g942d659e1b-goog
Message-ID: <20250729225455.670324-2-seanjc@google.com>
Subject: [PATCH v17 01/24] KVM: Rename CONFIG_KVM_PRIVATE_MEM to CONFIG_KVM_GUEST_MEMFD
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Ira Weiny <ira.weiny@intel.com>, Gavin Shan <gshan@redhat.com>, Shivank Garg <shivankg@amd.com>, 
	Vlastimil Babka <vbabka@suse.cz>, Xiaoyao Li <xiaoyao.li@intel.com>, 
	David Hildenbrand <david@redhat.com>, Fuad Tabba <tabba@google.com>, 
	Ackerley Tng <ackerleytng@google.com>, Tao Chan <chentao@kylinos.cn>, 
	James Houghton <jthoughton@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250729_155532_837228_A9709CDF 
X-CRM114-Status: GOOD (  16.62  )
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

From: Fuad Tabba <tabba@google.com>

Rename the Kconfig option CONFIG_KVM_PRIVATE_MEM to
CONFIG_KVM_GUEST_MEMFD. The original name implied that the feature only
supported "private" memory. However, CONFIG_KVM_PRIVATE_MEM enables
guest_memfd in general, which is not exclusively for private memory.
Subsequent patches in this series will add guest_memfd support for
non-CoCo VMs, whose memory is not private.

Renaming the Kconfig option to CONFIG_KVM_GUEST_MEMFD more accurately
reflects its broader scope as the main Kconfig option for all
guest_memfd-backed memory. This provides clearer semantics for the
option and avoids confusion as new features are introduced.

Reviewed-by: Ira Weiny <ira.weiny@intel.com>
Reviewed-by: Gavin Shan <gshan@redhat.com>
Reviewed-by: Shivank Garg <shivankg@amd.com>
Reviewed-by: Vlastimil Babka <vbabka@suse.cz>
Reviewed-by: Xiaoyao Li <xiaoyao.li@intel.com>
Co-developed-by: David Hildenbrand <david@redhat.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Fuad Tabba <tabba@google.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/include/asm/kvm_host.h |  2 +-
 include/linux/kvm_host.h        | 14 +++++++-------
 virt/kvm/Kconfig                |  8 ++++----
 virt/kvm/Makefile.kvm           |  2 +-
 virt/kvm/kvm_main.c             |  4 ++--
 virt/kvm/kvm_mm.h               |  4 ++--
 6 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
index f19a76d3ca0e..7b0f2b3e492d 100644
--- a/arch/x86/include/asm/kvm_host.h
+++ b/arch/x86/include/asm/kvm_host.h
@@ -2276,7 +2276,7 @@ void kvm_configure_mmu(bool enable_tdp, int tdp_forced_root_level,
 		       int tdp_max_root_level, int tdp_huge_page_level);
 
 
-#ifdef CONFIG_KVM_PRIVATE_MEM
+#ifdef CONFIG_KVM_GUEST_MEMFD
 #define kvm_arch_has_private_mem(kvm) ((kvm)->arch.has_private_mem)
 #else
 #define kvm_arch_has_private_mem(kvm) false
diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 15656b7fba6c..8cdc0b3cc1b1 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -602,7 +602,7 @@ struct kvm_memory_slot {
 	short id;
 	u16 as_id;
 
-#ifdef CONFIG_KVM_PRIVATE_MEM
+#ifdef CONFIG_KVM_GUEST_MEMFD
 	struct {
 		/*
 		 * Writes protected by kvm->slots_lock.  Acquiring a
@@ -720,10 +720,10 @@ static inline int kvm_arch_vcpu_memslots_id(struct kvm_vcpu *vcpu)
 #endif
 
 /*
- * Arch code must define kvm_arch_has_private_mem if support for private memory
- * is enabled.
+ * Arch code must define kvm_arch_has_private_mem if support for guest_memfd is
+ * enabled.
  */
-#if !defined(kvm_arch_has_private_mem) && !IS_ENABLED(CONFIG_KVM_PRIVATE_MEM)
+#if !defined(kvm_arch_has_private_mem) && !IS_ENABLED(CONFIG_KVM_GUEST_MEMFD)
 static inline bool kvm_arch_has_private_mem(struct kvm *kvm)
 {
 	return false;
@@ -2505,7 +2505,7 @@ bool kvm_arch_post_set_memory_attributes(struct kvm *kvm,
 
 static inline bool kvm_mem_is_private(struct kvm *kvm, gfn_t gfn)
 {
-	return IS_ENABLED(CONFIG_KVM_PRIVATE_MEM) &&
+	return IS_ENABLED(CONFIG_KVM_GUEST_MEMFD) &&
 	       kvm_get_memory_attributes(kvm, gfn) & KVM_MEMORY_ATTRIBUTE_PRIVATE;
 }
 #else
@@ -2515,7 +2515,7 @@ static inline bool kvm_mem_is_private(struct kvm *kvm, gfn_t gfn)
 }
 #endif /* CONFIG_KVM_GENERIC_MEMORY_ATTRIBUTES */
 
-#ifdef CONFIG_KVM_PRIVATE_MEM
+#ifdef CONFIG_KVM_GUEST_MEMFD
 int kvm_gmem_get_pfn(struct kvm *kvm, struct kvm_memory_slot *slot,
 		     gfn_t gfn, kvm_pfn_t *pfn, struct page **page,
 		     int *max_order);
@@ -2528,7 +2528,7 @@ static inline int kvm_gmem_get_pfn(struct kvm *kvm,
 	KVM_BUG_ON(1, kvm);
 	return -EIO;
 }
-#endif /* CONFIG_KVM_PRIVATE_MEM */
+#endif /* CONFIG_KVM_GUEST_MEMFD */
 
 #ifdef CONFIG_HAVE_KVM_ARCH_GMEM_PREPARE
 int kvm_arch_gmem_prepare(struct kvm *kvm, gfn_t gfn, kvm_pfn_t pfn, int max_order);
diff --git a/virt/kvm/Kconfig b/virt/kvm/Kconfig
index 727b542074e7..e4b400feff94 100644
--- a/virt/kvm/Kconfig
+++ b/virt/kvm/Kconfig
@@ -112,19 +112,19 @@ config KVM_GENERIC_MEMORY_ATTRIBUTES
        depends on KVM_GENERIC_MMU_NOTIFIER
        bool
 
-config KVM_PRIVATE_MEM
+config KVM_GUEST_MEMFD
        select XARRAY_MULTI
        bool
 
 config KVM_GENERIC_PRIVATE_MEM
        select KVM_GENERIC_MEMORY_ATTRIBUTES
-       select KVM_PRIVATE_MEM
+       select KVM_GUEST_MEMFD
        bool
 
 config HAVE_KVM_ARCH_GMEM_PREPARE
        bool
-       depends on KVM_PRIVATE_MEM
+       depends on KVM_GUEST_MEMFD
 
 config HAVE_KVM_ARCH_GMEM_INVALIDATE
        bool
-       depends on KVM_PRIVATE_MEM
+       depends on KVM_GUEST_MEMFD
diff --git a/virt/kvm/Makefile.kvm b/virt/kvm/Makefile.kvm
index 724c89af78af..d047d4cf58c9 100644
--- a/virt/kvm/Makefile.kvm
+++ b/virt/kvm/Makefile.kvm
@@ -12,4 +12,4 @@ kvm-$(CONFIG_KVM_ASYNC_PF) += $(KVM)/async_pf.o
 kvm-$(CONFIG_HAVE_KVM_IRQ_ROUTING) += $(KVM)/irqchip.o
 kvm-$(CONFIG_HAVE_KVM_DIRTY_RING) += $(KVM)/dirty_ring.o
 kvm-$(CONFIG_HAVE_KVM_PFNCACHE) += $(KVM)/pfncache.o
-kvm-$(CONFIG_KVM_PRIVATE_MEM) += $(KVM)/guest_memfd.o
+kvm-$(CONFIG_KVM_GUEST_MEMFD) += $(KVM)/guest_memfd.o
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 6c07dd423458..25a94eed75fd 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -4915,7 +4915,7 @@ static int kvm_vm_ioctl_check_extension_generic(struct kvm *kvm, long arg)
 	case KVM_CAP_MEMORY_ATTRIBUTES:
 		return kvm_supported_mem_attributes(kvm);
 #endif
-#ifdef CONFIG_KVM_PRIVATE_MEM
+#ifdef CONFIG_KVM_GUEST_MEMFD
 	case KVM_CAP_GUEST_MEMFD:
 		return !kvm || kvm_arch_has_private_mem(kvm);
 #endif
@@ -5352,7 +5352,7 @@ static long kvm_vm_ioctl(struct file *filp,
 	case KVM_GET_STATS_FD:
 		r = kvm_vm_ioctl_get_stats_fd(kvm);
 		break;
-#ifdef CONFIG_KVM_PRIVATE_MEM
+#ifdef CONFIG_KVM_GUEST_MEMFD
 	case KVM_CREATE_GUEST_MEMFD: {
 		struct kvm_create_guest_memfd guest_memfd;
 
diff --git a/virt/kvm/kvm_mm.h b/virt/kvm/kvm_mm.h
index acef3f5c582a..31defb08ccba 100644
--- a/virt/kvm/kvm_mm.h
+++ b/virt/kvm/kvm_mm.h
@@ -67,7 +67,7 @@ static inline void gfn_to_pfn_cache_invalidate_start(struct kvm *kvm,
 }
 #endif /* HAVE_KVM_PFNCACHE */
 
-#ifdef CONFIG_KVM_PRIVATE_MEM
+#ifdef CONFIG_KVM_GUEST_MEMFD
 void kvm_gmem_init(struct module *module);
 int kvm_gmem_create(struct kvm *kvm, struct kvm_create_guest_memfd *args);
 int kvm_gmem_bind(struct kvm *kvm, struct kvm_memory_slot *slot,
@@ -91,6 +91,6 @@ static inline void kvm_gmem_unbind(struct kvm_memory_slot *slot)
 {
 	WARN_ON_ONCE(1);
 }
-#endif /* CONFIG_KVM_PRIVATE_MEM */
+#endif /* CONFIG_KVM_GUEST_MEMFD */
 
 #endif /* __KVM_MM_H__ */
-- 
2.50.1.552.g942d659e1b-goog


