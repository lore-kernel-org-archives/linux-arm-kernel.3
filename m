Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32097CD98E6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Jun 2026 04:45:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QZRxrNaXMUb1YLJrXKm9qGVCUVyefQ+jPumrFbXRQBY=; b=mzJL96Pdz7IhA3fci5+uskLcgu
	DdEku3JqkBs5/nylShpVETKIw5SriNciUShrUNp1vm4or1RmislyUOJCgH18/5TcL6IwD2T8CfrV3
	r/PZWmp4rTIWcBPxf/MH3C7QXWlb1LkKDo6m03R6LpO/BdVvevQgNcdq4Mw5OzZdKNQotgyPP42ys
	M2LNsYImIsWzJClYHqdIoqXV9wOJQ4kyZ9amTkl0ZtTueJpnzRJvA/98WTBiq6cocnMfG/vlfYS7e
	sDDj/3X4PVEKw7ir88Am/TdqBhHsmTsfUy5ZTaMALn8f+6C/dsj7WifjAXql3mEA2d9of2oAQ5kbE
	PnC4yrLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waR67-00000001yVA-20Yz;
	Fri, 19 Jun 2026 04:44:55 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waR64-00000001yUS-2bP0
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Jun 2026 04:44:54 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8A894293F;
	Thu, 18 Jun 2026 21:44:44 -0700 (PDT)
Received: from [10.164.148.42] (D3H2TH2F54.blr.arm.com [10.164.148.42])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F07F53F632;
	Thu, 18 Jun 2026 21:44:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1781844289; bh=ps5ieMGO5BqQTpSXeGILcJmIGXlH2aB1crQD4y2zbKA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=P9xMpzZA3w4Ud4GhNZYAR7rMtLEydQwCTF5BmTXmZvPjLCv1UXfUP8+r8Iq8CbCLQ
	 nRrOkqVf1Wr8M0pq84KEAZLTFtdvS80erxNi0JgM/Kw6LvYGCLadma1qHOiO2oStX9
	 L5zWdZrvA5KAhMLYETPu4C+RFIalR3vIj8I+cxO0=
Message-ID: <7b4f284c-9659-4422-a452-e67dcbfb0140@arm.com>
Date: Fri, 19 Jun 2026 10:14:33 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 2/2] kasan: hw_tags: Add boot option to elide free
 time poisoning
To: Isaac Manjarres <isaacmanjarres@google.com>
Cc: ryabinin.a.a@gmail.com, akpm@linux-foundation.org, corbet@lwn.net,
 glider@google.com, andreyknvl@gmail.com, dvyukov@google.com,
 vincenzo.frascino@arm.com, kasan-dev@googlegroups.com, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, skhan@linuxfoundation.org,
 workflows@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, ryan.roberts@arm.com,
 anshuman.khandual@arm.com, kaleshsingh@google.com, 21cnbao@gmail.com,
 david@kernel.org, will@kernel.org, catalin.marinas@arm.com
References: <20260612044425.763060-1-dev.jain@arm.com>
 <20260612044425.763060-3-dev.jain@arm.com> <aiyi5flNkNNm0pSR@google.com>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <aiyi5flNkNNm0pSR@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260618_214452_789457_C2BB0D58 
X-CRM114-Status: GOOD (  15.98  )
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



On 13/06/26 5:53 am, Isaac Manjarres wrote:
> On Fri, Jun 12, 2026 at 04:44:24AM +0000, Dev Jain wrote:
>> diff --git a/mm/kasan/kasan.h b/mm/kasan/kasan.h
>> index fc9169a547662..4fa8abb312faa 100644
>> --- a/mm/kasan/kasan.h
>> +++ b/mm/kasan/kasan.h
>>  #ifdef CONFIG_KASAN_GENERIC
>> @@ -478,6 +489,16 @@ static inline u8 kasan_random_tag(void) { return 0; }
>>  
>>  static inline void kasan_poison(const void *addr, size_t size, u8 value, bool init)
>>  {
>> +	if (kasan_tag_only_on_alloc_enabled()) {
>> +		if ((value != KASAN_SLAB_REDZONE) && (value != KASAN_PAGE_REDZONE)) {
>> +			if (init)
>> +				memset((void *)kasan_reset_tag(addr), 0, size);
>> +			return;
>> +		}
>> +	}
>> +
>> +	value |= 0xF0;
>> +
> 
> I wonder if it would make more sense to have this as:
> 
> if (kasan_tag_only_on_alloc_enabled() && (value == KASAN_SLAB_FREE ||
>     value == KASAN_PAGE_FREE)) {
> 	if (init)
> 		memset((void *)kasan_reset_tag(addr), 0, size);
> 	return;
> }
> 
> That seems a bit clearer to me as to what it is that you're doing, and
> also makes it so that you don't have to do any bit manipulation
> on the value when you're filling in the redzones.

Ah so you mean, we can define KASAN_SLAB_FREE and KASAN_PAGE_FREE to be
different values, leaving KASAN_SLAB_REDZONE and KASAN_PAGE_REDZONE to
be 0xFE, the poison value. Yep I'll do that.
> 
> Thanks,
> Isaac


