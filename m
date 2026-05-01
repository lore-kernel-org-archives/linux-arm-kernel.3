Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22722CCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 May 2026 11:20:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:From:Subject:Message-ID:References:Mime-Version:
	In-Reply-To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MJCtNul8s1oM/6GNPCvZ51Sl0VZ6ziIdGPUB2bbn4jI=; b=fwFGvp7BpF49pq31CgkEHIplJN
	slmcJKiZl1wVgv7zsQ8TGQrMceH5gOwArlVKT86PMoNCspngR3qJcvf07ybUJAJIW/JuCqLrq7u+Z
	9MTIdv4npK856XKvmzDc2fWEzCh+jJOwynF1VgX8JuiRtuQO8XLkbeXqYv8975SjRWge5F1ANqlif
	3SWRDqZOG4qz51hMOqVT0wTbjep2LwV/f4xkesg9GG8NHNwxPUj61HuWK+d4OtEKofbzYl9osHGIV
	oupFc9NCWjWibL9FytDGLDCMouVILVqg19hSe9Rx6vQgOOMI/hF/9ZhQD/bKWhKlQlSwvMM9T2bCa
	JonhbSrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIluY-00000006cYv-1I6y;
	Fri, 01 May 2026 11:19:58 +0000
Received: from mail-wr1-x44a.google.com ([2a00:1450:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIluV-00000006cXI-3ydw
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 May 2026 11:19:57 +0000
Received: by mail-wr1-x44a.google.com with SMTP id ffacd0b85a97d-44696b11265so2033316f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 01 May 2026 04:19:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777634394; x=1778239194; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MJCtNul8s1oM/6GNPCvZ51Sl0VZ6ziIdGPUB2bbn4jI=;
        b=aLV8tTQKL8hFQkn6bn2ENCcofeTX3OdvR3hq1F94YurosXgzRT3MiGxlNkecF/8npj
         BvBzkLe9sg3HLmjXDKyUqGGhuaxI5IkdRV5QJcxh9roZ+nKWeykHDTPbSV0CJijUM6lO
         TIL13YfmZkpyMoroNc1liKSaS4XwqeoJObHm60aFYGAvmRg//weszpQUN7eQlQXA5HwA
         ASZ9bhxDg6uICorYc6uUcJZy4Wm/kMfXc/nQRAbQy4TZBbpKiRIBOzuOmS2fzQ4slTJS
         ADrr9Nhg7jrvA6bjYYgSQW42AxkGsQBZmYIsb4Mn9OHlk2CR9FQZNySfHyAJueWabaQ0
         Wf2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777634394; x=1778239194;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=MJCtNul8s1oM/6GNPCvZ51Sl0VZ6ziIdGPUB2bbn4jI=;
        b=ayQPaYvDDS3hrc0RuWN/H+04wVO3TceF50DeszMdPn1wIiJILoDC3ww5iytgL3fkzD
         O4SStoeBMzxkCpm59KaPpEJKZd+uwdXMcKmCV4QVV17/ePsa89ol9z/o2BfhTvC2ZwMb
         soCXvo0blpo8hXyPz1hYMWxfdFxGWFb+40sygborU2S5gC+7X0/5nN2+1VFdgvPlWsy7
         /Gj7ylir7AfS0w9XKXRIbIacaaiCmZC5ahq6HaTyGCtLnWbfO9Sgen1TlZH0c6RB1bCs
         FSkWm9nwvYXQYuUTTbLscQUKG0/wcuTx1XvyfSJqNWHmwKNhtiEBa+wh2vN5KaqptUKg
         yzZQ==
X-Gm-Message-State: AOJu0Yzw4NjC0bPqrOgGjuB6nL49o6voobNNzixIQDXaIkzlOkxtFhuL
	vUpsC26vqU8rQY7BgkQ8VJdGpwxSiSP/KaGhNH0de9hKz109cqUXLDzHNN6I9mGDRyN0BNjiFcb
	ZLmyYP64WWjPVXNILFcK1S6jUnioOVIZpwiytS2Mo7A1jcWd/wmnuWuw2zR5qOAWV/QYLIY7iLT
	kTDsVJOU834Xo9eDiRFVG+fkZ2lRt9WgLhKaHYS/CP7SwUW8bi2SWcSpdJmZAZPPPYjQ==
X-Received: from wmqy6.prod.google.com ([2002:a05:600c:3646:b0:488:a6d9:e91a])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:c170:b0:489:1a63:509c with SMTP id 5b1f17b1804b1-48a83d06bc3mr102554135e9.0.1777634393631;
 Fri, 01 May 2026 04:19:53 -0700 (PDT)
Date: Fri,  1 May 2026 11:19:04 +0000
In-Reply-To: <20260501111928.259252-1-smostafa@google.com>
Mime-Version: 1.0
References: <20260501111928.259252-1-smostafa@google.com>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
Message-ID: <20260501111928.259252-3-smostafa@google.com>
Subject: [PATCH v6 02/25] KVM: arm64: Donate MMIO to the hypervisor
From: Mostafa Saleh <smostafa@google.com>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kvmarm@lists.linux.dev, iommu@lists.linux.dev
Cc: catalin.marinas@arm.com, will@kernel.org, maz@kernel.org, 
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, joro@8bytes.org, jean-philippe@linaro.org, jgg@ziepe.ca, 
	mark.rutland@arm.com, qperret@google.com, tabba@google.com, 
	vdonnefort@google.com, sebastianene@google.com, keirf@google.com, 
	Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260501_041956_025849_DD9D6252 
X-CRM114-Status: GOOD (  21.14  )
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

As donating MMIO is very rare, and we don=E2=80=99t need to encode the full
state, it=E2=80=99s reasonable to have a separate function to do this.
It will init the host s2 page table with an invalid leaf with the owner ID
to prevent the host from mapping the page on faults.

Also, prevent kvm_pgtable_stage2_unmap() from removing owner ID from
stage-2 PTEs, as this can be triggered from recycle logic under memory
pressure. There is no code relying on this, as all ownership changes is
done via kvm_pgtable_stage2_set_owner()

For the error path in IOMMU drivers, add a function to donate MMIO
back from hyp to host. However, that leaks the hypervisor virtual
address range which should be acceptable as this is quite rare and
it matches the behaviour of fix_map/block.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 arch/arm64/kvm/hyp/include/nvhe/mem_protect.h |   2 +
 arch/arm64/kvm/hyp/nvhe/mem_protect.c         | 119 +++++++++++++++++-
 arch/arm64/kvm/hyp/pgtable.c                  |   9 +-
 3 files changed, 121 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h b/arch/arm64/kvm=
/hyp/include/nvhe/mem_protect.h
index 3cbfae0e3dda..ff440204d2c7 100644
--- a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
+++ b/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
@@ -36,6 +36,8 @@ int __pkvm_guest_share_host(struct pkvm_hyp_vcpu *vcpu, u=
64 gfn);
 int __pkvm_guest_unshare_host(struct pkvm_hyp_vcpu *vcpu, u64 gfn);
 int __pkvm_host_unshare_hyp(u64 pfn);
 int __pkvm_host_donate_hyp(u64 pfn, u64 nr_pages);
+int __pkvm_host_donate_hyp_mmio(phys_addr_t addr, size_t size, unsigned lo=
ng *haddr);
+int __pkvm_hyp_donate_host_mmio(phys_addr_t addr, size_t size);
 int __pkvm_hyp_donate_host(u64 pfn, u64 nr_pages);
 int __pkvm_host_share_ffa(u64 pfn, u64 nr_pages);
 int __pkvm_host_unshare_ffa(u64 pfn, u64 nr_pages);
diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvh=
e/mem_protect.c
index 28a471d1927c..2fb20a63a417 100644
--- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
+++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
@@ -353,6 +353,38 @@ int __pkvm_prot_finalize(void)
 	return 0;
 }
=20
+/* Unmap MMIO region while skipping donated PTEs. */
+static int host_stage2_unmap_mmio_region(u64 start, u64 size)
+{
+	struct kvm_pgtable *pgt =3D &host_mmu.pgt;
+	u64 unmap_start =3D start;
+	u64 addr =3D start;
+	kvm_pte_t pte;
+	int ret =3D 0;
+	u8 level;
+
+	while (addr < start + size) {
+		ret =3D kvm_pgtable_get_leaf(pgt, addr, &pte, &level);
+		if (ret)
+			return ret;
+		if (!kvm_pte_valid(pte) && pte !=3D 0) {
+			if (addr > unmap_start) {
+				ret =3D kvm_pgtable_stage2_unmap(pgt, unmap_start,
+							       addr - unmap_start);
+				if (ret)
+					return ret;
+			}
+			addr +=3D kvm_granule_size(level);
+			unmap_start =3D addr;
+		} else {
+			addr +=3D kvm_granule_size(level);
+		}
+	}
+	if (addr > unmap_start)
+		ret =3D kvm_pgtable_stage2_unmap(pgt, unmap_start, addr - unmap_start);
+	return ret;
+}
+
 static int host_stage2_unmap_dev_all(void)
 {
 	struct kvm_pgtable *pgt =3D &host_mmu.pgt;
@@ -363,11 +395,11 @@ static int host_stage2_unmap_dev_all(void)
 	/* Unmap all non-memory regions to recycle the pages */
 	for (i =3D 0; i < hyp_memblock_nr; i++, addr =3D reg->base + reg->size) {
 		reg =3D &hyp_memory[i];
-		ret =3D kvm_pgtable_stage2_unmap(pgt, addr, reg->base - addr);
+		ret =3D host_stage2_unmap_mmio_region(addr, reg->base - addr);
 		if (ret)
 			return ret;
 	}
-	return kvm_pgtable_stage2_unmap(pgt, addr, BIT(pgt->ia_bits) - addr);
+	return host_stage2_unmap_mmio_region(addr, BIT(pgt->ia_bits) - addr);
 }
=20
 /*
@@ -1087,6 +1119,89 @@ int __pkvm_host_donate_hyp(u64 pfn, u64 nr_pages)
 	return ret;
 }
=20
+int __pkvm_host_donate_hyp_mmio(phys_addr_t addr, size_t size, unsigned lo=
ng *haddr)
+{
+	kvm_pte_t pte;
+	u64 offset;
+	int ret;
+
+	/* Only before de-privilege. */
+	if (static_branch_unlikely(&kvm_protected_mode_initialized))
+		return -EPERM;
+
+	if (!PAGE_ALIGNED(addr | size))
+		return -EINVAL;
+
+	ret =3D __pkvm_create_private_mapping(addr, size, PAGE_HYP_DEVICE, haddr)=
;
+	if (ret)
+		return ret;
+
+	host_lock_component();
+	for (offset =3D 0; offset < size; offset +=3D PAGE_SIZE) {
+		if (addr_is_memory(addr + offset)) {
+			ret =3D -EINVAL;
+			goto unlock;
+		}
+		ret =3D kvm_pgtable_get_leaf(&host_mmu.pgt, addr + offset, &pte, NULL);
+		if (ret)
+			goto unlock;
+		if (pte && !kvm_pte_valid(pte)) {
+			ret =3D -EPERM;
+			goto unlock;
+		}
+	}
+	/*
+	 * We set HYP as the owner of the MMIO pages in the host stage-2, for:
+	 * - host aborts: host_stage2_adjust_range() would fail for invalid non z=
ero PTEs.
+	 * - recycle under memory pressure: host_stage2_unmap_dev_all() would cal=
l
+	 *   kvm_pgtable_stage2_unmap() which will not clear non zero invalid pte=
s (counted).
+	 * - other MMIO donation: Would fail as we check that the PTE is valid or=
 empty.
+	 */
+	ret =3D host_stage2_try(kvm_pgtable_stage2_annotate, &host_mmu.pgt,
+			      addr, size, &host_s2_pool,
+			      KVM_HOST_INVALID_PTE_TYPE_DONATION,
+			      FIELD_PREP(KVM_HOST_DONATION_PTE_OWNER_MASK, PKVM_ID_HYP));
+unlock:
+	host_unlock_component();
+	return ret;
+}
+
+int __pkvm_hyp_donate_host_mmio(phys_addr_t addr, size_t size)
+{
+	kvm_pte_t pte;
+	u64 offset;
+	int ret =3D 0;
+
+	if (static_branch_unlikely(&kvm_protected_mode_initialized))
+		return -EPERM;
+
+	if (!PAGE_ALIGNED(addr | size))
+		return -EINVAL;
+
+	host_lock_component();
+	for (offset =3D 0; offset < size; offset +=3D PAGE_SIZE) {
+		if (addr_is_memory(addr + offset)) {
+			ret =3D -EINVAL;
+			goto unlock;
+		}
+		ret =3D kvm_pgtable_get_leaf(&host_mmu.pgt, addr + offset, &pte, NULL);
+		if (ret)
+			goto unlock;
+		if (!pte || kvm_pte_valid(pte)) {
+			ret =3D -EINVAL;
+			goto unlock;
+		}
+		if (FIELD_GET(KVM_HOST_DONATION_PTE_OWNER_MASK, pte) !=3D PKVM_ID_HYP) {
+			ret =3D -EPERM;
+			goto unlock;
+		}
+	}
+	WARN_ON(host_stage2_idmap_locked(addr, size, PKVM_HOST_MMIO_PROT));
+unlock:
+	host_unlock_component();
+	return ret;
+}
+
 int __pkvm_hyp_donate_host(u64 pfn, u64 nr_pages)
 {
 	u64 phys =3D hyp_pfn_to_phys(pfn);
diff --git a/arch/arm64/kvm/hyp/pgtable.c b/arch/arm64/kvm/hyp/pgtable.c
index 0c1defa5fb0f..b64a50f9bfa8 100644
--- a/arch/arm64/kvm/hyp/pgtable.c
+++ b/arch/arm64/kvm/hyp/pgtable.c
@@ -1159,13 +1159,8 @@ static int stage2_unmap_walker(const struct kvm_pgta=
ble_visit_ctx *ctx,
 	kvm_pte_t *childp =3D NULL;
 	bool need_flush =3D false;
=20
-	if (!kvm_pte_valid(ctx->old)) {
-		if (stage2_pte_is_counted(ctx->old)) {
-			kvm_clear_pte(ctx->ptep);
-			mm_ops->put_page(ctx->ptep);
-		}
-		return 0;
-	}
+	if (!kvm_pte_valid(ctx->old))
+		return stage2_pte_is_counted(ctx->old) ? -EPERM : 0;
=20
 	if (kvm_pte_table(ctx->old, ctx->level)) {
 		childp =3D kvm_pte_follow(ctx->old, mm_ops);
--=20
2.54.0.545.g6539524ca2-goog


