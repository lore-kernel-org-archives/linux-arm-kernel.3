Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A278C3ABA3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 May 2025 21:20:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JWyQw8Cds5LESduVc1Rgu5TXLU2igPw8biM/GPcGcEE=; b=RLbCpN+zsVoTkFnZdIo24HnOti
	juDaavB1plrfOSG9y3n3oZL6Ya8cYKml7t+ebTkY5HE+K5RKDG/M+LLmsTt9iZXoABKK6YtGurauG
	2PLD9HJRoH2M0hCSTFyZFLqGtWpXLBonEPtGbfPF/bnD5o93EkVa7nvNN2dB/lEIkEpK8tkdC2M4B
	RON8XzP3j5udOGK8hOOAYboKJ3pog9Ddn70KrCP/brazBYd3W3NNn0leiTDae3tubOKGmN7JnnSfL
	YODnAfDPDMhNKgrTFXiJrmiANmaHrfNrAVPfsnuclIRK6mlUPZDqFLiZFrDneyCi/rEeJ5aagVKnn
	1RT8DQTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAbJv-0000000Gz3G-2g1H;
	Thu, 01 May 2025 21:19:51 +0000
Received: from mail-qt1-x832.google.com ([2607:f8b0:4864:20::832])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAbHz-0000000Gy5A-3rPK
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 May 2025 21:17:53 +0000
Received: by mail-qt1-x832.google.com with SMTP id d75a77b69052e-47e9fea29easo34291cf.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 01 May 2025 14:17:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746134271; x=1746739071; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JWyQw8Cds5LESduVc1Rgu5TXLU2igPw8biM/GPcGcEE=;
        b=Lw1figbNSwIj20f21oEUweijTfzQzy12o0wy28u725FUb0ATBRQRB9xuYfr9tYzOj1
         8HV4ZJK8xSu5h28ExOjbboCoW8Y8443eBb4c849pQIs0BlfI3RkmwMYjy0EE3q6p23+2
         Rgv1w9tlpY9YbFPD0z7OKVefsAfNvF7La6n2kvfC3O4lcJlL8TdqW1G+vP41sr/lf01p
         zKgMTZlyLSBuCjAdrYJps25UPmAMfPaLVTmRcskhH7MAtruz16gq66AExHBXFHyPMpNP
         Vf5R8iYDcx2pDE8vjDFzGYXRkXW7hNmtqiyrlg2nR3Oa/jQWHrWaghv+Xvrw+5qtFs5a
         QD0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746134271; x=1746739071;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JWyQw8Cds5LESduVc1Rgu5TXLU2igPw8biM/GPcGcEE=;
        b=OVXqFhU+bsjtO9xfmrxFbRFIYbJQgzwoAX0HtAU40lgUNCZXFGfVhPJ4cHApF3wiJ8
         xQA1dPnxfnTyAKNd7Iv+4tdLDbts36eGdo46fLI/83nn5UsBARtF+gMzGzYne5ilESCx
         5Td1XSAUOr/0c8/7Wse5YR0ryYElJfN2gqD19YFZGMfgSvMZSPQKwoGq2RJVu2BARsgI
         SjgdcJw2mVyBwNxG/V5U8rmAko4IbwQ/p9633gyMcbDqDmyeq3KyRcR+pkti+ZRSAX7E
         fqfEiZoZBBqkvJRooS8QDyVEPZt374ajPgqg4+4ZRx4YXV5ign9GOD9dc2bCzK8rBwSa
         /0gA==
X-Forwarded-Encrypted: i=1; AJvYcCVOepSHWuzH897SXpm6ZGADzjbJJcMHyIkFBQYVz9q89UrdAj1RGZOFOVIGRlRfHbyJMBxZMa2HSSrQzsyTvRzN@lists.infradead.org
X-Gm-Message-State: AOJu0YykKuwUr62JWuF7MSz2VyPgfxg3FEcZPIbm6fTEJKjenfHHhre5
	1oxt4C6koyRvCYoH7x/YGGEJyjpjtaSXYXUEzIlytbFUVZ3Jy3moU9GUvg5DMGTjzNq9/p0sFSD
	0nyj4jOh6vog479lhpVBHspnVSXhx0WnVqs9W
X-Gm-Gg: ASbGncuoWdvbyXKrLN2VqipZMNHYdVU4BorCl7RfSIiVZ8pofPrtW/tFO4gYImdGKrg
	tTxtOCnfxxY2PWHoh6k4+NrJkYrop50NZmUI4ZGjLKYKaDBt4QWJ/u13BkNodR1RY6Y5e0hgN09
	0P6AmjK/qL+4eOAiEPP0q4593S3LxcmdM6Nd+pZ8ahc6647TfrEUQa1ue3
X-Google-Smtp-Source: AGHT+IGfumJSsiisStXyn8AuifGkC9XEdJhdj92CWWPKME4nvzUrmJ0CTeBR/ov+OTDdJdNRZX5qbGMbAy/mLDFtJ18=
X-Received: by 2002:ac8:584f:0:b0:47a:cc58:1fb0 with SMTP id
 d75a77b69052e-48b0c80e383mr4627621cf.3.1746134270300; Thu, 01 May 2025
 14:17:50 -0700 (PDT)
MIME-Version: 1.0
References: <20250501052532.1903125-1-jyescas@google.com> <15428BF6-A7DD-44ED-B225-AECD7866394C@nvidia.com>
In-Reply-To: <15428BF6-A7DD-44ED-B225-AECD7866394C@nvidia.com>
From: Juan Yescas <jyescas@google.com>
Date: Thu, 1 May 2025 14:17:38 -0700
X-Gm-Features: ATxdqUHh-eQxAZeQPnN6vxzYF4KED7BDzIubnWMQBvU9nZhpT5jXU4ibXzkaJaE
Message-ID: <CAJDx_riTDWUkFSUr9GenJMQ1Oi1=Q4wU5iNE1JfX5wWnCSesVg@mail.gmail.com>
Subject: Re: [PATCH] mm: Add ARCH_FORCE_PAGE_BLOCK_ORDER to select page block order
To: Zi Yan <ziy@nvidia.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, tjmercier@google.com, 
	isaacmanjarres@google.com, surenb@google.com, kaleshsingh@google.com, 
	Vlastimil Babka <vbabka@suse.cz>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, David Hildenbrand <david@redhat.com>, 
	Mike Rapoport <rppt@kernel.org>, Minchan Kim <minchan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250501_141751_963560_A4AFBD86 
X-CRM114-Status: GOOD (  50.49  )
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

On Thu, May 1, 2025 at 11:49=E2=80=AFAM Zi Yan <ziy@nvidia.com> wrote:
>
> On 1 May 2025, at 1:25, Juan Yescas wrote:
>
> > Problem: On large page size configurations (16KiB, 64KiB), the CMA
> > alignment requirement (CMA_MIN_ALIGNMENT_BYTES) increases considerably,
> > and this causes the CMA reservations to be larger than necessary.
> > This means that system will have less available MIGRATE_UNMOVABLE and
> > MIGRATE_RECLAIMABLE page blocks since MIGRATE_CMA can't fallback to the=
m.
> >
> > The CMA_MIN_ALIGNMENT_BYTES increases because it depends on
> > MAX_PAGE_ORDER which depends on ARCH_FORCE_MAX_ORDER. The value of
> > ARCH_FORCE_MAX_ORDER increases on 16k and 64k kernels.
> >
> > For example, the CMA alignment requirement when:
> >
> > - CONFIG_ARCH_FORCE_MAX_ORDER default value is used
> > - CONFIG_TRANSPARENT_HUGEPAGE is set:
> >
> > PAGE_SIZE | MAX_PAGE_ORDER | pageblock_order | CMA_MIN_ALIGNMENT_BYTES
> > -----------------------------------------------------------------------
> >    4KiB   |      10        |      10         |  4KiB * (2 ^ 10)  =3D  4=
MiB
> >   16Kib   |      11        |      11         | 16KiB * (2 ^ 11) =3D  32=
MiB
> >   64KiB   |      13        |      13         | 64KiB * (2 ^ 13) =3D 512=
MiB
> >
> > There are some extreme cases for the CMA alignment requirement when:
> >
> > - CONFIG_ARCH_FORCE_MAX_ORDER maximum value is set
> > - CONFIG_TRANSPARENT_HUGEPAGE is NOT set:
> > - CONFIG_HUGETLB_PAGE is NOT set
> >
> > PAGE_SIZE | MAX_PAGE_ORDER | pageblock_order |  CMA_MIN_ALIGNMENT_BYTES
> > -----------------------------------------------------------------------=
-
> >    4KiB   |      15        |      15         |  4KiB * (2 ^ 15) =3D 128=
MiB
> >   16Kib   |      13        |      13         | 16KiB * (2 ^ 13) =3D 128=
MiB
> >   64KiB   |      13        |      13         | 64KiB * (2 ^ 13) =3D 512=
MiB
> >
> > This affects the CMA reservations for the drivers. If a driver in a
> > 4KiB kernel needs 4MiB of CMA memory, in a 16KiB kernel, the minimal
> > reservation has to be 32MiB due to the alignment requirements:
> >
> > reserved-memory {
> >     ...
> >     cma_test_reserve: cma_test_reserve {
> >         compatible =3D "shared-dma-pool";
> >         size =3D <0x0 0x400000>; /* 4 MiB */
> >         ...
> >     };
> > };
> >
> > reserved-memory {
> >     ...
> >     cma_test_reserve: cma_test_reserve {
> >         compatible =3D "shared-dma-pool";
> >         size =3D <0x0 0x2000000>; /* 32 MiB */
> >         ...
> >     };
> > };
> >
> > Solution: Add a new config ARCH_FORCE_PAGE_BLOCK_ORDER that
> > allows to set the page block order. The maximum page block
> > order will be given by ARCH_FORCE_MAX_ORDER.
> >
> > By default, ARCH_FORCE_PAGE_BLOCK_ORDER will have the same
> > value that ARCH_FORCE_MAX_ORDER. This will make sure that
> > current kernel configurations won't be affected by this
> > change. It is a opt-in change.
> >
> > This patch will allow to have the same CMA alignment
> > requirements for large page sizes (16KiB, 64KiB) as that
> > in 4kb kernels by setting a lower pageblock_order.
> >
> > Tests:
> >
> > - Verified that HugeTLB pages work when pageblock_order is 1, 7, 10
> > on 4k and 16k kernels.
> >
> > - Verified that Transparent Huge Pages work when pageblock_order
> > is 1, 7, 10 on 4k and 16k kernels.
> >
> > - Verified that dma-buf heaps allocations work when pageblock_order
> > is 1, 7, 10 on 4k and 16k kernels.
> >
> > Benchmarks:
> >
> > The benchmarks compare 16kb kernels with pageblock_order 10 and 7. The
> > reason for the pageblock_order 7 is because this value makes the min
> > CMA alignment requirement the same as that in 4kb kernels (2MB).
> >
> > - Perform 100K dma-buf heaps (/dev/dma_heap/system) allocations of
> > SZ_8M, SZ_4M, SZ_2M, SZ_1M, SZ_64, SZ_8, SZ_4. Use simpleperf
> > (https://developer.android.com/ndk/guides/simpleperf) to measure
> > the # of instructions and page-faults on 16k kernels.
> > The benchmark was executed 10 times. The averages are below:
> >
> >            # instructions         |     #page-faults
> >     order 10     |  order 7       | order 10 | order 7
> > --------------------------------------------------------
> >  13,891,765,770        | 11,425,777,314 |    220   |   217
> >  14,456,293,487        | 12,660,819,302 |    224   |   219
> >  13,924,261,018        | 13,243,970,736 |    217   |   221
> >  13,910,886,504        | 13,845,519,630 |    217   |   221
> >  14,388,071,190        | 13,498,583,098 |    223   |   224
> >  13,656,442,167        | 12,915,831,681 |    216   |   218
> >  13,300,268,343        | 12,930,484,776 |    222   |   218
> >  13,625,470,223        | 14,234,092,777 |    219   |   218
> >  13,508,964,965        | 13,432,689,094 |    225   |   219
> >  13,368,950,667        | 13,683,587,37  |    219   |   225
> > -------------------------------------------------------------------
> >  13,803,137,433  | 13,131,974,268 |    220   |   220    Averages
> >
> > There were 4.85% #instructions when order was 7, in comparison
> > with order 10.
> >
> >      13,803,137,433 - 13,131,974,268 =3D -671,163,166 (-4.86%)
> >
> > The number of page faults in order 7 and 10 were the same.
> >
> > These results didn't show any significant regression when the
> > pageblock_order is set to 7 on 16kb kernels.
> >
> > - Run speedometer 3.1 (https://browserbench.org/Speedometer3.1/) 5 time=
s
> >  on the 16k kernels with pageblock_order 7 and 10.
> >
> > order 10 | order 7  | order 7 - order 10 | (order 7 - order 10) %
> > -------------------------------------------------------------------
> >   15.8         |  16.4    |         0.6        |     3.80%
> >   16.4         |  16.2    |        -0.2        |    -1.22%
> >   16.6         |  16.3    |        -0.3        |    -1.81%
> >   16.8         |  16.3    |        -0.5        |    -2.98%
> >   16.6         |  16.8    |         0.2        |     1.20%
> > -------------------------------------------------------------------
> >   16.44     16.4            -0.04               -0.24%   Averages
> >
> > The results didn't show any significant regression when the
> > pageblock_order is set to 7 on 16kb kernels.
> >
> > Cc: Andrew Morton <akpm@linux-foundation.org>
> > Cc: Vlastimil Babka <vbabka@suse.cz>
> > Cc: Liam R. Howlett <Liam.Howlett@oracle.com>
> > Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> > Cc: David Hildenbrand <david@redhat.com>
> > CC: Mike Rapoport <rppt@kernel.org>
> > Cc: Zi Yan <ziy@nvidia.com>
> > Cc: Suren Baghdasaryan <surenb@google.com>
> > Cc: Minchan Kim <minchan@kernel.org>
> > Signed-off-by: Juan Yescas <jyescas@google.com>
> > ---
> >  arch/arm64/Kconfig              | 14 ++++++++++++++
> >  include/linux/pageblock-flags.h | 12 +++++++++---
> >  2 files changed, 23 insertions(+), 3 deletions(-)
> >
> > diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> > index a182295e6f08..d784049e1e01 100644
> > --- a/arch/arm64/Kconfig
> > +++ b/arch/arm64/Kconfig
> > @@ -1658,6 +1658,20 @@ config ARCH_FORCE_MAX_ORDER
> >
> >         Don't change if unsure.
> >
> > +config ARCH_FORCE_PAGE_BLOCK_ORDER
> > +     int "Page Block Order"
> > +     range 1 ARCH_FORCE_MAX_ORDER
> > +     default ARCH_FORCE_MAX_ORDER
> > +     help
> > +       The page block order refers to the power of two number of pages=
 that
> > +       are physically contiguous and can have a migrate type associate=
d to them.
> > +       The maximum size of the page block order is limited by ARCH_FOR=
CE_MAX_ORDER.
>
> Since memory compaction operates at pageblock granularity and pageblock s=
ize
> usually matches THP size, a smaller pageblock size degrades kernel
> anti-fragmentation mechanism for THP significantly. Can you add something=
 like
> the text below to the help section?
>
> "Reducing pageblock order can negatively impact THP generation successful=
 rate.
> If your workloads uses THP heavily, please use this option with caution."
>
Thanks Zi for Pointing this out. I will add the comment in the help section=
.

> Otherwise, Acked-by: Zi Yan <ziy@nvidia.com>
>
> I am also OK if you move this to mm/Kconfig.
>

This seems reasonable to me.

> > +
> > +       This option allows overriding the default setting when the page
> > +       block order requires to be smaller than ARCH_FORCE_MAX_ORDER.
> > +
> > +       Don't change if unsure.
> > +
> >  config UNMAP_KERNEL_AT_EL0
> >       bool "Unmap kernel when running in userspace (KPTI)" if EXPERT
> >       default y
> > diff --git a/include/linux/pageblock-flags.h b/include/linux/pageblock-=
flags.h
> > index fc6b9c87cb0a..ab3de96bb50c 100644
> > --- a/include/linux/pageblock-flags.h
> > +++ b/include/linux/pageblock-flags.h
> > @@ -28,6 +28,12 @@ enum pageblock_bits {
> >       NR_PAGEBLOCK_BITS
> >  };
> >
> > +#if defined(CONFIG_ARCH_FORCE_PAGE_BLOCK_ORDER)
> > +#define PAGE_BLOCK_ORDER CONFIG_ARCH_FORCE_PAGE_BLOCK_ORDER
> > +#else
> > +#define PAGE_BLOCK_ORDER MAX_PAGE_ORDER
> > +#endif /* CONFIG_ARCH_FORCE_PAGE_BLOCK_ORDER */
> > +
> >  #if defined(CONFIG_HUGETLB_PAGE)
> >
> >  #ifdef CONFIG_HUGETLB_PAGE_SIZE_VARIABLE
> > @@ -41,18 +47,18 @@ extern unsigned int pageblock_order;
> >   * Huge pages are a constant size, but don't exceed the maximum alloca=
tion
> >   * granularity.
> >   */
> > -#define pageblock_order              MIN_T(unsigned int, HUGETLB_PAGE_=
ORDER, MAX_PAGE_ORDER)
> > +#define pageblock_order              MIN_T(unsigned int, HUGETLB_PAGE_=
ORDER, PAGE_BLOCK_ORDER)
> >
> >  #endif /* CONFIG_HUGETLB_PAGE_SIZE_VARIABLE */
> >
> >  #elif defined(CONFIG_TRANSPARENT_HUGEPAGE)
> >
> > -#define pageblock_order              MIN_T(unsigned int, HPAGE_PMD_ORD=
ER, MAX_PAGE_ORDER)
> > +#define pageblock_order              MIN_T(unsigned int, HPAGE_PMD_ORD=
ER, PAGE_BLOCK_ORDER)
> >
> >  #else /* CONFIG_TRANSPARENT_HUGEPAGE */
> >
> >  /* If huge pages are not used, group by MAX_ORDER_NR_PAGES */
> > -#define pageblock_order              MAX_PAGE_ORDER
> > +#define pageblock_order              PAGE_BLOCK_ORDER
> >
> >  #endif /* CONFIG_HUGETLB_PAGE */
> >
> > --
> > 2.49.0.906.g1f30a19c02-goog
>
>
> --
> Best Regards,
> Yan, Zi

