Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78BCCC4450E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 11:59:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:From:Subject:Message-ID:References:Mime-Version:
	In-Reply-To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M3eZs1fgfcJqE0urG21tDoGKs0yo1icKieB+aaaZBxk=; b=SGjW+mmH5HUQVthQWcsGfDD/iX
	0+huDNQNEQfQ9vy+RqHU9TxF2aUQBwEApjoSYsOPorxImZCMu9ZPrT7LLjUZGLc4oYi8snggrIc6F
	2VJwP3fhZ8yrS9rODGdC82ifD1Ae2BDiPGr9Z5SmOboR7XujgzhCa54fDozoICbzQrNlpfjF3ss9Z
	DLpEbFDeZCrBj0UUaGmCP7atjx2pe4EkLxb93WGyjTT/oIQS0DqAXAFERsHgQUjH53K9MCV1E2Tbv
	01cj3/VCMBsr1ASV/iAW8pvGR0/1CrHWzEH7iQ0U3VzH4UOfM4uLSi5fM2B1YDI0prPPtMxhy8bz1
	X6yVuKtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjyGv-0000000Ef6T-2oBS;
	Wed, 15 Jul 2026 11:59:29 +0000
Received: from mail-wr1-x449.google.com ([2a00:1450:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjyGk-0000000Eeym-3FaV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 11:59:19 +0000
Received: by mail-wr1-x449.google.com with SMTP id ffacd0b85a97d-47f3e6cc5c4so1198831f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jul 2026 04:59:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784116755; x=1784721555; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=M3eZs1fgfcJqE0urG21tDoGKs0yo1icKieB+aaaZBxk=;
        b=wPSKdyRuCnpnDB5dT3rlAUgAIybEkfNnBf9Qyc7wVWGknS5CvHdRjEzQ0DWE8CRkt4
         prTae+pwl9SMGa39ScaIp+o6OTHfYcO4bIWk9wAFBLJQtm6YHlodNa0VT2l0p0ayU7pP
         ZpNaGEOIQc6O0mEBcu9Lr0k7MiSa2Y/oAHU4RgiPBJPGF9yRTcn0o2aLhFNjpGbAOkaC
         haA1vBrTYYGXn5j+ExH55Y7HzQ86CwLIOjQOxuCW6lmxDF/rrXTcJb2TwlCIRIhR7rYi
         M2wgfICE6bj32vfDI0DVHNS3PmhS8Msg4G1YxqMRJSDke+mY5fy28kI0sJe18zTo/HfO
         v7CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784116755; x=1784721555;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M3eZs1fgfcJqE0urG21tDoGKs0yo1icKieB+aaaZBxk=;
        b=p4Ov4iw87zbeqbw+Ezjk+Rr2kBKHeDMWI1T1WUQYs4lNKp/I5QHYx2t4OSQB7zwztF
         jwmzYisOgH0P1oa22b+iHhAg6W1AcJ2JuwuAPaFGjsUxEEKvjB16yswlhDTOzHRYJLcI
         3A6D1tidVasxsvUeWLdQe+gNPeq4BwHaQsnPRg0UNj9A3bQKsk95TCLAFKvHoy0CIFWM
         Nqcw0cU464wl8PYDH9bHSgOWYJn5phE2EaQdudERiOXdWt4JAjkg374LAust9n/EgWL2
         ASm9KPyHSwrg4n7kgxZ4OjpKlZXOBIzY8PkFYTW0UqlsrzsgeEKw7eXxpkmwo4HzDfh/
         XWUA==
X-Gm-Message-State: AOJu0YxX8RNyH+3FQnfQax6UNlM30rgcN1asg1N2BI7UC8mMKKVjE448
	wnBNfdRHOk6LTJCCZ368R09qKhUcWcohm9Lp6k9un6Ias3vkzOZaH2wss1LRRbuY1o8c8V6cYjm
	LtaFlUSRzMngg9rXHaJXOB0V32uiwI6zzIIQtalZ6e40Eav8AEN2jdq2Gc+kqJUmzwLYj06LOcw
	r1ymKaSVYX/Do15bKHv8NpjqZS9QDz3ePHQCxT7HlHsAqod/a5i4wRlWCo/hbwhStJZA==
X-Received: from wmdn11.prod.google.com ([2002:a05:600c:294b:b0:494:415:3ecd])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:621b:b0:493:faf3:3ead with SMTP id 5b1f17b1804b1-4952cc3c566mr74288995e9.4.1784116755156;
 Wed, 15 Jul 2026 04:59:15 -0700 (PDT)
Date: Wed, 15 Jul 2026 11:58:43 +0000
In-Reply-To: <20260715115906.2664882-1-smostafa@google.com>
Mime-Version: 1.0
References: <20260715115906.2664882-1-smostafa@google.com>
X-Mailer: git-send-email 2.55.0.141.g00534a21ce-goog
Message-ID: <20260715115906.2664882-3-smostafa@google.com>
Subject: [PATCH v7 02/24] KVM: arm64: Donate MMIO to the hypervisor
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
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_045918_861705_62A7C615 
X-CRM114-Status: GOOD (  21.31  )
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
 arch/arm64/kvm/hyp/include/nvhe/mem_protect.h |  7 ++
 arch/arm64/kvm/hyp/nvhe/mem_protect.c         | 91 ++++++++++++++++++-
 arch/arm64/kvm/hyp/pgtable.c                  | 11 +--
 3 files changed, 102 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h b/arch/arm64/kvm=
/hyp/include/nvhe/mem_protect.h
index 29935c7da1de..51b0eb3844a9 100644
--- a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
+++ b/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
@@ -36,6 +36,13 @@ int __pkvm_guest_share_host(struct pkvm_hyp_vcpu *vcpu, =
u64 gfn);
 int __pkvm_guest_unshare_host(struct pkvm_hyp_vcpu *vcpu, u64 gfn);
 int __pkvm_host_unshare_hyp(u64 pfn);
 int __pkvm_host_donate_hyp(u64 pfn, u64 nr_pages);
+/*
+ * Donate MMIO range to the hypervisor, it will be mapped in the hyperviso=
r's
+ * private range and unmapped from the host stage-2.
+ */
+int __pkvm_host_donate_hyp_mmio(phys_addr_t addr, size_t size, unsigned lo=
ng *haddr);
+/* Remaps MMIO range in the host, typically used in error path. */
+int __pkvm_hyp_donate_host_mmio(phys_addr_t addr, size_t size);
 int __pkvm_hyp_donate_host(u64 pfn, u64 nr_pages);
 int __pkvm_host_share_ffa(u64 pfn, u64 nr_pages);
 int __pkvm_host_unshare_ffa(u64 pfn, u64 nr_pages);
diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvh=
e/mem_protect.c
index 4e329e39a695..d803b3dd4cb4 100644
--- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
+++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
@@ -378,7 +378,11 @@ static int host_stage2_unmap_dev_all(void)
 	u64 addr =3D 0;
 	int i, ret;
=20
-	/* Unmap all non-memory regions to recycle the pages */
+	/*
+	 * Unmap all non-memory regions to recycle the pages.
+	 * That relies on kvm_pgtable_stage2_unmap() not clearing
+	 * counted PTEs which include hypervisor MMIO.
+	 */
 	for (i =3D 0; i < hyp_memblock_nr; i++, addr =3D reg->base + reg->size) {
 		reg =3D &hyp_memory[i];
 		ret =3D kvm_pgtable_stage2_unmap(pgt, addr, reg->base - addr);
@@ -1119,6 +1123,91 @@ int __pkvm_host_donate_hyp(u64 pfn, u64 nr_pages)
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
+	if (!PAGE_ALIGNED(addr | size) ||
+	    !pfn_range_is_valid(hyp_phys_to_pfn(addr), size >> PAGE_SHIFT))
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
+	if (!PAGE_ALIGNED(addr | size) ||
+	    !pfn_range_is_valid(hyp_phys_to_pfn(addr), size >> PAGE_SHIFT))
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
index 91a7dfad6686..3073184cf6ad 100644
--- a/arch/arm64/kvm/hyp/pgtable.c
+++ b/arch/arm64/kvm/hyp/pgtable.c
@@ -1161,13 +1161,12 @@ static int stage2_unmap_walker(const struct kvm_pgt=
able_visit_ctx *ctx,
 	kvm_pte_t *childp =3D NULL;
 	bool need_flush =3D false;
=20
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
=20
 	if (kvm_pte_table(ctx->old, ctx->level)) {
 		childp =3D kvm_pte_follow(ctx->old, mm_ops);
--=20
2.55.0.141.g00534a21ce-goog


