Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9322DE7717D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Dec 2024 13:39:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s3eDRjN3R1R/qE+YcnQ+B8dkQ53mAOcpHT0ga65i/Dk=; b=eqgxjHCVqWCnZevuDWN2ctNiQi
	YstMUCeu3SN5HV8/cNghh5opTmWBExjZAHylMBqh61Lef+xPLw2FnFr5PM4RcURth7UFFgwQImLhU
	OLzUOg6uLlCqZNwViaAByRgLnNnS5sqErU0VUeGohsbOw+kzlFOZFPpa+MjFzbkIbA02MG0rZGCVO
	wJfIhDlnRuZSe8cwH78hYHHDjdFvYBOJCuqhZfomsF84ae35g/I7opYKNMj5ABFAFfEYBfp9vyvkj
	YU76IJDM18pRjw3UXPEkqOrCz+lWi5/qkFOzt36WKhZJgDksee9K654CkQyuM9beCHk4jNgjf7vCz
	/8AQWDGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLMvU-0000000F0o1-34e6;
	Wed, 11 Dec 2024 13:38:52 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLMuQ-0000000F0ZO-41Or
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Dec 2024 13:37:48 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 588FD1063;
	Wed, 11 Dec 2024 05:38:14 -0800 (PST)
Received: from [10.57.70.51] (unknown [10.57.70.51])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D18793F720;
	Wed, 11 Dec 2024 05:37:41 -0800 (PST)
Message-ID: <a8fea276-152f-4cf3-a87f-e48ae6e5c024@arm.com>
Date: Wed, 11 Dec 2024 14:37:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 13/16] arm64: mm: Reset pkey in __tlb_remove_table()
To: Peter Zijlstra <peterz@infradead.org>
Cc: linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org,
 aruna.ramakrishna@oracle.com, broonie@kernel.org, catalin.marinas@arm.com,
 dave.hansen@linux.intel.com, jannh@google.com, jeffxu@chromium.org,
 joey.gouly@arm.com, kees@kernel.org, maz@kernel.org,
 pierre.langlois@arm.com, qperret@google.com, ryan.roberts@arm.com,
 will@kernel.org, linux-arm-kernel@lists.infradead.org, x86@kernel.org
References: <20241206101110.1646108-1-kevin.brodsky@arm.com>
 <20241206101110.1646108-14-kevin.brodsky@arm.com>
 <20241209102913.GJ21636@noisy.programming.kicks-ass.net>
 <7124d7f4-1d4c-4497-94d8-243af2ed071a@arm.com>
 <20241210122706.GO8562@noisy.programming.kicks-ass.net>
Content-Language: en-GB
From: Kevin Brodsky <kevin.brodsky@arm.com>
In-Reply-To: <20241210122706.GO8562@noisy.programming.kicks-ass.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_053747_032002_71D1C4AB 
X-CRM114-Status: GOOD (  12.09  )
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

On 10/12/2024 13:27, Peter Zijlstra wrote:
> On Tue, Dec 10, 2024 at 10:28:44AM +0100, Kevin Brodsky wrote:
>> On 09/12/2024 11:29, Peter Zijlstra wrote:
>>> On Fri, Dec 06, 2024 at 10:11:07AM +0000, Kevin Brodsky wrote:
>>>> [...]
>>>>
>>>> diff --git a/arch/arm64/include/asm/tlb.h b/arch/arm64/include/asm/tlb.h
>>>> index a947c6e784ed..d1611ffa6d91 100644
>>>> --- a/arch/arm64/include/asm/tlb.h
>>>> +++ b/arch/arm64/include/asm/tlb.h
>>>> @@ -10,10 +10,14 @@
>>>>  
>>>>  #include <linux/pagemap.h>
>>>>  #include <linux/swap.h>
>>>> +#include <linux/kpkeys.h>
>>>>  
>>>>  static inline void __tlb_remove_table(void *_table)
>>>>  {
>>>> -	free_page_and_swap_cache((struct page *)_table);
>>>> +	struct page *page = (struct page *)_table;
>>>> +
>>>> +	kpkeys_unprotect_pgtable_memory((unsigned long)page_address(page), 1);
>>>> +	free_page_and_swap_cache(page);
>>>>  }
>>> Same as for the others, perhaps stick this in generic code instead of in
>>> the arch code?
>> This should be doable, with some refactoring. __tlb_remove_table() is
>> currently called from two functions in mm/mmu_gather.c, I suppose I
>> could create a wrapper there that calls
>> kpkeys_unprotect_pgtable_memory() and then __tlb_remove_table(). Like in
>> the p4d case I do however wonder how robust this is, as
>> __tlb_remove_table() could end up being called from other places.
> I don't foresee other __tlb_remove_table() users, this is all rather
> speicific code. But if there ever were to be new users, it is something
> they would have to take into consideration.

Fair enough, I'll handle that in mm/mmu_gather.c then.

- Kevin

