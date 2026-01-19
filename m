Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59C30CCF2F9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 12:48:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fP3IPuDNWsHICTJlLd0+JB4HNX6ySifc0+GwdnNMsAw=; b=SEzLZOkZryJwHebCRrzDRw24S/
	dpjAYMHa5daEDz6xKFa0t1cbPm5v9ldMr7qhEHFKKDOp+0yVRIjAujultIYYfXA4z+JxytCnk0Wnj
	AVEXg1vodq0rf6EHZjg1vDGwhbuvMajHgnJ1910g8R+PO045nUuOtLKDYjlcPJEqXqPACh1Xd2UrJ
	BbvxxWxhncj1LuM6EGh4g6ZfDyohRgzahgzMiTpiamkHLZKS4cvSmte4UBF0002Zb0GQOBV4qOrZf
	LTAzWyQ5zUTWOiVQZnTYu47VYBCE9K+AfVnM9r6s/xkGlShU1CRdRZvrkEYNczw5pgOlwPmdYpPi0
	LY8nKnHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhofg-000000023dB-24qW;
	Mon, 19 Jan 2026 12:47:56 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhofQ-000000023Po-3fJT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Jan 2026 12:47:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6FD2544230;
	Mon, 19 Jan 2026 12:47:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C00B8C116C6;
	Mon, 19 Jan 2026 12:47:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768826856;
	bh=yYkwoz6p2c9KJC10PuGWPN5cZRUoVCbtirTqbhv0Lyg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tCXvcM+UPjydjBb7u9K2GDWhb0T7Ct7MbAEc+RUEZpgLApY0F3PlGvfbda3Gnr68s
	 Jrjl8eFFLhS7G1wI4x9We4GchP2uVsAi+VlI1g9YrXC4o6+FKGZO4QjutkvMWpuBJS
	 IbwRRSxJww9SGEJSOp40u3/8pXCoQmPbgwTtbvjqBaVVGLr9b8BGSjYukDi4H1CGKd
	 w9rBh3zr0bKg2bgW/AuErb+t5RL7h/y1iNRLtKfHbHvKz+/wFjdZFSCAy3OQZXn8Me
	 uCfWUCdrO0ENTWOuotboqwV55aUplbhNk9YN6A8xDIkXLQWOYQXQldme1JkHdFNJpK
	 Yunxj8aZcRkrw==
From: Will Deacon <will@kernel.org>
To: kvmarm@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org,
	Will Deacon <will@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Quentin Perret <qperret@google.com>,
	Fuad Tabba <tabba@google.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	Mostafa Saleh <smostafa@google.com>
Subject: [PATCH v2 14/35] KVM: arm64: Handle aborts from protected VMs
Date: Mon, 19 Jan 2026 12:46:07 +0000
Message-ID: <20260119124629.2563-15-will@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260119124629.2563-1-will@kernel.org>
References: <20260119124629.2563-1-will@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_044737_075504_AE260E8C 
X-CRM114-Status: GOOD (  17.00  )
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

Introduce a new abort handler for resolving stage-2 page faults from
protected VMs by pinning and donating anonymous memory. This is
considerably simpler than the infamous user_mem_abort() as we only have
to deal with translation faults at the pte level.

Signed-off-by: Will Deacon <will@kernel.org>
---
 arch/arm64/kvm/mmu.c | 89 ++++++++++++++++++++++++++++++++++++++++----
 1 file changed, 81 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index a23a4b7f108c..b21a5bf3d104 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -1641,6 +1641,74 @@ static int gmem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
 	return ret != -EAGAIN ? ret : 0;
 }
 
+static int pkvm_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
+		struct kvm_memory_slot *memslot, unsigned long hva)
+{
+	unsigned int flags = FOLL_HWPOISON | FOLL_LONGTERM | FOLL_WRITE;
+	struct kvm_pgtable *pgt = vcpu->arch.hw_mmu->pgt;
+	struct mm_struct *mm = current->mm;
+	struct kvm *kvm = vcpu->kvm;
+	void *hyp_memcache;
+	struct page *page;
+	int ret;
+
+	ret = prepare_mmu_memcache(vcpu, true, &hyp_memcache);
+	if (ret)
+		return -ENOMEM;
+
+	ret = account_locked_vm(mm, 1, true);
+	if (ret)
+		return ret;
+
+	mmap_read_lock(mm);
+	ret = pin_user_pages(hva, 1, flags, &page);
+	mmap_read_unlock(mm);
+
+	if (ret == -EHWPOISON) {
+		kvm_send_hwpoison_signal(hva, PAGE_SHIFT);
+		ret = 0;
+		goto dec_account;
+	} else if (ret != 1) {
+		ret = -EFAULT;
+		goto dec_account;
+	} else if (!folio_test_swapbacked(page_folio(page))) {
+		/*
+		 * We really can't deal with page-cache pages returned by GUP
+		 * because (a) we may trigger writeback of a page for which we
+		 * no longer have access and (b) page_mkclean() won't find the
+		 * stage-2 mapping in the rmap so we can get out-of-whack with
+		 * the filesystem when marking the page dirty during unpinning
+		 * (see cc5095747edf ("ext4: don't BUG if someone dirty pages
+		 * without asking ext4 first")).
+		 *
+		 * Ideally we'd just restrict ourselves to anonymous pages, but
+		 * we also want to allow memfd (i.e. shmem) pages, so check for
+		 * pages backed by swap in the knowledge that the GUP pin will
+		 * prevent try_to_unmap() from succeeding.
+		 */
+		ret = -EIO;
+		goto unpin;
+	}
+
+	write_lock(&kvm->mmu_lock);
+	ret = pkvm_pgtable_stage2_map(pgt, fault_ipa, PAGE_SIZE,
+				      page_to_phys(page), KVM_PGTABLE_PROT_RWX,
+				      hyp_memcache, 0);
+	write_unlock(&kvm->mmu_lock);
+	if (ret) {
+		if (ret == -EAGAIN)
+			ret = 0;
+		goto unpin;
+	}
+
+	return 0;
+unpin:
+	unpin_user_pages(&page, 1);
+dec_account:
+	account_locked_vm(mm, 1, false);
+	return ret;
+}
+
 static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
 			  struct kvm_s2_trans *nested,
 			  struct kvm_memory_slot *memslot, unsigned long hva,
@@ -2190,15 +2258,20 @@ int kvm_handle_guest_abort(struct kvm_vcpu *vcpu)
 		goto out_unlock;
 	}
 
-	VM_WARN_ON_ONCE(kvm_vcpu_trap_is_permission_fault(vcpu) &&
-			!write_fault && !kvm_vcpu_trap_is_exec_fault(vcpu));
+	if (kvm_vm_is_protected(vcpu->kvm)) {
+		ret = pkvm_mem_abort(vcpu, fault_ipa, memslot, hva);
+	} else {
+		VM_WARN_ON_ONCE(kvm_vcpu_trap_is_permission_fault(vcpu) &&
+				!write_fault &&
+				!kvm_vcpu_trap_is_exec_fault(vcpu));
 
-	if (kvm_slot_has_gmem(memslot))
-		ret = gmem_abort(vcpu, fault_ipa, nested, memslot,
-				 esr_fsc_is_permission_fault(esr));
-	else
-		ret = user_mem_abort(vcpu, fault_ipa, nested, memslot, hva,
-				     esr_fsc_is_permission_fault(esr));
+		if (kvm_slot_has_gmem(memslot))
+			ret = gmem_abort(vcpu, fault_ipa, nested, memslot,
+					 esr_fsc_is_permission_fault(esr));
+		else
+			ret = user_mem_abort(vcpu, fault_ipa, nested, memslot, hva,
+					     esr_fsc_is_permission_fault(esr));
+	}
 	if (ret == 0)
 		ret = 1;
 out:
-- 
2.52.0.457.g6b5491de43-goog


