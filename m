Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 382C2D116EA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Nov 2025 20:29:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BMTw1kDL8EKjTOAtowuEddJlwPoqJdeq89qWoiUPpVg=; b=tv+EtUFDFBbaJAACDTp0qKtqjN
	tBFKHAd14Wi8ASNE0cc+hKnO5s2dw7fILdEIkPeWGbnke928SUw5j0RWXYgKhfT4Wu1zSoG67PzyH
	zrPmqRg75/ZAH6dsY+v2UTOIoF1SPkH1ruuidY+QbkndOcHn3X6V98zdZ1JLQU4e0qK+6mGF6q6Sm
	AmWfM4CbdtIW7AGEsbzKXye2b1bqaEfbgNznhMnK7gJ5VLnY4NJmPClbb2uL2aMSm01cMiF8wA0oK
	qy5CQ20lMv5mMgToCa/s3vCsuxnHhPDIeiNYwTYxZbEcPpubwphgSyw7T0QPIrjxhPq1HvJAes4nc
	qNnneH9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOicN-0000000HC3E-1ARP;
	Thu, 27 Nov 2025 20:29:31 +0000
Received: from mail-qv1-xf2f.google.com ([2607:f8b0:4864:20::f2f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOicL-0000000HC2T-0bo5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Nov 2025 20:29:30 +0000
Received: by mail-qv1-xf2f.google.com with SMTP id 6a1803df08f44-880576ebe38so12295066d6.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Nov 2025 12:29:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764275368; x=1764880168; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BMTw1kDL8EKjTOAtowuEddJlwPoqJdeq89qWoiUPpVg=;
        b=glGu3j/sbwJP9ugyr9ppE0wQSdNNUmPqilAdAs+RYyi0tkB6x/6cXR2xEpyDpwQK0P
         REvHP9dAc9KL+ncaOucm6IkMwIBdBcZa6U+AandaMxyEys//mpHfX/5vdYIzRRXMM7yZ
         QXZ+m2V9csiZpZUqyfzPsYQq5AGoRYiBJiFv6lDuI1ude0Ah2ZSRXEZdRXyAHkyYluwn
         aYKOfeQ9Cbk0nnyUQ9MunYirGxkvCeJT1gdiE43xA8g1T2omz2p+3Y6TgqUngJ6+h5/X
         YbCu9kFq/vMCNqphAFrlW5tFmPPuHQN1uBp31qeiMSWLtmGKlv8ZHRNFNYGJERNzdxIr
         I3mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764275368; x=1764880168;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BMTw1kDL8EKjTOAtowuEddJlwPoqJdeq89qWoiUPpVg=;
        b=hxD4wdj/srJ30tD7uTIdprAjC3+vBo2r2jAtbmJGxVrqZvZMKr/vo8VtlQU7ot6tyN
         M0LQdxOUotaEzTdtVvXG20tYINaozP4TxfPi/0aMKTybGfS8zO/vzYzFBNNvG8PZENJo
         C89LB6UnlGLp9+CQPfuWwVifanm8q+PnjXTb70uoKsGAWHzNiC9s6xCGT1DAor3ywuAl
         8tiPTnTV/IxSiexKz0jh2LvkvZX41Hblr4XAt9o6U5z5zJOltKnPR24T0qJVjrlKolRb
         oYGlRM449kLQbthzqjlA8bWxCDFABOUpgXTo7sOGnlAUUf3OQtTYb3TLHk2iDnD70IIp
         c48w==
X-Forwarded-Encrypted: i=1; AJvYcCUXSXS/CTtx0ZIyUPr2ljzVfpUxBIcmLfvrQKl8NzTqK1tje0VTE0NAa1wXnUTgZgO976dRYD16gjo16Nv/PPDK@lists.infradead.org
X-Gm-Message-State: AOJu0YykDiItXP7TUFTSV+3IJALbsXrniCe8/SKuk9cKjRmEh3ZpPQqz
	KkzEogngX4902RJL7TP1ocnXI82okf2sIhwAw+HDPM/GVYWfdt8if62K9faUg627CTfrwHZRNBd
	bn6SqKWwywScr0eAQ3MZiFTYdP4V6CHg=
X-Gm-Gg: ASbGncuBLoa9XgwhnYJBcc/XDLIVXMvJu/pFog8LaBH8OOpdV0exe0zG8z9Xqcb/uhI
	UOcAxmW6EPSOIzn2qypPD20S5vKWjivoUJxcdO3wyYeqbC1KvCM4iIIkqJz1Ohqd/3O0yM88GSN
	2hbPPU9Qz/j++nEwpWNgWoA/Job0tNUK2oo3eWZg10xJk0j+NJY4EKBnm6R1OfbfaQZNt+B9PA+
	i8ywMltmjGzRpzgmEVxOAPeCPqxc3nbAFta5WQnb9HJior4nygeSQM/ojomm6ija/Vl9Q==
X-Google-Smtp-Source: AGHT+IG5GcGrOmVVsePre6BxCVhrhKY7NJnCRBVNCLt/HcgbymNTTZVjYmvrDTtjRkuAQ9GKsIJdwvx3BNDYrNQPC88=
X-Received: by 2002:a05:6214:234f:b0:880:486d:18dc with SMTP id
 6a1803df08f44-8863afb4d8fmr176925236d6.58.1764275367501; Thu, 27 Nov 2025
 12:29:27 -0800 (PST)
MIME-Version: 1.0
References: <20251127011438.6918-1-21cnbao@gmail.com> <aSfO7fA-04SBtTug@casper.infradead.org>
 <CAGsJ_4zyZeLtxVe56OSYQx0OcjETw2ru1FjZjBOnTszMe_MW2g@mail.gmail.com> <aSip2mWX13sqPW_l@casper.infradead.org>
In-Reply-To: <aSip2mWX13sqPW_l@casper.infradead.org>
From: Barry Song <21cnbao@gmail.com>
Date: Fri, 28 Nov 2025 04:29:16 +0800
X-Gm-Features: AWmQ_bn_b-JGqeMVPQ751bNAv2Qsiauy9g_kN3cQ2gR4dkmeqYmOBAyRrjCf_ew
Message-ID: <CAGsJ_4zWGYiu1wv=D7bV5zd0h8TEHTCARhyu_9_gL36PiNvbHQ@mail.gmail.com>
Subject: Re: [RFC PATCH 0/2] mm: continue using per-VMA lock when retrying
 page faults after I/O
To: Matthew Wilcox <willy@infradead.org>
Cc: akpm@linux-foundation.org, linux-mm@kvack.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251127_122929_221306_EA16CB5D 
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

On Fri, Nov 28, 2025 at 3:43=E2=80=AFAM Matthew Wilcox <willy@infradead.org=
> wrote:
>
> [dropping individuals, leaving only mailing lists.  please don't send
> this kind of thing to so many people in future]
>
> On Thu, Nov 27, 2025 at 12:22:16PM +0800, Barry Song wrote:
> > On Thu, Nov 27, 2025 at 12:09=E2=80=AFPM Matthew Wilcox <willy@infradea=
d.org> wrote:
> > >
> > > On Thu, Nov 27, 2025 at 09:14:36AM +0800, Barry Song wrote:
> > > > There is no need to always fall back to mmap_lock if the per-VMA
> > > > lock was released only to wait for pagecache or swapcache to
> > > > become ready.
> > >
> > > Something I've been wondering about is removing all the "drop the MM
> > > locks while we wait for I/O" gunk.  It's a nice amount of code remove=
d:
> >
> > I think the point is that page fault handlers should avoid holding the =
VMA
> > lock or mmap_lock for too long while waiting for I/O. Otherwise, those
> > writers and readers will be stuck for a while.
>
> There's a usecase some of us have been discussing off-list for a few
> weeks that our current strategy pessimises.  It's a process with
> thousands (maybe tens of thousands) of threads.  It has much more mapped
> files than it has memory that cgroups will allow it to use.  So on a
> page fault, we drop the vma lock, allocate a page of ram, kick off the
> read, sleep waiting for the folio to come uptodate, once it is return,
> expecting the page to still be there when we reenter filemap_fault.
> But it's under so much memory pressure that it's already been reclaimed
> by the time we get back to it.  So all the threads just batter the
> storage re-reading data.

Is this entirely the fault of re-entering the page fault? Under extreme
memory pressure, even if we map the pages, they can still be reclaimed
quickly?

>
> If we don't drop the vma lock, we can insert the pages in the page table
> and return, maybe getting some work done before this thread is
> descheduled.

If we need to protect the page from being reclaimed too early, the fix
should reside within LRU management, not in page fault handling.

Also, I gave an example where we may not drop the VMA lock if the folio is
already up to date. That likely corresponds to waiting for the PTE mapping =
to
complete.

>
> This use case also manages to get utterly hung-up trying to do reclaim
> today with the mmap_lock held.  SO it manifests somewhat similarly to
> your problem (everybody ends up blocked on mmap_lock) but it has a
> rather different root cause.
>
> > I agree there=E2=80=99s room for improvement, but merely removing the "=
drop the MM
> > locks while waiting for I/O" code is unlikely to improve performance.
>
> I'm not sure it'd hurt performance.  The "drop mmap locks for I/O" code
> was written before the VMA locking code was written.  I don't know that
> it's actually helping these days.

I am concerned that other write paths may still need to modify the VMA, for
example during splitting. Tail latency has long been a significant issue fo=
r
Android users, and we have observed it even with folio_lock, which has much
finer granularity than the VMA lock.

>
> > The change would be much more complex, so I=E2=80=99d prefer to land th=
e current
> > patchset first. At least this way, we avoid falling back to mmap_lock a=
nd
> > causing contention or priority inversion, with minimal changes.
>
> Uh, this is an RFC patchset.  I'm giving you my comment, which is that I
> don't think this is the right direction to go in.  Any talk of "landing"
> these patches is extremely premature.

While I agree that there are other approaches worth exploring, I
remain entirely unconvinced that this patchset is the wrong
direction. With the current retry logic, it substantially reduces
mmap_lock acquisitions and represents a clear low-hanging fruit.

Also, I am not referring to landing the RFC itself, but to a subsequent for=
mal
patchset that retries using the per-VMA lock.

Thanks
Barry

