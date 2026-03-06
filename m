Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 382FEF0183C
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 14:02:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gF/1dYRQW+uqbPLKzRe8y1L6gtybgCjS8ZQI7GMo3BA=; b=OL9e0EiBNK6o1e01FVEyLzCPtS
	rWZALMx3cG8uJ9PUj5D7DO2CXQaawESm2rY3B3VUk4QNPk80lFPzw2vIoz9dOOIqK+NEYSeTxtLHt
	/NMeqF5wTu8BTpVRNBD/+KfGHQ6DDQTeniXJW1CtsF4IIIOfVCFeifNJ3FtW6OV9k+XkLGNsKvavP
	9pSYucx7nt+AIwbEP+aSHOMkU8/dpB3cv7tl9KfWPf8PI9wOfH6kgG/7yZvnGsoTvQebahwYh6B52
	F4DoJ3zrvnBbqzkZIY3CKMA0B36Kt+3xFGQ4RHQHS7C0GOjZgNbWfzqe3YGiXvQW+5qDephfqTGus
	qwrN/c+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyVlL-00000003q6H-05Qy;
	Fri, 06 Mar 2026 14:02:43 +0000
Received: from mail-ed1-x54a.google.com ([2a00:1450:4864:20::54a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyVlF-00000003q3n-0YB8
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 14:02:39 +0000
Received: by mail-ed1-x54a.google.com with SMTP id 4fb4d7f45d1cf-661420734b7so3068159a12.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Mar 2026 06:02:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772805755; x=1773410555; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=gF/1dYRQW+uqbPLKzRe8y1L6gtybgCjS8ZQI7GMo3BA=;
        b=MeDT8eOw5gF8t+lWpodwpxTrDawEqnznETdfUMVOTDn/EQBMLQYcr2zmK3vzcCakkV
         hIU0GdjWig5QyhPATbSw4BIBvlb++slfQ/tFklR0q0dMjyawu2hZun7OOjn+yZk7QGKk
         x91yqv/ir85rhoBpVEtuGO5IxQGdgC1tD9pBmqbfEGvBWebye9sKwUeMX9kASP0UdB9B
         Mr1THJfvimSr4OqYcdXrxxt86sUM2HUYVP5Gj3A6bQkGdCBGzSZwy3jbA8m3ZuqC4G12
         tdtGSjLLzj/EUz7xkv0mKfbpZcPAflnWPtK1D3jAboCPrx5MxFCfxVE4ikbQRykNT2oH
         4kKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772805755; x=1773410555;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gF/1dYRQW+uqbPLKzRe8y1L6gtybgCjS8ZQI7GMo3BA=;
        b=fL2AY2MCKS/HhwdkCPhqeKoxa+NyOISwhViTdSNbP2xbEUkGnLI6U4LsWK3oCphork
         +1DHnbK9f3o1CPDVJ4QI7cfqD6G0jB4cG1LTYdUoPRgqPmygJZPFThMA36uKVXxxrX8g
         RAvCFjr48btbuyOiHIvx0R7KBKJMe/KubwVW51GIBVxfMYqQNPb+/TGASHBYJlXgZpoT
         BfbiCwCzRvSJXG4xrXGi0xmzsFhy0Lod0X2kS8fu+hbkrzcWju5hmlJs1K0sDWofgaHs
         oUAzcdDHKmk3LhVeYLuXy6o/XQpB0lcmhqy6/iKIhL6RdVaF7vmacJ+su+iQJYgP3M91
         FJ/w==
X-Forwarded-Encrypted: i=1; AJvYcCXjLP7RWYd2BnTD8tuw21ovlATuxfTjRn3AVn1rDQab7RoYLY9Af7zEXlb9V13RyKDeItCvfO+gzp0LkEKXSQYB@lists.infradead.org
X-Gm-Message-State: AOJu0YxEy8Ky+CyR6L4S4TqiON2lAWndr+YPyd5TZTN5N45/IqGRdmP4
	kQcBc0NyxSbDcTey5MpscQ1jlyF7ZMg+MjBPVq8wZieNTcedQJcaYKYALxa1OwKsvXfe7ovlYJh
	lCw==
X-Received: from edge19-n1.prod.google.com ([2002:a05:6402:a553:10b0:661:1c9f:b877])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6402:3990:b0:659:3ff1:58fa
 with SMTP id 4fb4d7f45d1cf-6619d5205camr821175a12.29.1772805754847; Fri, 06
 Mar 2026 06:02:34 -0800 (PST)
Date: Fri,  6 Mar 2026 14:02:20 +0000
In-Reply-To: <20260306140232.2193802-1-tabba@google.com>
Mime-Version: 1.0
References: <20260306140232.2193802-1-tabba@google.com>
X-Mailer: git-send-email 2.53.0.473.g4a7958ca14-goog
Message-ID: <20260306140232.2193802-2-tabba@google.com>
Subject: [PATCH v1 01/13] KVM: arm64: Extract VMA size resolution in user_mem_abort()
From: Fuad Tabba <tabba@google.com>
To: kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org, qperret@google.com, vdonnefort@google.com, tabba@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_060238_541973_767A4095 
X-CRM114-Status: GOOD (  16.20  )
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

As part of an effort to refactor user_mem_abort() into smaller, more
focused helper functions, extract the logic responsible for determining
the VMA shift and page size into a new static helper,
kvm_s2_resolve_vma_size().

Signed-off-by: Fuad Tabba <tabba@google.com>
---
 arch/arm64/kvm/mmu.c | 130 ++++++++++++++++++++++++-------------------
 1 file changed, 73 insertions(+), 57 deletions(-)

diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 17d64a1e11e5..f8064b2d3204 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -1639,6 +1639,77 @@ static int gmem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
 	return ret != -EAGAIN ? ret : 0;
 }
 
+static short kvm_s2_resolve_vma_size(struct vm_area_struct *vma,
+				     unsigned long hva,
+				     struct kvm_memory_slot *memslot,
+				     struct kvm_s2_trans *nested,
+				     bool *force_pte, phys_addr_t *ipa)
+{
+	short vma_shift;
+	long vma_pagesize;
+
+	if (*force_pte)
+		vma_shift = PAGE_SHIFT;
+	else
+		vma_shift = get_vma_page_shift(vma, hva);
+
+	switch (vma_shift) {
+#ifndef __PAGETABLE_PMD_FOLDED
+	case PUD_SHIFT:
+		if (fault_supports_stage2_huge_mapping(memslot, hva, PUD_SIZE))
+			break;
+		fallthrough;
+#endif
+	case CONT_PMD_SHIFT:
+		vma_shift = PMD_SHIFT;
+		fallthrough;
+	case PMD_SHIFT:
+		if (fault_supports_stage2_huge_mapping(memslot, hva, PMD_SIZE))
+			break;
+		fallthrough;
+	case CONT_PTE_SHIFT:
+		vma_shift = PAGE_SHIFT;
+		*force_pte = true;
+		fallthrough;
+	case PAGE_SHIFT:
+		break;
+	default:
+		WARN_ONCE(1, "Unknown vma_shift %d", vma_shift);
+	}
+
+	vma_pagesize = 1UL << vma_shift;
+
+	if (nested) {
+		unsigned long max_map_size;
+
+		max_map_size = *force_pte ? PAGE_SIZE : PUD_SIZE;
+
+		*ipa = kvm_s2_trans_output(nested);
+
+		/*
+		 * If we're about to create a shadow stage 2 entry, then we
+		 * can only create a block mapping if the guest stage 2 page
+		 * table uses at least as big a mapping.
+		 */
+		max_map_size = min(kvm_s2_trans_size(nested), max_map_size);
+
+		/*
+		 * Be careful that if the mapping size falls between
+		 * two host sizes, take the smallest of the two.
+		 */
+		if (max_map_size >= PMD_SIZE && max_map_size < PUD_SIZE)
+			max_map_size = PMD_SIZE;
+		else if (max_map_size >= PAGE_SIZE && max_map_size < PMD_SIZE)
+			max_map_size = PAGE_SIZE;
+
+		*force_pte = (max_map_size == PAGE_SIZE);
+		vma_pagesize = min_t(long, vma_pagesize, max_map_size);
+		vma_shift = __ffs(vma_pagesize);
+	}
+
+	return vma_shift;
+}
+
 static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
 			  struct kvm_s2_trans *nested,
 			  struct kvm_memory_slot *memslot, unsigned long hva,
@@ -1695,65 +1766,10 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
 		return -EFAULT;
 	}
 
-	if (force_pte)
-		vma_shift = PAGE_SHIFT;
-	else
-		vma_shift = get_vma_page_shift(vma, hva);
-
-	switch (vma_shift) {
-#ifndef __PAGETABLE_PMD_FOLDED
-	case PUD_SHIFT:
-		if (fault_supports_stage2_huge_mapping(memslot, hva, PUD_SIZE))
-			break;
-		fallthrough;
-#endif
-	case CONT_PMD_SHIFT:
-		vma_shift = PMD_SHIFT;
-		fallthrough;
-	case PMD_SHIFT:
-		if (fault_supports_stage2_huge_mapping(memslot, hva, PMD_SIZE))
-			break;
-		fallthrough;
-	case CONT_PTE_SHIFT:
-		vma_shift = PAGE_SHIFT;
-		force_pte = true;
-		fallthrough;
-	case PAGE_SHIFT:
-		break;
-	default:
-		WARN_ONCE(1, "Unknown vma_shift %d", vma_shift);
-	}
-
+	vma_shift = kvm_s2_resolve_vma_size(vma, hva, memslot, nested,
+					    &force_pte, &ipa);
 	vma_pagesize = 1UL << vma_shift;
 
-	if (nested) {
-		unsigned long max_map_size;
-
-		max_map_size = force_pte ? PAGE_SIZE : PUD_SIZE;
-
-		ipa = kvm_s2_trans_output(nested);
-
-		/*
-		 * If we're about to create a shadow stage 2 entry, then we
-		 * can only create a block mapping if the guest stage 2 page
-		 * table uses at least as big a mapping.
-		 */
-		max_map_size = min(kvm_s2_trans_size(nested), max_map_size);
-
-		/*
-		 * Be careful that if the mapping size falls between
-		 * two host sizes, take the smallest of the two.
-		 */
-		if (max_map_size >= PMD_SIZE && max_map_size < PUD_SIZE)
-			max_map_size = PMD_SIZE;
-		else if (max_map_size >= PAGE_SIZE && max_map_size < PMD_SIZE)
-			max_map_size = PAGE_SIZE;
-
-		force_pte = (max_map_size == PAGE_SIZE);
-		vma_pagesize = min_t(long, vma_pagesize, max_map_size);
-		vma_shift = __ffs(vma_pagesize);
-	}
-
 	/*
 	 * Both the canonical IPA and fault IPA must be aligned to the
 	 * mapping size to ensure we find the right PFN and lay down the
-- 
2.53.0.473.g4a7958ca14-goog


