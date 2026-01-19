Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 201C4CCF2F9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 12:49:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZuiYLXlGkYHPFeaj/0AJYpJIdR9urN8Fau32/NbTpTw=; b=Z37lifQOeO0MpgjXnisrCoWkin
	XnvnRWtnPQAu/h+7TwyvK7RkqSjkAy7ydNNFbp/eBWXL53BXbJ3+FH8NC3IpU27Cjjd9O/j1CIKi4
	fn9CbgmUbLIjYcmR4fFjNdNOMsdOUhjX5g+E6S4h1k/IxwQoedCLm9FzRFF+xrcyKzwPr93BxPHOr
	+1oTXFLPnK2zIUlT6lUWZId/Q//gs1hCcPfbfxAkYycdLfXp6svgieyISgcp2PVDkCAW6Zu7Asv6A
	5lUMpiF3CKYnRo20RcfKNaxdGQqXY8SRM5dXxh8Wkis+Q0QGKBuLv5EjJwOOxsrVzJqhXU79iE5cw
	I34EC/dA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhogn-000000024Wq-3UuH;
	Mon, 19 Jan 2026 12:49:01 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhogB-000000023zW-1j8h
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Jan 2026 12:48:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C6AF56016C;
	Mon, 19 Jan 2026 12:48:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3F4EC116C6;
	Mon, 19 Jan 2026 12:48:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768826902;
	bh=dVWfvIfyOr8qBQ0+yJXKHDLffmDd3mqOBXloDEZtcSo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YytEKQKNsYNvUTGtBZpw1eRz9f4ruIfgzsE+2Nh0UV4owUExbIQgKxVAgebuh5shd
	 DehqHJnDTk3JuNYxzuSMDvvZFAE45uoeosKlvp/zAuXXhThlmPBeDCs7aW9U2LqQsz
	 Lc3YpJAG68nv54lVquz91ooXTllfRMy12wkre24rM7z1RwzGxuMybtUP0Ss0FE5Xu/
	 Rg6cTIDES9jHcXA02erKdr9En24d4zKrfAq/mfVAx+ykjEkuZQPlriBMAHyMG6tv/5
	 1lx8Z0SfZM8NvaSYJ0oVAqF5+LrPFCxQiwMvnqi5EIHFA6qt7LoAQzSURGw6LRixhh
	 MaamyBuoAD6qQ==
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
Subject: [PATCH v2 29/35] KVM: arm64: Implement the MEM_UNSHARE hypercall for protected VMs
Date: Mon, 19 Jan 2026 12:46:22 +0000
Message-ID: <20260119124629.2563-30-will@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260119124629.2563-1-will@kernel.org>
References: <20260119124629.2563-1-will@kernel.org>
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
index 7535a45565f4..3969a92dc3e2 100644
--- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
+++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
@@ -999,6 +999,40 @@ int __pkvm_guest_share_host(struct pkvm_hyp_vcpu *vcpu, u64 gfn)
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
index 4133556560d9..4ddb3d70f9c0 100644
--- a/arch/arm64/kvm/hyp/nvhe/pkvm.c
+++ b/arch/arm64/kvm/hyp/nvhe/pkvm.c
@@ -989,6 +989,19 @@ static bool pkvm_memshare_call(u64 *ret, struct kvm_vcpu *vcpu, u64 *exit_code)
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
@@ -1006,6 +1019,7 @@ bool kvm_handle_pvm_hvc64(struct kvm_vcpu *vcpu, u64 *exit_code)
 		val[0] = BIT(ARM_SMCCC_KVM_FUNC_FEATURES);
 		val[0] |= BIT(ARM_SMCCC_KVM_FUNC_HYP_MEMINFO);
 		val[0] |= BIT(ARM_SMCCC_KVM_FUNC_MEM_SHARE);
+		val[0] |= BIT(ARM_SMCCC_KVM_FUNC_MEM_UNSHARE);
 		break;
 	case ARM_SMCCC_VENDOR_HYP_KVM_HYP_MEMINFO_FUNC_ID:
 		if (smccc_get_arg1(vcpu) ||
@@ -1024,6 +1038,14 @@ bool kvm_handle_pvm_hvc64(struct kvm_vcpu *vcpu, u64 *exit_code)
 
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
2.52.0.457.g6b5491de43-goog


