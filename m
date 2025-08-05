Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 228EBC87FCF
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Aug 2025 01:25:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hAJ4RHocJtdCibwUW7vMzbUCC5UcCNRUv+aRR+ZSOM4=; b=Vg0rFVwv+o2gBXeZ1C4QxXCeEZ
	kLFS/NPFcToG9RrYnf5V/kbON8VuJgKnWldbbKcBwE8xltCVrFRAjV/tNqaZDiskXsBuNBqWVnqrH
	4vbsk5N/czsAs6IYsu888XGzI1t6NzceGcMSZVE0mSzIbnwT32XEhCIz71407uuYqU/G2zekY92z/
	PIWDvRp2twbz/j9o1Ef5cdhjjud1XzgLvrXbDf1C1G1AMvnzVXxp6IawDvuMNSUz2uKT5vbhu1OkD
	9ABYolldVM+aZMVVMULiT4G8YintiS/jz4jd8W5M2rAo3ryN9I1IejQPit7Yqrw43PDlZCPO2wIyc
	gwqnquSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uj6QV-0000000BZha-3Y0T;
	Tue, 05 Aug 2025 01:25:15 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uj6Nu-0000000BZWs-2vu9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Aug 2025 01:22:36 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-240718d5920so61315ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 04 Aug 2025 18:22:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1754356954; x=1754961754; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hAJ4RHocJtdCibwUW7vMzbUCC5UcCNRUv+aRR+ZSOM4=;
        b=U31ezm8HJZL/RN57P0A/iwC/ScRVlxgzD8L/dSBeuIOKUcRjMlUGGOcTXyBsbFCMXs
         2aWvP+AZNdU3U5+u4FXOsku5k2R/PJOITXFnX1jeLXzuaoiYQvHHe4DVAi7yLAdRrU6P
         wg6I2qCtgen+fFCuzGGBwgrv3WP8dmhBkLT1o9spZs4QxKdY4jX+Ch47fUN5PV3ulRtW
         uOoUyU8p2g5Z4vXSKDCZFXy7Z8Oux/1Qn1EMvTM88jpz8jUbdEXch+8Y3QGXEZGov0yi
         mRmToIkXFtvFXS7kJCMSQNnM/8QSD0jjfwU7SagGOd0g2f6cDjPJ/WFs3cpIn3Z+nGW7
         pA+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754356954; x=1754961754;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hAJ4RHocJtdCibwUW7vMzbUCC5UcCNRUv+aRR+ZSOM4=;
        b=QzGuTYuR3hkWzXvJ+eluymb1wLYeB3zTx0MoEneeVRcRV81N7m+zRf2YdNg24L1MmT
         JY7CT4Hk3UtyJENi21yGegbzkac/gPsqS++NjPdSa9iDxB5OdCGiKK9FtNoNVGIzPsaZ
         oIzQX60xBS0BT/gzHulBmY0DZIUgxmoSusqraiKi7pueng5+TwRtxw7xO7lSu53QrCXy
         dL21Vreyudfbix2F9r4uo0XFvy1wnDDX3s2Vc5QfhyaBYckZiWsefItcZmW1kIEdDS4H
         9aAhZ44PTjATqYefEU+Qlc+8/rmy7BGyXyEVBMaAi3ESX3F/O4xRp1DgOzlJuNcUGhBX
         8nPg==
X-Forwarded-Encrypted: i=1; AJvYcCUewSaTl+14MPSSR8D13mSLw4PIvQzeBepREoL5TI7d33clBrCV8yDnFR9iB8mOezhKbJvfiap7g9QQXIsgsK39@lists.infradead.org
X-Gm-Message-State: AOJu0YyKrRrCPbG07cG8JcYX1o5Mw2s2ZuCZCqIqBUQWMdp8/jASS5kW
	qKO9TMsU+0OXrek6o3fV02j3H2dSvwwFYJr06C9egizVmAigvja96ireLsFch4fLtkidYVYBkIq
	X1O55PwubZ4vOtzkKa9qtXyNHMR9Z2lZtnX++RTWj
X-Gm-Gg: ASbGncuSaJTNUw3R+BYrP5cmTl080ErH0MaqYvEeznf+P4BylZsi39pJ8UH/+UUG3hn
	VYhtdeleCJRqtRPkrpjj1mmrg5Pyl/KUAE9QTW3QRgesp6N8g0TE086g2MS34ZxtZg0GmOtMbwi
	em0mDYwPNP4e1QmV1DLliuEE5yTj66XhCV5K1b9W1W+eHV1QXvYzADvXqBVXnurrqo7sz0XrCda
	a87E0eYtKj0wiO81o4H+8SDnQITD0xJgIir6aHm
X-Google-Smtp-Source: AGHT+IHUNdtQwZDC9iJcA9U28t/KjMRhfY0lm9oTiYDKuEahIO/YtsfurNp2t+vB8T6wdGKdYuKho7IuX7hBOXsBD6M=
X-Received: by 2002:a17:902:d50b:b0:223:ff93:322f with SMTP id
 d9443c01a7336-2428e9b08e0mr357745ad.2.1754356953205; Mon, 04 Aug 2025
 18:22:33 -0700 (PDT)
MIME-Version: 1.0
References: <CAJDx_rgzkZognxWzOXJ-ZxdTtUaM3FT6bmpkwxMz03XiX3fKAQ@mail.gmail.com>
 <d395b14a-9a84-4f25-b4f0-45e8500fc5fe@redhat.com>
In-Reply-To: <d395b14a-9a84-4f25-b4f0-45e8500fc5fe@redhat.com>
From: Juan Yescas <jyescas@google.com>
Date: Mon, 4 Aug 2025 18:22:20 -0700
X-Gm-Features: Ac12FXz6D7iBBMFZt4PN7BOj1xXY8Im3BiqcIN-p29imUt-Q6tjBh8yWlEWjeZQ
Message-ID: <CAJDx_rgrp1TpOt-iDcsSGRTL=qZZsK_dpKL1bSkyunPGcGXt5g@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20250804_182234_730127_5DF1EE28 
X-CRM114-Status: GOOD (  29.82  )
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

On Mon, Aug 4, 2025 at 11:50=E2=80=AFAM David Hildenbrand <david@redhat.com=
> wrote:
>
> On 04.08.25 20:20, Juan Yescas wrote:
> > Hi David/Zi,
> >
> > Is there any reason why the MIGRATE_CMA pages are not in the PCP lists?
> >
> > There are many devices that need fast allocation of MIGRATE_CMA pages,
> > and they have to get them from the buddy allocator, which is a bit
> > slower in comparison to the PCP lists.
> >
> > We also have cases where the MIGRATE_CMA memory requirements are big.
> > For example, GPUs need MIGRATE_CMA memory in the ranges of 30MiB to 500=
MiBs.
> > These cases would benefit if we have THPs for CMAs.
> >
> > Could we add the support for MIGRATE_CMA pages on the PCP and THP lists=
?
>
> Remember how CMA memory is used:
>
> The owner allocates it through cma_alloc() and friends, where the CMA
> allocator will try allocating *specific physical memory regions* using
> alloc_contig_range(). It doesn't just go ahead and pick a random CMA
> page from the buddy (or PCP) lists. Doesn't work (just imagine having
> different CMA areas etc).
>
> Anybody else is free to use CMA pages for MOVABLE allocations. So we
> treat them as being MOVABLE on the PCP.
>
> Having a separate CMA PCP list doesn't solve or speedup anything, really.
>

Thanks David for the quick overview.

> I still have no clue what this patch here tried to solve: it doesn't
> make any sense.
>

The story started with this out of tree patch that is part of Android.

https://lore.kernel.org/lkml/cover.1604282969.git.cgoldswo@codeaurora.org/T=
/#u

This patch introduced the __GFP_CMA flag that allocates pages from
MIGRATE_MOVABLE
or MIGRATE_CMA. What it happens then, it is that the MIGRATE_MOVABLE
pages in the
PCP lists were consumed pretty fast. To solve this issue, the PCP
MIGRATE_CMA list was added.
This list is initialized by rmqueue_bulk() when it is empty. That's
how we end up with the PCP MIGRATE_CMA list
in Android. In addition to this, the THP list for MIGRATE_MOVABLE was
allowed to contain
MIGRATE_CMA pages. This is causing THP MIGRATE_CMA pages to be used
for THP MIGRATE_MOVABLE
making later allocations from THP MIGRATE_CMA to fail.

These workarounds are mainly because we need to solve this issue upstream:

- When devices reserve big blocks of MIGRATE_CMA pages, the
underutilized MIGRATE_CMA
can fall back to MIGRATE_MOVABLE and these pages can be pinned, so if
we require MIGRATE_CMA
pages, the allocations might fail.

I remember that you presented the problem in LPC. Were you able to
make some progress on that?

Thanks
Juan





> --
> Cheers,
>
> David / dhildenb
>

