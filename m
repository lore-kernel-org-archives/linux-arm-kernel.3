Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BD2FC282DE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Mar 2025 09:56:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r9yGC3wUV2BS8R2W3XR7hVWY2RK7sHzVUPsZvthnSik=; b=lcXpOaaN13klwmkaE6qgFsO2Ro
	4x96EP3s+yju4e7uvfYr6MwjJm0FQmK2bv9ytzJTkClq52x+8c5P/fdKagHd1Hrc++ZTWTLkPhLPg
	mqdQMpSJ2Nb1uDGGlJxL91BNxPnMTFLePglTKx+UgeslvE2FIcrRQKU6QC79aplSNIQFCrKIgP+hY
	VBaC10WjVvTPqBpOtBUK3GxziWzOQHs7QYED+XBa4Z9fw1HYAaKUJZiJoP8dRaFjiNtdoaxGb0RDX
	AVJwG+Of48wWftyYz4VBa0VnjO63OHTpX8EgZze0EM+3j/j9C441cJ8ydH+WCsDgdEkPm366y7eNR
	PcBR/CQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsfIS-0000000Amja-0XdZ;
	Thu, 13 Mar 2025 09:56:12 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsfGm-0000000Amdq-3ZNe
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Mar 2025 09:54:29 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E8ABA1F02;
	Thu, 13 Mar 2025 02:54:35 -0700 (PDT)
Received: from [10.57.85.159] (unknown [10.57.85.159])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8523D3F694;
	Thu, 13 Mar 2025 02:54:24 -0700 (PDT)
Message-ID: <e844e66a-1ddd-44d7-9fcd-f7ec2fb3440a@arm.com>
Date: Thu, 13 Mar 2025 09:54:22 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64/kernel: Always use level 2 or higher for early
 mappings
Content-Language: en-GB
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Ard Biesheuvel <ardb+git@google.com>,
 linux-arm-kernel@lists.infradead.org, mark.rutland@arm.com, will@kernel.org,
 catalin.marinas@arm.com, Anshuman Khandual <anshuman.khandual@arm.com>
References: <20250311073043.96795-2-ardb+git@google.com>
 <f6d48d04-fd3c-493e-b7a0-020b912f6f10@arm.com>
 <CAMj1kXG1jqi9vfTS4wz_a3QPERCUYbHcV6Fq+jf4ZkPtgM5oAg@mail.gmail.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <CAMj1kXG1jqi9vfTS4wz_a3QPERCUYbHcV6Fq+jf4ZkPtgM5oAg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_025428_995378_F68C0803 
X-CRM114-Status: GOOD (  22.98  )
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

On 11/03/2025 18:35, Ard Biesheuvel wrote:
> On Tue, 11 Mar 2025 at 12:31, Ryan Roberts <ryan.roberts@arm.com> wrote:
>>
>> On 11/03/2025 07:30, Ard Biesheuvel wrote:
>>> From: Ard Biesheuvel <ardb@kernel.org>
>>>
>>> The page table population code in map_range() uses a recursive algorithm
>>> to create the early mappings of the kernel, the DTB and the ID mapped
>>> text and data pages, and this fails to take into account that the way
>>> these page tables may be constructed is not precisely the same at each
>>> level. In particular, block mappings are not permitted at each level,
>>> and the code as it exists today might inadvertently create such a
>>> forbidden block mapping if it were used to map a region of the
>>> appropriate size and alignment.
>>>
>>> This never happens in practice, given the limited size of the assets
>>> being mapped by the early boot code. Nonetheless, it would be better if
>>> this code would behave correctly in all circumstances.
>>>
>>> So only permit block mappings at level 2, and page mappings at level 3,
>>> for any page size, and use table mappings exclusively at all other
>>> levels. This change should have no impact in practice, but it makes the
>>> code more robust.
>>>
>>> Cc: Anshuman Khandual <anshuman.khandual@arm.com>
>>> Reported-by: Ryan Roberts <ryan.roberts@arm.com>
>>> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
>>> ---
>>> v2: take the assignment of protval out of the loop again, so that
>>>     clearing a mapping works as expected wrt the PTE_CONT bit
>>
>> Ouch, totally missed that. Now that I've looked at the code properly, I wonder
>> if it is worth supporting CONT_PMD mappings at level 2? That would be 32M for 4K
>> pages, so is likely to actaually get used. I think it would just be something like:
>>
>> u64 cmask = (level == 3) ? CONT_PTE_SIZE - 1 :
>>            ((level == 2) ? CONT_PMD_SIZE - 1 : U64_MAX) : U64_MAX;
>>
> 
> With this patch applied, it is guaranteed that cmask is only
> referenced if level >= 2, so we can simplify this as
> 
>   u64 cmask = (level < 3) ? CONT_PMD_SIZE - 1 : CONT_PTE_SIZE - 1;

Ahh good point.

> 
> (using the level < 3 for consistency with the protval assignment)
> 
>> Anyway, probably not worth the complexity for these boot-time tables, so regardless:
>>
> 
> They are created at boot time but these are not 'boot-time tables' -
> they are the ones that are used by the kernel at runtime. So I think
> it makes sense to add this.

Hmm, for some reason I thought everything was being remapped in map_mem(), but
looking again, I guess the kernel image mappings put down by map_range() remain.

I'll add a todo to send this out when I get around to it. Although I guess the
chances of having a portion of the text or data being 32M aligned and sized are
quite slim given the image only needs to be loaded on a 2M boundary?

> 
>> Reviewed-by: Ryan Roberts <ryan.roberts@arm.com>
>>
> 
> Thanks.


