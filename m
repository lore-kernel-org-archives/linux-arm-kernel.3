Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC2F4CD5BAC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 May 2026 08:47:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2kKj5TUBkJ/lhKpwrX5zg7NzjXpzWJAzpXTS1fgVICc=; b=RYGbkNlmuXyDq7Rt4i9FBeaRTc
	uswa3x+n5QHwr6ZCrn8t+33kbpccVudw2cmJ9J+y57zFObMJOEGM5u5naEbvRX8aTezkN00pZwrn2
	fm3QNHHxKHVGUDLODdSzGOVrrRT9ftuHjKzkPMwyjhPp2wzmfz3pYyJ5ruF3KnfKaQuSjJ90S0HLF
	mtQ1Ie9Wgl7ug1LaIrhjcZhBd+4TGEPs3tSKCxmuw1P+n2+tQyk0mCmhOi55x+lZxh/v2Dz3ht4og
	G/7Bx9FMAunvnrC8JX8YvYif4e4TUMnat3lHlHBcgewCvJRY3vHWesVMFDCyFxMbPry7rnFPesw0h
	EhHJ2Bpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQLWy-0000000AEGJ-19Cc;
	Fri, 22 May 2026 08:46:56 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQLWv-0000000AEFa-2puw
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 May 2026 08:46:54 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A156F43C8A;
	Fri, 22 May 2026 08:46:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 913AC1F000E9;
	Fri, 22 May 2026 08:46:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779439612;
	bh=2kKj5TUBkJ/lhKpwrX5zg7NzjXpzWJAzpXTS1fgVICc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YUKESoVKquqC4dbfhsbG+HvacauCOzizSC2ClD87K4VvwII9MuHoouI4xV6+a4bo4
	 Hv6Ogqb0s11ambrct3s7TRpVCroOEefPc8TFLJ5+7tRb68ny8XBBckvNAye09lto6b
	 62apL/qdZ8Hwou2syulNQb0bVPXvLEWe0w0XGQ67shJQB70o2e8SvfkzUBLBWrPDz6
	 QgYa5ARg3iQF5F4nYKqEE6bADB4D2JmeQcZk0vqa7O3LStfFInwFlSuI3IFk4tmDVw
	 ha27UMDq77FAZF2c/4QvcGyBqEnxrSAF/A+3PFGRE1DTqzjdBXfVU1sppHgtG8XZcF
	 oM7t8g+UFTdtA==
Date: Fri, 22 May 2026 09:46:45 +0100
From: Lorenzo Stoakes <ljs@kernel.org>
To: Waiman Long <longman@redhat.com>
Cc: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Clark Williams <clrkwllms@kernel.org>, 
	Steven Rostedt <rostedt@goodmis.org>, Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, 
	Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-rt-devel@lists.linux.dev, Matthew Wilcox <willy@infradead.org>
Subject: Re: [PATCH 1/2] gfp_types: Introduce a new GFP_ATOMIC_RT gfp flag
Message-ID: <ahAXO_XN1TYvq24D@lucifer>
References: <20260520204628.933654-1-longman@redhat.com>
 <ag8zX5KJUKo70TvG@lucifer>
 <f0f4841a-816a-4442-bebb-277984ee950e@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f0f4841a-816a-4442-bebb-277984ee950e@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_014653_760968_A8117FC2 
X-CRM114-Status: GOOD (  47.20  )
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

On Thu, May 21, 2026 at 01:40:03PM -0400, Waiman Long wrote:
> On 5/21/26 12:40 PM, Lorenzo Stoakes wrote:
> > +cc Matthew who has fairly strong opinions on GFP flags and such :)
> >
> > Also, please don't send 2 patch series with 2/2 in-reply-to 1/2, use a
> > cover letter + have patches reply to that :) [yes it's one of those
> > subjective things that people differ on a lot but generally how we do in
> > mm]
> >
> > On Wed, May 20, 2026 at 04:46:27PM -0400, Waiman Long wrote:
> > > The GFP_ATOMIC flag is to be used in atomic context where user cannot
> > > sleep and need the allocation to succeed. However, it does not support
> > > contexts where preemption or interrupt is disabled under PREEMPT_RT
> > > like raw_spin_lock_irqsave() or plain preempt_disable().
> > >
> > > With the advance of the ALLOC_TRYLOCK allocation flag in the v7.1
> > > kernel, it is possible to allocate memory under such contexts by using
> > > spin_trylock to acquire the spinlock in the memory allocation path. This
> > > does increase the chance that the allocation can fail due to the presence
> > > of concurrent memory allocation requests. So its users must be able to
> > > handle such memory allocation failure gracefully.
> > >
> > > The ALLOC_TRYLOCK flag will only be enabled if none of the
> > > ___GFP_DIRECT_RECLAIM and ___GFP_KSWAPD_RECLAIM flags are set.
> > >
> > > Introduce a new GFP_ATOMIC_RT gfp flag for those PREEMPT_RT
> > > atomic contexts.  This new flag will fall back to GFP_ATOMIC in
> > > non-PREEMPT_RT kernel. GFP_ATOMIC can continue to be used in contexts
> > > where preemption and interrupt are not disabled in PREEMPT_RT kernel
> > > like spin_lock_irqsave().
> > This seems like the wrong place for the solution, now we have to remember
> > to use a specific GFP flag but only in one specific place in some IRQ code,
> > yet RT is fine with this in any other scenario?
> >
> > This is really confusing.
> >
> > Wouldn't we better off with a way of actively detecting this context
> > somehow in the page allocator?
>
> This new GFP_ATOMIC_RT flag will make memory allocation more likely to fail
> compared with GFP_ATOMIC. That is the main reason why I think a separate
> flag with documentation about this difference will make the users of the new
> gfp flag more aware of what they should check before they use it.
>
> I would certainly like to have the mm memory allocation code to handle it
> automatically if it doesn't impact the failure rate.
>
> >
> > It just instinctively feels like this is the wrong level of abstraction for
> > a fix here :)
> With PREEMPT_RT, GFP_ATOMIC_RT just translates to __GFP_HIGH. It can be set
> explicitly in the relevant call sites. This patch is more a documentation
> step to make clear the purpose and consequence of doing that.
> >
> > > Signed-off-by: Waiman Long <longman@redhat.com>
> > > ---
> > >   include/linux/gfp_types.h | 13 +++++++++++++
> > >   1 file changed, 13 insertions(+)
> > >
> > > diff --git a/include/linux/gfp_types.h b/include/linux/gfp_types.h
> > > index cd4972a7c97c..ac30882b6cd4 100644
> > > --- a/include/linux/gfp_types.h
> > > +++ b/include/linux/gfp_types.h
> > > @@ -316,6 +316,13 @@ enum {
> > >    * preempt_disable() - see "Memory allocation" in
> > >    * Documentation/core-api/real-time/differences.rst for more info.
> > >    *
> > > + * %GFP_ATOMIC_RT is similar to %GFP_ATOMIC with the addition that it can also
> > > + * be used in context where preemption and/or interrupt is disabled under
> > > + * PREEMPT_RT, but not in NMI or hardirq contexts. The allocation is more
> > I'm not sure 'GFP_ATOMIC_RT' really communicates all of this information.
>
> I am not good at naming. If you have other good suggestion, I would like to
> hear it.

Haha herein lies the pain of naming - I am not claiming I am great at naming it
either :P

But _RT feels way off the mark for sure.

I mean in general, I'd rather we not add a new shall we say GFP flag alias? You
suggest an alternative approach in 2/2 so I'd definitely encourage you to
explore that first.

But if we were to add this, I'd prefer something like GFP_INTERRUPT or such? I
mean that's pretty terrible too... but something that points to the key feature
of being usable in contexts where preemption/interrupts are disabled.

>
> Cheers,
> Longman
>
>

Thanks, Lorenzo

