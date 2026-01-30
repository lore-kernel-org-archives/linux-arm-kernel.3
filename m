Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33E04D49C64
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Jan 2026 07:06:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Uo3DwapbYo/p8IpFT3EwNhmFG0/Hf+3HnE+vfgf9grM=; b=MSatoICW0fmPwzTWF/T3bTVYh0
	9rB6FKFheeKZgUZTqvTUvFU6otVVhZ7KaCIm4u7yE9voSamNnbVQ6x8PKoIRPDwlAxTJHyoQdFWHj
	iIDzsVyBlmSjSaob3rl7gCP0c0cUyLwWtGId2j0vp3xeNy3dHdXOcSZX9A8K73ls8wUFEw58pBFh5
	FW6QYTQdcNTdR9WIf7k77TfWcJlQR3FwF+38gsiMSL5+8J5VrTfRL6Uvc9n3gSzQKluypZGWhxROz
	ldfzWZykE3A+Gxs/HKF0oj3AOL4Bxti216kpRF1BFUJFPoePuMugahK2lSkypKOz5rVgS92Uc/NcW
	jERFZ/ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vliaT-000000017UJ-0lNY;
	Fri, 30 Jan 2026 07:06:37 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vliaP-000000017Tg-3j3q
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Jan 2026 07:06:35 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2a07f8dd9cdso12372735ad.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Jan 2026 23:06:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769756792; cv=none;
        d=google.com; s=arc-20240605;
        b=UAaSa91ZOvv3A5MVZFprp5RgoEqxeUkZ1iymWfdCtZK8l8UfkXwocpDsYPweB61Xhq
         oSF/1h6WRdcp6bTYVt6/+S8rYz7o2CG1Ir7s+FQ7d5VZnN70mxkVehBMToWsjZTTpqHT
         iRkcDVaQJ2o746mW2yLBrgllvgTmO+cZ8WPdU9Dp54XOoFE0PI2KLld0FSyxqVYPHyEH
         HqpBZmUjtSuQfVjpt2BJkjWQx1B9ZPzQ5s/3ob3fTVISncRZndbd4jeRZRTD3B6dbelj
         Q1i1wPNtht1WWwnyC3Ns3oGxlIflvTIHbrDQWu6KAYXffrDDSqYQrpaqOEudHQfG+TuB
         qJ1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Uo3DwapbYo/p8IpFT3EwNhmFG0/Hf+3HnE+vfgf9grM=;
        fh=ZeSUDQpF28xizZOujUvV8A02xQyWT5x+FYmR7Ap4Teo=;
        b=ftoxGDy2lThYQcxbWv6xRtNE/FG0tx9oVE/l08OPOqQFe6n7/+/ZXssI1jJ+yFulDU
         ofnbfulSw4rR524sLJ5nMkKnkFTQA/VbGAQTJcYwMMnZ3K73kRhPQeHy26DXoQD+Uv03
         C1g/mJKYpqBjBygv6dUbtd/JN/k2U82yWKyeHkbQSDqt0W5xdO46xP3yytzeP7/bEA9i
         M6kLmQvVgN3eC0LsQUqI7LVFUSN5oYd2bddsOakJp+Lo0DQKhZApB7Ji84V76r8t48Mx
         Htqxj8rsjtQc9KSQKVJEgMiYL6JJV6pCaHLb7+UeBDXIQVGjYomqKcuazyxmqufTCWuy
         +B+w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769756792; x=1770361592; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Uo3DwapbYo/p8IpFT3EwNhmFG0/Hf+3HnE+vfgf9grM=;
        b=Dhy647atAmYVnS/PWi4q8I9qpUh12NiweCqNrHV4gdaGNdg8/0DmN7GRfbew9HNlOg
         xe38fGkwDzWVDfM47IV+0CEcQF08mTGiKYHcjvr+rKilmfwStO6ZoukfmD3en1rNKZ3D
         gT8NaUud/TaWTiDKEFWQBXAYXV8OIBtew18ezNMCqi6QOuEPBD3/Y5HOWQZtgb4LDzq8
         AY0p2xVSfd2tlRhaKjklDr2+5b+HF+ZoYWxki3zF/W/L3t2/64dAIBl5HFpd1CvL4vWf
         N0KtZM6lyiBaO2Lh9HI5X9GnUvQ0kbq+wo376gowto3o1lKIoN0EBccYRZ72UBfmx0Ky
         gkpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769756792; x=1770361592;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Uo3DwapbYo/p8IpFT3EwNhmFG0/Hf+3HnE+vfgf9grM=;
        b=GFZcfQ1Cs6J1tErRPGfMigZltws9suUNDZHDMZ5wZeAJwLceSRlZPjO6ExeB5NJh92
         fZ3FrHtKf/B/uRF2UnBMXFXP1jgOzpwr7SKykqit4cOXRkcye/+VEg1bsDcky7QgRf5Y
         7ZUTisZgyeelIj8ApoaGK7yfh9mwKDi98huKs4yVi3iiA+T5krStm1jGgs5csgNVnYsq
         Nv3rNThKTspfW7M2UzP8ia6uIjucwMWaWv+d/W5gD8mRjZP23wtuDY/0D97gJh7nmGD6
         axQTw+3Ul1iZzoyRlZhZ6tu5Nf60dwgQ/8gXzye8hK8ODrm739UTU11AN7V7Eop85iI/
         6zjQ==
X-Forwarded-Encrypted: i=1; AJvYcCUUlgJG85moMa210AK4l8eRwp93K+kEh+6IY99LKIakugfljrwYQ8RU6V3C8ZB5bsZeo+jpZG8cWlRMDrPH28bN@lists.infradead.org
X-Gm-Message-State: AOJu0Ywe939zBXsS/3RnoW+GoysADOhLqLNUAax/8indJS6xAdlw/Wh5
	IFI8oweDWNHjGp1yPl/Jg1ZHgOoQ3NQWmN7IG4H//wToL3/eFAdYN0lJ1gxdEfYh3s3dGxewYqB
	BF9BYh59A5IAxmuRm29Bion6OytaITZM=
X-Gm-Gg: AZuq6aJdoLAAc3WJqk54I/nT+xTZRGeTBMSdMcNArr7bnj1EA7o8qknqJXJRgQyO4SP
	zQbkgX2AbPvqDkmEOELn9erKTYCAXh1sOuBa3F8UuuU7drsRYRaL9qO7D2bhxgs/kvmSE40J6vO
	w1EZ/6lHgNyVQIJNRcspG015s/2sP5CJdJpvxyS0uA/vkNlL+tgvQLuz2sDEehHeQgcfETLe3+d
	UfP+qWddoo4hmNmZ477epBmuSO3XbPo7qnxrXtah/OxFz7dlj9wqV+NFyWtzQu67A9+ZSbr8d1U
	xNjuJg==
X-Received: by 2002:a17:903:a8f:b0:29e:bf76:2d91 with SMTP id
 d9443c01a7336-2a8d99285c3mr18452045ad.42.1769756792206; Thu, 29 Jan 2026
 23:06:32 -0800 (PST)
MIME-Version: 1.0
References: <20260130055508.3462700-1-shengjiu.wang@nxp.com> <cec25a41-cc6a-4b03-833e-5c7da5727e85@nxp.com>
In-Reply-To: <cec25a41-cc6a-4b03-833e-5c7da5727e85@nxp.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Fri, 30 Jan 2026 15:06:19 +0800
X-Gm-Features: AZwV_QiBIWwWZgjtPtAyNGJf1ZiVmzr03NeE_IXZ_qgHqkYVQtx8cbrwQilhH88
Message-ID: <CAA+D8AMkipi_iX=vagZMHXTNtqUqyFeVkU1Vr_wb4R82F1OHDA@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: imx: imx8mp-hdmi-pai: enable pm runtime
To: Liu Ying <victor.liu@nxp.com>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, andrzej.hajda@intel.com, 
	neil.armstrong@linaro.org, rfoss@kernel.org, 
	Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@gmail.com, 
	maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
	airlied@gmail.com, simona@ffwll.ch, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	dri-devel@lists.freedesktop.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260129_230634_742559_D8A3ED28 
X-CRM114-Status: GOOD (  34.13  )
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

On Fri, Jan 30, 2026 at 2:49=E2=80=AFPM Liu Ying <victor.liu@nxp.com> wrote=
:
>
> Hi Shengjiu,
>
> On Fri, Jan 30, 2026 at 01:55:08PM +0800, Shengjiu Wang wrote:
> > There is an audio channel shift issue with multi channel case, first ru=
n
> > the channel order is correct, but second run the channel order is shift=
ed.
>
> Nit: I'd rephrase "There is an audio channel shift issue with multi chann=
el
> case - the channel order is correct for the first run, but the channel or=
der
> is shifted for the second run.".

Ok. will update.
>
> > The recovery method is to reset the pai interface.
>
> s/pai/PAI/

Ok.

>
> Can the channel order shift issue be fully fixed instead of implementing
> a "recovery method"?  I presume that this patch implements a recovery
> mechanism.  If it can't, any chip ERRATA?

Yes, it can be fully fixed by this patch. I will remove the "recovery" for
confusion.

>
> >
> > The reset can be handled by pm runtime, so add the pm runtime function.
>
> Nit: s/pm/PM/
>
> s/add the pm runtime function/enable PM runtime/

Ok.
>
> >
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > ---
> >  drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pai.c | 15 +++++++++++++++
> >  1 file changed, 15 insertions(+)
>
> Subject prefix should be "drm/bridge: imx8mp-hdmi-pai:".
> Refer to what previous commits for i.MX bridge drivers use.

Ok.
>
> >
> > diff --git a/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pai.c b/drivers/gpu=
/drm/bridge/imx/imx8mp-hdmi-pai.c
> > index 8d13a35b206a..1afc729da9b9 100644
> > --- a/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pai.c
> > +++ b/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pai.c
> > @@ -8,6 +8,7 @@
> >  #include <linux/module.h>
> >  #include <linux/of_platform.h>
> >  #include <linux/platform_device.h>
> > +#include <linux/pm_runtime.h>
> >  #include <linux/regmap.h>
> >  #include <drm/bridge/dw_hdmi.h>
> >  #include <sound/asoundef.h>
> > @@ -33,6 +34,7 @@
> >
> >  struct imx8mp_hdmi_pai {
> >       struct regmap   *regmap;
> > +     struct device   *dev;
> >  };
> >
> >  static void imx8mp_hdmi_pai_enable(struct dw_hdmi *dw_hdmi, int channe=
l,
> > @@ -43,6 +45,9 @@ static void imx8mp_hdmi_pai_enable(struct dw_hdmi *dw=
_hdmi, int channel,
> >       struct imx8mp_hdmi_pai *hdmi_pai =3D pdata->priv_audio;
> >       int val;
> >
> > +     if (pm_runtime_get_sync(hdmi_pai->dev) < 0)
>
> Use pm_runtime_resume_and_get instead.

Ok.
>
> -8<-
>   `int pm_runtime_get_sync(struct device *dev);`
>     - increment the device's usage counter, run pm_runtime_resume(dev) an=
d
>       return its result;
>       note that it does not drop the device's usage counter on errors, so
>       consider using pm_runtime_resume_and_get() instead of it, especiall=
y
>       if its return value is checked by the caller, as this is likely to
>       result in cleaner code.
> -8<-
>
> > +             return;
> > +
> >       /* PAI set control extended */
> >       val =3D  WTMK_HIGH(3) | WTMK_LOW(3);
> >       val |=3D NUM_CH(channel);
> > @@ -85,6 +90,8 @@ static void imx8mp_hdmi_pai_disable(struct dw_hdmi *d=
w_hdmi)
> >
> >       /* Stop PAI */
> >       regmap_write(hdmi_pai->regmap, HTX_PAI_CTRL, 0);
> > +
> > +     pm_runtime_put_sync(hdmi_pai->dev);
> >  }
> >
> >  static const struct regmap_config imx8mp_hdmi_pai_regmap_config =3D {
> > @@ -101,6 +108,7 @@ static int imx8mp_hdmi_pai_bind(struct device *dev,=
 struct device *master, void
> >       struct imx8mp_hdmi_pai *hdmi_pai;
> >       struct resource *res;
> >       void __iomem *base;
> > +     int ret;
> >
> >       hdmi_pai =3D devm_kzalloc(dev, sizeof(*hdmi_pai), GFP_KERNEL);
> >       if (!hdmi_pai)
> > @@ -121,6 +129,13 @@ static int imx8mp_hdmi_pai_bind(struct device *dev=
, struct device *master, void
> >       plat_data->disable_audio =3D imx8mp_hdmi_pai_disable;
> >       plat_data->priv_audio =3D hdmi_pai;
> >
> > +     hdmi_pai->dev =3D dev;
> > +     ret =3D devm_pm_runtime_enable(dev);
> > +     if (ret < 0) {
> > +             dev_err(dev, "failed to enable pm runtime: %d\n", ret);
>
> s/pm/PM/

Ok. will update them.

best regards
Shengjiu Wang

>
> > +             return ret;
> > +     }
> > +
> >       return 0;
> >  }
> >
>
> --
> Regards,
> Liu Ying
>

