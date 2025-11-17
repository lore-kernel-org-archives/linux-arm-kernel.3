Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B968BCEACEF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Nov 2025 17:24:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RxLfc36skKJe1u1m1DCD7kiC/o4DtRX99kaxaGzd+Ws=; b=o52lVZ/5sqNuzWDBOw3LE/qteg
	XokPp3dU7wIkm95cg5IFhpMzzWd5xAKNqP0ilGy6sMon0RX4+uM27rIjMNIaiCKOB/rdvkV28eINa
	h1lLLnVxug4rqkStJpCtcpGJI3RS9s43PyiOb4oNmcd2Ot809n+RzCX6vVQ2lwB6hKYUl59u91sXD
	gdk4zfVIfKyrSVihec79sjg0XNeidlNYRE1GB1G6wpqppmc1RUs/HQ7+JTBcCWwS8CCNZnt/ghxbZ
	aqpL1fO6bO5o0cb+YzTCsrVtZbI6PVcSeNK56oakmcdYhD2cIRUcX9+VKlLaqCVxkEMPSw8XivP9X
	toOI5FUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL2xN-0000000GWov-2SH8;
	Mon, 17 Nov 2025 17:24:01 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL2xJ-0000000GWoT-2ukN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Nov 2025 17:24:01 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 412FEFEC;
	Mon, 17 Nov 2025 09:23:48 -0800 (PST)
Received: from [10.57.86.198] (unknown [10.57.86.198])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 78A033F66E;
	Mon, 17 Nov 2025 09:23:54 -0800 (PST)
Message-ID: <82426a0d-df58-476d-b6e4-64b1415bf61e@arm.com>
Date: Mon, 17 Nov 2025 17:23:52 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [DISCUSSION] kstack offset randomization: bugs and performance
Content-Language: en-GB
To: Arnd Bergmann <arnd@arndb.de>, Kees Cook <kees@kernel.org>,
 Ard Biesheuvel <ardb@kernel.org>, Jeremy Linton <jeremy.linton@arm.com>,
 Will Deacon <will@kernel.org>, Catalin Marinas <Catalin.Marinas@arm.com>,
 Mark Rutland <mark.rutland@arm.com>
Cc: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "Jason A. Donenfeld" <Jason@zx2c4.com>
References: <66c4e2a0-c7fb-46c2-acce-8a040a71cd8e@arm.com>
 <dd8c37bc-795f-4c7a-9086-69e584d8ab24@arm.com>
 <dd5b4423-0954-44d5-99a5-0052b62c55af@app.fastmail.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <dd5b4423-0954-44d5-99a5-0052b62c55af@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_092359_255750_2DAB15CA 
X-CRM114-Status: GOOD (  23.62  )
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

On 17/11/2025 16:47, Arnd Bergmann wrote:
> On Mon, Nov 17, 2025, at 12:31, Ryan Roberts wrote:
>> On 17/11/2025 11:30, Ryan Roberts wrote:
>>> Hi All,
>>>
>>> Over the last few years we had a few complaints that syscall performance on
>>> arm64 is slower than x86. Most recently, it was observed that a certain Java
>>> benchmark that does a lot of fstat and lseek is spending ~10% of it's time in
>>> get_random_u16(). Cue a bit of digging, which led me to [1] and also to some new
>>> ideas about how performance could be improved.
> 
> 
>>> I believe this helps the mean latency significantly without sacrificing any
>>> strength. But it doesn't reduce the tail latency because we still have to call
>>> into the crng eventually.
>>>
>>> So here's another idea: Could we use siphash to generate some random bits? We
>>> would generate the secret key at boot using the crng. Then generate a 64 bit
>>> siphash of (cntvct_el0 ^ tweak) (where tweak increments every time we generate a
>>> new hash). As long as the key remains secret, the hash is unpredictable.
>>> (perhaps we don't even need the timer value). For every hash we get 64 bits, so
>>> that would last for 10 syscalls at 6 bits per call. So we would still have to
>>> call siphash every 10 syscalls, so there would still be a tail, but from my
>>> experiements, it's much less than the crng:
> 
> IIRC, Jason argued against creating another type of prng inside of the
> kernel for a special purpose. 

siphash is already supported by the kernel; siphash_1u64() and friends. So I
think you could argue this is just creative use of an existing crypto primitive? ;-)

> 
> As I understand, the other architectures already just use the cycle counter
> because that is random enough, but for arm64 the cntvct runs on an
> unspecified frequency that is often too low.
> 
> However, most future machines are ARMv9.1 or higher and require a 1GHz
> timer frequency. I also checked Graviton-3 (Neoverse-V1, ARMv8.4), which
> is running its timer at 1.05GHz.
> 
> My M2 Mac is running at a slower 24MHz timer. Between two getpid()
> syscalls, I see cntvct_el0 advance between 20 and 70 cycles, which
> still gives a few bits of entropy but not the six bits we actually
> want to use.
> 
> How about we just check the timer frequency at boot and patch out the
> get_random_u16 call for a cntvct read if it gets updated fast enough?
> That would at least take care of the overhead on most new designs and
> hopefully on a large subset of the servers that are in active use.

That certainly sounds simple and reasonable to me (as a non-security guy). My
earlier optimizations would still help the non-conformant systems with mean latency.

We would then end up where arm64 can be just as performant as the other arches
for the same level of security. If that level of security is deemed
insufficient, then a new option to use get_random_u16() (or siphash) could be
introduced, which would be arch-independent.

Thanks,
Ryan

> 
>       Arnd


