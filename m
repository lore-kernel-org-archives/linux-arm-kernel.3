Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CE8FCA0EEB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Aug 2025 02:59:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l3aBAqBLvvziXAff3l7qHBrH3ii9s2uHCbYHv1XlpUE=; b=OSfijkav1gBiMtgN5kaJ3wCa3n
	boRI6msLH4JGrNGF6JfiCwSwK59BwWI0xmrvtkrPkbev8MyZZevn33/xXhES3hOF8Q476tUIPUWEx
	I9I26TksuseHZOp9ctfEqUWZePSSdtcBH7rRSRXP5EW7tAXU54/c9VLoL9YmwSsMAqOqSfYGcA5PF
	FIBDdKL9Slc3TohAn8/ByrHgi1jCXqN57OLV03Q9WD2lEaqfEVMksdNsEZ3Gyn1wD6uOs/y0+H+PJ
	dH6/YeuxSDOXj6cZq3bg3k6BXnZlYSE83kXpnel1zJ78MYeJFRIv/SLmMBXLjicw6NnPGUOlCM3SO
	KZ6M9xwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upI0G-00000001KND-2xsW;
	Fri, 22 Aug 2025 02:59:44 +0000
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upCPB-00000000bcw-34j3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Aug 2025 21:01:06 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-32505dbe21cso582259a91.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 21 Aug 2025 14:01:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1755810065; x=1756414865; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=l3aBAqBLvvziXAff3l7qHBrH3ii9s2uHCbYHv1XlpUE=;
        b=ZJT2xJtj7/XNpItJ3Q4rM5PqW4bSCuMCzmh6agakCYAnT/e43S+jh/pVtvmdjJKh55
         vAT+MDn5xvj2e9EUZDGewcan6si+jRb7RDoWhl7G21ri4KaDCR4vJg0XfPMypmIOxDYH
         Blhlv1twULUVJPkv+6Ga7E/vQ1NsvcH9wsGlnyIQXM60NR/Yb2fGYxHLKCEwU9w+Qkb+
         31uSEw0jCUF6I9Q6hEe4mYwxpB0AB4CMeKcxKhGnIHnbs5VulS31KF/6r5sxr1OGzh12
         ZxNp1b2S4KgSZudSBX697S3YwyV7khuIo+5bTVQzK0JjUdrPKqJAG0pDyTA75BI943oj
         8zew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755810065; x=1756414865;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l3aBAqBLvvziXAff3l7qHBrH3ii9s2uHCbYHv1XlpUE=;
        b=OAIfJT2SNDEbU2pZNTTkoC7KKBfRxsZhUwo/xoXLiKpQWW4viR0AlNgJKell5k87eC
         i1TT8GwQG0K6yNoCYZcCEHB77G6Qi195UCz8U4DvVTBw5rEIbZ2x9vHPCJGtLtuDcFl2
         UJoPA64GDq7SKFe2lBe8PcgaVV7c1bnZ/Ybwc+G36aayAm3UX6zu2NGJ/EunIrxOPMa+
         Yn9cxOI3Pd0Z138bLKhH2e6b/D7BJpd87TfPLy3e5C9ywr7OBMPaGP81tDKvHH6ZNCe6
         LOCkP6stMbox7pIeGkYDoTsX4TXgOzWsPFoAZ7ZS7KBbDuk8bsfJhGZbGmRDRvg3c03j
         y0ZA==
X-Gm-Message-State: AOJu0YwOlfrHL++vGVubVP657SJx2A3j0vPtYMOqds6kreZRwQN+vvlE
	qGE1ACSa5sj0+KI0LR3tcCoarThFxcJS3KVwz9kWoCr5+veelDDAI3Vght4/ld1lHoLdaMGU4Bq
	9DQyPRA==
X-Google-Smtp-Source: AGHT+IHyv2vSy5H3gPx/CMXMIii4nN/TDg0JEF0C1pJibiyBy90Nx8cGqdPBlytbuWHgL7DJUzJnyJ3Kweo=
X-Received: from pjbee11.prod.google.com ([2002:a17:90a:fc4b:b0:312:187d:382d])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2c87:b0:324:ec53:1385
 with SMTP id 98e67ed59e1d1-32515e36b2emr1212430a91.10.1755810064638; Thu, 21
 Aug 2025 14:01:04 -0700 (PDT)
Date: Thu, 21 Aug 2025 14:00:37 -0700
In-Reply-To: <20250821210042.3451147-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250821210042.3451147-1-seanjc@google.com>
X-Mailer: git-send-email 2.51.0.261.g7ce5a0a67e-goog
Message-ID: <20250821210042.3451147-12-seanjc@google.com>
Subject: [RFC PATCH 11/16] KVM: arm64: Drop local mte_allowed, use vm_flags snapshot
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Sean Christopherson <seanjc@google.com>, 
	James Houghton <jthoughton@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_140105_772663_B97CC37A 
X-CRM114-Status: GOOD (  14.53  )
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
Reply-To: Sean Christopherson <seanjc@google.com>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Drop user_mem_abort()'s local mte_allowed and instead use the vm_flags
snapshot.  The redundant variables aren't problematic per se, but will be
quite awkward when a future change moves the vm_flags snapshot into
"struct kvm_page_fault".

Opportunistically drop kvm_vma_mte_allowed() and open code the vm_flags
check in the memslot preparation code, as there's little value in hiding
VM_MTE_ALLOWED (arguably negative "value), and the fault path can't use
the VMA-based helper (because looking at the VMA outside of mmap_lock is
unsafe).

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/arm64/kvm/mmu.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index e1375296940b..b85968019dd4 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -1454,11 +1454,6 @@ static void sanitise_mte_tags(struct kvm *kvm, kvm_pfn_t pfn,
 	}
 }
 
-static bool kvm_vma_mte_allowed(struct vm_area_struct *vma)
-{
-	return vma->vm_flags & VM_MTE_ALLOWED;
-}
-
 static bool kvm_vma_is_cacheable(struct vm_area_struct *vma)
 {
 	switch (FIELD_GET(PTE_ATTRINDX_MASK, pgprot_val(vma->vm_page_prot))) {
@@ -1475,7 +1470,7 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, struct kvm_page_fault *fault)
 {
 	int ret = 0;
 	bool writable, force_pte = false;
-	bool mte_allowed, is_vma_cacheable;
+	bool is_vma_cacheable;
 	bool s2_force_noncacheable = false;
 	unsigned long mmu_seq;
 	struct kvm *kvm = vcpu->kvm;
@@ -1606,7 +1601,6 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, struct kvm_page_fault *fault)
 	}
 
 	fault->gfn = fault->ipa >> PAGE_SHIFT;
-	mte_allowed = kvm_vma_mte_allowed(vma);
 
 	vm_flags = vma->vm_flags;
 
@@ -1724,7 +1718,7 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, struct kvm_page_fault *fault)
 
 	if (!fault->is_perm && !s2_force_noncacheable && kvm_has_mte(kvm)) {
 		/* Check the VMM hasn't introduced a new disallowed VMA */
-		if (mte_allowed) {
+		if (vm_flags & VM_MTE_ALLOWED) {
 			sanitise_mte_tags(kvm, fault->pfn, vma_pagesize);
 		} else {
 			ret = -EFAULT;
@@ -2215,7 +2209,7 @@ int kvm_arch_prepare_memory_region(struct kvm *kvm,
 		if (!vma)
 			break;
 
-		if (kvm_has_mte(kvm) && !kvm_vma_mte_allowed(vma)) {
+		if (kvm_has_mte(kvm) && !(vma->vm_flags & VM_MTE_ALLOWED)) {
 			ret = -EINVAL;
 			break;
 		}
-- 
2.51.0.261.g7ce5a0a67e-goog


