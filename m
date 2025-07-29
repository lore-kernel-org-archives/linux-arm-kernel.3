Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3866CC87FC9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Jul 2025 23:35:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kH3lIGBMPWx+0VjPwRSayAsLHYbwZQBu+Y2sAmKiiP4=; b=ncLwce/9qkyor+OTzGcgZhBdQO
	PphyjXnV3BJukB5vj6RP9znSmJD5tdzC034jP33ZTteiIt5bkQCyt/mzXVSEOucUh4foxSWQt3QmO
	fSbzKlC0K+o7mLcRAbvwubWswZGLc8B3pYgCRkdm7XjbsT6qCChOBI2uxsP8D+IeJmN9Iu3Y0Sa8m
	S9sES75sFSfrDixyznfDCEn0LkzoqeE8MdqRrBESU/JiPeMlfhRyMO3e5phs7iQJyXtUWgPpZBzgt
	++Q/cARmVMRdNuP+Ozhw2piyehLujN9gw5Gbh0eOLmYbamoEDepYXjxe3fH1hOVmK1vVSkL3HldZQ
	21rgM6fQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugtqe-00000000JH6-2JXJ;
	Tue, 29 Jul 2025 23:35:08 +0000
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugtEi-00000000Drm-43gY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Jul 2025 22:55:58 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-31ea14cc097so3157123a91.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Jul 2025 15:55:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753829756; x=1754434556; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=kH3lIGBMPWx+0VjPwRSayAsLHYbwZQBu+Y2sAmKiiP4=;
        b=vBvxqlXikZ4eGy2joJrhN8BIv55v167j0Zgl4iSyzU02Sddma9cEjTaN4799Ts74Kj
         bBqpd5Cy+/aZyWFEDIfRzM4RtpCi4BJCemBF7ouM9gBtYSgLyWYe+zJtWbgpVQ4ZHyt5
         XKVNVImEZrdh/s7AP6sia7IwZ0KTu0OdwvmUcNINzneWJkKfOwWB7UXZWyJM6btHnNFE
         +FOywr/CvSVYU/2XDT1yYvYPiCDbqQr7aCG9auDLOtHLObput/lOfKcVALYvn3XP5Svv
         3elQcc5mhG8BPTUwa7P0yL4StqrRGSQayfw4mzF4xVzfRhLvHlKpr1VyXGRiTkI7jywX
         wctw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753829756; x=1754434556;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kH3lIGBMPWx+0VjPwRSayAsLHYbwZQBu+Y2sAmKiiP4=;
        b=RwedpW9Rm8ISVoeYwf13UvM+aYRmdxwthPe0kwgLZZV/XNTI9mP+f4860Y8E978hgS
         4Jler+mVNE5cURJ+7u1B3Sls3Iw2AwKO/K2eWHQpLzZTfEH1rFdUGdhdc9ZLy98+YfJr
         wCFboj0IrctLqR4csPxCZ6/INGm9Mu3trARvaveFXKq2BNiMgBbmioGgdUZxy0V4h+6B
         TBqx/qSFH1GdWe1EZA+LSgfoJSBCIdK5pzcXogdybAMlXjxSENAwPIC74CxfqLuCQy6p
         7R9DTJQbjxTELBzbnjflgrSx5kn/RuXk8b7osA10aH5/OeX63HsexGm3A8q+1h6BUy+G
         VaGw==
X-Forwarded-Encrypted: i=1; AJvYcCXaOG2lysAz7sKv9+sSMir7+F9f725xl1QbuZjDVMyYBtBxpkQvOH+gNr/AqYUmd1zlse1whzJ+9j3wW007xP6+@lists.infradead.org
X-Gm-Message-State: AOJu0Yxn3NCjtYvH4G7P28bvCcC/NhtsO0LK24NpkUoyH9d2p5IBbZ84
	n9LOL9vdwGDHT9o9+v02N4aBFU6eXWzKAMWd085YLC9yaRCxGbqPGnzjtxwtiThzXB55cNrSXUt
	hMshS1Q==
X-Google-Smtp-Source: AGHT+IGMilmlssFh4A4OjE5SWFJtANR4cHsVfEy8j5cTH/DcRDgidwnFJoQ2SdFwASXkQExBVaCY8392ed0=
X-Received: from pjxx5.prod.google.com ([2002:a17:90b:58c5:b0:31c:38fb:2958])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2407:b0:31e:ec02:2297
 with SMTP id 98e67ed59e1d1-31f5de2d582mr1162821a91.19.1753829755668; Tue, 29
 Jul 2025 15:55:55 -0700 (PDT)
Date: Tue, 29 Jul 2025 15:54:45 -0700
In-Reply-To: <20250729225455.670324-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250729225455.670324-1-seanjc@google.com>
X-Mailer: git-send-email 2.50.1.552.g942d659e1b-goog
Message-ID: <20250729225455.670324-15-seanjc@google.com>
Subject: [PATCH v17 14/24] KVM: x86/mmu: Enforce guest_memfd's max order when
 recovering hugepages
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
X-CRM114-CacheID: sfid-20250729_155557_006818_0380BAC0 
X-CRM114-Status: GOOD (  20.64  )
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

Rework kvm_mmu_max_mapping_level() to provide the plumbing to consult
guest_memfd (and relevant vendor code) when recovering hugepages, e.g.
after disabling live migration.  The flaw has existed since guest_memfd was
originally added, but has gone unnoticed due to lack of guest_memfd support
for hugepages or dirty logging.

Don't actually call into guest_memfd at this time, as it's unclear as to
what the API should be.  Ideally, KVM would simply use kvm_gmem_get_pfn(),
but invoking kvm_gmem_get_pfn() would lead to sleeping in atomic context
if guest_memfd needed to allocate memory (mmu_lock is held).  Luckily,
the path isn't actually reachable, so just add a TODO and WARN to ensure
the functionality is added alongisde guest_memfd hugepage support, and
punt the guest_memfd API design question to the future.

Note, calling kvm_mem_is_private() in the non-fault path is safe, so long
as mmu_lock is held, as hugepage recovery operates on shadow-present SPTEs,
i.e. calling kvm_mmu_max_mapping_level() with @fault=NULL is mutually
exclusive with kvm_vm_set_mem_attributes() changing the PRIVATE attribute
of the gfn.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/mmu/mmu.c          | 82 +++++++++++++++++++--------------
 arch/x86/kvm/mmu/mmu_internal.h |  2 +-
 arch/x86/kvm/mmu/tdp_mmu.c      |  2 +-
 3 files changed, 49 insertions(+), 37 deletions(-)

diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index 20dd9f64156e..61eb9f723675 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -3302,31 +3302,54 @@ static u8 kvm_max_level_for_order(int order)
 	return PG_LEVEL_4K;
 }
 
-static u8 kvm_max_private_mapping_level(struct kvm *kvm, kvm_pfn_t pfn,
-					u8 max_level, int gmem_order)
+static u8 kvm_max_private_mapping_level(struct kvm *kvm, struct kvm_page_fault *fault,
+					const struct kvm_memory_slot *slot, gfn_t gfn)
 {
-	u8 req_max_level;
+	u8 max_level, coco_level;
+	kvm_pfn_t pfn;
 
-	if (max_level == PG_LEVEL_4K)
-		return PG_LEVEL_4K;
+	/* For faults, use the gmem information that was resolved earlier. */
+	if (fault) {
+		pfn = fault->pfn;
+		max_level = fault->max_level;
+	} else {
+		/* TODO: Call into guest_memfd once hugepages are supported. */
+		WARN_ONCE(1, "Get pfn+order from guest_memfd");
+		pfn = KVM_PFN_ERR_FAULT;
+		max_level = PG_LEVEL_4K;
+	}
 
-	max_level = min(kvm_max_level_for_order(gmem_order), max_level);
 	if (max_level == PG_LEVEL_4K)
-		return PG_LEVEL_4K;
+		return max_level;
 
-	req_max_level = kvm_x86_call(gmem_max_mapping_level)(kvm, pfn);
-	if (req_max_level)
-		max_level = min(max_level, req_max_level);
+	/*
+	 * CoCo may influence the max mapping level, e.g. due to RMP or S-EPT
+	 * restrictions.  A return of '0' means "no additional restrictions", to
+	 * allow for using an optional "ret0" static call.
+	 */
+	coco_level = kvm_x86_call(gmem_max_mapping_level)(kvm, pfn);
+	if (coco_level)
+		max_level = min(max_level, coco_level);
 
 	return max_level;
 }
 
-static int __kvm_mmu_max_mapping_level(struct kvm *kvm,
-				       const struct kvm_memory_slot *slot,
-				       gfn_t gfn, int max_level, bool is_private)
+int kvm_mmu_max_mapping_level(struct kvm *kvm, struct kvm_page_fault *fault,
+			      const struct kvm_memory_slot *slot, gfn_t gfn)
 {
 	struct kvm_lpage_info *linfo;
-	int host_level;
+	int host_level, max_level;
+	bool is_private;
+
+	lockdep_assert_held(&kvm->mmu_lock);
+
+	if (fault) {
+		max_level = fault->max_level;
+		is_private = fault->is_private;
+	} else {
+		max_level = PG_LEVEL_NUM;
+		is_private = kvm_mem_is_private(kvm, gfn);
+	}
 
 	max_level = min(max_level, max_huge_page_level);
 	for ( ; max_level > PG_LEVEL_4K; max_level--) {
@@ -3335,25 +3358,16 @@ static int __kvm_mmu_max_mapping_level(struct kvm *kvm,
 			break;
 	}
 
+	if (max_level == PG_LEVEL_4K)
+		return PG_LEVEL_4K;
+
 	if (is_private)
-		return max_level;
-
-	if (max_level == PG_LEVEL_4K)
-		return PG_LEVEL_4K;
-
-	host_level = host_pfn_mapping_level(kvm, gfn, slot);
+		host_level = kvm_max_private_mapping_level(kvm, fault, slot, gfn);
+	else
+		host_level = host_pfn_mapping_level(kvm, gfn, slot);
 	return min(host_level, max_level);
 }
 
-int kvm_mmu_max_mapping_level(struct kvm *kvm,
-			      const struct kvm_memory_slot *slot, gfn_t gfn)
-{
-	bool is_private = kvm_slot_has_gmem(slot) &&
-			  kvm_mem_is_private(kvm, gfn);
-
-	return __kvm_mmu_max_mapping_level(kvm, slot, gfn, PG_LEVEL_NUM, is_private);
-}
-
 void kvm_mmu_hugepage_adjust(struct kvm_vcpu *vcpu, struct kvm_page_fault *fault)
 {
 	struct kvm_memory_slot *slot = fault->slot;
@@ -3374,9 +3388,8 @@ void kvm_mmu_hugepage_adjust(struct kvm_vcpu *vcpu, struct kvm_page_fault *fault
 	 * Enforce the iTLB multihit workaround after capturing the requested
 	 * level, which will be used to do precise, accurate accounting.
 	 */
-	fault->req_level = __kvm_mmu_max_mapping_level(vcpu->kvm, slot,
-						       fault->gfn, fault->max_level,
-						       fault->is_private);
+	fault->req_level = kvm_mmu_max_mapping_level(vcpu->kvm, fault,
+						     fault->slot, fault->gfn);
 	if (fault->req_level == PG_LEVEL_4K || fault->huge_page_disallowed)
 		return;
 
@@ -4564,8 +4577,7 @@ static int kvm_mmu_faultin_pfn_private(struct kvm_vcpu *vcpu,
 	}
 
 	fault->map_writable = !(fault->slot->flags & KVM_MEM_READONLY);
-	fault->max_level = kvm_max_private_mapping_level(vcpu->kvm, fault->pfn,
-							 fault->max_level, max_order);
+	fault->max_level = kvm_max_level_for_order(max_order);
 
 	return RET_PF_CONTINUE;
 }
@@ -7165,7 +7177,7 @@ static bool kvm_mmu_zap_collapsible_spte(struct kvm *kvm,
 		 * mapping if the indirect sp has level = 1.
 		 */
 		if (sp->role.direct &&
-		    sp->role.level < kvm_mmu_max_mapping_level(kvm, slot, sp->gfn)) {
+		    sp->role.level < kvm_mmu_max_mapping_level(kvm, NULL, slot, sp->gfn)) {
 			kvm_zap_one_rmap_spte(kvm, rmap_head, sptep);
 
 			if (kvm_available_flush_remote_tlbs_range())
diff --git a/arch/x86/kvm/mmu/mmu_internal.h b/arch/x86/kvm/mmu/mmu_internal.h
index 65f3c89d7c5d..b776be783a2f 100644
--- a/arch/x86/kvm/mmu/mmu_internal.h
+++ b/arch/x86/kvm/mmu/mmu_internal.h
@@ -411,7 +411,7 @@ static inline int kvm_mmu_do_page_fault(struct kvm_vcpu *vcpu, gpa_t cr2_or_gpa,
 	return r;
 }
 
-int kvm_mmu_max_mapping_level(struct kvm *kvm,
+int kvm_mmu_max_mapping_level(struct kvm *kvm, struct kvm_page_fault *fault,
 			      const struct kvm_memory_slot *slot, gfn_t gfn);
 void kvm_mmu_hugepage_adjust(struct kvm_vcpu *vcpu, struct kvm_page_fault *fault);
 void disallowed_hugepage_adjust(struct kvm_page_fault *fault, u64 spte, int cur_level);
diff --git a/arch/x86/kvm/mmu/tdp_mmu.c b/arch/x86/kvm/mmu/tdp_mmu.c
index 7f3d7229b2c1..740cb06accdb 100644
--- a/arch/x86/kvm/mmu/tdp_mmu.c
+++ b/arch/x86/kvm/mmu/tdp_mmu.c
@@ -1813,7 +1813,7 @@ static void recover_huge_pages_range(struct kvm *kvm,
 		if (iter.gfn < start || iter.gfn >= end)
 			continue;
 
-		max_mapping_level = kvm_mmu_max_mapping_level(kvm, slot, iter.gfn);
+		max_mapping_level = kvm_mmu_max_mapping_level(kvm, NULL, slot, iter.gfn);
 		if (max_mapping_level < iter.level)
 			continue;
 
-- 
2.50.1.552.g942d659e1b-goog


