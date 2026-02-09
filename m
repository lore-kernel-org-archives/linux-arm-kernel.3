Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54E28E94623
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Feb 2026 22:41:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EEaHOE5nznf9+zz/kBeN5l5G1L0iV5xIIbwKx1lv3GQ=; b=ZNGRtPjH0wPxp96Vx8U/gDyWlV
	gPK0yi5IQoMMz1V5EKeKkAm4n5T+0GkSIiXg0D6K6p16jWJr/rEXXyPhyx2mdSV8XvqZ8NFMexJ+T
	4Rnlu0FPKqLDDNwBS79kaGEs9NY6qbfju8/CKOt6rxKSsuUT7nUABCkpRivDxKZXucJ1508HXp8qc
	FEUnneuQ/VxJjT//yjZ82nNLX+EBHVzcwxKtT31gmyRBa7r0o4qs8M8CSUUNRStlzU09Ggedftdgb
	1QCTKpMr6ziHiyPa0IPt32HHLIJ4nI4PJvGAUWM2nTYdVybC/5M+dZzAjF+NBpNyPny14SQE4FSby
	N03T6DdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpZwN-0000000G7cg-40Ek;
	Mon, 09 Feb 2026 22:41:12 +0000
Received: from mail-oa1-x4a.google.com ([2001:4860:4864:20::4a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpZwB-0000000G7Ns-0eca
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Feb 2026 22:41:04 +0000
Received: by mail-oa1-x4a.google.com with SMTP id 586e51a60fabf-4096f92cf50so8755515fac.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Feb 2026 14:40:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770676857; x=1771281657; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=EEaHOE5nznf9+zz/kBeN5l5G1L0iV5xIIbwKx1lv3GQ=;
        b=rjO7eA/9/3NoUcdASIRlDXaFHmhGTexdUBSb/XgqBSgyFRF3+LWYDcdNMcRY1vHCzj
         OpfypfSKUfyb4MHYeD8uHZW3NnD15esLMvq9UczeOg1h/U+hBGmxtXNRO3isSG/CqQLq
         Xrmrf78mkD8oWOoTo8jsQYAnzc2iHJAjAhKGxtDb11OMtrUMZSnCrmY+bcVmyh8mBQje
         BA4/JtpdttCAMsINFrjMdF4h54z+izibcWosEBXSW/I7vFQPI8WEoFafJRemYWJ7YUf1
         Um+KSYqfi3Hb4VDBnYvUbkXE3+a9nrgv+/lAS1YcXqXvVDGE1HqgWhlnmx9iaa+5gVSh
         SmDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770676857; x=1771281657;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EEaHOE5nznf9+zz/kBeN5l5G1L0iV5xIIbwKx1lv3GQ=;
        b=dS0bNeqgXIeQ+xRcZvqxWPfwN82MYSYtYpKDQbbPHecu/KLmWENUy8UNy1SW0lOB68
         bepCIiQkUolUCUGvH0fxeBlVJk/No3WQF3Z6GLruln056sFlehyQRQrpRFjKZvE2p4f5
         td3T2UyHp8PRHiJ49ngkC/pWDp55ELj42XF5fLFeV8qbWxeuF3mc1Ia80mqeHmbIi2tS
         INaJtmwsY7vM/wKtzAXC6snlQSo2wjl1WO3UaP1VQ9oEIFVgFDgylpZrKJHTCsTN6v4N
         8bloIGN+z/NB1uefky8MjnodMxftMSqePzqjuoNvMYNqVYgWPBG9jgW3n//T1oBGueBP
         rfOA==
X-Forwarded-Encrypted: i=1; AJvYcCWPABHMBgK3sqdI80pUxlt1s8ePVCBDFqji1fBjhecFPd28OjVfUADJszFTU5hFaainfNKwRYUzdtwoFk/xmiMy@lists.infradead.org
X-Gm-Message-State: AOJu0YxxbO07+tfxdbnPFXBv6BITN9kxkckOrPMwitJc113D+HBYtiII
	Q172Qkj34oigv3o2nVPLWRqvH0U3YwGa2MWL8a6uPV4VXYKcq4lNyrToMSPy9LCSuJIsDi6SLPI
	UeM5hus1/OXQgcOG2eHIl9boK7g==
X-Received: from iojv23.prod.google.com ([2002:a5d:9497:0:b0:95a:608d:8cf9])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6820:6ec6:b0:66e:10ca:fcd5 with SMTP id 006d021491bc7-66e10cafdcfmr3750272eaf.12.1770676856769;
 Mon, 09 Feb 2026 14:40:56 -0800 (PST)
Date: Mon,  9 Feb 2026 22:14:07 +0000
In-Reply-To: <20260209221414.2169465-1-coltonlewis@google.com>
Mime-Version: 1.0
References: <20260209221414.2169465-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.53.0.rc2.204.g2597b5adb4-goog
Message-ID: <20260209221414.2169465-13-coltonlewis@google.com>
Subject: [PATCH v6 12/19] KVM: arm64: Enforce PMU event filter at vcpu_load()
From: Colton Lewis <coltonlewis@google.com>
To: kvm@vger.kernel.org
Cc: Alexandru Elisei <alexandru.elisei@arm.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Jonathan Corbet <corbet@lwn.net>, Russell King <linux@armlinux.org.uk>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Mingwei Zhang <mizhang@google.com>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Mark Rutland <mark.rutland@arm.com>, 
	Shuah Khan <shuah@kernel.org>, Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-perf-users@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Colton Lewis <coltonlewis@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260209_144059_242336_00B4C1E2 
X-CRM114-Status: GOOD (  16.60  )
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
 arch/arm64/kvm/pmu-direct.c | 48 +++++++++++++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/arch/arm64/kvm/pmu-direct.c b/arch/arm64/kvm/pmu-direct.c
index b07b521543478..4bcacc55c507f 100644
--- a/arch/arm64/kvm/pmu-direct.c
+++ b/arch/arm64/kvm/pmu-direct.c
@@ -165,6 +165,53 @@ u8 kvm_pmu_hpmn(struct kvm_vcpu *vcpu)
 	return *host_data_ptr(nr_event_counters);
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
+	unsigned long guest_counters = kvm_pmu_guest_counter_mask(pmu);
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
+		write_sysreg(i, pmselr_el0);
+		write_sysreg(val, pmxevtyper_el0);
+	}
+}
+
 /**
  * kvm_pmu_load() - Load untrapped PMU registers
  * @vcpu: Pointer to struct kvm_vcpu
@@ -192,6 +239,7 @@ void kvm_pmu_load(struct kvm_vcpu *vcpu)
 
 	pmu = vcpu->kvm->arch.arm_pmu;
 	guest_counters = kvm_pmu_guest_counter_mask(pmu);
+	kvm_pmu_apply_event_filter(vcpu);
 
 	for_each_set_bit(i, &guest_counters, ARMPMU_MAX_HWEVENTS) {
 		val = __vcpu_sys_reg(vcpu, PMEVCNTR0_EL0 + i);
-- 
2.53.0.rc2.204.g2597b5adb4-goog


