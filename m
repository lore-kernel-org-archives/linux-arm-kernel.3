Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2650C02188
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jan 2025 22:30:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pVrHE6B2dG3grFDn7LdUZxPwlglEt8pw1xMS4rCkJoc=; b=Det+eCQYDqbTcL+r3mIuZp3+MT
	tm3lQNBo2uwzy5RkYxWqGCh2WqbNQA9c0vcFxxk6782Zi1TRh1Y7jnz8x0shmF9NCg18J6Yqo1kKt
	b5miH9MHkeCo4pKXRN7y2YVkE2QGOLzhhKW58zIZ+2VreQrQhSlMGd6JQq5FG2PVSBkbQOB5FPpuA
	JEDHUKN19B7+oDU7nzxXqE9zN8J3+nsq15SmeI+HnjhaliXuuYIi/DWi3vLCS8v4H5trUKv2K0WLx
	FuMA7lQ3PArskS2FfpfA1wcT7PrpOE6brfjjX3rIC+WzF+uzOKKkGIILH/p1x9M0ZzXrY7RpvXQfd
	YhyGzDdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcXcS-00000003PUL-0KQ6;
	Mon, 27 Jan 2025 22:30:12 +0000
Received: from mail-il1-x149.google.com ([2607:f8b0:4864:20::149])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcXTU-00000003Ne8-04eN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jan 2025 22:20:57 +0000
Received: by mail-il1-x149.google.com with SMTP id e9e14a558f8ab-3ce8dadfb67so26054465ab.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Jan 2025 14:20:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738016455; x=1738621255; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=pVrHE6B2dG3grFDn7LdUZxPwlglEt8pw1xMS4rCkJoc=;
        b=Ln1WRUffXk3gW6TLtt7lrwEzhaQMbNUbQqB5LSFFNCaf0vlL7EWw0cSyGqIHD5YgG1
         k2214yqA0/WXz/0U+mKuDZUZGsZJvMedffe76A7406ofpS0kOFApIss18d3KBvxg9YA2
         Iww8eFfSfjLbzfZCJqdXFwn3WkD4v5hbWd6V8x4qmC3Kv3XMaeKX9slBBtR+zwlbQr3q
         xZWmCAhtOD/1wSLWY4MPjju4YG2Yh68Z4yhEG6OMl/GwZ3X/amsL0r/n2KIeOEeYRlpE
         mNNK61uh0fFb0BtF8uEOMLbIlS+LIsB98B9NsjSdPJ7/DBBNBRWVCGNziTdRr/y2WsSp
         urNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738016455; x=1738621255;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pVrHE6B2dG3grFDn7LdUZxPwlglEt8pw1xMS4rCkJoc=;
        b=EUe5/ZpNPSKHAAtthTLDrkxd+vWO4jkOjteprZ9ygJZkcv9E77L7cGHL24q9CorJhW
         aiHLZQWAUq/fJns5djGc6Hc54aZqPY4bdCDW15lmiLhf+MgYwf12apU5nhy40didj03A
         aRnanV7yxViWEmSpZJx5wmNsoin/KiU2s3JOEwWzGu1QWunY+DPQec2dIDCLKajYOojd
         T80gxWNwiTub8mROGpF/NutXHuQ9difYSz6ovOv5PtysP83ltaT1qMDHg0bMK9fG2Hot
         0zkfnKHREEM6eh66h0kQ92j5xZqXksC9tV9xBEPdz72JfP37bVg6XmNWUTN0lgyICTej
         wxKQ==
X-Forwarded-Encrypted: i=1; AJvYcCVxQAIQdRHgVFgqPsUNOfGC8GGzJFdZ4rl7Q8YbAuZQ5vbLtor6xD6mD+ypyWtaR1UxyueeFiL4MQ2hPNiwo/j3@lists.infradead.org
X-Gm-Message-State: AOJu0YzBAKsfN+U/tj3xTq3sON4Vi1LQVfnFubWO6X3VQHWWGlfs1NnU
	CU8MRMcu9Ao8/h0VDiMukeFOJnPvQZQFbp8P3nmvmwHSEFUnv9E0XQeqnr+vnE790R0q2ZudBGL
	aTwhKoLFx5S/cyonwQR41Mg==
X-Google-Smtp-Source: AGHT+IFtAnJ1e6Omyb95spUU2CAJPVrJ4SV5b/ores++c+WBrkG6S5co/YmSyuOwcQFNByJ0T9eGNAI5BdjlXyAtsw==
X-Received: from ilbeb27.prod.google.com ([2002:a05:6e02:461b:b0:3cf:a082:8561])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6e02:4810:b0:3cf:b3ab:584d with SMTP id e9e14a558f8ab-3cfb3ab58famr155469855ab.13.1738016455100;
 Mon, 27 Jan 2025 14:20:55 -0800 (PST)
Date: Mon, 27 Jan 2025 22:20:30 +0000
In-Reply-To: <20250127222031.3078945-1-coltonlewis@google.com>
Mime-Version: 1.0
References: <20250127222031.3078945-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.48.1.262.g85cc9f2d1e-goog
Message-ID: <20250127222031.3078945-5-coltonlewis@google.com>
Subject: [RFC PATCH 4/4] perf: arm_pmuv3: Keep out of guest counter partition
From: Colton Lewis <coltonlewis@google.com>
To: kvm@vger.kernel.org
Cc: Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Mark Rutland <mark.rutland@arm.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kvmarm@lists.linux.dev, linux-kselftest@vger.kernel.org, 
	Colton Lewis <coltonlewis@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250127_142056_058423_904E087F 
X-CRM114-Status: GOOD (  23.86  )
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

If the PMU is partitioned, keep the driver out of the guest counter
partition and only use the host counter partition. Partitioning is
defined by the MDCR_EL2.HPMN register field and saved in
cpu_pmu->hpmn. The range 0..HPMN-1 is accessible by EL1 and EL0 while
HPMN..PMCR.N is reserved for EL2.

Define some macros that take HPMN as an argument and construct
mutually exclusive bitmaps for testing which partition a particular
counter is in. Note that despite their different position in the
bitmap, the cycle and instruction counters are always in the guest
partition.

Signed-off-by: Colton Lewis <coltonlewis@google.com>
---
 drivers/perf/arm_pmuv3.c       | 72 +++++++++++++++++++++++++++++-----
 include/linux/perf/arm_pmuv3.h |  8 ++++
 2 files changed, 70 insertions(+), 10 deletions(-)

diff --git a/drivers/perf/arm_pmuv3.c b/drivers/perf/arm_pmuv3.c
index 55f9ae560715..c61845fad9d9 100644
--- a/drivers/perf/arm_pmuv3.c
+++ b/drivers/perf/arm_pmuv3.c
@@ -754,15 +754,19 @@ static void armv8pmu_disable_event_irq(struct perf_event *event)
 	armv8pmu_disable_intens(BIT(event->hw.idx));
 }
 
-static u64 armv8pmu_getreset_flags(void)
+static u64 armv8pmu_getreset_flags(struct arm_pmu *cpu_pmu)
 {
 	u64 value;
 
 	/* Read */
 	value = read_pmovsclr();
 
+	if (cpu_pmu->partitioned)
+		value &= ARMV8_PMU_HOST_CNT_PART(cpu_pmu->hpmn);
+	else
+		value &= ARMV8_PMU_OVERFLOWED_MASK;
+
 	/* Write to clear flags */
-	value &= ARMV8_PMU_OVERFLOWED_MASK;
 	write_pmovsclr(value);
 
 	return value;
@@ -789,6 +793,18 @@ static void armv8pmu_disable_user_access(void)
 	update_pmuserenr(0);
 }
 
+static bool armv8pmu_is_guest_part(struct arm_pmu *cpu_pmu, u8 idx)
+{
+	return cpu_pmu->partitioned &&
+		(BIT(idx) & ARMV8_PMU_GUEST_CNT_PART(cpu_pmu->hpmn));
+}
+
+static bool armv8pmu_is_host_part(struct arm_pmu *cpu_pmu, u8 idx)
+{
+	return !cpu_pmu->partitioned ||
+		(BIT(idx) & ARMV8_PMU_HOST_CNT_PART(cpu_pmu->hpmn));
+}
+
 static void armv8pmu_enable_user_access(struct arm_pmu *cpu_pmu)
 {
 	int i;
@@ -797,6 +813,8 @@ static void armv8pmu_enable_user_access(struct arm_pmu *cpu_pmu)
 	if (is_pmuv3p9(cpu_pmu->pmuver)) {
 		u64 mask = 0;
 		for_each_set_bit(i, cpuc->used_mask, ARMPMU_MAX_HWEVENTS) {
+			if (armv8pmu_is_guest_part(cpu_pmu, i))
+				continue;
 			if (armv8pmu_event_has_user_read(cpuc->events[i]))
 				mask |= BIT(i);
 		}
@@ -805,6 +823,8 @@ static void armv8pmu_enable_user_access(struct arm_pmu *cpu_pmu)
 		/* Clear any unused counters to avoid leaking their contents */
 		for_each_andnot_bit(i, cpu_pmu->cntr_mask, cpuc->used_mask,
 				    ARMPMU_MAX_HWEVENTS) {
+			if (armv8pmu_is_guest_part(cpu_pmu, i))
+				continue;
 			if (i == ARMV8_PMU_CYCLE_IDX)
 				write_pmccntr(0);
 			else if (i == ARMV8_PMU_INSTR_IDX)
@@ -850,7 +870,10 @@ static void armv8pmu_start(struct arm_pmu *cpu_pmu)
 		armv8pmu_disable_user_access();
 
 	/* Enable all counters */
-	armv8pmu_pmcr_write(armv8pmu_pmcr_read() | ARMV8_PMU_PMCR_E);
+	if (cpu_pmu->partitioned)
+		armv8pmu_mdcr_write(armv8pmu_mdcr_read() | ARMV8_PMU_MDCR_HPME);
+	else
+		armv8pmu_pmcr_write(armv8pmu_pmcr_read() | ARMV8_PMU_PMCR_E);
 
 	kvm_vcpu_pmu_resync_el0();
 }
@@ -858,7 +881,10 @@ static void armv8pmu_start(struct arm_pmu *cpu_pmu)
 static void armv8pmu_stop(struct arm_pmu *cpu_pmu)
 {
 	/* Disable all counters */
-	armv8pmu_pmcr_write(armv8pmu_pmcr_read() & ~ARMV8_PMU_PMCR_E);
+	if (cpu_pmu->partitioned)
+		armv8pmu_mdcr_write(armv8pmu_pmcr_read() & ~ARMV8_PMU_MDCR_HPME);
+	else
+		armv8pmu_pmcr_write(armv8pmu_pmcr_read() & ~ARMV8_PMU_PMCR_E);
 }
 
 static irqreturn_t armv8pmu_handle_irq(struct arm_pmu *cpu_pmu)
@@ -872,7 +898,7 @@ static irqreturn_t armv8pmu_handle_irq(struct arm_pmu *cpu_pmu)
 	/*
 	 * Get and reset the IRQ flags
 	 */
-	pmovsr = armv8pmu_getreset_flags();
+	pmovsr = armv8pmu_getreset_flags(cpu_pmu);
 
 	/*
 	 * Did an overflow occur?
@@ -930,6 +956,8 @@ static int armv8pmu_get_single_idx(struct pmu_hw_events *cpuc,
 	int idx;
 
 	for_each_set_bit(idx, cpu_pmu->cntr_mask, ARMV8_PMU_MAX_GENERAL_COUNTERS) {
+		if (armv8pmu_is_guest_part(cpu_pmu, idx))
+			continue;
 		if (!test_and_set_bit(idx, cpuc->used_mask))
 			return idx;
 	}
@@ -946,6 +974,8 @@ static int armv8pmu_get_chain_idx(struct pmu_hw_events *cpuc,
 	 * the lower idx must be even.
 	 */
 	for_each_set_bit(idx, cpu_pmu->cntr_mask, ARMV8_PMU_MAX_GENERAL_COUNTERS) {
+		if (armv8pmu_is_guest_part(cpu_pmu, idx))
+			continue;
 		if (!(idx & 0x1))
 			continue;
 		if (!test_and_set_bit(idx, cpuc->used_mask)) {
@@ -968,6 +998,7 @@ static int armv8pmu_get_event_idx(struct pmu_hw_events *cpuc,
 
 	/* Always prefer to place a cycle counter into the cycle counter. */
 	if ((evtype == ARMV8_PMUV3_PERFCTR_CPU_CYCLES) &&
+	    !cpu_pmu->partitioned &&
 	    !armv8pmu_event_get_threshold(&event->attr)) {
 		if (!test_and_set_bit(ARMV8_PMU_CYCLE_IDX, cpuc->used_mask))
 			return ARMV8_PMU_CYCLE_IDX;
@@ -983,6 +1014,7 @@ static int armv8pmu_get_event_idx(struct pmu_hw_events *cpuc,
 	 * may not know how to handle it.
 	 */
 	if ((evtype == ARMV8_PMUV3_PERFCTR_INST_RETIRED) &&
+	    !cpu_pmu->partitioned &&
 	    !armv8pmu_event_get_threshold(&event->attr) &&
 	    test_bit(ARMV8_PMU_INSTR_IDX, cpu_pmu->cntr_mask) &&
 	    !armv8pmu_event_want_user_access(event)) {
@@ -994,7 +1026,7 @@ static int armv8pmu_get_event_idx(struct pmu_hw_events *cpuc,
 	 * Otherwise use events counters
 	 */
 	if (armv8pmu_event_is_chained(event))
-		return	armv8pmu_get_chain_idx(cpuc, cpu_pmu);
+		return armv8pmu_get_chain_idx(cpuc, cpu_pmu);
 	else
 		return armv8pmu_get_single_idx(cpuc, cpu_pmu);
 }
@@ -1086,6 +1118,15 @@ static int armv8pmu_set_event_filter(struct hw_perf_event *event,
 	return 0;
 }
 
+static void armv8pmu_reset_host_counters(struct arm_pmu *cpu_pmu)
+{
+	int idx;
+
+	for_each_set_bit(idx, cpu_pmu->cntr_mask, ARMV8_PMU_MAX_GENERAL_COUNTERS)
+		if (armv8pmu_is_host_part(cpu_pmu, idx))
+			armv8pmu_write_evcntr(idx, 0);
+}
+
 static void armv8pmu_reset(void *info)
 {
 	struct arm_pmu *cpu_pmu = (struct arm_pmu *)info;
@@ -1093,8 +1134,10 @@ static void armv8pmu_reset(void *info)
 
 	bitmap_to_arr64(&mask, cpu_pmu->cntr_mask, ARMPMU_MAX_HWEVENTS);
 
-	if (cpu_pmu->partitioned)
+	if (cpu_pmu->partitioned) {
 		armv8pmu_partition(cpu_pmu->hpmn);
+		mask &= ARMV8_PMU_HOST_CNT_PART(cpu_pmu->hpmn);
+	}
 
 	/* The counter and interrupt enable registers are unknown at reset. */
 	armv8pmu_disable_counter(mask);
@@ -1103,11 +1146,20 @@ static void armv8pmu_reset(void *info)
 	/* Clear the counters we flip at guest entry/exit */
 	kvm_clr_pmu_events(mask);
 
+
+	pmcr = ARMV8_PMU_PMCR_LC;
+
 	/*
-	 * Initialize & Reset PMNC. Request overflow interrupt for
-	 * 64 bit cycle counter but cheat in armv8pmu_write_counter().
+	 * Initialize & Reset PMNC. Request overflow interrupt for 64
+	 * bit cycle counter but cheat in armv8pmu_write_counter().
+	 *
+	 * When partitioned, there is no single bit to reset only the
+	 * host counters. so reset them individually.
 	 */
-	pmcr = ARMV8_PMU_PMCR_P | ARMV8_PMU_PMCR_C | ARMV8_PMU_PMCR_LC;
+	if (cpu_pmu->partitioned)
+		armv8pmu_reset_host_counters(cpu_pmu);
+	else
+		pmcr = ARMV8_PMU_PMCR_P | ARMV8_PMU_PMCR_C;
 
 	/* Enable long event counter support where available */
 	if (armv8pmu_has_long_event(cpu_pmu))
diff --git a/include/linux/perf/arm_pmuv3.h b/include/linux/perf/arm_pmuv3.h
index 115ee39f693a..5f8b143794ce 100644
--- a/include/linux/perf/arm_pmuv3.h
+++ b/include/linux/perf/arm_pmuv3.h
@@ -247,6 +247,14 @@
 #define ARMV8_PMU_OVSR_F		ARMV8_PMU_CNT_MASK_F
 /* Mask for writable bits is both P and C fields */
 #define ARMV8_PMU_OVERFLOWED_MASK	ARMV8_PMU_CNT_MASK_ALL
+
+/* Masks for guest and host counter partitions */
+#define ARMV8_PMU_HPMN_CNT_MASK(N)	GENMASK((N) - 1, 0)
+#define ARMV8_PMU_GUEST_CNT_PART(N)	(ARMV8_PMU_HPMN_CNT_MASK(N) | \
+					 ARMV8_PMU_CNT_MASK_C | \
+					 ARMV8_PMU_CNT_MASK_F)
+#define ARMV8_PMU_HOST_CNT_PART(N)	(ARMV8_PMU_CNT_MASK_ALL & \
+					 ~ARMV8_PMU_GUEST_CNT_PART(N))
 /*
  * PMXEVTYPER: Event selection reg
  */
-- 
2.48.1.262.g85cc9f2d1e-goog


