Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34CECCCD193
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Oct 2025 00:04:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qnZIizqmryS73KPHBFvS6qKO1GXXcgajB8w3CzTpiaU=; b=BvXK/fhbvNkEdDfvYa+W/qf1Jy
	x9tiZWF+thWzcXTEJr4f1UvDOsasgmXkNN9zaVoGXqyISq/OIZkiamoL/XVt3CHefMfYftvOLpreQ
	0wMQDlEvGsN+yhGz7j0JmBXigB9v3gFMUEprJknD5KpKFvyy58XlFcX+2cndI/eO6BVqE6mFOtSIb
	2svk03nbTZn2oK2O15C+fnyNg+00FstH4VmhIIo48HR9qaOZ42JMdZS8AlN/yq26W9+6UEe1T2kfA
	K1VZrmZTDK+P80kMfgthhlKxcFRFGG8H9TwZL5Mgtmu7IW4t5uc7GAKJXLk/qU9zG7XJ2Bx0Cn4nJ
	irKnqZZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9BU1-000000037Gx-1unz;
	Thu, 16 Oct 2025 00:04:41 +0000
Received: from mgamail.intel.com ([198.175.65.9])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9BTx-000000037Fz-3yVT;
	Thu, 16 Oct 2025 00:04:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760573078; x=1792109078;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=+JrivgWyUgg+pmx0+52mYBdTXkR4tEzcKUO0ehqXf7s=;
  b=QvcBuq3wY1Cl1T1klhEt90xTeZT/mspknFP/SmDDRGi8sYmv4bF+n/d8
   R2PDDAI7bLHb8BFyWwQ/E4z/5tChdE1frjPOIuYj3+3oqNMl0tx+gQLqw
   Qz91cfrAcCo1O+V0PI7mcF0GFFiajcFuTeSvhVoAyjoWdrpNHoeR7w31j
   ShlrDu+FGFRBtrxorrioQc6v8XfxZ1+bjnFlJXKDquqa/AJITR08TmMFq
   +MDxHNtgcHGj5Ol7kZN1RvN4FcrpWYoZkZBA7FJtV4JOqa6DfzLG59JfE
   kHZsH3xTZHHnY7jOvFYlC0wCvB3NkzCP1M1hqbU58LTTOZ31Oxz20pWXu
   g==;
X-CSE-ConnectionGUID: 5+fpaFsxQcqkAsuhKs9DJQ==
X-CSE-MsgGUID: LTFRNXMiT2ypeKIU8bRbug==
X-IronPort-AV: E=McAfee;i="6800,10657,11583"; a="85377194"
X-IronPort-AV: E=Sophos;i="6.19,232,1754982000"; 
   d="scan'208";a="85377194"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2025 17:04:36 -0700
X-CSE-ConnectionGUID: R752COMtRQqyVd5oHvt9WQ==
X-CSE-MsgGUID: 3PO6qZFiQTmjq3l7JbpGAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,232,1754982000"; 
   d="scan'208";a="182097810"
Received: from unknown (HELO [10.238.2.75]) ([10.238.2.75])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2025 17:04:29 -0700
Message-ID: <ea123839-80fd-4555-8da2-adbd060a2082@linux.intel.com>
Date: Thu, 16 Oct 2025 08:04:26 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 32/44] KVM: x86/pmu: Disable interception of select PMU
 MSRs for mediated vPMUs
To: Sean Christopherson <seanjc@google.com>
Cc: Sandipan Das <sandidas@amd.com>, Marc Zyngier <maz@kernel.org>,
 Oliver Upton <oliver.upton@linux.dev>, Tianrui Zhao
 <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>,
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
 <0276af52-c697-46c3-9db8-9284adb6beee@linux.intel.com>
 <aO_slNn8X1A84sI-@google.com>
Content-Language: en-US
From: "Mi, Dapeng" <dapeng1.mi@linux.intel.com>
In-Reply-To: <aO_slNn8X1A84sI-@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_170438_147848_61786440 
X-CRM114-Status: GOOD (  14.50  )
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


On 10/16/2025 2:48 AM, Sean Christopherson wrote:
> On Thu, Oct 09, 2025, Dapeng Mi wrote:
>> On 10/2/2025 2:14 AM, Sean Christopherson wrote:
>>> On Fri, Sep 26, 2025, Sandipan Das wrote:
>>>> On 8/7/2025 1:26 AM, Sean Christopherson wrote:
>>>>> +	return kvm_need_perf_global_ctrl_intercept(vcpu) ||
>>>>>  	       pmu->counter_bitmask[KVM_PMC_GP] != (BIT_ULL(kvm_host_pmu.bit_width_gp) - 1) ||
>>>>>  	       pmu->counter_bitmask[KVM_PMC_FIXED] != (BIT_ULL(kvm_host_pmu.bit_width_fixed) - 1);
>>>>>  }
>>>> There is a case for AMD processors where the global MSRs are absent in the guest
>>>> but the guest still uses the same number of counters as what is advertised by the
>>>> host capabilities. So RDPMC interception is not necessary for all cases where
>>>> global control is unavailable.o
>>> Hmm, I think Intel would be the same?  Ah, no, because the host will have fixed
>>> counters, but the guest will not.  However, that's not directly related to
>>> kvm_pmu_has_perf_global_ctrl(), so I think this would be correct?
>>>
>>> diff --git a/arch/x86/kvm/pmu.c b/arch/x86/kvm/pmu.c
>>> index 4414d070c4f9..4c5b2712ee4c 100644
>>> --- a/arch/x86/kvm/pmu.c
>>> +++ b/arch/x86/kvm/pmu.c
>>> @@ -744,16 +744,13 @@ int kvm_pmu_rdpmc(struct kvm_vcpu *vcpu, unsigned idx, u64 *data)
>>>         return 0;
>>>  }
>>>  
>>> -bool kvm_need_perf_global_ctrl_intercept(struct kvm_vcpu *vcpu)
>>> +static bool kvm_need_pmc_intercept(struct kvm_vcpu *vcpu)
>> The function name kvm_need_pmc_intercept() seems a little bit misleading
>> and make users think this function is used to check if a certain PMC is
>> intercepted. Maybe we can rename the function to kvm_need_global_intercept().
> Yeah, I don't love kvm_need_pmc_intercept() either.  But kvm_need_global_intercept()
> feels too close to kvm_need_perf_global_ctrl_intercept().
>
> Maybe something like kvm_need_any_pmc_intercept()?

It sounds good to me. Thanks.



