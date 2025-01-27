Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 617DDC02188
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jan 2025 22:26:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J+qObDwS88LTAskUjFBnmb2tHGwgbjCOQx4TzLmc3bo=; b=3pOg8QKc6Edwll7ekVTtb73Phh
	pgatjDA9JInoqEQG4R1TgzQ6me/7MWar9UnZnre7Glo6OATrsczi2T5kTelf3gFAaYdSgmr3sJwfW
	a+4lBtJN3bdoeUgk3Vaen998HJiAogDZw3qXx82tRX6M3bJs7Y8QRMht57w20W8tmCx/e5xFR60RI
	iPdTOsHuxJNCU04PxGBrRpUZIhExS1EcQTvObWtiRRYPX9EfcerYQb1kxno6/P1s7KwEX5L2HXZpj
	9jtTHGCYZblhTr4YT50Rjx7dOPACRhZj0a8JRUZ8Zm0KnYSTgitEJF1cHDORbRP2cv9YlPPPD6CkT
	0bxERBBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcXYW-00000003Oqp-31Hg;
	Mon, 27 Jan 2025 22:26:08 +0000
Received: from mail-oi1-x24a.google.com ([2607:f8b0:4864:20::24a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcXTR-00000003Ncu-3ZRv
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jan 2025 22:20:54 +0000
Received: by mail-oi1-x24a.google.com with SMTP id 5614622812f47-3eb9278f4daso3712407b6e.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Jan 2025 14:20:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738016452; x=1738621252; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=J+qObDwS88LTAskUjFBnmb2tHGwgbjCOQx4TzLmc3bo=;
        b=gq6adr9uJuXNEfv1zdCYIkuYEJrScbsQsVh6nLjqzqmqUqlelVs9o43JFhOdGBTTf5
         7q6aNkXfs+TwCMOAXwdsdrNrqbwRUURoiWgrUJ0+MpPaY6ZIbFY3iZcRYcIKWqxzQSgP
         YH8VLgYaJSq0w9tE5XGwf8JmetIEBx6xIKCoaRY6Mh1vgKIduCi+gRnvI/bWbEUicvm/
         nlIPx6uGo2YJrO7Ubr+Zg0CSRhMJwrak+zwWRSSlBYN6FAltIay/mzLzu677dEPHFTet
         vVF0LfW8c+Xa3rrZDBsD8nzrMuT7L4suXYGPkV7UnnpnDP+bWV1scKSnvl4J4bjMztdO
         RjDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738016452; x=1738621252;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=J+qObDwS88LTAskUjFBnmb2tHGwgbjCOQx4TzLmc3bo=;
        b=AyuYMzEWkgptlM/OYw249lOXPJE7XYE5VSQRavx2luVZNT2NB8Cr+YznuH6CXXiCxP
         TbztX0bQiOCRVcO3HvSQsQ4Jej4TODl+WIoaGYP5SlBOrd6PBROvIv4bGcJ0SiWA5Xu/
         ibCCS7XnyfyS3+5KlBK/n3CwHxvakbMXCQrjJTg63R2oI66GIy70PmNNpHz/G+NusQ+q
         DihbQhqgytIed/oOw/3vOVH9pjiAIbhAo8Oy8av47WskTxRLrCFvZeOM9tpmSb0YdxBy
         n8m3catwa5+WGAuaZ9b+ESEY5UCpz7YdyiWy3Y1ZbVzT5zTL+Yp8dnH0AvCTlcJ005vD
         Nmmw==
X-Forwarded-Encrypted: i=1; AJvYcCWM6HOGJ8RCaYLHXhSnpTl/td7D7nO/OOkLz8yqJuUqp9vOrRWv+OS/Gczpx3Yy8qnS3zquQhSdObJjsBTVLf9A@lists.infradead.org
X-Gm-Message-State: AOJu0YyvRKsrbvtJeQQMfQbAD5dC5MiXB+gjWorvOh6lWp6NXv6OCfQ7
	H4XcGgILCQQ0cK0JdrlGBQFpaZnEn7ymWLF93NZ0WlTzt88FrnVtzh9lRbPkDYTz/ZBy2yZLkxv
	EZSYSVSvMKwkUSNvxs5Va+A==
X-Google-Smtp-Source: AGHT+IGwmY6EDgFuxeR3LWy7D1Q3b/YTDKxzwuYjqYnE2eZqfv0wem+uFwxiXcUXaHQYscSNGguM00ZFGJ5jekmJ8A==
X-Received: from oojj19.prod.google.com ([2002:a05:6820:a013:b0:5f6:2f27:1d57])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:3c96:b0:3eb:549b:2c14 with SMTP id 5614622812f47-3f19fbfcd73mr29492204b6e.2.1738016451988;
 Mon, 27 Jan 2025 14:20:51 -0800 (PST)
Date: Mon, 27 Jan 2025 22:20:27 +0000
In-Reply-To: <20250127222031.3078945-1-coltonlewis@google.com>
Mime-Version: 1.0
References: <20250127222031.3078945-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.48.1.262.g85cc9f2d1e-goog
Message-ID: <20250127222031.3078945-2-coltonlewis@google.com>
Subject: [RFC PATCH 1/4] perf: arm_pmuv3: Introduce module param to partition
 the PMU
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
X-CRM114-CacheID: sfid-20250127_142053_890205_E9FDE43B 
X-CRM114-Status: GOOD (  20.50  )
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

For PMUv3, the register MDCR_EL2.HPMN partitiones the PMU counters
into two ranges where counters 0..HPMN-1 are accessible by EL1 and, if
allowed, EL0 while counters HPMN..N are only accessible by EL2.

Introduce a module parameter in the PMUv3 driver to set this
register. The name reserved_guest_counters reflects the intent to
reserve some counters for the guest so they may eventually be allowed
direct access to a subset of PMU functionality for increased
performance.

Track HPMN and whether the pmu is partitioned in struct arm_pmu.

While FEAT_HPMN0 does allow HPMN to be set to 0, this patch
specifically disallows that case because it's not useful given the
intention to allow guests access to their own counters.

Signed-off-by: Colton Lewis <coltonlewis@google.com>
---
 arch/arm/include/asm/arm_pmuv3.h   | 10 +++++++
 arch/arm64/include/asm/arm_pmuv3.h | 10 +++++++
 drivers/perf/arm_pmuv3.c           | 43 ++++++++++++++++++++++++++++--
 include/linux/perf/arm_pmu.h       |  2 ++
 include/linux/perf/arm_pmuv3.h     |  7 +++++
 5 files changed, 70 insertions(+), 2 deletions(-)

diff --git a/arch/arm/include/asm/arm_pmuv3.h b/arch/arm/include/asm/arm_pmuv3.h
index 2ec0e5e83fc9..49ad90486aa5 100644
--- a/arch/arm/include/asm/arm_pmuv3.h
+++ b/arch/arm/include/asm/arm_pmuv3.h
@@ -277,4 +277,14 @@ static inline u64 read_pmceid1(void)
 	return val;
 }
 
+static inline u32 read_mdcr(void)
+{
+	return read_sysreg(mdcr_el2);
+}
+
+static inline void write_mdcr(u32 val)
+{
+	write_sysreg(val, mdcr_el2);
+}
+
 #endif
diff --git a/arch/arm64/include/asm/arm_pmuv3.h b/arch/arm64/include/asm/arm_pmuv3.h
index 8a777dec8d88..fc37e7e81e07 100644
--- a/arch/arm64/include/asm/arm_pmuv3.h
+++ b/arch/arm64/include/asm/arm_pmuv3.h
@@ -188,4 +188,14 @@ static inline bool is_pmuv3p9(int pmuver)
 	return pmuver >= ID_AA64DFR0_EL1_PMUVer_V3P9;
 }
 
+static inline u64 read_mdcr(void)
+{
+	return read_sysreg(mdcr_el2);
+}
+
+static inline void write_mdcr(u64 val)
+{
+	write_sysreg(val, mdcr_el2);
+}
+
 #endif
diff --git a/drivers/perf/arm_pmuv3.c b/drivers/perf/arm_pmuv3.c
index b5cc11abc962..55f9ae560715 100644
--- a/drivers/perf/arm_pmuv3.c
+++ b/drivers/perf/arm_pmuv3.c
@@ -325,6 +325,7 @@ GEN_PMU_FORMAT_ATTR(threshold_compare);
 GEN_PMU_FORMAT_ATTR(threshold);
 
 static int sysctl_perf_user_access __read_mostly;
+static u8 reserved_guest_counters __read_mostly;
 
 static bool armv8pmu_event_is_64bit(struct perf_event *event)
 {
@@ -500,6 +501,29 @@ static void armv8pmu_pmcr_write(u64 val)
 	write_pmcr(val);
 }
 
+static u64 armv8pmu_mdcr_read(void)
+{
+	return read_mdcr();
+}
+
+static void armv8pmu_mdcr_write(u64 val)
+{
+	write_mdcr(val);
+	isb();
+}
+
+static void armv8pmu_partition(u8 hpmn)
+{
+	u64 mdcr = armv8pmu_mdcr_read();
+
+	mdcr &= ~MDCR_EL2_HPMN_MASK;
+	mdcr |= FIELD_PREP(ARMV8_PMU_MDCR_HPMN, hpmn);
+	/* Prevent guest counters counting at EL2 */
+	mdcr |= ARMV8_PMU_MDCR_HPMD;
+
+	armv8pmu_mdcr_write(mdcr);
+}
+
 static int armv8pmu_has_overflowed(u64 pmovsr)
 {
 	return !!(pmovsr & ARMV8_PMU_OVERFLOWED_MASK);
@@ -1069,6 +1093,9 @@ static void armv8pmu_reset(void *info)
 
 	bitmap_to_arr64(&mask, cpu_pmu->cntr_mask, ARMPMU_MAX_HWEVENTS);
 
+	if (cpu_pmu->partitioned)
+		armv8pmu_partition(cpu_pmu->hpmn);
+
 	/* The counter and interrupt enable registers are unknown at reset. */
 	armv8pmu_disable_counter(mask);
 	armv8pmu_disable_intens(mask);
@@ -1205,6 +1232,7 @@ static void __armv8pmu_probe_pmu(void *info)
 {
 	struct armv8pmu_probe_info *probe = info;
 	struct arm_pmu *cpu_pmu = probe->pmu;
+	u8 pmcr_n;
 	u64 pmceid_raw[2];
 	u32 pmceid[2];
 	int pmuver;
@@ -1215,10 +1243,19 @@ static void __armv8pmu_probe_pmu(void *info)
 
 	cpu_pmu->pmuver = pmuver;
 	probe->present = true;
+	pmcr_n = FIELD_GET(ARMV8_PMU_PMCR_N, armv8pmu_pmcr_read());
 
 	/* Read the nb of CNTx counters supported from PMNC */
-	bitmap_set(cpu_pmu->cntr_mask,
-		   0, FIELD_GET(ARMV8_PMU_PMCR_N, armv8pmu_pmcr_read()));
+	bitmap_set(cpu_pmu->cntr_mask, 0, pmcr_n);
+
+	if (reserved_guest_counters > 0 && reserved_guest_counters < pmcr_n) {
+		cpu_pmu->hpmn = reserved_guest_counters;
+		cpu_pmu->partitioned = true;
+	} else {
+		reserved_guest_counters = 0;
+		cpu_pmu->hpmn = pmcr_n;
+		cpu_pmu->partitioned = false;
+	}
 
 	/* Add the CPU cycles counter */
 	set_bit(ARMV8_PMU_CYCLE_IDX, cpu_pmu->cntr_mask);
@@ -1516,3 +1553,5 @@ void arch_perf_update_userpage(struct perf_event *event,
 	userpg->cap_user_time_zero = 1;
 	userpg->cap_user_time_short = 1;
 }
+
+module_param(reserved_guest_counters, byte, 0);
diff --git a/include/linux/perf/arm_pmu.h b/include/linux/perf/arm_pmu.h
index 4b5b83677e3f..ad97aabed25a 100644
--- a/include/linux/perf/arm_pmu.h
+++ b/include/linux/perf/arm_pmu.h
@@ -101,6 +101,8 @@ struct arm_pmu {
 	void		(*reset)(void *);
 	int		(*map_event)(struct perf_event *event);
 	DECLARE_BITMAP(cntr_mask, ARMPMU_MAX_HWEVENTS);
+	u8		hpmn; /* MDCR_EL2.HPMN: counter partition pivot */
+	bool	        partitioned;
 	bool		secure_access; /* 32-bit ARM only */
 #define ARMV8_PMUV3_MAX_COMMON_EVENTS		0x40
 	DECLARE_BITMAP(pmceid_bitmap, ARMV8_PMUV3_MAX_COMMON_EVENTS);
diff --git a/include/linux/perf/arm_pmuv3.h b/include/linux/perf/arm_pmuv3.h
index d698efba28a2..d399e8c6f98e 100644
--- a/include/linux/perf/arm_pmuv3.h
+++ b/include/linux/perf/arm_pmuv3.h
@@ -223,6 +223,13 @@
 				 ARMV8_PMU_PMCR_X | ARMV8_PMU_PMCR_DP | \
 				 ARMV8_PMU_PMCR_LC | ARMV8_PMU_PMCR_LP)
 
+/*
+ * Per-CPU MDCR: config reg
+ */
+#define ARMV8_PMU_MDCR_HPMN		GENMASK(4, 0)
+#define ARMV8_PMU_MDCR_HPME		BIT(7)
+#define ARMV8_PMU_MDCR_HPMD		BIT(17)
+
 /*
  * PMOVSR: counters overflow flag status reg
  */
-- 
2.48.1.262.g85cc9f2d1e-goog


