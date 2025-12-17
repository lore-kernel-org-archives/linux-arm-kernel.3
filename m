Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 970F1D6406D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Dec 2025 03:11:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Nu6UK8a/ziMCsyb+RknHP8PTrL524RR3T22QKWM72Zk=; b=IrC7OsFbKTJESxL377+7Jfa1da
	Xllux6IiNomCg+K36jBxsXpfWdrP6V80RgmLKGQ6T9ZkXBxjle/Gxx+UlGx4yZw3WsMzbA4RaBSyS
	R4ufNgmyvNuPTPUXCTk5iHMz4fAKutrWpgNx5IC0EPpj7DKJ45xV/i5oSSG6wWpGbITi52JM9UmGi
	TEHdaGN+q+LdBXIsQdRlrx3gRAzs5eS9eMDKObus70XsvjZta6oU1ylAQRC/bzNYQagpj9mKAHon6
	0Hr7gTH9xbgH7uY52trd2ziwBq+1buL6KMhYu38NEyU2w8XosDA8XD3yHiEtJFOko8thaBLejcGRP
	TMM5x8YA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVhx5-000000066hX-0E6N;
	Wed, 17 Dec 2025 03:11:47 +0000
Received: from out30-100.freemail.mail.aliyun.com ([115.124.30.100])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVhx2-000000066h4-1Zq9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Dec 2025 03:11:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1765941100; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=Nu6UK8a/ziMCsyb+RknHP8PTrL524RR3T22QKWM72Zk=;
	b=kdrcqR4IsP5hxmBSuWdBtG3DrBIkGYF8JN4RVdMeJMc+kBCdPemQcKeTPZQQLSpiPb0nc4SLY/YWmxY6+8bVC6vuthhgIGioQZEVcefl9Wc0i37QNwyg2h8b+URtVD8z7BKSlGT94JtcKZ2yHGo6CgSWjp6l2f6jaifAk5jJ8s8=
Received: from 30.74.144.118(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0Wv1ZCXw_1765941096 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 17 Dec 2025 11:11:37 +0800
Message-ID: <8bfcae1c-74a0-43e8-807b-fff22a770241@linux.alibaba.com>
Date: Wed, 17 Dec 2025 11:11:35 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] mm: rmap: support batched unmapping for file large
 folios
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Barry Song <21cnbao@gmail.com>, akpm@linux-foundation.org,
 david@kernel.org, catalin.marinas@arm.com, will@kernel.org,
 ryan.roberts@arm.com, Liam.Howlett@oracle.com, vbabka@suse.cz,
 rppt@kernel.org, surenb@google.com, mhocko@suse.com, riel@surriel.com,
 harry.yoo@oracle.com, jannh@google.com, willy@infradead.org,
 linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <cover.1765439380.git.baolin.wang@linux.alibaba.com>
 <af330c9ea188bd0f28189b1e6e5803f6de9d2abe.1765439381.git.baolin.wang@linux.alibaba.com>
 <70d1dedc-b4fc-4eb6-baf6-9e54b6a62249@lucifer.local>
 <eb871ca2-47c8-4b10-a61d-321716f6c147@linux.alibaba.com>
 <CAGsJ_4xp40A3u=N5_mw00Eo6bPmFvctD3j=1Qmy3vOo2EmX3hA@mail.gmail.com>
 <9e038290-70ff-458d-b46d-bc512c3442be@linux.alibaba.com>
 <e718cfdd-a39f-48f6-98c8-f17683f29bcf@lucifer.local>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <e718cfdd-a39f-48f6-98c8-f17683f29bcf@lucifer.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251216_191144_593039_F4DB989C 
X-CRM114-Status: GOOD (  12.12  )
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



On 2025/12/16 18:54, Lorenzo Stoakes wrote:
> On Tue, Dec 16, 2025 at 02:22:11PM +0800, Baolin Wang wrote:
>>
>>
>> On 2025/12/16 14:13, Barry Song wrote:
>>>>>>
>>>>>> diff --git a/mm/rmap.c b/mm/rmap.c
>>>>>> index ec232165c47d..4c9d5777c8da 100644
>>>>>> --- a/mm/rmap.c
>>>>>> +++ b/mm/rmap.c
>>>>>> @@ -1855,9 +1855,10 @@ static inline unsigned int folio_unmap_pte_batch(struct folio *folio,
>>>>>>        end_addr = pmd_addr_end(addr, vma->vm_end);
>>>>>>        max_nr = (end_addr - addr) >> PAGE_SHIFT;
>>>>>>
>>>>>> -    /* We only support lazyfree batching for now ... */
>>>>>> -    if (!folio_test_anon(folio) || folio_test_swapbacked(folio))
>>>>>> +    /* We only support lazyfree or file folios batching for now ... */
>>>>>> +    if (folio_test_anon(folio) && folio_test_swapbacked(folio))
>>>>>
>>>>> Why is it now ok to support file-backed batched unmapping when it wasn't in
>>>>> Barry's series (see [0])? You don't seem to be justifying this?
>>>>
>>>> Barry's series[0] is merely aimed at optimizing lazyfree anonymous large
>>>> folios and does not continue to optimize anonymous large folios or
>>>> file-backed large folios at that point.
>>>
>>> Yep. At that time, I didn’t have an Android machine with a filesystem
>>> that supported large folios, so I focused on lazyfree. But I
>>> agree that lazyfree anon folios and file folios are quite
>>> similar.
>>>
>>>>
>>>> Subsequently, Barry sent out a new patch (see [1]) to optimize anonymous
>>>> large folios. As for file-backed large folios, the batched unmapping
>>>> support is relatively simple, since we only need to clear the PTE
>>>> entries for file-backed large folios.
>>>
>>> Yep. It is actually quite straightforward to go from lazyfree
>>> anon folios to file folios. Swap-backed anon folios are much
>>> more tricky, though.
>>
>> Agree. Thanks Barry for reviewing and confirming.
> 
> OK that makes me less concerned, but you do need to put some more justification
> in the commit message.

Sure. Will do.

