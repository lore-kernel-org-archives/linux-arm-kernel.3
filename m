Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB876CFD348
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Nov 2025 19:09:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4Q3uYitINkJd9DpRr6csOwx4R+f98V2gKDUEzZ9aNdk=; b=kbWiMcMm7xuuV9mGtkhVwLf/aS
	2SM72Ow9E2dx+o7sVyEAxMI9zJ2Ghwa5+t5x/rH7bNaRgjHXj7o985PdRoLHFoSbDNKA5vb/M4w1R
	9wBcx9VnXHGvth3HN9ApExETPjPHN7tHL7gyY8HmeRs7epkYwk/YZE9EHMVabyxXOVOFMgn60Mjnc
	Xid6VD/jTozOrmsc6Fvrf+Wws6ZS44ZubhYuv6Pqjuux667qLD2aWPz+WuBfyibCTrpwWzNTqvz21
	qG+nDJF6YajKaUo69rBx5k/aqSna7MZ2pwchio6l6dMh2HGmcXewLqKy6ae8QcIbv6ygMBzydVYxp
	0IRpToPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNbvt-0000000CDcL-1nxX;
	Mon, 24 Nov 2025 19:09:05 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNbvs-0000000CDcE-11oQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Nov 2025 19:09:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 737886016B;
	Mon, 24 Nov 2025 19:09:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 517D8C4CEF1;
	Mon, 24 Nov 2025 19:09:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764011343;
	bh=PyZ7K0Aa7D8GgQWBCLlLdxfjyreAYROTy5bj/bJ396E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Cec6vvBdJxhlIhbG5U877ebJoQM7eRrr89xpTPnl46vKdLvjaLDMaV/kWPC3Dhyhi
	 SDEKYAxANrDk7hWk5cG+eyG35GpQ/CFo9rweLsVyxbfeRwDu1VU0+ZqUcS0Y/pRk8x
	 HT7ZodvI94DGn11NIglSZuUTqWJoDdkT6W9m5GAxOyx2WxL0YuNRiY99i4LuJTwkMO
	 tkCob4VGWi8fqNaDxhw3guYwZme8/5ED/ag7jqJnUjcJL5PYNa49gKDSxSrgn3/+ku
	 b52fevwXysLqaXAKkNeh4jwcPgQuSW/XHdMVL3Qa5MUy5dqemEBlba0bGDUsxtG52z
	 vtkqObf22RE8g==
Date: Mon, 24 Nov 2025 19:08:57 +0000
From: Will Deacon <will@kernel.org>
To: Kees Cook <kees@kernel.org>
Cc: Ryan Roberts <ryan.roberts@arm.com>, Arnd Bergmann <arnd@arndb.de>,
	Ard Biesheuvel <ardb@kernel.org>,
	Jeremy Linton <jeremy.linton@arm.com>,
	Catalin Marinas <Catalin.Marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [DISCUSSION] kstack offset randomization: bugs and performance
Message-ID: <aSStSQsHqjb620gI@willie-the-truck>
References: <66c4e2a0-c7fb-46c2-acce-8a040a71cd8e@arm.com>
 <dd8c37bc-795f-4c7a-9086-69e584d8ab24@arm.com>
 <aSRtaVjfNc11EtKg@willie-the-truck>
 <B696956E-579E-412E-B774-AAADCFA4B31C@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <B696956E-579E-412E-B774-AAADCFA4B31C@kernel.org>
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

On Mon, Nov 24, 2025 at 09:11:23AM -0800, Kees Cook wrote:
> On November 24, 2025 6:36:25 AM PST, Will Deacon <will@kernel.org> wrote:
> >On Mon, Nov 17, 2025 at 11:31:22AM +0000, Ryan Roberts wrote:
> >> On 17/11/2025 11:30, Ryan Roberts wrote:
> >> > Could this give us a middle ground between strong-crng and
> >> > weak-timestamp-counter? Perhaps the main issue is that we need to store the
> >> > secret key for a long period?
> >> > 
> >> > 
> >> > Anyway, I plan to work up a series with the bugfixes and performance
> >> > improvements. I'll add the siphash approach as an experimental addition and get
> >> > some more detailed numbers for all the options. But wanted to raise it all here
> >> > first to get any early feedback.
> >
> >FWIW, I share Mark's concerns about using a counter for this. Given that
> >the feature currently appears to be both slow _and_ broken I'd vote for
> >either removing it or switching over to per-thread offsets as a first
> >step.
> 
> That it has potential weaknesses doesn't mean it should be entirely
> removed.

Well, we can always bring it back when it does something useful :)

> > We already have a per-task stack canary with
> >CONFIG_STACKPROTECTOR_PER_TASK so I don't understand the reluctance to
> >do something similar here.
> 
> That's not a reasonable comparison: the stack canary cannot change
> arbitrarily for a task or it would immediately crash on a function return.
> :)

Fair enough, but I was thinking more about concerns relating to the
size of task struct. I don't think that's a huge concern in this case
and we already have tonnes of junk in thread_struct if you want to put
it there instead. Certainly, persevering with per-cpu data just feels
like the wrong approach to me based on Ryan's report.

> >Speeding up the crypto feels like something that could happen separately.
> 
> Sure. But let's see what Ryan's patches look like. The suggested changes
> sound good to me.

I guess we'll have to wait and see but some of the ideas in this thread
(e.g. using the counter and interrupt timing) seem pretty flawed to me
so I was trying to avoid Ryan wasting his time.

Will

