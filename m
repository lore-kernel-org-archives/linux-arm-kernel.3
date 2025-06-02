Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D822BC5B555
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Jun 2025 20:05:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oY77J80y2xgj2jg9N03EbI54De+Pf+kjVEC2/miRHXM=; b=b8GztHNFy2QNkXFppvsjiCfH7k
	vYwaQOJRFnJyCSqeVUY4/po5Yh+z1otdQzLKPfWezCLbgl8/P/Pm8ptcvv3WEGhGWbZO1QB2d/cdi
	PYw4q43O7W7Sea2osAHUf5taSbTYB0NsTPf/DzCgfBFfYeMBlpVVKaotjk1yaW5pTRDL9A2ok+D6c
	Ktwj6fQKG4N67yNRl3Mr425C23CdzZYF3V9IxZCngIWyKbfignSJLQz6LGT2zmhcbMPUvnED3W+I5
	fFx+uqvnfBs2JlfGG/cjAJGD5bQ9GT2c3BdxBXlimJ2g1NEinVT19GhRbuEeUvCSV+oazOIFcFd5o
	RU8KmlvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMBPP-00000008fkk-2f0S;
	Mon, 02 Jun 2025 20:05:23 +0000
Received: from mail-il1-x149.google.com ([2607:f8b0:4864:20::149])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMAqQ-00000008UMk-0PCK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Jun 2025 19:29:15 +0000
Received: by mail-il1-x149.google.com with SMTP id e9e14a558f8ab-3dda4bb1c97so17182975ab.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Jun 2025 12:29:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748892553; x=1749497353; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=oY77J80y2xgj2jg9N03EbI54De+Pf+kjVEC2/miRHXM=;
        b=fdLttqHZT4cNJAHuK73sX5tv3NFPcZd863LpD8Zltz8I+2091Wj5PXxwTJdQ9zMp6T
         JlZ1GTOZJsLB62osU/lx6oFzL36C+3wJUIjcmuUuDIQQfQjJ4ecMOAiAiykxiJx7xHum
         l8BwwI3RvkSHxjBK03d0EgPZX1kMENC2eb39+fMUmTRBYfkPaahQ1qwFmMEQP60qtkvu
         9p8kCiSnaIUOnvwPf5Duh1q2QXRJjKsQSKRentsqrF5sGO+hP+rR4JuYpPMqhEAP4szG
         E7tV0KH66iXda4b2FxHSnO7T85/J7mWxJjZkhmB+m/nU/6z0LsuFMxEHL0EIGvSavn9Y
         H8iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748892553; x=1749497353;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oY77J80y2xgj2jg9N03EbI54De+Pf+kjVEC2/miRHXM=;
        b=VafRMKXq8KbGqZHltMJuZ0mLOYFt2IgDeGkjQrwG2hydcjLrgClvej/Xdyv1LQli1R
         OyiIhyBytcMRS1s4G0ADQ4TmOI61fuN4ed45QwmIdvg+4Wxp56uV/nWNT86urTJlP3+B
         CkdUhS/RC9ONLJpnbM0johHXlhbvAmtU/eWICXJyBJBeVwJtlK2yQD6ueCLFJuvU1goW
         U5aM1GuxJj7H5tjgc+WTjfaYkxjJ0ll6PS8ld14JXE6b8nOTN3AmJcOGZvcAqJ5oDzO7
         L2rGaYICOEj6GS4PSpTo0BsZZa3qyBLLXbYmAfJXn/oOEO1Dsa31k6upuVl96FbWPemu
         zcZg==
X-Forwarded-Encrypted: i=1; AJvYcCVLqk1d3Dk5BsIVRkZsNhWnhHnVrfmXexBL1oq9M9tHGtverQyqDEzMAxrfHvCPYaP5VZEF9M1C50yAA4RXGZhZ@lists.infradead.org
X-Gm-Message-State: AOJu0YwqNKkwlDyUGLvAFq9s0CLKR44ykboxAjHyQE5K3X7KZOzU9dDs
	MCMdRQRnrmHfoS9SK+vt5qGIK9WigfjEdn+bfTZdIxsQITqNaLAbsfikMbsfOUgSD5HqLL8XuBm
	Zo6JA/GARI/7bpwvnF8/Q6h+UCg==
X-Google-Smtp-Source: AGHT+IGwil/ABNZ8qf4ojpW0M3/YV2pZdfKPjkXHE38VBvyOQZsaB+n377hoKIbc0ge0ZdQrftjzuWpR/waySgTS4w==
X-Received: from ilbbs17.prod.google.com ([2002:a05:6e02:2411:b0:3dc:6a8b:b101])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6e02:4414:20b0:3dd:b569:6448 with SMTP id e9e14a558f8ab-3ddb5696709mr16632695ab.6.1748892553051;
 Mon, 02 Jun 2025 12:29:13 -0700 (PDT)
Date: Mon,  2 Jun 2025 19:27:00 +0000
In-Reply-To: <20250602192702.2125115-1-coltonlewis@google.com>
Mime-Version: 1.0
References: <20250602192702.2125115-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.49.0.1204.g71687c7c1d-goog
Message-ID: <20250602192702.2125115-16-coltonlewis@google.com>
Subject: [PATCH 15/17] KVM: arm64: Inject recorded guest interrupts
From: Colton Lewis <coltonlewis@google.com>
To: kvm@vger.kernel.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
	Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Mark Rutland <mark.rutland@arm.com>, 
	Shuah Khan <shuah@kernel.org>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-perf-users@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Colton Lewis <coltonlewis@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250602_122914_136338_0C5514E6 
X-CRM114-Status: GOOD (  17.51  )
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

When we re-enter the VM after handling a PMU interrupt, calculate
whether it was any of the guest counters that overflowed and inject an
interrupt into the guest if so.

Signed-off-by: Colton Lewis <coltonlewis@google.com>
---
 arch/arm64/include/asm/kvm_host.h |  3 ++-
 arch/arm64/kvm/pmu-emul.c         |  4 ++--
 arch/arm64/kvm/pmu-part.c         | 22 +++++++++++++++++++++-
 arch/arm64/kvm/pmu.c              |  7 ++++++-
 4 files changed, 31 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index 955359f20161..0af8cc4c340f 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -1714,9 +1714,10 @@ bool kvm_vcpu_pmu_is_partitioned(struct kvm_vcpu *vcpu);
 struct kvm_pmu_events *kvm_get_pmu_events(void);
 void kvm_vcpu_pmu_restore_guest(struct kvm_vcpu *vcpu);
 void kvm_vcpu_pmu_restore_host(struct kvm_vcpu *vcpu);
-bool kvm_pmu_overflow_status(struct kvm_vcpu *vcpu);
+bool kvm_pmu_emul_overflow_status(struct kvm_vcpu *vcpu);
 void kvm_pmu_load(struct kvm_vcpu *vcpu);
 void kvm_pmu_put(struct kvm_vcpu *vcpu);
+bool kvm_pmu_part_overflow_status(struct kvm_vcpu *vcpu);
 
 /*
  * Updates the vcpu's view of the pmu events for this cpu.
diff --git a/arch/arm64/kvm/pmu-emul.c b/arch/arm64/kvm/pmu-emul.c
index ff86c66e1b48..0ffabada1dad 100644
--- a/arch/arm64/kvm/pmu-emul.c
+++ b/arch/arm64/kvm/pmu-emul.c
@@ -320,7 +320,7 @@ void kvm_pmu_reprogram_counter_mask(struct kvm_vcpu *vcpu, u64 val)
  * counter where the values of the global enable control, PMOVSSET_EL0[n], and
  * PMINTENSET_EL1[n] are all 1.
  */
-bool kvm_pmu_overflow_status(struct kvm_vcpu *vcpu)
+bool kvm_pmu_emul_overflow_status(struct kvm_vcpu *vcpu)
 {
 	u64 reg = __vcpu_sys_reg(vcpu, PMOVSSET_EL0);
 
@@ -457,7 +457,7 @@ static void kvm_pmu_perf_overflow(struct perf_event *perf_event,
 		kvm_pmu_counter_increment(vcpu, BIT(idx + 1),
 					  ARMV8_PMUV3_PERFCTR_CHAIN);
 
-	if (kvm_pmu_overflow_status(vcpu)) {
+	if (kvm_pmu_emul_overflow_status(vcpu)) {
 		kvm_make_request(KVM_REQ_IRQ_PENDING, vcpu);
 
 		if (!in_nmi())
diff --git a/arch/arm64/kvm/pmu-part.c b/arch/arm64/kvm/pmu-part.c
index 0e1a2235e992..1d85e7ce76c8 100644
--- a/arch/arm64/kvm/pmu-part.c
+++ b/arch/arm64/kvm/pmu-part.c
@@ -252,7 +252,7 @@ void kvm_pmu_load(struct kvm_vcpu *vcpu)
 	write_pmcr(val);
 
 	/*
-	 * Loading these registers is tricky because of
+	 * Loading these registers is more intricate because of
 	 * 1. Applying only the bits for guest counters (indicated by mask)
 	 * 2. Setting and clearing are different registers
 	 */
@@ -336,3 +336,23 @@ void kvm_pmu_handle_guest_irq(u64 govf)
 
 	__vcpu_sys_reg(vcpu, PMOVSSET_EL0) |= govf;
 }
+
+/**
+ * kvm_pmu_part_overflow_status() - Determine if any guest counters have overflowed
+ * @vcpu: Ponter to struct kvm_vcpu
+ *
+ * Determine if any guest counters have overflowed and therefore an
+ * IRQ needs to be injected into the guest.
+ *
+ * Return: True if there was an overflow, false otherwise
+ */
+bool kvm_pmu_part_overflow_status(struct kvm_vcpu *vcpu)
+{
+	struct arm_pmu *pmu = vcpu->kvm->arch.arm_pmu;
+	u64 mask = kvm_pmu_guest_counter_mask(pmu);
+	u64 pmovs = __vcpu_sys_reg(vcpu, PMOVSSET_EL0);
+	u64 pmint = read_pmintenset();
+	u64 pmcr = read_pmcr();
+
+	return (pmcr & ARMV8_PMU_PMCR_E) && (mask & pmovs & pmint);
+}
diff --git a/arch/arm64/kvm/pmu.c b/arch/arm64/kvm/pmu.c
index 2dcfac3ea9c6..6c3151dec25a 100644
--- a/arch/arm64/kvm/pmu.c
+++ b/arch/arm64/kvm/pmu.c
@@ -425,7 +425,11 @@ static void kvm_pmu_update_state(struct kvm_vcpu *vcpu)
 	struct kvm_pmu *pmu = &vcpu->arch.pmu;
 	bool overflow;
 
-	overflow = kvm_pmu_overflow_status(vcpu);
+	if (kvm_vcpu_pmu_is_partitioned(vcpu))
+		overflow = kvm_pmu_part_overflow_status(vcpu);
+	else
+		overflow = kvm_pmu_emul_overflow_status(vcpu);
+
 	if (pmu->irq_level == overflow)
 		return;
 
@@ -694,6 +698,7 @@ int kvm_arm_pmu_v3_set_attr(struct kvm_vcpu *vcpu, struct kvm_device_attr *attr)
 			return -EBUSY;
 
 		kvm_debug("Set kvm ARM PMU irq: %d\n", irq);
+
 		vcpu->arch.pmu.irq_num = irq;
 		return 0;
 	}
-- 
2.49.0.1204.g71687c7c1d-goog


