Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 380EFC98318
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 17:31:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Pic1jTngVzAQRpfdVenOHmbI8TlKBDo3bPHOvRzPxSI=; b=q57EoFyf+HNJlld4gm4fPJFyfr
	jZNKdbVdjq078v0P3Vf1K28/GHiEGE/EUeKGsGcV+x36i8V/hAfNECYURI9GlbLlNeWftLjiwbpMC
	KMtAJgifPgOEj2u93hxmGJDfdKgkPZPv02ef0QyYaKRjVksd2BsnnFjDUcy08bKpK/B6jQN+pUtrx
	XxBXR7p3nQ9pgxPb5prjbTML7PKHVNpFP1D0k1WT2G5nyn4TccNXoRhkmkh1hF0rdBxTjpNYE+PKa
	ujK+Krwfn6mceqwpDsBjDq1pdOf140IqN3C6kgeBJAv2kZBDJpa3SJN2I8/DEKMhRFK7Vp8yA/XEZ
	1CCRAZzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9nHm-0000000Bkn2-3Uf2;
	Thu, 24 Sep 2026 17:31:06 +0000
Received: from mail-oi1-x247.google.com ([2607:f8b0:4864:20::247])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9nGZ-0000000Bk1O-29b2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 17:29:57 +0000
Received: by mail-oi1-x247.google.com with SMTP id 5614622812f47-4c7f887ac6bso193125b6e.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Sep 2026 10:29:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790270990; x=1790875790; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Pic1jTngVzAQRpfdVenOHmbI8TlKBDo3bPHOvRzPxSI=;
        b=FeG1N8VviDn0dJN3EStOQcZy4r99CMnuPp7K9hpROw49af3I8D/+9+ZI1BsLzKY+aw
         UxACblj6s2rpYnRSz1Cdg9V3H06NEXfcTN1/nDx8Vqr6RLvOlTtvyyveEr3E28uLzaIB
         IoMNJ0JZ2gAqguxEreloOAmfswdx1M42Rv+QwYacG2Mm7ieOyZ6CUkyx0nBtev12YN/9
         ryRX4GMb4I0e9805KothVH7OMQRz6k8v2I6Bz0gZwKhYWw22d9tO+syebaFBv5H2l/wd
         bAWXjFpQfF5AdX4AyDhYjcP57uSX40kEekUtf7ZFY5OToU4LO9zAs4+9ijlss+ok1GeB
         qcCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790270990; x=1790875790;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Pic1jTngVzAQRpfdVenOHmbI8TlKBDo3bPHOvRzPxSI=;
        b=ITcaRcQw80gY2QFKCnLpQn8fWwUKS9skQJa9QC+5nGkYs2xNkrS5AabttjjOKjNdyp
         rcqN3PhnXngyFk4D2OPjp85cdpmAQ78tMptPJLSewGZJ7/8wu+8l5J8VqpD1CnW6Hxtz
         sH/3FY1DeYUUht0FqaLZd2/IDEjYww4BacEmLXjkIDmkLfPzpx/LkZ6oBlrtpJ4Ck/bL
         3+QiVSavlEaU/OrFU7K6qA4AbLIlv3Et8UmopgD+Ui8MLrhzoE/+E92Uu0qz7ik4LYM7
         ws9NPlOEN02P57c7dJb+wfN1MBDwixNptgRoZafcE9uyFno8DvPTKsTJYxw5N8R7WF+Y
         i0zQ==
X-Forwarded-Encrypted: i=1; AKwUvBxbsRSb8ddNq4dM+oKwWc6g8b789Y1IZXzLbjLDfK0NJFqSQjkF6n0RznG3lpZfxIsIdYg3eSCPVlcQvCv+NXMt@lists.infradead.org
X-Gm-Message-State: AFuF++mKMbBxu+EsCG5G/19UBiMwlZAulU6LK2JzRxjofVqhnLUu/ufT
	cPrwzUFAj47oJRvzgSgqb3Ma5rHsIW3gz6eRGECWE5O3Fnn9t7+Cl52EmyxTOBZOGHYDzITdiIp
	vVwlpNavYqH6cIrMOsXEvlaN9SA==
X-Received: from jabgl11.prod.google.com ([2002:a05:6638:6acb:b0:5f4:25c4:a67f])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:238e:b0:4b2:5529:ed3c with SMTP id 5614622812f47-4d72e1663d0mr3044551b6e.7.1790270989852;
 Thu, 24 Sep 2026 10:29:49 -0700 (PDT)
Date: Thu, 24 Sep 2026 17:29:19 +0000
In-Reply-To: <20260924172928.2110956-1-coltonlewis@google.com>
Mime-Version: 1.0
References: <20260924172928.2110956-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260924172928.2110956-14-coltonlewis@google.com>
Subject: [PATCH v9 13/22] KVM: arm64: Enforce PMU event filter at vcpu_load()
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
X-CRM114-CacheID: sfid-20260924_102951_619905_C7C9C25B 
X-CRM114-Status: GOOD (  21.22  )
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
rechecked on every load since it might have changed since the last
time the guest wrote a value. If the event is filtered, exclude
counting at all exception levels before writing the hardware.

Signed-off-by: Colton Lewis <coltonlewis@google.com>
---
 arch/arm64/kvm/pmu-direct.c | 77 +++++++++++++++++++++++++++++++++++++
 arch/arm64/kvm/sys_regs.c   |  1 +
 include/kvm/arm_pmu.h       |  3 ++
 3 files changed, 81 insertions(+)

diff --git a/arch/arm64/kvm/pmu-direct.c b/arch/arm64/kvm/pmu-direct.c
index 92eec0fa33867..a22c9258c2452 100644
--- a/arch/arm64/kvm/pmu-direct.c
+++ b/arch/arm64/kvm/pmu-direct.c
@@ -169,6 +169,82 @@ u64 kvm_pmu_guest_counter_mask(void)
 	return kvm_vcpu_pmu_guest_counter_mask(kvm_get_running_vcpu());
 }
 
+/**
+ * kvm_pmu_apply_single_event_filter() - Apply event filter to a single counter
+ * @vcpu: Pointer to vcpu struct
+ * @idx: Counter index
+ *
+ * Compute the filtered event value and write it directly to the hardware register.
+ */
+void kvm_pmu_apply_single_event_filter(struct kvm_vcpu *vcpu, u8 idx)
+{
+	struct arm_pmu *pmu = vcpu->kvm->arch.arm_pmu;
+	u64 guest_counters;
+	u64 evtyper_set = ARMV8_PMU_EXCLUDE_EL0 |
+		ARMV8_PMU_EXCLUDE_EL1;
+	u64 evtyper_clr = ARMV8_PMU_INCLUDE_EL2;
+	bool guest_include_el2;
+	u64 val;
+	u64 evsel;
+
+	if (!pmu || vcpu != kvm_get_running_vcpu())
+		return;
+
+	guest_counters = kvm_vcpu_pmu_guest_counter_mask(vcpu);
+	if (!test_bit(idx, (unsigned long *)&guest_counters))
+		return;
+
+	if (idx == ARMV8_PMU_CYCLE_IDX) {
+		val = __vcpu_sys_reg(vcpu, PMCCFILTR_EL0);
+		evsel = ARMV8_PMUV3_PERFCTR_CPU_CYCLES;
+	} else {
+		val = __vcpu_sys_reg(vcpu, PMEVTYPER0_EL0 + idx);
+		evsel = val & kvm_pmu_event_mask(vcpu->kvm);
+	}
+
+	guest_include_el2 = (val & ARMV8_PMU_INCLUDE_EL2);
+	val &= ~evtyper_clr;
+
+	if (unlikely(is_hyp_ctxt(vcpu))) {
+		if (guest_include_el2)
+			val &= ~ARMV8_PMU_EXCLUDE_EL1;
+		else
+			val |= ARMV8_PMU_EXCLUDE_EL1;
+	}
+
+	if (vcpu->kvm->arch.pmu_filter &&
+	    !test_bit(evsel, vcpu->kvm->arch.pmu_filter))
+		val |= evtyper_set;
+
+	if (idx == ARMV8_PMU_CYCLE_IDX)
+		write_pmccfiltr(val);
+	else
+		write_pmevtypern(idx, val);
+}
+
+/**
+ * kvm_pmu_apply_event_filter() - Apply event filter to all guest counters
+ * @vcpu: Pointer to vcpu struct
+ *
+ * To uphold the guarantee of the KVM PMU event filter, we must ensure
+ * no counter counts if the event is filtered. Accomplish this by
+ * filtering all exception levels if the event is filtered.
+ */
+static void kvm_pmu_apply_event_filter(struct kvm_vcpu *vcpu)
+{
+	struct arm_pmu *pmu = vcpu->kvm->arch.arm_pmu;
+	unsigned long guest_counters;
+	u8 i;
+
+	if (!pmu)
+		return;
+
+	guest_counters = kvm_vcpu_pmu_guest_counter_mask(vcpu);
+
+	for_each_set_bit(i, &guest_counters, ARMPMU_MAX_HWEVENTS)
+		kvm_pmu_apply_single_event_filter(vcpu, i);
+}
+
 /**
  * kvm_pmu_load() - Load untrapped PMU registers
  * @vcpu: Pointer to struct kvm_vcpu
@@ -194,6 +270,7 @@ void kvm_pmu_load(struct kvm_vcpu *vcpu)
 	preempt_disable();
 
 	guest_counters = kvm_vcpu_pmu_guest_counter_mask(vcpu);
+	kvm_pmu_apply_event_filter(vcpu);
 
 	for_each_set_bit(i, &guest_counters, ARMPMU_MAX_HWEVENTS) {
 		val = __vcpu_sys_reg(vcpu, PMEVCNTR0_EL0 + i);
diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index ebcf52261df65..c4aa6a448b6ca 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -1137,6 +1137,7 @@ static void pmu_reg_write(struct kvm_vcpu *vcpu, enum vcpu_sysreg reg, u64 val,
 		if (kvm_pmu_is_partitioned(vcpu->kvm)) {
 			mask = kvm_pmu_evtyper_mask(vcpu->kvm);
 			__vcpu_assign_sys_reg(vcpu, reg, val & mask);
+			kvm_pmu_apply_single_event_filter(vcpu, idx);
 		} else {
 			kvm_pmu_set_counter_event_type(vcpu, val, idx);
 			kvm_vcpu_pmu_restore_guest(vcpu);
diff --git a/include/kvm/arm_pmu.h b/include/kvm/arm_pmu.h
index 2604a6a46d5f3..ddbbbb050b9de 100644
--- a/include/kvm/arm_pmu.h
+++ b/include/kvm/arm_pmu.h
@@ -104,6 +104,7 @@ u64 kvm_pmu_host_counter_mask(void);
 u64 kvm_pmu_guest_counter_mask(void);
 void kvm_pmu_load(struct kvm_vcpu *vcpu);
 void kvm_pmu_put(struct kvm_vcpu *vcpu);
+void kvm_pmu_apply_single_event_filter(struct kvm_vcpu *vcpu, u8 idx);
 
 /*
  * Updates the vcpu's view of the pmu events for this cpu.
@@ -263,6 +264,8 @@ static inline u64 kvm_pmu_guest_counter_mask(void)
 	return 0;
 }
 
+static inline void kvm_pmu_apply_single_event_filter(struct kvm_vcpu *vcpu, u8 idx) {}
+
 static inline bool has_kvm_pmu_partition_support(void)
 {
 	return false;
-- 
2.56.0.rc1.310.g51773c2048-goog


