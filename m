Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB382C61DBC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Aug 2026 16:43:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/pK8vkfuWdkoNNlq7Hv6MaryEnIssRFRjSinEh1fnZI=; b=sdizCTVueNIP1eMRBqemROdrRq
	iuBTQdknvLlKPysW4x+Kiij0ZcQe+IY96jwf21G3P6poog8P6NzjnVqAQ1WbIJOC0kaJUscGj7mum
	BF9uVH7nRlprpXVOkdjotsGdZQwBZarIKjBtj9AXxaQOEbUlwhYGt+6lQQcoFz7/JkwMSt46kZgft
	aAh3TmTw1nxyhTJUCpYtsXuiP0UEZ60dZp/Iv9a8Ta1UgpDd+1kjt7cZsT0urKyYejkeQNeBBbt6g
	AEsW5kgi5IZqjaffeqI0ukBM0zP0jmM/0GZISyGvKkJfy5xZDm78yIoFiXLFoI1oESYb4Pgu9PYdA
	ae0nyMSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyuF6-000000018N7-20Oj;
	Tue, 25 Aug 2026 16:43:20 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyuF5-000000018Mj-44MA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Aug 2026 16:43:20 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 02E7E60A59;
	Tue, 25 Aug 2026 16:43:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FA661F00A3D;
	Tue, 25 Aug 2026 16:43:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787676198;
	bh=/pK8vkfuWdkoNNlq7Hv6MaryEnIssRFRjSinEh1fnZI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=IE3OuFByNrywPpaGGkAeTYuowkSe/Uyx4GTBLLvHItS69MMaL0udgEh+uTYBriCUl
	 2pzC6FQK2CSyf/RMYIA7tdEe5lzNvIS96jBMMLKxulAc3k4VyLzXvRKLI78623AHhx
	 wPzZWGNqV+gSQLn21/2iIzldBbqxtIAx1ehJpv736n5nN4Q38Ns7uuDEs9o/hmJLRB
	 YCPWko2xdqNefcsnbGgbU0RgoVcJ2PirfbvjXpjwljsacFtloniVCvMR4gQiq7z2+N
	 W8keyM7LqMZwAijoy/Rw4GEI99T2CK8IHwXTC38Vd0JILw1rLl6RGTCHunun7Lham9
	 2uQcrSfdLAmpw==
Message-ID: <1e04196a-7079-4a8d-a1b7-844e60d08728@kernel.org>
Date: Tue, 25 Aug 2026 18:43:09 +0200
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
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <2931f8a6-3780-4d6a-b19d-61cbbdad1a3a@intel.com>
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

On 8/25/26 18:18, Dave Hansen wrote:
> On 7/30/26 02:06, Xueyuan Chen wrote:
>> +int set_direct_map_ro_noflush(const void *addr, unsigned long nr_pages)
>> +{
>> +	unsigned long tempaddr = (unsigned long)addr;
>> +	struct cpa_data cpa = {
>> +		.vaddr = &tempaddr,
>> +		.pgd = NULL,
>> +		.numpages = nr_pages,
>> +		.mask_set = __pgprot(0),
>> +		.mask_clr = __pgprot(_PAGE_RW | _PAGE_DIRTY),
>> +		.flags = CPA_NO_CHECK_ALIAS,
>> +	};
>> +
>> +	return __change_page_attr_set_clr(&cpa, 1);
>> +}
> 
> A couple of concerns here.
> 
> First, why the "_noflush"? Sure, the "this is a best effort hardening"
> function argument can be made, so it doesn't need to be correct. But the
> result is a function that's called once and also has some sharp corners
> and relatively high potential for misuse. Let's just do the flush.
> 
> Second, I see that the other set_direct_map*() callers use
> CPA_NO_CHECK_ALIAS. The reasoning behind it dates back to 2008 and I'm
> not 100% sure what it is referring to. On one hand, it would be nice to
> have all the set_direct_map*() callers be consistent. On the other hand,
> there shouldn't *be* any aliases of a 2M page that came out of the page
> allocator. We almost want a CPA_ASSERT_NO_ALIASES that goes out and
> checks for aliases more than we want to ignore them. (Note: I don't
> expect you to fix this, but a simple comment saying that no aliases are
> expected would be nice)
> 
> Third, what's with the 'tempaddr'? Are you working around the 'const'?
> Honestly, I'd rather have no const than have it and subvert it with
> casting trickery.
> 
> Last:
> 
> int set_direct_map_invalid_noflush(struct page *page)
> int set_direct_map_default_noflush(struct page *page)
> int set_direct_map_valid_noflush(struct page *page, unsigned nr, ...
> int set_direct_map_ro_noflush(const void *addr, unsigned long nr_pages)
> 
> Which one of these things is not like the other, despite being named
> just like them?
> 

That's called out in the cover letter:

"
This series adds set_direct_map_ro_noflush() so mm code can make a
direct-map range read-only, then uses it for the persistent huge zero
folio. The helper is direct-map specific, takes an address-based range as
discussed for set_direct_map* helpers[2], and leaves TLB invalidation to
the caller.
"

and patch #1

"
Use an address-based signature to match ongoing direct-map
helper work[2], where existing page-based helpers may move the same way.
The helper is direct-map specific and leaves TLB invalidation to its
caller. Architectures without direct-map permission support keep existing
behavior through the generic stub.
"

Currently it looks like this series would go in first, though, so it would be
better to keep the existing style.

-- 
Cheers,

David

