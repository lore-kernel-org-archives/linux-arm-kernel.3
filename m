Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94904CD98DA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Jun 2026 19:29:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mefc4hk7l8V5q1+Ri7ebgTL5CsdX634wsG3um/9LWKo=; b=cV/WR8LmpKHrIxsLmYZjRlOP5k
	uQxHWY1Y4lNmBXE4AeQcH1x59T/6GiXywGZiItnaAOiDvsNkPm1+dhGv8+RbvUFCtpLg/GEryqm7d
	uKklc7sJt+VNt1daNzcFm+Q7p+8W/du1n87ByNmfmN01a1U9B1eXHRieKptMQvCq3jtr5git3EtiC
	GQm/MFmQtwveaicOyJe/UYmH2g0QWjYf9l6YzSsEWUDIB+0Th3SZ17p6QO+wHZGTqnCYW/vwSNMhq
	f2QLmG4e+ikbfLgIx2R8pAP+sxkAslumShTHLEOtVECzDNvm8kn8HAoLOMoJq8FTGjPT11V6fnP+X
	Mf68Lr/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY7ZQ-0000000BSjq-0SnM;
	Fri, 12 Jun 2026 19:29:36 +0000
Received: from mail-oi1-x249.google.com ([2607:f8b0:4864:20::249])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY7ZI-0000000BSVc-25gL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Jun 2026 19:29:29 +0000
Received: by mail-oi1-x249.google.com with SMTP id 5614622812f47-48661b2ef8eso1179150b6e.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Jun 2026 12:29:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781292566; x=1781897366; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=mefc4hk7l8V5q1+Ri7ebgTL5CsdX634wsG3um/9LWKo=;
        b=HHkC2R3H8fKma6W7Y71efJ7Bvwzpxqb5DU9op7GKnJCdyhoGdu9Yzbq5eHlwYpJX6c
         0zfo7QXjnCh0lJjc6IT0eM294ZbWMICBbPLtomL1DQI3ZAmlCYiVdAtaaAf2+1H8mtDN
         FfsdiEJuBNOkdzF8qCne2s45NoC3+Q7uFLG2Ok3yToFbOmdwJClU7ZQh8lZEGG9fEJeC
         YdUrSr2nBCBFVyW/7q+heBCowYiW4n+skJlubapdLnkMfIWwgJANXmpt43XJJRB+D711
         BlFHZXKD3Petp306YsnS9jjy70s1dG+M+on27wtkSH1qNcmigKx5Z61NYGxk45hiXw+X
         aV6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781292566; x=1781897366;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mefc4hk7l8V5q1+Ri7ebgTL5CsdX634wsG3um/9LWKo=;
        b=ORRIWzvWun7BxjBzLZsZa+onSCoyBwNlWeHdhtc+s3i8W8+qHBCFCIwTbAPpksspsq
         aDcaOCxB5CZQMx3KMmNdQTXqxd7P15/rMPbdeVp6F/8FoHoJh8JhsarXRWCiTc+2L1p+
         gU2uz1B2BZSj2mlYK2+mcYHPWAJQzFy1bj7JFSqSijKI+sWFy+eRgEyqpFIScE4HbwA0
         IR0M9Kuyu+FQap9NtHsrgew3+8LyJRkcdKWJ/f90au84dy/vDscFwy4KoXbjRMaZZOIK
         8j/RtHoa2lzocmZUsQAUNLsveGsRf76D+LBakEO2kLv1+p/v5Ffjews8+v6UXc2yPJeb
         gHdA==
X-Forwarded-Encrypted: i=1; AFNElJ+qhsZkAOxzU6L2r6Riy4ria0JHOdqmpGyqV17M3DOgff8SqHEmADZDdQRRf7OZ9YJAl1jeHiRmTisLNIDjYer5@lists.infradead.org
X-Gm-Message-State: AOJu0YzkCXqnn2lhuG/8J+ypCX0fOj+9tcTqlTSpXJ3WOaMJRbubybdQ
	NO3qjbatlVGgu73Zz/EIHzSokCn7E0Y8My13oh4OA70Utkbx2n2AFFMuToQ+FyNwabYtxuHkwkv
	2Awxb90vZ1eJAqiGpXyj4Ot/PMA==
X-Received: from iloo20-n1.prod.google.com ([2002:a05:6e02:6114:10b0:4fe:69b2:404b])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:3a15:b0:485:d6e7:9dbf with SMTP id 5614622812f47-4872f11d549mr2509778b6e.0.1781292566143;
 Fri, 12 Jun 2026 12:29:26 -0700 (PDT)
Date: Fri, 12 Jun 2026 19:29:05 +0000
In-Reply-To: <20260612192909.1153907-1-coltonlewis@google.com>
Mime-Version: 1.0
References: <20260612192909.1153907-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.54.0.1136.gdb2ca164c4-goog
Message-ID: <20260612192909.1153907-18-coltonlewis@google.com>
Subject: [PATCH 17/21] KVM: arm64: Detect overflows for the Partitioned PMU
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
X-CRM114-CacheID: sfid-20260612_122928_541739_34FA15E4 
X-CRM114-Status: GOOD (  18.44  )
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
 arch/arm64/kvm/pmu-direct.c | 48 +++++++++++++++++++++++++++++++++++++
 arch/arm64/kvm/pmu-emul.c   |  4 ++--
 arch/arm64/kvm/pmu.c        |  6 ++++-
 include/kvm/arm_pmu.h       |  2 ++
 4 files changed, 57 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/kvm/pmu-direct.c b/arch/arm64/kvm/pmu-direct.c
index 64f40cfb31012..0062d1d8e1999 100644
--- a/arch/arm64/kvm/pmu-direct.c
+++ b/arch/arm64/kvm/pmu-direct.c
@@ -426,4 +426,52 @@ void kvm_pmu_handle_guest_irq(struct arm_pmu *pmu, u64 pmovsr)
 		return;
 
 	__vcpu_rmw_sys_reg(vcpu, PMOVSSET_EL0, |=, govf);
+
+	if (kvm_pmu_part_overflow_status(vcpu)) {
+		kvm_make_request(KVM_REQ_IRQ_PENDING, vcpu);
+
+		if (!in_nmi())
+			kvm_vcpu_kick(vcpu);
+		else
+			irq_work_queue(&vcpu->arch.pmu.overflow_work);
+	}
+}
+
+/**
+ * kvm_pmu_part_overflow_status() - Determine if any guest counters have overflowed
+ * @vcpu: Pointer to struct kvm_vcpu
+ *
+ * Determine if any guest counters have overflowed and therefore an
+ * IRQ needs to be injected into the guest. If access is still free,
+ * then the guest hasn't accessed the PMU yet so we know the guest
+ * context is not loaded onto the pCPU and an overflow is impossible.
+ *
+ * Return: True if there was an overflow, false otherwise
+ */
+bool kvm_pmu_part_overflow_status(struct kvm_vcpu *vcpu)
+{
+	struct arm_pmu *pmu;
+	u64 mask, pmovs, pmint, pmcr;
+	bool overflow;
+
+	pmu = vcpu->kvm->arch.arm_pmu;
+	mask = kvm_pmu_guest_counter_mask(pmu);
+
+	if (vcpu->arch.pmu.access == VCPU_PMU_ACCESS_FREE) {
+		pmovs = __vcpu_sys_reg(vcpu, PMOVSSET_EL0);
+		pmint = __vcpu_sys_reg(vcpu, PMINTENSET_EL1);
+		pmcr = __vcpu_sys_reg(vcpu, PMCR_EL0);
+
+		if ((pmcr & ARMV8_PMU_PMCR_E) && (mask & pmovs & pmint))
+			kvm_pmu_set_guest_owned(vcpu);
+		else
+			return false;
+	}
+
+	pmovs = __vcpu_sys_reg(vcpu, PMOVSSET_EL0);
+	pmint = read_pmintenset();
+	pmcr = read_pmcr();
+	overflow = (pmcr & ARMV8_PMU_PMCR_E) && (mask & pmovs & pmint);
+
+	return overflow;
 }
diff --git a/arch/arm64/kvm/pmu-emul.c b/arch/arm64/kvm/pmu-emul.c
index d1110febe7436..ebc68090bdb26 100644
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
index 55cda8021400a..f5ee18b4dfae7 100644
--- a/arch/arm64/kvm/pmu.c
+++ b/arch/arm64/kvm/pmu.c
@@ -409,7 +409,11 @@ static void kvm_pmu_update_state(struct kvm_vcpu *vcpu)
 	struct kvm_pmu *pmu = &vcpu->arch.pmu;
 	bool overflow;
 
-	overflow = kvm_pmu_overflow_status(vcpu);
+	if (kvm_pmu_is_partitioned(vcpu->kvm))
+		overflow = kvm_pmu_part_overflow_status(vcpu);
+	else
+		overflow = kvm_pmu_emul_overflow_status(vcpu);
+
 	if (pmu->irq_level == overflow)
 		return;
 
diff --git a/include/kvm/arm_pmu.h b/include/kvm/arm_pmu.h
index 25163a689ae80..f72d080ee7ba2 100644
--- a/include/kvm/arm_pmu.h
+++ b/include/kvm/arm_pmu.h
@@ -93,6 +93,8 @@ bool kvm_set_pmuserenr(u64 val);
 void kvm_vcpu_pmu_restore_guest(struct kvm_vcpu *vcpu);
 void kvm_vcpu_pmu_restore_host(struct kvm_vcpu *vcpu);
 void kvm_vcpu_pmu_resync_el0(void);
+bool kvm_pmu_emul_overflow_status(struct kvm_vcpu *vcpu);
+bool kvm_pmu_part_overflow_status(struct kvm_vcpu *vcpu);
 
 #define kvm_vcpu_has_pmu(vcpu)					\
 	(vcpu_has_feature(vcpu, KVM_ARM_VCPU_PMU_V3))
-- 
2.54.0.1136.gdb2ca164c4-goog


