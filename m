Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21554D11183
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Nov 2025 11:50:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ibcuwO6xfJfZ456dbZYjIw+Q+yMPtQjnoZOZn1zqnCA=; b=sh9LOPH6VS/t8RsD7UyT10OCtQ
	6sYnXc1xyonPcFa2nzDsZNHHPXS2P7JKrce2tMtFAFUoQIY3bPwQZjr549fwcP6KEJ86JxyVoqIwb
	CFSJOwRwbzhafKS5N8gJ04RjysNNQ7xbBIKQ8ELJsjpkfAzUy9nF0x1omKK1eJ0Rc4HEV6s64IZwT
	iuWCesv+GA4pMlHRI/hsp/Th7Tw815iD644s5pD4aQYEDyHmvDeU2wBTjQIYSnPChQ6qvlxqCcGxr
	5IzBipo4VFzL0SDrMBmjnrMRTWMI8tRoFgOa2F2Nh2fv64IoihGpPRNrgvVCgPX6pI04BR/UwbYmv
	TApmOmsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOaVq-0000000GUit-0Npz;
	Thu, 27 Nov 2025 11:50:14 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOaVn-0000000GUh7-1r5x
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Nov 2025 11:50:13 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 16FFD1477;
	Thu, 27 Nov 2025 03:50:00 -0800 (PST)
Received: from [10.57.87.167] (unknown [10.57.87.167])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 15DCD3F66E;
	Thu, 27 Nov 2025 03:50:05 -0800 (PST)
Message-ID: <a5afc696-b288-433c-8fda-12b9126c02f1@arm.com>
Date: Thu, 27 Nov 2025 11:50:04 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [DISCUSSION] kstack offset randomization: bugs and performance
To: Kees Cook <kees@kernel.org>, Ard Biesheuvel <ardb@kernel.org>
Cc: Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Jeremy Linton <jeremy.linton@arm.com>,
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
From: Ryan Roberts <ryan.roberts@arm.com>
Content-Language: en-GB
In-Reply-To: <202511262358.1B99951@keescook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251127_035011_567668_B1E06E0C 
X-CRM114-Status: GOOD (  38.01  )
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

On 27/11/2025 08:00, Kees Cook wrote:
> On Wed, Nov 26, 2025 at 11:58:40PM +0100, Ard Biesheuvel wrote:
>> On Tue, 25 Nov 2025 at 12:15, Ryan Roberts <ryan.roberts@arm.com> wrote:
>>>
>>> On 24/11/2025 20:51, Kees Cook wrote:
>>>> On Mon, Nov 24, 2025 at 05:50:14PM +0000, Ryan Roberts wrote:
>>>>> On 24/11/2025 17:11, Kees Cook wrote:
>>>>>>
>>>>>>
>>>>>> On November 24, 2025 6:36:25 AM PST, Will Deacon <will@kernel.org> wrote:
>>>>>>> On Mon, Nov 17, 2025 at 11:31:22AM +0000, Ryan Roberts wrote:
>>>>>>>> On 17/11/2025 11:30, Ryan Roberts wrote:
>>>>>>>>> Could this give us a middle ground between strong-crng and
>>>>>>>>> weak-timestamp-counter? Perhaps the main issue is that we need to store the
>>>>>>>>> secret key for a long period?
>>>>>>>>>
>>>>>>>>>
>>>>>>>>> Anyway, I plan to work up a series with the bugfixes and performance
>>>>>>>>> improvements. I'll add the siphash approach as an experimental addition and get
>>>>>>>>> some more detailed numbers for all the options. But wanted to raise it all here
>>>>>>>>> first to get any early feedback.
>>>>>>>
>>>>>>> FWIW, I share Mark's concerns about using a counter for this. Given that
>>>>>>> the feature currently appears to be both slow _and_ broken I'd vote for
>>>>>>> either removing it or switching over to per-thread offsets as a first
>>>>>>> step.
>>>>>>
>>>>>> That it has potential weaknesses doesn't mean it should be entirely removed.
>>>>>>
>>>>>>> We already have a per-task stack canary with
>>>>>>> CONFIG_STACKPROTECTOR_PER_TASK so I don't understand the reluctance to
>>>>>>> do something similar here.
>>>>>>
>>>>>> That's not a reasonable comparison: the stack canary cannot change arbitrarily for a task or it would immediately crash on a function return. :)
>>>>>>
>>>>>>> Speeding up the crypto feels like something that could happen separately.
>>>>>>
>>>>>> Sure. But let's see what Ryan's patches look like. The suggested changes sound good to me.
>>>>>
>>>>> Just to say I haven't forgotten about this; I ended up having to switch to
>>>>> something more urgent. Hoping to get back to it later this week. I don't think
>>>>> this is an urgent issue, so hopefully folks are ok waiting.
>>>>>
>>>>> I propose to post whatever I end up with then we can all disscuss from there.
>>>>> But the rough shape so far:
>>>>>
>>>>> Fixes:
>>>>>  - Remove choose_random_kstack_offset()
>>>>>  - arch passes random into add_random_kstack_offset() (fixes migration bypass)
>>>>>  - Move add_random_kstack_offset() to el0_svc()/el0_svc_compat() (before
>>>>>    enabling interrupts) to fix non-preemption requirement (arm64)
>>>>
>>>> I thought we'd keep choose_random_kstack_offset() and just move
>>>> everything into a per-task location? (And for arm64 only)
>>>
>>> Err... I thought you were the one arguing against per-task state? I'm not really
>>> keen on having arm64 do a completely different thing to everyone else; It seems
>>> reasonable to me that we only need to (continue to) abstract the random source
>>> per-arch and the rest should remain common?
>>>
>>> Per my previous mails, I'm not really sure what choose_random_kstack_offset() is
>>> giving us in practice. Why not simplify?
>>>
>>
>> It seems to me that arm64 inherited a lot of complexity from other
>> architectures that rely on a counter. AIUI, the 'non-preemption
>> requirement' and the 'migration bypass' issues are both a result of
>> the fact that the syscall duration is relied upon to provide more
>> pseudo-randomness, which is recorded in a per-CPU counter when the
>> syscall completes and carried over to the next invocation. (I don't
>> really buy the idea that having the next offset in memory for a
>> shorter time buys us anything in terms of robustness tbh)

Agreed.

>>
>> I have some patches that make get_random_uXX()'s fast path lockless
>> that I will send out shortly (assuming no hate mail from the bots in
>> the mean time), which should make it suitable for general use as the
>> entropy source for kstack randomization on all architectures, modulo
>> the tail latency issue, but I'm not sure I understand why that is a
>> problem to begin with if it occurs sufficiently rarely. Is that a
>> PREEMPT_RT issue? 

Yes; RT was Jeremy's original motivation for looking at the prng approach.

For the issue I see, improving the mean would be sufficient, but improving the
tail too is a bonus.

>> Would it be better if the refill of the per-CPU
>> batched entropy buffers was relegated to some kind of kthread so it
>> can be scheduled independently? (Those buffers are all the same size
>> so we could easily keep a few hot spares)

That came up in Jeremy's thread last year. My understanding was that this would
not help because either the thread is lower priority, in which case you can't
guarrantee it will run, or it is higher priority, in which case the RT thread
still takes the glitch. (But I'm hand waving - I'm not expert on the details).

>>
>> TL;DR I agree with Ryan but I'd like to fix it across the board, i.e.,
>> get rid of the per-CPU variable entirely and all the dodgy uses of
>> counters.
> 
> Right, the whole design of picking the next random number after the
> syscall is to try to reduce the control an attacker would have given an
> instruction counter is the randomness source in most cases (during the
> original design no one could agree on a fast enough randomness source).
> 
> If we can fix that then we can fix this for all architectures and all
> randomness users generally.
> 
> -Kees
> 


