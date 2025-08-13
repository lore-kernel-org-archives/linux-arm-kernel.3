Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC622CA0EC4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Aug 2025 04:23:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WiFuJht5ARBGIGVBRsBNGCQ9IzHhOcOqgth3Zl6diyk=; b=fJz5itwR6epYTptdHxeCtZ15vy
	F4VOntpjlC1c8qvxaTIom6GQw/BZd1sk6vZmNiCdAFMCzMt0rcPy8Qmn3DacfEAJ+zy7IusIH47K/
	TAjzULtCTK0A+4zIXAUUfySOTDz94j48FfybmZqIaxMCMoruPtcPaG0uxfGymhMZ3lOpqJOtnNB4P
	oMWCDfNpWK6esJx71l1fU+VtDnu8R5F0Di2BdjvnORzPjJfMrg/zSahq/JE9iynl+X/e/RF8g/ipB
	eBOmuuP3fpzpVWANo4JE/EmW3kRUio4hlxWLtrt6Pt+FA5jrTLBj1AOxkl2OB7rFP7thiZRHqV3j4
	52ak0CEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um31A-0000000CZta-3CxK;
	Wed, 13 Aug 2025 04:23:16 +0000
Received: from mail-ej1-f42.google.com ([209.85.218.42])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um2yd-0000000CZby-0fpF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Aug 2025 04:20:40 +0000
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-af98b77d2f0so1145849266b.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 Aug 2025 21:20:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755058837; x=1755663637;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WiFuJht5ARBGIGVBRsBNGCQ9IzHhOcOqgth3Zl6diyk=;
        b=jL1OEd+7STM1HNzJAx2WgRw33j+4vEy9O8WCY/WZtyfAXh2BVNt5R5wdyUx0Mcyada
         6GkelHkYGIpvtnFgaconjjbPXlVRkt2k6HyDZRpLRZkLlqg1t2eB2zLKCOn6PacHwvrK
         2WSusVS9rXC/Bi/wFbsdPcSPVdZAEyDs4hpK47mWCY0VQn3v0T0RlVrvWuBgpMmiTwBp
         lYlVYyfrBGwf5EndnmCRJ8obPe/CVhuxg93/P4P0ombDKMKbNpv3gEe6gPDGJVws7BFl
         ZedyK6CRAyT67PUfdjYBV9w3T3aTOZD8EJ6CINRK+BqdDrHSaIZ9avm1Brid9wqDJUo0
         Ko9Q==
X-Forwarded-Encrypted: i=1; AJvYcCULs0e6rh8meR1pNzz6IqjwDSK/gwfJq8DWxQ7/iHiIfc9VEp/2vD5BJEkkoYO1TL295DFq8OpFwOOWcAa8NAVC@lists.infradead.org
X-Gm-Message-State: AOJu0Yw0b/1BF6GzMJWgTadoW1v7I7551SqDQZOcGDoCFoHBcSQSCPso
	to6Ng7TmDFuh5ebL7ar+otB5Cg97ujxYJ75kkqsb0FyqzoxCwKvO8KPCXlu1XBM5CQY=
X-Gm-Gg: ASbGncvbHMzjZmLqid01LNygNre+JYg7t/fI5VWeB8GK1ucWi7a3ka2ohRdUyk43XaE
	NazXSgapirDjHjl/fkIr4FA2a1X9bCDTnI4L8UHmwKIG2Ahpp/L0W2Sl4C9gb+GEONIhbMXJOAJ
	egGg3oQ03qf7cb8FPNqgqc3JGnizHpFcQ2KYpcOanbnv4dDANOyiUOJfjvW5B5EkGMRgcHv5jwD
	8CDKXNJqjqsrOkr7S53wgiiPwl72+axRZDq6SO8Lx961R/ZTfG4f9fV0WrUW23ik8jX0Cxpr2Gc
	lKZ2vV93BAagAQt1y1YwtQnSdFgycenqcOvS9B1xdxDlHnuCopb+9iLxajw3aEl1uTPSqKPOHb9
	eYG/fNpvaeDfDdpOmNvLopSJUJ/WZpENxdNnbY0Mxi2YW/nFsknIOAU4jTA==
X-Google-Smtp-Source: AGHT+IGJGpOHCBvLZhkHVvWz5FZs+PNSLUMu4jQ91C3whwdm8+DcGQtIKGLefLKje4LDwqjYyahqsQ==
X-Received: by 2002:a17:907:7e8c:b0:ade:316e:bfc with SMTP id a640c23a62f3a-afca4d79814mr125056066b.21.1755058836401;
        Tue, 12 Aug 2025 21:20:36 -0700 (PDT)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com. [209.85.208.43])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-615a8f28374sm21473393a12.24.2025.08.12.21.20.35
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Aug 2025 21:20:36 -0700 (PDT)
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6180b9e4e74so7786136a12.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 Aug 2025 21:20:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWR53+IpisMYEEfbzqGwov0dfoUD+9mm8NEStAwxYz/54urnmXLNumxrhdcrjcOYp5aoOSuAmYDJO+fJ7dGOJcX@lists.infradead.org
X-Received: by 2002:a05:6402:2105:b0:617:9bff:be16 with SMTP id
 4fb4d7f45d1cf-6186bfd2ca8mr1202681a12.22.1755058835436; Tue, 12 Aug 2025
 21:20:35 -0700 (PDT)
MIME-Version: 1.0
References: <20250810220921.14307-1-will@willwhang.com> <20250810220921.14307-5-will@willwhang.com>
 <CAPY8ntATfq=yqoYkpuD5Ga-7yUb8C-_k=wSZJBpz0p9PLjVk0w@mail.gmail.com>
 <CAFoNnrzHhJVbR1yQrr6o1+1JhyDB6y0NNfyJkK=by9YOJRGusQ@mail.gmail.com> <20250812112817.GM30054@pendragon.ideasonboard.com>
In-Reply-To: <20250812112817.GM30054@pendragon.ideasonboard.com>
From: Will Whang <will@willwhang.com>
Date: Tue, 12 Aug 2025 21:20:24 -0700
X-Gmail-Original-Message-ID: <CAFoNnrxonvqzszYKEh5Sh3xx1dnMrqYA==378vbFLLniSBjQ+w@mail.gmail.com>
X-Gm-Features: Ac12FXzTCOMqByKsE0wmQhJWPn6s_h89Xv-W4iONcQBHU9aJfaobHOmfpO4eiuc
Message-ID: <CAFoNnrxonvqzszYKEh5Sh3xx1dnMrqYA==378vbFLLniSBjQ+w@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] media: docs: Add userspace-API guide for the
 IMX585 driver
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_212039_217221_7A4F4515 
X-CRM114-Status: GOOD (  67.09  )
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

Hi Laurent,
Reply inline.

Thanks,
Will Whang

On Tue, Aug 12, 2025 at 4:28=E2=80=AFAM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Will,
>
> On Mon, Aug 11, 2025 at 07:31:13PM -0700, Will Whang wrote:
> > On Mon, Aug 11, 2025 at 7:24=E2=80=AFAM Dave Stevenson wrote:
> > > On Sun, 10 Aug 2025 at 23:11, Will Whang wrote:
> > > >
> > > > The new IMX585 V4L2 sub-device driver introduces several
> > > > driver-specific controls for configuring Clear-HDR blending,
> > > > gradation compression thresholds, and HCG enabling.  This patch add=
s
> > > > an rst document under Documentation/userspace-api/media/drivers/
> > > > that details each control, allowed values, and their effects.
> > > >
> > > > Signed-off-by: Will Whang <will@willwhang.com>
> > > > ---
> > > >  .../userspace-api/media/drivers/imx585.rst    | 122 ++++++++++++++=
++++
> > > >  .../userspace-api/media/drivers/index.rst     |   1 +
> > > >  MAINTAINERS                                   |   1 +
> > > >  3 files changed, 124 insertions(+)
> > > >  create mode 100644 Documentation/userspace-api/media/drivers/imx58=
5.rst
> > > >
> > > > diff --git a/Documentation/userspace-api/media/drivers/imx585.rst b=
/Documentation/userspace-api/media/drivers/imx585.rst
> > > > new file mode 100644
> > > > index 000000000..9f7c16f30
> > > > --- /dev/null
> > > > +++ b/Documentation/userspace-api/media/drivers/imx585.rst
> > > > @@ -0,0 +1,122 @@
> > > > +.. SPDX-License-Identifier: GPL-2.0-only
> > > > +
> > > > +Sony IMX585 driver
> > > > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > > +
> > > > +The IMX585 image-sensor driver provides the following *driver-spec=
ific*
> > > > +V4L2 controls.  They are visible only when the IMX585 driver is lo=
aded
> > > > +and sit in the sensor-private control class.
> > > > +
> > > > +HDR data blending
> > > > +-----------------
> > > > +
> > > > +``V4L2_CID_IMX585_HDR_DATASEL_TH``  (``U16[2]``)
> > > > +    Lower/upper **thresholds** (0 =E2=80=93 4095) that decide whic=
h exposure is
> > > > +    chosen=E2=80=94or blended=E2=80=94for each pixel in Clear-HDR =
mode.
> > > > +
> > > > +``V4L2_CID_IMX585_HDR_DATASEL_BK``  (menu)
> > > > +    **Blending ratio** between the long-gain (LG) and
> > > > +    high-gain (HG) read-outs.
> > > > +
> > > > +    .. flat-table::
> > > > +       :stub-columns: 0
> > > > +       :widths: 1 5
> > > > +
> > > > +       * - ``0``
> > > > +         - HG =C2=BD, LG =C2=BD
> > > > +       * - ``1``
> > > > +         - HG =C2=BE, LG =C2=BC
> > > > +       * - ``2``     # duplicate ratio present in the datasheet
> > > > +         - HG =C2=BD, LG =C2=BD
> > > > +       * - ``3``
> > > > +         - HG =E2=85=9E, LG =E2=85=9B
> > > > +       * - ``4``
> > > > +         - HG 15=E2=81=8416, LG 1=E2=81=8416
> > > > +       * - ``5``     # second 50/50 entry as documented
> > > > +         - **2=E2=81=BF=E1=B5=88** HG =C2=BD, LG =C2=BD
> > > > +       * - ``6``
> > > > +         - HG 1=E2=81=8416, LG 15=E2=81=8416
> > > > +       * - ``7``
> > > > +         - HG =E2=85=9B, LG =E2=85=9E
> > > > +       * - ``8``
> > > > +         - HG =C2=BC, LG =C2=BE
> > > > +
> > > > +Gradation compression
> > > > +---------------------
> > > > +
> > > > +``V4L2_CID_IMX585_HDR_GRAD_TH``  (``U32[2]``)
> > > > +    17-bit **break-points** (0 =E2=80=93 0x1ffff) that shape the 1=
6-bit
> > > > +    gradation-compression curve.
> > > > +
> > > > +``V4L2_CID_IMX585_HDR_GRAD_COMP_L``  (menu)
> > > > +    See V4L2_CID_IMX585_HDR_GRAD_COMP_H
> > > > +
> > > > +``V4L2_CID_IMX585_HDR_GRAD_COMP_H``  (menu)
> > > > +    **Compression ratios** below the first break-point and between=
 the
> > > > +    two break-points, respectively.
> > > > +
> > > > +    .. flat-table::
> > > > +        :stub-columns: 0
> > > > +        :widths: 1 4
> > > > +
> > > > +        * - ``0``
> > > > +          - 1 : 1
> > > > +        * - ``1``
> > > > +          - 1 : 2
> > > > +        * - ``2``
> > > > +          - 1 : 4   *(default for COMP_L)*
> > > > +        * - ``3``
> > > > +          - 1 : 8
> > > > +        * - ``4``
> > > > +          - 1 : 16
> > > > +        * - ``5``
> > > > +          - 1 : 32
> > > > +        * - ``6``
> > > > +          - 1 : 64  *(default for COMP_H)*
> > > > +        * - ``7``
> > > > +          - 1 : 128
> > > > +        * - ``8``
> > > > +          - 1 : 256
> > > > +        * - ``9``
> > > > +          - 1 : 512
> > > > +        * - ``10``
> > > > +          - 1 : 1024
> > > > +        * - ``11``
> > > > +          - 1 : 2048
> > > > +
> > > > +Gain settings
> > > > +-------------
> > > > +
> > > > +``V4L2_CID_IMX585_HDR_GAIN``  (menu)
> > > > +    **Additional gain** (in dB) applied to the high-gain path when
> > > > +    Clear-HDR is active.
> > > > +
> > > > +    .. flat-table::
> > > > +        :stub-columns: 0
> > > > +        :widths: 1 3
> > > > +
> > > > +        * - ``0``
> > > > +          - +0 dB
> > > > +        * - ``1``
> > > > +          - +6 dB
> > > > +        * - ``2``
> > > > +          - +12 dB *(default)*
> > > > +        * - ``3``
> > > > +          - +18 dB
> > > > +        * - ``4``
> > > > +          - +24 dB
> > > > +        * - ``5``
> > > > +          - +29.1 dB
> > > > +
> > > > +``V4L2_CID_IMX585_HCG_GAIN``  (boolean)
> > >
> > > HCG stands for High Conversion Gain, so we've got Gain repeated in th=
e name.
> > >
> > > Spell it out as V4L2_CID_IMX585_HIGH_CONV_GAIN, or call it
> > > CONVERSION_GAIN and use an enum control?
> > >
> > > > +    Toggle **High-Conversion-Gain** mode.
> > > > +
> > > > +    *0 =3D LCG (default), 1 =3D HCG.*
> > >
> > > An HCG / LCG control would also be applicable for IMX290 [1], so it
> > > would be nice if this could be a generic control instead of imx585
> > > specific.
> > >
> > > I never got a good description as to the benefit HCG was meant to
> > > give. The datasheet for IMX290 says the conversion efficiency ratio
> > > between HCG and LCG is 2, but not why that is any better than adding
> > > 6dB of analog gain.
> >
> > What I've learned is that HCG is actually a 2nd stage amplifier, so
> > instead of using one for high gain, you can split it into two lower
> > gain stages that lower the noise.
>
> DCG as a term is a bit confusing. It was initially used to describe an
> inter-frame HDR technique, where two different conversion gains are
> applied to separate frames by switching on and off an extra capacitor on
> the pixel's floating diffusion node. I don't know how it evolved from
> there, but just adding a second amplifier doesn't seem to be a very
> effective way to lower noise.
>
> If anyone does some research on the topic and finds clear information,
> please share them.
>
From my understanding, DOL-HDR (Digital Overlapping), multi-frame HDR
or stagger HDR are all using different exposure times to separate
high/low brightness image frames. DCG with multiframe HDR is kinda
weird because the main reason to have DCG is that you can have two
gains with one exposure/charge so both high/low gain images are
exactly from the same sample and not time delayed. If multi-frame HDR
is acceptable then using two exposure times is way easier to implement
then DCG just for multi-frame HDR.

Now that I think about it and see the register naming, I think HCG
control is for a DCG enabled sensor to select between high/low
conversion gain channels to use for the SDR result.

> > This is also why ClearHDR and HCG have the conflict, because it is
> > basically sampling after the 1st gain stage and 2nd gain stage as
> > High/Low gain images.
> >
> > I have thought about making it more generic because IMX662 and IMX678
> > are going to be the next patch once this one passes that also has this
> > function (the two are basically stripped down versions from IMX585
> > that the driver can be adapted to easily). I intended for the upcoming
> > IMX662/IMX678 driver to use IMX585's V4L2 HCG control also.
> >
> > But given that I'm new to Linux kernel developments, or more
> > specifically, V4L2, I really don't have an idea how to do so in a way
> > the patch will be accepted.
> > Or I can make this more generic name to replace IMX585 for STARVIS2,
> > for example: V4L2_CID_STARVIS2_HIGH_CONV_GAIN
>
> We should really try to standardize V4L2 controls for HDR support in
> sensors. See https://lore.kernel.org/linux-media/20250710220544.89066-1-m=
irela.rabulea@nxp.com
> for an attempt at doing so (for some of the controls at least). Could
> you share your feedback in that mail thread ?
>

My counter argument will be that HDR controls are way too diverse
vendor to vendor and even sensor to sensor that having a sensor-series
based HDR controls would suit better.

I think it might be better to focus on how to handle multiple image
channels from one sensor because what makes this (IMX585) sensor
unique (and thus, the implementations will be somewhat unique) is the
capability to merge the image on the sensor directly and output as a
12bit compressed or 16bit linear image. Without the ability to handle
multiple MIPI virtual channels for far more common DOL-HDR or
multi-frame based HDR sensors, there isn't a lot of need to
standardize V4L2 HDR controls.

> The proposal doesn't address the sensor-side blending controls. For
> those, I recommend considering how they should be handled from
> userspace. We don't want to have per-sensor code there if we can avoid
> it, and that should drive the API design.
>

Can you recommend a way to handle the blending controls from userspace?
I will be glad to move these controls to module parameters then V4L2
controls if we don't want per-sensor code. In the worst case I'll
remove the ClearHDR functions and HCG controls for this driver so the
patches go through.

> As for what you call gradation above, that's not strictly speaking
> limited to HDR, right ? If my understanding is right, this is about
> applying a compression curve to lower the bandwidth by lowering the
> number of bits per pixel while preserving more dynamic range in the
> lower and middle parts of the pixel value range. Is that correct ? If
> so, the term "companding" is also often used for this feature. I think
> we have three needs:
>
> - Enable/disable companding (which includes configuring the bit depth of
>   the output format)
>
> - Obtaining the companding curve applied by the sensor (as the host will
>   have to apply the inverse expansion curve)
>
> - Optionally, modifying the companing curve.
>
> I'd like standard controls for those.
>

Let me describe the data flow here:

           +-----------+              +-----------+
           | High gain |              | Low  gain |
           +-----------+              +-----------+
              [12b]  |                   [12b]  |
                     v                           v
         +-----------------------------------------------+
         |              Linear merging stage          |
         |           ( DATA_SEL, DATA_BK)        |
         +-----------------------------------------------+
                                   |
                         (16bit output)
                                   |
                                   v
         +-----------------------------------------------+
         |       Gradient Compression stage      |
         |        (GRAD_TH, GRAD_COMP)      |
         +-----------------------------------------------+
                                   |
                         (12bit output)
                                   |
                                   v

So both 12 bit compressed and 16 bit linear are all based on the HDR
result and even though this is exactly the same as companding, I still
think we need sensor dependent control here.
From what I can see from the public datasheets, OX03C10 has a similar
data compression algorithm called piecewise linear (PWL), which acts
on 24bit(!) 3-frame HDR results with 32(!) curves.
On the Sony side I don't see this capability on any sensor other than IMX58=
5.

> > > Sony's website [2] states
> > > "Sony=E2=80=99s Super High Conversion Gain technology is designed to =
amplify
> > > electrical signals immediately after the conversion from photons, whe=
n
> > > the noise levels are relatively low. In this way, it reduces the
> > > overall noise after amplification. As a result, lower-noise images,
> > > compared to conventional technology, can be captured even in a
> > > low-illuminance environment. Lower noise levels in images also help t=
o
> > > enhance the accuracy in visual or AI-assisted image recognition."
> > > From that one would presume you'd always want it on (lower noise =3D
> > > good), unless needing the minimum exposure time and the image was
> > > already over-exposed.
> > > I'm guessing you have no additional information based on your descrip=
tion text.
> > >
> > >   Dave
> > >
> > > [1] Also IMX327, IMX462, and IMX662 which are in the same family,
> > > IMX678 (ratio of 2.6), and quite probably most of the Sony Starvis or
> > > Starvis 2 ranges.
> > > [2] https://www.sony-semicon.com/en/technology/security/index.html
> >
> > Yeah I think Starvis 2 series all have this capability.
> >
> > > > +
> > > > +Notes
> > > > +-----
> > > > +
> > > > +* Controls are writable while streaming; changes take effect from =
the
> > > > +  next frame.
> > > > +* HDR-specific controls are hidden when HDR is disabled.
> > > > +* Inter-control dependencies are enforced by the driver.
> > > > diff --git a/Documentation/userspace-api/media/drivers/index.rst b/=
Documentation/userspace-api/media/drivers/index.rst
> > > > index d706cb47b..87912acfb 100644
> > > > --- a/Documentation/userspace-api/media/drivers/index.rst
> > > > +++ b/Documentation/userspace-api/media/drivers/index.rst
> > > > @@ -32,6 +32,7 @@ For more details see the file COPYING in the sour=
ce distribution of Linux.
> > > >         cx2341x-uapi
> > > >         dw100
> > > >         imx-uapi
> > > > +       imx585
> > > >         max2175
> > > >         npcm-video
> > > >         omap3isp-uapi
> > > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > > index 175f5236a..42e32b6ba 100644
> > > > --- a/MAINTAINERS
> > > > +++ b/MAINTAINERS
> > > > @@ -23183,6 +23183,7 @@ M:      Will Whang <will@willwhang.com>
> > > >  L:     linux-media@vger.kernel.org
> > > >  S:     Maintained
> > > >  F:     Documentation/devicetree/bindings/media/i2c/sony,imx585.yam=
l
> > > > +F:     Documentation/userspace-api/media/drivers/imx585.rst
> > > >  F:     drivers/media/i2c/imx585.c
> > > >  F:     include/uapi/linux/imx585.h
> > > >
>
> --
> Regards,
>
> Laurent Pinchart

