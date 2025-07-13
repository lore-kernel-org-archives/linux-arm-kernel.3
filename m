Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4E44C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Jul 2025 13:40:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=okr5jDoE3JdaDsUXrKzXUsBgmXUxrvNedkl92ILBvow=; b=wQuGRyWmAw0+YAP4S/TwbFz7DZ
	0r7lILQRtQM74X3WB0G86BGy+Ia9JLGzHB1vjk1eMrf8inSwoRECxwrnVX3MHZ2ScgtJHbBXuvyTY
	eW0KE8sufGjoAT2idCpAfxXdYhdXJfV2Ehlf7aSZnEX2RJNAQ8ev9BNUVmZF5WAyfeu498E8tnOO/
	SppTnGJAXlAoaowRGdG2hbPG2qSsj2ShQ3CnO/etqCN+m0e69pTHdU0zzHXkTOAtYz6kHhLN9uT2V
	rlZbpblYQ8imDSvz1C41AdeMmHvgLpTSW32due1Dqf5eXAyXeNKprjaOfwDUwJ4522g5d0S70gn6s
	7TW165Eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uawwW-00000000Chx-3gwg;
	Sun, 13 Jul 2025 13:40:36 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uawrq-00000000CLg-0Ljp
	for linux-arm-kernel@lists.infradead.org;
	Sun, 13 Jul 2025 13:35:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7E1C85C4B84;
	Sun, 13 Jul 2025 13:35:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 795A2C4CEE3;
	Sun, 13 Jul 2025 13:35:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752413745;
	bh=mBU5USz8BZIF/JIkJTQAznKlxvdAyXWf9AuUzuPluIg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bCPum5uyXpu9VX4xtKlkj7VMlS30iuqvm8kOOJCpTGCIIS2/1UebZV3FLZ4fYqNV+
	 xNhUyt2aU9Sysf9o0Uo8y07It0xxyKRkjA3gyBgSu3eqAyH83IZRITgN0zhBOv5Jzg
	 ugXcqhUKjtiRtHlVoPWgu8iAAuSHcrIUpzFCIDu/7yQSOOQYY3MBjBvOvfMJLDaw6D
	 GNu8J5nMkhP6ez0cRdr8JLKJORImC8zWN602KGTUvNrTD/CSrRv1xFj3JiNn2aLYv7
	 maqJVW3wLnInXlVXHezdE9nxN9cLsCspGynML3YIQ1KoVvCFiVHqD7Qm5Ehm2WWWsR
	 4dp0RLgGeuzCQ==
Date: Sun, 13 Jul 2025 14:35:40 +0100
From: Will Deacon <will@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Marc Zyngier <maz@kernel.org>
Subject: Re: [PATCH 10/10] arm64: mm: Re-implement the __flush_tlb_range_op
 macro in C
Message-ID: <aHO2LAoDpciZftP_@willie-the-truck>
References: <20250711161732.384-1-will@kernel.org>
 <20250711161732.384-11-will@kernel.org>
 <CAHk-=wijmAO=-dWc8HUMdUbkdGqgNtiO6mntAcTekWc5qN3YjQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=wijmAO=-dWc8HUMdUbkdGqgNtiO6mntAcTekWc5qN3YjQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250713_063546_168991_AC955221 
X-CRM114-Status: GOOD (  22.61  )
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

On Fri, Jul 11, 2025 at 11:16:32AM -0700, Linus Torvalds wrote:
> On Fri, 11 Jul 2025 at 09:18, Will Deacon <will@kernel.org> wrote:
> >
> > The __flush_tlb_range_op() macro is horrible and has been a previous
> > source of bugs thanks to multiple expansions of its arguments (see
> > commit f7edb07ad7c6 ("Fix mmu notifiers for range-based invalidates")).
> >
> > Rewrite the thing in C.
> 
> So I do think this is better than the old case, but I think you could
> go one step further...
> 
> > +static __always_inline void __flush_tlb_range_op(const enum tlbi_op op,
> > +                                                u64 start, size_t pages,
> > +                                                u64 stride, u16 asid,
> > +                                                u32 level, bool lpa2)
> 
> If you replaced that "enum tlbi_op op" with two function pointers
> instead (for "the invalidate range" and "invalidate one" cases
> respectively), I think you could make this code much more obvious.
> 
> And exactly like how you depend on that 'op' value being
> constant-folded because all the different levels are inline functions,
> the same thing ends up happening with function pointers where inlining
> will result in a constant function pointer becoming just a static call
> (and in turn inlined as well).

So I don't _strictly_ rely on the constant-folding and replacing that
BUILD_BUG_ON() with a BUG_ON() would still give functionally correct
code if inlining didn't occur. I just much preferred catching a wonky
TLBI op at compile-time, which is why I ended up with this but I hadn't
considered that this would allow us to inline indirect function calls.

> And then the actual *callers* would use the "look up op" thing, but I
> suspect that in many cases those could then be in turn also simplified
> to not use that op-number at all, but just end up using the op-name.

Right, I think we'd drop the enum entirely if we went down this route.

> I didn't try to actually create that series - and I think you'd want
> to do it in multiple steps just to make each individual step small and
> obvious - but I think it would end up looking nicer.

I'll have a play...

Will

