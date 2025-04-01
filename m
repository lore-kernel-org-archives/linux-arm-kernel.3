Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CFCCC36018
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Apr 2025 08:25:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IAeZEEuHoRvZcIJ92tw+WdQFBR00ozaxkC4is9oDm+4=; b=gNguGyXqUsBne5rkMAYJuWtrIu
	jhazWhLoibOWU3uOtY7R3v+3K8s5Lq/cwLUbWtJhq7W970bLVGvHv336vxf3pE91Anm1q7CKjZk6W
	OHf8m/cFQxP9sJEaIU+zzkVYS2e9kK9PnmtMV8NXEurC1Zoe/BNhv6F/tRIoG1Pm3Gs3CUzFMHK2Z
	yQJBpOXKdWcCzkEvz6dMn3c5uL0V5WFbKc24/5xRg7mTew1ydtyw+qk/clWLcuKrZ3B0pO3A842yJ
	Tdigdpc6OCDbW4rRJIkmFo4RsnAT3T1TaUJlP+vucnDb5zXJYD/EthVdBime2iI5CzvEQ6ODtyapj
	oXzTTBIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzWwL-00000002K58-1yZf;
	Tue, 01 Apr 2025 08:25:45 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzWtC-00000002Jdy-2IGb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Apr 2025 08:22:31 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 91ABB14BF;
	Tue,  1 Apr 2025 01:22:32 -0700 (PDT)
Received: from [10.162.16.153] (unknown [10.162.16.153])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 204D03F63F;
	Tue,  1 Apr 2025 01:22:26 -0700 (PDT)
Message-ID: <c5d835bc-883d-449f-afd3-16a09e418e1b@arm.com>
Date: Tue, 1 Apr 2025 13:52:24 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: Don't call NULL in do_compat_alignment_fixup
To: Angelos Oikonomopoulos <angelos@igalia.com>,
 linux-arm-kernel@lists.infradead.org
Cc: catalin.marinas@arm.com, will@kernel.org, linux-kernel@vger.kernel.org,
 kernel-dev@igalia.com
References: <20250331085415.122409-1-angelos@igalia.com>
 <17de4426-8263-4ccb-8420-f6913d478ae9@arm.com>
 <D8V3VKNJJI1Z.27C32MUQ1OLYF@igalia.com>
 <c1dc28a9-7a36-4303-a8eb-0e227d866c37@arm.com>
 <D8V5E7FT19GH.3EUO3I50GYF8J@igalia.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <D8V5E7FT19GH.3EUO3I50GYF8J@igalia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250401_012230_632983_9E03F5FA 
X-CRM114-Status: GOOD (  17.58  )
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



On 4/1/25 13:39, Angelos Oikonomopoulos wrote:
> On Tue Apr 1, 2025 at 9:47 AM CEST, Anshuman Khandual wrote:
>>
>>
>> On 4/1/25 12:28, Angelos Oikonomopoulos wrote:
>>> On Tue Apr 1, 2025 at 8:05 AM CEST, Anshuman Khandual wrote:
>>>> On 3/31/25 14:24, Angelos Oikonomopoulos wrote:
> [...]
>>>>>  arch/arm64/kernel/compat_alignment.c | 2 ++
>>>>>  1 file changed, 2 insertions(+)
>>>>>
>>>>> diff --git a/arch/arm64/kernel/compat_alignment.c b/arch/arm64/kernel/compat_alignment.c
>>>>> index deff21bfa680..b68e1d328d4c 100644
>>>>> --- a/arch/arm64/kernel/compat_alignment.c
>>>>> +++ b/arch/arm64/kernel/compat_alignment.c
>>>>> @@ -368,6 +368,8 @@ int do_compat_alignment_fixup(unsigned long addr, struct pt_regs *regs)
>>>>>  		return 1;
>>>>>  	}
>>>>>  
>>>>> +	if (!handler)
>>>>> +		return 1;
>>>>
>>>> do_alignment_t32_to_handler() could return NULL, returning 1 seems to be
>>>> the right thing to do here and consistent. Otherwise does this cause a
>>>> kernel crash during subsequent call into handler() ?
>>>
>>> Yes. We call a NULL pointer so we Oops.
>>
>> Then the commit message should have the kernel Oops splash dump and also
>> might need to have Fixes: and CC: stable tags etc ?
> 
> Sure, I can add those. Thanks for the suggestions!
> 
>> Also wondering if handler return value should be checked inside the switch
>> block just after do_alignment_t32_to_handler() assignment.
>>
>> 	handler = do_alignment_t32_to_handler()
>> 	if (!handler)
>> 		return 1
> 
> I can see the appeal of that, but I think placing the check right before
> the single dereference is a more future-proof fix, in that it reduce the
> chances that a later patch will re-introduce a potential NULL pointer
> dereference.

Makes sense. A small nit - just wondering if the following restructuring
here would make things bit more readable ? Regardless, your decision.

	if (handler)
        	type = handler(addr, instr, regs);
        else
                return 1;
> 
> Angelos
> 

