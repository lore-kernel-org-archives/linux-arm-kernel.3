Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C819109C035
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 16:33:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W3ic0npSbWdG7ZRF818msj3IRha88MwYQXey9KGpYVU=; b=c/lqkQP7Q5/ynup4W5IxKeiSeI
	8KRC82GsETjKhP16Aa9RNKnYWzgmHgyzuy4ll81LsXhhZd64DYIVXII3stLAbl+hv7XWM+8bH7a8E
	EyOLn8Y22AIInwrtAuysdc+/62JA/EgWb8EvfWM/5Wivezop457T6v2hYgqsnWi1KPXaHmCPUqfvO
	43Ip17TIjQ7Skgk//whJQ80iY7CLFxYM71az2pySRim4WpSd24lfqXztqywtZTzBM0/yr7d2phCPu
	TGuvfp8iWOHrB38lAUmLLgGPl5GhkHVGLTTvVDhrQgugn5LqZ1F0xGCxNxYc2MwSEMA0tSeFyRm4J
	fEwWk7kQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5RAB-00000003uZe-3tpv;
	Wed, 25 Mar 2026 16:32:59 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5RA9-00000003uZC-1rt1
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Mar 2026 16:32:58 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C378C25DD;
	Wed, 25 Mar 2026 09:32:49 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 59D2A3F915;
	Wed, 25 Mar 2026 09:32:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1774456375; bh=8KromqTmRdEzC0f/nh0v6DgYME2PY+4qjNyQaiTrV7o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ALxPshRsDFuzUUSrAQLYb5oMb0tvtkxDp5jIXxdqmiTlZeXMf5KdiIGX4O1ZRzOAl
	 aVHoJK/TwY8rW5hry6myIKboXKXRBeNCqnA6deW64JfWx1LBRlJOFK+43TxYKT1ESK
	 YVwBkC6CymUCz98Qtl2lU+AYLcsJQEAvlp9zfpWc=
Date: Wed, 25 Mar 2026 16:32:49 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: David Laight <david.laight.linux@gmail.com>
Cc: Ankur Arora <ankur.a.arora@oracle.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
	bpf@vger.kernel.org, arnd@arndb.de, will@kernel.org,
	peterz@infradead.org, mark.rutland@arm.com, harisokn@amazon.com,
	cl@gentwo.org, ast@kernel.org, rafael@kernel.org,
	daniel.lezcano@linaro.org, memxor@gmail.com,
	zhenglifeng1@huawei.com, xueshuai@linux.alibaba.com,
	rdunlap@infradead.org, joao.m.martins@oracle.com,
	boris.ostrovsky@oracle.com, konrad.wilk@oracle.com
Subject: Re: [PATCH v10 00/12] barrier: Add
 smp_cond_load_{relaxed,acquire}_timeout()
Message-ID: <acQOMZMk0OMfIgFO@arm.com>
References: <20260316013651.3225328-1-ankur.a.arora@oracle.com>
 <20260315184925.b6f93386e918ca79614843e3@linux-foundation.org>
 <874imftol4.fsf@oracle.com>
 <20260316233712.7cbfac27@pumpkin>
 <87ms07rlp9.fsf@oracle.com>
 <20260317091705.5a64fc56@pumpkin>
 <acPo7l_pd5rnHpSX@arm.com>
 <20260325154210.79a621df@pumpkin>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260325154210.79a621df@pumpkin>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_093257_607542_BB365332 
X-CRM114-Status: GOOD (  31.15  )
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

On Wed, Mar 25, 2026 at 03:42:10PM +0000, David Laight wrote:
> On Wed, 25 Mar 2026 13:53:50 +0000
> Catalin Marinas <catalin.marinas@arm.com> wrote:
> 
> > On Tue, Mar 17, 2026 at 09:17:05AM +0000, David Laight wrote:
> > > On Mon, 16 Mar 2026 23:53:22 -0700
> > > Ankur Arora <ankur.a.arora@oracle.com> wrote:  
> > > > David Laight <david.laight.linux@gmail.com> writes:  
> > > > > On arm64 I think you could use explicit sev and wfe - but that will wake all
> > > > > 'sleeping' cpu; and you may not want the 'thundering herd'.    
> > > > 
> > > > Wouldn't we still have the same narrow window where the CPU disregards the IPI?  
> > > 
> > > You need a 'sevl' in the interrupt exit path.  
> > 
> > No need to, see the rule below in
> > https://developer.arm.com/documentation/ddi0487/maa/2983-beijhbbd:
> > 
> > R_XRZRK
> >   The Event Register for a PE is set by any of the following:
> >   [...]
> >   - An exception return.
> > 
> 
> It is a shame the pages for the SEV and WFE instructions don't mention that.
> And the copy I found doesn't have working hyperlinks to any other sections.
> (Not even references to related instructions...)

The latest architecture spec (M.a.a) has working hyperlinks.

> You do need to at least comment that the "msr s0_3_c1_c0_0, %[ecycles]" is
> actually WFET.
> Is that using an absolute cycle count?

Yes, compared to CNTVCT.

> If so does it work if the time has already passed?

Yes, it exits immediately. These counters are not going to wrap in our
(or device's) lifetime.

> If it is absolute do you need to recalculate it every time around the loop?

No but you do need to read CNTVCT, that's what __delay_cycles() does (it
does not wait).

> __delay_cycles() contains guard(preempt_notrace()). I haven't looked what
> that does but is it needed here since preemption is disabled?

The guard was added recently by commit e5cb94ba5f96 ("arm64: Fix
sampling the "stable" virtual counter in preemptible section"). It's
needed for the udelay() case but probably not for Ankur's series. Maybe
we can move the guard in the caller?

> Looking at the code I think the "sevl; wfe" pair should be higher up.

Yes, I replied to your other message. We could move it higher indeed,
before the condition check, but I can't get my head around the ordering.
Can need_resched() check be speculated before the WFE? I need to think
some more.

> I also wonder how long it takes the cpu to leave any low power state.
> We definitely found that was an issue on some x86 cpu and had to both
> disable the lowest low power state and completely rework some wakeup
> code that really wanted a 'thundering herd' rather than the very gentle
> 'bring each cpu out of low power one at a time' that cv_broadcast()
> gave it.

WFE is a very shallow power state where all hardware state is retained.
We have an even stream broadcast to all CPUs regularly already (10KHz)
and I haven't heard people complaining about power degradation. If a CPU
is a WFI state or even deeper into firmware (following a PSCI call), an
exclusive monitor event won't wake it up. It's only for those cores
waiting in WFE.

-- 
Catalin

