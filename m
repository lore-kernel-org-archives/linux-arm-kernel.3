Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3935810ED67C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 14:03:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DdksUVwNfuurVqyF6ktAKAqOb25nStWOFuuKXC4Wgg0=; b=rHCIRrY0a4HjJ9TEMIoOwzjFHh
	joDHUX11xj1agvAeCRMEMF6bjmXhJa0bMHZpR1bhmOaOgn+4n6BpyiDu1j5TpVq5EwSx/Yrfk1Kqm
	E5QmGrj1OwT7vfxrhZr3+tKEF45mK2TNrIkiTIjq9YTetwGJJz+ryDscH3v2mhpbx9fz+RLZshypI
	ZJw73VA1gTFy+8OvR6cpQJajYdeI8MQJdteiBH7k9PYaIGfZgg3r5NzpOvTd+O0sUKKBxnTE/t6mo
	bAfWVRywKWsygm9GgWSZujV07LAU9pyN/0WDzu/hjGBR1+4J9xkhWxe6IYv6ctvAB2tcBg1kl9V5z
	93DHi2dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w67ms-00000007XZ4-0VKF;
	Fri, 27 Mar 2026 14:03:46 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w67le-00000007Wce-47Rz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Mar 2026 14:02:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D4F5A40E2A;
	Fri, 27 Mar 2026 14:02:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9FB4C2BCB0;
	Fri, 27 Mar 2026 14:02:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774620149;
	bh=6Z0iZGERycgYRVeDH7KrvebzoyeGrw4pAbk81Qe7Nrc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lspK141kWKvYjdYDMqxjvnDFz5gzl6v62bjFGmgcZe1YPaxMpEzHZ3KUgeMm3Mr2a
	 Hs08FxBZopPbL/rk2SpcbzguLQfcqCjxTaSA8KXzhEGovbokrk40gr/STolmVXyHAM
	 9Pv/GdrcDtQzxPUQYg9I718XDgjpYwy8PNk5LF/aEuTpp8JdiQ/P/NnnUdMMvxmiaQ
	 HxG7ZtNZaffsGVuzy/5fq1801cedfnPHb8udM9mw+jK7LlgVkZGgnHo1NFuzJYMIF4
	 66CSRds7TYJoYribhTz0wIhLBIytNmBiyK9nyLmoAB5dkpfvg6tvrZt2pS8YIXxByi
	 TSsa9q0enI3Kw==
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
Subject: [PATCH v4 30/38] KVM: arm64: Implement the MEM_UNSHARE hypercall for protected VMs
Date: Fri, 27 Mar 2026 14:00:29 +0000
Message-ID: <20260327140039.21228-31-will@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260327140039.21228-1-will@kernel.org>
References: <20260327140039.21228-1-will@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_070231_132495_5E05CF16 
X-CRM114-Status: GOOD (  13.20  )
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

Implement the ARM_SMCCC_KVM_FUNC_MEM_UNSHARE hypercall to allow
protected VMs to unshare memory that was previously shared with the host
using the ARM_SMCCC_KVM_FUNC_MEM_SHARE hypercall.

Reviewed-by: Vincent Donnefort <vdonnefort@google.com>
Tested-by: Fuad Tabba <tabba@google.com>
Tested-by: Mostafa Saleh <smostafa@google.com>
Signed-off-by: Will Deacon <will@kernel.org>
---
 arch/arm64/kvm/hyp/include/nvhe/mem_protect.h |  1 +
 arch/arm64/kvm/hyp/nvhe/mem_protect.c         | 34 +++++++++++++++++++
 arch/arm64/kvm/hyp/nvhe/pkvm.c                | 22 ++++++++++++
 3 files changed, 57 insertions(+)

diff --git a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h b/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
index fea8aecae5ef..99d8398afe20 100644
--- a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
+++ b/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
@@ -35,6 +35,7 @@ extern unsigned long hyp_nr_cpus;
 int __pkvm_prot_finalize(void);
 int __pkvm_host_share_hyp(u64 pfn);
 int __pkvm_guest_share_host(struct pkvm_hyp_vcpu *vcpu, u64 gfn);
+int __pkvm_guest_unshare_host(struct pkvm_hyp_vcpu *vcpu, u64 gfn);
 int __pkvm_host_unshare_hyp(u64 pfn);
 int __pkvm_host_donate_hyp(u64 pfn, u64 nr_pages);
 int __pkvm_hyp_donate_host(u64 pfn, u64 nr_pages);
diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
index e005a5690c65..898bd5d767ce 100644
--- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
+++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
@@ -991,6 +991,40 @@ int __pkvm_guest_share_host(struct pkvm_hyp_vcpu *vcpu, u64 gfn)
 	return ret;
 }
 
+int __pkvm_guest_unshare_host(struct pkvm_hyp_vcpu *vcpu, u64 gfn)
+{
+	struct pkvm_hyp_vm *vm = pkvm_hyp_vcpu_to_hyp_vm(vcpu);
+	u64 meta, phys, ipa = hyp_pfn_to_phys(gfn);
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
+	if (pkvm_getstate(kvm_pgtable_stage2_pte_prot(pte)) != PKVM_PAGE_SHARED_OWNED)
+		goto unlock;
+	if (__host_check_page_state_range(phys, PAGE_SIZE, PKVM_PAGE_SHARED_BORROWED))
+		goto unlock;
+
+	ret = 0;
+	meta = host_stage2_encode_gfn_meta(vm, gfn);
+	WARN_ON(host_stage2_set_owner_metadata_locked(phys, PAGE_SIZE,
+						      PKVM_ID_GUEST, meta));
+	WARN_ON(kvm_pgtable_stage2_map(&vm->pgt, ipa, PAGE_SIZE, phys,
+				       pkvm_mkstate(KVM_PGTABLE_PROT_RWX, PKVM_PAGE_OWNED),
+				       &vcpu->vcpu.arch.pkvm_memcache, 0));
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
index 1dc9225073c4..ebfd9904ede6 100644
--- a/arch/arm64/kvm/hyp/nvhe/pkvm.c
+++ b/arch/arm64/kvm/hyp/nvhe/pkvm.c
@@ -1019,6 +1019,19 @@ static bool pkvm_memshare_call(u64 *ret, struct kvm_vcpu *vcpu, u64 *exit_code)
 	return false;
 }
 
+static void pkvm_memunshare_call(u64 *ret, struct kvm_vcpu *vcpu)
+{
+	struct pkvm_hyp_vcpu *hyp_vcpu;
+	u64 ipa = smccc_get_arg1(vcpu);
+
+	if (!PAGE_ALIGNED(ipa))
+		return;
+
+	hyp_vcpu = container_of(vcpu, struct pkvm_hyp_vcpu, vcpu);
+	if (!__pkvm_guest_unshare_host(hyp_vcpu, hyp_phys_to_pfn(ipa)))
+		ret[0] = SMCCC_RET_SUCCESS;
+}
+
 /*
  * Handler for protected VM HVC calls.
  *
@@ -1036,6 +1049,7 @@ bool kvm_handle_pvm_hvc64(struct kvm_vcpu *vcpu, u64 *exit_code)
 		val[0] = BIT(ARM_SMCCC_KVM_FUNC_FEATURES);
 		val[0] |= BIT(ARM_SMCCC_KVM_FUNC_HYP_MEMINFO);
 		val[0] |= BIT(ARM_SMCCC_KVM_FUNC_MEM_SHARE);
+		val[0] |= BIT(ARM_SMCCC_KVM_FUNC_MEM_UNSHARE);
 		break;
 	case ARM_SMCCC_VENDOR_HYP_KVM_HYP_MEMINFO_FUNC_ID:
 		if (smccc_get_arg1(vcpu) ||
@@ -1054,6 +1068,14 @@ bool kvm_handle_pvm_hvc64(struct kvm_vcpu *vcpu, u64 *exit_code)
 
 		handled = pkvm_memshare_call(val, vcpu, exit_code);
 		break;
+	case ARM_SMCCC_VENDOR_HYP_KVM_MEM_UNSHARE_FUNC_ID:
+		if (smccc_get_arg2(vcpu) ||
+		    smccc_get_arg3(vcpu)) {
+			break;
+		}
+
+		pkvm_memunshare_call(val, vcpu);
+		break;
 	default:
 		/* Punt everything else back to the host, for now. */
 		handled = false;
-- 
2.53.0.1018.g2bb0e51243-goog


