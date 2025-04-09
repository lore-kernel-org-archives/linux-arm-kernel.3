Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F7C7C36002
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Apr 2025 16:08:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q5sS2eh3btJ446kmMhh3DLSUPGeul7+47Pg1GqffRzk=; b=HHnnKR005aBfzFft5NdtbeITzn
	w7X2HUKTyyE+bKJuR0agiBxgiUMp703bYL1JkIPGEFsxHY3N5NjP49Z9WTZOeUX0TYZgbbtKBW0Ld
	RLlbNE6WaoWSvAE8uYNnvz2HiKDDT6/7Ateuj9SUrVFA10TxnZAw5kkuXPlkWfn0UrE/J/VTbmRVo
	LEhsuKbUn3Ogy8Fq7/HjZiDczINVUSy+R4R7FTOwjhEUl2juQncU+55JMVpgxJc52SgXTLziwMUpI
	tQwcgajWS8T7UoCuc0KiPWjLqZTz6Pp3rpGdtc9gEPT72Hl09k4FA2Zy2wwhPvXJfE6tgSzfMHFsT
	sWMEosMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2Xyg-00000007pkn-3e5b;
	Wed, 09 Apr 2025 16:08:38 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2Xrf-00000007oQv-1Plj
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Apr 2025 16:01:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D8B8E4A2B4;
	Wed,  9 Apr 2025 16:01:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86EDBC4CEE7;
	Wed,  9 Apr 2025 16:01:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744214482;
	bh=mb8s/MzbKBQB17RzAzQ/S/4pMWUcDmms5theZIKN8/A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bms5SEz83xdYSqY00L1AJHIos4q33k/pFvSvwOgjEXu5aPcK7IiWx+jIdUO/G6FKN
	 zVEwnp6fe8g21uIMJoeTJdIABMnO5mQSfaF+z4V14vCH+IICZyepyAHsfBFWgaSWYW
	 TJgcAnmvHpxT/lTI0XktJBbAxfndKpBYmb6wYVZyaZGGYKdBMcnbaqy1HYtgpuSMun
	 ovoll88/zudVvzyzvI/+BBy/KlBwmkPud8iAZUqv2xzSouAkRsmbCWe//A33eWT5Du
	 DmbuLSYQEmoCdWdQozwNksoHLFewb8J2uPQdTh8mIhW9H1tQx1OAv75Atfj0wXderq
	 ugxkPw5qvHwZw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1u2Xrc-003vQT-J6;
	Wed, 09 Apr 2025 17:01:20 +0100
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: [PATCH v2 3/6] KVM: arm64: Allow userspace to limit the number of PMU counters for EL2 VMs
Date: Wed,  9 Apr 2025 17:01:03 +0100
Message-Id: <20250409160106.6445-4-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250409160106.6445-1-maz@kernel.org>
References: <20250409160106.6445-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_090123_425415_F129FDA0 
X-CRM114-Status: GOOD (  18.42  )
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

As long as we had purely EL1 VMs, we could easily update the number
of guest-visible counters by letting userspace write to PMCR_EL0.N.

With VMs started at EL2, PMCR_EL1.N only reflects MDCR_EL2.HPMN,
and we don't have a good way to limit it.

For this purpose, introduce a new PMUv3 attribute that allows
limiting the maximum number of counters. This requires the explicit
selection of a PMU.

Suggested-by: Oliver Upton <oliver.upton@linux.dev>
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 Documentation/virt/kvm/devices/vcpu.rst | 24 ++++++++++++++++++++++++
 arch/arm64/include/uapi/asm/kvm.h       |  9 +++++----
 arch/arm64/kvm/pmu-emul.c               | 24 ++++++++++++++++++++++++
 3 files changed, 53 insertions(+), 4 deletions(-)

diff --git a/Documentation/virt/kvm/devices/vcpu.rst b/Documentation/virt/kvm/devices/vcpu.rst
index 31a9576c07afa..6eef154a2e396 100644
--- a/Documentation/virt/kvm/devices/vcpu.rst
+++ b/Documentation/virt/kvm/devices/vcpu.rst
@@ -137,6 +137,30 @@ exit_reason = KVM_EXIT_FAIL_ENTRY and populate the fail_entry struct by setting
 hardare_entry_failure_reason field to KVM_EXIT_FAIL_ENTRY_CPU_UNSUPPORTED and
 the cpu field to the processor id.
 
+1.5 ATTRIBUTE: KVM_ARM_VCPU_PMU_V3_SET_PMCR_N
+---------------------------------------------
+
+:Parameters: in kvm_device_attr.addr the address to an unsigned int
+	     representing the maximum value taken by PMCR_EL0.N
+
+:Returns:
+
+	 =======  ====================================================
+	 -EBUSY   PMUv3 already initialized, a VCPU has already run or
+                  an event filter has already been set
+	 -EFAULT  Error accessing the value pointed to by addr
+	 -ENODEV  PMUv3 not supported or GIC not initialized
+	 -EINVAL  No PMUv3 explicitly selected, or value of N out of
+	 	  range
+	 =======  ====================================================
+
+Update the maximum value allowed in PMCR_EL0.N, defining the number of
+counters visible to the guest. This mandates that a PMU has
+explicitly been selected via KVM_ARM_VCPU_PMU_V3_SET_PMU, and will
+fail when no PMU has been explicitly selected, or the number of
+counters is out of range for the selected PMU. Selecting a new PMU
+cancels the effect of setting this attribute.
+
 2. GROUP: KVM_ARM_VCPU_TIMER_CTRL
 =================================
 
diff --git a/arch/arm64/include/uapi/asm/kvm.h b/arch/arm64/include/uapi/asm/kvm.h
index af9d9acaf9975..a1b106780cf9d 100644
--- a/arch/arm64/include/uapi/asm/kvm.h
+++ b/arch/arm64/include/uapi/asm/kvm.h
@@ -431,10 +431,11 @@ enum {
 
 /* Device Control API on vcpu fd */
 #define KVM_ARM_VCPU_PMU_V3_CTRL	0
-#define   KVM_ARM_VCPU_PMU_V3_IRQ	0
-#define   KVM_ARM_VCPU_PMU_V3_INIT	1
-#define   KVM_ARM_VCPU_PMU_V3_FILTER	2
-#define   KVM_ARM_VCPU_PMU_V3_SET_PMU	3
+#define   KVM_ARM_VCPU_PMU_V3_IRQ		0
+#define   KVM_ARM_VCPU_PMU_V3_INIT		1
+#define   KVM_ARM_VCPU_PMU_V3_FILTER		2
+#define   KVM_ARM_VCPU_PMU_V3_SET_PMU		3
+#define   KVM_ARM_VCPU_PMU_V3_SET_PMCR_N	4
 #define KVM_ARM_VCPU_TIMER_CTRL		1
 #define   KVM_ARM_VCPU_TIMER_IRQ_VTIMER		0
 #define   KVM_ARM_VCPU_TIMER_IRQ_PTIMER		1
diff --git a/arch/arm64/kvm/pmu-emul.c b/arch/arm64/kvm/pmu-emul.c
index f3650f2f2d468..01fda19b0c825 100644
--- a/arch/arm64/kvm/pmu-emul.c
+++ b/arch/arm64/kvm/pmu-emul.c
@@ -1099,6 +1099,20 @@ static int kvm_arm_pmu_v3_set_pmu(struct kvm_vcpu *vcpu, int pmu_id)
 	return ret;
 }
 
+static int kvm_arm_pmu_v3_set_pmcr_n(struct kvm_vcpu *vcpu, unsigned int n)
+{
+	struct kvm *kvm = vcpu->kvm;
+
+	if (!kvm->arch.arm_pmu)
+		return -EINVAL;
+
+	if (n > kvm_arm_pmu_get_max_counters(kvm))
+		return -EINVAL;
+
+	kvm->arch.pmcr_n = n;
+	return 0;
+}
+
 int kvm_arm_pmu_v3_set_attr(struct kvm_vcpu *vcpu, struct kvm_device_attr *attr)
 {
 	struct kvm *kvm = vcpu->kvm;
@@ -1195,6 +1209,15 @@ int kvm_arm_pmu_v3_set_attr(struct kvm_vcpu *vcpu, struct kvm_device_attr *attr)
 
 		return kvm_arm_pmu_v3_set_pmu(vcpu, pmu_id);
 	}
+	case KVM_ARM_VCPU_PMU_V3_SET_PMCR_N: {
+		unsigned int __user *uaddr = (unsigned int __user *)(long)attr->addr;
+		unsigned int n;
+
+		if (get_user(n, uaddr))
+			return -EFAULT;
+
+		return kvm_arm_pmu_v3_set_pmcr_n(vcpu, n);
+	}
 	case KVM_ARM_VCPU_PMU_V3_INIT:
 		return kvm_arm_pmu_v3_init(vcpu);
 	}
@@ -1233,6 +1256,7 @@ int kvm_arm_pmu_v3_has_attr(struct kvm_vcpu *vcpu, struct kvm_device_attr *attr)
 	case KVM_ARM_VCPU_PMU_V3_INIT:
 	case KVM_ARM_VCPU_PMU_V3_FILTER:
 	case KVM_ARM_VCPU_PMU_V3_SET_PMU:
+	case KVM_ARM_VCPU_PMU_V3_SET_PMCR_N:
 		if (kvm_vcpu_has_pmu(vcpu))
 			return 0;
 	}
-- 
2.39.2


