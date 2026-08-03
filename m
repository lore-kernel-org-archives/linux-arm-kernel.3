Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B33B9C55184
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 15:32:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dtAprwl9YVKSgx2qkgDkJIY4Tilcw0HSTK5NvGoGEC4=; b=yddBc5ro5vy+6ePWFevex8dZNa
	8DuiYdiqcr0JrXBf4dPVKAdGVfM5CknGdAUSGUmy2d+UMBf5sZ5mPDvZGJkDSJKwp1hVFBsbpp+Gc
	yg7rwxJTdgyhAP6YBzfluZ+nPzK8g8Pz35W5V68YGeesj13ZC+TR+porGSs/Y3tA9HCcTFrBZdbTw
	Den/jvQnNpF+g8Sh4WrX9S5y9pZ+JsXH9PXU8WenpGa3rZvRBVJ3Saun5yRfRwbsrGdWdSX5lsEqe
	FjwA9KlD3qs1J5Mr6T3//qUdRexkA1cnxHQhpW7U+Yz1Bl0iYP++Pf+rtEcqDX1vK6WDSv42UvXZk
	cAFrsxUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wquem-0000000HXTI-1Xk4;
	Mon, 03 Aug 2026 15:32:48 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wquek-0000000HXTA-3k12
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 15:32:47 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 1C52060A81;
	Mon,  3 Aug 2026 15:32:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BD9F1F00A3A;
	Mon,  3 Aug 2026 15:32:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785771164;
	bh=dtAprwl9YVKSgx2qkgDkJIY4Tilcw0HSTK5NvGoGEC4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=WYg7oONsuX2Brvgwjitwk77p506v8el7XNP2buJRtdOxkH5PrcmxYad/4+siEEvi+
	 ngSsM83nqgyT19k3ROzH+GFDDT5o/PdfUBmLFewVJst0NyLUX/qVomM71taDAJmPaq
	 qLRAesXU7j0fYjZpY71Ek+ECQFOynvtixDxkRJcrajEscwc/yi09TElybQ69+x6HlN
	 eeBXN5dBQHJ4QARAv6jl96Oomj3R74GNuK59qp+vsBFi2/iL+5lahu1rYeQGYcZ77W
	 n28Lu+D73MJvHHClLynmaxonmzIfYJ3AFSgBZ1uJOFvvzH5gExH+hhngKNOB5+JwHv
	 7MXXCtl99O6IA==
Date: Mon, 3 Aug 2026 16:32:27 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Barry Song <baohua@kernel.org>
Cc: akpm@linux-foundation.org, linux-mm@kvack.org, x86@kernel.org, 
	linux-arm-kernel@lists.infradead.org, surenb@google.com, liam@infradead.org, vbabka@kernel.org, 
	shakeel.butt@linux.dev, david@kernel.org, linux-kernel@vger.kernel.org, 
	zhanghongru@xiaomi.com, willy@infradead.org, zhangbo56@xiaomi.com
Subject: Re: [RFC PATCH v1 2/2] arm64/mm: use VMA lock for kernel faults on
 user addresses
Message-ID: <anCxz6JqVtebHxg7@lucifer>
References: <20260802074018.73887-1-baohua@kernel.org>
 <20260802074018.73887-3-baohua@kernel.org>
 <CAGsJ_4wLG77Y5r9Dy6QOqgmjNM5W1E5aGqKyJb7Bp3WGemNFmg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGsJ_4wLG77Y5r9Dy6QOqgmjNM5W1E5aGqKyJb7Bp3WGemNFmg@mail.gmail.com>
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

On Sun, Aug 02, 2026 at 04:49:04PM +0800, Barry Song wrote:
> On Sun, Aug 2, 2026 at 3:40 PM Barry Song (Xiaomi) <baohua@kernel.org> wrote:
> >
> > Use the VMA lock for kernel faults on user addresses. This also
> > makes the existing code below meaningful:
> >
> > /* Quick path to respond to signals */
> > if (fault_signal_pending(fault, regs)) {
> >         if (!user_mode(regs))
> >                 goto no_context;
> >         return 0;
> > }
> >
> > Right now, the code above is dead because !user_mode always
> > takes the mmap_lock path.
> >
> > Co-developed-by: Bo Zhang <zhangbo56@xiaomi.com>
> > Signed-off-by: Bo Zhang <zhangbo56@xiaomi.com>
> > Signed-off-by: Barry Song (Xiaomi) <baohua@kernel.org>
> > ---
> >  arch/arm64/mm/fault.c | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/arch/arm64/mm/fault.c b/arch/arm64/mm/fault.c
> > index 85e23388f9bb..241f1ab07ab3 100644
> > --- a/arch/arm64/mm/fault.c
> > +++ b/arch/arm64/mm/fault.c
> > @@ -607,6 +607,7 @@ static int __kprobes do_page_fault(unsigned long far, unsigned long esr,
> >         unsigned int mm_flags = FAULT_FLAG_DEFAULT;
> >         unsigned long addr = untagged_addr(far);
> >         struct vm_area_struct *vma;
> > +       bool uaccess = false;
> >         int si_code;
> >         int pkey = -1;
> >
> > @@ -663,6 +664,7 @@ static int __kprobes do_page_fault(unsigned long far, unsigned long esr,
> >                 if (!insn_may_access_user(regs->pc, esr))
> >                         die_kernel_fault("access to user memory outside uaccess routines",
> >                                          addr, esr, regs);
> > +               uaccess = true;
>
> https://sashiko.dev/#/patchset/20260802074018.73887-1-baohua%40kernel.org
>
> "Does this conditional bypass translation faults? Because this block is
> guarded by:
> if (is_ttbr0_addr(addr) && is_el1_permission_fault(addr, esr, regs)) {
> it appears uaccess is only set for permission faults like CoW or PAN
> violations.
> If a kernel uaccess routine accesses an unmapped user address, a translation
> fault occurs, making is_el1_permission_fault() evaluate to false.
> Would this cause demand paging in uaccess routines to fall back to the slow
> lock_mmap path, missing the intended optimization?"
>
> Good catch! I should have only modified a single line. Then
> unmapped PTEs would also benefit from the VMA lock:
>
> diff --git a/arch/arm64/mm/fault.c b/arch/arm64/mm/fault.c
> index 85e23388f9bb..e1b406d667aa 100644
> --- a/arch/arm64/mm/fault.c
> +++ b/arch/arm64/mm/fault.c
> @@ -674,7 +674,7 @@ static int __kprobes do_page_fault(unsigned long
> far, unsigned long esr,
>
>         perf_sw_event(PERF_COUNT_SW_PAGE_FAULTS, 1, regs, addr);
>
> -       if (!(mm_flags & FAULT_FLAG_USER))
> +       if (!(mm_flags & FAULT_FLAG_USER) && !is_ttbr0_addr(addr))
>                 goto lock_mmap;

I mean honestly it feels like, with the permanent VMA flags change, that maybe
this really needs to wait for Matthew's series?

There's duplication here too of course :)

But it begs the question of every other arch that does VMA page faulting.

So feels better suited as part of that change I think?

Maybe Matthew has thoughts.

>
>         vma = lock_vma_under_rcu(mm, addr);

--
Cheers, Lorenzo

