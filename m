Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD0D8C98325
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 17:31:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ly1RhTg1DzFLFPcD4bZskzHIIlqyteQE9EzO1zay/Fc=; b=rRBYoOa8Lxy2yrK7dNVPHhsx1n
	vArYAO+o/KNK8ybt07mq6P8j5Q9uHQmwFzyZklmi2x92qWt2Hxr3x7XhdQuei+JJXU5oUpUM7484k
	7HHRp6hjIhboQZG0PJQlOur+6lat4Np7TTU9ypjB3yeZKEWHeOEmiRbgXBGqVz+3xQ1q3AAZyTVN2
	VHc7n1IUZ2+q802k12Z18C+Q+ZzoqW9M51z3bs1DKSv5k26DcmEcaBi47CtPqXbajy1VFKZXzytAN
	s85DjUBk8HS+TDt1JR63kgSy9bjnT0XJm98F85bww7O/se5CP8/hrBe3vRQ7yHY6u/W9AQ14RjO6s
	QtB8GGqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9nHn-0000000Bkoa-2L3L;
	Thu, 24 Sep 2026 17:31:07 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9nGj-0000000BkCd-0u5D
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 24 Sep 2026 17:30:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=ly1RhTg1DzFLFPcD4bZskzHIIlqyteQE9EzO1zay/Fc=; b=qoDPSDDTZvyatwCRJVTBY9dHDk
	j4UTG8Y14vSuGUtTuxu5go9v/P5EWO04W8bXzZlj3/6FYX9GTf/zZxaNjYA4+zvKhSWIicbhlcF83
	Ro/uDZu7hSaSShJgDuET1xCyOhNwegjPFIspxroV6Ka0lTbDiudDYGDFpFUrkuQg6C/Wg7lbR4mjd
	hqd31LOahIV+y1sT4dBswaNSeTxvfcHkqPR3kBoFTgakgM8HTM5Pooyhyfn7wB6BH/wy9wiapsslZ
	f8vwbeswRmdE5I3pEdhXBvSLK9NwxF/kFSxIsssTcfNqzFECM1DIipkfJHPsGj8PzyCRCwlFy8nsy
	xm+n5IXQ==;
Received: from mail-oi1-x248.google.com ([2607:f8b0:4864:20::248])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x9nGf-0000000GFK4-0Ich
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 17:29:59 +0000
Received: by mail-oi1-x248.google.com with SMTP id 5614622812f47-4c5a1a0b54eso244941b6e.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Sep 2026 10:29:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790270994; x=1790875794; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ly1RhTg1DzFLFPcD4bZskzHIIlqyteQE9EzO1zay/Fc=;
        b=trPhWFRIhrKljkiCGsSI2kfZzZ0Ol+UkGkDbZLPnu5ekmoqcoOZxy9YVQ8oSpxhcx6
         1u1AmZK2XDY5RUemF8eV8mtZ0beS6QRBRXpAf4VWjaBiR5AUv2Kfx3nK8ylkAB+vUbpQ
         ip0a62/A0IocQBY9IJsxMT8/HRwyS9pCWNn8HLE+68+JEXlOAgRRePsJ+y+MX/GIRVSG
         ti4qFTxmlcf5gKz38LACbfjHMi3IrY7a3aX3WaPJQruSvd6oO3PuF5H1VtYwlbl1Uav7
         rYKu9d8UbfKexn7CVuY2Q7dzDVt4msK28T9ns3QKpuIXulAbiZTCZ2pVMNqF8Xu2kr8v
         tCQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790270994; x=1790875794;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ly1RhTg1DzFLFPcD4bZskzHIIlqyteQE9EzO1zay/Fc=;
        b=xluap+Jqi0i8LgIKSwyygu4jH7qFp57Xl7MY+tYAEE8+2pMq2rl7k93+WlJFflwfzR
         AplTSjcaxs51UAyPNxCAdASIiAMyquvqCDj5HNs+VeXIHF36TdfDM3K4bvAMTRkOWdEr
         QLOrirJlVCo7ZolBRwhe1rM3Y2Y7m0LIn3LxNU775LIE/48wYVNuAZ23aTQ0BrH9jf0i
         /xE3l7810Yb1GJUFk2AnS0nY1/w3rVqEgKVNolmZxrcSvRoBuESX9XELZ3AnVXSCQlqF
         3O4qya8LY4YvX/d8rPwRRDm5KoqEuyklGShj0NBsFZELdvLQmFe+ujCMeByMmp63tOmv
         02Zg==
X-Forwarded-Encrypted: i=1; AKwUvByf965miaNDrBTsCpGGizuAz7UqqyVPzrDnAp8FtAB7x9EVuq7SsNIpfGxtcLxr3lcaXWXvepBrT077S4J9ioQd@lists.infradead.org
X-Gm-Message-State: AFuF++ksdjIWp3RuqWKog0ID/EU0x+T7mA0YT8r3cRJLwTpPiOZEwDvB
	ijJ7NLgjfBk0XAGZzudVExQflxhjhRzPr+CqeZ+fz4835thR/GsxYFyxghLZw215bQ1QjrPKtak
	lnZ5waqonSR3VuEsWoV7rxlB7cg==
X-Received: from iofj3.prod.google.com ([2002:a05:6602:7083:b0:9af:289c:476c])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:80b1:b0:4b9:e65b:8c2b with SMTP id 5614622812f47-4d72931dd72mr3225441b6e.25.1790270994011;
 Thu, 24 Sep 2026 10:29:54 -0700 (PDT)
Date: Thu, 24 Sep 2026 17:29:22 +0000
In-Reply-To: <20260924172928.2110956-1-coltonlewis@google.com>
Mime-Version: 1.0
References: <20260924172928.2110956-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260924172928.2110956-17-coltonlewis@google.com>
Subject: [PATCH v9 16/22] KVM: arm64: Apply dynamic guest counter reservations
From: Colton Lewis <coltonlewis@google.com>
To: kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Fuad Tabba <fuad.tabba@linux.dev>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	James Clark <james.clark@linaro.org>, Robin Murphy <robin.murphy@arm.com>, 
	Zide Chen <zide.chen@intel.com>, Alexandru Elisei <alexandru.elisei@arm.com>, 
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>, Mingwei Zhang <mizhang@google.com>, 
	Jonathan Corbet <corbet@lwn.net>, Russell King <linux@armlinux.org.uk>, Shuah Khan <shuah@kernel.org>, 
	linux-perf-users@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Colton Lewis <coltonlewis@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_182957_251624_98C75581 
X-CRM114-Status: GOOD (  18.91  )
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

Reserve and release guest PMU counters dynamically during vCPU load and
put rather than statically at VM creation.

Add kvm_pmu_set_guest_counters() in arch/arm64/kvm/pmu-direct.c, called
from kvm_pmu_load() and kvm_pmu_put(). When the requested guest counter
mask collides with active host events in cpuc->used_mask (or when
releasing counters after squeezing a host event), invoke
perf_pmu_resched_update() with kvm_pmu_update_mask() to update the
per-CPU cpuc->cntr_mask between scheduling host events out and back in;
otherwise update cpuc->cntr_mask directly with interrupts disabled.

Signed-off-by: Colton Lewis <coltonlewis@google.com>
---
 arch/arm64/kvm/pmu-direct.c  | 77 ++++++++++++++++++++++++++++++++++++
 include/linux/perf/arm_pmu.h |  1 +
 2 files changed, 78 insertions(+)

diff --git a/arch/arm64/kvm/pmu-direct.c b/arch/arm64/kvm/pmu-direct.c
index a22c9258c2452..31d5afc44f36e 100644
--- a/arch/arm64/kvm/pmu-direct.c
+++ b/arch/arm64/kvm/pmu-direct.c
@@ -115,6 +115,77 @@ u64 kvm_pmu_direct_pmcr_read(struct kvm_vcpu *vcpu)
 		ARMV8_PMU_PMCR_N);
 }
 
+/* Callback to update counter mask between perf scheduling */
+static void kvm_pmu_update_mask(struct pmu *pmu, void *data)
+{
+	struct arm_pmu *arm_pmu = to_arm_pmu(pmu);
+	struct pmu_hw_events *cpuc = this_cpu_ptr(arm_pmu->hw_events);
+	unsigned long *new_mask = data;
+
+	bitmap_copy(cpuc->cntr_mask, new_mask, ARMPMU_MAX_HWEVENTS);
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
+	unsigned long flags;
+	bool need_resched = false;
+
+	bitmap_from_arr64(guest_bitmap, &guest_mask, ARMPMU_MAX_HWEVENTS);
+	bitmap_copy(new_mask, cpu_pmu->cntr_mask, ARMPMU_MAX_HWEVENTS);
+
+	local_irq_save(flags);
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
+		 * Restoring to full mask.
+		 * Only resched if we previously squeezed an event.
+		 */
+		if (cpuc->host_squeezed) {
+			need_resched = true;
+			cpuc->host_squeezed = false;
+		}
+	}
+	if (!need_resched)
+		/* Host was never using guest counters anyway */
+		bitmap_copy(cpuc->cntr_mask, new_mask, ARMPMU_MAX_HWEVENTS);
+	local_irq_restore(flags);
+
+	if (need_resched) {
+		/* Collision: run full perf reschedule */
+		perf_pmu_resched_update(&cpu_pmu->pmu, kvm_pmu_update_mask, new_mask);
+	}
+}
+
 /**
  * kvm_pmu_host_counter_mask() - Compute bitmask of host-reserved counters
  *
@@ -255,6 +326,7 @@ static void kvm_pmu_apply_event_filter(struct kvm_vcpu *vcpu)
  */
 void kvm_pmu_load(struct kvm_vcpu *vcpu)
 {
+	struct arm_pmu *pmu;
 	unsigned long guest_counters;
 	u64 mask;
 	u8 i;
@@ -269,7 +341,9 @@ void kvm_pmu_load(struct kvm_vcpu *vcpu)
 
 	preempt_disable();
 
+	pmu = vcpu->kvm->arch.arm_pmu;
 	guest_counters = kvm_vcpu_pmu_guest_counter_mask(vcpu);
+	kvm_pmu_set_guest_counters(pmu, guest_counters);
 	kvm_pmu_apply_event_filter(vcpu);
 
 	for_each_set_bit(i, &guest_counters, ARMPMU_MAX_HWEVENTS) {
@@ -329,6 +403,7 @@ void kvm_pmu_load(struct kvm_vcpu *vcpu)
  */
 void kvm_pmu_put(struct kvm_vcpu *vcpu)
 {
+	struct arm_pmu *pmu;
 	unsigned long guest_counters;
 	unsigned long flags;
 	u64 mask;
@@ -345,6 +420,7 @@ void kvm_pmu_put(struct kvm_vcpu *vcpu)
 
 	preempt_disable();
 
+	pmu = vcpu->kvm->arch.arm_pmu;
 	guest_counters = kvm_vcpu_pmu_guest_counter_mask(vcpu);
 	mask = guest_counters;
 
@@ -395,5 +471,6 @@ void kvm_pmu_put(struct kvm_vcpu *vcpu)
 	write_sysreg(val & mask, pmovsclr_el0);
 	local_irq_restore(flags);
 
+	kvm_pmu_set_guest_counters(pmu, 0);
 	preempt_enable();
 }
diff --git a/include/linux/perf/arm_pmu.h b/include/linux/perf/arm_pmu.h
index be1e345e99a77..45658273ffa86 100644
--- a/include/linux/perf/arm_pmu.h
+++ b/include/linux/perf/arm_pmu.h
@@ -76,6 +76,7 @@ struct pmu_hw_events {
 
 	/* Active events requesting branch records */
 	unsigned int		branch_users;
+	bool host_squeezed;
 };
 
 enum armpmu_attr_groups {
-- 
2.56.0.rc1.310.g51773c2048-goog


