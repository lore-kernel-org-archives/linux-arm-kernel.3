Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37DAFC87FD1
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Aug 2025 17:18:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l0RxCTsXFF8391IAhRwoPNmaelsxs5V8yAF1l14fxkk=; b=a7Rbm5Dw1YWEdVIWEsRF7Jscge
	8iJndv/2wmT6nLAX4wCqscV8tJokUr+5WZZlfoZDy7hJCneLZ2XMBVarHkFNTLKmrS50K6QCOXtWx
	gQsDIBH1u58oHSoOriKDfjrRU8NCzJKSJeWAadiRZZVdgY1AZ5DVsphTpeVftBkYrVixA/iJ22eBD
	23UuxBCCg3N/fMGg8BcTxSOGKFQe8HdR2sUcJdNy5W7RBlNvqPxwtkM/R9f24IEnqaDnL9uspMlSw
	oftE3/bA7c1OnYK0Ulj7VJiIiZlsdYuUz8TIgwsxv16ecbYOzWyQS8b1P+ZviKXANhAluwoheRkmv
	7EN9mRvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujLJK-0000000DPTU-0KXd;
	Tue, 05 Aug 2025 17:18:50 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujKoF-0000000DKwT-3KdF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Aug 2025 16:46:45 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-240708ba498so2595ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 05 Aug 2025 09:46:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1754412403; x=1755017203; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l0RxCTsXFF8391IAhRwoPNmaelsxs5V8yAF1l14fxkk=;
        b=Fl/E54D+bBWEaaxt9+gU55NA2Rkx5UUPd9hfMiY2tlhXmIfOsS0yrmFQ6rQ8T24TRe
         p0IBfQvG/f3KO1KzsCgmjLlArUU7LHsoaADHgAWV36t21HOdTh9HQKgiFLoTH6zV6WS6
         QfonLYoaQ5VxcsW1sP1tShFFelSxXKzGPqMCUgWzHLR6OJ7eae27kLCBw3r6IhCzy8Go
         WButdJycen1YYFnUwGSV2nr6vUOPYl4zD7425acDjPhOMegRHoVw4zid4nJdrIgUnrEl
         02I21SptX1peAnOjXdGVDjx4QKTvus9iiYj6zTRv0P8qj/uY6Ar//gCzyQFMYlYu0Z3q
         lwPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754412403; x=1755017203;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l0RxCTsXFF8391IAhRwoPNmaelsxs5V8yAF1l14fxkk=;
        b=JxlMp7Oot6cmuMn3TXOf1ELyi2ersS+7ghe1TsE5gvpJp+IRSco6myaaUGocddVyOJ
         yLO7hXj4xphL1G5SVqMjrDineP4mjf5haimVzcKKpEiNIbtoeP77NsTWXVCUm1Ze3mfb
         8sqYUGq+A+HIs9JRgxmGG9tUlj8EvM54LQstLbu1WmNxxjU2diMdpAT9T23G1NX5fS+5
         ouHC8av7wQGnEnKijnKuWB3B5zL6bRoi1A/XFGBbSxIsCmnWykGf12pljfyFfDM1K3yc
         q8Qz8JY7vfMZ2V4bLzAi4LIeX1LzBleU2wTnacFJx/GTxexnTRGO4Nyb62DPrZeymqiM
         kj0w==
X-Forwarded-Encrypted: i=1; AJvYcCVEGFVOOtWZ98+S2MHUN6ausgowSMAO9iY634G3CH+Fid2ODIPr60KnOlwJtNpbLQmYARFtckSBa7D3kPdOF+Fx@lists.infradead.org
X-Gm-Message-State: AOJu0YyfSEu8adERITfx5nyCWabaVrMnKdj+cvP38ejJUmUeC4uxr4dm
	BOcUW+IRTaojYV8rJRdnJKLZ6TSwr0s5F68/Fuk4Z2ZiZQpYYFVGWrb9x4FvsBSXgxQXALx6oii
	AUNVpmgiFb8uZl2SWPe+Hl/KvyTcdulq75lHa9cQ4
X-Gm-Gg: ASbGncsazbX2GNWbM+ZqqTRyvjdSVRnylCXECcItIfYRAkw9VEw2HbFyQTNTXvVky8O
	NXP9RaA5tOpoujx1L1QO732xSAWKj19NeYyII1bDcHQsQP3O83EWggi7YP/Y+MoOu3/v0LkN3Er
	aGGxhhbKhzU0ce2rWQ+iMxGyLfFQzChYzDJPmIbBrvpeziaLkJLWG720d3nB8h5blO+JFzoksaN
	qLlV7dH+JfbbrSDZrLJO3m2gsK/RbIGRfZ4OdW/
X-Google-Smtp-Source: AGHT+IFbtH6J0AjO4QU4T/tefsfeSE0rL1OzSJr1N/DUHjvBaYU77HeoyM1+WKB2X0d+93TslMU104SV+ZAQGFLorx8=
X-Received: by 2002:a17:902:ea02:b0:234:afcf:d9e8 with SMTP id
 d9443c01a7336-2428e9ca60bmr3484235ad.7.1754412402595; Tue, 05 Aug 2025
 09:46:42 -0700 (PDT)
MIME-Version: 1.0
References: <CAJDx_rgzkZognxWzOXJ-ZxdTtUaM3FT6bmpkwxMz03XiX3fKAQ@mail.gmail.com>
 <d395b14a-9a84-4f25-b4f0-45e8500fc5fe@redhat.com> <CAJDx_rgrp1TpOt-iDcsSGRTL=qZZsK_dpKL1bSkyunPGcGXt5g@mail.gmail.com>
 <4566222d-6b91-4789-bdd6-61e3769f5dbf@suse.cz>
In-Reply-To: <4566222d-6b91-4789-bdd6-61e3769f5dbf@suse.cz>
From: Juan Yescas <jyescas@google.com>
Date: Tue, 5 Aug 2025 09:46:30 -0700
X-Gm-Features: Ac12FXy4BT6ZbkseE6fl0wteJa2HqcPFNTVMsUS4ZZOo4qkH5jwtMaLF9Pp-ohE
Message-ID: <CAJDx_rjxGff38aS_MBwgh6LpDqp6G4zjUvg6tr73KU0HYfGvXA@mail.gmail.com>
Subject: Re: [RFC PATCH] mm/page_alloc: Add PCP list for THP CMA
To: Vlastimil Babka <vbabka@suse.cz>
Cc: David Hildenbrand <david@redhat.com>, akash.tyagi@mediatek.com, 
	Andrew Morton <akpm@linux-foundation.org>, angelogioacchino.delregno@collabora.com, 
	hannes@cmpxchg.org, Brendan Jackman <jackmanb@google.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, 
	Linux Memory Management List <linux-mm@kvack.org>, matthias.bgg@gmail.com, Michal Hocko <mhocko@suse.com>, 
	Suren Baghdasaryan <surenb@google.com>, wsd_upstream@mediatek.com, Zi Yan <ziy@nvidia.com>, 
	Kalesh Singh <kaleshsingh@google.com>, "T.J. Mercier" <tjmercier@google.com>, 
	Isaac Manjarres <isaacmanjarres@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250805_094643_844042_532BD641 
X-CRM114-Status: GOOD (  39.97  )
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

On Tue, Aug 5, 2025 at 2:52=E2=80=AFAM Vlastimil Babka <vbabka@suse.cz> wro=
te:
>
> On 8/5/25 3:22 AM, Juan Yescas wrote:
> > On Mon, Aug 4, 2025 at 11:50=E2=80=AFAM David Hildenbrand <david@redhat=
.com> wrote:
> >>
> >> On 04.08.25 20:20, Juan Yescas wrote:
> >>> Hi David/Zi,
> >>>
> >>> Is there any reason why the MIGRATE_CMA pages are not in the PCP list=
s?
> >>>
> >>> There are many devices that need fast allocation of MIGRATE_CMA pages=
,
> >>> and they have to get them from the buddy allocator, which is a bit
> >>> slower in comparison to the PCP lists.
> >>>
> >>> We also have cases where the MIGRATE_CMA memory requirements are big.
> >>> For example, GPUs need MIGRATE_CMA memory in the ranges of 30MiB to 5=
00MiBs.
> >>> These cases would benefit if we have THPs for CMAs.
> >>>
> >>> Could we add the support for MIGRATE_CMA pages on the PCP and THP lis=
ts?
> >>
> >> Remember how CMA memory is used:
> >>
> >> The owner allocates it through cma_alloc() and friends, where the CMA
> >> allocator will try allocating *specific physical memory regions* using
> >> alloc_contig_range(). It doesn't just go ahead and pick a random CMA
> >> page from the buddy (or PCP) lists. Doesn't work (just imagine having
> >> different CMA areas etc).
> >>
> >> Anybody else is free to use CMA pages for MOVABLE allocations. So we
> >> treat them as being MOVABLE on the PCP.
> >>
> >> Having a separate CMA PCP list doesn't solve or speedup anything, real=
ly.
> >>
> >
> > Thanks David for the quick overview.
> >
> >> I still have no clue what this patch here tried to solve: it doesn't
> >> make any sense.
> >>
> >
> > The story started with this out of tree patch that is part of Android.
> >
> > https://lore.kernel.org/lkml/cover.1604282969.git.cgoldswo@codeaurora.o=
rg/T/#u
> >
> > This patch introduced the __GFP_CMA flag that allocates pages from
> > MIGRATE_MOVABLE
> > or MIGRATE_CMA.
>
> What kinds of allocations would then use __GFP_CMA? (let me try guess
> one - zswap backend?)
>
> > What it happens then, it is that the MIGRATE_MOVABLE
> > pages in the
> > PCP lists were consumed pretty fast. To solve this issue, the PCP
> > MIGRATE_CMA list was added.
> > This list is initialized by rmqueue_bulk() when it is empty. That's
> > how we end up with the PCP MIGRATE_CMA list
> > in Android. In addition to this, the THP list for MIGRATE_MOVABLE was
> > allowed to contain
> > MIGRATE_CMA pages. This is causing THP MIGRATE_CMA pages to be used
> > for THP MIGRATE_MOVABLE
> > making later allocations from THP MIGRATE_CMA to fail.
>
> If you don't want THP's to use the large (THP-sized) MIGRATE_CMA pages,
> what kind of such large allocations would be ok to use MIGRATE_CMA then?

The large THP MIGRATE_CMA allocs are used by GPUs or devices that require
large chunks of memory (have many cameras for example).


> > These workarounds are mainly because we need to solve this issue upstre=
am:
> >
> > - When devices reserve big blocks of MIGRATE_CMA pages, the
> > underutilized MIGRATE_CMA
> > can fall back to MIGRATE_MOVABLE and these pages can be pinned, so if
> > we require MIGRATE_CMA
> > pages, the allocations might fail.
> >
> > I remember that you presented the problem in LPC. Were you able to
> > make some progress on that?
> >
> > Thanks
> > Juan
> >
> >
> >
> >
> >
> >> --
> >> Cheers,
> >>
> >> David / dhildenb
> >>
>

