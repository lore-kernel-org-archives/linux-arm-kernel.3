Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56D01C19776
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 12:06:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OsXYM8ePl9dRXaykIjugDeDQ+GWuufEIdXvrBWmNtGQ=; b=MUzZeIMBb3dpqKpdroQogbFB1x
	MSrriM2aPH5tjIonjq5YEZO5gvm19wjOYFA+0vpTD2B7l9yXJddvvufv40bAONGHi+TCMk7EkZzW3
	hAqoc59MRolsBqLyI9n2IeMcTJTAhr6FBP0Ff1tfxO9xlXKmzxuC1CXX4CX/VFCnCZWNP6AiqD2aO
	NUQN6EdoqltQbgWyOTsdzGQ76ALDeXQDdF/Bf34ubFjrYafpvEEMVJPvhErVokJX9jvblU4l8AneO
	J/UXro0oZhp2uscQzz5Ve5XzXrrB8OgM6jieQ86QMhGwSX2GtQ8lwm7w2oOciGVeR661W8f8aWkul
	H6MF3+hQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnz7z-0000000AqNE-3YI0;
	Fri, 28 Feb 2025 12:06:03 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnyPr-0000000AjZn-3otT
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Feb 2025 11:20:29 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-5e04f2b1685so2618687a12.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 28 Feb 2025 03:20:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1740741626; x=1741346426; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OsXYM8ePl9dRXaykIjugDeDQ+GWuufEIdXvrBWmNtGQ=;
        b=ViaTYdpBY0mOoLK6QFM/T6dYNmZHPyOcjkFMPfntlZu93RwP+qpQApxsDCU4g7JWCk
         Qe8JYhYcpoke4ox9izuKCA2pAsH3aYGN5BsGEqfAQP9YiYKd4IyNys1XCRYoRzS8KiGi
         +0feZx6mj43L9TXR/uiBpI2ElgU3+OTEnzndI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740741626; x=1741346426;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OsXYM8ePl9dRXaykIjugDeDQ+GWuufEIdXvrBWmNtGQ=;
        b=HL0qfg0JgZjotzqLqa5boJ1T0dRtCjM1t2gGq6q4D5A5wQmz2Hx7i50PvZAYcBG8H7
         ZJx8lzIrmLg87VulZNNrUV4quaNholyUcMvJ+urfuWGn71J9CZWgZRC43OIympsAa0pk
         il/7BFYCoHPkrCcgW4AfOmn9bHCFLMxpxBx/1OU+1Zw/I44ZFP2Ufmmjlii/pO3Sn9hk
         z5GxcXLqD5Ee2bth0Wl4pZ52rX2OW7TlrE6C+cLLSJgO35DId3i7BEiS2G0AQWUMd67u
         X+3i/aLoCMPH8avTfesJFTjsxAVGQKaaPFeIRqbW6ZlEUbRShPw1UA8Ne/fjtbG0jhVU
         UdWg==
X-Forwarded-Encrypted: i=1; AJvYcCW1nllRG2HfuBEmeD6ej4PGtoFbWCi6pZugX4xJR2l9xM8D7+ZnqyKVAmjQ96GsMMMTzT9TroAcnAQjzhMt6ZB2@lists.infradead.org
X-Gm-Message-State: AOJu0YyQ3pLMOdYtLKUSpm4VNUasovfp4TJEgFRxF6ltL7fsbupjF6N7
	UuiqbgIDbqpHTarZY2E2B1CyRCW59XTMEcjYM7BvPZypX4baopq7QnpKam1ktAkMd3B5yN5gMr2
	bcA==
X-Gm-Gg: ASbGncsAcOIPGSVDLe3Ml0dibFiEmP8NYO8VaMJjHIz+kDLIU16O40NBx4a+53gAfns
	7AnaaC+Arg1Kz3ZGcwitulzI9zsH7q4a65VgNqZ4e1xWE/+vQKguw6EIDvZczsNxXlxD1+XNTIk
	SXlnKVwWmz+mw7IFEACqpOXCiOv1alRtNkOZS1HFnfMNNGNoJMQp4zm5zoq2IO3z24HP5Ck4H66
	a0gYVnch057TV3wWjewVjRqdDt+AWTeLKHc7o2MXKMP0Pgav3aEOHWOGu4lGqRgqQr+JB6AJp1F
	0OqXHMkKKjV0K8vassbPPPiOk20R2WmfU+X+i1mr9FHxZ1FNVaBlEPruzy5FrA==
X-Google-Smtp-Source: AGHT+IEmQjP5hB3i2abvMMJ+yEcTTiAb3XDSxMW+EVmOOwzOJaiO9ZRBhhb5nIN8JF+QjdwwCDzUtw==
X-Received: by 2002:a05:6402:274b:b0:5e0:7510:5787 with SMTP id 4fb4d7f45d1cf-5e4d6af67efmr6743119a12.19.1740741606112;
        Fri, 28 Feb 2025 03:20:06 -0800 (PST)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com. [209.85.208.46])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abf0c7c083esm277206466b.175.2025.02.28.03.19.44
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Feb 2025 03:19:45 -0800 (PST)
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5ded4a3bf0bso10131a12.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 28 Feb 2025 03:19:44 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU2oEiVaok+gw8wX0Pmk593e+juZHX8imQ/2XFb3qWWavxgKZgnjqf5ZwBlWNc5qbP4BJ23JbchUg9EtGi9h/jP@lists.infradead.org
X-Received: by 2002:aa7:c593:0:b0:5dc:5ae8:7e1 with SMTP id
 4fb4d7f45d1cf-5e4d74de7ecmr78282a12.6.1740741584369; Fri, 28 Feb 2025
 03:19:44 -0800 (PST)
MIME-Version: 1.0
References: <20250102-b4-rkisp-noncoherent-v1-1-bba164f7132c@gmail.com>
 <20250103152326.GP554@pendragon.ideasonboard.com> <87bjw9s4s3.fsf@gmail.com>
 <dtfv2slbtj3ar2wvlcnd74p3xtlvggebkk3fj5ocm3eil7kyqw@al3brwf4y5dw>
 <CAAFQd5DS2x3sX59EdkTEMuO=eXc=Q0jD44EUwMisP6ocWz11qg@mail.gmail.com>
 <bgnkzjpegpmif7gohoijt42rku6jruovjsxscg75dprdz5ek2i@ntfh2yyjyiry>
 <CAAFQd5BihpFYgqvKta7ULMAVSMTy3kd6iR6Mo4ea9Ci935EFMA@mail.gmail.com> <aw6hhc5x7lycbmckbc57ke5whksem5lasfkufcxrcuou5vhoyo@ylggg6tdzcnq>
In-Reply-To: <aw6hhc5x7lycbmckbc57ke5whksem5lasfkufcxrcuou5vhoyo@ylggg6tdzcnq>
From: Tomasz Figa <tfiga@chromium.org>
Date: Fri, 28 Feb 2025 20:19:27 +0900
X-Gmail-Original-Message-ID: <CAAFQd5BEu_i8JeKkFSCqCNDEs75k3=vOjnAYzSBv9yhPJNvCsA@mail.gmail.com>
X-Gm-Features: AQ5f1Jo4iuYuE-WQ5kGFMC-K7_2dFm6wcUIvZdWnUkigr4hSv-4tmouuVXKBwk8
Message-ID: <CAAFQd5BEu_i8JeKkFSCqCNDEs75k3=vOjnAYzSBv9yhPJNvCsA@mail.gmail.com>
Subject: Re: [PATCH] media: rkisp1: allow non-coherent video capture buffers
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Mikhail Rudenko <mike.rudenko@gmail.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Dafna Hirschfeld <dafna@fastmail.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Heiko Stuebner <heiko@sntech.de>, linux-media@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_032027_947493_D5504A20 
X-CRM114-Status: GOOD (  53.90  )
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

On Fri, Feb 28, 2025 at 7:48=E2=80=AFPM Jacopo Mondi
<jacopo.mondi@ideasonboard.com> wrote:
>
> Hi Tomasz
>
> On Fri, Feb 28, 2025 at 07:28:43PM +0900, Tomasz Figa wrote:
> > On Fri, Feb 28, 2025 at 7:18=E2=80=AFPM Jacopo Mondi
> > <jacopo.mondi@ideasonboard.com> wrote:
> > >
> > > Hi Tomasz
> > >
> > > On Fri, Feb 28, 2025 at 07:00:57PM +0900, Tomasz Figa wrote:
> > > > Hi Jacopo,
> > > >
> > > > On Fri, Feb 28, 2025 at 2:11=E2=80=AFAM Jacopo Mondi
> > > > <jacopo.mondi@ideasonboard.com> wrote:
> > > > >
> > > > > Hi Mikhail
> > > > >
> > > > > On Tue, Jan 14, 2025 at 07:00:39PM +0300, Mikhail Rudenko wrote:
> > > > > >
> > > > > > Hi Laurent,
> > > > > >
> > > > > > On 2025-01-03 at 17:23 +02, Laurent Pinchart <laurent.pinchart@=
ideasonboard.com> wrote:
> > > > > >
> > > > > > > On Thu, Jan 02, 2025 at 06:35:00PM +0300, Mikhail Rudenko wro=
te:
> > > > > > >> Currently, the rkisp1 driver always uses coherent DMA alloca=
tions for
> > > > > > >> video capture buffers. However, on some platforms, using non=
-coherent
> > > > > > >> buffers can improve performance, especially when CPU process=
ing of
> > > > > > >> MMAP'ed video buffers is required.
> > > > > > >>
> > > > > > >> For example, on the Rockchip RK3399 running at maximum CPU f=
requency,
> > > > > > >> the time to memcpy a frame from a 1280x720 XRGB32 MMAP'ed bu=
ffer to a
> > > > > > >> malloc'ed userspace buffer decreases from 7.7 ms to 1.1 ms w=
hen using
> > > > > > >> non-coherent DMA allocation. CPU usage also decreases accord=
ingly.
> > > > > > >
> > > > > > > What's the time taken by the cache management operations ?
> > > > > >
> > > > > > Sorry for the late reply, your question turned out a little mor=
e
> > > > > > interesting than I expected initially. :)
> > > > > >
> > > > > > When capturing using Yavta with MMAP buffers under the conditio=
ns mentioned
> > > > > > in the commit message, ftrace gives 437.6 +- 1.1 us for
> > > > > > dma_sync_sgtable_for_cpu and 409 +- 14 us for
> > > > > > dma_sync_sgtable_for_device. Thus, it looks like using non-cohe=
rent
> > > > > > buffers in this case is more CPU-efficient even when considerin=
g cache
> > > > > > management overhead.
> > > > > >
> > > > > > When trying to do the same measurements with libcamera, I faile=
d. In a
> > > > > > typical libcamera use case when MMAP buffers are allocated from=
 a
> > > > > > device, exported as dmabufs and then used for capture on the sa=
me device
> > > > > > with DMABUF memory type, cache management in kernel is skipped =
[1]
> > > > > > [2]. Also, vb2_dc_dmabuf_ops_{begin,end}_cpu_access are no-ops =
[3], so
> > > > > > DMA_BUF_IOCTL_SYNC from userspace does not work either.
> > > > > >
> > > > > > So it looks like to make this change really useful, the above i=
ssue of
> > > > > > cache management for libcamera/DMABUF/videobuf2-dma-contig has =
to be
> > > > > > solved. I'm not an expert in this area, so any advice is kindly=
 welcome. :)
> > > > >
> > > > > It would be shame if we let this discussion drop dead.. cache
> > > > > management policies are relevant for performances, specifically f=
or
> > > > > cpu access, and your above 7.7ms vs 1.1 ms test clearly shows tha=
t.
> > > > >
> > > > > >
> > > > > > [1] https://git.linuxtv.org/media.git/tree/drivers/media/common=
/videobuf2/videobuf2-core.c?id=3D94794b5ce4d90ab134b0b101a02fddf6e74c437d#n=
411
> > > > >
> > > > > I would like to know from Hans if the decision to disallow cache-=
hints
> > > > > for dmabuf importers is a design choice or is deeply rooted in ot=
her
> > > > > reasons I might be missing.
> > > >
> > > > When DMA-buf is used, the responsibility for cache management is
> > > > solely on the CPU users' side, so cache-hints don't really apply. I=
t's
> > > > the exporter (=3Dallocator) who determines the mapping policy of th=
e
> > > > buffer and provides necessary DMA_BUF_SYNC operations (can be no-op=
 if
> > > > the buffer is coherent).
> > >
> > > This all makes sense.
> > >
> > > I take it as, for libcamera, users of the FrameBufferAllocator helper
> > > (which first exports MMAP buffers from the video device and the
> > > imports them back as DMABUF) won't be able to control the cache
> > > policies.
> > >
> > > Now, in the long term, we want FrameBufferAllocator to go away and
> > > have either buffers exported by the consumer (likely DRM) or by a
> > > system wide buffer allocator (when we'll have one) and have the video
> > > devices operate as pure importers. But for the time being the
> > > "first export then import" use case is possibile and valid so I wonde=
r
> > > if we should consider measures to allow controlling caching policies
> > > for this use case too.
> >
> > Hmm, I may be missing something, but if FrameBufferAllocator does the
> > allocation internally in libcamera, why couldn't it use the
> > V4L2_MEMORY_FLAG_NON_COHERENT REQBUFS/CREATE_BUFS flag?
>
> -I- might be missing something, but reading the below links that
> Mikhail reported in a previous email
> [1] https://git.linuxtv.org/media.git/tree/drivers/media/common/videobuf2=
/videobuf2-core.c?id=3D94794b5ce4d90ab134b0b101a02fddf6e74c437d#n411
> [2] https://git.linuxtv.org/media.git/tree/drivers/media/common/videobuf2=
/videobuf2-core.c?id=3D94794b5ce4d90ab134b0b101a02fddf6e74c437d#n829
>
> it seems to me that yes, when first exporting you can hint to tell
> vb2 to allocate from non-coherent/non-contiguous memory, but then when
> switching the device to importer mode (and import the same buffers it
> previously exported) the cache sync point would then
> be skipped, leading to possible synchronization issues between the cpu
> consumer and the device.

Yeah, and that is 100% expected. As I said in my previous reply, in
the DMA-buf world, it's the responsibility of the users doing the CPU
accesses to ensure the correct synchronization (aka explicit sync).

>
> >
> > Note that however, once the buffer is allocated and mapped once, on
> > many architectures it must keep the same mapping attributes across the
> > different mappings, due to how the memory hierarchy works. (Not sure
> > if this is what you are asking for here, though.)
> >
> > >
> > > >
> > > > Best regards,
> > > > Tomasz
> > > >
> > > > >
> > > > > I'm asking because the idea is for libcamera to act solely as dma=
-buf
> > > > > importer, the current alloc-export-then-import trick is an helper=
 for
> > > > > applications to work around the absence of a system allocator.
> > > > >
> > > > > If the requirement to disable cache-hints for importers cannot be
> > > > > lifted, for libcamera it means we would not be able to use it.
> > > > >
> > > > >
> > > > > > [2] https://git.linuxtv.org/media.git/tree/drivers/media/common=
/videobuf2/videobuf2-core.c?id=3D94794b5ce4d90ab134b0b101a02fddf6e74c437d#n=
829
> > > > > > [3] https://git.linuxtv.org/media.git/tree/drivers/media/common=
/videobuf2/videobuf2-dma-contig.c?id=3D94794b5ce4d90ab134b0b101a02fddf6e74c=
437d#n426
> > > > > >
> > > > > > --
> > > > > > Best regards,
> > > > > > Mikhail Rudenko
> > > > > >
> > > > >

