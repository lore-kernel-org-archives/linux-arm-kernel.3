Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB3AAC0219D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 08:26:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OmuftgvnuZZgHkOz1gVQFljvkOd+vXnZycbJ9gQVvqU=; b=eoDjyTm3y5tx/VMN6j8udzv28o
	zy3TpblW0WkG0oBKTD46LF+zq5K1hm7GsoWi0zhI9pv1WEaJyDIl1pu70ncOTRb0Wfgna0lZAWaNa
	tMo8lg9svp7Qxl0g7Z6CM00yUT4VsdqGfUJ/mTBUKnE5mv8HGVXEND0NtZhvkemMnWIbvGnZ8c5DL
	Z9pzN4j0DSWN9BEkSlMk0ueKCn2g/YabDDV+uOq7sKL5dBfT7NibwflrKke6wmqOMmUMfJ1qIEPDY
	cX9xAGYCRF/KLmY9hgxAtMraBJ8Y1jqCHLlmzfjryLBWc7R/pXnDhBLWL8sNBhQ1Z+0oSM1DbJO2e
	EPtHHKsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiUXn-0000000AGcZ-3jmh;
	Thu, 13 Feb 2025 08:25:59 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiUM4-0000000AEj9-16gg
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Feb 2025 08:13:53 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-5450cf3ebc2so514673e87.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Feb 2025 00:13:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1739434430; x=1740039230; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OmuftgvnuZZgHkOz1gVQFljvkOd+vXnZycbJ9gQVvqU=;
        b=hArZclN3BL3rwSq9dEpf8wBCe1P2c6GuPfnHC5XPZd6lLgVYMCtwngZ0CsS2iF1TEA
         bLFOmqiTyaKBbuSylKzqKg0CDWez93LexaJavAm0H7xwM1CDk5t5vICkxENSmZr2HETe
         R29jGxz4eOD8Zf8+88+uIO/qGWhpzsYl1Qa+R6ouDcFn+Cf4h2h24EmERnt/A1VuT3Rh
         ZSOqJN9dX2m7GqsMiAansCZUaNcZcu192eyrxdnba6htE+wuAeSN5G76QhmG5VZIz+/B
         83KKw1TRPomT1RFDZU6dyuoRxQoChSpDrTg7x4ZZo2RgpHZgOZY+6LSjALSlBKdBKvyh
         /y0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739434430; x=1740039230;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OmuftgvnuZZgHkOz1gVQFljvkOd+vXnZycbJ9gQVvqU=;
        b=aeJgEYOdbNl5QQ64dpGTGsX9I+FEYJIjHsLvjxVZtnnNq5Dg1rSxuMYWfszCeEYNYY
         TpQZOywqomGAoHj3dLaaCHG+30fURfyWpYgjQfggOoZHvRQUs8+aQa//rRj8hxKY5N/A
         4kBDt6CcZAzd59GOAwL7A4h6lzxrAxh/FLV46dyRpcAjEYyGrTKAaG0DZmtVHPteHyxt
         mS0hXAe+9Ya6P4zJJM4fx88m8p3cRoj3hB8fDEaxg+aN3LgmcfC6tG+X1BcM6Q/dTPZK
         KMGU1B1tgQ/+x3F3kt+YbNDykadPnzqkpQpCFsBXjc5Owr6Lg5MYbWuRZ04DIZ6kEubZ
         aLxA==
X-Forwarded-Encrypted: i=1; AJvYcCWT6MkDHZgv3+N/csxEdL4UdxPOT3RxgXnQbiUTh6u99ZFAZyEv+Q+E+5kActMxeAn8cMLMk/xs2mpogooh2U6r@lists.infradead.org
X-Gm-Message-State: AOJu0YzIPteZWce0f5Dbg1sieTuWZ+c7KU8/toDmUZOrOzcxlJWqL3x0
	roVTPmyO7Uo9VZEsaZAOG1hXAQjRhhC9Y5vOROpucQYjNNB6mekL0iAau/pu3MV2cB6+8R7IJc9
	ont/BrtZTiBQEITFRm8ZQTx0ij+bM2F4QnzNv
X-Gm-Gg: ASbGncttX/MbVBf5nYRB9nWQEIxPUI9quPZdfD3fmWkB6+GgAmBalL9SsICk+4SgrY6
	tCM1OlEi0yx2g25K6Pp1tdXxSeQzjDtF7f9sbaGtb2wnDORMRer3YaDfYqPqKRVDGb5FTlhA=
X-Google-Smtp-Source: AGHT+IHxDaK7ENYXtLhPy5Kf93LWj2N5S6iojG3fU8e+7THrJ3l9WM1h9CK9jmfpQxgM8xkKRYjCh9V5QtuuPWJHPGk=
X-Received: by 2002:a05:6512:ac7:b0:545:646:7519 with SMTP id
 2adb3069b0e04-54517f86d1fmr2003992e87.0.1739434430158; Thu, 13 Feb 2025
 00:13:50 -0800 (PST)
MIME-Version: 1.0
References: <20250120-scmi-fwdevlink-v2-0-3af2fa37dbac@nxp.com> <20250120-scmi-fwdevlink-v2-3-3af2fa37dbac@nxp.com>
In-Reply-To: <20250120-scmi-fwdevlink-v2-3-3af2fa37dbac@nxp.com>
From: Saravana Kannan <saravanak@google.com>
Date: Thu, 13 Feb 2025 00:13:13 -0800
X-Gm-Features: AWEUYZns82i0k5Ijag1LujAqT5WjKXUA5FWo3NR6_9wBOcWaDsE90ePdb8ZFdME
Message-ID: <CAGETcx9+BzSoHj54koiGniUOUPfY9yZ9cAedbb2A-hb+2D1sGw@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] pinctrl: freescale: scmi: Switch to use machine_allowlist
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>, Cristian Marussi <cristian.marussi@arm.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Dong Aisheng <aisheng.dong@nxp.com>, 
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Sascha Hauer <s.hauer@pengutronix.de>, arm-scmi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, imx@lists.linux.dev, Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_001352_312748_E679ED97 
X-CRM114-Status: GOOD (  17.45  )
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

On Sun, Jan 19, 2025 at 11:14=E2=80=AFPM Peng Fan (OSS) <peng.fan@oss.nxp.c=
om> wrote:
>
> From: Peng Fan <peng.fan@nxp.com>
>
> With machine_allowlist, only allowed machines have pinctrl imx scmi
> devices created. The fw_devlink will link consumer and supplier
> correctly.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/pinctrl/freescale/pinctrl-imx-scmi.c | 15 ++++++---------
>  1 file changed, 6 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/pinctrl/freescale/pinctrl-imx-scmi.c b/drivers/pinct=
rl/freescale/pinctrl-imx-scmi.c
> index 8f15c4c4dc4412dddb40505699fc3f459fdc0adc..058b4f0477039d57ddae06f38=
5ad809cbb4784d6 100644
> --- a/drivers/pinctrl/freescale/pinctrl-imx-scmi.c
> +++ b/drivers/pinctrl/freescale/pinctrl-imx-scmi.c
> @@ -287,11 +287,6 @@ scmi_pinctrl_imx_get_pins(struct scmi_pinctrl_imx *p=
mx, struct pinctrl_desc *des
>         return 0;
>  }
>
> -static const char * const scmi_pinctrl_imx_allowlist[] =3D {
> -       "fsl,imx95",
> -       NULL
> -};
> -
>  static int scmi_pinctrl_imx_probe(struct scmi_device *sdev)
>  {
>         struct device *dev =3D &sdev->dev;
> @@ -304,9 +299,6 @@ static int scmi_pinctrl_imx_probe(struct scmi_device =
*sdev)
>         if (!handle)
>                 return -EINVAL;
>
> -       if (!of_machine_compatible_match(scmi_pinctrl_imx_allowlist))
> -               return -ENODEV;
> -
>         pinctrl_ops =3D handle->devm_protocol_get(sdev, SCMI_PROTOCOL_PIN=
CTRL, &ph);
>         if (IS_ERR(pinctrl_ops))
>                 return PTR_ERR(pinctrl_ops);
> @@ -339,8 +331,13 @@ static int scmi_pinctrl_imx_probe(struct scmi_device=
 *sdev)
>         return pinctrl_enable(pmx->pctldev);
>  }
>
> +static const char * const scmi_pinctrl_imx_allowlist[] =3D {
> +       "fsl,imx95",
> +       NULL
> +};
> +
>  static const struct scmi_device_id scmi_id_table[] =3D {
> -       { SCMI_PROTOCOL_PINCTRL, "pinctrl-imx" },
> +       { SCMI_PROTOCOL_PINCTRL, "pinctrl-imx", NULL, scmi_pinctrl_imx_al=
lowlist },
>         { }
>  };
>  MODULE_DEVICE_TABLE(scmi, scmi_id_table);
>

Definite NACK to this. Please don't depend on indirect
conditions/flags. There's no guarantee that this check will hold true
in the future.

-Saravana

