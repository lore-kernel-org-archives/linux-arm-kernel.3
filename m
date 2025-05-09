Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F262BC3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 15:04:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kd/srjdm1xnvaZel3ttLP5jXGyV2SDPmX2hnkuWxMsU=; b=DXdcnRctVqe87x4iK4vOd7DAbZ
	dY0I2CVJ2d8dxzOlo0eWNYBCXwXyiYcrZ0Fbpo1JRSzTQUuXO7rtYcbyzcIEVxwjfvRAiC25pke3w
	NUngaSzgZlSnKqDTzQF0ciLIb3+xb2UTe01oKXwbyTFURDkClrPHot4wNYo+DSHtHZNYPeKLzoq1H
	biPDOV/56sB2hbvMim3JJ4GpeTpwkTJm6bT64tRMKZG/RRAi6wEInCYtS8smFPK6Xpvh96aleyDmW
	2Qe3b7BrTRNKzsHwR6FUgBQE0dUh9J5pj4Jk3JW4etUDty/KfKoks3SJkaiF+QzRabuU7uApl2ZAU
	SYN1s7BA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDPGY-000000041QA-3ESb;
	Fri, 09 May 2025 15:03:58 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDNo5-00000003m2n-1K2o
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 May 2025 13:30:30 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C665D175D;
	Fri,  9 May 2025 06:30:17 -0700 (PDT)
Received: from [10.57.90.222] (unknown [10.57.90.222])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4CA773F58B;
	Fri,  9 May 2025 06:30:26 -0700 (PDT)
Message-ID: <22e4167a-6ed0-4bda-86b8-a11c984f0a71@arm.com>
Date: Fri, 9 May 2025 14:30:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v4 1/5] mm/readahead: Honour new_order in
 page_cache_ra_order()
Content-Language: en-GB
To: "Pankaj Raghav (Samsung)" <kernel@pankajraghav.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
 David Hildenbrand <david@redhat.com>, Dave Chinner <david@fromorbit.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Kalesh Singh <kaleshsingh@google.com>, Zi Yan <ziy@nvidia.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-mm@kvack.org
References: <20250430145920.3748738-1-ryan.roberts@arm.com>
 <20250430145920.3748738-2-ryan.roberts@arm.com>
 <nepi5e74wtghvr6a6n26rdgqaa7tzitylyoamfnzoqu6s5gq4h@zqtve2irigd6>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <nepi5e74wtghvr6a6n26rdgqaa7tzitylyoamfnzoqu6s5gq4h@zqtve2irigd6>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_063029_442890_B3147096 
X-CRM114-Status: GOOD (  24.95  )
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

Hi Pankaj,

Thanks for the review! ...


On 08/05/2025 13:55, Pankaj Raghav (Samsung) wrote:
> Hey Ryan,
> 
> On Wed, Apr 30, 2025 at 03:59:14PM +0100, Ryan Roberts wrote:
>> FOLIO  0x0001a000  0x0001b000       4096       26       27      1      0
>> FOLIO  0x0001b000  0x0001c000       4096       27       28      1      0
>> FOLIO  0x0001c000  0x0001d000       4096       28       29      1      0
>> FOLIO  0x0001d000  0x0001e000       4096       29       30      1      0
>> FOLIO  0x0001e000  0x0001f000       4096       30       31      1      0
>> FOLIO  0x0001f000  0x00020000       4096       31       32      1      0
>> FOLIO  0x00020000  0x00024000      16384       32       36      4      2
>> FOLIO  0x00024000  0x00028000      16384       36       40      4      2
>> FOLIO  0x00028000  0x0002c000      16384       40       44      4      2
>> FOLIO  0x0002c000  0x00030000      16384       44       48      4      2
>> ...
>>
>> Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
>> ---
>>  mm/readahead.c | 4 +---
>>  1 file changed, 1 insertion(+), 3 deletions(-)
>>
>> diff --git a/mm/readahead.c b/mm/readahead.c
>> index 6a4e96b69702..8bb316f5a842 100644
>> --- a/mm/readahead.c
>> +++ b/mm/readahead.c
>> @@ -479,9 +479,6 @@ void page_cache_ra_order(struct readahead_control *ractl,
>>  
> 
> So we always had a fallback to do_page_cache_ra() if the size of the
> readahead is less than 4 pages (16k). I think this was there because we
> were adding `2` to the new_order:

If this is the reason for the magic number 4, then it's a bug in itself IMHO. 4
pages is only 16K when the page size is 4K; arm64 supports other page sizes. But
additionally, it's not just ra->size that dictates the final order of the folio;
it also depends on alignment in the file, EOF, etc.

If we remove the fallback condition completely, things will still work out. So
unless someone can explain the reason for that condition (Matthew?), my vote
would be to remove it entirely.

> 
> unsigned int min_ra_size = max(4, mapping_min_folio_nrpages(mapping));
> 
> /*
>  * Fallback when size < min_nrpages as each folio should be
>  * at least min_nrpages anyway.
>  */
> if (!mapping_large_folio_support(mapping) || ra->size < min_ra_size)
> 	goto fallback;
> 
>>  	limit = min(limit, index + ra->size - 1);
>>  
>> -	if (new_order < mapping_max_folio_order(mapping))
>> -		new_order += 2;
> 
> Now that you have moved this, we could make the lhs of the max to be 2
> (8k) instead of 4(16k).

I don't really understand why magic number 2 would now be correct?

> 
> - unsigned int min_ra_size = max(4, mapping_min_folio_nrpages(mapping));
> + unsigned int min_ra_size = max(2, mapping_min_folio_nrpages(mapping));
> 
> I think if we do that, we might ramp up to 8k sooner rather than jumping
> from 4k to 16k directly?

In practice I don't think so; This would only give us order-1 where we didn't
have it before if new_order >= 1 and ra->size is 3 or 4 pages.

But as I said, my vote would be to remove this fallback condition entirely. What
do you think?

Thanks,
Ryan

> 
>> -
>>  	new_order = min(mapping_max_folio_order(mapping), new_order);
>>  	new_order = min_t(unsigned int, new_order, ilog2(ra->size));
>>  	new_order = max(new_order, min_order);
>> @@ -683,6 +680,7 @@ void page_cache_async_ra(struct readahead_control *ractl,
>>  	ra->size = get_next_ra_size(ra, max_pages);
>>  	ra->async_size = ra->size;
>>  readit:
>> +	order += 2;
>>  	ractl->_index = ra->start;
>>  	page_cache_ra_order(ractl, ra, order);
>>  }
>> -- 
>> 2.43.0
>>
> 
> --
> Pankaj


