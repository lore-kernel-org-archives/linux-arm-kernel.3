Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A05CE7716C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 15:38:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Cvnuwz6nzd9J+v7i/2glRxiW3BDpNySZESBXX3gw+HE=; b=nelCApYxHNteDx6yDGav4xk1z7
	ot62GveF0/K4F+XPG62bK2gi4jeoIajKY3VK7MOz3tI01w/vdkaUPjjXGMBZcDtia6L6hbrvxvV7/
	CdpbZLIQo4RBlh17zi0IToSj7nEIxxsONe2wyZ7/2UEWrO9t1qLzYlFgzn3XBt/0OogomQlQj9qm9
	lqICwIxe+XvsdW00+gQDocNC60r4TaONZ8jjzkyShO+QK5M7lF8WiCy+JNoOax02cq8bufLlkN0ZQ
	lJXFrsUDvU2BPRya8xb3MJq6STk5AQ99Zn5uflFWIjVT5pu+m3rzf7hpFRsya/Mffd/u/lAdJpIfY
	ptEKlJkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJDvw-0000000GaQs-0T6w;
	Thu, 05 Dec 2024 15:38:28 +0000
Received: from mail-yb1-xb2c.google.com ([2607:f8b0:4864:20::b2c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJDut-0000000GaAu-2AU5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Dec 2024 15:37:24 +0000
Received: by mail-yb1-xb2c.google.com with SMTP id 3f1490d57ef6-e39779a268bso1234286276.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Dec 2024 07:37:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1733413041; x=1734017841; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cvnuwz6nzd9J+v7i/2glRxiW3BDpNySZESBXX3gw+HE=;
        b=aN2l0veCLMuGE3c+Y3BEAU90uf3GiPcgIQF4rKux+Pv4S8VQp1HlfIV7BAeOYBmG6i
         Tl5yrLQItFTwF0KBLOq5/BKnIMFoc8HvU2tsW/ROSpx5mIt8KgD46iPhu/SASReq6mQr
         lHfgGmpk+3ILTVNCtAR+jiLb88JzaGUK77tEFwHNLHzx2lzydn48O5epTQwKE9eR7XSY
         Sj1uXlXxUbrYFpU5uGuI+0m9/4ARjFBXhm3AWEI1RFq+Bxjmivl+MgoH2DhW5wSa2J5a
         adnCy+GMZ8Te5yWbEc5mkVF177dotHZl9Cagt2dc/CCXbKeFL3w6AWl5WQz06k2E3pcn
         AgEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733413041; x=1734017841;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Cvnuwz6nzd9J+v7i/2glRxiW3BDpNySZESBXX3gw+HE=;
        b=KMQnBGeX133v9dEMpIVmbM6m3q1c1fL1HejlhIrncV8K7lKior2VOofzb06pv1weao
         H00X/o1ErokMSEC6zMhyQwOEvQGoGxHtw8i92/oyn1d48BFT2i3Jt8JzjsSus7M5/CxW
         XcYI0J0t46RRdUGVk3MXUrx06pEhGzFpiK13jrFwbmE3O04IWurUqmVc99oMb/iSHsJk
         ZBxo3wtGhw3NLfdmgzzp2iNOmDnm++9nOv4QlTNbUjviyJMEY4v7ZFrlJnFbnOMU6Zjb
         IN2QDfSc4azxUd1LF9ieCEjlfuEITgiRoXdRsFsYq/p23Vsnp2PyizuskXrhaKX62NgC
         D/nA==
X-Forwarded-Encrypted: i=1; AJvYcCWQrjaaH4dp2dUUyANfgnMXrUUJwqCoT6miWxvw/vYSUfSCnTM1GtSah8zzIsT/XBlsgxbyeIjL/jQxC6QJMSyz@lists.infradead.org
X-Gm-Message-State: AOJu0YxdOBXWl5dzDMZ5qo5Anoyp6CdYuIxOgDFjcBPgr/W7FvQYjmBj
	6VbiolQ/16aCCgWge7hX1BUNz48L7vViJVBqBxbkzkBMkR2fcUQ3YbtfYlz8e0GezZKhHhmq0/z
	MJ3cP7nItT7hoqKYnE3mKvfbdFM7C1bDFQhgxAA==
X-Gm-Gg: ASbGncuW9EZZqtsCMhId301k1V3FAdg/IUAM/hG6orz+loTtmLGXqzxyJtRxC+r1FZP
	tV1whCz3Q+FLZXS4PIw9hTwmNEG/Q77E=
X-Google-Smtp-Source: AGHT+IFpaAlwyFG/o3y6U8AoYyYaH4HrVsIRutKcp/sQ/k2hjoYuqd/E0RRbh99HY/5KNXQ6u6Of3iU8Fjlwm/TBpEE=
X-Received: by 2002:a05:6902:2387:b0:e38:8e02:1f15 with SMTP id
 3f1490d57ef6-e39f22ab27bmr3592909276.17.1733413041665; Thu, 05 Dec 2024
 07:37:21 -0800 (PST)
MIME-Version: 1.0
References: <20241120-media-imx290-imx462-v2-0-7e562cf191d8@raspberrypi.com>
 <20241120-media-imx290-imx462-v2-1-7e562cf191d8@raspberrypi.com> <4950196.GXAFRqVoOG@steina-w>
In-Reply-To: <4950196.GXAFRqVoOG@steina-w>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 5 Dec 2024 15:37:01 +0000
Message-ID: <CAPY8ntCeYOtBhEKCcygsT-aAHJ8rxo5qP0NdjE9DMJmHCxZzsA@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] media: i2c: imx290: Limit analogue gain according
 to module
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_073723_635737_37682469 
X-CRM114-Status: GOOD (  28.94  )
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

Hi Alexander

On Thu, 5 Dec 2024 at 15:22, Alexander Stein
<alexander.stein@ew.tq-group.com> wrote:
>
> Hi Dave,
>
> Am Mittwoch, 20. November 2024, 20:17:03 CET schrieb Dave Stevenson:
> > The imx327 only supports up to 29.4dB of analogue gain, vs
> > the imx290 going up to 30dB. Both are in 0.3dB steps.
>
> While I agree for 30dB on imx290, my (maybe outdated) Rev0.2 datasheet sa=
ys
> up to 27dB in 0.3dB steps.

For IMX327, I have revision E17Z06B93 2019/03/25.

The revision control section for Rev0.3 lists
Page 1: "Correction: Max analog gain 27dB - 29.4dB"
Page 74: "Correction: Max Gain 69dB -> 71.4dB"

The graph in "Gain Adjustment Function" (page 74) also shows values
above 27dB as being purely analogue gain. Certainly 0x62 is red for
analogue, which would be a gain of 29.4dB. The next dot is 0x64 (30dB)
and blue, so we have to trust the text for 0x63 being 29.4dB analogue
and 0.3dB digital gain.

So I'm happy that the limit is 29.4dB.

  Dave

> Despite that this change looks good.
>
> Best regards,
> Alexander
>
> > As we now have model specific config, fix this mismatch,
> > and delete the comment referencing it.
> >
> > Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > ---
> >  drivers/media/i2c/imx290.c | 12 ++++++------
> >  1 file changed, 6 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
> > index ee698c99001d..da654deb444a 100644
> > --- a/drivers/media/i2c/imx290.c
> > +++ b/drivers/media/i2c/imx290.c
> > @@ -176,6 +176,7 @@ struct imx290_model_info {
> >       enum imx290_colour_variant colour_variant;
> >       const struct cci_reg_sequence *init_regs;
> >       size_t init_regs_num;
> > +     unsigned int max_analog_gain;
> >       const char *name;
> >  };
> >
> > @@ -876,14 +877,10 @@ static int imx290_ctrl_init(struct imx290 *imx290=
)
> >        * up to 72.0dB (240) add further digital gain. Limit the range t=
o
> >        * analog gain only, support for digital gain can be added separa=
tely
> >        * if needed.
> > -      *
> > -      * The IMX327 and IMX462 are largely compatible with the IMX290, =
but
> > -      * have an analog gain range of 0.0dB to 29.4dB and 42dB of digit=
al
> > -      * gain. When support for those sensors gets added to the driver,=
 the
> > -      * gain control should be adjusted accordingly.
> >        */
> >       v4l2_ctrl_new_std(&imx290->ctrls, &imx290_ctrl_ops,
> > -                       V4L2_CID_ANALOGUE_GAIN, 0, 100, 1, 0);
> > +                       V4L2_CID_ANALOGUE_GAIN, 0,
> > +                       imx290->model->max_analog_gain, 1, 0);
> >
> >       /*
> >        * Correct range will be determined through imx290_ctrl_update se=
tting
> > @@ -1441,18 +1438,21 @@ static const struct imx290_model_info imx290_mo=
dels[] =3D {
> >               .colour_variant =3D IMX290_VARIANT_COLOUR,
> >               .init_regs =3D imx290_global_init_settings_290,
> >               .init_regs_num =3D ARRAY_SIZE(imx290_global_init_settings=
_290),
> > +             .max_analog_gain =3D 100,
> >               .name =3D "imx290",
> >       },
> >       [IMX290_MODEL_IMX290LLR] =3D {
> >               .colour_variant =3D IMX290_VARIANT_MONO,
> >               .init_regs =3D imx290_global_init_settings_290,
> >               .init_regs_num =3D ARRAY_SIZE(imx290_global_init_settings=
_290),
> > +             .max_analog_gain =3D 100,
> >               .name =3D "imx290",
> >       },
> >       [IMX290_MODEL_IMX327LQR] =3D {
> >               .colour_variant =3D IMX290_VARIANT_COLOUR,
> >               .init_regs =3D imx290_global_init_settings_327,
> >               .init_regs_num =3D ARRAY_SIZE(imx290_global_init_settings=
_327),
> > +             .max_analog_gain =3D 98,
> >               .name =3D "imx327",
> >       },
> >  };
> >
> >
>
>
> --
> TQ-Systems GmbH | M=C3=BChlstra=C3=9Fe 2, Gut Delling | 82229 Seefeld, Ge=
rmany
> Amtsgericht M=C3=BCnchen, HRB 105018
> Gesch=C3=A4ftsf=C3=BChrer: Detlef Schneider, R=C3=BCdiger Stahl, Stefan S=
chneider
> http://www.tq-group.com/
>
>

