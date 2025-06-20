Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC7EAC7115C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Jun 2025 23:04:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=evXfKUBhSeG+2oly7f+qnRnfAE1yqFxCmvksu6Guakw=; b=I6xL6N467FYhQQB3YdHtfXzCMJ
	gWkff7MhVimrQZdzl68sJaVnD/aK01+66w4/8WofKOkjxiuHHKN3i78AZiaaLsNgYlVYw12EFQLay
	XS9QQgMxXfslcIkEzAh37EGDqxIY73np3AeP0x5elH5IA2hwKrgPW68jYLp+J6s1aw3+ZHNel97aS
	BU/ltNZbVaynl2tOquNK1VS6W+vJPxQvArSQxLsjgYCZ9y/mfjSnKLPK4TS8IpJ6yQIjugs/HxbQ9
	s5jwLI4x5stwIwWd87n9hRindMuh92HMuOPLaqHAJkaZ4DkOVkZNS4Zp+aCDDX2ViLvh033c1V3r/
	mAF9o/TA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSkmV-0000000GmYT-3ZGE;
	Fri, 20 Jun 2025 23:04:23 +0000
Received: from mail-il1-x149.google.com ([2607:f8b0:4864:20::149])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSk4Y-0000000GhAP-2btC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Jun 2025 22:18:59 +0000
Received: by mail-il1-x149.google.com with SMTP id e9e14a558f8ab-3ddd5311fd3so26856835ab.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Jun 2025 15:18:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750457937; x=1751062737; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=evXfKUBhSeG+2oly7f+qnRnfAE1yqFxCmvksu6Guakw=;
        b=0wPw49VKf+UDUPzxMLYRNmJuPS5S1gfzEVykBLHpk2ySlQA1uhS722I/bf1E1msUNG
         GQXsQqoeQbTWSVaF4/jbO7XJcMNT0+z/UAVgFMMhAoY0HH/eO6PaZzT0jOFCSSshi6CO
         3dkGw3aF0GsQh4KytJKcS07xmJIfmAnd1Bs70l+13AIiyN3r2AnbZd5ilKopBhpO6Mve
         +yC9HemAF/rUvBT2uLxM1fAXoGXcLrfRuPefjLe8pkKeFlgSx/TCN1Z1BPS3rNc0/o5J
         EmFMfSfH/sizal3MSGp8T8Ctetn/m3kyxJxRF47D57ckX6MV4UMyNSo5lPN2sfS7zNSC
         +WAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750457937; x=1751062737;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=evXfKUBhSeG+2oly7f+qnRnfAE1yqFxCmvksu6Guakw=;
        b=Kz36CJASPA4IqWeILY6HeuD6ynAUqdT7N6m/sYgavXJKElpOzE5yVd1c4WAvTGZ3/G
         XMXwKlZt8hMHXlh/5GYzFI6gz414Pm6fPaCTEPJDq80AZ42nTM/vgy9SfUuF8oRPMx6l
         LLqJThv8yDHZPSVVUJtI9LuRNbLSRgLjHJ/nvG/frO4/OyjVKs+4Pg5Ms7KOc98qJhAm
         RVuiHaxX0lVpu7ZpT7MkWt3vrYhSsLO/PoOWFbhLPMpqJQ0O6n9KmkkEWYKfU3+NSl3e
         Lp7zbzyjucP2G74Yk0Gxw9aO3rLjIIs+98QAFaR0kr+f8pFwdO2lqd+2A1LJ9ATpuBFZ
         rHvg==
X-Forwarded-Encrypted: i=1; AJvYcCXm8ZFw6uziL2F4icVe434SvOBgLyuKGVN69Wq47OcsfCoQFZh6HsYjanrgfPMO2PsgR7KP7Tx8jz+pZXg56ZBq@lists.infradead.org
X-Gm-Message-State: AOJu0YxTUDqK+uPBcJxJrzYhcAEaJVX61urMVLgL3rrM2Fy0VPIXgeGO
	FWY+ut0rdqtlH5IUIluE6hFuC8gmSRRPwSCCOFybNLOck/Y3oH4lPUigcz7tTTMmgjg2uh2Ebjw
	pbQzylXCVVHSpHH3N0vUwJxbJVA==
X-Google-Smtp-Source: AGHT+IFQNwOuHEkKN7g4qywdhJQMH3Ei639Gg+Rq7B3OB/2GxQkU/gqG6/aq0ZsCLexdUvss75SIoe73NPnJzqeZ9A==
X-Received: from ilue6.prod.google.com ([2002:a05:6e02:b26:b0:3dd:b662:5c3b])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6e02:1a4f:b0:3dd:bb7e:f1af with SMTP id e9e14a558f8ab-3de38cdcc11mr49042745ab.20.1750457937447;
 Fri, 20 Jun 2025 15:18:57 -0700 (PDT)
Date: Fri, 20 Jun 2025 22:13:20 +0000
In-Reply-To: <20250620221326.1261128-1-coltonlewis@google.com>
Mime-Version: 1.0
References: <20250620221326.1261128-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.50.0.714.g196bf9f422-goog
Message-ID: <20250620221326.1261128-21-coltonlewis@google.com>
Subject: [PATCH v2 19/23] KVM: arm64: Enforce PMU event filter at vcpu_load()
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
X-CRM114-CacheID: sfid-20250620_151858_659729_4BE6725D 
X-CRM114-Status: GOOD (  13.86  )
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
rechecked on every load. If the event is filtered, exclude counting at
all exception levels before writing the hardware.

Signed-off-by: Colton Lewis <coltonlewis@google.com>
---
 arch/arm64/kvm/pmu-part.c | 43 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/arch/arm64/kvm/pmu-part.c b/arch/arm64/kvm/pmu-part.c
index 19bd6e0da222..fd19a1dd7901 100644
--- a/arch/arm64/kvm/pmu-part.c
+++ b/arch/arm64/kvm/pmu-part.c
@@ -177,6 +177,47 @@ u8 kvm_pmu_hpmn(struct kvm_vcpu *vcpu)
 	return hpmn;
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
+	u64 evtyper_set = kvm_pmu_evtyper_mask(vcpu->kvm)
+		& ~kvm_pmu_event_mask(vcpu->kvm)
+		& ~ARMV8_PMU_INCLUDE_EL2;
+	u64 evtyper_clr = ARMV8_PMU_INCLUDE_EL2;
+	u8 i;
+	u64 val;
+
+	for (i = 0; i < pmu->hpmn_max; i++) {
+		val = __vcpu_sys_reg(vcpu, PMEVTYPER0_EL0 + i);
+
+		if (vcpu->kvm->arch.pmu_filter &&
+		    !test_bit(val, vcpu->kvm->arch.pmu_filter)) {
+			val |= evtyper_set;
+			val &= ~evtyper_clr;
+		}
+
+		write_pmevtypern(i, val);
+	}
+
+	val = __vcpu_sys_reg(vcpu, PMCCFILTR_EL0);
+
+	if (vcpu->kvm->arch.pmu_filter &&
+	    !test_bit(ARMV8_PMUV3_PERFCTR_CPU_CYCLES, vcpu->kvm->arch.pmu_filter)) {
+		val |= evtyper_set;
+		val &= ~evtyper_clr;
+	}
+
+	write_pmccfiltr(val);
+}
+
 /**
  * kvm_pmu_load() - Load untrapped PMU registers
  * @vcpu: Pointer to struct kvm_vcpu
@@ -199,6 +240,8 @@ void kvm_pmu_load(struct kvm_vcpu *vcpu)
 	if (!kvm_pmu_is_partitioned(pmu) || (vcpu->arch.mdcr_el2 & MDCR_EL2_TPM))
 		return;
 
+	kvm_pmu_apply_event_filter(vcpu);
+
 	for (i = 0; i < pmu->hpmn_max; i++) {
 		val = __vcpu_sys_reg(vcpu, PMEVCNTR0_EL0 + i);
 		write_pmevcntrn(i, val);
-- 
2.50.0.714.g196bf9f422-goog


