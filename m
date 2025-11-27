Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29EE6D111A8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Nov 2025 15:57:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bg1owQV5V7behflaSwXEAFke18eD2nGFCLjM9u9H2Xo=; b=pRezHlXmY6a75VKN94MRMiFo8g
	baVgx9gXrYW5tpK6VR0nxvz4FuFci1VV7JPD4YyQwWH2f7iDarXDpbY1Y0ZW6D0z5gXxdHlDAf8pX
	W/FvZEUBcjNf5Zya6KkRfev5v5dBeYfbYvQbhMuwaIObn3Ay0FewBPLFRSfFOUV+d092FYSluMQHV
	PIeMczVDe4TRVxmd/YVcjLhDUZAZtP7SKzPRtNVgDmsfFVcX9oAiEGNZaXsOZnVRuXQDb8FiK8t3A
	v52tLWzkiT935eR8CtdAO7KsAL3KAfpa3m37wunCfmdH7ZYQmj5lOzxGUKoHbO3nbHPgqhwIUgBQp
	rmbDlT+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOeMk-0000000Gt2J-1ZKb;
	Thu, 27 Nov 2025 15:57:06 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOeMh-0000000Gt1j-3JZV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Nov 2025 15:57:05 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 87DC6176A;
	Thu, 27 Nov 2025 07:56:55 -0800 (PST)
Received: from [10.57.87.167] (unknown [10.57.87.167])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1DBFC3F73B;
	Thu, 27 Nov 2025 07:57:00 -0800 (PST)
Message-ID: <f95593ac-d4cf-4e06-9a94-cc5133897c59@arm.com>
Date: Thu, 27 Nov 2025 15:56:59 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC/RFT PATCH 0/6] Improve get_random_u8() for use in randomize
 kstack
Content-Language: en-GB
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Ard Biesheuvel <ardb+git@google.com>, linux-hardening@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Kees Cook <kees@kernel.org>, Will Deacon <will@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Jeremy Linton <jeremy.linton@arm.com>,
 Catalin Marinas <Catalin.Marinas@arm.com>,
 Mark Rutland <mark.rutland@arm.com>, "Jason A. Donenfeld" <Jason@zx2c4.com>
References: <20251127092226.1439196-8-ardb+git@google.com>
 <b1dae5a7-27bd-42de-bcce-9fd3c2b1c178@arm.com>
 <CAMj1kXE-Qm4DQNAcg8Tg7YM4EMdLBu_UJm7M8Cpk3t5g7XqP5w@mail.gmail.com>
 <e996fdd5-7113-4327-a884-336dd5f77c4d@arm.com>
 <CAMj1kXGyYMy2xhcdNicHkMfWBnEjyhc+xg8ciuR-6WXDxDpZxg@mail.gmail.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <CAMj1kXGyYMy2xhcdNicHkMfWBnEjyhc+xg8ciuR-6WXDxDpZxg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251127_075703_936538_4FE19360 
X-CRM114-Status: GOOD (  27.39  )
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

On 27/11/2025 15:03, Ard Biesheuvel wrote:
> On Thu, 27 Nov 2025 at 15:18, Ryan Roberts <ryan.roberts@arm.com> wrote:
>>
>> On 27/11/2025 12:28, Ard Biesheuvel wrote:
>>> On Thu, 27 Nov 2025 at 13:12, Ryan Roberts <ryan.roberts@arm.com> wrote:
>>>>
>>>> On 27/11/2025 09:22, Ard Biesheuvel wrote:
>>>>> From: Ard Biesheuvel <ardb@kernel.org>
>>>>>
>>>>> Ryan reports that get_random_u16() is dominant in the performance
>>>>> profiling of syscall entry when kstack randomization is enabled [0].
>>>>>
>>>>> This is the reason many architectures rely on a counter instead, and
>>>>> that, in turn, is the reason for the convoluted way the (pseudo-)entropy
>>>>> is gathered and recorded in a per-CPU variable.
>>>>>
>>>>> Let's try to make the get_random_uXX() fast path faster, and switch to
>>>>> get_random_u8() so that we'll hit the slow path 2x less often. Then,
>>>>> wire it up in the syscall entry path, replacing the per-CPU variable,
>>>>> making the logic at syscall exit redundant.
>>>>
>>>> I ran the same set of syscall benchmarks for this series as I've done for my
>>>> series.
>>>>
>>>
>>> Thanks!
>>>
>>>
>>>> The baseline is v6.18-rc5 with stack randomization turned *off*. So I'm showing
>>>> performance cost of turning it on without any changes to the implementation,
>>>> then the reduced performance cost of turning it on with my changes applied, and
>>>> finally cost of turning it on with Ard's changes applied:
>>>>
>>>> arm64 (AWS Graviton3):
>>>> +-----------------+--------------+-------------+---------------+-----------------+
>>>> | Benchmark       | Result Class |   v6.18-rc5 | per-task-prng | fast-get-random |
>>>> |                 |              | rndstack-on |               |                 |
>>>> +=================+==============+=============+===============+=================+
>>>> | syscall/getpid  | mean (ns)    |  (R) 15.62% |     (R) 3.43% |      (R) 11.93% |
>>>> |                 | p99 (ns)     | (R) 155.01% |     (R) 3.20% |      (R) 11.00% |
>>>> |                 | p99.9 (ns)   | (R) 156.71% |     (R) 2.93% |      (R) 11.39% |
>>>> +-----------------+--------------+-------------+---------------+-----------------+
>>>> | syscall/getppid | mean (ns)    |  (R) 14.09% |     (R) 2.12% |      (R) 10.44% |
>>>> |                 | p99 (ns)     | (R) 152.81% |         1.55% |       (R) 9.94% |
>>>> |                 | p99.9 (ns)   | (R) 153.67% |         1.77% |       (R) 9.83% |
>>>> +-----------------+--------------+-------------+---------------+-----------------+
>>>> | syscall/invalid | mean (ns)    |  (R) 13.89% |     (R) 3.32% |      (R) 10.39% |
>>>> |                 | p99 (ns)     | (R) 165.82% |     (R) 3.51% |      (R) 10.72% |
>>>> |                 | p99.9 (ns)   | (R) 168.83% |     (R) 3.77% |      (R) 11.03% |
>>>> +-----------------+--------------+-------------+---------------+-----------------+
>>>>
>>>
>>> What does the (R) mean?
>>>
>>>> So this fixes the tail problem. I guess get_random_u8() only takes the slow path
>>>> every 768 calls, whereas get_random_u16() took it every 384 calls. I'm not sure
>>>> that fully explains it though.
>>>>
>>>> But it's still a 10% cost on average.
>>>>
>>>> Personally I think 10% syscall cost is too much to pay for 6 bits of stack
>>>> randomisation. 3% is better, but still higher than we would all prefer, I'm sure.
>>>>
>>>
>>> Interesting!
>>>
>>> So the only thing that get_random_u8() does that could explain the
>>> delta is calling into the scheduler on preempt_enable(), given that it
>>> does very little beyond that.
>>>
>>> Would you mind repeating this experiment after changing the
>>> put_cpu_var() to preempt_enable_no_resched(), to test this theory?
>>
>> This has no impact on performance.
>>
> 
> Thanks. But this is really rather surprising: what else could be
> taking up that time, given that on the fast path, there are only some
> loads and stores to the buffer, and a cmpxchg64_local(). Could it be
> the latter that is causing so much latency? I suppose the local
> cmpxchg() semantics don't really exist on arm64, and this uses the
> exact same LSE instruction that would be used for an ordinary
> cmpxchg(), unlike on x86 where it appears to omit the LOCK prefix.
> 
> In any case, there is no debate that your code is faster on arm64. 

The results I have for x86 show it's faster than the rdtsc too, although that's
also somewhat surprising. I'll run your series on x86 to get the equivalent data.

> I
> also think that using prandom for this purpose is perfectly fine, even
> without reseeding: with a 2^113 period and only 6 observable bits per
> 32 bit sample, predicting the next value reliably is maybe not
> impossible, but hardly worth the extensive effort, given that we're
> not generating cryptographic keys here.
> 
> So the question is really whether we want to dedicate 16 bytes per
> task for this. I wouldn't mind personally, but it is something our
> internal QA engineers tend to obsess over.

Yeah that's a good point. Is this something we could potentially keep at the
start of the kstack? Is there any precident for keeping state there at the
moment? For arm64, I know there is a general feeling that 16K for the stack more
than enough (but we are stuck with it because 8K isn't quite enough). So it
would be "for free". I guess it would be tricky to do this in an arch-agnostic
way though...

Thanks,
Ryan


