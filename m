Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24C65F3028C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Mar 2026 06:25:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GHrVuzmWPg0Uih3557YZ5qAt41GrwBcJIT++eX/grpM=; b=wAjoqgA5Nzs7uQt1E3vmSr5i2a
	MJavxkVgK7MfQik3h81be7p38UIS3ZIsmKrW/yHNx0QMjfcnTM9cUsw9tEW9q2iMuphV5rol3CAtm
	UybqCWBWZvEeDsu/y9iF3G/xnCI07rTknOsd9af+zttFjXLwChe+E+uy/j7QneFfEOWPKyYtfSakq
	yahAMF0fT/yKWJeIau5hdtzPKxzt+CPMMoYpS4BcdpRqjuxqq32M2JpMGNKHLqy5qn/A7HMEUep+t
	3sb/FSggO7+ImbbLgWf2/LZyzViyKGy5mqQAoYpZ2ptIz9wH3/79hDbxyEwh9E94vdRRpC4tAlBFO
	3pmbPXAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w21OW-00000003PXP-1G15;
	Mon, 16 Mar 2026 06:25:40 +0000
Received: from out30-119.freemail.mail.aliyun.com ([115.124.30.119])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w21OR-00000003PWS-2jPT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Mar 2026 06:25:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1773642327; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=GHrVuzmWPg0Uih3557YZ5qAt41GrwBcJIT++eX/grpM=;
	b=Rwm3USXLBwbIr5TgtnokrpEEpsZNZrQNa6SRTI+b/ih5qjg5Yb3VY1PLNSmxEeluAhJ7yGk54vlLQHbs9bJPhy5i0FgZjqhyVIRhWZk8xgAz8EilXYHMubSMg+zdj8z1UG8jKoy10w1Eg28CZTQSnM3uL8K//zdBMXTlofZFrwQ=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R141e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037033178;MF=baolin.wang@linux.alibaba.com;NM=1;PH=DS;RN=20;SR=0;TI=SMTPD_---0X..tuWa_1773642316;
Received: from 30.74.144.148(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0X..tuWa_1773642316 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 16 Mar 2026 14:25:17 +0800
Message-ID: <e54e0ec1-b968-4e12-84a3-4e3d331b1c36@linux.alibaba.com>
Date: Mon, 16 Mar 2026 14:25:15 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/5] mm: rmap: support batched checks of the references
 for large folios
To: "David Hildenbrand (Arm)" <david@kernel.org>,
 Barry Song <21cnbao@gmail.com>
Cc: akpm@linux-foundation.org, catalin.marinas@arm.com, will@kernel.org,
 lorenzo.stoakes@oracle.com, ryan.roberts@arm.com, Liam.Howlett@oracle.com,
 vbabka@suse.cz, rppt@kernel.org, surenb@google.com, mhocko@suse.com,
 riel@surriel.com, harry.yoo@oracle.com, jannh@google.com,
 willy@infradead.org, dev.jain@arm.com, linux-mm@kvack.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <cover.1770645603.git.baolin.wang@linux.alibaba.com>
 <12132694536834262062d1fb304f8f8a064b6750.1770645603.git.baolin.wang@linux.alibaba.com>
 <CAGsJ_4yEWn3kVZPQZatOJX7NLLv-OK9pAqUDuWz25XxG5hpV=w@mail.gmail.com>
 <a4d7cf56-eab4-431d-886b-a32456e44736@linux.alibaba.com>
 <CAGsJ_4woBVQdYcCbN1Btr2vxOL8OAujaHkNZZ41=S-TdNh-wbw@mail.gmail.com>
 <d6820b1e-52ae-4ef2-8342-11818fdd0cb1@linux.alibaba.com>
 <43831628-a00f-4292-9797-cb96a029bb00@kernel.org>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <43831628-a00f-4292-9797-cb96a029bb00@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260315_232536_800729_3C892509 
X-CRM114-Status: GOOD (  10.96  )
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



On 3/10/26 4:17 PM, David Hildenbrand (Arm) wrote:
> On 3/10/26 02:37, Baolin Wang wrote:
>>
>>
>> On 3/7/26 4:02 PM, Barry Song wrote:
>>> On Sat, Mar 7, 2026 at 10:22 AM Baolin Wang
>>> <baolin.wang@linux.alibaba.com> wrote:
>>>>
>>>>
>>>>
>>>>
>>>> Thanks.
>>>>
>>>>
>>>> Yes. In addition, this will involve many architectures’ implementations
>>>> and their differing TLB flush mechanisms, so it’s difficult to make a
>>>> reasonable per-architecture measurement. If any architecture has a more
>>>> efficient flush method, I’d prefer to implement an architecture‑specific
>>>> clear_flush_young_ptes().
>>>
>>> Right! Since TLBI is usually quite expensive, I wonder if a generic
>>> implementation for architectures lacking clear_flush_young_ptes()
>>> might benefit from something like the below (just a very rough idea):
>>>
>>> int clear_flush_young_ptes(struct vm_area_struct *vma,
>>>                   unsigned long addr, pte_t *ptep, unsigned int nr)
>>> {
>>>           unsigned long curr_addr = addr;
>>>           int young = 0;
>>>
>>>           while (nr--) {
>>>                   young |= ptep_test_and_clear_young(vma, curr_addr,
>>> ptep);
>>>                   ptep++;
>>>                   curr_addr += PAGE_SIZE;
>>>           }
>>>
>>>           if (young)
>>>                   flush_tlb_range(vma, addr, curr_addr);
>>>           return young;
>>> }
>>
>> I understand your point. I’m concerned that I can’t test this patch on
>> every architecture to validate the benefits. Anyway, let me try this on
>> my X86 machine first.
> 
> In any case, please make that a follow-up patch :)

Sure. However, after investigating RISC‑V and x86, I found that 
ptep_clear_flush_young() does not flush the TLB on these architectures:

int ptep_clear_flush_young(struct vm_area_struct *vma,
			   unsigned long address, pte_t *ptep)
{
	/*
	 * On x86 CPUs, clearing the accessed bit without a TLB flush
	 * doesn't cause data corruption. [ It could cause incorrect
	 * page aging and the (mistaken) reclaim of hot pages, but the
	 * chance of that should be relatively low. ]
	 *
	 * So as a performance optimization don't flush the TLB when
	 * clearing the accessed bit, it will eventually be flushed by
	 * a context switch or a VM operation anyway. [ In the rare
	 * event of it not getting flushed for a long time the delay
	 * shouldn't really matter because there's no real memory
	 * pressure for swapout to react to. ]
	 */
	return ptep_test_and_clear_young(vma, address, ptep);
}

I don't have access to other architectures, so I think we can postpone 
this optimization unless someone is interested in optimizing the TLB flush.

