Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08DE5D6ACDA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Dec 2025 09:41:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1vCnN4+oekHzPsTnNTp2zLemQNBuy/ZdXcrH7HMym94=; b=CjHK0ImCQMCND3oOGTbAwMXhzo
	nk3BRRiDwD/uGTikFktZ1YO0GpAhmlxf4JPpKZPHXHE6/JE3GVjvPTaFQNV0eAeZ4mEG9Wwo9aEkl
	EIYnVdLkyqgLYlGP4D7r/jMsHDYcGJzgNBQvi7PFd836zii4eFISp9gajb2LYKvPVTR6XxdR3l7P1
	Lx8zwRmWdNds1F0IY3nOgZzXTFiCu9RZJVvwiMK2OdbzuoHdX1K1VU6G8oO+r+q5Dg//s7GiXhMba
	UIG6eUJQelXcbhi6iza0XP0E5ulsPbnei71Ch6XDAz5A9IKg7lOty7tbD7w5lBu8pkV0qnNIBkWrJ
	8iBNjlmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWAVV-00000008AQF-2eXb;
	Thu, 18 Dec 2025 09:41:13 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWAVS-00000008APH-3X2i
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Dec 2025 09:41:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1336B44047;
	Thu, 18 Dec 2025 09:41:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC698C113D0;
	Thu, 18 Dec 2025 09:41:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766050869;
	bh=if8nrAy6nAbxo+OGx9VOp5NtyXp5P5yHGxKfTzzPn9Y=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=sTUGkN15hVBQGspVE7YdvHrKYR2//dG4FG+d8ncVQOEZlQ0gGYhRA3Ryzv7zZCB/p
	 nmhPE46v++wHIj2GIeVlCDEXSOMs5n6wmarzRS4nRlkOnD3M7qZMhvg+ZIlxYD+Pv+
	 y7uQKokQOtipCIo8tuTUTS6U5JYnmHXHVp4ODgqlVAzEE2E9STn4JiRdyTETSRAKhP
	 Dg+T9oaNLX4nIGdFhW80KMwB2cYP40+p2swGxya1AcvUhpkfp8ulDvtD2DoCTFcsn7
	 a0znI2GepBj5u/LsCRO3MtOIgQ35fPyHhJJOzDMPQV5Iq9FxWNqTSlbDUknAmYqwuR
	 6jc5cxTzXofhw==
Message-ID: <10ad7480-4e8a-43c1-9e18-db72e63dbe98@kernel.org>
Date: Thu, 18 Dec 2025 10:41:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: mmu: avoid allocating pages while
 installing ng-mapping for KPTI
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: Ryan Roberts <ryan.roberts@arm.com>, catalin.marinas@arm.com,
 will@kernel.org, akpm@linux-foundation.org, kevin.brodsky@arm.com,
 quic_zhenhuah@quicinc.com, dev.jain@arm.com, yang@os.amperecomputing.com,
 chaitanyas.prakash@arm.com, bigeasy@linutronix.de, clrkwllms@kernel.org,
 rostedt@goodmis.org, lorenzo.stoakes@oracle.com, ardb@kernel.org,
 jackmanb@google.com, vbabka@suse.cz, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev
References: <20251217182007.2345700-1-yeoreum.yun@arm.com>
 <20251217182007.2345700-3-yeoreum.yun@arm.com>
 <731e3f48-e0a3-4c89-a13a-65ef37faa443@arm.com>
 <aUL/zJlJFRz2/Ybt@e129823.arm.com>
 <72aaa252-6ee6-4353-84ee-b6e10e9920c6@arm.com>
 <aUO9M/oN+nx3nfW+@e129823.arm.com>
 <201d0fa3-2ebe-4df2-926c-9e11607a6f07@kernel.org>
 <aUPJ1N99LEVZ77co@e129823.arm.com>
From: "David Hildenbrand (Red Hat)" <david@kernel.org>
Content-Language: en-US
In-Reply-To: <aUPJ1N99LEVZ77co@e129823.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_014110_937670_22272F9A 
X-CRM114-Status: GOOD (  19.17  )
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

On 12/18/25 10:31, Yeoreum Yun wrote:
> Hi David,
> 
>> On 12/18/25 09:37, Yeoreum Yun wrote:
>>> [...]
>>>>> I think it would be better to use only __GFP_HIGH in here since
>>>>> when kpti_install_ng_mappings() is called, "kswpd" doesn't created yet.
>>>>> and to allocate page with assurance, It would be good to use
>>>>> min_reserved to.
>>>>>
>>>>> Am I missing something?
>>>>
>>>> Personally I think we should just use "GFP_KERNEL | __GFP_ZERO". Anything else
>>>> would make this allocation look special, which it is not. If we fail to allocate
>>>> at this point in boot, we have bigger problems.
>>>
>>> But I'm not sure *HOW effective* to use GFP_KERNEL in here.
>>> Since it's before the any filesystem inited.
>>> IOW, in this context, almost there would be no *page cache*
>>> and I think it seems meaningless to use "GFP_KERNEL" and "direct
>>> reclaim"
>>>
>>> So to get success for allocation, __GFP_HIGH | _GFP_ZERO seems much
>>> better.
>>
>> Unless there is a real reason to confuse readers why this is very special,
>> just go with "GFP_KERNEL | __GFP_ZERO", really.
>>
>> In particular if it doesn't matter in practice? Or does it and we are not
>> getting your point?
> 
> My worries was
>      - kpti_install_ng_mappings() is called while in "smp_init()" which is
>        before creating the kswapd thread via module_init().
>        Just wondered whether it allows to call wakeup_kswapd() before
>        kswapd is created.

The buddy should really be able to deal with that, no?

> 
>      - Similar reason kcompactd too.

Same as well.

We cannot expect alloc API users to know about these hidden details to 
work around them :)

> 
>      - Just wonder how much direct reclaim is effecitve since
>        when kpti_install_ng_mappings() called before each
>        filesystem initialised where not much of page cache in usage.

Right, but do you really think we would ever trigger that path?

The default should always be GFP_KERNEL unless we have for very good 
reason special demands.

So, do you think in practice there is real value in NOT using GFP_KERNEL? :)

-- 
Cheers

David

