Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2AB9CD98CE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Jun 2026 19:48:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ffaCtse8d32sUz83GD9kE1zbC59Hof3u/dSFHSfc7mE=; b=mSc6tZ6ZTR7d13kMr+JnhdmHUK
	UiTz38aRnWhu8TbrlOid4K3M0tm7TWMOi94BTNfQ7SriZCPbXJDV87XB5o0eYTCjYLHY0xuHHdA58
	wuzE0dP7WyLdc52yR0VSNY8sd472CEdb8j4nqGDH015e7pPLi/4nxTxIonaMYLn0THOj9BCbsdYnc
	4l77oMmD7Rg1xcphHr3oBJfE62/5/e3AoJVf0wP3dHfqs1J37pY2X3LYhU0ZTRmh3JvVsFLvAztbG
	bA0wuIqBAswesJ/7iDDTq30dVUFzudHfZHPV6t//lCwIk1zOsLpAVuC2e2w8wkKjgT2McIfzC9yUR
	30NniDGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY7ZP-0000000BSiQ-2tTM;
	Fri, 12 Jun 2026 19:29:35 +0000
Received: from mail-ot1-x34a.google.com ([2607:f8b0:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY7ZH-0000000BSV5-2CoC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Jun 2026 19:29:28 +0000
Received: by mail-ot1-x34a.google.com with SMTP id 46e09a7af769-7e6d78299e9so2580538a34.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Jun 2026 12:29:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781292565; x=1781897365; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ffaCtse8d32sUz83GD9kE1zbC59Hof3u/dSFHSfc7mE=;
        b=F5U5ucI+1A6tP3uN2ihENDZk3Y4ZsbdK17LbEVvKTsRFkNezZs8pyLhMrBYrN7ouA9
         oZqd8GXzoUuvRQwpxxj5mO+YhrmoKVdRKRDbkMN+zJKm2U7mqeu1sRYnIGlw+bpbFj9q
         fdgPDnpVUUz+/1lNI6E9R9oQH0HONabRML3UYiQHCGElZq5A0WaIP2/glOztLHRpbW6a
         OhJ0O8q9QLji+h+iQKj5FoKtRwsnHbOXHwy2S0fnh1G8NXP+FE9O3R4FJFu+g1ZQsXpi
         MwoDRDp0/RkRevaL6ElT1M1IS4IoHY9qckww9w3v8NWQS9lJ/kgMsYsZ5UvcxZCJSZHo
         fknA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781292565; x=1781897365;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ffaCtse8d32sUz83GD9kE1zbC59Hof3u/dSFHSfc7mE=;
        b=AKVuaKdvnkJ98qamGOqlJNSiP2L9WXIita4OzNph2Wbe1AZAgX/KbaJXCtqrwcChoh
         nXKeeK65XQJIoTTMU36YPwA2GLwInnWrwpnnzwZoc2yl74jzQfE8vTEYLebvbQ232wJK
         I+GoQiVhtbGGgPmxBhQ7y8GOoagvXEorFCQY4CA6s2BAfUZzKdijZKvfu6jGuLAphUKT
         ZPIQ4mswomFakQL+bAvs/D2m7OcPu9bqO9LLDcdFHIE1Du5Dy3y4QsQtJMmkjlhRDm9j
         QfNY709p57ofnb2qACROhm0s5KFKiuMD+p1l08R5NpZbKdAQ69hJszRpmq2FXeuOdEUX
         7EqA==
X-Forwarded-Encrypted: i=1; AFNElJ/a4vaQZWamv3Brxfl9vsaK5M0lZa7zmt+f9NCCJ26KCbuivBNjl9FBYykptc2UUwsroJHsk64zaUjc6uTqKERD@lists.infradead.org
X-Gm-Message-State: AOJu0YwLZsvUMcuK5hiZq1Gvr4XuXiPeP+fg3J5fGeHXGnjzESrzXA2Z
	L5zidliANl3PvRW9Cx7dSit7iTeKoXdB35ghO4JQW37ilwQ8rfVJGwNTa2PXZjTz2/JlyHZVB4d
	hOE7hRdyjHTKZEh59V1yw5IsjKQ==
X-Received: from ilbcl18.prod.google.com ([2002:a05:6e02:3792:b0:4fa:269e:802])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:1b2a:b0:486:79ad:970e with SMTP id 5614622812f47-4872f389689mr2647217b6e.13.1781292565256;
 Fri, 12 Jun 2026 12:29:25 -0700 (PDT)
Date: Fri, 12 Jun 2026 19:29:04 +0000
In-Reply-To: <20260612192909.1153907-1-coltonlewis@google.com>
Mime-Version: 1.0
References: <20260612192909.1153907-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.54.0.1136.gdb2ca164c4-goog
Message-ID: <20260612192909.1153907-17-coltonlewis@google.com>
Subject: [PATCH 16/21] perf: arm_pmuv3: Handle IRQs for Partitioned PMU guest counters
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
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_122927_592823_D095BCDF 
X-CRM114-Status: GOOD (  21.38  )
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
hardware to handle the interrupt as normal, but update the virtual overflow register for later injecting the interrupt into the guest.

Signed-off-by: Colton Lewis <coltonlewis@google.com>
---
 arch/arm/include/asm/arm_pmuv3.h   |  6 ++++++
 arch/arm64/include/asm/arm_pmuv3.h |  5 +++++
 arch/arm64/kvm/pmu-direct.c        | 22 ++++++++++++++++++++++
 drivers/perf/arm_pmuv3.c           | 24 +++++++++++++++++-------
 include/kvm/arm_pmu.h              |  3 +++
 5 files changed, 53 insertions(+), 7 deletions(-)

diff --git a/arch/arm/include/asm/arm_pmuv3.h b/arch/arm/include/asm/arm_pmuv3.h
index f6031bd522718..896fc5d6add0c 100644
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
index bb1f3dca03869..64f40cfb31012 100644
--- a/arch/arm64/kvm/pmu-direct.c
+++ b/arch/arm64/kvm/pmu-direct.c
@@ -405,3 +405,25 @@ void kvm_pmu_set_guest_owned(struct kvm_vcpu *vcpu)
 		kvm_arm_setup_mdcr_el2(vcpu);
 	}
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
index c187397134990..6ab15a5209608 100644
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
+	if (pmu_is_partitioned(cpu_pmu))
+		kvm_pmu_handle_guest_irq(cpu_pmu, pmovsr);
+
 	armv8pmu_start(cpu_pmu);
 
 	return IRQ_HANDLED;
diff --git a/include/kvm/arm_pmu.h b/include/kvm/arm_pmu.h
index b77ddb94dc99b..25163a689ae80 100644
--- a/include/kvm/arm_pmu.h
+++ b/include/kvm/arm_pmu.h
@@ -106,6 +106,7 @@ u64 kvm_pmu_guest_counter_mask(struct arm_pmu *pmu);
 void kvm_pmu_load(struct kvm_vcpu *vcpu);
 void kvm_pmu_put(struct kvm_vcpu *vcpu);
 void kvm_pmu_set_guest_owned(struct kvm_vcpu *vcpu);
+void kvm_pmu_handle_guest_irq(struct arm_pmu *pmu, u64 pmovsr);
 
 #define kvm_pmu_get_access(vcpu)	((vcpu)->arch.pmu.access)
 
@@ -274,6 +275,8 @@ static inline u64 kvm_pmu_guest_counter_mask(void *kvm)
 	return 0;
 }
 
+static inline void kvm_pmu_handle_guest_irq(struct arm_pmu *pmu, u64 pmovsr) {}
+
 #endif
 
 #endif
-- 
2.54.0.1136.gdb2ca164c4-goog


