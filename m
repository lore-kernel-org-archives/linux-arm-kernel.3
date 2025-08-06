Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFA20C87FD1
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Aug 2025 09:42:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uDkF0BLoXFgSE926je2WgpTyIl4N2UFYP5ht23EU0t4=; b=sCHzqbLGB5eDiDA47bPCP6jg0n
	cZzAVeF8o6h1vt6UJ3dSyK3mx5XkKGZMmkI5LXcHLQYd0GFfyThXjieLltyQw/TXX/09fbDd07PVk
	/776vS0jsxRnPLKykztJBqT/w96FswVRRe+Nm3AQ2Si9YTGsejKnWblrVMRPlNQ6qkBxpcSn4rSdz
	RpDSMd+GbfyDI/VjThexIyw3zXCby+gM+rKW/Ea3vQ9yvlQosl8RiHt7eXbiZlg/L+oydrXO+jI3E
	1L18qYhFHTZKfYWjLxVjMOftjEPL7bNpV+sATlvtbvK8xIK26UAtrxIWB/8DC9m9IsLQZ4en8fw3b
	ocgA03jQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujafG-0000000Eo3g-40nS;
	Wed, 06 Aug 2025 09:42:30 +0000
Received: from mail-vk1-f169.google.com ([209.85.221.169])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujaYX-0000000EmqD-0Fu8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Aug 2025 09:35:34 +0000
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-5393a970209so3368579e0c.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 06 Aug 2025 02:35:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754472932; x=1755077732;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uDkF0BLoXFgSE926je2WgpTyIl4N2UFYP5ht23EU0t4=;
        b=TiyG/BqIP7hHqAEE+ZywB3+WM5wGeamvO60gCT+l9CV5mCVez15nQybgJm6YK2yOqr
         L1/SX69BEnzth2mXa5Y7cNPqcnV2Ampa2naeuSpVSjNcdtSlQl+/y9ZCHVYU4OofEaer
         aUQG2JBfS8rJ3DHH0fctQtDNNIPNCSmjZAbqzuwGNoHEnXj7Ei6F0EhpNyTz8yiWum2I
         pUZ87PZlSGO/AN1CkbF1DxAB1JgFQCE3K6Y/33O24KlcGRoukOBj86upfvPqefpAwkV0
         FuLpFKXGekdIR6J+VRy7W8YqmCTsgB++iG9/1fg+GXOArQHlbeFLA9AItv1mNzJLmFPd
         yoMA==
X-Gm-Message-State: AOJu0YxfjqRYjU8P8zI0/glD8/wF1fzYmgRuEYqpa+I3LcSvXeiVTrFJ
	/EdF+QjHxMimFg1l1bgmyMgs7UcFvtbD0Ua7DM/tlG6lYW/XVQG/6RG6NA+Jo6L+
X-Gm-Gg: ASbGnctHm24PTui8qItUNTP3YsdH0cmwQYGyog4vVf4S08V225MbLOn7g1YDzB9MOof
	9nEpLj0cFVEd6wlsCcI0pA5BN6TbKA8ghUxeIBs1L9k+C6Uk2/HAhfdqD50ZKmrQc0mh/+nHVU5
	Yi095iKyH70fEGt8ON8MInXG9rNNzEs11kXJjAmJHfqQ7aK1l4qUHZzwyWtLBJCr1ThYHrZ7LFI
	Nx4tAVmACO1v+RFI+LURI2BzoyCBNF4s6u5D3kVxjiftiKgfMyswxNy09fQrqTCpwobyBvlpT4v
	OZvCzLIh8IsDCVEV5lmX515tA1AIBscSB22ueqqnqOBhCmTukk40BlqpHjFAd3+09XVMDVTcmcS
	2vzLgBAa6SQ8VmrqlBJ9P1J3Bow8JUeLZfD2LvivD0/vkklVgAxGvtEfLaNH/
X-Google-Smtp-Source: AGHT+IGi7OqP3fUVfFzLjmX4wTun4gl+NT13JUeMchbzeU3Ialx/2vpq2+KNBEFL5Exuo2BK+jJLLg==
X-Received: by 2002:a05:6122:7c8:b0:537:642b:45fd with SMTP id 71dfb90a1353d-539a03a4494mr879190e0c.2.1754472931418;
        Wed, 06 Aug 2025 02:35:31 -0700 (PDT)
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com. [209.85.217.47])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-53936b5909asm4101969e0c.8.2025.08.06.02.35.30
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Aug 2025 02:35:31 -0700 (PDT)
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-4fe7712bedaso3534968137.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 06 Aug 2025 02:35:30 -0700 (PDT)
X-Received: by 2002:a67:e715:0:b0:4e5:fe5e:2be4 with SMTP id
 ada2fe7eead31-50374836fa4mr834200137.22.1754472930463; Wed, 06 Aug 2025
 02:35:30 -0700 (PDT)
MIME-Version: 1.0
References: <20250625100330.7629-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20250625100330.7629-1-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 6 Aug 2025 11:35:19 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV3=c24KxO_Sbt50FGsFnNVYNnHAUhk-yoa+nM1f+7+kA@mail.gmail.com>
X-Gm-Features: Ac12FXxkFhtyguB3aGvA7SYrNZpS8Rh9K4bGzADHoB8_URkfClNeKozYh9_ZFkU
Message-ID: <CAMuHMdV3=c24KxO_Sbt50FGsFnNVYNnHAUhk-yoa+nM1f+7+kA@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: r8a779g3: Update thermal trip points
 on V4H Sparrow Hawk
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250806_023533_106840_D6C43F9A 
X-CRM114-Status: GOOD (  27.58  )
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

Hi Marek,

On Wed, 25 Jun 2025 at 12:03, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Since the Sparrow Hawk has a smaller PCB than the White Hawk, it tends
> to generate more heat. To prevent potential damage to the board, adjust
> the temperature trip points.
>
> Add four "passive" trip points which increasingly throttle the CPU to
> prevent overheating. The first trip point at 68=C2=B0C disables the 1.8 G=
Hz
> and 1.7 GHz modes and limits the CPU to 1.5 GHz frequency. The second
> trip point at 72=C2=B0C disables the 1.5 GHz mode and limits the CPU to 1=
.0
> GHz frequency. The third trip point at 76=C2=B0C uses thermal-idle to sta=
rt
> inserting idle cycles into the CPU instruction stream to cool the CPU
> cores down. The fourth and last trip point at 80=C2=B0C disables the 1.0 =
GHz
> mode and limits the CPU to 500 MHz frequency.
>
> In case the SoC heats up further, in case either of the thermal sensors
> readings passes the 100=C2=B0C, a thermal shutdown is triggered to preven=
t
> any damage to the hardware.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts
> @@ -38,6 +38,7 @@
>
>  /dts-v1/;
>  #include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/thermal/thermal.h>
>
>  #include "r8a779g3.dtsi"
>
> @@ -797,3 +798,139 @@ &rwdt {
>  &scif_clk {    /* X12 */
>         clock-frequency =3D <24000000>;
>  };
> +
> +/* thermal-idle cooling for all SoC cores */
> +&a76_0 {

Please keep nodes sorted (alphabetically by label).

> +       #cooling-cells =3D <2>;

This is only present for the first CPU core, and map{0,1,3} refer
only to a76_0, because all four CPU cores are driven by a single clock
(Z0), right?

> +
> +       a76_0_thermal_idle: thermal-idle {
> +               #cooling-cells =3D <2>;
> +               duration-us =3D <10000>;
> +               exit-latency-us =3D <500>;
> +       };
> +};

> +/* THS sensor in SoC near CA76 cores does more progressive cooling. */
> +&sensor_thermal_ca76 {
> +       critical-action =3D "shutdown";
> +
> +       cooling-maps {
> +               /*
> +                * The cooling-device minimum and maximum parameters inve=
rsely
> +                * match opp-table-0 {} node entries in r8a779g0.dtsi, in=
 other
> +                * words, 0 refers to 1.8 GHz OPP and 4 refers to 500 MHz=
 OPP.
> +                * This is because they refer to cooling levels, where ma=
ximum
> +                * cooling level happens at 500 MHz OPP, when the CPU cor=
e is
> +                * running slowly and therefore generates least heat.

That applies to cooling-device =3D <&a76_[0-3] ...>...

> +                */
> +               map0 {
> +                       /* At 68C, inhibit 1.7 GHz and 1.8 GHz modes */
> +                       trip =3D <&sensor3_passive_low>;
> +                       cooling-device =3D <&a76_0 2 4>;
> +                       contribution =3D <128>;
> +               };
> +
> +               map1 {
> +                       /* At 72C, inhibit 1.5 GHz mode */
> +                       trip =3D <&sensor3_passive_mid>;
> +                       cooling-device =3D <&a76_0 3 4>;
> +                       contribution =3D <256>;
> +               };
> +
> +               map2 {
> +                       /* At 76C, start injecting idle states */
> +                       trip =3D <&sensor3_passive_hi>;
> +                       cooling-device =3D <&a76_0_thermal_idle 0 80>,
> +                                        <&a76_1_thermal_idle 0 80>,
> +                                        <&a76_2_thermal_idle 0 80>,
> +                                        <&a76_3_thermal_idle 0 80>;

... but what do "0 80" refer to? I couldn't find in the thermal-idle
bindings what exactly are the minimum and maximum cooling states here.

> +                       contribution =3D <512>;
> +               };

The rest LGTM, so with the sort order fixed, and the thermal-idle
states clarified:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

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

