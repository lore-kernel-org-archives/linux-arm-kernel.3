Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C011D3B9B7
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Dec 2025 01:09:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BuWO29lM/cBJ/L1a1kFujtQLdUddOg723/MZ8uodzEE=; b=ddBG/ANBxIYB+DoKet5UZhLLL6
	FQdouYLy9uskQMsdPAAKApJ6XVN0vg3tUE2n0QVvIor/H6TaIg2XaluV41X9DgO9qLyHnWnXTwxLF
	iWb03B9xgGk4gaerPfVAHQHELXDzSa1byIVCTrZXaX4FMxeANAld5d2umFk1Pt4AKhzyL1Er920Rm
	e3BtnP15EaWxgcRSbJPVjAeOjN6Kdjs6ZP3Bfk4UneoQiujvCe9ic5yZpUfiZJs1dJ7BH5Tan/uSK
	/d92RdAEJDGiWmFHVof+Sez4Q2GRhzyLBa8TqKs2E8vC9H4IbSrHkDoI2Jy7qi634J5DPcpq2Uo38
	JTTtdniQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vT8hW-0000000Exfv-3TI7;
	Wed, 10 Dec 2025 01:09:06 +0000
Received: from mgamail.intel.com ([192.198.163.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vT8hU-0000000ExfL-1Vtd;
	Wed, 10 Dec 2025 01:09:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765328944; x=1796864944;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=7Sw6PITpzapkD99/tAnwNI3D6Ucw9JU8bsiOsehlJts=;
  b=FoffeohhpA77GufSVMykhaVh+BaJakLO/wN/IbFWz848fbMsH4RYAqZe
   tIwFhRasNS+/2t0tS3vVxvDAt3zCzXZUk45arf75G1xQ9dEvTnrLR1fke
   aBJdY3mo3l6WTVu9V7O5MpGe/MQYHg8yNC80wv6HdOE4Yc02RW0tMz0zK
   T9we6Uq+mJRWQQFrBoMFP8bWHC2YRGG/PZxWDvuMD0nzi+Z7u6Duko1jg
   Qfl6TXWZnGoy+0O6kas3LMBDrzpvE8nfnsti3J+HD2h8eUX0BgKvaKmlD
   kVQ5mPE/pBy6nsHaVXsTlJu2hShAJ4Eww5936UZtnJeykAywxKZaWhnUD
   g==;
X-CSE-ConnectionGUID: irH/A8EGRC6JQB2YauS2rQ==
X-CSE-MsgGUID: Al43oxFuT8mNQdHkmn1GIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11637"; a="67190221"
X-IronPort-AV: E=Sophos;i="6.20,262,1758610800"; 
   d="scan'208";a="67190221"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2025 17:09:02 -0800
X-CSE-ConnectionGUID: 21iGYDOORw+11NIMlPnpaw==
X-CSE-MsgGUID: WFDJ3r6bSDGlQ9mRnDj7FQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,262,1758610800"; 
   d="scan'208";a="200862410"
Received: from dapengmi-mobl1.ccr.corp.intel.com (HELO [10.124.240.12]) ([10.124.240.12])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2025 17:08:54 -0800
Message-ID: <fad66209-6dc1-4067-87df-9aa1105e3017@linux.intel.com>
Date: Wed, 10 Dec 2025 09:08:52 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 37/44] KVM: VMX: Dedup code for removing MSR from
 VMCS's auto-load list
To: Sean Christopherson <seanjc@google.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
 Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>,
 Huacai Chen <chenhuacai@kernel.org>, Anup Patel <anup@brainfault.org>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Xin Li <xin@zytor.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>,
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
 kvm@vger.kernel.org, loongarch@lists.linux.dev,
 kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
 Mingwei Zhang <mizhang@google.com>, Xudong Hao <xudong.hao@intel.com>,
 Sandipan Das <sandipan.das@amd.com>,
 Xiong Zhang <xiong.y.zhang@linux.intel.com>,
 Manali Shukla <manali.shukla@amd.com>, Jim Mattson <jmattson@google.com>
References: <20251206001720.468579-1-seanjc@google.com>
 <20251206001720.468579-38-seanjc@google.com>
 <2440b9bf-a2a1-4f66-94b2-71f47d62f3db@linux.intel.com>
 <aTheSQb9fhXmZKw6@google.com>
Content-Language: en-US
From: "Mi, Dapeng" <dapeng1.mi@linux.intel.com>
In-Reply-To: <aTheSQb9fhXmZKw6@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251209_170904_437490_753B2AC9 
X-CRM114-Status: GOOD (  26.72  )
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


On 12/10/2025 1:37 AM, Sean Christopherson wrote:
> On Mon, Dec 08, 2025, Dapeng Mi wrote:
>> On 12/6/2025 8:17 AM, Sean Christopherson wrote:
>>> Add a helper to remove an MSR from an auto-{load,store} list to dedup the
>>> msr_autoload code, and in anticipation of adding similar functionality for
>>> msr_autostore.
>>>
>>> No functional change intended.
>>>
>>> Signed-off-by: Sean Christopherson <seanjc@google.com>
>>> ---
>>>  arch/x86/kvm/vmx/vmx.c | 31 ++++++++++++++++---------------
>>>  1 file changed, 16 insertions(+), 15 deletions(-)
>>>
>>> diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
>>> index 52bcb817cc15..a51f66d1b201 100644
>>> --- a/arch/x86/kvm/vmx/vmx.c
>>> +++ b/arch/x86/kvm/vmx/vmx.c
>>> @@ -1040,9 +1040,22 @@ static int vmx_find_loadstore_msr_slot(struct vmx_msrs *m, u32 msr)
>>>  	return -ENOENT;
>>>  }
>>>  
>>> +static void vmx_remove_auto_msr(struct vmx_msrs *m, u32 msr,
>>> +				unsigned long vmcs_count_field)
>>> +{
>>> +	int i;
>>> +
>>> +	i = vmx_find_loadstore_msr_slot(m, msr);
>>> +	if (i < 0)
>>> +		return;
>>> +
>>> +	--m->nr;
>>> +	m->val[i] = m->val[m->nr];
>> Sometimes the order of MSR writing does matter, e.g., PERF_GLOBAL_CTRL MSR
>> should be written at last after all PMU MSR writing.
> Hmm, no.  _If_ KVM were writing event selectors using the auto-load lists, then
> KVM would need to bookend the event selector MSRs with PERF_GLOBAL_CTRL=0 and
> PERF_GLOBAL_CTRL=<new context (guest vs. host)>.  E.g. so that guest PMC counts
> aren't polluted with host events, and vice versa.
>
> As things stand today, the only other MSRs are PEBS and the DS area configuration
> stuff, and kinda to my earlier point, KVM pre-zeroes MSR_IA32_PEBS_ENABLE as part
> of add_atomic_switch_msr() to ensure a quiescent period before VM-Enter.
>
> Heh, and writing PERF_GLOBAL_CTRL last for that sequence might actually be
> problematic.  E.g. load host PEBS with guest PERF_GLOBAL_CTRL active.
>
> Anyways, I agree that this might be brittle, but this is all pre-existing behavior
> so I don't want to tackle that here unless it's absolutely necessary.

Yeah, this won't cause any real issue for current code. 


>
> Or wait, by "writing" do you mean "writing MSRs to memory", as opposed to "writing
> values to MSRs"?  Regardless, I think my answer is the same: this isn't a problem
> today, so I'd prefer to not shuffle the ordering unless it's absolutely necessary.

Actually both. As SDM suggests, current any manipulation for PMU MSRs, the
below order should be followed.

- disable all PMU counters by writing PERF_GLOBAL_CTRL to 0.

- manipulate PMU MSRs.

- Enable the needed PMU counters by writing PERF_GLOBAL_CTRL.

So there is a implicit order on the MSR writing in fact. 

For KVM, if MSR auto-load list feature is used to automatically restore the
host/guest MSRs, KVM needs to follow the above order to fill the MSR
auto-load list and then expect these MSRs are written by VMX in the
designed order.

But since it won't cause any real issue now, it's fine for me to handle it
until there is a real necessity.


>
>> So directly moving the last MSR entry into cleared one could break the MSR
>> writing sequence and may cause issue in theory.
>>
>> I know this won't really cause issue since currently vPMU won't use the MSR
>> auto-load feature to save any PMU MSR, but it's still unsafe for future uses. 
>>
>> I'm not sure if it's worthy to do the strict MSR entry shift right now.
>>
>> Perhaps we could add a message to warn users at least.
> Hmm, yeah, but I'm not entirely sure where/how best to document this.  Because
> it's not just that vmx_remove_auto_msr() arbitrarily maniuplates the order, e.g.
> multiple calls to vmx_add_auto_msr() aren't guaranteed to provide ordering because
> one or more MSRs may already be in the list.  And the "special" MSRs that can be
> switched via dedicated VMCS fields further muddy the waters.
>
> So I'm tempted to not add a comment to the helpers, or even the struct fields,
> because unfortunately it's largely a "Here be dragons!" type warning. :-/

I see. Thanks.



