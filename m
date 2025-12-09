Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39BF2D3B998
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Dec 2025 20:53:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OtKUAKNDvUk1bFrFUkDSMLUOkfepy8OH/MA9DzHIeSk=; b=uZlzPCtVDqiEgmWk2s/CIYH8BI
	hTEi4StuqJ4J/IghUxZ0cwYoclygZ0Q+x2jaCtJFDvWzMBx0B4tScQ8HNYkHyPsNtEy3ATRsVH++Z
	o6n9JAL2SiYlzj24FGf7DQd0mw+r71sTOxNszPV0Bw+xxGZ0+uUEJTDNejc5PWyzJJk9T9NyXKxpM
	anecm5pZiV+j2+torQTkQ3D8CUEfWda3JJFNsAW8YmmBUW2TR+DcW/UraTpruszwlMoTivl8wbsR4
	jlU5ZBV/gtShK3O8zM8si4DEUJjie8/ELwcALKhjprgXuG0ZrxAVWhVXaFWpOec7qDLlnayhVwHp1
	211Q4q4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vT4hv-0000000ElQk-3zJM;
	Tue, 09 Dec 2025 20:53:15 +0000
Received: from mail-ot1-x349.google.com ([2607:f8b0:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vT4hU-0000000EkqQ-1u8R
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Dec 2025 20:52:50 +0000
Received: by mail-ot1-x349.google.com with SMTP id 46e09a7af769-7c7593b5c93so10335394a34.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Dec 2025 12:52:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1765313567; x=1765918367; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=OtKUAKNDvUk1bFrFUkDSMLUOkfepy8OH/MA9DzHIeSk=;
        b=vdbzv8cJV/YtT7TH8w2rNVESgw/k5mVvw4T6UBUDCj12I6JSRO3lLUFhBMRtL560Gz
         VsIkEWmgEM1/jk8D0kEBwliVmmcIOBeNskW42y5tcP80CqfyxTVtY+XtRpyl6qeie6As
         h9Aam/QclnVCyEhlx9ZRNYSGtUpiJqnYyJ8NivwiL9Z7xHpbTVvDz9+Pi6Dl05tV8uzT
         rI/jT6k0ki2JS5P3/jhzt/sF82zKsBI5OEBqO2LAhdI7VDxtQ2XAbs7hOxGjmm743eGC
         Obtu4qxLked3FdhCYhw/RRn1+mi9t/D2A1/18GOUskE3Gw4jV/8PJDDD/h9OSgSO381W
         NcLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765313567; x=1765918367;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OtKUAKNDvUk1bFrFUkDSMLUOkfepy8OH/MA9DzHIeSk=;
        b=cfYk61qlV7tAA1M8OxZVuqZBd0cLz/ZgNQCkpg/5+TE2fWmiCbxM5BeKxtDZ14TAbb
         eVqrvDZpf/xnLRjAQq702djEDAd0zz5Ig8LcyQcY7txTK8ghvFmRc8pO712dxJIloH47
         IAhGXJiCa5QzGrF+HrVFJ+SCbLJ6OI3jO4i87TYd/NovbRxc/I8bbLzJaTIR6syh42Ui
         OSV4GHNSq3jfan7u0sFNqOntDj5wOrELZucyvMind14Kl4QY1YkzlQEpwZXadxM51sX2
         PBLRiUpkAVw6eg1E0JNyD0rtOrbmTAdoCLfANajZiOqmY+Vxl6RlcrpMOHdEEL6V2wUg
         tbgg==
X-Forwarded-Encrypted: i=1; AJvYcCW230HzzY6iEyAzmdQ/6ZmRPFSCVmhdkXIjp3AeJoQrqRMC4P8WZeK2i/Dl5vkuG3u2li8Hc7+XLP1jmux8YOhV@lists.infradead.org
X-Gm-Message-State: AOJu0YyXm3Q4jIr3XlYfAiRa6w47HzO/s01f+9ueYNvJ8zgJSEEwV0Vv
	8205YsBguM2Ak9vzh7du/U8yroUlv9IHhx8+itI6kHSmz2bffmXdNgSckm/6tzNnywzbA2nOV7I
	Te3pnzIB0lu3M9JyLJhw05oUEyQ==
X-Google-Smtp-Source: AGHT+IElus7zwyOd6GpcWSRDylwpIxEDMWdFHeMbdxYXsYAzEkLnXoWZD854plNF0r3PILxeHcsu/DPU8yH50AgLyg==
X-Received: from jabfa16.prod.google.com ([2002:a05:6638:6190:b0:5b7:56fc:a47f])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6820:c92:b0:659:9a49:8f68 with SMTP id 006d021491bc7-65b2aca3bc6mr107540eaf.45.1765313567368;
 Tue, 09 Dec 2025 12:52:47 -0800 (PST)
Date: Tue,  9 Dec 2025 20:51:18 +0000
In-Reply-To: <20251209205121.1871534-1-coltonlewis@google.com>
Mime-Version: 1.0
References: <20251209205121.1871534-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.52.0.239.gd5f0c6e74e-goog
Message-ID: <20251209205121.1871534-22-coltonlewis@google.com>
Subject: [PATCH v5 21/24] KVM: arm64: Inject recorded guest interrupts
From: Colton Lewis <coltonlewis@google.com>
To: kvm@vger.kernel.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
	Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Mingwei Zhang <mizhang@google.com>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Mark Rutland <mark.rutland@arm.com>, Shuah Khan <shuah@kernel.org>, 
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-perf-users@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Colton Lewis <coltonlewis@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251209_125248_747077_376D993B 
X-CRM114-Status: GOOD (  14.74  )
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
 arch/arm64/include/asm/kvm_pmu.h |  2 ++
 arch/arm64/kvm/pmu-direct.c      | 20 ++++++++++++++++++++
 arch/arm64/kvm/pmu-emul.c        |  4 ++--
 arch/arm64/kvm/pmu.c             |  6 +++++-
 4 files changed, 29 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_pmu.h b/arch/arm64/include/asm/kvm_pmu.h
index e4cbab0fd09cf..47e6f2a14e381 100644
--- a/arch/arm64/include/asm/kvm_pmu.h
+++ b/arch/arm64/include/asm/kvm_pmu.h
@@ -92,6 +92,8 @@ bool pmu_counter_idx_valid(struct kvm_vcpu *vcpu, u64 idx);
 void kvm_vcpu_pmu_restore_guest(struct kvm_vcpu *vcpu);
 void kvm_vcpu_pmu_restore_host(struct kvm_vcpu *vcpu);
 void kvm_vcpu_pmu_resync_el0(void);
+bool kvm_pmu_emul_overflow_status(struct kvm_vcpu *vcpu);
+bool kvm_pmu_part_overflow_status(struct kvm_vcpu *vcpu);
 
 #define kvm_vcpu_has_pmu(vcpu)					\
 	(vcpu_has_feature(vcpu, KVM_ARM_VCPU_PMU_V3))
diff --git a/arch/arm64/kvm/pmu-direct.c b/arch/arm64/kvm/pmu-direct.c
index 76d8ed24c8646..2ee99d6d2b6c1 100644
--- a/arch/arm64/kvm/pmu-direct.c
+++ b/arch/arm64/kvm/pmu-direct.c
@@ -413,3 +413,23 @@ void kvm_pmu_handle_guest_irq(u64 govf)
 
 	__vcpu_rmw_sys_reg(vcpu, PMOVSSET_EL0, |=, govf);
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
diff --git a/arch/arm64/kvm/pmu-emul.c b/arch/arm64/kvm/pmu-emul.c
index bcaa9f7a8ca28..6f41fc3e3f74b 100644
--- a/arch/arm64/kvm/pmu-emul.c
+++ b/arch/arm64/kvm/pmu-emul.c
@@ -268,7 +268,7 @@ void kvm_pmu_reprogram_counter_mask(struct kvm_vcpu *vcpu, u64 val)
  * counter where the values of the global enable control, PMOVSSET_EL0[n], and
  * PMINTENSET_EL1[n] are all 1.
  */
-bool kvm_pmu_overflow_status(struct kvm_vcpu *vcpu)
+bool kvm_pmu_emul_overflow_status(struct kvm_vcpu *vcpu)
 {
 	u64 reg = __vcpu_sys_reg(vcpu, PMOVSSET_EL0);
 
@@ -405,7 +405,7 @@ static void kvm_pmu_perf_overflow(struct perf_event *perf_event,
 		kvm_pmu_counter_increment(vcpu, BIT(idx + 1),
 					  ARMV8_PMUV3_PERFCTR_CHAIN);
 
-	if (kvm_pmu_overflow_status(vcpu)) {
+	if (kvm_pmu_emul_overflow_status(vcpu)) {
 		kvm_make_request(KVM_REQ_IRQ_PENDING, vcpu);
 
 		if (!in_nmi())
diff --git a/arch/arm64/kvm/pmu.c b/arch/arm64/kvm/pmu.c
index c9862e55a4049..e1332a158dfc8 100644
--- a/arch/arm64/kvm/pmu.c
+++ b/arch/arm64/kvm/pmu.c
@@ -407,7 +407,11 @@ static void kvm_pmu_update_state(struct kvm_vcpu *vcpu)
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
 
-- 
2.52.0.239.gd5f0c6e74e-goog


