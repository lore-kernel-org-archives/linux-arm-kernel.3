Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6839CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 20:12:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RMqutGN+yLrgM+NB4+zfhtscJz9Ec3G94PrW8rPDTWY=; b=wjq4G7LzEn3GMWKrpCDOVNu7w/
	MPM8K9TlKcVfA3Uq+d5s64O/ClvAIoWnUUgW5Bi1P9EtaXEAYG739hsaepwGkQNNLqwBjXNKDGI+t
	TTojjcwkfkMOuUY+ZZTRpQSuDMWz2ywaIOLlX0JThGC+jaiy/yoGF3+SpJRFktXbLNypOKpsFLkiP
	HS92+S6Olqn9gYA/xDYe9dUnJFSvm2F+DhqYBZoDDFkqnpUlITEqe10jiDqKG2YNulNS0QdMkS3Ye
	9LMoGW4JBhd1z7xOoV7NGE2g7ks0DEXTvyRhvh4MfQpEdnauyCNdVUqgItdBdYNGRh/WeIUFuVYy1
	tm0SyG3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw4h6-00000009uaM-3gbW;
	Tue, 09 Sep 2025 20:12:00 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw4h4-00000009uYj-2R0S
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 20:11:59 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-24cca557085so9635ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Sep 2025 13:11:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1757448718; x=1758053518; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RMqutGN+yLrgM+NB4+zfhtscJz9Ec3G94PrW8rPDTWY=;
        b=Ezk5U5YRwZy7XcBeHyzsvvvHEZDnE9DaidDXlPqDDFiYcVa17oaQdWJHuWIObY5zpM
         RjF9dbgcUKKDZxKnqF9TqYuya1UlVAJmQiGn2/VsLZkKWX/K+1u2bNZjiBtpPL5X59mD
         f2V5APWrfwyfBJ4S6Lx7x4qOTa7M/6iSuDuXACEJ3HdBOEX5psJMj2//eQ2zbnGyRx0j
         qAG2exHn5orjCMaNgctQDyPV1FDVoxgmWLez6CTuHdm1FPTXEY3WVAXds5DoFks3HePG
         ATVEV4I2pGNaQOq4mljw+mx+U4IJHKcIfGM3n7QOnB6jU1zvdCnBtXGQCVFtuRA2tjYf
         xmqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757448718; x=1758053518;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RMqutGN+yLrgM+NB4+zfhtscJz9Ec3G94PrW8rPDTWY=;
        b=i2johHYDPCpcJ27vfoMvDrcDijZkPN3r7mjx+59p7wGuuFPPSR8owb7NybG7N9BdIc
         flbiIbBff8Su+o1zQ5xSw2AlUwtTUb4mQ9AZEG/kivc3sZu/pwMLAkEc/PiWZrOK7GwR
         EV3aG3W2OyD97uknVKws3fHnPDbtfhS5qpKfZA8eHoL8FfYxrcfQgEMfZUlY6YRhWrU/
         yNnK8pRBm2sOIMCCQK3VLQmMCaANNMA/Cn1tG5FkoNQHvD0XI3DOMi7EQXAa3Hxf4Zso
         Qzt0PApgWE7PvBVnckvHRciC7McUxCCYspPvLCl9DsrV0W6cW3I25ybgIQEJQJ4juGZu
         LvyA==
X-Forwarded-Encrypted: i=1; AJvYcCVdFKyWQ2kfYQYPFz59tKTDEmGrFCdvJvFRAARNHVnV5RAjYyX6JrnUBINUhtQyDEpuGEC6o1Za/udBJ20reX0j@lists.infradead.org
X-Gm-Message-State: AOJu0YwJDpVWQHiXgbXgawXJ/N2h42vprwYYYpn5Ksq1/SyhiWNtlaKK
	R+7yQ3jfR5c0K5QqDbIp5GK0vO0XaL84KQqq9fCZlwnFiCq9Iyukw20QZDRe5JzNyR8oIEHgkbV
	8aLnltQH5lNE/cZrWvcgF+vJU9BP88RO6MRk+y/Ed
X-Gm-Gg: ASbGncuRjSC+Q/pyr/1ImGR4D3R1zvEfgE0MHE27tWw9Gsl/BydiMP9qwQLR358K2CF
	4C7X2dhxDHeR/mXpkDyZf5/tZzuQtdbUbPbTSX8Y8GCr1qz5zwb1eU6oOOHtLLjYvATcP0bieDU
	Rg2993s/AUMk3fRhC38sioJpCjMzRzfAG2R999aSTnvY3fNYHbvp1cmUKduE4NAaApzk0+cbSRB
	3PVBk1KP7D6vvlfxZpzduf6YZQobg3hagNTqXt2oss=
X-Google-Smtp-Source: AGHT+IFX3Yblf4ZODycC555w3xs5DUtNy1StojhqIRO/qAVf35qb6Qt4MYDTGQXUSZ6pqO5kIY7S+3D62K27CD/FW6s=
X-Received: by 2002:a17:902:e5d0:b0:24c:f4b1:baaf with SMTP id
 d9443c01a7336-25a7d989bb5mr37875ad.1.1757448717349; Tue, 09 Sep 2025 13:11:57
 -0700 (PDT)
MIME-Version: 1.0
References: <CAJDx_rgzkZognxWzOXJ-ZxdTtUaM3FT6bmpkwxMz03XiX3fKAQ@mail.gmail.com>
 <d395b14a-9a84-4f25-b4f0-45e8500fc5fe@redhat.com> <CAJDx_rgrp1TpOt-iDcsSGRTL=qZZsK_dpKL1bSkyunPGcGXt5g@mail.gmail.com>
 <486c5773-c7fa-4e19-b429-90823ed2f7d5@redhat.com> <CAJDx_ri==3SxFcuKXHpNjrtxbp0hLyhM+zXeJ-LQX38rfbUChw@mail.gmail.com>
 <6dee6cd9-c67f-480f-b728-21c3a7b72004@redhat.com>
In-Reply-To: <6dee6cd9-c67f-480f-b728-21c3a7b72004@redhat.com>
From: Juan Yescas <jyescas@google.com>
Date: Tue, 9 Sep 2025 13:11:44 -0700
X-Gm-Features: Ac12FXy9H8LSTetHGcFYnz6pqWAly0dnCfLL-mWF9ljJktwSF-hLAn2umBneJkE
Message-ID: <CAJDx_rh_bTC5EY=qMSda5GuNLzZMZg8nM8_hfUea3Y8oGJMfNw@mail.gmail.com>
Subject: Re: [RFC PATCH] mm/page_alloc: Add PCP list for THP CMA
To: David Hildenbrand <david@redhat.com>
Cc: akash.tyagi@mediatek.com, Andrew Morton <akpm@linux-foundation.org>, 
	angelogioacchino.delregno@collabora.com, hannes@cmpxchg.org, 
	Brendan Jackman <jackmanb@google.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	Linux Memory Management List <linux-mm@kvack.org>, matthias.bgg@gmail.com, Michal Hocko <mhocko@suse.com>, 
	Suren Baghdasaryan <surenb@google.com>, Vlastimil Babka <vbabka@suse.cz>, wsd_upstream@mediatek.com, 
	Zi Yan <ziy@nvidia.com>, Kalesh Singh <kaleshsingh@google.com>, 
	"T.J. Mercier" <tjmercier@google.com>, Isaac Manjarres <isaacmanjarres@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_131158_622958_B742D88D 
X-CRM114-Status: GOOD (  41.89  )
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

On Tue, Aug 5, 2025 at 2:08=E2=80=AFPM David Hildenbrand <david@redhat.com>=
 wrote:
>
> On 05.08.25 18:57, Juan Yescas wrote:
> > On Tue, Aug 5, 2025 at 2:58=E2=80=AFAM David Hildenbrand <david@redhat.=
com> wrote:
> >>
> >> On 05.08.25 03:22, Juan Yescas wrote:
> >>> On Mon, Aug 4, 2025 at 11:50=E2=80=AFAM David Hildenbrand <david@redh=
at.com> wrote:
> >>>>
> >>>> On 04.08.25 20:20, Juan Yescas wrote:
> >>>>> Hi David/Zi,
> >>>>>
> >>>>> Is there any reason why the MIGRATE_CMA pages are not in the PCP li=
sts?
> >>>>>
> >>>>> There are many devices that need fast allocation of MIGRATE_CMA pag=
es,
> >>>>> and they have to get them from the buddy allocator, which is a bit
> >>>>> slower in comparison to the PCP lists.
> >>>>>
> >>>>> We also have cases where the MIGRATE_CMA memory requirements are bi=
g.
> >>>>> For example, GPUs need MIGRATE_CMA memory in the ranges of 30MiB to=
 500MiBs.
> >>>>> These cases would benefit if we have THPs for CMAs.
> >>>>>
> >>>>> Could we add the support for MIGRATE_CMA pages on the PCP and THP l=
ists?
> >>>>
> >>>> Remember how CMA memory is used:
> >>>>
> >>>> The owner allocates it through cma_alloc() and friends, where the CM=
A
> >>>> allocator will try allocating *specific physical memory regions* usi=
ng
> >>>> alloc_contig_range(). It doesn't just go ahead and pick a random CMA
> >>>> page from the buddy (or PCP) lists. Doesn't work (just imagine havin=
g
> >>>> different CMA areas etc).
> >>>>
> >>>> Anybody else is free to use CMA pages for MOVABLE allocations. So we
> >>>> treat them as being MOVABLE on the PCP.
> >>>>
> >>>> Having a separate CMA PCP list doesn't solve or speedup anything, re=
ally.
> >>>>
> >>>
> >>> Thanks David for the quick overview.
> >>>
> >>>> I still have no clue what this patch here tried to solve: it doesn't
> >>>> make any sense.
> >>>>
> >>>
> >>> The story started with this out of tree patch that is part of Android=
.
> >>>
> >>> https://lore.kernel.org/lkml/cover.1604282969.git.cgoldswo@codeaurora=
.org/T/#u
> >>>
> >>> This patch introduced the __GFP_CMA flag that allocates pages from
> >>> MIGRATE_MOVABLE
> >>> or MIGRATE_CMA. What it happens then, it is that the MIGRATE_MOVABLE
> >>> pages in the
> >>> PCP lists were consumed pretty fast. To solve this issue, the PCP
> >>> MIGRATE_CMA list was added.
> >>> This list is initialized by rmqueue_bulk() when it is empty. That's
> >>> how we end up with the PCP MIGRATE_CMA list
> >>> in Android. In addition to this, the THP list for MIGRATE_MOVABLE was
> >>> allowed to contain
> >>> MIGRATE_CMA pages. This is causing THP MIGRATE_CMA pages to be used
> >>> for THP MIGRATE_MOVABLE
> >>> making later allocations from THP MIGRATE_CMA to fail.
> >>
> >> Okay, so this patch here really is not suitable for the upstream kerne=
l
> >> as is. It's purely targeted at the OOT Android patch.
> >>
> > Right, it is a temporary solution for the pinned MIGRATE_CMA pages.
> >
> >>>
> >>> These workarounds are mainly because we need to solve this issue upst=
ream:
> >>>
> >>> - When devices reserve big blocks of MIGRATE_CMA pages, the
> >>> underutilized MIGRATE_CMA
> >>> can fall back to MIGRATE_MOVABLE and these pages can be pinned, so if
> >>> we require MIGRATE_CMA
> >>> pages, the allocations might fail.
> >>>
> >>> I remember that you presented the problem in LPC. Were you able to
> >>> make some progress on that?
> >>
> >> There is the problem of CMA pages getting allocated by someone for a
> >> MOVABLE allocation, to then short-term pin it for DMA. Long-term
> >> pinnings are disallowed (we just recently fixed a bug where we
> >> accidentally allowed it).
> >>
> > Nice, it is great the issue got caught and fixed upstream :)
> >
> >> One concern is that a steady stream of short-term pinnings can turn su=
ch
> >> pages unmovable. We discussed ideas on how to handle that, but there i=
s
> >> no solution upstream yet.
> >
> > Are there any plans to continue the discussion? Is it in the priority
> > list?
>
> Ohh, it's somewheeeeeere on the todo list :)
>
> Do you (or one of your colleagues) have capacity to work on that? One
> idea was to flag folios as "pending on migration" and disallow any
> further short-term pins until migration is done. IIRC, there were other
> ideas (e.g., isolated pageblock).
>
> > Maybe
> > a topic we can discuss in LPC Japan?
>
> Sounds good, feel free to propose this as a topic. I wills end out the
> announcement of the MM MC probably next week.
>

The topic has been proposed in the Kernel Memory Management track.

https://lpc.events/event/19/abstracts/2397/

Thanks
Juan

>
> --
> Cheers,
>
> David / dhildenb
>

