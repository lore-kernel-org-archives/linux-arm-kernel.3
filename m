Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 729D4C87FD3
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Aug 2025 21:18:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aHvZdAUvNaaZFmbhTqFilDj1JXSRU8dLYlLgEZc/oCw=; b=q/dnG6w2U9dde/a8cBPPcVmlQc
	fwFkARM1vVsOTJlWENzIsPn/ct3H7f/DLGjgvMgC2pHZDQclNyrZKeoP+483Y3lavFl7R+vvOOFHZ
	HOEkmtxfZfdu4keN1qVN1ax6WNOCq+ksDpXGYJw7Iijb5pQfAXf1bsOVbmp4I/uSY3rQv11N68Z3O
	SyhglKah3mDn8nNXJmogoyqwPeLJz7fu/cmPBoLCQCA+ZE/9+EGoM36XprwWQyx6oA2h8okDxf770
	5p4/N5TjsSNIB29kOmSnMGjWhKoDh/KspNtwUGa6l/qYQAUQrX1qjo+7IXQZS3iAaqXD7mpNMN2nJ
	QL/vrfjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujlX8-0000000GYIB-1OAr;
	Wed, 06 Aug 2025 21:18:50 +0000
Received: from mail-pf1-x449.google.com ([2607:f8b0:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujkHJ-0000000GGpv-1EVG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Aug 2025 19:58:27 +0000
Received: by mail-pf1-x449.google.com with SMTP id d2e1a72fcca58-74ea7007866so241585b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 06 Aug 2025 12:58:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1754510304; x=1755115104; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=aHvZdAUvNaaZFmbhTqFilDj1JXSRU8dLYlLgEZc/oCw=;
        b=yVqCebzlvhxYCb9oLxcB6zfXuCGmbjp0RbxfQZl1jDKDxTWxwNA8cA2gYncu+rWO/F
         v8BujA++oasKRplYGb0jTXX3iOgNHI4nBwW5N+BsHkbNv5M5KzxV0YUt6IvD7HcWSrzh
         jQlq0WGrSw7hAW3wn4jGoUin1vEHCoymxyb649nSEAnoYD93VkRKlxEDKy/NewqjGjwc
         HPIAOQ3iXbIvJ424QownECiGCA4ssz9xr3mLP9i8DISqZCron5os/ZbL4WeUr8yCO8Mr
         D34ELvnSSszHPU6ue/gMXqBK8LY5s2mwhiRRAXBNzeEzhzZDKOZh6KmOmchDQTl97pxK
         dhsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754510304; x=1755115104;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aHvZdAUvNaaZFmbhTqFilDj1JXSRU8dLYlLgEZc/oCw=;
        b=HCNu8sBPbmvMMegxwz3aBmGFAb8EN6RMKbN1dNTGCptMX7EUYM6TVxMgRxsmAjPsUJ
         QZLWuEB2Lyfs2maDnf1gZLkiNgIFsZn4l4x+Mgl20VdWySqQDNKrdSugOrnTswLIDm62
         L4VQWKauyaxNjPNKRHbC+SzCMisCgnUDAzz4J+6TOoeUukwDyiSxxjnxe+MVXws939sR
         hKR5IDn8g4uNFnoAfqQ00Aypbns3DNZPyM/8dT4mDqcYECrvL9jj9mv1wyX2wasXr9cM
         r5+UOrM3AWvfq2RRH/upABfsjTXRBl15FNgtx08wjne+b340giPBeCIVKf0TZOHv9Ej7
         Anqw==
X-Gm-Message-State: AOJu0YzFVmvfOWtrUZWxbGdvbWzdv2epxhjBcmdyaYHzb+i8wVDCSbsn
	/c46DlNknEJk/Umd+qkKTRxjLZYlk2fDMZ4HLBkO7M+ML9yM3/IOhM0cXdDrErmVk43CIlMtsZM
	4AmQxEw==
X-Google-Smtp-Source: AGHT+IGfcxFcqE+WO40f0G1jJJ785vOiC3NUhX/6TGZEyq4CvV1J0auJAX6NhvanreP79iKSuzsragVBkJw=
X-Received: from pfvf15.prod.google.com ([2002:a05:6a00:1acf:b0:746:3162:8be1])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:999f:b0:220:78b9:f849
 with SMTP id adf61e73a8af0-240331272admr5902393637.24.1754510303927; Wed, 06
 Aug 2025 12:58:23 -0700 (PDT)
Date: Wed,  6 Aug 2025 12:56:52 -0700
In-Reply-To: <20250806195706.1650976-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250806195706.1650976-1-seanjc@google.com>
X-Mailer: git-send-email 2.50.1.565.gc32cd1483b-goog
Message-ID: <20250806195706.1650976-31-seanjc@google.com>
Subject: [PATCH v5 30/44] KVM: x86/pmu: Move initialization of valid PMCs
 bitmask to common x86
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Xin Li <xin@zytor.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, loongarch@lists.linux.dev, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, Kan Liang <kan.liang@linux.intel.com>, 
	Yongwei Ma <yongwei.ma@intel.com>, Mingwei Zhang <mizhang@google.com>, 
	Xiong Zhang <xiong.y.zhang@linux.intel.com>, Sandipan Das <sandipan.das@amd.com>, 
	Dapeng Mi <dapeng1.mi@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250806_125825_352836_6A6D7782 
X-CRM114-Status: GOOD (  14.29  )
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

Move all initialization of all_valid_pmc_idx to common code, as the logic
is 100% common to Intel and AMD, and KVM heavily relies on Intel and AMD
having the same semantics.  E.g. the fact that AMD doesn't support fixed
counters doesn't allow KVM to use all_valid_pmc_idx[63:32] for other
purposes.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/pmu.c           | 4 ++++
 arch/x86/kvm/svm/pmu.c       | 1 -
 arch/x86/kvm/vmx/pmu_intel.c | 5 -----
 3 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/arch/x86/kvm/pmu.c b/arch/x86/kvm/pmu.c
index a4fe0e76df79..4246e1d2cfcc 100644
--- a/arch/x86/kvm/pmu.c
+++ b/arch/x86/kvm/pmu.c
@@ -932,6 +932,10 @@ void kvm_pmu_refresh(struct kvm_vcpu *vcpu)
 		if (kvm_vcpu_has_mediated_pmu(vcpu))
 			kvm_pmu_call(write_global_ctrl)(pmu->global_ctrl);
 	}
+
+	bitmap_set(pmu->all_valid_pmc_idx, 0, pmu->nr_arch_gp_counters);
+	bitmap_set(pmu->all_valid_pmc_idx, KVM_FIXED_PMC_BASE_IDX,
+		   pmu->nr_arch_fixed_counters);
 }
 
 void kvm_pmu_init(struct kvm_vcpu *vcpu)
diff --git a/arch/x86/kvm/svm/pmu.c b/arch/x86/kvm/svm/pmu.c
index b777c3743304..9ffd44a5d474 100644
--- a/arch/x86/kvm/svm/pmu.c
+++ b/arch/x86/kvm/svm/pmu.c
@@ -209,7 +209,6 @@ static void amd_pmu_refresh(struct kvm_vcpu *vcpu)
 	/* not applicable to AMD; but clean them to prevent any fall out */
 	pmu->counter_bitmask[KVM_PMC_FIXED] = 0;
 	pmu->nr_arch_fixed_counters = 0;
-	bitmap_set(pmu->all_valid_pmc_idx, 0, pmu->nr_arch_gp_counters);
 }
 
 static void amd_pmu_init(struct kvm_vcpu *vcpu)
diff --git a/arch/x86/kvm/vmx/pmu_intel.c b/arch/x86/kvm/vmx/pmu_intel.c
index 6352d029298c..1de94a39ca18 100644
--- a/arch/x86/kvm/vmx/pmu_intel.c
+++ b/arch/x86/kvm/vmx/pmu_intel.c
@@ -579,11 +579,6 @@ static void intel_pmu_refresh(struct kvm_vcpu *vcpu)
 		pmu->raw_event_mask |= (HSW_IN_TX|HSW_IN_TX_CHECKPOINTED);
 	}
 
-	bitmap_set(pmu->all_valid_pmc_idx,
-		0, pmu->nr_arch_gp_counters);
-	bitmap_set(pmu->all_valid_pmc_idx,
-		INTEL_PMC_MAX_GENERIC, pmu->nr_arch_fixed_counters);
-
 	perf_capabilities = vcpu_get_perf_capabilities(vcpu);
 	if (intel_pmu_lbr_is_compatible(vcpu) &&
 	    (perf_capabilities & PERF_CAP_LBR_FMT))
-- 
2.50.1.565.gc32cd1483b-goog


