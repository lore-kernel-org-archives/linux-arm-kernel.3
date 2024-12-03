Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14439E64ABB
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 15:37:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N9ct1kVI68mHIDVHyGKkb/UxzcQ9qI2NSHiJbGWgjuE=; b=Ei2nB4qe3wr1pK
	zt6eInppTG0n0oATQrP2VHJfLuGPvENxAwZMpN/bgLsrkCkG7UG6OMk2TyXHTQzwbwKM9FU7Sx0jq
	hhZXtvcV5qGQylkahN4OOw9hBhGaCGOt+oY6VijlXSQ/xHSZJ4t8uyqpo4aacuvZtH0IjHm1JWsxS
	KkgZQcqG53Xll6gZeV1QncIFSzd9vRpMLCPhsnIrLFVK9He7Iy5/HBbE4oWVgflq+lIWNG/7muOMg
	SUkwWr0DuF3qsv6aX9Ax9A2c3bdmucWxGz54LNWv9AT1pm8vuqUwZp+5cgwTYgEzbFRe+ZoMrfJqc
	IxLLd7XDixHRBMTWG/Mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIUxN-00000009xLI-1cRV;
	Tue, 03 Dec 2024 15:36:57 +0000
Received: from mail-lf1-f47.google.com ([209.85.167.47])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIUvC-00000009wpK-397A
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Dec 2024 15:34:44 +0000
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-53df1d1b6e8so5800575e87.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Dec 2024 07:34:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733240078; x=1733844878;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=N9ct1kVI68mHIDVHyGKkb/UxzcQ9qI2NSHiJbGWgjuE=;
        b=oLZqO5AIAJOVJxKwGtxa34LZ08H8NxUR53Sw4ApkbyxX+rrJoBd8FXmwlXNqn8ywrM
         ZXhYAT+Q2d/w1KCY41+ETF/llmws/P0ZN8h7sW0lq1MCCvCjktnr3i/XjeWnK8V1+DNQ
         se/C2HKrPMBQ4q2NO0saxnQN7rO/2C5mVPcL4ZaG9uM490qYsGF/03WcEz3zRFqucU7+
         yi9EUxpvBuClZURS5oY1c4JjEtFePdmUQ+r6rXQuBgTRLq9bju2azEZsW5lDMFlDMfuC
         +K8GOuQjOeCCKms4uoKLP/gSsy6j6R5+jB66J192B+W4wi8oQcJhOo9tn9lScVceMSJp
         MKTA==
X-Forwarded-Encrypted: i=1; AJvYcCV8fvRA+LX1tzXglO14vIaIbHNFkd0qnKdrMziXCuOSJsPeJtoNRjORZvVmKwfpMblKGce9+7UEBfFJt7D9fBDL@lists.infradead.org
X-Gm-Message-State: AOJu0YwLcZcZCYrtfQh/3vtEzWZSV8ikhY1q73ifRmk47wAHZbx6Fl52
	ZmCTU+8Fuvg4IVyeFaRus7stznT4WT6kmyf2fZ5/JK+mKnmspBu8jkAS+RRO
X-Gm-Gg: ASbGncuanzLgXItWJrBDbPhfEVvgR1HfgI+OK/TlZ9LRfT5CpC6DKws80Zs8SCiS1ou
	OjAmK8mbapgv7+y0ACm9NceCfhQasqQ4CFdSKgWHv0Nb3t2mYuaPTc165sNGy/M2QUfTWZSUtbq
	AvrgRlY7nhcEilZl0zSueybVh8+Tl5gQjf3WeSoB5I4fs3C7p+AcgS7muwvzwwKOdPnUXZYH4E4
	9fpNiFAyCj76RsJPQ/cGiDgsSKBmZhPk3Ugv26L/SQxSC+fD0vWw+KouwkeCk5S3ji+vimJ/4/K
	kXM894o=
X-Google-Smtp-Source: AGHT+IEqFY4igUExWuXWlJvdAG/Ud0P0MvUb0ghjw7aQlkndPsDn9UdXaiTX8zdSN8LHh0fsFtQMyQ==
X-Received: by 2002:a05:6512:238b:b0:53d:aec4:3440 with SMTP id 2adb3069b0e04-53e1b890e97mr384128e87.32.1733240077648;
        Tue, 03 Dec 2024 07:34:37 -0800 (PST)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com. [209.85.208.173])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53df6443426sm1859617e87.94.2024.12.03.07.34.36
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Dec 2024 07:34:37 -0800 (PST)
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2ffb5b131d0so55838281fa.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Dec 2024 07:34:36 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWNvqj33LbDmBSj8GDADdH+PnWKDn0ZThfXAika26spVDaTVhEuek7LtSoW5D0Aj7EhlCBTRHqbpDP5uidiDTZE@lists.infradead.org
X-Received: by 2002:a2e:be1c:0:b0:2ff:cb09:ccae with SMTP id
 38308e7fff4ca-30014e22085mr2966011fa.17.1733240076014; Tue, 03 Dec 2024
 07:34:36 -0800 (PST)
MIME-Version: 1.0
References: <20241202-a100-syscon-v1-0-86c6524f24d7@epochal.quest> <20241202-a100-syscon-v1-2-86c6524f24d7@epochal.quest>
In-Reply-To: <20241202-a100-syscon-v1-2-86c6524f24d7@epochal.quest>
From: Chen-Yu Tsai <wens@csie.org>
Date: Tue, 3 Dec 2024 23:34:23 +0800
X-Gmail-Original-Message-ID: <CAGb2v66RAyKrpn7EJMoPUzM6W6J-3ch0xwQnY7uBm6dXgFJ5bg@mail.gmail.com>
Message-ID: <CAGb2v66RAyKrpn7EJMoPUzM6W6J-3ch0xwQnY7uBm6dXgFJ5bg@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: allwinner: a100: Add syscon nodes
To: Cody Eksal <masterr3c0rd@epochal.quest>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Parthiban Nallathambi <parthiban@linumiz.com>, 
	Andre Przywara <andre.przywara@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_073442_785452_319991F3 
X-CRM114-Status: GOOD (  18.40  )
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
Reply-To: wens@csie.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Mon, Dec 2, 2024 at 12:43=E2=80=AFPM Cody Eksal <masterr3c0rd@epochal.qu=
est> wrote:
>
> The Allwinner A100 has a system configuration block, denoted as SYS_CFG
> in the user manual's memory map. It is undocumented in the manual, but
> a glance at the vendor tree shows this block is similar to its
> predecessors in the A64 and H6. The A100 also has 3 SRAM blocks: A1, A2,
> and C. Add all of these to the SoC's device tree.
>
> Signed-off-by: Cody Eksal <masterr3c0rd@epochal.quest>
> ---
>  arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi | 31 ++++++++++++++++++++=
++++++
>  1 file changed, 31 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi b/arch/arm64/=
boot/dts/allwinner/sun50i-a100.dtsi
> index 29ac7716c7a5284ccf8af675db9c7d016785f0ff..31540a7ca1f01c6c2e69e3290=
54aca16ffd112c4 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi
> @@ -101,6 +101,37 @@ soc {
>                 #size-cells =3D <1>;
>                 ranges =3D <0 0 0 0x3fffffff>;
>
> +               syscon: syscon@3000000 {
> +                       compatible =3D "allwinner,sun50i-a100-system-cont=
rol",
> +                                    "allwinner,sun50i-a64-system-control=
";
> +                       reg =3D <0x03000000 0x1000>;
> +                       #address-cells =3D <1>;
> +                       #size-cells =3D <1>;
> +                       ranges;
> +
> +                       sram_a1: sram@20000 {
> +                               compatible =3D "mmio-sram";
> +                               reg =3D <0x00020000 0x4000>;
> +                               #address-cells =3D <1>;
> +                               #size-cells =3D <1>;
> +                               ranges =3D <0 0x00020000 0x4000>;
> +                       };

Each child node should have an empty line preceding it, as mentioned
in the dts coding style doc:

    Documentation/devicetree/bindings/dts-coding-style.rst

ChenYu

> +                       sram_c: sram@24000 {
> +                               compatible =3D "mmio-sram";
> +                               reg =3D <0x024000 0x21000>;
> +                               #address-cells =3D <1>;
> +                               #size-cells =3D <1>;
> +                               ranges =3D <0 0x024000 0x21000>;
> +                       };
> +                       sram_a2: sram@100000 {
> +                               compatible =3D "mmio-sram";
> +                               reg =3D <0x0100000 0x14000>;
> +                               #address-cells =3D <1>;
> +                               #size-cells =3D <1>;
> +                               ranges =3D <0 0x0100000 0x14000>;
> +                       };
> +               };
> +
>                 ccu: clock@3001000 {
>                         compatible =3D "allwinner,sun50i-a100-ccu";
>                         reg =3D <0x03001000 0x1000>;
>
> --
> 2.47.1
>

