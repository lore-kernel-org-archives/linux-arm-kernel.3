Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F0ACE674AC
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Nov 2024 07:44:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AIdrzBhxaYOudwVJlEqwarkgMuVinNcfj9JrlrLM6E0=; b=d/qOAO9Bbg3uny2TYn587r56rx
	rTwcWnxWGpMmvzPykNuurDGEOmj5pZy7XaAiii6zCE2+PaMchAca2uZt6Xy6bF6ww9cscomsSKluy
	evcroj7DAjUeDA+kXawmUR5VdKkulySsU3t6oc9iirmXvwZHmP7zd8WFDuV1DED9GDHEzSuTYqzoQ
	WWQFMTcpPvW2HhrdodmLmcLbPr5qGkIms7OrcKALb7PEsDCUi0w3BZlYzy8WfXIR11iljgwQt/kBA
	u+mmwTrjx/o5hU2lksoJwQal6f5Qfjwc5rSczcG1t5pmBVWCF8D7uKGZzg7TPSXShRA90OsKIaiNg
	349EPmAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6mK1-000000069YD-0UWH;
	Fri, 01 Nov 2024 07:43:53 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6mIK-0000000698S-2VVH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Nov 2024 07:42:10 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-53a0c160b94so1951632e87.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 01 Nov 2024 00:42:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1730446926; x=1731051726; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AIdrzBhxaYOudwVJlEqwarkgMuVinNcfj9JrlrLM6E0=;
        b=eSaKfPQqniWwcAybk1Sq2SGUyPc17l0Chfa/2L8JIlwVB2jWVMBY0GdOI+n6VC29CW
         GXTFT+9iIILW7HIcckNm1z2EgimLyhTviCEwkESQpxA9qapf7HoZozPxgkKzeKV0bbJ1
         f8Ek86WAnH/GpQzSzmDuKRUKCwSWA0cTepB4Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730446926; x=1731051726;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AIdrzBhxaYOudwVJlEqwarkgMuVinNcfj9JrlrLM6E0=;
        b=IztQhYWuhYQq6HXKMndCwDMtuhvGBuPGO9DkWfAmXC9Jw1+ChVBR7KqAHbQzUiXDnO
         HyBAwK4AI3ERa82aX8xBexVXCtm/YhFRAiG3BAch8utaY6/g4FgDxnGa3uFxsTjQkgRy
         vvgVX0VGovzro36A9GyXyEc+EkUe99mme/Y6tCLGKbT/zAsa5V04X7cRzKac+/fQ1lZn
         izmm+PaqNrBxul8Z3UA5vzy5hTsR4zkk0zAyFpYFvXYITRKJPhP5TDJAcgq9zjXGb63V
         fd3uJjOBVp5H1UfsCvwvebn0tUmr9uIJzK8ZF72DTzzVQGXRR6vMy5Wv8UY7RckYWAJ0
         B7pw==
X-Forwarded-Encrypted: i=1; AJvYcCWqMMqmPRn9Q1cUyGHpbxRBVgVNbiDHmrcqHjpR5Otq0DslvOEnmzIrJXPuJmcedJRYvm3agdC/pBvxV6IS9CHY@lists.infradead.org
X-Gm-Message-State: AOJu0YyI/oHoi2bYdeHzma88U/67RnB9F518pji2ZfPFMQhfz252AY6o
	vJ1uWCTymUaHI7EeAKDPM78iLGNEXmznwrA79cOmKt5ADlB1+viImHh+maxcUR+xRON3lWO7922
	2EV7tkVDRb/shJJ1hvwuBmA1xGcrUr25wtKOg
X-Google-Smtp-Source: AGHT+IEH94/fyCantPWg+JSDsdCT1KoXU+c1gdEceLGqvlXMPVHqZ/SsqaDoW07J3kRkVsMcqqlDVlzNv5mQm5MpnK0=
X-Received: by 2002:a05:6512:3e22:b0:536:54df:bff2 with SMTP id
 2adb3069b0e04-53d65e265e8mr1216351e87.54.1730446926248; Fri, 01 Nov 2024
 00:42:06 -0700 (PDT)
MIME-Version: 1.0
References: <20241025-kselftest-gpio-set-get-config-v2-0-040d748840bb@collabora.com>
 <20241025-kselftest-gpio-set-get-config-v2-1-040d748840bb@collabora.com>
In-Reply-To: <20241025-kselftest-gpio-set-get-config-v2-1-040d748840bb@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 1 Nov 2024 15:41:55 +0800
Message-ID: <CAGXv+5HNwk2B_01_o90nZ1smDcZoFf3O-4-+n+E7vKtLTS9-rQ@mail.gmail.com>
Subject: Re: [PATCH RFC v2 1/5] pinctrl: mediatek: paris: Expose more
 configurations to GPIO set_config
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>
Cc: Sean Wang <sean.wang@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Bamvor Jian Zhang <bamv2005@gmail.com>, Shuah Khan <shuah@kernel.org>, kernel@collabora.com, 
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kselftest@vger.kernel.org, kernelci@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_004208_683942_5CE62DD4 
X-CRM114-Status: GOOD (  22.65  )
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

On Sat, Oct 26, 2024 at 4:06=E2=80=AFAM N=C3=ADcolas F. R. A. Prado
<nfraprado@collabora.com> wrote:
>
> Currently the set_config callback in the gpio_chip registered by the
> pinctrl_paris driver only supports configuring a single parameter on
> specific pins (the input debounce of the EINT controller, on pins that
> support it), even though many other configurations are already
> implemented and available through the pinctrl API for configuration of
> pins by the Devicetree and other drivers.
>
> Expose all configurations currently implemented through the GPIO API so
> they can also be set from userspace, which is particularly useful to
> allow testing them from userspace.
>
> Signed-off-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

> ---
>  drivers/pinctrl/mediatek/pinctrl-paris.c | 26 +++++++++++++-------------
>  1 file changed, 13 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/pinctrl/mediatek/pinctrl-paris.c b/drivers/pinctrl/m=
ediatek/pinctrl-paris.c
> index 87e958d827bf939aa6006794287698be4936f25e..c9455de266a447ab7f5446c15=
11bef0ef9c9128e 100644
> --- a/drivers/pinctrl/mediatek/pinctrl-paris.c
> +++ b/drivers/pinctrl/mediatek/pinctrl-paris.c
> @@ -255,10 +255,9 @@ static int mtk_pinconf_get(struct pinctrl_dev *pctld=
ev,
>         return err;
>  }
>
> -static int mtk_pinconf_set(struct pinctrl_dev *pctldev, unsigned int pin=
,
> -                          enum pin_config_param param, u32 arg)
> +static int mtk_paris_pin_config_set(struct mtk_pinctrl *hw, unsigned int=
 pin,
> +                                   enum pin_config_param param, u32 arg)
>  {
> -       struct mtk_pinctrl *hw =3D pinctrl_dev_get_drvdata(pctldev);
>         const struct mtk_pin_desc *desc;
>         int err =3D -ENOTSUPP;
>         u32 reg;
> @@ -795,9 +794,9 @@ static int mtk_pconf_group_set(struct pinctrl_dev *pc=
tldev, unsigned group,
>         int i, ret;
>
>         for (i =3D 0; i < num_configs; i++) {
> -               ret =3D mtk_pinconf_set(pctldev, grp->pin,
> -                                     pinconf_to_config_param(configs[i])=
,
> -                                     pinconf_to_config_argument(configs[=
i]));
> +               ret =3D mtk_paris_pin_config_set(hw, grp->pin,
> +                                              pinconf_to_config_param(co=
nfigs[i]),
> +                                              pinconf_to_config_argument=
(configs[i]));
>                 if (ret < 0)
>                         return ret;
>
> @@ -937,18 +936,19 @@ static int mtk_gpio_set_config(struct gpio_chip *ch=
ip, unsigned int offset,
>  {
>         struct mtk_pinctrl *hw =3D gpiochip_get_data(chip);
>         const struct mtk_pin_desc *desc;
> -       u32 debounce;
> +       enum pin_config_param param =3D pinconf_to_config_param(config);
> +       u32 arg =3D pinconf_to_config_argument(config);
>
>         desc =3D (const struct mtk_pin_desc *)&hw->soc->pins[offset];
>
> -       if (!hw->eint ||
> -           pinconf_to_config_param(config) !=3D PIN_CONFIG_INPUT_DEBOUNC=
E ||
> -           desc->eint.eint_n =3D=3D EINT_NA)
> -               return -ENOTSUPP;
> +       if (param =3D=3D PIN_CONFIG_INPUT_DEBOUNCE) {
> +               if (!hw->eint || desc->eint.eint_n =3D=3D EINT_NA)
> +                       return -ENOTSUPP;
>
> -       debounce =3D pinconf_to_config_argument(config);
> +               return mtk_eint_set_debounce(hw->eint, desc->eint.eint_n,=
 arg);
> +       }
>
> -       return mtk_eint_set_debounce(hw->eint, desc->eint.eint_n, debounc=
e);
> +       return mtk_paris_pin_config_set(hw, offset, param, arg);
>  }
>
>  static int mtk_build_gpiochip(struct mtk_pinctrl *hw)
>
> --
> 2.47.0
>
>

