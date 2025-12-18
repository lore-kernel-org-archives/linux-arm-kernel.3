Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36AB0D68BEE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Dec 2025 08:34:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pQHI5+JCo2r2DKUsUcl7DQgS6u8YczDm1hAx8R289mk=; b=sJ0nyrKAAdyTsZv1QW2s7RrrgM
	hE1RNdO9EMW0ay2wF7ubDK5m0AZGcPMlkNYlFnWEMoNWAt9Pq+1oCs0M/Nshvc3DiW+oCqTPv5P8o
	sFn7HI1WONKb3qmojIxmervynRUfM6qj96be9Ap3gkud4/z/nT03hjt7wuwqKJuQF2Ix9NOlzilH2
	+hxSriBYsrk3uIwNbmRGAko30RK3zQUUWW9k5D0iY0kLGWrFzcYUTLystqNQMN9Oo0RpzYAJAo+Td
	2yzHJhubQy4p/cT/jKnOjeUqvT686hBXNl6lvtPyoAcFb8YdfUlVUNBuBWU0WytukInambFu5T9uN
	eB9nqhUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vW9Sd-00000008448-1woT;
	Thu, 18 Dec 2025 08:34:11 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vW9Sa-0000000843k-44BI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Dec 2025 08:34:10 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D5FCDFEC;
	Thu, 18 Dec 2025 00:33:59 -0800 (PST)
Received: from [10.57.91.22] (unknown [10.57.91.22])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 608F33F5CA;
	Thu, 18 Dec 2025 00:34:03 -0800 (PST)
Message-ID: <72aaa252-6ee6-4353-84ee-b6e10e9920c6@arm.com>
Date: Thu, 18 Dec 2025 08:34:01 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: mmu: avoid allocating pages while
 installing ng-mapping for KPTI
Content-Language: en-GB
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: catalin.marinas@arm.com, will@kernel.org, akpm@linux-foundation.org,
 david@kernel.org, kevin.brodsky@arm.com, quic_zhenhuah@quicinc.com,
 dev.jain@arm.com, yang@os.amperecomputing.com, chaitanyas.prakash@arm.com,
 bigeasy@linutronix.de, clrkwllms@kernel.org, rostedt@goodmis.org,
 lorenzo.stoakes@oracle.com, ardb@kernel.org, jackmanb@google.com,
 vbabka@suse.cz, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev
References: <20251217182007.2345700-1-yeoreum.yun@arm.com>
 <20251217182007.2345700-3-yeoreum.yun@arm.com>
 <731e3f48-e0a3-4c89-a13a-65ef37faa443@arm.com>
 <aUL/zJlJFRz2/Ybt@e129823.arm.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <aUL/zJlJFRz2/Ybt@e129823.arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_003409_074642_EB1EA6D7 
X-CRM114-Status: GOOD (  14.50  )
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

On 17/12/2025 19:09, Yeoreum Yun wrote:
> Hi Ryanc,
> 
> [...]
>>> -	if (!cpu) {
>>> -		free_pages(alloc, order);
>>> +	if (!cpu)
>>>  		arm64_use_ng_mappings = true;
>>> -	}
>>>
>>>  	return 0;
>>>  }
>>>
>>>  void __init kpti_install_ng_mappings(void)
>>>  {
>>> +	int order = order_base_2(CONFIG_PGTABLE_LEVELS);
>>> +	u64 alloc;
>>> +
>>>  	/* Check whether KPTI is going to be used */
>>>  	if (!arm64_kernel_unmapped_at_el0())
>>>  		return;
>>> @@ -1436,8 +1434,14 @@ void __init kpti_install_ng_mappings(void)
>>>  	if (arm64_use_ng_mappings)
>>>  		return;
>>>
>>> +	alloc = __get_free_pages(GFP_ATOMIC | __GFP_ZERO, order);
>>
>> I don't think this requires GFP_ATOMIC now?
>>
>> With that removed:
>>
>> Reviewed-by: Ryan Roberts <ryan.roberts@arm.com>
> 
> I think it would be better to use only __GFP_HIGH in here since
> when kpti_install_ng_mappings() is called, "kswpd" doesn't created yet.
> and to allocate page with assurance, It would be good to use
> min_reserved to.
> 
> Am I missing something?

Personally I think we should just use "GFP_KERNEL | __GFP_ZERO". Anything else
would make this allocation look special, which it is not. If we fail to allocate
at this point in boot, we have bigger problems.

> 
> Thanks.
> 
> [...]
> 
> --
> Sincerely,
> Yeoreum Yun


