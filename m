Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4AD1CE8D4D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 16:09:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=flo7wE5cJdGEcbfldrzVb8HnH2wgod0BYmxlVO9Ya7k=; b=ozKxIRRkOt9PNF8ZWY15wKIY+K
	Mnv+DDWnfzNDRep9BW7mlmT07M0LAsIdeID3oxj3q5Lrf0fOoZUOuidU3olUhZ5BFF9xljo2ptf/S
	pik2KlkjlXl7pTZSZNeaPn7e0iZ6+e3SOidxracoNmFpGgiCk/Yj4s0PSjNiSdxxmlmCo9KjcQx0J
	PkkrzsV7uLudWbwW136P0BlHnRfQwLNp7hpXv7HeLnxN8cQ5oNbV3D4cy/Em9tGEVeJf7cIozEcGX
	CuBqZ41A2wcgtqBfzQw8bsdSqZ3XzMeeX8r1o+v8o6JTRXDx4mJLOy6kjown6IJV8UwxDC2/TAP4S
	vLJNQJTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJwM8-0000000CgJz-39Kv;
	Fri, 14 Nov 2025 16:09:00 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJwLq-0000000Cftr-3jz2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Nov 2025 16:08:44 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C4CD01BCB;
	Fri, 14 Nov 2025 08:08:34 -0800 (PST)
Received: from raptor (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 46E483F5A1;
	Fri, 14 Nov 2025 08:08:40 -0800 (PST)
From: Alexandru Elisei <alexandru.elisei@arm.com>
To: maz@kernel.org,
	oliver.upton@linux.dev,
	joey.gouly@arm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com,
	will@kernel.org,
	catalin.marinas@arm.com,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev
Cc: james.clark@linaro.org,
	mark.rutland@arm.com,
	james.morse@arm.com
Subject: [RFC PATCH v6 27/35] KVM: arm64: Make MTE functions public
Date: Fri, 14 Nov 2025 16:07:08 +0000
Message-ID: <20251114160717.163230-28-alexandru.elisei@arm.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251114160717.163230-1-alexandru.elisei@arm.com>
References: <20251114160717.163230-1-alexandru.elisei@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_080843_050417_FB9E005B 
X-CRM114-Status: GOOD (  11.42  )
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

Make sanitise_mte_tags() (renamed to kvm_sanitise_mte_tags()) and
kvm_vma_mte_allowed() public, to be used by the SPE virtualization code.

Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
---
 arch/arm64/include/asm/kvm_mmu.h | 3 +++
 arch/arm64/kvm/mmu.c             | 9 +++++----
 2 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_mmu.h b/arch/arm64/include/asm/kvm_mmu.h
index e4069f2ce642..37b84e9d4337 100644
--- a/arch/arm64/include/asm/kvm_mmu.h
+++ b/arch/arm64/include/asm/kvm_mmu.h
@@ -183,6 +183,9 @@ int kvm_phys_addr_ioremap(struct kvm *kvm, phys_addr_t guest_ipa,
 int kvm_handle_guest_sea(struct kvm_vcpu *vcpu);
 int kvm_handle_guest_abort(struct kvm_vcpu *vcpu);
 
+bool kvm_vma_mte_allowed(struct vm_area_struct *vma);
+void kvm_sanitise_mte_tags(struct kvm *kvm, kvm_pfn_t pfn, unsigned long size);
+
 phys_addr_t kvm_mmu_get_httbr(void);
 phys_addr_t kvm_get_idmap_vector(void);
 int __init kvm_mmu_init(u32 *hyp_va_bits);
diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 7cc964af8d30..8abba9619c58 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -1434,13 +1434,14 @@ static int get_vma_page_shift(struct vm_area_struct *vma, unsigned long hva)
  * Must be called with kvm->mmu_lock held to ensure the memory remains mapped
  * while the tags are zeroed.
  */
-static void sanitise_mte_tags(struct kvm *kvm, kvm_pfn_t pfn,
-			      unsigned long size)
+void kvm_sanitise_mte_tags(struct kvm *kvm, kvm_pfn_t pfn, unsigned long size)
 {
 	unsigned long i, nr_pages = size >> PAGE_SHIFT;
 	struct page *page = pfn_to_page(pfn);
 	struct folio *folio = page_folio(page);
 
+	lockdep_assert_held(&kvm->mmu_lock);
+
 	if (!kvm_has_mte(kvm))
 		return;
 
@@ -1462,7 +1463,7 @@ static void sanitise_mte_tags(struct kvm *kvm, kvm_pfn_t pfn,
 	}
 }
 
-static bool kvm_vma_mte_allowed(struct vm_area_struct *vma)
+bool kvm_vma_mte_allowed(struct vm_area_struct *vma)
 {
 	return vma->vm_flags & VM_MTE_ALLOWED;
 }
@@ -1833,7 +1834,7 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
 	if (!fault_is_perm && !s2_force_noncacheable && kvm_has_mte(kvm)) {
 		/* Check the VMM hasn't introduced a new disallowed VMA */
 		if (mte_allowed) {
-			sanitise_mte_tags(kvm, pfn, vma_pagesize);
+			kvm_sanitise_mte_tags(kvm, pfn, vma_pagesize);
 		} else {
 			ret = -EFAULT;
 			goto out_unlock;
-- 
2.51.2


