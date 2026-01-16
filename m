Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B642D47CDA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Jan 2026 10:56:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s7DoksDpFPnlJ6YY9IWEVIqBsN/FrhlIGvYVSfP8/oE=; b=y0FbG9ybyNKVLaR++DGnowyR+s
	83/caI2PPPPCXUw5rm1iwJ/GbrrlgEqBvucYa7trcv4NHAsfLaSii6j2SR9Ai9aUxMbVTEQEzxdn4
	zz+FuJsQgNMY5UZhhKB+mZr8cTeqop5+aiXYGscVrad7D1XiWf1KvahLQPEgzeXNUi6l7kuU+BzD0
	poxddyZDel1syhqZ8GRBHzgiTquOhIcLI/546l4WOVMJQCv4isDCefcwl2EVtBuvx6wcTryCQE5Ti
	6agZN7P/z8eZs0dDH57qRyIQhWXyYplqI9lZrI2diypx6/0JLIgXSmUNSQf2T6JzhRl2UaL0fVnur
	jUuLqPcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vghV5-0000000E04C-3Qrt;
	Fri, 16 Jan 2026 10:56:19 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vghV3-0000000E03K-0ADC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Jan 2026 10:56:18 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-b87677a8abeso334714866b.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 16 Jan 2026 02:56:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768560975; x=1769165775; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s7DoksDpFPnlJ6YY9IWEVIqBsN/FrhlIGvYVSfP8/oE=;
        b=Rf4ojtr+kLRLTzmT4CaX13DhLqg76pAUsPVwCdXaOvM5rul3bcmS/HJRRMCZEoCZna
         g9VrrcIG+qzn8WpDjAvu0LZeu1t2lZqiKfLDmJrhNiTtOcRZto+YtS9yLyLZp6YfaKvG
         0r9V0pCwoNNEAZjBBgfO+4oG+RiJzK0MH7fv631Mudt+uXNUVYWHKltfd72DTExrJsqy
         TB0z0ErbgO/sEm9mx9X7bNQRi9gQT/Ys88zXGTS6QbwIknIzPDnIjG2cQCXEBJoXOM51
         x785RXOcim/aI3i8xmvVkQLK7BxKKLp4pAA5R31++rK17x5PNaKYSx6aeHNwHX5FLNbA
         xTDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768560975; x=1769165775;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=s7DoksDpFPnlJ6YY9IWEVIqBsN/FrhlIGvYVSfP8/oE=;
        b=iZ6UY48lIDolgIY3INRymV1Qlgixnta/eX+VeyungBZu+W2Slbi71HeZ4V0XyloQVV
         AG0KDljeUk1twB/YDX2cUbfJYTO1h6/3xUEvAUOADUjVdGZ0utPAggFV4X4rHbsUSYIG
         20QT29U/J770/7JSi/5W0NyS79JFk4MAGYlzYLCPRoLL0agUZ8B96n3baWgC8vlaRtV8
         Mnr4A7lZmM3CP3tkxI3W2u62GkuVq2GtaAXZohHXdgsKSOqGZGBa/ImnQFW4nYP9GJf3
         GW7e4hFxxk71ogMcKn2hWJZr76wFsgpMRxiXLWQFhsaTORQ4FBfVU87pezPvitExdSJ8
         zKQQ==
X-Forwarded-Encrypted: i=1; AJvYcCV6tKT9IRLgKfQYSD/tEXchqPgf8K/7mjG2Dmza9fOmqpkait9A/iQ9vj3m6cRgtSPRi12JAAD3FmZBgiNZReII@lists.infradead.org
X-Gm-Message-State: AOJu0YyTK7KAGIWMsR8aOfe5qidzch9IUdGehv258PxO45QuZGDtmy+W
	2Iz3GkQ7Faq6ZFoc+A62CJFdHyCPSXERJsFUDjRfvOWKgalkN7jwhSzEkRZv6F0arn9HCQI3NUo
	oLGHEbBejBXruSCkuVfzDV7aoEkzxDUg=
X-Gm-Gg: AY/fxX4BmgvXs2gSjn07UNsz//noHieupSBAZyeyttlncl9Fxec53TU6t+fN44SrRm6
	5i5ZWnE/AnuLZ5x6ybqHFMMLZpJIcTAKoNKV4nYuyv0ratE4JoaRWBBOpu0IkT+HoAB0caa+pQb
	AwLE0gzxJSkey20subiIvCST/TPAmLu9PHuQdn9nwDEtHPwrXZF9EwzRhrZ/15KLDN+u2q5Z34J
	7zGuxnqM8pwyucjyOovfO/hydqMF/SjQgUzI521PMxsG7n7oYH0yZrTZYi1cZGu0cnuipzCsYVb
	xOyOfYK0RwfvJu99jHh5+JxfieJWixcsvc/g4/Wk/31wf+U4Nu0ipdpDPS7r7UUh+tt+gwGgHdz
	1lVNQh7Lqmd10pcUL+RfpTKIw/J35+Xd6CZLW
X-Received: by 2002:a17:907:724d:b0:b87:124c:5f54 with SMTP id
 a640c23a62f3a-b87932b6908mr228135666b.59.1768560974807; Fri, 16 Jan 2026
 02:56:14 -0800 (PST)
MIME-Version: 1.0
References: <20260114120610.82531-1-mcanal@igalia.com> <121ede67-dbfc-4b79-8076-04693e9d3d53@gmail.com>
 <59cdede3-7757-4fe1-bb94-e7a93eea7611@igalia.com>
In-Reply-To: <59cdede3-7757-4fe1-bb94-e7a93eea7611@igalia.com>
From: Peter Robinson <pbrobinson@gmail.com>
Date: Fri, 16 Jan 2026 10:56:03 +0000
X-Gm-Features: AZwV_Qh3vURpqiUWdDMv2MS1A-8fDyVxPzhEs3rm4JOXQLN-4xJ2oEQjFFmdjQk
Message-ID: <CALeDE9PGzTe4LXnDJcyhh_ietWkrf8Sp7xX=X6pZvdCWLx2huw@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: dts: broadcom: bcm2712: Add V3D device node
To: =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Stefan Wahren <wahrenst@gmx.net>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, kernel-dev@igalia.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260116_025617_107985_F08BCFF7 
X-CRM114-Status: GOOD (  22.24  )
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

On Fri, 16 Jan 2026 at 10:15, Ma=C3=ADra Canal <mcanal@igalia.com> wrote:
>
> Hi Peter,
>
> On 16/01/26 00:53, Peter Robinson wrote:
> > Hi Maira,
> >
> > On 14/01/2026 12:04, Ma=C3=ADra Canal wrote:
> >> Commits 0ad5bc1ce463 ("drm/v3d: fix up register addresses for V3D 7.x"=
)
> >> and 6fd9487147c4 ("drm/v3d: add brcm,2712-v3d as a compatible V3D
> >> device")
> >> added driver support for V3D on BCM2712, but the corresponding device
> >> tree node is still missing.
> >>
> >> Add the V3D device tree node to the BCM2712 DTS.
> >>
> >> Signed-off-by: Ma=C3=ADra Canal <mcanal@igalia.com>
> >>
> >> ---
> >> v1 -> v2:
> >>
> >> - Rebased on top of linux-next (Stefan Wahren)
> >> - Fixed node's address (2000000 -> 1002000000) (Stefan Wahren)
> >> - Link to v1: https://lore.kernel.org/linux-
> >> devicetree/20260113192902.48046-2-mcanal@igalia.com/
> >> ---
> >>   .../boot/dts/broadcom/bcm2712-rpi-5-b-base.dtsi    |  4 ++++
> >>   arch/arm64/boot/dts/broadcom/bcm2712.dtsi          | 14 ++++++++++++=
++
> >>   2 files changed, 18 insertions(+)
> >>
> >> diff --git a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-base.dtsi b/
> >> arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-base.dtsi
> >> index 7d4742ebe247..97522c6803c5 100644
> >> --- a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-base.dtsi
> >> +++ b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-base.dtsi
> >> @@ -247,3 +247,7 @@ &pcie1 {
> >>   &pcie2 {
> >>       status =3D "okay";
> >>   };
> >> +
> >> +&v3d {
> >> +    clocks =3D <&firmware_clocks 5>;
> >
> > Looking at the upstream DT [1] I think this also needs a clock-names en=
try.
>
> Differently from the `hvs` node [1] you sent (which specifies clock-
> names), the `v3d` binding [2] doesn't have a clock-names property.
> Therefore, it is not needed.

There's a name in the clk driver [1] so maybe the bindings should be update=
d?

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/dri=
vers/clk/bcm/clk-raspberrypi.c#n26

> [1]
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/D=
ocumentation/devicetree/bindings/display/brcm,bcm2835-hvs.yaml
> [2]
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/D=
ocumentation/devicetree/bindings/gpu/brcm,bcm-v3d.yaml
>
> Best regards,
> - Ma=C3=ADra
>
> >
> > [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/
> > tree/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-base.dtsi#n233
> >
> >> +};
> >> diff --git a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi b/arch/arm64/
> >> boot/dts/broadcom/bcm2712.dtsi
> >> index 330a121ebfcb..661668ef7419 100644
> >> --- a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
> >> +++ b/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
> >> @@ -1,5 +1,6 @@
> >>   // SPDX-License-Identifier: (GPL-2.0 OR MIT)
> >>   #include <dt-bindings/interrupt-controller/arm-gic.h>
> >> +#include <dt-bindings/soc/bcm2835-pm.h>
> >>   / {
> >>       compatible =3D "brcm,bcm2712";
> >> @@ -642,6 +643,19 @@ mip1: msi-controller@1000131000 {
> >>               msi-ranges =3D <&gicv2 GIC_SPI 247 IRQ_TYPE_EDGE_RISING =
8>;
> >>               brcm,msi-offset =3D <8>;
> >>           };
> >> +
> >> +        v3d: gpu@1002000000 {
> >> +            compatible =3D "brcm,2712-v3d";
> >> +            reg =3D <0x10 0x02000000 0x00 0x4000>,
> >> +                  <0x10 0x02008000 0x00 0x6000>,
> >> +                  <0x10 0x02030800 0x00 0x0700>;
> >> +            reg-names =3D "hub", "core0", "sms";
> >> +
> >> +            power-domains =3D <&pm BCM2835_POWER_DOMAIN_GRAFX_V3D>;
> >> +            resets =3D <&pm BCM2835_RESET_V3D>;
> >> +            interrupts =3D <GIC_SPI 250 IRQ_TYPE_LEVEL_HIGH>,
> >> +                     <GIC_SPI 249 IRQ_TYPE_LEVEL_HIGH>;
> >> +        };
> >>       };
> >>       vc4: gpu {
>

