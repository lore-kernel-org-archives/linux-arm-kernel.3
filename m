Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE164CD98F6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Jun 2026 04:22:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nVE/CETE6XJ69E1d+hXZBaTooyvpB4+dChpZFA7ZoMk=; b=CJK4D7WHx3h5VXXOuohLTxlqS2
	n3YjotJQ6sVjjq7EfkE7fsyXftkaD6at+7+5lFHXiXulQkbALJTBUa7vjz4V72chIIoy+dy2Pp+78
	RDeu52d8mzsP7QNpCtgpGKFFP2aC7icJttuLvIvvXuYxz4Ik90SfxvICjQPouJYrbMhcttl9roeFr
	MaK01nsDe2wu184t0SOlCjSHv8m0DbHFQ+Ar1B4B3rlFCS3hpstUdnUq9MsEyC9FXeIQ8E+VJo2lb
	/KAj9VELuSpNyyOD4AVaEU+8Y1jzQXNAzFMmtFhS4tu22sB8XQzGOvYN2Vd0ueTHiVhrCEyv803kJ
	YLnjkchg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbWAa-00000004Opm-3WxH;
	Mon, 22 Jun 2026 04:22:00 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbWAY-00000004OpQ-1pAT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Jun 2026 04:21:59 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A93661BF3;
	Sun, 21 Jun 2026 21:21:49 -0700 (PDT)
Received: from [10.164.148.39] (unknown [10.164.148.39])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E65393F632;
	Sun, 21 Jun 2026 21:21:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1782102114; bh=MeoUdRHU+a8GHZTXWy3AhV6g6+tAIm18618t9DJUnCg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=IbRtbVJCoc0dwm5V7cKHFiVgZ9iYADrT13EoROHmpvgAovU/LJpHhIzFFEEl6wvdM
	 sqhoZFbiyg75byqaF55UYJsFFAzQzT3bHs4+SK65T1LwpyBS8gpIjggXYF5AnxBoTM
	 TidnUlP4peozlYOQ8q/TqZUfm8jNfOWpCBAjjo5M=
Message-ID: <69b316bf-7163-4040-8682-e3d200b7d7c6@arm.com>
Date: Mon, 22 Jun 2026 09:51:26 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/2] kasan: hw_tags: Add option to tag only at
 allocation time
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
 <aiyhb2XwMMJE3st7@google.com>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <aiyhb2XwMMJE3st7@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260621_212158_606315_3B864A3C 
X-CRM114-Status: GOOD (  17.46  )
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



On 13/06/26 5:46 am, Isaac Manjarres wrote:
> On Fri, Jun 12, 2026 at 04:44:22AM +0000, Dev Jain wrote:
>> Introduce a boot option to tag only at allocation time of the objects. This
>> reduces KASAN MTE overhead, the tradeoff being reduced ability of
>> catching bugs.
>>
>> Now, when a memory object will be freed, it will retain the random tag it
>> had at allocation time. This compromises on catching UAF bugs, till the
>> time the object is not reallocated, at which point it will have a new
>> random tag.
>>
>> Hence, not catching "use-after-free-before-reallocation" and not catching
>> "double-free" will be the compromise for reduced KASAN overhead.
>>
>> This is an RFC because we are not clear about the performance benefit.
>>
>> Android folks, please help with testing!
>>
>> ---
>> Applies on Linus master (9716c086c8e8).
>>
>> Dev Jain (2):
>>   kasan: hw_tags: Use KASAN_PAGE_REDZONE for vmalloc redzoning
>>   kasan: hw_tags: Add boot option to elide free time poisoning
>>
>>  Documentation/dev-tools/kasan.rst |  4 +++
>>  mm/kasan/hw_tags.c                | 45 +++++++++++++++++++++++++++++--
>>  mm/kasan/kasan.h                  | 23 +++++++++++++++-
>>  3 files changed, 69 insertions(+), 3 deletions(-)
>>
>> -- 
>> 2.43.0
> 
> I tested out this series on one of our devices that has MTE support,
> and didn't see any functional issues.

Thanks for testing Isaac! Do you have the bandwidth to carry out some
performance tests? We want to see whether this patchset gets perf boost
on some HW.

> 
> One thing I did notice though, and it's independent of this patch, is
> that the vmalloc_oob is failing, but that happens even if these patches
> aren't present.
> 
> Thanks,
> Isaac


