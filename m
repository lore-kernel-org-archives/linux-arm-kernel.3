Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24152C3ABD8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 May 2025 17:46:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W0gCDqdJTFluVUSBms5jh2uI7zLzEY+54pZWqVT1phY=; b=S+2Hqugg3n+cbT4fWeXd+qGG60
	Zz6vg+TzuAoZUaSiK6sx5GQ4P/pCFR3AG9/8fYrN8MhwuU37rF35l3df+/AGklmiA6MBnnPitcnW0
	4NiOkde2jO3GfXm7kv1sXdOvsHisuDrIkELYmS9Y023znMay/qdEiGyW9f0vTktuhXbak+uvUhcFI
	PcDFMkfto6Usc5EQxedmLvk58UOZw5lpfWmaS5CsckKN5Ks1PteoqltWsZRAvTO85kuBclNy67IyW
	9nzd7VwUY2uOiFmmiAkKpBSchs0dD67vxP/dEg+YGayTKVoV1jH3A1tIrHzZkdpkjea6t6t25uPYF
	z473vSWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFGBR-0000000FtlV-3DB3;
	Wed, 14 May 2025 17:46:21 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFE58-0000000FbY7-45i8
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 14 May 2025 15:31:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=W0gCDqdJTFluVUSBms5jh2uI7zLzEY+54pZWqVT1phY=; b=O0aNOg/M0ncDorDPJ19nkSmAje
	lhpgg0YlSONDPn5Qmpl5pMFIMl5mRjjuiM2mnOIGUG/JV9El3ripVZq6aycAjVfy3OsS0+P6w54gF
	93TvJwiRq0XB7SMk8NUfC4NcetgPzg3IuGchAS17SeQJZMJgoTnSR3B82pMC/hiriRZWdmu169y1T
	RaZeeZJhkQLjxNhHh/TnErPrVemE8d8vxK3knHlBjVgtqo+xu7K04hh4Un9VARo/u3CH1C2AC3WUV
	8L/TMHJ2x/YlnfmXBHq9YxphJFZF33k8VSI4uDsO8pdRDkhRFfUTFzzXet0QXPALdDNoHeg4SeWhm
	6xrpPXNQ==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uFE55-0000000HEga-1vXk
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 May 2025 15:31:41 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D8782150C;
	Wed, 14 May 2025 08:31:24 -0700 (PDT)
Received: from [10.57.91.10] (unknown [10.57.91.10])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8A34F3F5A1;
	Wed, 14 May 2025 08:31:33 -0700 (PDT)
Message-ID: <933f4191-4075-4b02-998a-35b1711e778c@arm.com>
Date: Wed, 14 May 2025 16:31:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v4 5/5] mm/filemap: Allow arch to request folio size
 for exec memory
Content-Language: en-GB
To: Will Deacon <will@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
 David Hildenbrand <david@redhat.com>, Dave Chinner <david@fromorbit.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Kalesh Singh <kaleshsingh@google.com>, Zi Yan <ziy@nvidia.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-mm@kvack.org
References: <20250430145920.3748738-1-ryan.roberts@arm.com>
 <20250430145920.3748738-6-ryan.roberts@arm.com>
 <20250509135223.GB5707@willie-the-truck>
 <c52861ac-9622-4d4f-899e-3a759f04af12@arm.com>
 <20250514151400.GB10762@willie-the-truck>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <20250514151400.GB10762@willie-the-truck>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_163139_888713_0B6CE3BD 
X-CRM114-Status: GOOD (  18.29  )
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

On 14/05/2025 16:14, Will Deacon wrote:
> On Tue, May 13, 2025 at 01:46:06PM +0100, Ryan Roberts wrote:
>> On 09/05/2025 14:52, Will Deacon wrote:
>>> On Wed, Apr 30, 2025 at 03:59:18PM +0100, Ryan Roberts wrote:
>>>> diff --git a/mm/filemap.c b/mm/filemap.c
>>>> index e61f374068d4..37fe4a55c00d 100644
>>>> --- a/mm/filemap.c
>>>> +++ b/mm/filemap.c
>>>> @@ -3252,14 +3252,40 @@ static struct file *do_sync_mmap_readahead(struct vm_fault *vmf)
>>>>  	if (mmap_miss > MMAP_LOTSAMISS)
>>>>  		return fpin;
>>>>  
>>>> -	/*
>>>> -	 * mmap read-around
>>>> -	 */
>>>>  	fpin = maybe_unlock_mmap_for_io(vmf, fpin);
>>>> -	ra->start = max_t(long, 0, vmf->pgoff - ra->ra_pages / 2);
>>>> -	ra->size = ra->ra_pages;
>>>> -	ra->async_size = ra->ra_pages / 4;
>>>> -	ra->order = 0;
>>>> +	if (vm_flags & VM_EXEC) {
>>>> +		/*
>>>> +		 * Allow arch to request a preferred minimum folio order for
>>>> +		 * executable memory. This can often be beneficial to
>>>> +		 * performance if (e.g.) arm64 can contpte-map the folio.
>>>> +		 * Executable memory rarely benefits from readahead, due to its
>>>> +		 * random access nature, so set async_size to 0.
>>>
>>> In light of this observation (about randomness of instruction fetch), do
>>> you think it's worth ignoring VM_RAND_READ for VM_EXEC?
>>
>> Hmm, yeah that makes sense. Something like:
>>
>> ---8<---
>> diff --git a/mm/filemap.c b/mm/filemap.c
>> index 7b90cbeb4a1a..6c8bf5116c54 100644
>> --- a/mm/filemap.c
>> +++ b/mm/filemap.c
>> @@ -3233,7 +3233,8 @@ static struct file *do_sync_mmap_readahead(struct vm_fault
>> *vmf)
>>         if (!ra->ra_pages)
>>                 return fpin;
>>
>> -       if (vm_flags & VM_SEQ_READ) {
>> +       /* VM_EXEC case below is already intended for random access */
>> +       if ((vm_flags & (VM_SEQ_READ | VM_EXEC)) == VM_SEQ_READ) {
>>                 fpin = maybe_unlock_mmap_for_io(vmf, fpin);
>>                 page_cache_sync_ra(&ractl, ra->ra_pages);
>>                 return fpin;
>> ---8<---
> 
> I was thinking about the:
> 
> 	if (vm_flags & VM_RAND_READ)
> 		return fpin;

Yes sorry, I lost my mind when doing that patch... I intended to do it for the
VM_RAND_READ as you suggested, but my fingers did something completely different.

> 
> code above this which bails if VM_RAND_READ is set. That seems contrary
> to the code you're adding which says that, even for random access
> patterns where readahead doesn't help, it's still worth sizing the folio
> appropriately for contpte mappings.

Anyway, I totally agree with this. So I'll avoid the early return VM_RAND_READ
if VM_EXEC is also set.

Thanks,
Ryan

> 
> Will


