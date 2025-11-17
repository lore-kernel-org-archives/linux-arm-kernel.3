Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 027CACEACEF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Nov 2025 18:48:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:From:Subject:Message-ID:References:Mime-Version:
	In-Reply-To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ud78eB0arPLfokP7b6+iOXM9DvD6Lviy96UJdE9HiHk=; b=TPfC5qgr/5aM0Zf66nCK3ud9wf
	gJmCxZEyp+RqQngwnawPcs9hr5Ag7Z0SM05P7Lkk3oyM14nHHp+lh2rNrqtFNesS5SQeFEqhYALlN
	vrvjqODwqFgWVdfbSgbT6ZDBffSbZSzv++g1jzh6dkwH+LnWoccwkyHbPyZhWgO7aX7X6s2w2bkwg
	WJMvrpJ4EcqBXS4UvyfjhxmDrHP7dsCGJpZYsZ3PrxsxS9D13IqVE2E+ppMdq3EEGtyW/MN625fE+
	4srRhv9fbWvyZpw7nvGygS+w+dy+M3e0mwQ18ROMtflLOSeHMxyFaStu4YBjU2JRXh8O34CdijrMQ
	HmQR4FDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL4HF-0000000GdSN-26z9;
	Mon, 17 Nov 2025 18:48:37 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL4H8-0000000GdOO-0bMZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Nov 2025 18:48:31 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-47797caba11so11032705e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Nov 2025 10:48:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1763405308; x=1764010108; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ud78eB0arPLfokP7b6+iOXM9DvD6Lviy96UJdE9HiHk=;
        b=fdimQ54Yq8ApD9yr/61NVU51Y2qO2ACk68bzn2qwtBB/Umvt/ZqHuwqFlTG4KTI9LN
         2tUaXY3jdkqLCS0AKML7IxB718DIbPC0XEelUet4TFSiYMApnKCvtYmDiHamAiCO0XEF
         82qx25HMGcvrX7+pLnDocTVIQ9k6i4nVSAILESGUcxxOgy8VDL84pXh3rlkFhvsNfmFf
         fUM9ofV3wKrlkoAXHG8EUkquTfKGIAAjKgAc5JIvV5JKJftlddOvIo/j2A81lGMKsXny
         WaQsrnUkaBVgrYcIJ5rPkXTyeetNnX9fJpWGKd9+2ZACntL04Usu5a5QWG6kd5jOoRJi
         DzVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763405308; x=1764010108;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ud78eB0arPLfokP7b6+iOXM9DvD6Lviy96UJdE9HiHk=;
        b=FtOWfYZRh4BgqWOAGxl5ZE66MzyraOOjgXhyW77LhSIg9dfQeYG8pRNNVOZffKLV5o
         FDLNvMnbQmZ4l370VE3hzfINTdUw5TU2ZrWaqPfMTk5yo7iMfTlkdsMmECZKYIK/cBI8
         2N+ZmO6ySfZ30HLLkxNo6XF6LuYFHNz81Y+hBKWQqyLCISM1ENFyZaMlFYDvErBJUx4v
         GusKy+dNs44JzyLs7GqYJTMb3fEB9osfN6gupEn5Xu7p0JhXSHE4LuPHjVzS+zWkeP1f
         YCbKtRQkfLLJxBxkFwvORgCLBlIQvF1qagepzEpkzzDUZkRMq1OaiAvLuDr8BJKsN98h
         3+QQ==
X-Gm-Message-State: AOJu0Yz1NVxyj+SLqdJITt+rTNbG943uHlAPdsc/k2AjHN1YVIGAT8c1
	aNU9heBqoMMUcuNtfimW/DvEPx5KK1T7ekya1rVrXttiWS9VnsdMJrhdtPYfmohbwXg8Qc+nkgT
	9JVWZji2DJGUcClNzRkXZFusUymTf0cwmyqP01eGAjXI4d1xxEfHWUKNsstqifxfdw6H6Vo2lOo
	3Kl7q/dQtsntB0AN8H+kBQVe0OFhCip6dnQmuP5A8Q3PwozXecXPALKH6ITbD874wvSQ==
X-Google-Smtp-Source: AGHT+IFtQM3E60fdG09G4db3NhGt1PCpbNSce99vQEOknynP4HtzybGxEOyhlaEXa2/I2J7fKVIRDAwQImwldQ==
X-Received: from wmbgx25.prod.google.com ([2002:a05:600c:8599:b0:477:a338:214b])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4513:b0:477:2f7c:314f with SMTP id 5b1f17b1804b1-4778fe5c820mr145661085e9.10.1763405307962;
 Mon, 17 Nov 2025 10:48:27 -0800 (PST)
Date: Mon, 17 Nov 2025 18:47:49 +0000
In-Reply-To: <20251117184815.1027271-1-smostafa@google.com>
Mime-Version: 1.0
References: <20251117184815.1027271-1-smostafa@google.com>
X-Mailer: git-send-email 2.52.0.rc1.455.g30608eb744-goog
Message-ID: <20251117184815.1027271-3-smostafa@google.com>
Subject: [PATCH v5 02/27] KVM: arm64: Donate MMIO to the hypervisor
From: Mostafa Saleh <smostafa@google.com>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kvmarm@lists.linux.dev, iommu@lists.linux.dev
Cc: catalin.marinas@arm.com, will@kernel.org, maz@kernel.org, 
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, joro@8bytes.org, jean-philippe@linaro.org, jgg@ziepe.ca, 
	praan@google.com, danielmentz@google.com, mark.rutland@arm.com, 
	qperret@google.com, tabba@google.com, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_104830_213628_4B9535FC 
X-CRM114-Status: GOOD (  18.60  )
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
drivers can use that to protect the MMIO of IOMMU.
The initial attempt to implement this was to have a new flag to
"___pkvm_host_donate_hyp" to accept MMIO. However that had many problems,
it was quite intrusive for host/hyp to check/set page state to make it
aware of MMIO and to encode the state in the page table in that case.
Which is called in paths that can be sensitive to performance (FFA, VMs..)

As donating MMIO is very rare, and we don=E2=80=99t need to encode the full=
 state,
it=E2=80=99s reasonable to have a separate function to do this.
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
index 52d7ee91e18c..98e173da0f9b 100644
--- a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
+++ b/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
@@ -37,6 +37,8 @@ int __pkvm_host_share_hyp(u64 pfn);
 int __pkvm_host_unshare_hyp(u64 pfn);
 int __pkvm_host_donate_hyp(u64 pfn, u64 nr_pages);
 int ___pkvm_host_donate_hyp(u64 pfn, u64 nr_pages, enum kvm_pgtable_prot p=
rot);
+int __pkvm_host_donate_hyp_mmio(u64 pfn);
+int __pkvm_hyp_donate_host_mmio(u64 pfn);
 int __pkvm_hyp_donate_host(u64 pfn, u64 nr_pages);
 int __pkvm_host_share_ffa(u64 pfn, u64 nr_pages);
 int __pkvm_host_unshare_ffa(u64 pfn, u64 nr_pages);
diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvh=
e/mem_protect.c
index 434b1d6aa49e..c3eac0da7cbe 100644
--- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
+++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
@@ -799,6 +799,96 @@ int ___pkvm_host_donate_hyp(u64 pfn, u64 nr_pages, enu=
m kvm_pgtable_prot prot)
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
 	return ___pkvm_host_donate_hyp(pfn, nr_pages, PAGE_HYP);
diff --git a/arch/arm64/kvm/hyp/pgtable.c b/arch/arm64/kvm/hyp/pgtable.c
index c351b4abd5db..ba06b0c21d5a 100644
--- a/arch/arm64/kvm/hyp/pgtable.c
+++ b/arch/arm64/kvm/hyp/pgtable.c
@@ -1095,13 +1095,8 @@ static int stage2_unmap_walker(const struct kvm_pgta=
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
2.52.0.rc1.455.g30608eb744-goog


