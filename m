Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48AC3C5518F
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 10:12:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CBRFHYOL2ugysE5dNDzIh6xnN0zoWtq/Z1MnD4d5fkU=; b=WQqZ7Ex0vfmbSnN44s0xE3cdUC
	1BxXDMGL7FgZP669k6rrIVUbwW92DLoen/xOI0Fz1PbvK8o7d8q2wDyeFtQZRdW5YRcIy8OyGGSX5
	7ZVQfMk61mE8/H4pPDp0d3CfKb/iTTm9zpAMMzMeJHfVPecJ9FVWp6Fhkph+G3q+9L70kEQhwk32e
	OXYt/gEuJ+BbFbh+gbZyFWoSZYeFSCE3WYsT5LEZ55KtVU4UEj4/5vzM5K55uMQcIO5j8KPohiqtX
	OQiVmowEnRh1v23Pdf/vXBms2JxBbo1HE8tSNnwflZd9vyLnqcInkWQlY/aU/CREDBv+4MjnP6ZZo
	payFAWLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqpdh-0000000GnOR-4C3G;
	Mon, 03 Aug 2026 10:11:22 +0000
Received: from mail-ed1-x548.google.com ([2a00:1450:4864:20::548])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqpdf-0000000GnFa-2b7Q
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 10:11:21 +0000
Received: by mail-ed1-x548.google.com with SMTP id 4fb4d7f45d1cf-6a0a4f0e0cbso2499958a12.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Aug 2026 03:11:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785751877; x=1786356677; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CBRFHYOL2ugysE5dNDzIh6xnN0zoWtq/Z1MnD4d5fkU=;
        b=ME7acyxYDEYc79EmhL+UVT8qpddgJKqjVqZrzOofuBABgWKM+aUxpl+mM4n/iZN3kn
         jO82PuBW2/k+AzMpjHF6+kAq3d5+vPIlCxiq/w7G3SVYoQoVTm1n2JxBowGIDd3cuOmS
         sD0I0UpvG/h6bPEAZxXAwNX+UNjaL4w2BVOGw2kEHx/PBFccnOZuK0apcofm6rG9hWgD
         /KDhT549PdCy61zialnvsWznfVtftxHthJB3aq0PU4n2owxu04Sw7vxBA1JhM6sXCksG
         ri6n4MaweMRQhb6N3RAmcbXqkahH0G9zd1zAlAukM1A5RHf3hDsMVyGnAAjee8aA0LSB
         Uqwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785751877; x=1786356677;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CBRFHYOL2ugysE5dNDzIh6xnN0zoWtq/Z1MnD4d5fkU=;
        b=YKXCi7+uoKYQGb2BF8LsMPUnokDlP5toJeGBYisXTPFQFKoKp1yNJci8wRDqV9BfxC
         XGlDN3stlBlVaJIEY/Jn/a8ZfHrrls/Az+R4c6V44O9Puj9ohLbZH5h5I4IQ+F/blF4i
         XAPgwrFtTmQiQVCm4dJ7sBJu5AgzTy5tW+LbjYTL20plnrYNkDCydzFk+67RmXbULgxT
         H3+4IuB3dX7dsQB5EnFoXWV6VHd7XB/u/i8X5cyA7/RaeSf3YkL9kWXJkMHfAXgxV34V
         G2/oTxy7J/H34bSNb3XwjBbzIGDC5e4+Q2cs2i4Czv3E0g0qxX506+ZJQBIUCBn5WFIB
         PSsw==
X-Forwarded-Encrypted: i=1; AHgh+RqLlKl3CupMGzP6mzjaAhUvALqkMjKlu8qWqDZEDiKRaA+HbTMJ/cJNHAt/WSm3KRB8wxk46VZR9vGNy1yRkAuZ@lists.infradead.org
X-Gm-Message-State: AOJu0Ywsb6cMEewRyWU7rnQziqzwsE1/o8tt4L9zR7IGfbLSmszG/XXX
	UYzTq05T/NrPeJsB2cZSZ4kf1aiFCogitBaCHsauruygjTf76dGElkRud3v5k3U0/xe72fghv0x
	XLL1px8GIZwe9LKjar+xmvQ==
X-Received: from edvh22.prod.google.com ([2002:aa7:de16:0:b0:6a0:10fb:ecbc])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:1f48:b0:6a0:33f6:13b4 with SMTP id 4fb4d7f45d1cf-6a0a7cae888mr6718653a12.13.1785751876652;
 Mon, 03 Aug 2026 03:11:16 -0700 (PDT)
Date: Mon,  3 Aug 2026 11:09:02 +0100
In-Reply-To: <20260803100904.3563942-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20260803100904.3563942-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.55.0.508.g3f0d502094-goog
Message-ID: <20260803100904.3563942-19-vdonnefort@google.com>
Subject: [PATCH 18/20] KVM: arm64: Add PKVM_HYP_REQ_SPLIT
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, 
	kernel-team@android.com, fuad.tabba@linux.dev, qperret@google.com, 
	keirf@google.com, Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_031119_755780_3D15F269 
X-CRM114-Status: GOOD (  20.12  )
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

With the upcoming support for stage-2 huge mappings for protected VMs,
we need a way to split blocks. Since the host has its own "copy" of the
guest stage-2 in the pkvm_mappings rb-tree, the split must be done
simultaneously for both that tree and the guest stage-2. Therefore the
hypervisor can't do it on its own and must rely on the host for this
operation.

Create a pKVM hypervisor request to ask the host to split a specified
region of the guest. On this request, the host can synchronise the split
of both guest stage-2 (HVC __pkvm_host_split_guest) and the
pkvm_mappings tree. It ensures a concurrent VM teardown can't observe a
PMD_SIZE pkvm_mapping while the guest stage-2 is PAGE_SIZE.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index d01e6954d363..927d9de643fa 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -87,11 +87,18 @@ void kvm_arm_vcpu_destroy(struct kvm_vcpu *vcpu);
 
 enum pkvm_hyp_req_type {
 	PKVM_HYP_NO_REQ = 0,
+	PKVM_HYP_REQ_SPLIT,
 	__PKVM_HYP_REQ_TYPE_MAX,
 };
 
 struct pkvm_hyp_req {
 	u8 type;
+	union {
+		struct {
+			u32	nr_pages;
+			u64	gfn;
+		} split;
+	};
 };
 
 struct kvm_hyp_memcache {
diff --git a/arch/arm64/include/asm/kvm_pkvm.h b/arch/arm64/include/asm/kvm_pkvm.h
index baafbd7ca215..370eddeefbae 100644
--- a/arch/arm64/include/asm/kvm_pkvm.h
+++ b/arch/arm64/include/asm/kvm_pkvm.h
@@ -193,7 +193,10 @@ static inline size_t pkvm_host_sve_state_size(void)
 }
 
 struct pkvm_mapping {
-	struct rb_node node;
+	union {
+		struct rb_node node;
+		struct list_head list;
+	};
 	u64 gfn;
 	u64 pfn;
 	u64 nr_pages;
diff --git a/arch/arm64/kvm/pkvm.c b/arch/arm64/kvm/pkvm.c
index 379bdc2b258a..089b77cf2f6a 100644
--- a/arch/arm64/kvm/pkvm.c
+++ b/arch/arm64/kvm/pkvm.c
@@ -365,6 +365,69 @@ INTERVAL_TREE_DEFINE(struct pkvm_mapping, node, u64, __subtree_last,
 		       });									\
 	    )
 
+static void pkvm_mapping_free_spares(struct list_head *spares)
+{
+	struct pkvm_mapping *m, *tmp;
+
+	list_for_each_entry_safe(m, tmp, spares, list) {
+		list_del(&m->list);
+		kfree(m);
+	}
+}
+
+static int pkvm_mapping_alloc_spares(struct list_head *head, u64 nr_spares)
+{
+	struct pkvm_mapping *m;
+
+	while (nr_spares--) {
+		m = kzalloc_obj(*m);
+		if (!m) {
+			pkvm_mapping_free_spares(head);
+			return -ENOMEM;
+		}
+
+		list_add(&m->list, head);
+	}
+
+	return 0;
+}
+
+static bool pkvm_mapping_can_split(struct pkvm_mapping *mapping)
+{
+	return mapping && (mapping->nr_pages * PAGE_SIZE == PMD_SIZE);
+}
+
+static void pkvm_mapping_split(struct pkvm_mapping *mapping, struct kvm_pgtable *pgt,
+			       struct list_head *spares)
+{
+	struct kvm *kvm = kvm_s2_mmu_to_kvm(pgt->mmu);
+	u64 nr_pages = mapping->nr_pages - 1;
+	gfn_t gfn = mapping->gfn + 1;
+	u64 pfn = mapping->pfn + 1;
+
+	lockdep_assert_held_write(&kvm->mmu_lock);
+
+	pkvm_mapping_remove(mapping, &pgt->pkvm_mappings);
+	mapping->nr_pages = 1;
+	pkvm_mapping_insert(mapping, &pgt->pkvm_mappings);
+
+	while (nr_pages--) {
+		struct pkvm_mapping *m;
+
+		if (WARN_ON(list_empty(spares)))
+			break;
+
+		m = list_first_entry(spares, struct pkvm_mapping, list);
+		list_del(&m->list);
+
+		m->nr_pages = 1;
+		m->gfn = gfn++;
+		m->pfn = pfn++;
+
+		pkvm_mapping_insert(m, &pgt->pkvm_mappings);
+	}
+}
+
 int pkvm_pgtable_stage2_init(struct kvm_pgtable *pgt, struct kvm_s2_mmu *mmu,
 			     struct kvm_pgtable_mm_ops *mm_ops)
 {
@@ -619,6 +682,91 @@ int pkvm_pgtable_stage2_split(struct kvm_pgtable *pgt, u64 addr, u64 size, void
 	return -EINVAL;
 }
 
+/*
+ * Splitting is only expected on the back of a guest HVC, while
+ * pkvm_pgtable_stage2_split() can be called with dirty logging.
+ */
+static int __pkvm_pgtable_stage2_split(struct kvm_vcpu *vcpu, phys_addr_t ipa, u64 size)
+{
+	struct kvm_hyp_memcache *mc = &vcpu->arch.pkvm_memcache;
+	struct kvm_pgtable *pgt = vcpu->arch.hw_mmu->pgt;
+	struct page **pages __free(kfree) = NULL;
+	struct mm_struct *mm = current->mm;
+	struct kvm_memory_slot *memslot;
+	struct pkvm_mapping *mapping;
+	struct kvm *kvm = vcpu->kvm;
+	struct list_head spares;
+	unsigned long hva;
+	bool writable;
+	u64 nr_pages;
+	int ret, idx;
+	gfn_t gfn;
+
+	if (WARN_ON(!kvm_vm_is_protected(kvm)))
+		return -EINVAL;
+
+	if (!IS_ALIGNED(ipa, PMD_SIZE) || size != PMD_SIZE)
+		return -EINVAL;
+
+	ret = topup_hyp_memcache(mc, 1);
+	if (ret)
+		return ret;
+
+	/* We already have 1 pin on the huge-page */
+	gfn = gpa_to_gfn(ipa) + 1;
+	nr_pages = (size / PAGE_SIZE) - 1;
+	pages = kmalloc_objs(struct page *, nr_pages);
+	if (!pages)
+		return -ENOMEM;
+
+	INIT_LIST_HEAD(&spares);
+	ret = pkvm_mapping_alloc_spares(&spares, nr_pages);
+	if (ret)
+		return ret;
+
+	idx = srcu_read_lock(&kvm->srcu);
+	memslot = gfn_to_memslot(kvm, gfn);
+	hva = gfn_to_hva_memslot_prot(memslot, gfn, &writable);
+	if (kvm_is_error_hva(hva) || !writable) {
+		ret = -EFAULT;
+		goto unlock_srcu;
+	}
+
+	mmap_read_lock(mm);
+	ret = pin_user_pages(hva, nr_pages, FOLL_HWPOISON | FOLL_LONGTERM | FOLL_WRITE, pages);
+	mmap_read_unlock(mm);
+	if (ret != nr_pages) {
+		if (ret > 0)
+			unpin_user_pages(pages, ret);
+		ret = -EFAULT;
+		goto unlock_srcu;
+	}
+
+	write_lock(&kvm->mmu_lock);
+	mapping = pkvm_mapping_iter_first(&pgt->pkvm_mappings, ipa, ipa + size - 1);
+	if (!pkvm_mapping_can_split(mapping)) {
+		ret = -EINVAL;
+		goto unlock_mmu;
+	}
+
+	ret = kvm_call_hyp_nvhe(__pkvm_host_split_guest, gpa_to_gfn(ipa), size / PAGE_SIZE);
+	if (ret)
+		goto unlock_mmu;
+
+	pkvm_mapping_split(mapping, pgt, &spares);
+
+unlock_mmu:
+	write_unlock(&kvm->mmu_lock);
+	if (ret)
+		unpin_user_pages(pages, nr_pages);
+
+unlock_srcu:
+	srcu_read_unlock(&kvm->srcu, idx);
+	pkvm_mapping_free_spares(&spares);
+
+	return ret;
+}
+
 /*
  * Forcefully reclaim a page from the guest, zeroing its contents and
  * poisoning the stage-2 pte so that pages can no longer be mapped at
@@ -631,11 +779,31 @@ bool pkvm_force_reclaim_guest_page(phys_addr_t phys)
 	return !ret || ret == -EAGAIN;
 }
 
+static int pkvm_hyp_req_handle_split(struct kvm_vcpu *vcpu, u64 gfn, u64 nr_pages)
+{
+	phys_addr_t addr = ALIGN_DOWN(gfn << PAGE_SHIFT, PMD_SIZE);
+	phys_addr_t end = ALIGN((gfn + nr_pages) << PAGE_SHIFT, PMD_SIZE);
+
+	while (addr < end) {
+		int ret = __pkvm_pgtable_stage2_split(vcpu, addr, PMD_SIZE);
+
+		if (ret)
+			return ret;
+
+		addr += PMD_SIZE;
+	}
+
+	return 0;
+}
+
 static int pkvm_hyp_req_handle(struct pkvm_hyp_req *req, struct kvm_vcpu *vcpu)
 {
 	int ret = -EINVAL;
 
 	switch (req->type) {
+	case PKVM_HYP_REQ_SPLIT:
+		ret = pkvm_hyp_req_handle_split(vcpu, req->split.gfn, req->split.nr_pages);
+		break;
 	}
 
 	trace_kvm_handle_pkvm_hyp_req(req, ret);
diff --git a/arch/arm64/kvm/trace_pkvm.h b/arch/arm64/kvm/trace_pkvm.h
index 3966c111e3ad..801c6e9aaa4c 100644
--- a/arch/arm64/kvm/trace_pkvm.h
+++ b/arch/arm64/kvm/trace_pkvm.h
@@ -10,8 +10,9 @@
 
 TRACE_DEFINE_ENUM(PKVM_HYP_NO_REQ);
 
-#define PKVM_HYP_REQ_TYPES \
-	{ PKVM_HYP_NO_REQ, "NO_REQ" }
+#define PKVM_HYP_REQ_TYPES			\
+	{ PKVM_HYP_NO_REQ, "NO_REQ" },		\
+	{ PKVM_HYP_REQ_SPLIT, "SPLIT" },
 
 TRACE_EVENT(kvm_handle_pkvm_hyp_req,
 	TP_PROTO(struct pkvm_hyp_req *req, int ret),
-- 
2.55.0.508.g3f0d502094-goog


