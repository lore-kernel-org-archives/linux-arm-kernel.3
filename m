Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 676DAC9830E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 17:31:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rwsk9te7VPUHzegWpxO9JFCtI5Vc22J8AiaBQE2VWD8=; b=nfKEfokFyymPxhewE5/FqPhnK/
	/wxO2YODUjulMLg0iFWo9J52i5zS9PR5Zc6GAfZyKBvm0bTPJ0tbvtxWLSl6HHf59pDPj0+RCh8dg
	R5nSHINVwqfLglgi3bLX9lIGJEwZibSOWY2w24L9RIetWeBb1+cME3IRowqgGr/cR7IWVceaVv4JA
	mrIVSgcW0gDZctXYUZ2bUfPq8cFkOLI/15HQZnfmE6dEIzLNBZL5pprEGmG4M6I1YFn/E24UNq0Rn
	HY5IZ4EfX3EO0nm47Him7xYmkYrjkout+Mr8xBlvLgyNEuzPkgSed3F4rYQN0RdT1FKk5es7FQLcJ
	zBvD3Xig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9nHo-0000000BkqH-0K7B;
	Thu, 24 Sep 2026 17:31:08 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9nGn-0000000BkHL-1Wib
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 24 Sep 2026 17:30:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=rwsk9te7VPUHzegWpxO9JFCtI5Vc22J8AiaBQE2VWD8=; b=GIP3KWqpaucLACYt/+Yxp0fAXj
	YVn+m1POnau3UPbFwnSN1Q5GEqkS/8UiEJjWN5emSAlKwrR9301N/nfoFq/aLd/AwIJj09tOMkK0N
	wE17yU9jOh5NWorawziSMMLVApHDSccrLsBFPVtmRSfxfkTc2joxQ2z+YqHf7vwDbIRWwQ7t2TX7m
	vT5377wmp05/F+uPLjqtwOr91CxYnF/+xvehBgPbZY3edMV30Iu7VXAr7KndPwaly2w5D55N12ct9
	l5axSBJivSXQhSFPLSBB8o9qqs/AvzaBY+uBIZ4R742MJuydm5pqxEYOfDoCj+/nLOaWYkRGXrWJ+
	39abvRSQ==;
Received: from mail-ot1-x346.google.com ([2607:f8b0:4864:20::346])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x9nGj-0000000GFMi-2TJu
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 17:30:04 +0000
Received: by mail-ot1-x346.google.com with SMTP id 46e09a7af769-81447a16061so17981a34.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Sep 2026 10:30:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790270999; x=1790875799; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rwsk9te7VPUHzegWpxO9JFCtI5Vc22J8AiaBQE2VWD8=;
        b=jNOUd0/GYpjfYX2149sswwtnAS1qxnt6NEcuFuSClzyKJnBR+dAZzd8WbKpZHSNGAa
         HdOar2hfh34aIIbyTScs5Bx+X1XYRSPyL80xj6cAJ8kOsceB7APT1zEXGlWTeUO2N8JQ
         hH2rXS1gVhkHhgUyqTTsboUOUZpJxM0Bt3X6/zc74ogs+8rwgz1LQlUl7+Z34c8LgNal
         ytffi4EV3Zyqd1z+yI4dUkRgezti9OwA58ataF0Yx3tc3f69VoxJnH7G0JvE1fsQjLNb
         OcDrW4PHoGnWYGxCzQjSlSqKoOc14+THIbf7Sxjxy5iL9Kvu8MhSqMebyqJIEVaMVATc
         kVgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790270999; x=1790875799;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rwsk9te7VPUHzegWpxO9JFCtI5Vc22J8AiaBQE2VWD8=;
        b=gUVezSgmdKDPJBNn176A8LtpdQkx3zv4lNujyTlyREHFU5hWZvLd3u1k83XAe1JqCL
         gmVIPgiEwEd3iDHsAB5R3zGmRQ/lnnAs5fseP0huHefyvFS5YrRmu0s7F4/ttRC+puai
         H1U4PUra1BJPsPjXweSf4AfDEtgTQAHzrNq4lYQPwjnofVeG57pMrFKcmZFqhxseEcUg
         3sEQcWrQ7jxPUkAvr8L89zaPgfItcOIXKaA9Jej05+bMDECNxrxu4cva5rxDpon2s0is
         4Vd3NiQQEZPQxCjQk5RhVaWV8E6QRVFEpZZZk3Q0TTnJJ0NDHKwQMh1iKRbVsT6EEDzJ
         J9YQ==
X-Forwarded-Encrypted: i=1; AKwUvBxTeAOUwCtERHbYAAh0WFL9WyGknJ/Ng8AiAANPmf68nMpSW5nu3Ei+7Dkc0c1yq1Njxr4HqKWHIlRgLlYi9wy1@lists.infradead.org
X-Gm-Message-State: AFuF++m8TFaioB9Gt/k7n7jcf93CCQwpCQKeVC0moM10hJkRym+hC+aH
	sFVPPooS2NRkIQEsKJb2gH4Oj4uzjRSKacNZvb0ZFWKZnBqc7TvVYw/t6yv+qXufmSGJ+8e/7r0
	LLeIDaB4vIel0YUn7qjTzUVdyQQ==
X-Received: from jabel8.prod.google.com ([2002:a05:6638:4d88:b0:5f3:c301:1e33])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:3a1b:b0:4d6:9252:4645 with SMTP id 5614622812f47-4d72ea62a98mr3099601b6e.57.1790270998742;
 Thu, 24 Sep 2026 10:29:58 -0700 (PDT)
Date: Thu, 24 Sep 2026 17:29:25 +0000
In-Reply-To: <20260924172928.2110956-1-coltonlewis@google.com>
Mime-Version: 1.0
References: <20260924172928.2110956-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260924172928.2110956-20-coltonlewis@google.com>
Subject: [PATCH v9 19/22] KVM: arm64: Detect overflows for the Partitioned PMU
From: Colton Lewis <coltonlewis@google.com>
To: kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Fuad Tabba <fuad.tabba@linux.dev>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	James Clark <james.clark@linaro.org>, Robin Murphy <robin.murphy@arm.com>, 
	Zide Chen <zide.chen@intel.com>, Alexandru Elisei <alexandru.elisei@arm.com>, 
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>, Mingwei Zhang <mizhang@google.com>, 
	Jonathan Corbet <corbet@lwn.net>, Russell King <linux@armlinux.org.uk>, Shuah Khan <shuah@kernel.org>, 
	linux-perf-users@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Colton Lewis <coltonlewis@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_183001_726477_77D33871 
X-CRM114-Status: GOOD (  18.33  )
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

When re-entering the VM or synchronizing PMU state after a guest counter
overflow interrupt, evaluate whether any enabled and unmasked guest
counter has overflowed ((PMOVSSET_EL0 & PMINTENSET_EL1 & PMCNTENSET_EL0)
with PMCR_EL0.E set) and update the virtual PMU interrupt level in the
vGIC accordingly.

Signed-off-by: Colton Lewis <coltonlewis@google.com>
---
 arch/arm64/kvm/pmu-direct.c | 55 +++++++++++++++++++++++++++++++++++++
 arch/arm64/kvm/pmu-emul.c   | 12 ++++++--
 arch/arm64/kvm/pmu.c        |  8 +++++-
 include/kvm/arm_pmu.h       |  2 ++
 4 files changed, 73 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/kvm/pmu-direct.c b/arch/arm64/kvm/pmu-direct.c
index 95b5a64052762..ec821aa54688f 100644
--- a/arch/arm64/kvm/pmu-direct.c
+++ b/arch/arm64/kvm/pmu-direct.c
@@ -534,6 +534,61 @@ void kvm_pmu_handle_guest_irq(u64 pmovsr)
 
 	for_each_set_bit(i, (unsigned long *)&govf, 64)
 		set_bit(i, (unsigned long *)__ctxt_sys_reg(&vcpu->arch.ctxt, PMOVSSET_EL0));
+
+	if (kvm_pmu_part_overflow_status(vcpu)) {
+		kvm_make_request(KVM_REQ_IRQ_PENDING, vcpu);
+
+		if (!in_nmi())
+			kvm_vcpu_kick(vcpu);
+		else
+			irq_work_queue(&vcpu->arch.pmu.overflow_work);
+	}
+}
+
+/**
+ * kvm_pmu_part_overflow_status() - Determine if any guest counters have overflowed
+ * @vcpu: Pointer to struct kvm_vcpu
+ *
+ * Determine if any guest counters have overflowed and therefore an
+ * IRQ needs to be injected into the guest. If an overflow is detected
+ * while access is VCPU_PMU_ACCESS_FREE (for example, after state
+ * restoration via KVM_SET_ONE_REG), transition the vCPU to
+ * VCPU_PMU_ACCESS_GUEST_OWNED.
+ *
+ * Return: True if there was an overflow, false otherwise
+ */
+bool kvm_pmu_part_overflow_status(struct kvm_vcpu *vcpu)
+{
+	u64 mask = kvm_vcpu_pmu_guest_counter_mask(vcpu);
+	u64 pmovs, pmint, pmcr;
+	unsigned long flags;
+	bool overflow;
+
+	local_irq_save(flags);
+	if (vcpu->arch.pmu.loaded_on_cpu &&
+	    vcpu == kvm_get_running_vcpu()) {
+		u64 hw_ovf = read_sysreg(pmovsset_el0) & mask;
+
+		if (hw_ovf) {
+			__vcpu_rmw_sys_reg(vcpu, PMOVSSET_EL0, |=, hw_ovf);
+			write_sysreg(hw_ovf, pmovsclr_el0);
+		}
+		pmint = read_pmintenset();
+		pmcr = read_pmcr();
+	} else {
+		pmint = __vcpu_sys_reg(vcpu, PMINTENSET_EL1);
+		pmcr = __vcpu_sys_reg(vcpu, PMCR_EL0);
+	}
+
+	pmovs = __vcpu_sys_reg(vcpu, PMOVSSET_EL0);
+	local_irq_restore(flags);
+
+	overflow = (pmcr & ARMV8_PMU_PMCR_E) && (mask & pmovs & pmint);
+
+	if (overflow && kvm_pmu_get_access(vcpu) == VCPU_PMU_ACCESS_FREE)
+		kvm_pmu_set_guest_owned(vcpu);
+
+	return overflow;
 }
 
 /**
diff --git a/arch/arm64/kvm/pmu-emul.c b/arch/arm64/kvm/pmu-emul.c
index e8195984b0373..21e2c96abfdb1 100644
--- a/arch/arm64/kvm/pmu-emul.c
+++ b/arch/arm64/kvm/pmu-emul.c
@@ -268,7 +268,7 @@ void kvm_pmu_reprogram_counter_mask(struct kvm_vcpu *vcpu, u64 val)
  * counter where the values of the global enable control, PMOVSSET_EL0[n], and
  * PMINTENSET_EL1[n] are all 1.
  */
-bool kvm_pmu_overflow_status(struct kvm_vcpu *vcpu)
+bool kvm_pmu_emul_overflow_status(struct kvm_vcpu *vcpu)
 {
 	u64 reg = __vcpu_sys_reg(vcpu, PMOVSSET_EL0);
 
@@ -296,8 +296,14 @@ bool kvm_pmu_should_notify_user(struct kvm_vcpu *vcpu)
 {
 	struct kvm_sync_regs *sregs = &vcpu->run->s.regs;
 	bool run_level = sregs->device_irq_level & KVM_ARM_DEV_PMU;
+	bool overflow;
 
-	return kvm_pmu_overflow_status(vcpu) != run_level;
+	if (kvm_pmu_is_partitioned(vcpu->kvm))
+		overflow = kvm_pmu_part_overflow_status(vcpu);
+	else
+		overflow = kvm_pmu_emul_overflow_status(vcpu);
+
+	return overflow != run_level;
 }
 
 /*
@@ -400,7 +406,7 @@ static void kvm_pmu_perf_overflow(struct perf_event *perf_event,
 		kvm_pmu_counter_increment(vcpu, BIT(idx + 1),
 					  ARMV8_PMUV3_PERFCTR_CHAIN);
 
-	if (kvm_pmu_overflow_status(vcpu)) {
+	if (kvm_pmu_emul_overflow_status(vcpu)) {
 		kvm_make_request(KVM_REQ_IRQ_PENDING, vcpu);
 
 		if (!in_nmi())
diff --git a/arch/arm64/kvm/pmu.c b/arch/arm64/kvm/pmu.c
index a8214ab52fcb5..4a3c6600b2678 100644
--- a/arch/arm64/kvm/pmu.c
+++ b/arch/arm64/kvm/pmu.c
@@ -409,12 +409,18 @@ u64 kvm_pmu_evtyper_mask(struct kvm *kvm)
 static void kvm_pmu_update_state(struct kvm_vcpu *vcpu)
 {
 	struct kvm_pmu *pmu = &vcpu->arch.pmu;
+	bool overflow;
 
 	if (unlikely(!irqchip_in_kernel(vcpu->kvm)))
 		return;
 
+	if (kvm_pmu_is_partitioned(vcpu->kvm))
+		overflow = kvm_pmu_part_overflow_status(vcpu);
+	else
+		overflow = kvm_pmu_emul_overflow_status(vcpu);
+
 	WARN_ON(kvm_vgic_inject_irq(vcpu->kvm, vcpu, pmu->irq_num,
-				    kvm_pmu_overflow_status(vcpu), pmu));
+				    overflow, pmu));
 }
 
 /**
diff --git a/include/kvm/arm_pmu.h b/include/kvm/arm_pmu.h
index 955f142a41b94..428a609eaf1a7 100644
--- a/include/kvm/arm_pmu.h
+++ b/include/kvm/arm_pmu.h
@@ -91,6 +91,8 @@ bool kvm_set_pmuserenr(u64 val);
 void kvm_vcpu_pmu_restore_guest(struct kvm_vcpu *vcpu);
 void kvm_vcpu_pmu_restore_host(struct kvm_vcpu *vcpu);
 void kvm_vcpu_pmu_resync_el0(void);
+bool kvm_pmu_emul_overflow_status(struct kvm_vcpu *vcpu);
+bool kvm_pmu_part_overflow_status(struct kvm_vcpu *vcpu);
 
 #define kvm_vcpu_has_pmu(vcpu)					\
 	(vcpu_has_feature(vcpu, KVM_ARM_VCPU_PMU_V3))
-- 
2.56.0.rc1.310.g51773c2048-goog


