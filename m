Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F94EC56208
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 11:22:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=63QAIwnchL8Oj8xhlzOBO2I3PZCelkaEyl/+cgVci/I=; b=DJBmRVELO136suzTOGhQo47p4Y
	taXMPp1LdTsGa41s1hHLgYI63WXP1aTEpLDhHg+0nbfC1MSHqpW/5uTHcGVT+usVv9IYho+iuz2It
	MtQTIvC1CPapopETkZ7517O1eRr3EtiXSb6jeT6pONkGBOQOQHQg4EsahHhUyHiMisC4jjB/nfUFR
	9J45cCpy0acKXdbbAWZ1sYk13p79JQ8rOqBSm5GLJHhRUAkJI1Q3T9YpOmAtjUlMuVgAmGD0m0B4t
	o5mbLRU46WnvsQNpiZqYSfpX1ZjkqmCz4PFVZ9IsLoGuIxT0NhTh12jISNsBV1VrmSGl+CsnAWo22
	B65yzI7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrwAl-00000005dQN-1CxS;
	Thu, 06 Aug 2026 11:22:03 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrwAh-00000005dOi-07L6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Aug 2026 11:22:00 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 90784153B;
	Thu,  6 Aug 2026 04:21:52 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0E4753F66F;
	Thu,  6 Aug 2026 04:21:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1786015316; bh=NxvDQNUaxLdXEBOORglSp9h3tEgNpMWW3m9cpoWPstw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ge6pnxV1Fubr8Qf/BlaxjwFA9FcvmWmwAOcMjbmy/xhWZznGrFdl2G8X+S9wNbJzm
	 TNGnyKVyombig3MpytVxqOG7/D4ybXCWFfUgY1RZ4RgxViO9f3/Vt8Gtql6RWD9nSR
	 E9svhYLwwPHhMkHcaOLXXIZEoJNpmf86rg5JYf6Y=
Date: Thu, 6 Aug 2026 12:21:51 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Subject: Re: [PATCH v2 13/20] arm64: percpu: Add infrastructure for
 preemptible this_cpu_*() ops
Message-ID: <anRuT1Psmar9mW5L@J2N7QTR9R3>
References: <20260804170503.3513916-1-mark.rutland@arm.com>
 <20260804170503.3513916-14-mark.rutland@arm.com>
 <7df18d5e-886e-43d1-b53d-52a1d08aba49@kernel.org>
 <d600d0db-5109-4386-9a49-955be74cc432@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d600d0db-5109-4386-9a49-955be74cc432@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_042159_165236_B5E932AD 
X-CRM114-Status: GOOD (  19.30  )
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
Cc: vladimir.murzin@arm.com, ryan.roberts@arm.com, peterz@infradead.org, catalin.marinas@arm.com, david.laight.linux@gmail.com, stable@vger.kernel.org, ruanjinjie@huawei.com, james.morse@arm.com, yang@os.amperecomputing.com, cl@gentwo.org, maz@kernel.org, ljs@kernel.org, will@kernel.org, ardb@kernel.org, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Wed, Aug 05, 2026 at 08:47:08AM +0200, David Hildenbrand (Arm) wrote:
> On 8/5/26 08:45, David Hildenbrand (Arm) wrote:
> >> Atop v7.2-rc4, with GCC 15.2.0 and defconfig, this is compiled as:
> >>
> >> | <outline_this_cpu_add_u64>:
> >> |        paciasp
> >> |        stp     x29, x30, [sp, #-16]!
> >> |        mrs     x2, sp_el0
> >> |        mov     x29, sp
> >> |        ldr     w3, [x2, #8]
> >> |        add     w3, w3, #0x1
> >> |        str     w3, [x2, #8]
> >> |        mrs     x3, tpidr_el1
> >> |        add     x0, x0, x3
> >> | 1:     ldxr    x5, [x0]
> >> |        add     x5, x5, x1
> >> |        stxr    w4, x5, [x0]
> >> |        cbnz    w4, 1b
> >> |        ldr     x0, [x2, #8]
> >> |        sub     x0, x0, #0x1
> >> |        str     w0, [x2, #8]
> >> |        cbz     x0, 2f
> >> |        ldr     x0, [x2, #8]
> >> |        cbnz    x0, 3f
> >> | 2:     bl      preempt_schedule_notrace
> >> | 3:     ldp     x29, x30, [sp], #16
> >> |        autiasp
> >> |        ret
> > 
> > FWIW, in a recent discussion on some prototype hacking [1] we saw some overhead
> > in micro-benchmarks that would really hammer on a path that would now do a
> > preempt_disable()+preempt_enable().
> > 
> > Switching from preempt_disable() to preempt_enable_no_resched() made it turn to
> > noise. Of course, that has other undesirable impacts, and I am not sure if we
> > are in the territory of code layout changes affecting the numbers.
> > 
> > Just mentioning it as some data point.
> 
> [1] https://lore.kernel.org/linux-mm/20260630174852-mutt-send-email-mst@kernel.org/

Thanks for the pointer.

IIUC in those cases you're using preempt_disable() .. preempt_enable()
directly, not this_cpu_*(), right?

If so, patches 5 and 6 of this series [2,3] might have an impact, but I
wouldn't expect a significant change unless you're calling
preempt_enable a lot.

Please beware that it's not safe to use preempt_enable_no_resched()
UNLESS it is immediately followed by a call to schedule(). That's not
documented today (and I couldn't find a good reference), so more folk
are likely to be tempted to use it...

I'll send a patch to clarify that (or at least start the discussion with
scheduler/preempt folk).

Mark.

[2] https://lore.kernel.org/linux-arm-kernel/20260804170503.3513916-6-mark.rutland@arm.com/
[3] https://lore.kernel.org/linux-arm-kernel/20260804170503.3513916-7-mark.rutland@arm.com/

