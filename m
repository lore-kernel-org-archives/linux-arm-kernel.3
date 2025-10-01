Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BA38CCA470
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Oct 2025 18:14:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LOBNzl0piewZaB0fEWYxjiNzOXTgJ+Q2XdYBWxqPDCY=; b=TYxzUb9bKwGLD3ha07MMtUXFHU
	E3lxYKeL4D6LZXzBBUATCldhQ8+ZQeAGe3I4YgZlIZgiRNcdkMMa37rJgCQaXkC0GuEtB3ukTlBg/
	jDrXg2Jqod7fZldCK2Td49JPmFMwE463ynuviXPobOt/BHUmGibMpE0Gl9HEMX9tQ1JQ7s40CHGVz
	eOqhQPbhHAJaA37MKWLx7+p5046hg7Jd96tZ5Crrsab5EZFeW0EB6kVSH/GA0tU8qDTDk5ZqzLrPf
	PHwErzoBejag3PX5gHjzq/2wpT7SRPh5mwaELkDYG9m5EVuSD7O9CH6o6azt3xmsZt5fb4zdA5Lvm
	5Fzbcqlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v41LR-00000008ib4-1LGv;
	Wed, 01 Oct 2025 18:14:29 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v41LP-00000008iZb-0SUq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Oct 2025 18:14:28 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-33428befc08so350596a91.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Oct 2025 11:14:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1759342465; x=1759947265; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=LOBNzl0piewZaB0fEWYxjiNzOXTgJ+Q2XdYBWxqPDCY=;
        b=SYGD29jCNnLpwrupX7+TF03/15T0iRkIUilhcEVuXfmT2IdyDT5A7fHFppnm6BVFzU
         8k2kMUeFZ9S3rQAKCMRlwiebHQwK+bAu1LIpBU/PWtWf0qvHS6CqytD81hk13cI8O/QP
         f0kx0OmWvygKvciXt+UA2GGDL/Xx8YfLyR49u6KNpio76YogHHcXUuB8BRYU2xAZa417
         FJuo9aNGgXRLOTg/22RlZ7IsOFR64fqxbSVYVA9xU7rK5fM76MuJC4n6hXDE3WCwE10T
         ZaDTnm82JkjfVBXbswvzrTo4Zp2RxKUmlQjcRXOXUEaXXFg8IdRR07lfRLk2WqNwtXcW
         9Qcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759342465; x=1759947265;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LOBNzl0piewZaB0fEWYxjiNzOXTgJ+Q2XdYBWxqPDCY=;
        b=Y0/dxEAUP5M/521UAS68sppfzKRrsGcsebwdyIQM+0vAYY8CYShbP8VB1KuDyCAsam
         UFMCF12HiV6Q0RVQ05S+vxsVW+4/gLq8cdGAxkOindCBFW3CCJuhR75oiDBNtuDILD6A
         jnOloa42lZndCCUWgrSTifQA8RnkffHfmjhBvDh4OYkXLZ8r6d9bh8vJpZ8jJtowcDVm
         SgBRLA0MMeII43WvdCtSqd5hoxpY3qjEwjzKsCVk8vXfzKYfEZMMSl/K+NVtgitBm4Hf
         Eu6QNqMR6VPKzyyC9CIXpiQhq3AB4+5aPhBAvv+z20c/FAzm0RJ/d+c/keAlv5cKOJfp
         SOXA==
X-Forwarded-Encrypted: i=1; AJvYcCUdr/TkmNfIJuT/Kfwazzyz3KBKe3tJgtY8idkYFb6BFWMWt+pyJlJxLLEymdAebfC46IqXSHnrtqGckGlYF6Ax@lists.infradead.org
X-Gm-Message-State: AOJu0YyCEW93mZHnzcZfFScEL0ubsoPq4SYXZOK/6hft7dlIJESjxTEl
	QMq7WtAvinQSnM3+TZ1LXUNVp5BTgx8XUWgnvHOTe8ntVlpEQgEKLCzc61w6T6y5Q65/ytpQ6Ng
	MGRneEA==
X-Google-Smtp-Source: AGHT+IGJbul18z2pAriB4M9Dv7xuCXJyXC/vErDTd2EuWuyjJTHyZFET/F4MY3SeMRgMCYc9TSFDnBqrzsg=
X-Received: from pjbjs19.prod.google.com ([2002:a17:90b:1493:b0:327:7035:d848])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:33cf:b0:32b:8b8d:c2d1
 with SMTP id 98e67ed59e1d1-339a6f076edmr5249061a91.21.1759342465480; Wed, 01
 Oct 2025 11:14:25 -0700 (PDT)
Date: Wed, 1 Oct 2025 11:14:23 -0700
In-Reply-To: <f896966e-8925-4b4f-8f0d-f1ae8aa197f7@amd.com>
Mime-Version: 1.0
References: <20250806195706.1650976-1-seanjc@google.com> <20250806195706.1650976-33-seanjc@google.com>
 <f896966e-8925-4b4f-8f0d-f1ae8aa197f7@amd.com>
Message-ID: <aN1vfykNs8Dmv_g0@google.com>
Subject: Re: [PATCH v5 32/44] KVM: x86/pmu: Disable interception of select PMU
 MSRs for mediated vPMUs
From: Sean Christopherson <seanjc@google.com>
To: Sandipan Das <sandidas@amd.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Xin Li <xin@zytor.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, kvm@vger.kernel.org, loongarch@lists.linux.dev, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	Kan Liang <kan.liang@linux.intel.com>, Yongwei Ma <yongwei.ma@intel.com>, 
	Mingwei Zhang <mizhang@google.com>, Xiong Zhang <xiong.y.zhang@linux.intel.com>, 
	Sandipan Das <sandipan.das@amd.com>, Dapeng Mi <dapeng1.mi@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251001_111427_155691_CE003A71 
X-CRM114-Status: GOOD (  31.69  )
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

On Fri, Sep 26, 2025, Sandipan Das wrote:
> On 8/7/2025 1:26 AM, Sean Christopherson wrote:
> > From: Dapeng Mi <dapeng1.mi@linux.intel.com>
> > 
> > For vCPUs with a mediated vPMU, disable interception of counter MSRs for
> > PMCs that are exposed to the guest, and for GLOBAL_CTRL and related MSRs
> > if they are fully supported according to the vCPU model, i.e. if the MSRs
> > and all bits supported by hardware exist from the guest's point of view.
> > 
> > Do NOT passthrough event selector or fixed counter control MSRs, so that
> > KVM can enforce userspace-defined event filters, e.g. to prevent use of
> > AnyThread events (which is unfortunately a setting in the fixed counter
> > control MSR).
> > 
> > Defer support for nested passthrough of mediated PMU MSRs to the future,
> > as the logic for nested MSR interception is unfortunately vendor specific.

...

> >  #define MSR_AMD64_LBR_SELECT			0xc000010e
> > diff --git a/arch/x86/kvm/pmu.c b/arch/x86/kvm/pmu.c
> > index 4246e1d2cfcc..817ef852bdf9 100644
> > --- a/arch/x86/kvm/pmu.c
> > +++ b/arch/x86/kvm/pmu.c
> > @@ -715,18 +715,14 @@ int kvm_pmu_rdpmc(struct kvm_vcpu *vcpu, unsigned idx, u64 *data)
> >  	return 0;
> >  }
> >  
> > -bool kvm_need_rdpmc_intercept(struct kvm_vcpu *vcpu)
> > +bool kvm_need_perf_global_ctrl_intercept(struct kvm_vcpu *vcpu)
> >  {
> >  	struct kvm_pmu *pmu = vcpu_to_pmu(vcpu);
> >  
> >  	if (!kvm_vcpu_has_mediated_pmu(vcpu))
> >  		return true;
> >  
> > -	/*
> > -	 * VMware allows access to these Pseduo-PMCs even when read via RDPMC
> > -	 * in Ring3 when CR4.PCE=0.
> > -	 */
> > -	if (enable_vmware_backdoor)
> > +	if (!kvm_pmu_has_perf_global_ctrl(pmu))
> >  		return true;
> >  
> >  	/*
> > @@ -735,7 +731,22 @@ bool kvm_need_rdpmc_intercept(struct kvm_vcpu *vcpu)
> >  	 * capabilities themselves may be a subset of hardware capabilities.
> >  	 */
> >  	return pmu->nr_arch_gp_counters != kvm_host_pmu.num_counters_gp ||
> > -	       pmu->nr_arch_fixed_counters != kvm_host_pmu.num_counters_fixed ||
> > +	       pmu->nr_arch_fixed_counters != kvm_host_pmu.num_counters_fixed;
> > +}
> > +EXPORT_SYMBOL_GPL(kvm_need_perf_global_ctrl_intercept);
> > +
> > +bool kvm_need_rdpmc_intercept(struct kvm_vcpu *vcpu)
> > +{
> > +	struct kvm_pmu *pmu = vcpu_to_pmu(vcpu);
> > +
> > +	/*
> > +	 * VMware allows access to these Pseduo-PMCs even when read via RDPMC
> > +	 * in Ring3 when CR4.PCE=0.
> > +	 */
> > +	if (enable_vmware_backdoor)
> > +		return true;
> > +
> > +	return kvm_need_perf_global_ctrl_intercept(vcpu) ||
> >  	       pmu->counter_bitmask[KVM_PMC_GP] != (BIT_ULL(kvm_host_pmu.bit_width_gp) - 1) ||
> >  	       pmu->counter_bitmask[KVM_PMC_FIXED] != (BIT_ULL(kvm_host_pmu.bit_width_fixed) - 1);
> >  }
> 
> There is a case for AMD processors where the global MSRs are absent in the guest
> but the guest still uses the same number of counters as what is advertised by the
> host capabilities. So RDPMC interception is not necessary for all cases where
> global control is unavailable.o

Hmm, I think Intel would be the same?  Ah, no, because the host will have fixed
counters, but the guest will not.  However, that's not directly related to
kvm_pmu_has_perf_global_ctrl(), so I think this would be correct?

diff --git a/arch/x86/kvm/pmu.c b/arch/x86/kvm/pmu.c
index 4414d070c4f9..4c5b2712ee4c 100644
--- a/arch/x86/kvm/pmu.c
+++ b/arch/x86/kvm/pmu.c
@@ -744,16 +744,13 @@ int kvm_pmu_rdpmc(struct kvm_vcpu *vcpu, unsigned idx, u64 *data)
        return 0;
 }
 
-bool kvm_need_perf_global_ctrl_intercept(struct kvm_vcpu *vcpu)
+static bool kvm_need_pmc_intercept(struct kvm_vcpu *vcpu)
 {
        struct kvm_pmu *pmu = vcpu_to_pmu(vcpu);
 
        if (!kvm_vcpu_has_mediated_pmu(vcpu))
                return true;
 
-       if (!kvm_pmu_has_perf_global_ctrl(pmu))
-               return true;
-
        /*
         * Note!  Check *host* PMU capabilities, not KVM's PMU capabilities, as
         * KVM's capabilities are constrained based on KVM support, i.e. KVM's
@@ -762,6 +759,13 @@ bool kvm_need_perf_global_ctrl_intercept(struct kvm_vcpu *vcpu)
        return pmu->nr_arch_gp_counters != kvm_host_pmu.num_counters_gp ||
               pmu->nr_arch_fixed_counters != kvm_host_pmu.num_counters_fixed;
 }
+
+bool kvm_need_perf_global_ctrl_intercept(struct kvm_vcpu *vcpu)
+{
+
+       return kvm_need_pmc_intercept(vcpu) ||
+              !kvm_pmu_has_perf_global_ctrl(vcpu_to_pmu(vcpu));
+}
 EXPORT_SYMBOL_GPL(kvm_need_perf_global_ctrl_intercept);
 
 bool kvm_need_rdpmc_intercept(struct kvm_vcpu *vcpu)
@@ -775,7 +779,7 @@ bool kvm_need_rdpmc_intercept(struct kvm_vcpu *vcpu)
        if (enable_vmware_backdoor)
                return true;
 
-       return kvm_need_perf_global_ctrl_intercept(vcpu) ||
+       return kvm_need_pmc_intercept(vcpu) ||
               pmu->counter_bitmask[KVM_PMC_GP] != (BIT_ULL(kvm_host_pmu.bit_width_gp) - 1) ||
               pmu->counter_bitmask[KVM_PMC_FIXED] != (BIT_ULL(kvm_host_pmu.bit_width_fixed) - 1);
 }

