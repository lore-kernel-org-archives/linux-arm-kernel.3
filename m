Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18719CD6E55
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Jun 2026 15:01:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nwk2UuCGq5tLt9Wm80zVPiskYyAlj51G22B+3bC+jcE=; b=Z3GrxZqf+CYrbumaVUigXOY8fC
	yqD6ZHXIx/JN+3mg2HavwYKrQ6T6/gvzqakY7nEB3nnSJiadVrKQ1jchvzKsQryMrF2rvuWCbhocj
	Jq2LzE7lLIG4H4BManttB556GvNt8L6wYGu/lXeihInfSUqKOncRfkbbOiAz7xXIXItklPNJW79TZ
	LRSCsWZHNMUT/AlCh40UrY4GDa5Mg8IGFTISkO123kaPMdu0FwBUVAZGUxbENDE4cVsquKiwOeK3G
	UqalgX5+m8QV0fnhaX2n15XBL0ciRhjfmiWqVfynafGcV2xl9XvGWKjtqroIYWk4bxmc5WBBCbs3M
	WJHUBj5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU48q-0000000BKz2-1d7G;
	Mon, 01 Jun 2026 15:01:24 +0000
Received: from mail-ua1-x935.google.com ([2607:f8b0:4864:20::935])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU48n-0000000BKxw-1jzf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Jun 2026 15:01:22 +0000
Received: by mail-ua1-x935.google.com with SMTP id a1e0cc1a2514c-963b09d5b91so2378098241.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Jun 2026 08:01:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780326079; cv=none;
        d=google.com; s=arc-20240605;
        b=HNSSMLR/r7T/vSAASG+Jc2OUfXuTsCK7SqC7HjXn4df/HACgJ9pgxZ37fLChcQnI61
         04YANLArAkXoLiab0pDBpqEne0fccRZEYEY4KCQYQfeSC7187zzCo+AxgmMGWldqZ+JB
         5Zcl03zLOMUZAUqWMa/t/2+AAg0cC3lj/2EHmbVJMksbgze0e0Z+/LJyC80SWQ5j+d8f
         xnOKVNqMkPs41K0sgHAAqhNzB0gmHxWjN5mqOM9sueRfnXmWhFgwa0NHrY4I2mZosdGQ
         Iv6TI67tAH4HS+npZw8WtS5o3I8vawGYxfq4f5PxErQPKljBa/EAUBlTNO2Fke4h6upg
         jrng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nwk2UuCGq5tLt9Wm80zVPiskYyAlj51G22B+3bC+jcE=;
        fh=zdLF8qL/ujMfVPc0h/k8xZGZNnSsNb562CQDBh4fsyM=;
        b=cuB1mQyOJ0TJhOYP+qZwd7xz7WBrjlW8d/C0oVV5VHWnHwfsBmQRR/Hx+KlYJYlEyt
         DwKS6fj/ZfB8q6xrtlMuhOXhFHRh6GkYjlntgOnvd/YweHEQ22jR2vXlNHB3yM9fchCO
         wd+OXmIZxQptPO2rgUvWoLwDhAKZ8joSqzraMfxvlZSJj63qXgKVcyJZQCuCCBw+z4Lj
         lDQjNKtT3wapUin1auGShmQgcRk8ywRDk42wtKqzxqEVWDOPDgieEFpL9iAIM/ylx2Vb
         +/KD6fiXhezuI0LeDbpvtjupP6VTwxc8iEfCFgq9PTalRI5oxDokXc/qAv2urd6iHLWH
         G/8Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780326079; x=1780930879; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nwk2UuCGq5tLt9Wm80zVPiskYyAlj51G22B+3bC+jcE=;
        b=Gbm2RTDIbZHzhnckI6Q+4ALUvrbkn6vfNS6sM/V9uzL2MfJ5sHqL/Tqcdv+tztkAP6
         QLq+IaEs9dI9ZY35wA5ll3KaZDlALMfQnXRqinjYNmK8dncnEBckj13whPxi6NUbAYmI
         MVhOaHzduqp3fSpwOGm3KwLZLtSRz/Tw+acmNkmhOM+NWFMKaJsWaL6v6qye+h2CVY9N
         Q8Mve6HbmQvpyXdT6mW3JDrA8Lwya+UhiFCSaGDVta70Ephy9YMZvqZddU7m9LqTEtL7
         JSmSNNeBh0amFnbBDQlzlRiSv/qJQZdt9WoxZcn45LLLptTAG+KNPx8PSPXgUunMLMxe
         7YbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780326079; x=1780930879;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nwk2UuCGq5tLt9Wm80zVPiskYyAlj51G22B+3bC+jcE=;
        b=cICOYbq6L0MwdJUwTovCh1WqLI70NLhFlUprWGXwuffdC5yXfIMhL+zPuHfeC9tEED
         lztSg5w4Qi3lreCw7S+exh9kUkUsvd6/SrG0GDjtR5N3W7bQF0/Qg1GfDX4LoVBfvRaP
         0ulZSwAtVAPTXybQVM+UC0mfeEnDxmC6d7uDTzYdyqWXNqKE1QLe/JLzflmRzNXY/fbn
         1+xcrBb6K5AB+iWiwfuOjjKOI+y35I8ovZPfqfCAVYPkpM4pwBZSp+2sr3bSXQA8p0Nu
         ZHMKxNlsXkcf53VHyF68IJpzijbmbS3SU4neQtFIp6BnJkzKxJAxqgEyVwIl5ukXHOs5
         Xe+g==
X-Forwarded-Encrypted: i=1; AFNElJ/MjRTGCBu7yoLoKPqET7cq/mD5CHYkKuG8AnpfmgcPrRLSpqe3JdSvVydOI/+d6+RTSU8MtyxePsfh05Jtn4mG@lists.infradead.org
X-Gm-Message-State: AOJu0YwChBRk7hvl1bAC+bHeifU5OpXyqyzJKOnvXxNAkBfvlxRuU69n
	xpGYGVBgSSqvkh7SNT7wXhcx/P1Q1JblkcL5Wtopvvq4FSKFwXbkoyBPBObf8MHZrTMKmFx0uLD
	n5yDmwTUYwkkqRPa0/R8W1Nu2yoihjXM=
X-Gm-Gg: Acq92OE+rUMq2nomQmNzDw5DwCy13NIzNetwDiYEau08jZZlWbqo3j8Uoe7/XNnRMUH
	4wt4P9ywmWkalnS4PjDPO+3ACFaEM0r0fckn/xbhdsL0HgvoCppcozad4VgYtf0gpowwEweFF8x
	L4ppuV3DgroX3KHyywNvlJo/zzny6HX/FO1tFbcQRSUWpYnNJ0ozx2WVXA6hsf1I1v1PgN3feUv
	y13Ep9npjsIb74g0dlmJW0PvQPanmEBv6pO9nT34TOC7SYfNDEgNT2+UTXKG3C75HfxM4z7fGf2
	vwMBradv7WwealDQLER4pH/EJSxD1hCrPCEoxB863IQhiWYU
X-Received: by 2002:a05:6102:4414:b0:634:420a:ab25 with SMTP id
 ada2fe7eead31-6c635d16c95mr3802351137.9.1780326077816; Mon, 01 Jun 2026
 08:01:17 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20260408065112eucas1p129f600747c27e999ec3d42504bc0fd2b@eucas1p1.samsung.com>
 <20260408065055.1353444-1-wenst@chromium.org> <d568fde6-8033-45c1-a2e1-13f8112f1193@samsung.com>
 <CAGXv+5HvO3OjBC=u4EZeB6Aza6oSN0KWrvbQgWEnR=jskczvwg@mail.gmail.com>
In-Reply-To: <CAGXv+5HvO3OjBC=u4EZeB6Aza6oSN0KWrvbQgWEnR=jskczvwg@mail.gmail.com>
From: Inki Dae <daeinki@gmail.com>
Date: Tue, 2 Jun 2026 00:00:40 +0900
X-Gm-Features: AVHnY4LiVQgchAwT0M1vmeLVdX-XKywtGIR-vtqCkEB-jmXjcHGzghOfOtlMMIE
Message-ID: <CAAQKjZPgDMvdn8R2dbX10KNQam_PMsm6_FES0WLhx_7pKY4Jdg@mail.gmail.com>
Subject: Re: [PATCH] drm/exynos/fimd: fix register offset type in fimd_trigger()
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, 
	Kyungmin Park <kyungmin.park@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, DRI mailing list <dri-devel@lists.freedesktop.org>, 
	linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_080121_469611_EDDA8F18 
X-CRM114-Status: GOOD (  21.54  )
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

2026=EB=85=84 6=EC=9B=94 1=EC=9D=BC (=EC=9B=94) =EC=98=A4=ED=9B=84 1:44, Ch=
en-Yu Tsai <wenst@chromium.org>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> On Wed, May 6, 2026 at 2:35=E2=80=AFPM Marek Szyprowski
> <m.szyprowski@samsung.com> wrote:
> >
> > On 08.04.2026 08:50, Chen-Yu Tsai wrote:
> > > Sparse reports:
> > >
> > >     exynos_drm_fimd.c:992:39: warning: incorrect type in initializer =
(different address spaces)
> > >     exynos_drm_fimd.c:992:39:    expected void *timing_base
> > >     exynos_drm_fimd.c:992:39:    got void [noderef] __iomem *
> > >     exynos_drm_fimd.c:1005:33: warning: incorrect type in argument 1 =
(different address spaces)
> > >     exynos_drm_fimd.c:1005:33:    expected void const volatile [noder=
ef] __iomem *addr
> > >     exynos_drm_fimd.c:1005:33:    got void *
> > >     exynos_drm_fimd.c:1007:33: warning: incorrect type in argument 2 =
(different address spaces)
> > >     exynos_drm_fimd.c:1007:33:    expected void volatile [noderef] __=
iomem *addr
> > >     exynos_drm_fimd.c:1007:33:    got void *
> > >
> > > Add "__iomem" to *timing_base to fix its type.
> > >
> > > Fixes: 3854fab24e89 ("drm/exynos: fimd: support LCD I80 interface")
> > > Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> >
> > Acked-by: Marek Szyprowski <m.szyprowski@samsung.com>
>
> Inki, you missed this patch as well.

Thanks for letting me know. I will pick it up.

Thanks,
Inki Dae

>
>
> ChenYu
>
> > > ---
> > > random warning I found while checking for the size_t warning.
> > > ---
> > >  drivers/gpu/drm/exynos/exynos_drm_fimd.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c b/drivers/gpu/d=
rm/exynos/exynos_drm_fimd.c
> > > index b6abdc4f2b0a..695d3515d421 100644
> > > --- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
> > > +++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
> > > @@ -989,7 +989,7 @@ static void fimd_trigger(struct device *dev)
> > >  {
> > >       struct fimd_context *ctx =3D dev_get_drvdata(dev);
> > >       const struct fimd_driver_data *driver_data =3D ctx->driver_data=
;
> > > -     void *timing_base =3D ctx->regs + driver_data->timing_base;
> > > +     void __iomem *timing_base =3D ctx->regs + driver_data->timing_b=
ase;
> > >       u32 reg;
> > >
> > >        /*
> >
> > Best regards
> > --
> > Marek Szyprowski, PhD
> > Samsung R&D Institute Poland
> >
>

