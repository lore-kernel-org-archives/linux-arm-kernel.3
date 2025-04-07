Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ED5DC3601E
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Apr 2025 12:08:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i4+pLFMxzNKF7wuYEtBPsrpqj7a4qDgMwXzKwK/DCEs=; b=SOGUlPNTjLeHyQzyGJvH2X+KCt
	duvvhLDLD75EG1hyeu2lke3LJNN2TTkp/eHuCI7dLbggYRr5KPi9hw2j+PkTVaGuY2EOhz+30wFta
	ITBNCajnK+srdfS/JPdzVmLafiAfzWbxfXPsc/vOA8cLG6YyI44Hh6iF5MLh5iGl6hXvxs3IjuZ6X
	iYCyKtEGkkCqlmRk2T5s+AWf6l0l4wZ0gXmIDpBTbvr0Nl5NazIXX6BQ8uhnBUSaHeoGzFsRuRDB8
	IH8mKXyNa2R0HWx6jp1w5CEPiojUxG6iMD7Zn8h1M4gvZEiA1FZVwCeNyZrUWA9W+Y3h+mVaNpIma
	EytxX83w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1lHP-00000000AwE-1VkZ;
	Mon, 07 Apr 2025 12:08:43 +0000
Received: from mail-ua1-f44.google.com ([209.85.222.44])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1kzg-000000005Uk-2TN5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Apr 2025 11:50:26 +0000
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-86b9ea43955so1689611241.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Apr 2025 04:50:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744026621; x=1744631421;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i4+pLFMxzNKF7wuYEtBPsrpqj7a4qDgMwXzKwK/DCEs=;
        b=d9PGTwNF/QnlNy4rL2IqrDOMljGUx04AAXGd5p9r3yGvhUYEbyIiQWYEFRFYuuXuvO
         g9XdQnCpu0zQ4XhAw3BEUdx8U1YrTyaG+LhG98w6yzi1jYeDFmw/XyIqozKvN9csxq2g
         vQ92AGIbHvVfqvFjDOlC8cbeA9S7jmMmJrrUSTnm+kTEf/1wTaBZ3f7Z4w9eZHPFHh3x
         qnbgIUJqsczbTSoF5pM9gJKSOQNuXKtDuruIL2IFlAoPajkW/fYDynmyReAb3gDL1F1A
         6ZLwORk0P+xLZ/osdvtFlOiH1O3+R7Wlb90XFFFPWtJyQqlcjxwCcblgjWuZkxgd2/Ei
         ySMw==
X-Forwarded-Encrypted: i=1; AJvYcCWFRK7wgc86zxuZZh49QXL0c/84b5FGAwF0jK2at5XV8pkKlzjCYXD2NLW0OvOHlVJTwhDx34j4U3bZRohQrB0T@lists.infradead.org
X-Gm-Message-State: AOJu0YzkQ+z6Wr/KXMJMNSJO+eMEDikZ1XPulFhZ0TNR0lhXgarHu/4W
	9kkMq5DfjUcOT/EJWfC1fBfDeEcR/9yasGj42CzA1Y4Ckjv9GPTEMFHae01F
X-Gm-Gg: ASbGncvGCf2cgUHkw203coIKPOKJ7V3toyb8hMfBvSMA8i2j69TzOvdNPfcyMF54HpH
	N+mGnKaLsP8ikBuJOOlUu8eB4z+HtmTVY6lRcF7Eb8yzYRXDyLyYqDYkmlvjz2EC90tKo+YT7EQ
	N73kEyVOgwOKhXYr2UFTV/L0ZpSc1uTfR5SzehKAS1sMyzLV79QWlXB4qpq/OFWsVztkyz92dSR
	6PpVO60ioEBCandJk/2npMHA+E3UkmoGgM14bU3+w+YWEMgvLfY6GUD/VekTwU5xNNZvp3YmZ/r
	a9Fjpto2x119ZZBy3O48iDZPLLJVN27ugucpZ3KNNa4VZmrWzlrkrN1/cj7XPePyMErSZlDy1p/
	n3uLYH6koSlo=
X-Google-Smtp-Source: AGHT+IEZVG6uL56+ovxH9RyOgUqqmRvJcCqBn+ovPIeSeLxURfhJELeNvr9RJYPKZ1unrOVfGKa1bA==
X-Received: by 2002:a05:6102:38c7:b0:4c4:dead:59a3 with SMTP id ada2fe7eead31-4c855383805mr9512382137.2.1744026620711;
        Mon, 07 Apr 2025 04:50:20 -0700 (PDT)
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com. [209.85.221.172])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-8738b28b447sm1714598241.21.2025.04.07.04.50.19
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Apr 2025 04:50:20 -0700 (PDT)
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-523d8c024dfso1794547e0c.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Apr 2025 04:50:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXfeV6aAIsjpEpjhefA00V+1JVVKJq8OmUzeQxIYnyoARWib+OPq2T8iedIE1uPx7cGz9IcqKNYJIHEVZCi05Yy@lists.infradead.org
X-Received: by 2002:a05:6102:f86:b0:4bb:eb4a:f9f2 with SMTP id
 ada2fe7eead31-4c8553aea85mr9265953137.9.1744026619724; Mon, 07 Apr 2025
 04:50:19 -0700 (PDT)
MIME-Version: 1.0
References: <20250228182928.2645936-1-fvdl@google.com> <20250228182928.2645936-3-fvdl@google.com>
In-Reply-To: <20250228182928.2645936-3-fvdl@google.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 7 Apr 2025 13:50:08 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVWviQ7O9yBFE3f=ev0eVb1CnsQvR6SKtEROBbM6z7g3w@mail.gmail.com>
X-Gm-Features: ATxdqUH7PH4vq6Q_RgYLRrVLiKbH_NIvyy9Ay2B6TtCJJJg26LiT8zWJ4O0OrhI
Message-ID: <CAMuHMdVWviQ7O9yBFE3f=ev0eVb1CnsQvR6SKtEROBbM6z7g3w@mail.gmail.com>
Subject: Re: [PATCH v5 02/27] mm, cma: support multiple contiguous ranges, if requested
To: Frank van der Linden <fvdl@google.com>
Cc: akpm@linux-foundation.org, muchun.song@linux.dev, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, yuzhao@google.com, usamaarif642@gmail.com, 
	joao.m.martins@oracle.com, roman.gushchin@linux.dev, ziy@nvidia.com, 
	david@redhat.com, Arnd Bergmann <arnd@arndb.de>, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_045024_633558_BE226134 
X-CRM114-Status: GOOD (  35.59  )
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

Hi Frank,

On Fri, 28 Feb 2025 at 19:30, Frank van der Linden <fvdl@google.com> wrote:
> Currently, CMA manages one range of physically contiguous memory.
> Creation of larger CMA areas with hugetlb_cma may run in to gaps
> in physical memory, so that they are not able to allocate that
> contiguous physical range from memblock when creating the CMA
> area.
>
> This can happen, for example, on an AMD system with > 1TB of memory,
> where there will be a gap just below the 1TB (40bit DMA) line. If
> you have set aside most of memory for potential hugetlb CMA allocation,
> cma_declare_contiguous_nid will fail.
>
> hugetlb_cma doesn't need the entire area to be one physically
> contiguous range. It just cares about being able to get physically
> contiguous chunks of a certain size (e.g. 1G), and it is fine
> to have the CMA area backed by multiple physical ranges, as
> long as it gets 1G contiguous allocations.
>
> Multi-range support is implemented by introducing an array of
> ranges, instead of just one big one. Each range has its own bitmap.
> Effectively, the allocate and release operations work as before,
> just per-range. So, instead of going through one large bitmap, they
> now go through a number of smaller ones.
>
> The maximum number of supported ranges is 8, as defined in
> CMA_MAX_RANGES.
>
> Since some current users of CMA expect a CMA area to just use one
> physically contiguous range, only allow for multiple ranges if a
> new interface, cma_declare_contiguous_nid_multi, is used. The other
> interfaces will work like before, creating only CMA areas with
> 1 range.
>
> cma_declare_contiguous_nid_multi works as follows, mimicking the
> default "bottom-up, above 4G" reservation approach:
>
> 0) Try cma_declare_contiguous_nid, which will use only one
>    region. If this succeeds, return. This makes sure that for
>    all the cases that currently work, the behavior remains
>    unchanged even if the caller switches from
>    cma_declare_contiguous_nid to cma_declare_contiguous_nid_multi.
> 1) Select the largest free memblock ranges above 4G, with
>    a maximum number of CMA_MAX_RANGES.
> 2) If we did not find at most CMA_MAX_RANGES that add
>    up to the total size requested, return -ENOMEM.
> 3) Sort the selected ranges by base address.
> 4) Reserve them bottom-up until we get what we wanted.
>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Signed-off-by: Frank van der Linden <fvdl@google.com>

Thanks for your patch, which is now commit c009da4258f9885c
("mm, cma: support multiple contiguous ranges, if requested")
in v6.15-rc1.

After this patch, the printed base address becomes zero on several
Renesas arm32/arm64 platforms:

  - Koelsch (R-Car M2-W):

      -cma: Reserved 64 MiB at 0x7c000000 on node -1
      +cma: Reserved 64 MiB at 0x00000000

   - Salvator-XS (R-Car H3 ES2.0):

      -cma: Reserved 128 MiB at 0x0000000078000000 on node -1
      +cma: Reserved 128 MiB at 0x0000000000000000

  - Gray Hawk Single (R-Car V4H):

      -cma: Reserved 128 MiB at 0x00000000b8000000 on node -1
      +cma: Reserved 128 MiB at 0x0000000000000000

None of these have actual RAM at address zero.  As I haven't noticed
any other impact on system operation, I do not know if this is purely
a cosmetic issue, or if it can cause real problems.

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

