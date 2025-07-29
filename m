Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D23FCC87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Jul 2025 23:15:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FhtpXawluoN1TztYZndQOy+flGIHfIQx6Vy9IgjwFIs=; b=dUXFKHXJlkekDLHsgJSXkalgwG
	dRRkxCjXEYU8CMKnN+dama8lbY6ZdCDi7h+ZokFzX/Rr3jukkNz/foQAENMbAGEk0Uhri/BDFJciS
	nbN+PGQZB+oQJGfCqu8OcPcEG+19Gk10ef5j6oocv6BUOgQ4By93pynfts1ZANercQqMhUfdm0GEK
	bgnnZBKi0xSJ2ufVMqRB7zaAWpiwe6DmRhBQNX0g2Ew808bIrev5jP+OGB98Ru0sv0WKteP4VA/c8
	uqeBdPoA8mS/K4GywONRCt5TTH9B2kRYJEWkbx9171tDliDko/QI7PEftsFOcWJYOvz6ZM790iBPq
	HBvYoBaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugtXA-00000000Gtc-1FsR;
	Tue, 29 Jul 2025 23:15:00 +0000
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugtET-00000000DlK-1jJC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Jul 2025 22:55:43 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-315af08594fso5956887a91.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Jul 2025 15:55:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753829740; x=1754434540; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=FhtpXawluoN1TztYZndQOy+flGIHfIQx6Vy9IgjwFIs=;
        b=Jlcs5qL/r3uTPMX0Z/XE3m2cydfWjFz6FUSiynfBs4UBtEOu/YTuAt04bbYplSk9KU
         7QW5vLNCDcGgeCJMJuicZfHuTDsJNLCeTNkZr1KfSqFpvf1I+5JBrUrNDlnFi4h3Yiny
         VYjp7YPUPIqHlur0v2nvfna7PV3lzL9ChMv3GwThPUoZ9rcuby6Kib8Sdq/EIwCgKGRu
         0XB97X93GReLkfxV3yCa7dhPnBp27ZVqUeffBiwO2U/GQonZmXgSnGaMV1TxQyCJiigc
         a0mrtdosVvDQV1ocg/pXDm9WmUvcHMkElE6zVumRMiSvOBaD+BaKt9AcyDmzrcwr0jF8
         penA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753829740; x=1754434540;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FhtpXawluoN1TztYZndQOy+flGIHfIQx6Vy9IgjwFIs=;
        b=vskHTPojUJKF3haZNcn7BlKBeMa3Zu4dpBE5KhTT7pWYuIi9+0JGqb+xVqGrROL3j7
         sApv2dAaJgXkjus9YDEkPG2fPmOq5B0wj4GqXhpiekrnkZO0DG6DzZXTN8HKENS2vsF1
         6Z7y0iC+xsAmK0r2OaUv2PlnrO3aFfpnpiBm4p1e2GyG6y+HHXtdims7T/jFlvBOTbu9
         JfuFlxBXTbEHK/pIZrV5mBerCPF+22dB+PLcmlYIejVWF6ZsIsfwg5xB/YqyTCla7fGR
         zrasUzY5OT62fwiqtpMB+iVNs78zjhPF3BuEQ6OgIsXRaKBpt7FOdp2BEkbmTiG/L9hG
         hJvQ==
X-Forwarded-Encrypted: i=1; AJvYcCWLvRXF0qsvr7wHqgKrx4ogOowyiMCo0OAl/xBOXeQ+405aVxE/4y07ATvdAq65qdUEXPkTbmvENKN9iIRTRyxo@lists.infradead.org
X-Gm-Message-State: AOJu0YwnxVPv9k0yROumwqhnn7T2tQerq6Jg+cHfyd2tZ2jigRvWhM1a
	W8qP6z8HTX51dKK/uvGBRNv2ecMudHiiEgXQTl/JvywH0YZlR3ZpmB5cGYJdHu/+6bJsqT2qX8z
	ZFVdR1w==
X-Google-Smtp-Source: AGHT+IHVaYv0c9Xo7sfmO9HlXWVUgQ/03BKk+znZ6UuFoh4T2PuODk3nkbH2GWjiFHs5USAjAtpb3fE9ROQ=
X-Received: from pjbtc16.prod.google.com ([2002:a17:90b:5410:b0:31f:335d:342d])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90a:e7ca:b0:31f:150:e045
 with SMTP id 98e67ed59e1d1-31f5de942f7mr1332792a91.32.1753829740086; Tue, 29
 Jul 2025 15:55:40 -0700 (PDT)
Date: Tue, 29 Jul 2025 15:54:37 -0700
In-Reply-To: <20250729225455.670324-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250729225455.670324-1-seanjc@google.com>
X-Mailer: git-send-email 2.50.1.552.g942d659e1b-goog
Message-ID: <20250729225455.670324-7-seanjc@google.com>
Subject: [PATCH v17 06/24] KVM: Rename kvm_slot_can_be_private() to kvm_slot_has_gmem()
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
X-CRM114-CacheID: sfid-20250729_155541_451566_73DBB7FB 
X-CRM114-Status: GOOD (  15.01  )
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

Rename kvm_slot_can_be_private() to kvm_slot_has_gmem() to improve
clarity and accurately reflect its purpose.

The function kvm_slot_can_be_private() was previously used to check if a
given kvm_memory_slot is backed by guest_memfd. However, its name
implied that the memory in such a slot was exclusively "private".

As guest_memfd support expands to include non-private memory (e.g.,
shared host mappings), it's important to remove this association. The
new name, kvm_slot_has_gmem(), states that the slot is backed by
guest_memfd without making assumptions about the memory's privacy
attributes.

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
 arch/x86/kvm/mmu/mmu.c   | 4 ++--
 arch/x86/kvm/svm/sev.c   | 4 ++--
 include/linux/kvm_host.h | 2 +-
 virt/kvm/guest_memfd.c   | 2 +-
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index 6e838cb6c9e1..fdc2824755ee 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -3312,7 +3312,7 @@ static int __kvm_mmu_max_mapping_level(struct kvm *kvm,
 int kvm_mmu_max_mapping_level(struct kvm *kvm,
 			      const struct kvm_memory_slot *slot, gfn_t gfn)
 {
-	bool is_private = kvm_slot_can_be_private(slot) &&
+	bool is_private = kvm_slot_has_gmem(slot) &&
 			  kvm_mem_is_private(kvm, gfn);
 
 	return __kvm_mmu_max_mapping_level(kvm, slot, gfn, PG_LEVEL_NUM, is_private);
@@ -4551,7 +4551,7 @@ static int kvm_mmu_faultin_pfn_private(struct kvm_vcpu *vcpu,
 {
 	int max_order, r;
 
-	if (!kvm_slot_can_be_private(fault->slot)) {
+	if (!kvm_slot_has_gmem(fault->slot)) {
 		kvm_mmu_prepare_memory_fault_exit(vcpu, fault);
 		return -EFAULT;
 	}
diff --git a/arch/x86/kvm/svm/sev.c b/arch/x86/kvm/svm/sev.c
index 2fbdebf79fbb..7744c210f947 100644
--- a/arch/x86/kvm/svm/sev.c
+++ b/arch/x86/kvm/svm/sev.c
@@ -2365,7 +2365,7 @@ static int snp_launch_update(struct kvm *kvm, struct kvm_sev_cmd *argp)
 	mutex_lock(&kvm->slots_lock);
 
 	memslot = gfn_to_memslot(kvm, params.gfn_start);
-	if (!kvm_slot_can_be_private(memslot)) {
+	if (!kvm_slot_has_gmem(memslot)) {
 		ret = -EINVAL;
 		goto out;
 	}
@@ -4719,7 +4719,7 @@ void sev_handle_rmp_fault(struct kvm_vcpu *vcpu, gpa_t gpa, u64 error_code)
 	}
 
 	slot = gfn_to_memslot(kvm, gfn);
-	if (!kvm_slot_can_be_private(slot)) {
+	if (!kvm_slot_has_gmem(slot)) {
 		pr_warn_ratelimited("SEV: Unexpected RMP fault, non-private slot for GPA 0x%llx\n",
 				    gpa);
 		return;
diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index ddfb6cfe20a6..4c5e0a898652 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -615,7 +615,7 @@ struct kvm_memory_slot {
 #endif
 };
 
-static inline bool kvm_slot_can_be_private(const struct kvm_memory_slot *slot)
+static inline bool kvm_slot_has_gmem(const struct kvm_memory_slot *slot)
 {
 	return slot && (slot->flags & KVM_MEM_GUEST_MEMFD);
 }
diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
index b2b50560e80e..a99e11b8b77f 100644
--- a/virt/kvm/guest_memfd.c
+++ b/virt/kvm/guest_memfd.c
@@ -643,7 +643,7 @@ long kvm_gmem_populate(struct kvm *kvm, gfn_t start_gfn, void __user *src, long
 		return -EINVAL;
 
 	slot = gfn_to_memslot(kvm, start_gfn);
-	if (!kvm_slot_can_be_private(slot))
+	if (!kvm_slot_has_gmem(slot))
 		return -EINVAL;
 
 	file = kvm_gmem_get_file(slot);
-- 
2.50.1.552.g942d659e1b-goog


