Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D512DC3ABB0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 May 2025 13:21:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AS5bNHpT+rSmobhoBuRRW2E9jvGZija9naUXrN6kyLQ=; b=t4W0UMBHLRSgauu1v1qP3G1g3j
	VnhZZeLXLAE/KZ7sQamNO3QkzzjeimPmUNhLQ/2SOAkb2xzopCzsau878zFpXilapLbdIgoGGMjGw
	b4he9i6r51cZGRg37NFBSFL0D5TnH0CVvQV/XXwBmNn/oIKvpGeW5e19k+n0fJ6QXIKuSGzStd/ag
	ZlkuB9pCgOJUNJiOvZzKqO42648FQTDusSXrERu9o2wxdKPWIa31/7KIIbZn9OFU39LXoQtaDnFYf
	Qa3ygU+gdIIhiIvdOPnIhW3MpQNZ51K/IiawYdYpa7vvbwTD1q6+WhkQoZgNLZ244YagsZts379ye
	/o2lKfKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBvkg-00000007RxQ-1xf8;
	Mon, 05 May 2025 13:20:58 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBvIb-00000007Obz-0Jlx
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 May 2025 12:51:58 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A99A21007;
	Mon,  5 May 2025 05:51:44 -0700 (PDT)
Received: from [10.57.93.118] (unknown [10.57.93.118])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3CAD33F58B;
	Mon,  5 May 2025 05:51:50 -0700 (PDT)
Message-ID: <12a74640-753a-4116-90f9-42ec0337f751@arm.com>
Date: Mon, 5 May 2025 13:51:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v4 1/5] mm/readahead: Honour new_order in
 page_cache_ra_order()
Content-Language: en-GB
To: David Hildenbrand <david@redhat.com>, Jan Kara <jack@suse.cz>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, Dave Chinner <david@fromorbit.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Kalesh Singh <kaleshsingh@google.com>, Zi Yan <ziy@nvidia.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-mm@kvack.org
References: <20250430145920.3748738-1-ryan.roberts@arm.com>
 <20250430145920.3748738-2-ryan.roberts@arm.com>
 <48b4aa79-943b-46bc-ac24-604fdf998566@redhat.com>
 <mhayjykmkxhvnivthdrc2bb3cvqbdesa42puzimx75xfagcnqn@osy4qeiyfxvn>
 <d4bfefdf-bd87-4d2e-b7bb-4a11e5d32242@redhat.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <d4bfefdf-bd87-4d2e-b7bb-4a11e5d32242@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_055157_209651_BFCA93BE 
X-CRM114-Status: GOOD (  16.00  )
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

On 05/05/2025 11:25, David Hildenbrand wrote:
> On 05.05.25 12:09, Jan Kara wrote:
>> On Mon 05-05-25 11:51:43, David Hildenbrand wrote:
>>> On 30.04.25 16:59, Ryan Roberts wrote:
>>>> page_cache_ra_order() takes a parameter called new_order, which is
>>>> intended to express the preferred order of the folios that will be
>>>> allocated for the readahead operation. Most callers indeed call this
>>>> with their preferred new order. But page_cache_async_ra() calls it with
>>>> the preferred order of the previous readahead request (actually the
>>>> order of the folio that had the readahead marker, which may be smaller
>>>> when alignment comes into play).
>>>>
>>>> And despite the parameter name, page_cache_ra_order() always treats it
>>>> at the old order, adding 2 to it on entry. As a result, a cold readahead
>>>> always starts with order-2 folios.
>>>>
>>>> Let's fix this behaviour by always passing in the *new* order.
>>>>
>>>> Worked example:
>>>>
>>>> Prior to the change, mmaping an 8MB file and touching each page
>>>> sequentially, resulted in the following, where we start with order-2
>>>> folios for the first 128K then ramp up to order-4 for the next 128K,
>>>> then get clamped to order-5 for the rest of the file because pa_pages is
>>>> limited to 128K:
>>>>
>>>> TYPE    STARTOFFS     ENDOFFS       SIZE  STARTPG    ENDPG   NRPG  ORDER
>>>> -----  ----------  ----------  ---------  -------  -------  -----  -----
>>>> FOLIO  0x00000000  0x00004000      16384        0        4      4      2
>>>> FOLIO  0x00004000  0x00008000      16384        4        8      4      2
>>>> FOLIO  0x00008000  0x0000c000      16384        8       12      4      2
>>>> FOLIO  0x0000c000  0x00010000      16384       12       16      4      2
>>>> FOLIO  0x00010000  0x00014000      16384       16       20      4      2
>>>> FOLIO  0x00014000  0x00018000      16384       20       24      4      2
>>>> FOLIO  0x00018000  0x0001c000      16384       24       28      4      2
>>>> FOLIO  0x0001c000  0x00020000      16384       28       32      4      2
>>>> FOLIO  0x00020000  0x00030000      65536       32       48     16      4
>>>> FOLIO  0x00030000  0x00040000      65536       48       64     16      4
>>>> FOLIO  0x00040000  0x00060000     131072       64       96     32      5
>>>> FOLIO  0x00060000  0x00080000     131072       96      128     32      5
>>>> FOLIO  0x00080000  0x000a0000     131072      128      160     32      5
>>>> FOLIO  0x000a0000  0x000c0000     131072      160      192     32      5
>>>
>>> Interesting, I would have thought we'd ramp up earlier.
>>>
>>>> ...
>>>>
>>>> After the change, the same operation results in the first 128K being
>>>> order-0, then we start ramping up to order-2, -4, and finally get
>>>> clamped at order-5:
>>>>
>>>> TYPE    STARTOFFS     ENDOFFS       SIZE  STARTPG    ENDPG   NRPG  ORDER
>>>> -----  ----------  ----------  ---------  -------  -------  -----  -----
>>>> FOLIO  0x00000000  0x00001000       4096        0        1      1      0
>>>> FOLIO  0x00001000  0x00002000       4096        1        2      1      0
>>>> FOLIO  0x00002000  0x00003000       4096        2        3      1      0
>>>> FOLIO  0x00003000  0x00004000       4096        3        4      1      0
>>>> FOLIO  0x00004000  0x00005000       4096        4        5      1      0
>>>> FOLIO  0x00005000  0x00006000       4096        5        6      1      0
>>>> FOLIO  0x00006000  0x00007000       4096        6        7      1      0
>>>> FOLIO  0x00007000  0x00008000       4096        7        8      1      0
>>>> FOLIO  0x00008000  0x00009000       4096        8        9      1      0
>>>> FOLIO  0x00009000  0x0000a000       4096        9       10      1      0
>>>> FOLIO  0x0000a000  0x0000b000       4096       10       11      1      0
>>>> FOLIO  0x0000b000  0x0000c000       4096       11       12      1      0
>>>> FOLIO  0x0000c000  0x0000d000       4096       12       13      1      0
>>>> FOLIO  0x0000d000  0x0000e000       4096       13       14      1      0
>>>> FOLIO  0x0000e000  0x0000f000       4096       14       15      1      0
>>>> FOLIO  0x0000f000  0x00010000       4096       15       16      1      0
>>>> FOLIO  0x00010000  0x00011000       4096       16       17      1      0
>>>> FOLIO  0x00011000  0x00012000       4096       17       18      1      0
>>>> FOLIO  0x00012000  0x00013000       4096       18       19      1      0
>>>> FOLIO  0x00013000  0x00014000       4096       19       20      1      0
>>>> FOLIO  0x00014000  0x00015000       4096       20       21      1      0
>>>> FOLIO  0x00015000  0x00016000       4096       21       22      1      0
>>>> FOLIO  0x00016000  0x00017000       4096       22       23      1      0
>>>> FOLIO  0x00017000  0x00018000       4096       23       24      1      0
>>>> FOLIO  0x00018000  0x00019000       4096       24       25      1      0
>>>> FOLIO  0x00019000  0x0001a000       4096       25       26      1      0
>>>> FOLIO  0x0001a000  0x0001b000       4096       26       27      1      0
>>>> FOLIO  0x0001b000  0x0001c000       4096       27       28      1      0
>>>> FOLIO  0x0001c000  0x0001d000       4096       28       29      1      0
>>>> FOLIO  0x0001d000  0x0001e000       4096       29       30      1      0
>>>> FOLIO  0x0001e000  0x0001f000       4096       30       31      1      0
>>>> FOLIO  0x0001f000  0x00020000       4096       31       32      1      0
>>>> FOLIO  0x00020000  0x00024000      16384       32       36      4      2
>>>> FOLIO  0x00024000  0x00028000      16384       36       40      4      2
>>>> FOLIO  0x00028000  0x0002c000      16384       40       44      4      2
>>>> FOLIO  0x0002c000  0x00030000      16384       44       48      4      2
>>>> FOLIO  0x00030000  0x00034000      16384       48       52      4      2
>>>> FOLIO  0x00034000  0x00038000      16384       52       56      4      2
>>>> FOLIO  0x00038000  0x0003c000      16384       56       60      4      2
>>>> FOLIO  0x0003c000  0x00040000      16384       60       64      4      2
>>>> FOLIO  0x00040000  0x00050000      65536       64       80     16      4
>>>> FOLIO  0x00050000  0x00060000      65536       80       96     16      4
>>>> FOLIO  0x00060000  0x00080000     131072       96      128     32      5
>>>> FOLIO  0x00080000  0x000a0000     131072      128      160     32      5
>>>> FOLIO  0x000a0000  0x000c0000     131072      160      192     32      5
>>>> FOLIO  0x000c0000  0x000e0000     131072      192      224     32      5
>>>
>>> Similar here, do you know why we don't ramp up earlier. Allocating that many
>>> order-0 + order-2 pages looks a bit suboptimal to me for a sequential read.
>>
>> Note that this is reading through mmap using the mmap readahead code. If
>> you use standard read(2), the readahead window starts small as well and
>> ramps us along with the desired order so we don't allocate that many small
>> order pages in that case.

That does raise an interesting question though; why do we use a fixed size
window for mmap? It feels like we could start with a smaller window and ramp it
up as order ramps up too, capped to the end of the vma.

Although perhaps that is an investigation for another day... My main motivation
here was to be consistent about what page_cache_ra_order()'s new_order means,
and to actually implement algorithm that was originally intended - start from 0
and ramp up +2 on each readahead marker.

> 
> Ah, thanks for that information! :)
> 


