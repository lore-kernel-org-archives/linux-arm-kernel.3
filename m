Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1694CCD4F5B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 13:42:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s52T8OnJdKYXI50uhhF0DnRneaRKJPrHl5f5Mp7KVPE=; b=vaZ9kMD/BVVPSKkmxbn3lgjiMK
	knHWljX8AEcP6+VHe6WxBI2X9yLp5T1QiSnO9UtSeHYe8mdiSP49RHfK+TWHMzrOolqKDPPkpCQcg
	dE157iK0lQrYrpJwt8Vye8ziQRjf6O+zC8uh40UFyRYLWOMU8V+zL//9waugoTtJUprxtocKwQRdb
	WORAKlQtcgIB+ePEYIegk2Twbv+xGw7xrEMAFAVQCuzW9KQnFVXyWg4s5qftT4iI1fOwUOffZpTab
	vO7Zv57VGymMlWJMQbyq5bI1yyINA4LZDbERTH2/bGehD0C7lPJG2ZhSKB5mIOPlE4DO0OXLR6SDB
	xWJKKWSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPKiH-00000001hV8-0fdX;
	Tue, 19 May 2026 13:42:25 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPKiE-00000001hUN-3d0g;
	Tue, 19 May 2026 13:42:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 332C041984;
	Tue, 19 May 2026 13:42:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11DB5C2BCB3;
	Tue, 19 May 2026 13:42:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779198142;
	bh=EdZVTx8mq/+o6OdrLkwiHGmu7Bazb8bJvDYV4PghBGo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CxN08qtpOBJ8IAiYT1NGbATSMveN2VuvCz+XRydDhhXI+x5QqjrTyhe5UIS691Kb2
	 bS9w1ztocYeYGUfpqcashfOVc/Pb/0rjFRC4zdEfjCwigY5cmMMgpzI1gKRdtA3pI4
	 v/VV+NqUVSeovPsja64sp9wWP72hVhslEn03pxycaef5UGhc7dYBhy2FZ2/Av0j3h0
	 1dh5UBOVeGESCRqbxSUbKDq9gTnfNXjfMTy6NPbKLtEkxHtIHeWDfR+iPX1ZvW7L/h
	 LBrO+E3xuhU/cNw3kbOQoavYiADtcJMriOizeGdr3j5sT3HlIxKigegez3GS/kKTHd
	 Rpyd30xJMvmFw==
Date: Tue, 19 May 2026 14:42:11 +0100
From: Lorenzo Stoakes <ljs@kernel.org>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Barry Song <baohua@kernel.org>, Matthew Wilcox <willy@infradead.org>, 
	surenb@google.com, akpm@linux-foundation.org, linux-mm@kvack.org, 
	liam@infradead.org, vbabka@kernel.org, rppt@kernel.org, mhocko@suse.com, 
	jack@suse.cz, pfalcato@suse.de, wanglian@kylinos.cn, chentao@kylinos.cn, 
	lianux.mm@gmail.com, kunwu.chan@gmail.com, liyangouwen1@oppo.com, chrisl@kernel.org, 
	kasong@tencent.com, shikemeng@huaweicloud.com, nphamcs@gmail.com, bhe@redhat.com, 
	youngjun.park@lge.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, Nanzhe Zhao <nzzhao@126.com>
Subject: Re: [PATCH v2 0/5] mm: reduce mmap_lock contention and improve page
 fault performance
Message-ID: <agxok1UzYWhLu06G@lucifer>
References: <20260430040427.4672-1-baohua@kernel.org>
 <afNM-gIqxpyJ6ro7@casper.infradead.org>
 <CAGsJ_4w0qcYmukHqsyRd0jomoyYkJjOt8b-Cgp53BgP-8QQghw@mail.gmail.com>
 <afS_L-5XeWIldTXA@casper.infradead.org>
 <CAGsJ_4wk=SDtgin+84Ev2TamU-JFfmrg_SUay=-tcYmnFvK6Nw@mail.gmail.com>
 <afTpoL3FklpQZNMM@casper.infradead.org>
 <CAGsJ_4ysMcrmDLSOwBkf7qwCQrcDWeEMXkHDajTJFMLKUk0bSQ@mail.gmail.com>
 <b65722ee-6476-4038-bfbb-44a32b3544fd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b65722ee-6476-4038-bfbb-44a32b3544fd@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_064222_954355_6E81DB77 
X-CRM114-Status: GOOD (  35.17  )
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

On Mon, May 18, 2026 at 11:53:37AM +0200, David Hildenbrand (Arm) wrote:
> On 5/17/26 10:45, Barry Song wrote:
> > On Sat, May 2, 2026 at 1:58 AM Matthew Wilcox <willy@infradead.org> wrote:
> >>
> >> On Sat, May 02, 2026 at 01:44:34AM +0800, Barry Song wrote:
> >>>
> >>> It doesn’t have to involve unmapping or applying mprotect to
> >>> the entire VMA—just a portion of it is sufficient.
> >>
> >> Yes, but that still fails to answer "does this actually happen".  How much
> >> performance is all this complexity in the page fault handler buying us?
> >> If you don't answer this question, I'm just going to go in and rip it
> >> all out.
> >>
> >
> > Hi Matthew (and Lorenzo, Jan, and anyone else who may be
> > waiting for answers),
> >
> > As promised during LSF/MM/BPF, we conducted thorough
> > testing on Android phones to determine whether performing
> > I/O in `filemap_fault()` can block `vma_start_write()`.
> > I wanted to give a quick update on this question.
> >
> > Nanzhe at Xiaomi created tracing scripts and ran various
> > applications on Android devices with I/O performed under
> > the VMA lock in `filemap_fault()`. We found that:
> >
> > 1. There are very few cases where unmap() is blocked by
> >    page faults. I assume this is due to buggy user code
> >    or poor synchronization between reads and unmap().
> > So I assume it is not a problem.
> >
> > 2. We observed many cases where `vma_start_write()`
> >    is blocked by page-fault I/O in some applications.
> >    The blocking occurs in the `dup_mmap()` path during
> >    fork().
> >
> > With Suren's commit fb49c455323ff ("fork: lock VMAs of
> > the parent process when forking"), we now always hold
> > `vma_write_lock()` for each VMA. Note that the
> > `mmap_lock` write lock is also held, which could lead to
> > chained waiting if page-fault I/O is performed without
> > releasing the VMA lock.
> >
> > My gut feeling is that Suren's commit may be overshooting,
> > so my rough idea is that we might want to do something like
> > the following (we haven't tested it yet and it might be
> > wrong):
> >
> > diff --git a/mm/mmap.c b/mm/mmap.c
> > index 2311ae7c2ff4..5ddaf297f31a 100644
> > --- a/mm/mmap.c
> > +++ b/mm/mmap.c
> > @@ -1762,7 +1762,13 @@ __latent_entropy int dup_mmap(struct mm_struct
> > *mm, struct mm_struct *oldmm)
> >         for_each_vma(vmi, mpnt) {
> >                 struct file *file;
> >
> > -               retval = vma_start_write_killable(mpnt);
> > +               /*
> > +                * For anonymous or writable private VMAs, prevent
> > +                * concurrent CoW faults.
> > +                */
> > +               if (!mpnt->vm_file || (!(mpnt->vm_flags & VM_SHARED) &&
> > +                                       (mpnt->vm_flags & VM_WRITE)))
> > +                       retval = vma_start_write_killable(mpnt);
>
> Likely is_cow_mapping() is what you would want to check to handle VMAs that
> could have anonymous pages in them.

Yes :) I made pretty much the same comment though I forgot the correct helper :P

>
> --
> Cheers,
>
> David

Cheers, Lorenzo

