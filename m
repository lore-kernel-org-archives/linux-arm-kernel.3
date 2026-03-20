Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71C821093172
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 03:18:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=verEAb8WxJ+vPtV/pZpgjW0L13vr5gbh+nX57J5s9lM=; b=NHJXvFOuPvm4CM/GldWpM7kxZ0
	j949ua8zvm/RD5PJ0yWQiuMQbHA2mp32GHLPDiGp6fqT0JGe7T87pqjrthLwrwteX1TuSnPoJpiHj
	wxy46a5Xyb6K8sgPEAnuUQrrVkVhZHY42r1Oi1tVKWPXK5Lyc1CkbOcVhbvN4lc0z0vpkkswr3XJG
	4gXglJoZkMO8+d5sNGY2jxxDeOlfTm0Ang1lSPOwMXZlq+bAAfwsgYV7qoVBYVQQFk/1/gflRZK5o
	AHRpHkZ1myYHxqXxnNN2U2nccHhOw6OWPo5T31q1LRD5VWN3nKtrY1Qu1DOLEDPnG68XjCBs2Gnz8
	a7JSqoag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3QNp-0000000ByxC-48zn;
	Fri, 20 Mar 2026 03:18:45 +0000
Received: from out30-112.freemail.mail.aliyun.com ([115.124.30.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3QNm-0000000Byu6-0WEr;
	Fri, 20 Mar 2026 03:18:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1773976718; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=verEAb8WxJ+vPtV/pZpgjW0L13vr5gbh+nX57J5s9lM=;
	b=MAN43k5jP+HELA+PqN7vCywQfTbKEdjK4euvozMr8Mt9T+A2z0qLcArNdQ+JjewSU/Psc23Y3/Hm51VHdexdfIm3jCGeM5PxAiH51aS1XPjfPc02FEfZjxGEaTeNATaeg/VkFA9KeeE5v0ts+XXf4TJ31xezAdGIAutjh0adPt8=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R851e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037033178;MF=baolin.wang@linux.alibaba.com;NM=1;PH=DS;RN=17;SR=0;TI=SMTPD_---0X.K7m.g_1773976716;
Received: from 30.74.144.136(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0X.K7m.g_1773976716 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 20 Mar 2026 11:18:36 +0800
Message-ID: <66e78b59-f96c-4277-b7d7-473b68ed413f@linux.alibaba.com>
Date: Fri, 20 Mar 2026 11:18:33 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] mm: change to return bool for the MMU notifier's
 young flag check
To: "Lorenzo Stoakes (Oracle)" <ljs@kernel.org>
Cc: akpm@linux-foundation.org, david@kernel.org, Liam.Howlett@oracle.com,
 vbabka@kernel.org, rppt@kernel.org, surenb@google.com, mhocko@suse.com,
 linux-arm-kernel@lists.infradead.org, x86@kernel.org,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 kvm@vger.kernel.org, open <linux-mm@kvack.org>, linux-kernel@vger.kernel.org
References: <cover.1773890510.git.baolin.wang@linux.alibaba.com>
 <545847c132da5d957cfc74ab19e849b16127aa8f.1773890510.git.baolin.wang@linux.alibaba.com>
 <67c670e2-c98f-490b-bbb9-2960f8175b5a@lucifer.local>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <67c670e2-c98f-490b-bbb9-2960f8175b5a@lucifer.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_201842_768874_73093A62 
X-CRM114-Status: GOOD (  20.53  )
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



On 3/19/26 7:39 PM, Lorenzo Stoakes (Oracle) wrote:
> On Thu, Mar 19, 2026 at 11:24:05AM +0800, Baolin Wang wrote:
>> The MMU notifier young flag check related functions only return whether
>> the young flag was set. Change the return type to bool to make the
>> intention clearer.
>>
>> Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
> 
> I can see KVM is the only user for the mmu_notifier_ops clear_flush_young,
> clear_young and test_young hooks, which map to
> kvm_mmu_notifier_[clear_flush,clear,test]_young() functions, and you have
> updated them all.

Yes.

> So this LGTM with nits below, and so (with nits addressed as per the other R-b
> tags :):
> 
> Reviewed-by: Lorenzo Stoakes (Oracle) <ljs@kernel.org>
> 
> Thanks for doing this! Int as bool is a pet peeve of mine :))

Thanks for reviewing.

>>   include/linux/mmu_notifier.h | 76 +++++++++++++++++-------------------
>>   mm/internal.h                | 16 ++++----
>>   mm/mmu_notifier.c            | 20 +++++-----
>>   virt/kvm/kvm_main.c          | 40 +++++++++----------
>>   4 files changed, 72 insertions(+), 80 deletions(-)
>>
>> diff --git a/include/linux/mmu_notifier.h b/include/linux/mmu_notifier.h
>> index 3705d350c863..17f2cdc77dd5 100644
>> --- a/include/linux/mmu_notifier.h
>> +++ b/include/linux/mmu_notifier.h
>> @@ -97,20 +97,20 @@ struct mmu_notifier_ops {
>>   	 * Start-end is necessary in case the secondary MMU is mapping the page
>>   	 * at a smaller granularity than the primary MMU.
>>   	 */
>> -	int (*clear_flush_young)(struct mmu_notifier *subscription,
>> -				 struct mm_struct *mm,
>> -				 unsigned long start,
>> -				 unsigned long end);
>> +	bool (*clear_flush_young)(struct mmu_notifier *subscription,
>> +				  struct mm_struct *mm,
>> +				  unsigned long start,
>> +				  unsigned long end);
>>
>>   	/*
>>   	 * clear_young is a lightweight version of clear_flush_young. Like the
>>   	 * latter, it is supposed to test-and-clear the young/accessed bitflag
>>   	 * in the secondary pte, but it may omit flushing the secondary tlb.
>>   	 */
>> -	int (*clear_young)(struct mmu_notifier *subscription,
>> -			   struct mm_struct *mm,
>> -			   unsigned long start,
>> -			   unsigned long end);
>> +	bool (*clear_young)(struct mmu_notifier *subscription,
>> +			    struct mm_struct *mm,
>> +			    unsigned long start,
>> +			    unsigned long end);
>>
>>   	/*
>>   	 * test_young is called to check the young/accessed bitflag in
>> @@ -118,9 +118,9 @@ struct mmu_notifier_ops {
>>   	 * frequently used without actually clearing the flag or tearing
>>   	 * down the secondary mapping on the page.
>>   	 */
>> -	int (*test_young)(struct mmu_notifier *subscription,
>> -			  struct mm_struct *mm,
>> -			  unsigned long address);
>> +	bool (*test_young)(struct mmu_notifier *subscription,
>> +			   struct mm_struct *mm,
>> +			   unsigned long address);
>>
>>   	/*
>>   	 * invalidate_range_start() and invalidate_range_end() must be
>> @@ -376,14 +376,12 @@ mmu_interval_check_retry(struct mmu_interval_notifier *interval_sub,
>>
>>   extern void __mmu_notifier_subscriptions_destroy(struct mm_struct *mm);
>>   extern void __mmu_notifier_release(struct mm_struct *mm);
>> -extern int __mmu_notifier_clear_flush_young(struct mm_struct *mm,
>> -					  unsigned long start,
>> -					  unsigned long end);
>> -extern int __mmu_notifier_clear_young(struct mm_struct *mm,
>> -				      unsigned long start,
>> -				      unsigned long end);
>> -extern int __mmu_notifier_test_young(struct mm_struct *mm,
>> -				     unsigned long address);
>> +bool __mmu_notifier_clear_flush_young(struct mm_struct *mm,
>> +		unsigned long start, unsigned long end);
>> +bool __mmu_notifier_clear_young(struct mm_struct *mm,
>> +		unsigned long start, unsigned long end);
>> +bool __mmu_notifier_test_young(struct mm_struct *mm,
>> +		unsigned long address);
>>   extern int __mmu_notifier_invalidate_range_start(struct mmu_notifier_range *r);
>>   extern void __mmu_notifier_invalidate_range_end(struct mmu_notifier_range *r);
>>   extern void __mmu_notifier_arch_invalidate_secondary_tlbs(struct mm_struct *mm,
> 
> I mean damn, at this point maybe it's legit to drop the surrounding externs here
> too? But maybe not :))

I prefer to leave the others as is:)

[snip]

>>
>> -static __always_inline int kvm_age_hva_range(struct mmu_notifier *mn,
>> -						unsigned long start,
>> -						unsigned long end,
>> -						gfn_handler_t handler,
>> -						bool flush_on_ret)
>> +static __always_inline bool kvm_age_hva_range(struct mmu_notifier *mn,
>> +					      unsigned long start,
>> +					      unsigned long end,
>> +					      gfn_handler_t handler,
>> +					      bool flush_on_ret)
> 
> Can we please fix this terrrible indentation while we're here :)?
> 
> static __always_inline bool kvm_age_hva_range(struct mmu_notifier *mn,
> 		unsigned long start, unsigned long end, gfn_handler_t handler,
> 		bool flush_on_ret)
> 
> Would be nicer, thanks!

Will do if KVM maintainers are also happy with this.

