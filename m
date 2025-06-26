Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3086C7EE33
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Jun 2025 22:24:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S6YI1PbJ7Kn84JnSkWupK7ZLYRCn92aoL1PXIwZUeC8=; b=U30uaulJQB++mFowHXFOY2auaE
	CxO43qqo4bWDeE0RjnBLlvOIp2erw73wNPR0ffvr3eod+4WJ0aOu4x+AzgUg3NgBWdVIheRgJJWg2
	IzK3xNmmAAVLsIJY13KMh7zjD6eKnBPyPkc1sL5y9z39fAUs+d6XlyOE1CtHie2cpc80MVrRO21yN
	kuIXXH8uYVy0faaE29xXfjGfgGVztTx1hH1DxLNut9OowD7VPcz5lWrOGHoS/5/YgMLnOeI1gDkT4
	mjbodkypHGwj+RM1GS+FlLEu4pxrM/M13QRSuZpi6KHN1tDwLYnLblyOKiWhrqdvzOUf19pvELdnU
	mKhMyTnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUv0g-0000000CvlP-33gX;
	Thu, 26 Jun 2025 22:23:58 +0000
Received: from mail-il1-x14a.google.com ([2607:f8b0:4864:20::14a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUsrM-0000000CgqO-2my7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Jun 2025 20:06:13 +0000
Received: by mail-il1-x14a.google.com with SMTP id e9e14a558f8ab-3df2d0b7c7eso14939985ab.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Jun 2025 13:06:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750968371; x=1751573171; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=S6YI1PbJ7Kn84JnSkWupK7ZLYRCn92aoL1PXIwZUeC8=;
        b=QR1ph5t6E6I6NGlhRg9SFuBKL8VTTNF8+6czeHfzvQXPjVwHprG7LdlqYojM8mxneU
         pFwO1mCwPoUajO/aCi8C0ay5o6GlVjF5vVkhL95+eKp/3erNAdB76xBaHUKxJavr8xGf
         XMhQvmCKU+mWWf9czjHM78hIZpTO+stiKmUqtwrTEh2tWkpa6S8wOybcw1OH92nCyUHn
         /h1RiFN6vTosrKkp2V5TCYqrb2pR0RGlsg0ff/tb1FF6wb4ri/9X3yd4C4U4nYcBNlHj
         iVEKN9NE0nYBZD54n2iOZTyhZtf+7ElWrFOLY213x1azksLYal2LtPYI0P2SbnlJI2fZ
         NbkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750968371; x=1751573171;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=S6YI1PbJ7Kn84JnSkWupK7ZLYRCn92aoL1PXIwZUeC8=;
        b=lReEkmYAbQkc2veXaxLYFBH6DZbjjvLmMq8wYkhBnqyMNDoDLb1TGhnNPlAyp9ZbQg
         C1rkXqZ22AsEnsTCvmjmnmycy0zV+0KsAXndhUiNHNtJ1Q5sAh4Ej3zW9gqw+7TvHla9
         TvWym0kBshqw7n7n/oBttc9rVKUUgw/CkYwNv04Wi6Bb2ekNGYjoNEdQl8tmbWh1HtI8
         CRbfGvKKKhC2aIjds7QafJK/e+y0sp4GuuqySuP+aMQUMseZjbx/+25H9FdX7sT2s363
         fQgdVH0hhQxcGisopwCniAVtMqVG/6fWBOQI1IgS6BANtEfrNSqAzjuSLE4TRyCezaUS
         S+KQ==
X-Forwarded-Encrypted: i=1; AJvYcCWwkwDBWxlE6Uj428KKpwHJHRfPpuuyhVXxwfGZINCB3GtgYoL2Nn5+Vn7IYBbPv6aOIAOdcp9z9XX6visDHsMN@lists.infradead.org
X-Gm-Message-State: AOJu0YyFDym+Fh42CwMZPy1lQFgGKBMk3dtozTkYVIPMQbWOhabgQDV/
	Fh5WstjPg/TA90QZNfDZT+R7SWYRuWz6HqbNJkCITCNMIticeyGrDPS6ic0hmgs1MIG1Sw/QNWe
	uALaftDdiuqgVpJHtH9V2ASHDVA==
X-Google-Smtp-Source: AGHT+IHJUkjGyGvNcWxAAAjfiD6q7g9phykRry/HcdOfgoIUsGWYJ5QzPA0/oIz6lali1a+s4FtxtR3CCKpC4TGpWw==
X-Received: from ilbbb14.prod.google.com ([2002:a05:6e02:e:b0:3df:38c1:b314])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6e02:154a:b0:3de:25cb:42c2 with SMTP id e9e14a558f8ab-3df4acdd094mr10972865ab.18.1750968371417;
 Thu, 26 Jun 2025 13:06:11 -0700 (PDT)
Date: Thu, 26 Jun 2025 20:04:55 +0000
In-Reply-To: <20250626200459.1153955-1-coltonlewis@google.com>
Mime-Version: 1.0
References: <20250626200459.1153955-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
Message-ID: <20250626200459.1153955-20-coltonlewis@google.com>
Subject: [PATCH v3 19/22] perf: arm_pmuv3: Handle IRQs for Partitioned PMU
 guest counters
From: Colton Lewis <coltonlewis@google.com>
To: kvm@vger.kernel.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
	Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Mingwei Zhang <mizhang@google.com>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Mark Rutland <mark.rutland@arm.com>, Shuah Khan <shuah@kernel.org>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-perf-users@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Colton Lewis <coltonlewis@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_130612_707301_F07C47B8 
X-CRM114-Status: GOOD (  15.60  )
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
 drivers/perf/arm_pmuv3.c         |  9 +++++++++
 4 files changed, 34 insertions(+)

diff --git a/arch/arm/include/asm/arm_pmuv3.h b/arch/arm/include/asm/arm_pmuv3.h
index 5f6269039f44..36638efe4258 100644
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
@@ -249,6 +254,7 @@ static inline u64 kvm_pmu_guest_counter_mask(struct arm_pmu *pmu)
 	return ~0;
 }
 
+static inline void kvm_pmu_handle_guest_irq(u64 govf) {}
 
 static inline bool has_vhe(void)
 {
diff --git a/arch/arm64/include/asm/kvm_pmu.h b/arch/arm64/include/asm/kvm_pmu.h
index 4f0741bf6779..03e3bd318e4b 100644
--- a/arch/arm64/include/asm/kvm_pmu.h
+++ b/arch/arm64/include/asm/kvm_pmu.h
@@ -95,6 +95,7 @@ u64 kvm_pmu_host_counter_mask(struct arm_pmu *pmu);
 u64 kvm_pmu_guest_counter_mask(struct arm_pmu *pmu);
 void kvm_pmu_host_counters_enable(void);
 void kvm_pmu_host_counters_disable(void);
+void kvm_pmu_handle_guest_irq(u64 govf);
 
 u8 kvm_pmu_guest_num_counters(struct kvm_vcpu *vcpu);
 u8 kvm_pmu_hpmn(struct kvm_vcpu *vcpu);
@@ -291,6 +292,7 @@ static inline u64 kvm_pmu_guest_counter_mask(struct arm_pmu *pmu)
 
 static inline void kvm_pmu_host_counters_enable(void) {}
 static inline void kvm_pmu_host_counters_disable(void) {}
+static inline void kvm_pmu_handle_guest_irq(u64 govf) {}
 
 #endif
 
diff --git a/arch/arm64/kvm/pmu-part.c b/arch/arm64/kvm/pmu-part.c
index 1451870757e1..bd04c37b19b9 100644
--- a/arch/arm64/kvm/pmu-part.c
+++ b/arch/arm64/kvm/pmu-part.c
@@ -338,3 +338,20 @@ void kvm_pmu_put(struct kvm_vcpu *vcpu)
 	val = read_pmintenset();
 	__vcpu_assign_sys_reg(vcpu, PMINTENSET_EL1, val & mask);
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
+	__vcpu_rmw_sys_reg(vcpu, PMOVSSET_EL0, |=, govf);
+}
diff --git a/drivers/perf/arm_pmuv3.c b/drivers/perf/arm_pmuv3.c
index 5836672a3dd9..dba7dcee8258 100644
--- a/drivers/perf/arm_pmuv3.c
+++ b/drivers/perf/arm_pmuv3.c
@@ -750,6 +750,8 @@ static u64 armv8pmu_getreset_flags(void)
 
 	/* Write to clear flags */
 	value &= ARMV8_PMU_CNT_MASK_ALL;
+	/* Only reset interrupt enabled counters. */
+	value &= read_pmintenset();
 	write_pmovsclr(value);
 
 	return value;
@@ -852,6 +854,7 @@ static void armv8pmu_stop(struct arm_pmu *cpu_pmu)
 static irqreturn_t armv8pmu_handle_irq(struct arm_pmu *cpu_pmu)
 {
 	u64 pmovsr;
+	u64 govf;
 	struct perf_sample_data data;
 	struct pmu_hw_events *cpuc = this_cpu_ptr(cpu_pmu->hw_events);
 	struct pt_regs *regs;
@@ -906,6 +909,12 @@ static irqreturn_t armv8pmu_handle_irq(struct arm_pmu *cpu_pmu)
 		 */
 		perf_event_overflow(event, &data, regs);
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
2.50.0.727.gbf7dc18ff4-goog


