Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2AE9C982D0
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 20 Sep 2026 09:51:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SjYJbPqlOSw/5GKAWiHuamoPBcbEI2Y/L8HWn+XiZW0=; b=DMGlmO1ZSPn1kj
	Pny8Jnr6aRRIt5iZ5sM5wOaerj3JkS8ZI1aAW66lr4or/NxniNMtISz0NQsb5hEVeQzHEWSLm2ZKn
	76ROvJqUSWC8L3rq/WigqfE4DOdj9DgYB+FzHchcEAORLV7ciYHQZTmj47sLbZ/eVW9JK9dGCGKWC
	+IfBxgew+vFqMOXzQh8bvGD8DjWwzkiSq/CKt2b+jdkqGCMuwv4rOaMrTxkDWu5TP+QqcZY1eDnbj
	t0kEm4cj52PERI43/D5g4V2rZMeaT6JdiVD2pFyzBrMKg/UiSVS75zGwVIvLHK+ywgNcp9ieJjniU
	Nfk1I2UQ4STUI3fsOR0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8ECL-0000000HDJk-3ZH2;
	Sun, 20 Sep 2026 09:51:01 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8ECI-0000000HDJR-3Xih
	for linux-arm-kernel@lists.infradead.org;
	Sun, 20 Sep 2026 09:50:58 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 396E76022C
	for <linux-arm-kernel@lists.infradead.org>; Sun, 20 Sep 2026 09:50:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E33D21F00893
	for <linux-arm-kernel@lists.infradead.org>; Sun, 20 Sep 2026 09:50:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789897855;
	bh=SjYJbPqlOSw/5GKAWiHuamoPBcbEI2Y/L8HWn+XiZW0=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=jq2xHSG6KxF751GPakxt7ulzGYJ+uhk6NuIEjm3nqg9F+qqcxgZCxxlZW/8DHYSNc
	 xq5DMDZuf2CmPKJyiV4NZd4UVZZBaUI1uTbJe0asfGSvLdr454bEctYE7yguxNGh5u
	 H4MT1PqX3yi0nrvtq7P/L6bnlJFQZwzfGkAaXxTaKcKnWs1dpx0d41H8Ruc1J3u6V2
	 GhH1Z+LkTg/ZJBYIz+HQHf4tb4xWs43jOf+TuE/xMtytSUa1qllafst6r5o1JRSn/b
	 MW8uv7+X6LMiI6+iMqvI+0MoWF7FLag46rR2Be77sUp2J5KhBATQ4p7D3KSFMp/DVn
	 FdBYWcgGGWpyw==
Received: by mail-lr2-f12.google.com with SMTP id 38308e7fff4ca-3a30521ef15so14534861fa.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 20 Sep 2026 02:50:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBw3JfNDTCrnoQXLSmBgJ8DIEditB9rifis16M4PcP3lMbptmWirZELkX0BWCTAkkeBQ3N7L6Slp30xUyI3M0N7k@lists.infradead.org
X-Gm-Message-State: AFuF++nMx1clpSsj9p4iepUlsZRR1p+RNe7V8W5mLBnYRb7p0YE59bOZ
	Efhtxi7l33IbOwqv8DHXRffMVBAcXyyHSBtP7eWbX7q0W/wKn+o9+cbtnOffMp1UH/GW3Rcm+PV
	FTk3TIKmaN6nBwI1XmovPA4B4jSite3s=
X-Received: by 2002:a05:651c:1543:b0:3a3:7741:b43c with SMTP id
 38308e7fff4ca-3a5fbf06931mr15872001fa.7.1789897854214; Sun, 20 Sep 2026
 02:50:54 -0700 (PDT)
MIME-Version: 1.0
References: <20260913145527.18148-1-iuncuim@gmail.com> <20260913145527.18148-4-iuncuim@gmail.com>
In-Reply-To: <20260913145527.18148-4-iuncuim@gmail.com>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Sun, 20 Sep 2026 17:50:41 +0800
X-Gmail-Original-Message-ID: <CAGb2v67jmSPeKD-kr2MsASJy7v5Mqw+FBOvX9ziE__-35W6EJA@mail.gmail.com>
X-Gm-Features: AcwNN1XesilYUDb2NviAIFfSkaFxFlN66gg2pfogUxTJxiboh6rzWf-zN1gPLSI
Message-ID: <CAGb2v67jmSPeKD-kr2MsASJy7v5Mqw+FBOvX9ziE__-35W6EJA@mail.gmail.com>
Subject: Re: [PATCH v6 3/5] thermal/drivers/sun8i: get calibration data from
 two nvmem cells
To: Mikhail Kalashnikov <iuncuim@gmail.com>
Cc: Vasily Khoruzhick <anarsoul@gmail.com>, Yangtao Li <tiny.windzz@gmail.com>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@kernel.org>, 
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, linux-pm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Philipp Zabel <p.zabel@pengutronix.de>, 
	=?UTF-8?Q?Juan_Manuel_L=C3=B3pez_Carrillo?= <juanmanuellopezcarrillo@gmail.com>, 
	Andre Przywara <andre.przywara@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Reply-To: wens@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Sun, Sep 13, 2026 at 10:56=E2=80=AFPM Mikhail Kalashnikov <iuncuim@gmail=
.com> wrote:
>
> From: Mikhail Kalashnikov <iuncuim@gmail.com>
>
> The A523 processor has calibration data in two nvmem cells. To be able to
> add support, the ability to add data from two cells into one array must b=
e
> added.
>
> Signed-off-by: Mikhail Kalashnikov <iuncuim@gmail.com>

I'd say that Sashiko's comment on "leaking" memory until the device is
removed is not too much of a concern. Sure it could be released sooner
since it's not used, but it's not a lot of memory.

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>

> ---
>  drivers/thermal/sun8i_thermal.c | 81 +++++++++++++++++++++------------
>  1 file changed, 53 insertions(+), 28 deletions(-)
>
> diff --git a/drivers/thermal/sun8i_thermal.c b/drivers/thermal/sun8i_ther=
mal.c
> index 1412bce63..360654880 100644
> --- a/drivers/thermal/sun8i_thermal.c
> +++ b/drivers/thermal/sun8i_thermal.c
> @@ -300,43 +300,68 @@ static int sun50i_h6_ths_calibrate(struct ths_devic=
e *tmdev,
>
>  static int sun8i_ths_calibrate(struct ths_device *tmdev)
>  {
> -       struct nvmem_cell *calcell;
> +       struct nvmem_cell *calcell =3D NULL;
>         struct device *dev =3D tmdev->dev;
> -       u16 *caldata;
> -       size_t callen;
> +       struct device_node *np =3D dev_of_node(dev);
> +       struct property *prop;
> +       const char *cellname;
> +       u8 *caldata =3D NULL;
> +       size_t callen =3D 0;
>         int ret =3D 0;
>
> -       calcell =3D nvmem_cell_get(dev, "calibration");
> -       if (IS_ERR(calcell)) {
> -               if (PTR_ERR(calcell) =3D=3D -EPROBE_DEFER)
> -                       return -EPROBE_DEFER;
> -               /*
> -                * Even if the external calibration data stored in sid is
> -                * not accessible, the THS hardware can still work, altho=
ugh
> -                * the data won't be so accurate.
> -                *
> -                * The default value of calibration register is 0x800 for
> -                * every sensor, and the calibration value is usually 0x7=
xx
> -                * or 0x8xx, so they won't be away from the default value
> -                * for a lot.
> -                *
> -                * So here we do not return error if the calibration data=
 is
> -                * not available, except the probe needs deferring.
> -                */
> -               goto out;
> +       of_property_for_each_string(np, "nvmem-cell-names", prop, cellnam=
e) {
> +               size_t len;
> +               u8 *caldatapart;
> +
> +               calcell =3D of_nvmem_cell_get(np, cellname);
> +               if (IS_ERR(calcell)) {
> +                       if (PTR_ERR(calcell) =3D=3D -EPROBE_DEFER)
> +                               return -EPROBE_DEFER;
> +                       /*
> +                        * Even if the external calibration data stored i=
n sid is
> +                        * not accessible, the THS hardware can still wor=
k, although
> +                        * the data won't be so accurate.
> +                        *
> +                        * The default value of calibration register is 0=
x800 for
> +                        * every sensor, and the calibration value is usu=
ally 0x7xx
> +                        * or 0x8xx, so they won't be away from the defau=
lt value
> +                        * for a lot.
> +                        *
> +                        * So here we do not return error if the calibrat=
ion data is
> +                        * not available, except the probe needs deferrin=
g.
> +                        */
> +                       goto out;
> +               }
> +
> +               caldatapart =3D nvmem_cell_read(calcell, &len);
> +               nvmem_cell_put(calcell);
> +               calcell =3D NULL;
> +               if (IS_ERR(caldatapart)) {
> +                       ret =3D PTR_ERR(caldatapart);
> +                       goto out;
> +               }
> +
> +               caldata =3D devm_krealloc(dev, caldata, callen + len, GFP=
_KERNEL);
> +               if (!caldata) {
> +                       kfree(caldatapart);
> +                       ret =3D -ENOMEM;
> +                       goto out;
> +               }
> +
> +               memcpy(caldata + callen, caldatapart, len);
> +               callen +=3D len;
> +               kfree(caldatapart);
>         }
>
> -       caldata =3D nvmem_cell_read(calcell, &callen);
> -       if (IS_ERR(caldata)) {
> -               ret =3D PTR_ERR(caldata);
> +       if (!caldata)
>                 goto out;
> -       }
>
> -       tmdev->chip->calibrate(tmdev, caldata, callen);
> +       tmdev->chip->calibrate(tmdev, (u16 *)caldata, callen);
>
> -       kfree(caldata);
> +       devm_kfree(dev, caldata);
> +       caldata =3D NULL;
>  out:
> -       if (!IS_ERR(calcell))
> +       if (!IS_ERR_OR_NULL(calcell))
>                 nvmem_cell_put(calcell);
>         return ret;
>  }
> --
> 2.55.0
>

