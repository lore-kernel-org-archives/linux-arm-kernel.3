Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AFFFC43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 11:26:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nIFwBP0EGBHbhEwfwr9wVs5Q6iERo5W49/G1BVK7cj4=; b=jS4M+0QqBxCHGvnrpkkpDy5gSY
	kBaC2wKzPTEOxCz/8j1A9TjGhLLb3TDtMbcl9voyArCVLFrHlo/CESsvmbNfOXUn2tclvPgQR52Oy
	LPFY82mWY10fFiWpSeg/NCdtiC4AUN2Vc705gD0iNiYGfPJixtq49hSb8LeSpjh675G+YiDb59fQr
	zw/O5JP1xvsoHyJ62mdthDbysv3O+MIOA/H+RusVDx1OtktVGBZY2jWnvJgFxPfQBsk07iB71JoJm
	+T4VGKRfJjgxxykBYZxaUoqAyO2aM0G1Uj1UlLXANu8B5hNqOBWAnBPGOt16BgW+85NBNiX+rYK6X
	8ksRSBcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjEo2-0000000909W-15zZ;
	Mon, 13 Jul 2026 11:26:38 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjEnz-00000009095-2gXH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 11:26:37 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E5DA01595;
	Mon, 13 Jul 2026 04:26:27 -0700 (PDT)
Received: from [10.164.19.52] (unknown [10.164.19.52])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9D7B73F7B4;
	Mon, 13 Jul 2026 04:26:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783941992; bh=f/PVrQHdYmF9OX02pU+HEQKlDzEU/kXbQDeJccOAV1w=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=E8dmUmz5e6yop5fx3q/yDRatsJkKhD0pdOQM9+NUn1fjHGce7uXl6uz8hrr0yARqt
	 qbLyJloGggcsmfHO7TYN7+uemrN+3Acv4xOoYfsM/kpB1MgZE2fxd9i7Zd0NHzAomY
	 b9coHr7ycbD48LA0qmjoi28KLHR0KFJsYLGx21Dc=
Message-ID: <566226b9-db1d-41a2-aab2-4c4f0e0e1fe6@arm.com>
Date: Mon, 13 Jul 2026 16:56:24 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/18] Another attempt at HVO support on arm64
To: Muchun Song <muchun.song@linux.dev>,
 James Houghton <jthoughton@google.com>
Cc: Will Deacon <will@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
 Oscar Salvador <osalvador@suse.de>, Nikos Nikoleris
 <nikos.nikoleris@arm.com>, Linu Cherian <linu.cherian@arm.com>,
 Mark Rutland <mark.rutland@arm.com>, David Hildenbrand <david@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Ryan Roberts <ryan.roberts@arm.com>, Nanyong Sun <sunnanyong@huawei.com>,
 Yu Zhao <yuzhao@google.com>, Frank van der Linden <fvdl@google.com>,
 David Rientjes <rientjes@google.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org
References: <20260708031129.3503195-1-jthoughton@google.com>
 <3B2B37B5-16DE-4DB0-8A78-4CB8636C1A86@linux.dev>
 <CADrL8HXNoRA_cnR7KVPwN6zA32E744OKOfTmDMReoykzR39H8Q@mail.gmail.com>
 <9C56FB0F-AE0E-4975-9D89-AFF110433C49@linux.dev>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <9C56FB0F-AE0E-4975-9D89-AFF110433C49@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_042636_088308_CA1CC36B 
X-CRM114-Status: GOOD (  31.00  )
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



On 13/07/26 1:11 pm, Muchun Song wrote:
> 
> 
>> On Jul 13, 2026, at 12:59, James Houghton <jthoughton@google.com> wrote:
>>
>> On Thu, Jul 9, 2026 at 9:59 PM Muchun Song <muchun.song@linux.dev> wrote:
>>>> On Jul 8, 2026, at 11:11, James Houghton <jthoughton@google.com> wrote:
>>>>
>>>> Hi everyone,
>>>>
>>>> This patch series uses a trick with the Access Flag on CPUs that support
>>>> hardware update of the AF to update vmemmap page table entries without
>>>> introducing a time window where CPUs accessing the vmemmap might fault.
>>>
>>> Hi James,
>>>
>>> I was just looking into the Arm ARM specification regarding the TLB caching
>>> behavior to better understand the "AF trick" used here, and came across a few
>>> sections that got me a bit confused.
>>>
>>> Specifically, Section D8.5.1 [1] states Rule RDWZCQ:
>>>
>>>        "Descriptors with AF set to zero can never be cached in a TLB. For more
>>>         information about when translation table entries are permitted to be
>>>         cached in a TLB, see Translation Lookaside Buffers."
>>>
>>> This indeed seems to support the core assumption of the AF trick. However, when
>>> following the reference to Section D8.16 "Translation Lookaside Buffers" [2], it
>>> defines the following rule for permitted caching (RSQBCS):
>>>
>>>        "When address translation is enabled, a translation table entry for an
>>>         in-context translation regime that does not cause a Translation fault,
>>>         an Address size fault, or an Access flag fault is permitted to be cached
>>>         in a TLB or intermediate TLB caching structure as the result of an
>>>         explicit or speculative access."
>>>
>>> This is exactly where my confusion lies, as these two descriptions in the spec
>>> feel directly contradictory when FEAT_HAF(hardware management of the Access flag)
>>> is enabled.
>>
>> I don't think it intends to say that "translation table entries with
>> AF=0 may be cached" just because they don't cause Access flag faults.
>>
>> It is likely that this clause was written before FEAT_HAFDBS/FEAT_HAF
>> existed. Re-reading it with that in mind makes the meaning clearer:
>> PTEs with AF=1 may be cached if the architecture otherwise allows it.
>>
>> There is another clause, in D8.5 "Hardware updates of the translation
>> tables", I_RGQLZ: "If hardware does not update the AF from 0 to 1,
>> then the descriptor is not permitted to be cached in a TLB." I think
>> this supports my interpretation.
>>
>> I am convinced that it is impossible for an implementation not to
>> conform to Rule R_DWZCQ (PTEs with AF=0 cannot be cached) while
>> supporting HW AF correctly. Let me try to explain why.
>>
>> For HW AF to function correctly:
>> 1. Setting AF=1 must be done atomically, otherwise hardware could set
>> a bit in an invalid PTE. (This would break Linux swp_entrys.)
>> 2. The AF=0 translation cannot be used, otherwise we could
>> potentially drop AF updates.
>>
>> If an implementation used the translation before coherently setting
>> AF=1 to perform an architectural memory access, then it must choose
>> either to set AF=1 on a PTE that may have since changed (perhaps to an
>> invalid PTE) or drop the AF update entirely. Either way HW AF is
>> broken.
>>
>> Please also see I_GXGPN: "When the translation of an architecturally
>> executed memory access occurs, the architecture requires that AF is
>> set to 1."
> 
> Thanks for your excellent explanation.
> 
>>
>>> On one hand, Section D8.5.1 [1] explicitly uses the word "never" for AF=0
>>> descriptors. On the other hand, under FEAT_HAF, an entry with AF=0 does not cause
>>> an Access flag fault anymore, because the hardware is capable of updating the AF
>>> automatically. This technically makes it eligible for speculative caching under
>>> Rule RSQBCS in Section D8.16 [2].
>>>
>>> My question is: which part of the spec reflects the actual architectural intent
>>> when FEAT_HAF is enabled? Is an entry with AF=0 permitted to be speculatively
>>> cached in the TLB by the hardware under FEAT_HAF, or does the "never" in RDWZCQ
>>> still hold absolute priority?
>>>
>>> Please let me know if I have misread the specification or missed some overriding
>>> constraints here.
>>
>> Thanks for making me look a little harder into this; it's a good
>> question. I hope my reply above makes you more comfortable with the AF
> 
> At least to me, what you're saying makes sense.
> 
>> trick. I also hope to hear more from the Arm folks as well.
> 
> Yes, it would be best to have an ARM expert here to confirm that our
> understanding of the manual is completely accurate.
> 
> Thanks.
> 
>>
>> Thanks Muchun!
> 

Disclaimer: *NOT* an Arm expert, but it would also be good to prove the conjecture:

"If we guarantee that there is no caching structure holding a stale translation, then
we do not require BBM". Meaning, the only reason we do BBM is to prevent two execution
contexts from seeing two different translations, and such a situation can *only* happen
via TLB or intermediate caching structures.

D8.17.1, rule I_THWDH says:

"Use of a break-before-make sequence to ensure that old and new translation table entries
are never simultaneously visible to different execution threads is guaranteed to prevent
all of the following problems:

Creating multiple TLB entries that apply to the same address.

The effects of TLB caching breaking coherency.

The effects of TLB caching breaking single-copy atomicity properties.

The effects of TLB caching breaking ordering guarantees or uniprocessor semantics.

The effects of TLB caching causing a failure to clear the Exclusives monitors."


All these problems are derived from "TLB caching", so the conjecture seems to be true.

> 
> 


