Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1001FD2D6E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Mar 2026 12:49:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:From:Subject:Message-ID:References:Mime-Version:
	In-Reply-To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p112r6vXdhUi4U6D+bqdMKbRGwHW3a/qIYzeua87t30=; b=zd5mLv86/UPTR71rNWdI7e2Xx2
	TKu9Al3MlXWTqKCqqc0/l7n7uPg9Bn3udvu+HNjO18WvO3v0uTwF5ET4fLLLV8fKotecHpkt82CcN
	CeJ+6eMZZ7p5zCg0gMioPaZaCoY6MXRbLj4IiqYOeKx0nsTxL2lkn/EtFQgnKBeXkqV0bFPq6ZVBK
	tCjbREAzyfcA+mCn2WzR3wnD8/N6RzCNhgpGd9GfHA1Nv735vi38nTZNboGcG4syFLBB/CZhVr/CG
	hZH47mGw1f5DRpQzj/qsPPT6A0I96sZme8W9AuEe+FKXdxLCu/16xYEiIyyxjulGT4YCYTfL6+owt
	JOWHhyKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzwWy-00000009W4J-3F5U;
	Tue, 10 Mar 2026 12:49:48 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzwWv-00000009W2Q-1kLD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Mar 2026 12:49:46 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-485397788b3so24575435e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Mar 2026 05:49:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773146983; x=1773751783; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p112r6vXdhUi4U6D+bqdMKbRGwHW3a/qIYzeua87t30=;
        b=KIGRNH6ZgsECMNaxku994Bkw7D7wWDHV8LLYfGQ8OwdpmSY6AWhRr+o2SJDwDnwV8K
         3GSOmAfT/yWRslsadWOFZ0YHDnQWT2/0CzxhigllUHS+XutrYlra/DRPfa1rqno2WvUv
         tkuNNVNiQZOPK0uOZHkkRgJ0sEVMNLdRgzQ/w6ct5V9ZZQIhzKMmrcK77JaRaDo4tGa3
         I31TbZ4C4dOUT/Lry5iZ18OMWafnffRKUOHp52ElIKi8tH1kA8uZr5LP8kyOGf9lLwYU
         vQfhY5aG4e6wyjH+URZJgXa1OEU/9JRM+uAtSvRe4Mp6X7pQl3i7/f24rPS3ljUvR8Zt
         NLxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773146983; x=1773751783;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=p112r6vXdhUi4U6D+bqdMKbRGwHW3a/qIYzeua87t30=;
        b=fxpqng4ckBT6VbBOk7uSepc1DyngRnJaBoYdegd6h7dCBusNtL1LNSlt1+WmXsglti
         LcFhYICYY6CxpGBYYDvX0d1aYInvubX51+fwLrxzkz6+qJG8s6jOxmS86i/aOgldWknm
         mgJEzKzJiXJklwdstI8YdYtQvMqP1nIxpCb7JN+aVV4mb+761xd5GKFdkx8TKsaQ4Sjv
         k5I/MAHLtACLuO0fnEm3Ogqiy9XCwxkeQJ1AAG30NW9tDqTqZ0TElJdeZv0olvPuJu6D
         1idbfBsyqaY80aRhW5MMXm/cT92VuUU+h+jpPhQx3zBky55GBMIpbkMpCSIje7BZOtYG
         TYyA==
X-Forwarded-Encrypted: i=1; AJvYcCWiFK4Ku5dtcKkBCCPF/UoXGnN5IrH5rcv7Jyf4k3azoWtJw4rz1aezxfP9lBMccu0AQ4YqH2v1Y5j+uu3wc1D/@lists.infradead.org
X-Gm-Message-State: AOJu0Ywkl/qeJvLZj/fOEEzhYUXEsnxMOKNdqDLNSoxMaeQhCR4aPuNF
	u3DXj2DsUxyVQSCxFDLuahvWIxn+1tjRN5mEpHGrrkN+6UWr3aLz7gFLM+r7Txcx9zydDYcjoSl
	lrH3mWQ/i3UYLQso6QmaiBsRl7RdXug==
X-Received: from wmbfp26.prod.google.com ([2002:a05:600c:699a:b0:485:29bb:91fc])
 (user=sebastianene job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:8485:b0:485:3fe6:2209 with SMTP id 5b1f17b1804b1-4853fe622dcmr81484045e9.11.1773146983096;
 Tue, 10 Mar 2026 05:49:43 -0700 (PDT)
Date: Tue, 10 Mar 2026 12:49:20 +0000
In-Reply-To: <20260310124933.830025-1-sebastianene@google.com>
Mime-Version: 1.0
References: <20260310124933.830025-1-sebastianene@google.com>
X-Mailer: git-send-email 2.53.0.473.g4a7958ca14-goog
Message-ID: <20260310124933.830025-2-sebastianene@google.com>
Subject: [PATCH 01/14] KVM: arm64: Donate MMIO to the hypervisor
From: Sebastian Ene <sebastianene@google.com>
To: alexandru.elisei@arm.com, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	android-kvm@google.com
Cc: catalin.marinas@arm.com, dbrazdil@google.com, joey.gouly@arm.com, 
	kees@kernel.org, mark.rutland@arm.com, maz@kernel.org, oupton@kernel.org, 
	perlarsen@google.com, qperret@google.com, rananta@google.com, 
	sebastianene@google.com, smostafa@google.com, suzuki.poulose@arm.com, 
	tabba@google.com, tglx@kernel.org, vdonnefort@google.com, bgrzesik@google.com, 
	will@kernel.org, yuzenghui@huawei.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_054945_492567_FABE494B 
X-CRM114-Status: GOOD (  19.35  )
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

Add a function to donate MMIO to the hypervisor so IOMMU hypervisor
drivers can use that to protect the MMIO of IOMMU.
The initial attempt to implement this was to have a new flag to
"___pkvm_host_donate_hyp" to accept MMIO. However that had many problems,
it was quite intrusive for host/hyp to check/set page state to make it
aware of MMIO and to encode the state in the page table in that case.
Which is called in paths that can be sensitive to performance (FFA, VMs..)

As donating MMIO is very rare, and we don=E2=80=99t need to encode the full
state, it=E2=80=99s reasonable to have a separate function to do this.
It will init the host s2 page table with an invalid leaf with the owner ID
to prevent the host from mapping the page on faults.

Also, prevent kvm_pgtable_stage2_unmap() from removing owner ID from
stage-2 PTEs, as this can be triggered from recycle logic under memory
pressure. There is no code relying on this, as all ownership changes is
done via kvm_pgtable_stage2_set_owner()

For error path in IOMMU drivers, add a function to donate MMIO back
from hyp to host.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 arch/arm64/kvm/hyp/include/nvhe/mem_protect.h |  2 +
 arch/arm64/kvm/hyp/nvhe/mem_protect.c         | 90 +++++++++++++++++++
 arch/arm64/kvm/hyp/pgtable.c                  |  9 +-
 3 files changed, 94 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h b/arch/arm64/kvm=
/hyp/include/nvhe/mem_protect.h
index 5f9d56754e39..8b617e6fc0e0 100644
--- a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
+++ b/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
@@ -31,6 +31,8 @@ enum pkvm_component_id {
 };
=20
 extern unsigned long hyp_nr_cpus;
+int __pkvm_host_donate_hyp_mmio(u64 pfn);
+int __pkvm_hyp_donate_host_mmio(u64 pfn);
=20
 int __pkvm_prot_finalize(void);
 int __pkvm_host_share_hyp(u64 pfn);
diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvh=
e/mem_protect.c
index 38f66a56a766..0808367c52e5 100644
--- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
+++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
@@ -784,6 +784,96 @@ int __pkvm_host_unshare_hyp(u64 pfn)
 	return ret;
 }
=20
+int __pkvm_host_donate_hyp_mmio(u64 pfn)
+{
+	u64 phys =3D hyp_pfn_to_phys(pfn);
+	void *virt =3D __hyp_va(phys);
+	int ret;
+	kvm_pte_t pte;
+
+	if (addr_is_memory(phys))
+		return -EINVAL;
+
+	host_lock_component();
+	hyp_lock_component();
+
+	ret =3D kvm_pgtable_get_leaf(&host_mmu.pgt, phys, &pte, NULL);
+	if (ret)
+		goto unlock;
+
+	if (pte && !kvm_pte_valid(pte)) {
+		ret =3D -EPERM;
+		goto unlock;
+	}
+
+	ret =3D kvm_pgtable_get_leaf(&pkvm_pgtable, (u64)virt, &pte, NULL);
+	if (ret)
+		goto unlock;
+	if (pte) {
+		ret =3D -EBUSY;
+		goto unlock;
+	}
+
+	ret =3D pkvm_create_mappings_locked(virt, virt + PAGE_SIZE, PAGE_HYP_DEVI=
CE);
+	if (ret)
+		goto unlock;
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
+	WARN_ON(host_stage2_try(kvm_pgtable_stage2_set_owner, &host_mmu.pgt, phys=
,
+				PAGE_SIZE, &host_s2_pool, PKVM_ID_HYP));
+unlock:
+	hyp_unlock_component();
+	host_unlock_component();
+
+	return ret;
+}
+
+int __pkvm_hyp_donate_host_mmio(u64 pfn)
+{
+	u64 phys =3D hyp_pfn_to_phys(pfn);
+	u64 virt =3D (u64)__hyp_va(phys);
+	size_t size =3D PAGE_SIZE;
+	int ret;
+	kvm_pte_t pte;
+
+	if (addr_is_memory(phys))
+		return -EINVAL;
+
+	host_lock_component();
+	hyp_lock_component();
+
+	ret =3D kvm_pgtable_get_leaf(&pkvm_pgtable, (u64)virt, &pte, NULL);
+	if (ret)
+		goto unlock;
+	if (!kvm_pte_valid(pte)) {
+		ret =3D -ENOENT;
+		goto unlock;
+	}
+
+	ret =3D kvm_pgtable_get_leaf(&host_mmu.pgt, phys, &pte, NULL);
+	if (ret)
+		goto unlock;
+
+	if (FIELD_GET(KVM_INVALID_PTE_OWNER_MASK, pte) !=3D PKVM_ID_HYP) {
+		ret =3D -EPERM;
+		goto unlock;
+	}
+
+	WARN_ON(kvm_pgtable_hyp_unmap(&pkvm_pgtable, virt, size) !=3D size);
+	WARN_ON(host_stage2_try(kvm_pgtable_stage2_set_owner, &host_mmu.pgt, phys=
,
+				PAGE_SIZE, &host_s2_pool, PKVM_ID_HOST));
+unlock:
+	hyp_unlock_component();
+	host_unlock_component();
+
+	return ret;
+}
+
 int __pkvm_host_donate_hyp(u64 pfn, u64 nr_pages)
 {
 	u64 phys =3D hyp_pfn_to_phys(pfn);
diff --git a/arch/arm64/kvm/hyp/pgtable.c b/arch/arm64/kvm/hyp/pgtable.c
index 9b480f947da2..d954058e63ff 100644
--- a/arch/arm64/kvm/hyp/pgtable.c
+++ b/arch/arm64/kvm/hyp/pgtable.c
@@ -1152,13 +1152,8 @@ static int stage2_unmap_walker(const struct kvm_pgta=
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
2.53.0.473.g4a7958ca14-goog


