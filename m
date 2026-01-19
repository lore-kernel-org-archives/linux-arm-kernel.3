Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94803D29C43
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 16:51:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YPJV4ZT80g36/R8dj478UVP7QfT7LV1drr0hq4nmf8A=; b=y4dJ7fcYJph8RdVu+v8nlRq+IP
	uVevUPS7nyb2Fd5M4NTWpJWf5QR+vly551S8WJ4XLUr5eklpIX4pXXHsV6jX90q/hEwNpD2hkiSM9
	k2BE3tDzbS5HP7e9w8TK33NCTO6Ovt7IiMzw9zenOYEvdPGGCB4GucFljdnIAinASmc+NA6kdyOyg
	rjoJg2/uIJ6/Ad+C+hZGxzDe7gN8BkDPuELBRHUe3RzFJdHMm5TfzrzyCuxWtUOBIntMbGZDrgpMk
	+/DGnwqcEw4T+KlB4JAd3XmEmUg3Eq81HzUxJJRck9jk5qCr5250AoJ+HW6o0LGtZmgUCulZDLWNY
	IDxEny0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhsTh-00000002YNF-3nJr;
	Mon, 19 Jan 2026 16:51:45 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhsTc-00000002YKu-1X4J;
	Mon, 19 Jan 2026 16:51:43 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A7A4B497;
	Mon, 19 Jan 2026 08:51:32 -0800 (PST)
Received: from [10.57.93.204] (unknown [10.57.93.204])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CAE0C3F632;
	Mon, 19 Jan 2026 08:51:33 -0800 (PST)
Message-ID: <31187502-2a11-4ef3-82b4-927a271d8b44@arm.com>
Date: Mon, 19 Jan 2026 16:51:32 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] randomize_kstack: Maintain kstack_offset per task
Content-Language: en-GB
To: Dave Hansen <dave.hansen@intel.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Huacai Chen <chenhuacai@kernel.org>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Mark Rutland <mark.rutland@arm.com>,
 "Jason A. Donenfeld" <Jason@zx2c4.com>, Ard Biesheuvel <ardb@kernel.org>,
 Jeremy Linton <jeremy.linton@arm.com>,
 David Laight <david.laight.linux@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-hardening@vger.kernel.org, stable@vger.kernel.org
References: <20260119130122.1283821-1-ryan.roberts@arm.com>
 <20260119130122.1283821-2-ryan.roberts@arm.com>
 <85d0d013-eca2-4b9f-bee3-d583d0eeb99e@intel.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <85d0d013-eca2-4b9f-bee3-d583d0eeb99e@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_085140_585299_F577672A 
X-CRM114-Status: GOOD (  21.03  )
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

Thanks for the review!

On 19/01/2026 16:10, Dave Hansen wrote:
> On 1/19/26 05:01, Ryan Roberts wrote:
> ...
>> Cc: stable@vger.kernel.org
> 
> Since this doesn't fix any known functional issues, if it were me, I'd
> leave stable@ alone. It isn't clear that this is stable material.

I listed 2 issues in the commit log; I agree that issue 1 falls into the
category of "don't really care", but issue 2 means that kstack randomization is
currently trivial to defeat. That's the reason I thought it would valuable in
stable.

But if you're saying don't bother and others agree, then this whole patch can be
dropped; this is just intended to be the backportable fix. Patch 3 reimplements
this entirely for upstream.

I'll wait and see if others have opinions if that's ok?

> 
>> --- a/include/linux/sched.h
>> +++ b/include/linux/sched.h
>> @@ -1591,6 +1591,10 @@ struct task_struct {
>>  	unsigned long			prev_lowest_stack;
>>  #endif
>>  
>> +#ifdef CONFIG_RANDOMIZE_KSTACK_OFFSET
>> +	u32				kstack_offset;
>> +#endif
>> +
>>  #ifdef CONFIG_X86_MCE
>>  	void __user			*mce_vaddr;
> 
> Nit: This seems to be throwing a u32 potentially in between a couple of
> void*/ulong sized objects.

Yeah, I spent a bit of time with pahole but eventually concluded that it was
difficult to find somewhere to nestle it that would work reliably cross arch.
Eventually I just decided to group it with other stack meta data.

> 
> It probably doesn't matter with struct randomization and it's really
> hard to get right among the web of task_struct #ifdefs. But, it would be
> nice to at _least_ nestle this next to another int-sized thing.
> 
> Does it really even need to be 32 bits? x86 has this comment:
> 
>>         /*
>>          * This value will get limited by KSTACK_OFFSET_MAX(), which is 10
>>          * bits. The actual entropy will be further reduced by the compiler
>>          * when applying stack alignment constraints (see cc_stack_align4/8 in
>>          * arch/x86/Makefile), which will remove the 3 (x86_64) or 2 (ia32)
>>          * low bits from any entropy chosen here.
>>          *
>>          * Therefore, final stack offset entropy will be 7 (x86_64) or
>>          * 8 (ia32) bits.
>>          */

For more recent kernels it's 6 bits shifted by 4 for 64-bit kernels or 8 bits
shifted by 2 for 32-bit kernels regardless of arch. So could probably make it
work with 8 bits of storage. Although I was deliberately trying to keep the
change simple, since it was intended for backporting. Patch 3 rips it out.

Overall I'd prefer to leave it all as is. But if people don't think we should
backport, then let's just drop the whole patch.

Thanks,
Ryan



