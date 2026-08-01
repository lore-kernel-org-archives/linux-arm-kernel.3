Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11458C5516F
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  1 Aug 2026 06:46:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NziBy7OG33oYiNr9JUn+R/txXnPdgHaF2LDnuUeFyYg=; b=3VLPt+eTWg4JJH27uGV7UaHOct
	Hz/+z6WPXPWy/pd4DLjYeXCMqcEzWd16ASicKMuIPS/Pw46mNEWj80aIWwBULqNdYw1IZcARqrZFI
	rpVh9ofWDX7R8vWSP279m7Io0pm5ffzxfMN46OInQrdU0M+ewLiWIxS2SJpodhFkLQeKWDf6Afioy
	oQOQTOlJEvxXKEs02WNWkHjF5m8vzEUs0nLS1u46gnG/hHn3YSBoKRQ/nPqNfCde4ypXMQni6kr7z
	S4kfWpLW0iJjkePCOU3/TLAOKOmgPkLLxyw5pRwjpTkU20VIEAkIAmB8cyheJ2HmGYZ21gArd2z1s
	Sgd0A11A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wq3UQ-0000000DxMP-2f2X;
	Sat, 01 Aug 2026 06:46:34 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wq3UP-0000000DxM4-0tS2
	for linux-arm-kernel@lists.infradead.org;
	Sat, 01 Aug 2026 06:46:33 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3D27F43E2C
	for <linux-arm-kernel@lists.infradead.org>; Sat,  1 Aug 2026 06:46:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE2901F01563
	for <linux-arm-kernel@lists.infradead.org>; Sat,  1 Aug 2026 06:46:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785566792;
	bh=NziBy7OG33oYiNr9JUn+R/txXnPdgHaF2LDnuUeFyYg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=X+dlzDlk1xA5YdrM5quGz4H5W+p8TlN27F/rgLOZ4gibXkhXbVupjaZ89pcnpYl/W
	 uHQMtIkx2np4JOaMBDiBsz38ib6WvvSYhpkhO+MYCvSC+t7R3IMludiRFq4xMcx+NN
	 jiEOUPHxF3mubX8IuB2prrpotUheS6Equ4l/3M62ejnOOl6iYCfIk+kH3xV4ODn3q2
	 E40xo7wSydjXz+qWZmOm2v2uf4JV1xcNcKDqUB99Zb0ot4exLLlI4wdia+nclxzh4I
	 n/zPKTNMZ6Cl9P+O+Rt/wAYi4tXxgd6iD9iRMSW/pGKVCLiyx41b/Sp6LCNjIUimrJ
	 WNCv6zb/jjdoQ==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5b0231a3e86so1711813e87.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Jul 2026 23:46:31 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqZsJsivSgWlz0o7kilLj+4nQ4t6SDX4a6/OFbNFrJAuRGu5k8AXZpxbBeJT5EVuPIwXGAZaHqXM6djjSId8Hua@lists.infradead.org
X-Gm-Message-State: AOJu0Yw0XXb9d1CnOzN+8ZaIBdtkNE6ziocP05VPv5LdZo4GePzKZ6N+
	DajQRd+hs8420NDIF2Y0/X/jhAwVbOz3mrWOenRWAyEnO+qapC8ZzzK2NgzfQZGP6wggrOimnSz
	r6L9sLLX5K3VDR3LL/WvZcNOtL1YSKhc=
X-Received: by 2002:a05:6512:3b11:b0:5ae:bfa0:54f1 with SMTP id
 2adb3069b0e04-5b2e4f969e1mr490370e87.59.1785566790672; Fri, 31 Jul 2026
 23:46:30 -0700 (PDT)
MIME-Version: 1.0
References: <20260730104330.81367-1-longzhao@ambarella.com> <20260730104330.81367-5-longzhao@ambarella.com>
In-Reply-To: <20260730104330.81367-5-longzhao@ambarella.com>
From: Linus Walleij <linusw@kernel.org>
Date: Sat, 1 Aug 2026 08:46:18 +0200
X-Gmail-Original-Message-ID: <CAD++jL=Zw0_jKj4FiVHAVC6ASjRJgOF6WswAJBZD=Y3nQCAauA@mail.gmail.com>
X-Gm-Features: AUfX_myXQ9tmFb62wnb9uBwgjcMdvhCxVtgyWuLAaEHToUKhGjWH6cV58R5yeJI
Message-ID: <CAD++jL=Zw0_jKj4FiVHAVC6ASjRJgOF6WswAJBZD=Y3nQCAauA@mail.gmail.com>
Subject: Re: [PATCH 04/10] dt-bindings: pinctrl: add Ambarella CV75 pinctrl
To: Long Zhao <longzhao@ambarella.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	devicetree@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	linux-serial@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, linux-kernel@vger.kernel.org
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
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hi Long,

thanks for your patch!

On Thu, Jul 30, 2026 at 12:44=E2=80=AFPM Long Zhao <longzhao@ambarella.com>=
 wrote:

> +  "^[a-z0-9-]+-pins$":
> +    type: object
> +    allOf:
> +      - $ref: pinmux-node.yaml#
> +      - $ref: pincfg-node.yaml#
> +    additionalProperties: false
> +
> +    properties:
> +      function: true
> +
> +      pinmux:
> +        $ref: /schemas/types.yaml#/definitions/uint32-array
> +        minItems: 1
> +        maxItems: 96
> +
> +      bias-disable: true
> +      bias-pull-down: true
> +      bias-pull-up: true
> +
> +      drive-strength:
> +        enum: [3, 4, 5, 6, 7, 8, 9, 12]
> +
> +    required:
> +      - function
> +      - pinmux

Usually either (function + group) OR pinmux is used, so this looks
slightly confusing to me.

> +        uart0-pins {
> +            function =3D "uart0";
> +            pinmux =3D <AMBA_PINMUX(44, 1)>,
> +                     <AMBA_PINMUX(45, 1)>;
> +            bias-disable;
> +            drive-strength =3D <8>;
> +        };
> +    };

So I take it that "pinmux" is used for all the muxing while the function "u=
art0"
is actually only used for the pin configs, right?

It would be better to encode the groups into the driver I think and then it
would look like this:

       uart0-pins {
           function =3D "uart0";
           groups =3D "uart0tx", "uart0rx";
           bias-disable;
           drive-strength =3D <8>;
       };

As you can see "uart0tx" is easier to read and understand than
<AMBA_PINMUX(44, 1)>.

Also it hides constants nicely in the driver. I know this is a lot of work.

I know a lot of companies like "pinmux" because it's simple and
convenient, but it really
isn't the best for developers writing device trees and debugging.

Yours,
Linus Walleij

