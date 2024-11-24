Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FC6AE6688F
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 24 Nov 2024 03:10:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4+SmZ5O1idyx9nxxUYpNJ/ay8b6RbqKKFo2QgDR4SSw=; b=VS6PP6OnKJP++d5ZfRTbkBXdo9
	EpHQ3yEm7g0nG8LlBa3stZeAg7gnC5UABVMK195W6ke9Nln/cpms6ozkMr14am/niGu8G3HN5HrsF
	AV46/elTyVuofXNJ70oDxPbPt8R44fLgWNIjrDSIJDLHrgSrN+3e2HUXCnkcyBCmaGEKhsWdzQIGd
	kf6vax+ppa7hL7tzcXFdD55hYhTOfhoGBhrqMNjSft4SG9mzMahT+CA99XaWrimkJ0t+2//l9nn8/
	GHCYqc5Sr0bJhidkH6XIii+JO0ZqQeNYn4qV+Z6cDwXvVNhy/PeYqHzEAh6Z5s5F7+6eeQ95yifyu
	42rcVKxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tF319-00000005CrC-13cC;
	Sun, 24 Nov 2024 03:10:35 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tF30C-00000005CiG-06XA;
	Sun, 24 Nov 2024 03:09:37 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-720c2db824eso3385257b3a.0;
        Sat, 23 Nov 2024 19:09:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732417775; x=1733022575; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4+SmZ5O1idyx9nxxUYpNJ/ay8b6RbqKKFo2QgDR4SSw=;
        b=PFvL+XKDBP3wtSdNvQvNFH33NuSZjOVqJzUdj7X6xC3asex0AORzWQF+3JIvGFP6eD
         GcIf2wcKS26D2/5qusTkWSc7AOabuokQBLr2x7dAyUgw8chJCq/vERrtkoNjMVgPcWOd
         dMU9rs5vB6O/uLJG3GEB3MqFJR2pPpZzKXf0j3vpPL3SL8Fd6MA8qOAcPCi21G64fcc3
         LbnO+c8ffxVd67FkMKtQxQcmi7HyyxgZAK5FPMwJRmrUfbx9DUpcgXrUmv6YnzolFiP/
         6+T/QrEUS12fiOPI4oa5tKUjAvu4aUQuGXGlqHPYOPpnGdpS1zo5LebsroEOR0QAcwKT
         oBRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732417775; x=1733022575;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4+SmZ5O1idyx9nxxUYpNJ/ay8b6RbqKKFo2QgDR4SSw=;
        b=DxDGKDs2vJObSBTA+VRz4GeJiT1kNT15EGx6OaSBIBnOK0NOTtDXYWLMS/S0qDE9Wx
         SU3SOHp7pZZPw+PH2ddIsypTyTdZQrlztXSVLkfNUtSfIQ4fkwDj5j5de4A6cx6QqMmp
         c4D5U8449stfy9mxcPAMOIbdtl69S1gD8+AA4Obmhf3JclvR2x5d1msuers14nUqBjrU
         PUYsvSxBIlGRG+qbi3ak1zAgyV5a/ZA0dTg8OoS8/swOd6ZDisIaWIlSEyUkRIBEsA1t
         KLdc2KWLqV65jM7dScaVgduFG45TwHj1mLXyy6ztAnnYRDRHs4bwt6xPyKwsn0Ho2jZp
         p9eg==
X-Forwarded-Encrypted: i=1; AJvYcCUlbNGfekHrTRYqQH5y6UI1SFAYfHkYtykuKwOPaHQDkxEI7e9YS3bWo1aURYULv4hKDJNAaGTzEBMysxMPYhQ=@lists.infradead.org, AJvYcCXuBCr3OKNgVckr4Yx2mmaqvlKuuN9TMj+w0SivJabhtQjQeQkaooqXRNLMcdNTkiPi0lRN8ts4iLy88xNUYkb4@lists.infradead.org
X-Gm-Message-State: AOJu0YytC19g6SSzdlfFl2mbZML6LhBbMNcZanETT1gQkuu5zMKHU12j
	P74eAkL/j5lKN6jkkKRW8jT+ubZx86MZ1n7nduFG+esObhea6XS8tkWoergFHiEc9XZP+aHJBJn
	N9tSMRoW9IDLAOQ1OguEsyoy4sq4=
X-Gm-Gg: ASbGncsx0LkbbJRcNL4O7ZNQcf0/9ElPlDnIcxmCWtV62AeSthPllMrzjmCbrKoLK3W
	lRInied6eA7a8BBkBD1Q2h5HDg3l3n/8=
X-Google-Smtp-Source: AGHT+IG0Y23MhsftEXKYRfu9HiZmUraCNXR69wteGncoeREYFexmu0TkcVsDHI751SLBgXR/i8ns8wQeV0KiejYebOU=
X-Received: by 2002:a17:903:244b:b0:211:f6e4:d68e with SMTP id
 d9443c01a7336-2129fce2e23mr120152755ad.10.1732417774793; Sat, 23 Nov 2024
 19:09:34 -0800 (PST)
MIME-Version: 1.0
References: <20241121131904.261230-1-hugues.fruchet@foss.st.com>
In-Reply-To: <20241121131904.261230-1-hugues.fruchet@foss.st.com>
From: Adam Ford <aford173@gmail.com>
Date: Sat, 23 Nov 2024 21:09:23 -0600
Message-ID: <CAHCN7xJr-sXPGMr7aPH=-Cg+-YQMYChY0u6UNuH5rH8g6cpXhg@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] Add WebP support to hantro decoder
To: Hugues Fruchet <hugues.fruchet@foss.st.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Sebastian Fricke <sebastian.fricke@collabora.com>, Ricardo Ribalda <ribalda@chromium.org>, 
	Erling Ljunggren <hljunggr@cisco.com>, Hans Verkuil <hverkuil@xs4all.nl>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241123_190936_085083_24D5A1A4 
X-CRM114-Status: GOOD (  17.86  )
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

On Thu, Nov 21, 2024 at 7:22=E2=80=AFAM Hugues Fruchet
<hugues.fruchet@foss.st.com> wrote:
>
> Add WebP image decoding support to stateless V4L2 VP8 decoder.
>
> This have been tested on STM32MP257-EV board using GStreamer.

I want to test this on an i.MX8M Mini.  Is there a certain gstreamer
version or branch I should use, or is 1.24 sufficient?

adam
>
> Simple basic test:
> $> wget https://www.gstatic.com/webp/gallery/1.webp
> $> gst-launch-1.0 filesrc location=3D 1.webp ! typefind ! v4l2slwebpdec !=
 imagefreeze num-buffers=3D20 ! waylandsink fullscreen=3Dtrue
>
> Slideshow of a set of WebP pictures and WebM video files:
> $> wget https://www.gstatic.com/webp/gallery/2.webp
> $> wget https://www.gstatic.com/webp/gallery/3.webp
> $> wget https://www.gstatic.com/webp/gallery/4.webp
> $> wget https://www.gstatic.com/webp/gallery/5.webp
> $> wget https://samplemedia.linaro.org/VP8/big_buck_bunny_480p_VP8_VORBIS=
_25fps_1900K_short.WebM
> $> gst-play-1.0 *.webp *.webm *.WebM --wait-on-eos
> <hit key ">" to display next file >
>
> Large WebP image > 16777215 (size > 2^24)
> $> gst-launch-1.0 fakesrc num-buffers=3D1 format=3D4 do-timestamp=3Dtrue =
filltype=3D3 sizetype=3D2 sizemax=3D25165824 blocksize=3D25165824 ! video/x=
-raw, format=3DI420, width=3D4096, height=3D3072, framerate=3D1/1 ! webpenc=
 quality=3D100 ! filesink location=3D4096x3072_HQ_random.webp
> $> ls -l 4096x3072_HQ_random.webp
> [...] 16877404 Nov 20 11:40 4096x3072_HQ_random.webp
> $> gst-launch-1.0 filesrc location=3D 4096x3072_HQ_random.webp blocksize=
=3D16876610 ! image/webp, width=3D1, height=3D1, framerate=3D0/1 ! v4l2slwe=
bpdec ! imagefreeze num-buffers=3D20 ! waylandsink fullscreen=3Dtrue
>
> Large WebP image decoding using post-processor is untested because of lac=
k
> of hardware support on this platform, nevertheless support is provided in
> this serie for further testing on another platform having post-processor
> support.
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> =3D history =3D
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> version 3:
>    - Fix remarks from Nicolas Dufresne:
>     - Document constraint about key frame only for WebP
>     - Fix rebase issue
>    - Fix typo detected by Diederik de Haas
>
> version 2:
>    - Fix remarks from Nicolas Dufresne:
>     - Use bytesperline helper to compute chroma size
>     - Introduce a new explicit WEBP frame compressed format
>       instead of relying on VP8 + WebP flag
>     - 4K support in both decoder and post-proc
>
> version 1:
>   - Initial submission
>
> Hugues Fruchet (3):
>   media: uapi: add WebP uAPI
>   media: verisilicon: add WebP decoding support
>   media: verisilicon: postproc: 4K support
>
>  .../userspace-api/media/v4l/biblio.rst          |  9 +++++++++
>  .../media/v4l/pixfmt-compressed.rst             | 17 +++++++++++++++++
>  drivers/media/platform/verisilicon/hantro.h     |  2 ++
>  .../media/platform/verisilicon/hantro_g1_regs.h |  3 ++-
>  .../platform/verisilicon/hantro_g1_vp8_dec.c    | 14 ++++++++++++++
>  .../platform/verisilicon/hantro_postproc.c      |  6 +++++-
>  .../media/platform/verisilicon/hantro_v4l2.c    |  2 ++
>  .../platform/verisilicon/stm32mp25_vpu_hw.c     | 17 +++++++++++++++--
>  drivers/media/v4l2-core/v4l2-ioctl.c            |  1 +
>  include/uapi/linux/videodev2.h                  |  1 +
>  10 files changed, 68 insertions(+), 4 deletions(-)
>
> --
> 2.25.1
>
>

