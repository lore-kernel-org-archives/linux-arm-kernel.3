Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5774C71159
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 16:38:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qh/bPhgYB8BGBR2+jcW0IGtLNhZSnLlYIiYH5iijHGI=; b=1Lu3wYGiJ7bmoMxNJsEW1tb+cT
	paiVXovDXC6wwEftFHivkJFwGln+/z0n2q8a/w7itQ3TkdBoTOATv3jc2tR7dxPjEIuw8W8KEz9OG
	ClK/eA4ZWANJ7lEXXvPlZpSSfhS0qOCpq5uqXpgsy4UGQMH8HqLTg1jYuInwI/GUNyL30uQBkFffP
	xDplAIpu8xWlc0ACgYsET/8kZLc8R03W+HULHhQWHLsEC44cC5qsxTjWVasnlGWkqB3iGUyPQ+foq
	FcTLZqu0IvL/7xmCBhM+/PTZatz13xz987ZVBZSsvz5pEvCNtteRECq5TJPFOKqM7efz8X+QEpexF
	QhYMV8GQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRCqH-000000051cx-3D4O;
	Mon, 16 Jun 2025 16:37:53 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRALE-00000004cbv-3K00
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Jun 2025 13:57:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 54B1343E30
	for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Jun 2025 13:57:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32FE5C4CEF6
	for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Jun 2025 13:57:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750082260;
	bh=NyizBTDfDWXK6sw8uHD082UVWglR8ES2/VkYsuwaR4w=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=H8ULzQPh/xdtTiMfI3eihUsGI91soNyJ6AwSVhjKDO4IOJN3V4MbJf8Fy4Hjq/oPp
	 2Nz2B/U4yIFMJwmnbkUKrRHPQlmnGxkQzpjpiCeObGnKgdgWNzsVdGM/wnAIfKzp77
	 OsClgdjfqK9hC7ntKJziHbTNlOcBTkzZtkxBTl+MoNrw4Prth4u5dv8z+GPcY3x8+Z
	 U2k1ZLAOc0Hf27lZEchtd7fnehD5vtVw0ubzu82UT3OAUYvJ2sHBVW6ZPHM2SMa5/b
	 3BkA+Ysg02RQ/8M/W2p7dGMiij+LRkAAw0f9T5daEgcrGL2oTSRbJk3qI+xDTglt9P
	 Rxa8e8y8zLkiw==
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-adb4e36904bso897930566b.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Jun 2025 06:57:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUff5I2vItFM0a7uDpw8TTObIbFujKGeonpY9Gxj0GEzqBNY++rLkGmA8coTJjZNaHulHF9iDPFWuqFI1XSOOiO@lists.infradead.org
X-Gm-Message-State: AOJu0YwDugyHrL2aGbubrHrF0MdzC/DNSJbDI3OVLqrL3/imRzrAek+D
	kl/jtRs3nI3D1SSePhECF78qb6jSUIKxkzym+emfBFuFJ6N6mU3n4ElXFU+B2qEKmejEoCAw2VA
	Q3bEl0TURIslU0oOmFZFUEt7yc6DmMg==
X-Google-Smtp-Source: AGHT+IHpdF6x/V/pazyqhO2sJpaXwkib8ZBd2w1M4Ij3Nkk6Wn/WfgezoqePwqWHQsTrHmBU64Y1n8FFZazVHIrz33o=
X-Received: by 2002:a17:907:7241:b0:ad2:3f9a:649f with SMTP id
 a640c23a62f3a-adfad60d405mr821849566b.42.1750082258737; Mon, 16 Jun 2025
 06:57:38 -0700 (PDT)
MIME-Version: 1.0
References: <20250615-axiado-ax3000-soc-and-evaluation-board-support-v2-0-341502d38618@axiado.com>
 <20250615-axiado-ax3000-soc-and-evaluation-board-support-v2-4-341502d38618@axiado.com>
In-Reply-To: <20250615-axiado-ax3000-soc-and-evaluation-board-support-v2-4-341502d38618@axiado.com>
From: Rob Herring <robh@kernel.org>
Date: Mon, 16 Jun 2025 08:57:26 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJpb7wFw3DqX504LyS2PGbQxQfbBKh9VfCY8j7G9YKXiw@mail.gmail.com>
X-Gm-Features: AX0GCFuQPys5Thxu-nqBA43dpX9szemYIEtdKd5xHzL7MleeMvIzogZHZdn5g7w
Message-ID: <CAL_JsqJpb7wFw3DqX504LyS2PGbQxQfbBKh9VfCY8j7G9YKXiw@mail.gmail.com>
Subject: Re: [PATCH v2 4/6] arm64: dts: axiado: Add initial support for AX3000
 SoC and eval board
To: Harshit Shah <hshah@axiado.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, Arnd Bergmann <arnd@arndb.de>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-gpio@vger.kernel.org, soc@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_065740_899952_CD22298B 
X-CRM114-Status: GOOD (  20.38  )
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

On Sun, Jun 15, 2025 at 11:32=E2=80=AFPM Harshit Shah <hshah@axiado.com> wr=
ote:
>
> Add initial device tree support for the AX3000 SoC and its evaluation
> platform. The AX3000 is a multi-core SoC featuring 4 Cortex-A53 cores,
> Secure Vault, AI Engine and Firewall.
>
> This commit adds support for Cortex-A53 CPUs, timer, UARTs, and I3C
> controllers on the AX3000 evaluation board.
>
> Signed-off-by: Harshit Shah <hshah@axiado.com>
> ---
>  arch/arm64/boot/dts/Makefile              |   1 +
>  arch/arm64/boot/dts/axiado/Makefile       |   2 +
>  arch/arm64/boot/dts/axiado/ax3000.dtsi    | 584 ++++++++++++++++++++++++=
++++++
>  arch/arm64/boot/dts/axiado/ax3000_evk.dts |  72 ++++
>  4 files changed, 659 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/Makefile b/arch/arm64/boot/dts/Makefile
> index 79b73a21ddc22b17308554e502f8207392935b45..47dd8a1a7960d179ee28969a1=
d6750bfa0d73da1 100644
> --- a/arch/arm64/boot/dts/Makefile
> +++ b/arch/arm64/boot/dts/Makefile
> @@ -9,6 +9,7 @@ subdir-y +=3D amlogic
>  subdir-y +=3D apm
>  subdir-y +=3D apple
>  subdir-y +=3D arm
> +subdir-y +=3D axiado
>  subdir-y +=3D bitmain
>  subdir-y +=3D blaize
>  subdir-y +=3D broadcom
> diff --git a/arch/arm64/boot/dts/axiado/Makefile b/arch/arm64/boot/dts/ax=
iado/Makefile
> new file mode 100644
> index 0000000000000000000000000000000000000000..eb5e08ba0f39c32cdbfd586d9=
82849a80da30160
> --- /dev/null
> +++ b/arch/arm64/boot/dts/axiado/Makefile
> @@ -0,0 +1,2 @@
> +# SPDX-License-Identifier: GPL-2.0
> +dtb-$(CONFIG_ARCH_AXIADO) +=3D ax3000_evk.dtb
> diff --git a/arch/arm64/boot/dts/axiado/ax3000.dtsi b/arch/arm64/boot/dts=
/axiado/ax3000.dtsi
> new file mode 100644
> index 0000000000000000000000000000000000000000..d5d84986d18efe9dfbb446cee=
e42fc4e4dbf95d0
> --- /dev/null
> +++ b/arch/arm64/boot/dts/axiado/ax3000.dtsi
> @@ -0,0 +1,584 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Copyright (c) 2021-25 Axiado Corporation (or its affiliates). All rig=
hts reserved.
> + */
> +
> +/dts-v1/;
> +
> +#include <dt-bindings/interrupt-controller/irq.h>
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +/memreserve/ 0x3c0013a0 0x00000008;    /* cpu-release-addr */
> +/ {
> +       compatible =3D "axiado,ax3000";

Drop. As this is not valid and overridden anyways.

> +       interrupt-parent =3D <&gic500>;
> +
> +       aliases {
> +               i3c0 =3D &i3c0;
> +               i3c1 =3D &i3c1;
> +               i3c2 =3D &i3c2;
> +               i3c3 =3D &i3c3;
> +               i3c4 =3D &i3c4;
> +               i3c5 =3D &i3c5;
> +               i3c6 =3D &i3c6;
> +               i3c7 =3D &i3c7;
> +               i3c8 =3D &i3c8;
> +               i3c9 =3D &i3c9;
> +               i3c10 =3D &i3c10;
> +               i3c11 =3D &i3c11;
> +               i3c12 =3D &i3c12;
> +               i3c13 =3D &i3c13;
> +               i3c14 =3D &i3c14;
> +               i3c15 =3D &i3c15;
> +               i3c16 =3D &i3c16;
> +               serial0 =3D &uart0;
> +               serial1 =3D &uart1;
> +               serial2 =3D &uart2;
> +               serial3 =3D &uart3;
> +       };
> +
> +       cpus {
> +               #address-cells =3D <2>;
> +               #size-cells =3D <0>;
> +
> +               cpu0: cpu@0 {
> +                       device_type =3D "cpu";
> +                       compatible =3D "arm,cortex-a53";
> +                       reg =3D <0x0 0x0>;
> +                       enable-method =3D "spin-table";
> +                       cpu-release-addr =3D <0x0 0x3c0013a0>;
> +                       d-cache-size =3D <0x8000>;
> +                       d-cache-line-size =3D <64>;
> +                       d-cache-sets =3D <128>;
> +                       i-cache-size =3D <0x8000>;
> +                       i-cache-line-size =3D <64>;
> +                       i-cache-sets =3D <256>;
> +                       next-level-cache =3D <&l2>;
> +               };
> +
> +               cpu1: cpu@1 {
> +                       device_type =3D "cpu";
> +                       compatible =3D "arm,cortex-a53";
> +                       reg =3D <0x0 0x1>;
> +                       enable-method =3D "spin-table";
> +                       cpu-release-addr =3D <0x0 0x3c0013a0>;
> +                       d-cache-size =3D <0x8000>;
> +                       d-cache-line-size =3D <64>;
> +                       d-cache-sets =3D <128>;
> +                       i-cache-size =3D <0x8000>;
> +                       i-cache-line-size =3D <64>;
> +                       i-cache-sets =3D <256>;
> +                       next-level-cache =3D <&l2>;
> +               };
> +
> +               cpu2: cpu@2 {
> +                       device_type =3D "cpu";
> +                       compatible =3D "arm,cortex-a53";
> +                       reg =3D <0x0 0x2>;
> +                       enable-method =3D "spin-table";
> +                       cpu-release-addr =3D <0x0 0x3c0013a0>;
> +                       d-cache-size =3D <0x8000>;
> +                       d-cache-line-size =3D <64>;
> +                       d-cache-sets =3D <128>;
> +                       i-cache-size =3D <0x8000>;
> +                       i-cache-line-size =3D <64>;
> +                       i-cache-sets =3D <256>;
> +                       next-level-cache =3D <&l2>;
> +               };
> +
> +               cpu3: cpu@3 {
> +                       device_type =3D "cpu";
> +                       compatible =3D "arm,cortex-a53";
> +                       reg =3D <0x0 0x3>;
> +                       enable-method =3D "spin-table";
> +                       cpu-release-addr =3D <0x0 0x3c0013a0>;
> +                       d-cache-size =3D <0x8000>;
> +                       d-cache-line-size =3D <64>;
> +                       d-cache-sets =3D <128>;
> +                       i-cache-size =3D <0x8000>;
> +                       i-cache-line-size =3D <64>;
> +                       i-cache-sets =3D <256>;
> +                       next-level-cache =3D <&l2>;
> +               };
> +
> +               l2: l2-cache0 {
> +                       compatible =3D "cache";
> +                       cache-size =3D <0x100000>;
> +                       cache-unified;
> +                       cache-line-size =3D <64>;
> +                       cache-sets =3D <1024>;
> +                       cache-level =3D <2>;
> +               };
> +       };
> +
> +       timer:timer {
> +               compatible =3D "arm,armv8-timer";
> +               interrupt-parent =3D <&gic500>;
> +               interrupts =3D <GIC_PPI 13 IRQ_TYPE_LEVEL_HIGH>,
> +                          <GIC_PPI 14 IRQ_TYPE_LEVEL_HIGH>,
> +                          <GIC_PPI 11 IRQ_TYPE_LEVEL_HIGH>,
> +                          <GIC_PPI 10 IRQ_TYPE_LEVEL_HIGH>;
> +               arm,cpu-registers-not-fw-configured;

Drop. Not valid for arm64. And new platforms should fix the firmware anyway=
s.

Rob

