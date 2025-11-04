Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1197ECCFA03
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 03:31:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=52u3ce68a/2VewtwVxA8vPC3R1+VyiePk3LEPb1Gvvk=; b=y9L6QlhHSHTO+jUlwDr3R+8qmM
	x84e55fd4xYjYnOX/KIUKgGm3dzM8+o8gtlHEp6VFKtBBG2ydYg2Ld2mAEvEo8YG+q643+q4WgkAD
	xmUa4DaNWewOq6d0xN9bzLn7dZjBTzBZ/+fphyrFq/0tTJ5wx9hhVzflCiv0pVVDVc6G7ntKmXoO3
	JF+8FcuXksYVrLfdUU8j/AiW2c0JiP+taAXbuLPlWdhQVCj3/CDVIB7OkfyrCoT6GCRIHRwyR8IKQ
	xCebvQaoaegvpKsyiGv+7DDKDZrc5G+J7c/1ghW77/R2581RqNSlF/6TJ0gu+Cx+QJnJmwbfiYPwC
	UBzVc6tA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vG7lV-0000000B3zj-0HpG;
	Tue, 04 Nov 2025 03:31:25 +0000
Received: from mail-vk1-xa2b.google.com ([2607:f8b0:4864:20::a2b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vG7lQ-0000000B3ys-24ht
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Nov 2025 03:31:22 +0000
Received: by mail-vk1-xa2b.google.com with SMTP id 71dfb90a1353d-54a7bf06edfso1898960e0c.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Nov 2025 19:31:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1762227078; x=1762831878; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=52u3ce68a/2VewtwVxA8vPC3R1+VyiePk3LEPb1Gvvk=;
        b=dnZfM3x2WXcWqzMGouHzXBK/8OB/qLV8fDn92JW7uqEAkwo6h/E2zxKBZALloD5Oj4
         c0fg8rZG35Ieakw7LlXEKU46XtVy2xLhWZYF3AdfUl7Cdadj3eaNms9Bs56nJcHQ5S9q
         ZNv+ONk/dilVlUDpaVHYBUBQlprexgsU5fq64=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762227078; x=1762831878;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=52u3ce68a/2VewtwVxA8vPC3R1+VyiePk3LEPb1Gvvk=;
        b=RxNmmdzqERQDl/qRu2QDA3NwaKWmyrbnynit+sbcVboT+arYHSIwFsrfQX3iQbt4nV
         zSaQdDhK4tiupF9rbmz0UcY26ElDOk/pKdzdw3YRRV0xanUoA3C06WkelLuyyzmyYkfJ
         nUr4jTaZucEDyr1W3dxeK3g9/Ibb1DSmqq3zE5SwFaN718yH3ckQvc3hAllGXw1uYptN
         AFfSPtY6QOcPiK76TvCSIYtk5VMtqtZZOp/9OeBesgc9H3ItTkQyl2p6EI3DhKTBT6JC
         OhagC1/JAenL7fYhCS9QGOgvMNNFumvHKdgwgVYADbZPb4dmD9iXNFP8NP9rU0mX5Igz
         4uGA==
X-Forwarded-Encrypted: i=1; AJvYcCVOYl0hKTiV0JgwgMwSENHcjetAL/4PyORrVw2sk7UDK5coFGomcsehYBi0qrRxPUTN0Gb1UQ8o1dJo4JnlH2Hc@lists.infradead.org
X-Gm-Message-State: AOJu0YzoDJQWIMvyv5yKm53C9UUi5UPzeoJzpuCJbHvHrZkN0oNxr5H1
	tOIJ5DohPa/LeAYuWN6hsjezEYKGvFgJCezeEHUKoSUb5KnhUdyy4TC1A9vHeBIbuCqNSkP9fVl
	YuYo=
X-Gm-Gg: ASbGncu6chyW9Y42y3juTIFDd4iQrcf3Z9CCqI+x8SnUdUIKIUwzOn2ixc7T4ihtOOc
	NxIDoVQ0EAasUALBXJ5RVO1XWI2LSsIS7HB9FdFKGEUvrgvxNuHwVchsMYDguILIJkwSf3Ra2qz
	Qf3vFzja6/dbTH5AWo1cEon1tiZBID3UZfWTbSpx/kTefvkEQLnsgN7A4upvc1aGJiS1pUcT/af
	n6xbHIUeCanrJ/i77Cl7LTYcyi48ru9M3Py+wYAAjbNFotmbCpdzp4rfkGDVNwIUOYFt9b64EZe
	9N8521vXqctYkToGhFvzAd638KkAWJKQ06bCFJZDJAnXSYHvuOnFCYdT5+YoREu15mmrjdSEakN
	erbSPgHJxJ4IbwLCB00sM6Zurs1fVQLy4YpECV93Moom+8gCBthsjq5quiSkk5FmhS7Ka5k6dpV
	MpjVIqmrP1mSLoKBc0rkKxtt2iA1DAymFcG6A=
X-Google-Smtp-Source: AGHT+IHKjGTCfP0Cua67TWM0UQN1OgR/axKVAgTPvjUKsJFMLNhWCfhXyYUMiRsXVKjcfM986NDlUQ==
X-Received: by 2002:a05:6122:c3cd:b0:559:623a:3aa9 with SMTP id 71dfb90a1353d-559623a41a1mr1352952e0c.1.1762227077979;
        Mon, 03 Nov 2025 19:31:17 -0800 (PST)
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com. [209.85.217.54])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-55973cbd817sm681975e0c.21.2025.11.03.19.31.17
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Nov 2025 19:31:17 -0800 (PST)
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-5db308cddf0so5106054137.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Nov 2025 19:31:17 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV17PgVAldpBH8CN0XY0NuzM5qLCZbA+6L/Ilfh7AqN8tnGR+oTsO0IoPiKu/ORjkUPbfmXPC1U7YXaMlQDg/or@lists.infradead.org
X-Received: by 2002:a05:6102:3592:b0:5db:cc25:dd7a with SMTP id
 ada2fe7eead31-5dbcc25e19emr3043231137.28.1762227076683; Mon, 03 Nov 2025
 19:31:16 -0800 (PST)
MIME-Version: 1.0
References: <20251104031533.9419-1-Niklaus.Liu@mediatek.com> <20251104031533.9419-2-Niklaus.Liu@mediatek.com>
In-Reply-To: <20251104031533.9419-2-Niklaus.Liu@mediatek.com>
From: Fei Shao <fshao@chromium.org>
Date: Tue, 4 Nov 2025 11:30:40 +0800
X-Gmail-Original-Message-ID: <CAC=S1ngxeeV9m+5Yv0YNGWdbD0eVQisSr7k+nsxieok_7jKp=A@mail.gmail.com>
X-Gm-Features: AWmQ_bmOhDmgmGrSBNtj0-kgZvqxGdX1GAYzQFFwyDNQ0HSH4haoGBpnhf8glsQ
Message-ID: <CAC=S1ngxeeV9m+5Yv0YNGWdbD0eVQisSr7k+nsxieok_7jKp=A@mail.gmail.com>
Subject: Re: [PATCH 1/1] soc: mediatek: mtk-regulator-coupler: Add support for MT8189
To: "niklaus.liu" <Niklaus.Liu@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	Project_Global_Chrome_Upstream_Group@mediatek.com, sirius.wang@mediatek.com, 
	vince-wl.liu@mediatek.com, jh.hsu@mediatek.com, zhigang.qin@mediatek.com, 
	sen.chu@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_193120_617232_D2D9F193 
X-CRM114-Status: GOOD (  23.47  )
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

On Tue, Nov 4, 2025 at 11:15=E2=80=AFAM niklaus.liu <Niklaus.Liu@mediatek.c=
om> wrote:
>
> From: Niklaus Liu <niklaus.liu@mediatek.com>
>
> Enhance the regulator coupler driver to support GPU power control on the
> MediaTek MT8189 platform. This update ensures proper coordination of
> multiple regulators required for GPU operation,improving power management
> and system stability.
>
> Signed-off-by: Niklaus Liu <niklaus.liu@mediatek.com>
> ---
>  drivers/soc/mediatek/mtk-regulator-coupler.c | 15 ++++++++++++++-
>  1 file changed, 14 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/soc/mediatek/mtk-regulator-coupler.c b/drivers/soc/m=
ediatek/mtk-regulator-coupler.c
> index 0b6a2884145e..f6e3b2a3a5a8 100644
> --- a/drivers/soc/mediatek/mtk-regulator-coupler.c
> +++ b/drivers/soc/mediatek/mtk-regulator-coupler.c
> @@ -42,6 +42,18 @@ static int mediatek_regulator_balance_voltage(struct r=
egulator_coupler *coupler,
>         int max_uV =3D INT_MAX;
>         int ret;
>
> +       /*
> +        * When vsram_gpu is enabled or disabled and the use_count of the
> +        * vsram_gpu regulator is zero, the regulator coupler driver will
> +        * execute regulator_do_balance_voltage, which adjusts the vsram_=
gpu
> +        * voltage to the minimum value. This may result in vsram_gpu bei=
ng
> +        * lower than vgpu. Therefore, when enabling or disabling vsram_g=
pu,
> +        * the 8189 temporarily skips the regulator coupler driver's modi=
fication
> +        * of the vsram_gpu voltage.
> +        */
> +       if (of_machine_is_compatible("mediatek,mt8189") && rdev =3D=3D mr=
c->vsram_rdev)
> +               return 0;
> +
>         /*
>          * If the target device is on, setting the SRAM voltage directly
>          * is not supported as it scales through its coupled supply volta=
ge.
> @@ -148,7 +160,8 @@ static int mediatek_regulator_coupler_init(void)
>         if (!of_machine_is_compatible("mediatek,mt8183") &&
>             !of_machine_is_compatible("mediatek,mt8186") &&
>             !of_machine_is_compatible("mediatek,mt8188") &&
> -           !of_machine_is_compatible("mediatek,mt8192"))
> +           !of_machine_is_compatible("mediatek,mt8192") &&
> +           !of_machine_is_compatible("mediatek,mt8189"))

Please add the new entry by alphabetical order.

Regards,
Fei

>                 return 0;
>
>         return regulator_coupler_register(&mediatek_coupler.coupler);
> --
> 2.46.0
>
>

