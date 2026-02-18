Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6413E9A049
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Feb 2026 12:27:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1xkDr3hOc8tIX8rhb1B90insc8AsQBPXnJpIU64iv3Y=; b=ijvexTRx+CDfpD/iqD7DM4vr5Y
	BoLyDDFuQEvLA68RxmdEmaBBjyggZeB8V2f9neU5NXBUUae5koqRfZPKa5xaEa3ZCO87mA1f/OBA6
	VYeBkvPz9fak+FYN78MYwTVsePdPKs70hWlsUZhbfO9r5szVr4rUXWQGe5RKxJxIR3WvtTHmIAlz+
	9blSC1AU27WpZxVTpC6p0rDX7ChM84U88WzqLFe0+4fFDaUxAeiHb+k03t9nqy6mrmEIJxmW0YzS4
	n3tw1UNtnQIbyBOh/siRVPbq4o9KIhACOtcexHxoIh5V0jP42nC0/WoAkOqY6poWsY4VTXsP4Zrdz
	e63fLlJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsgds-00000009mwS-1TKb;
	Wed, 18 Feb 2026 12:26:56 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsgdp-00000009mw5-132J
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Feb 2026 12:26:54 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 52C9C339;
	Wed, 18 Feb 2026 04:26:44 -0800 (PST)
Received: from [10.164.19.71] (unknown [10.164.19.71])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3F31D3F62B;
	Wed, 18 Feb 2026 04:26:45 -0800 (PST)
Message-ID: <e6333bbf-3a94-42eb-ab42-3f9255e1e51a@arm.com>
Date: Wed, 18 Feb 2026 17:56:42 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 5/5] mm: rmap: support batched unmapping for file large
 folios
To: Barry Song <21cnbao@gmail.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: "David Hildenbrand (Arm)" <david@kernel.org>, akpm@linux-foundation.org,
 catalin.marinas@arm.com, will@kernel.org, lorenzo.stoakes@oracle.com,
 ryan.roberts@arm.com, Liam.Howlett@oracle.com, vbabka@suse.cz,
 rppt@kernel.org, surenb@google.com, mhocko@suse.com, riel@surriel.com,
 harry.yoo@oracle.com, jannh@google.com, willy@infradead.org,
 linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <cover.1766631066.git.baolin.wang@linux.alibaba.com>
 <142919ac14d3cf70cba370808d85debe089df7b4.1766631066.git.baolin.wang@linux.alibaba.com>
 <46d0b6bf-db7e-418f-a497-983db4d4d786@kernel.org>
 <ddedb72a-d24f-48bc-88b2-f6f99f3d45ad@linux.alibaba.com>
 <CAGsJ_4xqtksoCwjLp-7Kvg5=LyqH+=aGWDWi8jRp8J0c-QiSwA@mail.gmail.com>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <CAGsJ_4xqtksoCwjLp-7Kvg5=LyqH+=aGWDWi8jRp8J0c-QiSwA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260218_042653_335727_CE4966E0 
X-CRM114-Status: GOOD (  15.54  )
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


On 13/02/26 10:49 am, Barry Song wrote:
> On Mon, Feb 9, 2026 at 5:43 PM Baolin Wang
> <baolin.wang@linux.alibaba.com> wrote:
> [...]
>>>> ---
>>>>   mm/rmap.c | 7 ++++---
>>>>   1 file changed, 4 insertions(+), 3 deletions(-)
>>>>
>>>> diff --git a/mm/rmap.c b/mm/rmap.c
>>>> index 985ab0b085ba..e1d16003c514 100644
>>>> --- a/mm/rmap.c
>>>> +++ b/mm/rmap.c
>>>> @@ -1863,9 +1863,10 @@ static inline unsigned int
>>>> folio_unmap_pte_batch(struct folio *folio,
>>>>       end_addr = pmd_addr_end(addr, vma->vm_end);
>>>>       max_nr = (end_addr - addr) >> PAGE_SHIFT;
>>>> -    /* We only support lazyfree batching for now ... */
>>>> -    if (!folio_test_anon(folio) || folio_test_swapbacked(folio))
>>>> +    /* We only support lazyfree or file folios batching for now ... */
>>>> +    if (folio_test_anon(folio) && folio_test_swapbacked(folio))
>>>>           return 1;
>>> Right, the anon folio handling would require a bit more work in the
>>>
>>>
>>>      } else if (folio_test_anon(folio)) {
>>>
>>> branch.
>>>
>>> Do you intend to tackle that one as well?
>>  >> I'll reply to the fixup.
>>
>> I'm not sure whether Barry has time to continue this work. If he does
>> not, I can take over. Barry?
> I expect to have some availability after April 1st.
> In the meantime, please feel free to send along any patches
> if you and Dev would like to move forward before then :-)

On it :)

>
> Best regards
> Barry

