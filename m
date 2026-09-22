Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01EB9C982FA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 13:14:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9k+hwbqCNy5PVLo73PwdABXDaZg+KPi4NbbBgA/NyFU=; b=BQkRwp9DmGNmj0Nk59qjCUq1Xn
	zjJC1nV8CajRlbUBHroFIs1Vql4dleFecJsQGTKZqjOl9di2HOUjuV96rTLcuhrj34HQ1GpECkRG6
	v84wfZei1OE5yxoc/9W7Kba6HV1XT4BTT9EVESqV7zolX9FBje5NAhA9vSYH/RcJWL2m8zDw/x6Zk
	QpcVfG8Uxlairsahfhndmwc2SLnNuZ3cytqH62HKQv5XTpGUPbn8YCMUP6Ew0dBfTm8zWBnWx2/cl
	OQqu1cVkcywPEbDLhCuqSjwz5Qm4e4HptjgzSsooAdETOZu5YyA54L1XoshzW31dtP8jBThMHi5Lf
	yIYJYzpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x90J7-00000005S7z-3ViQ;
	Tue, 22 Sep 2026 13:13:13 +0000
Received: from mail-ed1-x546.google.com ([2a00:1450:4864:20::546])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x90J0-00000005S2n-1sAZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 13:13:07 +0000
Received: by mail-ed1-x546.google.com with SMTP id 4fb4d7f45d1cf-6a9b5240fb3so5216623a12.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 06:13:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790082784; x=1790687584; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9k+hwbqCNy5PVLo73PwdABXDaZg+KPi4NbbBgA/NyFU=;
        b=ipAyKZbhX945HE+fzMGswM7QotFiKhQ5/MkzbWBPk788jAwy7/XWiBLKFchtpiLIQt
         tfZYgfIbRrg35JgEweFJd3fi0Qs+vtOOyog7IqX9cNk6bvcRLXH6Q+KVTZ3BxteSncmV
         GnHPVWQBtmqPcq7otPOUcLWXvy4e/VfCtJAlciLHcDYDEGgGTQ0ZaYQXb4wzz5P6o6AH
         tt1cJv3mwWJOuODNasPqMj7nes3ePAg4yhIEP2A74D/7rTenNp5jIUqSHOD59v8RtxYM
         4zsQ+H7RbcIn61mZ/zNt+jB7fQDGMyjIlC/1uWNSBRyqGuYclqq4/hnluF3G1wA2FYW+
         Ni1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790082784; x=1790687584;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9k+hwbqCNy5PVLo73PwdABXDaZg+KPi4NbbBgA/NyFU=;
        b=YMZnakpwvVPKTLwNj3IunapiZ8QRrrXN1/bib4ljulgtauRm9ELJOuX4wH7SNS8G9e
         /hw/FxAPPMQPIvRMBDvyTSWQiP6KFXcCjVwKdtfZrquEm701EBmpl2lMfTVcPDaDXn7Q
         xtQkFx1VOSdu8sankh5obkkTBEsgkOSAr9fEtJLQJumWiZMZBsLNHJUO2pFCG7l88Hv8
         705OKCo50wSIHVRZQPSheWXBxpNQ7vWQI5T7CzbzoNza4KWR7/FMn5xLwrOcCmVstWBK
         dISGzi98ke+q1HDweAwv1jx9W1xpijo4XT1o0RYdhjtQNGm9wKv9Us+FpGqANccbqy8t
         R2uQ==
X-Gm-Message-State: AFuF++kleGkN7uDfX3Qnb+ulEZK0OA7wGS6cM4KoI8Ovg3Zj7kmLjG4p
	VceTa0KwlAqmfAuv0kp6D/1+eyJvdaD6uCJraCvIpTZ2Bw7GWhnccak23eKctFQUZ42igWbkdcR
	pqwU+Rgg1GbhyhmaRXBCsNrn4znWqupH6IAalGv4jaKI8QkejCH3QOi7WBWlKR8UmxgygAqlb/J
	BFzOZ1qqRmHNE1EC3TyCfCpNZriEfXYQT4awvjuXbk4Jlju3ZJV/Z2/3CDdyTe7QtcHw==
X-Received: from edqi12.prod.google.com ([2002:aa7:c70c:0:b0:6a6:8910:5903])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:354f:b0:6a6:21d9:541f with SMTP id 4fb4d7f45d1cf-6aa57808b40mr13962900a12.6.1790082783578;
 Tue, 22 Sep 2026 06:13:03 -0700 (PDT)
Date: Tue, 22 Sep 2026 13:12:34 +0000
In-Reply-To: <20260922131259.2975334-1-smostafa@google.com>
Mime-Version: 1.0
References: <20260922131259.2975334-1-smostafa@google.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <20260922131259.2975334-2-smostafa@google.com>
Subject: [PATCH v8 01/25] KVM: arm64: Donate MMIO to the hypervisor
From: Mostafa Saleh <smostafa@google.com>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kvmarm@lists.linux.dev, iommu@lists.linux.dev
Cc: catalin.marinas@arm.com, will@kernel.org, maz@kernel.org, 
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, joro@8bytes.org, jgg@ziepe.ca, mark.rutland@arm.com, 
	qperret@google.com, tabba@google.com, vdonnefort@google.com, 
	sebastianene@google.com, keirf@google.com, 
	Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_061306_523483_DB242261 
X-CRM114-Status: GOOD (  26.06  )
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

Add a function to donate MMIO to the hypervisor so IOMMU hypervisor
drivers can protect and access the MMIO of IOMMUs.

As donating MMIO is very rare, and we don't need to encode the full
state, it's reasonable to have a separate function to do this.
It will init the host s2 page table with an invalid leaf with the owner ID
to prevent the host from mapping the page on faults.

Also, prevent kvm_pgtable_stage2_unmap() from removing owner ID from
stage-2 PTEs, as this can be triggered from recycle logic under memory
pressure. There is no code relying on this, as all ownership changes are
done via host_stage2_set_owner_locked().

For the error path in IOMMU drivers, add a function to donate MMIO
back from hyp to host. However, that leaks the hypervisor virtual
address range which should be acceptable as this is quite rare and
it matches the behaviour of fix_map/block.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 arch/arm64/include/asm/kvm_pgtable.h          |  1 +
 arch/arm64/kvm/hyp/include/nvhe/mem_protect.h |  7 ++
 arch/arm64/kvm/hyp/nvhe/mem_protect.c         | 93 ++++++++++++++++++-
 arch/arm64/kvm/hyp/pgtable.c                  | 11 +--
 4 files changed, 105 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_pgtable.h b/arch/arm64/include/asm/kvm_pgtable.h
index 41a8687938eb..223072b3e2cd 100644
--- a/arch/arm64/include/asm/kvm_pgtable.h
+++ b/arch/arm64/include/asm/kvm_pgtable.h
@@ -712,6 +712,7 @@ int kvm_pgtable_stage2_annotate(struct kvm_pgtable *pgt, u64 addr, u64 size,
  * containing the cleared entry is decremented, with unreferenced pages being
  * freed. Unmapping a cacheable page will ensure that it is clean to the PoC if
  * FWB is not supported by the CPU.
+ * This function can't be used to clear invalid counted PTEs (annotations).
  *
  * Return: 0 on success, negative error code on failure.
  */
diff --git a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h b/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
index 29935c7da1de..072f4b0e72c2 100644
--- a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
+++ b/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
@@ -36,6 +36,13 @@ int __pkvm_guest_share_host(struct pkvm_hyp_vcpu *vcpu, u64 gfn);
 int __pkvm_guest_unshare_host(struct pkvm_hyp_vcpu *vcpu, u64 gfn);
 int __pkvm_host_unshare_hyp(u64 pfn);
 int __pkvm_host_donate_hyp(u64 pfn, u64 nr_pages);
+/*
+ * Donate MMIO range to the hypervisor, it will be mapped in the hypervisor's
+ * private range and unmapped from the host stage-2.
+ */
+int __pkvm_host_donate_hyp_mmio(u64 pfn, u64 nr_pages, unsigned long *haddr);
+/* Remaps MMIO range in the host, typically used in error path. */
+int __pkvm_hyp_donate_host_mmio(u64 pfn, u64 nr_pages);
 int __pkvm_hyp_donate_host(u64 pfn, u64 nr_pages);
 int __pkvm_host_share_ffa(u64 pfn, u64 nr_pages);
 int __pkvm_host_unshare_ffa(u64 pfn, u64 nr_pages);
diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
index 39aa8911f62c..c1a8fd811c0f 100644
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
@@ -1126,6 +1130,93 @@ int __pkvm_host_donate_hyp(u64 pfn, u64 nr_pages)
 	return ret;
 }
 
+int __pkvm_host_donate_hyp_mmio(u64 pfn, u64 nr_pages, unsigned long *haddr)
+{
+	u64 phys = hyp_pfn_to_phys(pfn);
+	u64 size = PAGE_SIZE * nr_pages;
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
+	ret = __pkvm_create_private_mapping(phys, size, PAGE_HYP_DEVICE, haddr);
+	if (ret)
+		return ret;
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
+	/*
+	 * We set HYP as the owner of the MMIO pages in the host stage-2, for:
+	 * - host aborts: host_stage2_adjust_range() would fail for invalid non zero PTEs.
+	 * - recycle under memory pressure: host_stage2_unmap_dev_all() would call
+	 *   kvm_pgtable_stage2_unmap() which will not clear non zero invalid ptes (counted).
+	 * - other MMIO donation: Would fail as we check that the PTE is valid or empty.
+	 */
+	ret = host_stage2_try(kvm_pgtable_stage2_annotate, &host_mmu.pgt,
+			      phys, size, &host_s2_pool,
+			      KVM_HOST_INVALID_PTE_TYPE_DONATION,
+			      FIELD_PREP(KVM_HOST_DONATION_PTE_OWNER_MASK, PKVM_ID_HYP));
+unlock:
+	host_unlock_component();
+	return ret;
+}
+
+int __pkvm_hyp_donate_host_mmio(u64 pfn, u64 nr_pages)
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
+	for (offset = 0; offset < size; offset += PAGE_SIZE) {
+		if (addr_is_memory(phys + offset)) {
+			ret = -EINVAL;
+			goto unlock;
+		}
+		ret = kvm_pgtable_get_leaf(&host_mmu.pgt, phys + offset, &pte, NULL);
+		if (ret)
+			goto unlock;
+		if (!pte || kvm_pte_valid(pte)) {
+			ret = -EINVAL;
+			goto unlock;
+		}
+		if (FIELD_GET(KVM_HOST_DONATION_PTE_OWNER_MASK, pte) != PKVM_ID_HYP) {
+			ret = -EPERM;
+			goto unlock;
+		}
+	}
+	WARN_ON(host_stage2_idmap_locked(phys, size, PKVM_HOST_MMIO_PROT));
+unlock:
+	host_unlock_component();
+	return ret;
+}
+
 int __pkvm_hyp_donate_host(u64 pfn, u64 nr_pages)
 {
 	u64 phys = hyp_pfn_to_phys(pfn);
diff --git a/arch/arm64/kvm/hyp/pgtable.c b/arch/arm64/kvm/hyp/pgtable.c
index b74dd5ce1efd..25af105855e5 100644
--- a/arch/arm64/kvm/hyp/pgtable.c
+++ b/arch/arm64/kvm/hyp/pgtable.c
@@ -1161,13 +1161,12 @@ static int stage2_unmap_walker(const struct kvm_pgtable_visit_ctx *ctx,
 	kvm_pte_t *childp = NULL;
 	bool need_flush = false;
 
-	if (!kvm_pte_valid(ctx->old)) {
-		if (stage2_pte_is_counted(ctx->old)) {
-			kvm_clear_pte(ctx->ptep);
-			mm_ops->put_page(ctx->ptep);
-		}
+	/*
+	 * This check ignores stage2_pte_is_counted() instead of clearing
+	 * the PTE as it might be MMIO owned by the hypervisor.
+	 */
+	if (!kvm_pte_valid(ctx->old))
 		return 0;
-	}
 
 	if (kvm_pte_table(ctx->old, ctx->level)) {
 		childp = kvm_pte_follow(ctx->old, mm_ops);
-- 
2.55.0.1082.g2b9226bbc0-goog


