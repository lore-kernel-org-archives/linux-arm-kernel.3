Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84778C369D1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Apr 2025 03:57:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W4gLbG2Dv99fli5CpF3p4x5McAYSv7OcSMqvlFvR3oA=; b=TV/B1EkM/Y+p0n
	70bLBWUWfK0RqCYBbdqbeK4lj+rO7Bg7hdRU6dIeiKpG54aUHh5EaW7lor0SUhRlAA+ikrFuxus5A
	lgsMNzJm6RGyX5nc4XVbnq8qMP56fbW0IHy3wvuJQBRKL32ulmdZ61IixiyYw6Ndzw7n9yl3uz2XW
	vHy7VOINkCM4YcICg8v+p5gdP+I0XNAb2RRyDO8wsWXUGA8TVAvZPKt2/WMW96qC3pC0mqGNSVDaI
	Qr0Mjfae3vNdvXIMOpeij91cw3fWO+Tg8SjR3CqVIaILegH9aFK6v31ks7eAOAQ8/+DiwfDV8eEpa
	ckAA1cU93ZgEQPqctaRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8ABD-0000000Fszv-3btF;
	Fri, 25 Apr 2025 03:56:47 +0000
Received: from mail-io1-f42.google.com ([209.85.166.42])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8A8E-0000000FsmB-1tGb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Apr 2025 03:53:43 +0000
Received: by mail-io1-f42.google.com with SMTP id ca18e2360f4ac-86142446f3fso56387439f.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Apr 2025 20:53:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745553217; x=1746158017;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=W4gLbG2Dv99fli5CpF3p4x5McAYSv7OcSMqvlFvR3oA=;
        b=lKo1XfEj+UIL5fBpgOF8vD9ptubYTiAC9Kwxh8xCGW9ER3NXyeK/gzIkPLmFVyN0ZD
         QClTHbDZDuW7EEts1SUUvxIbry7Nhl4zkfYXyIxbGtvZ/JI3seqDI3QjDkhTGYbe1Dc9
         saTFD+0EWNK/CkpbRJXEgNa0HATWBthk2dWVsSsHYzXei2Og56gO8DyZJsb45DJl0Vxk
         62aEaphuGxREco5U1WzzEgbxjuX0DRa4Ak7VHd+FUhKg9mbud3mteTOwEIX65V+sULIG
         u+mGXDZlT2BOjmwjtPO4G4eRhxNjZHxJ5InKQYsye7nhyl7OezOslUh/eB123e8FloQt
         MOZA==
X-Forwarded-Encrypted: i=1; AJvYcCVMQMlxwL8I/EiiDei/ink7tcOPoHuonr0gkhKf2i46/coCEWcenZagSKD8HTtTN6foiK2POayDmQ0fH8cXEqRN@lists.infradead.org
X-Gm-Message-State: AOJu0Yxm7IYzYIoAV7MhRsLhdewXOANS/3DzuuoGp5IvDLU3DbK4O1O6
	aqAFIZoRDJ9aXORYjbGK42SEJVidI5aW13U6uCUpRGwA930jldlZctgovhCBSIw=
X-Gm-Gg: ASbGncuSSFa97cSbbJS47ASvxIDIZ3nXWPp/t+zjsN+TiwbWAXdk+mZmf3UBSOud6kk
	PpSWqXlR4SMp3sCV4lB/uqlCDJIiv0NsX1SRaPREcAW8LkelbSKnlBmL918eahc4zMy+iff+k3P
	ThPhFSXp0xK7uSZ2rBDxUdPkHt8EtJTp0l1uCEakXODqKWGCa/dMvBzrREB1I3zpA1oQdACfzDZ
	uoiwJ5EiwAbp0EcnXNL35ATAjfTUFtrC67p/Yp+AmNeC0ECsW3RwMR0BoQUZX+vGNHr4UgVSA5H
	tcHLkLkLb/AGhj8Pyl4MzcnL5N99tNbDNZ7aH3TFllLRr0VCIN1+/vH/Ps9/+4PkyEb2Z1b1DA=
	=
X-Google-Smtp-Source: AGHT+IE/ygQmDMYnsVLN3JjholLSLMHp7uQq3Zvjwf6qXPEOk2PCcP8vVLa5gjVPNSXZskJvZ2QvqQ==
X-Received: by 2002:a05:6e02:3e8e:b0:3d2:6768:c4fa with SMTP id e9e14a558f8ab-3d93b5bab11mr7814995ab.21.1745553216905;
        Thu, 24 Apr 2025 20:53:36 -0700 (PDT)
Received: from mail-il1-f172.google.com (mail-il1-f172.google.com. [209.85.166.172])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3d93159f5e4sm5214245ab.49.2025.04.24.20.53.36
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Apr 2025 20:53:36 -0700 (PDT)
Received: by mail-il1-f172.google.com with SMTP id e9e14a558f8ab-3d81ea55725so5646015ab.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Apr 2025 20:53:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWM153ME6kgJoGF+C7HFJfY3cnJX0Ml5gjMOvsyMSe0Kq/FtcmgTXCT691aiXVX0jGtlZs/Wc9mvPwq+tsCvWNO@lists.infradead.org
X-Received: by 2002:a92:cd8a:0:b0:3d4:3ab3:5574 with SMTP id
 e9e14a558f8ab-3d93b3ae9fdmr8037145ab.3.1745553215789; Thu, 24 Apr 2025
 20:53:35 -0700 (PDT)
MIME-Version: 1.0
References: <20250425003422.3465-1-andre.przywara@arm.com>
In-Reply-To: <20250425003422.3465-1-andre.przywara@arm.com>
From: Chen-Yu Tsai <wens@csie.org>
Date: Fri, 25 Apr 2025 11:53:19 +0800
X-Gmail-Original-Message-ID: <CAGb2v66vr_X3cB1g-On9opGQ7a4j1ASQyi4G=fqY07safrjfFw@mail.gmail.com>
X-Gm-Features: ATxdqUGK_blFRIEkriAwI7w8rQlOD9oM5XGsLLIwKX1qwqnzLE3yxYAXQjZKka8
Message-ID: <CAGb2v66vr_X3cB1g-On9opGQ7a4j1ASQyi4G=fqY07safrjfFw@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: allwinner: a523: fix SD card detect pull resistor
To: Andre Przywara <andre.przywara@arm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_205342_490074_BD348442 
X-CRM114-Status: GOOD (  24.74  )
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

On Fri, Apr 25, 2025 at 8:35=E2=80=AFAM Andre Przywara <andre.przywara@arm.=
com> wrote:
>
> Trying to use the SD card on the Radxa board revealed that the card
> detect wouldn't work as expected (insert not detected). Looking at the
> schematic shows that the pull-up resistor is actually not populated
> ("NC"), and the transistor just pulls the GPIO pin to GND, but it's
> floating otherwise.
> So using the pull-down flag is definitely wrong, we need the internal
> pull up to get a reliable signal. The same is true for the Avaota board
> (there is no transistor there, but it's floating in the same way). There
> is no schematic for the X96QPro+ board, but experiments show it's the
> same behaviour.
>
> So change the GPIO flag for the card detect GPIO property to activate
> the pull-up resistor for that pin.
>
> Fixes: 80e0fb4e491b ("arm64: dts: allwinner: a523: add Radxa A5E support"=
)
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
> Hi,
>
> please let me know if I should split this up into 3 patches, with proper
> Fixes: tags, or if you can maybe squash this into the original commits
> still?

I can squash them in if you prefer.

ChenYu

> Cheers,
> Andre
>
>  arch/arm64/boot/dts/allwinner/sun55i-a527-radxa-a5e.dts | 2 +-
>  arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dts  | 2 +-
>  arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a527-radxa-a5e.dts b/ar=
ch/arm64/boot/dts/allwinner/sun55i-a527-radxa-a5e.dts
> index 03c9a9ef5adc2..2d2f3af91d05e 100644
> --- a/arch/arm64/boot/dts/allwinner/sun55i-a527-radxa-a5e.dts
> +++ b/arch/arm64/boot/dts/allwinner/sun55i-a527-radxa-a5e.dts
> @@ -56,7 +56,7 @@ &ehci1 {
>
>  &mmc0 {
>         vmmc-supply =3D <&reg_cldo3>;
> -       cd-gpios =3D <&pio 5 6 (GPIO_ACTIVE_LOW | GPIO_PULL_DOWN)>; /* PF=
6 */
> +       cd-gpios =3D <&pio 5 6 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>; /* PF6 =
*/
>         bus-width =3D <4>;
>         status =3D "okay";
>  };
> diff --git a/arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dts b/arc=
h/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dts
> index c0bce3f4fa925..59db103546f65 100644
> --- a/arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dts
> +++ b/arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dts
> @@ -56,7 +56,7 @@ &ehci1 {
>
>  &mmc0 {
>         vmmc-supply =3D <&reg_vcc3v3>;
> -       cd-gpios =3D <&pio 5 6 (GPIO_ACTIVE_LOW | GPIO_PULL_DOWN)>; /* PF=
6 */
> +       cd-gpios =3D <&pio 5 6 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>; /* PF6 =
*/
>         bus-width =3D <4>;
>         disable-wp;
>         status =3D "okay";
> diff --git a/arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts b/ar=
ch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts
> index 85a546aecdbe1..dea2acc1849bb 100644
> --- a/arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts
> +++ b/arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts
> @@ -66,7 +66,7 @@ &ehci1 {
>
>  &mmc0 {
>         vmmc-supply =3D <&reg_cldo3>;
> -       cd-gpios =3D <&pio 5 6 (GPIO_ACTIVE_LOW | GPIO_PULL_DOWN)>; /* PF=
6 */
> +       cd-gpios =3D <&pio 5 6 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>; /* PF6 =
*/
>         bus-width =3D <4>;
>         status =3D "okay";
>  };
>
> base-commit: 1e5a69d67d1b3c55c9b0cd3933af1436b5d52aa1
> --
> 2.46.3
>

