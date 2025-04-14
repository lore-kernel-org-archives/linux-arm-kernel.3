Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 718A9C369A2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Apr 2025 13:50:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YWq/boYisZYMrhdhaDiWHyihYMW/MTKTJ7vYRohwc+E=; b=ZrhJLzBtqFf3/SgbL79nUb91ef
	K31Si+zQoSnTSoQFWgTWFx6og8Dni3RuEHW1yAyjw74X61RGbrtbW5R1qJWkLX/u1CsAsHk1l1fLt
	YrBr/A/ugukQU6vHncutKAVqfjy4nItjGBhGR0giREY2Uut2mPQIYsQ2WGmeLbblQWXS5rUsCY39t
	HQehZE4MKjpxa+DpHoKyhcoDdgKWm2ecZGhh0NmjUjQ3+ChyOnavhQxpb2T8Mxy6y+lhUS92n8Aix
	HLvPpZLN6wv6hysgTq8Cfnc6jvP+r7+k93O8VbZMCmFAEd0ZsuNcGeC+NBIO7zShxwc63csrNkzu5
	UPPvzH2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4KD2-00000002EbO-30T6;
	Mon, 14 Apr 2025 13:50:48 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4KB9-00000002EFw-2ic2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Apr 2025 13:48:52 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id ACBB51007;
	Mon, 14 Apr 2025 06:48:49 -0700 (PDT)
Received: from [10.57.86.225] (unknown [10.57.86.225])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 107F43F66E;
	Mon, 14 Apr 2025 06:48:48 -0700 (PDT)
Message-ID: <6cd5a4ef-5835-41db-8282-4b022df7c953@arm.com>
Date: Mon, 14 Apr 2025 14:48:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: pageattr: Explicitly bail out when changing
 permissions for vmalloc_huge mappings
Content-Language: en-GB
To: David Hildenbrand <david@redhat.com>, Dev Jain <dev.jain@arm.com>,
 catalin.marinas@arm.com, will@kernel.org
Cc: gshan@redhat.com, rppt@kernel.org, steven.price@arm.com,
 suzuki.poulose@arm.com, tianyaxiong@kylinos.cn, ardb@kernel.org,
 urezki@gmail.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250403052844.61818-1-dev.jain@arm.com>
 <75884033-9474-4d0c-b737-d9b6aebe298b@redhat.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <75884033-9474-4d0c-b737-d9b6aebe298b@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_064851_726215_432D369E 
X-CRM114-Status: GOOD (  16.56  )
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

On 04/04/2025 13:57, David Hildenbrand wrote:
> On 03.04.25 07:28, Dev Jain wrote:
>> arm64 uses apply_to_page_range to change permissions for kernel vmalloc mappings,
>> which does not support changing permissions for block mappings. This function
>> will change permissions until it encounters a block mapping, and will bail
>> out with a warning. Since there are no reports of this triggering, it
>> implies that there are currently no cases of code doing a vmalloc_huge()
>> followed by partial permission change. But this is a footgun waiting to
>> go off, so let's detect it early and avoid the possibility of permissions
>> in an intermediate state. So,  explicitly disallow changing permissions
>> for VM_ALLOW_HUGE_VMAP mappings.
>>
>> Reviewed-by: Ryan Roberts <ryan.roberts@arm.com>
>> Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
>> Signed-off-by: Dev Jain <dev.jain@arm.com>
>> ---
>> v1->v2:
>>   - Improve changelog, keep mention of page mappings in comment
>>
>>   arch/arm64/mm/pageattr.c | 6 +++---
>>   1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/arch/arm64/mm/pageattr.c b/arch/arm64/mm/pageattr.c
>> index 39fd1f7ff02a..04d4a8f676db 100644
>> --- a/arch/arm64/mm/pageattr.c
>> +++ b/arch/arm64/mm/pageattr.c
>> @@ -96,8 +96,8 @@ static int change_memory_common(unsigned long addr, int
>> numpages,
>>        * we are operating on does not result in such splitting.
>>        *
>>        * Let's restrict ourselves to mappings created by vmalloc (or vmap).
>> -     * Those are guaranteed to consist entirely of page mappings, and
>> -     * splitting is never needed.
>> +     * Disallow VM_ALLOW_HUGE_VMAP mappings to guarantee that only page
>> +     * mappings are updated and splitting is never needed.
>>        *
>>        * So check whether the [addr, addr + size) interval is entirely
>>        * covered by precisely one VM area that has the VM_ALLOC flag set.
>> @@ -105,7 +105,7 @@ static int change_memory_common(unsigned long addr, int
>> numpages,
>>       area = find_vm_area((void *)addr);
>>       if (!area ||
>>           end > (unsigned long)kasan_reset_tag(area->addr) + area->size ||
>> -        !(area->flags & VM_ALLOC))
>> +        ((area->flags & (VM_ALLOC | VM_ALLOW_HUGE_VMAP)) != VM_ALLOC))
>>           return -EINVAL;
>>         if (!numpages)
> 
> Makes sense to me. Whenever required, we can improve the checks (or even try
> supporting splitting).

Yes that's the plan; I'd like to get to the point where we can do huge vmalloc
mappings by default on systems that support BBML2, then split mappings when needed.


> 
> Acked-by: David Hildenbrand <david@redhat.com>
> 


