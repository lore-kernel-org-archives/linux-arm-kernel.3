Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 252F8F33A78
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 14:45:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ERL8gUX25chPCazYShDFtL8TVybYxwGIGgbICDuwGPI=; b=bpj0RFhgFuB6jOBiR6Ac6jX5lL
	nHKshAGDWnUsHHG4g1emIRpLbRXxXKElkrLrBr2GGhA8ESXuFuQpy529XqA3RVEc3Sxq7ZPCemKS1
	7i1pZsCqx/PPRxG1eBG9MWK9uBEMjjT+dJuwtTm+apuFFn7HM0IpvytyFaPRf+xcdW0e1y4RPjMEy
	HNLFzHPrXZz82cRRjRVoraM9q/biD6hqZ1PaJtd8bos7+EI9gN7Q0zd8Di5e/ibv0nuX1hLhFtKiD
	bMrMF6aWNaaJ+LVOInOipMH/M89Ma1rcNy/AcqVrNydd/hIha2l52+c0NvQVLK6P3p5tRKJrlwN/F
	Sxk0hi9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy9xW-000000022ec-0MN9;
	Thu, 05 Mar 2026 14:45:50 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy9xU-000000022cm-3RaP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 14:45:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 37BF96184D;
	Thu,  5 Mar 2026 14:45:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C988C116C6;
	Thu,  5 Mar 2026 14:45:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772721947;
	bh=SxVupkR9lrmKBLtRq5DSHfmprnSZ/st/c8udRURmZPU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BUJTMpa2GUW0BmuxG1CzdUcaHm/z6aXvExy+PVGencu385IhPXvqxm6cmfDt2UWoV
	 5Gszf8D4zoAfAjzqrEE3WjdhkUCq5PXawaXrcaGBLIi6rFRBxiqsmXsnRmll6Dm52N
	 ohqbg/T7RPT3LcxwlaOxOEBq89IHXiCU7rqpFMkvon00Vouleh0w7qLHtyDLqV+oVT
	 3sHUnMb7R2IZge+x9gq9h7C1VqH5rQBrbzoUFGS/4uOQkpUyWSWZtKHjyvsImLg2A/
	 H+JaM1+z1Dy8lm7aBRToM4AZAurPc7PIgHWOI5XYmeT+0t7GbrlwrZQ0h3MhQVNiPw
	 v6P0Ey4n+pQbA==
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
Subject: [PATCH v3 28/36] KVM: arm64: Implement the MEM_SHARE hypercall for protected VMs
Date: Thu,  5 Mar 2026 14:43:41 +0000
Message-ID: <20260305144351.17071-29-will@kernel.org>
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

Implement the ARM_SMCCC_KVM_FUNC_MEM_SHARE hypercall to allow protected
VMs to share memory (e.g. the swiotlb bounce buffers) back to the host.

Reviewed-by: Vincent Donnefort <vdonnefort@google.com>
Signed-off-by: Will Deacon <will@kernel.org>
---
 arch/arm64/kvm/hyp/include/nvhe/mem_protect.h |  1 +
 arch/arm64/kvm/hyp/nvhe/mem_protect.c         | 32 ++++++++++
 arch/arm64/kvm/hyp/nvhe/pkvm.c                | 61 +++++++++++++++++++
 3 files changed, 94 insertions(+)

diff --git a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h b/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
index 5e6cdafcdd69..42fd60c5cfc9 100644
--- a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
+++ b/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
@@ -35,6 +35,7 @@ extern unsigned long hyp_nr_cpus;
 
 int __pkvm_prot_finalize(void);
 int __pkvm_host_share_hyp(u64 pfn);
+int __pkvm_guest_share_host(struct pkvm_hyp_vcpu *vcpu, u64 gfn);
 int __pkvm_host_unshare_hyp(u64 pfn);
 int __pkvm_host_donate_hyp(u64 pfn, u64 nr_pages);
 int __pkvm_hyp_donate_host(u64 pfn, u64 nr_pages);
diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
index 7f705f662c40..22d456ab15a6 100644
--- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
+++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
@@ -959,6 +959,38 @@ int __pkvm_host_share_hyp(u64 pfn)
 	return ret;
 }
 
+int __pkvm_guest_share_host(struct pkvm_hyp_vcpu *vcpu, u64 gfn)
+{
+	struct pkvm_hyp_vm *vm = pkvm_hyp_vcpu_to_hyp_vm(vcpu);
+	u64 phys, ipa = hyp_pfn_to_phys(gfn);
+	kvm_pte_t pte;
+	int ret;
+
+	host_lock_component();
+	guest_lock_component(vm);
+
+	ret = get_valid_guest_pte(vm, ipa, &pte, &phys);
+	if (ret)
+		goto unlock;
+
+	ret = -EPERM;
+	if (pkvm_getstate(kvm_pgtable_stage2_pte_prot(pte)) != PKVM_PAGE_OWNED)
+		goto unlock;
+	if (__host_check_page_state_range(phys, PAGE_SIZE, PKVM_NOPAGE))
+		goto unlock;
+
+	ret = 0;
+	WARN_ON(kvm_pgtable_stage2_map(&vm->pgt, ipa, PAGE_SIZE, phys,
+				       pkvm_mkstate(KVM_PGTABLE_PROT_RWX, PKVM_PAGE_SHARED_OWNED),
+				       &vcpu->vcpu.arch.pkvm_memcache, 0));
+	WARN_ON(__host_set_page_state_range(phys, PAGE_SIZE, PKVM_PAGE_SHARED_BORROWED));
+unlock:
+	guest_unlock_component(vm);
+	host_unlock_component();
+
+	return ret;
+}
+
 int __pkvm_host_unshare_hyp(u64 pfn)
 {
 	u64 phys = hyp_pfn_to_phys(pfn);
diff --git a/arch/arm64/kvm/hyp/nvhe/pkvm.c b/arch/arm64/kvm/hyp/nvhe/pkvm.c
index 8b32bf37acc3..1dc9225073c4 100644
--- a/arch/arm64/kvm/hyp/nvhe/pkvm.c
+++ b/arch/arm64/kvm/hyp/nvhe/pkvm.c
@@ -967,6 +967,58 @@ int __pkvm_finalize_teardown_vm(pkvm_handle_t handle)
 	hyp_spin_unlock(&vm_table_lock);
 	return err;
 }
+
+static u64 __pkvm_memshare_page_req(struct kvm_vcpu *vcpu, u64 ipa)
+{
+	u64 elr;
+
+	/* Fake up a data abort (level 3 translation fault on write) */
+	vcpu->arch.fault.esr_el2 = (ESR_ELx_EC_DABT_LOW << ESR_ELx_EC_SHIFT) |
+				   ESR_ELx_WNR | ESR_ELx_FSC_FAULT |
+				   FIELD_PREP(ESR_ELx_FSC_LEVEL, 3);
+
+	/* Shuffle the IPA around into the HPFAR */
+	vcpu->arch.fault.hpfar_el2 = (HPFAR_EL2_NS | (ipa >> 8)) & HPFAR_MASK;
+
+	/* This is a virtual address. 0's good. Let's go with 0. */
+	vcpu->arch.fault.far_el2 = 0;
+
+	/* Rewind the ELR so we return to the HVC once the IPA is mapped */
+	elr = read_sysreg(elr_el2);
+	elr -= 4;
+	write_sysreg(elr, elr_el2);
+
+	return ARM_EXCEPTION_TRAP;
+}
+
+static bool pkvm_memshare_call(u64 *ret, struct kvm_vcpu *vcpu, u64 *exit_code)
+{
+	struct pkvm_hyp_vcpu *hyp_vcpu;
+	u64 ipa = smccc_get_arg1(vcpu);
+
+	if (!PAGE_ALIGNED(ipa))
+		goto out_guest;
+
+	hyp_vcpu = container_of(vcpu, struct pkvm_hyp_vcpu, vcpu);
+	switch (__pkvm_guest_share_host(hyp_vcpu, hyp_phys_to_pfn(ipa))) {
+	case 0:
+		ret[0] = SMCCC_RET_SUCCESS;
+		goto out_guest;
+	case -ENOENT:
+		/*
+		 * Convert the exception into a data abort so that the page
+		 * being shared is mapped into the guest next time.
+		 */
+		*exit_code = __pkvm_memshare_page_req(vcpu, ipa);
+		goto out_host;
+	}
+
+out_guest:
+	return true;
+out_host:
+	return false;
+}
+
 /*
  * Handler for protected VM HVC calls.
  *
@@ -983,6 +1035,7 @@ bool kvm_handle_pvm_hvc64(struct kvm_vcpu *vcpu, u64 *exit_code)
 	case ARM_SMCCC_VENDOR_HYP_KVM_FEATURES_FUNC_ID:
 		val[0] = BIT(ARM_SMCCC_KVM_FUNC_FEATURES);
 		val[0] |= BIT(ARM_SMCCC_KVM_FUNC_HYP_MEMINFO);
+		val[0] |= BIT(ARM_SMCCC_KVM_FUNC_MEM_SHARE);
 		break;
 	case ARM_SMCCC_VENDOR_HYP_KVM_HYP_MEMINFO_FUNC_ID:
 		if (smccc_get_arg1(vcpu) ||
@@ -993,6 +1046,14 @@ bool kvm_handle_pvm_hvc64(struct kvm_vcpu *vcpu, u64 *exit_code)
 
 		val[0] = PAGE_SIZE;
 		break;
+	case ARM_SMCCC_VENDOR_HYP_KVM_MEM_SHARE_FUNC_ID:
+		if (smccc_get_arg2(vcpu) ||
+		    smccc_get_arg3(vcpu)) {
+			break;
+		}
+
+		handled = pkvm_memshare_call(val, vcpu, exit_code);
+		break;
 	default:
 		/* Punt everything else back to the host, for now. */
 		handled = false;
-- 
2.53.0.473.g4a7958ca14-goog


