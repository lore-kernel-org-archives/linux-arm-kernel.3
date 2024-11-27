Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A316D609C8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Nov 2024 10:04:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QZj1b2xrxu+uYiK1d2tMFby1ybMmB5QilRXAS0IFlr8=; b=udhJZ3NxzMqT0099j8Rm18wz/t
	dK4hTLLxbSjC4zqb+S+hr6u3oIgRJYixDLTgdltl6urQtWLoPdDobkqQNYDHQZuatR7W5KsXd6e2q
	Hc7Wfv56M9zp6MNtFgvwJweZJfMZi93Pft0Co71OSNbNa6Oi6fQ0t5gXImR0WfhlfN0vej2s3iod6
	8YNHc2XRvQpHrgOxOzOqmWSd+9O6I1CdnLeMcKgiH7qRRSH3OSKYm3k02T0g+aXDpEGinheXoWNE3
	mr8f1VdlLpEQNXf1aPl6Z8BO7hazvARlWMrbphA7I5J0aQCGMYS/tSK9Mdr3BD6d8Wmf9dkU+OKE5
	fDXrUJNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGEuY-0000000CmGn-0FfZ;
	Wed, 27 Nov 2024 10:04:42 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGErt-0000000CldM-3uiL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Nov 2024 10:01:59 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-aa51b8c5f4dso679095866b.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 27 Nov 2024 02:01:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732701716; x=1733306516; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QZj1b2xrxu+uYiK1d2tMFby1ybMmB5QilRXAS0IFlr8=;
        b=sEfXBesrXeevi3DrrqVUDKokgPy05SnW55CkRDvCQS+mgUDdWtav5k6+ziM/e/Ujxm
         CUvIgADsTr1rqhQXluEZxDb+EnV+Kqk+31Vec7nRkcqVLJkiB+8hhznKP5zfo8PSbAG0
         8jxndjjh8y5XJaxEmvm8WhDW0SHgpj4EyAU7N61ijpNKV2sBEDbZZ5f2b9ORWjuhUf+f
         GzHrq0ZEkHNnNgqngm+StSxuZOO0315Q3gx580A5XajkyMV6MhMpvt52DQIGr2C681oj
         /0BZQ48MmpPQoYUTun3ci2jh6Nwc9Ch/etd79mP+90835KnHj9OgXXPuff65bun3ILRk
         4Mfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732701716; x=1733306516;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QZj1b2xrxu+uYiK1d2tMFby1ybMmB5QilRXAS0IFlr8=;
        b=kjCULer9g6dAbDJspitP07sX7+odCbwf/1PXEbU1q2Tx22VQc/ObXL9fGqCw1+HjeS
         3Zeu+4/qt1GnpjZEGUnM/TzzvHbDkVmxu/6cJQuaKxL/EAXdZoyMIgW/+jen+Vj0d4BM
         NS7O9PVFaRprRnthQZcXJj/0tSZUnvOsN0RmgLoRuo7+CXdDfb3af7d3F+K7vYVp6fY4
         2RDNb2oGi+s9q4FxJgcHfqMhprtHRgpLbvkKhEPk2gApzwXBZuf4CZCnMfJXpVkrtliS
         Zs5TQRNei6AOWpWJ0uAiblU/hPTdveqFaEhMlF+3aoEJqT1RqK2D3ilg+LSzSev85S3j
         Hf5w==
X-Forwarded-Encrypted: i=1; AJvYcCVU4yf0jS31Ihrerv5HhlbZDm+CeLfrNYOY4E0MY8OOozYuOToZFmZ1p8taIn4QMZkAqWBOjSR/EamJ1xXhMppA@lists.infradead.org
X-Gm-Message-State: AOJu0YwopMKZ0rSxPh0WzicjbqZb4oLEBo+8gKWX8gyJ+MBqzRqED2tm
	T39pBIdwKgVNGdeuqRUyZoAfqZ8uuT7zOT0jGoG8ywMNoeatFuw/wb0EHugdz6M=
X-Gm-Gg: ASbGnctjhRMG2crhpn4lmKTxMGIKhuuq3mCocg7htDv11NfMfp3enqlLKFvffdkRfgs
	oDbMchkhRoDWYxG7Uf6YIyoUPXqcM619SzxdaTVDRI+RJABNB8XmKRH5r7P/XfrpENqFwqH/kcD
	tosknBh/ER2VgUQA2S9p0E2lZO1TMrBTjuuoDxHXd+Jg/C0/7hC3aat+8QYnvQA9Ykjp4mtIhex
	hWER7nYSC7thHvOe3dTzFe/m9aKuJZcP1nmn19meyEjltT0pQ==
X-Google-Smtp-Source: AGHT+IG/yqZM7gQ80KFLlzLstWak78i78p9Kn8TAyp6ek6i+4dK+mgf7V+8bPvrzOvcaxxY6vZeWpQ==
X-Received: by 2002:a17:907:781a:b0:aa5:3b1c:77a7 with SMTP id a640c23a62f3a-aa580ecc354mr151894466b.6.1732701715739;
        Wed, 27 Nov 2024 02:01:55 -0800 (PST)
Received: from pop-os.. ([145.224.90.200])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa547ffb152sm421887466b.62.2024.11.27.02.01.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Nov 2024 02:01:55 -0800 (PST)
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
	Mark Brown <broonie@kernel.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Fuad Tabba <tabba@google.com>,
	Shiqi Liu <shiqiliu@hust.edu.cn>,
	James Morse <james.morse@arm.com>,
	Raghavendra Rao Ananta <rananta@google.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v8 2/8] KVM: arm64: Track presence of SPE/TRBE in kvm_host_data instead of vCPU
Date: Wed, 27 Nov 2024 10:01:19 +0000
Message-Id: <20241127100130.1162639-3-james.clark@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241127100130.1162639-1-james.clark@linaro.org>
References: <20241127100130.1162639-1-james.clark@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241127_020157_976900_8D3C9949 
X-CRM114-Status: GOOD (  20.79  )
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

From: Oliver Upton <oliver.upton@linux.dev>

Add flags to kvm_host_data to track if SPE/TRBE is present +
programmable on a per-CPU basis. Set the flags up at init rather than
vcpu_load() as the programmability of these buffers is unlikely to
change.

Signed-off-by: Oliver Upton <oliver.upton@linux.dev>
Reviewed-by: James Clark <james.clark@linaro.org>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 arch/arm64/include/asm/kvm_host.h  | 19 +++++++++-------
 arch/arm64/kvm/arm.c               |  3 ---
 arch/arm64/kvm/debug.c             | 36 ++++++++----------------------
 arch/arm64/kvm/hyp/nvhe/debug-sr.c |  8 +++----
 4 files changed, 24 insertions(+), 42 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index ad514434f3fe..7e3478386351 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -610,6 +610,10 @@ struct cpu_sve_state {
  * field.
  */
 struct kvm_host_data {
+#define KVM_HOST_DATA_FLAG_HAS_SPE	0
+#define KVM_HOST_DATA_FLAG_HAS_TRBE	1
+	unsigned long flags;
+
 	struct kvm_cpu_context host_ctxt;
 
 	/*
@@ -911,10 +915,6 @@ struct kvm_vcpu_arch {
 #define EXCEPT_AA64_EL2_SERR	__vcpu_except_flags(7)
 /* Guest debug is live */
 #define DEBUG_DIRTY		__vcpu_single_flag(iflags, BIT(4))
-/* Save SPE context if active  */
-#define DEBUG_STATE_SAVE_SPE	__vcpu_single_flag(iflags, BIT(5))
-/* Save TRBE context if active  */
-#define DEBUG_STATE_SAVE_TRBE	__vcpu_single_flag(iflags, BIT(6))
 
 /* SVE enabled for host EL0 */
 #define HOST_SVE_ENABLED	__vcpu_single_flag(sflags, BIT(0))
@@ -1310,6 +1310,13 @@ DECLARE_KVM_HYP_PER_CPU(struct kvm_host_data, kvm_host_data);
 	 &this_cpu_ptr_hyp_sym(kvm_host_data)->f)
 #endif
 
+#define host_data_test_flag(flag)					\
+	(test_bit(KVM_HOST_DATA_FLAG_##flag, host_data_ptr(flags)))
+#define host_data_set_flag(flag)					\
+	set_bit(KVM_HOST_DATA_FLAG_##flag, host_data_ptr(flags))
+#define host_data_clear_flag(flag)					\
+	clear_bit(KVM_HOST_DATA_FLAG_##flag, host_data_ptr(flags))
+
 /* Check whether the FP regs are owned by the guest */
 static inline bool guest_owns_fp_regs(void)
 {
@@ -1370,10 +1377,6 @@ static inline bool kvm_pmu_counter_deferred(struct perf_event_attr *attr)
 	return (!has_vhe() && attr->exclude_host);
 }
 
-/* Flags for host debug state */
-void kvm_arch_vcpu_load_debug_state_flags(struct kvm_vcpu *vcpu);
-void kvm_arch_vcpu_put_debug_state_flags(struct kvm_vcpu *vcpu);
-
 #ifdef CONFIG_KVM
 void kvm_set_pmu_events(u64 set, struct perf_event_attr *attr);
 void kvm_clr_pmu_events(u64 clr);
diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index ab1bf9ccf385..3822774840e1 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -617,15 +617,12 @@ void kvm_arch_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
 
 	vcpu_set_pauth_traps(vcpu);
 
-	kvm_arch_vcpu_load_debug_state_flags(vcpu);
-
 	if (!cpumask_test_cpu(cpu, vcpu->kvm->arch.supported_cpus))
 		vcpu_set_on_unsupported_cpu(vcpu);
 }
 
 void kvm_arch_vcpu_put(struct kvm_vcpu *vcpu)
 {
-	kvm_arch_vcpu_put_debug_state_flags(vcpu);
 	kvm_arch_vcpu_put_fp(vcpu);
 	if (has_vhe())
 		kvm_vcpu_put_vhe(vcpu);
diff --git a/arch/arm64/kvm/debug.c b/arch/arm64/kvm/debug.c
index 0dbabb6e1108..dd9e139dfd13 100644
--- a/arch/arm64/kvm/debug.c
+++ b/arch/arm64/kvm/debug.c
@@ -299,40 +299,22 @@ void kvm_arm_clear_debug(struct kvm_vcpu *vcpu)
 	}
 }
 
-void kvm_arch_vcpu_load_debug_state_flags(struct kvm_vcpu *vcpu)
+void kvm_init_host_debug_data(void)
 {
-	u64 dfr0;
+	u64 dfr0 = read_sysreg(id_aa64dfr0_el1);
+
+	if (cpuid_feature_extract_signed_field(dfr0, ID_AA64DFR0_EL1_PMUVer_SHIFT) > 0)
+		*host_data_ptr(nr_event_counters) = FIELD_GET(ARMV8_PMU_PMCR_N,
+							      read_sysreg(pmcr_el0));
 
-	/* For VHE, there is nothing to do */
 	if (has_vhe())
 		return;
 
-	dfr0 = read_sysreg(id_aa64dfr0_el1);
-	/*
-	 * If SPE is present on this CPU and is available at current EL,
-	 * we may need to check if the host state needs to be saved.
-	 */
 	if (cpuid_feature_extract_unsigned_field(dfr0, ID_AA64DFR0_EL1_PMSVer_SHIFT) &&
-	    !(read_sysreg_s(SYS_PMBIDR_EL1) & BIT(PMBIDR_EL1_P_SHIFT)))
-		vcpu_set_flag(vcpu, DEBUG_STATE_SAVE_SPE);
+	    !(read_sysreg_s(SYS_PMBIDR_EL1) & PMBIDR_EL1_P))
+		host_data_set_flag(HAS_SPE);
 
-	/* Check if we have TRBE implemented and available at the host */
 	if (cpuid_feature_extract_unsigned_field(dfr0, ID_AA64DFR0_EL1_TraceBuffer_SHIFT) &&
 	    !(read_sysreg_s(SYS_TRBIDR_EL1) & TRBIDR_EL1_P))
-		vcpu_set_flag(vcpu, DEBUG_STATE_SAVE_TRBE);
-}
-
-void kvm_arch_vcpu_put_debug_state_flags(struct kvm_vcpu *vcpu)
-{
-	vcpu_clear_flag(vcpu, DEBUG_STATE_SAVE_SPE);
-	vcpu_clear_flag(vcpu, DEBUG_STATE_SAVE_TRBE);
-}
-
-void kvm_init_host_debug_data(void)
-{
-	u64 dfr0 = read_sysreg(id_aa64dfr0_el1);
-
-	if (cpuid_feature_extract_signed_field(dfr0, ID_AA64DFR0_EL1_PMUVer_SHIFT) > 0)
-		*host_data_ptr(nr_event_counters) = FIELD_GET(ARMV8_PMU_PMCR_N,
-							      read_sysreg(pmcr_el0));
+		host_data_set_flag(HAS_TRBE);
 }
diff --git a/arch/arm64/kvm/hyp/nvhe/debug-sr.c b/arch/arm64/kvm/hyp/nvhe/debug-sr.c
index 1e2a26d0196e..858bb38e273f 100644
--- a/arch/arm64/kvm/hyp/nvhe/debug-sr.c
+++ b/arch/arm64/kvm/hyp/nvhe/debug-sr.c
@@ -82,10 +82,10 @@ static void __debug_restore_trace(u64 trfcr_el1)
 void __debug_save_host_buffers_nvhe(struct kvm_vcpu *vcpu)
 {
 	/* Disable and flush SPE data generation */
-	if (vcpu_get_flag(vcpu, DEBUG_STATE_SAVE_SPE))
+	if (host_data_test_flag(HAS_SPE))
 		__debug_save_spe(host_data_ptr(host_debug_state.pmscr_el1));
 	/* Disable and flush Self-Hosted Trace generation */
-	if (vcpu_get_flag(vcpu, DEBUG_STATE_SAVE_TRBE))
+	if (host_data_test_flag(HAS_TRBE))
 		__debug_save_trace(host_data_ptr(host_debug_state.trfcr_el1));
 }
 
@@ -96,9 +96,9 @@ void __debug_switch_to_guest(struct kvm_vcpu *vcpu)
 
 void __debug_restore_host_buffers_nvhe(struct kvm_vcpu *vcpu)
 {
-	if (vcpu_get_flag(vcpu, DEBUG_STATE_SAVE_SPE))
+	if (host_data_test_flag(HAS_SPE))
 		__debug_restore_spe(*host_data_ptr(host_debug_state.pmscr_el1));
-	if (vcpu_get_flag(vcpu, DEBUG_STATE_SAVE_TRBE))
+	if (host_data_test_flag(HAS_TRBE))
 		__debug_restore_trace(*host_data_ptr(host_debug_state.trfcr_el1));
 }
 
-- 
2.34.1


