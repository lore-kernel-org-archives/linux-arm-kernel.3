Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A47BBC88E58
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 13:52:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0VYYV6aC0VuQBjkk34XBrVlB6hVFJMMtfQoGOAROiRk=; b=ZAj3c1DASEH3e3BHdc/tYcwQvY
	mz41onf5NhcMEyLYRU/Hgj0I5IyunS400RayYD/3J+HO7wVumYAttF0+/pVSEgbV3TKj5GNie9dM0
	/g8mevetzjuNtLv2X+SfVE1r9U5tjh5c4XgPsNA2OwSrgesmDhUVHQcYKiAAokQazxADUK94zgd5b
	/ojiCiPg3hd8i8StSKBkc4W/e1pwXAnBIxxG3b4zrVRf8jGZF6vEa4K7MTwvzMscTDjFC0zAp7OsZ
	f0O5hJlb9iVdgr+DQ3znENIFXKGW3lDpOX6rPzVDE3eNt5Ng0tgSCSitRt6pagsndMS6IEEZcRlmw
	wa/TPYYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x51fS-0000000GoRx-1eWh;
	Fri, 11 Sep 2026 13:51:50 +0000
Received: from mail-wm1-x348.google.com ([2a00:1450:4864:20::348])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x51f6-0000000Go4X-1P3f
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 13:51:33 +0000
Received: by mail-wm1-x348.google.com with SMTP id 5b1f17b1804b1-49d0ae342b9so7438525e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Sep 2026 06:51:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789134686; x=1789739486; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0VYYV6aC0VuQBjkk34XBrVlB6hVFJMMtfQoGOAROiRk=;
        b=n/MQhURzb4H01tg3yU9elmyoIOCfadvX/nZVZKqa7KaF0SdEVEp6CoYZBFIACfCuEn
         d+bZk+2DCnKc2u/TmpORML1E4peOqOJGeMq4cAGjW92QxANJ1pliiAc6mpKua7M6oX5p
         k0cBDPKnLP6kEh4Kd2LrB/WfZcQ2CumTeZdT9Pz2aq9QIWY1nXJUTeIt/Oy5f4vT+1PQ
         y39jvciRJXCuHdQq5x8kQKVtJENG+moxBJfXEIfwwePDCvAvY7tVeePh8nId+CuF+Fpu
         PivnlVxBOKJkJ1U1JwojBtU4zMiZEoIJ4NKW7E/5sh9gc//4n+AE0++haJix7qCjmdoc
         vZoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789134686; x=1789739486;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0VYYV6aC0VuQBjkk34XBrVlB6hVFJMMtfQoGOAROiRk=;
        b=KjMLKuRRfa0LhhPK3jXkSmDeeUQvbtRSBEC/AoHCH0OmiG252CSenP9DCGoQnB4PpL
         /rxzVuA85iNdomaBm202B0QKT9FsVcPV12bbckdRPgOIaeHt7+WMjT6HZ43YQUO7ksWV
         +T+cuqqTq9l+ujn3xO52XrAp7Vf0F0MMB0yDowGjHtKwknFMmsvDvgWcevnXw0GhhWK7
         3OMMhqmRVZAxpVmwSRDjZEIPyDvHlGoMtwzzVcMo67xcFu095udsdCvJAjAvUY825jGc
         D4aL5ntU/MASzKuXykKr5r2fZuXhasugf/C0wb2LgpYhTBOD8oDY2ZYUe8sdhhPly9we
         v5uw==
X-Forwarded-Encrypted: i=1; AKwUvBzYDUzBGfewU2gJRlDO3Mw6e6oubsg1YFttu+aHza0BANaQPqarFlwcADQgKKbwfCikBYv3EscIjFX3fGP4zPY3@lists.infradead.org
X-Gm-Message-State: AFuF++mF6QI1qExWFLIgbRO9b2yCbBN8H79cuSCbuBN07/8AZ7B/aktg
	KXmOwhoIeOs6cMwEJXPCSW9RKVOaovSugIRZ/d3QjZ/kmnqup7vihwUGcldnEISy+70lOrU5Oo+
	ZiyweGIWXtOP86Y8CFrVWwg==
X-Received: from wmpr23.prod.google.com ([2002:a05:600c:3217:b0:499:c849:1518])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:8a1a:10b0:49c:ee22:364c with SMTP id 5b1f17b1804b1-49e6198d0a6mr38001395e9.9.1789134685985;
 Fri, 11 Sep 2026 06:51:25 -0700 (PDT)
Date: Fri, 11 Sep 2026 14:50:51 +0100
In-Reply-To: <20260911135053.146435-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20260911135053.146435-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.55.0.1007.g17ff1f9808-goog
Message-ID: <20260911135053.146435-21-vdonnefort@google.com>
Subject: [PATCH v2 20/22] KVM: arm64: Add PKVM_HYP_REQ_SPLIT
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, 
	kernel-team@android.com, fuad.tabba@linux.dev, qperret@google.com, 
	weilin.chang@arm.com, Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_065128_437513_87D523B9 
X-CRM114-Status: GOOD (  22.42  )
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
---
 arch/arm64/include/asm/kvm_host.h |   7 ++
 arch/arm64/include/asm/kvm_pkvm.h |   5 +-
 arch/arm64/kvm/pkvm.c             | 145 ++++++++++++++++++++++++++++++
 arch/arm64/kvm/trace_pkvm.h       |   5 +-
 4 files changed, 159 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index ea76c0f3120e..c4cb2232d4c8 100644
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
index 7240dcc4f395..33c94f353eda 100644
--- a/arch/arm64/include/asm/kvm_pkvm.h
+++ b/arch/arm64/include/asm/kvm_pkvm.h
@@ -196,7 +196,10 @@ static inline size_t pkvm_host_sve_state_size(void)
 }
 
 struct pkvm_mapping {
-	struct rb_node node;
+	union {
+		struct rb_node node;
+		struct list_head list;
+	};
 	u64 gfn;
 	u64 pfn;
 	struct {
diff --git a/arch/arm64/kvm/pkvm.c b/arch/arm64/kvm/pkvm.c
index 02ad686d7661..2840053ef2f4 100644
--- a/arch/arm64/kvm/pkvm.c
+++ b/arch/arm64/kvm/pkvm.c
@@ -362,6 +362,64 @@ INTERVAL_TREE_DEFINE(struct pkvm_mapping, node, u64, __subtree_last,
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
+		m = kzalloc_obj(*m, GFP_KERNEL_ACCOUNT);
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
@@ -624,6 +682,73 @@ int pkvm_pgtable_stage2_split(struct kvm_pgtable *pgt, u64 addr, u64 size,
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
+	struct pkvm_mapping *mapping;
+	struct kvm *kvm = vcpu->kvm;
+	struct list_head spares;
+	u64 nr_pages;
+	int ret;
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
+	nr_pages = (size / PAGE_SIZE) - 1;
+
+	INIT_LIST_HEAD(&spares);
+	ret = pkvm_mapping_alloc_spares(&spares, nr_pages);
+	if (ret)
+		return ret;
+
+	write_lock(&kvm->mmu_lock);
+
+	mapping = pkvm_mapping_iter_first(&pgt->pkvm_mappings, ipa, ipa + size - 1);
+	if (!mapping) {
+		ret = -EPERM;
+		goto unlock_mmu;
+	} else if (mapping->nr_pages == 1) {
+		/* We've raced with another vCPU */
+		ret = 0;
+		goto unlock_mmu;
+	} else if (mapping->nr_pages * PAGE_SIZE != PMD_SIZE) {
+		ret = -EINVAL;
+		goto unlock_mmu;
+	}
+
+	ret = folio_add_pins(page_folio(pfn_to_page(mapping->pfn)), nr_pages);
+	if (ret)
+		goto unlock_mmu;
+
+	ret = kvm_call_hyp_nvhe(__pkvm_host_split_guest, gpa_to_gfn(ipa), size / PAGE_SIZE);
+	if (ret) {
+		for (int i = 0; i < nr_pages; i++)
+			unpin_user_page(pfn_to_page(mapping->pfn + 1 + i));
+		goto unlock_mmu;
+	}
+
+	pkvm_mapping_split(mapping, pgt, &spares);
+
+unlock_mmu:
+	write_unlock(&kvm->mmu_lock);
+	pkvm_mapping_free_spares(&spares);
+
+	return ret;
+}
+
 /*
  * Forcefully reclaim a page from the guest, zeroing its contents and
  * poisoning the stage-2 pte so that pages can no longer be mapped at
@@ -636,11 +761,31 @@ bool pkvm_force_reclaim_guest_page(phys_addr_t phys)
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
2.55.0.1007.g17ff1f9808-goog


