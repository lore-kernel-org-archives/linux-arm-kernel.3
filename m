Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF5DDD29C24
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 12:59:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vRapS2UU+bZ5z6b6wUBCgdQRmzqNBCAqJn4OuM1dpLI=; b=n2ADeApb/fdC+ABKo8ORjF9SY5
	EHULaw5f9igXOFmtbanUSp7MaIV7uCcNTyEWdLc5Ts/t/dUMSiH7J1wS7igQ76jcQq+YfbnGReMlw
	VAwslyxR3nklGDYE8zEoXih9TpCv0KcAq9mgnAFtlX8HBmN06T+/bYRd5XXGECJ2jV2PNDplOQvua
	RUOcIWH6dXH/gMPQPgOD+ut0Wtjho8IA1ubgzv0fDgoyLgIEwG9KodQ5PE6Xe6Us0QBvoapgV0frw
	6miC93QSIz8ncudsG2iO1S0jKjxx8yjbswyBOrfhiCPzg/N6MsXuk/7W775haw6W0qxhWov/e7n+d
	Fl3CC+EA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhoqa-0000000271c-0yNL;
	Mon, 19 Jan 2026 12:59:10 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhoqV-000000026yz-0f55;
	Mon, 19 Jan 2026 12:59:05 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C31E1497;
	Mon, 19 Jan 2026 04:58:52 -0800 (PST)
Received: from [10.57.93.204] (unknown [10.57.93.204])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CEBCD3F740;
	Mon, 19 Jan 2026 04:58:54 -0800 (PST)
Message-ID: <95da406c-e8e9-4029-bdbe-845322037be5@arm.com>
Date: Mon, 19 Jan 2026 12:58:53 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/3] Fix bugs and performance of kstack offset
 randomisation
Content-Language: en-GB
To: David Laight <david.laight.linux@gmail.com>,
 Mark Rutland <mark.rutland@arm.com>
Cc: Kees Cook <kees@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, Arnd Bergmann
 <arnd@arndb.de>, "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Ard Biesheuvel <ardb@kernel.org>, Jeremy Linton <jeremy.linton@arm.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-hardening@vger.kernel.org
References: <20260102131156.3265118-1-ryan.roberts@arm.com>
 <aW4NC9P3K7Ab_e8j@J2N7QTR9R3> <20260119122248.30974c78@pumpkin>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <20260119122248.30974c78@pumpkin>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_045903_312070_38A69596 
X-CRM114-Status: GOOD (  29.24  )
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

On 19/01/2026 12:22, David Laight wrote:
> On Mon, 19 Jan 2026 10:52:59 +0000
> Mark Rutland <mark.rutland@arm.com> wrote:
> 
>> On Fri, Jan 02, 2026 at 01:11:51PM +0000, Ryan Roberts wrote:
>>> Hi All,  
>>
>> Hi Ryan,
>>
>>> As I reported at [1], kstack offset randomisation suffers from a couple of bugs
>>> and, on arm64 at least, the performance is poor. This series attempts to fix
>>> both; patch 1 provides back-portable fixes for the functional bugs. Patches 2-3
>>> propose a performance improvement approach.
>>>
>>> I've looked at a few different options but ultimately decided that Jeremy's
>>> original prng approach is the fastest. I made the argument that this approach is
>>> secure "enough" in the RFC [2] and the responses indicated agreement.  
>>
>> FWIW, the series all looks good to me. I understand you're likely to
>> spin a v4 with a couple of minor tweaks (fixing typos and adding an
>> out-of-line wrapper for a prandom function), but I don't think there's
>> anything material that needs to change.
>>
>> I've given my Ack on all three patches. I've given the series a quick
>> boot test (atop v6.19-rc4) with a bunch of debug options enabled, and
>> all looks well.
>>
>> Kees, do you have any comments? It would be nice if we could queue this
>> up soon.
> 
> I don't want to stop this being queued up in its current form.
> But I don't see an obvious need for multiple per-cpu prng
> (there are a couple of others lurking), surely one will do.

I see 2 other per-cpu prngs; one for BPF and one for the scheduler. The state is
16 bytes per prng, per cpu. So personally I think the maintainability advantages
of keeping them separate to their respective subsystems wins out vs the memory
cost in this particular case?

> 
> How much overhead does the get_cpu_var() add?
> I think it has to disable pre-emption (or interrupts) which might
> be more expensive on non-x86 (which can just do 'inc %gs:address').

The RFC used a per-task prng, then v2 switched to per-cpu. Performance numbers
can be compared from those 2 for arm64 only (the x86 numbers are from different
systems in the 2 version):

RFC: https://lore.kernel.org/all/20251127105958.2427758-3-ryan.roberts@arm.com/
v2: https://lore.kernel.org/all/20251215163520.1144179-4-ryan.roberts@arm.com/

+-----------------+--------------+---------------+---------------+
| Benchmark       | Result Class | per-task-prng |  per-cpu-prng |
|                 |              |         arm64 |         arm64 |
+=================+==============+===============+===============+
| syscall/getpid  | mean (ns)    |   (I) -10.54% |    (I) -9.50% |
|                 | p99 (ns)     |   (I) -59.53% |   (I) -59.24% |
|                 | p99.9 (ns)   |   (I) -59.90% |   (I) -59.52% |
+-----------------+--------------+---------------+---------------+
| syscall/getppid | mean (ns)    |   (I) -10.49% |    (I) -9.52% |
|                 | p99 (ns)     |   (I) -59.83% |   (I) -59.25% |
|                 | p99.9 (ns)   |   (I) -59.88% |   (I) -59.50% |
+-----------------+--------------+---------------+---------------+
| syscall/invalid | mean (ns)    |    (I) -9.28% |   (I) -10.31% |
|                 | p99 (ns)     |   (I) -61.06% |   (I) -60.79% |
|                 | p99.9 (ns)   |   (I) -61.40% |   (I) -61.04% |
+-----------------+--------------+---------------+---------------+

So getpid and getppid are a small amount better with per-task. invalid is a
small amount better with per-cpu. I decided that it's likely mostly noise and
per-cpu is therefore preferable since it costs (a bit) less memory.

> 
> I'm sure I remember a version that used a per-task prng.

Yes; as per above.

> That just needs 'current' - which might be known and/or be cheaper
> to get.
> (Although I also remember a reference some system where it was slow...)
> 
> The other option is just to play 'fast and loose' with the prng data.
> Using the state from the 'wrong cpu' (if the code is pre-empted) won't
> really matter.
> You might get a RrwW (or even RrwrwW) sequence, but the prng won't be used
> for anything 'really important' so it shouldn't matter.

As per above, I'm not really seeing much performance cost.

My opinion is that this series represents an improvement over what's already
there. I'd be happy to review an additional series to merge per-cpu prngs, but I
don't think that should be a prerequisite for getting this series merged.

Thanks,
Ryan

> 
> 	David


