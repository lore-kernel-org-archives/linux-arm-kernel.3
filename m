Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D434D11183
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Nov 2025 14:09:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+LwCUb2ua9xMSKFKu7L6e5TuCh/Qq2yXGxRx0iIJg5E=; b=JJ00y3ucJ/abTI1wmE12bWnUiw
	h4b241bFPQlZdNYEvDdHnNmiAOxjICODbkn2ddGHr/duQYBKKGWrz6/L8S8duPu8FtpoQ/wmf5N1Q
	MSkYyipoyArR21wk7CrnJPCVnjTpOHLrPxhA1/em8B/DEMIxFp5ToXfEXBLmpdgCfvccTv9bJXImS
	Sqt0PCdm0aAav0XPKSAP+xB+uXV5pVyhpLlFlysJ8aKNe4UTrcityxo2l89T6KwUrXDvFaJAb8/gG
	KvypEKIgc29MVbHanSjgMzC35gTxiLEe4MT4TQEKts34qtpLfko+LaPEnuHOVgp7+0BODhtjlHqUi
	hXiJZZsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOcgK-0000000Gjnh-3D9G;
	Thu, 27 Nov 2025 14:09:12 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOcgH-0000000Gjm3-0Sm3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Nov 2025 14:09:11 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A33C1176A;
	Thu, 27 Nov 2025 06:08:59 -0800 (PST)
Received: from [10.57.87.167] (unknown [10.57.87.167])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A32273F73B;
	Thu, 27 Nov 2025 06:09:05 -0800 (PST)
Message-ID: <cc9cd056-3786-42db-8e40-bb0425dfe142@arm.com>
Date: Thu, 27 Nov 2025 14:09:04 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Ryan Roberts <ryan.roberts@arm.com>
Subject: Re: [DISCUSSION] kstack offset randomization: bugs and performance
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Kees Cook <kees@kernel.org>, Will Deacon <will@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Jeremy Linton <jeremy.linton@arm.com>,
 Catalin Marinas <Catalin.Marinas@arm.com>,
 Mark Rutland <mark.rutland@arm.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <66c4e2a0-c7fb-46c2-acce-8a040a71cd8e@arm.com>
 <dd8c37bc-795f-4c7a-9086-69e584d8ab24@arm.com>
 <aSRtaVjfNc11EtKg@willie-the-truck>
 <B696956E-579E-412E-B774-AAADCFA4B31C@kernel.org>
 <ecc11ec7-ba00-41f1-8a2a-8f3a83c9ffd9@arm.com>
 <202511241250.EB2ADED@keescook>
 <d9b18b84-22ab-4bc8-b55f-804e0607cec6@arm.com>
 <CAMj1kXG4ELUdxGMp0+tNiV+7ygfHbe-u_pGPMTVj6UNdzQ+sDQ@mail.gmail.com>
 <202511262358.1B99951@keescook>
 <a5afc696-b288-433c-8fda-12b9126c02f1@arm.com>
 <CAMj1kXEJSmYXPNiHO4woBE8rVFOxkfuKOJ9JGacVC76GqkqY+w@mail.gmail.com>
Content-Language: en-GB
In-Reply-To: <CAMj1kXEJSmYXPNiHO4woBE8rVFOxkfuKOJ9JGacVC76GqkqY+w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251127_060909_292172_30676ADF 
X-CRM114-Status: GOOD (  30.04  )
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

On 27/11/2025 12:19, Ard Biesheuvel wrote:
> On Thu, 27 Nov 2025 at 12:50, Ryan Roberts <ryan.roberts@arm.com> wrote:
>>
>> On 27/11/2025 08:00, Kees Cook wrote:
>>> On Wed, Nov 26, 2025 at 11:58:40PM +0100, Ard Biesheuvel wrote:
> ...
>>>> the tail latency issue, but I'm not sure I understand why that is a
>>>> problem to begin with if it occurs sufficiently rarely. Is that a
>>>> PREEMPT_RT issue?
>>
>> Yes; RT was Jeremy's original motivation for looking at the prng approach.
>>
>> For the issue I see, improving the mean would be sufficient, but improving the
>> tail too is a bonus.
>>
>>>> Would it be better if the refill of the per-CPU
>>>> batched entropy buffers was relegated to some kind of kthread so it
>>>> can be scheduled independently? (Those buffers are all the same size
>>>> so we could easily keep a few hot spares)
>>
>> That came up in Jeremy's thread last year. My understanding was that this would
>> not help because either the thread is lower priority, in which case you can't
>> guarrantee it will run, or it is higher priority, in which case the RT thread
>> still takes the glitch. (But I'm hand waving - I'm not expert on the details).
>>
> 
> PREEMPT_RT is generally more concerned about the worst case latency
> being bounded rather than being as low as possible.

Sure, but if you can reduce the tail, that's still "better" right?

> 
> The get_random fallback runs a few rounds of chacha20, which takes
> more time than just reading the next value and bumping the position
> counter. But that does not imply it fails to meet RT constraints.
> 
> And if a thread running ChaCha20 in the background fails to get enough
> cycles, it is not an RT problem, it is an ordinary starvation problem,
> which can only be achieved by doing less work in total. But cranking
> prandom_u32_state() on every syscall is not free either.

Indeed, but it's  a lot cheaper than get_random. See:

https://lore.kernel.org/all/20251127105958.2427758-1-ryan.roberts@arm.com/

> 
> In summary, it would be good to have a better problem statement wrt RT
> constraints before assuming that 99% tail latency is something to
> obsess about, especially given the fact het getpid() is not that
> representative a syscall to begin with.

I think that's a fair point. But I also think the results I link above show very
clearly that one approach is more performant than the other, in terms of the
overhead of syscall entry and exit. And as I said when starting this thread,
that is something we have had complaints about from partners.

Personally, based on that data, I think we could reduce it to this decision tree:

is a prng good enough for kstack offset randomization?
  yes: is 3% syscall entry/exit overhead a reasonable price?
    yes: Land my series
    no: rip out kstack offset randomization
  no: is 10% syscall entry/exit overhead a reasonable price?
    yes: Land Ard's series
    no: rip out kstack offset randomization

For the avoidance of doubt, my opinion is that prng is good enough for 6 bits.

By the way, my sense is that we won't get much below 3% no matter what we do. It
looks to me like it could be bottlenecked on __alloca() which forces any
speculation using the incorrect stack address to be abandoned. So I don't think
offloading to a thread will end up helping us much. I don't have data that shows
that conclusively, but that's my intuition from some earlier benchmarking.

Thanks,
Ryan


