Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8ED1C7115C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Jun 2025 23:11:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V1Ykp94zxfIa/dbPK+2a7kBugu0lfLOBN3b0mLEqxA0=; b=CmPSeFVmbTHKa2NF5mf2xTIX57
	hiX7taS+R6VHQs9KPrDeg8QaJjjQNIUb7yfI3tit88mlyx5bU8Qft+3WLGBCVI/mL7SGK0DjYucDr
	W2MP6Vco9bqMpf5RsYUJ3w/rAu2pOMmW2ILxxuFOv8lJZ/cmyvbJtVPflACFZJI4m7AVzXmgbhlsK
	tTO3iIcNQ/DC2m2leJIUalu8gs+vmJXxvzarxh1rAAdNBSYlNwuXz8tBR/R9eitjQesiEOqiB3qAd
	Ef1ubovKGNb8gVbxZSJkCWuXcnPQr1VZt+k4T/vxKiYnTpXK9a8pnAM2LXsNDOBggSlzDQ5CpGG6r
	epB0Gy+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSkt9-0000000Gmy5-07HF;
	Fri, 20 Jun 2025 23:11:15 +0000
Received: from mail-il1-x14a.google.com ([2607:f8b0:4864:20::14a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSk4c-0000000GhCE-0TdF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Jun 2025 22:19:03 +0000
Received: by mail-il1-x14a.google.com with SMTP id e9e14a558f8ab-3ddd5cd020dso51296955ab.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Jun 2025 15:19:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750457941; x=1751062741; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=V1Ykp94zxfIa/dbPK+2a7kBugu0lfLOBN3b0mLEqxA0=;
        b=sf1H/SOYmXVlMHSR88oGM9Tdu7uHjLpVIzHcHarBxJWBdlJztUAOUEnwA5gt/5usRU
         XEbzsPc7RE+8dEYYTghlkxfnuK7QJEBVKf36hHLWpJr7q9FObQAgv2dxTMmh4+64qVqr
         ArZXm2hNDgmtCltnPQavQXNx86iFcJpgSAfHcpDYeS+AiYqgPM6fs1mkl+F6Z3qO96i1
         SkXRKsZNXhplKtqY/3P4C8ZsmLXdlWxBl0CGObesJTB8Bww2Yd8Tw9oq/J5cOw0gdP1e
         4namgCZ3+V0ezcI8pk2Jov+vzvTVCyfryIIdI/On5eTT+l0Jae3PT4ZZDabRTqaNJaIG
         94Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750457941; x=1751062741;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=V1Ykp94zxfIa/dbPK+2a7kBugu0lfLOBN3b0mLEqxA0=;
        b=VvysOZjZZNP1tuO505o2yWvrHnENWcoYca3u02LDYyI+MnjYo92FmK077Bg3C1/O3u
         xhHOVkf6k4+COfZwNQlev7QodqdC1kijGIb6MS3V89HPcoR80j/TwEoCdQjHMp6rGHDQ
         yXvV8umo9q1zToEX10eugVmo9huVopuQCzVvCkNEkhk6uZevyP9PLTgxmOwCNUVrzunR
         0fAN9EWAh6M0KG5d4Q9gRp4tUw+7eSyRsBq3tA6d74DSLaBnQUXK0A77jjOY0QCMqT0c
         e8byP0ZSIeUrVzH+o6DqPk9drZPN9LK9nwrZV6zRu2ASGfZiEqNvgKVokOYRad2GaoI8
         xFtw==
X-Forwarded-Encrypted: i=1; AJvYcCW4VvAmgp7cfb47Ol10yYWXVlIsQqPrp8mwg158qAFcVN0mB7ckG1FWXp/DBuanVF/vWuEjDFXKhuoNYypQCOwp@lists.infradead.org
X-Gm-Message-State: AOJu0YwU1UcIVwpRpGOgWq/QFemvLf1PyluM052uIsil/o0ZKctVVPov
	zhwhTR3NdF31kyBuIk2F5BMgs4KXpjEVu+ZzCjFlBcFkCgrxrRLdVnEDZRoucWnQSfEkgoTMZ1z
	WFKwpA2eeovMVFpO7RykIX+rX9g==
X-Google-Smtp-Source: AGHT+IGsN72kNwJ2dwKK78XXy9iE4CcdXHD3dDBBOtntuEfratpO+Bq/lh5Sf0arHIXBqE+w6Fo0vZ83wCMILU28YQ==
X-Received: from ilbbz6.prod.google.com ([2002:a05:6e02:2686:b0:3d6:d162:a9b0])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6e02:214d:b0:3dd:d746:25eb with SMTP id e9e14a558f8ab-3de38cc8bb0mr44894155ab.16.1750457940797;
 Fri, 20 Jun 2025 15:19:00 -0700 (PDT)
Date: Fri, 20 Jun 2025 22:13:23 +0000
In-Reply-To: <20250620221326.1261128-1-coltonlewis@google.com>
Mime-Version: 1.0
References: <20250620221326.1261128-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.50.0.714.g196bf9f422-goog
Message-ID: <20250620221326.1261128-24-coltonlewis@google.com>
Subject: [PATCH v2 21/23] KVM: arm64: Inject recorded guest interrupts
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
X-CRM114-CacheID: sfid-20250620_151902_150787_97A5A120 
X-CRM114-Status: GOOD (  16.79  )
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
 arch/arm64/kvm/pmu-part.c        | 24 ++++++++++++++++++++++--
 arch/arm64/kvm/pmu.c             |  7 ++++++-
 4 files changed, 32 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_pmu.h b/arch/arm64/include/asm/kvm_pmu.h
index e1c8d8fc27bd..1e632373ba38 100644
--- a/arch/arm64/include/asm/kvm_pmu.h
+++ b/arch/arm64/include/asm/kvm_pmu.h
@@ -84,6 +84,8 @@ void kvm_vcpu_pmu_restore_guest(struct kvm_vcpu *vcpu);
 void kvm_vcpu_pmu_restore_host(struct kvm_vcpu *vcpu);
 void kvm_vcpu_pmu_resync_el0(void);
 void kvm_host_pmu_init(struct arm_pmu *pmu);
+bool kvm_pmu_emul_overflow_status(struct kvm_vcpu *vcpu);
+bool kvm_pmu_part_overflow_status(struct kvm_vcpu *vcpu);
 
 #define kvm_vcpu_has_pmu(vcpu)					\
 	(vcpu_has_feature(vcpu, KVM_ARM_VCPU_PMU_V3))
diff --git a/arch/arm64/kvm/pmu-emul.c b/arch/arm64/kvm/pmu-emul.c
index a6452d10fc1e..926aeda51b9e 100644
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
index 8c35447ef103..2c347e7a26d8 100644
--- a/arch/arm64/kvm/pmu-part.c
+++ b/arch/arm64/kvm/pmu-part.c
@@ -260,7 +260,7 @@ void kvm_pmu_load(struct kvm_vcpu *vcpu)
 	write_pmcr(val);
 
 	/*
-	 * Loading these registers is tricky because of
+	 * Loading these registers is more intricate because of
 	 * 1. Applying only the bits for guest counters (indicated by mask)
 	 * 2. Setting and clearing are different registers
 	 */
@@ -334,5 +334,25 @@ void kvm_pmu_handle_guest_irq(u64 govf)
 	if (!vcpu)
 		return;
 
-	__vcpu_sys_reg(vcpu, PMOVSSET_EL0) |= govf;
+	__vcpu_assign_sys_reg(vcpu, PMOVSSET_EL0, govf);
+}
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
 }
diff --git a/arch/arm64/kvm/pmu.c b/arch/arm64/kvm/pmu.c
index 5f0847dc7d53..65b380debc33 100644
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
 
@@ -683,6 +687,7 @@ int kvm_arm_pmu_v3_set_attr(struct kvm_vcpu *vcpu, struct kvm_device_attr *attr)
 			return -EBUSY;
 
 		kvm_debug("Set kvm ARM PMU irq: %d\n", irq);
+
 		vcpu->arch.pmu.irq_num = irq;
 		return 0;
 	}
-- 
2.50.0.714.g196bf9f422-goog


