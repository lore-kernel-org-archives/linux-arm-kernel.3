Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA6E4C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 08:26:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ma6hRKfHVcSKvMZ+W9JmQfxRE3jzj/ex/cWYq7xYV30=; b=zaBTizwIWiQCD2Qe1OE0jmxzDS
	1SLPXfTiqYa2XOiYKrbNYnDsz08vw+/F19jcS7mIXZa5Y3H7fV9SDHzj3Y7Q5oIM+Pv/WHKcwPb1E
	J1bzXn2brWSMXtQgky5NGE09cR1WtBpNVBnckpm/FQfnkeARPOzQhT/HTyZs4mVzVI/QgyYnzkH8k
	DzIknh3N8gaeg7A2GQHKALWG5mv8g9jdOJU76i5lpkY9s0bf+sH8lAScTsyaG9RTMBUYyTYqdn5/T
	nGnRGKKUTMxpT3hb83zYEwcGmZFNgRzLN26IQuuWBquxqaIuSnqNfNC5JmACYGzFEw45GWJcVqTR7
	LbX33pHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whk5s-00000001PfG-0Oqd;
	Thu, 09 Jul 2026 08:26:52 +0000
Received: from mail-yx1-xb12f.google.com ([2607:f8b0:4864:20::b12f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whk5p-00000001Pda-137O
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 08:26:50 +0000
Received: by mail-yx1-xb12f.google.com with SMTP id 956f58d0204a3-6676fc59e59so2054801d50.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Jul 2026 01:26:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783585608; cv=none;
        d=google.com; s=arc-20260327;
        b=ex8yv6gMt2GJaCodEo8jfvtTFs1DhJa9aLcWJWnCv8+V+I8GWgugMIziMoqAQKPvDu
         jEUm6wcAdxtXI9sAuCyrC9Vr2kg7C5PIIyiKz/z0+sOAbXuyxZCLmg+4OpoaKIIVsd88
         0MyL2mtbmT/l21dZjsMpbaQN9TFfMzQhQQ919gvaia6TfoUfv13ilyWuFeZEVEuz3F1N
         Izbu6lI3zd83uh621BMXPJ93XnE++EHmLLZP1byKz14ChX1RVy17w5JzlAqAeT/ftEEc
         pKiaeClrqKothlGN2E1XIGb9T2SGMGg0kfbmaifoUt3F/w3xKa0cT2Lpz9SMfks+2qoK
         2qfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ma6hRKfHVcSKvMZ+W9JmQfxRE3jzj/ex/cWYq7xYV30=;
        fh=GADl/izokGjyfq2K3V/up5LyA1byyOIu8+VkaezNc/w=;
        b=Y607TPdkv7gynuB+PVk6fFYGXV9QZX9RYOW8/j4Q8UBZrDWfvlsxYFzkcvP8H3CLBg
         Fu/ii/dl3X1eYrElYbyMB+sdrWf/VIEfERiFloxq7SCUzKVEf3UQemi3mATDMfPLCNx+
         LV6s8qenAKMftuzva2zQDXXe8vb5CEO97w3P0KMSJGJJ8hAhThKLmzMsPUl+3Ux2aPhB
         sRUIVOLc5yp3aTEsf/p3JDYMkWkytpN4+mCAdgJEb204EA0l/HnQaKv+Ob4S3BE9QTke
         xrcOfafBVT4tGGLJBfcfvjdqZ8zN1lE7zFjtUUn1klrHlnWkbTT9DsZvuuTUc3DfupX3
         KDTA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1783585608; x=1784190408; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ma6hRKfHVcSKvMZ+W9JmQfxRE3jzj/ex/cWYq7xYV30=;
        b=QbhGtt4FZzXgmXIoN4REyHSnskNaZFFblPeb8adsVft/BUIX+6c+qKkFMcztPfLlvH
         3sjkbXoj4v1hFXAktrf7uYXrHaiWtUTAJ5iFEgQPeWbVjsN0HRuwF9gzZ7PaOHmGFmc/
         1VcJgqunSdeecLOtMA6PkptLFLXy2DYQMjsVE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783585608; x=1784190408;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ma6hRKfHVcSKvMZ+W9JmQfxRE3jzj/ex/cWYq7xYV30=;
        b=iUFbxxaKnjfmu4yLtXlAPdfVTGczlVuWn+UMQRxNh0eTlBpSEWsNRCTGE3RmBbVlym
         drDPC36B/iAlk/WAAvQy8s8du2+lGoOtkLeHTBTvcnn0yR16UYbM5RjkqcOyhGcI3nvq
         o+XGufuAyiNY0b5SHE53+i6RXr+yIQZUHpSt5K6mv1habmhpmRbR621LJ699Ho8IRBQ3
         Xz2UpgU7C35oi+KOKcuiYquSI9a05P4Fg8w9lzfLck+RtBVPpBSL3rD1o4KWND6+VylC
         JNtaADcjqFB38yIW/WRg/7szZTafUPqTPy2/8gYDUiBYZre1I25bnA6nVrgDd7OxFRPE
         sVrw==
X-Forwarded-Encrypted: i=1; AHgh+RrMg5N0clvd3LWVI7T+jfK6RFXl0mwpeD5U1q1flF3u6O07oipJZuRsKs/v4AGovXXQWCgATUAZOqHyHSAFcJ4V@lists.infradead.org
X-Gm-Message-State: AOJu0Yzxlrij1/SMnh10b2ZatDZpkPWruRSYAPistnR5khNonZr4fYQX
	wfk9eJIt+hwIrO/yIqWk2jxYrVW/zA/MMyhilJ/yrFe7XA9/MggASYMPQjiv+zCcP3DAs5OwEMF
	CHSuvdnu/n/HQ1h0s3trJ9RJpzO6FfzScq6uaJSM2
X-Gm-Gg: AfdE7cmjt6+mSYUujTrtI4GH8mS2t2xvGujg1ws8qLotDpxBtTXknqRHBSMZyYvUDeV
	Tie/2ofton8eGyJMAhED4XM5GeyLKM7oBkhwhDU7SZA9u4r9IVeeon/ZfXYJg2/BRvr0ejnmgKz
	gKFw9gldxDPhkrRbht4SJf4zzd9qSvnsilw9XMTJ3PZRB/eJliizsriOxAviiy0f78mOqIsxtP9
	lO7UbhZv+bBchbHiodhb1qvRnC+TpOAovgdbQVSPspoC7uFlMrCW+5NTlneeADKA7mIZuSZi++J
	1Jig5K6oINxZidVj6J1VnJBVzKg=
X-Received: by 2002:a05:690e:4382:b0:667:8b91:240f with SMTP id
 956f58d0204a3-6679f1f6a3cmr3478844d50.86.1783585607965; Thu, 09 Jul 2026
 01:26:47 -0700 (PDT)
MIME-Version: 1.0
References: <20260709063450.1615041-1-justin.yeh@mediatek.com> <20260709063450.1615041-2-justin.yeh@mediatek.com>
In-Reply-To: <20260709063450.1615041-2-justin.yeh@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 9 Jul 2026 16:26:36 +0800
X-Gm-Features: AUfX_mz-SC1jbPIc5jRR2EosAZtRTmwf_K_gSweOzyKAAmx00VXSsHTmWBxIzq0
Message-ID: <CAGXv+5HQLzZeoHue=uziuijpu6OiLHXnW8NiwY8j7aggGKt2Yw@mail.gmail.com>
Subject: Re: [PATCH v5 1/4] pinctrl: mediatek: use devm_gpiochip_add_data()
 for GPIO chip
To: Justin Yeh <justin.yeh@mediatek.com>
Cc: Sean Wang <sean.wang@kernel.org>, Linus Walleij <linusw@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Project_Global_Chrome_Upstream_Group@mediatek.com, 
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_012649_292273_CF7350E1 
X-CRM114-Status: GOOD (  24.75  )
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

On Thu, Jul 9, 2026 at 2:35=E2=80=AFPM Justin Yeh <justin.yeh@mediatek.com>=
 wrote:
>
> The gpio_chip is allocated with device-managed memory but registered with
> the non-managed gpiochip_add_data(). This was harmless while the drivers
> were built-in, but once they can be built as modules and unbound/rmmod'd,
> devm frees the gpio_chip's memory while it is still registered, causing a
> use-after-free.
>
> Register it with devm_gpiochip_add_data() so it shares the same
> device-managed lifecycle, which also lets the manual gpiochip_remove()
> error paths go away.
>
> Fixes: a6df410d420a ("pinctrl: mediatek: Add Pinctrl/GPIO driver for mt81=
35.")
> Fixes: 805250982bb5 ("pinctrl: mediatek: add pinctrl-paris that implement=
s the vendor dt-bindings")
> Fixes: e78d57b2f87c ("pinctrl: mediatek: add pinctrl-moore that implement=
s the generic pinctrl dt-bindings")
> Signed-off-by: Justin Yeh <justin.yeh@mediatek.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

But see below.

> ---
>  drivers/pinctrl/mediatek/pinctrl-moore.c      |  6 ++----
>  drivers/pinctrl/mediatek/pinctrl-mtk-common.c | 14 ++++----------
>  drivers/pinctrl/mediatek/pinctrl-paris.c      |  2 +-
>  3 files changed, 7 insertions(+), 15 deletions(-)
>
> diff --git a/drivers/pinctrl/mediatek/pinctrl-moore.c b/drivers/pinctrl/m=
ediatek/pinctrl-moore.c
> index 17e30f83dc19..38f15dbe9a28 100644
> --- a/drivers/pinctrl/mediatek/pinctrl-moore.c
> +++ b/drivers/pinctrl/mediatek/pinctrl-moore.c
> @@ -594,7 +594,7 @@ static int mtk_build_gpiochip(struct mtk_pinctrl *hw)
>         chip->base              =3D -1;
>         chip->ngpio             =3D hw->soc->npins;
>
> -       ret =3D gpiochip_add_data(chip, hw);
> +       ret =3D devm_gpiochip_add_data(hw->dev, chip, hw);
>         if (ret < 0)
>                 return ret;
>
> @@ -608,10 +608,8 @@ static int mtk_build_gpiochip(struct mtk_pinctrl *hw=
)
>         if (!of_property_present(hw->dev->of_node, "gpio-ranges")) {
>                 ret =3D gpiochip_add_pin_range(chip, dev_name(hw->dev), 0=
, 0,
>                                              chip->ngpio);
> -               if (ret < 0) {
> -                       gpiochip_remove(chip);
> +               if (ret < 0)
>                         return ret;
> -               }
>         }
>
>         return 0;
> diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common.c b/drivers/pinc=
trl/mediatek/pinctrl-mtk-common.c
> index dd2c8aa03938..791eddd7a2c6 100644
> --- a/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
> +++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
> @@ -1130,30 +1130,24 @@ int mtk_pctrl_init(struct platform_device *pdev,
>         pctl->chip->parent =3D &pdev->dev;
>         pctl->chip->base =3D -1;
>
> -       ret =3D gpiochip_add_data(pctl->chip, pctl);
> +       ret =3D devm_gpiochip_add_data(&pdev->dev, pctl->chip, pctl);
>         if (ret)
>                 return -EINVAL;
>
>         /* Register the GPIO to pin mappings. */
>         ret =3D gpiochip_add_pin_range(pctl->chip, dev_name(&pdev->dev),
>                         0, 0, pctl->devdata->npins);
> -       if (ret) {
> -               ret =3D -EINVAL;
> -               goto chip_error;
> -       }
> +       if (ret)
> +               return -EINVAL;
>
>         /* Only initialize EINT if we have EINT pins */
>         if (data->eint_hw.ap_num > 0) {
>                 ret =3D mtk_eint_init(pctl, pdev);

I think you would also need some matching cleanup function for mtk_eint_ini=
t()
or you end up with a dangling IRQ domain and mappings that are active but
have invalid chain handlers.

This would probably be a separate patch.

>                 if (ret)
> -                       goto chip_error;
> +                       return ret;
>         }
>
>         return 0;
> -
> -chip_error:
> -       gpiochip_remove(pctl->chip);
> -       return ret;
>  }
>
>  int mtk_pctrl_common_probe(struct platform_device *pdev)
> diff --git a/drivers/pinctrl/mediatek/pinctrl-paris.c b/drivers/pinctrl/m=
ediatek/pinctrl-paris.c
> index 23f04b24fd65..09098b68f725 100644
> --- a/drivers/pinctrl/mediatek/pinctrl-paris.c
> +++ b/drivers/pinctrl/mediatek/pinctrl-paris.c
> @@ -957,7 +957,7 @@ static int mtk_build_gpiochip(struct mtk_pinctrl *hw)
>         chip->base              =3D -1;
>         chip->ngpio             =3D hw->soc->npins;
>
> -       ret =3D gpiochip_add_data(chip, hw);
> +       ret =3D devm_gpiochip_add_data(hw->dev, chip, hw);
>         if (ret < 0)
>                 return ret;
>
> --
> 2.45.2
>
>

