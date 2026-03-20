Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43380109316E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 03:05:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VGXqSdrjifGxcMcDlLu7ZKp792LHAscB7o5xF4jfDt0=; b=YZIQKzbD2zGKFPuIuvpkZNChxS
	p8NX72+0N22bGHXMMZGcP62/trkDtmiq9TNH62RWMRQt/pWYZmnpQE64VpCZBUD1yDJHq3jIUY31I
	CjUyDessvBuwILxmpnJnjVsPoPLLn1kV/zMhmCjWrokM1uBfhEY5cHdTcPV2w9NoDnH86NjzKf7CC
	y9/UK5BCJnwv/3mJeGn7Ww8bJEA28gFqEP+8HVnW6MhP9cp1IhPTZDyxUszO3owlcGwvcoB4o6UXM
	mBSXADcTbzKfjcmJ8SUXWNouWt5TmMUZ0IOcQfBEMM1ETt/ROYe0krSHd9Dus3KYIKp9Slmk7ExIW
	k62ZKJJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3QB8-0000000BxNw-3kJK;
	Fri, 20 Mar 2026 03:05:38 +0000
Received: from out30-101.freemail.mail.aliyun.com ([115.124.30.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3QB5-0000000BxMY-3SPn;
	Fri, 20 Mar 2026 03:05:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1773975932; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=VGXqSdrjifGxcMcDlLu7ZKp792LHAscB7o5xF4jfDt0=;
	b=OwZa1HIiPI1M4xTkeYxsr/fkQioidrbvKK2HDh+1Sc5uzOx2hN0JUxn0KZEPJeC4GRzUfKVK0Q8yU1rUM7hticIGpEYTfC8il90aeZfnL+Taze15ryl19RayXIZ8dgSUSAPVLHzd5uGJ9ooKKHVwsoU1NoDwgQ7s87EJ77Mog04=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R271e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037026112;MF=baolin.wang@linux.alibaba.com;NM=1;PH=DS;RN=17;SR=0;TI=SMTPD_---0X.KE0mj_1773975927;
Received: from 30.74.144.136(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0X.KE0mj_1773975927 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 20 Mar 2026 11:05:28 +0800
Message-ID: <f7831736-f48f-4b5f-908d-4acda5829403@linux.alibaba.com>
Date: Fri, 20 Mar 2026 11:05:27 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] mm: change to return bool for
 ptep_clear_flush_young()/clear_flush_young_ptes()
To: "Lorenzo Stoakes (Oracle)" <ljs@kernel.org>
Cc: akpm@linux-foundation.org, david@kernel.org, Liam.Howlett@oracle.com,
 vbabka@kernel.org, rppt@kernel.org, surenb@google.com, mhocko@suse.com,
 linux-arm-kernel@lists.infradead.org, x86@kernel.org,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 kvm@vger.kernel.org, open <linux-mm@kvack.org>, linux-kernel@vger.kernel.org
References: <cover.1773890510.git.baolin.wang@linux.alibaba.com>
 <5d24b34d8b7860dc2188408b3fa530193bcc5caa.1773890510.git.baolin.wang@linux.alibaba.com>
 <46390a7c-164c-4ffb-a1b2-fad21e3829df@lucifer.local>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <46390a7c-164c-4ffb-a1b2-fad21e3829df@lucifer.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_200536_498530_C0250B02 
X-CRM114-Status: GOOD (  14.59  )
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



On 3/19/26 7:30 PM, Lorenzo Stoakes (Oracle) wrote:
> On Thu, Mar 19, 2026 at 11:24:01AM +0800, Baolin Wang wrote:
>> The ptep_clear_flush_young() and clear_flush_young_ptes() are used to clear
>> the young flag and flush the TLB, returning whether the young flag was set.
>> Change the return type to bool to make the intention clearer.
>>
>> Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
> 
> Couple nits but LGTM, so:
> 
> Reviewed-by: Lorenzo Stoakes (Oracle) <ljs@kernel.org>

Thanks.

>> ---
>>   arch/arm64/include/asm/pgtable.h             | 15 +++++++--------
>>   arch/arm64/mm/contpte.c                      |  4 ++--
>>   arch/parisc/include/asm/pgtable.h            |  2 +-
>>   arch/parisc/kernel/cache.c                   |  8 ++++----
>>   arch/powerpc/include/asm/nohash/64/pgtable.h |  2 +-
>>   arch/riscv/include/asm/pgtable.h             |  4 ++--
>>   arch/s390/include/asm/pgtable.h              |  4 ++--
>>   arch/x86/include/asm/pgtable.h               |  4 ++--
>>   arch/x86/mm/pgtable.c                        |  4 ++--
>>   include/linux/pgtable.h                      |  8 ++++----
>>   mm/pgtable-generic.c                         |  7 ++++---
>>   11 files changed, 31 insertions(+), 31 deletions(-)
>>
>> diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
>> index 8c651695204c..393a9d1873f6 100644
>> --- a/arch/arm64/include/asm/pgtable.h
>> +++ b/arch/arm64/include/asm/pgtable.h
>> @@ -1299,10 +1299,10 @@ static inline bool __ptep_test_and_clear_young(struct vm_area_struct *vma,
>>   	return pte_young(pte);
>>   }
>>
>> -static inline int __ptep_clear_flush_young(struct vm_area_struct *vma,
>> -					 unsigned long address, pte_t *ptep)
>> +static inline bool __ptep_clear_flush_young(struct vm_area_struct *vma,
>> +					    unsigned long address, pte_t *ptep)
> 
> I mean this is subjective stuff but can we just put 2nd line 2 tabs indented
> underneath? Makes it easier for changes like this to not propagate.
> 
> Same comment for all of these!

I usually use 2 tabs for indentation in the mm subsystem, but for other 
subsystems, I try to follow the existing style since I'm unsure of other 
maintainers' preferences:)

Anyway, I can do this if no other objections.

