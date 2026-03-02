Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3AF0E9B364
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 10:57:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FAqhxBxcL4d5OKJCpmpcDNhOGlqoMuYHBy0BmNlM2k4=; b=MZjYQQ7K9XbGIu8l3NP7PQgMw6
	51G2qor40D7rXwh/zLQjqbMTwCggVLvErxr2hMzMSYRYVQ9LT79QYm9qg4fV9DYYYvgGhUxOOkepS
	Ip9R368+T7c1xi1ngd/H0blP34ZkUAunAdcOBDYxJgz2+zFtJA1W2bairbTzaokpowBknGEr9uMSX
	oKzE8dUin8pK7O/vYsi90XuyDVClQ7tZczGkaJTbZZrLKeybnfMHOclQE2YUNS+k/DCD3WI0y/JHH
	cm9+M0sTW2v1nqb1XcyG4QvXkbjD5P+8iIRhsp84z+F9SKk/kVXZqSSRA3MFY31j1305gE0XmjHlx
	sALhaoDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx0xb-0000000ClPD-3adg;
	Mon, 02 Mar 2026 10:57:11 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx0xZ-0000000ClOf-0jtM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 10:57:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=FAqhxBxcL4d5OKJCpmpcDNhOGlqoMuYHBy0BmNlM2k4=; b=udnUpSWGRreB4H62gRwfpXeEGy
	fLCciVqT8O01ynpse167ELki3yPqtqIMlR10aBB+6zptX87JO/WVhaCLcTSa5mfq7rCr5SLlZ2LE3
	w+zjDH+bpkMbWfuw1qcAt0i1MXkkLoOpXnyFk7fzZ+IT/iWLqv8uF5STM6ftfCsXwKvzhRCUeN9hL
	RHjWKP/1te+e6SPfrm91EWv1HFDdw7C96K5LNJFq7JeKaIw2sax2zlz+5GitYNtChke+f+MXrKTPv
	zPCvMuucqjUNhzlHSlL76evdS5YNSv6UHc7LHJOvMxQln768gQ/Apyan4BvHZisj7VxtmAsiUN77h
	z1nCR4hQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:47878)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vx0xV-000000003mI-3xrV;
	Mon, 02 Mar 2026 10:57:06 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vx0xT-000000005sn-0urP;
	Mon, 02 Mar 2026 10:57:03 +0000
Date: Mon, 2 Mar 2026 10:57:03 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: linux-arm-kernel@lists.infradead.org,
	Clark Williams <clrkwllms@kernel.org>,
	linux-rt-devel@lists.linux.dev,
	Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH 2/6] ARM: move vmalloc() lazy-page table population
Message-ID: <aaVs_31KNKvUkNL8@shell.armlinux.org.uk>
References: <aaG1wrNUaq_L0I5g@shell.armlinux.org.uk>
 <E1vvzcX-0000000Awo0-2KBN@rmk-PC.armlinux.org.uk>
 <20260302104351.yyWvNCTb@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260302104351.yyWvNCTb@linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_025709_257633_78050310 
X-CRM114-Status: GOOD (  15.86  )
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

On Mon, Mar 02, 2026 at 11:43:51AM +0100, Sebastian Andrzej Siewior wrote:
> On 2026-02-27 15:19:13 [+0000], Russell King (Oracle) wrote:
> > Split the vmalloc() lazy-page table population from
> > do_translation_fault() into a new vmalloc_fault() function.
> > 
> > Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> Reviewed-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> 
> > --- a/arch/arm/mm/fault.c
> > +++ b/arch/arm/mm/fault.c
> > @@ -261,6 +261,70 @@ static inline bool ttbr0_usermode_access_allowed(struct pt_regs *regs)
> >  }
> >  #endif
> >  
> > +/*
> > + * Handle a vmalloc fault, copying the non-leaf page table entries from
> > + * init_mm.pgd. Any kernel context can trigger this, so we must not sleep
> > + * or enable interrupts. Having two CPUs execute this for the same page is
> 
> "unconditionally enable interrupts."? It wouldn't be wrong to enable
> them if the calling context had them enabled, right?

I don't know where you got "unconditionally enable interrupts" from the
comment - it says the exact opposite.

> 
> > + * no problem, we'll just copy the same data twice.
> > + *
> > + * Returns false on failure.
> > + */
> > +static bool __kprobes __maybe_unused vmalloc_fault(unsigned long addr)
> 
> Maybe handle_vmalloc_fault().

x86:

static noinline int vmalloc_fault(unsigned long address)
{
...

I prefer to keep the name the same.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

