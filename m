Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00CEDC5518F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 14:46:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uUvC+y0j8JFjtE+XMJ9UQGtCiCNbH3kOeZKEuG06DWw=; b=kkmbSh2DtOqYrUplFyNwSV9daA
	KDmfmPpQ7HBd4oHI52Jwxg7fED0ga0+xMQ4gEPBzBBta+H4FgVqjKEdGFoudI2peKtFDY/pStLyiS
	LF9GkZgdGxeyn+Ii3msElTxOsXv4RQ37PPSWMrIc389OwiGuDZ+h61Y3NW5gaLqXbxDOcYsvPY7zV
	/apgJlloJoi7F4Qy98M8YnruCg7mf0IeVtTviaNA1HaU9xtij1slBja+Kcj/JpW8lsstDxSYMc1T+
	2JKGbA79R4jZfJJmmgscLo4lTApYLvfRG/KDUw5dwnsNApIGkb/1InHW9nJ0WcbvThYROR8xT2Ikc
	MV8H7Dbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrGPX-000000027EU-2ELi;
	Tue, 04 Aug 2026 14:46:31 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrGPW-000000027Du-02sr
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Aug 2026 14:46:30 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7611040BFE;
	Tue,  4 Aug 2026 14:46:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2510B1F000E9;
	Tue,  4 Aug 2026 14:46:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785854789;
	bh=uUvC+y0j8JFjtE+XMJ9UQGtCiCNbH3kOeZKEuG06DWw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=RkxaN2ik9P4rS1+/q3KgKb/2D2Eh7uomzp+QNGTLlcFGiVoRdD2vuChwYpMjwFQp5
	 ECUUHTxHFDlqwTii01KYRocgyxJj35A2kS9tX/ei31yWKYaIN9L9YFhsn2ZlSdxdyB
	 gu0aWTswPsa/XnAveSiWQSG8fjaOZEZV1PuVweKw3vJk8stnyIOtCX8KUpkc7OCrsx
	 n5diT9WhcnlnZyAygOsDSKKw9mkehqfM6GW24BR59cBzv+d7NN+rcYhlTya9qTqOqf
	 dxbLbJyZSgtJtNT8G+GckekF/SFjztBDfoEeCQENfohv6Y+9YdnN1HvSiqsu4FzBxO
	 kMbSJgWnIjbXQ==
Date: Tue, 4 Aug 2026 15:46:11 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Barry Song <baohua@kernel.org>
Cc: akpm@linux-foundation.org, linux-mm@kvack.org, x86@kernel.org, 
	linux-arm-kernel@lists.infradead.org, surenb@google.com, liam@infradead.org, vbabka@kernel.org, 
	shakeel.butt@linux.dev, david@kernel.org, linux-kernel@vger.kernel.org, 
	zhanghongru@xiaomi.com, willy@infradead.org, zhangbo56@xiaomi.com
Subject: Re: [RFC PATCH v1 1/2] x86/mm: use VMA lock for kernel faults on
 user addresses
Message-ID: <anH3jVrBlUMLd-28@lucifer>
References: <20260802074018.73887-1-baohua@kernel.org>
 <20260802074018.73887-2-baohua@kernel.org>
 <anCu3DOrXDeMrwi5@lucifer>
 <CAGsJ_4xM7mmv_Xa3g2mB_0gW0_VtYhMtwz0idgYLyoAYiHFmfg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGsJ_4xM7mmv_Xa3g2mB_0gW0_VtYhMtwz0idgYLyoAYiHFmfg@mail.gmail.com>
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

On Tue, Aug 04, 2026 at 06:37:31AM +0800, Barry Song wrote:
> On Mon, Aug 3, 2026 at 11:18 PM Lorenzo Stoakes (ARM) <ljs@kernel.org> wrote:
> >
> > On Sun, Aug 02, 2026 at 03:40:17PM +0800, Barry Song (Xiaomi) wrote:
> > > Use the VMA lock for kernel faults on user addresses. This also
> > > makes the existing code below meaningful:
> > >
> > >   /* Quick path to respond to signals */
> > >   if (fault_signal_pending(fault, regs)) {
> > >           if (!user_mode(regs))
> > >                   kernelmode_fixup_or_oops(regs, error_code, address,
> > >                                            SIGBUS, BUS_ADRERR,
> > >                                            ARCH_DEFAULT_PKEY);
> > >           return;
> > >   }
> >
> > Hmm yeah :)
> >
> > Bit weird it uses user_mode(regs) and the early exit uses the just-set
> > 'flags & FAULT_FLAG_USER' too.
> >
> > Some horrible duplication here too... the user_mod_regs() etc. code is just
> > duplicated in the mmap lock path.
> >
> > I think you mentioned it on Suren/Dave's series but vma_start_read_unlocked()
> > would avoid all this and could lead to a nicely red patch.
>
> vma_start_read_unlocked() could completely avoid falling back to
> mmap_lock for binder. For page faults, however, there are still
> paths that must retry under mmap_lock, such as
> __vmf_anon_prepare() and swapcache_is_device_private().
> So we may not end up with something as clean as binder, but I
> think we can still achieve a cleaner design than what we have
> today.
>

Right, and also fault retrying (though Hongru's series is looking at giving at
least 1 more try under VMA lock there).

Let's maybe wait for that to settle first and see how that looks :)

> >
> > >
> > > Right now, the code above is dead because !user_mode always
> > > takes the mmap_lock path.
> > >
> > > Co-developed-by: Bo Zhang <zhangbo56@xiaomi.com>
> > > Signed-off-by: Bo Zhang <zhangbo56@xiaomi.com>
> > > Signed-off-by: Barry Song (Xiaomi) <baohua@kernel.org>
> > > ---
> > >  arch/x86/mm/fault.c | 3 ---
> > >  1 file changed, 3 deletions(-)
> > >
> > > diff --git a/arch/x86/mm/fault.c b/arch/x86/mm/fault.c
> > > index 45b99c3b1442..c22b74e0eeaf 100644
> > > --- a/arch/x86/mm/fault.c
> > > +++ b/arch/x86/mm/fault.c
> > > @@ -1328,9 +1328,6 @@ void do_user_addr_fault(struct pt_regs *regs,
> > >       }
> > >  #endif
> > >
> > > -     if (!(flags & FAULT_FLAG_USER))
> > > -             goto lock_mmap;
> > > -
> >
> > I'm not sure why kernel faults of userland memory were excluded initially
> > (Suren?)
> >
> > Given that it's OK to take the mmap lock here and we're necessarily in process
> > context anyway surely it's OK to take the VMA lock?
> >
> > It looks fine to me but want Suren's input.
> >
> > Also given vma_start_read_unlocked() is coming maybe that's better for a
> > cleanup.
> >
> > And finally - Willy is working on a grand clean up of this stuff _I think_ so
> > you probably should coordinate with him also?
>
> I have no problem waiting for Matthew's work. It is the right
> thing to refactor the duplicated code across architectures for
> the VMA lock page fault path.

Seems sensible thanks!

>
> Thanks
> Barry

--
Cheers, Lorenzo

