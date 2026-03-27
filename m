Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40E3610ED65C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 11:36:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8z2+qLI54bhQXpn+TVBwu0oxgxjVqA8B/XB1BBFsGH4=; b=3y375xH8QvfCWVax/C4QZHPZ74
	/VFLeibhOywq+diyTRQNC/OMjjU/TnMf2XIpEorOD0JMX+dy7DLlt/Mb5j3lDToQWqfzlg4uhTuMz
	L5T9nMS250SYdoRJwWPs9UXkCXpVfLVHcd4e+TUQCmTEECHDTd2HQoa7GkUjRy5xGaAY5dXW5PtZR
	nlnpeNInvNtd7vyikxq0kumoUiIQ3OgI+E7iJDWfevRkYLtXwkDGcjT6LnnhBt5YL3Bnsv9SF6PsY
	z1LqjDwlpGJXJlGMywkKryFQNvESVOYxz071JP8cSpeC2/uun/sqWsM9LGpjQmiWe7CUJtQLbUsnL
	QBDgEkIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w65Ud-00000007FIG-2Wpw;
	Fri, 27 Mar 2026 11:36:47 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w65UI-00000007F1Z-35Ag
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Mar 2026 11:36:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2642C6189D;
	Fri, 27 Mar 2026 11:36:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6524C4AF0B;
	Fri, 27 Mar 2026 11:36:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774611386;
	bh=Fw24B69UdWG8tT1576V07MnXjKKcYHGqI4N1eSecYzo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gUjfwrhU8/2YI2h7rjVsUStl2rFCPruc/+lRY3u/NCt9PHiQMbS1YNmJ2NM7Y55Ir
	 hO1M9smpq0SXvR/wAB3fIG2yrIEagCtyP9vf7Zse+GMFlbkaeH4fMMezdufFSEsyDt
	 u29l/6o95eWBsJSLHWdv8FcY5Os+E0p83sNT/zBwulcYQbd0A+abLvfR0rTySyQNq/
	 UtG2JP6o2HaWW+rllTIraMvle4asQVL3jGZAHcw57FguFz6/6oV+TCHmR0VZ5w67bl
	 G0N78hq8W1PBnkK+oYXwE1D5JNHqeJ3QrA4Oedi9vM8UfDnHnlDGzYYJrMxz+V9RMH
	 bx0YOpddlWuxg==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1w65UG-00000006K4a-03Bb;
	Fri, 27 Mar 2026 11:36:24 +0000
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
Subject: [PATCH v2 08/30] KVM: arm64: Remove redundant state variables from struct kvm_s2_fault
Date: Fri, 27 Mar 2026 11:35:56 +0000
Message-ID: <20260327113618.4051534-9-maz@kernel.org>
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

Remove redundant variables vma_shift and vfio_allow_any_uc from struct
kvm_s2_fault as they are easily derived or checked when needed.

Signed-off-by: Fuad Tabba <tabba@google.com>
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/mmu.c | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 5572b127f8663..1b991300735be 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -1721,10 +1721,8 @@ struct kvm_s2_fault {
 	bool mte_allowed;
 	bool is_vma_cacheable;
 	bool s2_force_noncacheable;
-	bool vfio_allow_any_uc;
 	unsigned long mmu_seq;
 	phys_addr_t ipa;
-	short vma_shift;
 	gfn_t gfn;
 	kvm_pfn_t pfn;
 	bool logging_active;
@@ -1749,9 +1747,9 @@ static int kvm_s2_fault_get_vma_info(struct kvm_s2_fault *fault)
 		return -EFAULT;
 	}
 
-	fault->vma_shift = kvm_s2_resolve_vma_size(vma, fault->hva, fault->memslot, fault->nested,
-						   &fault->force_pte, &fault->ipa);
-	fault->vma_pagesize = 1UL << fault->vma_shift;
+	fault->vma_pagesize = 1UL << kvm_s2_resolve_vma_size(vma, fault->hva, fault->memslot,
+							     fault->nested, &fault->force_pte,
+							     &fault->ipa);
 
 	/*
 	 * Both the canonical IPA and fault IPA must be aligned to the
@@ -1764,8 +1762,6 @@ static int kvm_s2_fault_get_vma_info(struct kvm_s2_fault *fault)
 	fault->gfn = fault->ipa >> PAGE_SHIFT;
 	fault->mte_allowed = kvm_vma_mte_allowed(vma);
 
-	fault->vfio_allow_any_uc = vma->vm_flags & VM_ALLOW_ANY_UNCACHED;
-
 	fault->vm_flags = vma->vm_flags;
 
 	fault->is_vma_cacheable = kvm_vma_is_cacheable(vma);
@@ -1796,7 +1792,7 @@ static int kvm_s2_fault_pin_pfn(struct kvm_s2_fault *fault)
 				       fault->write_fault ? FOLL_WRITE : 0,
 				       &fault->writable, &fault->page);
 	if (fault->pfn == KVM_PFN_ERR_HWPOISON) {
-		kvm_send_hwpoison_signal(fault->hva, fault->vma_shift);
+		kvm_send_hwpoison_signal(fault->hva, __ffs(fault->vma_pagesize));
 		return 0;
 	}
 	if (is_error_noslot_pfn(fault->pfn))
@@ -1874,7 +1870,7 @@ static int kvm_s2_fault_compute_prot(struct kvm_s2_fault *fault)
 		fault->prot |= KVM_PGTABLE_PROT_X;
 
 	if (fault->s2_force_noncacheable) {
-		if (fault->vfio_allow_any_uc)
+		if (fault->vm_flags & VM_ALLOW_ANY_UNCACHED)
 			fault->prot |= KVM_PGTABLE_PROT_NORMAL_NC;
 		else
 			fault->prot |= KVM_PGTABLE_PROT_DEVICE;
@@ -1978,7 +1974,6 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
 		.logging_active = memslot_is_logging(memslot),
 		.force_pte = memslot_is_logging(memslot),
 		.s2_force_noncacheable = false,
-		.vfio_allow_any_uc = false,
 		.prot = KVM_PGTABLE_PROT_R,
 	};
 	struct kvm_s2_fault *fault = &fault_data;
-- 
2.47.3


