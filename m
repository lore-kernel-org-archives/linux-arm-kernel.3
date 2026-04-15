Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EA50F4384E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Apr 2026 15:48:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l7eo5PnigErr5A+bIS4XNb3qrzb+gPfedlXxBhsCZHM=; b=ypvYbp0vuKcmMRab7RamD/PbFi
	yCcpJQHYP4HzI41cRiViY7HvJ3k0aB9JO0LO55Ktc5xE8PRtdTtR/Ca2Tk2zXfTGl9N4ELcbQetrO
	Y4tBzxnF33OSdblfcuTr2hRoAK1RASAPy5PKIKk9famj06YoTMxFi5wqccDuUS/OAbE6wZ6gB5b3t
	02/89g3bijpwdyQLbviR8RvubgFc9370RIHNcxWjRnb3xJFosjWoB6ByL4zxd+i1ozeuLuNiAE3o7
	wn0PjeEBY2XLiUEb2zbAJrYs/LY2FQrWsrq7mER5DF25Qq5yMJOX+Cax8IYJfChm72YxChN4ZKz3+
	47iKnrug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wD2Ty-00000001LJL-1E0t;
	Wed, 15 Apr 2026 15:48:50 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wD2Tv-00000001LIq-0PFR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Apr 2026 15:48:48 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 25CC03543;
	Wed, 15 Apr 2026 08:48:37 -0700 (PDT)
Received: from [10.57.61.135] (unknown [10.57.61.135])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3C78A3F7B4;
	Wed, 15 Apr 2026 08:48:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1776268122; bh=q7BNlaChEu4Coq4O1gsyhmPwaN89GJg8i1jtXzMvv/k=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=DMbIgYaFwTOq3fm0mM1HfV3aAfyVqPNkHo/C7xTdVgjWROMvy8UUGutiPoWK/C704
	 LZRQQZ8yCINbuJve20sIyA//d6Qugq0C8eTCbtk0LniDtNwhtgrcj/bsxqVTevq7wl
	 l+N3deWQkSGe/IRCBoxRG46gZ3h9RqlhJmkqjyco=
Message-ID: <7d46b6f7-239b-40e0-a488-045b56b45c1e@arm.com>
Date: Wed, 15 Apr 2026 17:48:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 00/30] pkeys-based page table hardening
To: "David Hildenbrand (Arm)" <david@kernel.org>,
 linux-hardening@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Andy Lutomirski <luto@kernel.org>, Catalin Marinas
 <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>,
 Ira Weiny <ira.weiny@intel.com>, Jann Horn <jannh@google.com>,
 Jeff Xu <jeffxu@chromium.org>, Joey Gouly <joey.gouly@arm.com>,
 Kees Cook <kees@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Marc Zyngier <maz@kernel.org>,
 Mark Brown <broonie@kernel.org>, Matthew Wilcox <willy@infradead.org>,
 Maxwell Bland <mbland@motorola.com>, "Mike Rapoport (IBM)"
 <rppt@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Pierre Langlois <pierre.langlois@arm.com>,
 Quentin Perret <qperret@google.com>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>,
 Ryan Roberts <ryan.roberts@arm.com>, Thomas Gleixner <tglx@linutronix.de>,
 Vlastimil Babka <vbabka@suse.cz>, Will Deacon <will@kernel.org>,
 Yang Shi <yang@os.amperecomputing.com>, Yeoreum Yun <yeoreum.yun@arm.com>,
 linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org, x86@kernel.org
References: <20260227175518.3728055-1-kevin.brodsky@arm.com>
 <1c8e2cd6-4b50-4891-8a2d-6a45623e805f@kernel.org>
From: Kevin Brodsky <kevin.brodsky@arm.com>
Content-Language: en-GB
In-Reply-To: <1c8e2cd6-4b50-4891-8a2d-6a45623e805f@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260415_084847_236412_D42E03B8 
X-CRM114-Status: GOOD (  38.93  )
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

On 15/04/2026 14:48, David Hildenbrand (Arm) wrote:
> On 2/27/26 18:54, Kevin Brodsky wrote:
>> NEW in v6: support for large block mappings through a dedicated page table
>> allocator (patch 14-17)
> Heh, I had to read till the very end to realize that this is an RFC, and
> then saw your other mail.
>
> I can recommend using b4 for patch management, where you can configure a
> sticky prefix through
>
> 	b4 prep --set-prefixes RFC
>
> And using "b4 send" to automate all the rest.

I certainly should... sorry for the confusion!

>> Threat model
>> ============
>>
>> The proposed scheme aims at mitigating data-only attacks (e.g.
>> use-after-free/cross-cache attacks). In other words, it is assumed that
>> control flow is not corrupted, and that the attacker does not achieve
>> arbitrary code execution. Nothing prevents the pkey register from being
>> set to its most permissive state - the assumption is that the register
>> is only modified on legitimate code paths.
>>
>> A few related notes:
>>
>> - Functions that set the pkey register are all implemented inline.
>>   Besides performance considerations, this is meant to avoid creating
>>   a function that can be used as a straightforward gadget to set the
>>   pkey register to an arbitrary value.
>>
>> - kpkeys_set_level() only accepts a compile-time constant as argument,
>>   as a variable could be manipulated by an attacker. This could be
>>   relaxed but it seems unlikely that a variable kpkeys level would be
>>   needed in practice.
>>
> I see a lot of value for that also as a debugging mechanism. I hear that
> other people had private patches that would attempt to only map leaf
> pages in the direct map in pte_offset_map_lock() and friends. I assume
> there are some tricky bits to that (concurrent access to page tables).

Indeed, this should be a much better solution, not only because it means
a lot fewer TLBIs, but also because it is truly per-thread (so
concurrency is not a concern).

> What's the general take regarding the thread model you describe vs. MTE?

I'd say quite similar, although corrupting pointers (specifically the
tag bits) remains possible in a data-only attack, while corrupting the
POR_EL1 register would require some control flow hijack (only constant
values are written to POR_EL1).

> Regarding use-after-free, I'd assume KASAN would achieve something
> similar. And with MTE "reasonably" fast. Or what is the biggest
> difference you see, there?

For use-after-free specifically, yes that sounds about right.

> I'd assume that one difference would be, that not even match-all
> pointers could accidentally modify page tables.

Yep that's pretty much what I tried to say above - with pkeys you have
to corrupt a system register to bypass the protection.

> In the future, would you think that both mechanisms (pkey PT table
> protection + KASAN) would be active at the same time, or wouldn't there
> really be a lot of value in having both enabled?

I think these are fairly orthogonal, KASAN gives you probabilistic
spatial+temporal safety for most allocations, while kpkeys restricts
access to key data to a small set of functions. I don't think one
reduces the usefulness of the other. Of course KASAN makes it harder to
use an arbitrary pointer to write to page tables, but kpkeys gives a
clear guarantee (assuming CFI is preserved).

> [...]
>
>>
>> Open questions
>> ==============
>>
>> A few aspects in this RFC that are debatable and/or worth discussing:
>>
>> - Can the pkeys block allocator be abstracted into something more
>>   generic? This seems desirable considering other use-cases for changing
>>   attributes of regions of the linear map, but the handling of page
>>   tables while splitting may be difficult to integrate in a generic
>>   allocator.
>>
>> - There is currently no restriction on how kpkeys levels map to pkeys
>>   permissions. A typical approach is to allocate one pkey per level and
>>   make it writable at that level only. As the number of levels
>>   increases, we may however run out of pkeys, especially on arm64 (just
>>   8 pkeys with POE). Depending on the use-cases, it may be acceptable to
>>   use the same pkey for the data associated to multiple levels.
>>
>>
>> Any comment or feedback is highly appreciated, be it on the high-level
>> approach or implementation choices!
> How crucial would the dedicated page table allocator be for a first up
> streamed version?
>
> Assuming we introduce this as a debugging feature first, it would be
> perfectly reasonable to just disallow large block mappings in the direct
> map when enabled.
>
> That means, we could merge basic support first and think about how to
> deal with page tables in a different way with most of the pkey details
> out of the picture.

I think that makes perfect sense, at least on arm64 where it's just a
matter of configuring force_pte_mapping() appropriately. I'm not sure
whether there is such an option on x86, though.

- Kevin

