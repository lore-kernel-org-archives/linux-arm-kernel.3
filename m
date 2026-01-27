Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7161CD2D8DA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Jan 2026 10:04:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Hp+TTvw8edYCKTipUaExrNryIrTxMO7JlP9MrjW4Ydw=; b=uPJ0npEDAXqqRCG3RtzDs1nbA6
	gxqRO2QxXjoR14mpxzjbos18NOyAFZgtkNewr3s7/lFH/qFLFVK5csO08WmXACxj5rB6Se3284CbV
	r9HPrlhqMZ4QzJ3KaZX6tSsSXkHdLtnOYiAVC2ynM9ELbEcCyec5rOAOQoGG6XiUPOyNUT3cZ3o69
	yuTOR+wot+QJEaT2sNPBL5vSwfb+cSiPBspPmkZ3MXvA2FerkDskoa+k7GgnnUFf0MH3apwGPXDaf
	d6rNFK2JzK7shi9rnsGHiFH59GCkdlGWBO7G4ilU6aLvbJwUduSXdnE8dnEcV78AErrRGiLhV9vHX
	/X8SIhNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkfvX-0000000E0yC-23Fg;
	Tue, 27 Jan 2026 10:04:03 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkfvU-0000000E0xa-33gh
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Jan 2026 10:04:01 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2672F1655;
	Tue, 27 Jan 2026 02:03:53 -0800 (PST)
Received: from [10.57.94.246] (unknown [10.57.94.246])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D4FF23F73F;
	Tue, 27 Jan 2026 02:03:57 -0800 (PST)
Message-ID: <427d39c1-ab02-4a66-a0ba-d4fb98ab72d6@arm.com>
Date: Tue, 27 Jan 2026 10:03:56 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/10] arm64: Move the zero page to rodata
Content-Language: en-GB
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Ard Biesheuvel <ardb+git@google.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, will@kernel.org,
 catalin.marinas@arm.com, mark.rutland@arm.com,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Liz Prucka <lizprucka@google.com>, Seth Jenkins <sethjenkins@google.com>,
 Kees Cook <kees@kernel.org>, linux-hardening@vger.kernel.org
References: <20260126092630.1800589-12-ardb+git@google.com>
 <20260126092630.1800589-13-ardb+git@google.com>
 <3d59a8d9-a382-48d8-b79c-f5c23e86c1b7@arm.com>
 <CAMj1kXF4k9EstLkxdNje_rwTehdu2MYvyh7n+4GoMWNcjcHYcA@mail.gmail.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <CAMj1kXF4k9EstLkxdNje_rwTehdu2MYvyh7n+4GoMWNcjcHYcA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_020400_834351_FFDBD6A6 
X-CRM114-Status: GOOD (  17.56  )
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

On 27/01/2026 09:49, Ard Biesheuvel wrote:
> On Tue, 27 Jan 2026 at 10:34, Ryan Roberts <ryan.roberts@arm.com> wrote:
>>
>> On 26/01/2026 09:26, Ard Biesheuvel wrote:
>>> From: Ard Biesheuvel <ardb@kernel.org>
>>>
>>> The zero page should contain only zero bytes, and so mapping it
>>> read-write is unnecessary. Combine it with reserved_pg_dir, which lives
>>> in the read-only region of the kernel, and already serves a similar
>>> purpose.
>>>
>>> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
>>> ---
>>>  arch/arm64/kernel/vmlinux.lds.S | 1 +
>>>  arch/arm64/mm/mmu.c             | 3 +--
>>>  2 files changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/arch/arm64/kernel/vmlinux.lds.S b/arch/arm64/kernel/vmlinux.lds.S
>>> index ad6133b89e7a..b2a093f5b3fc 100644
>>> --- a/arch/arm64/kernel/vmlinux.lds.S
>>> +++ b/arch/arm64/kernel/vmlinux.lds.S
>>> @@ -229,6 +229,7 @@ SECTIONS
>>>  #endif
>>>
>>>       reserved_pg_dir = .;
>>> +     empty_zero_page = .;
>>>       . += PAGE_SIZE;
>>>
>>>       swapper_pg_dir = .;
>>
>> Isn't there a magic macro for getting from swapper to reserved? That will need
>> updating?
>>
> 
> Why? This just adds an alias to refer to the same allocation.

Oh yes, sorry I completely missed that. And you've even stated it in the commit
log...

I'm struggling to see where this gets zeroed though? I assume it must be zeroed
before the old empty_zero_page would have been so everything works fine?

Assuming yes, then:

Reviewed-by: Ryan Roberts <ryan.roberts@arm.com>

> 
>> /*
>>  *  Open-coded (swapper_pg_dir - reserved_pg_dir) as this cannot be calculated
>>  *  until link time.
>>  */
>> #define RESERVED_SWAPPER_OFFSET (PAGE_SIZE)
>>
>>
>>> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
>>> index 9ae7ce00a7ef..c36422a3fae2 100644
>>> --- a/arch/arm64/mm/mmu.c
>>> +++ b/arch/arm64/mm/mmu.c
>>> @@ -66,9 +66,8 @@ long __section(".mmuoff.data.write") __early_cpu_boot_status;
>>>
>>>  /*
>>>   * Empty_zero_page is a special page that is used for zero-initialized data
>>> - * and COW.
>>> + * and COW. Defined in the linker script.
>>>   */
>>> -unsigned long empty_zero_page[PAGE_SIZE / sizeof(unsigned long)] __page_aligned_bss;
>>>  EXPORT_SYMBOL(empty_zero_page);
>>
>> What's the benefit of giving it it's own place in the linker script vs just
>> declaring it as const and having it placed in the rodata?
>>
> 
> Because it collapses the two into one.


