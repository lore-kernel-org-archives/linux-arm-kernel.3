Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E784710ED64A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 11:36:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bggc/gAbBrKxPcnOcDcUfyK41/86DDhdfXU5kf/e5R4=; b=tOpPfY8j4u4UfCp1q0CJEDsQjU
	CRBCM0H0NGgb5iYE/gNzhPG+4s2RzM73UXAnozP7CF6del6Czydjutik4DR/fI3VxsXGle5ccNcXn
	NQBt/o3CLyOjKBi+9fcdsMnxw3dWYUc1FwqMU7xmlT33PvbRFpl3Swi7CHd09poLmltTPvd8XMwbH
	opKDCwwvTAWdWvI9Vtd3FAtPsEdOqJZBrIU1qRbPoOADhequoUbzwkLvWUSAHIqqNk1cCiewwWyEg
	5itqwqxVfoBxa8N30N9s28uWJkVg6MFpazJhTkQxj6uDbHCbyXrw7D3uefzGojNeb0ojbltpZXD0z
	TgrQOyrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w65UJ-00000007F2F-0AFM;
	Fri, 27 Mar 2026 11:36:27 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w65UH-00000007F0Y-37sV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Mar 2026 11:36:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id CF7A361888;
	Fri, 27 Mar 2026 11:36:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F9DAC2BC86;
	Fri, 27 Mar 2026 11:36:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774611384;
	bh=U/PKqCUlAT/TOev+JwhAPViP0XDCLZ0/w+lW7PCS+Sc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=V86HSKiq3eAShqiWZqeACsnmopf6aRaKqTlb43I7zapRzU7cmTlbSgh+eLZiG4wji
	 J4kZLMpI+jYi+ba8a6iH9BoINGw55QrHjRrGYK9pM7N5xMPaC+Y2/NfunLGj+GVcpN
	 5ujMuKMfmpXvbm3J7jij+caVLPAAEF0XpV8H4w3baDkmqgU9libjt8pSWTfTkHbraV
	 FIh7CQKkvBnkGfG94hIOHrPIeCKYSBb2occ//wAhIrKVLvKOOXWcUzqzF7YzHrs8AC
	 /sqzwLheTA8+MHmgefDNnnxai373bf38UUIX87qCnafFx2OwGPyj1eKj1PUoQf5CWI
	 8XsdVnFUd0jYw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1w65UE-00000006K4a-1M4s;
	Fri, 27 Mar 2026 11:36:22 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Fuad Tabba <tabba@google.com>,
	Will Deacon <will@kernel.org>,
	Quentin Perret <qperret@google.com>
Subject: [PATCH v2 01/30] KVM: arm64: Extract VMA size resolution in user_mem_abort()
Date: Fri, 27 Mar 2026 11:35:49 +0000
Message-ID: <20260327113618.4051534-2-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260327113618.4051534-1-maz@kernel.org>
References: <20260327113618.4051534-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, tabba@google.com, will@kernel.org, qperret@google.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
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

From: Fuad Tabba <tabba@google.com>

As part of an effort to refactor user_mem_abort() into smaller, more
focused helper functions, extract the logic responsible for determining
the VMA shift and page size into a new static helper,
kvm_s2_resolve_vma_size().

Reviewed-by: Joey Gouly <joey.gouly@arm.com>
Signed-off-by: Fuad Tabba <tabba@google.com>
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/mmu.c | 130 ++++++++++++++++++++++++-------------------
 1 file changed, 73 insertions(+), 57 deletions(-)

diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 17d64a1e11e5c..f8064b2d32045 100644
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
2.47.3


