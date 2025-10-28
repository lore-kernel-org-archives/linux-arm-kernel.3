Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2E40CCD1BF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Oct 2025 10:35:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5HaFRhf1AjitWDNq9/FJXcfd6yha35h050b//Tq74Pw=; b=gqrCQJckvIi1TZ4xK1OvqOb9fh
	f59d8GhqscQ6uYNjnq0JYwNn6+OuIO3Ci12/xU6lSz/r5esJtR/Eof51eYGKZ+Z24T096/vc0NQER
	PZIBa9UZWsDrkzkhFsnpKlNGgE5kFaexsqN4wLxa7DykKpvqfdEiFfHCMAPzGVjHUTkmi1dvWtepv
	iwbKji+GCdixOaSbKNlKX5ahK0DutN+8WGCqb1RsacH4bSnU41GiyZ7BtjvUiC2n1AFFbZFPwLRxf
	THK7ZOZAOVECobrHWIii7NVGWi1wydlUu5mvQeThrUqUTZv6w6UiOmKtPeX9GZ912jeHSibOyf0yU
	EvC4fEeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDh2T-0000000FlYB-1tti;
	Tue, 28 Oct 2025 10:34:53 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDh2Q-0000000FlXf-1ukF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Oct 2025 10:34:51 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 07A50106F;
	Tue, 28 Oct 2025 03:34:39 -0700 (PDT)
Received: from [10.44.160.74] (unknown [10.44.160.74])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3597D3F63F;
	Tue, 28 Oct 2025 03:34:39 -0700 (PDT)
Message-ID: <f3b8a71c-7698-4918-99d1-36e97bded97c@arm.com>
Date: Tue, 28 Oct 2025 11:34:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 06/13] mm: introduce generic lazy_mmu helpers
To: David Hildenbrand <david@redhat.com>, linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>,
 Andreas Larsson <andreas@gaisler.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Borislav Petkov
 <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 "David S. Miller" <davem@davemloft.net>, "H. Peter Anvin" <hpa@zytor.com>,
 Ingo Molnar <mingo@redhat.com>, Jann Horn <jannh@google.com>,
 Juergen Gross <jgross@suse.com>, "Liam R. Howlett"
 <Liam.Howlett@oracle.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Michal Hocko <mhocko@suse.com>,
 Mike Rapoport <rppt@kernel.org>, Nicholas Piggin <npiggin@gmail.com>,
 Peter Zijlstra <peterz@infradead.org>, Ryan Roberts <ryan.roberts@arm.com>,
 Suren Baghdasaryan <surenb@google.com>, Thomas Gleixner
 <tglx@linutronix.de>, Vlastimil Babka <vbabka@suse.cz>,
 Will Deacon <will@kernel.org>, Yeoreum Yun <yeoreum.yun@arm.com>,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org, x86@kernel.org
References: <20251015082727.2395128-1-kevin.brodsky@arm.com>
 <20251015082727.2395128-7-kevin.brodsky@arm.com>
 <73b274b7-f419-4e2e-8620-d557bac30dc2@redhat.com>
 <390e41ae-4b66-40c1-935f-7a1794ba0b71@arm.com>
 <f8d22ae0-4e36-4537-903f-28164c850fdb@redhat.com>
 <28bf77c0-3aa9-4c41-aa2b-368321355dbb@arm.com>
 <14030818-52e7-41eb-8ad7-602f3476d448@redhat.com>
Content-Language: en-GB
From: Kevin Brodsky <kevin.brodsky@arm.com>
In-Reply-To: <14030818-52e7-41eb-8ad7-602f3476d448@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_033450_595954_CB83623E 
X-CRM114-Status: GOOD (  27.79  )
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

On 27/10/2025 17:24, David Hildenbrand wrote:
> On 24.10.25 16:32, Kevin Brodsky wrote:
>> On 24/10/2025 15:27, David Hildenbrand wrote:
>>> On 24.10.25 14:13, Kevin Brodsky wrote:
>>>> On 23/10/2025 21:52, David Hildenbrand wrote:
>>>>> On 15.10.25 10:27, Kevin Brodsky wrote:
>>>>>> [...]
>>>>>>
>>>>>> * madvise_*_pte_range() call arch_leave() in multiple paths, some
>>>>>>      followed by an immediate exit/rescheduling and some followed
>>>>>> by a
>>>>>>      conditional exit. These functions assume that they are called
>>>>>>      with lazy MMU disabled and we cannot simply use
>>>>>> pause()/resume()
>>>>>>      to address that. This patch leaves the situation unchanged by
>>>>>>      calling enable()/disable() in all cases.
>>>>>
>>>>> I'm confused, the function simply does
>>>>>
>>>>> (a) enables lazy mmu
>>>>> (b) does something on the page table
>>>>> (c) disables lazy mmu
>>>>> (d) does something expensive (split folio -> take sleepable locks,
>>>>>       flushes tlb)
>>>>> (e) go to (a)
>>>>
>>>> That step is conditional: we exit right away if pte_offset_map_lock()
>>>> fails. The fundamental issue is that pause() must always be matched
>>>> with
>>>> resume(), but as those functions look today there is no situation
>>>> where
>>>> a pause() would always be matched with a resume().
>>>
>>> We have matches enable/disable, so my question is rather "why" you are
>>> even thinking about using pause/resume?
>>>
>>> What would be the benefit of that? If there is no benefit then just
>>> drop this from the patch description as it's more confusing than just
>>> ... doing what the existing code does :)
>>
>> Ah sorry I misunderstood, I guess you originally meant: why would we use
>> pause()/resume()?
>>
>> The issue is the one I mentioned in the commit message: using
>> enable()/disable(), we assume that the functions are called with lazy
>> MMU mode is disabled. Consider:
>>
>>    lazy_mmu_mode_enable()
>>    madvise_cold_or_pageout_pte_range():
>>      lazy_mmu_mode_enable()
>>      ...
>>      if (need_resched()) {
>>        lazy_mmu_mode_disable()
>>        cond_resched() // lazy MMU still enabled
>>      }
>>
>> This will explode on architectures that do not allow sleeping while in
>> lazy MMU mode. I'm not saying this is an actual problem - I don't see
>> why those functions would be called with lazy MMU mode enabled. But it
>> does go against the notion that nesting works everywhere.
>
> I would tackle it from a different direction: if code calls with lazy
> MMU enabled into random other code that might sleep, that caller would
> be wrong.
>
> It's not about changing functions like this to use pause/resume.
>
> Maybe the rule is simple: if you enable the lazy MMU, don't call any
> functions that might sleep.

You're right, this is a requirement for lazy MMU. Calling enable() then
disable() means returning to the original state, and if the function
sleeps at that point then the caller must not itself enable lazy MMU.

I mixed up that case with the original motivation for pause()/resume(),
which is to temporarily pause any batching. This is considered an
implementation detail and the caller isn't expected to be aware of it,
hence the need for that use-case to work regardless of nesting.

> Maybe we could support that later by handling it before/after
> sleeping, if ever required?

Indeed, pause()/resume() could be used to allow functions that sleep to
be called with lazy MMU enabled. But that's only a hypothetical use-case
for now.

> Or am I missing something regarding your point on pause()/resume()?

Doesn't sound like it :) I'll remove that paragraph from the (already
long) commit message. Thanks!

- Kevin

