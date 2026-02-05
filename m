Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5EBDEC1EA1
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Feb 2026 11:23:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0Iz+QHPUd08Gz6LvOR4adaa6XILpy72HTWZ1Ixd22mE=; b=IiBJ8ZDHn7Em33TFiWIOSuZV2N
	zlNqe4rLXnPM7ysvLb19z3j/u1SUPBrDp+Wrp8deVivPCg0e5tqXbOWqyoHX0A/73Jde7WC1xj2yJ
	LhIssPsGLjNhX9evDfyLo3QBF8Ew6hWX1YWSgjZm6pRRvOnMYRWjbdLyY8lRgVC3q9w8I5RmJ7srx
	in2CWmnTlAmNWkWFmG1WyJ6zqU91XdY+ROl2XLAwRBF9fJgZ9DN9D+VDWRgNd+9F1M/dzlvrarfiF
	/WFf0znnnVuMcm1heqTcjBxX1oFfbwODwbM1U3TK3+TW0LCLWYe+8Lexy1Bo5RIhQNU2gN2abI9DY
	nC6m8Omg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnxSR-00000009pOb-0fss;
	Thu, 05 Feb 2026 11:23:35 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnxSQ-00000009pOT-0oRY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Feb 2026 11:23:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 43B44600AD;
	Thu,  5 Feb 2026 11:23:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5963C4CEF7;
	Thu,  5 Feb 2026 11:23:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770290613;
	bh=RCZrlJ+4+OMz1hlIGp1AtgJCfStiAxEXsBfE8ZlFXm4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=WHP1ueEvlWmZb0YitFpYD0Yf9XwX5oZeh5UFQQvcaGXDfwB1W4DZnATxeSRPTNPfh
	 AQXIKoDJ4asL6sXEQgNTqa+5MNxgrZlEPRS0v9VEan5Bm5SpAwTVW/jCPv8qZJnmOf
	 eC41ldcegV5SpTVPaxmhqLOaDSkrL6QCsRXC5cAxa6SUMUft7w5JDBmykJ/1PjkXL4
	 dDwDqkI6rGz4/2u5oULjmF+qya8tEMBUR7fogc5Ksbz/NDQf4Yv2I95wS6k146moiX
	 jkGGI6zhBUIoRWCl/QSj7huBkBWa694ID2lJFbwm71gevoz84C/VRXnXvCzs3frcB1
	 rvNwJb8QfUIKA==
Message-ID: <82c73122-4d0e-45f5-b1b4-3cf743353fd6@kernel.org>
Date: Thu, 5 Feb 2026 12:23:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] soc cache: L3 cache driver for HiSilicon SoC
To: wangyushan <wangyushan12@huawei.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Drew Fustini <fustini@kernel.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Linus Walleij <linus.walleij@linaro.org>, Will Deacon <will@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 fanghao11@huawei.com, linuxarm@huawei.com, liuyonglong@huawei.com,
 prime.zeng@hisilicon.com, Zhou Wang <wangzhou1@hisilicon.com>,
 Wei Xu <xuwei5@hisilicon.com>
References: <20260203161843.649417-1-wangyushan12@huawei.com>
 <20260203161843.649417-2-wangyushan12@huawei.com>
 <a8ba1c0b-e7c8-44c5-b785-42752f7f5d8f@app.fastmail.com>
 <e59c7556-d001-4a34-8db3-127dc25f3897@kernel.org>
 <1d7abd11-2064-4437-8ad7-7cfe1b2e75c0@huawei.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <1d7abd11-2064-4437-8ad7-7cfe1b2e75c0@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

On 05/02/2026 12:19, wangyushan wrote:
> 
> On 2/5/2026 5:37 PM, Krzysztof Kozlowski wrote:
>> On 03/02/2026 18:19, Arnd Bergmann wrote:
>>> On Tue, Feb 3, 2026, at 17:18, Yushan Wang wrote:
>>>> The driver will create a file of `/dev/hisi_l3c` on init, mmap
>>>> operations to it will allocate a memory region that is guaranteed to be
>>>> placed in L3 cache.
>>>>
>>>> The driver also provides unmap() to deallocated the locked memory.
>>>>
>>>> The driver also provides an ioctl interface for user to get cache lock
>>>> information, such as lock restrictions and locked sizes.
>>>>
>>>> Signed-off-by: Yushan Wang <wangyushan12@huawei.com>
>>>
>>> Hi Yushan,
>>>
>>> Thanks for your submission. Since we are in the last week of
>>> the merge window, this is not going to be linux-7.0 material,
>>> but I'll have a quick look for now.
>>
>>
>> To be clear - this is a v3 but with removed previous history...
>>
>> Previous version:
>> https://lore.kernel.org/all/20251217102357.1730573-2-wangyushan12@huawei.com/
>>
>> Or even v4?
>>
>> https://lore.kernel.org/all/20250122065803.3363926-2-wangyushan12@huawei.com/
>>
>> Yushan, please start versioning your patches correctly. Use b4 or git
>> format-patch -vx
> 
> Hi Krzysztof,
> 
> Sorry about the confusing versions, the complete history is as below:
> 
> Link to v1: https://lore.kernel.org/all/20250107132907.3521574-1-wangyushan12@huawei.com
> 
> Link to v2: https://lore.kernel.org/all/20250122065803.3363926-1-wangyushan12@huawei.com/
> 
> Link to RFC v1: https://lore.kernel.org/all/20251125080542.3721829-1-wangyushan12@huawei.com/
> 
> Link to RFC v2: https://lore.kernel.org/all/20251217102357.1730573-1-wangyushan12@huawei.com/
> 
> Link to v1 again (this message): https://lore.kernel.org/all/20260203161843.649417-1-wangyushan12@huawei.com/
> 
>>
>> Otherwise, please explain us how can we compare it with `b4 diff` with
>> previous version?
>>
>> Sending something AGAIN as v1 ignoring entire previous submission is
>> clear no go. Like you are trying till it succeeds. Negative review?
>> Let's try from v1 this time...
>>
>> This is not correct and it should not be my task to find your previous
>> discussions and decipher this v1.
> 
> I did spin 2 versions to mainline as the actual v1, the thread was quiet.
> Then I made a major refactor to it and sent it as RFC, the thread went
> quiet again but some compile check issues popped up. I spinned 2
> versions of RFC for the compile issues and removed RFC in this version
> since no strong objection showed up.
> 
> Apologize that I broke the rules and any inconvenience caused by it.
> As there's little discussion in previous patches, is it OK that we start
> here as v1?

No, it is not okay. Your patchset continues and entire previous feedback
and history is important. Otherwise why would I review this if I can as
well ignore it and wait for next year you sending another v1?

Best regards,
Krzysztof

