Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8194ECA5FD4
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 21:07:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XBzPq5bV4Utz8NLpTAFfbUq+If1OT2ABtGmIFXTz/QQ=; b=y8PeM6LQDMiFgXC0+ewPF/MQxB
	NQ3b3EVOOOOrhB3qkEqTSzTNDs02MzwhhW+St52IZyzRdpyUc4UROxziNEYQVTRvdN8L0E7SZkcGM
	zAukdaeJrXkApN+Zyrqt4c3mFtUA1ndzgH/SBGoFKBHopOAMzE/snK6/cKdWs4uASTD5tK2m7hgOo
	hULLAO5+KsYLo12O0wy4Clrj9MzIuwERYukQ5bgUiGsH1ex6yW4mt3BCs/8hDyNWM0PP6RAf4PCdP
	V2o0ima6x9HP7Mdh/Z8/l2zQluIB84HCCUVJWrCbD/v8BkqgOBnzRjEZ1K/uKtV+zOZOGln/n3k/+
	/XasRtDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCO0M-0000000ACvg-09lJ;
	Thu, 01 Oct 2026 21:07:50 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCO0J-0000000ACso-27oH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 21:07:48 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 72AC61476;
	Thu,  1 Oct 2026 14:07:43 -0700 (PDT)
Received: from ewhatever.cambridge.arm.com (ewhatever.cambridge.arm.com [10.2.197.99])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 7A5753F86F;
	Thu,  1 Oct 2026 14:07:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790888866; bh=WYaLGyFwljsRmpCG8+CIlgjwWFS50duC3yD1GV7CE8M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=m8VtDW0bqeDUjOBLM/NQeveiF7XAdFfI6s80BdH9zKhf2nWdUqykrsXjK2+SXsrFk
	 Kq9q60OQFE9Fn1bzOP2IHroTdlt8yoXkBUZ39wHhjzsWzjgLvDYz0+IHN3vyPZqgNB
	 oxwnbo4VfaLmnYopPJExsW7jBmpooTcn5p7W5zjs=
From: Suzuki K Poulose <suzuki.poulose@arm.com>
To: kvm@vger.kernel.org,
	kvmarm@lists.linux.dev
Cc: maz@kernel.org,
	will@kernel.org,
	catalin.marinas@arm.com,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	steven.price@arm.com,
	aneesh.kumar@kernel.org,
	oupton@kernel.org,
	gshan@redhat.com,
	joey.gouly@arm.com,
	tabba@google.com,
	yuzenghui@huawei.com,
	linux-coco@lists.linux.dev,
	gankulkarni@os.amperecomputing.com,
	sdonthineni@nvidia.com,
	alpergun@google.com,
	fj0570is@fujitsu.com,
	WeiLin.Chang@arm.com,
	lpieralisi@kernel.org,
	enju.kohei@fujitsu.com,
	sudeep.holla@arm.com,
	jonathan.cameron@oss.qualcomm.com,
	Suzuki K Poulose <suzuki.poulose@arm.com>
Subject: [PATCH v21 07/23] KVM: arm64: Refactor the vcpu_load to allow for VM specific callbacks
Date: Thu,  1 Oct 2026 22:06:47 +0100
Message-ID: <20261001210703.1597150-8-suzuki.poulose@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261001210703.1597150-1-suzuki.poulose@arm.com>
References: <20261001210703.1597150-1-suzuki.poulose@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_140747_675270_B8C483B5 
X-CRM114-Status: GOOD (  13.24  )
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

To keep the VCPU load/put handling cleaner with the different kinds of VM
types, we are about to introduce VM specific callbacks to do just the right
thing. In preparation for that, make some refactoring to add the change
easier by mainly feature specific configurations to individual wrappers,
so that different callbacks could reuse the helpers.

Adds vcpu_prepare_mmu()/vcpu_put_mmu() wrappers to load/put MMU related
configurations for !pKVM guests. Additionally makes it explicit that
kvm_arm_vmid_clear_active() is not required for pKVM host.

Add vcpu_load_pvtime(), vcpu_set_wfx_traps() wrappers for handling the
corresponding configurations.

While at it, also make it clear that the timer loading constraints only
apply for the VHE.

No functional changes intended. Based on a work by Marc Zyngier.

Reviewed-by: Gavin Shan <gshan@redhat.com>
Tested-by: Gavin Shan <gshan@redhat.com>
Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
---
Changes since v19:
 - Add vcpu_put_mmu() to pair with the vcpu_prepare_mmu() and make the
   call conditional on !is_protected_kvm_enabled(). Preparing the path
   for per-flavor callbacks
 - Update the timer load constraints comment to reflect that it only applies
   for VHE
 - Wrap kvm_arm_vmid_clear_active() to vcpu_put_mmu() to compliement
   with the vcpu_prepare_mmu(). Also only clear the VMID for non-pKVM
   guests
---
 arch/arm64/kvm/arm.c | 59 ++++++++++++++++++++++++++++++--------------
 1 file changed, 40 insertions(+), 19 deletions(-)

diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index 849f5fcc26c15..6393b2c1a65de 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -684,14 +684,11 @@ static bool kvm_vcpu_should_clear_twe(struct kvm_vcpu *vcpu)
 	return single_task_running();
 }
 
-void kvm_arch_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
+static void vcpu_prepare_mmu(struct kvm_vcpu *vcpu)
 {
 	struct kvm_s2_mmu *mmu;
 	int *last_ran;
 
-	if (is_protected_kvm_enabled())
-		goto nommu;
-
 	if (vcpu_has_nv(vcpu))
 		kvm_vcpu_load_hw_mmu(vcpu);
 
@@ -721,34 +718,56 @@ void kvm_arch_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
 		kvm_call_hyp(__kvm_flush_cpu_context, mmu);
 		*last_ran = vcpu->vcpu_idx;
 	}
+}
 
-nommu:
+static void vcpu_put_mmu(struct kvm_vcpu *vcpu)
+{
+	kvm_arm_vmid_clear_active();
+}
+
+static void vcpu_set_wfx_traps(struct kvm_vcpu *vcpu)
+{
+	if (kvm_vcpu_should_clear_twe(vcpu))
+		vcpu->arch.hcr_el2 &= ~HCR_TWE;
+	else
+		vcpu->arch.hcr_el2 |= HCR_TWE;
+
+	if (kvm_vcpu_should_clear_twi(vcpu))
+		vcpu->arch.hcr_el2 &= ~HCR_TWI;
+	else
+		vcpu->arch.hcr_el2 |= HCR_TWI;
+}
+
+static void vcpu_load_pvtime(struct kvm_vcpu *vcpu)
+{
+	if (kvm_arm_is_pvtime_enabled(&vcpu->arch))
+		kvm_make_request(KVM_REQ_RECORD_STEAL, vcpu);
+}
+
+void kvm_arch_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
+{
 	vcpu->cpu = cpu;
 
+	if (!is_protected_kvm_enabled())
+		vcpu_prepare_mmu(vcpu);
 	/*
-	 * The timer must be loaded before the vgic to correctly set up physical
-	 * interrupt deactivation in nested state (e.g. timer interrupt).
+	 * For VHE, the timer must be loaded before the vgic to correctly
+	 * set up physical interrupt deactivation in nested state (e.g. timer
+	 * interrupt).
 	 */
 	kvm_timer_vcpu_load(vcpu);
 	kvm_vgic_load(vcpu);
 	kvm_vcpu_load_debug(vcpu);
 	kvm_vcpu_load_fgt(vcpu);
+
 	if (has_vhe())
 		kvm_vcpu_load_vhe(vcpu);
+
 	kvm_arch_vcpu_load_fp(vcpu);
 	kvm_vcpu_pmu_restore_guest(vcpu);
-	if (kvm_arm_is_pvtime_enabled(&vcpu->arch))
-		kvm_make_request(KVM_REQ_RECORD_STEAL, vcpu);
 
-	if (kvm_vcpu_should_clear_twe(vcpu))
-		vcpu->arch.hcr_el2 &= ~HCR_TWE;
-	else
-		vcpu->arch.hcr_el2 |= HCR_TWE;
-
-	if (kvm_vcpu_should_clear_twi(vcpu))
-		vcpu->arch.hcr_el2 &= ~HCR_TWI;
-	else
-		vcpu->arch.hcr_el2 |= HCR_TWI;
+	vcpu_load_pvtime(vcpu);
+	vcpu_set_wfx_traps(vcpu);
 
 	if (!is_protected_kvm_enabled())
 		vcpu_set_pauth_traps(vcpu);
@@ -787,7 +806,9 @@ void kvm_arch_vcpu_put(struct kvm_vcpu *vcpu)
 	kvm_vcpu_pmu_restore_host(vcpu);
 	if (vcpu_has_nv(vcpu))
 		kvm_vcpu_put_hw_mmu(vcpu);
-	kvm_arm_vmid_clear_active();
+
+	if (!is_protected_kvm_enabled())
+		vcpu_put_mmu(vcpu);
 
 	vcpu_clear_on_unsupported_cpu(vcpu);
 	vcpu->cpu = -1;
-- 
2.43.0


