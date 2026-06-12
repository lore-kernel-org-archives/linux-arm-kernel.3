Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9CC3CD98DD
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Jun 2026 19:29:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0u2rhf2u+9BtP4X7BxzDJO2DJ1V1hUQCf9r3VcGxcNw=; b=qVLmhtkdll+FrcZdEdf3JZqeWy
	fTgTA8bnTYfiP8SttnHSdTjjKamBPKHkoe4jWTubcWv3QnonjEN2AozYnbZchciGM4YfYNz9lmdgk
	FjTXdg9/OvLLlYtbN9rFa53qsRZrDZbbSE8DeZclC96iV0ttSIw/u7jStNvglBdcJ5nOIN+YF4650
	cD+fEnpvljuSEHKTPR5PJQR2FHvk5499hArp60zbNkXVm/gY7QVC8S7EyBcxLBz9pkkf+TN9tALVl
	HC04tDpJ9WkZCHEpvYFU0I511fOrXUAeAUFV+kilyDI+iQRwjcW+4+82RqYkasMTimdWFmQw6UMsO
	nE21shCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY7ZN-0000000BSdi-0jKe;
	Fri, 12 Jun 2026 19:29:33 +0000
Received: from mail-oi1-x249.google.com ([2607:f8b0:4864:20::249])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY7ZD-0000000BSRb-35UX
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Jun 2026 19:29:24 +0000
Received: by mail-oi1-x249.google.com with SMTP id 5614622812f47-4863abb79b0so3524899b6e.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Jun 2026 12:29:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781292562; x=1781897362; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=0u2rhf2u+9BtP4X7BxzDJO2DJ1V1hUQCf9r3VcGxcNw=;
        b=tqZrSYfdbpMsTPJjh6NumZnlFW/79irH0X0aVCNxoT2rBFNDK0rTerPsEbiZcVDEdv
         y9nFJsvnixXW87Wb/8I36bicu4GDIW8jZNfLt2RAfwq3UyJsAxmBRFnD+QFXz6NLsGoh
         bcJWHtyN3UiGt9y0H5dnI+jlg8ZDRxktnnK11TI6mO4+8kMSIMnlK9Vlhx7thisTHRfO
         K581X174MyFqSge3U/SMyR0P/jLTO3z4OtW+ESCaEzXJQJ61te3zvgYzp0M1S7xwZ25b
         KkMYstCz0K/Dh/hhCFMMMLdOhHMTUzjdTGCllV1AUXXyGYq28douLWbX2ZTJhGVYs/Gg
         9v6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781292562; x=1781897362;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0u2rhf2u+9BtP4X7BxzDJO2DJ1V1hUQCf9r3VcGxcNw=;
        b=hyX1WmcifIfas3lf1R9LBt4pR8EfVF0P63cydh/4eK7i9bn0ZFr+6K+c0Epy0yvSfe
         M87b+8q2UQnszCoMJG5vmGr7xBmrjOlgiIa+9Gls4EQUJ2gVUd1jfsDZFXBvnRIOfWd0
         9nRxerdnKDkr9wKkVMaCQVjce4yO8/A/z64GqIhDDEf4bf5PoTcadNZpkBfBZi0bQ7Pe
         xn3296iciWnQMF8IREZ3JrOYT0SkOVPzW9i99SbF4QAzbPdCdMXIvBPEbln9WT2CFDXv
         cRYBcCHLXDSRl6MC+p7yrj7vK9FmIXvYBJOSw54cbJmDcT28z3Oxb37EuQ4fzatwBPUG
         Zg3A==
X-Forwarded-Encrypted: i=1; AFNElJ+PqZpD4IAcem4X33dc8fwONRa+tKNNJEMMcumTxA4j2Cj+SFH9V9FDAF3TjgUoWL33SzAqGqKBAS/JLfWGCDxU@lists.infradead.org
X-Gm-Message-State: AOJu0YwstdXVJcSQOfQ3pO86YAHB1kSCohtCPWQdAKuirElSlS+2A9Wu
	zbksjdOjJYLJkXC/UBZcTxI0q2XGsWGGOBqSOAtaXShwwWDv6N4XnRfmK5Vrlz5OluE2uBWUHys
	MLVFBHRWRfuYr67dz3/OTw4Qy6A==
X-Received: from jabkc1.prod.google.com ([2002:a05:6638:a501:b0:5e2:942b:e3dd])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:1a07:b0:485:6029:90e7 with SMTP id 5614622812f47-4872ddea116mr2184822b6e.10.1781292561509;
 Fri, 12 Jun 2026 12:29:21 -0700 (PDT)
Date: Fri, 12 Jun 2026 19:29:00 +0000
In-Reply-To: <20260612192909.1153907-1-coltonlewis@google.com>
Mime-Version: 1.0
References: <20260612192909.1153907-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.54.0.1136.gdb2ca164c4-goog
Message-ID: <20260612192909.1153907-13-coltonlewis@google.com>
Subject: [PATCH 12/21] KVM: arm64: Enforce PMU event filter at vcpu_load()
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
X-CRM114-CacheID: sfid-20260612_122923_787240_191AC78B 
X-CRM114-Status: GOOD (  16.62  )
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

The KVM API for event filtering says that counters do not count when
blocked by the event filter. To enforce that, the event filter must be
rechecked on every load since it might have changed since the last
time the guest wrote a value. If the event is filtered, exclude
counting at all exception levels before writing the hardware.

Signed-off-by: Colton Lewis <coltonlewis@google.com>
---
 arch/arm64/kvm/pmu-direct.c | 52 +++++++++++++++++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/arch/arm64/kvm/pmu-direct.c b/arch/arm64/kvm/pmu-direct.c
index 79022447cfb9a..49f1feb5d280c 100644
--- a/arch/arm64/kvm/pmu-direct.c
+++ b/arch/arm64/kvm/pmu-direct.c
@@ -131,6 +131,57 @@ u64 kvm_pmu_guest_counter_mask(struct arm_pmu *pmu)
 	return 0;
 }
 
+/**
+ * kvm_pmu_apply_event_filter()
+ * @vcpu: Pointer to vcpu struct
+ *
+ * To uphold the guarantee of the KVM PMU event filter, we must ensure
+ * no counter counts if the event is filtered. Accomplish this by
+ * filtering all exception levels if the event is filtered.
+ */
+static void kvm_pmu_apply_event_filter(struct kvm_vcpu *vcpu)
+{
+	struct arm_pmu *pmu = vcpu->kvm->arch.arm_pmu;
+	unsigned long guest_counters;
+	u64 evtyper_set = ARMV8_PMU_EXCLUDE_EL0 |
+		ARMV8_PMU_EXCLUDE_EL1;
+	u64 evtyper_clr = ARMV8_PMU_INCLUDE_EL2;
+	bool guest_include_el2;
+	u8 i;
+	u64 val;
+	u64 evsel;
+
+	if (!pmu)
+		return;
+
+	guest_counters = kvm_pmu_guest_counter_mask(pmu);
+
+	for_each_set_bit(i, &guest_counters, ARMPMU_MAX_HWEVENTS) {
+		if (i == ARMV8_PMU_CYCLE_IDX) {
+			val = __vcpu_sys_reg(vcpu, PMCCFILTR_EL0);
+			evsel = ARMV8_PMUV3_PERFCTR_CPU_CYCLES;
+		} else {
+			val = __vcpu_sys_reg(vcpu, PMEVTYPER0_EL0 + i);
+			evsel = val & kvm_pmu_event_mask(vcpu->kvm);
+		}
+
+		guest_include_el2 = (val & ARMV8_PMU_INCLUDE_EL2);
+		val &= ~evtyper_clr;
+
+		if (unlikely(is_hyp_ctxt(vcpu)) && guest_include_el2)
+			val &= ~ARMV8_PMU_EXCLUDE_EL1;
+
+		if (vcpu->kvm->arch.pmu_filter &&
+		    !test_bit(evsel, vcpu->kvm->arch.pmu_filter))
+			val |= evtyper_set;
+
+		if (i == ARMV8_PMU_CYCLE_IDX)
+			write_pmccfiltr(val);
+		else
+			write_pmevtypern(i, val);
+	}
+}
+
 /**
  * kvm_pmu_load() - Load untrapped PMU registers
  * @vcpu: Pointer to struct kvm_vcpu
@@ -158,6 +209,7 @@ void kvm_pmu_load(struct kvm_vcpu *vcpu)
 
 	pmu = vcpu->kvm->arch.arm_pmu;
 	guest_counters = kvm_pmu_guest_counter_mask(pmu);
+	kvm_pmu_apply_event_filter(vcpu);
 
 	for_each_set_bit(i, &guest_counters, ARMPMU_MAX_HWEVENTS) {
 		val = __vcpu_sys_reg(vcpu, PMEVCNTR0_EL0 + i);
-- 
2.54.0.1136.gdb2ca164c4-goog


