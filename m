Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3F9AD3ABC4
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  6 Dec 2025 00:19:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0NKuhyI73DcmRDf6dJr4Yp2dlSnDCvKYnr68Tztb6CI=; b=Lqfg49Wz2+6K/EokGdflOygr+P
	V197Dt+5xvEqUmkcbfRItG1F6cTEeIRjeO9/mswnp6RaiZt6ZpBD/AwmnfJBPB0LP2BDpHt/A609P
	Om+bfvD1PRKBkG0nrYhT12BezIPu6GOO/r+PJFoH50dJ2Uq0EC89geTtpbMrViV42cU32XBUsS/e6
	N++ITsMu1cJXtu+KgqMBWG9gO0K/wnsmvAZ0eM107WC5hBqhsfovtL0FnlwJYF1BXWHttycCIjkLI
	rCdawuweYdqjip8sOCSHoupU6U524NyjpMLIc/boBHhwFUAPdwvPwQrQ6vJW8CMw026y97ei/H20U
	gthYqX+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRg1T-0000000AHc2-2NMs;
	Sat, 06 Dec 2025 00:19:40 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRg0E-0000000AFOa-1ia1
	for linux-arm-kernel@bombadil.infradead.org;
	Sat, 06 Dec 2025 00:18:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Sender:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=0NKuhyI73DcmRDf6dJr4Yp2dlSnDCvKYnr68Tztb6CI=; b=lxXfsR8/sRCIyU7wKDs84qTmDD
	fPUBBymQAEtYm0uE3Ca9JymWplW30xaGtyofbnfY8Q89CqK10Rh7oYrsLQ+by2+NJmuRpLXajurCG
	2Zznxmjku5c0mr3sf9Jl5InHueUIXOqh5qhweugzNHblikjQ+R4AyzfCF9FbT/Ire/7YCmLOa+UXQ
	iiQ08FawRZ2F3yqX4Cs9r3OAAYL/oCAc0MBSWg9jTS1u0JMLejSDUmAR6gVfcO9HaYKJMjq8A/c5c
	vTYEYRW9Ks0E9H6HDKSCXm6SeqP4tsJHrPbpBNryORl9pq8zhE5vc5Yp1kqmS0OdbRZOpapCyDFDp
	ltn6T/yw==;
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRg0A-00000006SQA-1GpH
	for linux-arm-kernel@lists.infradead.org;
	Sat, 06 Dec 2025 00:18:20 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-34566e62f16so3090061a91.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 05 Dec 2025 16:18:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764980295; x=1765585095; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=0NKuhyI73DcmRDf6dJr4Yp2dlSnDCvKYnr68Tztb6CI=;
        b=D86nwlWtH3oFDNBabL0Yb2hEmZZQPsI2vFdsZjPvizHaCVuSjiQ/J26bnPfDmTxCcF
         DDGIXvlhI0+mHxV1rPFyAzOrjMOk+vaPeKbrp3Hhm30az/qXsJSncW3N+xs+xL6nOwI2
         oHQuiXdqVRmlMxGn11NsLxD1Z1kdt+zh9t0YZQjFA9gE50rJnN3N1qeIRfOTvHUrTGT1
         cfXBLdX/1DIfYUtXQk6T7uYrlraV76GJLHESLgt/z7u7D+JGPVLoB++g0+F31+vXuQ6Y
         rIH7d2UlcwFTzz8SQLieQAryIj5zXDcQXMlZAbThMW+RuqLxqA7KXJjOvIzIJZWSLY2C
         LVFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764980295; x=1765585095;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0NKuhyI73DcmRDf6dJr4Yp2dlSnDCvKYnr68Tztb6CI=;
        b=G5bXjKnjYdV+eiZPla5y2xHh5HddG/4IrkJviJMtWhfzU6SaPtTbUjhXyqqhGN0G8H
         d0wcYDr8Am6v9TBRNJpDCbgOPvyUEKs16iOmAY+J858E9/hHLp+vcJ16jrpT7m3IBMUq
         Hha6+LwKBM7q91KzQ14UDCLKULROlhJ6rhwBr5Kjjvc2Dfqx9SUFLxEcazOy7CASPxM7
         C3/rqcydk3nBMYBSbJMPOaTOa73g1TdsAOh9mD3eOxgmyv3pXS2v6AIn8SxwI+HcPIsG
         Yu9gvlILsvERVY7/zhu93ld6iFfE0M7vbwLpUKSnLkizK8A+Ee3oL/Hw7Zg3szd5UcOH
         nkVA==
X-Gm-Message-State: AOJu0YyVImMFMiBdS3DBKj4fl1bp7c3ZWMMhmGX3SoMt/lb/+XWZ9DUb
	cSUo4t1lvEslkT3KaB2/kio0Uic4dT4synHSCUzwVaSDL8Mvt44s2tjg+Rwh6bvudseFvRUi8gc
	S3J6sFw==
X-Google-Smtp-Source: AGHT+IEu368Ymit6Wf714y2QoU1WaQ4whiXftg8ijTgUsFOrrwNXh1LyvlB+ZwNskFSucsIG3f0JlRtM2cA=
X-Received: from pjoa4.prod.google.com ([2002:a17:90a:8c04:b0:349:6296:2bb7])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:3bc7:b0:340:d578:f2a2
 with SMTP id 98e67ed59e1d1-349a252b381mr638790a91.6.1764980295195; Fri, 05
 Dec 2025 16:18:15 -0800 (PST)
Date: Fri,  5 Dec 2025 16:17:00 -0800
In-Reply-To: <20251206001720.468579-1-seanjc@google.com>
Mime-Version: 1.0
References: <20251206001720.468579-1-seanjc@google.com>
X-Mailer: git-send-email 2.52.0.223.gf5cc29aaa4-goog
Message-ID: <20251206001720.468579-25-seanjc@google.com>
Subject: [PATCH v6 24/44] KVM: x86/pmu: Introduce eventsel_hw to prepare for
 pmu event filtering
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Xin Li <xin@zytor.com>, "H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, loongarch@lists.linux.dev, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, Mingwei Zhang <mizhang@google.com>, 
	Xudong Hao <xudong.hao@intel.com>, Sandipan Das <sandipan.das@amd.com>, 
	Dapeng Mi <dapeng1.mi@linux.intel.com>, Xiong Zhang <xiong.y.zhang@linux.intel.com>, 
	Manali Shukla <manali.shukla@amd.com>, Jim Mattson <jmattson@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251206_001818_367666_170B2B66 
X-CRM114-Status: GOOD (  14.85  )
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
Reply-To: Sean Christopherson <seanjc@google.com>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Mingwei Zhang <mizhang@google.com>

Introduce eventsel_hw and fixed_ctr_ctrl_hw to store the actual HW value in
PMU event selector MSRs. In mediated PMU checks events before allowing the
event values written to the PMU MSRs. However, to match the HW behavior,
when PMU event checks fails, KVM should allow guest to read the value back.

This essentially requires an extra variable to separate the guest requested
value from actual PMU MSR value. Note this only applies to event selectors.

Signed-off-by: Mingwei Zhang <mizhang@google.com>
Co-developed-by: Dapeng Mi <dapeng1.mi@linux.intel.com>
Signed-off-by: Dapeng Mi <dapeng1.mi@linux.intel.com>
Tested-by: Xudong Hao <xudong.hao@intel.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/include/asm/kvm_host.h | 2 ++
 arch/x86/kvm/pmu.c              | 7 +++++--
 arch/x86/kvm/svm/pmu.c          | 1 +
 arch/x86/kvm/vmx/pmu_intel.c    | 2 ++
 4 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
index defd979003be..e72357f64b19 100644
--- a/arch/x86/include/asm/kvm_host.h
+++ b/arch/x86/include/asm/kvm_host.h
@@ -529,6 +529,7 @@ struct kvm_pmc {
 	 */
 	u64 emulated_counter;
 	u64 eventsel;
+	u64 eventsel_hw;
 	struct perf_event *perf_event;
 	struct kvm_vcpu *vcpu;
 	/*
@@ -557,6 +558,7 @@ struct kvm_pmu {
 	unsigned nr_arch_fixed_counters;
 	unsigned available_event_types;
 	u64 fixed_ctr_ctrl;
+	u64 fixed_ctr_ctrl_hw;
 	u64 fixed_ctr_ctrl_rsvd;
 	u64 global_ctrl;
 	u64 global_status;
diff --git a/arch/x86/kvm/pmu.c b/arch/x86/kvm/pmu.c
index 621722e8cc7e..36eebc1c7e70 100644
--- a/arch/x86/kvm/pmu.c
+++ b/arch/x86/kvm/pmu.c
@@ -902,11 +902,14 @@ static void kvm_pmu_reset(struct kvm_vcpu *vcpu)
 		pmc->counter = 0;
 		pmc->emulated_counter = 0;
 
-		if (pmc_is_gp(pmc))
+		if (pmc_is_gp(pmc)) {
 			pmc->eventsel = 0;
+			pmc->eventsel_hw = 0;
+		}
 	}
 
-	pmu->fixed_ctr_ctrl = pmu->global_ctrl = pmu->global_status = 0;
+	pmu->fixed_ctr_ctrl = pmu->fixed_ctr_ctrl_hw = 0;
+	pmu->global_ctrl = pmu->global_status = 0;
 
 	kvm_pmu_call(reset)(vcpu);
 }
diff --git a/arch/x86/kvm/svm/pmu.c b/arch/x86/kvm/svm/pmu.c
index 16c88b2a2eb8..c1ec1962314e 100644
--- a/arch/x86/kvm/svm/pmu.c
+++ b/arch/x86/kvm/svm/pmu.c
@@ -166,6 +166,7 @@ static int amd_pmu_set_msr(struct kvm_vcpu *vcpu, struct msr_data *msr_info)
 		data &= ~pmu->reserved_bits;
 		if (data != pmc->eventsel) {
 			pmc->eventsel = data;
+			pmc->eventsel_hw = data;
 			kvm_pmu_request_counter_reprogram(pmc);
 		}
 		return 0;
diff --git a/arch/x86/kvm/vmx/pmu_intel.c b/arch/x86/kvm/vmx/pmu_intel.c
index 820da47454d7..855240678300 100644
--- a/arch/x86/kvm/vmx/pmu_intel.c
+++ b/arch/x86/kvm/vmx/pmu_intel.c
@@ -61,6 +61,7 @@ static void reprogram_fixed_counters(struct kvm_pmu *pmu, u64 data)
 	int i;
 
 	pmu->fixed_ctr_ctrl = data;
+	pmu->fixed_ctr_ctrl_hw = data;
 	for (i = 0; i < pmu->nr_arch_fixed_counters; i++) {
 		u8 new_ctrl = fixed_ctrl_field(data, i);
 		u8 old_ctrl = fixed_ctrl_field(old_fixed_ctr_ctrl, i);
@@ -430,6 +431,7 @@ static int intel_pmu_set_msr(struct kvm_vcpu *vcpu, struct msr_data *msr_info)
 
 			if (data != pmc->eventsel) {
 				pmc->eventsel = data;
+				pmc->eventsel_hw = data;
 				kvm_pmu_request_counter_reprogram(pmc);
 			}
 			break;
-- 
2.52.0.223.gf5cc29aaa4-goog


