Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5D6DC7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Jun 2025 22:26:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ai9/sepaJ5XVOCTHqXQnbqMQb7WUqdqFh88LxqpgeeM=; b=YtGSXiqbKIkDjc08RYd3EQWySl
	zdyL45/LAE6HRT42Ak2+ly0rKSr0gbRK6GZon2EfxKIEsWcFtU3jvp39Pbrb8ZORsGWxoTGeyIjm9
	aT9lONHILpDgG3vv/N+GFhAPRPDFhvuih3xGWTDei9eVj2hfltQZobPlhHeFkXE32GH7EKR0wZcbn
	ESfhZEHY80lyzcX0qa1hF5hFbje8fBapofyceQeXzvF962StCfw0L5myEMYCjHj5glQ/PKJhijwzj
	jUXSPc2bdUQsbsH9WiKcqkckvk72ELpZ+8Rhv4vPywFP2mxbvqtWSmuuINzWeuHhz1evM9kAsR4ii
	RqW5ce3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUv2v-0000000Cvyc-1nYJ;
	Thu, 26 Jun 2025 22:26:17 +0000
Received: from mail-il1-x14a.google.com ([2607:f8b0:4864:20::14a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUsrN-0000000Cgqn-39EU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Jun 2025 20:06:14 +0000
Received: by mail-il1-x14a.google.com with SMTP id e9e14a558f8ab-3df393bf5f2so14561145ab.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Jun 2025 13:06:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750968372; x=1751573172; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ai9/sepaJ5XVOCTHqXQnbqMQb7WUqdqFh88LxqpgeeM=;
        b=UZPEQWDMK2z5mK0e/cB1N4zQnOPZNyvnhfok0mSjiHCpVX0C5u01DvzMP1zTFMiwjs
         edFL4ilReYqtjbLNoA3CIJhQ9yhgDvZkDBsOax+pj4pdfCV4Q78YV21br+P/T2HKXUjB
         gOTuKclxM4cIBf8QrsZKjOA09rnxZ6ZahvhAnpKkvFqnCaapMfVtCAzhqOCTrnNUB3GF
         LhmTMse/UF+Om+tocyTvRmczJpFtrvgw8QY6tdkLr79bVp3sOYmy1+WzZAMAGoHzK529
         ay8RUDSBJ5NMAH/eM3PEJ0MyBQWoOsH52J6vcjMn/TiUR9B78WQBfptzMopzX1B3YgLl
         dKPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750968372; x=1751573172;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ai9/sepaJ5XVOCTHqXQnbqMQb7WUqdqFh88LxqpgeeM=;
        b=f9GtsEkebFQppqt913Z+shdpjkyXhF4NGfDfVVMR0UZA4zfijMg9a9I9vwDRrT6I1m
         yXdLKoAOkauf55Hm8olYjrFeKvMA8MYHqY+X3xFFzDa5ZYVHsvUYLom/Mqr6soFgzYiS
         pxlzg3dp1ZTCwjcqBwrSLpV0FXxhcRMaC9nn4T7tsbfk+HkYNKI/5j3yXHrBPDCbTCLE
         3U0IXuGtEhuT1McPvE0yU+pTAiGYictEHIyXoRSrYQiKLOLvJV1oLwetr4lG2CeiM6uP
         oOo8Uksu9W4DutmIvbOKnkgEUjoU7AdK2qWcdE5UI0JE/WNI+s24p3UvTsrJqcWWgdvt
         vb4g==
X-Forwarded-Encrypted: i=1; AJvYcCX1xaLZbwVLycY4FpbmUgeaFPx4GiRxXyQo9688S+0ltK6EJyJlWEH+XUu8bGa19N/RGZKVEP94Bp6WW+D0EJKM@lists.infradead.org
X-Gm-Message-State: AOJu0Yy71x4Z7pVzOHCrXsjQ8RD+/edwKrIIlyjbtRGlnqTJC+ywYKwq
	UGm/4LtS+RKgeER7Dnx/EBASfIhVbBXtlN6ZyIcTUgvmtw1fbqFWc48Vu9cGEmqFvaEs1YDlq+w
	q4jKn7xO7niqVCYmkd1wXD5+XJQ==
X-Google-Smtp-Source: AGHT+IHMxVNZWApbptZpNTBCT5d8XSjlwqRmfTyoWU26w+gUqtg0TL1VrqiKQldGVuUwisWThSdEUMcZDgoysCsEWA==
X-Received: from ilos8.prod.google.com ([2002:a92:cb08:0:b0:3db:8374:9a74])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6e02:1c04:b0:3dc:7cc1:b731 with SMTP id e9e14a558f8ab-3df4aacec3amr12947595ab.0.1750968372540;
 Thu, 26 Jun 2025 13:06:12 -0700 (PDT)
Date: Thu, 26 Jun 2025 20:04:56 +0000
In-Reply-To: <20250626200459.1153955-1-coltonlewis@google.com>
Mime-Version: 1.0
References: <20250626200459.1153955-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
Message-ID: <20250626200459.1153955-21-coltonlewis@google.com>
Subject: [PATCH v3 20/22] KVM: arm64: Inject recorded guest interrupts
From: Colton Lewis <coltonlewis@google.com>
To: kvm@vger.kernel.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
	Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Mingwei Zhang <mizhang@google.com>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Mark Rutland <mark.rutland@arm.com>, Shuah Khan <shuah@kernel.org>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-perf-users@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Colton Lewis <coltonlewis@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_130613_796029_4F8740C2 
X-CRM114-Status: GOOD (  15.95  )
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
 arch/arm64/kvm/pmu-emul.c        |  4 ++--
 arch/arm64/kvm/pmu-part.c        | 22 +++++++++++++++++++++-
 arch/arm64/kvm/pmu.c             |  6 +++++-
 4 files changed, 30 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_pmu.h b/arch/arm64/include/asm/kvm_pmu.h
index 03e3bd318e4b..d047def897bc 100644
--- a/arch/arm64/include/asm/kvm_pmu.h
+++ b/arch/arm64/include/asm/kvm_pmu.h
@@ -86,6 +86,8 @@ bool pmu_access_el0_disabled(struct kvm_vcpu *vcpu);
 void kvm_vcpu_pmu_restore_guest(struct kvm_vcpu *vcpu);
 void kvm_vcpu_pmu_restore_host(struct kvm_vcpu *vcpu);
 void kvm_vcpu_pmu_resync_el0(void);
+bool kvm_pmu_emul_overflow_status(struct kvm_vcpu *vcpu);
+bool kvm_pmu_part_overflow_status(struct kvm_vcpu *vcpu);
 
 #define kvm_vcpu_has_pmu(vcpu)					\
 	(vcpu_has_feature(vcpu, KVM_ARM_VCPU_PMU_V3))
diff --git a/arch/arm64/kvm/pmu-emul.c b/arch/arm64/kvm/pmu-emul.c
index bcaa9f7a8ca2..6f41fc3e3f74 100644
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
diff --git a/arch/arm64/kvm/pmu-part.c b/arch/arm64/kvm/pmu-part.c
index bd04c37b19b9..165d1eae2634 100644
--- a/arch/arm64/kvm/pmu-part.c
+++ b/arch/arm64/kvm/pmu-part.c
@@ -279,7 +279,7 @@ void kvm_pmu_load(struct kvm_vcpu *vcpu)
 	write_pmcr(val);
 
 	/*
-	 * Loading these registers is tricky because of
+	 * Loading these registers is more intricate because of
 	 * 1. Applying only the bits for guest counters (indicated by mask)
 	 * 2. Setting and clearing are different registers
 	 */
@@ -355,3 +355,23 @@ void kvm_pmu_handle_guest_irq(u64 govf)
 
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
diff --git a/arch/arm64/kvm/pmu.c b/arch/arm64/kvm/pmu.c
index 9469f1e0a0b6..6ab0d23f9251 100644
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
2.50.0.727.gbf7dc18ff4-goog


