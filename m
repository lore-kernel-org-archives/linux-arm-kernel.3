Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED58FCAC5BB
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Oct 2025 02:20:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2vkGRN8CaZrXiOYFDTBML3A03PPPCZYpHxq0X5airTA=; b=pS9oKN+dPxsilmCNpS5+J4DdLv
	QQi1rFKiNaF7pUUlBXUHdEScBvhxF3ud0mKcJVWh5s5AJ0Eu1qWrjpmsW6lrkiHFj/GwpNBFuMwOo
	qzx0hCEDAwp/8+d4d962Hxsjp3eKtNzbv2GA0esgTwg3f7WfI/DxfZwYq084aCoHJ9JPeMsu6ItbL
	8fBrwXYJ64VPs6lQjsWs4tghBsDhliHtqI3NsXFtJEFTWq428dpycYynQFV8VKB9Kc5pFpGXxR/o4
	3+xZg2F1K+JOsP3ny0Y7zD8azgQqnP7n8GkpaKgJ5/71GnBG8taJqwVuzyIDbvDTW0tvq3qgh2QP0
	BPHuiadw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6gG4-000000052mQ-0VxB;
	Thu, 09 Oct 2025 02:19:56 +0000
Received: from mgamail.intel.com ([198.175.65.21])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6gG0-000000052lV-2op4;
	Thu, 09 Oct 2025 02:19:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1759976392; x=1791512392;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=MKwwAjIvNTVYzVSKLCj93oAfQ4vIbNdKNB8W0YNJ6Qg=;
  b=jWnV7xEk04QWrE2+NGmlMd9EEqy73hMijmfZO+h9i8ZFPqPDN6Jc35gm
   YB2VLHysWhmrqGkIRdvP0lvV+a2f6AsqLL3MlhWLidjPNmKEsVFXeHFen
   0XVjA5Qaxmhk2wasazg31GUXjbFrFu1RdROp+1v2b2YBe3T+LYi0R5UDi
   iGq8rwW7Qf9b00/RJHG6hKh9jYRmnJs9vONxiZEBV1RoqboH74a0nganv
   5bKQBoidw2VM+U/a80YC6yXWGk85442pLXEB+efI8s8odAjsjCkveb3p2
   ByKtzEH9vc3oSxbLZ+XMROF7yfp+3Z1FK/ljQqueOoFGfop6cGxeJTA5s
   g==;
X-CSE-ConnectionGUID: 0UKaID5KSwSF33iuY9kevw==
X-CSE-MsgGUID: XoR0pU4/TD+x2BJ2AKpujQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="62097734"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="62097734"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2025 19:19:51 -0700
X-CSE-ConnectionGUID: SjjAIAIGQgGwYyFr6uTBmQ==
X-CSE-MsgGUID: dnnE1byERkONzbCEalT4rw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,215,1754982000"; 
   d="scan'208";a="211538774"
Received: from dapengmi-mobl1.ccr.corp.intel.com (HELO [10.124.232.209]) ([10.124.232.209])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2025 19:19:44 -0700
Message-ID: <0276af52-c697-46c3-9db8-9284adb6beee@linux.intel.com>
Date: Thu, 9 Oct 2025 10:19:41 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 32/44] KVM: x86/pmu: Disable interception of select PMU
 MSRs for mediated vPMUs
To: Sean Christopherson <seanjc@google.com>, Sandipan Das <sandidas@amd.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>,
 Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>,
 Huacai Chen <chenhuacai@kernel.org>, Anup Patel <anup@brainfault.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Xin Li <xin@zytor.com>, "H. Peter Anvin" <hpa@zytor.com>,
 Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>,
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
 kvm@vger.kernel.org, loongarch@lists.linux.dev,
 kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
 Kan Liang <kan.liang@linux.intel.com>, Yongwei Ma <yongwei.ma@intel.com>,
 Mingwei Zhang <mizhang@google.com>,
 Xiong Zhang <xiong.y.zhang@linux.intel.com>,
 Sandipan Das <sandipan.das@amd.com>
References: <20250806195706.1650976-1-seanjc@google.com>
 <20250806195706.1650976-33-seanjc@google.com>
 <f896966e-8925-4b4f-8f0d-f1ae8aa197f7@amd.com> <aN1vfykNs8Dmv_g0@google.com>
Content-Language: en-US
From: "Mi, Dapeng" <dapeng1.mi@linux.intel.com>
In-Reply-To: <aN1vfykNs8Dmv_g0@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251008_191952_781522_53669A45 
X-CRM114-Status: GOOD (  24.09  )
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


On 10/2/2025 2:14 AM, Sean Christopherson wrote:
> On Fri, Sep 26, 2025, Sandipan Das wrote:
>> On 8/7/2025 1:26 AM, Sean Christopherson wrote:
>>> From: Dapeng Mi <dapeng1.mi@linux.intel.com>
>>>
>>> For vCPUs with a mediated vPMU, disable interception of counter MSRs for
>>> PMCs that are exposed to the guest, and for GLOBAL_CTRL and related MSRs
>>> if they are fully supported according to the vCPU model, i.e. if the MSRs
>>> and all bits supported by hardware exist from the guest's point of view.
>>>
>>> Do NOT passthrough event selector or fixed counter control MSRs, so that
>>> KVM can enforce userspace-defined event filters, e.g. to prevent use of
>>> AnyThread events (which is unfortunately a setting in the fixed counter
>>> control MSR).
>>>
>>> Defer support for nested passthrough of mediated PMU MSRs to the future,
>>> as the logic for nested MSR interception is unfortunately vendor specific.
> ...
>
>>>  #define MSR_AMD64_LBR_SELECT			0xc000010e
>>> diff --git a/arch/x86/kvm/pmu.c b/arch/x86/kvm/pmu.c
>>> index 4246e1d2cfcc..817ef852bdf9 100644
>>> --- a/arch/x86/kvm/pmu.c
>>> +++ b/arch/x86/kvm/pmu.c
>>> @@ -715,18 +715,14 @@ int kvm_pmu_rdpmc(struct kvm_vcpu *vcpu, unsigned idx, u64 *data)
>>>  	return 0;
>>>  }
>>>  
>>> -bool kvm_need_rdpmc_intercept(struct kvm_vcpu *vcpu)
>>> +bool kvm_need_perf_global_ctrl_intercept(struct kvm_vcpu *vcpu)
>>>  {
>>>  	struct kvm_pmu *pmu = vcpu_to_pmu(vcpu);
>>>  
>>>  	if (!kvm_vcpu_has_mediated_pmu(vcpu))
>>>  		return true;
>>>  
>>> -	/*
>>> -	 * VMware allows access to these Pseduo-PMCs even when read via RDPMC
>>> -	 * in Ring3 when CR4.PCE=0.
>>> -	 */
>>> -	if (enable_vmware_backdoor)
>>> +	if (!kvm_pmu_has_perf_global_ctrl(pmu))
>>>  		return true;
>>>  
>>>  	/*
>>> @@ -735,7 +731,22 @@ bool kvm_need_rdpmc_intercept(struct kvm_vcpu *vcpu)
>>>  	 * capabilities themselves may be a subset of hardware capabilities.
>>>  	 */
>>>  	return pmu->nr_arch_gp_counters != kvm_host_pmu.num_counters_gp ||
>>> -	       pmu->nr_arch_fixed_counters != kvm_host_pmu.num_counters_fixed ||
>>> +	       pmu->nr_arch_fixed_counters != kvm_host_pmu.num_counters_fixed;
>>> +}
>>> +EXPORT_SYMBOL_GPL(kvm_need_perf_global_ctrl_intercept);
>>> +
>>> +bool kvm_need_rdpmc_intercept(struct kvm_vcpu *vcpu)
>>> +{
>>> +	struct kvm_pmu *pmu = vcpu_to_pmu(vcpu);
>>> +
>>> +	/*
>>> +	 * VMware allows access to these Pseduo-PMCs even when read via RDPMC
>>> +	 * in Ring3 when CR4.PCE=0.
>>> +	 */
>>> +	if (enable_vmware_backdoor)
>>> +		return true;
>>> +
>>> +	return kvm_need_perf_global_ctrl_intercept(vcpu) ||
>>>  	       pmu->counter_bitmask[KVM_PMC_GP] != (BIT_ULL(kvm_host_pmu.bit_width_gp) - 1) ||
>>>  	       pmu->counter_bitmask[KVM_PMC_FIXED] != (BIT_ULL(kvm_host_pmu.bit_width_fixed) - 1);
>>>  }
>> There is a case for AMD processors where the global MSRs are absent in the guest
>> but the guest still uses the same number of counters as what is advertised by the
>> host capabilities. So RDPMC interception is not necessary for all cases where
>> global control is unavailable.o
> Hmm, I think Intel would be the same?  Ah, no, because the host will have fixed
> counters, but the guest will not.  However, that's not directly related to
> kvm_pmu_has_perf_global_ctrl(), so I think this would be correct?
>
> diff --git a/arch/x86/kvm/pmu.c b/arch/x86/kvm/pmu.c
> index 4414d070c4f9..4c5b2712ee4c 100644
> --- a/arch/x86/kvm/pmu.c
> +++ b/arch/x86/kvm/pmu.c
> @@ -744,16 +744,13 @@ int kvm_pmu_rdpmc(struct kvm_vcpu *vcpu, unsigned idx, u64 *data)
>         return 0;
>  }
>  
> -bool kvm_need_perf_global_ctrl_intercept(struct kvm_vcpu *vcpu)
> +static bool kvm_need_pmc_intercept(struct kvm_vcpu *vcpu)

The function name kvm_need_pmc_intercept() seems a little bit misleading
and make users think this function is used to check if a certain PMC is
intercepted. Maybe we can rename the function to kvm_need_global_intercept().

Others look good to me. Thanks.


>  {
>         struct kvm_pmu *pmu = vcpu_to_pmu(vcpu);
>  
>         if (!kvm_vcpu_has_mediated_pmu(vcpu))
>                 return true;
>  
> -       if (!kvm_pmu_has_perf_global_ctrl(pmu))
> -               return true;
> -
>         /*
>          * Note!  Check *host* PMU capabilities, not KVM's PMU capabilities, as
>          * KVM's capabilities are constrained based on KVM support, i.e. KVM's
> @@ -762,6 +759,13 @@ bool kvm_need_perf_global_ctrl_intercept(struct kvm_vcpu *vcpu)
>         return pmu->nr_arch_gp_counters != kvm_host_pmu.num_counters_gp ||
>                pmu->nr_arch_fixed_counters != kvm_host_pmu.num_counters_fixed;
>  }
> +
> +bool kvm_need_perf_global_ctrl_intercept(struct kvm_vcpu *vcpu)
> +{
> +
> +       return kvm_need_pmc_intercept(vcpu) ||
> +              !kvm_pmu_has_perf_global_ctrl(vcpu_to_pmu(vcpu));
> +}
>  EXPORT_SYMBOL_GPL(kvm_need_perf_global_ctrl_intercept);
>  
>  bool kvm_need_rdpmc_intercept(struct kvm_vcpu *vcpu)
> @@ -775,7 +779,7 @@ bool kvm_need_rdpmc_intercept(struct kvm_vcpu *vcpu)
>         if (enable_vmware_backdoor)
>                 return true;
>  
> -       return kvm_need_perf_global_ctrl_intercept(vcpu) ||
> +       return kvm_need_pmc_intercept(vcpu) ||
>                pmu->counter_bitmask[KVM_PMC_GP] != (BIT_ULL(kvm_host_pmu.bit_width_gp) - 1) ||
>                pmu->counter_bitmask[KVM_PMC_FIXED] != (BIT_ULL(kvm_host_pmu.bit_width_fixed) - 1);
>  }
>

