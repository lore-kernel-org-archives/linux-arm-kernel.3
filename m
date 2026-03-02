Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54A7AE9B36A
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 11:20:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ocYEB4fdGgMKdOvsGSPbMiW4wO5zpFrlBMuOyfO3pn8=; b=TvbGVFVnxfv1bsHWMbr8HQcU6G
	KB01M8FXq1NEZLxFu1tOV77wlsS2J70TX5l3Gk5MCjvYh95XF8M59TRxsXHLRGQ2+kzt7+HCrjsqa
	1lDSITkth0dGz7w4R7cM2RDdUWR38dlm72TtecoL7YJhfvz5XwDM4H0RgU2X1A5+73BZ0Xi72Tmkr
	oiXik4MeH6+vGukSz5uBmSxUdddL/qmByODUcwlbKTrXreEq3IGQ8YK39AG8anfbKjI14GEMvTwgt
	t9marMirMbfwTg2/pAq5b1tLNo18sKubePMxqIBlOExEBDiSHiqYH155ouxA9peuvUEMQkEyPc80g
	+jmHxdig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx1Jf-0000000Cnid-21XB;
	Mon, 02 Mar 2026 11:19:59 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx1Jd-0000000Cnha-1neb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 11:19:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=ocYEB4fdGgMKdOvsGSPbMiW4wO5zpFrlBMuOyfO3pn8=; b=l83eA+F97qbvUztHGOKN98Sc5U
	s8yrqskGDymoQUqUzA7Elqf699sR7PTFIlFouqAj577IC/UI/DJBGgZ47IcaWGcWLaKeYu3ON7PQY
	YBjRZX9r/LlLMEzsF3qWnrffsoxGgM3/RgmJXd294Cg9iSMOQ7lB9yluCQ8gidO0/0UspIdE++MBQ
	I+qaVT1WY+/kqzU4wiSp9ov9NVTFoRFECKo1GP4ybLqQyzZ66W+YqxaAkDjWBWGTsXqzUdNMzhUlG
	aaD5bT6eTI2kiREr0qbu582YzhnAuusFFW7VVDQrDWqp9Z8a6kI8QPnryxL7m9lD7FLA+hRshfr0N
	L5t41C9Q==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:41268)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vx1Ja-000000003o0-2VeK;
	Mon, 02 Mar 2026 11:19:54 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vx1JY-000000005tv-3Shu;
	Mon, 02 Mar 2026 11:19:52 +0000
Date: Mon, 2 Mar 2026 11:19:52 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: linux-arm-kernel@lists.infradead.org,
	Clark Williams <clrkwllms@kernel.org>,
	linux-rt-devel@lists.linux.dev,
	Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH 2/6] ARM: move vmalloc() lazy-page table population
Message-ID: <aaVyWFNu8scqZeEY@shell.armlinux.org.uk>
References: <aaG1wrNUaq_L0I5g@shell.armlinux.org.uk>
 <E1vvzcX-0000000Awo0-2KBN@rmk-PC.armlinux.org.uk>
 <20260302104351.yyWvNCTb@linutronix.de>
 <aaVs_31KNKvUkNL8@shell.armlinux.org.uk>
 <20260302110055.hFMkUcnt@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260302110055.hFMkUcnt@linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_031957_468039_04DF3CCC 
X-CRM114-Status: GOOD (  20.89  )
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

On Mon, Mar 02, 2026 at 12:00:55PM +0100, Sebastian Andrzej Siewior wrote:
> On 2026-03-02 10:57:03 [+0000], Russell King (Oracle) wrote:
> > > > --- a/arch/arm/mm/fault.c
> > > > +++ b/arch/arm/mm/fault.c
> > > > @@ -261,6 +261,70 @@ static inline bool ttbr0_usermode_access_allowed(struct pt_regs *regs)
> > > >  }
> > > >  #endif
> > > >  
> > > > +/*
> > > > + * Handle a vmalloc fault, copying the non-leaf page table entries from
> > > > + * init_mm.pgd. Any kernel context can trigger this, so we must not sleep
> > > > + * or enable interrupts. Having two CPUs execute this for the same page is
> > > 
> > > "unconditionally enable interrupts."? It wouldn't be wrong to enable
> > > them if the calling context had them enabled, right?
> > 
> > I don't know where you got "unconditionally enable interrupts" from the
> > comment - it says the exact opposite.
> 
> My point. You could enable the interrupts if the parent context had them
> enabled. It is not that you must keep them disabled because a second
> fault/ interrupt would overwrite your CPU state.

We've gone from the code always having interrupts disabled, to your
review response that always wants them to be enabled (which is what
*un*conditionally enable interrupts means) to now conditionally enable
interrupts.

We are reading the CPU's page table pointer (the one programmed in
hardware) here, and we don't want that changing while we're fixing
the fault. So, interrupts need to stay disabled. x86 doesn't enable
interrupts in this path either, and we shouldn't be having differing
behaviour without good reason.

There are two places where x86 enables interrupts in its fault
handling. One of them is while handling a user address fault in
do_user_addr_fault(). The other is __bad_area_nosemaphore() where we
also know that we've come from user mode. All other fault handling
happens with interrupts disabled.

In any case, we've always had interrupts disabled in this path. Any
change to that would need to be a separate patch.

So, the comment in the patch is 100% correct.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

