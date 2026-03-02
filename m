Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFEE4E9B366
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 11:01:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4yvZllsvJuDygz5pj0juIkJ5s5cc7ZzA21kXlFj5wec=; b=0Qe04EUz07oRSwMgLcFNyWAmXI
	lGGYX6Aqd80Mite0mRd0vbBdUg0OGn+qgEg79DhlSxppLyK4FDA3j9kVUKnYFSU5tK6KIORPvgHls
	blA7ZcBS/OhEgeozMkMH08oazVi7qFkPYuJx+PMr7SD+T3/b86JM7SOk/Pzcdh47ZsbJwNSHfoMj0
	dmRpAd6+1fNdIxNdoNHgzxKYuAQ/C4KA6+GcT6UPAwTs2B89P7sH8twcY0YHT+yBZBAf8T8r89yPS
	fD/DE5pbiw3FJ9sb9oRzITwZJTn4iU1+IBF5p6JKYZbaqEJsxsaKdPyC7es7KqBGKMe6RPODrZruB
	fe97FSbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx11J-0000000Clmc-3Ys9;
	Mon, 02 Mar 2026 11:01:01 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx11H-0000000Cllg-2mvV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 11:01:00 +0000
Date: Mon, 2 Mar 2026 12:00:55 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1772449256;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4yvZllsvJuDygz5pj0juIkJ5s5cc7ZzA21kXlFj5wec=;
	b=TW8WcUMcmZzboA3BvzcjLVvd9Ojq4RnRC6jZt7MUCMvbANxKynx7IzKE1rTpFXzGo3fM0Z
	uv9UY0etNVGMa73WPrYuEJrNYK0SEnP88n0Wurm5nPIjjS0hB4oOsvRbVW2Fr69M0Mz2Np
	hDOm8sKmZbtxIrACEeMlGIQYR2GLQhYFsU3aAf+fnfnQk9UkOmtg5eaWK3X7e7LFP6ZM3W
	iVIqdZQZHQpcNzp+CIMahzWUGIY01yr88IKSLVosadOe8AKmTf1vM//9Sl91+fkhqDa8Os
	8HAfLvblb3el9/jH61L4kbiAr0+L2l/pmZqCiNWbJf3kkqcsugMr/BNybnfKrw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1772449256;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4yvZllsvJuDygz5pj0juIkJ5s5cc7ZzA21kXlFj5wec=;
	b=leCJw5je/wj7XEiHikcgp37MLee3e4EU99Cn1Uu2iK6W+NyxHPNqsWGFNRGzGJQvfTSR1b
	omK+oreM9GgF89Bw==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org,
	Clark Williams <clrkwllms@kernel.org>,
	linux-rt-devel@lists.linux.dev,
	Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH 2/6] ARM: move vmalloc() lazy-page table population
Message-ID: <20260302110055.hFMkUcnt@linutronix.de>
References: <aaG1wrNUaq_L0I5g@shell.armlinux.org.uk>
 <E1vvzcX-0000000Awo0-2KBN@rmk-PC.armlinux.org.uk>
 <20260302104351.yyWvNCTb@linutronix.de>
 <aaVs_31KNKvUkNL8@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aaVs_31KNKvUkNL8@shell.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_030059_844979_202B0F5F 
X-CRM114-Status: GOOD (  15.08  )
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

On 2026-03-02 10:57:03 [+0000], Russell King (Oracle) wrote:
> > > --- a/arch/arm/mm/fault.c
> > > +++ b/arch/arm/mm/fault.c
> > > @@ -261,6 +261,70 @@ static inline bool ttbr0_usermode_access_allowed(struct pt_regs *regs)
> > >  }
> > >  #endif
> > >  
> > > +/*
> > > + * Handle a vmalloc fault, copying the non-leaf page table entries from
> > > + * init_mm.pgd. Any kernel context can trigger this, so we must not sleep
> > > + * or enable interrupts. Having two CPUs execute this for the same page is
> > 
> > "unconditionally enable interrupts."? It wouldn't be wrong to enable
> > them if the calling context had them enabled, right?
> 
> I don't know where you got "unconditionally enable interrupts" from the
> comment - it says the exact opposite.

My point. You could enable the interrupts if the parent context had them
enabled. It is not that you must keep them disabled because a second
fault/ interrupt would overwrite your CPU state.

> > > + * no problem, we'll just copy the same data twice.
> > > + *
> > > + * Returns false on failure.
> > > + */
> > > +static bool __kprobes __maybe_unused vmalloc_fault(unsigned long addr)
> > 
> > Maybe handle_vmalloc_fault().
> 
> x86:
> 
> static noinline int vmalloc_fault(unsigned long address)
> {
> ...
> 
> I prefer to keep the name the same.
Okay.

Sebastian

