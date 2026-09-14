Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 354BAC88E66
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 12:27:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C4NpQb5XhJVGlGt5CTl/rUdz6rEZJtjDW0HpeqsCBQw=; b=UUMo2qS3h1mhzi9loxm8d0I4MX
	lR6zLJfOiJiZQ4Rh6nJUw2aGPMWcOvSr2FYjlFrsAslyjyF9s1NKR1rFNnYZONX5tSnrpiiT6Efdg
	u3+l+H4Gb24UX61yOk1SD0RmLt4XWNS9Q9IupNuwzd+poo/uJqBMYdCvoFN7ZBMBFkVnJGSB+CQqw
	AADLghUjwozb+QEVhK7ANb2h3U3IjnzeegBa/0NIr+kGkiAq4op1Q0U7VCRN+U978uml7XB40H/a6
	7zRAl5mvhwWOAKnqG3j0ccLUuHWYfzeU34o5Q6UsT8eYp42IXnldSSqQHMycX2dUMOOkDg06CjAsV
	4CgryyOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x65m4-00000003XXx-03rP;
	Mon, 14 Sep 2026 12:27:04 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x65m0-00000003XWE-2RQC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 12:27:00 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0CC6B41761;
	Mon, 14 Sep 2026 12:27:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 899831F000FF;
	Mon, 14 Sep 2026 12:26:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789388819;
	bh=C4NpQb5XhJVGlGt5CTl/rUdz6rEZJtjDW0HpeqsCBQw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=b8yHPw03mHxs/ro3lqxKEetFolYD0ty8BA68mqW2d5zb/aKhpnTcu028vS8Q8vke6
	 PBZ+E29kBe14CGJ06DU15BG+S2lsHMxta8WBgfYI42LLRgcvpiJ0/1a2FletnEY9Lq
	 94g70uHUquT+X09JP9YGXdjQ2g+US4o1ow6/7lggt/puQu2V2HRepTtSwg7bpbzsP0
	 ntccvKeWIT/0D2His1/PWxkGQ21TnXtq60uasaaFshrYHEviFKS5QhdYITMaOdCbFA
	 J2Dh0QWqKQwPh1WMCho70dg8HjJZwrcEUlf9MkSw8eOykaeddF3bx87CZgD7UIEKEr
	 hFpsMjZtqQSLA==
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Date: Mon, 14 Sep 2026 13:26:15 +0100
Subject: [PATCH v2 04/13] KVM: arm64: Propagate and use mmu in s2fd when
 handling guest aborts
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-kvm-arm-prefault-v2-4-26fb47f74b73@kernel.org>
References: <20260914-kvm-arm-prefault-v2-0-26fb47f74b73@kernel.org>
In-Reply-To: <20260914-kvm-arm-prefault-v2-0-26fb47f74b73@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, 
 Oliver Upton <oupton@kernel.org>, Fuad Tabba <tabba@google.com>, 
 Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Zenghui Yu <yuzenghui@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Jonathan Corbet <corbet@lwn.net>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kvmarm@lists.linux.dev, kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, Jack Thomson <jackabt@amazon.com>, 
 Jack Thomson <jackabt.amazon@gmail.com>, 
 Alexandru Elisei <alexandru.elisei@arm.com>, 
 Vincent Donnefort <vdonnefort@google.com>, 
 "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, 
 Sean Christopherson <seanjc@google.com>, 
 Claudio Imbrenda <imbrenda@linux.ibm.com>, 
 Leo Soares Passos <Leo.Bras@arm.com>, 
 "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3977; i=ljs@kernel.org;
 h=from:subject:message-id; bh=dG6C64QjhNHNdOgwg9m9mJcfl3nv/5lgtPr2u+2vsyE=;
 b=owGbwMvMwCV2fu7ZrsZH9SKMp9WSGLKWP//6qmgZi8tfPZ2A9beXxt2ZfDYiklHmpfwRHk2Om
 Yffq1UGdJSyMIhxMciKKbI8/yK+P0gkbF7nBX83mDmsTCBDGLg4BWAih9Yz/LP2l1Da9SKXqT3R
 e0PLptU1nXH/Kvgrk3Z5TuM+V3xwuy7DX7FNkvPW3dkSdK3mhIHzhpDr+ZVcbtI5+TqvLZla7t5
 U5QcA
X-Developer-Key: i=ljs@kernel.org; a=openpgp;
 fpr=E7F417BF5214569E89D04F46CF9DCD8A81E27F14
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

kvm_handle_guest_abort() establishes a kvm_s2_fault_desc data structure,
s2fd, to store and propagate state to either pkvm_mem_abort(), gmem_abort()
or user_mem_abort() handlers.

Each of these, however, examines the state of the stage 2 MMU via
vcpu->arch.hw_mmu.

Introduce an s2fd->mmu field to abstract this and propagate it to callers.

Similar to adding the esr field, this allows injection of synthetic faults
with the ultimate intention of implementing stage 2 page table
pre-faulting.

No functional change intended.

Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
---
 arch/arm64/kvm/mmu.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 8303121e3332..f402481e8a4e 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -1604,6 +1604,7 @@ struct kvm_s2_fault_desc {
 	struct kvm_memory_slot	*memslot;
 	unsigned long		hva;
 	unsigned long		esr;
+	struct kvm_s2_mmu	*mmu;
 };
 
 static bool kvm_s2_fault_is_perm(const struct kvm_s2_fault_desc *s2fd)
@@ -1637,7 +1638,7 @@ static int gmem_abort(const struct kvm_s2_fault_desc *s2fd)
 	bool perm_fault = kvm_s2_fault_is_perm(s2fd);
 	enum kvm_pgtable_walk_flags flags = KVM_PGTABLE_WALK_SHARED;
 	enum kvm_pgtable_prot prot = KVM_PGTABLE_PROT_R;
-	struct kvm_pgtable *pgt = s2fd->vcpu->arch.hw_mmu->pgt;
+	struct kvm_pgtable *pgt = s2fd->mmu->pgt;
 	unsigned long mmu_seq;
 	struct page *page;
 	struct kvm *kvm = s2fd->vcpu->kvm;
@@ -1735,7 +1736,7 @@ static int pkvm_mem_abort(const struct kvm_s2_fault_desc *s2fd)
 {
 	unsigned int flags = FOLL_HWPOISON | FOLL_LONGTERM | FOLL_WRITE;
 	struct kvm_vcpu *vcpu = s2fd->vcpu;
-	struct kvm_pgtable *pgt = vcpu->arch.hw_mmu->pgt;
+	struct kvm_pgtable *pgt = s2fd->mmu->pgt;
 	struct mm_struct *mm = current->mm;
 	struct kvm *kvm = vcpu->kvm;
 	void *hyp_memcache;
@@ -2050,7 +2051,7 @@ static int kvm_s2_fault_map(const struct kvm_s2_fault_desc *s2fd,
 	int ret;
 
 	kvm_fault_lock(kvm);
-	pgt = s2fd->vcpu->arch.hw_mmu->pgt;
+	pgt = s2fd->mmu->pgt;
 	ret = -EAGAIN;
 	if (mmu_invalidate_retry(kvm, s2vi->mmu_seq))
 		goto out_unlock;
@@ -2271,6 +2272,7 @@ int kvm_handle_guest_abort(struct kvm_vcpu *vcpu)
 {
 	struct kvm_s2_trans nested_trans, *nested = NULL;
 	unsigned long esr = kvm_vcpu_get_esr(vcpu);
+	struct kvm_s2_mmu *mmu = vcpu->arch.hw_mmu;
 	phys_addr_t fault_ipa; /* The address we faulted on */
 	phys_addr_t ipa; /* Always the IPA in the L1 guest phys space */
 	struct kvm_memory_slot *memslot;
@@ -2300,7 +2302,7 @@ int kvm_handle_guest_abort(struct kvm_vcpu *vcpu)
 		}
 
 		/* Falls between the IPA range and the PARange? */
-		if (fault_ipa >= BIT_ULL(VTCR_EL2_IPA(vcpu->arch.hw_mmu->vtcr))) {
+		if (fault_ipa >= BIT_ULL(VTCR_EL2_IPA(mmu->vtcr))) {
 			fault_ipa |= FAR_TO_FIPA_OFFSET(kvm_vcpu_get_hfar(vcpu));
 
 			return kvm_inject_sea(vcpu, is_iabt, fault_ipa);
@@ -2337,8 +2339,8 @@ int kvm_handle_guest_abort(struct kvm_vcpu *vcpu)
 	 * nothing to walk and we treat it as a 1:1 before going through the
 	 * canonical translation.
 	 */
-	if (kvm_is_nested_s2_mmu(vcpu->kvm,vcpu->arch.hw_mmu) &&
-	    vcpu->arch.hw_mmu->nested_stage2_enabled) {
+	if (kvm_is_nested_s2_mmu(vcpu->kvm, mmu) &&
+	    mmu->nested_stage2_enabled) {
 		u32 esr;
 
 		ret = kvm_walk_nested_s2(vcpu, fault_ipa, &nested_trans);
@@ -2413,7 +2415,7 @@ int kvm_handle_guest_abort(struct kvm_vcpu *vcpu)
 	}
 
 	/* Userspace should not be able to register out-of-bounds IPAs */
-	VM_BUG_ON(ipa >= kvm_phys_size(vcpu->arch.hw_mmu));
+	VM_BUG_ON(ipa >= kvm_phys_size(mmu));
 
 	if (esr_fsc_is_access_flag_fault(esr)) {
 		handle_access_fault(vcpu, fault_ipa);
@@ -2428,6 +2430,7 @@ int kvm_handle_guest_abort(struct kvm_vcpu *vcpu)
 		.memslot	= memslot,
 		.hva		= hva,
 		.esr		= esr,
+		.mmu		= mmu,
 	};
 
 	if (kvm_vm_is_protected(vcpu->kvm)) {

-- 
2.55.0


