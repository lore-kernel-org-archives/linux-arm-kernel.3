Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85D1FC79F82
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 16:23:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/zz4anRtmZ9phwDm8eksxIR+TggRE8cJPgc04mCZZ7w=; b=Li34Mg+8gjbF4FGoyA091C1s/F
	itaQGr4NseM4jH8fFV7b2xIQYXN8bFAgP7iydgXbPPhxLalfstmqlDL1MzSYawH4N1PiTsvqrQE+R
	KcF5H3g/M/K9DyCQBRWqYFypM+uq1DEPMcEPMOj3BrcdFjw1N8sMW26RcYJxspSHZq7TUz5jyjqjH
	xzbWb9omO1bdPOh/fKRCx9MUJ8k3d0rnz9ln3wWfjqEihmO3Ql8HdvGApUbZKj398vvb87sPHosUd
	1rLCPqPtFvQNaWwBKa/vkjELtQ6aFJQJGF8fFouWHGeJSSkKrKOnaNte8963rSwr0f4mwtyXYNnz5
	sVz9wUpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3ybG-00000009dCR-1tae;
	Tue, 08 Sep 2026 16:23:10 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3ybE-00000009dAL-1RDF
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 08 Sep 2026 16:23:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=/zz4anRtmZ9phwDm8eksxIR+TggRE8cJPgc04mCZZ7w=; b=J/4i/0J12lsgMSFOIPdGMdaUmX
	Hwdh/d08bjfRcTYZQrJDFFTFBBaMLI5RRAgGVG+DC1ifUWiEzPUR4B9dEewis9kPUqYrG1LVcqqpH
	Ja7xTuPBWxLYp6JNo7TvIpfvXhT8WuPGZoli7HLNUxIrzHVMXONLKXPW7cQacuA7Hs45NiBOIH85Q
	YWaksGahEZsxuzjF2c4QEAc1reAHXcxEmBJ6E9Vrl77dJV4XYp1STtJS31Ze59aBIXTKJzTLJGI2I
	naS0UqMR8ePZJz9Q8wG8urZcbI4ajnBFSylZ1mEk33R0zutPGs+rDHPCcmmuA/sB5HeBvedGygDOO
	9xO2eFjg==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x3ybB-00000000590-20eU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 16:23:07 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6A6AC1477;
	Tue,  8 Sep 2026 09:22:59 -0700 (PDT)
Received: from ewhatever.cambridge.arm.com (ewhatever.cambridge.arm.com [10.2.197.99])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id C9DFE3F7B4;
	Tue,  8 Sep 2026 09:22:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788884583; bh=jyx0bzcdch/5rk8pWYJvVqWJSVIwEZRSvU35/MZxUBs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WR4raCcNCHMMsmR6jIuN361aK8JL0wDc7B6vVu7a+jtkd2SqUt1BagULHtdkKIXke
	 j4loINdiOoC9x9OsQrOOVX1Zmk1tkzeyxAj0ScUiHWYwBln1qIblMOr8QRX3XErJ3w
	 Bs62fwD73ouJEskpEnlwqHSyN4yeQHyj6jOjct6w=
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
Subject: [PATCH v17 04/20] KVM: arm64: Refactor the vcpu_load to allow for VM specific callbacks
Date: Tue,  8 Sep 2026 17:22:07 +0100
Message-ID: <20260908162223.1683432-5-suzuki.poulose@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260908162223.1683432-1-suzuki.poulose@arm.com>
References: <20260908162223.1683432-1-suzuki.poulose@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_172305_828340_60EB0F09 
X-CRM114-Status: GOOD (  10.93  )
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

Based on a work by Marc Zyngier

To keep the VCPU load/put handling cleaner with the different kinds of VM types,
we are about to introduce VM specific callbacks to do just the right thing.
In preparation for that, make some refactoring to add the change easier.

No functional changes intended.

Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
---
 arch/arm64/kvm/arm.c | 46 +++++++++++++++++++++++++++-----------------
 1 file changed, 28 insertions(+), 18 deletions(-)

diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index 67f1ff9bc4fbe..51fc651267157 100644
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
-- 
2.43.0


