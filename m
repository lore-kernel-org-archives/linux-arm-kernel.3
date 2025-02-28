Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CA21C282CD
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 11:02:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eKOibatLevSl1XiH80i2AKEABQeU0O7rPQC7Mx++//c=; b=o9aakCQJBp7Kac9U/FgRlU168U
	85rXLutCLZg+UNtRB9d1ZV+lMj/XF1lWNnNm/oF3bD30wECHcDAopDQgTXwCR/vqZ/LPaoylQIZ1p
	TpmIDktqTHLVRBy5kYvWsRXjWhZHT5ci/G0+UvHn5Ndh38GOCBTBn4Ar3Kd2l8YVqy4QxEdrBJ+BW
	NxKJaIGQfcAH+V4mPmKI7cyc8b3sDMYJomoO9cIrSR4nBG5qRWr9QGhgevk+GiQqR/Zg12RrWsDsC
	fCqINylBD/pBDso7lu6esuD2v+rIW65nwqFl2tXfgq7OdG6zX3+Kr/97pC1y0D4HZRQCgyfelELW8
	F0TqOa/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tny8n-0000000AgmU-0qut;
	Fri, 28 Feb 2025 11:02:49 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnxc8-0000000AbEZ-0mE2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Feb 2025 10:29:05 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-abf06950db5so293981166b.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 28 Feb 2025 02:29:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1740738542; x=1741343342; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eKOibatLevSl1XiH80i2AKEABQeU0O7rPQC7Mx++//c=;
        b=T+PfptdlGV+NTKkqqmJaPs9yTjWrBlJYacBK+8QV9+oIrJShNItyoZSBjCpOE+0CUv
         vBsP6+MXQ63ejD37mvITJSid/moUcZHwhpMvrwR6CwDxwEXdT6K5e9NQSsr9Y2CCgruC
         oNI0/ZPiT/pPCT/i0YlwTvzvi1qnecG7NstEY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740738542; x=1741343342;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eKOibatLevSl1XiH80i2AKEABQeU0O7rPQC7Mx++//c=;
        b=DZ9HgLbpsCtrnQ28kWbj4WOEte/EB/k4VkhcT2s+esYmhTgIPQxsRUE4Z2+W+1F3X/
         sMY9ZYsyvogFRsIvJgY/y1jfK+48Epwvq15oo1k/TojZ4anyf0VaOTN9TV54TuV+woLP
         BZXqCpYHC23CUZKob2h2ccPOCqanMEFbe3A72mSG8FzMplyukuK1H/IAi/ZH0OoSJ3y3
         01Uzwu0iWqqhhzZiqPx/5U/VpFGY0sEj7S+NHmaZjz7Hio5PgURieyEZ5W24Ju0qRXDn
         5LnNiM2blpUoEqTHmHovCvsMdor+0qF9ZxL5oJsrnQvuVDMDwK8LHSeMZbBZ815CtoJO
         S0CA==
X-Forwarded-Encrypted: i=1; AJvYcCU2xXkROqWTmjiTp5T4KBFB+8FoKSJogOvJgpJJL5h/gTjvlbMBbgTpQO8vijBCFGkaRgiI+QbT967z+HET80oQ@lists.infradead.org
X-Gm-Message-State: AOJu0Ywy5uCi6UYyxHEe6JMIUhfNEv+1+8s7dZCgl6+1ZFlwTujNi7rZ
	z1EY/UBk7TYe+cr5MZgHmqOChVsFA59mhoRj+HKF2uc3to/EMSpfawB2drn0Lse+qn8eo8lBZtR
	K5Q==
X-Gm-Gg: ASbGncuyjT6vTf3lhooK6n8q5NrvMW8r7yAt8uIXb3WEfAFa/3pnthSsnjtjgWKBxVy
	MQq84fBPLhXeX1VSwXQF+ak/qElDyWvOFitUwtxScF5M4Su1alTBjI94VtZ3gdnvKasnGhVk0IJ
	cRCGFI0dNMqmEyxY0/biMovKFeKyssAhESuNtkOHDjh4P5zFI1i6GTXfM5mP79qmzDX96x8tHd/
	lmjOJ4h4VGDN4pbqCmBn3Kk5cH1ZPgPQFwCSq/O+rxmLD4CsVmCLmwFJ4k1aCpLbjV1xKIdUL4B
	cLXVzX4lICyFb+BCxwZNAPaqK1XkPNFfDtrcd1enhHGsSUOKpM4nhCbSL+cQpA==
X-Google-Smtp-Source: AGHT+IEoKG2EtyiFgSbbNg7LuK8MybkljXmLvcbP+xa/RCOZt32L26TVYjzq4/q2zgqFfJNaEMN7xQ==
X-Received: by 2002:a17:907:3da4:b0:abb:6b1a:7b22 with SMTP id a640c23a62f3a-abf261fb192mr309166466b.29.1740738541963;
        Fri, 28 Feb 2025 02:29:01 -0800 (PST)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com. [209.85.208.49])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abf0c6e9ce4sm272773766b.99.2025.02.28.02.29.01
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Feb 2025 02:29:01 -0800 (PST)
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5e4b6827fd9so5053a12.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 28 Feb 2025 02:29:01 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUK+WMu/jadGL/QPTIrIjKCzEn/Oc3Ty/nga/uaXJEnQo23KoS9PMDakjBDny/a7WEdHWVsh/13GZ9BzlWCM9ru@lists.infradead.org
X-Received: by 2002:aa7:de02:0:b0:5e0:eaa6:a2b0 with SMTP id
 4fb4d7f45d1cf-5e4e5170fb5mr58690a12.5.1740738540504; Fri, 28 Feb 2025
 02:29:00 -0800 (PST)
MIME-Version: 1.0
References: <20250102-b4-rkisp-noncoherent-v1-1-bba164f7132c@gmail.com>
 <20250103152326.GP554@pendragon.ideasonboard.com> <87bjw9s4s3.fsf@gmail.com>
 <dtfv2slbtj3ar2wvlcnd74p3xtlvggebkk3fj5ocm3eil7kyqw@al3brwf4y5dw>
 <CAAFQd5DS2x3sX59EdkTEMuO=eXc=Q0jD44EUwMisP6ocWz11qg@mail.gmail.com> <bgnkzjpegpmif7gohoijt42rku6jruovjsxscg75dprdz5ek2i@ntfh2yyjyiry>
In-Reply-To: <bgnkzjpegpmif7gohoijt42rku6jruovjsxscg75dprdz5ek2i@ntfh2yyjyiry>
From: Tomasz Figa <tfiga@chromium.org>
Date: Fri, 28 Feb 2025 19:28:43 +0900
X-Gmail-Original-Message-ID: <CAAFQd5BihpFYgqvKta7ULMAVSMTy3kd6iR6Mo4ea9Ci935EFMA@mail.gmail.com>
X-Gm-Features: AQ5f1JqDA8fCcluEWQ8PbLmXiOugq2U0_Riaa619CBxdwyIQsImrMMMyouCy8M0
Message-ID: <CAAFQd5BihpFYgqvKta7ULMAVSMTy3kd6iR6Mo4ea9Ci935EFMA@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20250228_022904_226261_953D9845 
X-CRM114-Status: GOOD (  48.93  )
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

On Fri, Feb 28, 2025 at 7:18=E2=80=AFPM Jacopo Mondi
<jacopo.mondi@ideasonboard.com> wrote:
>
> Hi Tomasz
>
> On Fri, Feb 28, 2025 at 07:00:57PM +0900, Tomasz Figa wrote:
> > Hi Jacopo,
> >
> > On Fri, Feb 28, 2025 at 2:11=E2=80=AFAM Jacopo Mondi
> > <jacopo.mondi@ideasonboard.com> wrote:
> > >
> > > Hi Mikhail
> > >
> > > On Tue, Jan 14, 2025 at 07:00:39PM +0300, Mikhail Rudenko wrote:
> > > >
> > > > Hi Laurent,
> > > >
> > > > On 2025-01-03 at 17:23 +02, Laurent Pinchart <laurent.pinchart@idea=
sonboard.com> wrote:
> > > >
> > > > > On Thu, Jan 02, 2025 at 06:35:00PM +0300, Mikhail Rudenko wrote:
> > > > >> Currently, the rkisp1 driver always uses coherent DMA allocation=
s for
> > > > >> video capture buffers. However, on some platforms, using non-coh=
erent
> > > > >> buffers can improve performance, especially when CPU processing =
of
> > > > >> MMAP'ed video buffers is required.
> > > > >>
> > > > >> For example, on the Rockchip RK3399 running at maximum CPU frequ=
ency,
> > > > >> the time to memcpy a frame from a 1280x720 XRGB32 MMAP'ed buffer=
 to a
> > > > >> malloc'ed userspace buffer decreases from 7.7 ms to 1.1 ms when =
using
> > > > >> non-coherent DMA allocation. CPU usage also decreases accordingl=
y.
> > > > >
> > > > > What's the time taken by the cache management operations ?
> > > >
> > > > Sorry for the late reply, your question turned out a little more
> > > > interesting than I expected initially. :)
> > > >
> > > > When capturing using Yavta with MMAP buffers under the conditions m=
entioned
> > > > in the commit message, ftrace gives 437.6 +- 1.1 us for
> > > > dma_sync_sgtable_for_cpu and 409 +- 14 us for
> > > > dma_sync_sgtable_for_device. Thus, it looks like using non-coherent
> > > > buffers in this case is more CPU-efficient even when considering ca=
che
> > > > management overhead.
> > > >
> > > > When trying to do the same measurements with libcamera, I failed. I=
n a
> > > > typical libcamera use case when MMAP buffers are allocated from a
> > > > device, exported as dmabufs and then used for capture on the same d=
evice
> > > > with DMABUF memory type, cache management in kernel is skipped [1]
> > > > [2]. Also, vb2_dc_dmabuf_ops_{begin,end}_cpu_access are no-ops [3],=
 so
> > > > DMA_BUF_IOCTL_SYNC from userspace does not work either.
> > > >
> > > > So it looks like to make this change really useful, the above issue=
 of
> > > > cache management for libcamera/DMABUF/videobuf2-dma-contig has to b=
e
> > > > solved. I'm not an expert in this area, so any advice is kindly wel=
come. :)
> > >
> > > It would be shame if we let this discussion drop dead.. cache
> > > management policies are relevant for performances, specifically for
> > > cpu access, and your above 7.7ms vs 1.1 ms test clearly shows that.
> > >
> > > >
> > > > [1] https://git.linuxtv.org/media.git/tree/drivers/media/common/vid=
eobuf2/videobuf2-core.c?id=3D94794b5ce4d90ab134b0b101a02fddf6e74c437d#n411
> > >
> > > I would like to know from Hans if the decision to disallow cache-hint=
s
> > > for dmabuf importers is a design choice or is deeply rooted in other
> > > reasons I might be missing.
> >
> > When DMA-buf is used, the responsibility for cache management is
> > solely on the CPU users' side, so cache-hints don't really apply. It's
> > the exporter (=3Dallocator) who determines the mapping policy of the
> > buffer and provides necessary DMA_BUF_SYNC operations (can be no-op if
> > the buffer is coherent).
>
> This all makes sense.
>
> I take it as, for libcamera, users of the FrameBufferAllocator helper
> (which first exports MMAP buffers from the video device and the
> imports them back as DMABUF) won't be able to control the cache
> policies.
>
> Now, in the long term, we want FrameBufferAllocator to go away and
> have either buffers exported by the consumer (likely DRM) or by a
> system wide buffer allocator (when we'll have one) and have the video
> devices operate as pure importers. But for the time being the
> "first export then import" use case is possibile and valid so I wonder
> if we should consider measures to allow controlling caching policies
> for this use case too.

Hmm, I may be missing something, but if FrameBufferAllocator does the
allocation internally in libcamera, why couldn't it use the
V4L2_MEMORY_FLAG_NON_COHERENT REQBUFS/CREATE_BUFS flag?

Note that however, once the buffer is allocated and mapped once, on
many architectures it must keep the same mapping attributes across the
different mappings, due to how the memory hierarchy works. (Not sure
if this is what you are asking for here, though.)

>
> >
> > Best regards,
> > Tomasz
> >
> > >
> > > I'm asking because the idea is for libcamera to act solely as dma-buf
> > > importer, the current alloc-export-then-import trick is an helper for
> > > applications to work around the absence of a system allocator.
> > >
> > > If the requirement to disable cache-hints for importers cannot be
> > > lifted, for libcamera it means we would not be able to use it.
> > >
> > >
> > > > [2] https://git.linuxtv.org/media.git/tree/drivers/media/common/vid=
eobuf2/videobuf2-core.c?id=3D94794b5ce4d90ab134b0b101a02fddf6e74c437d#n829
> > > > [3] https://git.linuxtv.org/media.git/tree/drivers/media/common/vid=
eobuf2/videobuf2-dma-contig.c?id=3D94794b5ce4d90ab134b0b101a02fddf6e74c437d=
#n426
> > > >
> > > > --
> > > > Best regards,
> > > > Mikhail Rudenko
> > > >
> > >

