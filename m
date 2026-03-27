Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CE4910ED65C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 11:39:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1QrqiVXEK6eIwcCqGgok+wSw9qZtXkMh4qLzkEvaTWA=; b=VwthEq9F7Ub6oU
	0WSOAhy9L7U1eEJBIf367JrR6MPdQjgQ0ihrqQtkRur7FCQ03jURaQxDn/+bmQtjlfjv3XM4YWxtK
	P56yCMX8kV70gmlAuWrvyAz/SIeMaF7OqR6TQxF4U2AHVS5WIbmRYXhIrMAlQQW2df+jtGkIS5FJm
	ZQCzUguXrJHU55Fk9eTRxlXmDxEI65dSGVOwmWvBXl/jrv01/t3NaF8hCMNa1xMmLZSdyjQbWugsV
	6B6vrIeM/otgWAD8wepfFXR6Ntfe957ef/Rhaaz4a07KOiZXlIRoa2dUYJmAKzNk3IDwzN1Sk8mue
	CV7XX91q6YksIW9VOzBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w65X2-00000007HUA-3872;
	Fri, 27 Mar 2026 11:39:16 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w65Wz-00000007HTD-2pjy
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Mar 2026 11:39:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E890B43860
	for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Mar 2026 11:39:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA847C2BC87
	for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Mar 2026 11:39:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774611552;
	bh=UxVql3iCinYZAEcrJtRq8tsCHQHw2MKzaZSxc+FzXBY=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=aBB5QBSPdZ8H06YVMHSfO2RDMnS704X33I/f6sHYSordXKiAogB5hyrBbhJ7pI7C3
	 XjvE+jIdsIjAqSDr22e8xQasM58LZa8avm2kYjOQkNSGhmGtRisckM4OxGow1QICIc
	 AWw4lLWhT6XF4bh08nO/5ubD12xKXlJxHKBJCrBWCsARyrc4TZ8GDMoQafDhXqo2b9
	 RsaVcB7nlBmJDuCxJLF++U2gEeMTBf9udkoulwe3y/LoB5vnCj6UCm5sxufzGoOZUr
	 apKxwYqY0Edmsx3CuADADE+DmR155OTwlFMIwIXDH5x0MxkHtG5K7cN939VIvpSRLn
	 oFBv5OZ/YKW/g==
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-38b13652c87so17172191fa.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Mar 2026 04:39:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVsIReRJ/ikQjQy4XDZhNkZ3gd1XX/wV3DysM4UpIUY7zIB78p9E61J/D6gkoTfTPgZLsvDjTd4netirKOPFQ1n@lists.infradead.org
X-Gm-Message-State: AOJu0Yx7igQzWZX42mQWIP40sss+c7lVh02ToF1V3PInrGntEFyDnqgK
	87FULytHv9oKCAYb9v7TBuSRnhP25xYPvTA0RWGHwQYNatH/qt8QB3kTI5ciY/sKYZ+0XQdcKyr
	iQJeQ1M7B0B5dtsEJN1Wqr6aAjdCgwXA=
X-Received: by 2002:a2e:a548:0:b0:38a:43eb:239e with SMTP id
 38308e7fff4ca-38c73192b65mr8118231fa.13.1774611551145; Fri, 27 Mar 2026
 04:39:11 -0700 (PDT)
MIME-Version: 1.0
References: <20260327113006.3135663-1-andre.przywara@arm.com> <20260327113006.3135663-2-andre.przywara@arm.com>
In-Reply-To: <20260327113006.3135663-2-andre.przywara@arm.com>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Fri, 27 Mar 2026 19:38:57 +0800
X-Gmail-Original-Message-ID: <CAGb2v64A0rgiMkTCdvq-pVfzCTqWKqc=nx69B9tD7A8_E7vHUg@mail.gmail.com>
X-Gm-Features: AQROBzAQci5lIKbXtZJOPlGcamgsXHcH9oivEuLtfHtbKKkk-390QUJb7sIoYaA
Message-ID: <CAGb2v64A0rgiMkTCdvq-pVfzCTqWKqc=nx69B9tD7A8_E7vHUg@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] pinctrl: sunxi: a523: Remove unneeded IRQ remuxing flag
To: Andre Przywara <andre.przywara@arm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_043913_770708_074FED7C 
X-CRM114-Status: GOOD (  24.33  )
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

On Fri, Mar 27, 2026 at 7:30=E2=80=AFPM Andre Przywara <andre.przywara@arm.=
com> wrote:
>
> The Allwinner A10 and H3 SoCs cannot read the state of a GPIO line when
> that line is muxed for IRQ triggering (muxval 6), but only if it's
> explicitly muxed for GPIO input (muxval 0). Other SoCs do not show this
> behaviour, so we added a optional workaround, triggered by a quirk bit,
> which triggers remuxing the pin when it's configured for IRQ, while we
> need to read its value.
>
> For some reasons this quirk flag was copied over to newer SoCs, even
> though they don't show this behaviour, and the GPIO data register
> reflects the true GPIO state even with a pin muxed to IRQ trigger.
>
> Remove the unneeded quirk from the A523 family, where it's definitely
> not needed (confirmed by experiments), and where it actually breaks,
> because the workaround is not compatible with the newer generation
> pinctrl IP used in that chip.
>
> Together with a DT change this fixes GPIO IRQ operation on the A523
> family of SoCs, as for instance used for the SD card detection.
>
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> Fixes: b8a51e95b376 ("pinctrl: sunxi: Add support for the secondary A523 =
GPIO ports")

Acked-by: Chen-Yu Tsai <wens@kernel.org>

> ---
>  drivers/pinctrl/sunxi/pinctrl-sun55i-a523-r.c | 1 -
>  drivers/pinctrl/sunxi/pinctrl-sun55i-a523.c   | 1 -
>  2 files changed, 2 deletions(-)
>
> diff --git a/drivers/pinctrl/sunxi/pinctrl-sun55i-a523-r.c b/drivers/pinc=
trl/sunxi/pinctrl-sun55i-a523-r.c
> index 69cd2b4ebd7d..462aa1c4a5fa 100644
> --- a/drivers/pinctrl/sunxi/pinctrl-sun55i-a523-r.c
> +++ b/drivers/pinctrl/sunxi/pinctrl-sun55i-a523-r.c
> @@ -26,7 +26,6 @@ static const u8 a523_r_irq_bank_muxes[SUNXI_PINCTRL_MAX=
_BANKS] =3D
>  static struct sunxi_pinctrl_desc a523_r_pinctrl_data =3D {
>         .irq_banks =3D ARRAY_SIZE(a523_r_irq_bank_map),
>         .irq_bank_map =3D a523_r_irq_bank_map,
> -       .irq_read_needs_mux =3D true,
>         .io_bias_cfg_variant =3D BIAS_VOLTAGE_PIO_POW_MODE_SEL,
>         .pin_base =3D PL_BASE,
>  };
> diff --git a/drivers/pinctrl/sunxi/pinctrl-sun55i-a523.c b/drivers/pinctr=
l/sunxi/pinctrl-sun55i-a523.c
> index 7d2308c37d29..b6f78f1f30ac 100644
> --- a/drivers/pinctrl/sunxi/pinctrl-sun55i-a523.c
> +++ b/drivers/pinctrl/sunxi/pinctrl-sun55i-a523.c
> @@ -26,7 +26,6 @@ static const u8 a523_irq_bank_muxes[SUNXI_PINCTRL_MAX_B=
ANKS] =3D
>  static struct sunxi_pinctrl_desc a523_pinctrl_data =3D {
>         .irq_banks =3D ARRAY_SIZE(a523_irq_bank_map),
>         .irq_bank_map =3D a523_irq_bank_map,
> -       .irq_read_needs_mux =3D true,
>         .io_bias_cfg_variant =3D BIAS_VOLTAGE_PIO_POW_MODE_SEL,
>  };
>
> --
> 2.43.0
>

