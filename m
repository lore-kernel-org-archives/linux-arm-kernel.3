Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A591CD5BD1
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Jun 2026 04:44:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zR1cIlAoMp5j8gAxy1mhFkkWhyjEsDYxuuZyh1K4KzI=; b=Do6vNQHlyVGF/tZ3c9YFQAL65I
	w1L7OArrybJn85PaHvoOYtV7MqMAs6uqbT4eHLsoPOLHGRs7smbR5wNtBeplV1UZmKA5Ps/BiL0A4
	+NGWZ/3glU72aSoKPrVu3CbQlVdgpbFm9LpsUyXahINGq1mAJ8t76TB7/iH9i6Q5FaMHk4XdYJ5/5
	y5lWVHOFOKd5LnWhMoCFJOJMUUqjE+ZpfyVQGFsl2HzFw5pRl6K5VfG3mBGlxt0wSU9NZaYPbD3Yo
	MPbcDR7A5z2ioL+bxLWXxxLe9uJ173cXyUBSpPip1cA6MePSl3xjh2ivb79RwVuoIH2Ndw30dj6GH
	Apjx+7Lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTuVF-0000000A83N-46cS;
	Mon, 01 Jun 2026 04:43:54 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTuVD-0000000A82t-0mgD
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Jun 2026 04:43:52 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-5aa610cbd9bso1588979e87.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 31 May 2026 21:43:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780289028; cv=none;
        d=google.com; s=arc-20240605;
        b=EDs5UscU/83ZGEcDQNgyi47tvtkEH4nMCMf8XGRVzpm6ldN4xMmIpImgyOdOG2eESE
         v0Q7281uBUYkDeMy5uond7atfI1B9S9Fsg5KcMA5KsOVRbkcaNpfypfklEL4nlePrU+6
         6nD/x6L1/9O6gJNAVl2ipisUomiaZep+PGoWRhhI14ITdJRH6KGWBP3pRQpi226r+tXN
         hTbb7s0c6soEaj2IdL0xBBDZLTAhah2MzgMoxLORbBBWJuWqHsmzTV5GpYX1TXniNMVj
         hvN0xvjL1gUefEwmqNYvo80evnsWwgpoORDBwxlXRvCD4hIeVXIkna1TRc2LAqRQKLOg
         6jqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zR1cIlAoMp5j8gAxy1mhFkkWhyjEsDYxuuZyh1K4KzI=;
        fh=L+6Q97+/eiqmAosGHqIshiv4XcyH6bWvCa6xR3QSeOs=;
        b=dvvCKCrf3V5ZuD+KyX3HXcL/VBHvHaZs3vgOsPmu38t0XZdaJEQ+LWRnQL/ED19k6M
         /Rnc73JG6ONPm9zOl/kgA83a0cor3iw/ScGQnTWKP3w7y5c1T1plqQvqb9fUjgdz3LGy
         P0wfBE5dV63I0tAI+g0isFPtkfL6HmMp1jkPGSlGRuPDd/t6Wf99ei2EIqjItbtW2Oh5
         SJ7vTcSavK0fjiZZkgnPLopYXB1yT0LlKxe5yVWKKoYysgrboaA39hbeCaO4Fw8oVHG4
         JRgKr2m7tF1nJ1hC0V8quBwarC04kghTZjVYm3TTO5UsaArQia9xPwjVH0/U5liCj41S
         +mwg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1780289028; x=1780893828; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zR1cIlAoMp5j8gAxy1mhFkkWhyjEsDYxuuZyh1K4KzI=;
        b=EMZWk3gtELf8PbD5zEQMnQW2KLJrQuYpHGi7j+q8vn6QzzCNrRWis5n6LX/wmUd0c3
         hgXuIxMLbbvRH1YN+tFOV1YQoVNuyol36GKGQZYnCVKq2JqGKm9e/L2sB0CoFb36x/i/
         mZZQZrbXg1KQ5WDn282mkKdUPGqsB8VIKnhtw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780289028; x=1780893828;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zR1cIlAoMp5j8gAxy1mhFkkWhyjEsDYxuuZyh1K4KzI=;
        b=rTOJy3cROFhunuXdtjiYahvN2/qIh5QRHBFZoesC0yuc2emikmpPaH05xxe7+Skqvd
         YBLHW9B88oOd0n5mrCbiGukpGmmnlb0NSsQxmLnuOXUhTjG++8xfKiMn3lbAldtxNCxC
         TcePyQA6z3f+JTZ9kH/fte1GGE/59GDj9h+mB18RsvYRmJ/VSSy397NmE6lSvHMcBoHF
         8vDw3sycpbm9bdgIaV0MgmNgw6ZfU8QCHikE4BvS5qqlYdTVd6ybFcelLbRW6ZG6u+Rc
         62aWBKZNzTLzE+S86MG1KFbnPXE+ip+0lXYYP0SXLFn0O4pQPLUTjfJj+JK0UUToVJ8a
         4o6w==
X-Forwarded-Encrypted: i=1; AFNElJ/18rqiP/ZfPmNnTR2KigsafD6rj3Wt8vmBoDPTgoh+sKk/qX4VDLwj9pIpUjWhnS2Qd/2wXRPngj4SKA/q8Asq@lists.infradead.org
X-Gm-Message-State: AOJu0YxA2r5kMsIU1AdQ6UlCV/7UtB7p0ReXG39ib16J5PSPam5nmXzc
	OxA5S656aWX3hjBm1k9gvdbF9z7/M5SbEknqEfmmspQPC2LLmkYOoMwtZfeDugGCpPHtCAJGRT2
	Wof19AUGGRknypbx+ROxg8vPXvCo/uPw3hc7EILoG
X-Gm-Gg: Acq92OG+ChyUyWmk6p+2sKiZH3vLVXUwv7iPfkqdFZz8W2tEUzsgois8f1tkQp6ClRl
	EAvmDnDvADuHQprMgrY/TdFmYCPS5wnKahElgTzAfGdtrCBzCgv1m6jroUAr5jbMkrt4g0lrJ0T
	BcBFZL+R5qqL05cBw0hjbTSUS92IrU1rffMHaAT2xg5KmJCRTUufxP+nrLkXrqEQZIBAt/jILhT
	Ep+bmxYNsX+pqWFjCU/InWvZCgSlCDo+ueWyyA/+FwgLe+q6hbhV+49arw/akzPHIRKWj3hcw29
	/AeRmax1CyerXwO9ELb0CnCAg+5TWTDuAsiLQeoo6nFpTuk=
X-Received: by 2002:a05:6512:128b:b0:5a4:a85:ba3b with SMTP id
 2adb3069b0e04-5aa6145b9f6mr2247218e87.19.1780289028315; Sun, 31 May 2026
 21:43:48 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20260408065112eucas1p129f600747c27e999ec3d42504bc0fd2b@eucas1p1.samsung.com>
 <20260408065055.1353444-1-wenst@chromium.org> <d568fde6-8033-45c1-a2e1-13f8112f1193@samsung.com>
In-Reply-To: <d568fde6-8033-45c1-a2e1-13f8112f1193@samsung.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 1 Jun 2026 12:43:35 +0800
X-Gm-Features: AVHnY4JEx2SIxzD-JGLqt6co1RnSApTjEWdemWCmhyaNJcHSwWHrqMwqc83JIHs
Message-ID: <CAGXv+5HvO3OjBC=u4EZeB6Aza6oSN0KWrvbQgWEnR=jskczvwg@mail.gmail.com>
Subject: Re: [PATCH] drm/exynos/fimd: fix register offset type in fimd_trigger()
To: Inki Dae <inki.dae@samsung.com>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, 
	Kyungmin Park <kyungmin.park@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org, 
	linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260531_214351_298827_6049AD2D 
X-CRM114-Status: GOOD (  20.25  )
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

On Wed, May 6, 2026 at 2:35=E2=80=AFPM Marek Szyprowski
<m.szyprowski@samsung.com> wrote:
>
> On 08.04.2026 08:50, Chen-Yu Tsai wrote:
> > Sparse reports:
> >
> >     exynos_drm_fimd.c:992:39: warning: incorrect type in initializer (d=
ifferent address spaces)
> >     exynos_drm_fimd.c:992:39:    expected void *timing_base
> >     exynos_drm_fimd.c:992:39:    got void [noderef] __iomem *
> >     exynos_drm_fimd.c:1005:33: warning: incorrect type in argument 1 (d=
ifferent address spaces)
> >     exynos_drm_fimd.c:1005:33:    expected void const volatile [noderef=
] __iomem *addr
> >     exynos_drm_fimd.c:1005:33:    got void *
> >     exynos_drm_fimd.c:1007:33: warning: incorrect type in argument 2 (d=
ifferent address spaces)
> >     exynos_drm_fimd.c:1007:33:    expected void volatile [noderef] __io=
mem *addr
> >     exynos_drm_fimd.c:1007:33:    got void *
> >
> > Add "__iomem" to *timing_base to fix its type.
> >
> > Fixes: 3854fab24e89 ("drm/exynos: fimd: support LCD I80 interface")
> > Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
>
> Acked-by: Marek Szyprowski <m.szyprowski@samsung.com>

Inki, you missed this patch as well.


ChenYu

> > ---
> > random warning I found while checking for the size_t warning.
> > ---
> >  drivers/gpu/drm/exynos/exynos_drm_fimd.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c b/drivers/gpu/drm=
/exynos/exynos_drm_fimd.c
> > index b6abdc4f2b0a..695d3515d421 100644
> > --- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
> > +++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
> > @@ -989,7 +989,7 @@ static void fimd_trigger(struct device *dev)
> >  {
> >       struct fimd_context *ctx =3D dev_get_drvdata(dev);
> >       const struct fimd_driver_data *driver_data =3D ctx->driver_data;
> > -     void *timing_base =3D ctx->regs + driver_data->timing_base;
> > +     void __iomem *timing_base =3D ctx->regs + driver_data->timing_bas=
e;
> >       u32 reg;
> >
> >        /*
>
> Best regards
> --
> Marek Szyprowski, PhD
> Samsung R&D Institute Poland
>

