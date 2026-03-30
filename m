Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BE2A1061B20
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Mar 2026 21:44:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IY6TefpABY+FWNRT3kahjkpIdjUN+0MXMlIzQOjUTr0=; b=UVeEoCvSklP5KLC+1avAkeOR2W
	Yui3iyi2IxLyc72qVLF3xhclLlRykwUbhz0CxKHJUHpAgoRUH/xoGUOfGlPOQFKLYiN2o8dXx3xNh
	pArKRg4hkLNiKbi71aRh9AyWA1K8ClSnk5FaJ39uF/O97/voRGP9v8hJvdOIzq+OIlxyulJ8ebiHe
	G1/DWL7L1vahlTfdRpG7XFw8d5j1a900tVP+Ce6m2i7dhOD+IAab06/KcKOjf4KJWQdnvBSUEgYdS
	N1oF+vrHSzs7VJpjfYwjXs4zvWMKUR22rIeE+hV75bXmx5d7FS0IlSVsqI+2CcqaZv67ht8/KLTPX
	6rOmW73g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7KPe-0000000BvHA-0dTJ;
	Mon, 30 Mar 2026 21:44:46 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7KPb-0000000BvGQ-0uUQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Mar 2026 21:44:44 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2a7a9b8ed69so48989775ad.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 30 Mar 2026 14:44:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774907082; cv=none;
        d=google.com; s=arc-20240605;
        b=BJXNMYfTPzBdreLJMlWw/4dvod+stMkefz0u873+NjNcMomX4J0uF9k9b9uPdV2L28
         0kWMXaO2nrUw2QQ96zr9cmGuZjnhr/ZRbQYVJqoIRjZOkb2JHj4+YNBnYzL+QpGa5Imk
         PgLsZbQ/pxV2c7dvA/72vG0psL9m4KnUV4UdAIdCOT+maFnc3GpShdchD2vtcZq9NalP
         ew6+rfHvEZqwVsrEUqfBm0vq84AqaF8J9RCGC3wFLRIZtwKvA9F7vaFWMZKZuprImysp
         jnLj8lFGuyj8i5K6M7jVkelc03KsTDKjkPqwc4iHswVYDK5UtewP5GD02G5qf1oUq6Wj
         e3ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IY6TefpABY+FWNRT3kahjkpIdjUN+0MXMlIzQOjUTr0=;
        fh=pbKnakMMBuTs89rpcnrPNCTrXHmEOXUPssqP1TX+Jbc=;
        b=RcxL9NW7mmyWJSuBrlkit/jhySvTuABgll2dD5UIZzheKSBuZkXbzP6m6+/rwVvSTs
         1cqpKiuMypEBht8T5sfdxecWIV7b9MJJGcJqDPBYoal62VTRQUbWBDv5Da2n4VZXXRpD
         ClxIrQ9sQOWjwQm1d1Rz68CNnqsmWnVCxD7Dv6j75ZLPPFOV8srXCpxOnmcr3m9jhNlH
         OIeOrbKlXydY0P2HP30TXW8e4lylwe7vI8PLhQyWjMzMwffqvoaKpVZHWQtw/sIR47OK
         Oc1Zy3a/SaFvF7IQ3CI9ZAlP3JFsx2o3emsc29kQeKZcWTLzHLWMmnuiFnjohFjYAMSD
         mbVA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20251104; t=1774907082; x=1775511882; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IY6TefpABY+FWNRT3kahjkpIdjUN+0MXMlIzQOjUTr0=;
        b=SpN+QQ5NuJM91ngbAkNksJ3VOojl+xHb+3ckMmCNykTWtAZrrThPYFmC2qq1WeOxoU
         uqqFhzcpGcTo8Gg421Rj6b/J+jkDk/mcmRAhiYOXsHMJ6QPlcOG9J/TD/RaCkC0gZaKp
         EM1eANGoYC4bmKZBbUhKGMoSTCKDwERRwQBX+NlxIvifvxctauMh0kR9gfl0a28l6uaI
         8/X3mpWOyxWw9V2tXV2KJAPoYsvVTJ271I9cn1XIL3ELn/h1abPiA53wvNW9zTjgyzE/
         QMU+kO4zwULid8rCGmpbIickdCzcWOqLUn4lU6FpDIxBfDlgVMN8uCxvcRQhxLcr3HDq
         MBXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774907082; x=1775511882;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IY6TefpABY+FWNRT3kahjkpIdjUN+0MXMlIzQOjUTr0=;
        b=OWCcdLh4/o1HbO/8LWAtBjrLDWU0VxBHvJx+4XHyZc18xZ84zJbtTy/1cIKFCFLShM
         Zanh7XF78ZUwBltYrYgoxfey39Tu80H7E+U0Nz5JhQ2zoZUp3nHmZ2EBwSLiNlpT+/NG
         v6jcBziWwMOw2CnGUZ7jhFu7PoCepD3S5oNZw+Meu9jq0e4BBJFwmZnAM69iEUdy8Tpm
         mJGB+EUinCvCOGv6jnAgjWkl9UwUW5PCvdMZypyLD5y2RwegMPQSj8GZ8HpUI+wjW4/6
         LK1maO/G5UZmiukkHlNCX7MIYt48hwiUU/1ZCN+OA0yWFNGlcYykRlV727EHto2IY9v+
         xH5g==
X-Forwarded-Encrypted: i=1; AJvYcCWZtfVJ8A5nlt7lWQQFeC8xFnY//Bv6aQq5AZfsPR35NvqWNzX1B85EAUwxCGoKo7bgjCrlBt1vU70t3FerILIk@lists.infradead.org
X-Gm-Message-State: AOJu0Ywj2iUgQQwQ7yQimHVu6ZmG9EMxIiEzke1H1v3nAnO/M2eyv3Kl
	P7xrSISnfmdUFFCgxd/RtxVli7h43jut0SFb+8phhRjfmi4jeR/y2FMhB/m/gFe48GmkLoo1wzC
	+PjYIwlhwJDPF84fP+DTkvjQAKrsn9jU=
X-Gm-Gg: ATEYQzzbtXCtiHTonYj5woTR5iI7HJ8/8SC/MO5psZz6i+0zBLs3/MaqcuvVREUAKnx
	r/2dEazLYk1rRSjWLDxBVAwlH0QopMTykOWDzuddrXGbv1F7ZteFFe5eOeZ1z9e24rAvoi1NUEn
	FKoZ85idw2ozn3UDc2Nhfg6iqyrYmSZ916br4OcZ1ej9V+P40ZUv7sEmVtaYsaC04Sj2B5+PdAP
	biK0lcEqLQsPLCevTUlFO4MxpPc35ZWstRnPVpQS+lzDA5vMLyYqi/FSVuYnU0OPk1YTG5DO7B+
	q4V1oacnhMw1FHbncJCTe/HwQsB0gXVGxPIzpkXb
X-Received: by 2002:a17:902:e847:b0:2b2:54e5:b3af with SMTP id
 d9443c01a7336-2b254e5b653mr47612585ad.45.1774907082131; Mon, 30 Mar 2026
 14:44:42 -0700 (PDT)
MIME-Version: 1.0
References: <20260326-s6-s7-pwm-v1-0-67e2f72b98bc@amlogic.com> <20260326-s6-s7-pwm-v1-2-67e2f72b98bc@amlogic.com>
In-Reply-To: <20260326-s6-s7-pwm-v1-2-67e2f72b98bc@amlogic.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 30 Mar 2026 23:44:31 +0200
X-Gm-Features: AQROBzDFiVgbyoC-RBIZt33tOxsaNE_LH0olelId_HKu2Jck3TyhrNiFIv2aRxY
Message-ID: <CAFBinCD-4dwp7pmM_GHK_N1kag_5VBZbP9VAwQOxcyg6aquj3w@mail.gmail.com>
Subject: Re: [PATCH 2/2] pwm: meson: Add support for Amlogic S7
To: xianwei.zhao@amlogic.com
Cc: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, linux-pwm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_144443_338599_4C8658CC 
X-CRM114-Status: GOOD (  23.92  )
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

Hi Xianwei Zhao,

On Thu, Mar 26, 2026 at 7:35=E2=80=AFAM Xianwei Zhao via B4 Relay
<devnull+xianwei.zhao.amlogic.com@kernel.org> wrote:
>
> From: Xianwei Zhao <xianwei.zhao@amlogic.com>
>
> Add support for Amlogic S7 PWM. Amlogic S7 different from the
> previous SoCs, a controller includes one pwm, at the same time,
> the controller has only one input clock source.
>
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
> ---
>  drivers/pwm/pwm-meson.c | 32 ++++++++++++++++++++++++++++++--
>  1 file changed, 30 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/pwm/pwm-meson.c b/drivers/pwm/pwm-meson.c
> index 8c6bf3d49753..3d16694e254e 100644
> --- a/drivers/pwm/pwm-meson.c
> +++ b/drivers/pwm/pwm-meson.c
> @@ -113,6 +113,7 @@ struct meson_pwm_data {
>         int (*channels_init)(struct pwm_chip *chip);
>         bool has_constant;
>         bool has_polarity;
> +       bool single_pwm;
At first I wasn't sure about this and thought we should replace it
with a num_pwms (or similar) variable.
However, I think it will be hard to add a third (or even more)
channels to the PWM controller (not just from driver perspective but
also from hardware perspective). So I think this is good enough as the
choice will only be 1 or 2.

[...]
> +static const struct meson_pwm_data pwm_s7_data =3D {
> +       .channels_init =3D meson_pwm_init_channels_s7,
I think you can use .channels_init =3D meson_pwm_init_channels_s4, if
you change the code inside that function from:
    for (i =3D 0; i < MESON_NUM_PWMS; i++) {
to:
    for (i =3D 0; i < chip->npwm; i++) {

[...]
> @@ -650,9 +674,13 @@ static int meson_pwm_probe(struct platform_device *p=
dev)
>  {
>         struct pwm_chip *chip;
>         struct meson_pwm *meson;
> +       const struct meson_pwm_data *pdata =3D of_device_get_match_data(&=
pdev->dev);
>         int err;
>
> -       chip =3D devm_pwmchip_alloc(&pdev->dev, MESON_NUM_PWMS, sizeof(*m=
eson));
> +       if (pdata->single_pwm)
> +               chip =3D devm_pwmchip_alloc(&pdev->dev, 1, sizeof(*meson)=
);
> +       else
> +               chip =3D devm_pwmchip_alloc(&pdev->dev, MESON_NUM_PWMS, s=
izeof(*meson));
I don't think this code is too bad for now.
However, I'm wondering if you want to make "channels" from struct
meson_pwm a flexible array member in a future patch. In that case it
will be helpful to have an "unsigned int npwm =3D pdata->single_pwm ? 1
: MESON_NUM_PWMS;" (or similar) variable to future-proof your code.
What do you think?


Best regards,
Martin

