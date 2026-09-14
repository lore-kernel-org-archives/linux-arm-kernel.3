Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D004DC88E66
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 12:27:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2BN4nsRUF6et4huKV7sboPy7MNqNCFDoN6pq7KaBtvI=; b=Lg7p5urkPCIf2CVqbMivfDbqhB
	8eHk3BzOep8FK+RBSrEfCiHPc5RtZ5j4K5Cgn6C8LEw1yDzgMBxuziJnGt5CilW+jDtLDTvSUmzq1
	EejUxLZ9OGkphDhwi2PA640nCBLq7n3+qmoO1ajPcqFihhE67TBpEXNTaMrLwWdZ+B4aJpuRFTnfN
	SezvYDUKE0UhOtOoQSdcHRPaWoNnMAwj+8fSvsZFR8kJg9Bz6FvPk+34bzpWZu2L+JTQ+43WU3xjC
	Q/MClb6IqPupegj8xyPexSHBBzHVToA2hMp/52YxWHxJlIfk5LJpCPF8JwIiAx0l2JuYqievm2Y2u
	zF4+GjRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x65lz-00000003XVp-3oPr;
	Mon, 14 Sep 2026 12:26:59 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x65lv-00000003XSr-1B4p
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 12:26:55 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 58FE8601F9;
	Mon, 14 Sep 2026 12:26:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABC381F00893;
	Mon, 14 Sep 2026 12:26:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789388814;
	bh=2BN4nsRUF6et4huKV7sboPy7MNqNCFDoN6pq7KaBtvI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=lj8jBcZEcHBQyVpUtx8fvicJEMpA+vQtXGEQ3iVBQa+D72wsYCg1MISeemTEOmy0e
	 ZohRt3EHQCuEb7yKQ0mhc88U8PMX3gJ7gdGN4cPowS0UQYptCgF3KIu9vvssp7vPzR
	 01wElEv7lBX985U22kVMTuzmafbqKlhDc8cGtWRKFaDc1/ZS5jyyXXMN1HP5B/3FQP
	 /22RA8jOECnKwMKfiF5vdoZaMMI4fnnG8oKo20UqszI4034zqWpjlSrOQw/+j397cv
	 L9ohyZ8clqAYU79KH9dXMgNnX+ZcKcS+ABQfZUM5Hi+IFIcKM3aKUIPyNpPaVPWbIp
	 ZnsOu5xavM20w==
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Date: Mon, 14 Sep 2026 13:26:14 +0100
Subject: [PATCH v2 03/13] KVM: arm64: Propagate and use esr in s2fd when
 handling guest aborts
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-kvm-arm-prefault-v2-3-26fb47f74b73@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2889; i=ljs@kernel.org;
 h=from:subject:message-id; bh=VZcSKR8yxRV7e2O4hOy2SU5uYNlmsrpgI1kclfEhfHw=;
 b=owGbwMvMwCV2fu7ZrsZH9SKMp9WSGLKWP//ySLxMS5T/aLtwXP+LRQnb52Wregc/PWsc1x0Su
 ++Fse+PjlIWBjEuBlkxRZbnX8T3B4mEzeu84O8GM4eVCWQIAxenAEzk+z9GhqUrjgttTdz1W6OM
 pUdNaUq3s5vzFK5w2VKG8rbW/bPqghgZbm+fU9KlGXp64nddxc7i0CmvSvvb0q8Vn3pvMTVCrVu
 MBwA=
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

Each of these, however, examines the Exception Syndrome Register (ESR) via
s2fd->vcpu.

Introduce an s2fd->esr field to abstract this and propagate it to callers.

The value of this (beyond refactoring) is to be able to later generate
faults with a synthetic esr, specifically to implement stage 2 page table
pre-faulting.

Abort handlers which use kvm_s2_fault_desc - gmem_abort() and
user_mem_abort() - now only reference s2fd->esr and do not look it up in
any other way, which makes it safe to pass a synthetic s2fd->esr value to
these functions.

No functional change intended.

Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
---
 arch/arm64/kvm/mmu.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index d1a6e25c3095..8303121e3332 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -1603,21 +1603,22 @@ struct kvm_s2_fault_desc {
 	struct kvm_s2_trans	*nested;
 	struct kvm_memory_slot	*memslot;
 	unsigned long		hva;
+	unsigned long		esr;
 };
 
 static bool kvm_s2_fault_is_perm(const struct kvm_s2_fault_desc *s2fd)
 {
-	return esr_fsc_is_permission_fault(kvm_vcpu_get_esr(s2fd->vcpu));
+	return esr_fsc_is_permission_fault(s2fd->esr);
 }
 
 static bool kvm_s2_fault_is_exec(const struct kvm_s2_fault_desc *s2fd)
 {
-	return esr_abt_is_exec_fault(kvm_vcpu_get_esr(s2fd->vcpu));
+	return esr_abt_is_exec_fault(s2fd->esr);
 }
 
 static bool kvm_s2_fault_is_write(const struct kvm_s2_fault_desc *s2fd)
 {
-	return esr_abt_is_write_fault(kvm_vcpu_get_esr(s2fd->vcpu));
+	return esr_abt_is_write_fault(s2fd->esr);
 }
 
 static u64 kvm_s2_perm_fault_granule(const struct kvm_s2_fault_desc *s2fd)
@@ -1626,7 +1627,7 @@ static u64 kvm_s2_perm_fault_granule(const struct kvm_s2_fault_desc *s2fd)
 
 	if (!kvm_s2_fault_is_perm(s2fd))
 		return 0;
-	level = kvm_vcpu_get_esr(s2fd->vcpu) & ESR_ELx_FSC_LEVEL;
+	level = s2fd->esr & ESR_ELx_FSC_LEVEL;
 	return BIT(ARM64_HW_PGTABLE_LEVEL_SHIFT(level));
 }
 
@@ -1997,7 +1998,7 @@ static int kvm_s2_fault_compute_prot(const struct kvm_s2_fault_desc *s2fd,
 	 * and trigger the exception here. Since the memslot is valid, inject
 	 * the fault back to the guest.
 	 */
-	if (esr_fsc_is_excl_atomic_fault(kvm_vcpu_get_esr(s2fd->vcpu))) {
+	if (esr_fsc_is_excl_atomic_fault(s2fd->esr)) {
 		kvm_inject_dabt_excl_atomic(s2fd->vcpu, kvm_vcpu_get_hfar(s2fd->vcpu));
 		return 1;
 	}
@@ -2426,6 +2427,7 @@ int kvm_handle_guest_abort(struct kvm_vcpu *vcpu)
 		.nested		= nested,
 		.memslot	= memslot,
 		.hva		= hva,
+		.esr		= esr,
 	};
 
 	if (kvm_vm_is_protected(vcpu->kvm)) {

-- 
2.55.0


