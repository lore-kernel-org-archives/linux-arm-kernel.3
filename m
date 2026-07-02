Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D00CC43602
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 19:04:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jN/WkzMFGUFt/RPp6TzvnHSdHbLQg7oor4+aGJgH13w=; b=cRXD6pj/bGQqwHCVoM5L9dtBO8
	cFtsfc811u8sEzCa6w4T2R+BCTwYK/xqNKcpNXtfiphMz6nSzwjaP5eN8VCbe68uA2NEyZZ3BEQys
	o0rRepp3qNGcRS5m1wcser7oZEXPfT1JN1H86wjv3STbchZLmgQ9+p4soZTiZZzfaaSNT0gFf9Zt3
	cJeqm/f7BdX7XKLjMNjL4J85J/x3Gq+s0WmWVrkThS+i8+2o5W3LK8JCtwyczKrRzU5Wu7/OZESHf
	LQN123ZRh8b9vM4V6plTNKnftIMadtLigJtS7WmCzSUchZ3asWpXGRFjrZBrUoS2KFdnWBVEQiU1v
	jsguMWqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfMiN-00000005JCm-28WI;
	Thu, 02 Jul 2026 19:04:47 +0000
Received: from pdx-out-007.esa.us-west-2.outbound.mail-perimeter.amazon.com ([52.34.181.151])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfMiL-00000005JBN-0N9M
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jul 2026 19:04:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1783019085; x=1814555085;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=jN/WkzMFGUFt/RPp6TzvnHSdHbLQg7oor4+aGJgH13w=;
  b=sj4ZuVqXKpsjiXP1QRxjMwAw1fmudiPZNWRJrhPzL8+PH6WbJIS5AM7J
   snGVi7ECD/3iMueiKiGhP/PbFeqwbggkcJsyYea/WTGibyHQjGo43keDB
   yhQ76vSHovwwoUxG6Chw+C150zVTrRFFg3VnbJphWqe1NVV1ZzzipVg3A
   2RueWiGZQ8IVH/bbGRF4q5N4ExkH/1a+nIDdL8Xe2in9wAjjeQDtEFpZg
   Mh1Qn5Xrv8pujp4suVBczLEAlQJD146EpCh/XHwQdabACs9Lj4LuG++4S
   nRo+Pa2dWDK12+5k8Q0Nwm23Rf3M70Jc/zuQWPRswTllIO7oq6vLlp8my
   w==;
X-CSE-ConnectionGUID: Fgog3/IyQf+0jBlKaWo8Kw==
X-CSE-MsgGUID: RbZsELl0RUabGM37BE/1aw==
X-IronPort-AV: E=Sophos;i="6.25,144,1779148800"; 
   d="scan'208";a="22937563"
Received: from ip-10-5-9-48.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.9.48])
  by internal-pdx-out-007.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2026 19:04:41 +0000
Received: from EX19MTAUWB002.ant.amazon.com [205.251.233.111:17307]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.20.237:2525] with esmtp (Farcaster)
 id 330d23d9-ef2c-4a1b-a43e-161770cf5f29; Thu, 2 Jul 2026 19:04:40 +0000 (UTC)
X-Farcaster-Flow-ID: 330d23d9-ef2c-4a1b-a43e-161770cf5f29
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWB002.ant.amazon.com (10.250.64.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.43;
 Thu, 2 Jul 2026 19:04:40 +0000
Received: from dev-dsk-congkai-2a-df9e8fab.us-west-2.amazon.com
 (172.23.251.204) by EX19D001UWA001.ant.amazon.com (10.13.138.214) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.43; Thu, 2 Jul 2026
 19:04:40 +0000
From: Congkai Tan <congkai@amazon.com>
To: Oliver Upton <oupton@kernel.org>, <kvmarm@lists.linux.dev>,
	<linux-arm-kernel@lists.infradead.org>
CC: Congkai Tan <congkai@amazon.com>, Marc Zyngier <maz@kernel.org>, "Joey
 Gouly" <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, "Jonathan
 Corbet" <corbet@lwn.net>, Haris Okanovic <harisokn@amazon.com>, Geoff Blake
	<blakgeof@amazon.com>, Stanislav Spassov <stanspas@amazon.de>,
	<kvm@vger.kernel.org>, <linux-doc@vger.kernel.org>,
	<linux-kselftest@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 1/3] KVM: arm64: Add KVM_ARM_VCPU_PMU_V3_STRICT vCPU feature
Date: Thu, 2 Jul 2026 19:04:19 +0000
Message-ID: <20260702190421.420992-2-congkai@amazon.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260702190421.420992-1-congkai@amazon.com>
References: <20260702190421.420992-1-congkai@amazon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.23.251.204]
X-ClientProxiedBy: EX19D045UWC004.ant.amazon.com (10.13.139.203) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_120445_201476_2088EBEA 
X-CRM114-Status: GOOD (  25.88  )
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

Introduce a new vCPU feature KVM_ARM_VCPU_PMU_V3_STRICT. When set, KVM
does not create a default PMU when initializing the vCPU, and userspace
must select one explicitly via KVM_ARM_VCPU_PMU_V3_SET_PMU before the
first KVM_RUN.

The flag forces the VMM to be aware of the PMU implementation of the
guest to be created, so that certain information about the PMU becomes
deterministic (if on a heterogeneous system) and becomes safe to be
exposed to the guest. It can be used as an umbrella flag to gate future
PMUv3 UAPI changes.

When no default PMU is created, kvm->arch.arm_pmu stays NULL until SET_PMU
runs, so kvm_arm_pmu_v3_enable() now refuses to run if kvm->arch.arm_pmu
is NULL.

Signed-off-by: Congkai Tan <congkai@amazon.com>
Reviewed-by: Geoff Blake <blakgeof@amazon.com>
Reviewed-by: Haris Okanovic <harisokn@amazon.com>
Reviewed-by: Stanislav Spassov <stanspas@amazon.de>
---
 Documentation/virt/kvm/api.rst          |  5 +++++
 arch/arm64/include/asm/kvm_host.h       |  2 +-
 arch/arm64/include/uapi/asm/kvm.h       |  1 +
 arch/arm64/kvm/arm.c                    | 18 ++++++++++++++----
 arch/arm64/kvm/pmu-emul.c               | 14 +++++++++++++-
 include/kvm/arm_pmu.h                   |  4 ++++
 tools/arch/arm64/include/uapi/asm/kvm.h |  1 +
 7 files changed, 39 insertions(+), 6 deletions(-)

diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
index 52bbbb553ce1..79b024a7ba16 100644
--- a/Documentation/virt/kvm/api.rst
+++ b/Documentation/virt/kvm/api.rst
@@ -3515,6 +3515,11 @@ Possible features:
 	  Depends on KVM_CAP_ARM_PSCI_0_2.
 	- KVM_ARM_VCPU_PMU_V3: Emulate PMUv3 for the CPU.
 	  Depends on KVM_CAP_ARM_PMU_V3.
+	- KVM_ARM_VCPU_PMU_V3_STRICT: Enable strict PMUv3 UAPI.
+	  Requires KVM_ARM_VCPU_PMU_V3. If set, KVM does not create a default
+	  PMU; userspace must select a PMU implementation with
+	  KVM_ARM_VCPU_PMU_V3_SET_PMU before the first KVM_RUN. The selected
+	  PMU exposes the SLOTS field of its PMMIR_EL1 register to the guest.
 
 	- KVM_ARM_VCPU_PTRAUTH_ADDRESS: Enables Address Pointer authentication
 	  for arm64 only.
diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index 65eead8362e0..a6e33aaf400d 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -39,7 +39,7 @@
 
 #define KVM_MAX_VCPUS VGIC_V3_MAX_CPUS
 
-#define KVM_VCPU_MAX_FEATURES 9
+#define KVM_VCPU_MAX_FEATURES 10
 #define KVM_VCPU_VALID_FEATURES	(BIT(KVM_VCPU_MAX_FEATURES) - 1)
 
 #define KVM_REQ_SLEEP \
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
diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index 9453321ef8c6..d1914bee1e76 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -1548,8 +1548,10 @@ static unsigned long system_supported_vcpu_features(void)
 	if (!cpus_have_final_cap(ARM64_HAS_32BIT_EL1))
 		clear_bit(KVM_ARM_VCPU_EL1_32BIT, &features);
 
-	if (!kvm_supports_guest_pmuv3())
+	if (!kvm_supports_guest_pmuv3()) {
 		clear_bit(KVM_ARM_VCPU_PMU_V3, &features);
+		clear_bit(KVM_ARM_VCPU_PMU_V3_STRICT, &features);
+	}
 
 	if (!system_supports_sve())
 		clear_bit(KVM_ARM_VCPU_SVE, &features);
@@ -1590,6 +1592,11 @@ static int kvm_vcpu_init_check_features(struct kvm_vcpu *vcpu,
 	    test_bit(KVM_ARM_VCPU_PTRAUTH_GENERIC, &features))
 		return -EINVAL;
 
+	/* Strict PMUv3 UAPI requires PMUv3. */
+	if (test_bit(KVM_ARM_VCPU_PMU_V3_STRICT, &features) &&
+	    !test_bit(KVM_ARM_VCPU_PMU_V3, &features))
+		return -EINVAL;
+
 	if (!test_bit(KVM_ARM_VCPU_EL1_32BIT, &features))
 		return 0;
 
@@ -1619,10 +1626,13 @@ static int kvm_setup_vcpu(struct kvm_vcpu *vcpu)
 	int ret = 0;
 
 	/*
-	 * When the vCPU has a PMU, but no PMU is set for the guest
-	 * yet, set the default one.
+	 * When the vCPU has a PMU, but no PMU is set for the guest yet, set
+	 * the default one. If KVM_ARM_VCPU_PMU_V3_STRICT is set, no default
+	 * PMU is created, and userspace must select a PMU via
+	 * KVM_ARM_VCPU_PMU_V3_SET_PMU.
 	 */
-	if (kvm_vcpu_has_pmu(vcpu) && !kvm->arch.arm_pmu)
+	if (kvm_vcpu_has_pmu(vcpu) && !kvm->arch.arm_pmu &&
+	    !kvm_vcpu_has_pmuv3_strict(vcpu))
 		ret = kvm_arm_set_default_pmu(kvm);
 
 	/* Prepare for nested if required */
diff --git a/arch/arm64/kvm/pmu-emul.c b/arch/arm64/kvm/pmu-emul.c
index e1860acae641..1f24169505a9 100644
--- a/arch/arm64/kvm/pmu-emul.c
+++ b/arch/arm64/kvm/pmu-emul.c
@@ -923,6 +923,9 @@ void kvm_vcpu_reload_pmu(struct kvm_vcpu *vcpu)
 
 int kvm_arm_pmu_v3_enable(struct kvm_vcpu *vcpu)
 {
+	if (!vcpu->kvm->arch.arm_pmu)
+		return -EINVAL;
+
 	if (!vcpu->arch.pmu.created)
 		return -EINVAL;
 
@@ -1021,6 +1024,14 @@ u8 kvm_arm_pmu_get_max_counters(struct kvm *kvm)
 {
 	struct arm_pmu *arm_pmu = kvm->arch.arm_pmu;
 
+	/*
+	 * Under KVM_ARM_VCPU_PMU_V3_STRICT no PMU exists until userspace sets
+	 * one, so this can be reached before arm_pmu is set. Report no
+	 * counters in that case.
+	 */
+	if (!arm_pmu)
+		return 0;
+
 	/*
 	 * PMUv3 requires that all event counters are capable of counting any
 	 * event, though the same may not be true of non-PMUv3 hardware.
@@ -1062,7 +1073,8 @@ static void kvm_arm_set_pmu(struct kvm *kvm, struct arm_pmu *arm_pmu)
 }
 
 /**
- * kvm_arm_set_default_pmu - No PMU set, get the default one.
+ * kvm_arm_set_default_pmu - No PMU set and KVM_ARM_VCPU_PMU_V3_STRICT not
+ * set, get the default one.
  * @kvm: The kvm pointer
  *
  * The observant among you will notice that the supported_cpus
diff --git a/include/kvm/arm_pmu.h b/include/kvm/arm_pmu.h
index 0a36a3d5c894..13468bd5bbf2 100644
--- a/include/kvm/arm_pmu.h
+++ b/include/kvm/arm_pmu.h
@@ -76,6 +76,9 @@ void kvm_vcpu_pmu_resync_el0(void);
 #define kvm_vcpu_has_pmu(vcpu)					\
 	(vcpu_has_feature(vcpu, KVM_ARM_VCPU_PMU_V3))
 
+#define kvm_vcpu_has_pmuv3_strict(vcpu)				\
+	(vcpu_has_feature(vcpu, KVM_ARM_VCPU_PMU_V3_STRICT))
+
 /*
  * Updates the vcpu's view of the pmu events for this cpu.
  * Must be called before every vcpu run after disabling interrupts, to ensure
@@ -161,6 +164,7 @@ static inline u64 kvm_pmu_get_pmceid(struct kvm_vcpu *vcpu, bool pmceid1)
 }
 
 #define kvm_vcpu_has_pmu(vcpu)		({ false; })
+#define kvm_vcpu_has_pmuv3_strict(vcpu)	({ false; })
 static inline void kvm_pmu_update_vcpu_events(struct kvm_vcpu *vcpu) {}
 static inline void kvm_vcpu_pmu_restore_guest(struct kvm_vcpu *vcpu) {}
 static inline void kvm_vcpu_pmu_restore_host(struct kvm_vcpu *vcpu) {}
diff --git a/tools/arch/arm64/include/uapi/asm/kvm.h b/tools/arch/arm64/include/uapi/asm/kvm.h
index 1c13bfa2d38a..019e5e3d892e 100644
--- a/tools/arch/arm64/include/uapi/asm/kvm.h
+++ b/tools/arch/arm64/include/uapi/asm/kvm.h
@@ -106,6 +106,7 @@ struct kvm_regs {
 #define KVM_ARM_VCPU_PTRAUTH_GENERIC	6 /* VCPU uses generic authentication */
 #define KVM_ARM_VCPU_HAS_EL2		7 /* Support nested virtualization */
 #define KVM_ARM_VCPU_HAS_EL2_E2H0	8 /* Limit NV support to E2H RES0 */
+#define KVM_ARM_VCPU_PMU_V3_STRICT	9 /* No default PMU creation */
 
 struct kvm_vcpu_init {
 	__u32 target;
-- 
2.50.1


