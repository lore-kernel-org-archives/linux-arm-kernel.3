Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C036D0C61F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 15:08:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Vzo4e/k7vyxD+TY11vnCaJqkkqd2B+yShJL3uWcZknQ=; b=vP4ui+kMe9GcE+
	TTgFS4d9bjobHPV097SnqOdpyZ75H1qB/VZGPzxoWtqY7qnlCmrcMwLrxIL1gFj7GBeu2lWYJuo1h
	RK/eSHAvn7bXBuwDN6LqgDKD9cFhGIwzQ46tLjcZSf0xMwO3L1uOoZc5UvbXC2C+7VcscX+aJsO12
	lXrt6ntuwU4t4aqC5uWqk04KmvCTaV63LtsFPP+Gx9CFhmraZq7fIU1dl0UW0uBpUPGnL7661Y8Zf
	h+ZA6vx64QbTS7fpWf6LxzIAYesFCViZWCyRpKxZcSGFErvk+jcCRKAoK0U1AwmigYHA59tv3b9zL
	/WLW6QTQWawbxin+mKKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4LvW-000000049fV-1inL;
	Fri, 25 Oct 2024 15:08:34 +0000
Received: from mail-io1-f44.google.com ([209.85.166.44])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4LWT-000000043W4-3eYm
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Oct 2024 14:42:43 +0000
Received: by mail-io1-f44.google.com with SMTP id ca18e2360f4ac-83abdaf8a26so85487439f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Oct 2024 07:42:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729867354; x=1730472154;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Vzo4e/k7vyxD+TY11vnCaJqkkqd2B+yShJL3uWcZknQ=;
        b=OowHFudCmZM8oBa0gT95gw5soUdxljGMlBmdNY9+j47+abZO6dFu3M1tq4OPT5qVoA
         98wWR4BHxvxQeFWkyzvrkRjRxJpjUZ221zIAlzN0WqVe6526mzKrZTVwfU1orHkprtoF
         p1rGqaYojGHRrLemMFN61CsofWAPChWhxAVv1nw3jaFO+tM7HsGv04LksBqsOFHPS7eP
         YFbUH4W0HkAOkIisY03tYCj84dsmpHp7M6p8DE+GFDtBtmmR+bRcLKTjd4li8QjuwnEF
         Xxoa7eamLppLbV7nOXmMQGdV3u2MyVB5lKAMamqhY8rVLtdq5pgI2WMGxSt4E1OX3w3m
         R8gQ==
X-Forwarded-Encrypted: i=1; AJvYcCWkTSzDhiNM2hUo+gSzEICFwZR0ytC2c9GZL9KDKA5vNclD6GYqFBYdKVFTJtFEUi6qZfYmk8QqRQ4kIDXow6gt@lists.infradead.org
X-Gm-Message-State: AOJu0YxbDvrB+/bLjxshISHRwtlSUTYOnksK4g1TTBpB20IewadfIpWl
	dCDq+HPm0KGp/ATfYbMdilhnbKbdzaKVVxD9tES9pWu6QQsO2lIA1bqep6q5
X-Google-Smtp-Source: AGHT+IE5BBIiuNtWHlbp2UaqtXdg5DQ6dswQJf6ReN2ILszTYz4PwgAoF31oWYvmEiZwgH7KxqdHtg==
X-Received: by 2002:a05:6602:2c06:b0:81f:75bf:6570 with SMTP id ca18e2360f4ac-83b04018a71mr827194539f.5.1729867354145;
        Fri, 25 Oct 2024 07:42:34 -0700 (PDT)
Received: from mail-io1-f43.google.com (mail-io1-f43.google.com. [209.85.166.43])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-83b137de1bfsm25646439f.13.2024.10.25.07.42.30
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Oct 2024 07:42:30 -0700 (PDT)
Received: by mail-io1-f43.google.com with SMTP id ca18e2360f4ac-83aff992087so87830939f.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Oct 2024 07:42:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV4nsriliPuFVldaiDYleUo6zznfRgNarriFnVZtep47wNWDnvrqe+ZrSBy5wfMySma9d8i6LJnzHUKjlX0e+er@lists.infradead.org
X-Received: by 2002:a05:6602:1490:b0:837:f951:38ce with SMTP id
 ca18e2360f4ac-83b040307c1mr597475039f.8.1729867350576; Fri, 25 Oct 2024
 07:42:30 -0700 (PDT)
MIME-Version: 1.0
References: <20241007222916.19013-1-andre.przywara@arm.com>
In-Reply-To: <20241007222916.19013-1-andre.przywara@arm.com>
From: Chen-Yu Tsai <wens@csie.org>
Date: Fri, 25 Oct 2024 22:42:14 +0800
X-Gmail-Original-Message-ID: <CAGb2v65oHDkNG4dp3+Zh-wmMTMvRnBNPGLiGi68WGXzSR+64=g@mail.gmail.com>
Message-ID: <CAGb2v65oHDkNG4dp3+Zh-wmMTMvRnBNPGLiGi68WGXzSR+64=g@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: cubieboard4: Fix DCDC5 regulator constraints
To: Andre Przywara <andre.przywara@arm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_074241_939763_C9848D52 
X-CRM114-Status: GOOD (  22.02  )
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

On Tue, Oct 8, 2024 at 6:30=E2=80=AFAM Andre Przywara <andre.przywara@arm.c=
om> wrote:
>
> The DCDC5 voltage rail in the X-Powers AXP809 PMIC has a resolution of
> 50mV, so the currently enforced limits of 1.475 and 1.525 volts cannot
> be set, when the existing regulator value is beyond this range.
>
> This will lead to the whole regulator driver to give up and fail
> probing, which in turn will hang the system, as essential devices depend
> on the PMIC.
> In this case a bug in U-Boot set the voltage to 1.75V (meant for DCDC4),
> and the AXP driver's attempt to correct this lead to this error:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [    4.447653] axp20x-rsb sunxi-rsb-3a3: AXP20X driver loaded
> [    4.450066] vcc-dram: Bringing 1750000uV into 1575000-1575000uV
> [    4.460272] vcc-dram: failed to apply 1575000-1575000uV constraint: -E=
INVAL
> [    4.474788] axp20x-regulator axp20x-regulator.0: Failed to register dc=
dc5
> [    4.482276] axp20x-regulator axp20x-regulator.0: probe with driver axp=
20x-regulator failed with error -22
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> Set the limits to values that can be programmed, so any correction will
> be successful.
>
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Maybe

Fixes: 1e1dea72651b ("ARM: dts: sun9i: cubieboard4: Add AXP809 PMIC
device node and regulators")

What do you think? I can add it when applying.

ChenYu

> ---
>  arch/arm/boot/dts/allwinner/sun9i-a80-cubieboard4.dts | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm/boot/dts/allwinner/sun9i-a80-cubieboard4.dts b/arch=
/arm/boot/dts/allwinner/sun9i-a80-cubieboard4.dts
> index c8ca8cb7f5c94..52ad95a2063aa 100644
> --- a/arch/arm/boot/dts/allwinner/sun9i-a80-cubieboard4.dts
> +++ b/arch/arm/boot/dts/allwinner/sun9i-a80-cubieboard4.dts
> @@ -280,8 +280,8 @@ reg_dcdc4: dcdc4 {
>
>                         reg_dcdc5: dcdc5 {
>                                 regulator-always-on;
> -                               regulator-min-microvolt =3D <1425000>;
> -                               regulator-max-microvolt =3D <1575000>;
> +                               regulator-min-microvolt =3D <1450000>;
> +                               regulator-max-microvolt =3D <1550000>;
>                                 regulator-name =3D "vcc-dram";
>                         };
>
> --
> 2.46.2
>

