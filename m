Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5214BC79F9E
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 15:51:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mwP60Fon81EdojPR3NZ3k8WxQxKfO5dITIIZIKBuLLM=; b=I024G1Ut3yyLKikICsCze0vAj5
	F8jSOMV13hITjNTBbu07jm+sPKVWyJz+aXrM1sjrSI/e/xGmhqUuh3/jWUGwiExU9Ftn8QLcBIHl3
	OrnU/kO1AIhrOxaKMgtp9HdsKEzV6WMIW8aUsoFr1EdxQXrxOcWXn61N7bALmjC1JXuMEmeeMYXIf
	PVBGz53+PC9/IDpkbC3p9ZJEXQLt+wPbtiecAan0RXBYMwzbmG00c933o2A69Dxs95bWRMMZEetRK
	bHyhI9E6Le4uHRz6Aa6pRnHwCixTHb7JNQKxb5JjnqUsN+SJu1E/A0BOMc9JgU085ilsAuaJHbAzS
	ZSljOr2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcmrH-0000000BeVE-13Wl;
	Mon, 05 Jan 2026 15:51:03 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcmrC-0000000BeQF-3zY5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Jan 2026 15:51:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 98290406AD;
	Mon,  5 Jan 2026 15:50:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E561EC19425;
	Mon,  5 Jan 2026 15:50:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767628258;
	bh=ReZO4nEoAFKs1VIoWkegfR0g0ToMLtVz4CXpRkmj0zc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=e+IZUUAgWszcoCZTpYDWEptUuoR55s8TxMNIcDXLPtb5aEQrEsw8jkvwongXtwlxQ
	 EutZS2nbowl0cfiRa1P+3QzKkkB3RGsRs1pC4Hih2BzucMFeYvmVYhg9PceSmBfOpI
	 X3Lh8Z0D16OcTMSyvArqM2Sc7q5ClHkwk6aMkfqtSGJvIfyXovh+gohlOQVgKr8ka2
	 kvR7yUz9xTDHwwVqlvyIIOyrptR7M9MFuOPj3++DVfu7fHnlDoyvg1y3CxNdsmUfum
	 DHwmXmppDgB+Rr9V17S7AqQZITD0WJYIYgBU4adbq1eRjVRlwxf9Phd5py48sy9YGy
	 diqLgBsIJnplA==
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
Subject: [PATCH 22/30] KVM: arm64: Return -EFAULT from VCPU_RUN on access to a poisoned pte
Date: Mon,  5 Jan 2026 15:49:30 +0000
Message-ID: <20260105154939.11041-23-will@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260105154939.11041-1-will@kernel.org>
References: <20260105154939.11041-1-will@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_075059_033981_BB32626F 
X-CRM114-Status: GOOD (  15.09  )
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

Signed-off-by: Will Deacon <will@kernel.org>
---
 arch/arm64/include/asm/kvm_asm.h              |  1 +
 arch/arm64/kvm/hyp/include/nvhe/mem_protect.h |  1 +
 arch/arm64/kvm/hyp/nvhe/hyp-main.c            | 10 +++++
 arch/arm64/kvm/hyp/nvhe/mem_protect.c         | 37 +++++++++++++++++++
 arch/arm64/kvm/pkvm.c                         |  9 +++--
 5 files changed, 55 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_asm.h b/arch/arm64/include/asm/kvm_asm.h
index 286a7379a368..178e2c2724ef 100644
--- a/arch/arm64/include/asm/kvm_asm.h
+++ b/arch/arm64/include/asm/kvm_asm.h
@@ -86,6 +86,7 @@ enum __kvm_host_smccc_func {
 	__KVM_HOST_SMCCC_FUNC___pkvm_unreserve_vm,
 	__KVM_HOST_SMCCC_FUNC___pkvm_init_vm,
 	__KVM_HOST_SMCCC_FUNC___pkvm_init_vcpu,
+	__KVM_HOST_SMCCC_FUNC___pkvm_vcpu_in_poison_fault,
 	__KVM_HOST_SMCCC_FUNC___pkvm_force_reclaim_guest_page,
 	__KVM_HOST_SMCCC_FUNC___pkvm_reclaim_dying_guest_page,
 	__KVM_HOST_SMCCC_FUNC___pkvm_start_teardown_vm,
diff --git a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h b/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
index f27b037abaf3..5e6cdafcdd69 100644
--- a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
+++ b/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
@@ -41,6 +41,7 @@ int __pkvm_hyp_donate_host(u64 pfn, u64 nr_pages);
 int __pkvm_host_share_ffa(u64 pfn, u64 nr_pages);
 int __pkvm_host_unshare_ffa(u64 pfn, u64 nr_pages);
 int __pkvm_host_donate_guest(u64 pfn, u64 gfn, struct pkvm_hyp_vcpu *vcpu);
+int __pkvm_vcpu_in_poison_fault(struct pkvm_hyp_vcpu *hyp_vcpu);
 int __pkvm_host_force_reclaim_page_guest(phys_addr_t phys);
 int __pkvm_host_reclaim_page_guest(u64 gfn, struct pkvm_hyp_vm *vm);
 int __pkvm_host_share_guest(u64 pfn, u64 gfn, u64 nr_pages, struct pkvm_hyp_vcpu *vcpu,
diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
index 7d66cdd7de57..7ff87eb91112 100644
--- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
+++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
@@ -570,6 +570,15 @@ static void handle___pkvm_init_vcpu(struct kvm_cpu_context *host_ctxt)
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
@@ -637,6 +646,7 @@ static const hcall_t host_hcall[] = {
 	HANDLE_FUNC(__pkvm_unreserve_vm),
 	HANDLE_FUNC(__pkvm_init_vm),
 	HANDLE_FUNC(__pkvm_init_vcpu),
+	HANDLE_FUNC(__pkvm_vcpu_in_poison_fault),
 	HANDLE_FUNC(__pkvm_force_reclaim_guest_page),
 	HANDLE_FUNC(__pkvm_reclaim_dying_guest_page),
 	HANDLE_FUNC(__pkvm_start_teardown_vm),
diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
index 5d6028c41125..57bc7ade30de 100644
--- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
+++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
@@ -825,6 +825,43 @@ static int get_valid_guest_pte(struct pkvm_hyp_vm *vm, u64 ipa, kvm_pte_t *ptep,
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
+	ipa = kvm_vcpu_get_fault_ipa(&hyp_vcpu->vcpu);
+	ipa |= kvm_vcpu_get_hfar(&hyp_vcpu->vcpu) & GENMASK(11, 0);
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
index d1926cb08c76..14865907610c 100644
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
2.52.0.351.gbe84eed79e-goog


