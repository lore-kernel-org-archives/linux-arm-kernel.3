Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43945C54FB3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 May 2025 10:19:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oaociAXYbZ6GE/MjI4M45I3bINxREjljJScdEJE7hhI=; b=JkCH76pTquhOlIvEFDTwPCcw7V
	tDy4i3W2SFWRrGHEWIgLVd0h+ZbBm8FRUXLSozifxiOdfemLd3bk+whY+FpUWs7HYmqHpSzxFYdnp
	lP2DSfNcb7l48e/Uq0VxTAdZOxMCJnz+aivroJHlZzaspJ4U8kN8dL+cTDUUX7rVDZTASJfgtZLEm
	ZFjPpIWghVSOWD0Q+TdrGO7evCE4KduFPwtOhg3dkOUjpOnUrCIb7mAoyJzoFpf4ZiGRI+PRWooy/
	2zI6e4Qwd3H6Bwuae3CPfX2M/ZV9qS/N6S1omJ9K2RaUek8T7fHu8wPj8bcoHCpKbI/HS/wNY10oW
	V+4sTuaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKaMK-0000000FUgy-2U4m;
	Thu, 29 May 2025 10:19:36 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKaGC-0000000FUCk-3mb7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 May 2025 10:13:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 62BEE5C63A8;
	Thu, 29 May 2025 10:10:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3ADDC4CEE7;
	Thu, 29 May 2025 10:13:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748513596;
	bh=c+fbudvP5+ypayllbzzTmnLVS1VEZs029jYxhqFh1mM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dTEvvpSGvh3z0rG86JMumhh6P9t6vuDXynGwhtB4PzxfCCRqSqCl+v6heh0tndMwZ
	 vgdrnAXcaSsE7d0SjrkJEy7LZmqNnRTa4EOya1NKGvvCvGwBuGySQpcmfwvqU1L7gU
	 YXukp5Bx49T474Ake11ni1LHiA+hh1IT20ca0UsNhYz7/4RQMopiA1HHD8s81HKrZm
	 bxauMjpzTP4hlZ15qYbkPaLg8m88QpMg/dERiJon5pbDJAf+rD1NvUudLvjavwulPD
	 oSTh1jChu2afz4NokUdgeYTH1Lb5oSZpYyooQ4Ac2HqM5C7kJ5G7O8pIHfdOw6L6lI
	 iAQEmKGMM57EQ==
Date: Thu, 29 May 2025 11:13:11 +0100
From: Will Deacon <will@kernel.org>
To: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH v2 08/11] arm64: debug: split hardware watchpoint
 exception entry
Message-ID: <20250529101311.GC29082@willie-the-truck>
References: <20250512174326.133905-1-ada.coupriediaz@arm.com>
 <20250512174326.133905-9-ada.coupriediaz@arm.com>
 <20250520165938.GA19257@willie-the-truck>
 <acf1ee9f-fc5f-4a69-9e93-b75d7cb25456@arm.com>
 <aDcu9l0vT_kr4gKr@J2N7QTR9R3.cambridge.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aDcu9l0vT_kr4gKr@J2N7QTR9R3.cambridge.arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250529_031316_983069_39A585F6 
X-CRM114-Status: GOOD (  21.98  )
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
Cc: "Luis Claudio R. Goncalves" <lgoncalv@redhat.com>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, linux-arm-kernel@lists.infradead.org, Catalin Marinas <catalin.marinas@arm.com>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Wed, May 28, 2025 at 04:42:46PM +0100, Mark Rutland wrote:
> On Wed, May 28, 2025 at 02:47:52PM +0100, Ada Couprie Diaz wrote:
> > On 20/05/2025 17:59, Will Deacon wrote:
> > 
> > > On Mon, May 12, 2025 at 06:43:23PM +0100, Ada Couprie Diaz wrote:
> > > > [...]
> > > > diff --git a/arch/arm64/kernel/entry-common.c b/arch/arm64/kernel/entry-common.c
> > > > index 8814ad24e707..6e70130d2741 100644
> > > > --- a/arch/arm64/kernel/entry-common.c
> > > > +++ b/arch/arm64/kernel/entry-common.c
> > > > @@ -530,10 +530,20 @@ static void noinstr el1_softstp(struct pt_regs *regs, unsigned long esr)
> > > >   	arm64_exit_el1_dbg(regs);
> > > >   }
> > > > -static void noinstr el1_dbg(struct pt_regs *regs, unsigned long esr)
> > > > +static void noinstr el1_watchpt(struct pt_regs *regs, unsigned long esr)
> > > >   {
> > > > +	/* Only watchpoints write FAR_EL1 */
> > > nit: But maybe scope the comment (here and in the el0 handler) for debug
> > > exceptions?
> > > e.g.
> > > 
> > > 	/* Watchpoints are the only debug exception to write FAR_EL1 */
> > > 
> > > ?
> > > 
> > 
> > Good point. The comment felt somewhat off to me and that's exactly why.
> > 
> > Updated the wording for v3, thanks.
> 
> More of a question for Will, but could we drop the comment entirely?
> 
> Historically the same comment in the common el0_dbg() function was a
> useful warning because we were forced to read FAR even for
> non-watchpoints, but as of this restructuring that awkwardness is gone.
> 
> As of this series, for the other debug exceptions, the
> el{0,1}_${EXCEPTIONNAME}() handlers don't currently read FAR, and their
> callees don't have a 'far' argument.
> 
> I'm happy either way, in case you'd prefer that it stays.

I'd prefer to keep it, just in case somebody smart reworks the code and
we end up trying to use the FAR for other debug exceptions.

Will

