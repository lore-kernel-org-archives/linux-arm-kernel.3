Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 555EBD4A5F4
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 18 Jan 2026 05:48:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nN7mk/B18u5vi4ZbP3jpCZ2+drO4Ozs0PMf/ZFASc2M=; b=KFguFddUj/hj5XQ0JW1dRV44Mi
	RUJMR965XO/0yRSTp/TZO6Krc4WAM4U8R+73r1yGjNjk2aZo2CZgvCHMOAF0TrfTr+i0tuYMwFwAU
	8vgE9CyhpJrvt4C0mTpoy+2D4JCsfijF6z0yGOh4suVLSILJtiPtDpDmPeEwdslhm+GVvMsoXx6ya
	ngcloZlUO6F5K3Lhzs+EnX9KPRIm0Xy7hzXzRmJVdJTXU/U3PTSkaj74OqGfgaBaGCq1q4K+Vx+ni
	diDMfIMrky4CfgQ0WLeC1Z2/ChFWQ7sod4le7Q89XhkRqmXbUFLQ7uPtodcN7YUqMIv7BmbXeYs2h
	cZsOGD4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhLeH-0000000GqJX-2wVo;
	Sun, 18 Jan 2026 05:48:29 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhLeF-0000000GqIg-1jVp
	for linux-arm-kernel@lists.infradead.org;
	Sun, 18 Jan 2026 05:48:28 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A3D2F1650;
	Sat, 17 Jan 2026 21:48:18 -0800 (PST)
Received: from [10.164.10.251] (unknown [10.164.10.251])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 45E733F632;
	Sat, 17 Jan 2026 21:48:19 -0800 (PST)
Message-ID: <467ab4d7-1ce2-48d4-bff6-6579216569e2@arm.com>
Date: Sun, 18 Jan 2026 11:18:16 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 5/5] mm: rmap: support batched unmapping for file large
 folios
To: Barry Song <21cnbao@gmail.com>
Cc: Wei Yang <richard.weiyang@gmail.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>, akpm@linux-foundation.org,
 david@kernel.org, catalin.marinas@arm.com, will@kernel.org,
 lorenzo.stoakes@oracle.com, ryan.roberts@arm.com, Liam.Howlett@oracle.com,
 vbabka@suse.cz, rppt@kernel.org, surenb@google.com, mhocko@suse.com,
 riel@surriel.com, harry.yoo@oracle.com, jannh@google.com,
 willy@infradead.org, linux-mm@kvack.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <cover.1766631066.git.baolin.wang@linux.alibaba.com>
 <142919ac14d3cf70cba370808d85debe089df7b4.1766631066.git.baolin.wang@linux.alibaba.com>
 <20260106132203.kdxfvootlkxzex2l@master>
 <CAGsJ_4yKRtyADU2ZxUMgvqdrhAEL4SpZxCMRt28gNJfUf--5zQ@mail.gmail.com>
 <20260107014601.dxvq6b7ljgxwg7iu@master>
 <db4d0a19-598b-48ff-accc-f5940a481035@arm.com>
 <CAGsJ_4zAxhSDqvN5tzSeHR-kifaxm_GbPhHCeSkYsRJk=uHN-Q@mail.gmail.com>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <CAGsJ_4zAxhSDqvN5tzSeHR-kifaxm_GbPhHCeSkYsRJk=uHN-Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260117_214827_491472_5B654BB1 
X-CRM114-Status: GOOD (  13.85  )
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


On 16/01/26 8:44 pm, Barry Song wrote:
>>> I mean maybe we can skip it in try_to_unmap_one(), for example:
>>>
>>> diff --git a/mm/rmap.c b/mm/rmap.c
>>> index 9e5bd4834481..ea1afec7c802 100644
>>> --- a/mm/rmap.c
>>> +++ b/mm/rmap.c
>>> @@ -2250,6 +2250,10 @@ static bool try_to_unmap_one(struct folio *folio, struct vm_area_struct *vma,
>>>                */
>>>               if (nr_pages == folio_nr_pages(folio))
>>>                       goto walk_done;
>>> +             else {
>>> +                     pvmw.address += PAGE_SIZE * (nr_pages - 1);
>>> +                     pvmw.pte += nr_pages - 1;
>>> +             }
>>>               continue;
>>>  walk_abort:
>>>               ret = false;
>> I am of the opinion that we should do something like this. In the internal pvmw code,
>> we keep skipping ptes till the ptes are none. With my proposed uffd-fix [1], if the old
>> ptes were uffd-wp armed, pte_install_uffd_wp_if_needed will convert all ptes from none
>> to not none, and we will lose the batching effect. I also plan to extend support to
>> anonymous folios (therefore generalizing for all types of memory) which will set a
> I posted an RFC on anon folios quite some time ago [1].
> It’s great to hear that you’re interested in taking this over.
>
> [1] https://lore.kernel.org/all/20250513084620.58231-1-21cnbao@gmail.com/

Great! Now I have a reference to look at :)

>
>> batch of ptes as swap, and the internal pvmw code won't be able to skip through the
>> batch.
> Interesting — I didn’t catch this issue in the RFC earlier. Back then,
> we only supported nr == 1 and nr == folio_nr_pages(folio). When
> nr == nr_pages, page_vma_mapped_walk() would break entirely. With
> Lance’s commit ddd05742b45b08, arbitrary nr in [1, nr_pages] is now
> supported, which means we have to handle all the complexity. :-)
>
> Thanks
> Barry

