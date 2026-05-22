Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE2C2CD5BB0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 May 2026 15:38:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ue6+BrgA5cCiK29yEQFjVEW/61iWgshQWpISoK0a5mo=; b=1h9Yd5eFd2YlaNLK2seIDDXuT5
	XNai689qgl0SHCxCDi9Dc5FmrImKtX2cWt7AGsECTeZqwCZ7wSqjJhQ/Rm4AKslsi/oVmqWehmwFC
	siF+rtPcdzJNrXxu5nxaQov7y2k75ydnZb0dqVz33mBDHRYABJmge7L0u742fZuo1ou3Rhw0hT5UQ
	GHsUGKbZzhPKuKJw+fxEn9KoKT1JRTNHxWzsYdIqd8Zl03lDCTo+IGfWlKqi6f2ph4K2DDCPp2Bfq
	xcGkByTlEV+tP3Z+JoNOhYSrGjY8c1Jz45VI6mtUcTgbwIiHZPezBuf6Iz974eIknkVin4LU4wjYd
	JLFQE3NQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQRws-0000000BHHE-23la;
	Fri, 22 May 2026 15:38:06 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQRwq-0000000BHGD-2Exr;
	Fri, 22 May 2026 15:38:05 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id DE1CE41738;
	Fri, 22 May 2026 15:38:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4206E1F000E9;
	Fri, 22 May 2026 15:37:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779464283;
	bh=Ue6+BrgA5cCiK29yEQFjVEW/61iWgshQWpISoK0a5mo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=e3S85iit9E//Da14omyK4sSzq5E+5P6CirUlrWrNKkWRCr0gH3q2SRSlfFihqMpFf
	 lNIJ+Ym6rgTd0CfoB7Pca50HGx7yg/Kc5w/2lEe4qOmRDVIKJHaZ2mwp0lyokkwzMM
	 6vLSr5NafsQy9TfFAYNw8jc2lOZNyREETBaXhqe0wsF6vVu5L5ph14ppOzYFh+6m+v
	 gJ/dcbqjjuTKEbZXZCc79Pa0JwpRwFDh/QUW0F5E1DEDjYhtDdgK1JyVd4OtmokLSn
	 On0u89WSmNioM38n363WRHRzMjaBZLPk3SQhu/mA8NqmleLSnwm2/5ltuBOTzidZnQ
	 dj5LZD2lAZZXQ==
Date: Fri, 22 May 2026 16:37:54 +0100
From: Lorenzo Stoakes <ljs@kernel.org>
To: Yang Shi <shy828301@gmail.com>
Cc: "David Hildenbrand (Arm)" <david@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Barry Song <baohua@kernel.org>, 
	Matthew Wilcox <willy@infradead.org>, akpm@linux-foundation.org, linux-mm@kvack.org, 
	liam@infradead.org, vbabka@kernel.org, rppt@kernel.org, mhocko@suse.com, 
	jack@suse.cz, pfalcato@suse.de, wanglian@kylinos.cn, chentao@kylinos.cn, 
	lianux.mm@gmail.com, kunwu.chan@gmail.com, liyangouwen1@oppo.com, chrisl@kernel.org, 
	kasong@tencent.com, shikemeng@huaweicloud.com, nphamcs@gmail.com, bhe@redhat.com, 
	youngjun.park@lge.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, Nanzhe Zhao <nzzhao@126.com>
Subject: Re: [PATCH v2 0/5] mm: reduce mmap_lock contention and improve page
 fault performance
Message-ID: <ahB3DSwipVXw6tmK@lucifer>
References: <afS_L-5XeWIldTXA@casper.infradead.org>
 <CAGsJ_4wk=SDtgin+84Ev2TamU-JFfmrg_SUay=-tcYmnFvK6Nw@mail.gmail.com>
 <afTpoL3FklpQZNMM@casper.infradead.org>
 <CAGsJ_4ysMcrmDLSOwBkf7qwCQrcDWeEMXkHDajTJFMLKUk0bSQ@mail.gmail.com>
 <agrWuDNGddNmvMFD@lucifer>
 <CAGsJ_4zqLfdWoTH9s7FFaqWWj0mESfikYgr7=GcV64qcuXrPxA@mail.gmail.com>
 <CAJuCfpE0WQrB3zJp9qn3jvn5DthS=ttpX7gJJvyEhA_BJGrp5g@mail.gmail.com>
 <agxbq1TxJdniMQT3@lucifer>
 <e6d1017a-e4c5-493e-bfca-932c6d64eaac@kernel.org>
 <CAHbLzkq3S7NDYe4LXjurKNQU+40-wtqrD_PT18YcyHbAcNxiRQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHbLzkq3S7NDYe4LXjurKNQU+40-wtqrD_PT18YcyHbAcNxiRQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_083804_618814_F1B4DFAA 
X-CRM114-Status: GOOD (  40.17  )
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

On Wed, May 20, 2026 at 02:39:49PM -0700, Yang Shi wrote:
> On Wed, May 20, 2026 at 3:34 AM David Hildenbrand (Arm)
> <david@kernel.org> wrote:
> >
> > On 5/19/26 14:53, Lorenzo Stoakes wrote:
> > > On Mon, May 18, 2026 at 12:56:59PM -0700, Suren Baghdasaryan wrote:
> > >
> > >>>
> > >>> I think we either need to fix `fork()`, or keep the current
> > >>> behavior of dropping the VMA lock before performing I/O.
> > >>
> > >> I see. So, this problem arises from the fact that we are changing the
> > >> pagefaults requiring I/O operation to hold VMA lock...
> > >> And you want to lock VMA on fork only if vma_is_anonymous(vma) ||
> > >> is_cow_mapping(vma->vm_flags). So, we will be blocking page faults for
> > >> anonymous and COW VMAs only while holding mmap_write_lock, preventing
> > >> any VMA modification. On the surface, that looks ok to me but I might
> > >> be missing some corner cases. If nobody sees any obvious issues, I
> > >> think it's worth a try.
> > >
> > > Not sure if you noticed but I did raise concerns ;)
> > >
> > > I wonder if you've confused the fault path and fork here, as I think Barry has
> > > been a little unclear on that.
> > >
> > > What's being suggested in this thread is to fundamentally change fork behaviour
> > > so it's different from the entire history of the kernel (or - presumably - at
> > > least recent history :)
> > I don't want fork() to become different in that regard.
> >
> > There is already a slight difference with vs. without per-VMA locks, because
> > there is a window in-between us taking the write mmap_lock and all the per-VMA
> > locks. I raised that previously [1] and assumed that it is probably fine.
> >
> > I also raised in the past why I think we must not allow concurrent page faults,
> > at least as soon as anonymous memory is involved [2].
>
> Thanks for sharing the context, it is quite helpful to understand the
> race conditions. Because Lorenzo also raised the concern about page
> fault race, I will reply to all the concerns regarding page fault race
> together in this thread.
>
> IIUC, there is already some sort of race with per vma lock. Before per
> vma lock, mmap_lock did lock everything. So page fault happened either
> before fork or after fork. But page fault can happen on other VMAs
> which have not been lock'ed yet during fork with per vma lock. For
> example, we have 3 VMAs, we lock the first VMA, but page fault still
> can happen on the other 2 VMAs during fork if they already have
> anon_vma. This is the status quo now, but it seems not harmful.
>
> The bad race shared by David is caused by racing with copy page. So it
> seems like it will be fine as long as we serialize copy page against
> page fault if I don't miss anything. Since we decide whether to copy
> page or not by checking vma->anon_vma, so it seems fine to not take
> vma lock if vma->anon_vma is NULL. This will not introduce more race
> either because setting up a new  anon_vma in page fault or madvise
> requires taking mmap_lock according to the earlier discussions.

NAK. No.

We're not doing this, we're not changing how fork fundamentally behaves because
of concerns about the fault path.

I've delineated exactly why I think this is a problem and you're pressing ahead
without addressing those concerns.

So at this point I'm going to be a grumpy maintainer and just say no, stop
please :)

Let's fix this in the right place. You don't fix a leak in the roof by repairing
a shelf next door :)

Thanks, Lorenzo


>
> Thanks,
> Yang
>
> >
> > ... and I raised that this is pretty much slower by design right now: "Well, the
> > design decision that CONFIG_PER_VMA_LOCK made for now to make page faults fast
> > and to make blocking any page faults from happening to  be slower ..." [3]
> >
> > [1] https://lore.kernel.org/all/970295ab-e85d-7af3-76e6-df53a5c52f8b@redhat.com/
> > [2] https://lore.kernel.org/all/7e3f35cc-59b9-bf12-b8b1-4ed78223844a@redhat.com/
> > [3] https://lore.kernel.org/all/2efa2c89-3765-721d-2c3c-00590054aa5b@redhat.com/
> >
> > --
> > Cheers,
> >
> > David
> >

