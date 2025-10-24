Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44FC9CCD1BF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Oct 2025 02:16:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BI0Vwi2MFtORL9n5J5tJUkBs2QczZqahhbzv7dm+XZ4=; b=odR/DjYOq3PiFKlXzL3ZcSqMDs
	uJMhVGtFAxnRFQVF8j3qC4lPJNLOHDl32JFrt/MQQah9wggAwA7MPeWpTNNq9+O5hnm4Y+FoAocYO
	wrv1pAEQMc/QU92jZOcWyod14vuQxDDXT1dBVhJCxZ4Fkfjp1Sk4PPS5x+mvjWIZ/rO8MM2dFk6+c
	anJpA1EfaSaa6a+VzEQfpGzBnTdpFIfUwDOe1pfAAvXwROL2nDLkCC75epAAgT4kKQsvZ6InD+QRB
	WGumKJuv/iCyJftJT7ngy/T+ClJ3kKhlZWrbIyMN4rt3a+a3/ndgjGspkrgXo6Ylluw7GIhQh0KFv
	FGTewVXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC7LY-000000081Wf-0KQ2;
	Fri, 24 Oct 2025 02:16:04 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC7LW-000000081WI-08mG
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Oct 2025 02:16:03 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-33e0008d3b3so1613687a91.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Oct 2025 19:16:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761272161; x=1761876961; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BI0Vwi2MFtORL9n5J5tJUkBs2QczZqahhbzv7dm+XZ4=;
        b=levNMH+Wwxi/8tKwKmNzaqhSPm0+nbB4XJONxp/sCkiRgaYKh+bNea0Yk49UJX2u4Z
         X/OTxuYLNQcfa3IhA4+aptBQCDCuZrR8QLDMkM/4yoD6DenJ0u0hZeOdSNE7LEAnwb+3
         6+T48Iug+t1pdPtjiJHrqeBPldD1UhbnpIzASbatVeRGvOmve7kISKVxSMp1fc2EEtb3
         S/UPHYIvdlybIGbyKPVOvJmnUeokpNUCZScr5u5v6St5z96YkO41gleWq82XSNeekZm+
         QGjLG/MbRMfC7mLh7h6tjLVfG4LScTKV8G1onA/YgMfSob3x8zdbC7VMH/wbQhdnvvJu
         iqDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761272161; x=1761876961;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BI0Vwi2MFtORL9n5J5tJUkBs2QczZqahhbzv7dm+XZ4=;
        b=u3rKPVv+nb2ighnlXP9/BiXqOOHeglBWEx7MIZV7he5INIi7lr1DI76WIZJp1vrggo
         51+hpKjethxoch9TT4ItqbC6c09iCBS3dxXegrec8mmUkh0sxuHoLEg7N4HU8pfij92g
         yZvPKgg1eRUcNoOBQEn6GsjaY1OBYZ2Vm9XKHKP7DpXgBvrqLGFjaqVpb8nAwWAzzIiK
         J7oUMV+C5PQFFdKk0nounfz+tjsWQmaHBgDyi5sBE/Dy5OF0lIAoIjyRH/rEaB5CD17k
         AoI4kyKmrqxB0dF3veHYW2b83uA6HdJ78doD454STniXy8DpjqOAmAuN7Z5eGduoCNuU
         pdmw==
X-Forwarded-Encrypted: i=1; AJvYcCUzpIXBBDUbMB8I4lxD85xm5etk2w7l2776bpYQWFOjCi04Ucs2f0cgk2bziFYHmZIpnWN3HZhl/Urzh2gBO/yt@lists.infradead.org
X-Gm-Message-State: AOJu0Yzx90NzH/laclEGskOUpBqHPGWF2jBOArIFgzIrfgWl/tBr18ax
	eEqydLQO3kAw1+TkrBgmrz7azRIdziEML8TXfYXLnLBBpIYH+iAvG//5TdbgzoqLP3bs5wGi59L
	d5j1XbNTX7dQWEy7kolTZsJ8cZN4lN9Y=
X-Gm-Gg: ASbGnctys2v9J501yoazDT/KSQkAN/0wi9W7pby/NoykuqMnKtObdb2+4CbUwOk2RCK
	eG9ijJtOY+Uuq8xKuQUyW0RibLKpehbzy+snVrGTjNuHavwuVK629lSY3Fd49krLqiV9N9jKfCW
	MQ2Aoe7+o3PGb8lhXQKs0jyNdVwfaW65JDSyzrHxDlfVlnQ2QYhOjWKEQ7JKVceuMjzr3JPQeg5
	Kqbk3aYRnbTJa1RutorEgj2CZ8aPGltA9oHnk2NWj7Mn9Eo5tkEOX7zIxMl5XP9MhaHXNY=
X-Google-Smtp-Source: AGHT+IElNfoS47SY7t+lKBFv7+5KrhLxG98q130ySpWKzXc0GkoN0tmuT6t9nFhyiYXpfSO3SfnNJSOMNthXNwS/NDA=
X-Received: by 2002:a17:90b:1b50:b0:33b:d371:1131 with SMTP id
 98e67ed59e1d1-33fd66f565amr743481a91.34.1761272160901; Thu, 23 Oct 2025
 19:16:00 -0700 (PDT)
MIME-Version: 1.0
References: <20251024-auxiliary-v2-1-a353dc9e6b1a@nxp.com>
In-Reply-To: <20251024-auxiliary-v2-1-a353dc9e6b1a@nxp.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Fri, 24 Oct 2025 10:15:49 +0800
X-Gm-Features: AS18NWDZ9oaK7UwbUVQe-rbcE0CXdttwjA1LC6T8fVyGVAC_wDzugHZZMraTOl0
Message-ID: <CAA+D8AOF+3he6nV6yDRnept2Epo1yTZgJnn+P4H8hkktec5wEw@mail.gmail.com>
Subject: Re: [PATCH v2] clk: imx: imx8mp-audiomix: use devm_auxiliary_device_create()
 to simple code
To: Peng Fan <peng.fan@nxp.com>
Cc: Abel Vesa <abelvesa@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>, 
	Shengjiu Wang <shengjiu.wang@nxp.com>, Frank Li <frank.li@nxp.com>, linux-clk@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_191602_097709_D893B27D 
X-CRM114-Status: GOOD (  19.21  )
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

On Fri, Oct 24, 2025 at 9:46=E2=80=AFAM Peng Fan <peng.fan@nxp.com> wrote:
>
> Use helper function devm_auxiliary_device_create() to remove some
> boilerplate code.
>
> Reviewed-by: Abel Vesa <abel.vesa@linaro.org>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Reviewed-by: Shengjiu Wang <shengjiu.wang@gmail.com>

Best regards
Shengjiu wang
> ---
> Changes in v2:
> - Update commit log per Frank
> - Add R-b from Frank and Abel
> - Link to v1: https://lore.kernel.org/r/20251023-auxiliary-v1-1-0a16fa4c3=
cdd@nxp.com
> ---
>  drivers/clk/imx/clk-imx8mp-audiomix.c | 39 ++++-------------------------=
------
>  1 file changed, 4 insertions(+), 35 deletions(-)
>
> diff --git a/drivers/clk/imx/clk-imx8mp-audiomix.c b/drivers/clk/imx/clk-=
imx8mp-audiomix.c
> index 775f62dddb11d8cfd17a4ebf7a677ef399c5e617..131702f2c9ecfd693af47094f=
e61b486ae6e8f6d 100644
> --- a/drivers/clk/imx/clk-imx8mp-audiomix.c
> +++ b/drivers/clk/imx/clk-imx8mp-audiomix.c
> @@ -230,50 +230,19 @@ struct clk_imx8mp_audiomix_priv {
>
>  #if IS_ENABLED(CONFIG_RESET_CONTROLLER)
>
> -static void clk_imx8mp_audiomix_reset_unregister_adev(void *_adev)
> -{
> -       struct auxiliary_device *adev =3D _adev;
> -
> -       auxiliary_device_delete(adev);
> -       auxiliary_device_uninit(adev);
> -}
> -
> -static void clk_imx8mp_audiomix_reset_adev_release(struct device *dev)
> -{
> -       struct auxiliary_device *adev =3D to_auxiliary_dev(dev);
> -
> -       kfree(adev);
> -}
> -
>  static int clk_imx8mp_audiomix_reset_controller_register(struct device *=
dev,
>                                                          struct clk_imx8m=
p_audiomix_priv *priv)
>  {
> -       struct auxiliary_device *adev __free(kfree) =3D NULL;
> -       int ret;
> +       struct auxiliary_device *adev;
>
>         if (!of_property_present(dev->of_node, "#reset-cells"))
>                 return 0;
>
> -       adev =3D kzalloc(sizeof(*adev), GFP_KERNEL);
> +       adev =3D devm_auxiliary_device_create(dev, "reset", NULL);
>         if (!adev)
> -               return -ENOMEM;
> -
> -       adev->name =3D "reset";
> -       adev->dev.parent =3D dev;
> -       adev->dev.release =3D clk_imx8mp_audiomix_reset_adev_release;
> -
> -       ret =3D auxiliary_device_init(adev);
> -       if (ret)
> -               return ret;
> +               return -ENODEV;
>
> -       ret =3D auxiliary_device_add(adev);
> -       if (ret) {
> -               auxiliary_device_uninit(adev);
> -               return ret;
> -       }
> -
> -       return devm_add_action_or_reset(dev, clk_imx8mp_audiomix_reset_un=
register_adev,
> -                                       no_free_ptr(adev));
> +       return 0;
>  }
>
>  #else /* !CONFIG_RESET_CONTROLLER */
>
> ---
> base-commit: aaa9c3550b60d6259d6ea8b1175ade8d1242444e
> change-id: 20251023-auxiliary-3998bced9cb9
>
> Best regards,
> --
> Peng Fan <peng.fan@nxp.com>
>
>

