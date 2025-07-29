Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06458C87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Jul 2025 23:52:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CDh3a2mKi2563DqkffKvhXA2J/RouDXBIlWaKp9FKZM=; b=0D+CxwZSTF6Vz23hTI/MXcTpyU
	m2vCiK0dSdI0WogXSxSk5Usk4f3N5cF6eyotpQwmtUX1W9QmlJ6ZAH5tVuAbeRuDKoSNcncY89Z9M
	ATBqMEiVf+gOmF/cZ4yhG/VPRC1IyWcOeZlE61y42IArBEIoaR9DReB7cNG8oGCWac3VntSu7dFnN
	ny4ARtLEAmHVV8q1MiyM4hX9TsB73EemfDYD47HSXikrDwP9Yj5kFbHFSy2CRKwUBd7Arbg4vV59/
	Id6n+F98Si4mN12ECiudvrCkulJ+yV8L2PASsQRH95BZJF5BemJOM+N/o4BeSEaxB4YcoDQIw5N3g
	sC7secxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugu7g-00000000Kqs-0VQD;
	Tue, 29 Jul 2025 23:52:44 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugtEu-00000000Dvu-24cf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Jul 2025 22:56:09 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-313c3915345so9489238a91.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Jul 2025 15:56:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753829767; x=1754434567; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=CDh3a2mKi2563DqkffKvhXA2J/RouDXBIlWaKp9FKZM=;
        b=1dLCQz/h38ErTVhcoy3IME2FptqwAAjDGlTnjhAVfCafBb26QRVOJxqPIqd95Sybjn
         nL8XToP9xu5WEm5NVP/Pi8yWZfa7Xoi6Lv2mOvPms/7fLg1I7QIl8NaYUeMvVBt/tG5v
         0ARr0UiXUDSbdLQBLGOSOAOQ83fGsDlH0qNpKVjwfhypSkza8+MPvJ1hfhbCBf6p3DhE
         qq/ZLlbLpizI8W/a+xvEPNRzgfKAARpjXogElA+a609flFbcyzpvtSO9TxpKoXlMKmae
         vtJgJAepWJbB1TFCQI8bXuyOY1FP22uZgCcZl2a5PD05+/K/HjZ9y8DTRPPMdikG83qF
         H4Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753829767; x=1754434567;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CDh3a2mKi2563DqkffKvhXA2J/RouDXBIlWaKp9FKZM=;
        b=HRZOTiJHGcy3xpy0zoctY+UP4oMJpGGXpF0WOvx0ZlDyfVzS0iorThy32nx7TBFBvI
         yvsFVBqxb3zt9hA7jS/jJbj0uYN4tW0PzBUozbme9cuFaaSmWcMtWNuMIOX5xLx8dXE/
         x4YlEnUZrUudC+Sbqk+c+Xy09Ret2hciWRWEHWJ65n8nPjVRxyWuTufb95tAg5Fl5+uW
         NJ84NTL5k/17dPZbpE3stuwr4uifQXTQfBE9hJ0wpZuU6WfB9g9a2El9q28TN3iq93vT
         U3UQzONgz51kxc4wJe6xfayfGuj7FnWZUcR1o0pu4aBo3FWlx3/tGktqQDL1uxLc7SoC
         q+BA==
X-Forwarded-Encrypted: i=1; AJvYcCWkT4nTont+L/LuMzRyhZr1HDTczaMM/fKfn29PYPduL06+iZ8IGSv4J5Nc9L9mZm5vHGgZmW+Oh5UKJ4gzZhGN@lists.infradead.org
X-Gm-Message-State: AOJu0YxAmZUReBb9t6ihs9UNQrfLQW1aVhpLnUqwyItKHtqNmmBWd0n1
	UwrOHS7KeCfx1F/erb/eqP8J1AqGbMpAGZG00UreB/qOwL7i+uSH7z3lZbQ0TFl0FUTphSnyfc4
	9FFucvA==
X-Google-Smtp-Source: AGHT+IHC3uJKuTdSzXOEtHPqlvC+coV4BnnQv6uc7mWxcOspxNE/dt4wFfxxPGUhBzxbDLgfuxcg7hNN5F0=
X-Received: from pjg6.prod.google.com ([2002:a17:90b:3f46:b0:31c:bd1d:516])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4a81:b0:31f:210d:2e56
 with SMTP id 98e67ed59e1d1-31f5de557femr1551448a91.28.1753829767333; Tue, 29
 Jul 2025 15:56:07 -0700 (PDT)
Date: Tue, 29 Jul 2025 15:54:52 -0700
In-Reply-To: <20250729225455.670324-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250729225455.670324-1-seanjc@google.com>
X-Mailer: git-send-email 2.50.1.552.g942d659e1b-goog
Message-ID: <20250729225455.670324-22-seanjc@google.com>
Subject: [PATCH v17 21/24] KVM: Allow and advertise support for host mmap() on
 guest_memfd files
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
X-CRM114-CacheID: sfid-20250729_155608_538517_185343B9 
X-CRM114-Status: GOOD (  14.95  )
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

Now that all the x86 and arm64 plumbing for mmap() on guest_memfd is in
place, allow userspace to set GUEST_MEMFD_FLAG_MMAP and advertise support
via a new capability, KVM_CAP_GUEST_MEMFD_MMAP.

The availability of this capability is determined per architecture, and
its enablement for a specific guest_memfd instance is controlled by the
GUEST_MEMFD_FLAG_MMAP flag at creation time.

Update the KVM API documentation to detail the KVM_CAP_GUEST_MEMFD_MMAP
capability, the associated GUEST_MEMFD_FLAG_MMAP, and provide essential
information regarding support for mmap in guest_memfd.

Reviewed-by: David Hildenbrand <david@redhat.com>
Reviewed-by: Gavin Shan <gshan@redhat.com>
Reviewed-by: Shivank Garg <shivankg@amd.com>
Reviewed-by: Xiaoyao Li <xiaoyao.li@intel.com>
Signed-off-by: Fuad Tabba <tabba@google.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 Documentation/virt/kvm/api.rst | 9 +++++++++
 include/uapi/linux/kvm.h       | 2 ++
 virt/kvm/guest_memfd.c         | 7 ++++++-
 virt/kvm/kvm_main.c            | 2 ++
 4 files changed, 19 insertions(+), 1 deletion(-)

diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
index fcb783735dd1..1e0c4a68876d 100644
--- a/Documentation/virt/kvm/api.rst
+++ b/Documentation/virt/kvm/api.rst
@@ -6414,6 +6414,15 @@ most one mapping per page, i.e. binding multiple memory regions to a single
 guest_memfd range is not allowed (any number of memory regions can be bound to
 a single guest_memfd file, but the bound ranges must not overlap).
 
+When the capability KVM_CAP_GUEST_MEMFD_MMAP is supported, the 'flags' field
+supports GUEST_MEMFD_FLAG_MMAP.  Setting this flag on guest_memfd creation
+enables mmap() and faulting of guest_memfd memory to host userspace.
+
+When the KVM MMU performs a PFN lookup to service a guest fault and the backing
+guest_memfd has the GUEST_MEMFD_FLAG_MMAP set, then the fault will always be
+consumed from guest_memfd, regardless of whether it is a shared or a private
+fault.
+
 See KVM_SET_USER_MEMORY_REGION2 for additional details.
 
 4.143 KVM_PRE_FAULT_MEMORY
diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
index aeb2ca10b190..0d96d2ae6e5d 100644
--- a/include/uapi/linux/kvm.h
+++ b/include/uapi/linux/kvm.h
@@ -961,6 +961,7 @@ struct kvm_enable_cap {
 #define KVM_CAP_ARM_EL2 240
 #define KVM_CAP_ARM_EL2_E2H0 241
 #define KVM_CAP_RISCV_MP_STATE_RESET 242
+#define KVM_CAP_GUEST_MEMFD_MMAP 243
 
 struct kvm_irq_routing_irqchip {
 	__u32 irqchip;
@@ -1597,6 +1598,7 @@ struct kvm_memory_attributes {
 #define KVM_MEMORY_ATTRIBUTE_PRIVATE           (1ULL << 3)
 
 #define KVM_CREATE_GUEST_MEMFD	_IOWR(KVMIO,  0xd4, struct kvm_create_guest_memfd)
+#define GUEST_MEMFD_FLAG_MMAP	(1ULL << 0)
 
 struct kvm_create_guest_memfd {
 	__u64 size;
diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
index d5b445548af4..08a6bc7d25b6 100644
--- a/virt/kvm/guest_memfd.c
+++ b/virt/kvm/guest_memfd.c
@@ -314,7 +314,9 @@ static pgoff_t kvm_gmem_get_index(struct kvm_memory_slot *slot, gfn_t gfn)
 
 static bool kvm_gmem_supports_mmap(struct inode *inode)
 {
-	return false;
+	const u64 flags = (u64)inode->i_private;
+
+	return flags & GUEST_MEMFD_FLAG_MMAP;
 }
 
 static vm_fault_t kvm_gmem_fault_user_mapping(struct vm_fault *vmf)
@@ -522,6 +524,9 @@ int kvm_gmem_create(struct kvm *kvm, struct kvm_create_guest_memfd *args)
 	u64 flags = args->flags;
 	u64 valid_flags = 0;
 
+	if (kvm_arch_supports_gmem_mmap(kvm))
+		valid_flags |= GUEST_MEMFD_FLAG_MMAP;
+
 	if (flags & ~valid_flags)
 		return -EINVAL;
 
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 4f57cb92e109..18f29ef93543 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -4918,6 +4918,8 @@ static int kvm_vm_ioctl_check_extension_generic(struct kvm *kvm, long arg)
 #ifdef CONFIG_KVM_GUEST_MEMFD
 	case KVM_CAP_GUEST_MEMFD:
 		return 1;
+	case KVM_CAP_GUEST_MEMFD_MMAP:
+		return !kvm || kvm_arch_supports_gmem_mmap(kvm);
 #endif
 	default:
 		break;
-- 
2.50.1.552.g942d659e1b-goog


