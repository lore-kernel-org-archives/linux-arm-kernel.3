Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E262FC87FD1
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Aug 2025 17:45:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZbqWwHu/MN3vqLicN/YCVD8yPLwHYccLVOVJvse0Ql4=; b=aaBxysetMBWXNrhIR/UqhP3nLE
	HUXqAt58HCkZgQ2jwtESSOnlpd0OLJ4PCgd4EVFNNUd0g3sWukEYfjuhlobTkk+77CziaFfm6tM4w
	Omhgf9jdqZ1f1qyC2KaIM9pIUd2lSMgn4uS1jvQPuTlQoxGGifkizBGnPt61kbHL2reZsTfuLj4I9
	+6Bd1aXCQNIOM6jhmTRKDQ4bJIKEyKFhnriOBxfdZbJ/o/VsvXOIbvHxLqM94o9DFxXmYjebmFVr5
	9ihpExdm7zJYwN9MLBrUR3qjKSi/pWLRAykIgIcydYeCl/YK7INonyCMsmOzTNvpgQZ4yo5xVpEDo
	OcBdgooQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujLj8-0000000DSb0-2MrZ;
	Tue, 05 Aug 2025 17:45:30 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujLDU-0000000DOZu-1GAX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Aug 2025 17:12:49 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-240718d5920so11585ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 05 Aug 2025 10:12:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1754413967; x=1755018767; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZbqWwHu/MN3vqLicN/YCVD8yPLwHYccLVOVJvse0Ql4=;
        b=gvVUTyL6XfZsrru5RCq6920AlXU/iTeX2Zqwv2IDXcaphmLv1i8RLIWwK/TleDAmFh
         +LWCDN+fev7BYQ0tpqr2tgJvZvrlw4g37Q0OLtgdeYZljzMCcgYIoWzY9XzRZZOFWkFj
         qAKBJPB8B+WMoHaTTGt6JxjvZaLAnFpyF5poTw5OPGrWskMpaJRkWU8r5fC83JbuCpm0
         AUMCvSnqgw5Y0/S8zNI558mImPHY+QI2GdUiD86y8mpJhiyr/nNLIcyyLwLFRHxP6WeQ
         YGq+0igv5mlaqvG1PfNFLav2yYAIsrwxhObfYJsDmq+TK5CbwzhH9bOXQVl8anY+jUgd
         VbYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754413967; x=1755018767;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZbqWwHu/MN3vqLicN/YCVD8yPLwHYccLVOVJvse0Ql4=;
        b=gdGo22ooRAU5upnJmCbJVeSR8Hd9vBnt++CL68oPRiCI7O934UUBWccJgGSbk23cFX
         r4OTcfm3y0ETfStyPmePeehsmA0RZfqswVsnQIdKncMLXtLQIXfNSdW60PcGbOfztE74
         foO8NzSCrb8hefNdu8Kj02yFPoEolVg0XXuTKhKSnvvPSC8iqQJKIeEF922iIrovlhin
         gIKOui8GmEdw4z7pc8+Bq1kvfJj4G1Yn13E8lv/t/D9E3T5y0iczWb33hVxCEXuLOMef
         zX1D3YAyC5Di2YGVVjWLqZBefm+KAYMrfy8Yk40oHxeWEhZTCl01+PTVBVd5mCWWbUz4
         vALg==
X-Forwarded-Encrypted: i=1; AJvYcCXKO6JrJjY9MGQMnXJ1j5dHZHePhna19lvyxTNxH/oEVXo/IRuN8SNDJnHfpJT34sEzcI9X6LboL025BcpmRb6d@lists.infradead.org
X-Gm-Message-State: AOJu0YwZ0BJq9B7qxA1lM340dL90tmPCq0phD5n19wRLEfSFlw9F/pnu
	vZbrtqmMNDR4hHfBpAREdcnXu9WWfVOU5/SfDzf8yUKApbwlITkWHnfvPTSkbpkQeewOHVaPbPx
	gdXg789jk26yM8OBas5/5GalE5iOFNROoSFOfSeaw
X-Gm-Gg: ASbGnctzngGtvqpZmnLOGTj6rBXCjRgVeLsa/neS/foXxnDPPpzbdM31v4Sn6MoZY2u
	s7uD8RoeZ2bQgIzcEbmWnYOxTzZFszFg/RYb7egx83Zg+B5Tcj/XPgayKZIiUQEJgnuk+ANcg+y
	nuqUYC98JQONUt4emAc/Itl7SdeafZTnDvM2Ftl2rruF8CBHHQHiXRGSsnmoRKgsLh3sR37LSym
	/XJXD5fRdbKAJGfMKeP8QQFlXU1akqAr/Q5k7p8
X-Google-Smtp-Source: AGHT+IFqLQ/GSA1XGpDzG6V9bPnbhZrv/PKGEBMGpW4YJVcfW/eWUxu6GeLWbRSsDGK01TuGGZ4dXbAcwThguioGfg0=
X-Received: by 2002:a17:902:fa08:b0:23f:df2c:9f0d with SMTP id
 d9443c01a7336-2428eaf87a8mr2475625ad.21.1754413967127; Tue, 05 Aug 2025
 10:12:47 -0700 (PDT)
MIME-Version: 1.0
References: <CAJDx_rgzkZognxWzOXJ-ZxdTtUaM3FT6bmpkwxMz03XiX3fKAQ@mail.gmail.com>
 <d395b14a-9a84-4f25-b4f0-45e8500fc5fe@redhat.com> <CAJDx_rgrp1TpOt-iDcsSGRTL=qZZsK_dpKL1bSkyunPGcGXt5g@mail.gmail.com>
 <4566222d-6b91-4789-bdd6-61e3769f5dbf@suse.cz>
In-Reply-To: <4566222d-6b91-4789-bdd6-61e3769f5dbf@suse.cz>
From: Juan Yescas <jyescas@google.com>
Date: Tue, 5 Aug 2025 10:12:34 -0700
X-Gm-Features: Ac12FXx118qPMOpTYedhO-FDr1Ci1_iGrsVIoyffTe-jrpJNkQjp-q60_k-xYAk
Message-ID: <CAJDx_rjvYdjPYHbBDKvkaWV=-OPJG=oRdSAugaOyJAXaOVu-9w@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20250805_101248_348954_D9BFADB6 
X-CRM114-Status: GOOD (  39.99  )
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
> What kinds of allocations would then use __GFP_CMA?

The __GFP_CMA allocations are used to allocate userspace anonymous memory. =
This
was done initially in the alloc_zeroed_user_highpage_movable()
function, now it is done
in vma_alloc_zeroed_movable_folio().

> (let me try guess
> one - zswap backend?)

Yep, the __GFP_CMA pages are also used in zram block driver.

Thanks
Juan

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

