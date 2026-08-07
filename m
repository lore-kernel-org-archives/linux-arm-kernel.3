Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16B66C5AC82
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 16:43:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8GYrEvMvff5zvEdtopJDUiIvGuJM4d42FcGqOwQV2a4=; b=oqJ92YlTrYRr1t0p0h7vjWAQ5S
	N/v4xtN9mb4BQLk3JFE8a59DBUHM9X5WenY043y1fQCvW1iKFiYO2vV8pTJH5Ifb5uYE/ila82qE5
	WP7dpgcbMV8o81dxPGY4HXKgtUrknYJBRgxm+ziQhTdRQH2+tbzMDEILYNiMrVz1pmN2RqSyKe6P7
	75RGxTtjCvL48cYnVrr9/D0ebPjfq9XMReYEDZokknVJPvGAph7dXQtKKaSunghJnsbwI1WeXoCYX
	6sAAqlcPC4p9aja0/y7FbTNbG3nfqy7k+PqnGbbKse8qbvMNV2zHqptbABbOfFld+EwnCnPb5hSC5
	KXoORe2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsNfd-00000008S1D-1Vmt;
	Fri, 07 Aug 2026 16:43:45 +0000
Received: from mail-wm1-x348.google.com ([2a00:1450:4864:20::348])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsNfa-00000008Rz8-2I7s
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Aug 2026 16:43:43 +0000
Received: by mail-wm1-x348.google.com with SMTP id 5b1f17b1804b1-495474a5fbcso31228395e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Aug 2026 09:43:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786121020; x=1786725820; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8GYrEvMvff5zvEdtopJDUiIvGuJM4d42FcGqOwQV2a4=;
        b=jWnnGHkuIr5UA7hShIW0Bx77Xskox1g3aOS5PeG8qTTfO0FBNDko6m+q+YGlCKxcuK
         yw898M63CR5O1piumJ0qKqP7rR7dL9ftufxsQavBrLa5aRWXgcLNDhCxPMTgQnv0oXnu
         GmDSWznaCTJwAJr+As9BDIn4CbgjjhVlG9UR8SlH0Yy73RcRFbNvNjJT+d0HY4yq95zZ
         KTCzeP34DW1sNvRP3xKx5lV8/Xru0HQB0ZlGMVGYpc9hZpUZ1Z1ofbAFTwCukQLJrnF9
         YzSD5ti4SSBRIw1ROJKFM/3ZiN8Hwz+v6tp+r79tNyWn8qOk9sWc4DKAkV6i/yxbiXZp
         6s+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786121020; x=1786725820;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8GYrEvMvff5zvEdtopJDUiIvGuJM4d42FcGqOwQV2a4=;
        b=afH1qDS8p618A8qj7RajKNfLfc/dBP01nYP9GJO1D03t9xx6Oxf3tii2NKUWNZB7Xh
         DaMxvIf5/Gbj+3HVBAI/ezVU6xny4KCaWnOZz4BmXRw2AlJ3kbmhs/AI648nllfwOoni
         HqRbA2t6KG2F9M8Ou/+WIIN53ydcaDKjSbZqTr9krRUlE9e/DgLlHrmelPcY6Yx1OG5J
         IcyRtXHaEoCfoGwdkwrC08wCq2NeJCCyv4k296s//x6Ir7Bb/qx1SAHdK8OxY0r+Ca1f
         KzeQqRoFRAb3sHFOA/1aBnQtv5CP/8QQgN2PHvb3DGWITbQlyeeZZ4bH9bjJRIma++YT
         uPEA==
X-Forwarded-Encrypted: i=1; AHgh+RpM6zE3WyQblhw1mOFfXuohzvqF3lqGOTjBxfROcmCiv8GWcnGPXloiTPxZ46sTztXsGxSbR2YOBk4AQeoUXLDt@lists.infradead.org
X-Gm-Message-State: AOJu0Yw6DxPf7A4PCg+x1rcCS/g50kH88dztDDDjcFdNcng5RZBnco+U
	EaEuDtLAq8zq5xi/scfbntFR2oIj8QlVxkkZTBkPwm5zhNV72g0YMMe97hLYn4ztGS42uSQrNQU
	NE4D7NUlG0uTT5V6Jo/siF9b8osgG5w==
X-Received: from wmbb14.prod.google.com ([2002:a05:600c:588e:b0:495:4a25:69f7])
 (user=sebastianene job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1d23:b0:499:51cc:4e57 with SMTP id 5b1f17b1804b1-499617f7699mr13301535e9.0.1786121019899;
 Fri, 07 Aug 2026 09:43:39 -0700 (PDT)
Date: Fri,  7 Aug 2026 16:43:11 +0000
In-Reply-To: <20260807164322.2970811-2-sebastianene@google.com>
Mime-Version: 1.0
References: <20260807164322.2970811-2-sebastianene@google.com>
X-Mailer: git-send-email 2.55.0.654.g21b8a5bc05-goog
Message-ID: <20260807164322.2970811-3-sebastianene@google.com>
Subject: [PATCH v2 01/13] KVM: arm64: Donate MMIO to the hypervisor
From: Sebastian Ene <sebastianene@google.com>
To: catalin.marinas@arm.com, fuad.tabba@linux.dev, joey.gouly@arm.com, 
	mark.rutland@arm.com, maz@kernel.org, oupton@kernel.org, rananta@google.com, 
	Sascha.Bischoff@arm.com, suzuki.poulose@arm.com, will@kernel.org
Cc: kvmarm@lists.linux.dev, android-kvm@google.com, bgrzesik@google.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	nathan@kernel.org, perlarsen@google.com, sebastianene@google.com, 
	seiden@linux.ibm.com, smostafa@google.com, tglx@kernel.org, 
	vdonnefort@google.com, vladimir.murzin@arm.com, yuzenghui@huawei.com, 
	zenghui.yu@linux.dev
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_094342_624202_7285F83A 
X-CRM114-Status: GOOD (  19.60  )
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

From: Mostafa Saleh <smostafa@google.com>

Extend the pKVM API to allow the donation of MMIO from the host
address space to the hypervisor linear map.
Initialize the host s2 page table with an invalid leaf with the owner ID
of the hypervisor to prevent the host from mapping the page on faults.
Prevent kvm_pgtable_stage2_unmap() from removing owner ID from
stage-2 PTEs, as this can be triggered from recycle logic under memory
pressure.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
Signed-off-by: Sebastian Ene <sebastianene@google.com>
---
 arch/arm64/kvm/hyp/include/nvhe/mem_protect.h |   7 +
 arch/arm64/kvm/hyp/nvhe/mem_protect.c         | 137 +++++++++++++++++-
 arch/arm64/kvm/hyp/pgtable.c                  |  11 +-
 3 files changed, 148 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h b/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
index 29935c7da1de..6aa83b129e61 100644
--- a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
+++ b/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
@@ -36,6 +36,13 @@ int __pkvm_guest_share_host(struct pkvm_hyp_vcpu *vcpu, u64 gfn);
 int __pkvm_guest_unshare_host(struct pkvm_hyp_vcpu *vcpu, u64 gfn);
 int __pkvm_host_unshare_hyp(u64 pfn);
 int __pkvm_host_donate_hyp(u64 pfn, u64 nr_pages);
+/*
+ * Donate MMIO range to the hypervisor, it will be mapped in the hypervisor's
+ * linea map and unmapped from the host stage-2.
+ */
+int __pkvm_host_donate_hyp_mmio(phys_addr_t addr, size_t size);
+/* Remaps MMIO range in the host, typically used in error path. */
+int __pkvm_hyp_donate_host_mmio(phys_addr_t addr, size_t size);
 int __pkvm_hyp_donate_host(u64 pfn, u64 nr_pages);
 int __pkvm_host_share_ffa(u64 pfn, u64 nr_pages);
 int __pkvm_host_unshare_ffa(u64 pfn, u64 nr_pages);
diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
index 4e329e39a695..5cf7c4a0ed20 100644
--- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
+++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
@@ -378,7 +378,11 @@ static int host_stage2_unmap_dev_all(void)
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
@@ -1119,6 +1123,137 @@ int __pkvm_host_donate_hyp(u64 pfn, u64 nr_pages)
 	return ret;
 }
 
+int __pkvm_host_donate_hyp_mmio(phys_addr_t addr, size_t size)
+{
+	kvm_pte_t pte;
+	u64 offset;
+	void *virt;
+	int ret;
+
+	/* Only before de-privilege. */
+	if (static_branch_unlikely(&kvm_protected_mode_initialized))
+		return -EPERM;
+
+	if (!PAGE_ALIGNED(addr | size) ||
+	    !pfn_range_is_valid(hyp_phys_to_pfn(addr), size >> PAGE_SHIFT))
+		return -EINVAL;
+
+	host_lock_component();
+	hyp_lock_component();
+
+	for (offset = 0; offset < size; offset += PAGE_SIZE) {
+		if (addr_is_memory(addr + offset)) {
+			ret = -EINVAL;
+			goto err_with_mapping;
+		}
+
+		ret = kvm_pgtable_get_leaf(&host_mmu.pgt, addr + offset, &pte, NULL);
+		if (ret)
+			goto err_with_mapping;
+
+		if (pte && !kvm_pte_valid(pte)) {
+			ret = -EPERM;
+			goto err_with_mapping;
+		}
+
+		virt = __hyp_va(addr + offset);
+		ret = kvm_pgtable_get_leaf(&pkvm_pgtable, (u64)virt, &pte, NULL);
+		if (ret)
+			goto err_with_mapping;
+		if (pte) {
+			ret = -EBUSY;
+			goto err_with_mapping;
+		}
+
+		ret = pkvm_create_mappings_locked(virt, virt + PAGE_SIZE, PAGE_HYP_DEVICE);
+		if (ret)
+			goto err_with_mapping;
+	}
+
+	/*
+	 * We set HYP as the owner of the MMIO pages in the host stage-2, for:
+	 * - host aborts: host_stage2_adjust_range() would fail for invalid non zero PTEs.
+	 * - recycle under memory pressure: host_stage2_unmap_dev_all() would call
+	 *   kvm_pgtable_stage2_unmap() which will not clear non zero invalid ptes (counted).
+	 * - other MMIO donation: Would fail as we check that the PTE is valid or empty.
+	 */
+	ret = host_stage2_try(kvm_pgtable_stage2_annotate, &host_mmu.pgt,
+			      addr, size, &host_s2_pool,
+			      KVM_HOST_INVALID_PTE_TYPE_DONATION,
+			      FIELD_PREP(KVM_HOST_DONATION_PTE_OWNER_MASK, PKVM_ID_HYP));
+	if (ret)
+		goto err_with_mapping;
+unlock:
+	hyp_unlock_component();
+	host_unlock_component();
+	return ret;
+err_with_mapping:
+	if (!offset)
+		goto unlock;
+
+	while (offset) {
+		offset -= PAGE_SIZE;
+		virt = __hyp_va(addr + offset);
+		WARN_ON(kvm_pgtable_hyp_unmap(&pkvm_pgtable, (u64)virt, PAGE_SIZE) != PAGE_SIZE);
+	}
+	goto unlock;
+}
+
+int __pkvm_hyp_donate_host_mmio(phys_addr_t addr, size_t size)
+{
+	kvm_pte_t pte;
+	u64 offset;
+	int ret = 0;
+	void *virt;
+
+	if (static_branch_unlikely(&kvm_protected_mode_initialized))
+		return -EPERM;
+
+	if (!PAGE_ALIGNED(addr | size) ||
+	    !pfn_range_is_valid(hyp_phys_to_pfn(addr), size >> PAGE_SHIFT))
+		return -EINVAL;
+
+	host_lock_component();
+	hyp_lock_component();
+
+	for (offset = 0; offset < size; offset += PAGE_SIZE) {
+		if (addr_is_memory(addr + offset)) {
+			ret = -EINVAL;
+			goto err_with_unmap;
+		}
+		ret = kvm_pgtable_get_leaf(&host_mmu.pgt, addr + offset, &pte, NULL);
+		if (ret)
+			goto err_with_unmap;
+		if (!pte || kvm_pte_valid(pte)) {
+			ret = -EINVAL;
+			goto err_with_unmap;
+		}
+		if (FIELD_GET(KVM_HOST_DONATION_PTE_OWNER_MASK, pte) != PKVM_ID_HYP) {
+			ret = -EPERM;
+			goto err_with_unmap;
+		}
+
+		virt = __hyp_va(addr + offset);
+		if (kvm_pgtable_hyp_unmap(&pkvm_pgtable, (u64)virt, PAGE_SIZE) != PAGE_SIZE)
+			goto err_with_unmap;
+	}
+	WARN_ON(host_stage2_idmap_locked(addr, size, PKVM_HOST_MMIO_PROT));
+unlock:
+	hyp_unlock_component();
+	host_unlock_component();
+	return ret;
+err_with_unmap:
+	if (!offset)
+		goto unlock;
+
+	while (offset) {
+		offset -= PAGE_SIZE;
+		virt = __hyp_va(addr + offset);
+		WARN_ON(pkvm_create_mappings_locked(virt, virt + PAGE_SIZE, PAGE_HYP_DEVICE));
+	}
+	goto unlock;
+}
+
 int __pkvm_hyp_donate_host(u64 pfn, u64 nr_pages)
 {
 	u64 phys = hyp_pfn_to_phys(pfn);
diff --git a/arch/arm64/kvm/hyp/pgtable.c b/arch/arm64/kvm/hyp/pgtable.c
index b74dd5ce1efd..7638213bd893 100644
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
+	 * That also ignores stage2_pte_is_counted() instead of clearing
+	 * the PTE as the MMIO can be owned by the hypervisor.
+	 */
+	if (!kvm_pte_valid(ctx->old))
 		return 0;
-	}
 
 	if (kvm_pte_table(ctx->old, ctx->level)) {
 		childp = kvm_pte_follow(ctx->old, mm_ops);
-- 
2.55.0.654.g21b8a5bc05-goog


