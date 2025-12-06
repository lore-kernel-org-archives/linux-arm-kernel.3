Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8FA6D3ABC2
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  6 Dec 2025 00:20:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VDZ6qvbhnxeB/xicU22NIlKKbEtAofiGZXasyTcZTcc=; b=S2umMr9ucXWYB2AWIoA50DMt+J
	AulnKZgROz2LL+LyLuTwW32h7nu1+cA8Iz/NOt3qySHVIZ/1cvZkniyQUpYO+vmZDadYG1+1/a+Mv
	UqAi6azTEDrqBayprLcdXAfV6KShG662GDDCclFQzEWhnp18sOi2bewQEeSvoWsoUX3FyZ1rq0R9s
	S8LhhdDjXdyp7InVKILf0R4BY7+3UUmtQSUTu9nQVzt2sB9KhSqRme8riK31tK5XT+jOULoLxLhd9
	6t1Zfr1DJa30BCIrTzt4/xcLggx2Az3F1S479sswtb7tLs05ZmaM38KXnq2kHNxrYNJVeHx+JoxpS
	xaYqvVVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRg1n-0000000AIIh-19GU;
	Sat, 06 Dec 2025 00:19:59 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRg0R-0000000AFi1-0jQd
	for linux-arm-kernel@bombadil.infradead.org;
	Sat, 06 Dec 2025 00:18:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Sender:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=VDZ6qvbhnxeB/xicU22NIlKKbEtAofiGZXasyTcZTcc=; b=N/mpMcDx4Ranp92U7nZ3irdV0r
	/OI/2Bk37eaE46apD7izUATSPB7+JnEip1bDLRxrxDifqQ1AGmBDO+MVa4rzPioq+ML10I5msKpM8
	id9mn1htJK3myF80GOMaQqB+sVuIiFiueO6vg+W5iaekcGsNHEAt/RVAY2KzCzES/PbPp9lD/0DX/
	+fatBBQl/HLg5ldeH3QndPQ3qj/gZSB/PhdG/P9UNJ47lVo347PrsjVtta9WKbnYhv/K9LrzTzpKi
	VcJuIkOcTe5ZQ8kioGzdcodZraNmVzngzb8YurBiq0oyMhc557YZ5HewRyI/rIjXtt47FLDGeAL93
	762CzR5w==;
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRg0K-00000006SXS-2aUy
	for linux-arm-kernel@lists.infradead.org;
	Sat, 06 Dec 2025 00:18:33 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-340ad9349b3so4794029a91.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 05 Dec 2025 16:18:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764980305; x=1765585105; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=VDZ6qvbhnxeB/xicU22NIlKKbEtAofiGZXasyTcZTcc=;
        b=qkqwl7vpSvluylo7116YEXLzsHpwqdD6X8sphDqsnBKjO04y04x8krwd3VeIkW93mR
         fiWJ7/0S+p3YARNOudqbUwaiCnJHwQkE0wsQZclI2qu72GUBqc9w7aLvwsOhxzkDJb//
         5Yo6Gu/teGINWaNOD7SMbLGwj8vyu0KtFpPgu+UkkkScHVsEspswS/nFvAI4aVzXQj3C
         GYW/Q0PiSL5ow++jIZY9e5Nm9mFGsaWPFV9FEWFzdq3b3+HAJTSTHmqcWDclZda3Nc7w
         e0oH1k0R50+eM7revVSn10LAETOJioLn6oTjbKEeCOdFG3eYPl/S1XzNhQU1XdJZAel1
         BoIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764980305; x=1765585105;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VDZ6qvbhnxeB/xicU22NIlKKbEtAofiGZXasyTcZTcc=;
        b=vU298ETRZ3XoAPXsPbl5uDzKBFcMi+amo+NPI7EbwQrwlMeI4N86yOv9LEa0dYEu8+
         U4ICD8P/HpMiQgfR5F1gjUIhn5PdYCkEUnei9vsbpJuB03rCWeNcjK6ZiZeUSU8HSHfx
         3a5c1T8WEj4JMMovGrEWKWujzxBF33JU4YfHbCKGKE3CxHSy5wNylUFqNVI3NTASv8Es
         2yRKMOa0alNScj4Bd4jDkqXjYR8dWlj+Y3g0eyyWLp0YYviZLB0cHHK0KJ775xZrLNoT
         21017+3Ux5aP/SC7rxXLCUZY/+8ePtpQ8pj2dRjzV0EZPO1LUVeIAU7K1njsUjFwhK+F
         GObg==
X-Gm-Message-State: AOJu0YxQJKelrLiT86LMiZwxJ1IDv1+K+4/tiiUQZuJq4sfWkkk7UM6m
	pBt7zeh4c6GlXeDAUTk+fwpP/UK6/uYoxOSZuBIflrHjqr3s1myhbCq6Gxyk9zyVqL8UhgPdlK/
	0hFQoVw==
X-Google-Smtp-Source: AGHT+IF4RzpEBka8aK0ucRE2Cm9e095W8Dm56/F1owL7T0nm81v+pRoWT+IrKx6iUc4yDzdsBycmMqAWYnk=
X-Received: from pjuy11.prod.google.com ([2002:a17:90a:d70b:b0:340:3ea9:30bc])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:5905:b0:341:761c:3330
 with SMTP id 98e67ed59e1d1-349a25bd8e0mr687187a91.23.1764980304689; Fri, 05
 Dec 2025 16:18:24 -0800 (PST)
Date: Fri,  5 Dec 2025 16:17:05 -0800
In-Reply-To: <20251206001720.468579-1-seanjc@google.com>
Mime-Version: 1.0
References: <20251206001720.468579-1-seanjc@google.com>
X-Mailer: git-send-email 2.52.0.223.gf5cc29aaa4-goog
Message-ID: <20251206001720.468579-30-seanjc@google.com>
Subject: [PATCH v6 29/44] KVM: x86/pmu: Handle emulated instruction for
 mediated vPMU
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
X-CRM114-CacheID: sfid-20251206_001828_723924_78B1B1B1 
X-CRM114-Status: GOOD (  13.12  )
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

From: Dapeng Mi <dapeng1.mi@linux.intel.com>

Mediated vPMU needs to accumulate the emulated instructions into counter
and load the counter into HW at vm-entry.

Moreover, if the accumulation leads to counter overflow, KVM needs to
update GLOBAL_STATUS and inject PMI into guest as well.

Suggested-by: Sean Christopherson <seanjc@google.com>
Signed-off-by: Dapeng Mi <dapeng1.mi@linux.intel.com>
Signed-off-by: Mingwei Zhang <mizhang@google.com>
Tested-by: Xudong Hao <xudong.hao@intel.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/pmu.c | 39 +++++++++++++++++++++++++++++++++++++--
 1 file changed, 37 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kvm/pmu.c b/arch/x86/kvm/pmu.c
index 578bf996bda2..cb07d9b62bee 100644
--- a/arch/x86/kvm/pmu.c
+++ b/arch/x86/kvm/pmu.c
@@ -1033,10 +1033,45 @@ void kvm_pmu_destroy(struct kvm_vcpu *vcpu)
 	kvm_pmu_reset(vcpu);
 }
 
+static bool pmc_is_pmi_enabled(struct kvm_pmc *pmc)
+{
+	u8 fixed_ctr_ctrl;
+
+	if (pmc_is_gp(pmc))
+		return pmc->eventsel & ARCH_PERFMON_EVENTSEL_INT;
+
+	fixed_ctr_ctrl = fixed_ctrl_field(pmc_to_pmu(pmc)->fixed_ctr_ctrl,
+					  pmc->idx - KVM_FIXED_PMC_BASE_IDX);
+	return fixed_ctr_ctrl & INTEL_FIXED_0_ENABLE_PMI;
+}
+
 static void kvm_pmu_incr_counter(struct kvm_pmc *pmc)
 {
-	pmc->emulated_counter++;
-	kvm_pmu_request_counter_reprogram(pmc);
+	struct kvm_vcpu *vcpu = pmc->vcpu;
+
+	/*
+	 * For perf-based PMUs, accumulate software-emulated events separately
+	 * from pmc->counter, as pmc->counter is offset by the count of the
+	 * associated perf event. Request reprogramming, which will consult
+	 * both emulated and hardware-generated events to detect overflow.
+	 */
+	if (!kvm_vcpu_has_mediated_pmu(vcpu)) {
+		pmc->emulated_counter++;
+		kvm_pmu_request_counter_reprogram(pmc);
+		return;
+	}
+
+	/*
+	 * For mediated PMUs, pmc->counter is updated when the vCPU's PMU is
+	 * put, and will be loaded into hardware when the PMU is loaded. Simply
+	 * increment the counter and signal overflow if it wraps to zero.
+	 */
+	pmc->counter = (pmc->counter + 1) & pmc_bitmask(pmc);
+	if (!pmc->counter) {
+		pmc_to_pmu(pmc)->global_status |= BIT_ULL(pmc->idx);
+		if (pmc_is_pmi_enabled(pmc))
+			kvm_make_request(KVM_REQ_PMI, vcpu);
+	}
 }
 
 static inline bool cpl_is_matched(struct kvm_pmc *pmc)
-- 
2.52.0.223.gf5cc29aaa4-goog


