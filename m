Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06467C44500
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 10:09:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nCwZNeDZlJVGlaWCLeWYvbGvxte1zenM4jubK+YhaG0=; b=nSgMqJj1OqOzV08IifwZkI3C6d
	C/jG0yYjmzRwXtFnId9jACCZ7NUMKJcUnTG4UHKKZb7x/boIeTQwWDKCn3z2PztF7wJAo8TlPQQl3
	Ft9MZFCKeN46ttAWxAgNRc2ESP8lz4mvKR5uSEuz+NBZ/14vkFdTe5+w1bMMbiuYT++l2KRCbiDoe
	D1wT3jFmYdg1OV8Ln/9V+S5DZ9gQdI5hpVkWcvDFON5vHTnei57dgvfR8W77Vn28UJUfv7YkYQT2U
	jhv/m1Nc9Ck7HVH2k3Kjzd3yPqIntS5HDt5ui5rJqXYG2l0eQSaXHVpb8BmjfhWseFCi7gVy/RKq7
	tmdVkXaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wggGJ-0000000C9VH-2sjl;
	Mon, 06 Jul 2026 10:09:15 +0000
Received: from www3579.sakura.ne.jp ([49.212.243.89])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wggGB-0000000C9R6-1Ylw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 10:09:09 +0000
Received: from h183.csg.ci.i.u-tokyo.ac.jp (h183.csg.ci.i.u-tokyo.ac.jp [133.11.54.183])
	(authenticated bits=0)
	by www3579.sakura.ne.jp (8.16.1/8.16.1) with ESMTPSA id 666A3TQ4013128
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Mon, 6 Jul 2026 19:03:43 +0900 (JST)
	(envelope-from odaki@rsg.ci.i.u-tokyo.ac.jp)
DKIM-Signature: a=rsa-sha256; bh=nCwZNeDZlJVGlaWCLeWYvbGvxte1zenM4jubK+YhaG0=;
        c=relaxed/relaxed; d=rsg.ci.i.u-tokyo.ac.jp;
        h=From:Message-Id:To:Subject:Date;
        s=rs20250326; t=1783332223; v=1;
        b=DU1X6V895JVkXdpTIAHNPQNWV5xjYrmYk8nt6k0TwVv2ESbhpC7q09iWxmCFBnSM
         LjlIq0647f8DMew/wQ0GlTAwmY+reFS9YOSeIUPzsVQz5wTxfpuIQmim3mGYqOJ8
         1INSgWTuy2fUXrfv1+YN9KCwKDaBYeGH3szy2HijVP4BJwNBlqd1RrkufE/DmfRG
         o3Q88L81VzlPKx4sdBFXTtZwWvsRFVuWNPqIbRA3eoy4rGDA5BvZwCPg7s7Zzbgg
         OeptxjvHbFbfkXxPccrcR1BvsKXMwrqPP24wl7HFYMrxPnGTTI9V5BUY8Hnji/py
         zuI1kyA7vN5/z7NMNtqtLg==
From: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
Date: Mon, 06 Jul 2026 19:03:24 +0900
Subject: [PATCH v8 1/7] KVM: arm64: Disallow vPMU when pPMUs do not cover
 all CPUs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-hybrid-v8-1-de459617b59d@rsg.ci.i.u-tokyo.ac.jp>
References: <20260706-hybrid-v8-0-de459617b59d@rsg.ci.i.u-tokyo.ac.jp>
In-Reply-To: <20260706-hybrid-v8-0-de459617b59d@rsg.ci.i.u-tokyo.ac.jp>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
        Joey Gouly <joey.gouly@arm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Zenghui Yu <yuzenghui@huawei.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <shuah@kernel.org>, Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
        devel@daynix.com, kvm@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kselftest@vger.kernel.org,
        Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
X-Mailer: b4 0.16-dev-925f5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_030907_635649_E3C9666D 
X-CRM114-Status: GOOD (  14.68  )
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

Commit ec3eb9ed6081 ("KVM: arm64: PMU: Disallow vPMU on non-uniform
PMUVer") made KVM reject vPMU unless the system-wide PMUVer is usable.
That covers systems where PMUv3 is absent or non-uniform, as well as
systems where IMPDEF PMUv3 sysreg traps are unavailable.

However, KVM can still accept vPMU when all CPUs uniformly trap PMUv3
sysregs, but the pPMUs registered with KVM only cover a subset of
possible CPUs.

Reject vPMU unless the registered pPMUs cover every possible CPU.
This avoids carrying support for partial pPMU coverage into the
fixed-counters-only UAPI introduced later in the series.

Signed-off-by: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
---
 arch/arm64/kvm/arm.c      | 16 +++++++++++++---
 arch/arm64/kvm/pmu-emul.c | 20 ++++++++++++++++++--
 include/kvm/arm_pmu.h     |  6 +++---
 3 files changed, 34 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index 29f48f2c63ec..68767bb08285 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -1527,14 +1527,19 @@ int kvm_vm_ioctl_irq_line(struct kvm *kvm, struct kvm_irq_level *irq_level,
 	return -EINVAL;
 }
 
-static unsigned long system_supported_vcpu_features(void)
+static long system_supported_vcpu_features(void)
 {
 	unsigned long features = KVM_VCPU_VALID_FEATURES;
+	int r;
 
 	if (!cpus_have_final_cap(ARM64_HAS_32BIT_EL1))
 		clear_bit(KVM_ARM_VCPU_EL1_32BIT, &features);
 
-	if (!kvm_supports_guest_pmuv3())
+	r = kvm_supports_guest_pmuv3();
+	if (r < 0)
+		return r;
+
+	if (!r)
 		clear_bit(KVM_ARM_VCPU_PMU_V3, &features);
 
 	if (!system_supports_sve())
@@ -1555,6 +1560,7 @@ static int kvm_vcpu_init_check_features(struct kvm_vcpu *vcpu,
 					const struct kvm_vcpu_init *init)
 {
 	unsigned long features = init->features[0];
+	long r;
 	int i;
 
 	if (features & ~KVM_VCPU_VALID_FEATURES)
@@ -1565,7 +1571,11 @@ static int kvm_vcpu_init_check_features(struct kvm_vcpu *vcpu,
 			return -ENOENT;
 	}
 
-	if (features & ~system_supported_vcpu_features())
+	r = system_supported_vcpu_features();
+	if (r < 0)
+		return r;
+
+	if (features & ~r)
 		return -EINVAL;
 
 	/*
diff --git a/arch/arm64/kvm/pmu-emul.c b/arch/arm64/kvm/pmu-emul.c
index c816db5d6761..f50bb9d9a1e7 100644
--- a/arch/arm64/kvm/pmu-emul.c
+++ b/arch/arm64/kvm/pmu-emul.c
@@ -24,10 +24,26 @@ static void kvm_pmu_create_perf_event(struct kvm_pmc *pmc);
 static void kvm_pmu_release_perf_event(struct kvm_pmc *pmc);
 static bool kvm_pmu_counter_is_enabled(struct kvm_pmc *pmc);
 
-bool kvm_supports_guest_pmuv3(void)
+int kvm_supports_guest_pmuv3(void)
 {
+	cpumask_var_t cpus __free(free_cpumask_var) = CPUMASK_VAR_NULL;
+	struct arm_pmu_entry *entry;
+
+	if (!alloc_cpumask_var(&cpus, GFP_KERNEL))
+		return -ENOMEM;
+
+	cpumask_copy(cpus, cpu_possible_mask);
+
 	guard(mutex)(&arm_pmus_lock);
-	return !list_empty(&arm_pmus);
+
+	list_for_each_entry(entry, &arm_pmus, entry) {
+		struct arm_pmu *pmu = entry->arm_pmu;
+
+		if (!cpumask_andnot(cpus, cpus, &pmu->supported_cpus))
+			return 1;
+	}
+
+	return 0;
 }
 
 static struct kvm_vcpu *kvm_pmc_to_vcpu(const struct kvm_pmc *pmc)
diff --git a/include/kvm/arm_pmu.h b/include/kvm/arm_pmu.h
index 0a36a3d5c894..354f06edfdee 100644
--- a/include/kvm/arm_pmu.h
+++ b/include/kvm/arm_pmu.h
@@ -40,7 +40,7 @@ struct arm_pmu_entry {
 	struct arm_pmu *arm_pmu;
 };
 
-bool kvm_supports_guest_pmuv3(void);
+int kvm_supports_guest_pmuv3(void);
 #define kvm_arm_pmu_irq_initialized(v)	((v)->arch.pmu.irq_num != 0)
 u64 kvm_pmu_get_counter_value(struct kvm_vcpu *vcpu, u64 select_idx);
 void kvm_pmu_set_counter_value(struct kvm_vcpu *vcpu, u64 select_idx, u64 val);
@@ -99,9 +99,9 @@ void kvm_pmu_nested_transition(struct kvm_vcpu *vcpu);
 struct kvm_pmu {
 };
 
-static inline bool kvm_supports_guest_pmuv3(void)
+static inline int kvm_supports_guest_pmuv3(void)
 {
-	return false;
+	return 0;
 }
 
 #define kvm_arm_pmu_irq_initialized(v)	(false)

-- 
2.55.0


