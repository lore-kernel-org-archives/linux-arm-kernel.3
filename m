Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D79ACCD3427
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 14:18:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tq7R/PhUG35tcBbrOQnwEj8bmyV56I4M8XqZPyDJgAI=; b=qbmnnbvZ4r7BzH
	6rYDYHdt+5EqLwNN9uagTgOs2lMumlKQd25s9ljocCemkfWTqnmYNjmqyareTO+B5SyILvMzYtB2K
	7apQS2CB0iMXkZmyY6lFeXMhsCQnWFIv/Ea9r5yAnVlEL+xW3O6HOspEHajDJh+LhM4KGTpsvLHPg
	k5omvgYfxKhLqPd5g0T9aa25GAJE45eyMA7F48w75sYEBmijPCGb7U4fr9WWK43isVlmUT/+hQzHW
	AtFItqzsK010Pvt2aB2hE5hSIdk+gkGK/CycfqQbcwGWTSZX6L1TXVHqwzWKH0qvyL9JiesWz6D8W
	Oahvtb7FyJIG1RwpBJHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKGbX-0000000GUDQ-2lt7;
	Tue, 05 May 2026 14:18:31 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKGbV-0000000GUDA-2nyE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 14:18:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 112EE60154
	for <linux-arm-kernel@lists.infradead.org>; Tue,  5 May 2026 14:18:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB693C2BCF4
	for <linux-arm-kernel@lists.infradead.org>; Tue,  5 May 2026 14:18:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777990708;
	bh=fs3WyS86P1cobei063vHZNvMniQJ2L/6DB9bU5unqVg=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=MfHraLEMUeP5/DREGDITghSU061dKucJWDUFrnk8jCXYIKx5Dg4x54wkgQjgv4hBX
	 pvOqXXodq7LYNdorCxk5Tj2SMYbCtYOc6IKIOuLrarwJ2A3eAgbnbcila2Ttyz4hoY
	 IW7exvNyHOY0xwekMFjow46Fcr0jW4kcz4PRC9xMGbbdN7A5TCENuk4/uusLUtQN9k
	 Edm2gqrpAknf/RXi7ygvs7ctkZwVWdSfTtwY2fmtibC/aatUj9Z4I8ZaOOtvx3JoNT
	 KVe+1PIN/RstreoU/fA5oM/YVJMstXbeNSVmiHMfJBvOQfMdfPr+gSM/lTIvKoBzjp
	 6p4rFjdvMTTMg==
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-3937014be0cso32993971fa.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 05 May 2026 07:18:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+H/1aGkT6unt6dTKq2LGaq7qzY4xgjYifHcCSfFFtWBU0XFXw979brKS6Ek4wrkfOqvCbvJMZWszezEkIyPDeM@lists.infradead.org
X-Gm-Message-State: AOJu0YwPyN4JgC8E0tmK5yM31QosPuMk3IJwBf3eWG7EANi9Yq039Hdd
	xvtOsC1LnMB3TQHiPtckWqn7OmFsb4gswnqKmc6tSg6N6DhoqvnKIvi4p4zxtE5LJvei/eOzusP
	Hq387FWb8042PDkKDPg+fVb1XgwopgeA=
X-Received: by 2002:a05:651c:550:b0:393:9cd4:ea5 with SMTP id
 38308e7fff4ca-3939cd4108bmr40207251fa.13.1777990707140; Tue, 05 May 2026
 07:18:27 -0700 (PDT)
MIME-Version: 1.0
References: <20260504050245.646078-1-iuncuim@gmail.com> <20260504050245.646078-4-iuncuim@gmail.com>
In-Reply-To: <20260504050245.646078-4-iuncuim@gmail.com>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Tue, 5 May 2026 22:18:14 +0800
X-Gmail-Original-Message-ID: <CAGb2v674Ash+eiN42EkiCCsjN1Y7+iRmZR+Bt37e+EtnfOE0tg@mail.gmail.com>
X-Gm-Features: AVHnY4Iw15ROowKdMFkqI-ON5u3aYZ0szmXhIXedM9DZoTYlirjw1ecxwjFWiYo
Message-ID: <CAGb2v674Ash+eiN42EkiCCsjN1Y7+iRmZR+Bt37e+EtnfOE0tg@mail.gmail.com>
Subject: Re: [PATCH v4 3/5] thermal/drivers/sun8i: get calibration data from
 two nvmem cells
To: Mikhail Kalashnikov <iuncuim@gmail.com>
Cc: Vasily Khoruzhick <anarsoul@gmail.com>, Yangtao Li <tiny.windzz@gmail.com>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@kernel.org>, 
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-pm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
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

On Mon, May 4, 2026 at 1:03=E2=80=AFPM Mikhail Kalashnikov <iuncuim@gmail.c=
om> wrote:
>
> The A523 processor has calibration data in two nvmem cell. To be able to
> add support, the ability to add data from two cells into one array must b=
e
> added.
>
> Signed-off-by: Mikhail Kalashnikov <iuncuim@gmail.com>
> ---
>  drivers/thermal/sun8i_thermal.c | 77 ++++++++++++++++++++++-----------
>  1 file changed, 52 insertions(+), 25 deletions(-)
>
> diff --git a/drivers/thermal/sun8i_thermal.c b/drivers/thermal/sun8i_ther=
mal.c
> index df0c26970..c4aaff8f7 100644
> --- a/drivers/thermal/sun8i_thermal.c
> +++ b/drivers/thermal/sun8i_thermal.c
> @@ -301,43 +301,70 @@ static int sun50i_h6_ths_calibrate(struct ths_devic=
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

>         if (IS_ERR(caldata)) {
>                 ret =3D PTR_ERR(caldata);
>                 goto out;
>         }

This will never happen now.

>
> -       tmdev->chip->calibrate(tmdev, caldata, callen);
> +       tmdev->chip->calibrate(tmdev, (u16 *)caldata, callen);
> -       kfree(caldata);
> +       devm_kfree(dev, caldata);
> +       caldata =3D NULL;
>  out:
> -       if (!IS_ERR(calcell))
> +       if (calcell && !IS_ERR(calcell))

          if (!IS_ERR_OR_NULL(calcell))

>                 nvmem_cell_put(calcell);
>         return ret;
>  }
> --
> 2.54.0
>
>

