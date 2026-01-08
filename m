Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70392D1D47D
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 16:21:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HJoZfm5SHVdr1yyHhKTweECAeQtP5+kYrvSv/kZ9VQk=; b=gyVRWhwMYGRBTkq9d5MH2ktAQq
	5W2LshBIgwuBZIzttoHakJR1mISp/54v2qoYLjm902RGKyWptt3ZzuMWd4H53YzG7XHbD9OxmluLA
	J/k6yuuGW58UJStAUtd90mqN8DcN5xjFF5guusIehDngsVr2kLkUQxSJ7Uk0NcDMkUDPBnl6AgFik
	9n/5VnQvgG0NAE0DttXhDUHzZZshm8P+Cn5eOMjS4oD5rFBJBEZD+56brVPeWVDCCGy1QojaSmg5g
	7Naf5mA3Nob0U3MSdsBE7bTkFGqtAcECeCA0CToAi3SF3H4s2sjs97AH/UU22yQVzaaa7Hp74kUOz
	KhS8ZlGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdslN-000000006V9-3LWz;
	Thu, 08 Jan 2026 16:21:29 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdslJ-000000006TR-04ge
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Jan 2026 16:21:28 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-64baa44df99so20140a12.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 08 Jan 2026 08:21:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1767889283; cv=none;
        d=google.com; s=arc-20240605;
        b=WfgKmX3vLDDr2uoHhBq5794q4vJWpG/XcZdQ2ScPhJ7YhHBp+Yc50FdbcXLfFboaCK
         6vDCn71yh0h7m0oVv0K1bor/JNtQUlMVLdpL/NBNmJjRHQW3ndV+oV5PWnIiitmiZ63A
         e/peeMcfiziqbjV5tBcYZ1TeHCVuxBmGh69GAWRpcbtlKqTaaPlFZdoSoyK9SBAHhff/
         uzDOgb4S+3xa/0BdIMfN6v/L+dgJp9Qe7Cv0Q10g+JR6JWBycW8S3M0jtIoFgAj0m4+p
         SwMFppXWyjjBtRnLAYnLu1wTYQqtJQRwIPs1hivYfYadXB3ok5UMJgX4I7Srh8zYq3WA
         CN8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HJoZfm5SHVdr1yyHhKTweECAeQtP5+kYrvSv/kZ9VQk=;
        fh=By2QYm/kKeErdKiaRFgcmBIqZWk/uBNWUru80GLA+ro=;
        b=CsSpOxkm25BoC7M6/uFNnffrRoaSqY28+wVlEz+r99q5j4rpxvmPs0Vd36RxC0KADo
         vsKZD9/UzJwH87J/GeN34q+nwCvmAET022vwDOk1h1PhMR3JODFEddQKqLSbysB89A+o
         u/aC3fiW7leRntOiq3hk7VgVg+4mKky7TJ3ph1FxgevBT1YxWWPp8oEKkfAAVDBAayKs
         1EQqLsMaQ62+PpJAc452TEuX6qGBC+1r+5O8IE4EXUuNl/aWBOxl6GK4ZEw2TBU8QQ4Z
         3mfrE64kja6mbez0CI8De1r8ZvgiqCphbLKpDqEM1VeIcAaQjFgFBDFui+yIjU0o7CBZ
         ovrA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767889283; x=1768494083; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HJoZfm5SHVdr1yyHhKTweECAeQtP5+kYrvSv/kZ9VQk=;
        b=KxsTSmCrHA3Ri5q2EP0J/WnnOY94++nbr+5zmg4vcmcZiLDZvBXG4xmZmwQOqZA0g7
         2h2/t4OxbRK12J7Ol8VgMB6y8lIF2y7v+kF422Sdluzrcdxg6ybADBqmHXTkhAD1Pghx
         mk0HGgEmRtjdBAmESTDcFUBK8Wllucl3h2D/ZRuBJi+UCYVEe/rDveEYHAJU8IoZwT8R
         /dI/pvJr2X7+fmV+z1yDJL97UeIhs11QyG+qRSSuiHsaGfYImqvqnDbAsNVpx1BI/8Sm
         pW+OSf/Do6lxwugAca+l+uFfIAX8WGmhpxjGDDxOZaQLqsmoV0vWd+eSkBprKnJvHrPy
         cEKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767889283; x=1768494083;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HJoZfm5SHVdr1yyHhKTweECAeQtP5+kYrvSv/kZ9VQk=;
        b=jVMLEUKPhCbcHteN/UGvEieY4fiuliYObeA8A0s2IPJLAj2hs+unLUzwlDWgXajQPl
         HS07GQhaZ5dzzbdEcFikMXihfCNMNCWqrouLlIbBTvi/4tcUaPLhZ4KtBV1gJ8Syk/Yf
         QfY8WypsQv7vi7SWskaJ9OhSKDaZrEwdt2uRs9a+aUOXVUOf9j3x+oQcM9tD1RrwNKoZ
         lKQwnKD3/W9g6MNU213DkQhZUjA2oaKwCagMxdHdsw1B1m6k8HFvI+QhpV2QHPHiC+8o
         pigCUMr/9UDgSIs6bi3tKAW2EO5Tyuek3eF7pcsGrgX0pxgu8nmplWXSqhXkcMpVBRxi
         1S2g==
X-Forwarded-Encrypted: i=1; AJvYcCVw7FK8jbqEMs5cn7cWclMEbWOKNvGROwAQ7GwRU4wS+XS/PmAsMvLgNRJ61AzYGT0p3vgho1LmNO/rjuBysbtn@lists.infradead.org
X-Gm-Message-State: AOJu0YzyVKRFxWEiFdaItpqrdiqdAS5tIYdKvmZnzk7iOevs4cb31ILg
	Zp11YxVDidk0wPDd4oleVtEqLZym8xrfl67+GvEQ0+Ey8uF9k5JCzEGUFqYeQ6SOprpIbq6z0z9
	QY15mziSBeUhO2EG2CseiUqywsAGSXRGWazgWXSpG
X-Gm-Gg: AY/fxX7khTa795nZpesLOeNvory3jXn3Qf9EXswObSoG+bJlHWUsu3y6nWU+hZ3xXAd
	L6qEYRAk/FZTV9cQA0VVJQVFVaivNAy0D1S0aUh2eSqmrlzaVsvwWtfsxsadm6s5uZioeDKxBuG
	HfH9RvMLbU8SNj62iZb6ssQ9RMBgSy/fw5XtW+IN1/aGb69FlvOEYN1hJ24CRxUyi35OMGZDBCT
	r5+QLvcSt+4vd102r9zsy0BNX5PRM4kGOZfayxKnNdxYBZMvrHnZCqK0leYJm/fVmibtnm5c0b1
	Om0JzKONDcnZB6nbKfYybKJZA7frNA==
X-Received: by 2002:aa7:d305:0:b0:64f:8fc5:251c with SMTP id
 4fb4d7f45d1cf-650b8824940mr27337a12.18.1767889282916; Thu, 08 Jan 2026
 08:21:22 -0800 (PST)
MIME-Version: 1.0
References: <20260108113846.56179-1-smostafa@google.com> <20260108125934.GB545276@ziepe.ca>
 <CAFgf54ocNybHR_Mp1+i7cff-jkeMUV1QxBCt04jnKxwfwnyUfQ@mail.gmail.com>
 <CAFgf54o+YZUyZTszFt-uBW4ZhjrAMsfPFUb9kKTK1uHWdS+++w@mail.gmail.com> <20260108144520.GE545276@ziepe.ca>
In-Reply-To: <20260108144520.GE545276@ziepe.ca>
From: Mostafa Saleh <smostafa@google.com>
Date: Thu, 8 Jan 2026 16:21:10 +0000
X-Gm-Features: AQt7F2q7zAjQEJb7B7Z3UzD_3MZv9K7QzyaGgeYqN-ppW1uuZW9n5E_HzFAEE-c
Message-ID: <CAFgf54rkwipUMQH6452xoKXT_FwcE2s=TNwoTZd3_TrK5WJNCg@mail.gmail.com>
Subject: Re: [PATCH] iommu/io-pgtable-arm: Drop DMA API usage for CMOs
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, robin.murphy@arm.com, will@kernel.org, 
	joro@8bytes.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_082125_169873_83EADBD7 
X-CRM114-Status: GOOD (  29.65  )
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

On Thu, Jan 8, 2026 at 2:45=E2=80=AFPM Jason Gunthorpe <jgg@ziepe.ca> wrote=
:
>
> On Thu, Jan 08, 2026 at 01:44:51PM +0000, Mostafa Saleh wrote:
> > On Thu, Jan 8, 2026 at 1:27=E2=80=AFPM Mostafa Saleh <smostafa@google.c=
om> wrote:
> > >
> > > On Thu, Jan 8, 2026 at 12:59=E2=80=AFPM Jason Gunthorpe <jgg@ziepe.ca=
> wrote:
> > > >
> > > > On Thu, Jan 08, 2026 at 11:38:46AM +0000, Mostafa Saleh wrote:
> > > > > Jason pointed out that the DMA-API calls are not really needed [2=
].
> > > > >
> > > > > Looking more into this. Initially, the io-pgtable API let drivers
> > > > > do the CMOs using tlb::flush_pgtable() where drivers were using t=
he
> > > > > DMA API (map/unmap_single) only to do CMOs as the low-level cache
> > > > > functions won=E2=80=99t be available for modules.
> > > >
> > > > This isn't what I ment at all, the iommu-pages.h could do the flush
> > > > inside itself using the already existing
> > > > iommu_pages_flush_incoherent() instead of open coding the dma api
> > > > calls everwhere, and maybe that could directly call the arch functi=
on
> > > > on arm (as x86 does) which would be easier to implement in pkvm's
> > > > hypervisor.
> > > >
> > >
> > > I see, so basically, we add the check for IOMMU_PAGES_USE_DMA_API in
> > > iommu_pages_flush_incoherent() with the DMA-API stuff and call it fro=
m
> > > the io-pgtable-arm instead.
> > >
> >
> > iommu_pages_flush_incoherent() is also used to flush non-cacheable
> > pages in generic_pt from flush_writes_*(), so it might not be that
> > simple; We might need to add a new variant.
>
> There are no non-cachable pages in the iommu-pages system???
>

Sorry I meant to flush writes for memory accessed by not-coherent IOMMUs.

> All memory comes from folios and is mapped to the CPU cachable.
>
> The general API requires the user of iommu-pages to know if the
> underlying HW is going to do non-coherent DMA, in this case it must
> call iommu_pages_flush_incoherent() before the HW does DMA.
>
> Effectively what I'm saying here is to convert the arm page table to
> use iommu-pages and then put your pkvm abstraction at the iommu-pages
> level instead of trying to hack up all these users.
>

I see, I need to check how that plays with the custom allocator in the
io-pgtable though. I will look further into it.

Thanks,
Mostafa

> You can also do the same conversion to the smmu driver to use
> iommu-pages instead of DMA API, AMD and Intel are doing this already.
>
> Jason

