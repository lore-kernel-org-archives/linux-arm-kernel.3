Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC26BCD8C8C
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  7 Jun 2026 12:52:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j9h3BEv4ybPahVYDpfjJtvwrAcdt2dlCFy6zwAbCCRw=; b=TvqlwvxCepnhQp23j21G2oOgRr
	u/o8P37B2DyZdv3RSfqDwsV/2Aef1rkKiqrASjAcbN2SVQ6eGd1Fuz3lV9ndSLzdBS2qnGIAyuIHz
	ypnSn4wrPr6ekuiIG9R4auZgPcV0Eu0FTJrJnECl6nod/QSPJwFqWUVq0a6VaWrYzg3/fTtJGoB0Y
	npeJURx4SldITpS0HZyQHJPgHBqTjDec7YXc6LLaFJhbMtndP3dneseb8yY9DOgscKdkgUats8pwf
	JlatYSyPe0B86CKppTOTdh2dsoD6dYHuKxymNeBqwu+CBhyS1letscLTh2f3ILNuSqGizj6wc1IHT
	e8VtxVNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWC8K-00000002E9F-1s0T;
	Sun, 07 Jun 2026 11:57:40 +0000
Received: from mail-oo1-xc29.google.com ([2607:f8b0:4864:20::c29])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWC8H-00000002E87-2J0t
	for linux-arm-kernel@lists.infradead.org;
	Sun, 07 Jun 2026 11:57:39 +0000
Received: by mail-oo1-xc29.google.com with SMTP id 006d021491bc7-69e59978deeso1280828eaf.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 07 Jun 2026 04:57:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780833456; cv=none;
        d=google.com; s=arc-20240605;
        b=LOENbSA4okaCJmdYkXJwiBB6Hc9k9asIstpTFhDNTKZlElFgxGTqlYggjDQ3jSinf4
         f7oM6jNciPsME9BNEETUbf1jv9dBrRC53I2PCxGVD151ULv5wWZQ7Pic+QyZxqp7Besa
         /fH+njuUURjoVkBw+yAbnZe93TS9fMMCzFG3Fjt4no2kESX9PoV2HIEPzKrqXISaY0ZO
         CG8vTsWPGEnlK8BKJO41uQxsivEdhNFxJVY9agatkwuN0tV/XpsD6aEQsvIMa3Vnj3N2
         wfUoPGzUFZflHCV+0veLgBs3MPn5E484h37jJ+vRnjr1PJg0UOc7PolBOiR62AMytRps
         yr2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=j9h3BEv4ybPahVYDpfjJtvwrAcdt2dlCFy6zwAbCCRw=;
        fh=Cy0LQ4AEUqeVdWqjLPn8RDvrg3Tt+T/qpcmDc8VqNzc=;
        b=Ksmmp1/xDcFqFtWgtYTENaisy7ESu7gldRJ0aQmfRrvUGipQJzheXL0GizzFvVs7fd
         /fbrOCgeruylU8lkhrKVYuOzYqdCWuRPG+6yI18zzQnReCus2ETa+FHVYKSm5BVgWUdd
         dxG8TKo5IH8mcPFPMtFsapmIuf1dNh9cvSoX19a36aiTCBQs83uBrsp+ZKjWtJFcYa51
         SDjyqUL9M+9IHd+anZ2nMdLCsRVdFGaH6mngq2oNTY4ngtYbKldMrJs8eEstuBr5zJTM
         dnXzCVIm756MsFUGuhVs+QALnOUI3qc4RtJU7JFwY8x8PWyWKAS4O2VwxK/Ykk7zvASm
         4tTQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780833456; x=1781438256; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j9h3BEv4ybPahVYDpfjJtvwrAcdt2dlCFy6zwAbCCRw=;
        b=K+WAYoTJ1NzwyOnoA7+UqoPhIn2xJi77qkfiHkkhyPfjvxAhwVX6guq8Nz2ZblFo7m
         GVqa/YvGVtZBiCplMLFOO1z5jqHjH2LkhtMWpTX7MsahzSO5jH9bZPjnC/uwraNDyybW
         sTANotNSuGz0LpVr1rZ4ek4UaryTv4fTMZvx9Wn9JetM6JBc2DAH9J2p8X+AdzN+SJ6J
         r+AEFWNuOLvOPELzHhqHGdzXYOABMa/0iVgL02DR1c5WCKZ+0OmIvGuV2RMHchE2iUvR
         j8ascfNKWHADfGEkcPYaB94Zk2QADLAt53wQ/LNIbO7Hy6NEUakgtMXY7fu/RQzq6ymL
         aW6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780833456; x=1781438256;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=j9h3BEv4ybPahVYDpfjJtvwrAcdt2dlCFy6zwAbCCRw=;
        b=YHN+Gjks0u+YisS7iXwUFUUnvqRHeWxYV0h/zsCa0Ih+R+ix8JdBFtnuqG9i0R30Z8
         U2uUnX9CX0JuUPWVBtEXSgLH2x9Wvl2bdlpltAlsdmCybgK7PihirNfzVKsRrN4jiF2+
         GPxH67HbfV4iM50gaNwiQvjKcmIym5uTs3bEOTOjeOiaF9cIuHkXbFGn4wd8zQmarnQA
         BjgmOo8Fj1PGZuzBI81n/ZBQAbhXzDEyQeON2WkSlfFU6XL0oS0N9WROKy/lAtw2Q4nz
         cRkePemtnuiUwuqMHhBA0SWpBIBQewPIaCuoMUIk3Ys+4dr4QMV+oqkUFZbAvNvqK+rh
         aZPw==
X-Forwarded-Encrypted: i=1; AFNElJ866lMUY7jzFXJh94cp635f41J27ZwgjBuNss5xAtI1rBrLdwE7UkBrWqMpP8zjjcaGAWETZDH+PJXkgEvr7nF3@lists.infradead.org
X-Gm-Message-State: AOJu0YzDW6lFziDQcconezPaTmMrGCHnn4UUhj21oFCO+i05lbr9rSNI
	0xZMmElQdFSXMJYWilxdB9JiuxIP4mQwJwSiKWA1x+fWWCj7Z2h9FAtxKJGbR2gVU0cqUaJ8J1a
	GTz8m8Wuo+DRy91yL1XU+ZQAQFK+n3oQq01hWxCE=
X-Gm-Gg: Acq92OFtLpS56lBBdhv2u8UnKHUzvlTIOXfqHwYj/HYdcftW3xMu8+xbqteZq9j60t2
	Mr0L+FXmPbtvbbb9gzr8KWh95NNrUiDsFxt07nwa4vO0yCF0H60VidFt/1Iai5H0dDyz5lnuCiC
	yMjeu7NU8Pa9lE13cyu4PrxYgNSxMOi1fVhpwcWiXr+1lZVHyWdJTiCM9YypGa1dV97A5G5fpiX
	1vlgqRZsI8PEdhVq2gBhxcTfaOeYUbZclCFzfYvyhP26Zm5b6JzGOGda9ffubbqDROnrHjS6jgq
	IrF/gBltBegAbZsXjaU=
X-Received: by 2002:a05:6820:4b10:b0:69e:3e2a:a83f with SMTP id
 006d021491bc7-69e68b1b89dmr5965848eaf.9.1780833455855; Sun, 07 Jun 2026
 04:57:35 -0700 (PDT)
MIME-Version: 1.0
References: <20260604123224.192543-2-diogompaissilva@gmail.com> <5277524.h16uAIiOU7@phil>
In-Reply-To: <5277524.h16uAIiOU7@phil>
From: Diogo Silva <diogompaissilva@gmail.com>
Date: Sun, 7 Jun 2026 13:57:24 +0200
X-Gm-Features: AVVi8CeS1DNJb0AdX_LRZZVsQf_W_fU1VPXBidKJmKeVdQ9Na8oOOSQePlAqJH8
Message-ID: <CAJpoHp41+mLPWsu0EpCHkNz_z3=+tGqfh0cDKEaCWxwoYOm_Jw@mail.gmail.com>
Subject: Re: [PATCH] drm/rockchip: dsi: Open-code drm_simple_encoder_init()
To: Heiko Stuebner <heiko@sntech.de>
Cc: Sandy Huang <hjc@rock-chips.com>, Andy Yan <andy.yan@rock-chips.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260607_045737_601711_74B404D1 
X-CRM114-Status: GOOD (  27.71  )
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

Hey Heiko,

> this description is missing a rationale.
>
> Looking at the drm git history, I guess here you could add a second
> paragraph, with something like:
>
> ----------- 8< -----------
> The helpers have been deprecated for years as they only add an an
> intermediate layer between atomic modesetting and the DRM driver.
> ----------- 8< -----------
>
> Shamelessly stolen from the Todo item ;-)

True. I will add the rationale then.

> Any reason for only changing the DSI driver?
>
> Looking at [0] a number of the Rockchip drivers use the same pattern:
> - drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
> - drivers/gpu/drm/rockchip/cdn-dp-core.c
> - drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
> - drivers/gpu/drm/rockchip/dw-mipi-dsi2-rockchip.c
> - drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
> - drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
> - drivers/gpu/drm/rockchip/rk3066_hdmi.c
> - drivers/gpu/drm/rockchip/rockchip_lvds.c
> - drivers/gpu/drm/rockchip/rockchip_rgb.c
>
> You can just do all Rockchip ones - even in one patch I think :-) .

Yes, indeed. I wanted to send a tiny patch to check if all my
configurations were ok, but since it looks like they are, I will add the
other rockchip drivers that have the deprecated functions.

Thanks,
Diogo

On Sun, 7 Jun 2026 at 12:59, Heiko Stuebner <heiko@sntech.de> wrote:
>
> Hi Diego,
>
> Am Donnerstag, 4. Juni 2026, 14:32:25 Mitteleurop=C3=A4ische Sommerzeit s=
chrieb Diogo Silva:
> > Remove the dependency on drm_simple_kms_helper by open-coding the
> > drm_simple_encoder_init call.
>
> this description is missing a rationale.
>
> Looking at the drm git history, I guess here you could add a second
> paragraph, with something like:
>
> ----------- 8< -----------
> The helpers have been deprecated for years as they only add an an
> intermediate layer between atomic modesetting and the DRM driver.
> ----------- 8< -----------
>
> Shamelessly stolen from the Todo item ;-)
>
>
> > Signed-off-by: Diogo Silva <diogompaissilva@gmail.com>
> > ---
> >  drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c | 9 +++++++--
>
> Any reason for only changing the DSI driver?
>
> Looking at [0] a number of the Rockchip drivers use the same pattern:
> - drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
> - drivers/gpu/drm/rockchip/cdn-dp-core.c
> - drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
> - drivers/gpu/drm/rockchip/dw-mipi-dsi2-rockchip.c
> - drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
> - drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
> - drivers/gpu/drm/rockchip/rk3066_hdmi.c
> - drivers/gpu/drm/rockchip/rockchip_lvds.c
> - drivers/gpu/drm/rockchip/rockchip_rgb.c
>
> You can just do all Rockchip ones - even in one patch I think :-) .
>
>
> Thanks
> Heiko
>
> [0] https://elixir.bootlin.com/linux/v7.1-rc6/A/ident/drm_simple_encoder_=
init
>
>
> >  1 file changed, 7 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c b/drivers/=
gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
> > index 3547d91b25d3..a09b382d208e 100644
> > --- a/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
> > +++ b/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
> > @@ -25,7 +25,6 @@
> >  #include <drm/drm_mipi_dsi.h>
> >  #include <drm/drm_of.h>
> >  #include <drm/drm_print.h>
> > -#include <drm/drm_simple_kms_helper.h>
> >
> >  #include "rockchip_drm_drv.h"
> >
> > @@ -825,6 +824,10 @@ static void dw_mipi_dsi_encoder_enable(struct drm_=
encoder *encoder)
> >       clk_disable_unprepare(dsi->grf_clk);
> >  }
> >
> > +static const struct drm_encoder_funcs dw_mipi_dsi_encoder_funcs =3D {
> > +     .destroy =3D drm_encoder_cleanup,
> > +};
> > +
> >  static const struct drm_encoder_helper_funcs
> >  dw_mipi_dsi_encoder_helper_funcs =3D {
> >       .atomic_check =3D dw_mipi_dsi_encoder_atomic_check,
> > @@ -840,7 +843,9 @@ static int rockchip_dsi_drm_create_encoder(struct d=
w_mipi_dsi_rockchip *dsi,
> >       encoder->possible_crtcs =3D drm_of_find_possible_crtcs(drm_dev,
> >                                                            dsi->dev->of=
_node);
> >
> > -     ret =3D drm_simple_encoder_init(drm_dev, encoder, DRM_MODE_ENCODE=
R_DSI);
> > +     ret =3D drm_encoder_init(drm_dev, encoder,
> > +                             &dw_mipi_dsi_encoder_funcs,
> > +                             DRM_MODE_ENCODER_DSI, NULL);
> >       if (ret) {
> >               DRM_ERROR("Failed to initialize encoder with drm\n");
> >               return ret;
> >
>
>
>
>

