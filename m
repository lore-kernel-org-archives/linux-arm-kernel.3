Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03A94E77188
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jan 2025 20:48:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EloCmD5vSvykTTCm70QPpfJi//8F/dnIThWOyUh1lm4=; b=nS5mpEXSxlj/jIgSgqVCR2+Vkg
	ulUGqRqpXf3+gKm2wgtREGQJhkcPbWiaQk91Ew9BdPr5rQuyZbKH8oJNqLm8kl7ok2PscqFsxqTjT
	DBOkNC/X89/3dvlEdBsWGjhRMAW0Kg9g42QFUHtEl4fIEo7tQ854J3hnBlnkvEMJTiuU0BrQ8fg8x
	oybCZTc+Dvl1ibnkN0ltH2/h58VjekSOZDscBvm2nfmgqN/rU4tEuNKvyLGsQbwGF/F1ezR/YYwlc
	HtM3lYkcYvitOjeigzJoW32Qouy//fQiPJK5fBF2AH7TT0IFhXivTrAWPu87hVSGxuOo6qKGs0ULu
	bnj4UWfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUu1A-00000002dO7-19xt;
	Mon, 06 Jan 2025 20:48:08 +0000
Received: from mail-qk1-x72a.google.com ([2607:f8b0:4864:20::72a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUtzy-00000002dDn-2HMk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jan 2025 20:46:55 +0000
Received: by mail-qk1-x72a.google.com with SMTP id af79cd13be357-7b6e9317a2aso1316420585a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jan 2025 12:46:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1736196413; x=1736801213; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=EloCmD5vSvykTTCm70QPpfJi//8F/dnIThWOyUh1lm4=;
        b=pvOnjcGOEYT3FktMB0EndNApstHaJdrsIsRrGEL+RiLpPZGpDXDB+5XoJ245+3sVWu
         EVX4zmWOcSwYbdXR2vUtZiMq8ehtWN5jIu25QMzND5DTD3DJblxEf/I8+EOm7Axbh7KC
         w1kgGEm8ETUutHsoOhIcuYu7pWBmX8pvpuA3YhdAQqvZPEd/N4lA7Yh+qqeAx+RcJWb6
         3PpsBmocdHeimKBqgKC1jcGGzCTTkTKqMhvJFZnG/2h6dpmESo86xl0VD1Ip9y3GNfof
         K+ZQCurhPA2s6PbGD2hvbN8e3Sc6ImeaXd0Tk9SpCOU9aHF0uBcgDjz0xr31P4mC2nW8
         AerQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736196413; x=1736801213;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EloCmD5vSvykTTCm70QPpfJi//8F/dnIThWOyUh1lm4=;
        b=Vs2QeJzu2p6DNxT4Fli1vZw1JZQHXaCqwURAbdgC0Yl9A0qDZdaelDQMw03czn96vn
         lTeDnMcOG47+h1ryXl1g7foBulF6+jCeVbARvlMdo3JmseuFOrDOVTFDkyju4vyvCNHn
         kwZ/pklYDKpYp3AUHoyKlkqTWZoaK0LVTl6ACngMg6e8Kpv9wgxclZHgAhKVOEPaI9lI
         pdu95+6vhA7JHiwEt3SGvhnsMMrIxUYoMT12rO3/Pcz6q7yHOfBZJDXanPJ528VTKlGG
         ADORs/KIeaoR6c8NpX7AHbZZg70EcRnom0OpTFsr9P9CR684RQR4zhRMYM+++vLqObxd
         8JpA==
X-Forwarded-Encrypted: i=1; AJvYcCVE4roc2r5k1h6PsLrZl3MhOuO0My0ecpWYAC5U9ytF/YXnGKPzQSiH8MuS68D7Du+MYYiS/cWwSHAXkHur2SS/@lists.infradead.org
X-Gm-Message-State: AOJu0YyFhKMaIuaaj5GFbhq5A+v1ovLgzuM2OKEHvoQo/E/w9ahhXKDL
	BQTA8anuUfDGr4QZ8+cSHsC02Pry4OaZqoh3SvYkAYhiYlcFtyE4M/RYa+cO5Wo=
X-Gm-Gg: ASbGnctwiM0E1UJ3kGI/qnFnsRoYJLaUYs1fEywm0yMl8BOuY+YMuXIzqvctkcCOlPi
	zSO5dg6b+WdaytZtSMJS/2lbhVmSTztuHqTSNpSatGN8RkQ3hJiyozBKwii1EMppk0VsMt8mDhu
	lgTiNoQOIERyAOkkSPlVIKPtAEUJrvNq3PrbCeg0cDPagYsfqQwtOAScHkKFZ+oX+q21FmnLh2N
	RWHERZItt4KflkcfRf1Nod8hNEVtxXqxsE+r8/m/0ZCH4axWg8gdlADDQ==
X-Google-Smtp-Source: AGHT+IEMUpx5WSDntOkVlHd6swggwLWbFswANwJgtDgghf091d82A662g87XBemFKef9WXo9+bywug==
X-Received: by 2002:a05:620a:2886:b0:7b6:fdb9:197e with SMTP id af79cd13be357-7bb902488camr127330485a.8.1736196413275;
        Mon, 06 Jan 2025 12:46:53 -0800 (PST)
Received: from nicolas-tpx395.localdomain ([2606:6d00:15:862e::7a9])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b9ac2d1054sm1539427285a.32.2025.01.06.12.46.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2025 12:46:52 -0800 (PST)
Message-ID: <6d6c49919af9e782bd8e9be5066e92c9704ad5b7.camel@ndufresne.ca>
Subject: Re: [PATCH 0/7] Raspberry Pi HEVC decoder driver
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>, Sakari Ailus	
 <sakari.ailus@linux.intel.com>, Laurent Pinchart	
 <laurent.pinchart@ideasonboard.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>,  Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,  Florian Fainelli
 <florian.fainelli@broadcom.com>, Broadcom internal kernel review list	
 <bcm-kernel-feedback-list@broadcom.com>, John Cox
 <john.cox@raspberrypi.com>,  Dom Cobley <dom@raspberrypi.com>, review list
 <kernel-list@raspberrypi.com>, Ezequiel Garcia	
 <ezequiel@vanguardiasur.com.ar>
Cc: John Cox <jc@kynesim.co.uk>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
  John Cox <john.cox@raspberypi.com>
Date: Mon, 06 Jan 2025 15:46:51 -0500
In-Reply-To: <20241220-media-rpi-hevc-dec-v1-0-0ebcc04ed42e@raspberrypi.com>
References: <20241220-media-rpi-hevc-dec-v1-0-0ebcc04ed42e@raspberrypi.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2 (3.54.2-1.fc41) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_124654_585821_7B990252 
X-CRM114-Status: GOOD (  33.02  )
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

Hi Dave,

Le vendredi 20 d=C3=A9cembre 2024 =C3=A0 16:21 +0000, Dave Stevenson a =C3=
=A9crit=C2=A0:
> Hi All
>=20
> This has been in the pipeline for a while, but I've finally cleaned
> up our HEVC decoder driver to be in a shape to at least get a first
> review.
> John Cox has done almost all of the work under contract to Raspberry
> Pi, and I'm largely just doing the process of patch curation and
> sending.
>=20
> There are a couple of questions raised in frameworks.
> The main one is that the codec has 2 independent phases to the decode,
> CABAC and reconstruction. To keep the decoder operating optimally
> means that two requests need to be in process at once, whilst the
> current frameworks don't want to allow as there is an implicit
> assumption of only a single job being active at once, and
> completition returns both buffers and releases the media request.
>=20
> The OUTPUT queue buffer is finished with and can be returned at the
> end of phase 1, but the media request is still required for phase 2.
> The frameworks currently force the driver to be returning both
> together via v4l2_m2m_buf_done_and_job_finish. v4l2_m2m_job_finish
> would complete the job without returning the buffer as we need,
> however if the driver has set VB2_V4L2_FL_SUPPORTS_M2M_HOLD_CAPTURE_BUF
> then we have a WARN in v4l2_m2m_job_finish.
> Dropping the WARN as this series is currently doing isn't going to be
> the right answer, but it isn't obvious what the right answer is.
> Discussion required.

I think part of the manual request completion RFC will be to evaluate the i=
mpact
on VB2_V4L2_FL_SUPPORTS_M2M_HOLD_CAPTURE_BUF feature. MTK does not support
interleaved interlaced decoding (only alternate), so they didn't have to
implement that feature.

Overall, It would be nice to get your feedback on the new manual request
proposal, which is I believe better then the pin/unpin API you have in this
serie.

>=20
> We also have a need to hold on to the media request for phase 2. John
> had discussed this with Ezequiel (and others) a couple of years back,
> and hence suggested a patch that adds media_request_{pin,unpin} to
> grab references on the media request. Discussion required on that
> or a better way of handling it.
>=20
> I will apologise in advance for sending this V1 just before I head off
> on the Christmas break, but will respond to things as soon as possible.

One thing missing in this summary is how this driver is being validated
(specially that for this one requires a downstream fork of FFMPEG). To this
report we ask for:

- v4l2-compliance results
- Fluster conformance tests results [1] and I believe you need [2]

[1]=C2=A0https://github.com/fluendo/fluster
[2]=C2=A0https://github.com/fluendo/fluster/pull/179

GStreamer support is there in main now, but without the needed software vid=
eo
converter for you column tiling, we can't use it for that (i.e. only works
through GL or Wayland).

regards,
Nicolas

>=20
> Thanks
>   Dave
>=20
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> ---
> Dave Stevenson (4):
>       docs: uapi: media: Document Raspberry Pi NV12 column format
>       media: ioctl: Add pixel formats NV12MT_COL128 and NV12MT_10_COL128
>       media: dt-bindings: media: Add binding for the Raspberry Pi HEVC de=
coder
>       arm: dts: bcm2711-rpi: Add HEVC decoder node
>=20
> Ezequiel Garcia (1):
>       RFC: media: Add media_request_{pin,unpin} API
>=20
> John Cox (2):
>       media: platform: Add Raspberry Pi HEVC decoder driver
>       RFC: v4l2-mem2mem: Remove warning from v4l2_m2m_job_finish
>=20
>  .../bindings/media/raspberrypi,hevc-dec.yaml       |   72 +
>  .../userspace-api/media/v4l/pixfmt-yuv-planar.rst  |   42 +
>  MAINTAINERS                                        |   10 +
>  arch/arm/boot/dts/broadcom/bcm2711-rpi.dtsi        |    5 +
>  arch/arm/boot/dts/broadcom/bcm2711.dtsi            |    9 +
>  drivers/media/mc/mc-request.c                      |   35 +
>  drivers/media/platform/raspberrypi/Kconfig         |    1 +
>  drivers/media/platform/raspberrypi/Makefile        |    1 +
>  .../media/platform/raspberrypi/hevc_dec/Kconfig    |   17 +
>  .../media/platform/raspberrypi/hevc_dec/Makefile   |    5 +
>  .../media/platform/raspberrypi/hevc_dec/hevc_d.c   |  443 ++++
>  .../media/platform/raspberrypi/hevc_dec/hevc_d.h   |  190 ++
>  .../platform/raspberrypi/hevc_dec/hevc_d_h265.c    | 2629 ++++++++++++++=
++++++
>  .../platform/raspberrypi/hevc_dec/hevc_d_hw.c      |  376 +++
>  .../platform/raspberrypi/hevc_dec/hevc_d_hw.h      |  303 +++
>  .../platform/raspberrypi/hevc_dec/hevc_d_video.c   |  685 +++++
>  .../platform/raspberrypi/hevc_dec/hevc_d_video.h   |   38 +
>  drivers/media/v4l2-core/v4l2-ioctl.c               |    2 +
>  drivers/media/v4l2-core/v4l2-mem2mem.c             |    7 -
>  include/media/media-request.h                      |   12 +
>  include/uapi/linux/videodev2.h                     |    5 +
>  21 files changed, 4880 insertions(+), 7 deletions(-)
> ---
> base-commit: e90c9612ac3969cb8206029a26bcd2b6f5d4a942
> change-id: 20241212-media-rpi-hevc-dec-3b5be739f3bd
>=20
> Best regards,


