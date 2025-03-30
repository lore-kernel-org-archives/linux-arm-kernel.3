Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92CFEC28B20
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 30 Mar 2025 07:16:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K55omm28W59ywIdfkTh0tB8Njf/oN7lUPKGF4/tjhd0=; b=ZKlNi01tNCsz+AG3iWBOzJDQRw
	rU8ZsU7UhkEZu6N64e022B8dXdGdzClOxAQ/pdixpMV3+od5iJA1O5qxaVkry25QYWIGByqgd2Gg4
	h7ZwvY5WrBdQ+2n2dagMKSZIlJVuzsYEQFHNPCFnq6AX5p1C/ivTH/q8rbbhvZTJ5R0POlBDS1TJp
	hratAHQMIJNHILd7QgNp6WZAILBeKWikW+mH6zhqowE0VV6SC1NAJSrnmRmvOvyXwD/z48HE+nPti
	QY9CqWj8XzuT9yQrrAQaColyNlx99XunMFpPgR4/ESpHmYSJE8v1s3QHQU3w6bPUZFLvGAQNacgf+
	LwRCQ4sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tymtc-0000000FtZ9-1Fom;
	Sun, 30 Mar 2025 07:15:52 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tymr1-0000000FtOz-39Hb
	for linux-arm-kernel@lists.infradead.org;
	Sun, 30 Mar 2025 07:13:12 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B43911007;
	Sun, 30 Mar 2025 00:13:14 -0700 (PDT)
Received: from [10.163.43.124] (unknown [10.163.43.124])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D89353F694;
	Sun, 30 Mar 2025 00:13:05 -0700 (PDT)
Message-ID: <fe35ef7f-9b3a-4de8-a006-120e2085e817@arm.com>
Date: Sun, 30 Mar 2025 12:43:01 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: pageattr: Explicitly bail out when changing
 permissions for vmalloc_huge mappings
To: Mike Rapoport <rppt@kernel.org>
Cc: catalin.marinas@arm.com, will@kernel.org, gshan@redhat.com,
 steven.price@arm.com, suzuki.poulose@arm.com, tianyaxiong@kylinos.cn,
 ardb@kernel.org, david@redhat.com, ryan.roberts@arm.com, urezki@gmail.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250328062103.79462-1-dev.jain@arm.com>
 <Z-cnmklGUojMzsUF@kernel.org>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <Z-cnmklGUojMzsUF@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250330_001311_838466_DDF1DDE3 
X-CRM114-Status: GOOD (  17.38  )
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



On 29/03/25 4:20 am, Mike Rapoport wrote:
> On Fri, Mar 28, 2025 at 11:51:03AM +0530, Dev Jain wrote:
>> arm64 uses apply_to_page_range to change permissions for kernel VA mappings,
> 
>                                                       for vmalloc mappings ^
> 
> arm64 does not allow changing permissions to any VA address right now.

Sorry, mistakenly used them interchangeably. I'll fix this.

> 
>> which does not support changing permissions for leaf mappings. This function
>> will change permissions until it encounters a leaf mapping, and will bail
>> out. To avoid this partial change, explicitly disallow changing permissions
>> for VM_ALLOW_HUGE_VMAP mappings.
>>
>> Signed-off-by: Dev Jain <dev.jain@arm.com>
>> ---
>>   arch/arm64/mm/pageattr.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/arm64/mm/pageattr.c b/arch/arm64/mm/pageattr.c
>> index 39fd1f7ff02a..8337c88eec69 100644
>> --- a/arch/arm64/mm/pageattr.c
>> +++ b/arch/arm64/mm/pageattr.c
>> @@ -96,7 +96,7 @@ static int change_memory_common(unsigned long addr, int numpages,
>>   	 * we are operating on does not result in such splitting.
>>   	 *
>>   	 * Let's restrict ourselves to mappings created by vmalloc (or vmap).
>> -	 * Those are guaranteed to consist entirely of page mappings, and
>> +	 * Disallow VM_ALLOW_HUGE_VMAP vmalloc mappings so that
> 
> I'd keep mention of page mappings in the comment, e.g
> 
> 	* Disallow VM_ALLOW_HUGE_VMAP mappings to guarantee that only page
> 	* mappings are updated and splitting is never needed.
> 
> With this and changelog updates Ryan asked for
> 
> Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

Thanks!

> 
> 
>>   	 * splitting is never needed.
>>   	 *
>>   	 * So check whether the [addr, addr + size) interval is entirely
>> @@ -105,7 +105,7 @@ static int change_memory_common(unsigned long addr, int numpages,
>>   	area = find_vm_area((void *)addr);
>>   	if (!area ||
>>   	    end > (unsigned long)kasan_reset_tag(area->addr) + area->size ||
>> -	    !(area->flags & VM_ALLOC))
>> +	    ((area->flags & (VM_ALLOC | VM_ALLOW_HUGE_VMAP)) != VM_ALLOC))
>>   		return -EINVAL;
>>   
>>   	if (!numpages)
>> -- 
>> 2.30.2
>>
> 


