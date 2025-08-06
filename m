Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30F59C87FDA
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Aug 2025 21:47:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AqSoz/ys0/nDwriVLA2HvcSasFXIo2nt11bZwmhw7W4=; b=T8yAF7kgD2sQq2yDIqTThK5iv0
	5vkG4j+VQTy8gXzTCWCvSY8K4j9h3luda32pQybpOTBWH/M+JRnbOjVFlw3fbhobDUP9sqGnj74Px
	wMzRmUWK3XvpohWKbWkWYWLWhx4rT8nwZbFqEIcD7AdTOIQobNjXnRSzCtviZnLC6NpptpS9dqoCM
	6wns0+/0cY40YIBhMhVEUckk3p3hoKTwPbMPEef+fHxgZS2U4UuIpi43XlYdVZktur1HGy3rRSCHD
	6irJPLwhO7OwQvt/DdWTiMSd702YEby6yODuZmbQ4HX12nfpRSRF7HJE0GDFRGpXDHZR8JjDbBaBn
	NmsK7Teg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujlye-0000000GcrX-40V5;
	Wed, 06 Aug 2025 21:47:16 +0000
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujkHb-0000000GHBk-3YUB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Aug 2025 19:58:44 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-31ebadfb7f2so259340a91.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 06 Aug 2025 12:58:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1754510323; x=1755115123; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=AqSoz/ys0/nDwriVLA2HvcSasFXIo2nt11bZwmhw7W4=;
        b=rQPe1xgLr0WYWegdjyg3F7223rHQdUiSWs/lrrsR/p0KeCbCJzTF0byjzLriqwXDHX
         Okj2++j5bhVozeIgRWS3rkkOleldBTpHH6dOR0b9rlGkKSUqk8ABKZMIkSHRyqZluM1q
         86lP4HRVj5CbTkZv+0F/IdDAVwSNU7RB0OSM7dlEgzUVcFfnqxeQAOph14J3sAWGBGG5
         Riqn0J39AbLHc69jrHQuH/ratg46koHFMNjfKO2/lMerB00WoDxxvIvPg/hAUpKHH1kC
         I180DBLz+fulwb9fi1+siGNtb+ktGcRZc3PCg6e4mfrQiQXoN7VnVYonV372/waqqNPV
         LVmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754510323; x=1755115123;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AqSoz/ys0/nDwriVLA2HvcSasFXIo2nt11bZwmhw7W4=;
        b=tnoEqrkFNMuWwllwZb4s2W11huMEp4eRJqn6YN2GwUQ1f0X2nA9kwLS6r3K4c+Hy1l
         4dZa55bB1mkRHXlfxRgMDKkPZNqRDdVAw26wYTL4bxt5jTkTZMoeOlJsCo5uRLi/CdCC
         DKyinr4qK/FPGFX1Q1Sh9FghZUp6eGaHLMxtwutAS3lxVLOuzZXag6gnFYiXgQLOPpVL
         jwzTF3ZV9u+weUMjN09t5dVCcov92JetHko4lMGbyTqM9ggfQCyWI4IrBb/Q+0SLhftg
         wCUdLeH4aKv+jmgdCtfANsekIXQldcS9IUxtJfGlczgTlXS5ZaF/Ksz5nCiLGBDGQLsn
         tQGQ==
X-Gm-Message-State: AOJu0Yx1dum9DzFSGxg5OevtLs9LGpWbpRikg9JmJQfJjbGOS7zCZSW4
	0pWo6l/ouVdGKpdJonYRl8SBuM3KPLOyHrTZ4i3/UReIEE1nB/uNpd7e+/3ZGnzNYX4ItPRhn5C
	/hfmrHw==
X-Google-Smtp-Source: AGHT+IFhegW1gGR7UHrSJevPOd3ITDk2k4F1jYjU8AgzTqj6JmCrtpCZa2eEdv34H9OVmz6MG3yGyWC8HfY=
X-Received: from pjbsx14.prod.google.com ([2002:a17:90b:2cce:b0:311:c197:70a4])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:1c09:b0:31e:3bbc:e9e6
 with SMTP id 98e67ed59e1d1-3217638fd88mr438488a91.19.1754510322909; Wed, 06
 Aug 2025 12:58:42 -0700 (PDT)
Date: Wed,  6 Aug 2025 12:57:03 -0700
In-Reply-To: <20250806195706.1650976-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250806195706.1650976-1-seanjc@google.com>
X-Mailer: git-send-email 2.50.1.565.gc32cd1483b-goog
Message-ID: <20250806195706.1650976-42-seanjc@google.com>
Subject: [PATCH v5 41/44] KVM: nVMX: Disable PMU MSR interception as
 appropriate while running L2
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
X-CRM114-CacheID: sfid-20250806_125843_885852_A9955071 
X-CRM114-Status: GOOD (  15.59  )
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

Merge KVM's PMU MSR interception bitmaps with those of L1, i.e. merge the
bitmaps of vmcs01 and vmcs12, e.g. so that KVM doesn't interpose on MSR
accesses unnecessarily if L1 exposes a mediated PMU (or equivalent) to L2.

Signed-off-by: Mingwei Zhang <mizhang@google.com>
Co-developed-by: Dapeng Mi <dapeng1.mi@linux.intel.com>
Signed-off-by: Dapeng Mi <dapeng1.mi@linux.intel.com>
[sean: rewrite changelog and comment, omit MSRs that are always intercepted]
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/nested.c | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/x86/kvm/vmx/nested.c b/arch/x86/kvm/vmx/nested.c
index 47f1f0c7d3a7..b986a6fb684c 100644
--- a/arch/x86/kvm/vmx/nested.c
+++ b/arch/x86/kvm/vmx/nested.c
@@ -627,6 +627,34 @@ static inline void nested_vmx_set_intercept_for_msr(struct vcpu_vmx *vmx,
 #define nested_vmx_merge_msr_bitmaps_rw(msr) \
 	nested_vmx_merge_msr_bitmaps(msr, MSR_TYPE_RW)
 
+static void nested_vmx_merge_pmu_msr_bitmaps(struct kvm_vcpu *vcpu,
+					     unsigned long *msr_bitmap_l1,
+					     unsigned long *msr_bitmap_l0)
+{
+	struct kvm_pmu *pmu = vcpu_to_pmu(vcpu);
+	struct vcpu_vmx *vmx = to_vmx(vcpu);
+	int i;
+
+	/*
+	 * Skip the merges if the vCPU doesn't have a mediated PMU MSR, i.e. if
+	 * none of the MSRs can possibly be passed through to L1.
+	 */
+	if (!kvm_vcpu_has_mediated_pmu(vcpu))
+		return;
+
+	for (i = 0; i < pmu->nr_arch_gp_counters; i++) {
+		nested_vmx_merge_msr_bitmaps_rw(MSR_IA32_PERFCTR0 + i);
+		nested_vmx_merge_msr_bitmaps_rw(MSR_IA32_PMC0 + i);
+	}
+
+	for (i = 0; i < pmu->nr_arch_fixed_counters; i++)
+		nested_vmx_merge_msr_bitmaps_rw(MSR_CORE_PERF_FIXED_CTR0 + i);
+
+	nested_vmx_merge_msr_bitmaps_rw(MSR_CORE_PERF_GLOBAL_CTRL);
+	nested_vmx_merge_msr_bitmaps_read(MSR_CORE_PERF_GLOBAL_STATUS);
+	nested_vmx_merge_msr_bitmaps_write(MSR_CORE_PERF_GLOBAL_OVF_CTRL);
+}
+
 /*
  * Merge L0's and L1's MSR bitmap, return false to indicate that
  * we do not use the hardware.
@@ -724,6 +752,8 @@ static inline bool nested_vmx_prepare_msr_bitmap(struct kvm_vcpu *vcpu,
 	nested_vmx_set_intercept_for_msr(vmx, msr_bitmap_l1, msr_bitmap_l0,
 					 MSR_IA32_MPERF, MSR_TYPE_R);
 
+	nested_vmx_merge_pmu_msr_bitmaps(vcpu, msr_bitmap_l1, msr_bitmap_l0);
+
 	kvm_vcpu_unmap(vcpu, &map);
 
 	vmx->nested.force_msr_bitmap_recalc = false;
-- 
2.50.1.565.gc32cd1483b-goog


