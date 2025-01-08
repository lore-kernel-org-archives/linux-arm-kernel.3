Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72887E77199
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jan 2025 18:41:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4ffX9s5lZZvi/RIVY3Ypy7RNThefOmFeXVp1Muk6+1U=; b=CJgx2C+fBUheq5p5PD0ewGHbOH
	WOIgwhrqHA+FXe8iZCCE2IvA3r0yo68A0bLC39qnmXtkd/qvvxz2+bDdHDMINNMNTV8ls0Jo5/0Y8
	Br+FioMS2RHecLIBuqpD9BSyOzwBVMHhGQC8BSvMIztYpgoedeiADhYwlh/rhz2HPyjREWwa07ie/
	KFOF/jVnMMFSHjxUW7PENXr+VhI+/bSBrukzs/eo1RyNFL5GBE/5BUBSlpjhrQZxxRd1r4A1zU04l
	hb9gsnblQM5CpTbvAecGwUV8Xq4Ssz+HR0oMbFSaoeffAd7pIK0WiqOFlJcc0MbsDwL/+CNCuewbD
	GJw3HYrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVazh-00000009Zbd-1WjA;
	Wed, 08 Jan 2025 18:41:29 +0000
Received: from mail-qk1-x732.google.com ([2607:f8b0:4864:20::732])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVayS-00000009ZOO-0kTW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jan 2025 18:40:13 +0000
Received: by mail-qk1-x732.google.com with SMTP id af79cd13be357-7b9bc648736so6406985a.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Jan 2025 10:40:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1736361609; x=1736966409; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=4ffX9s5lZZvi/RIVY3Ypy7RNThefOmFeXVp1Muk6+1U=;
        b=CRY3lcZIVQJf0kHgYRkktCBPUqFDOAy2c4nukvCMym84V4widSZJS4OT1dPV5rLsc5
         FI4YTmugbEcXH9Lc9JjhYQwtY1Cks9dNzHig7bzQvZ2JT3gDjQ1MmEAKtlR3G1AncKVT
         DjONOWNlCdj5I+YsHv/oIf/8n7vV4o3dIX1QfxgE/hSZCixag+YfcPjQOJ8egRyrPAQX
         8pUGLrYR6lvoMCEXwUYNMNqEOdoPvZgI5dfy+/hOgxMIa7s58marzqKEbXBfU9gZamak
         gW2mAEVsvXj0/MxYeoIHxrF6yDUupUQdBLN4aUMBiIx8dS6PRX9g5vyS6CexZD2Ekxh7
         AjbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736361609; x=1736966409;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4ffX9s5lZZvi/RIVY3Ypy7RNThefOmFeXVp1Muk6+1U=;
        b=F/DojbqmJhxYOwZ1axoChjGhrJ23B8T4maTTWGlPLmuSYjDWwlO+9Ls+Cg+Y5Mcjkb
         felECwMqj7FGPGI8V3DXkFcjBlvuDpcInlAhuyrdv7fBPajxs0PH6EML42AW/vBkNrvF
         U5mkKIbzTgmDRjW7nKgZJhTaVYPvK01EeOT9zJIWFPfWXqnaVp12SqX81bAZ3RiZ/Lcb
         U+GxAhnnYLGaGcCW7O2SSepPiA9LvPgifjYKYQhCo78Fhhk7AuQAr9hHBshcoSYVpheD
         yfZvwc0SmP1zeiDEta5Ee+UdEabz/m+GGHHfCh5OyvKfFYrn2lmBxqmnyXj8vqP4Tbbd
         lMXg==
X-Forwarded-Encrypted: i=1; AJvYcCVG2VlzfvLCzujB+nCTv7YrXTIV7BsvM89Gqi3vNytNwlUU/Hnj+hUXs2aRd91PyEU3Iar03arKPi6A8Wme4mYo@lists.infradead.org
X-Gm-Message-State: AOJu0Yy4Cw26Bw0vsMI3OFA2eb0FTjnRYkE/zXuqg1tUjuPhSEAdoC6h
	4n5vM40SPF72DuXM2m6KfS58jFFQRSzpX5D8qH4ZxOt6VOFIkqKKWv8oqg3vazA=
X-Gm-Gg: ASbGnctyaFSVgd0lD7XlM5soYxMErFiOmYnjkTuUA0XgOuUMf6lMiIhYrgvPtbJRwUN
	7OW3P2HwZ6I7x5hkMA6AZKcUeC9KH2ZGMpHwRGbAy7nIYgywkb0SBkhVoqdQc5hNq/FOAaQK2iI
	S4mp+d8llOC/wbIbLhwU1l4zlAAcdHLy9rehGl5izDFvloqPons02drrPlM9QYPvM29F+y5mNfo
	Frqd8J79GgR4jv94b+u49DFRK3vq14ZmnaVI20/1tIo79hbnhbzapL5QQ==
X-Google-Smtp-Source: AGHT+IGW+2bZaLQkp8cMxdfoS+8Vn3bkQIJI43rs5ghM1jAE3+huimVx3cvmQ8g1/rbob0Gr49WI3A==
X-Received: by 2002:a05:620a:17a2:b0:7b8:6331:a55e with SMTP id af79cd13be357-7bcd975a181mr670484685a.44.1736361609279;
        Wed, 08 Jan 2025 10:40:09 -0800 (PST)
Received: from nicolas-tpx395.localdomain ([2606:6d00:15:862e::7a9])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b9ac2bbc62sm1698645485a.4.2025.01.08.10.40.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 10:40:08 -0800 (PST)
Message-ID: <308c2f4b6395fed3c2fbbb59d16cd8fa97da5d55.camel@ndufresne.ca>
Subject: Re: [PATCH 0/7] Raspberry Pi HEVC decoder driver
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, Laurent Pinchart	
 <laurent.pinchart@ideasonboard.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>,  Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,  Florian Fainelli
 <florian.fainelli@broadcom.com>, Broadcom internal kernel review list	
 <bcm-kernel-feedback-list@broadcom.com>, John Cox
 <john.cox@raspberrypi.com>,  Dom Cobley <dom@raspberrypi.com>, review list
 <kernel-list@raspberrypi.com>, Ezequiel Garcia	
 <ezequiel@vanguardiasur.com.ar>, John Cox <jc@kynesim.co.uk>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, John Cox <john.cox@raspberypi.com>
Date: Wed, 08 Jan 2025 13:40:07 -0500
In-Reply-To: <CAPY8ntCxH2C=YEJEcee0b2UuXU+xZ0Ntbuvc29MLAipr9DCmmw@mail.gmail.com>
References: <20241220-media-rpi-hevc-dec-v1-0-0ebcc04ed42e@raspberrypi.com>
	 <6d6c49919af9e782bd8e9be5066e92c9704ad5b7.camel@ndufresne.ca>
	 <CAPY8ntCxH2C=YEJEcee0b2UuXU+xZ0Ntbuvc29MLAipr9DCmmw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2 (3.54.2-1.fc41) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_104012_483985_5FB99E8A 
X-CRM114-Status: GOOD (  51.70  )
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

Le mardi 07 janvier 2025 =C3=A0 16:13 +0000, Dave Stevenson a =C3=A9crit=C2=
=A0:
> Hi Nicolas
>=20
> On Mon, 6 Jan 2025 at 20:46, Nicolas Dufresne <nicolas@ndufresne.ca> wrot=
e:
> >=20
> > Hi Dave,
> >=20
> > Le vendredi 20 d=C3=A9cembre 2024 =C3=A0 16:21 +0000, Dave Stevenson a =
=C3=A9crit :
> > > Hi All
> > >=20
> > > This has been in the pipeline for a while, but I've finally cleaned
> > > up our HEVC decoder driver to be in a shape to at least get a first
> > > review.
> > > John Cox has done almost all of the work under contract to Raspberry
> > > Pi, and I'm largely just doing the process of patch curation and
> > > sending.
> > >=20
> > > There are a couple of questions raised in frameworks.
> > > The main one is that the codec has 2 independent phases to the decode=
,
> > > CABAC and reconstruction. To keep the decoder operating optimally
> > > means that two requests need to be in process at once, whilst the
> > > current frameworks don't want to allow as there is an implicit
> > > assumption of only a single job being active at once, and
> > > completition returns both buffers and releases the media request.
> > >=20
> > > The OUTPUT queue buffer is finished with and can be returned at the
> > > end of phase 1, but the media request is still required for phase 2.
> > > The frameworks currently force the driver to be returning both
> > > together via v4l2_m2m_buf_done_and_job_finish. v4l2_m2m_job_finish
> > > would complete the job without returning the buffer as we need,
> > > however if the driver has set VB2_V4L2_FL_SUPPORTS_M2M_HOLD_CAPTURE_B=
UF
> > > then we have a WARN in v4l2_m2m_job_finish.
> > > Dropping the WARN as this series is currently doing isn't going to be
> > > the right answer, but it isn't obvious what the right answer is.
> > > Discussion required.
> >=20
> > I think part of the manual request completion RFC will be to evaluate t=
he impact
> > on VB2_V4L2_FL_SUPPORTS_M2M_HOLD_CAPTURE_BUF feature. MTK does not supp=
ort
> > interleaved interlaced decoding (only alternate), so they didn't have t=
o
> > implement that feature.
> >=20
> > Overall, It would be nice to get your feedback on the new manual reques=
t
> > proposal, which is I believe better then the pin/unpin API you have in =
this
> > serie.
>=20
> I wasn't aware of that series, but I / John will take a look.
>=20
> > >=20
> > > We also have a need to hold on to the media request for phase 2. John
> > > had discussed this with Ezequiel (and others) a couple of years back,
> > > and hence suggested a patch that adds media_request_{pin,unpin} to
> > > grab references on the media request. Discussion required on that
> > > or a better way of handling it.
> > >=20
> > > I will apologise in advance for sending this V1 just before I head of=
f
> > > on the Christmas break, but will respond to things as soon as possibl=
e.
> >=20
> > One thing missing in this summary is how this driver is being validated
> > (specially that for this one requires a downstream fork of FFMPEG). To =
this
> > report we ask for:
> >=20
> > - v4l2-compliance results
> > - Fluster conformance tests results [1] and I believe you need [2]
> >=20
> > [1] https://github.com/fluendo/fluster
> > [2] https://github.com/fluendo/fluster/pull/179
>=20
> Sure, I'll sort that before doing a V2.
>=20
> > GStreamer support is there in main now, but without the needed software=
 video
> > converter for you column tiling, we can't use it for that (i.e. only wo=
rks
> > through GL or Wayland).
>=20
> Can you point me at the right place for the software converter?
> It's a relatively trivial reformat required to get it back into NV12 /
> I420 or 10bit equivalents, so happy to do that. I think John already
> has NEON optimised code if desired.

Its challenging in the way its implemented in GStreamer Video library. Basi=
cally
all formats needs its GstVideoFormatInfo structure to be filled in the stat=
ic
table, and then minimally a slow path for color conversion, which is reduce=
d to
pack/unpack of a single line of video data. With tiled (or column format) t=
he
notion of line is not as obvious.

https://gitlab.freedesktop.org/gstreamer/gstreamer/-/blob/main/subprojects/=
gst-plugins-base/gst-libs/gst/video/video-format.c

For tile format with fixed dimensions, we have extra information for the ti=
le
layout (GstVideoTileInfo), but we didn't think about full height tiles when=
 that
was added. This information is needed to generically crop images, which is =
why
its so complicated.

One option we could use to make it fit as a tiled format is to introduce a =
new
GstVideoTileMode GST_VIDEO_TILE_MODE_COLUMN. Then we set the tiled height t=
o
match the usual HW height step, making it so you have 128 x step tiles, lai=
d out
in column. Alternatively, we can start with a step of 1 (which will make th=
e
slow path a lot slower then needed), and later add an optimization for the
column layout, so it handle full columns.

If you manage to find a good step size, then all you will have to implement=
 is
the backend for gst_video_tile_get_index(), the rest of the slow path will =
be
generic.

Fast path are possible, with ORC (a cross platform byte code language that =
can
be JIT into SIMD instructions), but I don't currently see much use for "fas=
t",
since the GPU pretty much always accepts these buffers, so the software pat=
h
remains a neat debugging tool and allow conformance testing.

Nicolas

>=20
>   Dave
>=20
> > regards,
> > Nicolas
> >=20
> > >=20
> > > Thanks
> > >   Dave
> > >=20
> > > Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > > ---
> > > Dave Stevenson (4):
> > >       docs: uapi: media: Document Raspberry Pi NV12 column format
> > >       media: ioctl: Add pixel formats NV12MT_COL128 and NV12MT_10_COL=
128
> > >       media: dt-bindings: media: Add binding for the Raspberry Pi HEV=
C decoder
> > >       arm: dts: bcm2711-rpi: Add HEVC decoder node
> > >=20
> > > Ezequiel Garcia (1):
> > >       RFC: media: Add media_request_{pin,unpin} API
> > >=20
> > > John Cox (2):
> > >       media: platform: Add Raspberry Pi HEVC decoder driver
> > >       RFC: v4l2-mem2mem: Remove warning from v4l2_m2m_job_finish
> > >=20
> > >  .../bindings/media/raspberrypi,hevc-dec.yaml       |   72 +
> > >  .../userspace-api/media/v4l/pixfmt-yuv-planar.rst  |   42 +
> > >  MAINTAINERS                                        |   10 +
> > >  arch/arm/boot/dts/broadcom/bcm2711-rpi.dtsi        |    5 +
> > >  arch/arm/boot/dts/broadcom/bcm2711.dtsi            |    9 +
> > >  drivers/media/mc/mc-request.c                      |   35 +
> > >  drivers/media/platform/raspberrypi/Kconfig         |    1 +
> > >  drivers/media/platform/raspberrypi/Makefile        |    1 +
> > >  .../media/platform/raspberrypi/hevc_dec/Kconfig    |   17 +
> > >  .../media/platform/raspberrypi/hevc_dec/Makefile   |    5 +
> > >  .../media/platform/raspberrypi/hevc_dec/hevc_d.c   |  443 ++++
> > >  .../media/platform/raspberrypi/hevc_dec/hevc_d.h   |  190 ++
> > >  .../platform/raspberrypi/hevc_dec/hevc_d_h265.c    | 2629 ++++++++++=
++++++++++
> > >  .../platform/raspberrypi/hevc_dec/hevc_d_hw.c      |  376 +++
> > >  .../platform/raspberrypi/hevc_dec/hevc_d_hw.h      |  303 +++
> > >  .../platform/raspberrypi/hevc_dec/hevc_d_video.c   |  685 +++++
> > >  .../platform/raspberrypi/hevc_dec/hevc_d_video.h   |   38 +
> > >  drivers/media/v4l2-core/v4l2-ioctl.c               |    2 +
> > >  drivers/media/v4l2-core/v4l2-mem2mem.c             |    7 -
> > >  include/media/media-request.h                      |   12 +
> > >  include/uapi/linux/videodev2.h                     |    5 +
> > >  21 files changed, 4880 insertions(+), 7 deletions(-)
> > > ---
> > > base-commit: e90c9612ac3969cb8206029a26bcd2b6f5d4a942
> > > change-id: 20241212-media-rpi-hevc-dec-3b5be739f3bd
> > >=20
> > > Best regards,
> >=20


