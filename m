Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D31AAC36008
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 29 Mar 2025 10:10:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4/lGj6ICowfePMFm+RZRWeblwzVjHeQcX5TTHLcnzWc=; b=ILdUFjq4WhdNw9NTqiNBE743z8
	1pTZRfz8atQyCxQRZSG5FbqStELpAiZxZ+Ivzu0z9EX8j99exbeYHKx9u8qUvUjvRBhbjuBVtbc1L
	TLNzhFmJugfhDZVg/s6WyrUx89+dtq2uMk+PMAd7OWp0msdLSIHjO8Rz5DnQ+sWTv5CTmfScc2fd/
	WxupSPWvmuE0EUDQ/WZEFv1y37jhdX5DtwnErji3ZKh/TNbYeII1AjJdgKm80H4QWF4cnn5HzHMge
	k+99GyP1WV6BdAbKiylA/DfUZqfLOFLxlt8RucAPvZn3/ecjuVsW/t2El8R+e1IIiCYGb2cozY+VF
	VF7gI77A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyT8T-0000000F1J8-04nK;
	Sat, 29 Mar 2025 10:09:53 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyT6i-0000000F1Aw-0cYJ
	for linux-arm-kernel@lists.infradead.org;
	Sat, 29 Mar 2025 10:08:05 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6505D152B;
	Sat, 29 Mar 2025 03:08:07 -0700 (PDT)
Received: from [10.57.87.112] (unknown [10.57.87.112])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2BA713F694;
	Sat, 29 Mar 2025 03:08:01 -0700 (PDT)
Message-ID: <ee11907a-5bd7-44ec-844c-8f10ff406b46@arm.com>
Date: Sat, 29 Mar 2025 10:07:59 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] mm/filemap: Allow arch to request folio size for exec
 memory
Content-Language: en-GB
To: Matthew Wilcox <willy@infradead.org>
Cc: Kalesh Singh <kaleshsingh@google.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@redhat.com>, Dave Chinner <david@fromorbit.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-mm@kvack.org
References: <20250327160700.1147155-1-ryan.roberts@arm.com>
 <Z-WAbWfZzG1GA-4n@casper.infradead.org>
 <5131c7ad-cc37-44fc-8672-5866ecbef65b@arm.com>
 <Z-b1FmZ5nHzh5huL@casper.infradead.org>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <Z-b1FmZ5nHzh5huL@casper.infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250329_030804_278229_E9A5AB40 
X-CRM114-Status: GOOD (  35.19  )
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

On 28/03/2025 15:14, Matthew Wilcox wrote:
> On Thu, Mar 27, 2025 at 04:23:14PM -0400, Ryan Roberts wrote:
>> + Kalesh
>>
>> On 27/03/2025 12:44, Matthew Wilcox wrote:
>>> On Thu, Mar 27, 2025 at 04:06:58PM +0000, Ryan Roberts wrote:
>>>> So let's special-case the read(ahead) logic for executable mappings. The
>>>> trade-off is performance improvement (due to more efficient storage of
>>>> the translations in iTLB) vs potential read amplification (due to
>>>> reading too much data around the fault which won't be used), and the
>>>> latter is independent of base page size. I've chosen 64K folio size for
>>>> arm64 which benefits both the 4K and 16K base page size configs and
>>>> shouldn't lead to any read amplification in practice since the old
>>>> read-around path was (usually) reading blocks of 128K. I don't
>>>> anticipate any write amplification because text is always RO.
>>>
>>> Is there not also the potential for wasted memory due to ELF alignment?
>>
>> I think this is an orthogonal issue? My change isn't making that any worse.
> 
> To a certain extent, it is.  If readahead was doing order-2 allocations
> before and is now doing order-4, you're tying up 0-12 extra pages which
> happen to be filled with zeroes due to being used to cache the contents
> of a hole.

Well we would still have read them in before, nothing has changed there. But I
guess your point is more about reclaim? Because those pages are now contained in
a larger folio, if part of the folio is in use then all of it remains active.
Whereas before, if the folio was fully contained in the pad area and never
accessed, it would fall down the LRU quickly and get reclaimed.

> 
>>> Kalesh talked about it in the MM BOF at the same time that Ted and I
>>> were discussing it in the FS BOF.  Some coordination required (like
>>> maybe Kalesh could have mentioned it to me rathere than assuming I'd be
>>> there?)
>>
>> I was at Kalesh's talk. David H suggested that a potential solution might be for
>> readahead to ask the fs where the next hole is and then truncate readahead to
>> avoid reading the hole. Given it's padding, nothing should directly fault it in
>> so it never ends up in the page cache. Not sure if you discussed anything like
>> that if you were talking in parallel?
> 
> Ted said that he and Kalesh had talked about that solution.  I have a
> more bold solution in mind which lifts the ext4 extent cache to the
> VFS inode so that the readahead code can interrogate it.
> 
>> Anyway, I'm not sure if you're suggesting these changes need to be considered as
>> one somehow or if you're just mentioning it given it is loosely related? My view
>> is that this change is an improvement indepently and could go in much sooner.
> 
> This is not a reason to delay this patch.  It's just a downside which
> should be mentioned in the commit message.

Fair point; I'll add a paragraph about the potential reclaim issue.

> 
>>>> +static inline int arch_exec_folio_order(void)
>>>> +{
>>>> +	return -1;
>>>> +}
>>>
>>> This feels a bit fragile.  I often expect to be able to store an order
>>> in an unsigned int.  Why not return 0 instead?
>>
>> Well 0 is a valid order, no? I think we have had the "is order signed or
>> unsigned" argument before. get_order() returns a signed int :)
> 
> But why not always return a valid order?  I don't think we need a
> sentinel.  The default value can be 0 to do what we do today.
> 

But a single order-0 folio is not what we do today. Note that my change as
currently implemented requests to read a *single* folio of the specified order.
And note that we only get the order we request to page_cache_ra_order() because
the size is limited to a single folio. If the size were bigger, that function
would actually expand the requested order by 2. (although the parameter is
called "new_order", it's actually interpretted as "old_order").

The current behavior is effectively to read 128K in order-2 folios (with smaller
folios for boundary alignment).

So I see a few options:

  - Continue to allow non-opted in arches to use the existing behaviour; in this
case we need a sentinel. This could be -1, UINT_MAX or 0. But in the latter case
you are preventing an opted-in arch from specifying that they want order-0 -
it's meaning is overridden.

  - Force all arches to use the new approach with a default folio order (and
readahead size) of order-0. (The default can be overridden per-arch). Personally
I'd be nervous about making this change.

  - Decouple the read size from the folio order size; continue to use the 128K
read size and only allow opting-in to a specific folio order. The default order
would be 2 (or 0). We would need to fix page_cache_async_ra() to call
page_cache_ra_order() with "order + 2" (the new order) and fix
page_cache_ra_order() to treat its order parameter as the *new* order.

Perhaps we should do those fixes anyway (and then actually start with a folio
order of 0 - which I think you said in the past was your original intention?).

Thanks,
Ryan


