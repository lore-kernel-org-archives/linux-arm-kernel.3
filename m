Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C83B2C3ABBF
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 17:25:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hUchLAT2CvoC+0spmKn93ymH4pNN6dMT06ZJPIMdE5s=; b=hF/e9iy0wSjbUv
	3J1SiXeQi0ZBGxOt1622Yhy0HbTw45cHojzuRlrDfIQ/GZZVq9D3njbvLMVb9O1+mNDiBnYBs4oMV
	ZzADNuM84LkHH21ZKn62flYGSK0FjsXjcYJd22ilkY1JssaQbhk4eB9OmP1/JPIZdToOaCo3UaVzT
	b54NRhiurTJ2vF1vSYZKejR/CdmUk+5KScM/A6t4B+0C1Ko3N7RlxxKQIrJthQo1510LP8WwHu4Wr
	PaefcyduOkl/bf9PSephhmvFgCLskTlpNk4BOhqIE2s8W0kiKuCZ/Z73wvNQYwKOlfLAiXUKYUz5m
	BcQ2KvvlESbArkeKAtYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCiWd-0000000GHzM-0xZ5;
	Wed, 07 May 2025 17:25:43 +0000
Received: from mail-lf1-f52.google.com ([209.85.167.52])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCgxu-0000000G1g9-0sLA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 May 2025 15:45:47 +0000
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5499614d3d2so6459539e87.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 May 2025 08:45:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746632743; x=1747237543;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hUchLAT2CvoC+0spmKn93ymH4pNN6dMT06ZJPIMdE5s=;
        b=QM+X6ZF0e+mO604FB3X5QgCNRqwWPJygN4vkLBZHuBuxLoQ0P2xqbiuE6CAG2rcmCK
         w2iVSK+GSeLIo0u1DoA3Cnuje6fsx/VR1ynwVnYWFQSt4iZjM95uvdeW6ksd1Egn5bKn
         2x83bvVEWdUw3cnUn4GuN4cc5hw2Lo/vM/p/OPCfIAh300LjQP+6zJ01tIj7FA76fpkM
         xyXgpHdhQd0hzog4yLnlemzMj1bB+yB1B3S3m24Oc4nQVrtLnBYcXJKBo/zLJ5wEsM03
         GReSWh8ENZ3Za/NY5s8bbsOVnTC6WNrsOtPRCxkkRZcwpHKZ7Fuo6DMJIhUvrcM9Ujvp
         q3HA==
X-Forwarded-Encrypted: i=1; AJvYcCXXIeVvtzdlGbwizFRfUxetlRP3s9fX8GMotstTLeYZ4aT6lDYesdnH+RcoepQ5wL3ei20QTYzGzmPJFXrdcCyZ@lists.infradead.org
X-Gm-Message-State: AOJu0YyJLJLnWFYSOksj+Fe3FL8dV4+jTJqyuujTZL0msxrWe+IQbQ3h
	9Ni4ffNYgmo53RjNbxU3RWvZ+suDSnSkqCUh1BU0U+RExNuEsVnLDurOuWaA
X-Gm-Gg: ASbGnctpAFtoKwlx84tazOusP1I2QSqMHFrCFp/xJXaYKh1gd5OK4L0d6VO0hit1pJd
	jTuRAQQ6yNbdA4r0kP0I/YdLdpUzc6BmIX1115jMg9YiU1KwCwy4l1R3cf4oqp/m5CtjPKVTguO
	1pR8jr8eFhIi3tE3JZUfJ444wOlFev5NHVD1o6lbcct+1aDD3tV0LTA57N8XI2ijVGBcAJQ1toQ
	Fr0XIT81OUvlWbnUS8v78DvSUh5WROfClCwbEzjZiO5SQqUqRkXZbkVc+tVTgshp49HQTGDpsLH
	dJIbvBrrW78/u2a1V/B7tllHkOAe0AGGROhBTBuhbby027nVteklu0oIHsv26My6FAZNwiOaPg=
	=
X-Google-Smtp-Source: AGHT+IHXrU9AvgV7I3HNIBckR8vyqfCm2zjydKLc28Hz/TZXNpvqeeIjg1WHtxpAiKxEbs0vK8O8Dg==
X-Received: by 2002:ac2:4bce:0:b0:549:8b24:989f with SMTP id 2adb3069b0e04-54fb9240a66mr1893847e87.0.1746632742739;
        Wed, 07 May 2025 08:45:42 -0700 (PDT)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com. [209.85.208.176])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ea94f6613sm2367251e87.217.2025.05.07.08.45.41
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 May 2025 08:45:41 -0700 (PDT)
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-3106217268dso67319011fa.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 May 2025 08:45:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUuYvxzu73Q3Lu1UIBz7m5+1Z1dybJCqX50/WVBbvRVLqW9miy1OrJMjG6x4qbTA6QErro/EsAvEifZP9a1mOzR@lists.infradead.org
X-Received: by 2002:a2e:ab1a:0:b0:308:eb58:6591 with SMTP id
 38308e7fff4ca-326ad33bc90mr16246971fa.25.1746632741134; Wed, 07 May 2025
 08:45:41 -0700 (PDT)
MIME-Version: 1.0
References: <20250506195524.601268-1-michael@fossekall.de>
In-Reply-To: <20250506195524.601268-1-michael@fossekall.de>
From: Chen-Yu Tsai <wens@csie.org>
Date: Thu, 8 May 2025 00:45:28 +0900
X-Gmail-Original-Message-ID: <CAGb2v671wD7y6n6n20BrhH-pcTGD8RzPp25gCWUtnFmRhh=naw@mail.gmail.com>
X-Gm-Features: ATxdqUGxuy4nk1up7F0wkRPqSR-2r-DSURGKLc-zVrNDcFGAmDsshfUtzZKSfic
Message-ID: <CAGb2v671wD7y6n6n20BrhH-pcTGD8RzPp25gCWUtnFmRhh=naw@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: bananapi: add support for PHY LEDs
To: Michael Klein <michael@fossekall.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_084546_245495_0E6A4CF0 
X-CRM114-Status: GOOD (  21.19  )
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

On Wed, May 7, 2025 at 4:56=E2=80=AFAM Michael Klein <michael@fossekall.de>=
 wrote:
>
> The Bananapi M1 has three LEDs connected to the RTL8211E ethernet PHY.
> Add the corresponding nodes to the device tree.

I see from old emails that this was supposed to be updated? And if you
didn't, then his patch should be marked as a "RESEND", so tooling doesn't
get confused and ignore it.

I'll wait a couple days in case anyone else wants to take a look.

ChenYu

> Signed-off-by: Michael Klein <michael@fossekall.de>
> ---
>  .../boot/dts/allwinner/sun7i-a20-bananapi.dts | 27 +++++++++++++++++++
>  1 file changed, 27 insertions(+)
>
> diff --git a/arch/arm/boot/dts/allwinner/sun7i-a20-bananapi.dts b/arch/ar=
m/boot/dts/allwinner/sun7i-a20-bananapi.dts
> index 46ecf9db2324..d8b362c9661a 100644
> --- a/arch/arm/boot/dts/allwinner/sun7i-a20-bananapi.dts
> +++ b/arch/arm/boot/dts/allwinner/sun7i-a20-bananapi.dts
> @@ -48,6 +48,7 @@
>
>  #include <dt-bindings/gpio/gpio.h>
>  #include <dt-bindings/interrupt-controller/irq.h>
> +#include <dt-bindings/leds/common.h>
>
>  / {
>         model =3D "LeMaker Banana Pi";
> @@ -169,6 +170,32 @@ &ir0 {
>  &gmac_mdio {
>         phy1: ethernet-phy@1 {
>                 reg =3D <1>;
> +
> +               leds {
> +                       #address-cells =3D <1>;
> +                       #size-cells =3D <0>;
> +
> +                       led@0 {
> +                               reg =3D <0>;
> +                               color =3D <LED_COLOR_ID_GREEN>;
> +                               function =3D LED_FUNCTION_LAN;
> +                               linux,default-trigger =3D "netdev";
> +                       };
> +
> +                       led@1 {
> +                               reg =3D <1>;
> +                               color =3D <LED_COLOR_ID_AMBER>;
> +                               function =3D LED_FUNCTION_LAN;
> +                               linux,default-trigger =3D "netdev";
> +                       };
> +
> +                       led@2 {
> +                               reg =3D <2>;
> +                               color =3D <LED_COLOR_ID_BLUE>;
> +                               function =3D LED_FUNCTION_LAN;
> +                               linux,default-trigger =3D "netdev";
> +                       };
> +               };
>         };
>  };
>
> --
> 2.39.5
>
>

