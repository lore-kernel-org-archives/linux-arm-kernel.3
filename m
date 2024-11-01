Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB2D6E674B0
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Nov 2024 07:58:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ijggQrqCp3VgpHcHOhod7fNcrpQe7wWt5axhaq9S/tE=; b=I9U+Flvm6zQA39//KBLup5BVnv
	a5EkiY9N0odzlYoaRfeXSW5tBfRJZeZej8dWQqBUF7Dm9qAtM2RKpY4B5e5L0XYM2+R9qEm/RjbQN
	0sEUGssbeVBEaVROkPcwAFc+k5EjotiII949evoqKyMdDU2Wzo0Bnv7YY6vpejKm6+jRKA4mvnAfs
	lYQbk0xQfQBvsgAZFRjMRt0VcdEI/Ap7GFOv+/a4X5mzdIqMOAiCr9Qruz5+qBG4jJpqcFxMzxSf9
	mD+Ned9ER5dhldTILN/VmGAnKohvXSO9shPjE9zwjCA6a3zoXcGywP6V7pWwPRnLN9IgwjeoRhvwt
	mGFWTgXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6mXk-00000006BfO-3q1l;
	Fri, 01 Nov 2024 07:58:05 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6mUE-00000006B9V-0gaV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Nov 2024 07:54:28 +0000
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-539e59dadebso2085933e87.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 01 Nov 2024 00:54:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1730447664; x=1731052464; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ijggQrqCp3VgpHcHOhod7fNcrpQe7wWt5axhaq9S/tE=;
        b=LwVyj16ywU98KRB2/UAJhVNUTTT+VUrrJRCRXD7vn8Bky3SUGSKlLjtI0nl/FO3FME
         CJB/MFYfEDdm5lNGVJDzVLAv2cx6xtXNdAiJzZvR4rjyNtM5hpdkdIi8k8QSJkxNi40I
         5wP6eEuFaDTsYn9bZaZy1j652wFE/rcBzAnxs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730447664; x=1731052464;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ijggQrqCp3VgpHcHOhod7fNcrpQe7wWt5axhaq9S/tE=;
        b=mDYmmc8Nq7bUgqO5VtEGBEISGN8T286Wl7SsMDYmCELApbFzRxj19po+k9cezziZYo
         wtlg05najuu50/q4RCL/Vje6pQuNFmXOV4T1qlbLkOGSAfCcKWDNDjfgOpJZQ6nk8mf/
         8smvQk8cU0/zKfuNoavXy1SELoPHzg8Lunn9My9rOHQreOJI0Ye75RZoa8aGc74wxX7n
         wE1x/iSZc76I42C2jPajQ5T1PsIq8GLqL5W4ogrxAEvN5KtzdcoVsg7oa7Eh/NCVPJgE
         KnyNtuPTbAWPkpGDBPRFG6ocfjQZbHis5bphStyUYDE1+ryvQJDyM3q22AXpCCoYcFXZ
         QtKA==
X-Forwarded-Encrypted: i=1; AJvYcCWsGEUzkTRdtWGwixZmO7vAcCK5OJEktnkYcCyUMWjS5YStTpZt1AfODECGvG4Sj52oMSb4B+BcSLgDgkryI1SI@lists.infradead.org
X-Gm-Message-State: AOJu0Ywjq5Q3lTWGqvG1ywJUuTk1DqgJSA3VjDCj7XXeH3XoA1PZqx2O
	VBL8WYtkCSC8cU9dl8mcyX/QyKq+Zy7ymiH/0KB9kHaWYqlmVGoW2bycJSUQLMtIKk2utHTgYbu
	ltpjUJ5mbOC1sOHRdM55Sa3K62npDXvc0Rw5ScELpHVNftx4yGw==
X-Google-Smtp-Source: AGHT+IGVU/lUXWWbYrSDow1cLQ0HI1sHWadRX6pTuTRsABm++WDQNv3dQ9oZlPSltO0k3eA9d3yRfGI6TbGat6Vgmmw=
X-Received: by 2002:a05:6512:b22:b0:539:e8c6:7c1c with SMTP id
 2adb3069b0e04-53b348f9d60mr10821100e87.20.1730447664142; Fri, 01 Nov 2024
 00:54:24 -0700 (PDT)
MIME-Version: 1.0
References: <20241025-kselftest-gpio-set-get-config-v2-0-040d748840bb@collabora.com>
 <20241025-kselftest-gpio-set-get-config-v2-2-040d748840bb@collabora.com>
In-Reply-To: <20241025-kselftest-gpio-set-get-config-v2-2-040d748840bb@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 1 Nov 2024 15:54:12 +0800
Message-ID: <CAGXv+5EW+eo6yM0YCPikHLQeh0H26RJ5TC5Mf2NxmB1e_teRSw@mail.gmail.com>
Subject: Re: [PATCH RFC v2 2/5] pinctrl: mediatek: moore: Expose more
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
X-CRM114-CacheID: sfid-20241101_005426_277507_7E56410F 
X-CRM114-Status: GOOD (  24.25  )
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

On Sat, Oct 26, 2024 at 4:14=E2=80=AFAM N=C3=ADcolas F. R. A. Prado
<nfraprado@collabora.com> wrote:
>
> Currently the set_config callback in the gpio_chip registered by the
> pinctrl_moore driver only supports configuring a single parameter on
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
>  drivers/pinctrl/mediatek/pinctrl-moore.c | 283 ++++++++++++++++---------=
------
>  1 file changed, 144 insertions(+), 139 deletions(-)
>
> diff --git a/drivers/pinctrl/mediatek/pinctrl-moore.c b/drivers/pinctrl/m=
ediatek/pinctrl-moore.c
> index aad4891223d3e060431a990bfabb6bd2cbb82087..de3494e9f228cef7f2eadf6a6=
ea2b3b708f1fb25 100644
> --- a/drivers/pinctrl/mediatek/pinctrl-moore.c
> +++ b/drivers/pinctrl/mediatek/pinctrl-moore.c
> @@ -246,156 +246,160 @@ static int mtk_pinconf_get(struct pinctrl_dev *pc=
tldev,
>         return 0;
>  }
>
> -static int mtk_pinconf_set(struct pinctrl_dev *pctldev, unsigned int pin=
,
> -                          unsigned long *configs, unsigned int num_confi=
gs)
> +static int mtk_moore_pin_config_set(struct mtk_pinctrl *hw, unsigned int=
 pin,
> +                                   enum pin_config_param param, u32 arg)
>  {
> -       struct mtk_pinctrl *hw =3D pinctrl_dev_get_drvdata(pctldev);
>         const struct mtk_pin_desc *desc;
> -       u32 reg, param, arg;
> -       int cfg, err =3D 0;
> +       u32 reg;
> +       int err =3D 0;
>
>         desc =3D (const struct mtk_pin_desc *)&hw->soc->pins[pin];
>         if (!desc->name)
>                 return -ENOTSUPP;
>
> -       for (cfg =3D 0; cfg < num_configs; cfg++) {
> -               param =3D pinconf_to_config_param(configs[cfg]);
> -               arg =3D pinconf_to_config_argument(configs[cfg]);
> -
> -               switch (param) {
> -               case PIN_CONFIG_BIAS_DISABLE:
> -                       if (hw->soc->bias_set_combo) {
> -                               err =3D hw->soc->bias_set_combo(hw, desc,=
 0, MTK_DISABLE);
> -                               if (err)
> -                                       return err;
> -                       } else if (hw->soc->bias_disable_set) {
> -                               err =3D hw->soc->bias_disable_set(hw, des=
c);
> -                               if (err)
> -                                       return err;
> -                       } else {
> -                               return -ENOTSUPP;
> -                       }
> -                       break;
> -               case PIN_CONFIG_BIAS_PULL_UP:
> -                       if (hw->soc->bias_set_combo) {
> -                               err =3D hw->soc->bias_set_combo(hw, desc,=
 1, arg);
> -                               if (err)
> -                                       return err;
> -                       } else if (hw->soc->bias_set) {
> -                               err =3D hw->soc->bias_set(hw, desc, 1);
> -                               if (err)
> -                                       return err;
> -                       } else {
> -                               return -ENOTSUPP;
> -                       }
> -                       break;
> -               case PIN_CONFIG_BIAS_PULL_DOWN:
> -                       if (hw->soc->bias_set_combo) {
> -                               err =3D hw->soc->bias_set_combo(hw, desc,=
 0, arg);
> -                               if (err)
> -                                       return err;
> -                       } else if (hw->soc->bias_set) {
> -                               err =3D hw->soc->bias_set(hw, desc, 0);
> -                               if (err)
> -                                       return err;
> -                       } else {
> -                               return -ENOTSUPP;
> -                       }
> -                       break;
> -               case PIN_CONFIG_OUTPUT_ENABLE:
> -                       err =3D mtk_hw_set_value(hw, desc, PINCTRL_PIN_RE=
G_SMT,
> -                                              MTK_DISABLE);
> -                       if (err)
> -                               goto err;
> -
> -                       err =3D mtk_hw_set_value(hw, desc, PINCTRL_PIN_RE=
G_DIR,
> -                                              MTK_OUTPUT);
> +       switch ((u32)param) {
> +       case PIN_CONFIG_BIAS_DISABLE:
> +               if (hw->soc->bias_set_combo) {
> +                       err =3D hw->soc->bias_set_combo(hw, desc, 0, MTK_=
DISABLE);
>                         if (err)
> -                               goto err;
> -                       break;
> -               case PIN_CONFIG_INPUT_ENABLE:
> -
> -                       if (hw->soc->ies_present) {
> -                               mtk_hw_set_value(hw, desc, PINCTRL_PIN_RE=
G_IES,
> -                                                MTK_ENABLE);
> -                       }
> -
> -                       err =3D mtk_hw_set_value(hw, desc, PINCTRL_PIN_RE=
G_DIR,
> -                                              MTK_INPUT);
> +                               return err;
> +               } else if (hw->soc->bias_disable_set) {
> +                       err =3D hw->soc->bias_disable_set(hw, desc);
>                         if (err)
> -                               goto err;
> -                       break;
> -               case PIN_CONFIG_SLEW_RATE:
> -                       err =3D mtk_hw_set_value(hw, desc, PINCTRL_PIN_RE=
G_SR,
> -                                              arg);
> +                               return err;
> +               } else {
> +                       return -ENOTSUPP;
> +               }
> +               break;
> +       case PIN_CONFIG_BIAS_PULL_UP:
> +               if (hw->soc->bias_set_combo) {
> +                       err =3D hw->soc->bias_set_combo(hw, desc, 1, arg)=
;
>                         if (err)
> -                               goto err;
> -
> -                       break;
> -               case PIN_CONFIG_OUTPUT:
> -                       err =3D mtk_hw_set_value(hw, desc, PINCTRL_PIN_RE=
G_DIR,
> -                                              MTK_OUTPUT);
> +                               return err;
> +               } else if (hw->soc->bias_set) {
> +                       err =3D hw->soc->bias_set(hw, desc, 1);
>                         if (err)
> -                               goto err;
> -
> -                       err =3D mtk_hw_set_value(hw, desc, PINCTRL_PIN_RE=
G_DO,
> -                                              arg);
> +                               return err;
> +               } else {
> +                       return -ENOTSUPP;
> +               }
> +               break;
> +       case PIN_CONFIG_BIAS_PULL_DOWN:
> +               if (hw->soc->bias_set_combo) {
> +                       err =3D hw->soc->bias_set_combo(hw, desc, 0, arg)=
;
>                         if (err)
> -                               goto err;
> -                       break;
> -               case PIN_CONFIG_INPUT_SCHMITT_ENABLE:
> -                       /* arg =3D 1: Input mode & SMT enable ;
> -                        * arg =3D 0: Output mode & SMT disable
> -                        */
> -                       arg =3D arg ? 2 : 1;
> -                       err =3D mtk_hw_set_value(hw, desc, PINCTRL_PIN_RE=
G_DIR,
> -                                              arg & 1);
> +                               return err;
> +               } else if (hw->soc->bias_set) {
> +                       err =3D hw->soc->bias_set(hw, desc, 0);
>                         if (err)
> -                               goto err;
> +                               return err;
> +               } else {
> +                       return -ENOTSUPP;
> +               }
> +               break;
> +       case PIN_CONFIG_OUTPUT_ENABLE:
> +               err =3D mtk_hw_set_value(hw, desc, PINCTRL_PIN_REG_SMT, M=
TK_DISABLE);
> +               if (err)
> +                       return err;
> +
> +               err =3D mtk_hw_set_value(hw, desc, PINCTRL_PIN_REG_DIR, M=
TK_OUTPUT);
> +               if (err)
> +                       return err;
> +               break;
> +       case PIN_CONFIG_INPUT_ENABLE:
> +
> +               if (hw->soc->ies_present) {
> +                       mtk_hw_set_value(hw, desc, PINCTRL_PIN_REG_IES, M=
TK_ENABLE);
> +               }
> +
> +               err =3D mtk_hw_set_value(hw, desc, PINCTRL_PIN_REG_DIR, M=
TK_INPUT);
> +               if (err)
> +                       return err;
> +               break;
> +       case PIN_CONFIG_SLEW_RATE:
> +               err =3D mtk_hw_set_value(hw, desc, PINCTRL_PIN_REG_SR, ar=
g);
> +               if (err)
> +                       return err;
> +
> +               break;
> +       case PIN_CONFIG_OUTPUT:
> +               err =3D mtk_hw_set_value(hw, desc, PINCTRL_PIN_REG_DIR, M=
TK_OUTPUT);
> +               if (err)
> +                       return err;
> +
> +               err =3D mtk_hw_set_value(hw, desc, PINCTRL_PIN_REG_DO, ar=
g);
> +               if (err)
> +                       return err;
> +               break;
> +       case PIN_CONFIG_INPUT_SCHMITT_ENABLE:
> +               /* arg =3D 1: Input mode & SMT enable ;
> +                * arg =3D 0: Output mode & SMT disable
> +                */
> +               arg =3D arg ? 2 : 1;
> +               err =3D mtk_hw_set_value(hw, desc, PINCTRL_PIN_REG_DIR, a=
rg & 1);
> +               if (err)
> +                       return err;
>
> -                       err =3D mtk_hw_set_value(hw, desc, PINCTRL_PIN_RE=
G_SMT,
> -                                              !!(arg & 2));
> +               err =3D mtk_hw_set_value(hw, desc, PINCTRL_PIN_REG_SMT, !=
!(arg & 2));
> +               if (err)
> +                       return err;
> +               break;
> +       case PIN_CONFIG_DRIVE_STRENGTH:
> +               if (hw->soc->drive_set) {
> +                       err =3D hw->soc->drive_set(hw, desc, arg);
>                         if (err)
> -                               goto err;
> -                       break;
> -               case PIN_CONFIG_DRIVE_STRENGTH:
> -                       if (hw->soc->drive_set) {
> -                               err =3D hw->soc->drive_set(hw, desc, arg)=
;
> -                               if (err)
> -                                       return err;
> -                       } else {
> -                               err =3D -ENOTSUPP;
> -                       }
> -                       break;
> -               case MTK_PIN_CONFIG_TDSEL:
> -               case MTK_PIN_CONFIG_RDSEL:
> -                       reg =3D (param =3D=3D MTK_PIN_CONFIG_TDSEL) ?
> -                              PINCTRL_PIN_REG_TDSEL : PINCTRL_PIN_REG_RD=
SEL;
> -
> -                       err =3D mtk_hw_set_value(hw, desc, reg, arg);
> +                               return err;
> +               } else {
> +                       return -ENOTSUPP;
> +               }
> +               break;
> +       case MTK_PIN_CONFIG_TDSEL:
> +       case MTK_PIN_CONFIG_RDSEL:
> +               reg =3D (param =3D=3D MTK_PIN_CONFIG_TDSEL) ?
> +                      PINCTRL_PIN_REG_TDSEL : PINCTRL_PIN_REG_RDSEL;
> +
> +               err =3D mtk_hw_set_value(hw, desc, reg, arg);
> +               if (err)
> +                       return err;
> +               break;
> +       case MTK_PIN_CONFIG_PU_ADV:
> +       case MTK_PIN_CONFIG_PD_ADV:
> +               if (hw->soc->adv_pull_set) {
> +                       bool pullup;
> +
> +                       pullup =3D param =3D=3D MTK_PIN_CONFIG_PU_ADV;
> +                       err =3D hw->soc->adv_pull_set(hw, desc, pullup, a=
rg);
>                         if (err)
> -                               goto err;
> -                       break;
> -               case MTK_PIN_CONFIG_PU_ADV:
> -               case MTK_PIN_CONFIG_PD_ADV:
> -                       if (hw->soc->adv_pull_set) {
> -                               bool pullup;
> -
> -                               pullup =3D param =3D=3D MTK_PIN_CONFIG_PU=
_ADV;
> -                               err =3D hw->soc->adv_pull_set(hw, desc, p=
ullup,
> -                                                           arg);
> -                               if (err)
> -                                       return err;
> -                       } else {
> -                               return -ENOTSUPP;
> -                       }
> -                       break;
> -               default:
> -                       err =3D -ENOTSUPP;
> +                               return err;
> +               } else {
> +                       return -ENOTSUPP;
>                 }
> +               break;
> +       default:
> +               return -ENOTSUPP;
> +       }
> +
> +       return 0;
> +}
> +
> +static int mtk_pinconf_set(struct pinctrl_dev *pctldev, unsigned int pin=
,
> +                          unsigned long *configs, unsigned int num_confi=
gs)
> +{
> +       struct mtk_pinctrl *hw =3D pinctrl_dev_get_drvdata(pctldev);
> +       enum pin_config_param param;
> +       int cfg, err =3D 0;
> +       u32 arg;
> +
> +       for (cfg =3D 0; cfg < num_configs; cfg++) {
> +               param =3D pinconf_to_config_param(configs[cfg]);
> +               arg =3D pinconf_to_config_argument(configs[cfg]);
> +
> +               err =3D mtk_moore_pin_config_set(hw, pin, param, arg);
> +               if (err)
> +                       return err;
>         }
> -err:
> -       return err;
> +
> +       return 0;
>  }
>
>  static int mtk_pinconf_group_get(struct pinctrl_dev *pctldev,
> @@ -539,20 +543,21 @@ static int mtk_gpio_set_config(struct gpio_chip *ch=
ip, unsigned int offset,
>  {
>         struct mtk_pinctrl *hw =3D gpiochip_get_data(chip);
>         const struct mtk_pin_desc *desc;
> -       u32 debounce;
> +       enum pin_config_param param =3D pinconf_to_config_param(config);
> +       u32 arg =3D pinconf_to_config_argument(config);
>
>         desc =3D (const struct mtk_pin_desc *)&hw->soc->pins[offset];
>         if (!desc->name)
>                 return -ENOTSUPP;
>
> -       if (!hw->eint ||
> -           pinconf_to_config_param(config) !=3D PIN_CONFIG_INPUT_DEBOUNC=
E ||
> -           desc->eint.eint_n =3D=3D (u16)EINT_NA)
> -               return -ENOTSUPP;
> +       if (param =3D=3D PIN_CONFIG_INPUT_DEBOUNCE) {
> +               if (!hw->eint || desc->eint.eint_n =3D=3D (u16)EINT_NA)
> +                       return -ENOTSUPP;
>
> -       debounce =3D pinconf_to_config_argument(config);
> +               return mtk_eint_set_debounce(hw->eint, desc->eint.eint_n,=
 arg);
> +       }
>
> -       return mtk_eint_set_debounce(hw->eint, desc->eint.eint_n, debounc=
e);
> +       return mtk_moore_pin_config_set(hw, offset, param, arg);
>  }
>
>  static int mtk_build_gpiochip(struct mtk_pinctrl *hw)
>
> --
> 2.47.0
>
>

