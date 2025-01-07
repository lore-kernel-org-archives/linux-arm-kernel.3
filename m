Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 603D0E77197
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 16:18:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0rvra3RCbmO7on5RjXJBOjy4ediXvLDrlpyaByEjLGY=; b=egG34YKqQzYpl08Gm/ExWPHHjz
	HLnMI81P2gGQvrTPVsiUpB9sK4vIpvVPCjaCm45ZUv6xMIOcKsavctII8ASiPhVGySinr9Pw1OFNE
	y1cs/CbvLuep76IuCRwNRPny+gCXh6d6/JCBlTlb3O+PlDrbqKndhzG+ODtOgaz/lZHxjePokcWAS
	NBG9U+5ELCgFpxyBffMRxrKmm6LKD/Z0Mm9fozWahtWvXel1NjO0BdcXCVMnKqIGaS94cOj7ql9T/
	3jJI3kb2l+RYw/ByJT1pAYKCERvp+n+aIc74CcqrXzaKorU7lVix4qA7HVbnrsDzm86E2MKtzHXYe
	ROQMAzRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVCHg-00000005anJ-3z6d;
	Tue, 07 Jan 2025 16:18:24 +0000
Received: from mail-yb1-xb2d.google.com ([2607:f8b0:4864:20::b2d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVCDi-00000005ZxO-2tmM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jan 2025 16:14:23 +0000
Received: by mail-yb1-xb2d.google.com with SMTP id 3f1490d57ef6-e53a5ff2233so21540293276.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Jan 2025 08:14:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1736266457; x=1736871257; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0rvra3RCbmO7on5RjXJBOjy4ediXvLDrlpyaByEjLGY=;
        b=rffZzcOx2PrXkzsYtiEtB7KrmmgWsyN6Sz+vmeCy9qLU8v9ld368CTg61uCi5WW8Ui
         QBANos6u/Evai4KPxQZqp4460qM/glribqt4NS4oPiZSKrkIiOhSzuEhMlfqJeddS+cE
         IHhh1kjJEXD02lMb8o1rKAXFwYFia2yAXcMLS2ro+1OSyoiccIxlVXahuVPG51tLlFBS
         5vI9jREkpWHavF3Mu2VybOWAbiQA3wXEEfrkYzjQ3AWIbVAY4Hy3Lu32L8VGV66h6tKl
         BPgq1pWiDDktwxfbyUHBq59KCUwq2T8EWDVVc/iXHsyjJJUIB6WSeMHvS7ttUNFhFhSl
         p0PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736266457; x=1736871257;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0rvra3RCbmO7on5RjXJBOjy4ediXvLDrlpyaByEjLGY=;
        b=LEjbnnxh7MjYDxTf8yFh9mKH8hNVsspobv76TZgdIsApSllatJFWbS/czX55l/oxz7
         7LDpiOaMi7/xhVo7z4hfFZEE7tH0Ovb3oGWMleUC0ErubGJqQCYg935iwvIrqJFBB7hI
         Es+N3tOkRsc3y27l9x30IQ+s0GQ4Eubsi5zL1JvlTbbvsrkPM9WbOiD+aIYKkVZRaqXL
         PaJqKQIOMfpAzL6sBL3FIvQAj22lciKG/IbxPojuvVUqqsCLKHH8+RkiXVBSDdwjwkkT
         mU7Tq4YHKSX53rsM5/5X63Zxb64MDI6Wc44Z5ea7xOWo4l0ctgmaiH7wLjM2wn3e8hcm
         JGSg==
X-Forwarded-Encrypted: i=1; AJvYcCXUGqRn1TxFpvBXhNdyx1zdC/1bAy9zbAL6fPhy5Wsd7+VySoi6bfBJoSbQw8/1FEG8oNe2NZzxJBYYn5O9gtCO@lists.infradead.org
X-Gm-Message-State: AOJu0YyyZX0+1/Mqct1mykEtVupjiy39xUolgp37bcbvL6AVfpjnsNof
	9nYefEEzfxijxDJLqRjeMpNIlIs9Hl9iM2Buwis3i/TyxyPgOIMHUkH59B2zemwZ6C9Y9UWdQZT
	ZBFFVysfIGCSgNykQp/34ygckE1VrUtztbAe9hQ==
X-Gm-Gg: ASbGncvymK9RwgPSbINunszoaHFJ3YHr9tseTNFdMJiSwE95PkXPE7ECRpk7m0kldNU
	RDpySkE+XDd89b8q+Yy6dtLarPaGrjf8pq+XeJ2+nefXca43ozG+0J3/12Ypnn1slRp24uQ==
X-Google-Smtp-Source: AGHT+IHjt6hgsSYIWcGMH4BD5lYCfFjrFTcc/W+yzGtUvG88Grw1oBmNIs84ANy3GKYQgJLFRzpBsKl6TJmjjiydVZQ=
X-Received: by 2002:a05:690c:4988:b0:6ef:7fc0:a381 with SMTP id
 00721157ae682-6f3f80d9149mr459489347b3.8.1736266456908; Tue, 07 Jan 2025
 08:14:16 -0800 (PST)
MIME-Version: 1.0
References: <20241220-media-rpi-hevc-dec-v1-0-0ebcc04ed42e@raspberrypi.com> <6d6c49919af9e782bd8e9be5066e92c9704ad5b7.camel@ndufresne.ca>
In-Reply-To: <6d6c49919af9e782bd8e9be5066e92c9704ad5b7.camel@ndufresne.ca>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Tue, 7 Jan 2025 16:13:58 +0000
Message-ID: <CAPY8ntCxH2C=YEJEcee0b2UuXU+xZ0Ntbuvc29MLAipr9DCmmw@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20250107_081418_905288_FFAA0A56 
X-CRM114-Status: GOOD (  44.29  )
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

Hi Nicolas

On Mon, 6 Jan 2025 at 20:46, Nicolas Dufresne <nicolas@ndufresne.ca> wrote:
>
> Hi Dave,
>
> Le vendredi 20 d=C3=A9cembre 2024 =C3=A0 16:21 +0000, Dave Stevenson a =
=C3=A9crit :
> > Hi All
> >
> > This has been in the pipeline for a while, but I've finally cleaned
> > up our HEVC decoder driver to be in a shape to at least get a first
> > review.
> > John Cox has done almost all of the work under contract to Raspberry
> > Pi, and I'm largely just doing the process of patch curation and
> > sending.
> >
> > There are a couple of questions raised in frameworks.
> > The main one is that the codec has 2 independent phases to the decode,
> > CABAC and reconstruction. To keep the decoder operating optimally
> > means that two requests need to be in process at once, whilst the
> > current frameworks don't want to allow as there is an implicit
> > assumption of only a single job being active at once, and
> > completition returns both buffers and releases the media request.
> >
> > The OUTPUT queue buffer is finished with and can be returned at the
> > end of phase 1, but the media request is still required for phase 2.
> > The frameworks currently force the driver to be returning both
> > together via v4l2_m2m_buf_done_and_job_finish. v4l2_m2m_job_finish
> > would complete the job without returning the buffer as we need,
> > however if the driver has set VB2_V4L2_FL_SUPPORTS_M2M_HOLD_CAPTURE_BUF
> > then we have a WARN in v4l2_m2m_job_finish.
> > Dropping the WARN as this series is currently doing isn't going to be
> > the right answer, but it isn't obvious what the right answer is.
> > Discussion required.
>
> I think part of the manual request completion RFC will be to evaluate the=
 impact
> on VB2_V4L2_FL_SUPPORTS_M2M_HOLD_CAPTURE_BUF feature. MTK does not suppor=
t
> interleaved interlaced decoding (only alternate), so they didn't have to
> implement that feature.
>
> Overall, It would be nice to get your feedback on the new manual request
> proposal, which is I believe better then the pin/unpin API you have in th=
is
> serie.

I wasn't aware of that series, but I / John will take a look.

> >
> > We also have a need to hold on to the media request for phase 2. John
> > had discussed this with Ezequiel (and others) a couple of years back,
> > and hence suggested a patch that adds media_request_{pin,unpin} to
> > grab references on the media request. Discussion required on that
> > or a better way of handling it.
> >
> > I will apologise in advance for sending this V1 just before I head off
> > on the Christmas break, but will respond to things as soon as possible.
>
> One thing missing in this summary is how this driver is being validated
> (specially that for this one requires a downstream fork of FFMPEG). To th=
is
> report we ask for:
>
> - v4l2-compliance results
> - Fluster conformance tests results [1] and I believe you need [2]
>
> [1] https://github.com/fluendo/fluster
> [2] https://github.com/fluendo/fluster/pull/179

Sure, I'll sort that before doing a V2.

> GStreamer support is there in main now, but without the needed software v=
ideo
> converter for you column tiling, we can't use it for that (i.e. only work=
s
> through GL or Wayland).

Can you point me at the right place for the software converter?
It's a relatively trivial reformat required to get it back into NV12 /
I420 or 10bit equivalents, so happy to do that. I think John already
has NEON optimised code if desired.

  Dave

> regards,
> Nicolas
>
> >
> > Thanks
> >   Dave
> >
> > Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > ---
> > Dave Stevenson (4):
> >       docs: uapi: media: Document Raspberry Pi NV12 column format
> >       media: ioctl: Add pixel formats NV12MT_COL128 and NV12MT_10_COL12=
8
> >       media: dt-bindings: media: Add binding for the Raspberry Pi HEVC =
decoder
> >       arm: dts: bcm2711-rpi: Add HEVC decoder node
> >
> > Ezequiel Garcia (1):
> >       RFC: media: Add media_request_{pin,unpin} API
> >
> > John Cox (2):
> >       media: platform: Add Raspberry Pi HEVC decoder driver
> >       RFC: v4l2-mem2mem: Remove warning from v4l2_m2m_job_finish
> >
> >  .../bindings/media/raspberrypi,hevc-dec.yaml       |   72 +
> >  .../userspace-api/media/v4l/pixfmt-yuv-planar.rst  |   42 +
> >  MAINTAINERS                                        |   10 +
> >  arch/arm/boot/dts/broadcom/bcm2711-rpi.dtsi        |    5 +
> >  arch/arm/boot/dts/broadcom/bcm2711.dtsi            |    9 +
> >  drivers/media/mc/mc-request.c                      |   35 +
> >  drivers/media/platform/raspberrypi/Kconfig         |    1 +
> >  drivers/media/platform/raspberrypi/Makefile        |    1 +
> >  .../media/platform/raspberrypi/hevc_dec/Kconfig    |   17 +
> >  .../media/platform/raspberrypi/hevc_dec/Makefile   |    5 +
> >  .../media/platform/raspberrypi/hevc_dec/hevc_d.c   |  443 ++++
> >  .../media/platform/raspberrypi/hevc_dec/hevc_d.h   |  190 ++
> >  .../platform/raspberrypi/hevc_dec/hevc_d_h265.c    | 2629 ++++++++++++=
++++++++
> >  .../platform/raspberrypi/hevc_dec/hevc_d_hw.c      |  376 +++
> >  .../platform/raspberrypi/hevc_dec/hevc_d_hw.h      |  303 +++
> >  .../platform/raspberrypi/hevc_dec/hevc_d_video.c   |  685 +++++
> >  .../platform/raspberrypi/hevc_dec/hevc_d_video.h   |   38 +
> >  drivers/media/v4l2-core/v4l2-ioctl.c               |    2 +
> >  drivers/media/v4l2-core/v4l2-mem2mem.c             |    7 -
> >  include/media/media-request.h                      |   12 +
> >  include/uapi/linux/videodev2.h                     |    5 +
> >  21 files changed, 4880 insertions(+), 7 deletions(-)
> > ---
> > base-commit: e90c9612ac3969cb8206029a26bcd2b6f5d4a942
> > change-id: 20241212-media-rpi-hevc-dec-3b5be739f3bd
> >
> > Best regards,
>

