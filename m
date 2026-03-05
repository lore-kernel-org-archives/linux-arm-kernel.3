Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05EB7F33A78
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 14:45:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4uqbTaK/SUKC5hU3BqIKF2hPbFB7qXHLA/iy/1InYug=; b=tNrp2iwoMqYIvi8jYg/vk2c7DT
	UXkm02IbxlYC9ElXQcem3Lg3V5k661+Uj3mlMEoW7MXc3FpVR9CT6xYp2+rBneECWfZemcAXU36hS
	81KSYKMNTCxTGHAgQV5u3yK2YFdsF51ArhZRrdFPoRvb0bxwOqn+ygXjhzVvfy/nusT+o1hZ4s3fo
	Q7MxmWiZJET21/LcwMF7R2jtzivRANbI78a8/ltGpx0cMu0svOObG1M5FuHBQpK070v0FoAd6T9lq
	CD79xfBqODE9+6gf6SsaYdZ1O9GqqxxVdS2PISZyOBxS4+STuL25Q1g2TlN4cxTHuIHU4bAA8525k
	sQIlW4CQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy9wg-000000021Y7-0io5;
	Thu, 05 Mar 2026 14:44:58 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy9we-000000021Vz-3WWP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 14:44:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4935161851;
	Thu,  5 Mar 2026 14:44:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A995C19423;
	Thu,  5 Mar 2026 14:44:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772721896;
	bh=kFtW1Hxer6ySjqBzPY4uotlzvf+zgtokwak9YJtR+oA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LelBXVUJP7VMfU8ygXPiHDPG+HXZyssOSQDmK1N6eTnw5xkX0JWoS1sXBWh8NUThe
	 4MLdS2gnG5S1Gt/QEFnGJVER1uada2rbdJFEBpKsEbf8FVyVVQysOckgcmqXdhCWoC
	 lNl8BpFirdnqQRPnx/phzkQ7qGLpB1Kucx5rjt6+Oz69ER1fnzHFNAphkUEXDC4nIB
	 vqMJZGZzmT0qvjYTB7QTMSPEkOdxKDtmYfUeKuRKXd355mv6NmyS6l9h4h8qSjG1JF
	 ANBFMTloVLXUX7yZGGsRoyT2XTCzyr1oJrOVAp3Nn18TDzoI56tZ5E2nUBIZozW5PC
	 ad2/ZZRnsjJTA==
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
	Mostafa Saleh <smostafa@google.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>
Subject: [PATCH v3 13/36] KVM: arm64: Handle aborts from protected VMs
Date: Thu,  5 Mar 2026 14:43:26 +0000
Message-ID: <20260305144351.17071-14-will@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260305144351.17071-1-will@kernel.org>
References: <20260305144351.17071-1-will@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
index 9d183df0b0ac..4e64528d86a6 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -1642,6 +1642,74 @@ static int gmem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
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
@@ -2201,15 +2269,20 @@ int kvm_handle_guest_abort(struct kvm_vcpu *vcpu)
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
2.53.0.473.g4a7958ca14-goog


