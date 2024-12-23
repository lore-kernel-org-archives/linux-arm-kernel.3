Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A099DE7718B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Dec 2024 16:17:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gB7tBCInQIuUM3AQKKx7Fq1FBL6zOEzrOCuvM2+REq4=; b=tAhePbrw7vsl2DNfzy0g3wFlQ0
	O5fnb8lRASjOWLjB5Iv/72aYWQwaTNLBtKd5u0kMLwae4HaPWvaTMpBlhs8IuJ/w5M3/JnaZXSaTs
	Ctd5El79CZnKffDDOr4qyQEausw4CVew9ta5By76ihoLKYxAkJuwr4rdFUCnb9QXDgmR5OGPzDi6e
	GLD3rI4ayUVxtHk/70kyK9R+jlrWdTabdxI3yxst9BtHK5nPqJe0lAOgiKFZ6No3Eyz9om4yqCWco
	+2pVfxPS/ik3t/OV3d3P3TZEGs5MRNaxnSfOBTlFB9F+/jS1+KtkNg2OZRpZegxbPlWq7bvL+HoYs
	JAvoOB1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPl7I-0000000AMkt-1IJ6;
	Mon, 23 Dec 2024 16:17:12 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPl65-0000000AMfA-3fyF
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Dec 2024 16:15:59 +0000
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-54024aa9febso4718391e87.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Dec 2024 08:15:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1734970556; x=1735575356; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gB7tBCInQIuUM3AQKKx7Fq1FBL6zOEzrOCuvM2+REq4=;
        b=XYltXErMCT+1LubyzBC0hecvDTZzjIYtWqxtujV+CbryXaOvWdiUFDHKP1IOSBzdQc
         uakcS9avV6AerUWkZ4va60djrJnCnhHu5N4Zx8d5a9kKhJeUr1EbeLVkXVcY9m/vNjQS
         WhMqcv1ZeD6X/W44qViZoQb0wX4R2IsrwMdlQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734970556; x=1735575356;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gB7tBCInQIuUM3AQKKx7Fq1FBL6zOEzrOCuvM2+REq4=;
        b=ifnsWPHz1BZSEvGzzvuoMYjiltndvw5PiCHs5ob7wFmtBr+Gf1nuVjhTMoPW3zQzvy
         Jqzzujf45t1QpLt5nZAYKMtuGW29yJJGgl9XEepG1uRiMSs+RcHC45mpCjAnQhmJa25B
         oODu74fqhHj0kBMYsyDFMqLBPPC3OQ5GFM+mifSK/L3z3TSCBSqDGOkr57oapKqO7ZuW
         n5PSwFPAh2PZcY2Rba9PMY37RdQDAH1UC3TFz5A1Ign4XdXFWQoK1H7ofDYBNF7VIYnR
         3hNnMjeEEGWDlV/m5OUpiL4qhoTE/9UbhJMvbT25gMkz/bcs8f/Agqp8PSt5JDpq8yFY
         vdkQ==
X-Forwarded-Encrypted: i=1; AJvYcCUlrq2lqC3iJVMW0LkZwjeIsuTrb6T0Eb3uUbTVI9WTSgtVvuz6DPTNBSCqVeDjmjcd6uH5gJdw9xqJFVKpDvvm@lists.infradead.org
X-Gm-Message-State: AOJu0YyRwremlQXavls5nCoxTgr0hryz0nHxD3+u6kUpY/pxcXcjbOCD
	J7bGQK/H5xm/oB5kOH1QBfLDPJio9lsUN2MderS0Rzp5V50n5jvPKhpq67MWUjFOLKeqI+7Dd9C
	esyIhtu+W9fS1wMxH3oSGHLwfKPmt5VhBsRi8
X-Gm-Gg: ASbGnctJBj0hRoA2lzeanmZDDImm0vH2TEIymV2LcbF/ohJYvC0nssDnnmBM6hEIEMb
	vB/rKlIhJxGQ56txMlVqBnv/NCebwuIt7G4qITVl0R63QaVlE8xnh+9gPYEx0vEcl8Mda
X-Google-Smtp-Source: AGHT+IFBH1qJ5o3N2eKaN46asXp1SlHPERioAIxyZn9uGOni0fB6RlslgaSbmNkUTXINnjQKSbGfbaJdE8Qdm+6COjE=
X-Received: by 2002:a05:6512:234d:b0:540:30df:b3ea with SMTP id
 2adb3069b0e04-54229533d4emr4290450e87.15.1734970555005; Mon, 23 Dec 2024
 08:15:55 -0800 (PST)
MIME-Version: 1.0
References: <20241223100648.2166754-1-wenst@chromium.org> <481a6eec-c428-45cd-98a6-5a91f3ceb187@collabora.com>
 <CAGXv+5Fj5s9FUyaxmEkGimxjEcS6OEfm4_5Zso+YocSi+Vt4pg@mail.gmail.com>
 <bbc6aa2a-fe48-4e06-b070-fd66dbd00e15@collabora.com> <CAGXv+5FoOM=ZUCWigdCaPbc4FCBtLVX2xnUJnVnVsBH=7yoZ=Q@mail.gmail.com>
 <efb88dd0-3b66-49fe-b279-e66c4574cf9d@collabora.com>
In-Reply-To: <efb88dd0-3b66-49fe-b279-e66c4574cf9d@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 24 Dec 2024 00:15:43 +0800
Message-ID: <CAGXv+5HWcYrCzWJD4e=WP1WVNfqG5Y2_z+_oetWZq2ZKjXP75g@mail.gmail.com>
Subject: Re: [PATCH] nvmem: mtk-efuse: Enable GPU speed bin post-processing
 for MT8188
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241223_081557_936692_3DBBD255 
X-CRM114-Status: GOOD (  34.84  )
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

On Tue, Dec 24, 2024 at 12:08=E2=80=AFAM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 23/12/24 16:57, Chen-Yu Tsai ha scritto:
> > On Mon, Dec 23, 2024 at 7:43=E2=80=AFPM AngeloGioacchino Del Regno
> > <angelogioacchino.delregno@collabora.com> wrote:
> >>
> >> Il 23/12/24 12:24, Chen-Yu Tsai ha scritto:
> >>> On Mon, Dec 23, 2024 at 7:11=E2=80=AFPM AngeloGioacchino Del Regno
> >>> <angelogioacchino.delregno@collabora.com> wrote:
> >>>>
> >>>> Il 23/12/24 11:06, Chen-Yu Tsai ha scritto:
> >>>>> Like the MT8186, the MT8188 stores GPU speed binning data in its ef=
use.
> >>>>> The data needs post-processing into a format that the OPP framework=
 can
> >>>>> use.
> >>>>>
> >>>>> Add a compatible match for MT8188 efuse with post-processing enable=
d.
> >>>>>
> >>>>
> >>>> Let's just change the MT8188 compatible list to
> >>>>
> >>>> compatible =3D "mediatek,mt8188-efuse", "mediatek,mt8186-efuse";
> >>>
> >>> That would be "mediatek,mt8188-efuse", "mediatek,mt8186-efuse", "medi=
atek,efuse"
> >>> then?
> >>>
> >>
> >> No, we're dropping the generic "mediatek,efuse".
> >
> > That means we also drop it for MT8186?
> >
> > Thinking about it more, I think it's stretching things a bit. The hardw=
are
> > is clearly backwards compatible, or we wouldn't even be reading values
> > out correctly. The only difference now with MT8186 and MT8188 is that
> > they have a speed-bin field with a value that we want passed to the OPP
> > framework, and the interpretation of that value is not really part of
> > the efuse's hardware. We chose to do the conversion in the efuse driver=
,
> > but we could also have done it in the GPU driver.
> >
> > What I'm saying is that we should not need to change the compatible str=
ings
> > to make this work.
> >
>
> No we don't forcefully have to drop it from MT8186, and doing so would be=
 kind
> of hard and actually producing unnecessary breakages with (very) old kern=
els.
>
> Just add a `deprecated: true` to the binding that wants `mediatek,efuse` =
and
> start with MT8188, where 8188 is in enum and 8186 is const.
>
> We can do MT8188 because that'll still work even with old kernels (since =
MT8186
> is there since before MT8188 was introduced), and it's something to enabl=
e a new
> feature.
> This means that there's not going to be any breakage with new DT and old =
kernel.
>
> I want the mediatek,efuse binding to be like the majority of the others a=
cross
> the kernel, so, no generic compatible.

In that case shouldn't the fallback be the oldest SoC in the list?
Maybe MT8173, which is currently marked as deprecated, so we undeprecate it=
?

Certainly not the MT8186.

> Cheers,
> Angelo
>
> >
> > ChenYu
> >
> >> Cheers!
> >>
> >>> Fine by me. :D
> >>>
> >>> ChenYu
> >>>
> >>>> instead :-)
> >>>>
> >>>> Cheers,
> >>>> Angelo
> >>>>
> >>>>> Cc: <stable@vger.kernel.org>
> >>>>> Fixes: ff1df1886f43 ("dt-bindings: nvmem: mediatek: efuse: Add supp=
ort for MT8188")
> >>>>> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> >>>>> ---
> >>>>>
> >>>>> I'm not exactly sure about pointing to the dt bindings commit for t=
he
> >>>>> fixes tag.
> >>>>> ---
> >>>>>     drivers/nvmem/mtk-efuse.c | 1 +
> >>>>>     1 file changed, 1 insertion(+)
> >>>>>
> >>>>> diff --git a/drivers/nvmem/mtk-efuse.c b/drivers/nvmem/mtk-efuse.c
> >>>>> index af953e1d9230..e8409e1e7fac 100644
> >>>>> --- a/drivers/nvmem/mtk-efuse.c
> >>>>> +++ b/drivers/nvmem/mtk-efuse.c
> >>>>> @@ -112,6 +112,7 @@ static const struct mtk_efuse_pdata mtk_efuse_p=
data =3D {
> >>>>>     static const struct of_device_id mtk_efuse_of_match[] =3D {
> >>>>>         { .compatible =3D "mediatek,mt8173-efuse", .data =3D &mtk_e=
fuse_pdata },
> >>>>>         { .compatible =3D "mediatek,mt8186-efuse", .data =3D &mtk_m=
t8186_efuse_pdata },
> >>>>> +     { .compatible =3D "mediatek,mt8188-efuse", .data =3D &mtk_mt8=
186_efuse_pdata },
> >>>>>         { .compatible =3D "mediatek,efuse", .data =3D &mtk_efuse_pd=
ata },
> >>>>>         {/* sentinel */},
> >>>>>     };
> >>>>
> >>

