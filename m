Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5EBFC5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 May 2025 10:17:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mvbrTE3HbEtWR28bTBJ/AAjo3fl2f9u8eozYJh8q7pA=; b=puvBUrQKdTYc6EdKJFT99O1Eu9
	57d8bO4tyvfpCrulcMdYUXjpdb/YJ/DIk9vdoiMAITbFk58ANHbXQAutPM/BYSCNmXwxeHYBKIXbi
	jR9JORrER1POAckpBvdDXOdaAKicJN/zpEqG5OPikRjT+kbEb758P48FEu/XjVsKplxHV6itq36IZ
	+1SzDva+mkzF+fWg4/WPFnbnv8BDgXgiVx/x3fYb041V41Ot0L2mEweidNkcNRRFv/gFl/fgjNZWv
	CSiyUbdPrHzQvAN5zoZ3w2vLuEmdsVV1Sk5XL2ir4I0Xz295LlO7NqpjHD8n1RmOSDFun52ccA74k
	13Q5iLeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKaKD-0000000FUTa-3g0Z;
	Thu, 29 May 2025 10:17:25 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKaEZ-0000000FU5J-3OE2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 May 2025 10:11:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id F3150614B8;
	Thu, 29 May 2025 10:11:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 701A0C4CEE7;
	Thu, 29 May 2025 10:11:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748513494;
	bh=T7cpDYEDuBaWSUs8YHGK2sw5APgOmBGNZ+dG1/b6xr8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cGsPW69GhxrltswCE2jg7EO7V1n9rhN0jWCKqKsOudzZJkguSPNNF86V9vKF7yqdq
	 yFGRat8yAI3Y5/MKsx0rzf79WA22MEDVp4/PEdq1AUsPDA32oa47LQzdPO1OnEGdOz
	 HsOyV5xMCei/tbF2Zgbdawm96lIw4Y/XvJTA78VYkA8GYm35c8ZPZFu/pvNoHYU2xx
	 14A16PB09qOcAPcyHF+numkDOlOVGfuNv5X6c0fOTX7s2Y52eXymtoRdKlHMGyxZWm
	 lV9rrE/Dl5vkp/3fVUxdmKx825CSmhWLhEBMWL29iWmz1CGDmaPovgTy/dU1Vk3To0
	 rEpuBRYtZdQvg==
Date: Thu, 29 May 2025 11:11:30 +0100
From: Will Deacon <will@kernel.org>
To: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Cc: linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	"Luis Claudio R. Goncalves" <lgoncalv@redhat.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: Re: [PATCH v2 05/11] arm64: entry: Add entry and exit functions for
 debug exceptions
Message-ID: <20250529101129.GB29082@willie-the-truck>
References: <20250512174326.133905-1-ada.coupriediaz@arm.com>
 <20250512174326.133905-6-ada.coupriediaz@arm.com>
 <20250520153619.GE18901@willie-the-truck>
 <ddc2fd08-1171-4ec7-9ffd-eae069984d48@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ddc2fd08-1171-4ec7-9ffd-eae069984d48@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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

On Wed, May 28, 2025 at 03:08:35PM +0100, Ada Couprie Diaz wrote:
> On 20/05/2025 16:36, Will Deacon wrote:
> 
> > On Mon, May 12, 2025 at 06:43:20PM +0100, Ada Couprie Diaz wrote:
> > > Duplicate the `debug_exception_entry()` and `debug_exception_exit()`
> > nit: it's debug_exception_enter().
> Thanks,fixed for v3.
> > > functions from mm/fault.c, as they are needed to split
> > > the debug exceptions entry paths from the current unified one.
> > > The original will be removed in a cleanup patch.
> > > 
> > > Signed-off-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
> > > ---
> > >   arch/arm64/kernel/entry-common.c | 22 ++++++++++++++++++++++
> > >   1 file changed, 22 insertions(+)
> > > 
> > > diff --git a/arch/arm64/kernel/entry-common.c b/arch/arm64/kernel/entry-common.c
> > > index b260ddc4d3e9..92d78b329e67 100644
> > > --- a/arch/arm64/kernel/entry-common.c
> > > +++ b/arch/arm64/kernel/entry-common.c
> > > @@ -418,6 +418,28 @@ static inline void fp_user_discard(void)
> > >   	}
> > >   }
> > > +/*
> > > + * In debug exception context, we explicitly disable preemption despite
> > > + * having interrupts disabled.
> > > + * This serves two purposes: it makes it much less likely that we would
> > > + * accidentally schedule in exception context and it will force a warning
> > > + * if we somehow manage to schedule by accident.
> > > + */
> > > +static void debug_exception_enter(struct pt_regs *regs)
> > > +{
> > > +	preempt_disable();
> > > +
> > > +	/* This code is a bit fragile.  Test it. */
> > > +	RCU_LOCKDEP_WARN(!rcu_is_watching(), "exception_enter didn't work");
> > > +}
> > > +NOKPROBE_SYMBOL(debug_exception_enter);
> > > +
> > > +static void debug_exception_exit(struct pt_regs *regs)
> > > +{
> > > +	preempt_enable_no_resched();
> > > +}
> > > +NOKPROBE_SYMBOL(debug_exception_exit);
> > Could you make these externally visible (i.e. drop the 'static') so that
> > you can remove the definitions from mm/fault.c at the same time? Then
> > you could add the 'static' back at the end when there are no more
> > external callers.
> > 
> If you are happy with some header noise, adding `debug_exception_enter()`
> and `debug_exception_exit()` to include/asm/exception.h` so that they can
> be visible in `mm/fault.c` during the clean up and removing them when
> done, I would much prefer doing it that way !
> 
> It felt strange to just have some duplicate code, but I didn't know
> what would be acceptable.
> I will make the change for v3, unless the header noise mentioned above is
> an issue.

Thanks, that sounds great.

Will

