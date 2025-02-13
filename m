Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F192C021A4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 16:06:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NHtO1l0Sm3xnCkozanEaDdmWEvTg249bwN+Pta/EflE=; b=S+5ilJfSIH29hyhdv6m9ATo0nb
	2TbtESeBiufEmpxokxR7SMPmOLERp8QzCgQobFaw6S4djKHQxrB0f+l0aEwUUuHWEnMkVJhNVoQtf
	nRTgb2vk72HCEJRaFTF0HtrHbiONq2ZZCxeFG5za5FNcM6rmR54oaeExBSQ74pPSrauo9MgjHyntf
	2/ywVGUU3AVDis0UIyf45aKeF+XAfBi9ZBQajO/3yq7oAp6pucsDqleWBBf0+wDaBku67y3Jko1Kx
	xRXmy5k8uQAoQzDpWNzq1CdyksqfjjGjNFA4J3782r4nZMuXJgxB9NXxCsNjkS7PnR9CP3BFh0d8e
	OJXBmzEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tibj1-0000000BgGq-1mae;
	Thu, 13 Feb 2025 16:06:03 +0000
Received: from mail-oi1-x234.google.com ([2607:f8b0:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tibbD-0000000BeGf-0xgw
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Feb 2025 15:58:00 +0000
Received: by mail-oi1-x234.google.com with SMTP id 5614622812f47-3f3bac262f9so614397b6e.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Feb 2025 07:57:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739462278; x=1740067078; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NHtO1l0Sm3xnCkozanEaDdmWEvTg249bwN+Pta/EflE=;
        b=j8ch6Bl3S6+buGX0KIeHOUa8qcZK/e4Jzll2R7er3y8vUmhweoy5MfY6PyNyOg2kcC
         Pi82cifj2CZfjo5RsNaKPPV3noPXzNPIneSSK3I9WwMXCDN7ZqCRrDywcK6B3Vcm2qjw
         n935cqbWH2nDUI9biBSQ5PGP01dYA87XkTxtZ20pJtsElVlEixxT2g7lf986e7hkRL9P
         AYii813WQcN+uUGdXkls44RVIsb4EbzPXpzFyF3sw11cZ7QaOe+Qbhp6HzeulY2VioU4
         TLMJ78JgqFJ/KhXoASEZ92a01GGaAgKQ/Wz9rr06ANGTuLiFblvtvu1UCFtcT7axIGTU
         PJnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739462278; x=1740067078;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NHtO1l0Sm3xnCkozanEaDdmWEvTg249bwN+Pta/EflE=;
        b=V0/5aVFdBFXCvABivy3pWFDi5IPJzDCPtuEMaoRBfHYei2fMItTjyO79++/sV8EDgl
         76tMkSm1ZbegmkmJdnvqmIn82hqgAFghHBy4IpaKs8d/u8MGHz7iMVYZZ3qxqgUDAODx
         8SKpb9I7BUaNOVrK/JyvaGFeFF59mZgTe2ExcJ4PKq+DVygFbyk6E3EWgA0txhS3xqN1
         c15Xw4xSCf8rKblIP0dzJSn7DD2B/MPMFrbgdGApAxauw55zvcs/bkyCI2LXvlrZ2mqj
         8J+TUh9Wy3HWLErujqqAfYQf/jOQFOMQis5+Cih3wJb8tmRfZzok3defHTLyUP+X8d8F
         hNew==
X-Forwarded-Encrypted: i=1; AJvYcCXL1wGm0GMEuqop6BsXHPgg23hh85SK0KnaOjdQwYiEzSpPAdbL8jmzmPwIjxXkdngwuf+y6JatQv3izSV11pVU@lists.infradead.org
X-Gm-Message-State: AOJu0YyMI4y2DhUp2rj5e9fdYcthVjrQExc3nkM6mtm5lfr+3At8mtZL
	p0AN2dk3R6s1y/AJNtUxQk7phfEjt+WNNfjF3pbVqNfLvxc/kjBhInyiPryOscUMhM1VVA8FH6S
	nWLCcfsB2kbxtSIAnGB5l5RycFGfXNGPtedDloQ==
X-Gm-Gg: ASbGncsEsXhpRc+Ir1FLrsyZnRK2Q80z0cJpJ7gnq8t0ieVdUXZVHlS/YDmUxNsSZP1
	NuFwqgqPPW5xBhUcV65t0gGMLT20dnU7FQl71yg/9HzCM9YclM7SaqOso59hG8zLfw2zxo8w3JA
	==
X-Google-Smtp-Source: AGHT+IFP5g43bicIDLt/S4uI2Sk6WesrFKEkZAgRcsR6UVnbplWcWySy+Pe58g7cxxxYF2yjdv9hpHSaFgfwFOWE+Ow=
X-Received: by 2002:a05:6870:f112:b0:2b8:84d7:ddd5 with SMTP id
 586e51a60fabf-2b8d68c6af2mr4406581fac.39.1739462278059; Thu, 13 Feb 2025
 07:57:58 -0800 (PST)
MIME-Version: 1.0
References: <20241217100809.3962439-1-jens.wiklander@linaro.org>
 <20250212205613.4400a888@collabora.com> <CAFA6WYOaGEPj0xNEDBCoEmjJreEHChjQ2hyXRJ_CYoGhiBonfw@mail.gmail.com>
 <20250213093557.278f5d19@collabora.com> <CAFA6WYOJkSRsH-15QdqXNMd08Q=Dg4NkRd1Cr9LXA+5nozTF6g@mail.gmail.com>
 <20250213134008.4cbef142@collabora.com> <CAPj87rM5Y=-Jgf4mwukicF6Yb-vccn2fpG2X1jNq0upH2+cAEQ@mail.gmail.com>
In-Reply-To: <CAPj87rM5Y=-Jgf4mwukicF6Yb-vccn2fpG2X1jNq0upH2+cAEQ@mail.gmail.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Thu, 13 Feb 2025 16:57:42 +0100
X-Gm-Features: AWEUYZmgVASDSvu5hsJWJHBSSPIof2Z6xxr-T5u2MSp4prWGrnjV2aHs43vhfXo
Message-ID: <CAHUa44G9hw-z6wzxg=HkVAxPKEW1yES5JTEqRWMvJUJAtcUDkQ@mail.gmail.com>
Subject: Re: [PATCH v4 0/6] TEE subsystem for restricted dma-buf allocations
To: Daniel Stone <daniel@fooishbar.org>
Cc: Boris Brezillon <boris.brezillon@collabora.com>, Sumit Garg <sumit.garg@linaro.org>, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	op-tee@lists.trustedfirmware.org, linux-arm-kernel@lists.infradead.org, 
	Olivier Masse <olivier.masse@nxp.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Yong Wu <yong.wu@mediatek.com>, Sumit Semwal <sumit.semwal@linaro.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	John Stultz <jstultz@google.com>, "T . J . Mercier" <tjmercier@google.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, azarrabi@qti.qualcomm.com, 
	Florent Tomasin <florent.tomasin@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_075759_284448_323910AC 
X-CRM114-Status: GOOD (  39.66  )
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

Hi,

On Thu, Feb 13, 2025 at 3:05=E2=80=AFPM Daniel Stone <daniel@fooishbar.org>=
 wrote:
>
> Hi,
>
> On Thu, 13 Feb 2025 at 12:40, Boris Brezillon
> <boris.brezillon@collabora.com> wrote:
> > On Thu, 13 Feb 2025 14:46:01 +0530 Sumit Garg <sumit.garg@linaro.org> w=
rote:
> > > Yeah but all the prior vendor specific secure/restricted DMA heaps
> > > relied on DT information.
> >
> > Right, but there's nothing in the DMA heap provider API forcing that.
>
> Yeah. DMA heaps are just a way to allocate memory from a specific
> place. It allows people to settle on having a single way to do
> allocations from weird platform-specific places; the only weird
> platform-specific part userspace needs to deal with is figuring out
> the name to use. The rest is at least a unified API: the point of
> dma-heaps was exactly to have a single coherent API for userspace, not
> to create one API for ZONE_CMA and DT ranges and everyone else doing
> their own thing.
>
> > > Rather than that it's better
> > > for the user to directly ask the TEE device to allocate restricted
> > > memory without worrying about how the memory restriction gets
> > > enforced.
> >
> > If the consensus is that restricted/protected memory allocation should
> > always be routed to the TEE, sure, but I had the feeling this wasn't as
> > clear as that. OTOH, using a dma-heap to expose the TEE-SDP
> > implementation provides the same benefits, without making potential
> > future non-TEE based implementations a pain for users. The dma-heap
> > ioctl being common to all implementations, it just becomes a
> > configuration matter if we want to change the heap we rely on for
> > protected/restricted buffer allocation. And because heaps have
> > unique/well-known names, users can still default to (or rely solely on)
> > the TEE-SPD implementation if they want.
> >
> > > There have been several attempts with DMA heaps in the past which all
> > > resulted in a very vendor specific vertically integrated solution. Bu=
t
> > > the solution with TEE subsystem aims to make it generic and vendor
> > > agnostic.
> >
> > Just because all previous protected/restricted dma-heap effort
> > failed to make it upstream, doesn't mean dma-heap is the wrong way of
> > exposing this feature IMHO.
>
> To be fair, having a TEE implementation does give us a much better
> chance of having a sensible cross-vendor plan. And the fact it's
> already (sort of accidentally and only on one platform AFAICT) ready
> for a 'test' interface, where we can still exercise protected
> allocation paths but without having to go through all the
> platform-specific setup that is inaccessible to most people, is also
> really great! That's probably been the biggest barrier to having this
> tested outside of IHVs and OEMs.
>
> But just because TEE is one good backend implementation, doesn't mean
> it should be the userspace ABI. Why should userspace care that TEE has
> mediated the allocation instead of it being a predefined range within
> DT?

The TEE may very well use a predefined range that part is abstracted
with the interface.

> How does userspace pick which TEE device to use?

There's normally only one and even if there is more than one it should
be safe to assume that only one of them should be used when allocating
restricted memory (TEE_GEN_CAP_RSTMEM from TEE_IOC_VERSION).

>  What advantage
> does userspace get from having to have a different codepath to get a
> different handle to memory? What about x86?
>
> I think this proposal is looking at it from the wrong direction.
> Instead of working upwards from the implementation to userspace, start
> with userspace and work downwards. The interesting property to focus
> on is allocating memory, not that EL1 is involved behind the scenes.

From what I've gathered from earlier discussions, it wasn't much of a
problem for userspace to handle this. If the kernel were to provide it
via a different ABI, how would it be easier to implement in the
kernel? I think we need an example to understand your suggestion.

Cheers,
Jens

