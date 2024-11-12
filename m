Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 980E7D32D98
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Nov 2024 11:32:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LV3nsyw5404Uo8G1nSnnmKQ1QdbiAR4HgkQNY6sysiA=; b=g4aDXK4i9ZEIenhIMj6vceuFb9
	FOnyjH78feYBpirkyBbSdT9UFcINxfN0y9P7bK/CDiTxOkCDB62Amm0sEDZcH3+2muy/Ow+Uq3NFf
	ROeY6yIiN09Yc2iOmyE8bR201coiz++NvT2fA2NDq4IaP4aJMWGvoaWu788QyMC6H12Wsmq29lk+k
	cUBQgYX8Yd7JJahQNLmsv71iK42SnBkyu2U6hWGdnBIbO+osZ9rn5sk7WkQ10WFr1FGBjuXUVpYBG
	AireBkH9vXIhtYDnp6WawwAMS9FA6pajWt0UrIRyS2zJUDtpbKNOc36QCvIuLtzRuom2J0X04T964
	VAp2JGnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAp7m-00000003EbH-0eBW;
	Tue, 12 Nov 2024 11:31:58 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAoI0-000000034nV-0L8Q
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Nov 2024 10:38:29 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-43159c9f617so43184595e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 Nov 2024 02:38:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731407907; x=1732012707; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LV3nsyw5404Uo8G1nSnnmKQ1QdbiAR4HgkQNY6sysiA=;
        b=MDf3Pqs15dtPRdi/VXiQ3Dy0Fjg/YMzZB9cKTj9Ksy8nsYPHzmfCgLZtrknnOVD22R
         Uh2DKXE3SJkOrImjawdQM3TNjykiAymmxkTwsmwdXyHoesGYxeaXe3mlmkVIhac/4Qen
         UjtrVs6t/CKJX8yY8XPdsL3QqjLQ7iqNdcYOZfklJIZ6JPyPu56c2G/PhBuqqrij6A/U
         q/bZmqHkhqWE45IT5i/J9iCPXRJB4LlJYadohqEgGIkAxUpW0vIrOr8jzBGtYPSs/tGT
         5gVWKf+7wXKP+duxWDtdkUU5/FU318/8vMVUPy70y84Lw4EUd6Ef88aWQgQbQ1S9IZg3
         zjtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731407907; x=1732012707;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LV3nsyw5404Uo8G1nSnnmKQ1QdbiAR4HgkQNY6sysiA=;
        b=TFUGaCbutMDKUCulWMzbB11JlYeRt0Wc70xkPdtI+QmhNfD7g0rkkCXVn56ZE0UrJs
         2iebKVSMQCEEfcD0Sql8JEFwBQzS8ac0CQIGJYUu13BDiaKIcKqh8EtS7YGLkkK9nBhW
         sMEOrmZC0XwY1+epoDuvRBMhDvC/7/vEanwGBJLhRJSosQF7HvVDrJyKAlj+iA9Wf6mo
         Ckkt7lXHq1PDawPa+WDlUvbIhQoxsxTCZ4G7JTRHcbsYqsOPhIDvQ/GlXFs4yy/eZbzw
         YWnZ56EoabUxQ1qSjVMcNVhCwc0O8hoOy1GEdYPgnrQ7r0NLg3QaLLslJZXEe4xiEYGe
         P6sQ==
X-Forwarded-Encrypted: i=1; AJvYcCXGf+HrujzDHh0ytj/BkNYlOVtabnbc/KXVJyIrcTXHhN7cp/vYoHuRo8K4iiokuDYwnJIWhu51D/NNytwQdGYe@lists.infradead.org
X-Gm-Message-State: AOJu0YwRZa0Cd48nRWgo6ijUvSBnOnoywzN0Y8B0i334TEK5T4Ovi9is
	HZbL0mn9aIigjCk0ssFhwp7aVhSWHNHKzweKBYXBt0qRHN7c7OM4VIpCByQozlI=
X-Google-Smtp-Source: AGHT+IE1wDzy/6MnLRWAcMttuy2R6a5vKVFmcLrn5P5890TBsIGhMnK8XJK5ODuYyXhsBnu+l89pAA==
X-Received: by 2002:a05:600c:5127:b0:431:5ba2:2450 with SMTP id 5b1f17b1804b1-432b751e264mr133161105e9.33.1731407906666;
        Tue, 12 Nov 2024 02:38:26 -0800 (PST)
Received: from pop-os.. ([145.224.90.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432bbf436ffsm142270955e9.44.2024.11.12.02.38.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Nov 2024 02:38:26 -0800 (PST)
From: James Clark <james.clark@linaro.org>
To: suzuki.poulose@arm.com,
	oliver.upton@linux.dev,
	coresight@lists.linaro.org,
	kvmarm@lists.linux.dev
Cc: James Clark <james.clark@linaro.org>,
	Marc Zyngier <maz@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mike Leach <mike.leach@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Fuad Tabba <tabba@google.com>,
	James Morse <james.morse@arm.com>,
	Shiqi Liu <shiqiliu@hust.edu.cn>,
	Mark Brown <broonie@kernel.org>,
	Raghavendra Rao Ananta <rananta@google.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 07/12] KVM: arm64: arm_spe: Give SPE enabled state to KVM
Date: Tue, 12 Nov 2024 10:37:06 +0000
Message-Id: <20241112103717.589952-8-james.clark@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241112103717.589952-1-james.clark@linaro.org>
References: <20241112103717.589952-1-james.clark@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_023828_180189_DD2BC83E 
X-CRM114-Status: GOOD (  20.29  )
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

Currently in nVHE, KVM has to check if SPE is enabled on every guest
switch even if it was never used. Because it's a debug feature and is
more likely to not be used than used, give KVM the SPE buffer status to
allow a much simpler and faster do-nothing path in the hyp.

This is always called with preemption disabled except for probe/hotplug
which gets wrapped with preempt_disable().

Signed-off-by: James Clark <james.clark@linaro.org>
---
 arch/arm64/include/asm/kvm_host.h |  6 ++++++
 arch/arm64/kvm/debug.c            | 29 +++++++++++++++++++++++++++++
 drivers/perf/arm_spe_pmu.c        | 13 +++++++++++--
 3 files changed, 46 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index 5dfc3f4f74b2..7f1e32d40f0c 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -641,6 +641,8 @@ struct kvm_host_data {
 	struct {
 		/* Host CPU features, set at init */
 		u8 feats;
+		/* Host CPU state */
+		u8 state;
 	} flags;
 
 	/*
@@ -941,6 +943,8 @@ struct kvm_vcpu_arch {
 #define HOST_FEAT_HAS_TRBE	__kvm_single_flag(feats, BIT(1))
 /* CPU has Feat_TRF */
 #define HOST_FEAT_HAS_TRF	__kvm_single_flag(feats, BIT(2))
+/* PMBLIMITR_EL1_E is set (SPE profiling buffer enabled) */
+#define HOST_STATE_SPE_EN	__kvm_single_flag(state, BIT(0))
 
 /* Pointer to the vcpu's SVE FFR for sve_{save,load}_state() */
 #define vcpu_sve_pffr(vcpu) (kern_hyp_va((vcpu)->arch.sve_state) +	\
@@ -1382,6 +1386,7 @@ static inline bool kvm_pmu_counter_deferred(struct perf_event_attr *attr)
 void kvm_set_pmu_events(u64 set, struct perf_event_attr *attr);
 void kvm_clr_pmu_events(u64 clr);
 bool kvm_set_pmuserenr(u64 val);
+void kvm_set_pmblimitr(u64 pmblimitr);
 #else
 static inline void kvm_set_pmu_events(u64 set, struct perf_event_attr *attr) {}
 static inline void kvm_clr_pmu_events(u64 clr) {}
@@ -1389,6 +1394,7 @@ static inline bool kvm_set_pmuserenr(u64 val)
 {
 	return false;
 }
+static inline void kvm_set_pmblimitr(u64 pmblimitr) {}
 #endif
 
 void kvm_vcpu_load_vhe(struct kvm_vcpu *vcpu);
diff --git a/arch/arm64/kvm/debug.c b/arch/arm64/kvm/debug.c
index fb41ef5d9db9..ed3b4d057c52 100644
--- a/arch/arm64/kvm/debug.c
+++ b/arch/arm64/kvm/debug.c
@@ -335,3 +335,32 @@ void kvm_arm_clear_debug(struct kvm_vcpu *vcpu)
 		}
 	}
 }
+
+static bool kvm_arm_skip_trace_state(void)
+{
+	/* pKVM hyp finds out the state for itself */
+	if (is_protected_kvm_enabled())
+		return true;
+
+	/* Make sure state gets there in one piece */
+	if (WARN_ON_ONCE(preemptible()))
+		return true;
+
+	return false;
+}
+
+void kvm_set_pmblimitr(u64 pmblimitr)
+{
+	/* Only read in nVHE */
+	if (has_vhe())
+		return;
+
+	if (kvm_arm_skip_trace_state())
+		return;
+
+	if (pmblimitr & PMBLIMITR_EL1_E)
+		host_data_set_flag(HOST_STATE_SPE_EN);
+	else
+		host_data_clear_flag(HOST_STATE_SPE_EN);
+}
+EXPORT_SYMBOL_GPL(kvm_set_pmblimitr);
diff --git a/drivers/perf/arm_spe_pmu.c b/drivers/perf/arm_spe_pmu.c
index 3569050f9cf3..6a79df363aa6 100644
--- a/drivers/perf/arm_spe_pmu.c
+++ b/drivers/perf/arm_spe_pmu.c
@@ -23,6 +23,7 @@
 #include <linux/interrupt.h>
 #include <linux/irq.h>
 #include <linux/kernel.h>
+#include <linux/kvm_host.h>
 #include <linux/list.h>
 #include <linux/module.h>
 #include <linux/of.h>
@@ -496,6 +497,12 @@ static u64 arm_spe_pmu_next_off(struct perf_output_handle *handle)
 	return limit;
 }
 
+static void arm_spe_write_pmblimitr(u64 val)
+{
+	write_sysreg_s(val, SYS_PMBLIMITR_EL1);
+	kvm_set_pmblimitr(val);
+}
+
 static void arm_spe_perf_aux_output_begin(struct perf_output_handle *handle,
 					  struct perf_event *event)
 {
@@ -524,7 +531,7 @@ static void arm_spe_perf_aux_output_begin(struct perf_output_handle *handle,
 	write_sysreg_s(base, SYS_PMBPTR_EL1);
 
 out_write_limit:
-	write_sysreg_s(limit, SYS_PMBLIMITR_EL1);
+	arm_spe_write_pmblimitr(limit);
 }
 
 static void arm_spe_perf_aux_output_end(struct perf_output_handle *handle)
@@ -552,7 +559,7 @@ static void arm_spe_pmu_disable_and_drain_local(void)
 	dsb(nsh);
 
 	/* Disable the profiling buffer */
-	write_sysreg_s(0, SYS_PMBLIMITR_EL1);
+	arm_spe_write_pmblimitr(0);
 	isb();
 }
 
@@ -1095,7 +1102,9 @@ static void __arm_spe_pmu_reset_local(void)
 	 * This is probably overkill, as we have no idea where we're
 	 * draining any buffered data to...
 	 */
+	preempt_disable();
 	arm_spe_pmu_disable_and_drain_local();
+	preempt_enable();
 
 	/* Reset the buffer base pointer */
 	write_sysreg_s(0, SYS_PMBPTR_EL1);
-- 
2.34.1


