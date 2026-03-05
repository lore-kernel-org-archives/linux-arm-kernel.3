Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0AB0F33A79
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 14:46:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b8MP6Fh1w6R+sKcxRelLUkGcxKqrs99KdxZNDTW8fvQ=; b=Rd1cj6RNnFIwCUiJuAEl94ORkd
	zpMe3d0hofEoSa/Yda679BbgXmv0cLfTbfwkD8rES+OTGv98pAA4opLsmP2YDLZPBU9fVMB1kOsIH
	0nMAqENsVr2JjyJRtuCenIVG0lBeBI9jBC/AN4HLrH9zPJ5VmwEclu5X8412mtVRbfHWFmanZgvsd
	bX6MUni5/g7eEdKuYNwJNgytAxxBB/JtdKyC9T2Iu+jns6OpAWXNUFYjNnf4d0sooUYmE8KbOas0r
	8VOi0DEEPUhll9w+5IM7rURUkOEp2LKmDhP985HPBesuv88fUvJwEvxFP5g2rdEjuAMsW1Nn7ZW8L
	RugSPw4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy9xd-000000022nI-1su4;
	Thu, 05 Mar 2026 14:45:57 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy9xc-000000022kJ-0XPF
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 05 Mar 2026 14:45:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=b8MP6Fh1w6R+sKcxRelLUkGcxKqrs99KdxZNDTW8fvQ=; b=eeRgCajCJCiaXyOwBaOZ2GhXhQ
	4uV+dke9dFYxdeMX6sHTooTXDfukxo8qSpcvYqq2GY/4lMzM1CYT0fSEVRLpU+3ss9DbJhpv54/2z
	khrVI2nCXwKCoXJAlJdWMwe88SQmsutl80hLWECEe54HbGn4G8CvqhPu3kAST/uW0PLtw5Hn+SpFt
	b5KsZ0+TcqMKchkjQIQNbAlKQNiS2P7zMCDcSp2UPMKrvCRCYbmMBxCz0kvFI0GafQEtJiA0wd+W+
	UP84iwIHJ9dXKjMqEpvjzedkZAvAUTJ9y8WDzxngab69RJ3HgcPleDnLN1ihe0Oc2iM6e6IVSJSIF
	Zl+Ymsjg==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy9xY-00000006yZH-38K8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 14:45:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7765C42CBC;
	Thu,  5 Mar 2026 14:45:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77C73C116C6;
	Thu,  5 Mar 2026 14:45:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772721951;
	bh=v3KVb0ei2XKe7JH4mQ0tL3ZhknFGX3kJj3Ixv2atPic=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ELDBMzL+5yewdZ8eTaRHY/0NCdHbmhFT7Xs7YJozcKml/YJ06vvg5QvZmdJXC3yru
	 Mx78ooyba6FkO5U3rymr9mgEEyB89nX8LZYvt5IzUDTCvZdYj4qT3Edbt5dD6GsMdl
	 IWLcmosBlBlarwAG9c1yQ7HQyWbNpvHku+mq8Dn4nmgT+/vlSaPWT8e/HXdEy2CmQK
	 ZsexCB3Qvm1ie2NavWdvrevDQRDQ3MqqYBv5oDM6bsRU/TxCBw4uPHZRj4antrOkYK
	 8Bgu8f3CvzYZBOOLSt6Mb8A77MTcHDA864vRUfAc07YzGoTaKGxQcZbwYClvU2lBPC
	 2EWsOOMMsxskQ==
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
Subject: [PATCH v3 29/36] KVM: arm64: Implement the MEM_UNSHARE hypercall for protected VMs
Date: Thu,  5 Mar 2026 14:43:42 +0000
Message-ID: <20260305144351.17071-30-will@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260305144351.17071-1-will@kernel.org>
References: <20260305144351.17071-1-will@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_144553_247174_06E7E3BA 
X-CRM114-Status: GOOD (  13.57  )
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
Signed-off-by: Will Deacon <will@kernel.org>
---
 arch/arm64/kvm/hyp/include/nvhe/mem_protect.h |  1 +
 arch/arm64/kvm/hyp/nvhe/mem_protect.c         | 34 +++++++++++++++++++
 arch/arm64/kvm/hyp/nvhe/pkvm.c                | 22 ++++++++++++
 3 files changed, 57 insertions(+)

diff --git a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h b/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
index 42fd60c5cfc9..e41a128b0854 100644
--- a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
+++ b/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
@@ -36,6 +36,7 @@ extern unsigned long hyp_nr_cpus;
 int __pkvm_prot_finalize(void);
 int __pkvm_host_share_hyp(u64 pfn);
 int __pkvm_guest_share_host(struct pkvm_hyp_vcpu *vcpu, u64 gfn);
+int __pkvm_guest_unshare_host(struct pkvm_hyp_vcpu *vcpu, u64 gfn);
 int __pkvm_host_unshare_hyp(u64 pfn);
 int __pkvm_host_donate_hyp(u64 pfn, u64 nr_pages);
 int __pkvm_hyp_donate_host(u64 pfn, u64 nr_pages);
diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
index 22d456ab15a6..4451955ac767 100644
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
2.53.0.473.g4a7958ca14-goog


