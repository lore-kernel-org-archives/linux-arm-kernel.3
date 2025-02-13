Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F327C0219D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 08:31:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Az9dQ23bPGQCJsqk2rNARA3D3DTwQa8JOi+/AGn2MB0=; b=g0cM26DnBdKTs/cSzmi2782VX7
	yNTmI97ksKfZ59BWOHq3n1Z0hCqfkFU9LvrCPFqS/0ir6fRmVjO/86MWKsO28kro9MQO5/FkcI2rJ
	L+muKPRvlPhQmf867ttm64pUaMEg4jHJ7R9jW8lgZMHu4t6DMwLE6jxDQ4gAUU2gUilPJM+C+Chnr
	W/Ja/AnGUqwSRRbTzFFv2pKic99WeQuEDNf0Euhyogdlrso+fV609t/XWY02RoVq7ZiXgykpMwiuV
	b0erowKgUdiHmMU9QyyaZdx9UbcZ0wPpfZzHrJkLriAw5RcX0MaTNKQwY8f4V19tpLgNbniGWK+XY
	q7RPWUoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiUct-0000000AHd0-38vT;
	Thu, 13 Feb 2025 08:31:15 +0000
Received: from mail-oo1-xc30.google.com ([2607:f8b0:4864:20::c30])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiURa-0000000AFaZ-49JI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Feb 2025 08:19:38 +0000
Received: by mail-oo1-xc30.google.com with SMTP id 006d021491bc7-5fc447b03f2so179627eaf.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Feb 2025 00:19:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739434773; x=1740039573; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Az9dQ23bPGQCJsqk2rNARA3D3DTwQa8JOi+/AGn2MB0=;
        b=semDFEJ09PAj26e6TFlKQ3XZ6eG3pPpk9cz6urjfn4IFKfDiksuyLpELSxdD/ZMPIl
         MjzSxJ+vwmpHKEs+LWpK+pXlF2semyPcVGRSH8IY1k+s/lPC8uYdRb8+ugmIp2p4liwU
         JF5T9gt83bhQJbew9NCaqbeuMOUzBTej1JvvAgzezjGfqdl5BK7eYzFAaTigDff8fzbu
         QEd43xUdMwcrq1PS+R4+T9SfU0yCxLnijgNpHeZLF2E2vbAo8+JjSAYJEcxJYzSL/+O9
         iv3+RxK45sVVa4d0qiGdbyGZw24jNbkznYXnc065XYhI0LaqfRtjLrpKE5X3/5at13xl
         0YQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739434773; x=1740039573;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Az9dQ23bPGQCJsqk2rNARA3D3DTwQa8JOi+/AGn2MB0=;
        b=nadD/y3R5+SNNA0eB4lvo0EcWy4IWG9g2YtpQ/v0X09L+VR+ueVCBLnO+PYx21JjEh
         ZLgyQc0Rd1ij/JlN14rn6qWVP4StZIk+Qca0ATDrM40OGexxY4FBI7v29xF2DXG9OS27
         a9GKQJui7Gz6WX/GQltTBZnw4CcgI2faUZQKQECuZxW5rqvyga1O2E2dibhVzdCqdxj5
         GcRnSo01TWPKRzs/Ii9re/ynDhJ9Z7S5f5LS4rapjq97nT8wbStEnbSAkH1WNMIG1Wtl
         0RhH3Lop7qzzrqitfW5OiuXfho3/HzHrfEAYv33FL39T0KcWQuDsBpW1dFwG7E4lEY9j
         Ggiw==
X-Forwarded-Encrypted: i=1; AJvYcCXwQ1tW+7yEljFUhoGo4UrNuaWarDYdr+9sMIUa5/uDQRNWkHMPBJKlr1nh3Rc6tmNmGmApqI/nI2kOFGhR9p4v@lists.infradead.org
X-Gm-Message-State: AOJu0Yyu5ynlOwg0wjd5o9iXsVEXMhfKsoKmsWzFgd6EC6aejM/HMtGg
	10S8whF6fdT3IYoKwslwZeRNIWFrMiYBDjvKP7GZ2AcrSu23ek1JmQUeU7l28Mb7x3IW/WxPgOo
	3LDE+kt+jm6Ucm3jSz9moMpXJmGJuAtfJCCfvNg==
X-Gm-Gg: ASbGncunWwGydFzRtVHllX6pDVB6V08Fmnxl5St3RE0zVIm+PVD+OZK801aQ59iR8DW
	fSXZYVdLX+OmrPDx/q2yEGqiUI+24DV7WQtjq4W7BdeO3GMBH36s8Ch2vWT9uPUPFj6Xj2c1EFg
	==
X-Google-Smtp-Source: AGHT+IEYwaXtzSb6L2iPNq96UiAe3ghkX0HNZgeRMU3vnnuVEV+oTgkHvrSkTnrpbFNibYdT1xw/IZq62i2DSoq0Et4=
X-Received: by 2002:a05:6870:3c13:b0:29e:20c4:2217 with SMTP id
 586e51a60fabf-2b8f8e8f47emr1365637fac.33.1739434773165; Thu, 13 Feb 2025
 00:19:33 -0800 (PST)
MIME-Version: 1.0
References: <20241217100809.3962439-1-jens.wiklander@linaro.org>
 <20250212205613.4400a888@collabora.com> <CAFA6WYOaGEPj0xNEDBCoEmjJreEHChjQ2hyXRJ_CYoGhiBonfw@mail.gmail.com>
In-Reply-To: <CAFA6WYOaGEPj0xNEDBCoEmjJreEHChjQ2hyXRJ_CYoGhiBonfw@mail.gmail.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Thu, 13 Feb 2025 09:19:21 +0100
X-Gm-Features: AWEUYZmAZ7muu4Y0CkS4aHUGrjFZdjBtSwN3vjBgPnCfnhs0YPXrZruLf1ATUM8
Message-ID: <CAHUa44FtXA8bOS1-BAGSrCFLxu_FRd2TaEtxGNdkzKua_-wNUQ@mail.gmail.com>
Subject: Re: [PATCH v4 0/6] TEE subsystem for restricted dma-buf allocations
To: Sumit Garg <sumit.garg@linaro.org>
Cc: Boris Brezillon <boris.brezillon@collabora.com>, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linaro-mm-sig@lists.linaro.org, op-tee@lists.trustedfirmware.org, 
	linux-arm-kernel@lists.infradead.org, Olivier Masse <olivier.masse@nxp.com>, 
	Thierry Reding <thierry.reding@gmail.com>, Yong Wu <yong.wu@mediatek.com>, 
	Sumit Semwal <sumit.semwal@linaro.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	John Stultz <jstultz@google.com>, "T . J . Mercier" <tjmercier@google.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, azarrabi@qti.qualcomm.com, 
	Florent Tomasin <florent.tomasin@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_001935_039554_906278E1 
X-CRM114-Status: GOOD (  32.23  )
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

On Thu, Feb 13, 2025 at 7:42=E2=80=AFAM Sumit Garg <sumit.garg@linaro.org> =
wrote:
>
> Hi Boris,
>
> On Thu, 13 Feb 2025 at 01:26, Boris Brezillon
> <boris.brezillon@collabora.com> wrote:
> >
> > +Florent, who's working on protected-mode support in Panthor.
> >
> > Hi Jens,
> >
> > On Tue, 17 Dec 2024 11:07:36 +0100
> > Jens Wiklander <jens.wiklander@linaro.org> wrote:
> >
> > > Hi,
> > >
> > > This patch set allocates the restricted DMA-bufs via the TEE subsyste=
m.
> >
> > We're currently working on protected-mode support for Panthor [1] and i=
t
> > looks like your series (and the OP-TEE implementation that goes with
> > it) would allow us to have a fully upstream/open solution for the
> > protected content use case we're trying to support. I need a bit more
> > time to play with the implementation but this looks very promising
> > (especially the lend rstmem feature, which might help us allocate our
> > FW sections that are supposed to execute code accessing protected
> > content).
>
> Glad to hear that, if you can demonstrate an open source use case
> based on this series then it will help to land it. We really would
> love to see support for restricted DMA-buf consumers be it GPU, crypto
> accelerator, media pipeline etc.

I'm preparing a demo based on GStreamer to share. It helps with more
real-world examples to see that APIs etc work.

>
> >
> > >
> > > The TEE subsystem handles the DMA-buf allocations since it is the TEE
> > > (OP-TEE, AMD-TEE, TS-TEE, or perhaps a future QCOMTEE) which sets up =
the
> > > restrictions for the memory used for the DMA-bufs.
> > >
> > > I've added a new IOCTL, TEE_IOC_RSTMEM_ALLOC, to allocate the restric=
ted
> > > DMA-bufs. This IOCTL reaches the backend TEE driver, allowing it to c=
hoose
> > > how to allocate the restricted physical memory.
> >
> > I'll probably have more questions soon, but here's one to start: any
> > particular reason you didn't go for a dma-heap to expose restricted
> > buffer allocation to userspace? I see you already have a cdev you can
> > take ioctl()s from, but my understanding was that dma-heap was the
> > standard solution for these device-agnostic/central allocators.
>
> This series started with the DMA heap approach only here [1] but later
> discussions [2] lead us here. To point out specifically:
>
> - DMA heaps require reliance on DT to discover static restricted
> regions carve-outs whereas via the TEE implementation driver (eg.
> OP-TEE) those can be discovered dynamically.
> - Dynamic allocation of buffers and making them restricted requires
> vendor specific driver hooks with DMA heaps whereas the TEE subsystem
> abstracts that out with underlying TEE implementation (eg. OP-TEE)
> managing the dynamic buffer restriction.
> - TEE subsystem already has a well defined user-space interface for
> managing shared memory buffers with TEE and restricted DMA buffers
> will be yet another interface managed along similar lines.
>
> [1] https://lore.kernel.org/lkml/mzur3odofwwrdqnystozjgf3qtvb73wqjm6g2vf5=
dfsqiehaxk@u67fcarhm6ge/T/
> [2] https://lore.kernel.org/lkml/CAFA6WYPtp3H5JhxzgH9=3Dz2EvNL7Kdku3EmG1a=
DkTS-gjFtNZZA@mail.gmail.com/

Thanks for the good summary. :-)

Cheers,
Jens

>
> -Sumit
>
> >
> > Regards,
> >
> > Boris
> >
> > [1]https://lwn.net/ml/all/cover.1738228114.git.florent.tomasin@arm.com/=
#t

