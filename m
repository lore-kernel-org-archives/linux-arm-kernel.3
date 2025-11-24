Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B20F7CFD340
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Nov 2025 17:50:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uMxwzkjUbHSlCREDuWZdbtMRE9C753ReQvDktnODA4A=; b=AKFzNMhRDOUql6oQWjvNuHZoKG
	nXRnAYanf2hwYi3p+Nog3c44WdJHeYUsSikFcx8s17RBMyfzoElroS8VN/Ep3JL7SU0tz/CQebRpK
	pV/knFe2xC06eI3SncwvOqur/7LIrP5EpsJTL+t7oJCjSVE3ClQzDFoyt2xjUWV7+k6I4JO97LF57
	HqkJA6dofcrij1MEdWcFYG3fzMcvLlAWY5ZYbeaJg37FY4/8imRV0R5ui/uMlNQup8GMWunajwT1f
	evSccK4qFPNpd5fTv3bABkWugL40sgqoBLISrQrTHje8SUVXqQTaJnEQT7QtSO1YeD8JXRNnsfHWA
	fcW7DBog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNahi-0000000C8I1-28nn;
	Mon, 24 Nov 2025 17:50:22 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNahf-0000000C8HX-0p2H
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Nov 2025 17:50:20 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4374D1477;
	Mon, 24 Nov 2025 09:50:10 -0800 (PST)
Received: from [10.57.88.238] (unknown [10.57.88.238])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4D8623F73B;
	Mon, 24 Nov 2025 09:50:16 -0800 (PST)
Message-ID: <ecc11ec7-ba00-41f1-8a2a-8f3a83c9ffd9@arm.com>
Date: Mon, 24 Nov 2025 17:50:14 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [DISCUSSION] kstack offset randomization: bugs and performance
Content-Language: en-GB
To: Kees Cook <kees@kernel.org>, Will Deacon <will@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Ard Biesheuvel <ardb@kernel.org>,
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
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <B696956E-579E-412E-B774-AAADCFA4B31C@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251124_095019_387023_CA625EC3 
X-CRM114-Status: GOOD (  23.13  )
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

On 24/11/2025 17:11, Kees Cook wrote:
> 
> 
> On November 24, 2025 6:36:25 AM PST, Will Deacon <will@kernel.org> wrote:
>> On Mon, Nov 17, 2025 at 11:31:22AM +0000, Ryan Roberts wrote:
>>> On 17/11/2025 11:30, Ryan Roberts wrote:
>>>> Could this give us a middle ground between strong-crng and
>>>> weak-timestamp-counter? Perhaps the main issue is that we need to store the
>>>> secret key for a long period?
>>>>
>>>>
>>>> Anyway, I plan to work up a series with the bugfixes and performance
>>>> improvements. I'll add the siphash approach as an experimental addition and get
>>>> some more detailed numbers for all the options. But wanted to raise it all here
>>>> first to get any early feedback.
>>
>> FWIW, I share Mark's concerns about using a counter for this. Given that
>> the feature currently appears to be both slow _and_ broken I'd vote for
>> either removing it or switching over to per-thread offsets as a first
>> step.
> 
> That it has potential weaknesses doesn't mean it should be entirely removed.
> 
>> We already have a per-task stack canary with
>> CONFIG_STACKPROTECTOR_PER_TASK so I don't understand the reluctance to
>> do something similar here.
> 
> That's not a reasonable comparison: the stack canary cannot change arbitrarily for a task or it would immediately crash on a function return. :)
> 
>> Speeding up the crypto feels like something that could happen separately.
> 
> Sure. But let's see what Ryan's patches look like. The suggested changes sound good to me.

Just to say I haven't forgotten about this; I ended up having to switch to
something more urgent. Hoping to get back to it later this week. I don't think
this is an urgent issue, so hopefully folks are ok waiting.

I propose to post whatever I end up with then we can all disscuss from there.
But the rough shape so far:

Fixes:
 - Remove choose_random_kstack_offset()
 - arch passes random into add_random_kstack_offset() (fixes migration bypass)
 - Move add_random_kstack_offset() to el0_svc()/el0_svc_compat() (before
   enabling interrupts) to fix non-preemption requirement (arm64)

Perf Improvements:
 - Based on Jeremy's prng, but buffer the 32 bits and use 6 bits per syscall (so
   cost of prng generation is amortized over 5 syscalls)
 - Reseed prng using get_random_u64() every 64K prng invocations (so cost of
   get_random_u64() is amortized over 64K*5 syscalls)
 - So while get_random_u64() still has a latency spike, it's so infrequent that
   it doesn't show up in p99.9 for my benchmarks.
 - If we want to change it to per-task, I think it's all amenable.
 - I'll leave the timer off limits for arm64.

Although I'm seeing some inconsistencies in the performance measurements, so
need to get that understood properly first.

Thanks,
Ryan


> 
> -Kees
> 
> 


