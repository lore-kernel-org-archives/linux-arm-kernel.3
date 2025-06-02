Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2EBAC5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Jun 2025 20:03:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pIieb9nvj3js/0lbP2t4ZJLM8sYLAoNuXbgaxM7clWY=; b=hiHJ/c63rU+H2K3yMtLnjsOQjo
	yRoV4CkcelZRF9h/sMJemf9hK+LbQYByGRgn3suHQVWOppK0dsu/pLkETlVxoBg7kWJEidG5L+OW2
	bD+k6XvOW6faKRNw0sBER+m6LPMjG+08sMCdp7LVhkBdmb6wk7hxnCYsJw+aeOUGh+RBniQW1oDKF
	EZgX0B9PnJrVhmufgIBrB2gAJqtmXX6k9Bsw2yW2j4qlzLqn0M5egGuY7PGpRvPmHI3YL1LusyEYD
	9VLZdYxaXQv9+CN79/pL9EJuqliRVJ+6Q8mU7roSgQbkzi4Pe3Tp6n/AEtpuLnWClcvOHbqTzcRUO
	gC6w2y7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMBNC-00000008fGh-3ItN;
	Mon, 02 Jun 2025 20:03:06 +0000
Received: from mail-il1-x14a.google.com ([2607:f8b0:4864:20::14a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMAqP-00000008UM8-19kd
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Jun 2025 19:29:14 +0000
Received: by mail-il1-x14a.google.com with SMTP id e9e14a558f8ab-3ddb4a7b36dso11242985ab.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Jun 2025 12:29:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748892552; x=1749497352; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=pIieb9nvj3js/0lbP2t4ZJLM8sYLAoNuXbgaxM7clWY=;
        b=etSL8WROeLXVXZMhLWrFoyN6GKKxz8rjV+eqmVb47qec8GCtcSii6Ju40xJvEfNVVA
         kp96aoARjZz0nSVYrvtfOcavxBKYZVyhhO9pY4aQncIDVApMeDcVomwKhrpUJDrhJ8qV
         /MrGPlvGedfJaDkn/0e4gXaEC7p7S2cVCDJvNnIjdbbVmgkiK5UoSbhHR7vDGlWI38Bw
         VGk4kY7eAauGgMTFzEi07QGmFeHokvJcDgo1MVhxJ3maLNYvCFzqFDu1f17EmO5F7kCB
         mFPMAmZm7nTcqmWGW+kuWtI5NekhA5F11Px/aKqaVrVFsE/3rK8sumlqpcU/wflAcxeZ
         uU3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748892552; x=1749497352;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pIieb9nvj3js/0lbP2t4ZJLM8sYLAoNuXbgaxM7clWY=;
        b=C+eM1RJTRvyGiQJFv+1luWhUdBnj27kK5WZSM1Iv+EvdPGbkPlGITenNdaPBs+esAQ
         u/nYgAX2m9EItdOpnxSlW+8cANA+Qi+d5WR0IGvo2vl+OBMjb2nm7e38+Cw9XBvITTpm
         P/4i/gvUsWMgTaKqEo4cxfSstaybIeK3b00QqhUR9jxMreUsAYtLDbneS21UyHXLQJWa
         S1QwBFgQO0lxrq5vuLeJU/z3CHF17OtwumsG7CtvUofKy2HN6FuzDA/Oj0gHL8zRdyhz
         LYYn6Wt2ROcMr0GiJsP5mFC8Mzj7QoIzweigFpAiNtyPBHAwxcaoyleD7FrA87leyMme
         N6HA==
X-Forwarded-Encrypted: i=1; AJvYcCUeaBw1fZj+eZ+NDPzTHFYiM0aZEG1TzrubquA/gVrrSUXbUhf5izYcuJ4YH8O5F3JhOI84S9iAS9C+FarT6Wcp@lists.infradead.org
X-Gm-Message-State: AOJu0YyVPAzWg48U39zFSwoHcDeqfg9igSJXuQ2egKxsn8mHVFtYeQcJ
	B7OWhz3oM1xvHYp1npmDqtLniF9k6sh9Yb9B8XkltOXUgZEXklfs45GFXb8l6zrKsok8P7TRYr5
	UOez39IoxefGSJdSyzrJGlG9mGw==
X-Google-Smtp-Source: AGHT+IFqQBQNJHZiX1hBF+LjbTaumbyKnOzaoNP3vPsriCDKKVQYIJ9OZ+1lHyJrYq4J3I7AtifVqQuuEfJTrU+N0g==
X-Received: from ilbdr4.prod.google.com ([2002:a05:6e02:3f04:b0:3dc:8616:ffc6])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6e02:2189:b0:3dc:8b57:b750 with SMTP id e9e14a558f8ab-3dda3387e2cmr94188185ab.17.1748892551894;
 Mon, 02 Jun 2025 12:29:11 -0700 (PDT)
Date: Mon,  2 Jun 2025 19:26:59 +0000
In-Reply-To: <20250602192702.2125115-1-coltonlewis@google.com>
Mime-Version: 1.0
References: <20250602192702.2125115-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.49.0.1204.g71687c7c1d-goog
Message-ID: <20250602192702.2125115-15-coltonlewis@google.com>
Subject: [PATCH 14/17] perf: pmuv3: Handle IRQs for Partitioned PMU guest counters
From: Colton Lewis <coltonlewis@google.com>
To: kvm@vger.kernel.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
	Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Mark Rutland <mark.rutland@arm.com>, 
	Shuah Khan <shuah@kernel.org>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-perf-users@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Colton Lewis <coltonlewis@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250602_122913_316055_74E327D8 
X-CRM114-Status: GOOD (  19.57  )
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

Guest counters will still trigger interrupts that need to be handled
by the host PMU interrupt handler. Clear the overflow flags in
hardware to handle the interrupt as normal, but record which guest
overflow flags were set in the virtual overflow register for later
injecting the interrupt into the guest.

Signed-off-by: Colton Lewis <coltonlewis@google.com>
---
 arch/arm/include/asm/arm_pmuv3.h |  6 ++++++
 arch/arm64/include/asm/kvm_pmu.h |  2 ++
 arch/arm64/kvm/pmu-part.c        | 17 +++++++++++++++++
 drivers/perf/arm_pmuv3.c         | 15 +++++++++++----
 4 files changed, 36 insertions(+), 4 deletions(-)

diff --git a/arch/arm/include/asm/arm_pmuv3.h b/arch/arm/include/asm/arm_pmuv3.h
index 1687b4031ec2..26e149bdc8b0 100644
--- a/arch/arm/include/asm/arm_pmuv3.h
+++ b/arch/arm/include/asm/arm_pmuv3.h
@@ -180,6 +180,11 @@ static inline void write_pmintenset(u32 val)
 	write_sysreg(val, PMINTENSET);
 }
 
+static inline u32 read_pmintenset(void)
+{
+	return read_sysreg(PMINTENSET);
+}
+
 static inline void write_pmintenclr(u32 val)
 {
 	write_sysreg(val, PMINTENCLR);
@@ -245,6 +250,7 @@ static inline u64 kvm_pmu_guest_counter_mask(struct arm_pmu *pmu)
 	return ~0;
 }
 
+static inline void kvm_pmu_handle_guest_irq(u64 govf) {}
 
 /* PMU Version in DFR Register */
 #define ARMV8_PMU_DFR_VER_NI        0
diff --git a/arch/arm64/include/asm/kvm_pmu.h b/arch/arm64/include/asm/kvm_pmu.h
index 4098d4ad03d9..4cefd9fcf52b 100644
--- a/arch/arm64/include/asm/kvm_pmu.h
+++ b/arch/arm64/include/asm/kvm_pmu.h
@@ -30,6 +30,7 @@ u64 kvm_pmu_host_counter_mask(struct arm_pmu *pmu);
 u64 kvm_pmu_guest_counter_mask(struct arm_pmu *pmu);
 void kvm_pmu_host_counters_enable(void);
 void kvm_pmu_host_counters_disable(void);
+void kvm_pmu_handle_guest_irq(u64 govf);
 
 #else
 
@@ -74,6 +75,7 @@ static inline u64 kvm_pmu_guest_counter_mask(struct arm_pmu *pmu)
 
 static inline void kvm_pmu_host_counters_enable(void) {}
 static inline void kvm_pmu_host_counters_disable(void) {}
+static inline void kvm_pmu_handle_guest_irq(u64 govf) {}
 
 #endif
 
diff --git a/arch/arm64/kvm/pmu-part.c b/arch/arm64/kvm/pmu-part.c
index 40c72caef34e..0e1a2235e992 100644
--- a/arch/arm64/kvm/pmu-part.c
+++ b/arch/arm64/kvm/pmu-part.c
@@ -319,3 +319,20 @@ void kvm_pmu_put(struct kvm_vcpu *vcpu)
 	val = read_pmintenset();
 	__vcpu_sys_reg(vcpu, PMINTENSET_EL1) = val & mask;
 }
+
+/**
+ * kvm_pmu_handle_guest_irq() - Record IRQs in guest counters
+ * @govf: Bitmask of guest overflowed counters
+ *
+ * Record IRQs from overflows in guest-reserved counters in the VCPU
+ * register for the guest to clear later.
+ */
+void kvm_pmu_handle_guest_irq(u64 govf)
+{
+	struct kvm_vcpu *vcpu = kvm_get_running_vcpu();
+
+	if (!vcpu)
+		return;
+
+	__vcpu_sys_reg(vcpu, PMOVSSET_EL0) |= govf;
+}
diff --git a/drivers/perf/arm_pmuv3.c b/drivers/perf/arm_pmuv3.c
index f447a0f10e2b..20d9b35260d9 100644
--- a/drivers/perf/arm_pmuv3.c
+++ b/drivers/perf/arm_pmuv3.c
@@ -739,6 +739,8 @@ static u64 armv8pmu_getreset_flags(void)
 
 	/* Write to clear flags */
 	value &= ARMV8_PMU_CNT_MASK_ALL;
+	/* Only reset interrupt enabled counters. */
+	value &= read_pmintenset();
 	write_pmovsclr(value);
 
 	return value;
@@ -841,6 +843,7 @@ static void armv8pmu_stop(struct arm_pmu *cpu_pmu)
 static irqreturn_t armv8pmu_handle_irq(struct arm_pmu *cpu_pmu)
 {
 	u64 pmovsr;
+	u64 govf;
 	struct perf_sample_data data;
 	struct pmu_hw_events *cpuc = this_cpu_ptr(cpu_pmu->hw_events);
 	struct pt_regs *regs;
@@ -867,19 +870,17 @@ static irqreturn_t armv8pmu_handle_irq(struct arm_pmu *cpu_pmu)
 	 * to prevent skews in group events.
 	 */
 	armv8pmu_stop(cpu_pmu);
+
 	for_each_set_bit(idx, cpu_pmu->cntr_mask, ARMPMU_MAX_HWEVENTS) {
 		struct perf_event *event = cpuc->events[idx];
 		struct hw_perf_event *hwc;
 
 		/* Ignore if we don't have an event. */
-		if (!event)
-			continue;
-
 		/*
 		 * We have a single interrupt for all counters. Check that
 		 * each counter has overflowed before we process it.
 		 */
-		if (!armv8pmu_counter_has_overflowed(pmovsr, idx))
+		if (!event || !armv8pmu_counter_has_overflowed(pmovsr, idx))
 			continue;
 
 		hwc = &event->hw;
@@ -896,6 +897,12 @@ static irqreturn_t armv8pmu_handle_irq(struct arm_pmu *cpu_pmu)
 		if (perf_event_overflow(event, &data, regs))
 			cpu_pmu->disable(event);
 	}
+
+	govf = pmovsr & kvm_pmu_guest_counter_mask(cpu_pmu);
+
+	if (kvm_pmu_is_partitioned(cpu_pmu) && govf)
+		kvm_pmu_handle_guest_irq(govf);
+
 	armv8pmu_start(cpu_pmu);
 
 	return IRQ_HANDLED;
-- 
2.49.0.1204.g71687c7c1d-goog


