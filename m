Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D497BE77198
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 11:46:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=361dVHxyYbzfXGnUF4Ia+mPKpgg8pWQWoFNDsGCUa2w=; b=D2IzM8YoeWP+y0j7XvmN1TdR9a
	PbYONzcObqillB5/B/xDmkU6SAiE8HLCwshIn09rFshKutrpoM0d3hV0YEg3oGAgJioRHWwTVquMl
	vjeBQH2Ez89/vQwcVHtu+l6T9RjOTaO6PvgVGQulUaZCLz1HjRv+IVb0d6LKYjTNrO0hMpdlZQ6+r
	lHlGh3De3LwXl6qWaJHhGW/3bAwysA1dqYwmyotpi6Mmk2/alLkTaqklxMI74WPhaLb8GUvLjuSCD
	71LfoSUG8N6nL5SxyRMmhfTxeRxHmD8dod1Gi4wtqXkpVaHC1sXwu75R79CAhVl+CDOYIl2jsJ77C
	IZmd7+0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tV82c-00000004ceG-2bp3;
	Tue, 07 Jan 2025 11:46:34 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tV7re-00000004ZzN-01X3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jan 2025 11:35:18 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4368a293339so121667065e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Jan 2025 03:35:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736249712; x=1736854512; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=361dVHxyYbzfXGnUF4Ia+mPKpgg8pWQWoFNDsGCUa2w=;
        b=F3Dh4+Tg44QeXCs7g44oynzrCZQ/HR14o/6DvsNmgRlmLYXfvR6ZUfcTUNz16Jy88S
         5VQbd2AJYO9IgV1oFzLA0VCqyiiVOUFunPWkyXXrBGvEP4/Fjqnf6laHCJbTMPq3MAh7
         7AAZd3ywNyV+22IL4s78rV4DAANaYO4gZ4Zc7z5jnepuf9AL2eU10qrrpEdz6jFpbGpj
         g5iW4e2VFwlb7+sYyPa0oB8s+Fb8SFUIqNl3bFvezBLYNmzRuqjssgM/Cujy7A8KYone
         cNs2et/an4iHI8Yu9K0qWBrGNFkzNeNvjYcWjs7qAMA+/1tA/zzZYWfgNu9TM8ahfEu7
         uMZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736249712; x=1736854512;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=361dVHxyYbzfXGnUF4Ia+mPKpgg8pWQWoFNDsGCUa2w=;
        b=EJxhxnxI1uihdQgM+YOcBTGQbV1rxRCcct7H4J+q+xx/JoJUO00iCZE6YXjD39gpKH
         zKytm2Li8PPG3Ulo/pEqyTI2STkFuS/Em/KNGm/sVyzTxmgMiDasTX8ULvyfGkE2a6r1
         cBPvvDB24Qay/TdwWL13XPsraucY2HkSB70/D/QNm/kQn+i+eCoi1geP6zM+DjIHhncN
         v/ILhYzMVuYvfrjAMuuwCdhf0/dyGLtqpxkjH6wc5xS6eso9ij8hCsjtX5QrOu5R1mnb
         3UtHPDHSCWAGiqYeOT6CDpL/fHjAVOCrlX1V/Q7hH3/mvQ7ToRvaIpP8cy3E12bSAj6s
         3fug==
X-Forwarded-Encrypted: i=1; AJvYcCW3EF8/OuGxqjmIsw1tf8eZFRBbqIkCrqIXQqS53DSv+7PUGlR9fxb4zGpqjArke/EUA5W7/WeDb6E3uGO5RGPd@lists.infradead.org
X-Gm-Message-State: AOJu0YxQY/z0AclrUm7OeuwBoVG9pZKtie4zZvRnmk+s6tWdIcbBrwKK
	NmXlxTWFd+1PDplo/0IKvTdz6dTqgAP60bv32u/VMEIVP8jxXQpSW5z3NWdZEq0=
X-Gm-Gg: ASbGnct9KZHlH0csqddfgazatZ21sGKxtIkDbJKhxR9ctX31eoMhKy7CFEcgYcingcZ
	Gt8Gn+LAjxqtvDHKtE6NkoqsJCrUQRf6Nwqa7odzdp+xNV0sez2tR9CRmS8CD4FHPw2W0aFwbgc
	jwOYwMulQuJ1UUQ45Smz+o1RBbiIXoHyapRMgN953SKnhdiVHfkUhY+XDwMkqrs4yt3H3omPWqi
	fRFn8nD6BzElalvJuyqy1zo/N72rmn47vYCCWQDKPgwOvWO97MIuPpV
X-Google-Smtp-Source: AGHT+IEPIBkpUbKZmzd11xA9RlSbKwTWjgAlK2hoOybk1pgXH7+fgfg4ZL8FPrxTRRNcipcPh+zn8w==
X-Received: by 2002:a5d:6da4:0:b0:386:3864:5cf2 with SMTP id ffacd0b85a97d-38a221f0e37mr49281056f8f.19.1736249712387;
        Tue, 07 Jan 2025 03:35:12 -0800 (PST)
Received: from pop-os.. ([145.224.66.180])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c89e1acsm50299218f8f.68.2025.01.07.03.35.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 03:35:12 -0800 (PST)
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
	Mark Brown <broonie@kernel.org>,
	James Morse <james.morse@arm.com>,
	Shiqi Liu <shiqiliu@hust.edu.cn>,
	Fuad Tabba <tabba@google.com>,
	"Rob Herring (Arm)" <robh@kernel.org>,
	Raghavendra Rao Ananta <rananta@google.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v10 08/10] KVM: arm64: coresight: Give TRBE enabled state to KVM
Date: Tue,  7 Jan 2025 11:32:45 +0000
Message-Id: <20250107113252.260631-9-james.clark@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250107113252.260631-1-james.clark@linaro.org>
References: <20250107113252.260631-1-james.clark@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_033514_043641_01F5DC5F 
X-CRM114-Status: GOOD (  23.70  )
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
index fb252d540850..b244ec44bd3a 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -612,6 +612,8 @@ struct cpu_sve_state {
 struct kvm_host_data {
 #define KVM_HOST_DATA_FLAG_HAS_SPE	0
 #define KVM_HOST_DATA_FLAG_HAS_TRBE	1
+#define KVM_HOST_DATA_FLAG_TRBE_ENABLED			2
+#define KVM_HOST_DATA_FLAG_EL1_TRACING_CONFIGURED	3
 	unsigned long flags;
 
 	struct kvm_cpu_context host_ctxt;
@@ -657,6 +659,9 @@ struct kvm_host_data {
 		u64 mdcr_el2;
 	} host_debug_state;
 
+	/* Guest trace filter value */
+	u64 trfcr_while_in_guest;
+
 	/* Number of programmable event counters (PMCR_EL0.N) for this CPU */
 	unsigned int nr_event_counters;
 };
@@ -1381,6 +1386,8 @@ static inline bool kvm_pmu_counter_deferred(struct perf_event_attr *attr)
 void kvm_set_pmu_events(u64 set, struct perf_event_attr *attr);
 void kvm_clr_pmu_events(u64 clr);
 bool kvm_set_pmuserenr(u64 val);
+void kvm_enable_trbe(void);
+void kvm_disable_trbe(void);
 #else
 static inline void kvm_set_pmu_events(u64 set, struct perf_event_attr *attr) {}
 static inline void kvm_clr_pmu_events(u64 clr) {}
@@ -1388,6 +1395,8 @@ static inline bool kvm_set_pmuserenr(u64 val)
 {
 	return false;
 }
+static inline void kvm_enable_trbe(void) {}
+static inline void kvm_disable_trbe(void) {}
 #endif
 
 void kvm_vcpu_load_vhe(struct kvm_vcpu *vcpu);
diff --git a/arch/arm64/kvm/debug.c b/arch/arm64/kvm/debug.c
index 1ee2fd765b62..e1ac3d2a65be 100644
--- a/arch/arm64/kvm/debug.c
+++ b/arch/arm64/kvm/debug.c
@@ -309,7 +309,33 @@ void kvm_init_host_debug_data(void)
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
+}
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
 }
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


