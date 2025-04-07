Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 427C4C36018
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Apr 2025 17:04:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8DcXdDTr2RCUhs+YLUElXmKBgeQ/rXlknWi1hybN9LU=; b=S1qRF4N9LgQ4Z6Rq0dKY1rm+RJ
	8saFdR3CIs+zQ0ipMc6nIuW4hZTmF60NDiNPdbTcLXv45D6VF2bQnrGYCQwMw7ymdLzy+NIL3WVDD
	hpqIKTFHWpTpJPYokmEhVHpc7O7wb2T3RBLerASXbPTXjUoBo4ToDxuP1/fjwprTz02fpUYatZ5Zf
	O1LztXuCvCqmX50e6nMvXSqpUM4GHqBrdEwY+M4opXBU1dYTbt5kIRAtqmckJsZzI8djeTi4IwMlE
	Jfyz7F9ZSLLc4nu9lsekBF0PG186dXb0cGHL51sgXxfzlWzne3VbuDt/WUFK3QQjxrDG/YquSRCj8
	n3C9ilXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1pto-00000001Jq5-3hNT;
	Mon, 07 Apr 2025 17:04:40 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1pC9-000000018tU-2H13
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Apr 2025 16:19:35 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 10A2B106F;
	Mon,  7 Apr 2025 09:19:31 -0700 (PDT)
Received: from [10.163.47.133] (unknown [10.163.47.133])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DAEE03F694;
	Mon,  7 Apr 2025 09:19:25 -0700 (PDT)
Message-ID: <027cc666-a562-46fa-bca5-1122ea00ec0e@arm.com>
Date: Mon, 7 Apr 2025 21:49:21 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] mm/contpte: Optimize loop to reduce redundant
 operations
To: Lance Yang <ioworker0@gmail.com>, Xavier <xavier_qy@163.com>
Cc: akpm@linux-foundation.org, baohua@kernel.org, catalin.marinas@arm.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 ryan.roberts@arm.com, will@kernel.org
References: <20250407092243.2207837-1-xavier_qy@163.com>
 <20250407112922.17766-1-ioworker0@gmail.com>
 <5e3f976f.bca1.19610528896.Coremail.xavier_qy@163.com>
 <CAK1f24=hwXCg6K8a=qoWi2DGEWFGBcenSGRoKXtJEo=iR4DtDw@mail.gmail.com>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <CAK1f24=hwXCg6K8a=qoWi2DGEWFGBcenSGRoKXtJEo=iR4DtDw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_091933_625816_CA4714C3 
X-CRM114-Status: GOOD (  16.82  )
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


Hi Xavier,

On 07/04/25 7:01 pm, Lance Yang wrote:
> On Mon, Apr 7, 2025 at 8:56 PM Xavier <xavier_qy@163.com> wrote:
>>
>>
>>
>> Hi Lance,
>>
>> Thanks for your feedback, my response is as follows.
>>
>> --
>> Thanks,
>> Xavier
>>
>>
>>
>>
>>
>> At 2025-04-07 19:29:22, "Lance Yang" <ioworker0@gmail.com> wrote:
>>> Thanks for the patch. Would the following change be better?
>>>
>>> diff --git a/arch/arm64/mm/contpte.c b/arch/arm64/mm/contpte.c
>>> index 55107d27d3f8..64eb3b2fbf06 100644
>>> --- a/arch/arm64/mm/contpte.c
>>> +++ b/arch/arm64/mm/contpte.c
>>> @@ -174,6 +174,9 @@ pte_t contpte_ptep_get(pte_t *ptep, pte_t orig_pte)
>>>
>>>                if (pte_young(pte))
>>>                        orig_pte = pte_mkyoung(orig_pte);
>>> +
>>> +              if (pte_young(orig_pte) && pte_dirty(orig_pte))
>>> +                      break;
>>>        }

Quite the coincidence, I was thinking of doing exactly this some days 
back and testing it out : ) Can you do a microanalysis whether this gets 
us a benefit or not? This looks like an optimization on paper but may 
not be one after all because CONT_PTES is only 16 and a simple loop 
without extra if-conditions may just be faster.

>>>
>>>        return orig_pte;
>>> --
>>>
>>> We can check the orig_pte flags directly instead of using extra boolean
>>> variables, which gives us an early-exit when both dirty and young flags
>>> are set.
>> Your way of writing the code is indeed more concise. However, I think
>>   using boolean variables might be more efficient. Although it introduces
>>   additional variables, comparing boolean values is likely to be more
>>   efficient than checking bit settings.
>>
>>>
>>> Also, is this optimization really needed for the common case?
>> This function is on a high-frequency execution path. During debugging,
>>   I found that in most cases, the first few pages are already marked as
>>   both dirty and young. But currently, the program still has to complete
>>   the entire loop of 16 ptep iterations, which seriously reduces the efficiency.
> 
> Hmm... agreed that this patch helps when early PTEs are dirty/young, but
> for late-ones-only cases, it only introduces overhead with no benefit, IIUC.
> 
> So, let's wait for folks to take a look ;)
> 
> Thanks,
> Lance
> 
>>>
>>> Thanks,
>>> Lance
> 


