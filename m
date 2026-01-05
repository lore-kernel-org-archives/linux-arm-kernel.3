Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DED8FC79F9E
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 15:50:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FFDz/v08HBhNpAhrvBqfvQWyh6jsFu6IIWrEpTtOxn0=; b=A6AzggGAd2Kx2bsKiQ0c5xvcMe
	n8zyHiCXMDTUB0mAt8LhA2JO2V3xMStMYX7x01tmrRPGTaUumSOfYcXIAzSnA3BENpYJ//xDsY1EN
	fRj1CrKnTMC37pf6ssYPiQzl159165L5ZjiG/HHWlt1q+nhIIUk9RKqNMyUtupK6o4fzTwEmEE3Bj
	JAHzk4ryKtybVbDDk2E6X1bnrwdSAAtkR7tKatLlakUFemWN78f1TTF9TBMHziAHOxVpjPs67MfOu
	j3yd0gtAekMt4QsjeHK7YXF6uF6zcmgaoy/6XKOrSrgTqyXTOKqMWiWqW1QYcTnwmg8A9gWvjP5UH
	6ERtScbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcmqE-0000000BdXX-29Tw;
	Mon, 05 Jan 2026 15:49:58 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcmqD-0000000BdWZ-02AW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Jan 2026 15:49:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 71F1060144;
	Mon,  5 Jan 2026 15:49:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A85FC19422;
	Mon,  5 Jan 2026 15:49:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767628196;
	bh=EiR6H2PI7nrIrBLjfYnWtgkFePwcLsCE5gSk6ktCNXc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rBAIRSDYUKhc0GKyLg828rNJP/qvq5dmeIVRDu5lPb/0YjbNzAtuMeexjV/izbd2U
	 vETtcCVLAJhzubw+LeR/NvTdBUUH8XdQy6tZOM/6BvovJmplpLRaJFpYNii7T2CIa8
	 rcsa7VUZsD77hOknzd844kAt4YhXvByD9OUUjyksq7Op6QSemNRZ86KtxBTUylLtzt
	 KJYv9IdkhHdx7YOO2n/YGapiOd1qIbGca7GFDmrfCCh9/HE6OmoAFMs2DsD/vJSjFi
	 ffh9wuNcCKpvyINvLF8uSr62I3TMQp25ys+qsAHn+YYd8m3rRSo+Pg68hLFj3ZEJjb
	 oVeMGrNivtTpw==
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
Subject: [PATCH 02/30] KVM: arm64: Remove redundant 'pgt' pointer checks from MMU notifiers
Date: Mon,  5 Jan 2026 15:49:10 +0000
Message-ID: <20260105154939.11041-3-will@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260105154939.11041-1-will@kernel.org>
References: <20260105154939.11041-1-will@kernel.org>
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

The MMU notifiers are registered by kvm_init_mmu_notifier() only after
kvm_arch_init_vm() has returned successfully. Since the latter function
initialises the 'kvm->arch.mmu.pgt' pointer (and allocates the VM handle
when pKVM is enabled), the initialisation checks in the MMU notifiers
are not required.

Remove the redundant checks from the MMU notifier callbacks.

Signed-off-by: Will Deacon <will@kernel.org>
---
 arch/arm64/kvm/mmu.c  | 9 ---------
 arch/arm64/kvm/pkvm.c | 9 ++++++---
 2 files changed, 6 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 2b260bdf3202..5d18927f76ba 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -2208,9 +2208,6 @@ int kvm_handle_guest_abort(struct kvm_vcpu *vcpu)
 
 bool kvm_unmap_gfn_range(struct kvm *kvm, struct kvm_gfn_range *range)
 {
-	if (!kvm->arch.mmu.pgt)
-		return false;
-
 	__unmap_stage2_range(&kvm->arch.mmu, range->start << PAGE_SHIFT,
 			     (range->end - range->start) << PAGE_SHIFT,
 			     range->may_block);
@@ -2223,9 +2220,6 @@ bool kvm_age_gfn(struct kvm *kvm, struct kvm_gfn_range *range)
 {
 	u64 size = (range->end - range->start) << PAGE_SHIFT;
 
-	if (!kvm->arch.mmu.pgt)
-		return false;
-
 	return KVM_PGT_FN(kvm_pgtable_stage2_test_clear_young)(kvm->arch.mmu.pgt,
 						   range->start << PAGE_SHIFT,
 						   size, true);
@@ -2239,9 +2233,6 @@ bool kvm_test_age_gfn(struct kvm *kvm, struct kvm_gfn_range *range)
 {
 	u64 size = (range->end - range->start) << PAGE_SHIFT;
 
-	if (!kvm->arch.mmu.pgt)
-		return false;
-
 	return KVM_PGT_FN(kvm_pgtable_stage2_test_clear_young)(kvm->arch.mmu.pgt,
 						   range->start << PAGE_SHIFT,
 						   size, false);
diff --git a/arch/arm64/kvm/pkvm.c b/arch/arm64/kvm/pkvm.c
index d7a0f69a9982..7797813f4dbe 100644
--- a/arch/arm64/kvm/pkvm.c
+++ b/arch/arm64/kvm/pkvm.c
@@ -329,9 +329,6 @@ static int __pkvm_pgtable_stage2_unmap(struct kvm_pgtable *pgt, u64 start, u64 e
 	struct pkvm_mapping *mapping;
 	int ret;
 
-	if (!handle)
-		return 0;
-
 	for_each_mapping_in_range_safe(pgt, start, end, mapping) {
 		ret = kvm_call_hyp_nvhe(__pkvm_host_unshare_guest, handle, mapping->gfn,
 					mapping->nr_pages);
@@ -347,6 +344,12 @@ static int __pkvm_pgtable_stage2_unmap(struct kvm_pgtable *pgt, u64 start, u64 e
 void pkvm_pgtable_stage2_destroy_range(struct kvm_pgtable *pgt,
 					u64 addr, u64 size)
 {
+	struct kvm *kvm = kvm_s2_mmu_to_kvm(pgt->mmu);
+	pkvm_handle_t handle = kvm->arch.pkvm.handle;
+
+	if (!handle)
+		return;
+
 	__pkvm_pgtable_stage2_unmap(pgt, addr, addr + size);
 }
 
-- 
2.52.0.351.gbe84eed79e-goog


