Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15192D3ABC6
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  6 Dec 2025 00:19:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vcjFml1Ocn5W+9fhtxvlQ/X0kii0S1Hbwc7mdgCzQH4=; b=I3mdlQx9R3YGcKKAtq7sK2ewJH
	VGvwe3XJ/3d980faPGxWv1T9aTIFImnhoWhAZRiUQJ3E2q6tjpbbjkXAe2dZWKBwsc9sADIxOxxQy
	7Sol/lScwtN3BrfOvQA0rAkLuZJf2U1R9+5NHe/tIp1cKFxlMnTCeGkUhohGKciqeYi+zZk393+DP
	pY6imec2+hikB9NkgfUT+PstD8GkoGRESO4far2oJWy9JTzcacwMq42+xVRbwQb56vz2tGjIF8rlb
	vIH4QE942JQ1eFNmx9STTYaPBPvQcvQBfNp10ezvDkGU0L/oo7BalFA8BCk7+XEdJy+ea6edjC8YC
	5OVOaRdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRg1f-0000000AI0d-1lmL;
	Sat, 06 Dec 2025 00:19:51 +0000
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRg0H-0000000AFST-1LoS
	for linux-arm-kernel@lists.infradead.org;
	Sat, 06 Dec 2025 00:18:27 +0000
Received: by mail-pf1-x44a.google.com with SMTP id d2e1a72fcca58-7b8973c4608so6532834b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 05 Dec 2025 16:18:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764980303; x=1765585103; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=vcjFml1Ocn5W+9fhtxvlQ/X0kii0S1Hbwc7mdgCzQH4=;
        b=NlCUVPd1rNZ9vTOXYpfH7RjIAbXOW8ZN5PIdRQKmgJMAR3jexsK/sh7TQ7ZP1nJUVt
         MRRh+fRYlyJjP69OZRbN72wQdkei4P01C14LBB5QDK18vJnflQrSuNCrnpccs551P3Go
         G5LanXBC2nwfQQA4sMv3E4RvWjZqJnT2pz6wk+tGPUS8Rp0LteJJFvp2PeSRkQu1xRWD
         /oIEwifmc4TWLjL+DmJ+FoFptr7+GpfT1gNmpdyCO/e+BP1tku+/B5xJqy640UuaoR2O
         ccEOQuB3NtojuLE9x4RtI0OvQXiuK3mYUVklN7yECjESoDkokt27uBNDNzQiDhsUhLcx
         KaCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764980303; x=1765585103;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vcjFml1Ocn5W+9fhtxvlQ/X0kii0S1Hbwc7mdgCzQH4=;
        b=X7iwTG7wVClJJVtWqFMk6OMMLeXzFK6iI9vPHnKjp4KMoLN4RJH5bQ9AnpbjvCmlWL
         ObYgW7oz5PBCzx2rnIeCvTKOltfrm8FFN5bUP+xsLkIqzDVQG9XWeHGkGv2hdy0WXE67
         7MVVUeWC95fFT/7Gq5rWtaWGu33h1nnUVtd6lojm56wnqKfTjSApT/91sjLZNuWa/7qZ
         qkdgP8wzk1K2/zozxC6UJFU0LkTBmBjanlb4I8tQdQ6khbRG3PqmdIHWZRu3x1pkRuyz
         zjaMlDoWjPHk/0zF8KS/Lv6e95qhwzxPP87QWKSJklHvgrrXfTi06RQ6HX6BqLanaJ5d
         uMeg==
X-Gm-Message-State: AOJu0YzWrkkf94800iz1TwFVd0s8b0ap37D63fPCkx7mzIZoQd2r3quh
	PDbuR/bDOUp9Zi73kbir/Gvz0SNFVLBT9Nd+FW3wN03ajdDq3eRH4gRPNTNVSh/V1u7cgWm9ZCt
	mKlOfLA==
X-Google-Smtp-Source: AGHT+IEi41vT7k5Y8TL0eorj0ILiZzn3n1cXKu+mvARIF/KTkqiX2XdS9wsUu8uQeqy5b+ge2DTi5IOhdXM=
X-Received: from pfmm14.prod.google.com ([2002:a05:6a00:248e:b0:7dd:8bba:63ae])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:2ea0:b0:7a9:8770:ce5a
 with SMTP id d2e1a72fcca58-7e8c3628897mr847803b3a.20.1764980303025; Fri, 05
 Dec 2025 16:18:23 -0800 (PST)
Date: Fri,  5 Dec 2025 16:17:04 -0800
In-Reply-To: <20251206001720.468579-1-seanjc@google.com>
Mime-Version: 1.0
References: <20251206001720.468579-1-seanjc@google.com>
X-Mailer: git-send-email 2.52.0.223.gf5cc29aaa4-goog
Message-ID: <20251206001720.468579-29-seanjc@google.com>
Subject: [PATCH v6 28/44] KVM: x86/pmu: Disallow emulation in the fastpath if
 mediated PMCs are active
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
X-CRM114-CacheID: sfid-20251205_161825_503560_067EBB10 
X-CRM114-Status: GOOD (  11.51  )
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

Don't handle exits in the fastpath if emulation is required, i.e. if an
instruction needs to be skipped, the mediated PMU is enabled, and one or
more PMCs is counting instructions.  With the mediated PMU, KVM's cache of
PMU state is inconsistent with respect to hardware until KVM exits the
inner run loop (when the mediated PMU is "put").

Reviewed-by: Sandipan Das <sandipan.das@amd.com>
Tested-by: Xudong Hao <xudong.hao@intel.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/pmu.h | 10 ++++++++++
 arch/x86/kvm/x86.c |  9 +++++++++
 2 files changed, 19 insertions(+)

diff --git a/arch/x86/kvm/pmu.h b/arch/x86/kvm/pmu.h
index 25b583da9ee2..0925246731cb 100644
--- a/arch/x86/kvm/pmu.h
+++ b/arch/x86/kvm/pmu.h
@@ -234,6 +234,16 @@ static inline bool pmc_is_globally_enabled(struct kvm_pmc *pmc)
 	return test_bit(pmc->idx, (unsigned long *)&pmu->global_ctrl);
 }
 
+static inline bool kvm_pmu_is_fastpath_emulation_allowed(struct kvm_vcpu *vcpu)
+{
+	struct kvm_pmu *pmu = vcpu_to_pmu(vcpu);
+
+	return !kvm_vcpu_has_mediated_pmu(vcpu) ||
+	       !bitmap_intersects(pmu->pmc_counting_instructions,
+				  (unsigned long *)&pmu->global_ctrl,
+				  X86_PMC_IDX_MAX);
+}
+
 void kvm_pmu_deliver_pmi(struct kvm_vcpu *vcpu);
 void kvm_pmu_handle_event(struct kvm_vcpu *vcpu);
 int kvm_pmu_rdpmc(struct kvm_vcpu *vcpu, unsigned pmc, u64 *data);
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 589a309259f4..4683df775b0a 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -2215,6 +2215,9 @@ EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_emulate_invd);
 
 fastpath_t handle_fastpath_invd(struct kvm_vcpu *vcpu)
 {
+	if (!kvm_pmu_is_fastpath_emulation_allowed(vcpu))
+		return EXIT_FASTPATH_NONE;
+
 	if (!kvm_emulate_invd(vcpu))
 		return EXIT_FASTPATH_EXIT_USERSPACE;
 
@@ -2271,6 +2274,9 @@ static inline bool kvm_vcpu_exit_request(struct kvm_vcpu *vcpu)
 
 static fastpath_t __handle_fastpath_wrmsr(struct kvm_vcpu *vcpu, u32 msr, u64 data)
 {
+	if (!kvm_pmu_is_fastpath_emulation_allowed(vcpu))
+		return EXIT_FASTPATH_NONE;
+
 	switch (msr) {
 	case APIC_BASE_MSR + (APIC_ICR >> 4):
 		if (!lapic_in_kernel(vcpu) || !apic_x2apic_mode(vcpu->arch.apic) ||
@@ -11714,6 +11720,9 @@ EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_emulate_halt);
 
 fastpath_t handle_fastpath_hlt(struct kvm_vcpu *vcpu)
 {
+	if (!kvm_pmu_is_fastpath_emulation_allowed(vcpu))
+		return EXIT_FASTPATH_NONE;
+
 	if (!kvm_emulate_halt(vcpu))
 		return EXIT_FASTPATH_EXIT_USERSPACE;
 
-- 
2.52.0.223.gf5cc29aaa4-goog


