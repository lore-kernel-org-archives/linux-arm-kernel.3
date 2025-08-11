Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8B33CA0EC4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Aug 2025 16:31:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=puwxtPHVig0pLcGPa5PtlxSBrKX59zqgWPMSUINI7LM=; b=vY3m3ODJ6tgTpYLkRUIRJwpq0h
	+qMvH0thYj4KMVgtoEAgJ37nLhP6nurIwwuNlKvQe1Dn/OV4JVq5AW1VsLX5YGYgTq06mdF0feJD3
	javQ+dEK+tVDA0wk4L4IlIvInflnZlJh6f81r1jJDV7ZGWVeay22Omzyyo7Ju4Afp00OlUwJ2DmAL
	FOsXgvsqFLd8PW02sgi+sx0At6zWdPKKMy3rvAewjJTiRnJxk+VTSws8juE3lD8Mg2oxebf3iNq8z
	G5QvHKHV16ZzbdZe/fxXS+A7LGwdl04NSZb1LNZtuCfB2XX5ohbYo8807kFRqcf+kc/Ikz+WU2n6J
	8qno1DpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulVQZ-00000008Pez-0s6g;
	Mon, 11 Aug 2025 16:31:15 +0000
Received: from mail-yw1-x112a.google.com ([2607:f8b0:4864:20::112a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulTL4-00000007ziR-2byT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Aug 2025 14:17:28 +0000
Received: by mail-yw1-x112a.google.com with SMTP id 00721157ae682-71bce78e14fso45528737b3.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 Aug 2025 07:17:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1754921845; x=1755526645; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=puwxtPHVig0pLcGPa5PtlxSBrKX59zqgWPMSUINI7LM=;
        b=Kij4YI1ZJaL0EDrdRzczZQYZOojIcywm+itJ0dd32xZbzXYCnJXpNQgt7tNr0kF4fm
         AEEluSmywHNF7iXNTXjhTZs3sIUKZN+LoG+mCc5iBIjDehdGgDFBu4c/V1NxEu86I1Sk
         DTXM44WEsTW65ERlTRq7rLwuXHBg2j7wGAtDMdHAANhADleGW4cZEtQ720CXzHcakQul
         xqHSG+EQ++jmI3fUAKA1RWH6oEvL9T+/0Nj+wHLvbEzpEADy0GTmmybiObcY3ePBizT+
         ZXxi3hCGBizHOkeBDTeudsVvqlGSUbw7lZRjhzxtncMohQn8kTFN3bYecqWHL+N2bn+D
         fT8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754921845; x=1755526645;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=puwxtPHVig0pLcGPa5PtlxSBrKX59zqgWPMSUINI7LM=;
        b=t5W4MMik4l+DTy5ERS6jwXHdYhlkogdUkXZzzff4boORFd41KgjCIo8bbjSC6jBSd7
         zqGghtQA612mKLwzIC0WZLap1G1bElH2yOS1IrCbbOxut+5WUhq+NnfT4Uubkq08tdFT
         EPEOU4rjlYyLwLhYzRJ+VvBjNo0ycEY4Vj307Zig+iJM3RAwbqRFC9KH9+QtPzEFIjf8
         jV1OAAKrcWC4Qo2rzyDstFcXO3jpD0uJ3K2KQXqtYYb9Wm6uzGpdzEYOj/F7/zk8qtKY
         g0GH9iG4JtnYxiOesGY3uxj/nClspJBxJOD6Qs+ZcxnYNlR7O2/mZlfz82uQtY/TsqLG
         xC3w==
X-Forwarded-Encrypted: i=1; AJvYcCVCrUEIhR9IQsEOjxBtGwBsnpIyb7xOaLwKCqAqFo7KJvAMlDlzYJfMa9Ka7ubk5v5MfckqAONGFdnLuBFyRF/1@lists.infradead.org
X-Gm-Message-State: AOJu0YxbIeKJHHVhQOXmNHZBWD22kZ7Oxiv8WEd5Ts+mRWItk69q0wTR
	Da1+ARhwJJNn4bHjg4jAYo0WpTE7TMneSb4VU1TYiQNY54+DRvQmy9fAQ2skDKPFVub4gZ1b7oP
	AuI84FAhar/hHVSnbQaqI+xxU6SekVP1r3dtYZxXvkg==
X-Gm-Gg: ASbGncuTWj1H5pGODUk/RogrZfUAwcd8i9gg3XBnHckrnnscctt8Xv5MOhpJkXUpGPV
	6ZSDFWB90bnN9MT3kn/+lG6sWbznUr1wARPK1cJvXdmKk8/pFKwvdmWzlKzgeMvbem2rdYJpTFa
	hGuCJaGePcw88ZYSMxN8Qs1FuduRFZ7xCsOu/yKqcI1T0rsVzC1gdvVxNM1uZeIrqj7OXRNrFDK
	uuXYPu5jtKKvd8HMEvAKN5dEUccJ8aso2QEdC0JSKvifZSG6g==
X-Google-Smtp-Source: AGHT+IFVaCpRCBxFG1bqxCNzdUSGe+eBkPCYYYPh+0MTbmkvki7WMFlCxRN6Cm4uIxlvBCrJrXYceQw4QvoWX2/rRPw=
X-Received: by 2002:a05:690c:4512:b0:71a:2093:3558 with SMTP id
 00721157ae682-71bf0d40397mr149493517b3.10.1754921845142; Mon, 11 Aug 2025
 07:17:25 -0700 (PDT)
MIME-Version: 1.0
References: <20250810220921.14307-1-will@willwhang.com> <20250810220921.14307-5-will@willwhang.com>
In-Reply-To: <20250810220921.14307-5-will@willwhang.com>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Mon, 11 Aug 2025 15:17:08 +0100
X-Gm-Features: Ac12FXyDoyByiEv3fe1CZgzKXSdSvgFu4Jp68WuY3Fc0Vbm1z6eeV1MD3juzIy8
Message-ID: <CAPY8ntATfq=yqoYkpuD5Ga-7yUb8C-_k=wSZJBpz0p9PLjVk0w@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] media: docs: Add userspace-API guide for the
 IMX585 driver
To: Will Whang <will@willwhang.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_071726_841003_E449ABC6 
X-CRM114-Status: GOOD (  32.13  )
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

Hi Will

Thanks for the patches.

On Sun, 10 Aug 2025 at 23:11, Will Whang <will@willwhang.com> wrote:
>
> The new IMX585 V4L2 sub-device driver introduces several
> driver-specific controls for configuring Clear-HDR blending,
> gradation compression thresholds, and HCG enabling.  This patch adds
> an rst document under Documentation/userspace-api/media/drivers/
> that details each control, allowed values, and their effects.
>
> Signed-off-by: Will Whang <will@willwhang.com>
> ---
>  .../userspace-api/media/drivers/imx585.rst    | 122 ++++++++++++++++++
>  .../userspace-api/media/drivers/index.rst     |   1 +
>  MAINTAINERS                                   |   1 +
>  3 files changed, 124 insertions(+)
>  create mode 100644 Documentation/userspace-api/media/drivers/imx585.rst
>
> diff --git a/Documentation/userspace-api/media/drivers/imx585.rst b/Docum=
entation/userspace-api/media/drivers/imx585.rst
> new file mode 100644
> index 000000000..9f7c16f30
> --- /dev/null
> +++ b/Documentation/userspace-api/media/drivers/imx585.rst
> @@ -0,0 +1,122 @@
> +.. SPDX-License-Identifier: GPL-2.0-only
> +
> +Sony IMX585 driver
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +The IMX585 image-sensor driver provides the following *driver-specific*
> +V4L2 controls.  They are visible only when the IMX585 driver is loaded
> +and sit in the sensor-private control class.
> +
> +HDR data blending
> +-----------------
> +
> +``V4L2_CID_IMX585_HDR_DATASEL_TH``  (``U16[2]``)
> +    Lower/upper **thresholds** (0 =E2=80=93 4095) that decide which expo=
sure is
> +    chosen=E2=80=94or blended=E2=80=94for each pixel in Clear-HDR mode.
> +
> +``V4L2_CID_IMX585_HDR_DATASEL_BK``  (menu)
> +    **Blending ratio** between the long-gain (LG) and
> +    high-gain (HG) read-outs.
> +
> +    .. flat-table::
> +       :stub-columns: 0
> +       :widths: 1 5
> +
> +       * - ``0``
> +         - HG =C2=BD, LG =C2=BD
> +       * - ``1``
> +         - HG =C2=BE, LG =C2=BC
> +       * - ``2``     # duplicate ratio present in the datasheet
> +         - HG =C2=BD, LG =C2=BD
> +       * - ``3``
> +         - HG =E2=85=9E, LG =E2=85=9B
> +       * - ``4``
> +         - HG 15=E2=81=8416, LG 1=E2=81=8416
> +       * - ``5``     # second 50/50 entry as documented
> +         - **2=E2=81=BF=E1=B5=88** HG =C2=BD, LG =C2=BD
> +       * - ``6``
> +         - HG 1=E2=81=8416, LG 15=E2=81=8416
> +       * - ``7``
> +         - HG =E2=85=9B, LG =E2=85=9E
> +       * - ``8``
> +         - HG =C2=BC, LG =C2=BE
> +
> +Gradation compression
> +---------------------
> +
> +``V4L2_CID_IMX585_HDR_GRAD_TH``  (``U32[2]``)
> +    17-bit **break-points** (0 =E2=80=93 0x1ffff) that shape the 16-bit
> +    gradation-compression curve.
> +
> +``V4L2_CID_IMX585_HDR_GRAD_COMP_L``  (menu)
> +    See V4L2_CID_IMX585_HDR_GRAD_COMP_H
> +
> +``V4L2_CID_IMX585_HDR_GRAD_COMP_H``  (menu)
> +    **Compression ratios** below the first break-point and between the
> +    two break-points, respectively.
> +
> +    .. flat-table::
> +        :stub-columns: 0
> +        :widths: 1 4
> +
> +        * - ``0``
> +          - 1 : 1
> +        * - ``1``
> +          - 1 : 2
> +        * - ``2``
> +          - 1 : 4   *(default for COMP_L)*
> +        * - ``3``
> +          - 1 : 8
> +        * - ``4``
> +          - 1 : 16
> +        * - ``5``
> +          - 1 : 32
> +        * - ``6``
> +          - 1 : 64  *(default for COMP_H)*
> +        * - ``7``
> +          - 1 : 128
> +        * - ``8``
> +          - 1 : 256
> +        * - ``9``
> +          - 1 : 512
> +        * - ``10``
> +          - 1 : 1024
> +        * - ``11``
> +          - 1 : 2048
> +
> +Gain settings
> +-------------
> +
> +``V4L2_CID_IMX585_HDR_GAIN``  (menu)
> +    **Additional gain** (in dB) applied to the high-gain path when
> +    Clear-HDR is active.
> +
> +    .. flat-table::
> +        :stub-columns: 0
> +        :widths: 1 3
> +
> +        * - ``0``
> +          - +0 dB
> +        * - ``1``
> +          - +6 dB
> +        * - ``2``
> +          - +12 dB *(default)*
> +        * - ``3``
> +          - +18 dB
> +        * - ``4``
> +          - +24 dB
> +        * - ``5``
> +          - +29.1 dB
> +
> +``V4L2_CID_IMX585_HCG_GAIN``  (boolean)

HCG stands for High Conversion Gain, so we've got Gain repeated in the name=
.

Spell it out as V4L2_CID_IMX585_HIGH_CONV_GAIN, or call it
CONVERSION_GAIN and use an enum control?

> +    Toggle **High-Conversion-Gain** mode.
> +
> +    *0 =3D LCG (default), 1 =3D HCG.*

An HCG / LCG control would also be applicable for IMX290 [1], so it
would be nice if this could be a generic control instead of imx585
specific.

I never got a good description as to the benefit HCG was meant to
give. The datasheet for IMX290 says the conversion efficiency ratio
between HCG and LCG is 2, but not why that is any better than adding
6dB of analog gain.

Sony's website [2] states
"Sony=E2=80=99s Super High Conversion Gain technology is designed to amplif=
y
electrical signals immediately after the conversion from photons, when
the noise levels are relatively low. In this way, it reduces the
overall noise after amplification. As a result, lower-noise images,
compared to conventional technology, can be captured even in a
low-illuminance environment. Lower noise levels in images also help to
enhance the accuracy in visual or AI-assisted image recognition."
From that one would presume you'd always want it on (lower noise =3D
good), unless needing the minimum exposure time and the image was
already over-exposed.
I'm guessing you have no additional information based on your description t=
ext.

  Dave

[1] Also IMX327, IMX462, and IMX662 which are in the same family,
IMX678 (ratio of 2.6), and quite probably most of the Sony Starvis or
Starvis 2 ranges.
[2] https://www.sony-semicon.com/en/technology/security/index.html

> +
> +Notes
> +-----
> +
> +* Controls are writable while streaming; changes take effect from the
> +  next frame.
> +* HDR-specific controls are hidden when HDR is disabled.
> +* Inter-control dependencies are enforced by the driver.
> diff --git a/Documentation/userspace-api/media/drivers/index.rst b/Docume=
ntation/userspace-api/media/drivers/index.rst
> index d706cb47b..87912acfb 100644
> --- a/Documentation/userspace-api/media/drivers/index.rst
> +++ b/Documentation/userspace-api/media/drivers/index.rst
> @@ -32,6 +32,7 @@ For more details see the file COPYING in the source dis=
tribution of Linux.
>         cx2341x-uapi
>         dw100
>         imx-uapi
> +       imx585
>         max2175
>         npcm-video
>         omap3isp-uapi
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 175f5236a..42e32b6ba 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -23183,6 +23183,7 @@ M:      Will Whang <will@willwhang.com>
>  L:     linux-media@vger.kernel.org
>  S:     Maintained
>  F:     Documentation/devicetree/bindings/media/i2c/sony,imx585.yaml
> +F:     Documentation/userspace-api/media/drivers/imx585.rst
>  F:     drivers/media/i2c/imx585.c
>  F:     include/uapi/linux/imx585.h
>
> --
> 2.39.5
>
>

