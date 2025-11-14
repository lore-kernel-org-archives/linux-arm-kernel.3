Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C97DCE8D4F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 16:09:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=osocHl/mgN2vjk8w09ao44ppNimE1RJLnQaZk4rS0Uw=; b=v+DvOc161g/9a3AkqACiV28uly
	Ehxr+AeMqdwatBy6MPNwT9BN7NCeeT0a84k88GEEBd2GFvv67d+8Skm8k4Vv7pVfBj8Dgmcy0xfPh
	cnsJHZFj2vN7jB7Z1P6riUdBjchoN1ECltma3nFCG/4joTzyc+yThxVJAoWgKGb/D/ri+HuXROCLv
	uMQgJPwVZuOXE7lQsObuouGJnOudxsjCqR36e4lEatya9zk2IgIZWKAtsMFIx15uU2N7SCsy0l4Bx
	QMIF2HyVw+OV3XQQY4T7BMYRgnFx3HUIXkJrGRp3T9f01fQU24CUFj+kno0X51Z68LBI7Lx2Znfk6
	jSS+m4QQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJwM5-0000000CgF5-31g7;
	Fri, 14 Nov 2025 16:08:57 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJwLm-0000000Cfp5-308R
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 14 Nov 2025 16:08:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=osocHl/mgN2vjk8w09ao44ppNimE1RJLnQaZk4rS0Uw=; b=Tcs+i4H9MoyiKKiUt6aqL52bO+
	C3pq3ijQPioMkLlZkaPzxCVUDjhAT7Dz5iNf4dE3glGxeMVhu41sHFEUlhkCdtVEWd+iHSARnBGVL
	Wdd90MtOHtkPUN6gJjv77JH3YFQ4fK2GaHKO8+8LKr4YB9M6N9cxw2taCJunjAKiSAwbMD44FG66I
	MORP351GGvKzLBUi7Oe7dINeCf6PLjKXZwwdIq94P8ppligZp9yHWR8tPUq8/R/udS/F61cN8qMMT
	GUGZ3a33D+rPXyRDB8VUWk1qopZatHJ/nOIhWgGlxZTOBdMamthhK0LbVYq6T+YXZXCuQox8hrn1u
	WPZsQFkQ==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJvU4-00000002vY6-2cAS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Nov 2025 15:13:10 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4E2031BCB;
	Fri, 14 Nov 2025 08:08:27 -0800 (PST)
Received: from raptor (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C6A833F5A1;
	Fri, 14 Nov 2025 08:08:32 -0800 (PST)
From: Alexandru Elisei <alexandru.elisei@arm.com>
To: maz@kernel.org,
	oliver.upton@linux.dev,
	joey.gouly@arm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com,
	will@kernel.org,
	catalin.marinas@arm.com,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev
Cc: james.clark@linaro.org,
	mark.rutland@arm.com,
	james.morse@arm.com
Subject: [RFC PATCH v6 24/35] KVM: arm64: Handle SPE hardware maintenance interrupts
Date: Fri, 14 Nov 2025 16:07:05 +0000
Message-ID: <20251114160717.163230-25-alexandru.elisei@arm.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251114160717.163230-1-alexandru.elisei@arm.com>
References: <20251114160717.163230-1-alexandru.elisei@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_151309_103820_D2035DF3 
X-CRM114-Status: GOOD (  16.75  )
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

Re-inject all maintenance interrupts raised by SPE while the guest was
running.

Save the value of the hardware PMBSR_EL1 register in a separate variable,
instead of updating the VCPU sysreg directly, to detect when the SPU
asserted the interrupt, as opposed to the guest writing 1 to the
PMBSR_EL1.S bit.

Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
---
 arch/arm64/include/asm/kvm_spe.h |  7 +++++++
 arch/arm64/kvm/arm.c             |  2 ++
 arch/arm64/kvm/hyp/vhe/spe-sr.c  |  2 +-
 arch/arm64/kvm/spe.c             | 27 +++++++++++++++++++++++++++
 4 files changed, 37 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/kvm_spe.h b/arch/arm64/include/asm/kvm_spe.h
index a61c1c1de76f..7d8becf76314 100644
--- a/arch/arm64/include/asm/kvm_spe.h
+++ b/arch/arm64/include/asm/kvm_spe.h
@@ -17,9 +17,11 @@ struct kvm_spe {
 };
 
 struct kvm_vcpu_spe {
+	u64 hw_pmbsr_el1;	/* Updated on hardware management event */
 	u64 host_pmscr_el2;	/* Host PMSCR_EL2 register, context switched. */
 	int irq_num;		/* Buffer management interrupt number */
 	bool initialized;	/* SPE initialized for the VCPU */
+	bool irq_level;		/* Virtual buffer management interrupt level */
 };
 
 DECLARE_STATIC_KEY_FALSE(kvm_spe_available);
@@ -56,6 +58,8 @@ bool kvm_spe_has_feat_spe_fds(struct kvm *kvm);
 
 void kvm_vcpu_spe_load(struct kvm_vcpu *vcpu);
 void kvm_vcpu_spe_put(struct kvm_vcpu *vcpu);
+
+void kvm_spe_sync_hwstate(struct kvm_vcpu *vcpu);
 #else
 struct kvm_spe {
 };
@@ -111,6 +115,9 @@ static inline void kvm_vcpu_spe_load(struct kvm_vcpu *vcpu)
 static inline void kvm_vcpu_spe_put(struct kvm_vcpu *vcpu)
 {
 }
+static inline void kvm_spe_sync_hwstate(struct kvm_vcpu *vcpu)
+{
+}
 #endif /* CONFIG_KVM_ARM_SPE */
 
 #endif /* __ARM64_KVM_SPE_H__ */
diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index c5f5d5dbd695..a2c97daece24 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -1272,6 +1272,8 @@ int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu)
 		if (kvm_vcpu_has_pmu(vcpu))
 			kvm_pmu_sync_hwstate(vcpu);
 
+		kvm_spe_sync_hwstate(vcpu);
+
 		/*
 		 * Sync the vgic state before syncing the timer state because
 		 * the timer code needs to know if the virtual timer
diff --git a/arch/arm64/kvm/hyp/vhe/spe-sr.c b/arch/arm64/kvm/hyp/vhe/spe-sr.c
index fb8614435069..0fb625eadfa1 100644
--- a/arch/arm64/kvm/hyp/vhe/spe-sr.c
+++ b/arch/arm64/kvm/hyp/vhe/spe-sr.c
@@ -75,6 +75,6 @@ void __kvm_spe_save_guest_buffer(struct kvm_vcpu *vcpu, struct kvm_cpu_context *
 	write_sysreg_s(0, SYS_PMBSR_EL1);
 	isb();
 	/* PMBSR_EL1 changed while the VCPU was running, save it */
-	ctxt_sys_reg(guest_ctxt, PMBSR_EL1) = pmbsr_el1;
+	vcpu->arch.vcpu_spe.hw_pmbsr_el1 = pmbsr_el1;
 }
 NOKPROBE_SYMBOL(__kvm_spe_save_guest_buffer);
diff --git a/arch/arm64/kvm/spe.c b/arch/arm64/kvm/spe.c
index 85a1ac8bb57f..d163ddfdd8e2 100644
--- a/arch/arm64/kvm/spe.c
+++ b/arch/arm64/kvm/spe.c
@@ -178,6 +178,33 @@ u64 kvm_spe_read_sysreg(struct kvm_vcpu *vcpu, int reg, u32 encoding)
 	return val;
 }
 
+static void kvm_spe_update_irq_level(struct kvm_vcpu *vcpu, bool level)
+{
+	struct kvm_vcpu_spe *vcpu_spe = &vcpu->arch.vcpu_spe;
+	int ret;
+
+	if (vcpu_spe->irq_level == level)
+		return;
+
+	vcpu_spe->irq_level = level;
+	ret = kvm_vgic_inject_irq(vcpu->kvm, vcpu, vcpu_spe->irq_num, level, vcpu_spe);
+	WARN_ONCE(ret, "kvm_vgic_inject_irq");
+}
+
+void kvm_spe_sync_hwstate(struct kvm_vcpu *vcpu)
+{
+	struct kvm_vcpu_spe *vcpu_spe = &vcpu->arch.vcpu_spe;
+
+	if (!vcpu_has_spe(vcpu))
+		return;
+
+	if (FIELD_GET(PMBSR_EL1_S, vcpu_spe->hw_pmbsr_el1)) {
+		__vcpu_assign_sys_reg(vcpu, PMBSR_EL1, vcpu_spe->hw_pmbsr_el1);
+		vcpu_spe->hw_pmbsr_el1 = 0;
+		kvm_spe_update_irq_level(vcpu, true);
+	}
+}
+
 static void kvm_spe_save_sampling_regs(struct kvm_vcpu *vcpu, struct kvm_cpu_context *ctxt)
 {
 	struct kvm *kvm = vcpu->kvm;
-- 
2.51.2


