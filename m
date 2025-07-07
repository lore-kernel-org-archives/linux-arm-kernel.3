Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6F1BC83F07
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Jul 2025 09:49:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CgyqmMgmj4RoHL2MEMeBZbWgZV9nUOOsFAtiV0PoOpY=; b=yew8WyMSdBkXcTdDOr8KCsTL31
	khAyVof5m2nckUnWiYQIXWXdonDHiCgSORmImNVLp11irswleEcMy7H/BnTAyNhso3J4PMbOA/q54
	b7VPCcFKJ4Etmwl9q8CfTUitxKsSI+Er4bOSdVBgX2l0+4u13e56ag5perfpfehzLv/orTL+oIEGR
	CzuoQ5EgkAieNmBnjOCI1aa++hHtlgOj4TiqvPwffbojZExYQl/I2skCF4dfIM1fDHKuoK8ZEVE2z
	14TFR7nB89TLISnT4BEs7dtmwU2lLCZJLWEhmmFFzsC0eMcjO5wnXdaD9xQtW2QVS/lvQFHQrn/fo
	2l/y9nag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYiT8-000000022Qm-1KAc;
	Mon, 07 Jul 2025 09:49:03 +0000
Received: from out-180.mta0.migadu.com ([2001:41d0:1004:224b::b4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYhx2-00000001wki-005a
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Jul 2025 09:15:53 +0000
Message-ID: <072268ae-3dea-46f8-8c9e-203d062eab82@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1751879626;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CgyqmMgmj4RoHL2MEMeBZbWgZV9nUOOsFAtiV0PoOpY=;
	b=ZfLbEP/vZq2o4+akgW+lc4Afrvl/00HiSK0NwhRm0A7WUXvct0BrON8rtglHmdzeq5KYSC
	Xv/RTbWP+ZfT7gszBHH2OFBdN1XVATLskmoyuwGiwM4ktvtQnzZuftIU1kgvxkqx71qwzm
	jpzJevRaDNfnRPuYyjDh/EXfDo5znqo=
Date: Mon, 7 Jul 2025 17:13:24 +0800
MIME-Version: 1.0
Subject: Re: [PATCH v4 1/1] mm/rmap: fix potential out-of-bounds page table
 access during batched unmap
Content-Language: en-US
To: Harry Yoo <harry.yoo@oracle.com>
Cc: akpm@linux-foundation.org, david@redhat.com, 21cnbao@gmail.com,
 baolin.wang@linux.alibaba.com, chrisl@kernel.org, kasong@tencent.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, linux-riscv@lists.infradead.org,
 lorenzo.stoakes@oracle.com, ryan.roberts@arm.com, v-songbaohua@oppo.com,
 x86@kernel.org, huang.ying.caritas@gmail.com, zhengtangquan@oppo.com,
 riel@surriel.com, Liam.Howlett@oracle.com, vbabka@suse.cz,
 mingzhe.yang@ly.com, stable@vger.kernel.org, Barry Song <baohua@kernel.org>,
 Lance Yang <ioworker0@gmail.com>
References: <20250701143100.6970-1-lance.yang@linux.dev>
 <aGtdwn0bLlO2FzZ6@harry>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Lance Yang <lance.yang@linux.dev>
In-Reply-To: <aGtdwn0bLlO2FzZ6@harry>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_021552_182618_A35B844F 
X-CRM114-Status: GOOD (  22.21  )
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



On 2025/7/7 13:40, Harry Yoo wrote:
> On Tue, Jul 01, 2025 at 10:31:00PM +0800, Lance Yang wrote:
>> From: Lance Yang <lance.yang@linux.dev>
>>
>> As pointed out by David[1], the batched unmap logic in try_to_unmap_one()
>> may read past the end of a PTE table when a large folio's PTE mappings
>> are not fully contained within a single page table.
>>
>> While this scenario might be rare, an issue triggerable from userspace must
>> be fixed regardless of its likelihood. This patch fixes the out-of-bounds
>> access by refactoring the logic into a new helper, folio_unmap_pte_batch().
>>
>> The new helper correctly calculates the safe batch size by capping the scan
>> at both the VMA and PMD boundaries. To simplify the code, it also supports
>> partial batching (i.e., any number of pages from 1 up to the calculated
>> safe maximum), as there is no strong reason to special-case for fully
>> mapped folios.
>>
>> [1] https://lore.kernel.org/linux-mm/a694398c-9f03-4737-81b9-7e49c857fcbe@redhat.com
>>
>> Cc: <stable@vger.kernel.org>
>> Reported-by: David Hildenbrand <david@redhat.com>
>> Closes: https://lore.kernel.org/linux-mm/a694398c-9f03-4737-81b9-7e49c857fcbe@redhat.com
>> Fixes: 354dffd29575 ("mm: support batched unmap for lazyfree large folios during reclamation")
>> Suggested-by: Barry Song <baohua@kernel.org>
>> Acked-by: Barry Song <baohua@kernel.org>
>> Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
>> Acked-by: David Hildenbrand <david@redhat.com>
>> Signed-off-by: Lance Yang <lance.yang@linux.dev>
>> ---
> 
> LGTM,
> Reviewed-by: Harry Yoo <harry.yoo@oracle.com>

Hi Harry,

Thanks for taking time to review!

> 
> With a minor comment below.
> 
>> diff --git a/mm/rmap.c b/mm/rmap.c
>> index fb63d9256f09..1320b88fab74 100644
>> --- a/mm/rmap.c
>> +++ b/mm/rmap.c
>> @@ -2206,13 +2213,16 @@ static bool try_to_unmap_one(struct folio *folio, struct vm_area_struct *vma,
>>   			hugetlb_remove_rmap(folio);
>>   		} else {
>>   			folio_remove_rmap_ptes(folio, subpage, nr_pages, vma);
>> -			folio_ref_sub(folio, nr_pages - 1);
>>   		}
>>   		if (vma->vm_flags & VM_LOCKED)
>>   			mlock_drain_local();
>> -		folio_put(folio);
>> -		/* We have already batched the entire folio */
>> -		if (nr_pages > 1)
>> +		folio_put_refs(folio, nr_pages);
>> +
>> +		/*
>> +		 * If we are sure that we batched the entire folio and cleared
>> +		 * all PTEs, we can just optimize and stop right here.
>> +		 */
>> +		if (nr_pages == folio_nr_pages(folio))
>>   			goto walk_done;
> 
> Just a minor comment.
> 
> We should probably teach page_vma_mapped_walk() to skip nr_pages pages,
> or just rely on next_pte: do { ... } while (pte_none(ptep_get(pvmw->pte)))
> loop in page_vma_mapped_walk() to skip those ptes?

Good point. We handle partially-mapped folios by relying on the "next_pte"
loop to skip those ptes. The common case we expect to handle is fully-mapped
folios.

> 
> Taking different paths depending on (nr_pages == folio_nr_pages(folio))
> doesn't seem sensible.

Adding more logic to page_vma_mapped_walk() for the rare partial-folio
case seems like an over-optimization that would complicate the walker.

So, I'd prefer to keep it as is for now ;)


