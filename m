Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04E9F10ED679
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 14:02:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vly0gsYCisvp0+cfxbn1vUQ33CRhli81uN3440JFhbQ=; b=XhAouNy2+NqNft0OCYgomIGyO2
	f2t/jweqTRHCLPSH7K1LUeALtkroDV1MU6J/fuiUNVLzvcyEz9+YyawWccFLRS+m9sXZu8VyJtD97
	KGUO/rw7aJlZxFo2kg+2H0kbUJYEhNJfYI7HcRI1apuiKGeI05S0zdJw8MfxcIPOyQDOuUK2r5nRf
	xuNn1mGuqwdqSa4+5Yt/pDGVvCdBEtBfjsexz+WuIq9VwSdinSbqFAsLEc9dP+CV2T7K2c+MRRyjx
	Ch5kezt9H89aZbNR5y67gismJ4HQc+uIoBJe1b4vfbkVW2IKy/D6wwuAPxCXkAoHHFiMzgWM+M4Ht
	wRxMnUDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w67li-00000007WhV-0CUH;
	Fri, 27 Mar 2026 14:02:34 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w67lV-00000007WT3-0ZdJ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Mar 2026 14:02:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8D7C36132F;
	Fri, 27 Mar 2026 14:02:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C80DC19423;
	Fri, 27 Mar 2026 14:02:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774620139;
	bh=UfhVfmV2ocN9vPjWaxmHTS6ed3vAUZ8OQMNJyosxVmc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=eeBwufC2aOWYFxrt4Di5OSEi9QczN1uPkqre7/9KUr6xDCZtkDx/JT0sOpG3TnFln
	 nv5ax7suT4+BVgLr+ZK9/x5xdNiP00jYGhb5A88L/zOCY61hFu7gfLqQsfjJPawk6z
	 GjetaLPZBoPDXXOplRdLK7kbY0krv3QwVLcylH2qYsRjlBWdeBK9fnmXxtpTAJClDq
	 9ZSQcTgy8EB6aUeaNqpvM/pUJJNCmXIF6Pm9tpzkxfsOElG084MvcSXL60QdDCvjCE
	 phGaMGkcrXYeaKe+YpueYhgFL+lmxpLqIe8kQLE3UFiu69AHPOjUzeHhLqigIZztjp
	 PbFsWa6Wyymmw==
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
Subject: [PATCH v4 27/38] KVM: arm64: Return -EFAULT from VCPU_RUN on access to a poisoned pte
Date: Fri, 27 Mar 2026 14:00:26 +0000
Message-ID: <20260327140039.21228-28-will@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260327140039.21228-1-will@kernel.org>
References: <20260327140039.21228-1-will@kernel.org>
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

If a protected vCPU faults on an IPA which appears to be mapped, query
the hypervisor to determine whether or not the faulting pte has been
poisoned by a forceful reclaim. If the pte has been poisoned, return
-EFAULT back to userspace rather than retrying the instruction forever.

Tested-by: Fuad Tabba <tabba@google.com>
Tested-by: Mostafa Saleh <smostafa@google.com>
Signed-off-by: Will Deacon <will@kernel.org>
---
 arch/arm64/include/asm/kvm_asm.h              |  1 +
 arch/arm64/kvm/hyp/include/nvhe/mem_protect.h |  1 +
 arch/arm64/kvm/hyp/nvhe/hyp-main.c            | 10 +++++
 arch/arm64/kvm/hyp/nvhe/mem_protect.c         | 43 +++++++++++++++++++
 arch/arm64/kvm/pkvm.c                         |  9 ++--
 5 files changed, 61 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_asm.h b/arch/arm64/include/asm/kvm_asm.h
index 04a230e906a7..6c79f7504d80 100644
--- a/arch/arm64/include/asm/kvm_asm.h
+++ b/arch/arm64/include/asm/kvm_asm.h
@@ -90,6 +90,7 @@ enum __kvm_host_smccc_func {
 	__KVM_HOST_SMCCC_FUNC___pkvm_unreserve_vm,
 	__KVM_HOST_SMCCC_FUNC___pkvm_init_vm,
 	__KVM_HOST_SMCCC_FUNC___pkvm_init_vcpu,
+	__KVM_HOST_SMCCC_FUNC___pkvm_vcpu_in_poison_fault,
 	__KVM_HOST_SMCCC_FUNC___pkvm_force_reclaim_guest_page,
 	__KVM_HOST_SMCCC_FUNC___pkvm_reclaim_dying_guest_page,
 	__KVM_HOST_SMCCC_FUNC___pkvm_start_teardown_vm,
diff --git a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h b/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
index acc031103600..8bc9a2489298 100644
--- a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
+++ b/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
@@ -40,6 +40,7 @@ int __pkvm_hyp_donate_host(u64 pfn, u64 nr_pages);
 int __pkvm_host_share_ffa(u64 pfn, u64 nr_pages);
 int __pkvm_host_unshare_ffa(u64 pfn, u64 nr_pages);
 int __pkvm_host_donate_guest(u64 pfn, u64 gfn, struct pkvm_hyp_vcpu *vcpu);
+int __pkvm_vcpu_in_poison_fault(struct pkvm_hyp_vcpu *hyp_vcpu);
 int __pkvm_host_force_reclaim_page_guest(phys_addr_t phys);
 int __pkvm_host_reclaim_page_guest(u64 gfn, struct pkvm_hyp_vm *vm);
 int __pkvm_host_share_guest(u64 pfn, u64 gfn, u64 nr_pages, struct pkvm_hyp_vcpu *vcpu,
diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
index 456c83207717..90e3b14fe287 100644
--- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
+++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
@@ -573,6 +573,15 @@ static void handle___pkvm_init_vcpu(struct kvm_cpu_context *host_ctxt)
 	cpu_reg(host_ctxt, 1) = __pkvm_init_vcpu(handle, host_vcpu, vcpu_hva);
 }
 
+static void handle___pkvm_vcpu_in_poison_fault(struct kvm_cpu_context *host_ctxt)
+{
+	int ret;
+	struct pkvm_hyp_vcpu *hyp_vcpu = pkvm_get_loaded_hyp_vcpu();
+
+	ret = hyp_vcpu ? __pkvm_vcpu_in_poison_fault(hyp_vcpu) : -EINVAL;
+	cpu_reg(host_ctxt, 1) = ret;
+}
+
 static void handle___pkvm_force_reclaim_guest_page(struct kvm_cpu_context *host_ctxt)
 {
 	DECLARE_REG(phys_addr_t, phys, host_ctxt, 1);
@@ -641,6 +650,7 @@ static const hcall_t host_hcall[] = {
 	HANDLE_FUNC(__pkvm_unreserve_vm),
 	HANDLE_FUNC(__pkvm_init_vm),
 	HANDLE_FUNC(__pkvm_init_vcpu),
+	HANDLE_FUNC(__pkvm_vcpu_in_poison_fault),
 	HANDLE_FUNC(__pkvm_force_reclaim_guest_page),
 	HANDLE_FUNC(__pkvm_reclaim_dying_guest_page),
 	HANDLE_FUNC(__pkvm_start_teardown_vm),
diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
index dfc512d3bb20..6fc2c77a6920 100644
--- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
+++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
@@ -890,6 +890,49 @@ static int get_valid_guest_pte(struct pkvm_hyp_vm *vm, u64 ipa, kvm_pte_t *ptep,
 	return 0;
 }
 
+int __pkvm_vcpu_in_poison_fault(struct pkvm_hyp_vcpu *hyp_vcpu)
+{
+	struct pkvm_hyp_vm *vm = pkvm_hyp_vcpu_to_hyp_vm(hyp_vcpu);
+	kvm_pte_t pte;
+	s8 level;
+	u64 ipa;
+	int ret;
+
+	switch (kvm_vcpu_trap_get_class(&hyp_vcpu->vcpu)) {
+	case ESR_ELx_EC_DABT_LOW:
+	case ESR_ELx_EC_IABT_LOW:
+		if (kvm_vcpu_trap_is_translation_fault(&hyp_vcpu->vcpu))
+			break;
+		fallthrough;
+	default:
+		return -EINVAL;
+	}
+
+	/*
+	 * The host has the faulting IPA when it calls us from the guest
+	 * fault handler but we retrieve it ourselves from the FAR so as
+	 * to avoid exposing an "oracle" that could reveal data access
+	 * patterns of the guest after initial donation of its pages.
+	 */
+	ipa = kvm_vcpu_get_fault_ipa(&hyp_vcpu->vcpu);
+	ipa |= FAR_TO_FIPA_OFFSET(kvm_vcpu_get_hfar(&hyp_vcpu->vcpu));
+
+	guest_lock_component(vm);
+	ret = kvm_pgtable_get_leaf(&vm->pgt, ipa, &pte, &level);
+	if (ret)
+		goto unlock;
+
+	if (level != KVM_PGTABLE_LAST_LEVEL) {
+		ret = -EINVAL;
+		goto unlock;
+	}
+
+	ret = guest_pte_is_poisoned(pte);
+unlock:
+	guest_unlock_component(vm);
+	return ret;
+}
+
 int __pkvm_host_share_hyp(u64 pfn)
 {
 	u64 phys = hyp_pfn_to_phys(pfn);
diff --git a/arch/arm64/kvm/pkvm.c b/arch/arm64/kvm/pkvm.c
index 32294bd21dde..da0a45dab203 100644
--- a/arch/arm64/kvm/pkvm.c
+++ b/arch/arm64/kvm/pkvm.c
@@ -417,10 +417,13 @@ int pkvm_pgtable_stage2_map(struct kvm_pgtable *pgt, u64 addr, u64 size,
 			return -EINVAL;
 
 		/*
-		 * We raced with another vCPU.
+		 * We either raced with another vCPU or the guest PTE
+		 * has been poisoned by an erroneous host access.
 		 */
-		if (mapping)
-			return -EAGAIN;
+		if (mapping) {
+			ret = kvm_call_hyp_nvhe(__pkvm_vcpu_in_poison_fault);
+			return ret ? -EFAULT : -EAGAIN;
+		}
 
 		ret = kvm_call_hyp_nvhe(__pkvm_host_donate_guest, pfn, gfn);
 	} else {
-- 
2.53.0.1018.g2bb0e51243-goog


