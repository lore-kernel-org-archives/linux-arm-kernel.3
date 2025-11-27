Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4EC8CFD2F6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Nov 2025 08:00:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kCq/SGY/AmtVvnzob/pVUt+k1Yw3AErwyKU7fh8RqWA=; b=V1cP+uXCGDZlAG/28h0wZzvLz2
	K9LGigcwPw72bdCaeaMlm7bmUhkzDZ1NYwQ/6dQVe3Y+Ewe7CFTpBG6NlImEMvePPlN6NEkbNpi1j
	R7gwHJ7zkm3H775DRkJfWu+wcpfu4ZgKrB/FDVhe3tqN6YWac1BKrOGRObh030yTLRTha02a/JteS
	alCwcqU/bHRL0xG0IM98zq+KmrpZ3zE4iZmiW4YhShP222mGcNksBltKdWfP1KrIABVaVdofyz5Gh
	CTEPgGx/o8gxyCx8K/s/MTGkoC00CMS7yjPetZ5tiwHoHJQSeUj+ZD8VBPGxxIAy6x4OUPD9ZrTNS
	mhzA6JiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOWvU-0000000GAZV-036Q;
	Thu, 27 Nov 2025 08:00:28 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOWvS-0000000GAZM-1hll
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Nov 2025 08:00:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3A9A560172;
	Thu, 27 Nov 2025 08:00:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDB1BC113D0;
	Thu, 27 Nov 2025 08:00:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764230424;
	bh=Krt34wsgKONcCGgSLKjFr9e/6BEI1lrDiaXQ5SvI5oA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gqEjRput5Z7I2iJD1nK35y4k/DEWO/fP9ia3vprjJOoMWfUqqzHGaKnTbyrdGzuiF
	 KPA99h4tbQIfgPM568wQsWmKNQqNoFSvvGnRrAwYD2GFGmP3LQDL1nlHlgk/przXJH
	 2AY/fU6jIOsZjR9sEW5FXjGtXrCaKOj7qKSaBMGbFGRXeq8fm1kEwElDMiz+wR9cXD
	 JWEmLiwfq10ZWftwaFrlIhBJ4YSK6YRnbjcxEi9EYyNIOPpJQR5cFyoSORSqB94czY
	 fDISylbFla5/pj/sIRmF2Gj51bNCvQpDoH7GlUGnYlWKMHxrL4m8A105A5xzePCN5v
	 Yaitpv6zy+yDg==
Date: Thu, 27 Nov 2025 00:00:24 -0800
From: Kees Cook <kees@kernel.org>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Ryan Roberts <ryan.roberts@arm.com>, Will Deacon <will@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Jeremy Linton <jeremy.linton@arm.com>,
	Catalin Marinas <Catalin.Marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [DISCUSSION] kstack offset randomization: bugs and performance
Message-ID: <202511262358.1B99951@keescook>
References: <66c4e2a0-c7fb-46c2-acce-8a040a71cd8e@arm.com>
 <dd8c37bc-795f-4c7a-9086-69e584d8ab24@arm.com>
 <aSRtaVjfNc11EtKg@willie-the-truck>
 <B696956E-579E-412E-B774-AAADCFA4B31C@kernel.org>
 <ecc11ec7-ba00-41f1-8a2a-8f3a83c9ffd9@arm.com>
 <202511241250.EB2ADED@keescook>
 <d9b18b84-22ab-4bc8-b55f-804e0607cec6@arm.com>
 <CAMj1kXG4ELUdxGMp0+tNiV+7ygfHbe-u_pGPMTVj6UNdzQ+sDQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMj1kXG4ELUdxGMp0+tNiV+7ygfHbe-u_pGPMTVj6UNdzQ+sDQ@mail.gmail.com>
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

On Wed, Nov 26, 2025 at 11:58:40PM +0100, Ard Biesheuvel wrote:
> On Tue, 25 Nov 2025 at 12:15, Ryan Roberts <ryan.roberts@arm.com> wrote:
> >
> > On 24/11/2025 20:51, Kees Cook wrote:
> > > On Mon, Nov 24, 2025 at 05:50:14PM +0000, Ryan Roberts wrote:
> > >> On 24/11/2025 17:11, Kees Cook wrote:
> > >>>
> > >>>
> > >>> On November 24, 2025 6:36:25 AM PST, Will Deacon <will@kernel.org> wrote:
> > >>>> On Mon, Nov 17, 2025 at 11:31:22AM +0000, Ryan Roberts wrote:
> > >>>>> On 17/11/2025 11:30, Ryan Roberts wrote:
> > >>>>>> Could this give us a middle ground between strong-crng and
> > >>>>>> weak-timestamp-counter? Perhaps the main issue is that we need to store the
> > >>>>>> secret key for a long period?
> > >>>>>>
> > >>>>>>
> > >>>>>> Anyway, I plan to work up a series with the bugfixes and performance
> > >>>>>> improvements. I'll add the siphash approach as an experimental addition and get
> > >>>>>> some more detailed numbers for all the options. But wanted to raise it all here
> > >>>>>> first to get any early feedback.
> > >>>>
> > >>>> FWIW, I share Mark's concerns about using a counter for this. Given that
> > >>>> the feature currently appears to be both slow _and_ broken I'd vote for
> > >>>> either removing it or switching over to per-thread offsets as a first
> > >>>> step.
> > >>>
> > >>> That it has potential weaknesses doesn't mean it should be entirely removed.
> > >>>
> > >>>> We already have a per-task stack canary with
> > >>>> CONFIG_STACKPROTECTOR_PER_TASK so I don't understand the reluctance to
> > >>>> do something similar here.
> > >>>
> > >>> That's not a reasonable comparison: the stack canary cannot change arbitrarily for a task or it would immediately crash on a function return. :)
> > >>>
> > >>>> Speeding up the crypto feels like something that could happen separately.
> > >>>
> > >>> Sure. But let's see what Ryan's patches look like. The suggested changes sound good to me.
> > >>
> > >> Just to say I haven't forgotten about this; I ended up having to switch to
> > >> something more urgent. Hoping to get back to it later this week. I don't think
> > >> this is an urgent issue, so hopefully folks are ok waiting.
> > >>
> > >> I propose to post whatever I end up with then we can all disscuss from there.
> > >> But the rough shape so far:
> > >>
> > >> Fixes:
> > >>  - Remove choose_random_kstack_offset()
> > >>  - arch passes random into add_random_kstack_offset() (fixes migration bypass)
> > >>  - Move add_random_kstack_offset() to el0_svc()/el0_svc_compat() (before
> > >>    enabling interrupts) to fix non-preemption requirement (arm64)
> > >
> > > I thought we'd keep choose_random_kstack_offset() and just move
> > > everything into a per-task location? (And for arm64 only)
> >
> > Err... I thought you were the one arguing against per-task state? I'm not really
> > keen on having arm64 do a completely different thing to everyone else; It seems
> > reasonable to me that we only need to (continue to) abstract the random source
> > per-arch and the rest should remain common?
> >
> > Per my previous mails, I'm not really sure what choose_random_kstack_offset() is
> > giving us in practice. Why not simplify?
> >
> 
> It seems to me that arm64 inherited a lot of complexity from other
> architectures that rely on a counter. AIUI, the 'non-preemption
> requirement' and the 'migration bypass' issues are both a result of
> the fact that the syscall duration is relied upon to provide more
> pseudo-randomness, which is recorded in a per-CPU counter when the
> syscall completes and carried over to the next invocation. (I don't
> really buy the idea that having the next offset in memory for a
> shorter time buys us anything in terms of robustness tbh)
> 
> I have some patches that make get_random_uXX()'s fast path lockless
> that I will send out shortly (assuming no hate mail from the bots in
> the mean time), which should make it suitable for general use as the
> entropy source for kstack randomization on all architectures, modulo
> the tail latency issue, but I'm not sure I understand why that is a
> problem to begin with if it occurs sufficiently rarely. Is that a
> PREEMPT_RT issue? Would it be better if the refill of the per-CPU
> batched entropy buffers was relegated to some kind of kthread so it
> can be scheduled independently? (Those buffers are all the same size
> so we could easily keep a few hot spares)
> 
> TL;DR I agree with Ryan but I'd like to fix it across the board, i.e.,
> get rid of the per-CPU variable entirely and all the dodgy uses of
> counters.

Right, the whole design of picking the next random number after the
syscall is to try to reduce the control an attacker would have given an
instruction counter is the randomness source in most cases (during the
original design no one could agree on a fast enough randomness source).

If we can fix that then we can fix this for all architectures and all
randomness users generally.

-Kees

-- 
Kees Cook

