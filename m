Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8601FCA0EC4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Aug 2025 02:34:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=47wXFH/mF2GbpAeMoWSuZbZJWSqZQr2mIeTg2QUMF9Y=; b=0MD0eqFX5jJBd7mvLaFL6bzHd8
	LwApQ2VYyWQPADORa5kOaz98azG7G2TQL6FnJjR15SgZ8WEg7koYDzuUdvsuNXm+uZEloIwsvbA2M
	IFU32KjIv6uEcef8nczasor9eQ8tVG89em6ipuQIgQE40SD0GY71qVckvYn67TVWNOCKrVJhBSa2v
	29UfJbHUrBQ36tu2uFEOopk1Awz+fAceUZufzkrdPSI1HwOMAqm7srKoG1zn6uT/emmEDu8KevVHV
	8yB4Gx8UVvxrjqKzwKWcyFznApQg4JzC7X8LV4gp7jw+59yeFcBaOjY7r5RMo4XSFpH2NI1MfT6nQ
	gRjne7Tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uleq1-00000009cJG-2UYq;
	Tue, 12 Aug 2025 02:34:09 +0000
Received: from mail-ed1-f51.google.com ([209.85.208.51])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulenP-00000009c5c-2IqP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Aug 2025 02:31:28 +0000
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-617b36cc489so9757865a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 Aug 2025 19:31:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754965885; x=1755570685;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=47wXFH/mF2GbpAeMoWSuZbZJWSqZQr2mIeTg2QUMF9Y=;
        b=V5wFbAyWep6KBfH2STKPFFFTIFy3p1TI6RQsZApiV0cKCpJH8OLy682x3qppeNH1s/
         TMHJw/hOgMDr+3snk/HFZsXJojbIUQrZbz9B9rSG/yKG5xE8UDEVZA36hse0/bP6W3yD
         qJaUNb1UncOxISpMO5Dy4A/iOzPwYBakzsLazCfuGO0NBLQan3RxuTDvP8upnQJbjTKm
         DS7ABWXgnkOnAsQUGmXL6XJMqIFZJSCbhkMsBHe0BhXl82xk97l1dt6vbDOK2RSKmGoj
         no1X9f6c7MwfHyHGsDYZyIEZRn1T+uBgc0ZmoCMmwuTUSGBpBkbTAhQzk4uIk3wyDrhv
         bk0A==
X-Forwarded-Encrypted: i=1; AJvYcCVu2fWiDBIraaqbusCLcMg4cMpkv3ZHpjpnh5JVc6zVL8x81CAi1fe4tjL1h+0N82k74v68zddzPPHGdZPjUEnx@lists.infradead.org
X-Gm-Message-State: AOJu0YyZcQtmTMm66OyMtj5qEXzvCDVSmU4mwLEqwTBYQ9HMEoJsoUmv
	TeHnEYV7tTmb82DUHZFSLPgPqmkceyLD/hK/7kfuE/jHUn6lrBY1Z0lwE2ankvWhq0A=
X-Gm-Gg: ASbGncuO5swMTxnHqbZChtgzGMT9/KmM8iKzzf8biy3Vcl2tQruU/6Ii+S3skIr1b3L
	KASxEcsoKG4vgqqthqCb8ir5aohIdX2SY0NgG9yAsTQuH2TwZ78QhbxzwEnxcLASymtR+Bj7c3j
	1F9RZ0Z0KXehhXAf3LDZisza2rToDD+KyK0pSxOtum5QpwxroP8tim59CIHqYDmpXoLqftzEbhw
	hKTjwSpowXNHb55lu+Ux0nI6gq523jXAXME54O4rNzXMM1qE0RYZppX2rnuIUAWE0/oNn9H19xT
	hw+DGwTd0CPfbdXiQ3ms3UJuHs/xzlweQcWw9vHapR2mqYi8tlzhKGfBuM9R1XaUKn3CbpuOZ4y
	bKQM8joWflfp4Smgnpj7pLGX5vGUnuj01eO1tInEQqYumruo7zZ/JWlnrPQ==
X-Google-Smtp-Source: AGHT+IFNWTa8esk3Se9r3BIl6q7ffQnemTQJTJ7alwCMVIVGdYku0pq7iFixWlMWeEsFDx3eCn4Pag==
X-Received: by 2002:a05:6402:3491:b0:615:a529:a988 with SMTP id 4fb4d7f45d1cf-6184eb45666mr1122638a12.14.1754965885262;
        Mon, 11 Aug 2025 19:31:25 -0700 (PDT)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com. [209.85.208.43])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-615a8f28374sm19680864a12.24.2025.08.11.19.31.24
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Aug 2025 19:31:24 -0700 (PDT)
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-615398dc162so7805310a12.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 Aug 2025 19:31:24 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVk3I503L2llcN8+LXQq6+SONTx6qYSyY9ai9C8bs+Hkp0xSnxL9FohekPhzmU763OtzaNoxXrnuDTXo1wSRZz1@lists.infradead.org
X-Received: by 2002:a05:6402:1d4a:b0:615:8ab1:9c92 with SMTP id
 4fb4d7f45d1cf-6184ec7f671mr972927a12.21.1754965884455; Mon, 11 Aug 2025
 19:31:24 -0700 (PDT)
MIME-Version: 1.0
References: <20250810220921.14307-1-will@willwhang.com> <20250810220921.14307-5-will@willwhang.com>
 <CAPY8ntATfq=yqoYkpuD5Ga-7yUb8C-_k=wSZJBpz0p9PLjVk0w@mail.gmail.com>
In-Reply-To: <CAPY8ntATfq=yqoYkpuD5Ga-7yUb8C-_k=wSZJBpz0p9PLjVk0w@mail.gmail.com>
From: Will Whang <will@willwhang.com>
Date: Mon, 11 Aug 2025 19:31:13 -0700
X-Gmail-Original-Message-ID: <CAFoNnrzHhJVbR1yQrr6o1+1JhyDB6y0NNfyJkK=by9YOJRGusQ@mail.gmail.com>
X-Gm-Features: Ac12FXxo2zIEu3DKLJ0MfSYHCGQBlJP-gsnvq9FZJ8JMtsN4IWIq_9lAHNai2po
Message-ID: <CAFoNnrzHhJVbR1yQrr6o1+1JhyDB6y0NNfyJkK=by9YOJRGusQ@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] media: docs: Add userspace-API guide for the
 IMX585 driver
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
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
X-CRM114-CacheID: sfid-20250811_193127_599347_A6D4B9DD 
X-CRM114-Status: GOOD (  47.90  )
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
Reply inline.
Thanks,
Will Whang

On Mon, Aug 11, 2025 at 7:24=E2=80=AFAM Dave Stevenson
<dave.stevenson@raspberrypi.com> wrote:
>
> Hi Will
>
> Thanks for the patches.
>
> On Sun, 10 Aug 2025 at 23:11, Will Whang <will@willwhang.com> wrote:
> >
> > The new IMX585 V4L2 sub-device driver introduces several
> > driver-specific controls for configuring Clear-HDR blending,
> > gradation compression thresholds, and HCG enabling.  This patch adds
> > an rst document under Documentation/userspace-api/media/drivers/
> > that details each control, allowed values, and their effects.
> >
> > Signed-off-by: Will Whang <will@willwhang.com>
> > ---
> >  .../userspace-api/media/drivers/imx585.rst    | 122 ++++++++++++++++++
> >  .../userspace-api/media/drivers/index.rst     |   1 +
> >  MAINTAINERS                                   |   1 +
> >  3 files changed, 124 insertions(+)
> >  create mode 100644 Documentation/userspace-api/media/drivers/imx585.rs=
t
> >
> > diff --git a/Documentation/userspace-api/media/drivers/imx585.rst b/Doc=
umentation/userspace-api/media/drivers/imx585.rst
> > new file mode 100644
> > index 000000000..9f7c16f30
> > --- /dev/null
> > +++ b/Documentation/userspace-api/media/drivers/imx585.rst
> > @@ -0,0 +1,122 @@
> > +.. SPDX-License-Identifier: GPL-2.0-only
> > +
> > +Sony IMX585 driver
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +
> > +The IMX585 image-sensor driver provides the following *driver-specific=
*
> > +V4L2 controls.  They are visible only when the IMX585 driver is loaded
> > +and sit in the sensor-private control class.
> > +
> > +HDR data blending
> > +-----------------
> > +
> > +``V4L2_CID_IMX585_HDR_DATASEL_TH``  (``U16[2]``)
> > +    Lower/upper **thresholds** (0 =E2=80=93 4095) that decide which ex=
posure is
> > +    chosen=E2=80=94or blended=E2=80=94for each pixel in Clear-HDR mode=
.
> > +
> > +``V4L2_CID_IMX585_HDR_DATASEL_BK``  (menu)
> > +    **Blending ratio** between the long-gain (LG) and
> > +    high-gain (HG) read-outs.
> > +
> > +    .. flat-table::
> > +       :stub-columns: 0
> > +       :widths: 1 5
> > +
> > +       * - ``0``
> > +         - HG =C2=BD, LG =C2=BD
> > +       * - ``1``
> > +         - HG =C2=BE, LG =C2=BC
> > +       * - ``2``     # duplicate ratio present in the datasheet
> > +         - HG =C2=BD, LG =C2=BD
> > +       * - ``3``
> > +         - HG =E2=85=9E, LG =E2=85=9B
> > +       * - ``4``
> > +         - HG 15=E2=81=8416, LG 1=E2=81=8416
> > +       * - ``5``     # second 50/50 entry as documented
> > +         - **2=E2=81=BF=E1=B5=88** HG =C2=BD, LG =C2=BD
> > +       * - ``6``
> > +         - HG 1=E2=81=8416, LG 15=E2=81=8416
> > +       * - ``7``
> > +         - HG =E2=85=9B, LG =E2=85=9E
> > +       * - ``8``
> > +         - HG =C2=BC, LG =C2=BE
> > +
> > +Gradation compression
> > +---------------------
> > +
> > +``V4L2_CID_IMX585_HDR_GRAD_TH``  (``U32[2]``)
> > +    17-bit **break-points** (0 =E2=80=93 0x1ffff) that shape the 16-bi=
t
> > +    gradation-compression curve.
> > +
> > +``V4L2_CID_IMX585_HDR_GRAD_COMP_L``  (menu)
> > +    See V4L2_CID_IMX585_HDR_GRAD_COMP_H
> > +
> > +``V4L2_CID_IMX585_HDR_GRAD_COMP_H``  (menu)
> > +    **Compression ratios** below the first break-point and between the
> > +    two break-points, respectively.
> > +
> > +    .. flat-table::
> > +        :stub-columns: 0
> > +        :widths: 1 4
> > +
> > +        * - ``0``
> > +          - 1 : 1
> > +        * - ``1``
> > +          - 1 : 2
> > +        * - ``2``
> > +          - 1 : 4   *(default for COMP_L)*
> > +        * - ``3``
> > +          - 1 : 8
> > +        * - ``4``
> > +          - 1 : 16
> > +        * - ``5``
> > +          - 1 : 32
> > +        * - ``6``
> > +          - 1 : 64  *(default for COMP_H)*
> > +        * - ``7``
> > +          - 1 : 128
> > +        * - ``8``
> > +          - 1 : 256
> > +        * - ``9``
> > +          - 1 : 512
> > +        * - ``10``
> > +          - 1 : 1024
> > +        * - ``11``
> > +          - 1 : 2048
> > +
> > +Gain settings
> > +-------------
> > +
> > +``V4L2_CID_IMX585_HDR_GAIN``  (menu)
> > +    **Additional gain** (in dB) applied to the high-gain path when
> > +    Clear-HDR is active.
> > +
> > +    .. flat-table::
> > +        :stub-columns: 0
> > +        :widths: 1 3
> > +
> > +        * - ``0``
> > +          - +0 dB
> > +        * - ``1``
> > +          - +6 dB
> > +        * - ``2``
> > +          - +12 dB *(default)*
> > +        * - ``3``
> > +          - +18 dB
> > +        * - ``4``
> > +          - +24 dB
> > +        * - ``5``
> > +          - +29.1 dB
> > +
> > +``V4L2_CID_IMX585_HCG_GAIN``  (boolean)
>
> HCG stands for High Conversion Gain, so we've got Gain repeated in the na=
me.
>
> Spell it out as V4L2_CID_IMX585_HIGH_CONV_GAIN, or call it
> CONVERSION_GAIN and use an enum control?
>
> > +    Toggle **High-Conversion-Gain** mode.
> > +
> > +    *0 =3D LCG (default), 1 =3D HCG.*
>
> An HCG / LCG control would also be applicable for IMX290 [1], so it
> would be nice if this could be a generic control instead of imx585
> specific.
>
> I never got a good description as to the benefit HCG was meant to
> give. The datasheet for IMX290 says the conversion efficiency ratio
> between HCG and LCG is 2, but not why that is any better than adding
> 6dB of analog gain.
>
What I've learned is that HCG is actually a 2nd stage amplifier, so
instead of using one for high gain, you can split it into two lower
gain stages that lower the noise.
This is also why ClearHDR and HCG have the conflict, because it is
basically sampling after the 1st gain stage and 2nd gain stage as
High/Low gain images.

I have thought about making it more generic because IMX662 and IMX678
are going to be the next patch once this one passes that also has this
function (the two are basically stripped down versions from IMX585
that the driver can be adapted to easily). I intended for the upcoming
IMX662/IMX678 driver to use IMX585's V4L2 HCG control also.

But given that I'm new to Linux kernel developments, or more
specifically, V4L2, I really don't have an idea how to do so in a way
the patch will be accepted.
Or I can make this more generic name to replace IMX585 for STARVIS2,
for example: V4L2_CID_STARVIS2_HIGH_CONV_GAIN

> Sony's website [2] states
> "Sony=E2=80=99s Super High Conversion Gain technology is designed to ampl=
ify
> electrical signals immediately after the conversion from photons, when
> the noise levels are relatively low. In this way, it reduces the
> overall noise after amplification. As a result, lower-noise images,
> compared to conventional technology, can be captured even in a
> low-illuminance environment. Lower noise levels in images also help to
> enhance the accuracy in visual or AI-assisted image recognition."
> From that one would presume you'd always want it on (lower noise =3D
> good), unless needing the minimum exposure time and the image was
> already over-exposed.
> I'm guessing you have no additional information based on your description=
 text.
>
>   Dave
>
> [1] Also IMX327, IMX462, and IMX662 which are in the same family,
> IMX678 (ratio of 2.6), and quite probably most of the Sony Starvis or
> Starvis 2 ranges.
> [2] https://www.sony-semicon.com/en/technology/security/index.html
Yeah I think Starvis 2 series all have this capability.
>
> > +
> > +Notes
> > +-----
> > +
> > +* Controls are writable while streaming; changes take effect from the
> > +  next frame.
> > +* HDR-specific controls are hidden when HDR is disabled.
> > +* Inter-control dependencies are enforced by the driver.
> > diff --git a/Documentation/userspace-api/media/drivers/index.rst b/Docu=
mentation/userspace-api/media/drivers/index.rst
> > index d706cb47b..87912acfb 100644
> > --- a/Documentation/userspace-api/media/drivers/index.rst
> > +++ b/Documentation/userspace-api/media/drivers/index.rst
> > @@ -32,6 +32,7 @@ For more details see the file COPYING in the source d=
istribution of Linux.
> >         cx2341x-uapi
> >         dw100
> >         imx-uapi
> > +       imx585
> >         max2175
> >         npcm-video
> >         omap3isp-uapi
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 175f5236a..42e32b6ba 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -23183,6 +23183,7 @@ M:      Will Whang <will@willwhang.com>
> >  L:     linux-media@vger.kernel.org
> >  S:     Maintained
> >  F:     Documentation/devicetree/bindings/media/i2c/sony,imx585.yaml
> > +F:     Documentation/userspace-api/media/drivers/imx585.rst
> >  F:     drivers/media/i2c/imx585.c
> >  F:     include/uapi/linux/imx585.h
> >
> > --
> > 2.39.5
> >
> >

