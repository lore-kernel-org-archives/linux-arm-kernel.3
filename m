Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8178DCD5BA4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 07:50:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8h8QzQ3bvGW1O7RXX739a+wEI+Rm3n1kyOMDOPSvEn4=; b=YaZIEafodMqGf0nJYChArcxZsa
	yIwZZIdEeYftLpkwWL3wQsmbhAgQ+rJtvAjEjlk2RRFKLKZJFCLV5MKoEF6O0bTDNkvQTYBplWHIS
	64kzqGkIDy4Lab8FLg+cllcEYNT9gJqogW2WKiEKUDFDaaS3G8recqRLfDlXnfWpi/1M9NV9kCFom
	tSE1eTYntY9ZT0QYDQxmok8bS+spMXG7NbuMRGHO1Fk2SVs6vYFSVglSgHHANED2lS7iknLrvFhj2
	J5B398dndKdBBO2bLXr+NGk/Fu4TqaKYewNU3Vs08P9CjzExey+rWzDbI235YRcn3y1L1EAKJGXdV
	oD+CA/VA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPbhD-00000003r5y-4ADL;
	Wed, 20 May 2026 07:50:28 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPbhB-00000003r55-0pht;
	Wed, 20 May 2026 07:50:26 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9B429431C9;
	Wed, 20 May 2026 07:50:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B43D1F00893;
	Wed, 20 May 2026 07:50:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779263424;
	bh=8h8QzQ3bvGW1O7RXX739a+wEI+Rm3n1kyOMDOPSvEn4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=gEybL7aBm3ng+QrbW0I+5Hs8oWbvhLnqN9+2v+IeAKE9ieM9FaKfZzY/r0KtvGAMv
	 UlbzgbPaCjqJHKsyF34JuP43LJBXrfZAZzHDm+DgqhrfaYDvVdJKPK2wZl0LGe4aDV
	 DBmnddYsaubogT9yRSf7C3WuNGyGQjd901PXhgvoWTTKLjmCjQCIVi1K4OqAzSKlXj
	 61TWkO1lsLpElgwhATl1xyR4ojLPcrMK/IY8eJJgK50WvGOcidhzXThsmufAMeqiFt
	 PseREKIwrtV7FeW3hPz53msuOkY9tNmm/x3Njh/sOFlQGLBEaSTgEbViYdNEZovb3M
	 9u5XlFtsz9bdw==
Date: Wed, 20 May 2026 08:50:14 +0100
From: Lorenzo Stoakes <ljs@kernel.org>
To: Barry Song <baohua@kernel.org>
Cc: Suren Baghdasaryan <surenb@google.com>, 
	Matthew Wilcox <willy@infradead.org>, akpm@linux-foundation.org, linux-mm@kvack.org, david@kernel.org, 
	liam@infradead.org, vbabka@kernel.org, rppt@kernel.org, mhocko@suse.com, 
	jack@suse.cz, pfalcato@suse.de, wanglian@kylinos.cn, chentao@kylinos.cn, 
	lianux.mm@gmail.com, kunwu.chan@gmail.com, liyangouwen1@oppo.com, chrisl@kernel.org, 
	kasong@tencent.com, shikemeng@huaweicloud.com, nphamcs@gmail.com, bhe@redhat.com, 
	youngjun.park@lge.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, Nanzhe Zhao <nzzhao@126.com>
Subject: Re: [PATCH v2 0/5] mm: reduce mmap_lock contention and improve page
 fault performance
Message-ID: <ag1mk2DSJsiORaxK@lucifer>
References: <CAGsJ_4w0qcYmukHqsyRd0jomoyYkJjOt8b-Cgp53BgP-8QQghw@mail.gmail.com>
 <afS_L-5XeWIldTXA@casper.infradead.org>
 <CAGsJ_4wk=SDtgin+84Ev2TamU-JFfmrg_SUay=-tcYmnFvK6Nw@mail.gmail.com>
 <afTpoL3FklpQZNMM@casper.infradead.org>
 <CAGsJ_4ysMcrmDLSOwBkf7qwCQrcDWeEMXkHDajTJFMLKUk0bSQ@mail.gmail.com>
 <agrWuDNGddNmvMFD@lucifer>
 <CAGsJ_4zqLfdWoTH9s7FFaqWWj0mESfikYgr7=GcV64qcuXrPxA@mail.gmail.com>
 <CAJuCfpE0WQrB3zJp9qn3jvn5DthS=ttpX7gJJvyEhA_BJGrp5g@mail.gmail.com>
 <agxbq1TxJdniMQT3@lucifer>
 <CAGsJ_4zxyZP_xkFCGWfLyXkqomrX6DNqyMVirk=aggtwB1zExw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGsJ_4zxyZP_xkFCGWfLyXkqomrX6DNqyMVirk=aggtwB1zExw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_005025_281184_92F98EBD 
X-CRM114-Status: GOOD (  37.17  )
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

On Wed, May 20, 2026 at 05:18:52AM +0800, Barry Song wrote:
> On Tue, May 19, 2026 at 8:53 PM Lorenzo Stoakes <ljs@kernel.org> wrote:
> >
> > On Mon, May 18, 2026 at 12:56:59PM -0700, Suren Baghdasaryan wrote:
> >
> > > >
> > > > I think we either need to fix `fork()`, or keep the current
> > > > behavior of dropping the VMA lock before performing I/O.
> > >
> > > I see. So, this problem arises from the fact that we are changing the
> > > pagefaults requiring I/O operation to hold VMA lock...
> > > And you want to lock VMA on fork only if vma_is_anonymous(vma) ||
> > > is_cow_mapping(vma->vm_flags). So, we will be blocking page faults for
> > > anonymous and COW VMAs only while holding mmap_write_lock, preventing
> > > any VMA modification. On the surface, that looks ok to me but I might
> > > be missing some corner cases. If nobody sees any obvious issues, I
> > > think it's worth a try.
> >
> > Not sure if you noticed but I did raise concerns ;)
> >
> > I wonder if you've confused the fault path and fork here, as I think Barry has
> > been a little unclear on that.
>
> I think I’ve been absolutely clear :-)

On this point sure, I would argue less so around the fork stuff but I responded
on that specifically elsewhere so let's keep things moving :>)

> We should either stick to the current behavior - drop
> the VMA lock before doing I/O, or change fork() so that it
> does not wait on vma_start_write().

Again, as I said elsewhere, I think there might be a 3rd way possibly. It's a
big mistake to assume that there are only specific solutions to problems in the
kernel then to present a false dichotomy.

We absolutely hear you on this being a problem and it WILL be addressed one way
or another.

Of the two approaches, as I said elsewhere, I prefer what you've done in this
series to anything touching fork.

But give me time to look through the series please (I'd also suggest RFC'ing
when it's something kinda fundamental that might generate converastion, makes
life a bit easier on the review side :)

>
> Before per-VMA locks, page faults dropped mmap_lock before
> doing I/O. After per-VMA locks, page faults dropped the
> VMA lock before doing I/O. In both cases, fork() would not
> wait for I/O in the page-fault path.
>
> Now you guys are suggesting performing I/O while holding
> the VMA lock, which means fork() must wait for that I/O to
> complete. Since an application can have more than 1000
> VMAs, and I/O can be stalled for an unpredictable amount
> of time in the bio/request queue or filesystem GC, fork()
> could end up blocked on multiple VMAs while taking
> vma_start_write() for each of them.
>
> As a result, fork() could hold mmap_lock for a very, very,
> very long time. fork() itself would become extremely slow,
> and any other task needing mmap_lock would also be blocked
> behind it.

Yep aware, we spoke in Zagreb about this, and on this thread, we know :)

>
> >
> > What's being suggested in this thread is to fundamentally change fork behaviour
> > so it's different from the entire history of the kernel (or - presumably - at
> > least recent history :) and permit concurrent page faults to occur on a forking
> > process.
> >
> > I absolutely object to this for being pretty crazy. I mean I'm not sure we
> > really want to be simultaneously modifying page tables while invoking
> > copy_page_range()? No?
>
> If you object to touching fork(), can you at least accept
> keeping the existing behavior of dropping the VMA lock
> before doing I/O? If you object to both approaches, then I
> really do not know how we can continue :-)

Again as per above, let's not impose a false dichtomy, let's take our time, and
specifically - please give me time to read through the series and think about
this.

>
> Thanks
> Barry

Thanks, Lorenzo

