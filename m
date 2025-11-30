Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D1E0D116E2
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 30 Nov 2025 00:28:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xdkwplQZXP7FjFnU+v366rZ413pi5bTQ7R9T4YIrwjA=; b=rhRgwMwHQhuYRj6E/cFpQWHIgg
	kLaqLusKCCorhTxPba8GWdZMlQbYXHrGgbHrbPlHfzDwkW/uDYk9ItQpQsXczckG5qVwBAQS7uCUU
	dxmX7Pe+zgzZw1M2r5aHp6hlI43Yo7jErG1V5Roa+7MVBPbQM6mVk1Drt8+gCXJZijeilEm57Y+bp
	+C1QPkG9JXeFUuUKPK1sLvjDXpkfDU2m2S70aq3KpppoVKWhM2XBCOv+M8oVmlVBoMv4vGQg236dw
	IJ0/z0gv0crvcNOnjFLjErW48/TQSWyGlbuWk3S8cyYgTTsz196Eb3u8gmz5pwUfRCeLSpkPY0Lu1
	QwHuEKVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPVIb-00000001thu-0rCv;
	Sun, 30 Nov 2025 00:28:21 +0000
Received: from mail-qt1-x836.google.com ([2607:f8b0:4864:20::836])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPVIX-00000001th0-3hUT
	for linux-arm-kernel@lists.infradead.org;
	Sun, 30 Nov 2025 00:28:19 +0000
Received: by mail-qt1-x836.google.com with SMTP id d75a77b69052e-4ed67a143c5so942201cf.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 29 Nov 2025 16:28:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764462494; x=1765067294; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xdkwplQZXP7FjFnU+v366rZ413pi5bTQ7R9T4YIrwjA=;
        b=hVqr6tJZNcKCpPoSRkFx1N5VVBA9hkY4puhaai3xb6vhrdBW4cX2mS3mz5WQhJZVKb
         XnjuPJmiFceI9+c3UCkFH0JMfo6zA7PZhnBTH62epBYuz1+i96U8Grwz5O5pteGAdwuJ
         2YxLtWw4clEp8M5LXxc39U1ZR2rcN01Zv6eOTo/f4ZyxV0NJYggigguPo/oM3npt4BQD
         mHQ9M9vdFaQIBcc3FtBFhoQp1NgmFdd85mqYhv8NhvGYxBhllgWxTJXO2Gg+p4O9y2OH
         Y8O7UHq6expCiwuCTP2IGLMdXVWtVGu9BUjpFDfHEZggeDmQy3587g9v50IbNAlvcItk
         tlGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764462494; x=1765067294;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xdkwplQZXP7FjFnU+v366rZ413pi5bTQ7R9T4YIrwjA=;
        b=Pl56Ge3vAxC1e/ySnISy2qtjpq2IUkp4gdCqlZ8sSrvQ9rXweb2rK0PGtdpEiM7f1W
         0uOpgSuZcqIbO++XbAXLIOeSjtb26qRw1Q0vqPv10P/8+fLu80qe1NHu4G0PbQsYURGg
         pJUzVecAIEeJHmeqzPdscDRVn65fK3ceST+5Q/Xs2Of1dzW5FJ2Cj3tRkmgOS/1aPo50
         hWk+LF+P1c4hdE00uL7cQxF817O/hykzgus4eWvh/JNH0dq+c4hFTy0DFWIMZMWHI+Kr
         V4f3T66tCXu/7QCVp4oIBYmmn6dwjIo2kauEdKYG2xAKrOYXxBYsrquG4oBZpgGjuiL0
         7fdg==
X-Forwarded-Encrypted: i=1; AJvYcCUI8RaHncNeVlPGp+HoSchFDJ14cU7UZc01M1zR3VAGeBVLooSko6NSebAl3r8PjYT/GxQw/708xAyDBmk928lA@lists.infradead.org
X-Gm-Message-State: AOJu0Yw4TBgGnNNWRqHhMuh39sUClyiHTMvHxJ8Ogx0Q3uCMAG1Jl/0Y
	3QDn+KcDhRap9oaqBicKvUMg1E+tNaUPzRVzCfREzMUnuNiFUtgVUVk/LhVrI6eBDougwDGGUBF
	dgV4hJ77537zlq6L4yc3lL6sCFY0klUQp73qOchWC
X-Gm-Gg: ASbGncsTx2ur5lrBfvmY+xvc4XF5ySx5sLsZZ5w4uXx0TdtJ8lEoOuSBEGliMdPlOhK
	5FTzAfRk+8z2xtdDaTNbnwK/VCR+9y6nUtSP1BZYDpFNYvKr5TCNb+iPe9ag8mUWxxBRy5UfPIp
	XRYEy67uKN46ic+igy+CQwbVXAQJDXEXNdWanIC+Jnzk5wIOhBMh6vkGqZ8qn70Nio+srJWfGvM
	3ns9oBhpy6jDcHRW4y3oVidN1Ix0hTZJqy5bfozM4LwjRv77cCkd2g2t4asbDdThenZVyCiiunj
	Apo=
X-Google-Smtp-Source: AGHT+IHVf3jUEElcRU5UiElII1poREaWD5vAdlvPdSkAXo0sG8wTVz/TvP7Aj2pleN+SVZmwr5KEBBbORX+cZ2IR4bw=
X-Received: by 2002:a05:622a:41:b0:4ed:7c45:9908 with SMTP id
 d75a77b69052e-4efd0ca4d05mr10929131cf.10.1764462494131; Sat, 29 Nov 2025
 16:28:14 -0800 (PST)
MIME-Version: 1.0
References: <20251127011438.6918-1-21cnbao@gmail.com> <aSfO7fA-04SBtTug@casper.infradead.org>
 <CAGsJ_4zyZeLtxVe56OSYQx0OcjETw2ru1FjZjBOnTszMe_MW2g@mail.gmail.com>
 <aSip2mWX13sqPW_l@casper.infradead.org> <CAGsJ_4zWGYiu1wv=D7bV5zd0h8TEHTCARhyu_9_gL36PiNvbHQ@mail.gmail.com>
In-Reply-To: <CAGsJ_4zWGYiu1wv=D7bV5zd0h8TEHTCARhyu_9_gL36PiNvbHQ@mail.gmail.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Sat, 29 Nov 2025 18:28:01 -0600
X-Gm-Features: AWmQ_blhKzVTz_OrE9p2RQX3OU7BXlogLE0D_GARspeRWjGy1hzzkkEbN5F-bD8
Message-ID: <CAJuCfpFVQJtvbj5fV2fmm4APhNZDL1qPg-YExw7gO1pmngC3Rw@mail.gmail.com>
Subject: Re: [RFC PATCH 0/2] mm: continue using per-VMA lock when retrying
 page faults after I/O
To: Barry Song <21cnbao@gmail.com>
Cc: Matthew Wilcox <willy@infradead.org>, akpm@linux-foundation.org, linux-mm@kvack.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251129_162817_984882_D95A57BF 
X-CRM114-Status: GOOD (  44.85  )
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

On Thu, Nov 27, 2025 at 2:29=E2=80=AFPM Barry Song <21cnbao@gmail.com> wrot=
e:
>
> On Fri, Nov 28, 2025 at 3:43=E2=80=AFAM Matthew Wilcox <willy@infradead.o=
rg> wrote:
> >
> > [dropping individuals, leaving only mailing lists.  please don't send
> > this kind of thing to so many people in future]
> >
> > On Thu, Nov 27, 2025 at 12:22:16PM +0800, Barry Song wrote:
> > > On Thu, Nov 27, 2025 at 12:09=E2=80=AFPM Matthew Wilcox <willy@infrad=
ead.org> wrote:
> > > >
> > > > On Thu, Nov 27, 2025 at 09:14:36AM +0800, Barry Song wrote:
> > > > > There is no need to always fall back to mmap_lock if the per-VMA
> > > > > lock was released only to wait for pagecache or swapcache to
> > > > > become ready.
> > > >
> > > > Something I've been wondering about is removing all the "drop the M=
M
> > > > locks while we wait for I/O" gunk.  It's a nice amount of code remo=
ved:
> > >
> > > I think the point is that page fault handlers should avoid holding th=
e VMA
> > > lock or mmap_lock for too long while waiting for I/O. Otherwise, thos=
e
> > > writers and readers will be stuck for a while.
> >
> > There's a usecase some of us have been discussing off-list for a few
> > weeks that our current strategy pessimises.  It's a process with
> > thousands (maybe tens of thousands) of threads.  It has much more mappe=
d
> > files than it has memory that cgroups will allow it to use.  So on a
> > page fault, we drop the vma lock, allocate a page of ram, kick off the
> > read, sleep waiting for the folio to come uptodate, once it is return,
> > expecting the page to still be there when we reenter filemap_fault.
> > But it's under so much memory pressure that it's already been reclaimed
> > by the time we get back to it.  So all the threads just batter the
> > storage re-reading data.
>
> Is this entirely the fault of re-entering the page fault? Under extreme
> memory pressure, even if we map the pages, they can still be reclaimed
> quickly?
>
> >
> > If we don't drop the vma lock, we can insert the pages in the page tabl=
e
> > and return, maybe getting some work done before this thread is
> > descheduled.
>
> If we need to protect the page from being reclaimed too early, the fix
> should reside within LRU management, not in page fault handling.
>
> Also, I gave an example where we may not drop the VMA lock if the folio i=
s
> already up to date. That likely corresponds to waiting for the PTE mappin=
g to
> complete.
>
> >
> > This use case also manages to get utterly hung-up trying to do reclaim
> > today with the mmap_lock held.  SO it manifests somewhat similarly to
> > your problem (everybody ends up blocked on mmap_lock) but it has a
> > rather different root cause.
> >
> > > I agree there=E2=80=99s room for improvement, but merely removing the=
 "drop the MM
> > > locks while waiting for I/O" code is unlikely to improve performance.
> >
> > I'm not sure it'd hurt performance.  The "drop mmap locks for I/O" code
> > was written before the VMA locking code was written.  I don't know that
> > it's actually helping these days.
>
> I am concerned that other write paths may still need to modify the VMA, f=
or
> example during splitting. Tail latency has long been a significant issue =
for
> Android users, and we have observed it even with folio_lock, which has mu=
ch
> finer granularity than the VMA lock.

Another corner case we need to consider is when there is a large VMA
covering most of the address space, so holding a VMA lock during IO
would resemble holding an mmap_lock, leading to the same issue that we
faced before "drop mmap locks for I/O". We discussed this with Matthew
in the context of the problem he mentioned (the page is reclaimed
before page fault retry happens) with no conclusion yet.

>
> >
> > > The change would be much more complex, so I=E2=80=99d prefer to land =
the current
> > > patchset first. At least this way, we avoid falling back to mmap_lock=
 and
> > > causing contention or priority inversion, with minimal changes.
> >
> > Uh, this is an RFC patchset.  I'm giving you my comment, which is that =
I
> > don't think this is the right direction to go in.  Any talk of "landing=
"
> > these patches is extremely premature.
>
> While I agree that there are other approaches worth exploring, I
> remain entirely unconvinced that this patchset is the wrong
> direction. With the current retry logic, it substantially reduces
> mmap_lock acquisitions and represents a clear low-hanging fruit.
>
> Also, I am not referring to landing the RFC itself, but to a subsequent f=
ormal
> patchset that retries using the per-VMA lock.

I don't know if this direction is the right one but I agree with
Matthew that we should consider alternatives before adopting a new
direction. Hopefully we can find one fix for both problems rather than
fixing each one in isolation.

>
> Thanks
> Barry
>

