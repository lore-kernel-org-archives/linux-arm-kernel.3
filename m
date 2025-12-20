Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59BB4E668AF
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 20 Dec 2025 04:29:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cO8WtEaXesAo47SuaG+o4/YJs4sol1oYaZp1SwxhQ0k=; b=O9yoO5YE5kGoy5z7GU5kop4ukT
	az2n4wB5xYwpsBb65b3b0EmQ93PPMTpFyejFyL+2/uhqD1YkyL3OJZlSj25mHi6nQ7dJEKn0pfZ3U
	D0qYBOibskXAInD5hExwPtgZdTBpq7nri8UKk0DMiQ41luFKV27VwR8w+p1FT+A82tAzlfzsqR/v4
	+uCCO/wQUt+TxCUNdf/kPHY5FE456fPEcX7As9mda9dU3k4SyCG+Xv+Fy9zqmJ0vmXUF2BzM8DTOK
	f3rYLJCpFSV+wC9Ouc/Gk4yPgw7nJSJHTDJQ7fKgTNBcHpIUre0jfz0imZqz9nYj5+RcHNHYhj5g0
	uMzF6PZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWoaq-0000000BIN4-0Fuo;
	Sat, 20 Dec 2025 04:29:24 +0000
Received: from out30-112.freemail.mail.aliyun.com ([115.124.30.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWoan-0000000BIMX-0mNm
	for linux-arm-kernel@lists.infradead.org;
	Sat, 20 Dec 2025 04:29:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1766204955; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=cO8WtEaXesAo47SuaG+o4/YJs4sol1oYaZp1SwxhQ0k=;
	b=woWtFC8DFaElUqBMdx6sb+qbrhswM5mFwAtjHxVfPA4Jti/ao60IsV+XS+Pd/xQ9ee/3WxdzeqqVNR/Rfa4V93Gx7OlIukWy+4gJf9ApQBzNJL6hRKuBpcgbj3+mpLMM616+CexNi+wCH8lEcdXcJMTJ90pFUnjI5fvbW5/zgvY=
Received: from 30.170.69.111(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0WvF13NW_1766204952 cluster:ay36)
          by smtp.aliyun-inc.com;
          Sat, 20 Dec 2025 12:29:13 +0800
Message-ID: <17b923c4-48cc-45f0-93fe-84a13568c1bf@linux.alibaba.com>
Date: Sat, 20 Dec 2025 12:29:11 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/5] mm: rmap: support batched checks of the references
 for large folios
To: Matthew Wilcox <willy@infradead.org>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, akpm@linux-foundation.org,
 david@kernel.org, catalin.marinas@arm.com, will@kernel.org,
 lorenzo.stoakes@oracle.com, ryan.roberts@arm.com, vbabka@suse.cz,
 rppt@kernel.org, surenb@google.com, mhocko@suse.com, riel@surriel.com,
 harry.yoo@oracle.com, jannh@google.com, baohua@kernel.org, dev.jain@arm.com,
 linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <cover.1766121341.git.baolin.wang@linux.alibaba.com>
 <24b9d33acad627997febe9b61d398fc53739a333.1766121341.git.baolin.wang@linux.alibaba.com>
 <x2s3l56rqwgcpkhpu77pjt65tfwgmchuy4fuyrj7h7uag5gja3@c3jbws4quxrd>
 <aUV4u9pOHxvQiDcP@casper.infradead.org>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <aUV4u9pOHxvQiDcP@casper.infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_202922_013077_1F9D0CA2 
X-CRM114-Status: GOOD (  12.90  )
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



On 2025/12/20 00:09, Matthew Wilcox wrote:
> On Fri, Dec 19, 2025 at 10:47:52AM -0500, Liam R. Howlett wrote:
>>> -#define ptep_clear_flush_young_notify(__vma, __address, __ptep)		\
>>> +#define ptep_clear_flush_young_notify(__vma, __address, __ptep, __nr)	\
>>>   ({									\
>>>   	int __young;							\
>>>   	struct vm_area_struct *___vma = __vma;				\
>>>   	unsigned long ___address = __address;				\
>>> -	__young = ptep_clear_flush_young(___vma, ___address, __ptep);	\
>>> +	unsigned int ___nr = __nr;					\
>>> +	__young = clear_flush_young_ptes(___vma, ___address, __ptep, ___nr);	\
>>>   	__young |= mmu_notifier_clear_flush_young(___vma->vm_mm,	\
>>>   						  ___address,		\
>>>   						  ___address +		\
>>> -							PAGE_SIZE);	\
>>> +						nr * PAGE_SIZE);	\
>>
>> Did you mean nr * PAGE_SIZE here?  I think it should be __nr or ___nr?
>> I think this nr variable works because it exists where this macro is
>> expanded?
> 
> Yes, this should clearly be ___nr.

Ah, yes, my mistake. Thanks for pointing it out. Will fix.

> 
>> I am also not sure why you have ___nr  at all?
> 
> It's a macro cleanliness thing.  Imagine that we have a caller:
> 
> 	a = ptep_clear_flush_young_notify(vma, addr, ptep, nr++);
> 
> If you have two references to the __nr macro argument, then you end up
> incrementing nr twice.  Assigning __nr to ___nr and then referring to
> ___nr within the macro prevents this.

Yes.

> That said, I'm not sure why ptep_clear_flush_young_notify() needs
> to be a macro instead of a static inline?

Lorenzo also mentioned this. I'll clean up these macros in a follow-up 
after this patchset. Thanks.

