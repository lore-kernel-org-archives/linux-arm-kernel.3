Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3F7310ED660
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 11:36:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9scUzFQIdpT6DaG3JiSWAcpdpNFlKEej81kdDdlzZBQ=; b=Od6WtpoiwjRGYAPNcViitbElix
	xpZcRhXqOCaBLZ1ezXzVWRzKWqbDDKJYCkLzHimuFaBfE7QxyLP5Au5UOQWMhydJIMXi+mJ7+RWZy
	lgBl9GAVZ3D8fx0D2oH6BziC749GxIM+cpwzbgs+IGayE0w+ZJQrgsKzaLGQh5E9djbMQ2FHONBlH
	GpBNQaKSJ0SV3ILYymQx+mzfCZypZjUPKk52eXFxkGecz9bM4RULhtFDKp2tYbvie/HNMXh8kB7kx
	tfgrS5ZDv2s+ouzlQTzWgQeO4nekfuKKd0vVtTjLOtT8cEtQWeHEr4JDM4c7P0OCgMEIixzAQTKKw
	MeHZ0U8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w65Uh-00000007FP7-1joZ;
	Fri, 27 Mar 2026 11:36:51 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w65UJ-00000007F3C-2xi1
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Mar 2026 11:36:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6399644757;
	Fri, 27 Mar 2026 11:36:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47E82C4AF09;
	Fri, 27 Mar 2026 11:36:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774611387;
	bh=0KZY79rrIwhmD1/ZcFx/WLYtTWN4TDvRZH2ZU+QeGvY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=q4U66Vktx1eYLhPfrGJQOc+bMdhILUx3Vc3eT3EBHwxOYrylPjScymXp+ynQVkSbK
	 EzK0aKvZqiJUyVxFl2B5GVXSrWNdUxzs4HAgKlAjVy+vhYfmcv47K62TwA3EioqjRP
	 0+1go/Z7Sv20+JW9IgFYZXbwfyy9xJ4FReO/EMbv3ETfcsh/xKXS0+Bgxb8XxZi7P5
	 ZU8JHYavb1AcqBE+QWG2y+l2DtEyDmAM46vbHA4x3PTxh5SetctIWMsklB7Pp87MN0
	 DMs+4J2UfoOcJ+FPHfB332MDPfhwdQJb38m68cGCpb8DaC371kirbA9flCfKZoRUTJ
	 9KTwBVY/Zfxvw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1w65UH-00000006K4a-1zJL;
	Fri, 27 Mar 2026 11:36:25 +0000
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
Subject: [PATCH v2 14/30] KVM: arm64: Kill fault->ipa
Date: Fri, 27 Mar 2026 11:36:02 +0000
Message-ID: <20260327113618.4051534-15-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260327113618.4051534-1-maz@kernel.org>
References: <20260327113618.4051534-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, tabba@google.com, will@kernel.org, qperret@google.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_043627_785700_E16C51CB 
X-CRM114-Status: GOOD (  12.90  )
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

fault->ipa, in a nested contest, represents the output of the guest's
S2 translation for the fault->fault_ipa input, and is equal to
fault->fault_ipa otherwise,

Given that this is readily available from kvm_s2_trans_output(),
drop fault->ipa and directly compute fault->gfn instead, which
is really what we want.

Tested-by: Fuad Tabba <tabba@google.com>
Reviewed-by: Fuad Tabba <tabba@google.com>
Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/mmu.c | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index c6cd6ce5254be..67e5e867e01dc 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -1643,7 +1643,7 @@ static short kvm_s2_resolve_vma_size(struct vm_area_struct *vma,
 				     unsigned long hva,
 				     struct kvm_memory_slot *memslot,
 				     struct kvm_s2_trans *nested,
-				     bool *force_pte, phys_addr_t *ipa)
+				     bool *force_pte)
 {
 	short vma_shift;
 
@@ -1681,8 +1681,6 @@ static short kvm_s2_resolve_vma_size(struct vm_area_struct *vma,
 
 		max_map_size = *force_pte ? PAGE_SIZE : PUD_SIZE;
 
-		*ipa = kvm_s2_trans_output(nested);
-
 		/*
 		 * If we're about to create a shadow stage 2 entry, then we
 		 * can only create a block mapping if the guest stage 2 page
@@ -1722,7 +1720,6 @@ struct kvm_s2_fault {
 	bool is_vma_cacheable;
 	bool s2_force_noncacheable;
 	unsigned long mmu_seq;
-	phys_addr_t ipa;
 	gfn_t gfn;
 	kvm_pfn_t pfn;
 	bool logging_active;
@@ -1738,6 +1735,7 @@ static int kvm_s2_fault_get_vma_info(struct kvm_s2_fault *fault)
 {
 	struct vm_area_struct *vma;
 	struct kvm *kvm = fault->vcpu->kvm;
+	phys_addr_t ipa;
 
 	mmap_read_lock(current->mm);
 	vma = vma_lookup(current->mm, fault->hva);
@@ -1748,8 +1746,7 @@ static int kvm_s2_fault_get_vma_info(struct kvm_s2_fault *fault)
 	}
 
 	fault->vma_pagesize = 1UL << kvm_s2_resolve_vma_size(vma, fault->hva, fault->memslot,
-							     fault->nested, &fault->force_pte,
-							     &fault->ipa);
+							     fault->nested, &fault->force_pte);
 
 	/*
 	 * Both the canonical IPA and fault IPA must be aligned to the
@@ -1757,9 +1754,9 @@ static int kvm_s2_fault_get_vma_info(struct kvm_s2_fault *fault)
 	 * mapping in the right place.
 	 */
 	fault->fault_ipa = ALIGN_DOWN(fault->fault_ipa, fault->vma_pagesize);
-	fault->ipa = ALIGN_DOWN(fault->ipa, fault->vma_pagesize);
+	ipa = fault->nested ? kvm_s2_trans_output(fault->nested) : fault->fault_ipa;
+	fault->gfn = ALIGN_DOWN(ipa, fault->vma_pagesize) >> PAGE_SHIFT;
 
-	fault->gfn = fault->ipa >> PAGE_SHIFT;
 	fault->mte_allowed = kvm_vma_mte_allowed(vma);
 
 	fault->vm_flags = vma->vm_flags;
@@ -1970,7 +1967,6 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
 		.memslot = memslot,
 		.hva = hva,
 		.fault_is_perm = fault_is_perm,
-		.ipa = fault_ipa,
 		.logging_active = logging_active,
 		.force_pte = logging_active,
 		.prot = KVM_PGTABLE_PROT_R,
-- 
2.47.3


