Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71BE9D0C614
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 14:10:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IUx9mkzB7z8iaJH1DYALuYKXnCWuAd2L3YOKskqAexM=; b=BrwXsU1My4j4ge95xx3fcEjqex
	8KkGYp2fX+iEF2/tFR5DjLUPfbHLMWw0To0ARkIFEMK5GBPvq485vsN2pcgawyjnQ+1nM77p6T0bV
	FupukM0Bq8LdT9gMoZ8wtph0guZaTwedEMqz1uEsQdQZsR/wqcaTsXwkG+Mr8yu4IBV8kDVuk1Z7B
	1bP6VeaJk90PeKG5YGtBXOxz25gfCbBr8TmzeiM7AMsBBDQh2hD7LoqrvRMeSzsfJOBZP6olYz4N4
	C5FeY7DazsyqauYLQi1dW7aTWC+roSogcmA5AEWWbhdNNJUJwaBJCZJ3UT42AtyDrVNWwVSc/awIi
	tK4NblGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4L1U-00000003wmR-1gE4;
	Fri, 25 Oct 2024 14:10:40 +0000
Received: from mail-yw1-f169.google.com ([209.85.128.169])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4Kp8-00000003uH8-0LXj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Oct 2024 13:57:55 +0000
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-6e390d9ad1dso18265667b3.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Oct 2024 06:57:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729864671; x=1730469471;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IUx9mkzB7z8iaJH1DYALuYKXnCWuAd2L3YOKskqAexM=;
        b=bkuEJgFKT6PHIlRqe2pquJzKBqMcDWiNP4hlTgcjRUy+bSnuCsG4Gk+0ugCt8WuafB
         1RWi9QRH9ArL3tivKYLE3Q2fgkJ98y/pWC6MGmKIAdMBk9fTWHFgRmwaq5iQmKC2JETT
         2rd9tZeklvSqwt6C5YpXxcCIcsjXLIPlmFxc91q5hE9eZbRzzcPurP/t1+NDmt1MR4AM
         32joaZ8Q7Di+t5JOXXgdG69/8V1aKoLiRP0zqvFcPa7hrISIqvh1BHEvEpDphQPE+89C
         zoqfnGQvKvZ6Yk3oKe9DXOheyt1G/rflgEWpaOajd5bk1QXRo5WJnfr9HryBZxHmrz0a
         BD/A==
X-Forwarded-Encrypted: i=1; AJvYcCVavsn0XWA4CJZEZE9582VkXugQwfac3XTMfZ6B1gBP+lVZAe62R+AZeJ7jiNnkmwcyOfoxdAu6ykK+YIICrjwd@lists.infradead.org
X-Gm-Message-State: AOJu0YxR38B8TreEkZX/hPM6OOEckkEXEGI/dtwb7pcASrxHVLHva64f
	4s5bQ86QxdRUFUzypXpTpT4c0G85dj5eQlPSg0jZYY0WSmFJK5U5pijuMJDm
X-Google-Smtp-Source: AGHT+IGHpLbx14+GgeYFiyeeBZqgYrt/B6n6Tw/1qOftDFssJTfgaOKYdA0oyo8wsESKialBXaPj+A==
X-Received: by 2002:a05:690c:6507:b0:6e3:21fa:e50f with SMTP id 00721157ae682-6e7f0defbf4mr113073717b3.13.1729864671509;
        Fri, 25 Oct 2024 06:57:51 -0700 (PDT)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com. [209.85.128.176])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e9c6bde0a7sm2846737b3.36.2024.10.25.06.57.51
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Oct 2024 06:57:51 -0700 (PDT)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-6e59a9496f9so24982867b3.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Oct 2024 06:57:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXsJsb0D7vFeK8MIK83cLf5Q1Kej/uDT8Kl6wYOZ4FfWbyOJlrFNVueF2X8hjNCs5WWy2mx8TChCpMmzSKZPWhr@lists.infradead.org
X-Received: by 2002:a05:690c:4249:b0:6e3:2be1:a2dc with SMTP id
 00721157ae682-6e7f0dee4fcmr84030847b3.11.1729864671059; Fri, 25 Oct 2024
 06:57:51 -0700 (PDT)
MIME-Version: 1.0
References: <20240219-add-am64-som-v7-0-0e6e95b0a05d@solid-run.com> <20240219-add-am64-som-v7-4-0e6e95b0a05d@solid-run.com>
In-Reply-To: <20240219-add-am64-som-v7-4-0e6e95b0a05d@solid-run.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 25 Oct 2024 15:57:38 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXTgpTnJ9U7egC2XjFXXNZ5uiY1O+WxNd6LPJW5Rs5KTw@mail.gmail.com>
Message-ID: <CAMuHMdXTgpTnJ9U7egC2XjFXXNZ5uiY1O+WxNd6LPJW5Rs5KTw@mail.gmail.com>
Subject: Re: [PATCH v7 4/4] arm64: dts: ti: hummingboard-t: add overlays for
 m.2 pci-e and usb-3
To: Josua Mayer <josua@solid-run.com>
Cc: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Yazan Shhady <yazan.shhady@solid-run.com>, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_065754_164145_DC12A8C0 
X-CRM114-Status: GOOD (  21.52  )
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

Hi Josua,

On Mon, Feb 19, 2024 at 4:05=E2=80=AFPM Josua Mayer <josua@solid-run.com> w=
rote:
> HummingBoard-T features two M.2 connectors labeled "M1" and "M2".
> The single SerDes lane of the SoC can be routed to either M1 pci-e
> signals, or M2 usb-3 signals by a gpio-controlled mux.
>
> Add overlays for each configuration.
>
> Signed-off-by: Josua Mayer <josua@solid-run.com>

Thanks for your patch, which is now commit bbef42084cc170cb ("arm64:
dts: ti: hummingboard-t: add overlays for m.2 pci-e and usb-3") in v6.9.

> --- /dev/null
> +++ b/arch/arm64/boot/dts/ti/k3-am642-hummingboard-t-usb3.dtso
> @@ -0,0 +1,44 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Copyright (C) 2023 Josua Mayer <josua@solid-run.com>
> + *
> + * Overlay for SolidRun AM642 HummingBoard-T to enable USB-3.1.
> + */
> +
> +/dts-v1/;
> +/plugin/;
> +
> +#include <dt-bindings/phy/phy.h>
> +
> +#include "k3-serdes.h"
> +
> +&serdes0 {
> +       #address-cells =3D <1>;
> +       #size-cells =3D <0>;
> +
> +       serdes0_link: phy@0 {
> +               reg =3D <0>;
> +               cdns,num-lanes =3D <1>;
> +               cdns,phy-type =3D <PHY_TYPE_USB3>;
> +               #phy-cells =3D <0>;
> +               resets =3D <&serdes_wiz0 1>;
> +       };
> +};
> +
> +&serdes_ln_ctrl {
> +       idle-states =3D <AM64_SERDES0_LANE0_USB>;
> +};
> +
> +&serdes_mux {
> +       idle-state =3D <0>;
> +};
> +
> +&usbss0 {
> +       /delete-property/ ti,usb2-only;

/delete-property/ (and /delete-node/) to delete something in the base DTS
does not work.

> +};
> +
> +&usb0 {
> +       maximum-speed =3D "super-speed";
> +       phys =3D <&serdes0_link>;
> +       phy-names =3D "cdns3,usb3-phy";
> +};

You can run

    dtx_diff --color arch/arm64/boot/dts/ti/k3-am642-hummingboard-t{,-usb3}=
.dtb

to verify.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

