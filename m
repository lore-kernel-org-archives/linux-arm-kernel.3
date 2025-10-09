Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B6DECCA470
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Oct 2025 07:33:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NATA04lG9cqYNuKN4V/mGz7RayXhel8O3qk+QILIDN0=; b=MVjzsKXoOGoPpcPUqEpLPwaoED
	Mcmv0CK1kq06SfpZOXmsTLZazCsX5P06GopSxw2eeZqlwWSIsf4axCr4703+NIhpdS1vZzTgxF6bM
	E+zRthS8jB++9XDv6uIQHHmGdzvvd7VSHpd/6iu9FBX66zR0BjaeN8yFgwPi9x2/DrKk0IAUj2tIa
	sb26+C4roUyR2TauvQkMBvBJsIJVIGYv0JILp1BwIk0KpdcOEhuHherX6vNvQWgVfgBnAWXUfyAiy
	LgUZ/uhdmTWnYx4JcnFTK8+vujhNlBkk62FoL5B617iHtHpnV1FXm+vsYYQOVnuTSZo8GPmzvlMLn
	qG4fZZsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6l9e-00000005NtO-0HBO;
	Thu, 09 Oct 2025 07:33:38 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6l9b-00000005NsB-0vfd
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Oct 2025 07:33:36 +0000
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-5797c8612b4so902407e87.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Oct 2025 00:33:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1759995213; x=1760600013; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NATA04lG9cqYNuKN4V/mGz7RayXhel8O3qk+QILIDN0=;
        b=Rwpv8qQ0b82PYO/SDc8w2uowKbVjKZQt4uhCVcN5oj9/coilsEuBKEY2qlol+ub+2E
         QIxwA6Gc5E6Xy5vHTL1bzx5TP+zIgMopu7cdJhhnpicL1Vhkkry2NuJUvWH5k/UvlDWM
         yVfuSVekBjd7nj2K4NkLPyr5KBAehXQVfHvKY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759995213; x=1760600013;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NATA04lG9cqYNuKN4V/mGz7RayXhel8O3qk+QILIDN0=;
        b=qDYKYtU8uYz4poA++XA3JKJ5hIlAWsprCwDhMokJnvzuWKVs7OORNewQS0PXr3svSP
         KEMOreNZf+uaRT3e7LJMTFbGM5GL8/N2ucJ83og/ZVInwAWjSmTwox0D5EIgfmfwmSj2
         EJgtcv7+z/vRbliGB/qhg57HTTQZ0GPBjQQl6fuGI8gaMhudkE+l4WL4JyBvNBQ59xOf
         zTLJcx1vP6Yn7h2AtdomWfyl82dQwNvL73iqffTSI4hplxHSvhg8macUrWTjuVRLucZs
         CrZLTaR6R7zy/6BhOsf+n3KH7uJoboSCXaC+tXiooroC4e7DM5esXiBpSUVmd+zmyfuI
         1TIw==
X-Forwarded-Encrypted: i=1; AJvYcCXR+GMQRlcvTCjS/LJ9DsYJYYzDeGxEQlo/usHC2sDIKSMdlXnn244m4a3y1r2hw58Etn2orzYrT+Lh/7mMZQHN@lists.infradead.org
X-Gm-Message-State: AOJu0YwQ2yCQ31pdLf6pXSp26SdnYqpHbjGJBjWtZSt88EzKwy0eAsXp
	WVNFP9HSDYQUtDKp8pNx6rVckO2ll9Vx72kh2shEPBy6yilqfyAw+QuqO7Kg03FX5DwWTnh9vq3
	Yl05PnlD5Wu0lnI7D10nV4JK8QqViKEgF4k6KOQSp
X-Gm-Gg: ASbGncu6yzoFDstTsgpF5bXwy82w/+9L+FK2dL7dA9+LIrkq8i3ozqODoO1wPP2hH1A
	9F0RL5FZh+ETBKYzSD8Rc9y2FEIpvx58bERcK73CKgRf2tK+aVUL+xUinbruYhEedOXvJYkhm2h
	mMzNmPPz8R/94RbCiKOdrxnzpjhGtnVEG1RrwcoIgz+XxmZmFg26wdMCF4q9kS7O5UMuTR/KYaz
	RMlIyv4hhKrXFbzDbiYFRjDAprz/6r40aC9xWn9EY+e4hAgG6NHuAqjtrxEbw==
X-Google-Smtp-Source: AGHT+IF6m8ACDaU9hzMk8xdqL2Q2Hbks2uUt6Iy3PDX+KKlJyzdC/zfk13eIYMHbsDIcLqn07l/Zwc+Zn356g2up4Tk=
X-Received: by 2002:a2e:be9a:0:b0:337:f1d7:d500 with SMTP id
 38308e7fff4ca-37609d953b8mr16127351fa.18.1759995213025; Thu, 09 Oct 2025
 00:33:33 -0700 (PDT)
MIME-Version: 1.0
References: <20251008-mtk-pll-rpm-v2-0-170ed0698560@collabora.com> <20251008-mtk-pll-rpm-v2-4-170ed0698560@collabora.com>
In-Reply-To: <20251008-mtk-pll-rpm-v2-4-170ed0698560@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 9 Oct 2025 15:33:22 +0800
X-Gm-Features: AS18NWDCKGPR4MxJLy6Y5o4fyCGycMwSUzGQZN0AhucPrjjtAqoX3WiLmZowTiU
Message-ID: <CAGXv+5Hpndq09cbudofSvkNE6w+tHb85VCqDb3P920S8vwonHQ@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] clk: mediatek: Refactor pllfh registration to pass device
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Dong Aisheng <aisheng.dong@nxp.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Yassine Oudjana <y.oudjana@protonmail.com>, Laura Nao <laura.nao@collabora.com>, 
	=?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>, 
	Chia-I Wu <olvaffe@gmail.com>, kernel@collabora.com, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, Stephen Boyd <sboyd@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251009_003335_323129_451982CC 
X-CRM114-Status: GOOD (  19.90  )
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

On Thu, Oct 9, 2025 at 12:06=E2=80=AFAM Nicolas Frattaroli
<nicolas.frattaroli@collabora.com> wrote:
>
> After refactoring all of PLL to pass the device, it's now fairly easy to
> refactor pllfh and its users, as pllfh registration wraps PLL
> registration.
>
> Do this refactor and move all of the pllfh users to pass the device as
> well.
>
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> ---
>  drivers/clk/mediatek/clk-mt6795-apmixedsys.c |  2 +-
>  drivers/clk/mediatek/clk-mt8173-apmixedsys.c | 14 +++++++-------
>  drivers/clk/mediatek/clk-mt8186-apmixedsys.c |  2 +-
>  drivers/clk/mediatek/clk-mt8192-apmixedsys.c |  2 +-
>  drivers/clk/mediatek/clk-mt8195-apmixedsys.c |  2 +-
>  drivers/clk/mediatek/clk-pllfh.c             | 13 ++++++++-----
>  drivers/clk/mediatek/clk-pllfh.h             |  2 +-
>  7 files changed, 20 insertions(+), 17 deletions(-)
>
> diff --git a/drivers/clk/mediatek/clk-mt6795-apmixedsys.c b/drivers/clk/m=
ediatek/clk-mt6795-apmixedsys.c
> index 91665d7f125efde4941cc4de881c5b503a935529..123d5d7fea8554676364dc56f=
5c023e43325d516 100644
> --- a/drivers/clk/mediatek/clk-mt6795-apmixedsys.c
> +++ b/drivers/clk/mediatek/clk-mt6795-apmixedsys.c
> @@ -152,7 +152,7 @@ static int clk_mt6795_apmixed_probe(struct platform_d=
evice *pdev)
>                 return -ENOMEM;
>
>         fhctl_parse_dt(fhctl_node, pllfhs, ARRAY_SIZE(pllfhs));
> -       ret =3D mtk_clk_register_pllfhs(node, plls, ARRAY_SIZE(plls),
> +       ret =3D mtk_clk_register_pllfhs(dev, plls, ARRAY_SIZE(plls),
>                                       pllfhs, ARRAY_SIZE(pllfhs), clk_dat=
a);
>         if (ret)
>                 goto free_clk_data;
> diff --git a/drivers/clk/mediatek/clk-mt8173-apmixedsys.c b/drivers/clk/m=
ediatek/clk-mt8173-apmixedsys.c
> index 95385bb67d5511eda3a851f81986e67eaf81e5fb..d7d416172ab35bc027ae67c16=
3c1dc20dee857b6 100644
> --- a/drivers/clk/mediatek/clk-mt8173-apmixedsys.c
> +++ b/drivers/clk/mediatek/clk-mt8173-apmixedsys.c
> @@ -140,13 +140,13 @@ MODULE_DEVICE_TABLE(of, of_match_clk_mt8173_apmixed=
);
>  static int clk_mt8173_apmixed_probe(struct platform_device *pdev)
>  {
>         const u8 *fhctl_node =3D "mediatek,mt8173-fhctl";
> -       struct device_node *node =3D pdev->dev.of_node;
>         struct clk_hw_onecell_data *clk_data;
> +       struct device *dev =3D &pdev->dev;
>         void __iomem *base;
>         struct clk_hw *hw;
>         int r;
>
> -       base =3D of_iomap(node, 0);
> +       base =3D of_iomap(dev->of_node, 0);
>         if (!base)
>                 return -ENOMEM;
>
> @@ -157,25 +157,25 @@ static int clk_mt8173_apmixed_probe(struct platform=
_device *pdev)
>         }
>
>         fhctl_parse_dt(fhctl_node, pllfhs, ARRAY_SIZE(pllfhs));
> -       r =3D mtk_clk_register_pllfhs(node, plls, ARRAY_SIZE(plls),
> -                                   pllfhs, ARRAY_SIZE(pllfhs), clk_data)=
;
> +       r =3D mtk_clk_register_pllfhs(dev, plls, ARRAY_SIZE(plls), pllfhs=
,
> +                                   ARRAY_SIZE(pllfhs), clk_data);
>         if (r)
>                 goto free_clk_data;
>
>         hw =3D mtk_clk_register_ref2usb_tx("ref2usb_tx", "clk26m", base +=
 REGOFF_REF2USB);
>         if (IS_ERR(hw)) {
>                 r =3D PTR_ERR(hw);
> -               dev_err(&pdev->dev, "Failed to register ref2usb_tx: %d\n"=
, r);
> +               dev_err(dev, "Failed to register ref2usb_tx: %d\n", r);
>                 goto unregister_plls;
>         }
>         clk_data->hws[CLK_APMIXED_REF2USB_TX] =3D hw;
>
> -       hw =3D devm_clk_hw_register_divider(&pdev->dev, "hdmi_ref", "tvdp=
ll_594m", 0,
> +       hw =3D devm_clk_hw_register_divider(dev, "hdmi_ref", "tvdpll_594m=
", 0,
>                                           base + REGOFF_HDMI_REF, 16, 3,
>                                           CLK_DIVIDER_POWER_OF_TWO, NULL)=
;
>         clk_data->hws[CLK_APMIXED_HDMI_REF] =3D hw;
>
> -       r =3D of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_dat=
a);
> +       r =3D of_clk_add_hw_provider(dev->of_node, of_clk_hw_onecell_get,=
 clk_data);
>         if (r)
>                 goto unregister_ref2usb;
>
> diff --git a/drivers/clk/mediatek/clk-mt8186-apmixedsys.c b/drivers/clk/m=
ediatek/clk-mt8186-apmixedsys.c
> index 4b2b16578232d986f78deed4778c5fab7f460184..d35dd2632e43ab535b32b8b99=
f8d75de02d56fe2 100644
> --- a/drivers/clk/mediatek/clk-mt8186-apmixedsys.c
> +++ b/drivers/clk/mediatek/clk-mt8186-apmixedsys.c
> @@ -151,7 +151,7 @@ static int clk_mt8186_apmixed_probe(struct platform_d=
evice *pdev)
>
>         fhctl_parse_dt(fhctl_node, pllfhs, ARRAY_SIZE(pllfhs));
>
> -       r =3D mtk_clk_register_pllfhs(node, plls, ARRAY_SIZE(plls),
> +       r =3D mtk_clk_register_pllfhs(&pdev->dev, plls, ARRAY_SIZE(plls),
>                                     pllfhs, ARRAY_SIZE(pllfhs), clk_data)=
;
>         if (r)
>                 goto free_apmixed_data;
> diff --git a/drivers/clk/mediatek/clk-mt8192-apmixedsys.c b/drivers/clk/m=
ediatek/clk-mt8192-apmixedsys.c
> index 0b66a27e4d5ac68f09dc6a4197fd84ef82342df9..b0563a285bd666d492a7fa940=
733aad1ab1a0bae 100644
> --- a/drivers/clk/mediatek/clk-mt8192-apmixedsys.c
> +++ b/drivers/clk/mediatek/clk-mt8192-apmixedsys.c
> @@ -162,7 +162,7 @@ static int clk_mt8192_apmixed_probe(struct platform_d=
evice *pdev)
>
>         fhctl_parse_dt(fhctl_node, pllfhs, ARRAY_SIZE(pllfhs));
>
> -       r =3D mtk_clk_register_pllfhs(node, plls, ARRAY_SIZE(plls),
> +       r =3D mtk_clk_register_pllfhs(&pdev->dev, plls, ARRAY_SIZE(plls),
>                                     pllfhs, ARRAY_SIZE(pllfhs), clk_data)=
;
>         if (r)
>                 goto free_clk_data;
> diff --git a/drivers/clk/mediatek/clk-mt8195-apmixedsys.c b/drivers/clk/m=
ediatek/clk-mt8195-apmixedsys.c
> index 282a3137dc89419a6d0b574fd549cee941687900..44917ab034c56f01ef02d1957=
f17eb0655438d75 100644
> --- a/drivers/clk/mediatek/clk-mt8195-apmixedsys.c
> +++ b/drivers/clk/mediatek/clk-mt8195-apmixedsys.c
> @@ -181,7 +181,7 @@ static int clk_mt8195_apmixed_probe(struct platform_d=
evice *pdev)
>
>         fhctl_parse_dt(fhctl_node, pllfhs, ARRAY_SIZE(pllfhs));
>
> -       r =3D mtk_clk_register_pllfhs(node, plls, ARRAY_SIZE(plls),
> +       r =3D mtk_clk_register_pllfhs(&pdev->dev, plls, ARRAY_SIZE(plls),
>                                     pllfhs, ARRAY_SIZE(pllfhs), clk_data)=
;
>         if (r)
>                 goto free_apmixed_data;
> diff --git a/drivers/clk/mediatek/clk-pllfh.c b/drivers/clk/mediatek/clk-=
pllfh.c
> index 62bfe4a480f14a0a742fb094aff0e6d1a79fe0c3..8ad11023d91127e88900bc6bc=
abbaeafb1e00664 100644
> --- a/drivers/clk/mediatek/clk-pllfh.c
> +++ b/drivers/clk/mediatek/clk-pllfh.c
> @@ -10,6 +10,7 @@
>  #include <linux/slab.h>
>  #include <linux/clkdev.h>
>  #include <linux/delay.h>
> +#include <linux/device.h>

This shouldn't be needed, as you aren't using any of the APIs.

A forward declaration of |struct device| in the header should suffice.
It should be added anyway, since the header defines data structures that
have a |struct device *| field.


ChenYu

