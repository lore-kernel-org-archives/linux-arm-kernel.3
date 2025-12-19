Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15A54D711CE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Dec 2025 00:56:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t2o/Vumy+Nw5btbRIBN01nzQJNm6p8LL2tmTgt6B/0g=; b=DdOY3e99Mm+89uT2sMZlSia+MR
	CXLACEqyXACln0Kz3CBIzuxZY6j+fuC0EF6wHJVRw4bL2Bk8t5H8eu23d3/Dfr9BsfFzVE1V5ZY2B
	YLGrnb1ScIFGRjvc82X1l7Qg8HTrA+MzvBVsg9/DkXh7w7jJd9lkc2HiMGLEGnxCI8caWjun11RkY
	ntc/c0l+v8XgjScRwKZVkn4b3C1OAG/Ym6hmWIBOWCEEmdAmrPw16oTGBwL4YN2IAWhU9UF8tMcg6
	+lyili1DIeVph9ce+kOoHVlgxoYQwWMDNN7Z8reIpMCOqtO+8cd37k+tuh6Nb/eiKGs+jx6J5rAPp
	PKWNZgnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWOnB-00000009PME-0Lgt;
	Fri, 19 Dec 2025 00:56:25 +0000
Received: from out30-118.freemail.mail.aliyun.com ([115.124.30.118])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWOn6-00000009PLI-3yEz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Dec 2025 00:56:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1766105776; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=t2o/Vumy+Nw5btbRIBN01nzQJNm6p8LL2tmTgt6B/0g=;
	b=OtDbTV60eD9Eh+zRDiRnRD/OC86icvuefQskLgpTvsF+cy6AB5X1aEbzO1OICvgmle0PT8/CxBZiHrWdw1PGYmRAhYzxjAQhfDVU1YpzfxzCMoLbYFl8H8KeNX/SBYhCO8KthB1ao0++8jwZgk4EwC4wSNQaYRT9nhCJzbmjzhg=
Received: from 30.74.144.116(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0WvASlNx_1766105770 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 19 Dec 2025 08:56:11 +0800
Message-ID: <121c8ffb-adff-4766-aae9-8be6d37d546a@linux.alibaba.com>
Date: Fri, 19 Dec 2025 08:56:09 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] mm: rmap: support batched checks of the references
 for large folios
To: Ryan Roberts <ryan.roberts@arm.com>, akpm@linux-foundation.org,
 david@kernel.org, catalin.marinas@arm.com, will@kernel.org
Cc: lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com, vbabka@suse.cz,
 rppt@kernel.org, surenb@google.com, mhocko@suse.com, riel@surriel.com,
 harry.yoo@oracle.com, jannh@google.com, willy@infradead.org,
 baohua@kernel.org, linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <cover.1765439380.git.baolin.wang@linux.alibaba.com>
 <545dba5e899634bc6c8ca782417d16fef3bd049f.1765439381.git.baolin.wang@linux.alibaba.com>
 <cb4d7243-d8c6-4706-a254-6f5afc148910@arm.com>
 <89cdd927-fc88-42cf-b8a1-2fbd736d5f7c@linux.alibaba.com>
 <0caffb55-f242-4b01-b60a-c8749aadf661@arm.com>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <0caffb55-f242-4b01-b60a-c8749aadf661@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_165621_657585_FAE3E8D6 
X-CRM114-Status: GOOD (  11.18  )
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



On 2025/12/18 20:08, Ryan Roberts wrote:
>>>>    +#define clear_flush_young_ptes clear_flush_young_ptes
>>>> +static inline int clear_flush_young_ptes(struct vm_area_struct *vma,
>>>> +                    unsigned long addr, pte_t *ptep,
>>>> +                    unsigned int nr)
>>>> +{
>>>> +    if (likely(nr == 1))
>>>> +        return __ptep_clear_flush_young(vma, addr, ptep);
>>>
>>> Bug: This is broken if core-mm tries to call this for nr=1 on a pte that is part
>>> of a contpte mapping.
>>>
>>> The similar fastpaths are here to prevent regressing the common small folio case.
>>
>> Thanks for catching this. I had considered this before, but I still missed it.
>>
>>> I guess here the best approach is (note no leading underscores):
>>>
>>>      if (likely(nr == 1))
>>>          return ptep_clear_flush_young(vma, addr, ptep);
>>
>> However, I prefer to use pte_cont() to check it. Later, I plan to clean up the
>> ptep_clear_flush_young().
>>
>>      if (nr == 1 && !pte_cont(__ptep_get(ptep))
>>          return __ptep_clear_flush_young(vma, addr, ptep);
> 
> Sure. That would follow the pattern in clear_young_dirty_ptes(). Please use the
> likely() hint as is done everywhere else:
> 
> 	if (likely(nr == 1 && !pte_cont(__ptep_get(ptep))))

Sure.

> I notice that ptep_test_and_clear_young() and ptep_clear_flush_young() are both
> testing aginst pte_valid_cont(). These could probably be relaxed to pte_cont()
> since it is implicit the the pte must be valid?

Yes, I think so. I can do a cleanup later in a separate patch.

