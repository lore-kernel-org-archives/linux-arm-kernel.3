Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB01BC98325
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 16:06:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WFAozQ5zwkdYus+cQjlyfftwunh1JQ/JxjX7o4CS9xc=; b=uVAGakPgODXEsOyADCR7E6U5fW
	y3A9X4pSOD7NumvWPTUOHhSSxnVbY9TdKqkvQ5n+1iwzbslWEcy5JYsE29zRC6mFHizoAhCCbbV82
	saaGkZBWbFXx6+SQ627nuiwm+HY9QYrhPcmuv5HV5G3vWMB0847402Y/MxE64po1Tvf/rVDbCjOAu
	4NqegAfNcp3jLjd2vMlGy4nBwhL3hORbUv1Rv8V5NKGzC4gUbjqc90zybnXGCRnRiTr5SKqIx5BuD
	umBsejLqs4Emj+OLEnynxvKHI938UXWNpCJDIjwSglazp/1bTRpQSXv3gf0gm7QZOylESRFno3rRa
	WhKnD9vQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9lxu-0000000BX81-2HfO;
	Thu, 24 Sep 2026 16:06:30 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9lxZ-0000000BWuI-3ECv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 16:06:12 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 692B01E7D;
	Thu, 24 Sep 2026 09:06:05 -0700 (PDT)
Received: from ewhatever.cambridge.arm.com (ewhatever.cambridge.arm.com [10.2.197.99])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D4CF43F86C;
	Thu, 24 Sep 2026 09:06:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790265968; bh=XKUI0O+yupvbzqqTCtUZd6FFNrWihRgYRS3Pt81HQOM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZLo+LMYOo3zDlgRnvgVuTcBsAZj2x1FVzaGN9lIWkFfFwBijU/CUySO2+3dxbw6ec
	 HlyqqMi01NHfvhhb7UEOr/x4o7le5+19zMdQGJ3wDZdQ8g61abJ8lsRr0HwRTuhWiU
	 QYIWHZyxYfEYXCAbiHGhvJrH4Xxm265z3Gn7d75Q=
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
Subject: [PATCH v20 11/22] KVM: arm64: Use a local kvm pointer in kvm_handle_guest_abort()
Date: Thu, 24 Sep 2026 17:04:53 +0100
Message-ID: <20260924160504.853911-12-suzuki.poulose@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260924160504.853911-1-suzuki.poulose@arm.com>
References: <20260924160504.853911-1-suzuki.poulose@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_090609_943778_76F3323A 
X-CRM114-Status: GOOD (  14.55  )
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


