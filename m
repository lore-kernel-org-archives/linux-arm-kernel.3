Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7893C88E72
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 09:18:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z71cbEFI8LxwnXlCz/GbLDEwZMUnV7MqcQeE0b+DMOU=; b=ncze5/wMH7tslv7kl2R6M97T7H
	2NM4aqN1UnaSjBQR/RHS1oiio6afMjz/ECLy4grb6rO2O2JlE9awlSijSQyOSNh8wHkECOO9u33ss
	h5DbkqOVHALGD5irkd730h6HfWapszl+EtOV4gMA7JyMz+VYZlcakAGrT63t2dNF66pSPWlGF6AGe
	dEv70nsNmaFNvyTzz5o4xm1JXoVGP+xsH9vPk10Gn4nz2bjg3c39W+8yeefh63lGEt78MmXWrXXxO
	1CU6Ex3Lm8b6L0geFlxmQXQFyaqvcWwgf2lB2tdxgnPic3/vpD6qvoerqyiz4b5Jhx8molemmU+cO
	fc/qRvHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x78GT-0000000AzL4-1Wvj;
	Thu, 17 Sep 2026 09:18:45 +0000
Received: from out-146.mta0.migadu.com ([2001:41d0:1004:224b::92] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x78GO-0000000AzIX-3vlu
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 09:18:42 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=9pjYOIEzdyKNdQkNYW5OL/VC49oIe6n7Ll8yQAOYXfg=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789636718; v=1; x=1790241518;
 b=fGAgII4SOg0hosuZF62MUB97l48QjCncM+VdydLjbNWkq/qCiFowC4O8bNupmEwuuVIbwVdq
 kIh/pb5a78w2kWRfJSF7bzP4Y4pWcT2hZQvAW7WNLfUzuGOsKerbozzr37ZqjzwrhrS7hsaa5x0
 eKQfOO7e3NQ3MdUvmXSZ3baQ=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 669cc4c428177e18;
	Thu, 17 Sep 2026 09:18:38 +0000
X-Mizu-Trace-ID: 669cc4c428177e18
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: maz@kernel.org,
	oupton@kernel.org
Cc: joey.gouly@arm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	mark.rutland@arm.com,
	qperret@google.com,
	vdonnefort@google.com,
	martijnbogaard@google.com,
	seiden@linux.ibm.com,
	tabba@google.com,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 3/4] KVM: arm64: Honour the requested IPA size under pKVM
Date: Thu, 17 Sep 2026 10:18:25 +0100
Message-Id: <20260917091826.2639205-4-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260917091826.2639205-1-fuad.tabba@linux.dev>
References: <20260917091826.2639205-1-fuad.tabba@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_021841_115260_E500C764 
X-CRM114-Status: GOOD (  15.74  )
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

pKVM gives every VM the host's IPA limit, whatever
KVM_VM_TYPE_ARM_IPA_SIZE requested, so vgic_init fails on any pKVM host
whose limit exceeds 40 bits: the addresses it expects a 40-bit VM to
reject are in range. EL2 also sizes the guest's stage 2 from the host
stage 2's VTCR, which on a 64K kernel built for 48-bit PAs on a 52-bit
part is 48 bits where the limit is 52: a memslot above 2^48 the host
accepts returns -ERANGE on the guest's first access.

Have EL2 take the IPA size from the VTCR the host sized the VM and the
donated pgd with, bounded by kvm_get_ipa_max(), and drop the host-side
override, so the request is checked and honoured as on any other host.

Fixes: 60dfe093ec13 ("KVM: arm64: Instantiate guest stage-2 page-tables at EL2")
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/kvm/hyp/nvhe/pkvm.c | 20 ++++++++++++++++----
 arch/arm64/kvm/mmu.c           |  4 +---
 2 files changed, 17 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/pkvm.c b/arch/arm64/kvm/hyp/nvhe/pkvm.c
index 3770315b50361..85fc14b7a5bc3 100644
--- a/arch/arm64/kvm/hyp/nvhe/pkvm.c
+++ b/arch/arm64/kvm/hyp/nvhe/pkvm.c
@@ -423,7 +423,8 @@ static void unpin_host_vcpus(struct pkvm_hyp_vcpu *hyp_vcpus[],
 }
 
 static void init_pkvm_hyp_vm(struct kvm *host_kvm, struct pkvm_hyp_vm *hyp_vm,
-			     unsigned int nr_vcpus, pkvm_handle_t handle)
+			     unsigned int nr_vcpus, pkvm_handle_t handle,
+			     u64 vtcr)
 {
 	struct kvm_s2_mmu *mmu = &hyp_vm->kvm.arch.mmu;
 	int idx = vm_handle_to_idx(handle);
@@ -439,7 +440,7 @@ static void init_pkvm_hyp_vm(struct kvm *host_kvm, struct pkvm_hyp_vm *hyp_vm,
 	/* VMID 0 is reserved for the host */
 	atomic64_set(&mmu->vmid.id, idx + 1);
 
-	mmu->vtcr = host_mmu.arch.mmu.vtcr;
+	mmu->vtcr = vtcr;
 	mmu->arch = &hyp_vm->kvm.arch;
 	mmu->pgt = &hyp_vm->pgt;
 }
@@ -826,6 +827,8 @@ int __pkvm_init_vm(struct kvm *host_kvm, unsigned long vm_hva,
 	unsigned int nr_vcpus;
 	pkvm_handle_t handle;
 	void *pgd = NULL;
+	u32 phys_shift;
+	u64 vtcr;
 	int ret;
 
 	ret = hyp_pin_shared_mem(host_kvm, host_kvm + 1);
@@ -844,8 +847,17 @@ int __pkvm_init_vm(struct kvm *host_kvm, unsigned long vm_hva,
 		goto err_unpin_kvm;
 	}
 
+	phys_shift = VTCR_EL2_IPA(READ_ONCE(host_kvm->arch.mmu.vtcr));
+	if (phys_shift < ARM64_MIN_PARANGE_BITS ||
+	    phys_shift > kvm_get_ipa_max(id_aa64mmfr0_el1_sys_val)) {
+		ret = -EINVAL;
+		goto err_unpin_kvm;
+	}
+	vtcr = kvm_get_vtcr(id_aa64mmfr0_el1_sys_val, id_aa64mmfr1_el1_sys_val,
+			    phys_shift);
+
 	vm_size = pkvm_get_hyp_vm_size(nr_vcpus);
-	pgd_size = kvm_pgtable_stage2_pgd_size(host_mmu.arch.mmu.vtcr);
+	pgd_size = kvm_pgtable_stage2_pgd_size(vtcr);
 	if (!IS_ALIGNED(pgd_hva, pgd_size)) {
 		ret = -EINVAL;
 		goto err_unpin_kvm;
@@ -861,7 +873,7 @@ int __pkvm_init_vm(struct kvm *host_kvm, unsigned long vm_hva,
 	if (!pgd)
 		goto err_remove_mappings;
 
-	init_pkvm_hyp_vm(host_kvm, hyp_vm, nr_vcpus, handle);
+	init_pkvm_hyp_vm(host_kvm, hyp_vm, nr_vcpus, handle, vtcr);
 
 	ret = kvm_guest_prepare_stage2(hyp_vm, pgd);
 	if (ret)
diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 9ba86450fe4af..5a3a4863f3d13 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -909,9 +909,7 @@ static int kvm_init_ipa_range(struct kvm_s2_mmu *mmu, unsigned long type)
 	u32 phys_shift;
 
 	phys_shift = KVM_VM_TYPE_ARM_IPA_SIZE(type);
-	if (is_protected_kvm_enabled()) {
-		phys_shift = kvm_ipa_limit;
-	} else if (phys_shift) {
+	if (phys_shift) {
 		if (phys_shift > kvm_ipa_limit ||
 		    phys_shift < ARM64_MIN_PARANGE_BITS)
 			return -EINVAL;
-- 
2.39.5


