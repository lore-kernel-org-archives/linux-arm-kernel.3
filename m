Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 093EAD5B161
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Dec 2025 06:22:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UDB4pFFOjEqefI5bQmHueWu/FzeTwPye7J8dm3yHS5M=; b=vHPI8z64/2xUwEJ1JLKqHpE9PQ
	/yI85vQVv4YqtmbXkbMHaEQ2/WqTuJtxYonniWN5eGZWTkf6LZDnvx3wDbGY8LLPnnJnDGoc1vF3B
	HpWM1e9LI32Qmf3b8iEaUmlUXHKhKHhLmWcHAfop1qmHRPOnD+P1WkjdifDEw2QbygHN4qGD9+u1k
	NTq7GbKW/cWJsK4jdXG1lrXuyqztIpe5+asmR4Wr1pveHUq3yaLbZ3s6dvL1bs+ufuEdvr9aFNbv0
	pzMRe2BONa82WCoTCMWeKrg4BCgAAhTgZSyqLOc2MYLP1ZGaQ8DMD/e4CU+CXl80iZ8s+yUsxjTdN
	dxRSSjEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVORv-00000004lyi-2wt5;
	Tue, 16 Dec 2025 06:22:19 +0000
Received: from out30-101.freemail.mail.aliyun.com ([115.124.30.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVORs-00000004lyH-2zFf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Dec 2025 06:22:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1765866133; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=UDB4pFFOjEqefI5bQmHueWu/FzeTwPye7J8dm3yHS5M=;
	b=detDNI5LmlcWHMNgKnzoxCjD7vdWlvEuo9F87H+bTMV4IXIwptHvTrCa2E97ztjNMGEvts9CF196o3j94jfsJ86mA0NjsIgYh5W/bfhKCGGx6kZeOZbX/gdC3UB/3XFaSKMfq8oqV5bAlHCBfGPwIQC3FR4FguoqaSjxiJ2QOaU=
Received: from 30.74.144.116(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0WuxwDsf_1765866131 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 16 Dec 2025 14:22:11 +0800
Message-ID: <9e038290-70ff-458d-b46d-bc512c3442be@linux.alibaba.com>
Date: Tue, 16 Dec 2025 14:22:11 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] mm: rmap: support batched unmapping for file large
 folios
To: Barry Song <21cnbao@gmail.com>
Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, akpm@linux-foundation.org,
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
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <CAGsJ_4xp40A3u=N5_mw00Eo6bPmFvctD3j=1Qmy3vOo2EmX3hA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251215_222217_182972_A56EC60C 
X-CRM114-Status: GOOD (  12.80  )
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



On 2025/12/16 14:13, Barry Song wrote:
>>>>
>>>> diff --git a/mm/rmap.c b/mm/rmap.c
>>>> index ec232165c47d..4c9d5777c8da 100644
>>>> --- a/mm/rmap.c
>>>> +++ b/mm/rmap.c
>>>> @@ -1855,9 +1855,10 @@ static inline unsigned int folio_unmap_pte_batch(struct folio *folio,
>>>>       end_addr = pmd_addr_end(addr, vma->vm_end);
>>>>       max_nr = (end_addr - addr) >> PAGE_SHIFT;
>>>>
>>>> -    /* We only support lazyfree batching for now ... */
>>>> -    if (!folio_test_anon(folio) || folio_test_swapbacked(folio))
>>>> +    /* We only support lazyfree or file folios batching for now ... */
>>>> +    if (folio_test_anon(folio) && folio_test_swapbacked(folio))
>>>
>>> Why is it now ok to support file-backed batched unmapping when it wasn't in
>>> Barry's series (see [0])? You don't seem to be justifying this?
>>
>> Barry's series[0] is merely aimed at optimizing lazyfree anonymous large
>> folios and does not continue to optimize anonymous large folios or
>> file-backed large folios at that point.
> 
> Yep. At that time, I didn’t have an Android machine with a filesystem
> that supported large folios, so I focused on lazyfree. But I
> agree that lazyfree anon folios and file folios are quite
> similar.
> 
>>
>> Subsequently, Barry sent out a new patch (see [1]) to optimize anonymous
>> large folios. As for file-backed large folios, the batched unmapping
>> support is relatively simple, since we only need to clear the PTE
>> entries for file-backed large folios.
> 
> Yep. It is actually quite straightforward to go from lazyfree
> anon folios to file folios. Swap-backed anon folios are much
> more tricky, though.

Agree. Thanks Barry for reviewing and confirming.

