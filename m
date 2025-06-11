Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 730EDC71136
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 15:54:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ps5JIbFDz5A5eQZiAHVOn0Nzc0a6jXDjwM86XL5RmwM=; b=LNAYddrkZokO5suKe5k42vljvv
	hNUCmiGl+DrDB28fiCwwZjuD3oB9Dc10yZdNzTJPn9pq3l6L/BJQ/fzPwl+fzMlDqOM4xgmg8opsP
	/aikRdOX8o06/glVeLYMG9eSIZ2TqKbRH3tRReEqun8F9XXhWv/MPbta7z7GZPHHmmhzu5l/sLruK
	RKsl6eKPjrxpbI4Cd7nMYNpkYlshgd9eToaWE4JGvMbgbQmLDK9dfY7FRxE/EcO5I8bqoVRn6siVb
	HqAg0X7LmXkJWalShTHslvg0eDNErvXC/frA7bZoolrumfs+tu4qALtCSYx/BSEPVvCDcnMWy4+Sm
	r16g1bZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPNmS-0000000ATax-46GP;
	Wed, 11 Jun 2025 15:54:24 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPJ24-00000009fQX-0Kc3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Jun 2025 10:50:13 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2BBD415A1;
	Wed, 11 Jun 2025 03:49:52 -0700 (PDT)
Received: from e122027.arm.com (unknown [10.57.67.107])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9049F3F673;
	Wed, 11 Jun 2025 03:50:08 -0700 (PDT)
From: Steven Price <steven.price@arm.com>
To: kvm@vger.kernel.org,
	kvmarm@lists.linux.dev
Cc: Steven Price <steven.price@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Marc Zyngier <maz@kernel.org>,
	Will Deacon <will@kernel.org>,
	James Morse <james.morse@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Joey Gouly <joey.gouly@arm.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>,
	Christoffer Dall <christoffer.dall@arm.com>,
	Fuad Tabba <tabba@google.com>,
	linux-coco@lists.linux.dev,
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
	Gavin Shan <gshan@redhat.com>,
	Shanker Donthineni <sdonthineni@nvidia.com>,
	Alper Gun <alpergun@google.com>,
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
	Emi Kisanuki <fj0570is@fujitsu.com>
Subject: [PATCH v9 19/43] arm64: RME: Allow populating initial contents
Date: Wed, 11 Jun 2025 11:48:16 +0100
Message-ID: <20250611104844.245235-20-steven.price@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250611104844.245235-1-steven.price@arm.com>
References: <20250611104844.245235-1-steven.price@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_035012_215242_E9D9F562 
X-CRM114-Status: GOOD (  18.90  )
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

The VMM needs to populate the realm with some data before starting (e.g.
a kernel and initrd). This is measured by the RMM and used as part of
the attestation later on.

Co-developed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
Signed-off-by: Steven Price <steven.price@arm.com>
Reviewed-by: Gavin Shan <gshan@redhat.com>
---
Changes since v7:
 * Improve the error codes.
 * Other minor changes from review.
Changes since v6:
 * Handle host potentially having a larger page size than the RMM
   granule.
 * Drop historic "par" (protected address range) from
   populate_par_region() - it doesn't exist within the current
   architecture.
 * Add a cond_resched() call in kvm_populate_realm().
Changes since v5:
 * Refactor to use PFNs rather than tracking struct page in
   realm_create_protected_data_page().
 * Pull changes from a later patch (in the v5 series) for accessing
   pages from a guest memfd.
 * Do the populate in chunks to avoid holding locks for too long and
   triggering RCU stall warnings.
---
 arch/arm64/kvm/rme.c | 227 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 227 insertions(+)

diff --git a/arch/arm64/kvm/rme.c b/arch/arm64/kvm/rme.c
index 678b14ba2466..d7bb11583506 100644
--- a/arch/arm64/kvm/rme.c
+++ b/arch/arm64/kvm/rme.c
@@ -660,6 +660,221 @@ void kvm_realm_unmap_range(struct kvm *kvm, unsigned long start,
 		realm_unmap_private_range(kvm, start, end, may_block);
 }
 
+static int realm_create_protected_data_granule(struct realm *realm,
+					       unsigned long ipa,
+					       phys_addr_t dst_phys,
+					       phys_addr_t src_phys,
+					       unsigned long flags)
+{
+	phys_addr_t rd = virt_to_phys(realm->rd);
+	int ret;
+
+	if (rmi_granule_delegate(dst_phys))
+		return -ENXIO;
+
+	ret = rmi_data_create(rd, dst_phys, ipa, src_phys, flags);
+	if (RMI_RETURN_STATUS(ret) == RMI_ERROR_RTT) {
+		/* Create missing RTTs and retry */
+		int level = RMI_RETURN_INDEX(ret);
+
+		WARN_ON(level == RMM_RTT_MAX_LEVEL);
+
+		ret = realm_create_rtt_levels(realm, ipa, level,
+					      RMM_RTT_MAX_LEVEL, NULL);
+		if (ret)
+			return -EIO;
+
+		ret = rmi_data_create(rd, dst_phys, ipa, src_phys, flags);
+	}
+	if (ret)
+		return -EIO;
+
+	return 0;
+}
+
+static int realm_create_protected_data_page(struct realm *realm,
+					    unsigned long ipa,
+					    kvm_pfn_t dst_pfn,
+					    kvm_pfn_t src_pfn,
+					    unsigned long flags)
+{
+	unsigned long rd = virt_to_phys(realm->rd);
+	phys_addr_t dst_phys, src_phys;
+	bool undelegate_failed = false;
+	int ret, offset;
+
+	dst_phys = __pfn_to_phys(dst_pfn);
+	src_phys = __pfn_to_phys(src_pfn);
+
+	for (offset = 0; offset < PAGE_SIZE; offset += RMM_PAGE_SIZE) {
+		ret = realm_create_protected_data_granule(realm,
+							  ipa,
+							  dst_phys,
+							  src_phys,
+							  flags);
+		if (ret)
+			goto err;
+
+		ipa += RMM_PAGE_SIZE;
+		dst_phys += RMM_PAGE_SIZE;
+		src_phys += RMM_PAGE_SIZE;
+	}
+
+	return 0;
+
+err:
+	if (ret == -EIO) {
+		/* current offset needs undelegating */
+		if (WARN_ON(rmi_granule_undelegate(dst_phys)))
+			undelegate_failed = true;
+	}
+	while (offset > 0) {
+		ipa -= RMM_PAGE_SIZE;
+		offset -= RMM_PAGE_SIZE;
+		dst_phys -= RMM_PAGE_SIZE;
+
+		rmi_data_destroy(rd, ipa, NULL, NULL);
+
+		if (WARN_ON(rmi_granule_undelegate(dst_phys)))
+			undelegate_failed = true;
+	}
+
+	if (undelegate_failed) {
+		/*
+		 * A granule could not be undelegated,
+		 * so the page has to be leaked
+		 */
+		get_page(pfn_to_page(dst_pfn));
+	}
+
+	return -ENXIO;
+}
+
+static int populate_region(struct kvm *kvm,
+			   phys_addr_t ipa_base,
+			   phys_addr_t ipa_end,
+			   unsigned long data_flags)
+{
+	struct realm *realm = &kvm->arch.realm;
+	struct kvm_memory_slot *memslot;
+	gfn_t base_gfn, end_gfn;
+	int idx;
+	phys_addr_t ipa = ipa_base;
+	int ret = 0;
+
+	base_gfn = gpa_to_gfn(ipa_base);
+	end_gfn = gpa_to_gfn(ipa_end);
+
+	idx = srcu_read_lock(&kvm->srcu);
+	memslot = gfn_to_memslot(kvm, base_gfn);
+	if (!memslot) {
+		ret = -EFAULT;
+		goto out;
+	}
+
+	/* We require the region to be contained within a single memslot */
+	if (memslot->base_gfn + memslot->npages < end_gfn) {
+		ret = -EINVAL;
+		goto out;
+	}
+
+	if (!kvm_slot_can_be_private(memslot)) {
+		ret = -EPERM;
+		goto out;
+	}
+
+	while (ipa < ipa_end) {
+		struct vm_area_struct *vma;
+		unsigned long hva;
+		struct page *page;
+		bool writeable;
+		kvm_pfn_t pfn;
+		kvm_pfn_t priv_pfn;
+		struct page *gmem_page;
+
+		hva = gfn_to_hva_memslot(memslot, gpa_to_gfn(ipa));
+		vma = vma_lookup(current->mm, hva);
+		if (!vma) {
+			ret = -EFAULT;
+			break;
+		}
+
+		pfn = __kvm_faultin_pfn(memslot, gpa_to_gfn(ipa), FOLL_WRITE,
+					&writeable, &page);
+
+		if (is_error_pfn(pfn)) {
+			ret = -EFAULT;
+			break;
+		}
+
+		ret = kvm_gmem_get_pfn(kvm, memslot,
+				       ipa >> PAGE_SHIFT,
+				       &priv_pfn, &gmem_page, NULL);
+		if (ret)
+			break;
+
+		ret = realm_create_protected_data_page(realm, ipa,
+						       priv_pfn,
+						       pfn,
+						       data_flags);
+
+		kvm_release_page_clean(page);
+
+		if (ret)
+			break;
+
+		ipa += PAGE_SIZE;
+	}
+
+out:
+	srcu_read_unlock(&kvm->srcu, idx);
+	return ret;
+}
+
+static int kvm_populate_realm(struct kvm *kvm,
+			      struct arm_rme_populate_realm *args)
+{
+	phys_addr_t ipa_base, ipa_end;
+	unsigned long data_flags = 0;
+
+	if (kvm_realm_state(kvm) != REALM_STATE_NEW)
+		return -EPERM;
+
+	if (!IS_ALIGNED(args->base, PAGE_SIZE) ||
+	    !IS_ALIGNED(args->size, PAGE_SIZE) ||
+	    (args->flags & ~RMI_MEASURE_CONTENT))
+		return -EINVAL;
+
+	ipa_base = args->base;
+	ipa_end = ipa_base + args->size;
+
+	if (ipa_end < ipa_base)
+		return -EINVAL;
+
+	if (args->flags & RMI_MEASURE_CONTENT)
+		data_flags |= RMI_MEASURE_CONTENT;
+
+	/*
+	 * Perform the population in parts to ensure locks are not held for too
+	 * long
+	 */
+	while (ipa_base < ipa_end) {
+		phys_addr_t end = min(ipa_end, ipa_base + SZ_2M);
+
+		int ret = populate_region(kvm, ipa_base, end,
+					  args->flags);
+
+		if (ret)
+			return ret;
+
+		ipa_base = end;
+
+		cond_resched();
+	}
+
+	return 0;
+}
+
 enum ripas_action {
 	RIPAS_INIT,
 	RIPAS_SET,
@@ -903,6 +1118,18 @@ int kvm_realm_enable_cap(struct kvm *kvm, struct kvm_enable_cap *cap)
 		r = kvm_init_ipa_range_realm(kvm, &args);
 		break;
 	}
+	case KVM_CAP_ARM_RME_POPULATE_REALM: {
+		struct arm_rme_populate_realm args;
+		void __user *argp = u64_to_user_ptr(cap->args[1]);
+
+		if (copy_from_user(&args, argp, sizeof(args))) {
+			r = -EFAULT;
+			break;
+		}
+
+		r = kvm_populate_realm(kvm, &args);
+		break;
+	}
 	default:
 		r = -EINVAL;
 		break;
-- 
2.43.0


