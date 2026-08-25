Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14AE5C61DBD
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Aug 2026 17:31:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=04CpkzbiEoICxEKBbgMU81/tFeL/A91PGW+X3zhDp90=; b=DWgdeUd7p2hs/gBSbHR/UsOrvo
	cVcNa6x0W1s2mLSsfhnzMYZBCgbh9JgEqJBBKKM8uck8d/7Lxn2fp2d8h2ZPEgibiUTaQUC2UuxkO
	LboaCboi5sdWMG67RiuikaRl14oGvklkcoulAX5bT/ZocgiP9jj7w9/UzwP2YhbvasgYRNnfqkyT/
	hodHrEBVlHS32XfU/A/kXY7fbWuwsv2+KkEAoowkdSXj82T2KT5Nwb8C62IxcKVbKmZDNGnQHXeXW
	gzZnFKe1C+Cu7ojWjHO3h2twoszqTqHsdLsF565qY30ngyPMUgLhbIl2Rp8uSP/mBxKplDaUc+DSa
	nX8ZP6YA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyuzM-00000001Dj0-3QsJ;
	Tue, 25 Aug 2026 17:31:08 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyuzL-00000001Dit-2RjH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Aug 2026 17:31:07 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id EF54440A3A;
	Tue, 25 Aug 2026 17:31:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E2211F000E9;
	Tue, 25 Aug 2026 17:31:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787679066;
	bh=04CpkzbiEoICxEKBbgMU81/tFeL/A91PGW+X3zhDp90=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=YRfu+6ukb1VM86ikc9R8sbiXAKWHu0SLsdrJufTpyd3kzO42v/lg62vUqGq68Vp/a
	 bd0CdGOxtUiJb6YEU3MMvBpXrlg9phSQCzZ928hKcQd/J1MVUBql+ouv7N+ITujpXA
	 p4iRf6iR1dpepLcKHVmb+T1erfGn3zOw1QcfIpmqthOOI4LPHKmLMV9O6aEMkKJYOK
	 o9qUKhKKOhu2dOdx3c16hq4H8KKBed5AXZAFvf0laRvkFWlAmqKfSrLuLR3bUFAiLl
	 M9/49EJpge7at/J2+TmvPkT3I0wuCnECI5fl+CgGUgXSblLF2biNj3YIMJAKH7s12F
	 SfCc0MbyrnFJw==
Message-ID: <26e6340e-9551-4d18-b6d7-86cd400a5b88@kernel.org>
Date: Tue, 25 Aug 2026 19:30:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/3] x86/mm: add set_direct_map_ro_noflush()
To: Dave Hansen <dave.hansen@intel.com>,
 Xueyuan Chen <xueyuan.chen21@gmail.com>, akpm@linux-foundation.org
Cc: ljs@kernel.org, usama.arif@linux.dev, catalin.marinas@arm.com,
 will@kernel.org, linux-arm-kernel@lists.infradead.org, tglx@kernel.org,
 mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org,
 hpa@zytor.com, rppt@kernel.org, ryan.roberts@arm.com, ziy@nvidia.com,
 baohua@kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 Lance Yang <lance.yang@linux.dev>
References: <20260730090647.2401252-1-xueyuan.chen21@gmail.com>
 <20260730090647.2401252-4-xueyuan.chen21@gmail.com>
 <2931f8a6-3780-4d6a-b19d-61cbbdad1a3a@intel.com>
 <1e04196a-7079-4a8d-a1b7-844e60d08728@kernel.org>
 <687afc72-5b6a-4138-8d33-fe5b6b7aef00@intel.com>
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <687afc72-5b6a-4138-8d33-fe5b6b7aef00@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

On 8/25/26 18:57, Dave Hansen wrote:
> On 8/25/26 09:43, David Hildenbrand (Arm) wrote:
>>> int set_direct_map_invalid_noflush(struct page *page)
>>> int set_direct_map_default_noflush(struct page *page)
>>> int set_direct_map_valid_noflush(struct page *page, unsigned nr, ...
>>> int set_direct_map_ro_noflush(const void *addr, unsigned long nr_pages)
>>>
>>> Which one of these things is not like the other, despite being named
>>> just like them?
>>>
>> That's called out in the cover letter:
>>
>> "
>> This series adds set_direct_map_ro_noflush() so mm code can make a
>> direct-map range read-only, then uses it for the persistent huge zero
>> folio. The helper is direct-map specific, takes an address-based range as
>> discussed for set_direct_map* helpers[2], and leaves TLB invalidation to
>> the caller.
>> "
> 
> My concern is not so much what the function is doing or whether or how
> the specific function is documented. It's more about whether the new
> function is consistent across all functions with a similar purpose and
> name. Also, if it is _not_ consistent there needs to be reasoning behind
> the inconsistency. I think that is missing here.

Yes, the intend from the submitter was to prepare for the interface change to
keep them consistent.

I agree that for now it should just consume pages instead of an address and keep
the interface consistent in this series.

> 
> In this case, look at the call site:
> 
> 	addr = (unsigned long)folio_address(huge_zero_folio);
> 	set_direct_map_ro_noflush((void *)addr, HPAGE_PMD_NR);
> 
> It *has* a folio. But it does a folio_address() and two casts to massage
> it into the type for set_direct_map_ro_noflush().
> 
> If set_direct_map_ro_noflush() just took a 'struct page *', there would
> be one folio=>page conversion, no casting, and complete consistency with
> the other set_direct_map*() functions.

Again, I agree with that, and the idea was to keep the interface consistent as
it gets converted; it's just that the series that does the conversion stalled.

> 
> I'd also be OK with set_direct_map_ro_noflush() taking a folio, with the
> implication being that it might eventually make sense to convert the
> other set_direct_map*() functions to folios. But page vs. folio
> confusion is much less likely to cause bugs than a void* versus another
> pointer.
> 
> IOW, what I think I want is:
> 
> int set_direct_map_ro_noflush(struct page *page, unsigned long nr_pages)

Yes, or as will said

	int set_direct_map_ro(struct page *page, unsigned long nr_pages)

performing the flush internally.

> 
> Or _maybe_:
> 
> int set_direct_map_ro_noflush(struct folio *folio)

I think I raised it before, but using folios on this interface is not a good
idea. Primarily because

a) Once we decouple struct folio from struct page this interface would only be
available for folios and ...

b) ... the huge zero page (currently huge zero folio) is on of the examples that
*currently* is a folio but very likely won't be a folio in the future. Only
anon+pagecache that really need mapcounts and all that will be folios.

c) I don't expect any further real folio users (IOW, anonymous folios or
pagecache folios), but could imagine non-folio users.

-- 
Cheers,

David

