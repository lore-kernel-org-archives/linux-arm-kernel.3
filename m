Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AEDBFF885A
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 May 2026 21:19:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BCrq3V77MhQdmPRoJ9FxVuhSDGit6Nv3jKM6DslS2rc=; b=RWNK/JZvSv3qsKGCRooWpv4yLg
	g3yEoa6xGiosrIukPCRcg8O53D7Apo9hUQYmqu/LNVIBJg02Y8qRyyEPyOv2pC/NvMLs0NcQvA7jP
	ofKH7aBNTCCqW3uUCchtdJvsRO6a0Bb3z5etg2bWJYy1IhZZ4pa7mdJfnaLGnVmMhRmcA/a9Yh+BA
	AjQJsDMH+hXNmBzRA7UbeDg1HUn1avFVWNyqMio57SX6+GA3tx8PmetLSywJU/Onp37Nnp4owqt7v
	7hjJHeFRfiPQKmHbSi0IIZ5/blmjwqS/a00Sc5umewj2IlOxURd1cGCNovbr1M5PEPgMCGVOUVWJ7
	57NI0EcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wK0gm-0000000ELip-1jGF;
	Mon, 04 May 2026 21:18:52 +0000
Received: from mail-ot1-x34a.google.com ([2607:f8b0:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wK0gk-0000000ELbo-27FR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 May 2026 21:18:51 +0000
Received: by mail-ot1-x34a.google.com with SMTP id 46e09a7af769-7dce437f1a1so10992676a34.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 04 May 2026 14:18:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777929528; x=1778534328; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=BCrq3V77MhQdmPRoJ9FxVuhSDGit6Nv3jKM6DslS2rc=;
        b=AHD3ATR7OQv29aCDS5yRq4GfeNgdBkr1970Vgp+zm9kaDToGz7Up91f19ixAqVGIF2
         Qw9QmDoerA5PmMO8X9ppd/YoZsBokgRMckYbnoQixgPpZTPmGW/iM0FK9Io1bNvpKgPS
         VS/jX9DgbwR7MX+uJZUkjIkMpAUI2mHgWTlKIAVlKPaUwzO+amFOzygNHqbwIOfWCsEj
         0+BTg3QpbwKQXkoV6c5k14hitJRd1PhNiC7S5LFc6NB5vqOWm0JjDMkr/r3T56bbyKQj
         9Qcwu9Bd7Od9aYkRJDdAhjI1pMiUAboyc4S7MOhbv/3E4oQrH3gEPBdw6tKWMyYZoEQi
         eJ4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777929528; x=1778534328;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BCrq3V77MhQdmPRoJ9FxVuhSDGit6Nv3jKM6DslS2rc=;
        b=tJvM3VWinm6hzolpZ0XvdeSXfBe94FgreFMF5ydGfDyA0KEFny8MwOjjGRfuOrzyyj
         8Zvl0gvQcqTTnk3VxDq1SEg8y1LQu8U4p3kDKpGdOQOJwhbM3efQkVN7LHGUv9Pvh+7D
         xtcmq8lNdCVdMF3dvi9jVHPeSdTLDEqD7E3JcuRBb/XxLxCzfZQnNGaoBhIQDi8SmbAs
         PmiZi+VSJPGpHVP8Js/yUfiUpFm5a1rlfkyLqXfmnBOJuCGMxEOnKivxoiwzIUkNS3Lx
         Ap0W+Npm7TpCeSEtPneR/t5/IDlMjaj1i8rq37hQRHqruzm0Cpa34IOKNIZZhTox9vMU
         ifBQ==
X-Forwarded-Encrypted: i=1; AFNElJ/DIUIHI5SzZI+PcWTt1fOBSDQBlQfDUcOTfbWbxn1q/XQoyvN96k9v3DXKeh00ehgeC++XaW1Orsq362EVuCCT@lists.infradead.org
X-Gm-Message-State: AOJu0YxwBPe6Ri4MijvKjyUnal2todzwK9Q1/BVHGaT8rsA3InsdvgzP
	PFqxoTGiakRNAGh/wSkfCjRkYOPWkaqnUBDljLlp5qgXGLMW3bg0uc9Wg1k4lyJPmkkZYK1vIY2
	tTW4JDGWAVtjk320xEN9W+D6ELQ==
X-Received: from ilvd7.prod.google.com ([2002:a05:6e02:2147:b0:4fc:3ae9:bfd8])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6820:6ac3:b0:694:8cb0:4ef8 with SMTP id 006d021491bc7-696979ad636mr5118080eaf.9.1777929527969;
 Mon, 04 May 2026 14:18:47 -0700 (PDT)
Date: Mon,  4 May 2026 21:18:08 +0000
In-Reply-To: <20260504211813.1804997-1-coltonlewis@google.com>
Mime-Version: 1.0
References: <20260504211813.1804997-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
Message-ID: <20260504211813.1804997-16-coltonlewis@google.com>
Subject: [PATCH v7 15/20] perf: arm_pmuv3: Handle IRQs for Partitioned PMU
 guest counters
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
X-CRM114-CacheID: sfid-20260504_141850_563121_6506B1D4 
X-CRM114-Status: GOOD (  21.27  )
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

Because ARM hardware is not yet capable of direct PPI injection into
guests, guest counters will still trigger interrupts that need to be
handled by the host PMU interrupt handler. Clear the overflow flags in
hardware to handle the interrupt as normal, but the virtual overflow
register for later injecting the interrupt into the guest.

Signed-off-by: Colton Lewis <coltonlewis@google.com>
---
 arch/arm/include/asm/arm_pmuv3.h   |  6 ++++++
 arch/arm64/include/asm/arm_pmuv3.h |  5 +++++
 arch/arm64/kvm/pmu-direct.c        | 22 ++++++++++++++++++++++
 drivers/perf/arm_pmuv3.c           | 24 +++++++++++++++++-------
 include/kvm/arm_pmu.h              |  3 +++
 5 files changed, 53 insertions(+), 7 deletions(-)

diff --git a/arch/arm/include/asm/arm_pmuv3.h b/arch/arm/include/asm/arm_pmuv3.h
index eebc89bdab7a1..0d01508c5b77f 100644
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
@@ -239,6 +244,7 @@ static inline u64 kvm_pmu_host_counter_mask(struct arm_pmu *pmu)
 {
 	return ~0;
 }
+static inline void kvm_pmu_handle_guest_irq(struct arm_pmu *pmu, u64 pmovsr) {}
 
 /* PMU Version in DFR Register */
 #define ARMV8_PMU_DFR_VER_NI        0
diff --git a/arch/arm64/include/asm/arm_pmuv3.h b/arch/arm64/include/asm/arm_pmuv3.h
index 27c4d6d47da31..69ff4d014bf39 100644
--- a/arch/arm64/include/asm/arm_pmuv3.h
+++ b/arch/arm64/include/asm/arm_pmuv3.h
@@ -110,6 +110,11 @@ static inline void write_pmintenset(u64 val)
 	write_sysreg(val, pmintenset_el1);
 }
 
+static inline u64 read_pmintenset(void)
+{
+	return read_sysreg(pmintenset_el1);
+}
+
 static inline void write_pmintenclr(u64 val)
 {
 	write_sysreg(val, pmintenclr_el1);
diff --git a/arch/arm64/kvm/pmu-direct.c b/arch/arm64/kvm/pmu-direct.c
index 881cea5117515..535b4c492ff80 100644
--- a/arch/arm64/kvm/pmu-direct.c
+++ b/arch/arm64/kvm/pmu-direct.c
@@ -411,3 +411,25 @@ void kvm_pmu_put(struct kvm_vcpu *vcpu)
 	kvm_pmu_set_guest_counters(pmu, 0);
 	preempt_enable();
 }
+
+/**
+ * kvm_pmu_handle_guest_irq() - Record IRQs in guest counters
+ * @pmu: PMU to check for overflows
+ * @pmovsr: Overflow flags reported by driver
+ *
+ * Set overflow flags in guest-reserved counters in the VCPU register
+ * for the guest to clear later.
+ */
+void kvm_pmu_handle_guest_irq(struct arm_pmu *pmu, u64 pmovsr)
+{
+	struct kvm_vcpu *vcpu = kvm_get_running_vcpu();
+	u64 mask = kvm_pmu_guest_counter_mask(pmu);
+	u64 govf = pmovsr & mask;
+
+	write_pmovsclr(govf);
+
+	if (!vcpu)
+		return;
+
+	__vcpu_rmw_sys_reg(vcpu, PMOVSSET_EL0, |=, govf);
+}
diff --git a/drivers/perf/arm_pmuv3.c b/drivers/perf/arm_pmuv3.c
index 6e447227d801f..16e3700dca645 100644
--- a/drivers/perf/arm_pmuv3.c
+++ b/drivers/perf/arm_pmuv3.c
@@ -774,16 +774,15 @@ static void armv8pmu_disable_event_irq(struct perf_event *event)
 	armv8pmu_disable_intens(BIT(event->hw.idx));
 }
 
-static u64 armv8pmu_getreset_flags(void)
+static u64 armv8pmu_getovf_flags(void)
 {
 	u64 value;
 
 	/* Read */
 	value = read_pmovsclr();
 
-	/* Write to clear flags */
-	value &= ARMV8_PMU_CNT_MASK_ALL;
-	write_pmovsclr(value);
+	/* Only report interrupt enabled counters. */
+	value &= read_pmintenset();
 
 	return value;
 }
@@ -897,16 +896,17 @@ static void read_branch_records(struct pmu_hw_events *cpuc,
 
 static irqreturn_t armv8pmu_handle_irq(struct arm_pmu *cpu_pmu)
 {
-	u64 pmovsr;
 	struct perf_sample_data data;
 	struct pmu_hw_events *cpuc = this_cpu_ptr(cpu_pmu->hw_events);
 	struct pt_regs *regs;
+	u64 host_set = kvm_pmu_host_counter_mask(cpu_pmu);
+	u64 pmovsr;
 	int idx;
 
 	/*
-	 * Get and reset the IRQ flags
+	 * Get the IRQ flags
 	 */
-	pmovsr = armv8pmu_getreset_flags();
+	pmovsr = armv8pmu_getovf_flags();
 
 	/*
 	 * Did an overflow occur?
@@ -914,6 +914,12 @@ static irqreturn_t armv8pmu_handle_irq(struct arm_pmu *cpu_pmu)
 	if (!armv8pmu_has_overflowed(pmovsr))
 		return IRQ_NONE;
 
+	/*
+	 * Guest flag reset is handled the kvm hook at the bottom of
+	 * this function.
+	 */
+	write_pmovsclr(pmovsr & host_set);
+
 	/*
 	 * Handle the counter(s) overflow(s)
 	 */
@@ -955,6 +961,10 @@ static irqreturn_t armv8pmu_handle_irq(struct arm_pmu *cpu_pmu)
 		 */
 		perf_event_overflow(event, &data, regs);
 	}
+
+	if (kvm_pmu_is_partitioned(cpu_pmu))
+		kvm_pmu_handle_guest_irq(cpu_pmu, pmovsr);
+
 	armv8pmu_start(cpu_pmu);
 
 	return IRQ_HANDLED;
diff --git a/include/kvm/arm_pmu.h b/include/kvm/arm_pmu.h
index 0de63cc48fef9..de058a5347d18 100644
--- a/include/kvm/arm_pmu.h
+++ b/include/kvm/arm_pmu.h
@@ -95,6 +95,7 @@ void kvm_vcpu_pmu_resync_el0(void);
 	(vcpu_has_feature(vcpu, KVM_ARM_VCPU_PMU_V3))
 
 bool kvm_pmu_is_partitioned(struct arm_pmu *pmu);
+void kvm_pmu_handle_guest_irq(struct arm_pmu *pmu, u64 pmovsr);
 
 u8 kvm_pmu_guest_num_counters(struct kvm_vcpu *vcpu);
 u8 kvm_pmu_hpmn(struct kvm_vcpu *vcpu);
@@ -290,6 +291,8 @@ static inline u64 kvm_pmu_guest_counter_mask(void *kvm)
 	return 0;
 }
 
+static inline void kvm_pmu_handle_guest_irq(struct arm_pmu *pmu, u64 pmovsr) {}
+
 #endif
 
 #endif
-- 
2.54.0.545.g6539524ca2-goog


