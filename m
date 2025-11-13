Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0728CD6E6C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Nov 2025 14:34:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qv/JrdhbRZlCEd1ubK+jM9jWPBpAjvw/CP7fZPI2C48=; b=iMG6C+kkrZ5uWVVlgI7hdwQgaJ
	iTqT7r/xsiqoCKloTpygqGUYoi8AlmSDsWV/GjVh4gwR0s0i7etSZTvKedcEtmy2coAwf/q9VePNV
	MJM43XxiHdGOL7WIY5D8JEBf0LmDjGNw2c8BVWTTylM8xGR/IqQkk+WROiazGJW729CG1C5jgf8kD
	4jldrlF+RJkyuHeyBtZlFzFHiRD0BD0CLtqU1bY2ZKnyugoiwGVFfuDTD1LEWx0kHUzbDd+21ACBA
	XpY2Yk8+TI5cxrTIBi/D5E0H03eNkg5PBMDkggK8XwjKJjruLV0/zScYLQpU7I92vokroecaAhBGo
	ZGJ3Nf/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJYOh-0000000AcUx-2unA;
	Thu, 13 Nov 2025 14:34:03 +0000
Received: from mail-vs1-xe35.google.com ([2607:f8b0:4864:20::e35])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJYOf-0000000AcUR-0mfb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Nov 2025 14:34:02 +0000
Received: by mail-vs1-xe35.google.com with SMTP id ada2fe7eead31-5dbd8bb36fcso650361137.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Nov 2025 06:34:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763044440; x=1763649240; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qv/JrdhbRZlCEd1ubK+jM9jWPBpAjvw/CP7fZPI2C48=;
        b=DmxNCt/cAFd1eCqEO4YTRZVa4d6ixrjSMz6TPzl/OkEmMywAq15l7UDIi1p4BRX/aG
         A0MChC3aepDvfJ/PZvx8V40q3uAyK7zV0FYMWd/GZyy62pP4F8Swt3oO/9+saircYici
         7CYt1+iuBa5JGo6WviTlyY9MvgiU3qqFkzu6EkG6CIQH55kDqb8OD9IrYCTBS5ZGpAFg
         0mJ2FoconRmPIMrlK0Rm9OUznhWwjLd9awNxgQZGn6wFwW+lRHw9gminopPBw/WKgU7Z
         06uVJ5jS7RGdZr4PEGOFsrXJaYPvntSvsM4pABnzx6qHy+trZiR06SMzy9ZcDavGvFKl
         tt9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763044440; x=1763649240;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Qv/JrdhbRZlCEd1ubK+jM9jWPBpAjvw/CP7fZPI2C48=;
        b=YY6H7/ShoX5TQ1/Pjz9E5GXUfrV2vTylAAaU54wRgX3E7b+Ixj2fB0OZtAqO+qV6pl
         YFCF2MwbV5i2ucVOwgzNo75yRDMEuAF019TonPLmTupzNiiXpa5H+dag61f5QRTX+wkU
         hJA0XKHCdJ+J2zd9DniDou24rKt2Vfg+Ttp//qwNqUvlthFiZ9FN1q37Y/GQeag+5iMx
         jtLLA13CSxzTHdTAE0OQ//GGXRlKNzdnjXPG2sY/y8ut6dvy1EqElNOea73e+lmAP++U
         AfyyXZbTWPwVOJq4AY4BnsWM0CXSqpEuJngZPFdJARiGB5Z8xwRJKItdN1V/x4qqkwDy
         7c8Q==
X-Forwarded-Encrypted: i=1; AJvYcCXlS/JeshD3yNgswy/pQAPqz3AL38cDyCepUHjNomQTSq7kMoFPg/YDVJpAWDryuZliYTlKwwazux0bzRGlbvsG@lists.infradead.org
X-Gm-Message-State: AOJu0Yw8MafHUDuGm7NGC0dD0jj+rXxe9elURrhLnewBNxEPs9DZPOJA
	2jHPH00Ol8gPB1Ew63saG43Bb1mmW65qrPyZgXDJRDGldHCo5Ekn5iB+6lTvgyzrvVBN5l9z0TU
	Gl1HjX1e3gkpLeg9xVyy65OnWhxnXFMc=
X-Gm-Gg: ASbGnctDVc9f5nCJmGCKl9fpz6GLk38g9edKa+A3QEp49IwRgEtAQUHEZFGzoFY/0cP
	ebXKPY5h2ocALw0PBt6iGclktUoh3B+7d9Fz3cEW5QH9uQcZSf55nNGSh4W1RwbE3U5F/cADwuw
	0N0PaDge+N15b/uaCe9bDjbhIRdD8wYIVRFV4BVYlS8E/NVCd8wLIKOiBvL9FdzaUoYscmgpXpf
	0QFLPUU/9+2ARKHHlw40ut+wL5n0Tc9j1pEo2m0p2qUPmTnTXY1Y6RaJ14=
X-Google-Smtp-Source: AGHT+IFxA8P7U0p67nbntMP+AJ/1Ive98feU9XP0hJpbEsfyGiZ2cTCG1H/uw7OcCvUbNCvlNz2awdpPad36suAN8GQ=
X-Received: by 2002:a05:6102:38ce:b0:5db:1e4e:6b04 with SMTP id
 ada2fe7eead31-5dfb40e9347mr1377780137.18.1763044439813; Thu, 13 Nov 2025
 06:33:59 -0800 (PST)
MIME-Version: 1.0
References: <CGME20250929042917epcas2p2569e213500997dfa6ba43c8f361f50f7@epcas2p2.samsung.com>
 <20250929043110.3631025-1-hy_fifty.lee@samsung.com> <20250929043110.3631025-3-hy_fifty.lee@samsung.com>
 <CAAQKjZNCpK4rq6DFUtiQ2rxCeb_34Mp54quVto+9LRJMH3=ZhQ@mail.gmail.com> <000101dc5380$e33e1c10$a9ba5430$@samsung.com>
In-Reply-To: <000101dc5380$e33e1c10$a9ba5430$@samsung.com>
From: Inki Dae <daeinki@gmail.com>
Date: Thu, 13 Nov 2025 23:33:21 +0900
X-Gm-Features: AWmQ_blbp07LBsfmhZq6Hj3qdkeaTe0fO1yFd3NukemDqBNNd4mt1U2vsVx-eHg
Message-ID: <CAAQKjZM23M3hr6Xqk6_f9whWw+CQB5oyvs=JEkBQPp2H3-ocag@mail.gmail.com>
Subject: Re: [PATCH 2/3] drm/exynos: Convert to drmm_mode_config_init() and
 drop manual cleanup
To: hy_fifty.lee@samsung.com
Cc: Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_063401_238395_00EFA660 
X-CRM114-Status: GOOD (  31.22  )
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

2025=EB=85=84 11=EC=9B=94 12=EC=9D=BC (=EC=88=98) =EC=98=A4=ED=9B=84 12:03,=
 <hy_fifty.lee@samsung.com>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> > -----Original Message-----
> > From: Inki Dae <daeinki@gmail.com>
> > Sent: Monday, November 10, 2025 2:22 PM
> > To: Hoyoung Lee <hy_fifty.lee@samsung.com>
> > Cc: Seung-Woo Kim <sw0312.kim@samsung.com>; Kyungmin Park
> > <kyungmin.park@samsung.com>; David Airlie <airlied@gmail.com>; Simona
> > Vetter <simona@ffwll.ch>; Krzysztof Kozlowski <krzk@kernel.org>; Alim
> > Akhtar <alim.akhtar@samsung.com>; dri-devel@lists.freedesktop.org; linu=
x-
> > arm-kernel@lists.infradead.org; linux-samsung-soc@vger.kernel.org; linu=
x-
> > kernel@vger.kernel.org
> > Subject: Re: [PATCH 2/3] drm/exynos: Convert to drmm_mode_config_init()
> > and drop manual cleanup
> >
> > 2025=EB=85=84 9=EC=9B=94 29=EC=9D=BC (=EC=9B=94) =EC=98=A4=ED=9B=84 1:5=
4, Hoyoung Lee <hy_fifty.lee@samsung.com>=EB=8B=98=EC=9D=B4 =EC=9E=91
> > =EC=84=B1:
> > >
> > > Switch mode-config initialization to drmm_mode_config_init() so that
> > > the lifetime is tied to drm_device. Remove explicit
> > > drm_mode_config_cleanup() from error and unbind paths since cleanup i=
s
> > now managed by DRM.
> > >
> > > No functional change intended.
> > >
> > > Signed-off-by: Hoyoung Lee <hy_fifty.lee@samsung.com>
> > > ---
> > >  drivers/gpu/drm/exynos/exynos_drm_drv.c | 4 +---
> > >  1 file changed, 1 insertion(+), 3 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.c
> > > b/drivers/gpu/drm/exynos/exynos_drm_drv.c
> > > index 6cc7bf77bcac..1aea71778ab1 100644
> > > --- a/drivers/gpu/drm/exynos/exynos_drm_drv.c
> > > +++ b/drivers/gpu/drm/exynos/exynos_drm_drv.c
> > > @@ -257,7 +257,7 @@ static int exynos_drm_bind(struct device *dev)
> > >         dev_set_drvdata(dev, drm);
> > >         drm->dev_private =3D (void *)private;
> > >
> > > -       drm_mode_config_init(drm);
> > > +       drmm_mode_config_init(drm);
> > >
> > >         exynos_drm_mode_config_init(drm);
> > >
> > > @@ -297,7 +297,6 @@ static int exynos_drm_bind(struct device *dev)
> > >  err_unbind_all:
> > >         component_unbind_all(drm->dev, drm);
> > >  err_mode_config_cleanup:
> > > -       drm_mode_config_cleanup(drm);
> >
> > In the current implementation, there is a potential dereference issue
> > because the private object may be freed before to_dma_dev(dev) is calle=
d.
> > When drmm_mode_config_init() is invoked, it registers
> > drm_mode_config_cleanup() as a managed action. This means that the clea=
nup
> > function will be automatically executed later when
> > drm_dev_put() is called.
> >
> > The problem arises when drm_dev_put() is called without explicitly
> > invoking drm_mode_config_cleanup() first, as in the original code. In t=
hat
> > case, the managed cleanup is performed later, which allows
> > to_dma_dev(dev) to be called after the private object has already been
> > released.
> >
> > For reference, the following sequence may occur internally when
> > drm_mode_config_cleanup() is executed:
> > 1. drm_mode_config_cleanup() is called.
> > 2. During the cleanup of FBs, planes, CRTCs, encoders, and connectors,
> > framebuffers or GEM objects may be released.
> > 3. At this point, Exynos-specific code could invoke to_dma_dev(dev).
> >
> > Therefore, the private object must remain valid until
> > drm_mode_config_cleanup() completes.
> > It would be safer to adjust the code so that kfree(private) is performe=
d
> > after drm_dev_put(drm) to ensure the private data remains available dur=
ing
> > cleanup.
> >
> > Thanks,
> > Inki Dae
> >
> > >         exynos_drm_cleanup_dma(drm);
> > >         kfree(private);
> > >         dev_set_drvdata(dev, NULL);
> > > @@ -317,7 +316,6 @@ static void exynos_drm_unbind(struct device *dev)
> > >         drm_atomic_helper_shutdown(drm);
> > >
> > >         component_unbind_all(drm->dev, drm);
> > > -       drm_mode_config_cleanup(drm);
> >
> > Ditto.
> >
> > >         exynos_drm_cleanup_dma(drm);
> > >
> > >         kfree(drm->dev_private);
> > > --
> > > 2.34.1
> > >
> > >
>
> Hi, Inki
> Thanks for the review and for pointing out the to_dma_dev() path
>
> If I understand you correctly, fine with using DRMM, but kfree(priv) shou=
ld occur after drm_dev_put(drm)
> That would mean releasing the drm_device first and freeing dev_private af=
terwards.
> Of course, we will also need to adjust the probe() error-unwind (err_free=
) order accordingly.
> Do you anticipate any side effects from this ordering change? I=E2=80=99d=
 appreciate your thoughts.
>

Yes, that is correct. Also, changing the order of the cleanup steps
should not introduce any issues, because this simply restores the
original sequence that the code previously followed. In fact, the
current patch is, strictly speaking, altering the existing behavior I
think.

Thanks,
Inki Dae

> BRs,
> Hoyoung Lee
>
>

