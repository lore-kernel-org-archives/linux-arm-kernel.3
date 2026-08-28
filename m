Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 964FCC61DCB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Aug 2026 20:50:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AshsUhDS0njxXs9dy2fBnY4fbd5Y93s1/0Sdvq7L85o=; b=cok/O6pTXA6+7IxwYIqmeauIxp
	LORiNXX+qKJf9gKPjWm3VW+Nv+H699llht0M3GfF4j4JpvuCZFRv4ieDJ9rpMWS4vmTznbxYerYPt
	RfBMMMPyjVetd8IPP6M8CEW4sxo5/9P2I8A+b8UVNdP6qzGMCfoZtqyIkBUfOnCW+kAc2XPvvd1+L
	eESRniXxqXtT2PlxwYwPHLp3qhlhR0WYtM6NK75J3j47LPlwBkHCiCvueKoPerj6Ho2msL7kvGvAg
	vVNqF2EaTen271dGZzwjBtOKGRMclDDhzEKAgChNPC9OYxisIQYttTAiGteJJYarjaU8RfBf9DH//
	P/RSU+9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x03Wn-00000006Q0C-4C55;
	Fri, 28 Aug 2026 20:50:22 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x03Wl-00000006PzZ-2uLw
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Aug 2026 20:50:21 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-499b1409a75so3115e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 28 Aug 2026 13:50:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787950218; cv=none;
        d=google.com; s=arc-20260327;
        b=fygjtxtrmftx9KZQ4IgRnx1veq1h6TZjFBZ7wNWkcGf6ThiuXR7/qum7+FwLXQlefD
         CcikOJetwTdA1+o2sqdeWHvOyQHbblkINtToJfA0IeRVpOvMmYznEwqSKX1B9nlmoPkD
         GyYxSLfdFEtO6wcH940bMuWaAx1kjGTTe+YwMo8OnTLardpa3fKatdi/vYA9zaDNIQdP
         9q2SXDIwznvfAbcRSXbGHqF+5v1zP2x9R1a4ukGpvhN5261yO3KOsFTTt5q9OQ0BBt/4
         LiZun4U0JPPgalAs9rEIRd4v+8J7KU35ETyUhWdrW5hG98IDX1v4ntUc4As0G9kCcmkf
         QliA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AshsUhDS0njxXs9dy2fBnY4fbd5Y93s1/0Sdvq7L85o=;
        fh=uUGR4Y9bp6QPa8SIZuICBXwb2dB0FjIEcPnTAiNrbiU=;
        b=cirW9zniX2575U7q7WM4KAgebHXrqEDdMfPBs6UDTshlyvW/JM3oMomXzNXDtGzjuz
         T2phOm/TIhasbdvxBOydFc+F2SiGl0FGPGcUiOuWIESckhcoeovC28dKs4iBdVeJ6j1H
         wq8+thKpHKmWK/7Zmq7iQttgCRsvLkjGjd0rPLvuqZXQZk4A381AlnD8kOs79lhVGaSG
         GC33NCTzli9fiEtJ5r+Ef27M/3+5Op0I6LrFHkADnp+16HnlD2eF5OFfLEVjoLOyvkX6
         bofZtoWmtsnFpKYpezBAGRKEAklW29dBekT0qT7bfBYWAmLjuIBaQpE9ApAF15R5uWyl
         87iw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787950218; x=1788555018; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AshsUhDS0njxXs9dy2fBnY4fbd5Y93s1/0Sdvq7L85o=;
        b=q0ILq+1QxLugOz4Za0oV2UzNuGtlRo3e3uZMX3S4VeoAiNXVR0jDvwTKNtsEnBO+M9
         Wyvko5HDw9YRz30bYRUWLPcFqYrVUHezObWQO4VJ3Mp/TBTbu2TZbvVpp0h7iZXWytjh
         3nDvKFyFEBffw9fdbGTEiwNevfmeU5f4BNqc9+iRW08hXP5MkPBAF6IrKaULYWjzYzO7
         oTj94Qtds9aKVGZhK6baKFn1QRpeFgasuisxElWJdvO3yH0E5w3LZUKvsZKTZdz657th
         B5S6pv4DMCi1XQBmcwAA7V1lygfa0pnUiO54adh5TvSgrjoBBz9AENg7Yk+FP+xOi+FR
         cbFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787950218; x=1788555018;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AshsUhDS0njxXs9dy2fBnY4fbd5Y93s1/0Sdvq7L85o=;
        b=sH0Z009NCl65gbYpZo7yFM3MC9kLyITDPQJ3emDjnM+QYekDXgdPWynLrR7EVzLgcq
         oeJnM3uS2jbdL+Z6HFYrZX6PGPaqxFAvDEFHAh9UPbwZa3ZskDjsFQFilZl4BwQV5wZR
         10UUlXY9h/JWhMS4IQ53UJFMjWrHtY/oCGvMZjrbrI0CXrQ54RtTgxlyoV9yvwIbUc8A
         FsgdJjjZIqiR7KXhKLTIBFPCmH7EUv+tbthqLOK6jYUd6gvkkpAXeYCEoPykcwuPpMw6
         doD0bV7+ZCEfJujkdMrRLi/BRURXewXS2fGcyFH5lf0Nyl00MZ0EmgynKk7AUNddOYjK
         YmUg==
X-Forwarded-Encrypted: i=1; AHgh+Rody100+4uCv+bIQpNky32UbbUdv2rJ20kc4yLnSCbD31ZOJsX443tYXPJ8aATeJqNOC+lZDPrjF8X88k3qSp+l@lists.infradead.org
X-Gm-Message-State: AFuF++mADbMJ9sPvf+KIuqi9zgnCODeuU+Mv/mK/W6iw+11R1wN+ZabP
	XQV12/9HWVGaXUNIibKKyLnXtwwwTHUAMGSAqCaukHhZgT6OHkT7B2dy/Dcza7wDbEqWnekfqaG
	qRJYDhV9cS8eVNyJC629l+ig2z+MIvzbzEouHuJYq
X-Gm-Gg: AR+sD10SNPwc36ni7W/M8LiXfDoNWy13toJOqodf7052kD8fDqd21iEXup1FEBFwYl4
	KFT6R6gGPfdsVZkABeIgk5MaohFaYpeukhXXKf2+ddkCLhftgEjfZYPLIo3ITBKtlKcVIzvc3Yy
	Z5DPeClAJommm7hPmt2aIvx01iBff/xJvRN2897g0ljjiRKm0MrBCJP9keMVLHNoXyZ+2dFOTL/
	y0eNVLjwumqLRxjNaffgZIVbhRFBYI8QjRKZXwheuGiR327ByEITMnMHaNH/n41qiJKAEUeW0As
	mJJHFkIEvUotZr3iBaOMlbUZ0NR10PbxBXOI1jUG1YCIPSy55L8Xmma+zcCiNMLYSU3moIxV5pk
	=
X-Received: by 2002:a05:600c:e40b:b0:499:a6a5:a687 with SMTP id
 5b1f17b1804b1-49ccbab90e6mr277105e9.0.1787950217353; Fri, 28 Aug 2026
 13:50:17 -0700 (PDT)
MIME-Version: 1.0
References: <20260827232948.2520558-1-stevensd@google.com> <20260827232948.2520558-7-stevensd@google.com>
 <20260828133620._x2XfJR_@linutronix.de> <20260828135947.GU776954@noisy.programming.kicks-ass.net>
In-Reply-To: <20260828135947.GU776954@noisy.programming.kicks-ass.net>
From: David Stevens <stevensd@google.com>
Date: Fri, 28 Aug 2026 13:50:05 -0700
X-Gm-Features: AcwNN1VyWJkmCojhn4y_J0QYwM3NKcFniOfDcwtOJUcQgsmCVgZZIDC5YzitEe0
Message-ID: <CAOiLmNHrbXeTY7zoNodmaZUoMWf+NgvGvZ_LjfWD-1sKAoiLeQ@mail.gmail.com>
Subject: Re: [RFC 06/10] Reclaim memory from blocked kernel stacks
To: Peter Zijlstra <peterz@infradead.org>
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H . Peter Anvin" <hpa@zytor.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Dave Chinner <david@fromorbit.com>, Qi Zheng <qi.zheng@linux.dev>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Muchun Song <muchun.song@linux.dev>, 
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, K Prateek Nayak <kprateek.nayak@amd.com>, 
	Uladzislau Rezki <urezki@gmail.com>, David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	"Liam R . Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Kees Cook <kees@kernel.org>, 
	Clark Williams <clrkwllms@kernel.org>, suleiman@google.com, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org, 
	linux-rt-devel@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260828_135019_886451_A58F80AD 
X-CRM114-Status: GOOD (  24.17  )
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

On Fri, Aug 28, 2026 at 6:59=E2=80=AFAM Peter Zijlstra <peterz@infradead.or=
g> wrote:
>
> On Fri, Aug 28, 2026 at 03:36:20PM +0200, Sebastian Andrzej Siewior wrote=
:
> > On 2026-08-27 16:29:44 [-0700], David Stevens wrote:
> > > diff --git a/arch/Kconfig b/arch/Kconfig
> > > index fa7507ac8e13..adb4a5957996 100644
> > > --- a/arch/Kconfig
> > > +++ b/arch/Kconfig
> > > @@ -1534,6 +1534,24 @@ config VMAP_STACK
> > >       backing virtual mappings with real shadow memory, and KASAN_VMA=
LLOC
> > >       must be enabled.
> > >
> > > +config HAVE_ARCH_RECLAIMABLE_STACK
> > > +   def_bool n
> > > +
> > > +config RECLAIMABLE_STACK
> > > +   default !PREEMPT_RT && !PROC_KCORE
> >
> > This shouldn't default like this for RT. It either is useable or it is
> > not.
> >
> > > +   bool "Allow stacks of some blocked threads to be reclaimed"
> > > +   depends on VMAP_STACK && !STACK_GROWSUP
> > > +   depends on HAVE_ARCH_RECLAIMABLE_STACK
> > > +   depends on !DEBUG_STACK_USAGE
> > > +   depends on !KASAN_VMALLOC # TODO: add support for this
> > > +   depends on !DEBUG_KMEMLEAK # TODO: add support for this
> > > +   help
> > > +     Enable this to allow the unused portion of kernel stacks of mos=
t
> > > +     blocked tasks to be reclaimed.
> > > +
> > > +     The wakeup latency of tasks with reclaimed stacks may increase,
> > > +     especially while the system is under memory pressure.
> >
> > It says *may* increase and on RT it _definitely_ will increase since
> > there is a kworker involved not to mention the memory allocation itself=
.
> > Anyway. This either needs to stay away from PREEMPT_RT or find a way to
> > exclude at the very least mlock()ed tasks.
> > Did lockdep see this?
>
> It should have. They're taking spinlock inside raw_spinlock and lockdep
> should very much warn about that by default.

It does trylocks on spinlocks and local locks, inside of
alloc_pages_nolock_noprof(). Lockdep considers that safe.

On PREEMPT_RT, it is necessary to skip the call to
alloc_pages_nolock_noprof() from under pi_lock, since with that
configuration spin_trylock can end up needing to take pi_lock. But at
least on !PREEMPT_RT, there is no risk of deadlock.

-David

