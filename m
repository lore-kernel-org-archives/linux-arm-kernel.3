Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F29AEC44536
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 20:28:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GFB4ZpocC21kYkU+RGp11ZLBkgqutN6A0ZFD/YWEoV8=; b=amq3kTSs3nt4q82C0rRq6Xcph0
	B557QAw9Lxh1cbQ6NzcppqzAhwldGkQ+EOx93n6y4CjiyAYjXANQzqB6YBGdBaQle/IUCmytFWgAu
	KkoBP1vXuvBYJMyoigEiEtGlMTK6SOr6a/aiGGGjmEQEnJR3HDQMhFLid9HFpz4ruXRIHix02x3yo
	PNFV/lEYIjzXe4gbz1NexPkzKkBpPdCcC11n1Zlv03LWIEue+AJzwRvNsImOn+ohgWPJrLD15appm
	HuGucMCzjGC9jULmcExhxWq0CSUsBpfEIIbkbn8JAfrlQsHEIs7NLMpnKGhKZnr14itGplzH6L7w0
	Vp8zIotg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmdYL-0000000Cj0P-0rt7;
	Wed, 22 Jul 2026 20:28:29 +0000
Received: from pdx-out-006.esa.us-west-2.outbound.mail-perimeter.amazon.com ([52.26.1.71])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmdYI-0000000Cizt-3akM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 20:28:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1784752106; x=1816288106;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=GFB4ZpocC21kYkU+RGp11ZLBkgqutN6A0ZFD/YWEoV8=;
  b=FyZMDzMsnzdaV+SaNCRpUjiD29lSf6vbau6CXqwltR8ZgESJ7c4uUyCG
   78DUhM/W+prMtAFKlSfCkiBe248BPyyglm633poF+hVa2WuP9hKhtwJIR
   gGmN6EhWqeGBa4oBBqb4nAvalxQ3gC1PjyxU+FpG80bgxFMID592rpBeq
   fYKFmkwOnaC6jvqAmVhcajoA4FGnjCRFb0HMjfOfI/KSAp83NVmD3qfRw
   uklI6zXbSd+CjkxyTms/xIKbiRQXivwAt5VeDmq3fjICTBKGD+DtlaoRZ
   LL6BxppU7Ac5wl/QtVttRpzjzz4JR/fIzuCoDFO18fIFrwsytUDIQommn
   Q==;
X-CSE-ConnectionGUID: yMA41NnaRBWZS+U7l1RZrQ==
X-CSE-MsgGUID: BJB0EhzOSfWCVKU/W0GvHQ==
X-IronPort-AV: E=Sophos;i="6.25,179,1779148800"; 
   d="scan'208";a="24206685"
Received: from ip-10-5-6-203.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.6.203])
  by internal-pdx-out-006.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2026 20:27:23 +0000
Received: from EX19MTAUWC002.ant.amazon.com [205.251.233.51:27607]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.55.142:2525] with esmtp (Farcaster)
 id 5e04caef-2ab3-4edb-83f0-bfb654047ad5; Wed, 22 Jul 2026 20:27:23 +0000 (UTC)
X-Farcaster-Flow-ID: 5e04caef-2ab3-4edb-83f0-bfb654047ad5
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWC002.ant.amazon.com (10.250.64.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.43;
 Wed, 22 Jul 2026 20:27:22 +0000
Received: from dev-dsk-congkai-2a-df9e8fab.us-west-2.amazon.com
 (172.23.251.204) by EX19D001UWA001.ant.amazon.com (10.13.138.214) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.43; Wed, 22 Jul 2026
 20:27:22 +0000
From: Congkai Tan <congkai@amazon.com>
To: Oliver Upton <oupton@kernel.org>, <kvmarm@lists.linux.dev>,
	<linux-arm-kernel@lists.infradead.org>
CC: Congkai Tan <congkai@amazon.com>, Marc Zyngier <maz@kernel.org>, "Joey
 Gouly" <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, "Jonathan
 Corbet" <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, "Haris
 Okanovic" <harisokn@amazon.com>, Geoff Blake <blakgeof@amazon.com>,
	"Stanislav Spassov" <stanspas@amazon.de>, <kvm@vger.kernel.org>,
	<linux-doc@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v3 1/4] KVM: arm64: Expose PMMIR_EL1.SLOTS under strict PMUv3 UAPI
Date: Wed, 22 Jul 2026 20:26:59 +0000
Message-ID: <20260722202702.4165917-2-congkai@amazon.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260722202702.4165917-1-congkai@amazon.com>
References: <20260722202702.4165917-1-congkai@amazon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.23.251.204]
X-ClientProxiedBy: EX19D045UWC001.ant.amazon.com (10.13.139.223) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_132826_948579_2FCF0CCB 
X-CRM114-Status: GOOD (  26.92  )
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

Introduce a new field pmmir_slots in struct kvm_arch to store
PMMIR_EL1.SLOTS. It only saves the actual hardware PMU value when
the VMM explicitly selects a PMU under KVM_ARM_VCPU_PMU_V3_STRICT.
Otherwise, it stays 0 after allocation.

Use this field to implement guest access, userspace get, and userspace
set for PMMIR_EL1:
- access_pmmir(): uses the value in kvm->arch.pmmir_slots directly. If
  the VMM selected a PMU and KVM_ARM_VCPU_PMU_V3_STRICT is set, the guest
  can correctly read the underlying core's SLOTS. Otherwise, it continues
  to read 0 since the true SLOTS value can be nondeterministic.
- get_pmmir(): same as access_pmmir().
- set_pmmir(): only the SLOTS field is writable; a value setting any
  other bit is rejected with -EINVAL, since get_pmmir() returns SLOTS
  zero-extended. A value of 0 resets kvm->arch.pmmir_slots to 0 for
  backward compatibility, as the register is RAZ in older KVM, a value
  matching the current SLOTS is accepted as a no-op, and anything else is
  rejected with -EINVAL. Once the VM has run PMMIR_EL1 is immutable, so a
  mismatching write then returns -EBUSY.

The register is now exposed via KVM_GET_REG_LIST for PMUv3 vCPUs, so add
it to the get-reg-list selftest's PMU register list.

Signed-off-by: Congkai Tan <congkai@amazon.com>
Reviewed-by: Geoff Blake <blakgeof@amazon.com>
Reviewed-by: Haris Okanovic <harisokn@amazon.com>
Reviewed-by: Stanislav Spassov <stanspas@amazon.de>
Co-developed-by: Oliver Upton <oupton@kernel.org>
Signed-off-by: Oliver Upton <oupton@kernel.org>
---
 arch/arm64/include/asm/kvm_host.h             |  3 +
 arch/arm64/include/uapi/asm/kvm.h             |  1 +
 arch/arm64/kvm/pmu-emul.c                     | 11 ++++
 arch/arm64/kvm/sys_regs.c                     | 63 ++++++++++++++++++-
 include/kvm/arm_pmu.h                         |  4 ++
 .../selftests/kvm/arm64/get-reg-list.c        |  1 +
 6 files changed, 81 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index bae2c4f92ef5..9e035d587970 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -387,6 +387,9 @@ struct kvm_arch {
 	/* Maximum number of counters for the guest */
 	u8 nr_pmu_counters;
 
+	/* PMMIR_EL1.SLOTS value exposed to the guest. */
+	u8 pmmir_slots;
+
 	/* Hypercall features firmware registers' descriptor */
 	struct kvm_smccc_features smccc_feat;
 	struct maple_tree smccc_filter;
diff --git a/arch/arm64/include/uapi/asm/kvm.h b/arch/arm64/include/uapi/asm/kvm.h
index 1c13bfa2d38a..019e5e3d892e 100644
--- a/arch/arm64/include/uapi/asm/kvm.h
+++ b/arch/arm64/include/uapi/asm/kvm.h
@@ -106,6 +106,7 @@ struct kvm_regs {
 #define KVM_ARM_VCPU_PTRAUTH_GENERIC	6 /* VCPU uses generic authentication */
 #define KVM_ARM_VCPU_HAS_EL2		7 /* Support nested virtualization */
 #define KVM_ARM_VCPU_HAS_EL2_E2H0	8 /* Limit NV support to E2H RES0 */
+#define KVM_ARM_VCPU_PMU_V3_STRICT	9 /* No default PMU creation */
 
 struct kvm_vcpu_init {
 	__u32 target;
diff --git a/arch/arm64/kvm/pmu-emul.c b/arch/arm64/kvm/pmu-emul.c
index 98305bbfc095..7ac00423fa8d 100644
--- a/arch/arm64/kvm/pmu-emul.c
+++ b/arch/arm64/kvm/pmu-emul.c
@@ -1092,6 +1092,17 @@ static int kvm_arm_pmu_v3_set_pmu(struct kvm_vcpu *vcpu, int pmu_id)
 
 			kvm_arm_set_pmu(kvm, arm_pmu);
 			cpumask_copy(kvm->arch.supported_cpus, &arm_pmu->supported_cpus);
+
+			/*
+			 * Since a specific PMU is explicitly selected,
+			 * PMMIR_EL1.SLOTS is deterministic to the guest.
+			 * If KVM_ARM_VCPU_PMU_V3_STRICT is set, snapshot
+			 * the value to allow the guest to read it.
+			 */
+			if (kvm_vcpu_has_pmuv3_strict(vcpu))
+				kvm->arch.pmmir_slots =
+					FIELD_GET(ARMV8_PMU_SLOTS,
+						  arm_pmu->reg_pmmir);
 			ret = 0;
 			break;
 		}
diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index 5d5c579d4579..4c6f608c4fe5 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -1367,6 +1367,64 @@ static bool access_pminten(struct kvm_vcpu *vcpu, struct sys_reg_params *p,
 	return true;
 }
 
+static bool access_pmmir(struct kvm_vcpu *vcpu, struct sys_reg_params *p,
+			 const struct sys_reg_desc *r)
+{
+	if (p->is_write)
+		return write_to_read_only(vcpu, p, r);
+
+	/*
+	 * If KVM_ARM_VCPU_PMU_V3_STRICT is set and PMU was explicitly
+	 * selected, the underlying hardware SLOTS value was read into this
+	 * field. Otherwise, it stays 0. All other PMMIR_EL1 fields are RAZ.
+	 */
+	p->regval = FIELD_PREP(ARMV8_PMU_SLOTS, vcpu->kvm->arch.pmmir_slots);
+	return true;
+}
+
+static int get_pmmir(struct kvm_vcpu *vcpu, const struct sys_reg_desc *r,
+		     u64 *val)
+{
+	*val = FIELD_PREP(ARMV8_PMU_SLOTS, vcpu->kvm->arch.pmmir_slots);
+	return 0;
+}
+
+static int set_pmmir(struct kvm_vcpu *vcpu, const struct sys_reg_desc *r,
+		     u64 val)
+{
+	struct kvm *kvm = vcpu->kvm;
+	u8 slots = FIELD_GET(ARMV8_PMU_SLOTS, val);
+
+	/*
+	 * Only the SLOTS field is exposed (get_pmmir returns just that field),
+	 * so reject a write that sets any other bit rather than silently
+	 * masking it.
+	 */
+	if (val & ~(u64)ARMV8_PMU_SLOTS)
+		return -EINVAL;
+
+	guard(mutex)(&kvm->arch.config_lock);
+
+	/*
+	 * Once the VM has started PMMIR_EL1 is immutable. Reject any write
+	 * that does not match the current value.
+	 */
+	if (kvm_vm_has_ran_once(kvm))
+		return slots == kvm->arch.pmmir_slots ? 0 : -EBUSY;
+
+	/*
+	 * Only SLOTS = 0 is honored for backwards compatibility with the
+	 * old RAZ behavior. Reject any non-zero write that does not match
+	 * the current value.
+	 */
+	if (!slots)
+		kvm->arch.pmmir_slots = 0;
+	else if (slots != kvm->arch.pmmir_slots)
+		return -EINVAL;
+
+	return 0;
+}
+
 static bool access_pmovs(struct kvm_vcpu *vcpu, struct sys_reg_params *p,
 			 const struct sys_reg_desc *r)
 {
@@ -3448,7 +3506,8 @@ static const struct sys_reg_desc sys_reg_descs[] = {
 	{ PMU_SYS_REG(PMINTENCLR_EL1),
 	  .access = access_pminten, .reg = PMINTENSET_EL1,
 	  .get_user = get_pmreg, .set_user = set_pmreg },
-	{ SYS_DESC(SYS_PMMIR_EL1), trap_raz_wi },
+	{ PMU_SYS_REG(PMMIR_EL1), .access = access_pmmir, .reset = NULL,
+	  .get_user = get_pmmir, .set_user = set_pmmir },
 
 	{ SYS_DESC(SYS_MAIR_EL1), access_vm_reg, reset_unknown, MAIR_EL1 },
 	{ SYS_DESC(SYS_PIRE0_EL1), NULL, reset_unknown, PIRE0_EL1,
@@ -4593,7 +4652,7 @@ static const struct sys_reg_desc cp15_regs[] = {
 	{ CP15_PMU_SYS_REG(HI,     0, 9, 14, 4), .access = access_pmceid },
 	{ CP15_PMU_SYS_REG(HI,     0, 9, 14, 5), .access = access_pmceid },
 	/* PMMIR */
-	{ CP15_PMU_SYS_REG(DIRECT, 0, 9, 14, 6), .access = trap_raz_wi },
+	{ CP15_PMU_SYS_REG(DIRECT, 0, 9, 14, 6), .access = access_pmmir },
 
 	/* PRRR/MAIR0 */
 	{ AA32(LO), Op1( 0), CRn(10), CRm( 2), Op2( 0), access_vm_reg, NULL, MAIR_EL1 },
diff --git a/include/kvm/arm_pmu.h b/include/kvm/arm_pmu.h
index b5e5942204fc..6b4a118d17ca 100644
--- a/include/kvm/arm_pmu.h
+++ b/include/kvm/arm_pmu.h
@@ -75,6 +75,9 @@ void kvm_vcpu_pmu_resync_el0(void);
 #define kvm_vcpu_has_pmu(vcpu)					\
 	(vcpu_has_feature(vcpu, KVM_ARM_VCPU_PMU_V3))
 
+#define kvm_vcpu_has_pmuv3_strict(vcpu)				\
+	(vcpu_has_feature(vcpu, KVM_ARM_VCPU_PMU_V3_STRICT))
+
 /*
  * Updates the vcpu's view of the pmu events for this cpu.
  * Must be called before every vcpu run after disabling interrupts, to ensure
@@ -160,6 +163,7 @@ static inline u64 kvm_pmu_get_pmceid(struct kvm_vcpu *vcpu, bool pmceid1)
 }
 
 #define kvm_vcpu_has_pmu(vcpu)		({ false; })
+#define kvm_vcpu_has_pmuv3_strict(vcpu)	({ false; })
 static inline void kvm_pmu_update_vcpu_events(struct kvm_vcpu *vcpu) {}
 static inline void kvm_vcpu_pmu_restore_guest(struct kvm_vcpu *vcpu) {}
 static inline void kvm_vcpu_pmu_restore_host(struct kvm_vcpu *vcpu) {}
diff --git a/tools/testing/selftests/kvm/arm64/get-reg-list.c b/tools/testing/selftests/kvm/arm64/get-reg-list.c
index 0a3a94c4cca1..cfa99979d57c 100644
--- a/tools/testing/selftests/kvm/arm64/get-reg-list.c
+++ b/tools/testing/selftests/kvm/arm64/get-reg-list.c
@@ -532,6 +532,7 @@ static __u64 base_regs[] = {
 static __u64 pmu_regs[] = {
 	ARM64_SYS_REG(3, 0, 9, 14, 1),	/* PMINTENSET_EL1 */
 	ARM64_SYS_REG(3, 0, 9, 14, 2),	/* PMINTENCLR_EL1 */
+	ARM64_SYS_REG(3, 0, 9, 14, 6),	/* PMMIR_EL1 */
 	ARM64_SYS_REG(3, 3, 9, 12, 0),	/* PMCR_EL0 */
 	ARM64_SYS_REG(3, 3, 9, 12, 1),	/* PMCNTENSET_EL0 */
 	ARM64_SYS_REG(3, 3, 9, 12, 2),	/* PMCNTENCLR_EL0 */
-- 
2.50.1


