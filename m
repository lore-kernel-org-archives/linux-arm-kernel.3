Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9BD5CFD2F6
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 30 Nov 2025 02:56:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+XJGr14VL/NvhNbPuU96ozt3/FF8toa21mCuIzcZISc=; b=ffBRHSCpLqwUTBvtpz2ustwdVP
	5D0+tyQ5m4H65fGBYT0wRLVYQK7baqzgPjHzO6ft0Kc0z5xcEKDTs9Uw+TACwk1mAG23iBZCFD9N3
	DTF0LsTr/0bCTi+Qo6W29IbVaEk0NbUlfidAVAVcDYUWJIFBIJBFAo88tw9Rt3t5gXX3ZESv9Na6j
	JZFGpjTyD+iGYN5Hl6+AWlRpYAE4fvsiN05MoX8zgMuv5z0uny3nNB/YWZSkpMs53zTQjkglYURKe
	QFzW7hueZ+d0zybJaw2r4INgU1X0riynUNXw4lNoeoXfub4bv72ZQoLHiE1r3edo1ERbmu0kDe0V4
	LnUy1taA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPXc4-00000001yNj-3NZJ;
	Sun, 30 Nov 2025 02:56:36 +0000
Received: from mail-qk1-x730.google.com ([2607:f8b0:4864:20::730])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPXc1-00000001yMy-2JfI
	for linux-arm-kernel@lists.infradead.org;
	Sun, 30 Nov 2025 02:56:35 +0000
Received: by mail-qk1-x730.google.com with SMTP id af79cd13be357-8b2148ca40eso371172585a.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 29 Nov 2025 18:56:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764471392; x=1765076192; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+XJGr14VL/NvhNbPuU96ozt3/FF8toa21mCuIzcZISc=;
        b=J2ni/hSNdbL+5eQSi39uR9BAAsOAAibSr3NAKa+UuTqN1nAHlOQnt51wgbGkrcs1o8
         dehtLqA+tg+FL0JbKoivA0utB1ochkXV8iPftL0VxoFKlRLiq9S1cy1dRb2/Q4Q6Qtxp
         KXiS+1+4AamCA5oeP7oICNkg5UL/8yDoUbvrBA8Dm2dl01m9N3aXkFqzO/Vc1oq9y0ga
         6SvxdFwZtS5RrFC7fmo63sEhvOdFxVft1cbrzhR7yj7wbK2X/yTQOGsmlPszHwI2uLCQ
         IYkR0LgLbMoZeNohTbAkhPQWU3LSp0x49w0F1wCFlgDTkOqPs6/ziNO1tIzi9g14cxL3
         QImw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764471392; x=1765076192;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+XJGr14VL/NvhNbPuU96ozt3/FF8toa21mCuIzcZISc=;
        b=EYyaoBfJ7X9VEsjulkcw+dvXNcaQcWdBNJGMGmvYBoE+WYHgp4Gpf7cRgGv4k9akyR
         cRhk67e9vcAtl0hhS9ZbVqKTVrSptWFLDsLpr0NeuGDfMjaIe97ZJO+A/gCGcKk7QgzQ
         QlykIQd3ujE/fJFRa8u4D6IzHhVvs34JstA2WjRqc2lRH0vtkhDKC3od752BJu6gvsFR
         idVRk1PTpfto1YvFf3YQqi8wKdm1/NTZG7VwfiIofA2LLB+kKV8Q+68VVYUvtsBcRobF
         goilrkdHg0faMR87QLv/hfzgOqhls80F+hDXiShY6K7OkpO3iafUpOESGOaZHwzjsIAy
         1HWw==
X-Forwarded-Encrypted: i=1; AJvYcCXlSCXH5OoarQTNsao5ovse2eOJZ6Ud7Ee7GzuRyneoaHZdbdMj33kAHtSszw2ximPlpGODAPeA99OByYSQ1rIc@lists.infradead.org
X-Gm-Message-State: AOJu0YyBPXPZUIzm8MB+wJe5Q6tzYCxMfNSPPcPofTHyF+iZFpiuYM/j
	KrZjjCGV4enVQDLk3fsvPORKCu9YAgpUWlwTrN1PFGErFBOQ8nolgCwG706paPbmcqOx0M5a+kG
	ev+3JMMPQCcNdjEOiaKKDPi4o4dqVxD4=
X-Gm-Gg: ASbGncv/+x13/JjHwYdR57QseiTDckT0bbED8lovyycHm8iTE/ucrvgV6G/Pz9viEAr
	rp75JkQDivPXg57wqgEh8zZIJTaMWwXWNPB+ESlZ81kX0NhGX5vgrleowdtlRIjGYMoZv2iac1u
	vShVlBeo6QV6vv+tSyHSDU4au55AchmaY07GrP8v7iVlzXdbhTH63PF3/Omul/PYEkVreBMZHxH
	8bDoj4QnbTDqlRrfrwPmLxlALJVR0GudxRc91LVwvDQBsW5TCCUh1/rPxPMUKwkFOgbLg==
X-Google-Smtp-Source: AGHT+IF/3KjmDnaoo/ldsvPnDlqyF1g2t85SJ38riWFY6aw2+Rx4sE2XTJgJQYrytReWz53k6ueQn63K+Iy7zP31uHo=
X-Received: by 2002:a05:620a:4407:b0:8b2:e565:50b5 with SMTP id
 af79cd13be357-8b33d49a212mr4299108585a.60.1764471391497; Sat, 29 Nov 2025
 18:56:31 -0800 (PST)
MIME-Version: 1.0
References: <20251127011438.6918-1-21cnbao@gmail.com> <aSfO7fA-04SBtTug@casper.infradead.org>
 <CAGsJ_4zyZeLtxVe56OSYQx0OcjETw2ru1FjZjBOnTszMe_MW2g@mail.gmail.com>
 <aSip2mWX13sqPW_l@casper.infradead.org> <CAGsJ_4zWGYiu1wv=D7bV5zd0h8TEHTCARhyu_9_gL36PiNvbHQ@mail.gmail.com>
 <CAJuCfpFVQJtvbj5fV2fmm4APhNZDL1qPg-YExw7gO1pmngC3Rw@mail.gmail.com>
In-Reply-To: <CAJuCfpFVQJtvbj5fV2fmm4APhNZDL1qPg-YExw7gO1pmngC3Rw@mail.gmail.com>
From: Barry Song <21cnbao@gmail.com>
Date: Sun, 30 Nov 2025 10:56:20 +0800
X-Gm-Features: AWmQ_bmtzU1YmYdPvDdBUL-_Xs4w9bVsuxx9pZGnImnoxnlMuoZQMERTeIMRpa0
Message-ID: <CAGsJ_4wnwAet4svDrxT4sTdp24sweAU-2VyYn3iNPOoaKdXxPw@mail.gmail.com>
Subject: Re: [RFC PATCH 0/2] mm: continue using per-VMA lock when retrying
 page faults after I/O
To: Suren Baghdasaryan <surenb@google.com>
Cc: Matthew Wilcox <willy@infradead.org>, akpm@linux-foundation.org, linux-mm@kvack.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251129_185633_616207_128CBEEB 
X-CRM114-Status: GOOD (  50.67  )
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

On Sun, Nov 30, 2025 at 8:28=E2=80=AFAM Suren Baghdasaryan <surenb@google.c=
om> wrote:
>
> On Thu, Nov 27, 2025 at 2:29=E2=80=AFPM Barry Song <21cnbao@gmail.com> wr=
ote:
> >
> > On Fri, Nov 28, 2025 at 3:43=E2=80=AFAM Matthew Wilcox <willy@infradead=
.org> wrote:
> > >
> > > [dropping individuals, leaving only mailing lists.  please don't send
> > > this kind of thing to so many people in future]
> > >
> > > On Thu, Nov 27, 2025 at 12:22:16PM +0800, Barry Song wrote:
> > > > On Thu, Nov 27, 2025 at 12:09=E2=80=AFPM Matthew Wilcox <willy@infr=
adead.org> wrote:
> > > > >
> > > > > On Thu, Nov 27, 2025 at 09:14:36AM +0800, Barry Song wrote:
> > > > > > There is no need to always fall back to mmap_lock if the per-VM=
A
> > > > > > lock was released only to wait for pagecache or swapcache to
> > > > > > become ready.
> > > > >
> > > > > Something I've been wondering about is removing all the "drop the=
 MM
> > > > > locks while we wait for I/O" gunk.  It's a nice amount of code re=
moved:
> > > >
> > > > I think the point is that page fault handlers should avoid holding =
the VMA
> > > > lock or mmap_lock for too long while waiting for I/O. Otherwise, th=
ose
> > > > writers and readers will be stuck for a while.
> > >
> > > There's a usecase some of us have been discussing off-list for a few
> > > weeks that our current strategy pessimises.  It's a process with
> > > thousands (maybe tens of thousands) of threads.  It has much more map=
ped
> > > files than it has memory that cgroups will allow it to use.  So on a
> > > page fault, we drop the vma lock, allocate a page of ram, kick off th=
e
> > > read, sleep waiting for the folio to come uptodate, once it is return=
,
> > > expecting the page to still be there when we reenter filemap_fault.
> > > But it's under so much memory pressure that it's already been reclaim=
ed
> > > by the time we get back to it.  So all the threads just batter the
> > > storage re-reading data.
> >
> > Is this entirely the fault of re-entering the page fault? Under extreme
> > memory pressure, even if we map the pages, they can still be reclaimed
> > quickly?
> >
> > >
> > > If we don't drop the vma lock, we can insert the pages in the page ta=
ble
> > > and return, maybe getting some work done before this thread is
> > > descheduled.
> >
> > If we need to protect the page from being reclaimed too early, the fix
> > should reside within LRU management, not in page fault handling.
> >
> > Also, I gave an example where we may not drop the VMA lock if the folio=
 is
> > already up to date. That likely corresponds to waiting for the PTE mapp=
ing to
> > complete.
> >
> > >
> > > This use case also manages to get utterly hung-up trying to do reclai=
m
> > > today with the mmap_lock held.  SO it manifests somewhat similarly to
> > > your problem (everybody ends up blocked on mmap_lock) but it has a
> > > rather different root cause.
> > >
> > > > I agree there=E2=80=99s room for improvement, but merely removing t=
he "drop the MM
> > > > locks while waiting for I/O" code is unlikely to improve performanc=
e.
> > >
> > > I'm not sure it'd hurt performance.  The "drop mmap locks for I/O" co=
de
> > > was written before the VMA locking code was written.  I don't know th=
at
> > > it's actually helping these days.
> >
> > I am concerned that other write paths may still need to modify the VMA,=
 for
> > example during splitting. Tail latency has long been a significant issu=
e for
> > Android users, and we have observed it even with folio_lock, which has =
much
> > finer granularity than the VMA lock.
>
> Another corner case we need to consider is when there is a large VMA
> covering most of the address space, so holding a VMA lock during IO
> would resemble holding an mmap_lock, leading to the same issue that we
> faced before "drop mmap locks for I/O". We discussed this with Matthew
> in the context of the problem he mentioned (the page is reclaimed
> before page fault retry happens) with no conclusion yet.

Suren, thank you very much for your input.

Right. I think we may discover more corner cases on Android in places
where we previously saw VMA merging, such as between two native heap
mmap areas. This can happen fairly often, and we don=E2=80=99t want long BI=
O
queues to block those writers.

>
> >
> > >
> > > > The change would be much more complex, so I=E2=80=99d prefer to lan=
d the current
> > > > patchset first. At least this way, we avoid falling back to mmap_lo=
ck and
> > > > causing contention or priority inversion, with minimal changes.
> > >
> > > Uh, this is an RFC patchset.  I'm giving you my comment, which is tha=
t I
> > > don't think this is the right direction to go in.  Any talk of "landi=
ng"
> > > these patches is extremely premature.
> >
> > While I agree that there are other approaches worth exploring, I
> > remain entirely unconvinced that this patchset is the wrong
> > direction. With the current retry logic, it substantially reduces
> > mmap_lock acquisitions and represents a clear low-hanging fruit.
> >
> > Also, I am not referring to landing the RFC itself, but to a subsequent=
 formal
> > patchset that retries using the per-VMA lock.
>
> I don't know if this direction is the right one but I agree with
> Matthew that we should consider alternatives before adopting a new
> direction. Hopefully we can find one fix for both problems rather than
> fixing each one in isolation.

As I mentioned in a follow-up reply to Matthew[1], I think the current
approach also helps in cases where pages are reclaimed during retries.
Previously, we required mmap_lock to retry, so any contention made it
hard to acquire and introduced high latency. During that time, pages
could be reclaimed before mmap_lock was obtained. Now that we only
require the per-VMA lock, retries can proceed much more easily than
before.
As long as we replace a big lock with a smaller one, there is less
chance of getting stuck in D state.

If either you or Matthew have a reproducer for this issue, I=E2=80=99d be
happy to try it out.

BTW, we also observed mmap_lock contention during MGLRU aging. TBH, the
non-RMAP clearing of the PTE young bit does not seem helpful on arm64,
which does not support non-leaf young bits at all. After disabling the
feature below, we found that reclamation used less CPU and ran better.

echo 1 >/sys/kernel/mm/lru_gen/enabled

0x0002 Clearing the accessed bit in leaf page table entries in large
       batches, when MMU sets it (e.g., on x86). This behavior can
       theoretically worsen lock contention (mmap_lock). If it is
       disabled, the multi-gen LRU will suffer a minor performance
       degradation for workloads that contiguously map hot pages,
       whose accessed bits can be otherwise cleared by fewer larger
       batches.

[1] https://lore.kernel.org/linux-mm/CAGsJ_4wvaieWtTrK+koM3SFu9rDExkVHX5eUw=
YiEotVqP-ndEQ@mail.gmail.com/

Thanks
Barry

