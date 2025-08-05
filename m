Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03786C87FD1
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Aug 2025 17:21:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GEnVU5KAskdWYUBQ/kSGgyrV9wf/VcctSOFlUiJlPrU=; b=pvDtZAkWz3qlVhjqpOLN/UDCVF
	sFzU6hfY0omMQw6Ng+g0ZmRZ4B9hDB2IZtSBq9axQPnWrs5wUZqkfyqpFZOWztP2r78hzTFQ2l+A0
	xB1R1UJF8Iz620LRADKTAP+/NwaxCCQ4q+agwW0BG3TTTTesnZ/oIRQK5eNhaWt3ZXaRlt3QQf/DK
	bZcl6DV1idLzMuUGAHPsJmEn1iyJ5uFbfgfDkKvrfSdy+/bT/TdXSDNQy2GvLhSic4BnUW7VMktoT
	PdcXcyYYn0MTNXAod/qUaWA/a+OndgpERgSD/E7TJ7+aDWMgbN9a1iYv39dW2J13rzEy5SinDZD6d
	8knHgLzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujLLt-0000000DPoz-39bI;
	Tue, 05 Aug 2025 17:21:29 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujKz3-0000000DMC5-2Hum
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Aug 2025 16:57:56 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-24070dd87e4so7775ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 05 Aug 2025 09:57:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1754413073; x=1755017873; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GEnVU5KAskdWYUBQ/kSGgyrV9wf/VcctSOFlUiJlPrU=;
        b=iHFUhNOL4/D9b76xmWPrNP09bH87ft/2CW9ILMOrw4pDvLwWtYKFcK6L5+DR4jQ5YI
         6oa1anoO5OlD7mUnSjFEHB2wEhA+hWd2WoW1qMRIMYiRFnGrj6RCOdBKb2uvwMOyiF7J
         mL67/WkNM0YyktsHp4+/ar0ShnDUieXtePe6Yex0TjEELEffV7CAzam0WYCCgkCUp4Dm
         Vuws4trRnTu/NyUysyz5989nsG9LufVNvASuOYR/04lq7Ao1i3kVTkbeWaIxqM3VjeWz
         8CftrxoHxRN4tN5zRt8cBVI2MzTGrCekqhMQ3GWphgAdZnhPPHan8U4haskKTnjGd0WU
         lcRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754413073; x=1755017873;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GEnVU5KAskdWYUBQ/kSGgyrV9wf/VcctSOFlUiJlPrU=;
        b=TUEvQnSQagD6BgTEy2qMj3SzT3YZ8Xvbwp5e+ec5q3jj6dz3YzndkWBhRbMCIOJsQt
         hKizxaBfFBKKR78zTPmLUUlZ8CtQirPf0FpJn0kk1YABnXhABVu4CvNe7/ENhS8SzB5w
         +idGyZ6Py/HpwzVfg4XXLCKvhs/Be33KR4mAWPVlaJRBP0XL3wWtbowEgdYkt+JTW1ms
         lQODJsj8AU1nGJUUUJQ1/eh5Iq5WFL5VTqtg+BcIXjyUswZYg873M/p1dgVkvR3V8eHi
         ydy0+7+MfRHsEySdJEmDntu4t2Sy2Eh5Zfssts3AkrGvuq6Y8KPIUygOMJ/9n9oPUXYl
         5Apg==
X-Forwarded-Encrypted: i=1; AJvYcCVgPW661SDmZ/KWf0SC0VbWwZ1fYz9xmC1W5WtgdI2J0OdUXMYO5bhmNQz7IRPrnG4eSjYs9iDHkdDX4f1JClP9@lists.infradead.org
X-Gm-Message-State: AOJu0YyHQnlhlI6PHD0Cv8AAxnfB/32VP4Vzh7cQUGIuJxlffP8kBU7E
	2RMIBFSVGq3aaKN7kqLk8OnPs4b5FX9YNRH47CDPpHFDNjKVImcVRlBNI/N/0lSYbvGc8IYwoMU
	sUbkIjJXE5QvmoSnILkV4TbpfsynPdz3cZOrZh+F9
X-Gm-Gg: ASbGncvrbWRMVx76zP7USml4aMSMkwI8QB97Uwop0eHHmJa3xltkv47uhxbn039UxU5
	7MfOtm1p4av6LEFAlhTep+amRpi35YTJZmbmXwmeHXikTHRXiOCYVtRJcESHsg3ngaL+tJPlsen
	VnrqUkYaa0gGilmHir9WsavCAn9J01wG0anbXMvERAYvEQv2xdqB+Ls78IyScMdZFjFtSh6V1zp
	w1SXXgBxhbx+zeAUrNT5DzOxJSyUGCZxU9IaPPE
X-Google-Smtp-Source: AGHT+IFHALxRLkmhDed/lnhoMX9pMKBECdTY93R6Sdw6v3eSIKnTQjB+1XTGHNMoRl1Mtb+hpgpseJBwvLL9afKRuuU=
X-Received: by 2002:a17:903:41c9:b0:240:a4b5:fe0d with SMTP id
 d9443c01a7336-2428e9d9866mr3490245ad.6.1754413072472; Tue, 05 Aug 2025
 09:57:52 -0700 (PDT)
MIME-Version: 1.0
References: <CAJDx_rgzkZognxWzOXJ-ZxdTtUaM3FT6bmpkwxMz03XiX3fKAQ@mail.gmail.com>
 <d395b14a-9a84-4f25-b4f0-45e8500fc5fe@redhat.com> <CAJDx_rgrp1TpOt-iDcsSGRTL=qZZsK_dpKL1bSkyunPGcGXt5g@mail.gmail.com>
 <486c5773-c7fa-4e19-b429-90823ed2f7d5@redhat.com>
In-Reply-To: <486c5773-c7fa-4e19-b429-90823ed2f7d5@redhat.com>
From: Juan Yescas <jyescas@google.com>
Date: Tue, 5 Aug 2025 09:57:39 -0700
X-Gm-Features: Ac12FXwewq6mHJ3iXKimK9YdL07pdhlid5gd2fFisX11Nn-jXdYL26T35WBbNug
Message-ID: <CAJDx_ri==3SxFcuKXHpNjrtxbp0hLyhM+zXeJ-LQX38rfbUChw@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20250805_095753_605948_F7EFF130 
X-CRM114-Status: GOOD (  42.38  )
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

On Tue, Aug 5, 2025 at 2:58=E2=80=AFAM David Hildenbrand <david@redhat.com>=
 wrote:
>
> On 05.08.25 03:22, Juan Yescas wrote:
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
> > or MIGRATE_CMA. What it happens then, it is that the MIGRATE_MOVABLE
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
> Okay, so this patch here really is not suitable for the upstream kernel
> as is. It's purely targeted at the OOT Android patch.
>
Right, it is a temporary solution for the pinned MIGRATE_CMA pages.

> >
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
>
> There is the problem of CMA pages getting allocated by someone for a
> MOVABLE allocation, to then short-term pin it for DMA. Long-term
> pinnings are disallowed (we just recently fixed a bug where we
> accidentally allowed it).
>
Nice, it is great the issue got caught and fixed upstream :)

> One concern is that a steady stream of short-term pinnings can turn such
> pages unmovable. We discussed ideas on how to handle that, but there is
> no solution upstream yet.

Are there any plans to continue the discussion? Is it in the priority
list? Maybe
a topic we can discuss in LPC Japan?

Thanks
Juan

>
> --
> Cheers,
>
> David / dhildenb
>

