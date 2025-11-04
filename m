Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71966CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 03:36:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d1M5F57ZHwlsPFsFAUa6X/hotEJH+J5eJQO7NQkU2o4=; b=XREUya8AYjuvfe6u9DHs2rvlUt
	qMu1yFmCIb1y5lOf5NHYJwZvML/iXsb+tIXJht8nV6JjlaPYopJ9OHNtHqTJY20BZLO50qkzFHy9R
	5eYaGOuCKxK5Qtq55urGDTv7WbP0+Mh+YH8a6Dku9dpv1NUp8mO9GrlfL2SVIpDACU8gcwXTwzwJ9
	9if+owxN/IP5cFRCTjJnylhunMpLmUKLF4qw+KQMg7GfbdUftKYO5WC+CvBPvF+0VIEZhvWkf//5C
	oKFcQhjvJX1eSHcdwuF5C2BYnc0lOjEFqHuqE0yVYVmJ4ebQm8x0prvkKbQFM1TrYPIdtt+vVQ+LG
	7jcOP/Xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vG7qK-0000000B4K6-16EC;
	Tue, 04 Nov 2025 03:36:24 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vG7qG-0000000B4Jd-3zum
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Nov 2025 03:36:22 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3549F1C2B;
	Mon,  3 Nov 2025 19:36:11 -0800 (PST)
Received: from [10.164.136.37] (unknown [10.164.136.37])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 02B543F63F;
	Mon,  3 Nov 2025 19:36:15 -0800 (PST)
Message-ID: <f8b899cf-d377-4dc7-a57c-82826ea5e1ea@arm.com>
Date: Tue, 4 Nov 2025 09:06:12 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64/pageattr: Propagate return value from
 __change_memory_common
To: Yang Shi <yang@os.amperecomputing.com>, Will Deacon <will@kernel.org>
Cc: catalin.marinas@arm.com, ryan.roberts@arm.com, rppt@kernel.org,
 shijie@os.amperecomputing.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20251103061306.82034-1-dev.jain@arm.com>
 <aQjHQt2rYL6av4qw@willie-the-truck>
 <f594696b-ba33-4c04-9cf5-e88767221ae0@os.amperecomputing.com>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <f594696b-ba33-4c04-9cf5-e88767221ae0@os.amperecomputing.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_193621_038629_CAE9473F 
X-CRM114-Status: GOOD (  18.65  )
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


On 04/11/25 12:15 am, Yang Shi wrote:
>
>
> On 11/3/25 7:16 AM, Will Deacon wrote:
>> On Mon, Nov 03, 2025 at 11:43:06AM +0530, Dev Jain wrote:
>>> Post a166563e7ec3 ("arm64: mm: support large block mapping when 
>>> rodata=full"),
>>> __change_memory_common has a real chance of failing due to split 
>>> failure.
>>> Before that commit, this line was introduced in c55191e96caa, still 
>>> having
>>> a chance of failing if it needs to allocate pagetable memory in
>>> apply_to_page_range, although that has never been observed to be true.
>>> In general, we should always propagate the return value to the caller.
>>>
>>> Cc: stable@vger.kernel.org
>>> Fixes: c55191e96caa ("arm64: mm: apply r/o permissions of VM areas 
>>> to its linear alias as well")
>>> Signed-off-by: Dev Jain <dev.jain@arm.com>
>>> ---
>>> Based on Linux 6.18-rc4.
>>>
>>>   arch/arm64/mm/pageattr.c | 5 ++++-
>>>   1 file changed, 4 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/arch/arm64/mm/pageattr.c b/arch/arm64/mm/pageattr.c
>>> index 5135f2d66958..b4ea86cd3a71 100644
>>> --- a/arch/arm64/mm/pageattr.c
>>> +++ b/arch/arm64/mm/pageattr.c
>>> @@ -148,6 +148,7 @@ static int change_memory_common(unsigned long 
>>> addr, int numpages,
>>>       unsigned long size = PAGE_SIZE * numpages;
>>>       unsigned long end = start + size;
>>>       struct vm_struct *area;
>>> +    int ret;
>>>       int i;
>>>         if (!PAGE_ALIGNED(addr)) {
>>> @@ -185,8 +186,10 @@ static int change_memory_common(unsigned long 
>>> addr, int numpages,
>>>       if (rodata_full && (pgprot_val(set_mask) == PTE_RDONLY ||
>>>                   pgprot_val(clear_mask) == PTE_RDONLY)) {
>>>           for (i = 0; i < area->nr_pages; i++) {
>>> - __change_memory_common((u64)page_address(area->pages[i]),
>>> +            ret = 
>>> __change_memory_common((u64)page_address(area->pages[i]),
>>>                              PAGE_SIZE, set_mask, clear_mask);
>>> +            if (ret)
>>> +                return ret;
>> Hmm, this means we can return failure half-way through the operation. Is
>> that something callers are expecting to handle? If so, how can they tell
>> how far we got?
>
> IIUC the callers don't have to know whether it is half-way or not 
> because the callers will change the permission back (e.g. to RW) for 
> the whole range when freeing memory.

Yes, it is the caller's responsibility to set VM_FLUSH_RESET_PERMS flag. 
Upon vfree(), it will change the direct map permissions back to RW.

>
> Thanks,
> Yang
>
>>
>> Will
>

