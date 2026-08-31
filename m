Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44143C61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Aug 2026 16:35:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P4vQ0rkR93neQnl+JmT40k18i7/wqusJVdqCjEPZgWg=; b=IrHxoqfk4aV2To1YAFFM9wm96k
	JTVnLYjtTvheVDv4ulDwCNuZekjWKOPKyMcNkmskLtOq0AFOxxDZYBMJ7M2lKvAe8dfmOdMQbIfLj
	cTUNEZslm5gO1wyI/WE9oJxiaw3YU3Nj9mojmBIWwSszv91qAc5g3yhGnCHTQVy9DtsFRiWwfZIoc
	+7V90spoJ4ktG1eIUX+ZEMJaTfw5SZcrDavV9O9vSxlRl8DDWaMtrSb7URzwCevsSUgRhJ2zs3b7S
	bZIPRx3tqPZRY0ifSA8lKS+A0YH1usTKN3rQqPFzH6ci0QOKOAIQxtgCMJrH2MOtL6pSBb/GcZJxC
	AJSQ0cYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x14yS-0000000A3wc-2YPg;
	Mon, 31 Aug 2026 16:35:08 +0000
Received: from out-219.mta1.migadu.com ([2001:41d0:203:375::db] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x14yJ-0000000A3op-4Byo
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Aug 2026 16:35:01 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=LjTNsbAvGq72sWYHU7eQhH5T/ahOYXS73p772ji7rOw=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788194097; v=1; x=1788798897;
 b=bVFC+lOpTEf9jiaz8p3pYsf2q+7w8d8eI7/JqFsFj5mv5nmRakRZ3pqO1GR3pDXX7oZhvteB
 dsQzQmKXbhguOOlVg6Q8UNcbvVwPj5ELsKabrInmQjFB7xyj2YI8e85VPh/clkrtn4hUEOL/R9h
 DOMCe3GgOOLfOPCAHauUx9gg=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 6494dc0caad3b8e5;
	Mon, 31 Aug 2026 16:34:57 +0000
X-Mizu-Trace-ID: 6494dc0caad3b8e5
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	Quentin Perret <qperret@google.com>,
	Fuad Tabba <tabba@google.com>
Subject: [PATCH 10/17] KVM: arm64: Restrict KVM_ARM_VCPU_INIT and PSCI version for protected VMs
Date: Mon, 31 Aug 2026 17:34:14 +0100
Message-Id: <20260831163421.272420-11-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260831163421.272420-1-fuad.tabba@linux.dev>
References: <20260831163421.272420-1-fuad.tabba@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_093500_192326_4AAC85C4 
X-CRM114-Status: GOOD (  15.05  )
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

EL2 masks a protected VM's vCPU features down to the set pKVM allows,
so a KVM_ARM_VCPU_INIT that requests more succeeds and produces a
guest without them. Reject such an init with -EINVAL. The host and
EL2 both take the allowed set from kvm_pkvm_vcpu_allowed_features().

EL2 returns 1.1 for a protected guest's PSCI_VERSION whatever the
host is configured for, and forwards the platform calls to the host.
Require KVM_ARM_VCPU_PSCI_0_2: without it the host dispatches the
forwarded calls as PSCI 0.1. Reject a KVM_REG_ARM_PSCI_VERSION write
below 1.1: below it the host rejects the SYSTEM_RESET2 that EL2
advertises. KVM_CAP_ARM_PSCI is no longer advertised to protected VMs.

Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/include/asm/kvm_pkvm.h | 25 ++++++++++++++++++++++++-
 arch/arm64/kvm/arm.c              | 13 +++++++++++++
 arch/arm64/kvm/hyp/nvhe/pkvm.c    | 17 ++---------------
 arch/arm64/kvm/hypercalls.c       |  7 +++++++
 4 files changed, 46 insertions(+), 16 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_pkvm.h b/arch/arm64/include/asm/kvm_pkvm.h
index c4c834d55e503..ee3ab505b01f7 100644
--- a/arch/arm64/include/asm/kvm_pkvm.h
+++ b/arch/arm64/include/asm/kvm_pkvm.h
@@ -33,7 +33,6 @@ static inline bool kvm_pkvm_ext_allowed(struct kvm *kvm, long ext)
 {
 	switch (ext) {
 	case KVM_CAP_IRQCHIP:
-	case KVM_CAP_ARM_PSCI:
 	case KVM_CAP_ARM_PSCI_0_2:
 	case KVM_CAP_NR_VCPUS:
 	case KVM_CAP_MAX_VCPUS:
@@ -62,6 +61,30 @@ static inline bool kvm_pkvm_ext_allowed(struct kvm *kvm, long ext)
 	}
 }
 
+/*
+ * The vCPU features a protected VM may use: checked by the host at
+ * KVM_ARM_VCPU_INIT, applied by EL2 when the hyp VM is created.
+ */
+static inline void kvm_pkvm_vcpu_allowed_features(struct kvm *kvm,
+						  unsigned long *allowed)
+{
+	bitmap_zero(allowed, KVM_VCPU_MAX_FEATURES);
+
+	set_bit(KVM_ARM_VCPU_PSCI_0_2, allowed);
+
+	if (kvm_pkvm_ext_allowed(kvm, KVM_CAP_ARM_PMU_V3))
+		set_bit(KVM_ARM_VCPU_PMU_V3, allowed);
+
+	if (kvm_pkvm_ext_allowed(kvm, KVM_CAP_ARM_PTRAUTH_ADDRESS))
+		set_bit(KVM_ARM_VCPU_PTRAUTH_ADDRESS, allowed);
+
+	if (kvm_pkvm_ext_allowed(kvm, KVM_CAP_ARM_PTRAUTH_GENERIC))
+		set_bit(KVM_ARM_VCPU_PTRAUTH_GENERIC, allowed);
+
+	if (kvm_pkvm_ext_allowed(kvm, KVM_CAP_ARM_SVE))
+		set_bit(KVM_ARM_VCPU_SVE, allowed);
+}
+
 /*
  * Check whether the KVM VM IOCTL is allowed in pKVM.
  *
diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index 8b080804bc90b..3e00edce23a99 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -1620,6 +1620,19 @@ static int kvm_vcpu_init_check_features(struct kvm_vcpu *vcpu,
 	if (features & ~system_supported_vcpu_features())
 		return -EINVAL;
 
+	/* Reject features EL2 would drop when it creates the hyp VM. */
+	if (kvm_vm_is_protected(vcpu->kvm)) {
+		DECLARE_BITMAP(allowed, KVM_VCPU_MAX_FEATURES);
+
+		kvm_pkvm_vcpu_allowed_features(vcpu->kvm, allowed);
+		if (!bitmap_subset(&features, allowed, KVM_VCPU_MAX_FEATURES))
+			return -EINVAL;
+
+		/* EL2 implements PSCI 1.1; the host must not dispatch as 0.1. */
+		if (!test_bit(KVM_ARM_VCPU_PSCI_0_2, &features))
+			return -EINVAL;
+	}
+
 	/*
 	 * For now make sure that both address/generic pointer authentication
 	 * features are requested by the userspace together.
diff --git a/arch/arm64/kvm/hyp/nvhe/pkvm.c b/arch/arm64/kvm/hyp/nvhe/pkvm.c
index 4dce489837cd2..4fb4c3c6ee92a 100644
--- a/arch/arm64/kvm/hyp/nvhe/pkvm.c
+++ b/arch/arm64/kvm/hyp/nvhe/pkvm.c
@@ -367,23 +367,10 @@ static void pkvm_init_features_from_host(struct pkvm_hyp_vm *hyp_vm, const struc
 	if (kvm_pkvm_ext_allowed(kvm, KVM_CAP_ARM_MTE))
 		kvm->arch.flags |= host_arch_flags & BIT(KVM_ARCH_FLAG_MTE_ENABLED);
 
-	bitmap_zero(allowed_features, KVM_VCPU_MAX_FEATURES);
+	kvm_pkvm_vcpu_allowed_features(kvm, allowed_features);
 
-	set_bit(KVM_ARM_VCPU_PSCI_0_2, allowed_features);
-
-	if (kvm_pkvm_ext_allowed(kvm, KVM_CAP_ARM_PMU_V3))
-		set_bit(KVM_ARM_VCPU_PMU_V3, allowed_features);
-
-	if (kvm_pkvm_ext_allowed(kvm, KVM_CAP_ARM_PTRAUTH_ADDRESS))
-		set_bit(KVM_ARM_VCPU_PTRAUTH_ADDRESS, allowed_features);
-
-	if (kvm_pkvm_ext_allowed(kvm, KVM_CAP_ARM_PTRAUTH_GENERIC))
-		set_bit(KVM_ARM_VCPU_PTRAUTH_GENERIC, allowed_features);
-
-	if (kvm_pkvm_ext_allowed(kvm, KVM_CAP_ARM_SVE)) {
-		set_bit(KVM_ARM_VCPU_SVE, allowed_features);
+	if (kvm_pkvm_ext_allowed(kvm, KVM_CAP_ARM_SVE))
 		kvm->arch.flags |= host_arch_flags & BIT(KVM_ARCH_FLAG_GUEST_HAS_SVE);
-	}
 
 	bitmap_and(kvm->arch.vcpu_features, host_kvm->arch.vcpu_features,
 		   allowed_features, KVM_VCPU_MAX_FEATURES);
diff --git a/arch/arm64/kvm/hypercalls.c b/arch/arm64/kvm/hypercalls.c
index b11b8821c9fbc..121199bda1add 100644
--- a/arch/arm64/kvm/hypercalls.c
+++ b/arch/arm64/kvm/hypercalls.c
@@ -580,6 +580,13 @@ int kvm_arm_set_fw_reg(struct kvm_vcpu *vcpu, const struct kvm_one_reg *reg)
 
 		wants_02 = vcpu_has_feature(vcpu, KVM_ARM_VCPU_PSCI_0_2);
 
+		/*
+		 * EL2 advertises PSCI 1.1; the host handles the forwarded calls
+		 * by this version.
+		 */
+		if (kvm_vm_is_protected(vcpu->kvm) && val < KVM_ARM_PSCI_1_1)
+			return -EINVAL;
+
 		switch (val) {
 		case KVM_ARM_PSCI_0_1:
 			if (wants_02)
-- 
2.39.5


