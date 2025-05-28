Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32978C5B549
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 May 2025 16:28:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fweYD27Qn5c1iHhvdCJ3fQ58UAuZpC6lx1/jzao4PG4=; b=e8dZKJwJ4vd+2UdCGWxC3nnkde
	cjISuZ7bSWSiow/5/TgZVFBqZMT9GZ8Fx3sD6shSG+op7hZvCkHY/rj8Xd6Yq3EZXNbBC7EB4WtDf
	1xuAWLpgdYIu3700L+waI0gmQewYZNxmzN5tOpaCoVx2RRxLfEvye/mBMIFLfiOq1r7QqpP8pAul7
	fs6taCEplefdzIgBCXjkAkHd2nLXssn1ZqR35h6TjQBHnXf+eu+W/qQExsJdnQz+4ropDn++C13B7
	Xe+4FZQvIEQouhOBFY41vqPCq3ULar1Ac/7DsiidoDJLG4aovm/Nc1nKlnXPlqlgdkQ9X1Jj+f1yd
	U219C+yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKJdb-0000000DfE7-1J33;
	Wed, 28 May 2025 16:28:20 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKIva-0000000DZxo-2mdJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 May 2025 15:42:51 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5828F1A2D;
	Wed, 28 May 2025 08:42:33 -0700 (PDT)
Received: from J2N7QTR9R3.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E8F403F5A1;
	Wed, 28 May 2025 08:42:48 -0700 (PDT)
Date: Wed, 28 May 2025 16:42:46 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Cc: Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	"Luis Claudio R. Goncalves" <lgoncalv@redhat.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: Re: [PATCH v2 08/11] arm64: debug: split hardware watchpoint
 exception entry
Message-ID: <aDcu9l0vT_kr4gKr@J2N7QTR9R3.cambridge.arm.com>
References: <20250512174326.133905-1-ada.coupriediaz@arm.com>
 <20250512174326.133905-9-ada.coupriediaz@arm.com>
 <20250520165938.GA19257@willie-the-truck>
 <acf1ee9f-fc5f-4a69-9e93-b75d7cb25456@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <acf1ee9f-fc5f-4a69-9e93-b75d7cb25456@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250528_084250_743471_B5D07CD9 
X-CRM114-Status: GOOD (  16.23  )
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

On Wed, May 28, 2025 at 02:47:52PM +0100, Ada Couprie Diaz wrote:
> On 20/05/2025 17:59, Will Deacon wrote:
> 
> > On Mon, May 12, 2025 at 06:43:23PM +0100, Ada Couprie Diaz wrote:
> > > [...]
> > > diff --git a/arch/arm64/kernel/entry-common.c b/arch/arm64/kernel/entry-common.c
> > > index 8814ad24e707..6e70130d2741 100644
> > > --- a/arch/arm64/kernel/entry-common.c
> > > +++ b/arch/arm64/kernel/entry-common.c
> > > @@ -530,10 +530,20 @@ static void noinstr el1_softstp(struct pt_regs *regs, unsigned long esr)
> > >   	arm64_exit_el1_dbg(regs);
> > >   }
> > > -static void noinstr el1_dbg(struct pt_regs *regs, unsigned long esr)
> > > +static void noinstr el1_watchpt(struct pt_regs *regs, unsigned long esr)
> > >   {
> > > +	/* Only watchpoints write FAR_EL1 */
> > nit: But maybe scope the comment (here and in the el0 handler) for debug
> > exceptions?
> > e.g.
> > 
> > 	/* Watchpoints are the only debug exception to write FAR_EL1 */
> > 
> > ?
> > 
> > Will
> 
> Good point. The comment felt somewhat off to me and that's exactly why.
> 
> Updated the wording for v3, thanks.

More of a question for Will, but could we drop the comment entirely?

Historically the same comment in the common el0_dbg() function was a
useful warning because we were forced to read FAR even for
non-watchpoints, but as of this restructuring that awkwardness is gone.

As of this series, for the other debug exceptions, the
el{0,1}_${EXCEPTIONNAME}() handlers don't currently read FAR, and their
callees don't have a 'far' argument.

I'm happy either way, in case you'd prefer that it stays.

Mark.

