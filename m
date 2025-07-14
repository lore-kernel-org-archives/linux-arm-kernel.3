Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BEFAC83F17
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Jul 2025 23:52:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=owVeMj/9hQdREoMrYrf+cb3JPwx5Updk91QFCpBYEPQ=; b=CIgb/2MrqBOCDDKI3SGqGxk6pP
	r5LdGOhwNTOujMCNYAtt+cbOE0j19qmF3oxVdnS0BimhOxnEL7y0siV7F7fuepfeaAGCR9uhxcpIE
	aAkmL95QBL4sHAqcmV8MGg6DaXUTu3NZInQTcPNN+FVZe7FuD7Qv5cc7yhJGFsBzahf77QwscTudO
	HwxvbW9yKJWMFumT3DLOlf4PcNU8cI6Dm9r+vfD8mj88RBJJj8Wwt8+snWidAoSspLVsP6aNiXLfj
	l4yUoEznt6GcUw+ciPkLsRbGFXeHQHvNyD9ZLQ+p5tr0hIaNttj8oyjGUrz5UDtfVLOUEqs8T/rl8
	W4ILxFsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubSyJ-00000003a5i-0eJL;
	Mon, 14 Jul 2025 23:52:35 +0000
Received: from mail-il1-x149.google.com ([2607:f8b0:4864:20::149])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubS9I-00000003SbL-1Ix3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Jul 2025 22:59:53 +0000
Received: by mail-il1-x149.google.com with SMTP id e9e14a558f8ab-3df309d9842so115618775ab.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Jul 2025 15:59:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1752533991; x=1753138791; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=owVeMj/9hQdREoMrYrf+cb3JPwx5Updk91QFCpBYEPQ=;
        b=jlvjB1kuMivaXPHXIcRRPqAge28YWozAm6Cx9s2dPXubEYv2QXotRME3H/a2qbrMZW
         e0BEPupnI9APQUo0568thK0sCQKd8EPFcAmODfzv/EmCTgJ12WFbYWAaLJlI3apIE7fz
         SNaoX5dwDwGCc0cDdhs00tk30CyWQWEJxgPr43JUARu1GC9Jcld8adluwr03cgRKY+oh
         78lNTkpiPL4XY/BwDWASpVeyUm8onkHND3Tw4ZZOEqAPuicZy2Eq6vXJ8Q9fmMyN59eM
         wOONaOooLrJjgb02TTOXxzWZyc5nLD+GCerdpue26Ve7KplgAYD8JO1aPdvdArXuRlow
         QqVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752533991; x=1753138791;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=owVeMj/9hQdREoMrYrf+cb3JPwx5Updk91QFCpBYEPQ=;
        b=o1/+ZgVBhJ0VMlr16mGZ1WWUup0GfHvaByvnoB+YASaqfcAextnC4vtwqTwVU4+xGy
         1OANf9Sz9o+KZBT+jAd4BHDsiu4FO7sZQ+JV369qyrkHcqIOFZ43+gZEfJilWcb0KhHk
         qTBLYFgAQBMbMa84IYlHzvWcghpqyWkR/zhEI5EOOfaJ5lUy8zRXW7za2XGhACKKMrXJ
         vk/Fj5YZDs26t+iZqS/ix5c2NZCKCNN1jkIfAkgQgMWc0vrhtxQW7LVwd3JmEL8ysCZE
         dvcaWCQvfPrO0jxuR7/8iVXu4OcINerCjdMEqIuzZY5V/ecPFQviKCwAdOiILHgF1cIx
         Itdg==
X-Forwarded-Encrypted: i=1; AJvYcCVD5sEm2ynUfltuqy2yB7evN2mdZkVFQ3Ceb6/UPHh3JwnVjcvJw9YtrV9Th77YcVy+9OR6BJykfUKPKGJYNM2g@lists.infradead.org
X-Gm-Message-State: AOJu0YzFOL5G+JNMseHvDtxDjZvXS80TAwNaKEcP5su/xQr+zF2Xg4Hd
	qBxDZqfJ2fJzvEu4HGIYTkjFS+ngpRXiauMdIad4JAAMItWk76fMfBDlkq3h3ZojBpe95G+iBvh
	VnEpvtmI3Xbpz5xzaMVVND74fHg==
X-Google-Smtp-Source: AGHT+IFhP5mgyGUmG3pmQj8bVOziDPF6iO6lkJxF0ZjHKQgYCC4Elel7HDH7jDBm3sU0yo1Sa4ndzKb0EA7KNwiitw==
X-Received: from ilbea23-n1.prod.google.com ([2002:a05:6e02:4517:10b0:3dd:78b6:1265])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6e02:1c05:b0:3e0:ec1e:18fe with SMTP id e9e14a558f8ab-3e25332ed05mr145231275ab.15.1752533991250;
 Mon, 14 Jul 2025 15:59:51 -0700 (PDT)
Date: Mon, 14 Jul 2025 22:59:14 +0000
In-Reply-To: <20250714225917.1396543-1-coltonlewis@google.com>
Mime-Version: 1.0
References: <20250714225917.1396543-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
Message-ID: <20250714225917.1396543-21-coltonlewis@google.com>
Subject: [PATCH v4 20/23] perf: arm_pmuv3: Handle IRQs for Partitioned PMU
 guest counters
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
X-CRM114-CacheID: sfid-20250714_155952_354113_F3C2E414 
X-CRM114-Status: GOOD (  15.76  )
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

Guest counters will still trigger interrupts that need to be handled
by the host PMU interrupt handler. Clear the overflow flags in
hardware to handle the interrupt as normal, but record which guest
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
index 5f6269039f44..36638efe4258 100644
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
 
 static inline bool has_vhe(void)
 {
diff --git a/arch/arm64/include/asm/kvm_pmu.h b/arch/arm64/include/asm/kvm_pmu.h
index 47cfff7ebc26..6149eb051ff9 100644
--- a/arch/arm64/include/asm/kvm_pmu.h
+++ b/arch/arm64/include/asm/kvm_pmu.h
@@ -96,6 +96,7 @@ u64 kvm_pmu_host_counter_mask(struct arm_pmu *pmu);
 u64 kvm_pmu_guest_counter_mask(struct arm_pmu *pmu);
 void kvm_pmu_host_counters_enable(void);
 void kvm_pmu_host_counters_disable(void);
+void kvm_pmu_handle_guest_irq(u64 govf);
 
 bool kvm_pmu_regs_free(struct kvm_vcpu *vcpu);
 bool kvm_pmu_regs_host_owned(struct kvm_vcpu *vcpu);
@@ -310,6 +311,7 @@ static inline u64 kvm_pmu_guest_counter_mask(struct arm_pmu *pmu)
 
 static inline void kvm_pmu_host_counters_enable(void) {}
 static inline void kvm_pmu_host_counters_disable(void) {}
+static inline void kvm_pmu_handle_guest_irq(u64 govf) {}
 
 #endif
 
diff --git a/arch/arm64/kvm/pmu-direct.c b/arch/arm64/kvm/pmu-direct.c
index 28d8540c5ed2..3f9e0d4a74e1 100644
--- a/arch/arm64/kvm/pmu-direct.c
+++ b/arch/arm64/kvm/pmu-direct.c
@@ -339,3 +339,20 @@ void kvm_pmu_put(struct kvm_vcpu *vcpu)
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
index bc8a99cf4f88..6307cd851eb6 100644
--- a/drivers/perf/arm_pmuv3.c
+++ b/drivers/perf/arm_pmuv3.c
@@ -755,6 +755,8 @@ static u64 armv8pmu_getreset_flags(void)
 
 	/* Write to clear flags */
 	value &= ARMV8_PMU_CNT_MASK_ALL;
+	/* Only reset interrupt enabled counters. */
+	value &= read_pmintenset();
 	write_pmovsclr(value);
 
 	return value;
@@ -857,6 +859,7 @@ static void armv8pmu_stop(struct arm_pmu *cpu_pmu)
 static irqreturn_t armv8pmu_handle_irq(struct arm_pmu *cpu_pmu)
 {
 	u64 pmovsr;
+	u64 govf;
 	struct perf_sample_data data;
 	struct pmu_hw_events *cpuc = this_cpu_ptr(cpu_pmu->hw_events);
 	struct pt_regs *regs;
@@ -911,6 +914,12 @@ static irqreturn_t armv8pmu_handle_irq(struct arm_pmu *cpu_pmu)
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
2.50.0.727.gbf7dc18ff4-goog


