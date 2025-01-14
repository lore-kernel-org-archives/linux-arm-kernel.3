Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C8FCE77188
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jan 2025 07:52:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+6aBypYiXpsnIYYHDG4FFvYm+u76PpmDT44lIRDZKQU=; b=sZuiXPyR9Q+keXCSF25U7Xe0ey
	0BUCr+l0KXvW2Hg0/EhQTnFnqXqYwc42Ouo7kjHnOJ0z3WsGbQHK50GdRiixZa2XTSLnWTJHR5X2d
	3aZfeEA3pPqnS7wqtooD2vbdunNFbPFn/pI1he5eJc8CcVN8XLgWeWyoZxEM9qqFs2HW7YpfgZiOI
	rdG/TMW3WUTK3xigDFjKWz9LQcreYwYr1UiF0LSXHXWyhdp81tHREKpPhF+w8axiJ1JQ4suR4zRdf
	6OFS10A62tOXqJ+DnUHV8LtJ0vG6f89IMq39mkMGKMLNd+HVACn1EjJ7Zqiw2GFz/5PJ4vn93dPfs
	e9pTs5WQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXbjD-00000007jr1-0jmQ;
	Tue, 14 Jan 2025 07:52:47 +0000
Received: from out30-112.freemail.mail.aliyun.com ([115.124.30.112])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXbhx-00000007jiT-21QK;
	Tue, 14 Jan 2025 07:51:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1736841084; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=+6aBypYiXpsnIYYHDG4FFvYm+u76PpmDT44lIRDZKQU=;
	b=PWw61iIBMXUk4YvB3euwT8EQAS8iRj8xwdOPVj9H7Pvlxi+oEERO1nxPhyM+UV8tWNvPGGjtTaEI4AkIy6nCj+zvIxEA6dF7OQrjALsmajtQuzQusZJJrJ7Yepk71G1exL/3D+3hjWhahd6E1oUUpFIeNRj22+TKLw4Re3U/bfk=
Received: from 30.74.144.113(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0WNeTLfB_1736841079 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 14 Jan 2025 15:51:20 +0800
Message-ID: <c63ac79b-aebb-4308-aa36-cde62d190a62@linux.alibaba.com>
Date: Tue, 14 Jan 2025 15:51:19 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] mm: Avoid splitting pmd for lazyfree pmd-mapped
 THP in try_to_unmap
To: Barry Song <21cnbao@gmail.com>
Cc: akpm@linux-foundation.org, chrisl@kernel.org, david@redhat.com,
 ioworker0@gmail.com, kasong@tencent.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, linux-riscv@lists.infradead.org,
 lorenzo.stoakes@oracle.com, ryan.roberts@arm.com, v-songbaohua@oppo.com,
 x86@kernel.org, ying.huang@intel.com, zhengtangquan@oppo.com
References: <20250114040914.9986-1-21cnbao@gmail.com>
 <20250114060059.14058-1-21cnbao@gmail.com>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <20250114060059.14058-1-21cnbao@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_235129_684536_AB9C5DBC 
X-CRM114-Status: GOOD (  12.37  )
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



On 2025/1/14 14:00, Barry Song wrote:
>>>>                if (!pvmw.pte) {
>>>> +                     lazyfree = folio_test_anon(folio) && !folio_test_swapbacked(folio);
>>>
>>> You've checked lazyfree here, so can we remove the duplicate check in
>>> unmap_huge_pmd_locked()? Then the code should be:
>>>
>>>                  if (lazyfree && unmap_huge_pmd_locked(...))
>>>                          goto walk_done;
>>
>>
>> right. it seems unmap_huge_pmd_locked() only handles lazyfree pmd-mapped
>> thp. so i guess the code could be:
>>
>> diff --git a/mm/huge_memory.c b/mm/huge_memory.c
>> index aea49f7125f1..c4c3a7896de4 100644
>> --- a/mm/huge_memory.c
>> +++ b/mm/huge_memory.c
>> @@ -3131,11 +3131,10 @@ bool unmap_huge_pmd_locked(struct vm_area_struct *vma, unsigned long addr,
>>          VM_WARN_ON_FOLIO(!folio_test_pmd_mappable(folio), folio);
>>          VM_WARN_ON_FOLIO(!folio_test_locked(folio), folio);
>>          VM_WARN_ON_ONCE(!IS_ALIGNED(addr, HPAGE_PMD_SIZE));
>> +       VM_WARN_ON_FOLIO(!folio_test_anon(folio), folio);
>> +       VM_WARN_ON_FOLIO(folio_test_swapbacked(folio), folio);
>>
>> -       if (folio_test_anon(folio) && !folio_test_swapbacked(folio))
>> -               return __discard_anon_folio_pmd_locked(vma, addr, pmdp, folio);
>> -
>> -       return false;
>> +       return __discard_anon_folio_pmd_locked(vma, addr, pmdp, folio);
>>   }
>>
>>   static void remap_page(struct folio *folio, unsigned long nr, int flags)
>> diff --git a/mm/rmap.c b/mm/rmap.c
>> index 02c4e4b2cd7b..72907eb1b8fe 100644
>> --- a/mm/rmap.c
>> +++ b/mm/rmap.c
>> @@ -1671,7 +1671,7 @@ static bool try_to_unmap_one(struct folio *folio, struct vm_area_struct *vma,
>>          DEFINE_FOLIO_VMA_WALK(pvmw, folio, vma, address, 0);
>>          pte_t pteval;
>>          struct page *subpage;
>> -       bool anon_exclusive, lazyfree, ret = true;
>> +       bool anon_exclusive, ret = true;
>>          struct mmu_notifier_range range;
>>          enum ttu_flags flags = (enum ttu_flags)(long)arg;
>>          int nr_pages = 1;
>> @@ -1724,18 +1724,16 @@ static bool try_to_unmap_one(struct folio *folio, struct vm_area_struct *vma,
>>                  }
>>
>>                  if (!pvmw.pte) {
>> -                       lazyfree = folio_test_anon(folio) && !folio_test_swapbacked(folio);
>> -
>> -                       if (unmap_huge_pmd_locked(vma, pvmw.address, pvmw.pmd,
>> -                                                 folio))
>> -                               goto walk_done;
>> -                       /*
>> -                        * unmap_huge_pmd_locked has either already marked
>> -                        * the folio as swap-backed or decided to retain it
>> -                        * due to GUP or speculative references.
>> -                        */
>> -                       if (lazyfree)
>> +                       if (folio_test_anon(folio) && !folio_test_swapbacked(folio)) {
>> +                               if (unmap_huge_pmd_locked(vma, pvmw.address, pvmw.pmd, folio))
>> +                                       goto walk_done;
>> +                               /*
>> +                                * unmap_huge_pmd_locked has either already marked
>> +                                * the folio as swap-backed or decided to retain it
>> +                                * due to GUP or speculative references.
>> +                                */
>>                                  goto walk_abort;
>> +                       }
>>
>>                          if (flags & TTU_SPLIT_HUGE_PMD) {
>>                                  /*
>>
>>>
>>>>                        if (unmap_huge_pmd_locked(vma, pvmw.address, pvmw.pmd,
>>>>                                                  folio))
>>>>                                goto walk_done;
>>>> +                     /*
>>>> +                      * unmap_huge_pmd_locked has either already marked
>>>> +                      * the folio as swap-backed or decided to retain it
>>>> +                      * due to GUP or speculative references.
>>>> +                      */
>>>> +                     if (lazyfree)
>>>> +                             goto walk_abort;
>>>>
>>>>                        if (flags & TTU_SPLIT_HUGE_PMD) {
>>>>                                /*
> 
> 
> 
> The final diff is as follows.
> Baolin, do you have any additional comments before I send out v3?

No other comments. Look good to me.

