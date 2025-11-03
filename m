Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13383CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 17:28:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0DLlqBA6bAi7nusY1Kk4Ff1d+Dhb/e05LWrLhGEE4Fs=; b=BASHXyN3Eic7tDpJobUyErTbvF
	56XM57mWrQfln9AaKwqLg7Y2kPiftX2OpQUWts4aV6OZkfIm9/CnZYS0GuQWwhCtLH+j5s/nmY5Pl
	8yMxZPQYhSf2qbFJhVokUt2vgQpYQHVfwgVXXF6GrXNMgwQQNAZRlTZdMblFTKRKvhNa8ETKzW1uA
	qAbSAaw1NaPC7adID5YpdV4fkfK3xJ2aBHBTL6Rt7A2xglOWW2E2v0/zs262PTVgkpgtEJgVvYDGU
	XJwH8E6zEbFkLcnft7slH1JY2YWTakeC8uwtSuZuK2UIzRHJ0QfwKNFhOMYFnhgicg49V+6Yvdt1K
	zlecJ29g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFyM9-0000000APuk-48Zb;
	Mon, 03 Nov 2025 17:28:38 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFyM7-0000000APuH-0xwG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Nov 2025 17:28:36 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C9ED11D14;
	Mon,  3 Nov 2025 09:28:26 -0800 (PST)
Received: from [10.1.36.161] (XHFQ2J9959.cambridge.arm.com [10.1.36.161])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B00D83F66E;
	Mon,  3 Nov 2025 09:28:32 -0800 (PST)
Message-ID: <8df1d593-f176-422d-8b87-844986ac38a6@arm.com>
Date: Mon, 3 Nov 2025 17:28:31 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] arm64: mm: Don't sleep in split_kernel_leaf_mapping()
 when in atomic context
Content-Language: en-GB
To: "David Hildenbrand (Red Hat)" <david@kernel.org>,
 catalin.marinas@arm.com, will@kernel.org, yang@os.amperecomputing.com,
 ardb@kernel.org, dev.jain@arm.com, scott@os.amperecomputing.com,
 cl@gentwo.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Guenter Roeck <groeck@google.com>
References: <20251103125738.3073566-1-ryan.roberts@arm.com>
 <e5fee14a-4569-49c8-9f42-844839e51e85@kernel.org>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <e5fee14a-4569-49c8-9f42-844839e51e85@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_092835_352533_C9029184 
X-CRM114-Status: GOOD (  18.31  )
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

On 03/11/2025 15:38, David Hildenbrand (Red Hat) wrote:
> 
>>   }
>>
>> +static inline bool force_pte_mapping(void)
>> +{
>> +    bool bbml2 = system_capabilities_finalized() ?
>> +        system_supports_bbml2_noabort() : cpu_supports_bbml2_noabort();
> 
> You are only moving this function. Still, there is some room for improvement I
> want to point out :)
> 
> bbml2 could be a const (or a helper function like bbml2_supported).
> 
>> +
>> +    return (!bbml2 && (rodata_full || arm64_kfence_can_set_direct_map() ||
>> +               is_realm_world())) ||
>> +        debug_pagealloc_enabled();
> 
> 
> I suspect this could be made a bit easier to read.
> 
>     if (debug_pagealloc_enabled())
>         return true;
>     if (bbml2)
>         return false;
>     return rodata_full || arm64_kfence_can_set_direct_map() || is_realm_world();

Yeah, I guess that's a bit nicer. I'd prefer to tidy it up in as separate commit
though. (feel free ;-) )

> 
> 
>> +}
>> +
>>   static DEFINE_MUTEX(pgtable_split_lock);
>>
>>   int split_kernel_leaf_mapping(unsigned long start, unsigned long end)
>> @@ -723,6 +733,16 @@ int split_kernel_leaf_mapping(unsigned long start,
>> unsigned long end)
>>       if (!system_supports_bbml2_noabort())
>>           return 0;
>>
>> +    /*
>> +     * If the region is within a pte-mapped area, there is no need to try to
>> +     * split. Additionally, CONFIG_DEBUG_PAGEALLOC and CONFIG_KFENCE may
>> +     * change permissions from softirq context so for those cases (which are
>> +     * always pte-mapped), we must not go any further because taking the
>> +     * mutex below may sleep.
>> +     */
>> +    if (force_pte_mapping() || is_kfence_address((void *)start))
>> +        return 0;
>> +
> 
> We're effectively performing two system_supports_bbml2_noabort() checks,
> similarly in
> arch_kfence_init_pool().
> 
> I wonder if there is a clean way to avoid that.

I thought about this too. But system_supports_bbml2_noabort() is actually a
magic alternatives patching thing; the code is updated so it's zero overhead. I
decided this was the simplest and clearest way to do it. But I'm open to other
ideas...

> 
> I'm not super up-to-date on that code. Nothing else jumped at me.

Thanks for the review!

> 


