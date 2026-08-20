Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A790C5DF81
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Aug 2026 13:46:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4ypmlagJXRp1A0gpAEnxYNrmttYM1r5LYQC+TwyZ97M=; b=4NJPGAtBDB8S79ewwsXjblDMCi
	6azbwW59PZjAgu0ZxBTQR/ulbLrIhetUSWvaAIO5aak/FN/Os4YvnPdILZ1UGG0cIcdS6cTqLpZ48
	iQ1nkffHSYwKwpVhvwZYnuVnDMr3lBlKhIOdAF1k22FTEv6EeLKM9m3w8SvYI9M5zo94n4/JmFwm1
	82CxPnJdBPSZTUOk5+Fq7kfpIexQvGfUSHEWbPUjgWGJXYYBt/lzhBu405xVqnpOx7brTn0PzyUkS
	FcEouwjdGvPrMtAphRqQUQhYXVmCCIrRtVbfxCNaT2XFlFJwyAD9pMFT7CmVdZUbq7d8aK+RYlYkp
	8QQ06MjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx35p-0000000BdTP-0SP2;
	Thu, 20 Aug 2026 13:46:05 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx35n-0000000BdTJ-2TYM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Aug 2026 13:46:03 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 47A5A60A6C;
	Thu, 20 Aug 2026 13:46:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9F471F00A3A;
	Thu, 20 Aug 2026 13:45:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787233560;
	bh=4ypmlagJXRp1A0gpAEnxYNrmttYM1r5LYQC+TwyZ97M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=n4t4rPmGo1Y4VS4jhjNh+TeFMUK+VBLHJIQ/04Ig2i5puPJZ8gZK3hdXrrub+T/pE
	 6XWFQC++srYlRoOXPiAispIfWyYIe0sshuP9XCSSGYp8fAb7OYmIB4BxPEfKGYkE2A
	 HZjI648Fui04S3uhSqaSYuQxZ5ZanlifEhjudOVIbh5+iGxvU2ooxLO6oqVG9t+avQ
	 aMKbW/zhE4GNsZOTRHsu53B9yEG1U3mG+sVUyWsxtuGuie0JeKF4CookMGXKWgTHKb
	 BtbxQrqjndnMYul++g7YwmZduvra/gbIRgr9S+TI6aDOReAwXsE07u74u0fe/kORaQ
	 jWuobuX0Ymvaw==
Date: Thu, 20 Aug 2026 14:45:54 +0100
From: Will Deacon <will@kernel.org>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>, Eric Biggers <ebiggers@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Marc Zyngier <maz@kernel.org>
Subject: Re: [PATCH 06/12] arm64: assembler: Remove endianness helper macros
Message-ID: <aocFEg5JvsjeMXwj@willie-the-truck>
References: <20260811140132.22778-1-will@kernel.org>
 <20260811140132.22778-7-will@kernel.org>
 <a16ed8a4-28cc-4270-a257-b9268ab9e9ea@app.fastmail.com>
 <aoGGCqMdb8iZvZSM@willie-the-truck>
 <aob-0tByMtlbIaxQ@willie-the-truck>
 <03208978-a825-4ae5-b47e-3dd6133ecbf0@app.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <03208978-a825-4ae5-b47e-3dd6133ecbf0@app.fastmail.com>
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

On Thu, Aug 20, 2026 at 04:27:06PM +0300, Ard Biesheuvel wrote:
> 
> On Thu, 20 Aug 2026, at 16:19, Will Deacon wrote:
> > On Sun, Aug 16, 2026 at 10:42:40AM +0100, Will Deacon wrote:
> >> On Tue, Aug 11, 2026 at 05:04:43PM +0200, Ard Biesheuvel wrote:
> >> > On Tue, 11 Aug 2026, at 16:01, Will Deacon wrote:
> >> > > diff --git a/arch/arm64/kernel/head.S b/arch/arm64/kernel/head.S
> >> > > index 87a822e5c4ca..8951ce693552 100644
> >> > > --- a/arch/arm64/kernel/head.S
> >> > > +++ b/arch/arm64/kernel/head.S
> >> > > @@ -138,8 +138,7 @@ SYM_CODE_START_LOCAL(record_mmu_state)
> >> > >  	b.ne	0f
> >> > >  	mrs	x19, sctlr_el2
> >> > >  0:
> >> > > -CPU_LE( tbnz	x19, #SCTLR_ELx_EE_SHIFT, 1f	)
> >> > > -CPU_BE( tbz	x19, #SCTLR_ELx_EE_SHIFT, 1f	)
> >> > > +	tbnz	x19, #SCTLR_ELx_EE_SHIFT, 1f
> >> > >  	tst	x19, #SCTLR_ELx_C		// Z := (C == 0)
> >> > >  	and	x19, x19, #SCTLR_ELx_M		// isolate M bit
> >> > >  	csel	x19, xzr, x19, eq		// clear x19 if Z
> >> > 
> >> > There is some more code that can be removed here - see
> >> > 2ced0f30a426c7301350681f838344d5aea711e3
> >> 
> >> Good spot, thanks! I'll do some more surgery at -rc1.
> >
> > Looking at this again, I'm not sure we can remove much here. I think we
> > probably still want to force little-endian (i.e. clear the EE bit) if
> > we're entered as big-endian. I've changed the following EOR to a BIC
> > (see below), but I think that's about all we can do?
> >
> 
> Well, the only case where we allow an active ID map is when doing EFI
> boot, which is guaranteed to be little-endian. Since the kernel is now
> also guaranteed to be little-endian, we should be able to simply kick
> the CPU in LE mode right at the start, no? And simply ignore the case
> of a BE bootloader entering with the MMU and caches enabled?

Hmm, so why did we support this in the first place given that EFI is
guaranteed to be little-endian? Or was that just because we wanted to
handle the case of a big-endian kernel being loaded by EFI?

Will

