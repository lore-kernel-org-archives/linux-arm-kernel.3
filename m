Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 505E5E77188
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jan 2025 14:41:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4tKqXX6ltyMKnYMGbEPboArH4aBYnbWTrcwl9D/Fhgk=; b=QEROB03KAL6W+WJXnznPafri8s
	0UEkzQGcDtekeJmbeiKzcKTjMGay9/JQKanADJ7EdxRXC1xtHfnsbH3ynQF6bu05w0Ujsm/uQC+tL
	hUn5f1sQEGyJwiKhZsudRa6OMns9q77aYh4YlmxW3L86zCzo3SjdRBZMVRedx1WUvId3/ufVrIGuo
	2jkrPN5qLSIdYktMGDHFjreDJpSzDDOUb5M8D7aA8t9WGRkaXmNVTUS5nrcteUETbI0j+6pewsURD
	FYAfFqZSFUc0T3yxD9N2RcMfjJU7Oan+R7k1CIczjxX0xdAjQ3ftZKgfJme6v1ljN37j1kCXdI4hh
	+24PK0Sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUoIb-00000001cCn-36dd;
	Mon, 06 Jan 2025 14:41:45 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUo2q-00000001Z4x-2WTb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jan 2025 14:25:29 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-38632b8ae71so10145533f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jan 2025 06:25:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736173527; x=1736778327; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4tKqXX6ltyMKnYMGbEPboArH4aBYnbWTrcwl9D/Fhgk=;
        b=CQNQcjQdQlibjXKPORuYCdBmhhdbGB2LTrvr+NjvuEuAbb/heU95jV3cQW0eL4WS6U
         XlZKmg3HrBFQFL7nWVGruYrMHkCOV9VeIoem9jrYiCoP+g53S8dogOg+ZRj5Lf5i15pK
         Gf16dYo+wPLX4UyU7DL9c3HQ0XYRimHgf1yd7KT7iyCqiOrzVQPocNgL5ny+X3DmSg19
         RmYQIbZX5EunSRCbklG4SZbB3xpJjEmVezLfi/H2CSTZ9Qfi2SmHZSio1lF8PrnmLjX0
         vgiAAYTVluIgQNagfB6PIZdJi0tjrJM8C4KCs9N4euPkMZ2AMxVnIeVGQseZromIDyQB
         9j2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736173527; x=1736778327;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4tKqXX6ltyMKnYMGbEPboArH4aBYnbWTrcwl9D/Fhgk=;
        b=tG/SyHZikblwrIrQZH0LBxLtXTS++dQ8SCv+SRbayCQwCvB/9Pd6+z1ynjLtLSLYc+
         1tP0vELpXe17ctQbzJJTruiD/TUEDls/fQY77Ywxi1NghH1xccJQe0DMfzbLx9SKel7X
         jHnF+e2wGPsHqCIpFkltFUZtFVDsNCpMBknzENiEdK+WHSoM3iCacMqta+r3OpJ1HsFy
         CdiLY1u/qjhtRUPXLUbNRqq8QF6jba/g2ZjIAA4+mZpYPmZrCIM8exnzxYyPn1Y9y5W3
         SCu/T229Oa/7lKpy992R+FxNlEz+AdaPHfBx7AhDQ4q2ZWTkjRHvrekdsAdv0yEq/4+/
         Fsag==
X-Forwarded-Encrypted: i=1; AJvYcCVfQN0WxGXbLKvPqMrr2nFQ4ksPo30lf4BysAWgeC1e8tx1PCPHV0zB/+b7HwJcpQHlxQzr9WjrKO09TLZ+INpH@lists.infradead.org
X-Gm-Message-State: AOJu0YxB5ZQZoE8gnOPt2thTd71LODU4CxmgLPq4rIPDWZjWzP/dzm46
	xV1/E7kCdBb1Oe6aMxywiPFcYvUg04FHRPjoNbTZNEr2CWugZwkVE9pAuHi62AQ=
X-Gm-Gg: ASbGncsnTAyfIiwELt9rdVkoWDjZyhvs4NCM1eKNincR3GcspJeitibWJYr6sUnz9VW
	dSuqgZ7WiiJLAHN/RFKWEBipBj5C47KNpuyHfMqlSt2eq9i1c3dFy8LENU9SFnwJNoDZLXKD3qK
	MkBVlg0ToUwxJzkEgfD07IWE94Q3Fpswjz5lw1PYQaZAsJ1ooa9fTDQuCxA1H3k3GHj4gsZHaLh
	ZU/3ViBOzondE9OTP/UZQZ8dR+UNrH7caYHowAUTctTjkILHyhRJRKE
X-Google-Smtp-Source: AGHT+IHosAoSQ8Y6r5GTgrFTFQzIQO4UbWzlRpVUduo3UPs5moBmKInuymWOSfwWQHVu3cAAbCM3Ag==
X-Received: by 2002:a5d:64ac:0:b0:385:effc:a279 with SMTP id ffacd0b85a97d-38a223ff46cmr42420705f8f.58.1736173526999;
        Mon, 06 Jan 2025 06:25:26 -0800 (PST)
Received: from pop-os.. ([145.224.66.180])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4365d116d8fsm577295045e9.17.2025.01.06.06.25.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2025 06:25:26 -0800 (PST)
From: James Clark <james.clark@linaro.org>
To: maz@kernel.org,
	kvmarm@lists.linux.dev,
	oliver.upton@linux.dev,
	suzuki.poulose@arm.com,
	coresight@lists.linaro.org
Cc: James Clark <james.clark@linaro.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mike Leach <mike.leach@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	"Rob Herring (Arm)" <robh@kernel.org>,
	James Morse <james.morse@arm.com>,
	Mark Brown <broonie@kernel.org>,
	Shiqi Liu <shiqiliu@hust.edu.cn>,
	Raghavendra Rao Ananta <rananta@google.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v9 5/7] KVM: arm64: coresight: Give TRBE enabled state to KVM
Date: Mon,  6 Jan 2025 14:24:40 +0000
Message-Id: <20250106142446.628923-6-james.clark@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250106142446.628923-1-james.clark@linaro.org>
References: <20250106142446.628923-1-james.clark@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_062528_641280_1334FBFB 
X-CRM114-Status: GOOD (  23.38  )
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

Currently in nVHE, KVM has to check if TRBE is enabled on every guest
switch even if it was never used. Because it's a debug feature and is
more likely to not be used than used, give KVM the TRBE buffer status to
allow a much simpler and faster do-nothing path in the hyp.

Protected mode now disables trace regardless of TRBE (because
trfcr_while_in_guest is always 0), which was not previously done.
However, it continues to flush whenever the buffer is enabled
regardless of the filter status. This avoids the hypothetical case of a
host that had disabled the filter but not flushed which would arise if
only doing the flush when the filter was enabled.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 arch/arm64/include/asm/kvm_host.h            |  9 +++
 arch/arm64/kvm/debug.c                       | 32 +++++++++-
 arch/arm64/kvm/hyp/nvhe/debug-sr.c           | 63 ++++++++++++--------
 drivers/hwtracing/coresight/coresight-trbe.c |  3 +
 4 files changed, 79 insertions(+), 28 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index 04cd488f6787..8fdc7b6efc79 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -617,6 +617,8 @@ struct kvm_host_data {
 #define KVM_HOST_DATA_FLAG_HAS_TRBE			1
 #define KVM_HOST_DATA_FLAG_HOST_SVE_ENABLED		2
 #define KVM_HOST_DATA_FLAG_HOST_SME_ENABLED		3
+#define KVM_HOST_DATA_FLAG_TRBE_ENABLED			4
+#define KVM_HOST_DATA_FLAG_EL1_TRACING_CONFIGURED	5
 	unsigned long flags;
 
 	struct kvm_cpu_context host_ctxt;
@@ -662,6 +664,9 @@ struct kvm_host_data {
 		u64 mdcr_el2;
 	} host_debug_state;
 
+	/* Guest trace filter value */
+	u64 trfcr_while_in_guest;
+
 	/* Number of programmable event counters (PMCR_EL0.N) for this CPU */
 	unsigned int nr_event_counters;
 
@@ -1389,6 +1394,8 @@ static inline bool kvm_pmu_counter_deferred(struct perf_event_attr *attr)
 void kvm_set_pmu_events(u64 set, struct perf_event_attr *attr);
 void kvm_clr_pmu_events(u64 clr);
 bool kvm_set_pmuserenr(u64 val);
+void kvm_enable_trbe(void);
+void kvm_disable_trbe(void);
 #else
 static inline void kvm_set_pmu_events(u64 set, struct perf_event_attr *attr) {}
 static inline void kvm_clr_pmu_events(u64 clr) {}
@@ -1396,6 +1403,8 @@ static inline bool kvm_set_pmuserenr(u64 val)
 {
 	return false;
 }
+static inline void kvm_enable_trbe(void) {}
+static inline void kvm_disable_trbe(void) {}
 #endif
 
 void kvm_vcpu_load_vhe(struct kvm_vcpu *vcpu);
diff --git a/arch/arm64/kvm/debug.c b/arch/arm64/kvm/debug.c
index d921e7f7bd59..92a24adadb0e 100644
--- a/arch/arm64/kvm/debug.c
+++ b/arch/arm64/kvm/debug.c
@@ -81,9 +81,15 @@ void kvm_init_host_debug_data(void)
 	    !(read_sysreg_s(SYS_PMBIDR_EL1) & PMBIDR_EL1_P))
 		host_data_set_flag(HAS_SPE);
 
-	if (cpuid_feature_extract_unsigned_field(dfr0, ID_AA64DFR0_EL1_TraceBuffer_SHIFT) &&
-	    !(read_sysreg_s(SYS_TRBIDR_EL1) & TRBIDR_EL1_P))
-		host_data_set_flag(HAS_TRBE);
+	if (cpuid_feature_extract_unsigned_field(dfr0, ID_AA64DFR0_EL1_TraceFilt_SHIFT)) {
+		/* Force disable trace in protected mode in case of no TRBE */
+		if (is_protected_kvm_enabled())
+			host_data_set_flag(EL1_TRACING_CONFIGURED);
+
+		if (cpuid_feature_extract_unsigned_field(dfr0, ID_AA64DFR0_EL1_TraceBuffer_SHIFT) &&
+		    !(read_sysreg_s(SYS_TRBIDR_EL1) & TRBIDR_EL1_P))
+			host_data_set_flag(HAS_TRBE);
+	}
 }
 
 /*
@@ -219,3 +225,23 @@ void kvm_debug_handle_oslar(struct kvm_vcpu *vcpu, u64 val)
 	kvm_arch_vcpu_load(vcpu, smp_processor_id());
 	preempt_enable();
 }
+
+void kvm_enable_trbe(void)
+{
+	if (has_vhe() || is_protected_kvm_enabled() ||
+	    WARN_ON_ONCE(preemptible()))
+		return;
+
+	host_data_set_flag(TRBE_ENABLED);
+}
+EXPORT_SYMBOL_GPL(kvm_enable_trbe);
+
+void kvm_disable_trbe(void)
+{
+	if (has_vhe() || is_protected_kvm_enabled() ||
+	    WARN_ON_ONCE(preemptible()))
+		return;
+
+	host_data_clear_flag(TRBE_ENABLED);
+}
+EXPORT_SYMBOL_GPL(kvm_disable_trbe);
diff --git a/arch/arm64/kvm/hyp/nvhe/debug-sr.c b/arch/arm64/kvm/hyp/nvhe/debug-sr.c
index 858bb38e273f..2f4a4f5036bb 100644
--- a/arch/arm64/kvm/hyp/nvhe/debug-sr.c
+++ b/arch/arm64/kvm/hyp/nvhe/debug-sr.c
@@ -51,32 +51,45 @@ static void __debug_restore_spe(u64 pmscr_el1)
 	write_sysreg_el1(pmscr_el1, SYS_PMSCR);
 }
 
-static void __debug_save_trace(u64 *trfcr_el1)
+static void __trace_do_switch(u64 *saved_trfcr, u64 new_trfcr)
 {
-	*trfcr_el1 = 0;
+	*saved_trfcr = read_sysreg_el1(SYS_TRFCR);
+	write_sysreg_el1(new_trfcr, SYS_TRFCR);
+}
 
-	/* Check if the TRBE is enabled */
-	if (!(read_sysreg_s(SYS_TRBLIMITR_EL1) & TRBLIMITR_EL1_E))
-		return;
-	/*
-	 * Prohibit trace generation while we are in guest.
-	 * Since access to TRFCR_EL1 is trapped, the guest can't
-	 * modify the filtering set by the host.
-	 */
-	*trfcr_el1 = read_sysreg_el1(SYS_TRFCR);
-	write_sysreg_el1(0, SYS_TRFCR);
-	isb();
-	/* Drain the trace buffer to memory */
-	tsb_csync();
+static bool __trace_needs_drain(void)
+{
+	if (is_protected_kvm_enabled() && host_data_test_flag(HAS_TRBE))
+		return read_sysreg_s(SYS_TRBLIMITR_EL1) & TRBLIMITR_EL1_E;
+
+	return host_data_test_flag(TRBE_ENABLED);
 }
 
-static void __debug_restore_trace(u64 trfcr_el1)
+static bool __trace_needs_switch(void)
 {
-	if (!trfcr_el1)
-		return;
+	return host_data_test_flag(TRBE_ENABLED) ||
+	       host_data_test_flag(EL1_TRACING_CONFIGURED);
+}
+
+static void __trace_switch_to_guest(void)
+{
+	/* Unsupported with TRBE so disable */
+	if (host_data_test_flag(TRBE_ENABLED))
+		*host_data_ptr(trfcr_while_in_guest) = 0;
+
+	__trace_do_switch(host_data_ptr(host_debug_state.trfcr_el1),
+			  *host_data_ptr(trfcr_while_in_guest));
 
-	/* Restore trace filter controls */
-	write_sysreg_el1(trfcr_el1, SYS_TRFCR);
+	if (__trace_needs_drain()) {
+		isb();
+		tsb_csync();
+	}
+}
+
+static void __trace_switch_to_host(void)
+{
+	__trace_do_switch(host_data_ptr(trfcr_while_in_guest),
+			  *host_data_ptr(host_debug_state.trfcr_el1));
 }
 
 void __debug_save_host_buffers_nvhe(struct kvm_vcpu *vcpu)
@@ -84,9 +97,9 @@ void __debug_save_host_buffers_nvhe(struct kvm_vcpu *vcpu)
 	/* Disable and flush SPE data generation */
 	if (host_data_test_flag(HAS_SPE))
 		__debug_save_spe(host_data_ptr(host_debug_state.pmscr_el1));
-	/* Disable and flush Self-Hosted Trace generation */
-	if (host_data_test_flag(HAS_TRBE))
-		__debug_save_trace(host_data_ptr(host_debug_state.trfcr_el1));
+
+	if (__trace_needs_switch())
+		__trace_switch_to_guest();
 }
 
 void __debug_switch_to_guest(struct kvm_vcpu *vcpu)
@@ -98,8 +111,8 @@ void __debug_restore_host_buffers_nvhe(struct kvm_vcpu *vcpu)
 {
 	if (host_data_test_flag(HAS_SPE))
 		__debug_restore_spe(*host_data_ptr(host_debug_state.pmscr_el1));
-	if (host_data_test_flag(HAS_TRBE))
-		__debug_restore_trace(*host_data_ptr(host_debug_state.trfcr_el1));
+	if (__trace_needs_switch())
+		__trace_switch_to_host();
 }
 
 void __debug_switch_to_host(struct kvm_vcpu *vcpu)
diff --git a/drivers/hwtracing/coresight/coresight-trbe.c b/drivers/hwtracing/coresight/coresight-trbe.c
index 03d3695ba5aa..a728802d2206 100644
--- a/drivers/hwtracing/coresight/coresight-trbe.c
+++ b/drivers/hwtracing/coresight/coresight-trbe.c
@@ -17,6 +17,7 @@
 
 #include <asm/barrier.h>
 #include <asm/cpufeature.h>
+#include <linux/kvm_host.h>
 #include <linux/vmalloc.h>
 
 #include "coresight-self-hosted-trace.h"
@@ -221,6 +222,7 @@ static inline void set_trbe_enabled(struct trbe_cpudata *cpudata, u64 trblimitr)
 	 */
 	trblimitr |= TRBLIMITR_EL1_E;
 	write_sysreg_s(trblimitr, SYS_TRBLIMITR_EL1);
+	kvm_enable_trbe();
 
 	/* Synchronize the TRBE enable event */
 	isb();
@@ -239,6 +241,7 @@ static inline void set_trbe_disabled(struct trbe_cpudata *cpudata)
 	 */
 	trblimitr &= ~TRBLIMITR_EL1_E;
 	write_sysreg_s(trblimitr, SYS_TRBLIMITR_EL1);
+	kvm_disable_trbe();
 
 	if (trbe_needs_drain_after_disable(cpudata))
 		trbe_drain_buffer();
-- 
2.34.1


