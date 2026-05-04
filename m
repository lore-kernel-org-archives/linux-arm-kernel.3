Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 496C4CD342F
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 May 2026 21:18:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ikJw7Yl21sbWiTQZxDvWwtZnXGp+jw2m9ITCB7brm+8=; b=IBZLKTSR4MH5+J5BgdrBE0GKDI
	AGITw9pHeTrLSze0UJtVJ+9RWYA/GXxPdYDebO4U4ci1ioZePbf2yOJ1XV2jmQAHSfG59e6AZbzfS
	GJDNBzyIm5QmO1yg0xEpoG803/jvTCjxnXjfCvswfiMMrGv438jOM9VowVc3w0OFgSjpCBvuJ96Ui
	stOwP6LnU50HXXS7lwtIxvKYm4hhVLShAR54peTfcbY7mm18GsepNTqOoWU60EnprwR0Uk0m5Zrcw
	aWnv+XN8bq1sggp2Rdi4AW0rCbqu0x5PNLsLl/yRQzB0TLDhYqeFeaj06PwnzBR26O7J8hS45Kn4X
	d4TQBIRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wK0gg-0000000ELYg-3n4C;
	Mon, 04 May 2026 21:18:46 +0000
Received: from mail-oo1-xc4a.google.com ([2607:f8b0:4864:20::c4a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wK0gd-0000000ELRa-3lQN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 May 2026 21:18:45 +0000
Received: by mail-oo1-xc4a.google.com with SMTP id 006d021491bc7-66308f16ea1so7837570eaf.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 04 May 2026 14:18:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777929523; x=1778534323; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ikJw7Yl21sbWiTQZxDvWwtZnXGp+jw2m9ITCB7brm+8=;
        b=cuaWUhA19+3oXX29QKimBh13bBT7/lMwZMN2NlEkunwjHAqVXlXPMzP3rLpppbc8L6
         zBa8p3hln1y9pmVrUXnN+yhIXoSTYHk3WagEKGUufEg+rY6n0GZK7OF6xUHqxqNViqKm
         z+QlfuxWsuWaCL4ICW9wDK65gF1N45W4QvUXAA+DdfUoifY2uOlpw5mmRRF4PD1ixt+m
         yeX2pXXMnNNrqgZ1hWrVCovGCnAmovi1qSxAC4OwC1nV+dAN+hIkepAIOiWRb7aGPpl1
         jiQy1uGdLseUOM7g7ut3P9yNkeSiLzqUSllmljvqTdd2wDjjpJA0mInCt6yuujM59wKp
         z2yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777929523; x=1778534323;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ikJw7Yl21sbWiTQZxDvWwtZnXGp+jw2m9ITCB7brm+8=;
        b=SPAssO9c2syJ6NT8Ut182yv4J8/lFuF8vOyDfNuqpJQz9rn7h1qe69HraQ18SosZMi
         iJQ5NUgLzzLn6HN5DriK8IZA/JL8GCxeLhvVyJYbnCeftQ2zJcNeFaowvBSeNLADn6lj
         fmMwygE0DKT/d2BpUEIdvxcfVJzlQyKkl8Qo3qJlSp8/p8o4bdwUD3hqGRSmn5Osfe/i
         S4aeywvEs+Lf6jjcYwP86Za5MJDuykS+UduiyQAxgD82r65WsHeImrWgJKLrpsQWsEyT
         hj3Z1H8qWowqeP01Lun2ckAEXc25ETJ9eQFLkxT+5/4fOEDkFJfCl/KFcvYSzkfVt2EE
         d/gg==
X-Forwarded-Encrypted: i=1; AFNElJ9GzTU82kq3oF5OcFaR71dBULeIpdXL/93XC6hCtf6kJZOkuRZY+hO9n+3Enb2PcktQ9SBS9COlznK80oNEgwJ5@lists.infradead.org
X-Gm-Message-State: AOJu0Yz+j7UFl67HCd1pclSd2Rt34uIyDu9pmoVJUS82heqlNEKqQfAd
	3RfHySwf7Zcgrm0xyCxxPeF7U5Aw8VEiqrfI8uu8ch0gliIICTfBGoY4+kVwVqs9IX3wOvCJEgg
	q6Zij8ac3zPgjlkrkk3PJXxf08g==
X-Received: from ilaj29.prod.google.com ([2002:a05:6e02:219d:b0:4fd:6acc:4c7b])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6820:2012:b0:696:1a85:586b with SMTP id 006d021491bc7-69697c3388cmr5842328eaf.35.1777929522601;
 Mon, 04 May 2026 14:18:42 -0700 (PDT)
Date: Mon,  4 May 2026 21:18:04 +0000
In-Reply-To: <20260504211813.1804997-1-coltonlewis@google.com>
Mime-Version: 1.0
References: <20260504211813.1804997-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
Message-ID: <20260504211813.1804997-12-coltonlewis@google.com>
Subject: [PATCH v7 11/20] KVM: arm64: Enforce PMU event filter at vcpu_load()
From: Colton Lewis <coltonlewis@google.com>
To: kvm@vger.kernel.org
Cc: Alexandru Elisei <alexandru.elisei@arm.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Jonathan Corbet <corbet@lwn.net>, Russell King <linux@armlinux.org.uk>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Mingwei Zhang <mizhang@google.com>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Mark Rutland <mark.rutland@arm.com>, 
	Shuah Khan <shuah@kernel.org>, Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>, 
	James Clark <james.clark@linaro.org>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-perf-users@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Colton Lewis <coltonlewis@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260504_141843_943647_3FEE8B81 
X-CRM114-Status: GOOD (  17.01  )
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

The KVM API for event filtering says that counters do not count when
blocked by the event filter. To enforce that, the event filter must be
rechecked on every load since it might have changed since the last
time the guest wrote a value. If the event is filtered, exclude
counting at all exception levels before writing the hardware.

Signed-off-by: Colton Lewis <coltonlewis@google.com>
---
 arch/arm64/kvm/pmu-direct.c | 54 +++++++++++++++++++++++++++++++++++++
 1 file changed, 54 insertions(+)

diff --git a/arch/arm64/kvm/pmu-direct.c b/arch/arm64/kvm/pmu-direct.c
index 360d022d918d5..2252d3b905db9 100644
--- a/arch/arm64/kvm/pmu-direct.c
+++ b/arch/arm64/kvm/pmu-direct.c
@@ -138,6 +138,59 @@ u64 kvm_pmu_guest_counter_mask(struct arm_pmu *pmu)
 	return 0;
 }
 
+/**
+ * kvm_pmu_apply_event_filter()
+ * @vcpu: Pointer to vcpu struct
+ *
+ * To uphold the guarantee of the KVM PMU event filter, we must ensure
+ * no counter counts if the event is filtered. Accomplish this by
+ * filtering all exception levels if the event is filtered.
+ */
+static void kvm_pmu_apply_event_filter(struct kvm_vcpu *vcpu)
+{
+	struct arm_pmu *pmu = vcpu->kvm->arch.arm_pmu;
+	unsigned long guest_counters;
+	u64 evtyper_set = ARMV8_PMU_EXCLUDE_EL0 |
+		ARMV8_PMU_EXCLUDE_EL1;
+	u64 evtyper_clr = ARMV8_PMU_INCLUDE_EL2;
+	bool guest_include_el2;
+	u8 i;
+	u64 val;
+	u64 evsel;
+
+	if (!pmu)
+		return;
+
+	guest_counters = kvm_pmu_guest_counter_mask(pmu);
+
+	for_each_set_bit(i, &guest_counters, ARMPMU_MAX_HWEVENTS) {
+		if (i == ARMV8_PMU_CYCLE_IDX) {
+			val = __vcpu_sys_reg(vcpu, PMCCFILTR_EL0);
+			evsel = ARMV8_PMUV3_PERFCTR_CPU_CYCLES;
+		} else {
+			val = __vcpu_sys_reg(vcpu, PMEVTYPER0_EL0 + i);
+			evsel = val & kvm_pmu_event_mask(vcpu->kvm);
+		}
+
+		guest_include_el2 = (val & ARMV8_PMU_INCLUDE_EL2);
+		val &= ~evtyper_clr;
+
+		if (unlikely(is_hyp_ctxt(vcpu)) && guest_include_el2)
+			val &= ~ARMV8_PMU_EXCLUDE_EL1;
+
+		if (vcpu->kvm->arch.pmu_filter &&
+		    !test_bit(evsel, vcpu->kvm->arch.pmu_filter))
+			val |= evtyper_set;
+
+		if (i == ARMV8_PMU_CYCLE_IDX) {
+			write_sysreg(val, pmccntr_el0);
+		} else {
+			write_sysreg(i, pmselr_el0);
+			write_sysreg(val, pmxevtyper_el0);
+		}
+	}
+}
+
 /**
  * kvm_pmu_load() - Load untrapped PMU registers
  * @vcpu: Pointer to struct kvm_vcpu
@@ -165,6 +218,7 @@ void kvm_pmu_load(struct kvm_vcpu *vcpu)
 
 	pmu = vcpu->kvm->arch.arm_pmu;
 	guest_counters = kvm_pmu_guest_counter_mask(pmu);
+	kvm_pmu_apply_event_filter(vcpu);
 
 	for_each_set_bit(i, &guest_counters, ARMPMU_MAX_HWEVENTS) {
 		val = __vcpu_sys_reg(vcpu, PMEVCNTR0_EL0 + i);
-- 
2.54.0.545.g6539524ca2-goog


