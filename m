Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D3FCC2A074
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 11:05:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MJYHkYuydpY2/DvHn3CvEN2xXedIpu0NCd5blmdiT8A=; b=wt+C4SoFR2T9GnxTadYnn7Q+TH
	85b+5f4DL3Js3uP7eVifCz3HiDoY0dqI/h47c5HI8Eifh7VTCKCu1PqEGPkxKC0edjXi/XA41hKKD
	cN2CayYdjorBTzRseQVHfC2VtSd2mTu0OCT7jGs9uOR9IhG+GHGcAUN/+GK/HqcdO3dZSe8OUIVS5
	ODTgFEHe5mHq9r8JCG3dJ9aKMMf7Q9bvbwopFLAxAaoriwLhcO0rc29dY+d2PKqTqc41+O2VuDruO
	o45jwy/qjFI+C5+wp3BXyj+hsSUEQkJTl/7p0kVTq8yXi1zxi3A8euYYYP1rl7lupwC7QY6FdEvUj
	PaiOD35w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vciOs-0000000B9b0-3TTO;
	Mon, 05 Jan 2026 11:05:26 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vciOq-0000000B9ab-0ScC;
	Mon, 05 Jan 2026 11:05:25 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E6BC5497;
	Mon,  5 Jan 2026 03:05:15 -0800 (PST)
Received: from [10.1.38.150] (XHFQ2J9959.cambridge.arm.com [10.1.38.150])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 652C93F5A1;
	Mon,  5 Jan 2026 03:05:19 -0800 (PST)
Message-ID: <60c5d7b1-1ab7-490c-8cb8-dfd50cf23856@arm.com>
Date: Mon, 5 Jan 2026 11:05:18 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] randomize_kstack: Unify random source across
 arches
Content-Language: en-GB
To: David Laight <david.laight.linux@gmail.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Huacai Chen <chenhuacai@kernel.org>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Mark Rutland <mark.rutland@arm.com>,
 "Jason A. Donenfeld" <Jason@zx2c4.com>, Ard Biesheuvel <ardb@kernel.org>,
 Jeremy Linton <jeremy.linton@arm.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-hardening@vger.kernel.org
References: <20260102131156.3265118-1-ryan.roberts@arm.com>
 <20260102131156.3265118-4-ryan.roberts@arm.com>
 <20260104230136.7aaf8886@pumpkin>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <20260104230136.7aaf8886@pumpkin>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_030524_252313_BBD434F4 
X-CRM114-Status: GOOD (  33.31  )
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

On 04/01/2026 23:01, David Laight wrote:
> On Fri,  2 Jan 2026 13:11:54 +0000
> Ryan Roberts <ryan.roberts@arm.com> wrote:
> 
>> Previously different architectures were using random sources of
>> differing strength and cost to decide the random kstack offset. A number
>> of architectures (loongarch, powerpc, s390, x86) were using their
>> timestamp counter, at whatever the frequency happened to be. Other
>> arches (arm64, riscv) were using entropy from the crng via
>> get_random_u16().
>>
>> There have been concerns that in some cases the timestamp counters may
>> be too weak, because they can be easily guessed or influenced by user
>> space. And get_random_u16() has been shown to be too costly for the
>> level of protection kstack offset randomization provides.
>>
>> So let's use a common, architecture-agnostic source of entropy; a
>> per-cpu prng, seeded at boot-time from the crng. This has a few
>> benefits:
>>
>>   - We can remove choose_random_kstack_offset(); That was only there to
>>     try to make the timestamp counter value a bit harder to influence
>>     from user space.
>>
>>   - The architecture code is simplified. All it has to do now is call
>>     add_random_kstack_offset() in the syscall path.
>>
>>   - The strength of the randomness can be reasoned about independently
>>     of the architecture.
>>
>>   - Arches previously using get_random_u16() now have much faster
>>     syscall paths, see below results.
>>
>> There have been some claims that a prng may be less strong than the
>> timestamp counter if not regularly reseeded. But the prng has a period
>> of about 2^113. So as long as the prng state remains secret, it should
>> not be possible to guess. If the prng state can be accessed, we have
>> bigger problems.
> 
> If you have 128 bits of output from consecutive outputs I think you
> can trivially determine the full state using (almost) 'school boy' maths
> that could be done on pencil and paper.
> (Most of the work only has to be done once.)
> 
> The underlying problem is that the TAUSWORTHE() transformation is 'linear'
> So that TAUSWORTHE(x ^ y) == TAUSWORTHE(x) ^ TAUSWORTHE(y).
> (This is true of a LFSR/CRC and TOUSWORTH() is doing some subset of CRCs.)
> This means that each output bit is the 'xor' of some of the input bits.
> The four new 'state' values are just xor of the the bits of the old ones.
> The final xor of the four states gives a 32bit value with each bit just
> an xor of some of the 128 state bits.
> Get four consecutive 32 bit values and you can solve the 128 simultaneous
> equations (by trivial substitution) and get the initial state.
> The solution gives you the 128 128bit constants for:
> 	u128 state = 0;
> 	u128 val = 'value returned from 4 calls';
> 	for (int i = 0; i < 128; i++)
> 		state |= parity(const128[i] ^ val) << i;

What is const128[] here?

> You done need all 32bits, just accumulate 128 bits.  
> So if you can get the 5bit stack offset from 26 system calls you know the
> value that will be used for all the subsequent calls.

It's not immediately obvious to me how user space would do this, but I'll take
it on faith that it may be possible.

> 
> Simply changing the final line to use + not ^ makes the output non-linear
> and solving the equations a lot harder.

There has been pushback on introducing new primitives [1] but I don't think
that's a reason not to considder it.

[1] https://lore.kernel.org/all/aRyppb8PCxFKVphr@zx2c4.com/

> 
> I might sit down tomorrow and see if I can actually code it...

Thanks for the analysis! I look forward to seeing your conclusion... although
I'm not sure I'll be qualified to evaluate it mathematically.

FWIW, I previously had a go at various schemes using siphash to calculate some
random bits. I found it to be significantly slower than this prng. I've so far
taken the view that 6 bits of randomness is not much of a defence against brute
force so we really shouldn't be spending too many cycles to generate the bits.
If we can get to approach to work, I think that's best.

Thanks,
Ryan

> 
> 	David
> 
>  


