Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 552CEC5DF81
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Aug 2026 16:58:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=29cT872Wd6NMecLtqlIR9y+o2aaEtXoN+/Gt66XRWjA=; b=VWSW1YB07VTA4R
	dRoDm28qATfLshm1yTlTv2qSyqFt+gqimtIrt+D38USTyZ2iTv0cW8S2R2vIhL6l6qrM8XigNYjjN
	6yqz4BNOso/fRyVFhLg8GuC9tN131+Ofm/qzQ0rKWQLkFkyp+Spdp3Zig8CJ9+CwOz0djqwJcfTNd
	Lpp5ENnrzaogJjcf7V4RqqggmG/QMFdYXMhTCxHJg1eO8YxiZob3JapKsfFxUcLKKn3r4xD/OFOAQ
	p+L8gnfk6sWEd/Cls7mUtuzND4YeYg57ZOdcFeuFXtkjxB5YcVllASo/emxQ/GqinK74OxVQaGAZB
	9RO/A4v2hJUO0hiTWEtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyXzh-0000000H5pA-0VW5;
	Mon, 24 Aug 2026 16:57:57 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyXzd-0000000H5om-2hls
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Aug 2026 16:57:55 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5114B16A3;
	Mon, 24 Aug 2026 09:57:47 -0700 (PDT)
Received: from [10.2.213.24] (e137867.arm.com [10.2.213.24])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4696D3F85F;
	Mon, 24 Aug 2026 09:57:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1787590671; bh=rTXLcLMTaXN4278gYB+LE+0D8spKN6mm18Rj745k7CA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=PVLWBDy9VpzuvkqW1gs0S2rVPclv58BHuy0/r/mXLHMq/R5X/rSYm9esJKmqb3KqH
	 NAK9NU9jHS1GgGI1hYHgfQiLc6YpPrnCEOCMrG1WbN9YXzVKyqLijOU2um4xjzHCpy
	 YNXi53ooiJdLt04cNz4h6KzX5Dk4Qt4OdOLzsJ5E=
Message-ID: <b7e811a1-3d34-48d7-99a6-ad035aad0814@arm.com>
Date: Mon, 24 Aug 2026 17:57:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] arm64/debug: clean up some HW BP edge cases
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>
References: <20260527161553.97676-1-ada.coupriediaz@arm.com>
 <amCp2vHU0XKhC6xT@willie-the-truck> <amC-DMTrqvAFSpe5@J2N7QTR9R3>
 <amE5XZIag1vh6GqE@willie-the-truck>
From: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Content-Language: en-US, en-GB, fr
Organization: Arm Ltd.
In-Reply-To: <amE5XZIag1vh6GqE@willie-the-truck>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_095753_768150_A85DF86B 
X-CRM114-Status: GOOD (  24.94  )
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
Cc: Rob Herring <robh@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, linux-arm-kernel@lists.infradead.org, Anshuman Khandual <anshuman.khandual@arm.com>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hi Will,

Sorry for the delay, I did not manage to respond before going on leave
as I got lost in the weeds of understanding what ptrace is doing when
using hardware debug registers.

On 22/07/2026 22:42, Will Deacon wrote:
> On Wed, Jul 22, 2026 at 01:56:44PM +0100, Mark Rutland wrote:
>> On Wed, Jul 22, 2026 at 12:30:34PM +0100, Will Deacon wrote:
>>> On Wed, May 27, 2026 at 05:15:51PM +0100, Ada Couprie Diaz wrote:
>>>> This is a small series focused on fixing some unsoundess and edge case
>>>> related to hardware breakpoints and watchpoints.
>>>>
>>>> It is motivated in part by the recent discussion on the
>>>> FEAT_Debugv8p6 series[0][1] regarding unclear guarantees on interruptions.
>>>>
>>>> It doesn't address the issue of instrumentation, as NO_KPROBE is not
>>>> sufficient to prevent it (specifically ftrace) and would require a pass
>>>> over the whole debug handling code.
>>>>
>>>> The bugs themselves are very much of the self-inflicted
>>>> "you should not be doing this" kind and not urgent, but it does solve
>>>> some of the questions on the FEAT_Dbugv8p6 series.
>>>>
>>>> Most of the raw additions are comments trying to give more context to
>>>> understand `hw_breakpoint_thread_switch()`.
>>> Hmm. From what I can tell, these patches are trying to handle various
>>> cases where we take a debug exception while executing the hw_breakpoint
>>> code itself. Even with these two fixes, is perf expecting to handle that
>>> sort of thing? I think it would be a lot more robust if we just prevented
>>> this from happening in the first place, similarly to the discussion from
>>> the other day around kprobes [2].
I am indeed handling weird edge-cases !
As Perf only uses local_irq masks, it is not sufficient to prevent us 
from taking
debug exceptions while it manipulates the debug registers, so even if 
all the
debug exceptions themselves are safe, perf/ptrace callbacks and syscalls 
are not.
>> Since [2] mentions noinstr, it's worth noting that noinstr alone isn't
>> sufficient. Watchpoints also use this path, and we can't practically
>> filter watchpoint addresses to avoid hitting a watchpoint here.
>>
>> I assume you'd be happy with masking debug exceptions entirely?
> Yes, I think that's the only option, really, and I think we might even
> have done that at some point in the past. [...]
>
If you both think that makes sense to save/restore DAIF here, I am
happy to send a patch doing so. That would indeed make sure we
don't hit this kind of issues !
Making the debug code safe from instrumentation is a different story...
> [...] The problem, however, is if we
> end up getting preempted in that state. We currently have preemption
> disabled, but there's a thread trying to change that based on one of
> Ada's tests (not blaming the test, it's pointing out a real issue here):
>
> https://lore.kernel.org/r/20260519222524.886454-1-longman@redhat.com
I did not have the time to take a proper look, but it seems that Sebastian
has sent another patch for this issue which keeps premption disabled :

https://lore.kernel.org/r/20260814085118.OPEA_Ssn@linutronix.de

So I think we should be OK masking DAIF here then.

Thanks both,
Ada

