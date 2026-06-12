Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88D5ACD98CF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Jun 2026 19:29:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U3mxqdo/FWgK9hnIRW4N9gL8LSmw3WCN8Nq0npc1NKo=; b=3f7BEB3mgo3oR+Eoy+wYE1EJYB
	dpmmUZa9ym/DwzoP16iR3J2lMxSyjUAfVqIuaURSM3AifWWjAyqIwoqrXbQVy2CTfvnNLVI8WDdXz
	3lQe1F3FIPSFLxPe/VYLsdr0FbsJJEFM8PSPJYKrDYWbvoOucs3/JVN6H7KXiVqd2Yq6Odqhk1qbH
	z6ZiddPbq003fLP57J3vPqUgU6mCtZ6FFOOAPsMkyQI/byzsCh/Joe2+evvntGvridvZpcQ6KWG0d
	bURo99UtKhPAPeCKdiqL4mR4VwtgGUrOjqlHE49h2zpqTT/oMKGlJplz80ks+DbIRvll8LjDtYCIM
	8XY5VBwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY7ZO-0000000BSfX-0YqO;
	Fri, 12 Jun 2026 19:29:34 +0000
Received: from mail-oo1-xc4a.google.com ([2607:f8b0:4864:20::c4a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY7ZF-0000000BSTL-2DHM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Jun 2026 19:29:26 +0000
Received: by mail-oo1-xc4a.google.com with SMTP id 006d021491bc7-69da2d033c9so1264227eaf.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Jun 2026 12:29:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781292564; x=1781897364; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=U3mxqdo/FWgK9hnIRW4N9gL8LSmw3WCN8Nq0npc1NKo=;
        b=HQ6EEcBkByx8Qlba8zIfnQ+j98SDXtbQ9Qj122gIWZRiSm41QQkj13DpPR+4Vci11i
         IrG6VTgKHTFGCM0U+fcKOFILEJHvGamWnh6w7PCTa1nBB5h27/Cw8fJboBZecmPWZ8Cv
         3LBXewP9vhulrx9LhNBdZZxjFEsju2KxNSVFakI+v5vBOUtcNdYvrATg4sEaNBuhcaoU
         8D6LWQMK3ZfefUEMhwoNVpNaJezJH5FrNW79tXfrxLeHBfE3cPqnrobq5fvCTJVP7u/H
         LA5R4JkiFb0SPjwK6x6Ndibw03SwZ9B0ifGcgtTKm10aU+RlNcWLzrQiYBsdrTd2mDVg
         vhfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781292564; x=1781897364;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=U3mxqdo/FWgK9hnIRW4N9gL8LSmw3WCN8Nq0npc1NKo=;
        b=nKzjOIq8xeS1IQa+Tr+RW1PEsc9VAC6RUexcyIXG2JED6i3oI1CnvffKCkCxMce/iY
         JRehi/yAg7yQ1xZJ9yBUGHSLyLo2TxuMtFqK45hAuHOHW/PxgttOVYDvLEDs9aQWKM/S
         60jfR1teOqbqc3k2xNwS8+a00i+0yiynL4D2ohy3fdzC16JJLyYRygVKU9dm2mDp1UKf
         cu+2qRvl73TzH/3nsz5xV/Z7S1p4noxJ2e+F6Dd7rAse3dU3fVKNv12XfEfW5x3/WIQc
         vkqiho3FwM6NQC4a7PxVU645I5RMFY6o49q6rS+sSH85bo6BXmsJqvW4K3vE2L2RSYIA
         0bxg==
X-Forwarded-Encrypted: i=1; AFNElJ+yHT3LGgcsx9fkiEC6N2IKYKVXMbsr73EPZhWVKFH1hJrYUKNbDrtiDDIZht+o4kKzDG4MX6QhUeGXC32Kcfi0@lists.infradead.org
X-Gm-Message-State: AOJu0Yzz4vg3uvISdS7V6E47vp4+kqyCXDfSyoG38knh3RzEwmfr/68h
	OtMRbiLFL/s9BJz+2s8UlTMHXgne2cZhPqLCIHUflBWHPG1pvPOSJBilOT/vY/NIJrXLbYrq3QG
	8MooMQn8eX6zxH2EX1FTAFlnOvA==
X-Received: from oaqy19-n2.prod.google.com ([2002:a05:6871:2d3:20b0:440:e30e:488f])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6820:16a7:b0:69e:2bf1:764e with SMTP id 006d021491bc7-69eec98b283mr491295eaf.44.1781292563404;
 Fri, 12 Jun 2026 12:29:23 -0700 (PDT)
Date: Fri, 12 Jun 2026 19:29:02 +0000
In-Reply-To: <20260612192909.1153907-1-coltonlewis@google.com>
Mime-Version: 1.0
References: <20260612192909.1153907-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.54.0.1136.gdb2ca164c4-goog
Message-ID: <20260612192909.1153907-15-coltonlewis@google.com>
Subject: [PATCH 14/21] KVM: arm64: Apply dynamic guest counter reservations
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
X-CRM114-CacheID: sfid-20260612_122925_606223_D6AF5836 
X-CRM114-Status: GOOD (  17.88  )
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

Apply dynamic guest counter reservations by checking if the requested
guest mask collides with any events the host has scheduled and calling
pmu_perf_resched_update() with a hook that updates the mask of
available counters in between schedule out and schedule in.

Signed-off-by: Colton Lewis <coltonlewis@google.com>
---
 arch/arm64/kvm/pmu-direct.c  | 69 +++++++++++++++++++++++++++++++++++-
 include/linux/perf/arm_pmu.h |  1 +
 2 files changed, 69 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/pmu-direct.c b/arch/arm64/kvm/pmu-direct.c
index 49f1feb5d280c..044f011c9c84b 100644
--- a/arch/arm64/kvm/pmu-direct.c
+++ b/arch/arm64/kvm/pmu-direct.c
@@ -87,6 +87,73 @@ u64 kvm_pmu_direct_pmcr_read(struct kvm_vcpu *vcpu)
 		ARMV8_PMU_PMCR_N);
 }
 
+/* Callback to update counter mask between perf scheduling */
+static void kvm_pmu_update_mask(struct pmu *pmu, void *data)
+{
+	struct arm_pmu *arm_pmu = to_arm_pmu(pmu);
+	unsigned long *new_mask = data;
+
+	bitmap_copy(arm_pmu->cntr_mask, new_mask, ARMPMU_MAX_HWEVENTS);
+}
+
+/**
+ * kvm_pmu_set_guest_counters() - Handle dynamic counter reservations
+ * @cpu_pmu: struct arm_pmu to potentially modify
+ * @guest_mask: new guest mask for the pmu
+ *
+ * Check if guest counters will interfere with current host events and
+ * call into perf_pmu_resched_update if a reschedule is required.
+ */
+static void kvm_pmu_set_guest_counters(struct arm_pmu *cpu_pmu, u64 guest_mask)
+{
+	struct pmu_hw_events *cpuc = this_cpu_ptr(cpu_pmu->hw_events);
+	DECLARE_BITMAP(guest_bitmap, ARMPMU_MAX_HWEVENTS);
+	DECLARE_BITMAP(new_mask, ARMPMU_MAX_HWEVENTS);
+	bool need_resched = false;
+
+	bitmap_from_arr64(guest_bitmap, &guest_mask, ARMPMU_MAX_HWEVENTS);
+	bitmap_copy(new_mask, cpu_pmu->hw_cntr_impl, ARMPMU_MAX_HWEVENTS);
+
+	if (guest_mask) {
+		/* Subtract guest counters from available host mask */
+		bitmap_andnot(new_mask, new_mask, guest_bitmap, ARMPMU_MAX_HWEVENTS);
+
+		/* Did we collide with an active host event? */
+		if (bitmap_intersects(cpuc->used_mask, guest_bitmap, ARMPMU_MAX_HWEVENTS)) {
+			int idx;
+
+			need_resched = true;
+			cpuc->host_squeezed = true;
+
+			/* Look for pinned events that are about to be preempted */
+			for_each_set_bit(idx, guest_bitmap, ARMPMU_MAX_HWEVENTS) {
+				if (test_bit(idx, cpuc->used_mask) && cpuc->events[idx] &&
+				    cpuc->events[idx]->attr.pinned) {
+					pr_warn_once("perf: Pinned host event squeezed out by KVM guest PMU partition\n");
+					break;
+				}
+			}
+		}
+	} else {
+		/*
+		 * Restoring to hw_cntr_impl.
+		 * Only resched if we previously squeezed an event.
+		 */
+		if (cpuc->host_squeezed) {
+			need_resched = true;
+			cpuc->host_squeezed = false;
+		}
+	}
+
+	if (need_resched) {
+		/* Collision: run full perf reschedule */
+		perf_pmu_resched_update(&cpu_pmu->pmu, kvm_pmu_update_mask, new_mask);
+	} else {
+		/* Host was never using guest counters anyway */
+		bitmap_copy(cpu_pmu->cntr_mask, new_mask, ARMPMU_MAX_HWEVENTS);
+	}
+}
+
 /**
  * kvm_pmu_host_counter_mask() - Compute bitmask of host-reserved counters
  * @pmu: Pointer to arm_pmu struct
@@ -209,6 +276,7 @@ void kvm_pmu_load(struct kvm_vcpu *vcpu)
 
 	pmu = vcpu->kvm->arch.arm_pmu;
 	guest_counters = kvm_pmu_guest_counter_mask(pmu);
+	kvm_pmu_set_guest_counters(pmu, guest_counters);
 	kvm_pmu_apply_event_filter(vcpu);
 
 	for_each_set_bit(i, &guest_counters, ARMPMU_MAX_HWEVENTS) {
@@ -317,7 +385,6 @@ void kvm_pmu_put(struct kvm_vcpu *vcpu)
 	/* Stop guest counters and disable interrupts in hardware. */
 	write_sysreg(mask, pmcntenclr_el0);
 	write_sysreg(mask, pmintenclr_el1);
-
 	kvm_pmu_set_guest_counters(pmu, 0);
 	preempt_enable();
 }
diff --git a/include/linux/perf/arm_pmu.h b/include/linux/perf/arm_pmu.h
index 2e1e7a48e05ff..3139f80e877f7 100644
--- a/include/linux/perf/arm_pmu.h
+++ b/include/linux/perf/arm_pmu.h
@@ -75,6 +75,7 @@ struct pmu_hw_events {
 
 	/* Active events requesting branch records */
 	unsigned int		branch_users;
+	bool host_squeezed;
 };
 
 enum armpmu_attr_groups {
-- 
2.54.0.1136.gdb2ca164c4-goog


