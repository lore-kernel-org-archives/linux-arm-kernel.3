Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ED52C79FBF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 18:52:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C51BjttrzBuBPjxz7mV6aXgMKNOXlVw0b7lMBT8dULY=; b=WYp4z09xyi5xabN5Eo7ATx+1vP
	QPmwSCXscU374CapLSu/a+E8qHl/GKwkDh45dxhyES24Sa0JA9U6f7NJ64rAjrkg1u9lj9cpLQR7f
	5oOLTXbudq49GXJotsAZvzrjGtVS53bufD27vGtwc05r4K/q9gF20KiIHH6HWdxUw8/HVhKtYagBU
	s6/Ad/Xk+zZA1bgOtqyqhLdh5JhHmmYS7vBD4/b2OWPlgaBvLoxwyyPf+mc12DT48QtBk+9Wfge+R
	yNjfex8B6xDE6J38yFjgfZ4C9CdWHYtxZFUq5E5yc9nxRvc4RFxDhN7mPNnrgtJc1d/CuayLGIoxP
	e3WERisQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4jt8-0000000FCjM-0Px2;
	Thu, 10 Sep 2026 18:52:46 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4jt4-0000000FChf-1I7v
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 18:52:45 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BC7D5237B;
	Thu, 10 Sep 2026 11:52:36 -0700 (PDT)
Received: from [10.57.7.48] (unknown [10.57.7.48])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 86D6D3F7B4;
	Thu, 10 Sep 2026 11:52:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789066360; bh=PUqmytCxMyQ0ym4c50gS+GVSG7otnsiTkLudKZJwZFI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Bz0soMG09HJvtLkmBobf5omEFtr8QN+tgX3HtQTv2tYksKKDU+zaetH0QWoNBUjpg
	 6nmUJBAqQY+V1TISan/OWs2czXHaQxyTL4wBwjziWxdNUBlcp8VyC5HOk9NYrEQSob
	 JAToEZ5TagPEj0oZmxgT6hDFosK7Uj4jO7WPOjrk=
Message-ID: <f75e72f7-c508-4153-8e83-74af275a7d8f@arm.com>
Date: Thu, 10 Sep 2026 19:52:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v17 1/1] arm64: mm: Handle Granule Protection Faults
 (GPFs)
Content-Language: en-GB
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, will@kernel.org,
 linux-kernel@vger.kernel.org, maz@kernel.org,
 pavan.kondeti@oss.qualcomm.com, tabba@google.com, aneesh.kumar@kernel.org,
 mark.rutland@arm.com, sdonthineni@nvidia.com, steven.price@arm.com,
 gshan@redhat.com, yuzenghui@huawei.com, kvmarm@lists.linux.dev
References: <20260907162204.1479401-1-suzuki.poulose@arm.com>
 <20260907162204.1479401-2-suzuki.poulose@arm.com> <aqLsnngKRbMRu211@arm.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <aqLsnngKRbMRu211@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_115242_856773_C26910BF 
X-CRM114-Status: GOOD (  16.80  )
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

On 10/09/2026 18:45, Catalin Marinas wrote:
> On Mon, Sep 07, 2026 at 05:22:04PM +0100, Suzuki K Poulose wrote:
>> diff --git a/arch/arm64/mm/fault.c b/arch/arm64/mm/fault.c
>> index 0b52557652be6..ad00997b1a873 100644
>> --- a/arch/arm64/mm/fault.c
>> +++ b/arch/arm64/mm/fault.c
>> @@ -910,6 +910,22 @@ static int do_tag_check_fault(unsigned long far, unsigned long esr,
>>   	return 0;
>>   }
>>   
>> +static int do_gpf_ptw(unsigned long far, unsigned long esr, struct pt_regs *regs)
>> +{
>> +	const struct fault_info *inf = esr_to_fault_info(esr);
>> +
>> +	die_kernel_fault(inf->name, far, esr, regs);
>> +	return 0;
>> +}
>> +
>> +static int do_gpf(unsigned long far, unsigned long esr, struct pt_regs *regs)
>> +{
>> +	if (!is_el1_instruction_abort(esr) && fixup_exception(regs, esr))
>> +		return 0;
>> +
>> +	return 1;
>> +}
> 
> If we end up with a user PC here, we correctly return 1 but only because
> fixup_exception() won't find the PC. I'd rather have this explicit with
> a user_mode() check.

Sure, I have made the condtion to:

+       if (!user_mode(regs) && !is_el1_instruction_abort(esr) &&
+           fixup_exception(regs, esr))
+               return 0;

> 
>> +
>>   static const struct fault_info fault_info[] = {
>>   	{ do_bad,		SIGKILL, SI_KERNEL,	"ttbr address size fault"	},
>>   	{ do_bad,		SIGKILL, SI_KERNEL,	"level 1 address size fault"	},
>> @@ -946,12 +962,12 @@ static const struct fault_info fault_info[] = {
>>   	{ do_bad,		SIGKILL, SI_KERNEL,	"unknown 32"			},
>>   	{ do_alignment_fault,	SIGBUS,  BUS_ADRALN,	"alignment fault"		},
>>   	{ do_bad,		SIGKILL, SI_KERNEL,	"unknown 34"			},
>> -	{ do_bad,		SIGKILL, SI_KERNEL,	"unknown 35"			},
>> -	{ do_bad,		SIGKILL, SI_KERNEL,	"unknown 36"			},
>> -	{ do_bad,		SIGKILL, SI_KERNEL,	"unknown 37"			},
>> -	{ do_bad,		SIGKILL, SI_KERNEL,	"unknown 38"			},
>> -	{ do_bad,		SIGKILL, SI_KERNEL,	"unknown 39"			},
>> -	{ do_bad,		SIGKILL, SI_KERNEL,	"unknown 40"			},
>> +	{ do_gpf_ptw,		SIGKILL, SI_KERNEL,	"level -1 granule protection fault (translation table walk)" },
>> +	{ do_gpf_ptw,		SIGKILL, SI_KERNEL,	"level 0 granule protection fault (translation table walk)" },
>> +	{ do_gpf_ptw,		SIGKILL, SI_KERNEL,	"level 1 granule protection fault (translation table walk)" },
>> +	{ do_gpf_ptw,		SIGKILL, SI_KERNEL,	"level 2 granule protection fault (translation table walk)" },
>> +	{ do_gpf_ptw,		SIGKILL, SI_KERNEL,	"level 3 granule protection fault (translation table walk)" },
>> +	{ do_gpf,		SIGBUS,  SI_KERNEL,	"granule protection fault" },
> 
> For SIGBUS, we should use BUS_OBJERR like we do for do_sea().

Good point, I have added that.
> 
> Otherwise it looks fine to me.

Thanks, I have already added the untagged_addr() as reported by Sashiko.


> 
> Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>


Cheers
Suzuki

