Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F4C9C7115A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Jun 2025 12:36:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LtbmUsAzj0FCvYMwxX4JzIhkabG9QzKjTINwKT4HBdg=; b=1hOiMvztHY/rg3wZC8RsH0+FVb
	xWEKo0CkaBJ87TvNtmUJUzrearmeKcfesihH6TGciSzxfwUQun/Kj8ZZFWQW10bl7EICBMlRRpFZC
	2d1sGTyocmvGSmdvdn9oE7LvouFkqfN4NNqBZ2XbdaTC+G8uRoYxK9Bh3EML64cgIlK26ATWnZo0F
	qgTRRu3m2QHnyuuq2BeIS5Na39uHnoiDi/Y00sUNhCRAAZiknmUbJg59rQb461G67D4W86qYZSked
	T51QqO6HMKKu1+pxRHgcBCzZG8mGjVtdSq5frZqMCbCByoMn5AnLECxPuNwLFZWHCUy86940QG99d
	mnadtB9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRs1z-0000000A9UJ-07dX;
	Wed, 18 Jun 2025 12:36:43 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRq7Z-00000009o1o-0Peh
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Jun 2025 10:34:22 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EB8B814BF;
	Wed, 18 Jun 2025 03:33:59 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E4ECF3F66E;
	Wed, 18 Jun 2025 03:34:18 -0700 (PDT)
Date: Wed, 18 Jun 2025 11:34:16 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Cc: Anshuman Khandual <anshuman.khandual@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	"Luis Claudio R. Goncalves" <lgoncalv@redhat.com>
Subject: Re: [PATCH v3 04/13] arm64: debug: call step handlers statically
Message-ID: <aFKWKBG0d4FB97c3@J2N7QTR9R3>
References: <20250609173413.132168-1-ada.coupriediaz@arm.com>
 <20250609173413.132168-5-ada.coupriediaz@arm.com>
 <831db1e9-ed27-4116-b43b-ac580603d7ac@arm.com>
 <fc95e262-b63c-4b19-a571-ee59268ffdef@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fc95e262-b63c-4b19-a571-ee59268ffdef@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_033421_177503_176302B7 
X-CRM114-Status: GOOD (  17.08  )
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

On Mon, Jun 16, 2025 at 02:39:43PM +0100, Ada Couprie Diaz wrote:
> On 13/06/2025 08:47, Anshuman Khandual wrote:
> 
> > On 09/06/25 11:04 PM, Ada Couprie Diaz wrote:
> > > [...]
> > > 
> > > diff --git a/arch/arm64/kernel/kgdb.c b/arch/arm64/kernel/kgdb.c
> > > index b5a3b9c85a65..8f6ce2ea005c 100644
> > > --- a/arch/arm64/kernel/kgdb.c
> > > +++ b/arch/arm64/kernel/kgdb.c
> > > @@ -250,7 +250,7 @@ int kgdb_compiled_brk_handler(struct pt_regs *regs, unsigned long esr)
> > >   }
> > >   NOKPROBE_SYMBOL(kgdb_compiled_brk_handler);
> > > -static int kgdb_step_brk_fn(struct pt_regs *regs, unsigned long esr)
> > > +int kgdb_singlestep_handler(struct pt_regs *regs, unsigned long esr)
> > This rename makes sense but as mentioned later kgdb_single_step_handler()
> > might save some changes in uprobes callback function.
> 
> That's fair. I think I would prefer the `_single_step_` version now as well,
> so I'll go for it.

FWIW, that sounds good to me.

> As per the other patch, would it make sense to split the rename here as well
> ? Would it be OK if it were in the same commit as the breakpoint exception
> handlers ?

I think it makes sense for the rename to be in this patch, at the point
we expose the functions in header files. No need to split that out into
a separate patch.

Thanks,
Mark.

