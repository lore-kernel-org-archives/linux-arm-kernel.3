Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FE80C79FA0
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 07:57:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ma+mFCgoYbRSkO4lzGlVywj7XE2OvoCA5cruK0muWnI=; b=ij/SuccSySiY7zz50nIVmy/OZ9
	8QSzGhRBJSBot8Pqr2q5EegVSK0p4cEI8kW1/Ap9De+UNBL5QxQmIdrlpPuOz4OqY3IspnBmCMss9
	cymigHeAuplLVSwcYZGRmkxivf9FIBSyduq3xlLw2Rd27uTAOWKVOQEVa3Z/Hc5Vls5tIfY1oUQCK
	YcjUSF1dlb6EoehBGyhN+qjsVnu0JrAzYXXUXNlGAOc2oOJPpVK6sbjp+0vaSrhcLIY0nQkg2XQ16
	jFk+j2kUSlNQIz81O9pd2mh8TzRUkpttpt7LZk+FEY1LZHImLN1oh0dzO2NSpjIHh/1EBaQYd0Dax
	88jkjWHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3qhI-00000008KJ3-23Y9;
	Tue, 08 Sep 2026 07:56:52 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3qhF-00000008KHt-1z6W
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 07:56:51 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 05D481476;
	Tue,  8 Sep 2026 00:56:44 -0700 (PDT)
Received: from [10.57.7.202] (unknown [10.57.7.202])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BB6103F7B4;
	Tue,  8 Sep 2026 00:56:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788854207; bh=tyTMzc4GV2AlBvA4IuooTzoNnkFoUmCDUhN8ggZWWj8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=jdRx7fMH8y/8SjQtBWsAyKGnlWKhka91XM+0ttgZRxZUt05saVGYmoW+5NPUnpOik
	 qk5K3mM76wuYMM3UXnzw0pT13RgzGtDA9+p8jQuMqhBx2VCxhgr+U6HHxUNgLIXG9K
	 irLwzniJADXX4YscI7ljRAYKqrNXAAnu1h/f0x5c=
Message-ID: <ba80aecd-85a2-4036-8d53-009f476f8e61@arm.com>
Date: Tue, 8 Sep 2026 09:56:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v9 00/25] pkeys-based page table hardening
To: Linu Cherian <linu.cherian@arm.com>
Cc: linux-hardening@vger.kernel.org, Andrew Morton
 <akpm@linux-foundation.org>, Andy Lutomirski <luto@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 "David Hildenbrand (Arm)" <david@kernel.org>, Jann Horn <jannh@google.com>,
 Jeff Xu <jeffxu@chromium.org>, Joey Gouly <joey.gouly@arm.com>,
 Kees Cook <kees@kernel.org>, Linus Walleij <linusw@kernel.org>,
 Marc Zyngier <maz@kernel.org>, Mark Brown <broonie@kernel.org>,
 Matthew Wilcox <willy@infradead.org>, Maxwell Bland <mbland@motorola.com>,
 "Mike Rapoport (IBM)" <rppt@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>,
 Pierre Langlois <pierre.langlois@arm.com>,
 =?UTF-8?Q?Pierre-Cl=C3=A9ment_Tosi?= <ptosi@google.com>,
 Quentin Perret <qperret@google.com>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>,
 Ryan Roberts <ryan.roberts@arm.com>, Vlastimil Babka <vbabka@kernel.org>,
 Will Deacon <will@kernel.org>, Yang Shi <yang@os.amperecomputing.com>,
 Yeoreum Yun <yeoreum.yun@arm.com>, linux-arm-kernel@lists.infradead.org,
 linux-mm@kvack.org, x86@kernel.org, Ira Weiny <iweiny@kernel.org>,
 Lorenzo Stoakes <ljs@kernel.org>, Thomas Gleixner <tglx@kernel.org>
References: <20260818-kpkeys-v9-0-743ad31b2c8f@arm.com>
 <apbgDNjQPLBdsUe0@a079125.arm.com>
 <43382882-0e7b-4255-9c34-99cec5b0bbbc@arm.com>
 <ap6rvQJbO8DH57v8@a079125.arm.com>
From: Kevin Brodsky <kevin.brodsky@arm.com>
Content-Language: en-GB
In-Reply-To: <ap6rvQJbO8DH57v8@a079125.arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_005649_710187_8645AADD 
X-CRM114-Status: GOOD (  31.63  )
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

On 07/09/2026 14:19, Linu Cherian wrote:
> On Thu, Sep 03, 2026 at 06:47:50PM +0200, Kevin Brodsky wrote:
>>>> [...]
>>>>
>>>> kpkeys
>>>> ======
>>>>
>>>> The use of pkeys involves two separate mechanisms: assigning a pkey to
>>>> pages, and defining the pkeys -> permissions mapping via the pkey
>>>> register. This is implemented through the following interface:
>>>>
>>>> - Pages are assigned a pkey in the linear map using set_memory_pkey().
>>>>   This is sufficient for this series, but it is also plausible for
>>>>   higher-level allocators to support marking allocations with a given
>>>>   pkey.
>>>>
>>>> - The pkey register is configured based on a *kpkeys context*. kpkeys
>>>>   contexts are represented as simple integers that correspond to a given
>>>>   configuration, for instance:
>>>>
>>>>   KPKEYS_CTX_DEFAULT:
>>>>         RW access to KPKEYS_PKEY_DEFAULT
>>>>         RO access to any other KPKEYS_PKEY_*
>>>>
>>>>   KPKEYS_CTX_<FEAT>:
>>>>         RW access to KPKEYS_PKEY_DEFAULT
>>>>         RW access to KPKEYS_PKEY_<FEAT>
>>>>         RO access to any other KPKEYS_PKEY_*
>>>>
>>>>   Only pkeys that are managed by the kpkeys framework are impacted;
>>>>   permissions for other pkeys are left unchanged (this allows for other
>>>>   schemes using pkeys to be used in parallel, and arch-specific use of
>>>>   certain pkeys).
>>> - Adding some basic details on what a scheme and context is quite helpful.
>>>
>>>  - Giving some hints (may be an example) on how multiple schemes and multiple contexts
>>>   play together would be quite helpful.
>> "scheme" doesn't mean anything precise, it's only the notion that pkeys
>> that aren't reserved for kpkeys (i.e. anything but 0 or 1 in this
>> series) may be used for other purposes. Happy to reword if you have a
>> suggestion.
> Got it. IMHO, adding two definitions towards the start would make it easier to follow.
>
> kpkeys: Set of pkeys reserved and managed by the kpkeys framework.
>         Pkeys outside this set are left untouched.
>
> kpkeys context: A permission state that defines the permissions for each pkey owned by
>  	kpkeys
>
> Or something better.

Got it, will add something along those lines, thanks!

>>> [...]
>>>> Open questions
>>>> ==============
>>>>
>>>> A few aspects in this RFC that are debatable and/or worth discussing:
>>>>
>>>> - There is currently no restriction on how kpkeys contexts map to pkeys
>>>>   permissions. A typical approach is to allocate one pkey per context and
>>>>   make it writable in that context only. As the number of contexts
>>> Probably to avoid the assumption, may be we can we have something like
>>> below 
>>>
>>> For a pkey P, we could define
>>> PKEY_P_PERM_CTXT_OTHERS	 //permission for pkey p in other contexts
>>> PKEY_P_PERM_CTXT_SELF	 //permission for pkey p in self context
>>>
>>> With the assumption of one pkey mapped for every context,
>>> the permission for the default context would look something like,
>>>
>>> PKEY_DEF_PERM_CTXT_SELF << PKEY_DEF_PKEY_SHIFT |
>>> PKEY_CT0_PERM_CTXT_OTHERS << PKEY_CT0_PKEY_SHIFT | 
>>> PKEY_CT1_PERM_CTXT_OTHERS << PKEY_CT1_PKEY_SHIFT |
>>> ...(for all valid contexts)
>>>
>>> where,
>>> Permission key, PKEY_DEF is associated with context DEFAULT,
>>> Permission key, PKEY_CT0 is associated with context CT0,
>>> Permission key, PKEY_CT1 is associated with context CT1
>> This adds assumptions rather than avoiding them. *Typically* when adding
>> a context you'd allocate a pkey that's only writable by this context,
>> but it doesn't have to be this way.
> Okay agree. Then may be something like
>
> Define permissions:
>
> For default context,
> KPKEYS_CTX_DEFAULT_PERM_PKEY_DEF
> KPKEYS_CTX_DEFAULT_PERM_PKEY_CT0
>
> For CT0 context,
> KPKEYS_CTX_CT0_PERM_PKEY_DEF
> KPKEYS_CTX_CT0_PERM_PKEY_CT0
>
> Define POR_EL1:
>
> For default context,
> KPKEYS_POR_EL1_DEFAULT
>
> For CT0 context,
> KPKEYS_POR_EL1_CT0
>
> Finally,
> #define POR_EL1_INIT KPKEYS_POR_EL1_DEFAULT

We cannot do this because POR_EL1 is arm64-specific and its format is
not at all the same as x86's PKRS for instance.

I think what you're getting at is that the permissions for each pkeys in
a given context could be defined at the generic level. This could be
done, but I'm not sure this is essential, and we may not need all archs
to use exactly the same permissions. There's also the issue that x86
only encodes RW permissions directly, not X.

> Probably using something similar would make the idea of kpkeys context 
> more evident in the code as well ?
>
>> The configuration space is more easily understood by considering the
>> other use-cases we've investigated (struct cred protection and eBPF
>> isolation, linked further down). For instance, for cred protection, we
>> had KPKEYS_LVL_UNRESTRICTED with write access to all pkeys, and for eBPF
>> isolation, we need a level that is less privileged and therefore does
>> *not* have write access to pkey 0.
>>
>>>>   increases, we may however run out of pkeys, especially on arm64 (just
>>>>   8 pkeys with POE). Depending on the use-cases, it may be acceptable to
>>>>   use the same pkey for the data associated to multiple contexts.
>>> Lets say two contexts A and B, use the same pkey P as their permission matches.
>>> But then, when we enter context A, permission for pkey P gets
>>> relaxed, then that would relax permission for pages associated with
>>> context B as well which is unintended ?
>> That may be exactly what is intended, it all depends on the use-case. C1
>> may have a private pkey P1, and C2 P2, and then P3 that is shared by C1
>> and C2 (writable by both)
> Got it. With each context defining permissions for each pkey owned by
> kpkeys makes sense. 
>
> Also do we need to assume that nesting of different contexts is not valid ?
> For example,
> Default context:
> 	enter CTX 0
> 		enter CTX 1
> 		leave CTX 1
> 	leave CTX 0
> Default context:

That is a good question. The enter/leave logic does support nesting,
since leave() restores the pkeys register as it was on enter(), but
whether the inner context has sufficient permissions will depend on the
situation. Certainly if nesting is expected then it has to be taken into
account when defining the permissions for each context.

- Kevin

