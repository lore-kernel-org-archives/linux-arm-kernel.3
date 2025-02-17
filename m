Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB04BC021A0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Feb 2025 06:14:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MnZw/Q+2O7o0YRtcX5JOGAgQhTQPBSaQtuZqXRvPz8U=; b=OChq54bx0yA+7JPdCD4AsIW4Hr
	76JEJXXnJci6L1d3RXqRQ/KuS3adz/vcrNOsaHeqKlA5yEiDVFxSbEE7FQumpsJJxSkR/6lh4odZd
	Yl7OQVrPBlnzdilTP2sBCF9tzzGiZdpMGs1V+5ggonVU2vyg5jky9vg84BxkPeQQYJ0KfzukJzFm8
	2iB55S2GO2ijOkz1X/23jOJzn9GeMJlMZTJPeqfv3/j/MKaSgRXPwvoIgO2U5ZO7u205TFP4nm6i7
	9i9uAPoFpJ9vrT4K2JYutPRE6QaHigZDJ3Zr+egtMe2H2crE/6QpBeaz+qyvpHj2y0L5l9iEbi74x
	b34qqkNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjuOt-00000003RjD-2idj;
	Mon, 17 Feb 2025 06:14:39 +0000
Received: from mail-ua1-x92c.google.com ([2607:f8b0:4864:20::92c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjuNP-00000003RR9-3PpR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Feb 2025 06:13:09 +0000
Received: by mail-ua1-x92c.google.com with SMTP id a1e0cc1a2514c-868fa40bb9aso810606241.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 16 Feb 2025 22:13:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739772786; x=1740377586; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MnZw/Q+2O7o0YRtcX5JOGAgQhTQPBSaQtuZqXRvPz8U=;
        b=w87mJWmFlRa/dL2vRXABTWJF1EAzTPhvvr40W9WqtXeOvV+9O5rN2zeRp1mjglUKls
         v2JkEFRKXMaWvYstDotSzci799hj1WreT/5IoaUSCK2fWFcBQMi6v4LAimAJnTHJa01d
         XvK0u9yHqY5J+QgKonAKGrwOdaD/gleVUCQnMcA1Pf/1LuJw5znUsO28u9I7UyxlfLcp
         XQNzNQX1sisSYfNd0s7TsRvbXf6l75xs8rL8riE/nJUG0j3cCP75MC5mnvDPlSdxVSGm
         m81XcE4t2X3XWK7x8AhZoKzOBEPvaUbTk3YnlaPHfKrfBTUCqY22BJyFDD/rUV/tVMHe
         Ew9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739772786; x=1740377586;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MnZw/Q+2O7o0YRtcX5JOGAgQhTQPBSaQtuZqXRvPz8U=;
        b=EbQHT0AcvTsC4I+zIKNkxmK9MixDVmcrVXuQXwhVAXHSoWIPsCsKvZ8Civ7aSyjlE+
         RFXpTEShNoAcNbQevEYInTEhjcCWep98zfRCdzDde/VCz/nHaQZlvooB2UkAZzrLIyTv
         W9dMXoS+uh64dyPYfcq3KWnOS40YsxK4cytKzPlI3PiNPJDDUOa4GwPNs7oTpYivLeiQ
         5xfO/0I91ggdbMi5bqr0appdqNh7Wyvw4+smi9eSgdQxx3z5XIWwlV5AlVREZOezH3UW
         /IfAp6UzT+jRXaCjXRAnjOT7sNxtyYnHX0f9DMiFrEJ+ugspBqDzErIWF6gfzW5EtHgy
         A45Q==
X-Forwarded-Encrypted: i=1; AJvYcCWEhLQvarB2MRFiBlAh4jzBOzmfywO2OPXUbY0b1rWzThUH/rOldsQ4JVt25axMnhSto68rs/Oyy+XQrrXR/EjR@lists.infradead.org
X-Gm-Message-State: AOJu0YxD1nNgrS5+6TkoY/jfDivwVHi36khlC6rwqoADFajPgD1cvNaP
	RCpCLz+mNvystaeEnelG8su3CCs4niyHBtvPM5gWlFxDtdXcIY9BQ1XdL/ZNSCLDj+08iNDtUqp
	i7NuJiTicCcTOEHhfbY/cvfdXH/W0PjETErev1g==
X-Gm-Gg: ASbGnctGshg5diVi1Nb77awFZ6zcPApazWkD4Xt5Ykxn4LhD3iP5+no2v9H0KztYko5
	HxY82q3tK8ykDFroTqY9FuDiAB/wDHYD2DezsHesasAUPhfIxAJt3/C96iMpXlgrkGodwGsTCHA
	==
X-Google-Smtp-Source: AGHT+IHc7dJI6eafhkqnIan6daijofUVFUvH3V4pTfdEga1AHuyGIsGH9uwlauqjjjaAaHI1sy0aprZ+BW4OP8MJfMs=
X-Received: by 2002:a05:6102:c89:b0:4bb:eb4a:f9f2 with SMTP id
 ada2fe7eead31-4bd3fcc5af7mr3186375137.9.1739772786167; Sun, 16 Feb 2025
 22:13:06 -0800 (PST)
MIME-Version: 1.0
References: <20241217100809.3962439-1-jens.wiklander@linaro.org>
 <20250212205613.4400a888@collabora.com> <CAFA6WYOaGEPj0xNEDBCoEmjJreEHChjQ2hyXRJ_CYoGhiBonfw@mail.gmail.com>
 <20250213093557.278f5d19@collabora.com> <CAFA6WYOJkSRsH-15QdqXNMd08Q=Dg4NkRd1Cr9LXA+5nozTF6g@mail.gmail.com>
 <20250213134008.4cbef142@collabora.com> <CAPj87rM5Y=-Jgf4mwukicF6Yb-vccn2fpG2X1jNq0upH2+cAEQ@mail.gmail.com>
 <CAHUa44G9hw-z6wzxg=HkVAxPKEW1yES5JTEqRWMvJUJAtcUDkQ@mail.gmail.com>
 <CAPj87rPHnME5Osgnf5-FSAu22mDpLj=dzvhi_NqEcOwr1ThgGw@mail.gmail.com>
 <CAHUa44Gs0D1fBD0=+EDgcQUMeDv4knci9trUkYEc1J98qFV7HQ@mail.gmail.com>
 <CAFA6WYOuTwRPEh3L7+hMyARB_E73xmp+OwhKyS-r4+ryS7=9sw@mail.gmail.com> <20250214164856.0d2ead8a@collabora.com>
In-Reply-To: <20250214164856.0d2ead8a@collabora.com>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Mon, 17 Feb 2025 11:42:55 +0530
X-Gm-Features: AWEUYZnqsQNR6HgNOQ-KCjeibuktCio21DDJEy1SbMXh6xWHOITZYYTdEw2pDRY
Message-ID: <CAFA6WYPc6EHQwcPuMZRm4C1P6SoDrCzEPUmju_meupB6NXQ1sg@mail.gmail.com>
Subject: Re: [PATCH v4 0/6] TEE subsystem for restricted dma-buf allocations
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Jens Wiklander <jens.wiklander@linaro.org>, Daniel Stone <daniel@fooishbar.org>, 
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
X-CRM114-CacheID: sfid-20250216_221307_865367_6B836663 
X-CRM114-Status: GOOD (  59.26  )
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

On Fri, 14 Feb 2025 at 21:19, Boris Brezillon
<boris.brezillon@collabora.com> wrote:
>
> On Fri, 14 Feb 2025 18:37:14 +0530
> Sumit Garg <sumit.garg@linaro.org> wrote:
>
> > On Fri, 14 Feb 2025 at 15:37, Jens Wiklander <jens.wiklander@linaro.org=
> wrote:
> > >
> > > Hi,
> > >
> > > On Thu, Feb 13, 2025 at 6:39=E2=80=AFPM Daniel Stone <daniel@fooishba=
r.org> wrote:
> > > >
> > > > Hi,
> > > >
> > > > On Thu, 13 Feb 2025 at 15:57, Jens Wiklander <jens.wiklander@linaro=
.org> wrote:
> > > > > On Thu, Feb 13, 2025 at 3:05=E2=80=AFPM Daniel Stone <daniel@fooi=
shbar.org> wrote:
> > > > > > But just because TEE is one good backend implementation, doesn'=
t mean
> > > > > > it should be the userspace ABI. Why should userspace care that =
TEE has
> > > > > > mediated the allocation instead of it being a predefined range =
within
> > > > > > DT?
> > > > >
> > > > > The TEE may very well use a predefined range that part is abstrac=
ted
> > > > > with the interface.
> > > >
> > > > Of course. But you can also (and this has been shipped on real
> > > > devices) handle this without any per-allocation TEE needs by simply
> > > > allocating from a memory range which is predefined within DT.
> > > >
> > > > From the userspace point of view, why should there be one ABI to
> > > > allocate memory from a predefined range which is delivered by DT to
> > > > the kernel, and one ABI to allocate memory from a predefined range
> > > > which is mediated by TEE?
> > >
> > > We need some way to specify the protection profile (or use case as
> > > I've called it in the ABI) required for the buffer. Whether it's
> > > defined in DT seems irrelevant.
> > >
> > > >
> > > > > >  What advantage
> > > > > > does userspace get from having to have a different codepath to =
get a
> > > > > > different handle to memory? What about x86?
> > > > > >
> > > > > > I think this proposal is looking at it from the wrong direction=
.
> > > > > > Instead of working upwards from the implementation to userspace=
, start
> > > > > > with userspace and work downwards. The interesting property to =
focus
> > > > > > on is allocating memory, not that EL1 is involved behind the sc=
enes.
> > > > >
> > > > > From what I've gathered from earlier discussions, it wasn't much =
of a
> > > > > problem for userspace to handle this. If the kernel were to provi=
de it
> > > > > via a different ABI, how would it be easier to implement in the
> > > > > kernel? I think we need an example to understand your suggestion.
> > > >
> > > > It is a problem for userspace, because we need to expose acceptable
> > > > parameters for allocation through the entire stack. If you look at =
the
> > > > dmabuf documentation in the kernel for how buffers should be alloca=
ted
> > > > and exchanged, you can see the negotiation flow for modifiers. This
> > > > permeates through KMS, EGL, Vulkan, Wayland, GStreamer, and more.
> > >
> > > What dma-buf properties are you referring to?
> > > dma_heap_ioctl_allocate() accepts a few flags for the resulting file
> > > descriptor and no flags for the heap itself.
> > >
> > > >
> > > > Standardising on heaps allows us to add those in a similar way.
> > >
> > > How would you solve this with heaps? Would you use one heap for each
> > > protection profile (use case), add heap_flags, or do a bit of both?
>
> I would say one heap per-profile.
>

And then it would have a per vendor multiplication factor as each
vendor enforces memory restriction in a platform specific manner which
won't scale.

> >
> > Christian gave an historical background here [1] as to why that hasn't
> > worked in the past with DMA heaps given the scalability issues.
> >
> > [1] https://lore.kernel.org/dri-devel/e967e382-6cca-4dee-8333-39892d532=
f71@gmail.com/
>
> Hm, I fail to see where Christian dismiss the dma-heaps solution in
> this email. He even says:
>
> > If the memory is not physically attached to any device, but rather just
> memory attached to the CPU or a system wide memory controller then
> expose the memory as DMA-heap with specific requirements (e.g. certain
> sized pages, contiguous, restricted, encrypted, ...).

I am not saying Christian dismissed DMA heaps but rather how
scalability is an issue. What we are proposing here is a generic
interface via TEE to the firmware/Trusted OS which can perform all the
platform specific memory restrictions. This solution will scale across
vendors.

>
> >
> > >
> > > > If we
> > > > have to add different allocation mechanisms, then the complexity
> > > > increases, permeating not only into all the different userspace API=
s,
> > > > but also into the drivers which need to support every different
> > > > allocation mechanism even if they have no opinion on it - e.g. Mali
> > > > doesn't care in any way whether the allocation comes from a heap or
> > > > TEE or ACPI or whatever, it cares only that the memory is protected=
.
> > > >
> > > > Does that help?
> > >
> > > I think you're missing the stage where an unprotected buffer is
> > > received and decrypted into a protected buffer. If you use the TEE fo=
r
> > > decryption or to configure the involved devices for the use case, it
> > > makes sense to let the TEE allocate the buffers, too. A TEE doesn't
> > > have to be an OS in the secure world, it can be an abstraction to
> > > support the use case depending on the design. So the restricted buffe=
r
> > > is already allocated before we reach Mali in your example.
> > >
> > > Allocating restricted buffers from the TEE subsystem saves us from
> > > maintaining proxy dma-buf heaps.
>
> Honestly, when I look at dma-heap implementations, they seem
> to be trivial shells around existing (more complex) allocators, and the
> boiler plate [1] to expose a dma-heap is relatively small. The dma-buf
> implementation, you already have, so we're talking about a hundred
> lines of code to maintain, which shouldn't be significantly more than
> what you have for the new ioctl() to be honest.

It will rather be redundant vendor specific code under DMA heaps
calling into firmware/Trusted OS to enforce memory restrictions as you
can look into Mediatek example [1]. With TEE subsystem managing that
it won't be the case as we will provide a common abstraction for the
communication with underlying firmware/Trusted OS.

[1] https://lore.kernel.org/linux-arm-kernel/20240515112308.10171-1-yong.wu=
@mediatek.com/

> And I'll insist on what
> Daniel said, it's a small price to pay to have a standard interface to
> expose to userspace. If dma-heaps are not used for this kind things, I
> honestly wonder what they will be used for...

Let's try not to forcefully find a use-case for DMA heaps when there
is a better alternative available. I am still failing to see why you
don't consider following as a standardised user-space interface:

"When user-space has to work with restricted memory, ask TEE device to
allocate it"

-Sumit

