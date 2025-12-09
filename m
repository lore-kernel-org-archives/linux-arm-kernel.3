Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D664CD3B994
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Dec 2025 20:53:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z3C+EgXBZrnvYKUsePQFPeWA6+JM50EPdZ7QjJ5U3nk=; b=xjEwIxM2mV92jLNWCsJf5t61MT
	Ce6dKo/e3enF+BB2SdbYLpYbzO1Um7QNlyPQzSY6usQAVeNs8n8ltwKaYHGpkgE32Bz5JkTmBdnx3
	kMu2dfd1+7LSC3/0AGpSKGtJOsf3pM0EP6DpqX8ndmbckOHeRSQrze0OehOmCsiM/0iUxryNBoCdN
	/xssXUjTKSlTaUR1J1kHbAdR13/Uw+g3nvF7nqT/y7D3Bxe5IREvNW4czjBbeNgEs7gMvKYoscaeB
	Gs5C+oIklFogSeFslzBm/FMkuUPKnM71G4kUYhO+S4Ohadebj223AGb3YkShFFDV6l0UBm6b1hIxv
	NZhJHwJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vT4hu-0000000ElNx-2pQZ;
	Tue, 09 Dec 2025 20:53:14 +0000
Received: from mail-ot1-x349.google.com ([2607:f8b0:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vT4hU-0000000EkqJ-1HVH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Dec 2025 20:52:50 +0000
Received: by mail-ot1-x349.google.com with SMTP id 46e09a7af769-7c7599a6f1fso11824763a34.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Dec 2025 12:52:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1765313566; x=1765918366; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Z3C+EgXBZrnvYKUsePQFPeWA6+JM50EPdZ7QjJ5U3nk=;
        b=nP4XRHbzD8JdRs8Lf3Z5IEahP4BItH/qbtCTa7IxX26Wp/uvKcoIzevR8jXM8Q3YMT
         KrQds4WRQYtK0x6AQqRJwJZENCBF0OwLSGaGNG1q2A6Rnc0TBqh3GQ4gpFLCncgmt8CM
         9H7kNwn9kMxmcluWNS8zK3gf+VLLqzvXmHaVfmJ7rSZZUFnL0LZTTEoLdUjxqFJ+nowE
         HzbTQBAqr2a4mLxGXrCUG1aFVThvIicEktCwMjRvYWpiPEwWCgr2Ceo+sI76sYzWhC9L
         V0rgtGiBggpRC4JpECVqascnkZfyNER60lfJo/w3dsd/khymnA4ri+NhCGI+EaVXZEPx
         /PwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765313566; x=1765918366;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Z3C+EgXBZrnvYKUsePQFPeWA6+JM50EPdZ7QjJ5U3nk=;
        b=FLwHBXXn2Jq4/h4cit2rdGufXVL4KqxIyFujGtStyXyjcDZL1Nz5HVRIkORFapAer5
         fRRm5HVxdp2ZrbzJTx6QtD3L6wKyesOSDasp6CGbqgMPfFwnAq8bZz5xdyCVTza/nYUq
         b1afHdac+byJmk6F9FtHLHjA83dK83QIN4vCmOFRs7HRoJkoDjE3fpjiZPiqHsAzQbQl
         Rj7kM+lKI9jbBEZy1T2+F3yonyoLW4mqxYS0DQkePomtA/WVkYyjZnp71UxmAdXuY4gV
         ctSRHBYtcDsYncQt7ygreh39G7jtUCm0PHB2b92m2LUXD1GWbasQNOB8Cj71cgBnFJ8U
         4gGw==
X-Forwarded-Encrypted: i=1; AJvYcCVciF9unAPtpbfSViY7fpq5Wf70FVkxEt+d/zWH/C+vygAZbi3VhRjvk7yE8eioJLfc16M396Sm/6lMTtjJY3wU@lists.infradead.org
X-Gm-Message-State: AOJu0YzfZXjW55L25eqpdJIqyFHS819CG0ZXi1kKPO9843EltxTARmy9
	rcpjNCnC9FWPwhLmO5xWOgQGkxNhbypvn15VYBDqbwCQHscmuHZqOKUFs4YThiAnhleo1pkLh/M
	LD8ORY/A0M0XOnlogki8KjrachQ==
X-Google-Smtp-Source: AGHT+IE+Q1bxOP7O2hdAR+5uvGwSUyrHQRsNxJJcZ41BmbQLJOhfNhTF9IlZ3TTqoSNqarccK80mXi5fG/4ler8rFA==
X-Received: from otbaz24.prod.google.com ([2002:a05:6830:4598:b0:7c7:307:1f8c])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6830:7198:b0:7c9:59a5:dd04 with SMTP id 46e09a7af769-7cacec5716bmr83284a34.37.1765313566430;
 Tue, 09 Dec 2025 12:52:46 -0800 (PST)
Date: Tue,  9 Dec 2025 20:51:17 +0000
In-Reply-To: <20251209205121.1871534-1-coltonlewis@google.com>
Mime-Version: 1.0
References: <20251209205121.1871534-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.52.0.239.gd5f0c6e74e-goog
Message-ID: <20251209205121.1871534-21-coltonlewis@google.com>
Subject: [PATCH v5 20/24] perf: arm_pmuv3: Handle IRQs for Partitioned PMU
 guest counters
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
X-CRM114-CacheID: sfid-20251209_125248_554085_68E1EB7E 
X-CRM114-Status: GOOD (  16.30  )
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

Because ARM hardware is not yet capable of direct interrupt injection
into guests, guest counters will still trigger interrupts that need to
be handled by the host PMU interrupt handler. Clear the overflow flags
in hardware to handle the interrupt as normal, but record which guest
overflow flags were set in the virtual overflow register for later
injecting the interrupt into the guest.

Signed-off-by: Colton Lewis <coltonlewis@google.com>
---
 arch/arm/include/asm/arm_pmuv3.h |  6 ++++++
 arch/arm64/include/asm/kvm_pmu.h |  2 ++
 arch/arm64/kvm/pmu-direct.c      | 17 +++++++++++++++++
 drivers/perf/arm_pmuv3.c         |  9 +++++++++
 4 files changed, 34 insertions(+)

diff --git a/arch/arm/include/asm/arm_pmuv3.h b/arch/arm/include/asm/arm_pmuv3.h
index 3ea5741d213d8..485d2f08ac113 100644
--- a/arch/arm/include/asm/arm_pmuv3.h
+++ b/arch/arm/include/asm/arm_pmuv3.h
@@ -180,6 +180,11 @@ static inline void write_pmintenset(u32 val)
 	write_sysreg(val, PMINTENSET);
 }
 
+static inline u32 read_pmintenset(void)
+{
+	return read_sysreg(PMINTENSET);
+}
+
 static inline void write_pmintenclr(u32 val)
 {
 	write_sysreg(val, PMINTENCLR);
@@ -249,6 +254,7 @@ static inline u64 kvm_pmu_guest_counter_mask(struct arm_pmu *pmu)
 	return ~0;
 }
 
+static inline void kvm_pmu_handle_guest_irq(u64 govf) {}
 
 /* PMU Version in DFR Register */
 #define ARMV8_PMU_DFR_VER_NI        0
diff --git a/arch/arm64/include/asm/kvm_pmu.h b/arch/arm64/include/asm/kvm_pmu.h
index 43aa334dce517..e4cbab0fd09cf 100644
--- a/arch/arm64/include/asm/kvm_pmu.h
+++ b/arch/arm64/include/asm/kvm_pmu.h
@@ -101,6 +101,7 @@ u64 kvm_pmu_host_counter_mask(struct arm_pmu *pmu);
 u64 kvm_pmu_guest_counter_mask(struct arm_pmu *pmu);
 void kvm_pmu_host_counters_enable(void);
 void kvm_pmu_host_counters_disable(void);
+void kvm_pmu_handle_guest_irq(u64 govf);
 
 u8 kvm_pmu_guest_num_counters(struct kvm_vcpu *vcpu);
 u8 kvm_pmu_hpmn(struct kvm_vcpu *vcpu);
@@ -322,6 +323,7 @@ static inline u64 kvm_pmu_guest_counter_mask(void *pmu)
 
 static inline void kvm_pmu_host_counters_enable(void) {}
 static inline void kvm_pmu_host_counters_disable(void) {}
+static inline void kvm_pmu_handle_guest_irq(u64 govf) {}
 
 #endif
 
diff --git a/arch/arm64/kvm/pmu-direct.c b/arch/arm64/kvm/pmu-direct.c
index c5767e2ebc651..76d8ed24c8646 100644
--- a/arch/arm64/kvm/pmu-direct.c
+++ b/arch/arm64/kvm/pmu-direct.c
@@ -396,3 +396,20 @@ void kvm_pmu_put(struct kvm_vcpu *vcpu)
 	val = read_pmintenset();
 	__vcpu_assign_sys_reg(vcpu, PMINTENSET_EL1, val & mask);
 }
+
+/**
+ * kvm_pmu_handle_guest_irq() - Record IRQs in guest counters
+ * @govf: Bitmask of guest overflowed counters
+ *
+ * Record IRQs from overflows in guest-reserved counters in the VCPU
+ * register for the guest to clear later.
+ */
+void kvm_pmu_handle_guest_irq(u64 govf)
+{
+	struct kvm_vcpu *vcpu = kvm_get_running_vcpu();
+
+	if (!vcpu)
+		return;
+
+	__vcpu_rmw_sys_reg(vcpu, PMOVSSET_EL0, |=, govf);
+}
diff --git a/drivers/perf/arm_pmuv3.c b/drivers/perf/arm_pmuv3.c
index 2bed99ba992d7..3c1a69f88b284 100644
--- a/drivers/perf/arm_pmuv3.c
+++ b/drivers/perf/arm_pmuv3.c
@@ -783,6 +783,8 @@ static u64 armv8pmu_getreset_flags(void)
 
 	/* Write to clear flags */
 	value &= ARMV8_PMU_CNT_MASK_ALL;
+	/* Only reset interrupt enabled counters. */
+	value &= read_pmintenset();
 	write_pmovsclr(value);
 
 	return value;
@@ -904,6 +906,7 @@ static void read_branch_records(struct pmu_hw_events *cpuc,
 static irqreturn_t armv8pmu_handle_irq(struct arm_pmu *cpu_pmu)
 {
 	u64 pmovsr;
+	u64 govf;
 	struct perf_sample_data data;
 	struct pmu_hw_events *cpuc = this_cpu_ptr(cpu_pmu->hw_events);
 	struct pt_regs *regs;
@@ -961,6 +964,12 @@ static irqreturn_t armv8pmu_handle_irq(struct arm_pmu *cpu_pmu)
 		 */
 		perf_event_overflow(event, &data, regs);
 	}
+
+	govf = pmovsr & kvm_pmu_guest_counter_mask(cpu_pmu);
+
+	if (kvm_pmu_is_partitioned(cpu_pmu) && govf)
+		kvm_pmu_handle_guest_irq(govf);
+
 	armv8pmu_start(cpu_pmu);
 
 	return IRQ_HANDLED;
-- 
2.52.0.239.gd5f0c6e74e-goog


