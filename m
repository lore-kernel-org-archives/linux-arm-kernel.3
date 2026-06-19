Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E942CD4F26
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Jun 2026 12:40:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rOBaUSm33VpCqiY2t4y4oxN3NFma2nf9WA0jw5TShzk=; b=J9TX0x1OpyNMFH+RDNhosvHXfk
	ynhbC2eg3yczFiZBviY+WpvnsF21bvj6gRXy5+/gloHxpJ1bV59LiOmCrEcr+I6ps+lvYPj/+04Vt
	FfD7k8C6cuo5GEql1hPyqG9f8wapXTi819OTRfwZUtGSr9xpPkONIHrYRac1w584zAg3eeZ5PgyQu
	wB8Mrg8ObLX5H23VgLWZ+w0NST0Eqelxfkfc8LsmJlyAmNghN3uMTXRicwP9YkENtvz6TP4gKUzOQ
	Yo8GBpman/jDt9kgOMQt1Uqs4xXSzIkyEHaLdXOKbFKw6T/NP9FUipE+oVQhTO4AJH3NO1dRN8BrN
	rK22eFWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waYWK-00000002QA5-1EGl;
	Fri, 19 Jun 2026 12:40:28 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waYWJ-00000002Q9x-0zkD
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Jun 2026 12:40:27 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 1D1FB601F0;
	Fri, 19 Jun 2026 12:40:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 289751F00A3F;
	Fri, 19 Jun 2026 12:40:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781872825;
	bh=rOBaUSm33VpCqiY2t4y4oxN3NFma2nf9WA0jw5TShzk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=gC9ulqpz0uaCD850OKmHaouCJxZTZ3JKNmvg5he4r4YKSBKv4Shi1dCDP+xGSN4Ez
	 lqZU4COkz48vcwlWGXuIcBEYeFZ9z0vE6cdcgzTkeIuMSi+/lgVmJIgX2ExVRNG2RD
	 bjPyaDsUrkMy9kCCVV7PaSwUqVwwSPi3w2l8/ePbT6hx4KHZgj0pHbBiL2LjJJjoJL
	 MGnz9bixozCSNSXHshyxbxaKevLtVCMVHbTwVJjm+p56hNJgHsAYI8q5VU2Jlbc5Zc
	 baoq1URKHCJu9v6Ig5/oTqlXfrX4lInB6yQQ0b0eHaPHEj1YQN+0wL/x8z17O5rFm1
	 RpWLffNvRt3fQ==
Message-ID: <c13d95d0-911f-48f6-b4ca-8a5e9aacef6c@kernel.org>
Date: Fri, 19 Jun 2026 14:40:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: errata: Handle Apple WFI State Loss
To: Mark Rutland <mark.rutland@arm.com>, Yureka Lilian <yureka@cyberchaos.dev>
Cc: Will Deacon <will@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 asahi@lists.linux.dev, Sasha Finkelstein <k@chaosmail.tech>
References: <20260615-wfi-erratum-v2-1-59a73467f70d@cyberchaos.dev>
 <ajAT9fWgOd9HY7ei@willie-the-truck>
 <e105c7b2-a5eb-4b5d-955f-685058143e9d@cyberchaos.dev>
 <ajUbcv75FuSPPi9o@J2N7QTR9R3>
Content-Language: en-US
From: Sven Peter <sven@kernel.org>
In-Reply-To: <ajUbcv75FuSPPi9o@J2N7QTR9R3>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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



On 6/19/26 12:38, Mark Rutland wrote:
> On Wed, Jun 17, 2026 at 09:23:03PM +0200, Yureka Lilian wrote:
>> On 6/15/26 17:02, Will Deacon wrote:
>>> On Mon, Jun 15, 2026 at 02:21:36PM +0200, Yureka Lilian wrote:
>>>> Apple Silicon CPUs can lose register state in WFI, leading to crashes
>>>> in the idle loop early in the boot process.
>>>> This applies to any previous Apple Silicon CPUs too, but is worked
>>>> around by configuring the WFI mode in SYS_IMP_APL_CYC_OVRD sysreg
>>>> during m1n1's chickens setup.
>>>> This workaround no longer exists since M4.
> 
> Are we *certain* that there's no equivalent control elsewhere? i.e. this
> hasn't just moved?

We are as certain as we can be short of Apple confirming this which 
isn't going to happen.
XNU has a helper function to "force wfi to use clock gating only" [1] 
which is how we learned about this control originally on M1.
This has been disabled starting with M4 using the "NO_CPU_OVRD" define 
which they describe as "CPU_OVRD register accesses are banned" [2]. If 
there was an equivalent control elsewhere I would expect them to just 
use that one instead.

In addition most non-architectural sysregs are read-only starting with 
M4 in the non-Apple-entitled boot mode so even if there was such a 
control we would likely not be able to access it.


[1] 
https://github.com/apple-oss-distributions/xnu/blob/f6217f891ac0bb64f3d375211650a4c1ff8ca1ea/osfmk/arm64/machine_routines_asm.s#L1129
[2] 
https://github.com/apple-oss-distributions/xnu/blob/f6217f891ac0bb64f3d375211650a4c1ff8ca1ea/pexpert/pexpert/arm64/board_config.h#L197

> 
>>>> Add a workaround capability for replacing wfi and wfit with nop, and
>>>> an erratum to enable it on the affected CPUs if the workaround using the
>>>> sysreg is not already applied. Leave the decision whether the sysreg
[...]
>>>> +	} while (0)
>>> How can you guarantee that we don't run one of these prior to patching?
>>
>> We can't, but there are a few points to our advantage, namely the boot cpu
>> isn't actually affected by this (when the CYC_OVRD bits are not configured
>> or not supported), and first round of patching happens quite early before
>> the other cpus are started.
> 
> I think you're saying that:
> 
> * On the boot CPU, WFI *never* loses register state.
> 
> * On other CPUs, WFI *might* lose register state (and this cannot be
>    inhibited).
> 
> Is that understanding correct, or are there other conditions where a WFI
> on the boot CPU can lose register state?

Those are our current observations, yes. We don't know why the boot CPU 
behaves differently and there no differences in any Apple sysregs that 
would explain it.

But looking at all wfis in the kernel there are bunch in head.S and 
similar for infinite loops where we don't care if register state is 
lost. The only two that currently matter are a wfit in __delay and the 
wfi in the idle loop.
The __delay one gets enabled after arm64_features are found which 
happens just before arm64_errata from setup_boot_cpu_features() and 
there's no __delay call inbetween that and when alternatives are 
applied. If we follow Will's suggestion with an early_param that happens 
much earlier as well.
My understanding is that the idle loop won't be reached before 
sched_init() and that also happens much later.

> 
> IIRC kdump doesn't ensure the new kernel is started on the boot CPU, so
> I think that would be broken. I guess you can't kexec generally due to a
> lack of offlining of secondary CPUs.

Next to that, kexec also runs into issues with all the various 
co-processors which we can't easily reset or shut down once they've been 
brought up once.


Sven


