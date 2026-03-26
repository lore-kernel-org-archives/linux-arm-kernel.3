Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0FDD109E52B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 01:48:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H8uD3fXoJUVKVQlQPb1UgplQm2Umx6AyBtREGpInkaM=; b=Pi99fKp8zrNxFb/2vJpDadE4sT
	DEbxLHMXb4E49pNsvebwTpM2r3NCA3wPMaHHuDabDax4dA+lg+FDJFavr0jHI82+HsdLoum7Qe5ps
	4DFuH4szFFbpBfv6sAdd2i19eJwc7hoKIHOKaJikY3B/skpNwcgg2sI1Lp0WLGtLbBgy241fQv95l
	qRZcOP7PnjXJTqJ8J38vw7vVgaNQaqdjyJYoxizGDx/WChHYUtQ0GTvL/ZPyrlc0rJ0X8eDFbKNFj
	qeA0Bf8euGA8PtE6lWoByqdxznS2DhIMnKrMbLo+NLXelAgLOLeiiyAd6mIwaZMZgrrHu3/yuo/Mf
	RXdok4Tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5ZpN-00000004Xex-3wEk;
	Thu, 26 Mar 2026 01:48:05 +0000
Received: from out30-132.freemail.mail.aliyun.com ([115.124.30.132])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5ZpK-00000004Xe2-001H
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Mar 2026 01:48:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1774489674; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=H8uD3fXoJUVKVQlQPb1UgplQm2Umx6AyBtREGpInkaM=;
	b=EF3koCnKfebTyiOrU7IFleaG4W9jjVjbGQmJDFXmKOkOzcWNcRTOlbdk9tP4DejgcWMD3/aIJnpTjElLxoEF4wTDGQFxaaF5SJUL2q1qPVo+kQRnHpcFnYVNtryhjDA64kQIc8ot3HDG5cGERsupr2Lsex7yJNg24mT+JuBf95o=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R181e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037026112;MF=baolin.wang@linux.alibaba.com;NM=1;PH=DS;RN=21;SR=0;TI=SMTPD_---0X.jfTBI_1774489671;
Received: from 30.74.144.123(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0X.jfTBI_1774489671 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 26 Mar 2026 09:47:52 +0800
Message-ID: <bfd282b1-523d-4945-97a0-ec30fe1df577@linux.alibaba.com>
Date: Thu, 26 Mar 2026 09:47:51 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/5] mm: rmap: support batched checks of the references
 for large folios
To: "Lorenzo Stoakes (Oracle)" <ljs@kernel.org>,
 "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Barry Song <21cnbao@gmail.com>, akpm@linux-foundation.org,
 catalin.marinas@arm.com, will@kernel.org, lorenzo.stoakes@oracle.com,
 ryan.roberts@arm.com, Liam.Howlett@oracle.com, vbabka@suse.cz,
 rppt@kernel.org, surenb@google.com, mhocko@suse.com, riel@surriel.com,
 harry.yoo@oracle.com, jannh@google.com, willy@infradead.org,
 dev.jain@arm.com, linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <12132694536834262062d1fb304f8f8a064b6750.1770645603.git.baolin.wang@linux.alibaba.com>
 <CAGsJ_4yEWn3kVZPQZatOJX7NLLv-OK9pAqUDuWz25XxG5hpV=w@mail.gmail.com>
 <a4d7cf56-eab4-431d-886b-a32456e44736@linux.alibaba.com>
 <CAGsJ_4woBVQdYcCbN1Btr2vxOL8OAujaHkNZZ41=S-TdNh-wbw@mail.gmail.com>
 <d6820b1e-52ae-4ef2-8342-11818fdd0cb1@linux.alibaba.com>
 <43831628-a00f-4292-9797-cb96a029bb00@kernel.org>
 <e54e0ec1-b968-4e12-84a3-4e3d331b1c36@linux.alibaba.com>
 <86f611cb-1292-44e4-b629-6503135d33ca@kernel.org>
 <e5cb474a-a84d-4edc-8289-d68378feee7d@lucifer.local>
 <e3e374cc-ddf2-4112-b063-6cb1839ea566@kernel.org>
 <e227a7f7-0186-4d10-b7b4-c84ca8424bdd@lucifer.local>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <e227a7f7-0186-4d10-b7b4-c84ca8424bdd@lucifer.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_184802_747031_4BC03556 
X-CRM114-Status: GOOD (  13.22  )
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



On 3/25/26 11:06 PM, Lorenzo Stoakes (Oracle) wrote:
> On Wed, Mar 25, 2026 at 03:58:36PM +0100, David Hildenbrand (Arm) wrote:
>> On 3/25/26 15:36, Lorenzo Stoakes (Oracle) wrote:
>>> On Mon, Mar 16, 2026 at 03:15:18PM +0100, David Hildenbrand (Arm) wrote:
>>>> On 3/16/26 07:25, Baolin Wang wrote:
>>>>>
>>>>>
>>>>>
>>>>> Sure. However, after investigating RISC‑V and x86, I found that
>>>>> ptep_clear_flush_young() does not flush the TLB on these architectures:
>>>>>
>>>>> int ptep_clear_flush_young(struct vm_area_struct *vma,
>>>>>                 unsigned long address, pte_t *ptep)
>>>>> {
>>>>>      /*
>>>>>       * On x86 CPUs, clearing the accessed bit without a TLB flush
>>>>>       * doesn't cause data corruption. [ It could cause incorrect
>>>>>       * page aging and the (mistaken) reclaim of hot pages, but the
>>>>>       * chance of that should be relatively low. ]
>>>>>       *
>>>>>       * So as a performance optimization don't flush the TLB when
>>>>>       * clearing the accessed bit, it will eventually be flushed by
>>>>>       * a context switch or a VM operation anyway. [ In the rare
>>>>>       * event of it not getting flushed for a long time the delay
>>>>>       * shouldn't really matter because there's no real memory
>>>>>       * pressure for swapout to react to. ]
>>>>>       */
>>>>>      return ptep_test_and_clear_young(vma, address, ptep);
>>>>> }
>>>>
>>>> You'd probably want an arch helper then, that tells you whether
>>>> a flush_tlb_range() after ptep_test_and_clear_young() is required.
>>>>
>>>> Or some special flush_tlb_range() helper.
>>>>
>>>> I agree that it requires more work.

(Sorry, David. I forgot to reply to your email because I've had a lot to 
sort out recently.)

Rather than adding more arch helpers (we already have plenty for the 
young flag check), I think we should try removing the TLB flush, as I 
mentioned to Barry[1]. MGLRU reclaim already skips the TLB flush, and it 
seems to work fine. What do you think?

Here are our previous attempts to remove the TLB flush:

My patch: https://lkml.org/lkml/2023/10/24/533
Barry's patch:
https://lore.kernel.org/lkml/20220617070555.344368-1-21cnbao@gmail.com/

[1] 
https://lore.kernel.org/all/6bdc4b03-9631-4717-a3fa-2785a7930aba@linux.alibaba.com/

>>> Sorry unclear here - does the series need more work or does a follow up patch
>>> need more work?
>>
>> Follow up!
> 
> Ok good as in mm-stable now. Sadly means I don't get to review it but there we
> go.

Actually this patchset has already been merged upstream:)

