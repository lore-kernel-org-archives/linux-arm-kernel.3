Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D6EECEE33F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 17:21:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V/968Li/jsWSPamkqeNPKCeVo4UUwnANzwmJn8cNJog=; b=y3xA9s4VB14AbDBntbUaydZsee
	jBbWDpVJE4NhsA9KFPTnWQHrYc6gqNN6ciDSfyj1ksITpgtYsIWVHlYWdA54s36FUt7r/gDaw8wLn
	9kXBCXeccf8inECYQjVvCShmjhEjz0+lXfnq16cGQhRHiY3QxhSOkCxTRv1kLWr1Lulj8ddREdR9f
	YV2uyy5TY/YbqyXOD0XlIg5OmoIDLmwuWAqpyVo2bkg4KNqhkCFUa1OfRvX+G8FBx0cSXbQzgCorW
	Mk96jpsvMqpbeQ8A1Y74cVc/R9dg+Gkt8f0zOeJ15zhbnBlIyH5pwrdnOn2RS5EoOBZ+W5S6dbZNh
	tvzXJY9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLPON-00000000qre-2vOg;
	Tue, 18 Nov 2025 17:21:23 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLPOK-00000000qrE-3iyl
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Nov 2025 17:21:22 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 81EB0169C;
	Tue, 18 Nov 2025 09:21:12 -0800 (PST)
Received: from [10.1.25.191] (XHFQ2J9959.cambridge.arm.com [10.1.25.191])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A26CA3F66E;
	Tue, 18 Nov 2025 09:21:18 -0800 (PST)
Message-ID: <e6648d05-7290-47a3-97b7-43152c71aa38@arm.com>
Date: Tue, 18 Nov 2025 17:21:17 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [DISCUSSION] kstack offset randomization: bugs and performance
Content-Language: en-GB
To: "Jason A. Donenfeld" <Jason@zx2c4.com>, Arnd Bergmann <arnd@arndb.de>
Cc: Kees Cook <kees@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
 Jeremy Linton <jeremy.linton@arm.com>, Will Deacon <will@kernel.org>,
 Catalin Marinas <Catalin.Marinas@arm.com>,
 Mark Rutland <mark.rutland@arm.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <66c4e2a0-c7fb-46c2-acce-8a040a71cd8e@arm.com>
 <dd8c37bc-795f-4c7a-9086-69e584d8ab24@arm.com>
 <dd5b4423-0954-44d5-99a5-0052b62c55af@app.fastmail.com>
 <aRyppb8PCxFKVphr@zx2c4.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <aRyppb8PCxFKVphr@zx2c4.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_092120_987636_C93D24D3 
X-CRM114-Status: GOOD (  21.81  )
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

On 18/11/2025 17:15, Jason A. Donenfeld wrote:
> On Mon, Nov 17, 2025 at 05:47:05PM +0100, Arnd Bergmann wrote:
>> On Mon, Nov 17, 2025, at 12:31, Ryan Roberts wrote:
>>> On 17/11/2025 11:30, Ryan Roberts wrote:
>>>> Hi All,
>>>>
>>>> Over the last few years we had a few complaints that syscall performance on
>>>> arm64 is slower than x86. Most recently, it was observed that a certain Java
>>>> benchmark that does a lot of fstat and lseek is spending ~10% of it's time in
>>>> get_random_u16(). Cue a bit of digging, which led me to [1] and also to some new
>>>> ideas about how performance could be improved.
>>
>>
>>>> I believe this helps the mean latency significantly without sacrificing any
>>>> strength. But it doesn't reduce the tail latency because we still have to call
>>>> into the crng eventually.
>>>>
>>>> So here's another idea: Could we use siphash to generate some random bits? We
>>>> would generate the secret key at boot using the crng. Then generate a 64 bit
>>>> siphash of (cntvct_el0 ^ tweak) (where tweak increments every time we generate a
>>>> new hash). As long as the key remains secret, the hash is unpredictable.
>>>> (perhaps we don't even need the timer value). For every hash we get 64 bits, so
>>>> that would last for 10 syscalls at 6 bits per call. So we would still have to
>>>> call siphash every 10 syscalls, so there would still be a tail, but from my
>>>> experiements, it's much less than the crng:
>>
>> IIRC, Jason argued against creating another type of prng inside of the
>> kernel for a special purpose. 
> 
> Yes indeed... I'm really not a fan of adding bespoke crypto willynilly
> like that. Let's make get_random_u*() faster. If you're finding that the
> issue with it is the locking, and that you're calling this from irq
> context anyway, then your proposal (if I read this discussion correctly)
> to add a raw_get_random_u*() seems like it could be sensible. Those
> functions are generated via macro anyway, so it wouldn't be too much to
> add the raw overloads. Feel free to send a patch to my random.git tree
> if you'd like to give that a try.

Thanks Jason; that's exactly what I did, and it helps. But I think ultimately
the get_random_uXX() slow path is too slow; that's the part that causes the tail
latency problem. I doubt there are options for speeding that up?

Anyway, I'm currently prototyping a few options and getting clear performance
numbers. I'll be back in a couple of days and we can continue the discussion in
light of the data.

Thanks,
Ryan

> 
> Jason


