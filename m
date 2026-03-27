Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A13C10ED67F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 14:01:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9mASlTWDbzSrVprFTgMWw50aEwlhVVMvCBG5j6TUpAc=; b=zmL9KdrGQjkFEf0PRdvWTja2FJ
	tE6hPfzlh6FrbMXK1AgFN9lQwnubJ+BIokeJUYKboAWrPntxg1cMTUNrBNC/uTWbPx04jIvCn4RM9
	8r/vtMflfwSB+RuNeGTzjdGUsFr9MDXXte286Gcs+riDnKPrUbqMGAnrp4cFnd3XTpmPKQX0VjLMJ
	OLlXr20eNKTfeK0Y1C1fHkMq9rj5AUG/eRuc9So1Zybi8dLlrJF+r4LlI9OblQVvga3KqbftUoglT
	vThyJmRNa8JQmP/kJorSOMLvYCFOY/4cXtuxnolGwvXYh1j1yQQ3CP+as1Oif1K4i5hIFM9fTlRLP
	PNItTq4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w67kr-00000007Vuf-1NuG;
	Fri, 27 Mar 2026 14:01:41 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w67kh-00000007VmK-229c
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Mar 2026 14:01:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D805260132;
	Fri, 27 Mar 2026 14:01:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D64C4C19423;
	Fri, 27 Mar 2026 14:01:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774620090;
	bh=3p+s6mSLzngeE4GeNqWVaT7bt4Pawk6N3abwHTMrSPY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mxziDulcFP5TTNz4dknKOZEhwhK9ILzfdj3lTedHqxV2moeWfJPgnFYI7k/qTg0JF
	 tBuiMRrOplpqo1g9FuQIgeF7HEOjFvTSxV4QXQ1FU8yPbkaWaZZ4wTvkLFkn9K7Tq0
	 6t0dFQJiqGsUN7epTEoG/JqqxXojdL7oYFw7muiu+B6pSelamcIkUv9LK03jA8rBKc
	 hR3Bzkykh4nni9A+VVVNHam8trTCmo0eAcC8RucHmo/nJM0kTKrvXi98Db/HwXOpoa
	 yn9r82eqvZTwJckkQOji+calC2cXMmfGQfSk+1vPE+CL26xFcsUG6JdlKP/CKO5XhK
	 aM8TBowaYpuIw==
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
Subject: [PATCH v4 12/38] KVM: arm64: Introduce __pkvm_host_donate_guest()
Date: Fri, 27 Mar 2026 14:00:11 +0000
Message-ID: <20260327140039.21228-13-will@kernel.org>
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

In preparation for supporting protected VMs, whose memory pages are
isolated from the host, introduce a new pKVM hypercall to allow the
donation of pages to a guest.

Tested-by: Fuad Tabba <tabba@google.com>
Tested-by: Mostafa Saleh <smostafa@google.com>
Signed-off-by: Will Deacon <will@kernel.org>
---
 arch/arm64/include/asm/kvm_asm.h              |  1 +
 arch/arm64/include/asm/kvm_pgtable.h          |  2 +-
 arch/arm64/kvm/hyp/include/nvhe/mem_protect.h |  2 ++
 arch/arm64/kvm/hyp/nvhe/hyp-main.c            | 21 +++++++++++++
 arch/arm64/kvm/hyp/nvhe/mem_protect.c         | 30 +++++++++++++++++++
 5 files changed, 55 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/kvm_asm.h b/arch/arm64/include/asm/kvm_asm.h
index df6b661701b6..dfc6625c8269 100644
--- a/arch/arm64/include/asm/kvm_asm.h
+++ b/arch/arm64/include/asm/kvm_asm.h
@@ -79,6 +79,7 @@ enum __kvm_host_smccc_func {
 	/* Hypercalls that are available only when pKVM has finalised. */
 	__KVM_HOST_SMCCC_FUNC___pkvm_host_share_hyp,
 	__KVM_HOST_SMCCC_FUNC___pkvm_host_unshare_hyp,
+	__KVM_HOST_SMCCC_FUNC___pkvm_host_donate_guest,
 	__KVM_HOST_SMCCC_FUNC___pkvm_host_share_guest,
 	__KVM_HOST_SMCCC_FUNC___pkvm_host_unshare_guest,
 	__KVM_HOST_SMCCC_FUNC___pkvm_host_relax_perms_guest,
diff --git a/arch/arm64/include/asm/kvm_pgtable.h b/arch/arm64/include/asm/kvm_pgtable.h
index c201168f2857..50caca311ef5 100644
--- a/arch/arm64/include/asm/kvm_pgtable.h
+++ b/arch/arm64/include/asm/kvm_pgtable.h
@@ -100,7 +100,7 @@ typedef u64 kvm_pte_t;
 					 KVM_PTE_LEAF_ATTR_HI_S2_XN)
 
 #define KVM_INVALID_PTE_OWNER_MASK	GENMASK(9, 2)
-#define KVM_MAX_OWNER_ID		1
+#define KVM_MAX_OWNER_ID		2
 
 /*
  * Used to indicate a pte for which a 'break-before-make' sequence is in
diff --git a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h b/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
index 7f25f2bca90c..7061b0be340a 100644
--- a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
+++ b/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
@@ -27,6 +27,7 @@ extern struct host_mmu host_mmu;
 enum pkvm_component_id {
 	PKVM_ID_HOST,
 	PKVM_ID_HYP,
+	PKVM_ID_GUEST,
 };
 
 extern unsigned long hyp_nr_cpus;
@@ -38,6 +39,7 @@ int __pkvm_host_donate_hyp(u64 pfn, u64 nr_pages);
 int __pkvm_hyp_donate_host(u64 pfn, u64 nr_pages);
 int __pkvm_host_share_ffa(u64 pfn, u64 nr_pages);
 int __pkvm_host_unshare_ffa(u64 pfn, u64 nr_pages);
+int __pkvm_host_donate_guest(u64 pfn, u64 gfn, struct pkvm_hyp_vcpu *vcpu);
 int __pkvm_host_share_guest(u64 pfn, u64 gfn, u64 nr_pages, struct pkvm_hyp_vcpu *vcpu,
 			    enum kvm_pgtable_prot prot);
 int __pkvm_host_unshare_guest(u64 gfn, u64 nr_pages, struct pkvm_hyp_vm *hyp_vm);
diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
index 634ea2766240..970656318cf2 100644
--- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
+++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
@@ -241,6 +241,26 @@ static int pkvm_refill_memcache(struct pkvm_hyp_vcpu *hyp_vcpu)
 			       &host_vcpu->arch.pkvm_memcache);
 }
 
+static void handle___pkvm_host_donate_guest(struct kvm_cpu_context *host_ctxt)
+{
+	DECLARE_REG(u64, pfn, host_ctxt, 1);
+	DECLARE_REG(u64, gfn, host_ctxt, 2);
+	struct pkvm_hyp_vcpu *hyp_vcpu;
+	int ret = -EINVAL;
+
+	hyp_vcpu = pkvm_get_loaded_hyp_vcpu();
+	if (!hyp_vcpu || !pkvm_hyp_vcpu_is_protected(hyp_vcpu))
+		goto out;
+
+	ret = pkvm_refill_memcache(hyp_vcpu);
+	if (ret)
+		goto out;
+
+	ret = __pkvm_host_donate_guest(pfn, gfn, hyp_vcpu);
+out:
+	cpu_reg(host_ctxt, 1) =  ret;
+}
+
 static void handle___pkvm_host_share_guest(struct kvm_cpu_context *host_ctxt)
 {
 	DECLARE_REG(u64, pfn, host_ctxt, 1);
@@ -595,6 +615,7 @@ static const hcall_t host_hcall[] = {
 
 	HANDLE_FUNC(__pkvm_host_share_hyp),
 	HANDLE_FUNC(__pkvm_host_unshare_hyp),
+	HANDLE_FUNC(__pkvm_host_donate_guest),
 	HANDLE_FUNC(__pkvm_host_share_guest),
 	HANDLE_FUNC(__pkvm_host_unshare_guest),
 	HANDLE_FUNC(__pkvm_host_relax_perms_guest),
diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
index 7d22893ab1dc..03e6fa124253 100644
--- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
+++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
@@ -971,6 +971,36 @@ static int __guest_check_transition_size(u64 phys, u64 ipa, u64 nr_pages, u64 *s
 	return 0;
 }
 
+int __pkvm_host_donate_guest(u64 pfn, u64 gfn, struct pkvm_hyp_vcpu *vcpu)
+{
+	struct pkvm_hyp_vm *vm = pkvm_hyp_vcpu_to_hyp_vm(vcpu);
+	u64 phys = hyp_pfn_to_phys(pfn);
+	u64 ipa = hyp_pfn_to_phys(gfn);
+	int ret;
+
+	host_lock_component();
+	guest_lock_component(vm);
+
+	ret = __host_check_page_state_range(phys, PAGE_SIZE, PKVM_PAGE_OWNED);
+	if (ret)
+		goto unlock;
+
+	ret = __guest_check_page_state_range(vm, ipa, PAGE_SIZE, PKVM_NOPAGE);
+	if (ret)
+		goto unlock;
+
+	WARN_ON(host_stage2_set_owner_locked(phys, PAGE_SIZE, PKVM_ID_GUEST));
+	WARN_ON(kvm_pgtable_stage2_map(&vm->pgt, ipa, PAGE_SIZE, phys,
+				       pkvm_mkstate(KVM_PGTABLE_PROT_RWX, PKVM_PAGE_OWNED),
+				       &vcpu->vcpu.arch.pkvm_memcache, 0));
+
+unlock:
+	guest_unlock_component(vm);
+	host_unlock_component();
+
+	return ret;
+}
+
 int __pkvm_host_share_guest(u64 pfn, u64 gfn, u64 nr_pages, struct pkvm_hyp_vcpu *vcpu,
 			    enum kvm_pgtable_prot prot)
 {
-- 
2.53.0.1018.g2bb0e51243-goog


