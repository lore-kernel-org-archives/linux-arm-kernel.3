Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E40EAE7718B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Dec 2024 15:58:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kHNh6xaotAcDhMoavkjLsKkfYgn6RRMW6uLTCVB7138=; b=Cvm2IQylo3BamdIni83B3VqUcS
	qhTqXU/ohjyGTOzcTwmMRcp+K3TPq+59QGDuJF8PPrXRkhUkcBKgto8MnD04/QnaMySQp9xmHI8Uk
	eRh8fT2zsKuRpOJFPnxROMrfeDJPVYb/Z5l023IZ/O+vpJX6/yOwRAO2zf0fkMkkIoyHWgv78mw/M
	dniGV8yEwDOeZzfI5ZTbWUDEMyav2j7Ec/4zkGsyBUgsvZSyB48nfSh/RUtgXLqyQNsdPUuHowUJI
	lfq1Luz5WljCN/SUWeKGY4MOp1xVfGSG5mWGQ0d82ZEReq8SIUIvFdhOIS8Wony1QSn/xrYZkPNHq
	MH/puBbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPkpJ-0000000AKB0-4BJK;
	Mon, 23 Dec 2024 15:58:38 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPko8-0000000AK5D-03sN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Dec 2024 15:57:25 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-53e389d8dc7so4559015e87.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Dec 2024 07:57:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1734969442; x=1735574242; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kHNh6xaotAcDhMoavkjLsKkfYgn6RRMW6uLTCVB7138=;
        b=mVtMx8v2bemdLFYtsEvWWkm2ieBnAy7Tqp+qDdxMIASOsvQ7XSU5BXgVRzfIDD/h/y
         Iwn+OOTno+GTgb1zJ45UgUfWmJ6V0PBtB4qy3W84pGC24fCgxis8Q2x0hWXyz4nhk/5M
         y8/gUxjoR7u15kTnhBvOzkHatiToigRC/FuGo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734969442; x=1735574242;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kHNh6xaotAcDhMoavkjLsKkfYgn6RRMW6uLTCVB7138=;
        b=LjlU0R2/iCY7CZEJu9WQ0tzpSSHB13tCb9KksFB/dqYMZ8aO5ooDrFcVCdW373Zk7i
         rOBYftz/GAJrTU0+ZpK8pPxph3uHl0WkzdmU8bpVz8hmuW7+vEYs5O6rMrZc/L5vbz4e
         /EAJJWAhKRwMXQG/+26G6GNzkOppnDLv3gxXOffRjHVKbMK5lm9v1Vef+ZTpFY5e/MNE
         N0rd6ix59AMQ8IuvTdhoeuPUL2CIsnUQ6oPhlBezsHtEEPE8onOKsb6trS25YIBIyVVL
         8VEqVLscW48FarXfS/1O6QSgIZGqqHWTxXtTiKFsuC7zlhUw9ZCV2VpRuC0sh5mAs65w
         VxvQ==
X-Forwarded-Encrypted: i=1; AJvYcCWyMHp9gPeNr5xMma4CjNvw6wAW0agF6yp6QfEJQhbgoun+deDz26n8PCy6ApJFr2xipzBEOnWHI9mo1WZeG+CA@lists.infradead.org
X-Gm-Message-State: AOJu0YzRkpbdXQdjWKXBN0z65MnFhGAfRR6Nl2VhmJn5mkMHQy6AMrpu
	aNIqxj7ysH389tXVvALjOnqxZg6U6ld6fWIFMoOhSvpSG3FvMX0vXZWBOaAf7gNJA+GCxVjH018
	KqpPh2M0b+U/dE2YCB++NsqCUtVMSnH5Y+/WLuwt94dGLfTI=
X-Gm-Gg: ASbGncvleqvh2YHRFfaocU3JRKdmFzX8LvM5gim+ahKB6mmUAQedeGyKf9d+980eQvu
	9i+u08HKFJy0ksjewmRBI9setKC5xaYxvigQ7k+BGhSPBzP0yQWi8zZQeREpBoNRyHmil
X-Google-Smtp-Source: AGHT+IHTk73CF3J9qpxOzp/CqtNyBOpJFRPOv7NC03ghiS4H+MWUanEiEeuA9ExDqorhspKiS3iAgAIzB0xD0pfy6TY=
X-Received: by 2002:a05:6512:33cd:b0:540:358d:d9b7 with SMTP id
 2adb3069b0e04-5422957ac6cmr4243801e87.52.1734969442045; Mon, 23 Dec 2024
 07:57:22 -0800 (PST)
MIME-Version: 1.0
References: <20241223100648.2166754-1-wenst@chromium.org> <481a6eec-c428-45cd-98a6-5a91f3ceb187@collabora.com>
 <CAGXv+5Fj5s9FUyaxmEkGimxjEcS6OEfm4_5Zso+YocSi+Vt4pg@mail.gmail.com> <bbc6aa2a-fe48-4e06-b070-fd66dbd00e15@collabora.com>
In-Reply-To: <bbc6aa2a-fe48-4e06-b070-fd66dbd00e15@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 23 Dec 2024 23:57:10 +0800
Message-ID: <CAGXv+5FoOM=ZUCWigdCaPbc4FCBtLVX2xnUJnVnVsBH=7yoZ=Q@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20241223_075724_083926_1CD227FC 
X-CRM114-Status: GOOD (  23.17  )
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

On Mon, Dec 23, 2024 at 7:43=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 23/12/24 12:24, Chen-Yu Tsai ha scritto:
> > On Mon, Dec 23, 2024 at 7:11=E2=80=AFPM AngeloGioacchino Del Regno
> > <angelogioacchino.delregno@collabora.com> wrote:
> >>
> >> Il 23/12/24 11:06, Chen-Yu Tsai ha scritto:
> >>> Like the MT8186, the MT8188 stores GPU speed binning data in its efus=
e.
> >>> The data needs post-processing into a format that the OPP framework c=
an
> >>> use.
> >>>
> >>> Add a compatible match for MT8188 efuse with post-processing enabled.
> >>>
> >>
> >> Let's just change the MT8188 compatible list to
> >>
> >> compatible =3D "mediatek,mt8188-efuse", "mediatek,mt8186-efuse";
> >
> > That would be "mediatek,mt8188-efuse", "mediatek,mt8186-efuse", "mediat=
ek,efuse"
> > then?
> >
>
> No, we're dropping the generic "mediatek,efuse".

That means we also drop it for MT8186?

Thinking about it more, I think it's stretching things a bit. The hardware
is clearly backwards compatible, or we wouldn't even be reading values
out correctly. The only difference now with MT8186 and MT8188 is that
they have a speed-bin field with a value that we want passed to the OPP
framework, and the interpretation of that value is not really part of
the efuse's hardware. We chose to do the conversion in the efuse driver,
but we could also have done it in the GPU driver.

What I'm saying is that we should not need to change the compatible strings
to make this work.


ChenYu

> Cheers!
>
> > Fine by me. :D
> >
> > ChenYu
> >
> >> instead :-)
> >>
> >> Cheers,
> >> Angelo
> >>
> >>> Cc: <stable@vger.kernel.org>
> >>> Fixes: ff1df1886f43 ("dt-bindings: nvmem: mediatek: efuse: Add suppor=
t for MT8188")
> >>> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> >>> ---
> >>>
> >>> I'm not exactly sure about pointing to the dt bindings commit for the
> >>> fixes tag.
> >>> ---
> >>>    drivers/nvmem/mtk-efuse.c | 1 +
> >>>    1 file changed, 1 insertion(+)
> >>>
> >>> diff --git a/drivers/nvmem/mtk-efuse.c b/drivers/nvmem/mtk-efuse.c
> >>> index af953e1d9230..e8409e1e7fac 100644
> >>> --- a/drivers/nvmem/mtk-efuse.c
> >>> +++ b/drivers/nvmem/mtk-efuse.c
> >>> @@ -112,6 +112,7 @@ static const struct mtk_efuse_pdata mtk_efuse_pda=
ta =3D {
> >>>    static const struct of_device_id mtk_efuse_of_match[] =3D {
> >>>        { .compatible =3D "mediatek,mt8173-efuse", .data =3D &mtk_efus=
e_pdata },
> >>>        { .compatible =3D "mediatek,mt8186-efuse", .data =3D &mtk_mt81=
86_efuse_pdata },
> >>> +     { .compatible =3D "mediatek,mt8188-efuse", .data =3D &mtk_mt818=
6_efuse_pdata },
> >>>        { .compatible =3D "mediatek,efuse", .data =3D &mtk_efuse_pdata=
 },
> >>>        {/* sentinel */},
> >>>    };
> >>
>
>

