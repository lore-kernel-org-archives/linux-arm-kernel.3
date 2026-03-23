Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 136CFF483D7
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 19:56:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0irAWwmXTnrA6DZFtnARkmMQCtt3MlBdKCeTWfgkROs=; b=sCtXBSNWFSLgiwqlz0JJS1CSkp
	Crktd0QsL6MxCrECSzrGprQjG6oy4uNatgSyynrdvbDxb7YmP4kuewVwfN0ucSomA3VnXkHJkI47Z
	BENd8WFc1q3MWZEIhTwRR2YhMGhZ+gnH0pMW9z8tN/kmMwXcnFS7Q0aKYOIm5ywxI7ysj8Dcws165
	mjTuO5JTFaX5VSpEofYwDz5N9HSPufXBmFz2taoKALeLBhSwzdpY0zLeiu/hs3NylSkM0+4Vlyyoz
	Ww21EZ1CqqHxqVYsjAApSC6Je7RCEReWzl4T+4jHNfsfy+diGF4SzoMJ6acmOx305XALWEDTKHg9U
	x+ZlsASQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4lNx-0000000HWaJ-02i0;
	Mon, 23 Mar 2026 19:56:25 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4lNu-0000000HWZl-1xHP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Mar 2026 19:56:24 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4238414BF;
	Mon, 23 Mar 2026 12:56:14 -0700 (PDT)
Received: from [10.57.59.110] (unknown [10.57.59.110])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 63E533F694;
	Mon, 23 Mar 2026 12:56:14 -0700 (PDT)
Message-ID: <1d364f19-7cf4-400b-ad12-6380152e44e5@arm.com>
Date: Mon, 23 Mar 2026 19:56:10 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/3] arm64: mm: Handle invalid large leaf mappings
 correctly
To: Ryan Roberts <ryan.roberts@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 "David Hildenbrand (Arm)" <david@kernel.org>, Dev Jain <dev.jain@arm.com>,
 Yang Shi <yang@os.amperecomputing.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Jinjiang Tu <tujinjiang@huawei.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20260323130317.1737522-1-ryan.roberts@arm.com>
 <20260323130317.1737522-3-ryan.roberts@arm.com>
 <588b2b4f-9cf6-43e5-b0e5-55820c74cbbb@arm.com>
 <e36d3b17-dc66-466e-9446-692592e5d7f2@arm.com>
From: Kevin Brodsky <kevin.brodsky@arm.com>
Content-Language: en-GB
In-Reply-To: <e36d3b17-dc66-466e-9446-692592e5d7f2@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_125622_553117_C468E113 
X-CRM114-Status: GOOD (  11.70  )
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

On 23/03/2026 18:25, Ryan Roberts wrote:
>>> @@ -132,11 +137,12 @@ static int __change_memory_common(unsigned long start, unsigned long size,
>>>  	ret = update_range_prot(start, size, set_mask, clear_mask);
>>>  
>>>  	/*
>>> -	 * If the memory is being made valid without changing any other bits
>>> -	 * then a TLBI isn't required as a non-valid entry cannot be cached in
>>> -	 * the TLB.
>>> +	 * If the memory is being switched from present-invalid to valid without
>>> +	 * changing any other bits then a TLBI isn't required as a non-valid
>>> +	 * entry cannot be cached in the TLB.
>>>  	 */
>>> -	if (pgprot_val(set_mask) != PTE_VALID || pgprot_val(clear_mask))
>>> +	if (pgprot_val(set_mask) != (PTE_MAYBE_NG | PTE_VALID) ||
>> It isn't obvious to understand where all those PTE_MAYBE_NG come from if
>> one hasn't realised that PTE_PRESENT_INVALID overlays PTE_NG.
>>
>> Since for this purpose we always set/clear both PTE_VALID and
>> PTE_MAYBE_NG, maybe we could define some macro as PTE_VALID |
>> PTE_MAYBE_NG, as a counterpart to PTE_PRESENT_INVALID?
> How about:
>
> #define PTE_PRESENT_VALID_KERNEL	(PTE_VALID | PTE_MAYBE_NG)
>
> The user space equivalent has NG clear, so important to clarify that this is the
> kernel value, I think.

Sounds good to me.

- Kevin

