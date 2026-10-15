Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37EFACCA465
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 20:09:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IMjLsiB8JUe1zn3H8B72Qby1JQXygMn6MqjBzblWNdg=; b=y6PD7ZgBaWH+GXUuKqc1rwk1o8
	2Cw75ouCNp38sag3XtqW1tftJQF7gLwqkP4fzpREcoxvyaBpc8yKyvKC9O1FhSpKyZjt9lMcrilFM
	2hLPgaMwDtaL5+ipkaIJNetXvzD4p/sW17VKC5wUMdMPn1X4hfE4dMTgNRLbyTQNbmWUbsr2ab/0x
	4Fgk9kGAKWRXnZXR3W0JSyA2FHmoKbdybJ/OxzXtLXtdzkSlEZ0Te+mEu+cMEhVcOwv/0oJ/F5z/Q
	Rmets40Hs8tfYFlDj2RSKEjtINHTrzHReqwNwTdmwTubJo5cau5ZvmesTRt6Ztl+HIJ/MrhH9QtQ0
	1oX0xyqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHRlQ-00000001I0v-1TlR;
	Thu, 15 Oct 2026 20:09:20 +0000
Received: from mail-wm1-x345.google.com ([2a00:1450:4864:20::345])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHRlK-00000001Hwt-33nI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Oct 2026 20:09:15 +0000
Received: by mail-wm1-x345.google.com with SMTP id 5b1f17b1804b1-4a17741243eso15526365e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Oct 2026 13:09:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792094952; x=1792699752; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IMjLsiB8JUe1zn3H8B72Qby1JQXygMn6MqjBzblWNdg=;
        b=eksB4Jt6AnrScxae9WALc81dq+fST5q8IzhpLhUIIq/MQXXrkxGOEjsHfavlpV5wkg
         W0YiAd4/xtae34n2MVwWs0HmGPC7dI/fZZWF4fxSvA91K5ZZOX+UYbdTK8605dRkWOpC
         hkya0K9pR34/XMTdyZ3M+GhfhgV/VphbZGjhHCvImubDOk8y1JiO2v4vf9BUJEb3h4lq
         ZiT7SKPeF7P7+Mj5P+iKjnxihxGOy7ssar6hPEebfgQOtftY/2qyATTEWgeiSFYlybVO
         D8/GTKqHAZggblJ+8TPaQxPEUq4K0XxRpPljx+DrRymO3Uexl/Z1EvjXaulwFs56FHvR
         nD7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792094952; x=1792699752;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IMjLsiB8JUe1zn3H8B72Qby1JQXygMn6MqjBzblWNdg=;
        b=woQHb/4e0py+uk8P6Y7QOYsZi4NuuEouQ4/YRxTKra4AKUOTJkJH5z68XYLbDP2eMh
         tO61qqJWwt3FvVNv/xDcKcMn1F6Ya0wVwSRVfWx7OF+TQHI+j3YcgETBq1T0heCV6YNs
         NZtgqG7uw908MCAvXrmo/iQBR7A4iHWqnfNGFv7Cw+Azo+JmKl1bxJRTYT06lJCyeQZZ
         rbubIj0ZFl05EN1Ap9lvtLKTCT9XEvpi+zYVVYL8hIQRGQk/7KkE+0oLhjV9CVJksqb3
         6HWhAO8me5Xh+ldnf9+JcfzPpsO0icYwzlAX3UuLXtKHCRMR/fRHwkct9YfYuYfJKKRh
         OeVA==
X-Gm-Message-State: AFq9FYL1GRhLqT1LsJFTDb7zY12tGnx/kx4tjcGx2WM/Bn6g5ZrZWodI
	Rac29AVsZD4kGKay9PCALPSlo2FPNF0oQamshL8zNbL1XCuGJ3nUniOTgZDos++JIwU7IEmDa++
	Gsoi/CiIgyMI1I6lPJOFw/+ips8VL55a8Yc/F6u4jHbWU6KTdVXzaHFvau9nMC4Fq62Ln3azJ1m
	ufmAfgviWjeTE/j1dxp7bBzM/Xm4rAes/2hE9vBtXgErQRQ9QCcrPo+EiUgjsohB93PQ==
X-Received: from wmbd18.prod.google.com ([2002:a05:600c:58d2:b0:4a1:7ec4:6621])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600d:17:b0:4a1:9663:7639 with SMTP id 5b1f17b1804b1-4a196637a39mr305024695e9.34.1792094952096;
 Thu, 15 Oct 2026 13:09:12 -0700 (PDT)
Date: Thu, 15 Oct 2026 20:08:32 +0000
In-Reply-To: <20261015200903.2735565-1-smostafa@google.com>
Mime-Version: 1.0
References: <20261015200903.2735565-1-smostafa@google.com>
X-Mailer: git-send-email 2.56.0.176.g3575e65682-goog
Message-ID: <20261015200903.2735565-2-smostafa@google.com>
Subject: [PATCH v9 01/25] KVM: arm64: Donate MMIO to the hypervisor
From: Mostafa Saleh <smostafa@google.com>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kvmarm@lists.linux.dev, iommu@lists.linux.dev
Cc: catalin.marinas@arm.com, will@kernel.org, maz@kernel.org, 
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, joro@8bytes.org, jgg@ziepe.ca, mark.rutland@arm.com, 
	qperret@google.com, tabba@google.com, vdonnefort@google.com, 
	nicolinc@nvidia.com, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_130914_805468_12A6024F 
X-CRM114-Status: GOOD (  23.86  )
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

Add __pkvm_host_donate_hyp_mmio() so IOMMU drivers in the hypervisor can
take ownership of the IOMMU MMIO. The range is mapped in the hypervisor
private range and annotated as owned by the hypervisor in the host
stage-2, so host accesses fault and further donations of the same range
are refused. MMIO has no struct hyp_page, so the annotation is the only
state, and a dedicated function is simpler than teaching the memory
donation path about MMIO. Donation is only allowed before the host is
de-privileged, which is when the hypervisor IOMMU drivers initialise.

Make kvm_pgtable_stage2_unmap() leave invalid counted PTEs (annotations)
in place. host_stage2_unmap_dev_all() unmaps all non-memory ranges to
recycle page-table pages under memory pressure, and would otherwise drop
the annotation and let the host fault the MMIO back in. No caller depends
on the old behaviour: host_stage2_unmap_dev_all() only covers non-memory
ranges, where no annotation existed until now, and the guest unmap paths
check that the PTE is valid first. Returning an error for counted PTEs
instead is not an option, as a non-zero visitor return stops the walk,
which would abort recycling at the first hypervisor-owned MMIO page and
inject an abort into the host for an unrelated address.

Add __pkvm_hyp_donate_host_mmio() for the IOMMU driver error path. It
unmaps the range from the hypervisor and maps it back in the host
stage-2. The private VA range cannot be reclaimed and is leaked, as with
every other failed private mapping.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 arch/arm64/include/asm/kvm_pgtable.h          |  2 +
 arch/arm64/kvm/hyp/include/nvhe/mem_protect.h | 10 ++
 arch/arm64/kvm/hyp/nvhe/mem_protect.c         | 99 ++++++++++++++++++-
 arch/arm64/kvm/hyp/pgtable.c                  |  8 +-
 4 files changed, 112 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_pgtable.h b/arch/arm64/include/asm/kvm_pgtable.h
index 41a8687938eb..20b1adb8a058 100644
--- a/arch/arm64/include/asm/kvm_pgtable.h
+++ b/arch/arm64/include/asm/kvm_pgtable.h
@@ -713,6 +713,8 @@ int kvm_pgtable_stage2_annotate(struct kvm_pgtable *pgt, u64 addr, u64 size,
  * freed. Unmapping a cacheable page will ensure that it is clean to the PoC if
  * FWB is not supported by the CPU.
  *
+ * Invalid counted PTEs (annotations) are left in place.
+ *
  * Return: 0 on success, negative error code on failure.
  */
 int kvm_pgtable_stage2_unmap(struct kvm_pgtable *pgt, u64 addr, u64 size);
diff --git a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h b/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
index ec85a9547120..c9c3e2dbbe58 100644
--- a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
+++ b/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
@@ -36,6 +36,16 @@ int __pkvm_guest_share_host(struct pkvm_hyp_vcpu *vcpu, u64 gfn);
 int __pkvm_guest_unshare_host(struct pkvm_hyp_vcpu *vcpu, u64 gfn);
 int __pkvm_host_unshare_hyp(u64 pfn);
 int __pkvm_host_donate_hyp(u64 pfn, u64 nr_pages);
+/*
+ * Donate MMIO range to the hypervisor, it will be mapped in the hypervisor's
+ * private range and unmapped from the host stage-2.
+ */
+int __pkvm_host_donate_hyp_mmio(u64 pfn, u64 nr_pages, unsigned long *haddr);
+/*
+ * Undo __pkvm_host_donate_hyp_mmio(), typically on an error path. @haddr is
+ * the address returned by the donation.
+ */
+int __pkvm_hyp_donate_host_mmio(u64 pfn, u64 nr_pages, unsigned long haddr);
 int __pkvm_hyp_donate_host(u64 pfn, u64 nr_pages);
 int __pkvm_host_share_ffa(u64 pfn, u64 nr_pages);
 int __pkvm_host_unshare_ffa(u64 pfn, u64 nr_pages);
diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
index a6a47c1e058b..75d250ca809c 100644
--- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
+++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
@@ -385,7 +385,11 @@ static int host_stage2_unmap_dev_all(void)
 	u64 addr = 0;
 	int i, ret;
 
-	/* Unmap all non-memory regions to recycle the pages */
+	/*
+	 * Unmap all non-memory regions to recycle the pages.
+	 * That relies on kvm_pgtable_stage2_unmap() not clearing
+	 * counted PTEs which include hypervisor MMIO.
+	 */
 	for (i = 0; i < hyp_memblock_nr; i++, addr = reg->base + reg->size) {
 		reg = &hyp_memory[i];
 		ret = kvm_pgtable_stage2_unmap(pgt, addr, reg->base - addr);
@@ -1146,6 +1150,99 @@ int __pkvm_host_donate_hyp(u64 pfn, u64 nr_pages)
 	return ret;
 }
 
+int __pkvm_host_donate_hyp_mmio(u64 pfn, u64 nr_pages, unsigned long *haddr)
+{
+	u64 phys = hyp_pfn_to_phys(pfn);
+	u64 size = PAGE_SIZE * nr_pages;
+	unsigned long addr;
+	kvm_pte_t pte;
+	u64 offset;
+	int ret;
+
+	/* Only before de-privilege. */
+	if (static_branch_unlikely(&kvm_protected_mode_initialized))
+		return -EPERM;
+
+	if (!pfn_range_is_valid(pfn, nr_pages))
+		return -EINVAL;
+
+	host_lock_component();
+	for (offset = 0; offset < size; offset += PAGE_SIZE) {
+		if (addr_is_memory(phys + offset)) {
+			ret = -EINVAL;
+			goto unlock;
+		}
+		ret = kvm_pgtable_get_leaf(&host_mmu.pgt, phys + offset, &pte, NULL);
+		if (ret)
+			goto unlock;
+		if (pte && !kvm_pte_valid(pte)) {
+			ret = -EPERM;
+			goto unlock;
+		}
+	}
+
+	ret = __pkvm_create_private_mapping(phys, size, PAGE_HYP_DEVICE, &addr);
+	if (ret)
+		goto unlock;
+
+	/*
+	 * Mark the range as owned by the hypervisor in the host stage-2.
+	 * The annotation makes host accesses fault, and is retained by
+	 * host_stage2_unmap_dev_all()
+	 */
+	ret = host_stage2_try(kvm_pgtable_stage2_annotate, &host_mmu.pgt,
+			      phys, size, &host_s2_pool,
+			      KVM_HOST_INVALID_PTE_TYPE_DONATION,
+			      FIELD_PREP(KVM_HOST_DONATION_PTE_OWNER_MASK, PKVM_ID_HYP));
+	if (ret) {
+		hyp_lock_component();
+		WARN_ON(kvm_pgtable_hyp_unmap(&pkvm_pgtable, addr, size) != size);
+		hyp_unlock_component();
+	} else {
+		*haddr = addr;
+	}
+unlock:
+	host_unlock_component();
+	return ret;
+}
+
+int __pkvm_hyp_donate_host_mmio(u64 pfn, u64 nr_pages, unsigned long haddr)
+{
+	u64 phys = hyp_pfn_to_phys(pfn);
+	u64 size = PAGE_SIZE * nr_pages;
+	kvm_pte_t pte;
+	u64 offset;
+	int ret = 0;
+
+	if (static_branch_unlikely(&kvm_protected_mode_initialized))
+		return -EPERM;
+
+	if (!pfn_range_is_valid(pfn, nr_pages))
+		return -EINVAL;
+
+	host_lock_component();
+	hyp_lock_component();
+	for (offset = 0; offset < size; offset += PAGE_SIZE) {
+		if (addr_is_memory(phys + offset)) {
+			ret = -EINVAL;
+			goto unlock;
+		}
+		ret = kvm_pgtable_get_leaf(&host_mmu.pgt, phys + offset, &pte, NULL);
+		if (ret)
+			goto unlock;
+		if (!host_stage2_pte_is_hyp_owned(pte)) {
+			ret = -EPERM;
+			goto unlock;
+		}
+	}
+	WARN_ON(kvm_pgtable_hyp_unmap(&pkvm_pgtable, haddr, size) != size);
+	WARN_ON(host_stage2_idmap_locked(phys, size, PKVM_HOST_MMIO_PROT));
+unlock:
+	hyp_unlock_component();
+	host_unlock_component();
+	return ret;
+}
+
 int __pkvm_hyp_donate_host(u64 pfn, u64 nr_pages)
 {
 	u64 phys = hyp_pfn_to_phys(pfn);
diff --git a/arch/arm64/kvm/hyp/pgtable.c b/arch/arm64/kvm/hyp/pgtable.c
index b74dd5ce1efd..58b74450c824 100644
--- a/arch/arm64/kvm/hyp/pgtable.c
+++ b/arch/arm64/kvm/hyp/pgtable.c
@@ -1161,13 +1161,9 @@ static int stage2_unmap_walker(const struct kvm_pgtable_visit_ctx *ctx,
 	kvm_pte_t *childp = NULL;
 	bool need_flush = false;
 
-	if (!kvm_pte_valid(ctx->old)) {
-		if (stage2_pte_is_counted(ctx->old)) {
-			kvm_clear_pte(ctx->ptep);
-			mm_ops->put_page(ctx->ptep);
-		}
+	/* Invalid PTEs are left in place, including annotations. */
+	if (!kvm_pte_valid(ctx->old))
 		return 0;
-	}
 
 	if (kvm_pte_table(ctx->old, ctx->level)) {
 		childp = kvm_pte_follow(ctx->old, mm_ops);
-- 
2.56.0.176.g3575e65682-goog


