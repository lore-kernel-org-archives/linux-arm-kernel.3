Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1453DC77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 21:20:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h7ui9krklnTDspgMC7AGFpPjhbbUuQIxEzApTtxeYDw=; b=pGge2BQTTBWAP1szpj30KHH5E/
	NgFsBdgmKw7WaD0rhzVJeUAiRw17b2uJgD76W2ZsMo/iFmOW9HO3ff/SZxTuJPKZHGDP4k+gVA9kh
	Oj90UGLpe6YYCT5YYFt3gL2+LZToe+RGg0D+LkZIHEBv1RUl2pHoGLFXwi/qr/Uv4v7hGdQOSJR+z
	2jPlz68fvXgPNUaeOuWxBJk6pTl6WaDkWDqT8ESElo2mgpWXM9iAV4h4zeFtkkXo6o1SWEruaDuB6
	72gpUcIhMm+yMaQMwlWawquOFSkFWsvXzwtjBm1zYyivfAeqEzCa0ySl98n0z4r5okf/JyEy1TGzD
	YI3I9ZUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUB3x-00000006rdM-34eL;
	Tue, 24 Jun 2025 21:20:17 +0000
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU8qT-00000006Yx3-2sKj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Jun 2025 18:58:14 +0000
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-32b7f41d3e6so1744861fa.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Jun 2025 11:58:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750791492; x=1751396292; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h7ui9krklnTDspgMC7AGFpPjhbbUuQIxEzApTtxeYDw=;
        b=l/Pozaz2Cx/GAX/hGa+53A7V1hb7E+mY9O/Jl0oxdJKOVtWQAmhuG5Tm9NcH1dg6Hv
         QF7NPOhhue72IA5Q+eMe+Xs0mAulcBRJPPuRxa/0w+CoAY7lG5R9Tu0LNX0aLnqtdaFG
         qzsuZW6afOZOrd+OvEjj+2kacNGhQwTWqwr44DbvQOEnSImC5knvT51GEhkRXuLJNtRm
         0VHQucK7kaT1TfSMTD3bwMB8bXqBx0UeEsbdD+HP+ZI5xCvH9o33JRVgzRQcA/e1t4FH
         y0ujgIJg/di9EHs5W30Uo4mZssQ+074K1aS2ttUBcCRenx621hIEF+NfnxOsHSPK9oQr
         /YJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750791492; x=1751396292;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h7ui9krklnTDspgMC7AGFpPjhbbUuQIxEzApTtxeYDw=;
        b=VnjOQmHFEfRbqUrVpZUT91jo45lEYUMTtx8e+j9QKOWtJrrh6qlUKPSDhBPF3VCeWx
         jI8wabp5RsM1/bxDrqmz+y/eTF8T49hL0Alp5iuVlZQ9z8Zx1zsEQDSu44GqaX09Pss+
         6ksp74GDUuB8tBbJ1kTNWuMNi0SzprjQ9bQNAP4qaWmn6CC42MRYg91iwngL8/KlO6Ff
         jhmUj1usHUzDeglAmRvJ6oLSEFJlgGecZ4P+FoJO20E55LluAlHY9ZQMsr1LrPjkiZf+
         V5b/CkvYlrmWqWZSJU23kFdTuPaBSiu9fK0VRw4YG6lWhh6eEeiaRvMXCSzDc8/iJ9Cp
         HhEQ==
X-Forwarded-Encrypted: i=1; AJvYcCXJBwYfJe2gW8iqHE91LKmtzOD03rBym1NPdG0lDjMIw+SccVyZoUHX6sJRi7uYAPEoc71Ia87FCCvNivoRYZ9w@lists.infradead.org
X-Gm-Message-State: AOJu0Yyn6wu2oFANQsExUz3/jr723CzGxzG6zw3t51u1BiyHytUvIu7G
	C5Ua+ktmZwMvnKBmysOyKXO1geZs5RvmXoqgH767JLUjN0WOzQmGQHbl15JIXNSs6RjN3XTR+2k
	Ovgq5v7YTIYmW2tQD5BemNjDVWbvCm7i7LZaDQFV7jQbJJqFEfDym2ntGBw==
X-Gm-Gg: ASbGnctu6Qjb6lqQ6+mtwfhUb9FySOajotN9yUwIFjXzli3Cc8AT5lgD6FmrrrW+MH7
	TshGRVutjhXI51H9+IZzFgvZm/CZsOD1sk8jFEhUKWkNynGM1rDmdHXtf5u25KmKjTPDlqxhYFQ
	fcrN9qJCgd63TlDthlGtruaDEDy8M7O4sxD45oNxkzq4s=
X-Google-Smtp-Source: AGHT+IFHkwtjvOJNCrFEWstn9L634lZ8TSAnodhGn+aKzDIVOJMa02nwLbdMCDdRl+xviZehHHIuiwGlHeUOdx9D6us=
X-Received: by 2002:a05:651c:214b:b0:32c:a690:724b with SMTP id
 38308e7fff4ca-32cb968d882mr10090081fa.19.1750791491756; Tue, 24 Jun 2025
 11:58:11 -0700 (PDT)
MIME-Version: 1.0
References: <20250618095858.2145209-1-demonsingur@gmail.com> <20250618095858.2145209-5-demonsingur@gmail.com>
In-Reply-To: <20250618095858.2145209-5-demonsingur@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 24 Jun 2025 20:58:00 +0200
X-Gm-Features: AX0GCFv3Y0xzvM4_ytzUY9wWsLoaPRcLNq10rxfdsma9gTvF5iQYKz-0B24NXH0
Message-ID: <CACRpkdYwBAaEi--y64oVwVcAMH9z0LO5ZG_fvNK-CuxdERiYBQ@mail.gmail.com>
Subject: Re: [PATCH v4 04/19] dt-bindings: media: i2c: max96717: add support
 for pinctrl/pinconf
To: Cosmin Tanislav <demonsingur@gmail.com>
Cc: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	=?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
	Julien Massot <julien.massot@collabora.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"open list:MAXIM GMSL2 SERIALIZERS AND DESERIALIZERS" <linux-media@vger.kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	"moderated list:ARM64 PORT (AARCH64 ARCHITECTURE)" <linux-arm-kernel@lists.infradead.org>, 
	"open list:STAGING SUBSYSTEM" <linux-staging@lists.linux.dev>, 
	"open list:GPIO SUBSYSTEM:Keyword:(devm_)?gpio_(request|free|direction|get|set)" <linux-gpio@vger.kernel.org>, Cosmin Tanislav <cosmin.tanislav@analog.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_115813_725631_EAF9161B 
X-CRM114-Status: GOOD (  13.86  )
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

Hi Cosmin,

thanks for your patch! Overall this looks good!

On Wed, Jun 18, 2025 at 11:59=E2=80=AFAM Cosmin Tanislav <demonsingur@gmail=
.com> wrote:

> MAX96717 is capable of configuring various pin properties.
>
> Add pinctrl/pinconf properties to support this usecase.
>
> Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
(...)
> +      slew-rate:
> +        description: |
> +          Slew rate.
> +          0 - Fastest
> +          1 - Fast
> +          2 - Slow
> +          3 - Slowest
> +        maximum: 3

Would be great to have some SI units on this? Like how many milliseconds
etc.

> +      maxim,jitter-compensation:
> +        type: boolean
> +        description: Enables jitter compensation.

What does that mean?

> +      maxim,gmsl-tx:
> +        type: boolean
> +        description: Enable transmitting pin value to GMSL link.
> +
> +      maxim,gmsl-rx:
> +        type: boolean
> +        description: Enable receiving pin value from GMSL link.
> +
> +      maxim,gmsl-tx-id:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        description:
> +          Identifier used while transmitting value to GMSL link.
> +          Default value matches the pin number.
> +        minimum: 0
> +        maximum: 31
> +
> +      maxim,gmsl-rx-id:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        description:
> +          Identifier used while receiving value from GMSL link.
> +          Default value matches the pin number.
> +        minimum: 0
> +        maximum: 31

Maybe add some words about what an GMSL link is somewhere?

> +      maxim,rclkout-clock:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        description: |
> +          Clock value.
> +          0 - XTAL / 1 =3D 25MHz
> +          1 - XTAL / 2 =3D 12.5MHz
> +          2 - XTAL / 4 =3D 6.25MHz
> +          3 - Reference PLL output
> +        minimum: 0
> +        maximum: 3

I'm no expert but isn't this something the clock framework has some standar=
d
binding for? assigned-clock-rates?

Yours,
Linus Walleij

