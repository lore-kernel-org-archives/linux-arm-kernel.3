Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEFE9C982EB
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 20 Sep 2026 21:29:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FxWiUGBmUli+lED47KXS+fsv2Q4F/g4BQAJUWQBM/3c=; b=qcnirTIy6SQz2JcOJg6fqQs02B
	o1ECA2XKlnGiFzSr4GIKVGw9uGkBurtjPoVVzi3cjZN4YX8sQcjaahhE1g1isSURwaQj8xoY3r0Lg
	9qyeat3LDSRwNNI1BvEgoEFhWUBvUYUueyFxwNNj7lq31uD0cILBfg/TIV+UR2fLUAM1YG/HiO75n
	XXTzCVIf1h94GOI6xRWx7sTw+M2ukyapCfC+QfRkuJdBpZeD0KHj8KEZvtzsYjUO03iXr2w7AeXte
	6rTfvmX/4Q3fkh+klI3I0ZH8bfqikLlSF3MIaYlhdTBsQN2Y72qh/+AM66ujkuW6dI/aqwUORUPrq
	Artzg6JQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8P6G-00000000RpX-0qRT;
	Sun, 20 Sep 2026 21:29:28 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8P69-00000000RmM-2lot
	for linux-arm-kernel@lists.infradead.org;
	Sun, 20 Sep 2026 21:29:22 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6D4B115A1;
	Sun, 20 Sep 2026 14:29:17 -0700 (PDT)
Received: from ewhatever.cambridge.arm.com (ewhatever.cambridge.arm.com [10.2.197.99])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 35CA93F632;
	Sun, 20 Sep 2026 14:29:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789939761; bh=WqaPkSBA5sqiKlN1tvI7sIeq04xzAphtbNNVKQf9rCw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XfuMjbvghKnYmFjjqe+o0jqKC6szm13dQyGttgtdkOCcfbKlpcwAqLStnmLqYWmVk
	 nX5q1ILC863bCYFygy0ciX4dNe58mMhi2HroxrkMmOcB5DinhcHXJVjZkEoojG2VBF
	 9v1kt0TjX0XLUXfb2Lt8z79wQ1VNuARLgtaLzb9E=
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
	Suzuki K Poulose <suzuki.poulose@arm.com>
Subject: [PATCH v19 06/20] KVM: arm64: Refactor the vcpu_load to allow for VM specific callbacks
Date: Sun, 20 Sep 2026 22:28:31 +0100
Message-ID: <20260920212845.707-7-suzuki.poulose@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260920212845.707-1-suzuki.poulose@arm.com>
References: <20260920212845.707-1-suzuki.poulose@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260920_142921_786206_A2DBB58C 
X-CRM114-Status: GOOD (  11.71  )
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
easier.

No functional changes intended. Based on a work by Marc Zyngier.

Reviewed-by: Gavin Shan <gshan@redhat.com>
Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
---
 arch/arm64/kvm/arm.c | 48 ++++++++++++++++++++++++++------------------
 1 file changed, 29 insertions(+), 19 deletions(-)

diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index 8c784b266a8e8..c74706ed9a531 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -683,14 +683,11 @@ static bool kvm_vcpu_should_clear_twe(struct kvm_vcpu *vcpu)
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
 
@@ -720,10 +717,33 @@ void kvm_arch_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
 		kvm_call_hyp(__kvm_flush_cpu_context, mmu);
 		*last_ran = vcpu->vcpu_idx;
 	}
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
+	if (!is_protected_kvm_enabled())
+		vcpu_prepare_mmu(vcpu);
 
-nommu:
 	vcpu->cpu = cpu;
-
 	/*
 	 * The timer must be loaded before the vgic to correctly set up physical
 	 * interrupt deactivation in nested state (e.g. timer interrupt).
@@ -736,19 +756,9 @@ void kvm_arch_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
 		kvm_vcpu_load_vhe(vcpu);
 	kvm_arch_vcpu_load_fp(vcpu);
 	kvm_vcpu_pmu_restore_guest(vcpu);
-	if (kvm_arm_is_pvtime_enabled(&vcpu->arch))
-		kvm_make_request(KVM_REQ_RECORD_STEAL, vcpu);
-
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
 	vcpu_set_pauth_traps(vcpu);
 
 	if (is_protected_kvm_enabled()) {
@@ -772,7 +782,7 @@ void kvm_arch_vcpu_put(struct kvm_vcpu *vcpu)
 		kvm_call_hyp_nvhe(__pkvm_vcpu_put);
 
 		/* __pkvm_vcpu_put implies a sync of the state */
-		if (!kvm_vm_is_protected(vcpu->kvm))
+		if (kvm_vm_is_unprotected_pkvm(vcpu->kvm))
 			vcpu_set_flag(vcpu, PKVM_HOST_STATE_DIRTY);
 	}
 
-- 
2.43.0


