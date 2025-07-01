Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E5CDC7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jul 2025 13:54:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:
	Subject:CC:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x2tnbwk7LVK0mHHh6v79xO/5HP7ePI0q/6KFKEbD0Xo=; b=DeH09Xde1KWI3aS+9u06UaEJYS
	ff9R7/80T+0B5vFseFVlaLJCqjCgeYtYx9jEZ3gYqksXe7/5L4LeAxoFeLNpx8qONd4ZwGkmbYn0i
	W9nXNz49IFi2EgmFDLdfU8yLITwX0M9EIY6NHVAN1KaJYg/TJP48AiR3lTZdXBTEXqyubDNOvnl3P
	mGRKrWYr9VrjLn8SSo+A1rAju/13vZ9dLSXwD4M3Eb0rK2AwpdMlb9ohr+JBOQqh422uglRlQqwlF
	V3cG5po+TkaCVhMCnIpexTdRVJD0lXNjxnskY83q7jSorTGY+E3q3Da2T7bLT2fFz8klavnBCKN9L
	XIppr7Og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWbRA-00000005b46-3c4G;
	Tue, 01 Jul 2025 13:54:16 +0000
Received: from szxga06-in.huawei.com ([45.249.212.32])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWa9W-00000005KKj-0hpE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Jul 2025 12:32:00 +0000
Received: from mail.maildlp.com (unknown [172.19.163.17])
	by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4bWj9F60Qmz27hvW;
	Tue,  1 Jul 2025 20:32:49 +0800 (CST)
Received: from dggemv705-chm.china.huawei.com (unknown [10.3.19.32])
	by mail.maildlp.com (Postfix) with ESMTPS id 8F1EB1A0188;
	Tue,  1 Jul 2025 20:31:53 +0800 (CST)
Received: from kwepemq200018.china.huawei.com (7.202.195.108) by
 dggemv705-chm.china.huawei.com (10.3.19.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 1 Jul 2025 20:31:53 +0800
Received: from [10.67.121.177] (10.67.121.177) by
 kwepemq200018.china.huawei.com (7.202.195.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 1 Jul 2025 20:31:52 +0800
CC: <yangyicong@hisilicon.com>, <catalin.marinas@arm.com>, <will@kernel.org>,
	<corbet@lwn.net>, <linux-arm-kernel@lists.infradead.org>,
	<kvmarm@lists.linux.dev>, <linux-kselftest@vger.kernel.org>,
	<linux-doc@vger.kernel.org>, <joey.gouly@arm.com>, <suzuki.poulose@arm.com>,
	<yuzenghui@huawei.com>, <shuah@kernel.org>, <jonathan.cameron@huawei.com>,
	<shameerali.kolothum.thodi@huawei.com>, <linuxarm@huawei.com>,
	<prime.zeng@hisilicon.com>, <xuwei5@huawei.com>, <tangchengchang@huawei.com>,
	<wangzhou1@hisilicon.com>
Subject: Re: [PATCH v3 3/7] KVM: arm64: Handle DABT caused by LS64*
 instructions on unsupported memory
To: Marc Zyngier <maz@kernel.org>, <oliver.upton@linux.dev>
References: <20250626080906.64230-1-yangyicong@huawei.com>
 <20250626080906.64230-4-yangyicong@huawei.com> <86zfduc2ca.wl-maz@kernel.org>
 <44993060-7eb1-400c-9887-3d438aeb8ee9@huawei.com>
 <86v7ohba6a.wl-maz@kernel.org>
From: Yicong Yang <yangyicong@huawei.com>
Message-ID: <c87852dd-98d5-311f-9760-ea0b7c8b27a1@huawei.com>
Date: Tue, 1 Jul 2025 20:31:52 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <86v7ohba6a.wl-maz@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.121.177]
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 kwepemq200018.china.huawei.com (7.202.195.108)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_053158_545800_D3C0EDF1 
X-CRM114-Status: GOOD (  29.59  )
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

On 2025/6/27 21:12, Marc Zyngier wrote:
> On Thu, 26 Jun 2025 12:39:41 +0100,
> Yicong Yang <yangyicong@huawei.com> wrote:
>>
>> On 2025/6/26 16:51, Marc Zyngier wrote:
>>> On Thu, 26 Jun 2025 09:09:02 +0100,
>>> Yicong Yang <yangyicong@huawei.com> wrote:
> 
> [...]
> 
>>>>
>>>> +	/*
>>>> +	 * Target address is normal memory on the Host. We come here
>>>> +	 * because:
>>>> +	 * 1) Guest map it as device memory and perform LS64 operations
>>>> +	 * 2) VMM report it as device memory mistakenly
>>>> +	 * Hand it to the userspace.
>>>> +	 */
>>>> +	if (esr_fsc_is_excl_atomic_fault(kvm_vcpu_get_esr(vcpu))) {
>>>> +		struct kvm_run *run = vcpu->run;
>>>> +
>>>> +		run->exit_reason = KVM_EXIT_ARM_LDST64B;
>>>> +		run->arm_nisv.esr_iss = kvm_vcpu_dabt_iss_nisv_sanitized(vcpu);
>>>> +		run->arm_nisv.fault_ipa = fault_ipa |
>>>> +			(kvm_vcpu_get_hfar(vcpu) & (vma_pagesize - 1));
>>>> +
>>>> +		return -EAGAIN;
>>>> +	}
>>>
>>> I'm not sure that's the right thing to do.
>>>
>>> If:
>>>
>>> - the guest was told it doesn't have LS64WB,
>>>
>>> - it was told that some range is memory,
>>>
>>> - it uses that range as device,
>>>
>>> - thanks to FWB the resulting memory type is "Normal-Cacheable"
>>>
>>> - which results in an Unsupported Atomic exception
>>>
>>> why would we involve the VMM at all? The VMM clearly said it didn't
>>> want to be involved in this (we have a memslot).
>>>
>>
>> ok I thought we should make VMM do the decision in all the cases(both
>> here and emulated MMIO) based on the last discussion[*], I may
>> misunderstand it. If this is the case...
>>
>>> I think we should simply inject the corresponding S1 fault back into
>>> the guest.
>>>
>>
>> let's simply inject a corresponding DABT back here and only make the VMM
>> handle the emulated MMIO case. will update if no further comment.
> 
> A permission fault at S2 for a R/O memslot should definitely be
> relayed to userspace. But the question is whether the HW would report
> a permission fault or an unsupported atomic or exclusive fault (UAoEF
> for short).
> 
> If the HW supports LS64WB, I'd fully expect to get a permission fault,
> not an UAoEF, and we can perfectly report this to userspace with full
> decode information (though this doesn't fit in the KVM_EXIT_MMIO
> structure -- that's "only" an ABI problem).
> 
> If it doesn't, then we have a much bigger issue, and I don't think we
> can realistically triage the exception in a meaningful way -- we just
> can't know the reason why we failed, and we don't even know whether
> this was a load or store.
> 
> Overall, I can see two options here:
> 
> - we limit the LS64 support to HW that supports LS64WB (too bad for
>   the other implementations, which is 100% of them). We can always
>   triage the exception correctly, and we're unlikely to ever take an
>   UAoEF in this context.
> 
> - we define that R/O memslots do not support LS64 accesses at all,
>   which is always a valid implementation -- the architecture makes no
>   provision of which pieces of addressable memory supports an access
>   type or another. With that, we can always inject the UAoEF back into
>   the guest without any further triaging.
> 

I'd vote for 2nd solution. this is only the exception case unless trigger it
purposely, the instructions are used for device memory in the normal
cases. It's unfair to forbid the use of it on LS64WB lacked platforms and we
do support LS64 but no LS64WB.

Injecting the UAoEF back will make the handling consistent with host.

thanks.

