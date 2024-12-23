Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 945BBE7718B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Dec 2024 11:32:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UNXt+kf59YlZewLAOuaeZQ47PN1syAYwU8o51h1QyTI=; b=0B4nhDLccVsi/xJmpE9X5Ftmtt
	TrQiTeh5nwN4fEvcDKZc3vIZYI12qkbDxVE9jq1Hq7A0u+h420HLVWwZETwPNjeo7rVEvwD3TZXen
	Exl96Jz7h7JN2IYc/zDcUjdzOp9kTo1CemWiOkDCoaFr4luJwUpvoqGZxl6lPaXmyLVdQmEyFnZPe
	TKNHQ2G+Ttc/xBd08kD91xid8VrJoBNkMcd0WngbUd1gHXsSUZN8Ks2NjXivSH1sAG7giBrTwlp5W
	xsVaurOf5yfB1L1Wz6YxqpH6DUCKRcpUa7UwHlHFdbxJi+SP3hj0+G7mjDeytKrodlrS3Pc3LZhO+
	BkR878yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPgf8-00000009uRM-2MwW;
	Mon, 23 Dec 2024 11:31:50 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPgYX-00000009tW8-07Rl
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Dec 2024 11:25:02 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-53f757134cdso4523322e87.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Dec 2024 03:25:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1734953099; x=1735557899; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UNXt+kf59YlZewLAOuaeZQ47PN1syAYwU8o51h1QyTI=;
        b=NElZQjpZmWkdbx0oUwyLVKCemrovTgBRXePYw2ilho60drAtesukV3DAeJ/ZrpvuuG
         IU6wMkqL9JUQkFNVvuZliz1Cc08nAcDFHn20oTPBCa1Xf14EZ29QNr89il2KdLCRUwYR
         mJYIwNvutADBdA53N2C1m6zdei+I5QMMLn4V0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734953099; x=1735557899;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UNXt+kf59YlZewLAOuaeZQ47PN1syAYwU8o51h1QyTI=;
        b=i0QBn5MwrgEEpIwmNUEjYqdKH1yaMYk6Fr+ZKWDcsowVDt/jWdFGV5lK7tRrebsVbz
         866kIE60zOoT0nde/m6BNaMbQksUT9RW2jhoLWnJgmJv1qObfoGYoU5VozvZmnVOU7l4
         ruXisytqzpGlG+ONRnraLcPvxwA+b12ebxW/viHQplyhXWhAdDddtNoZ+DA1+YPamsGB
         EPHotJxa2ZlPfLoABjr+v4YScr0jgS4Tw3wdmdyQAgfirJAL8c+Gs871DyHBwHCft1t2
         GjL2KqeRkIwh/53VwOiOkJzg1p/kY37nhdHXy6lf3wNWAlieew4/jP/r04c8dgrfT1yG
         DtWA==
X-Forwarded-Encrypted: i=1; AJvYcCWOWR9aYkSt+/nNkPaz1Pr7ZpLZX9OEJAk+HlNUJWOEQpuvAmNOjlEke3Ruo7TUfOCKZaNnr3k3qjO1w7vS6vzM@lists.infradead.org
X-Gm-Message-State: AOJu0YwMQ5IittOLy4A+iUVQ2DiYo5dEJLwN+8tk8S584YvWe6+dNdcZ
	x4V3Egzn9FhozAtM1/KOGYSo8v94ymcR7fSjY/4E3cuSOfMi4SlU6Ck13YQs5NW4xYzFNm5I1qx
	ZWg91yCxfe19YsgFKJZb1n91/Qpsq7y40hbSn
X-Gm-Gg: ASbGncvCjYWiQM1Q7OIJUR6qLvVbgzMWGKd1YlF4IiPEhBD6XRW6FMesXOCpb5nhsyq
	FVpTmuadTSfANTFaTNp1YR8yWRLhu9vc8ZuEZdfdWuKeh8rGks4m5GFNsusPJUnJwVg==
X-Google-Smtp-Source: AGHT+IHKIcSztKoWb+jH58qNH+TWPshkyeN6Su2LSC+DPVvCbFU5vLIrm5cDbfMBjckzf10FFbvnuzfTNvTJtyiueig=
X-Received: by 2002:a05:6512:2349:b0:540:271f:adef with SMTP id
 2adb3069b0e04-5422953c3efmr4278421e87.24.1734953098810; Mon, 23 Dec 2024
 03:24:58 -0800 (PST)
MIME-Version: 1.0
References: <20241223100648.2166754-1-wenst@chromium.org> <481a6eec-c428-45cd-98a6-5a91f3ceb187@collabora.com>
In-Reply-To: <481a6eec-c428-45cd-98a6-5a91f3ceb187@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 23 Dec 2024 19:24:47 +0800
Message-ID: <CAGXv+5Fj5s9FUyaxmEkGimxjEcS6OEfm4_5Zso+YocSi+Vt4pg@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20241223_032501_064226_60FF8B89 
X-CRM114-Status: GOOD (  19.56  )
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

On Mon, Dec 23, 2024 at 7:11=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 23/12/24 11:06, Chen-Yu Tsai ha scritto:
> > Like the MT8186, the MT8188 stores GPU speed binning data in its efuse.
> > The data needs post-processing into a format that the OPP framework can
> > use.
> >
> > Add a compatible match for MT8188 efuse with post-processing enabled.
> >
>
> Let's just change the MT8188 compatible list to
>
> compatible =3D "mediatek,mt8188-efuse", "mediatek,mt8186-efuse";

That would be "mediatek,mt8188-efuse", "mediatek,mt8186-efuse", "mediatek,e=
fuse"
then?

Fine by me. :D

ChenYu

> instead :-)
>
> Cheers,
> Angelo
>
> > Cc: <stable@vger.kernel.org>
> > Fixes: ff1df1886f43 ("dt-bindings: nvmem: mediatek: efuse: Add support =
for MT8188")
> > Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> > ---
> >
> > I'm not exactly sure about pointing to the dt bindings commit for the
> > fixes tag.
> > ---
> >   drivers/nvmem/mtk-efuse.c | 1 +
> >   1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/nvmem/mtk-efuse.c b/drivers/nvmem/mtk-efuse.c
> > index af953e1d9230..e8409e1e7fac 100644
> > --- a/drivers/nvmem/mtk-efuse.c
> > +++ b/drivers/nvmem/mtk-efuse.c
> > @@ -112,6 +112,7 @@ static const struct mtk_efuse_pdata mtk_efuse_pdata=
 =3D {
> >   static const struct of_device_id mtk_efuse_of_match[] =3D {
> >       { .compatible =3D "mediatek,mt8173-efuse", .data =3D &mtk_efuse_p=
data },
> >       { .compatible =3D "mediatek,mt8186-efuse", .data =3D &mtk_mt8186_=
efuse_pdata },
> > +     { .compatible =3D "mediatek,mt8188-efuse", .data =3D &mtk_mt8186_=
efuse_pdata },
> >       { .compatible =3D "mediatek,efuse", .data =3D &mtk_efuse_pdata },
> >       {/* sentinel */},
> >   };
>

