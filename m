Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ABFFFB44C5
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Apr 2026 07:26:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iHXhgAVVuQdLQQvZLPXtNmgyqYZ7xrilDpR3AfuiRYU=; b=Zat3d118jCHBquXLFqYcOKWWhL
	ycc/Wi8eOPtxVyTkar6xMtlVEw+P54nAHduNl5Qm7aNOld+zxCYVy86eqPLnRy8MuHHOlF/8o8IAI
	K+h81hIaxPPGXOfmz3nQ7GtB5yfmUi80FaG0venCtnsimJugspHK4LytUJ76Ht7DUCMe+dJuGP1Zs
	UiF/heQgmDSiKTelFXiMlLVDQ4XlE6hiENVPSv0iL1JFrUmviZnEUo1fwu4Ze71JXcLFP83cibbwU
	Bmw+8wLwBd/l/M2sQZtGPIQNI3H+nNtna/wDeRVd0dreAqd2lp6ONYnzc2xXt3JWST7Yotex+dJBT
	tvJSIoGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGAvt-0000000CoEu-33H6;
	Fri, 24 Apr 2026 07:26:37 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGAvq-0000000CoEO-2g6S
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Apr 2026 07:26:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id EB5C243C8B
	for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Apr 2026 07:26:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD6B4C2BCB7
	for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Apr 2026 07:26:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777015593;
	bh=m3OnOKNjVkQfvjbC8vrwVb5oJK6foDK0Kguq8tXWdSo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=e11Bde3dkLLbc0SCXq7yrsallptlVV4pT7hOvAZ9EQdzToIQzZv7oNhx6TJXA7DY/
	 9QrcDG9bjBKqhxqUI/PPyJPHvSslG0BPu0KL6OnPNardT++2KXIgJ1LQJfXCmvwobN
	 /r/vOHl+6hxWWFark0qRvXcTcCTukHcfYHfu/hbWFg3/HRhbloHfX/H4foY49ACqTL
	 VvljpCWKZa7NnBa8FM87h/y+yJkEBTLGqoeHP8ZkqkrO2G9yD4V7AibjBa7N22rMab
	 xcKyF/koJ4YpSigvP3ylBQ5Zch6sec+weo+rWWvZMAMszOFIwbYPHQW0mjqgD0Aehp
	 OQ3tchQtpW/SQ==
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5a415fd6bceso8378388e87.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Apr 2026 00:26:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8eflLf4ANIDZXKgkDNr/HmsN4+CYERHos4SD0fA6p79HxDGBtL67ZB9KKwXH3vMv5oZrGMVf8bDwg3tIt4ZJGr@lists.infradead.org
X-Gm-Message-State: AOJu0YzfRAI604m2qz2DHPvSJ3hBj7jpY1aowUn1TGk8SR/QQRDwf5HC
	G59FkE99gfnLnu7aZ8Fpij4M3sM6W+NFv7uzTCGrAaMfsK67fgT78jQ4QSoXijVimgspgk6/fzr
	layGSphFEkdjI716vgerHhducKeDZeHs=
X-Received: by 2002:a05:6512:3a86:b0:5a2:9b98:f280 with SMTP id
 2adb3069b0e04-5a4172ac06fmr10262099e87.22.1777015592508; Fri, 24 Apr 2026
 00:26:32 -0700 (PDT)
MIME-Version: 1.0
References: <20260414-axiado-ax3000-sgpio-controller-v1-0-b5c7e4c2e69b@axiado.com>
 <20260414-axiado-ax3000-sgpio-controller-v1-1-b5c7e4c2e69b@axiado.com>
In-Reply-To: <20260414-axiado-ax3000-sgpio-controller-v1-1-b5c7e4c2e69b@axiado.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 24 Apr 2026 09:26:18 +0200
X-Gmail-Original-Message-ID: <CAD++jL=yc4rmNELLKUpreUqRbQ1Krg95C-o1xSrnD9Aicm4wgw@mail.gmail.com>
X-Gm-Features: AQROBzCvj1UqvLHeNE2eWeWx72NKzjKr6xPICatDGA6Oq4KfxHHermVnTdGUct0
Message-ID: <CAD++jL=yc4rmNELLKUpreUqRbQ1Krg95C-o1xSrnD9Aicm4wgw@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: gpio: add Axiado SGPIO controller
To: Petar Stepanovic <pstepanovic@axiado.com>
Cc: Tzu-Hao Wei <twei@axiado.com>, Swark Yang <syang@axiado.com>, 
	Prasad Bolisetty <pbolisetty@axiado.com>, Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Harshit Shah <hshah@axiado.com>, SriNavmani A <srinavmani@axiado.com>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260424_002634_715726_8CC89A4E 
X-CRM114-Status: GOOD (  18.49  )
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

Hi Petar,

thanks for your patch!

On Tue, Apr 14, 2026 at 3:49=E2=80=AFPM Petar Stepanovic <pstepanovic@axiad=
o.com> wrote:

> Add device tree binding for the Axiado SGPIO controller.
>
> The SGPIO controller provides a serialized interface for
> controlling multiple GPIO signals over a limited number of
> physical lines. It supports configurable data direction and
> interrupt handling.
>
> The binding describes the properties required to instantiate
> the controller and register it as a GPIO provider.
>
> Signed-off-by: Petar Stepanovic <pstepanovic@axiado.com>

(...)

> +description: |
> +  The SGPIO controller provides a serialized interface for controlling
> +  multiple GPIO signals over a limited number of physical lines.
> +  It supports configurable data direction and interrupt handling.

This is pretty generic, can you write some details on how this happens?

> +  '#gpio-cells':
> +    const: 2

Are you sure you don't want to use 3 here instead and split the 128
GPIOs into 4 "banks" second cell being the bank number?
<&gpio 2 4>; ?

Maybe this also solves the 512 GPIO by grouping the GPIOs into
8 banks...?

> +  '#interrupt-cells':
> +    const: 2

Same there.

> +  design-variant:
> +    description: SGPIO design variant size in bits (e.g. 128 or 512).
> +    enum: [128, 512]
> +    $ref: /schemas/types.yaml#/definitions/uint32

Just use two different compatible strings and infer the variant from
that string instead.

> +  ngpios:
> +    description: The number of gpios this controller has.
> +    $ref: /schemas/types.yaml#/definitions/uint32

Same here, certainly the 128 variant has 128 gpios and
the 512 has 512 GPIOs? Just use the compatible string
to infer this.

> +  bus-frequency:
> +    description: The SGPIO shift clock frequency in Hz.
> +    $ref: /schemas/types.yaml#/definitions/uint32

Don't you want to use the clock bindings and a clk property
for this?

> +  apb-frequency:
> +    description: The APB bus frequency in Hz.
> +    $ref: /schemas/types.yaml#/definitions/uint32

Dito.

> +  dout-init:
> +    description: Initial values for the dout registers.
> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +    minItems: 4
> +    maxItems: 4

In:
Documentation/devicetree/bindings/gpio/nxp,pcf8575.yaml

you find:

  lines-initial-states:
    $ref: /schemas/types.yaml#/definitions/uint32
    description:
      Bitmask that specifies the initial state of each line.
      When a bit is set to zero, the corresponding line will be initialized=
 to
      the input (pulled-up) state.
      When the  bit is set to one, the line will be initialized to the
      low-level output state.
      If the property is not specified all lines will be initialized to the
      input state.

If this is what you want, use this standard binding instead.

Yours,
Linus Walleij

