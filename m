Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BD45E77197
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 17:48:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cmHjE2lkD0g0xx6Gl/UkMawOpI57ARHUpmlod3G7faY=; b=4+Ltpb3+alw3uyyYVujbw1cz8d
	/T8eqVWfBDi3EiSdY8FWHMvFEHFeXRq96Pn8GuEHtlYB/M5TJUgWrNZEqG3MUziKIjYffguF+7viY
	gV6XtOYwsA4f81h9e1DMrPI7umL6owf7XFAogKyt+dY3csWzBja3HQnayz409ujOCuFEeTvqXPEvS
	tfCL1H+L8TMwVIJaFCPriG0qsNPHfmug05fP9uiP+UQaiM0yl0h3TgLCNfo/rE5QfYJ6z7KgwoqKm
	0XEXjHM3YBtsWqnbvHphaPbHN72KWkcJTh9vEKxkPE4W1RzBFbYXnon0vDoiu/mm6zu4KYY4pN5+c
	JKGByODQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVDgo-00000005uXU-2rdk;
	Tue, 07 Jan 2025 17:48:26 +0000
Received: from mail-yb1-xb2f.google.com ([2607:f8b0:4864:20::b2f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVDW3-00000005srk-2LKu
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jan 2025 17:37:24 +0000
Received: by mail-yb1-xb2f.google.com with SMTP id 3f1490d57ef6-e537d9e3d75so23508428276.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Jan 2025 09:37:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1736271438; x=1736876238; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cmHjE2lkD0g0xx6Gl/UkMawOpI57ARHUpmlod3G7faY=;
        b=HYosJemcTgxHCTUhOaq6OKpJcauz6Jvc2+u5O0Y4gwwmJwnlM34SOjHXFDEGFYNLMx
         FOLqnY6zmCh9LC2OPnctG4QoDrEH2Ft+Y7J0jqUPb51kjbpWYALTY5uGYm1sRIPjEqoO
         wP0AaKyV925vnZnzaLVBDNCUb7EBdwxM3/+jks/TzA6E+9E6agjWS9erlCQekLeXz3hu
         +dhn6NziNPG7hxCpIKqxTClGhp2I/FIT1dOQlGLdMaoi6Ne80TjsNi5p1CGBNEyhFHIk
         CZ5ZgaAapfxkoAnQmzLgEPWplmwIx3/no0YLsUv9ILHgkFBGHx6rgTHZJsQn1IZzjtRI
         yOrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736271438; x=1736876238;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cmHjE2lkD0g0xx6Gl/UkMawOpI57ARHUpmlod3G7faY=;
        b=atW13F3nGJPUPk0ILxEB6PhXl1KP87IpWmU4CoA9DVm1Hl0iiyka6gTPfFSMrKOJCH
         r6LAfyQ3fFbWcC6WB60g/6+mer69QcY/GGx2GepMFLziFERYSJ6w6MZDD0CAdTpssvay
         gl/dLRgZPaUHHday4/7B3r01EhKrPbJkTd9v9LJViMsR5bPkFRZXu/jvCtGJl+v4+o/F
         libpvfIAe0GjaeGQmEYxqRGphCtX+SB0/DZSfT1OB2BMKNDYqi0EAiCg06pwI0JoqLC6
         R3ca21DJkMFbs/tGzfUX47TfaJbaSFItCmW91IjyqGOEoLX6lmawvfODFUi/+LETICmo
         hqaQ==
X-Forwarded-Encrypted: i=1; AJvYcCVU74wpif0ovvnNwdm4BKe7JciKqyEJhalB2wvAIR5DiNeeEPWEn7yG6DdkvlhKLn7pviTDMoKNNRoH8x8GhXCH@lists.infradead.org
X-Gm-Message-State: AOJu0YzXnOMCwDm/V7Objh34vbZIb16o8fEudS0hiaKWLMpxAfMKI3iJ
	41hcg6ZgFRbY/qP2sQ/9Z3DWHEEMsI1RGHcCjO8ehX5Yx2RnwL29oOoDHTkzo/ut/0MMswa2t/B
	2mH8AOCvC+tDMQiCA20a/JWFhGs8PRhq3qq8U3Q==
X-Gm-Gg: ASbGncv0S/oMiQA/VrcBm8Gu+/EIIdurRN6JyG+zIdIb0jYoxxZvhW8zSrFqsDqzRbe
	r8Dipu0Bc3SthmhNOp/kAk7RegTXZIKiO38saiie3CgxzsdFqaxhgFrHx99LpcHm5DbzHYA==
X-Google-Smtp-Source: AGHT+IFYk5WehCA40a2wfI0ajxU4GIlZeepyDjpPF91Y0RHGRGsB3B5pPvtwt5vX8I9Cy06Tv50cKxRAidAC2qpDuGk=
X-Received: by 2002:a05:690c:6188:b0:6ec:b10a:22a4 with SMTP id
 00721157ae682-6f3f814987fmr436349587b3.25.1736271438618; Tue, 07 Jan 2025
 09:37:18 -0800 (PST)
MIME-Version: 1.0
References: <20241220-media-rpi-hevc-dec-v1-0-0ebcc04ed42e@raspberrypi.com>
 <6d6c49919af9e782bd8e9be5066e92c9704ad5b7.camel@ndufresne.ca> <CAPY8ntCxH2C=YEJEcee0b2UuXU+xZ0Ntbuvc29MLAipr9DCmmw@mail.gmail.com>
In-Reply-To: <CAPY8ntCxH2C=YEJEcee0b2UuXU+xZ0Ntbuvc29MLAipr9DCmmw@mail.gmail.com>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Tue, 7 Jan 2025 17:36:59 +0000
X-Gm-Features: AbW1kva1c-wF8LxGNPRfx7aSpLMcjdTj9HSc4eylw-49J0HDJDNwcTvpDwOjxec
Message-ID: <CAPY8ntCxQDVe8G+ZtcjcT1ikVCUzNXMpGLvsFMUUDvZSx7zOAg@mail.gmail.com>
Subject: Re: [PATCH 0/7] Raspberry Pi HEVC decoder driver
To: Nicolas Dufresne <nicolas@ndufresne.ca>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, John Cox <john.cox@raspberrypi.com>, 
	Dom Cobley <dom@raspberrypi.com>, review list <kernel-list@raspberrypi.com>, 
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, John Cox <jc@kynesim.co.uk>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, John Cox <john.cox@raspberypi.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_093719_769506_8661800D 
X-CRM114-Status: GOOD (  55.85  )
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

On Tue, 7 Jan 2025 at 16:13, Dave Stevenson
<dave.stevenson@raspberrypi.com> wrote:
>
> Hi Nicolas
>
> On Mon, 6 Jan 2025 at 20:46, Nicolas Dufresne <nicolas@ndufresne.ca> wrot=
e:
> >
> > Hi Dave,
> >
> > Le vendredi 20 d=C3=A9cembre 2024 =C3=A0 16:21 +0000, Dave Stevenson a =
=C3=A9crit :
> > > Hi All
> > >
> > > This has been in the pipeline for a while, but I've finally cleaned
> > > up our HEVC decoder driver to be in a shape to at least get a first
> > > review.
> > > John Cox has done almost all of the work under contract to Raspberry
> > > Pi, and I'm largely just doing the process of patch curation and
> > > sending.
> > >
> > > There are a couple of questions raised in frameworks.
> > > The main one is that the codec has 2 independent phases to the decode=
,
> > > CABAC and reconstruction. To keep the decoder operating optimally
> > > means that two requests need to be in process at once, whilst the
> > > current frameworks don't want to allow as there is an implicit
> > > assumption of only a single job being active at once, and
> > > completition returns both buffers and releases the media request.
> > >
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
> >
> > I think part of the manual request completion RFC will be to evaluate t=
he impact
> > on VB2_V4L2_FL_SUPPORTS_M2M_HOLD_CAPTURE_BUF feature. MTK does not supp=
ort
> > interleaved interlaced decoding (only alternate), so they didn't have t=
o
> > implement that feature.
> >
> > Overall, It would be nice to get your feedback on the new manual reques=
t
> > proposal, which is I believe better then the pin/unpin API you have in =
this
> > serie.
>
> I wasn't aware of that series, but I / John will take a look.

As I said at the beginning, I'm largely an intermediary here, and may
get things wrong as my codec knowledge is far from comprehensive. I'm
hoping John will correct me if I misrepresent our conversations.

As you say the MTK codec doesn't set
VB2_V4L2_FL_SUPPORTS_M2M_HOLD_CAPTURE_BUF, and hence it can call
v4l2_m2m_job_finish without hitting the WARN.

Your comment about it not supporting interleaved interlaced decoding
confuses me slightly. Almost all the codecs allow a single frame to be
encoded as multiple slices, and I'd be surprised if none of the test
streams exercise that.
Our reading of the situation was that if you have more than one
encoded slice making up the video frame then you are NOT obliged to
submit all of the slices at once via the variable length array
control, and submitting the slices one at a time is permitted. That
means that almost all decoders have to set the
VB2_V4L2_FL_SUPPORTS_M2M_HOLD_CAPTURE_BUF flag to be able to hold onto
the CAPTURE buffer until it has been given all the encoded data to
generate it.

If there isn't a need to support a multi-slice frame being presented
via multiple OUTPUT buffers, then we can cull some code and drop the
flag.
HEVC has no real concept of interlaced content, so no need to worry
about that as the other route to having multiple slices producing one
video frame.

  Dave

> > >
> > > We also have a need to hold on to the media request for phase 2. John
> > > had discussed this with Ezequiel (and others) a couple of years back,
> > > and hence suggested a patch that adds media_request_{pin,unpin} to
> > > grab references on the media request. Discussion required on that
> > > or a better way of handling it.
> > >
> > > I will apologise in advance for sending this V1 just before I head of=
f
> > > on the Christmas break, but will respond to things as soon as possibl=
e.
> >
> > One thing missing in this summary is how this driver is being validated
> > (specially that for this one requires a downstream fork of FFMPEG). To =
this
> > report we ask for:
> >
> > - v4l2-compliance results
> > - Fluster conformance tests results [1] and I believe you need [2]
> >
> > [1] https://github.com/fluendo/fluster
> > [2] https://github.com/fluendo/fluster/pull/179
>
> Sure, I'll sort that before doing a V2.
>
> > GStreamer support is there in main now, but without the needed software=
 video
> > converter for you column tiling, we can't use it for that (i.e. only wo=
rks
> > through GL or Wayland).
>
> Can you point me at the right place for the software converter?
> It's a relatively trivial reformat required to get it back into NV12 /
> I420 or 10bit equivalents, so happy to do that. I think John already
> has NEON optimised code if desired.
>
>   Dave
>
> > regards,
> > Nicolas
> >
> > >
> > > Thanks
> > >   Dave
> > >
> > > Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > > ---
> > > Dave Stevenson (4):
> > >       docs: uapi: media: Document Raspberry Pi NV12 column format
> > >       media: ioctl: Add pixel formats NV12MT_COL128 and NV12MT_10_COL=
128
> > >       media: dt-bindings: media: Add binding for the Raspberry Pi HEV=
C decoder
> > >       arm: dts: bcm2711-rpi: Add HEVC decoder node
> > >
> > > Ezequiel Garcia (1):
> > >       RFC: media: Add media_request_{pin,unpin} API
> > >
> > > John Cox (2):
> > >       media: platform: Add Raspberry Pi HEVC decoder driver
> > >       RFC: v4l2-mem2mem: Remove warning from v4l2_m2m_job_finish
> > >
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
> > >
> > > Best regards,
> >

