Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDC49CA5FCE
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 21:08:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WFAozQ5zwkdYus+cQjlyfftwunh1JQ/JxjX7o4CS9xc=; b=m7yP81WPVamhzx09wwdpOJgDj0
	i7DYVhIKT30qzBZ6oixI76F5qQyXpCYYnNnoEDHyrvcz5kl4og2siynBU/m31cmFwouHJDxWUpUMx
	nNbcIlMZfJDRyMPwLekPiXOdfOIdB/DLPS4NPYf+BiF74oFyhNbjcIMo/5YQdQ4sqkN6xLvcgdfcj
	fee7akLb7Z+V/BzHq+XxRRoFntBsFytINkcOQ0ZjRWL8o2gvEV/w2xRLr2uUEgqnNaA9Kp5CxMm6A
	H2IBoVolPpDOJDbRnDDRwlUSTfKVcKhUo8sPFUY66kpATOVAlf9iyLv+PLSo2vrwY0wL7T6E2r6I7
	C2ykMZDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCO0j-0000000ADCW-3OOW;
	Thu, 01 Oct 2026 21:08:13 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCO0Y-0000000AD3x-1GBJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 21:08:07 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5327A497;
	Thu,  1 Oct 2026 14:07:58 -0700 (PDT)
Received: from ewhatever.cambridge.arm.com (ewhatever.cambridge.arm.com [10.2.197.99])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 634E13F86F;
	Thu,  1 Oct 2026 14:07:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790888881; bh=XKUI0O+yupvbzqqTCtUZd6FFNrWihRgYRS3Pt81HQOM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=G3VdYo0iGLjLQn/X335lZLkfeWUC85U6OLHlFmkAJUVfyRYDPzVjAYkn3TTFYYjgV
	 wbV76kOUO8zt0YlHrDimoZUE4kloC6Mgv4JIpLOnmpdHu8yZp7eqmJFT8S2dvhz5gt
	 0U+xxz0EZtqcvGsj4KK+i6zyxvBmYSig88/EXidk=
From: Suzuki K Poulose <suzuki.poulose@arm.com>
To: kvm@vger.kernel.org,
	kvmarm@lists.linux.dev
Cc: maz@kernel.org,
	will@kernel.org,
	catalin.marinas@arm.com,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	steven.price@arm.com,
	aneesh.kumar@kernel.org,
	oupton@kernel.org,
	gshan@redhat.com,
	joey.gouly@arm.com,
	tabba@google.com,
	yuzenghui@huawei.com,
	linux-coco@lists.linux.dev,
	gankulkarni@os.amperecomputing.com,
	sdonthineni@nvidia.com,
	alpergun@google.com,
	fj0570is@fujitsu.com,
	WeiLin.Chang@arm.com,
	lpieralisi@kernel.org,
	enju.kohei@fujitsu.com,
	sudeep.holla@arm.com,
	jonathan.cameron@oss.qualcomm.com,
	Suzuki K Poulose <suzuki.poulose@arm.com>
Subject: [PATCH v21 11/23] KVM: arm64: Use a local kvm pointer in kvm_handle_guest_abort()
Date: Thu,  1 Oct 2026 22:06:51 +0100
Message-ID: <20261001210703.1597150-12-suzuki.poulose@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261001210703.1597150-1-suzuki.poulose@arm.com>
References: <20261001210703.1597150-1-suzuki.poulose@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_140805_989344_395828C1 
X-CRM114-Status: GOOD (  14.50  )
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

kvm_handle_guest_abort() repeatedly obtains the VM from vcpu->kvm.

Introduce a local kvm pointer and use it throughout the function. While
touching the code, fix the missing whitespace in the
kvm_is_nested_s2_mmu() call.

Suggested-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
---
 arch/arm64/kvm/mmu.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 92cdbeb44807e..8fe7178c40bec 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -2287,6 +2287,7 @@ int kvm_handle_guest_sea(struct kvm_vcpu *vcpu)
  */
 int kvm_handle_guest_abort(struct kvm_vcpu *vcpu)
 {
+	struct kvm *kvm = vcpu->kvm;
 	struct kvm_s2_trans nested_trans, *nested = NULL;
 	unsigned long esr;
 	phys_addr_t fault_ipa; /* The address we faulted on */
@@ -2307,7 +2308,7 @@ int kvm_handle_guest_abort(struct kvm_vcpu *vcpu)
 	 * with an SEA.
 	 */
 	ipa = fault_ipa = kvm_vcpu_get_fault_ipa(vcpu);
-	if (KVM_BUG_ON(ipa == INVALID_GPA, vcpu->kvm))
+	if (KVM_BUG_ON(ipa == INVALID_GPA, kvm))
 		return -EFAULT;
 
 	is_iabt = kvm_vcpu_trap_is_iabt(vcpu);
@@ -2342,7 +2343,7 @@ int kvm_handle_guest_abort(struct kvm_vcpu *vcpu)
 		return -EFAULT;
 	}
 
-	idx = srcu_read_lock(&vcpu->kvm->srcu);
+	idx = srcu_read_lock(&kvm->srcu);
 
 	/*
 	 * We may have faulted on a shadow stage 2 page table if we are
@@ -2357,7 +2358,7 @@ int kvm_handle_guest_abort(struct kvm_vcpu *vcpu)
 	 * nothing to walk and we treat it as a 1:1 before going through the
 	 * canonical translation.
 	 */
-	if (kvm_is_nested_s2_mmu(vcpu->kvm,vcpu->arch.hw_mmu) &&
+	if (kvm_is_nested_s2_mmu(kvm, vcpu->arch.hw_mmu) &&
 	    vcpu->arch.hw_mmu->nested_stage2_enabled) {
 		u32 esr;
 
@@ -2385,7 +2386,7 @@ int kvm_handle_guest_abort(struct kvm_vcpu *vcpu)
 	}
 
 	gfn = ipa >> PAGE_SHIFT;
-	memslot = gfn_to_memslot(vcpu->kvm, gfn);
+	memslot = gfn_to_memslot(kvm, gfn);
 	hva = gfn_to_hva_memslot_prot(memslot, gfn, &writable);
 	write_fault = kvm_is_write_fault(vcpu);
 	if (kvm_is_error_hva(hva) || (write_fault && !writable)) {
@@ -2449,7 +2450,7 @@ int kvm_handle_guest_abort(struct kvm_vcpu *vcpu)
 		.hva		= hva,
 	};
 
-	if (kvm_vm_is_protected(vcpu->kvm)) {
+	if (kvm_vm_is_protected(kvm)) {
 		ret = pkvm_mem_abort(&s2fd);
 	} else {
 		VM_WARN_ON_ONCE(kvm_vcpu_trap_is_permission_fault(vcpu) &&
@@ -2468,7 +2469,7 @@ int kvm_handle_guest_abort(struct kvm_vcpu *vcpu)
 	if (ret == -ENOEXEC)
 		ret = kvm_inject_sea_iabt(vcpu, kvm_vcpu_get_hfar(vcpu));
 out_unlock:
-	srcu_read_unlock(&vcpu->kvm->srcu, idx);
+	srcu_read_unlock(&kvm->srcu, idx);
 	return ret;
 }
 
-- 
2.43.0


