Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEA3CFF885A
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 May 2026 09:25:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XiyjHCJDl/rogPwAqEoOmuI7BlhASDQQxZixIp7ihY8=; b=KK0l59JDMjDb2AR4KzK4a3YCHe
	ZbC0BZrFzFOnVRkngdfPlcD6a5HtlKAO+jSbTm4Y57/h0BS7Arpzbu1Peb+fFC03tU7LDUKq+nDJo
	u0wlqC7qEIq8dVEolx6m8wbLKx9DcF3xzchPrvNUNpZnwIyyrVts9DPyYVADCNSSxqA8hSiSjx65e
	DxoVXCjPo49W4cd2RfVRXJCY9Nk2quoJcmvFGsi8wrWM5PN7mK0XBAnkH1wxZKmw8hXfn6JGB93dg
	W2Q2sH2CR2DpuC96LBKH7mHAbABtK3hqeb9HEi0ekFhFCqxyvhTEcBnE9OoA9Cvo1dShRMLoKw3/v
	n3Yhvz4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJpY8-0000000Cokv-25vn;
	Mon, 04 May 2026 09:25:12 +0000
Received: from mail-vk1-f178.google.com ([209.85.221.178])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJpY5-0000000CokG-1N7k
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 May 2026 09:25:11 +0000
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-5674d8be45eso997742e0c.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 04 May 2026 02:25:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777886707; x=1778491507;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XiyjHCJDl/rogPwAqEoOmuI7BlhASDQQxZixIp7ihY8=;
        b=HpuEhbe/9Cyi8m25gHB4SEa3bSJQouBGTLHqIk2JsEvCrxDbGanIjJ/AzhLR9h8JCr
         zdd6yoLvoosVUHG3MbeVkay0paylSKE7dl8sHbcS5RceQ+pYJjjlhXTrA8PT+BVbkm/v
         M3ecA1r4yjse61VifUkywhMtW80057ZuUlI5dra+7MbIVMukKMR3Qw8pexo5nrYRKuQ4
         /Tg+CW7RWzrDhfbcXQN9DIwzizBvIjALLpcHef9ZkYJ5G5U35fHNZidP37U8/EGJj9A7
         dBRndzHV2h9HWAG07hJore475PxDRpkNc2HL17Xjd0LTRE3dsIzXO2FuiZJvdfWhsb7X
         6HXw==
X-Gm-Message-State: AOJu0Yyug5QErF83ATuHAP0K4PKsjSS7MsmGJjnYJ/76ukAhgBfJXgUo
	9CBFYWHeOsBpRgvX5lwUV1BynSR8xNGsw2FAx61r23rlH4ikW8jsTtfsuvGwB2JX
X-Gm-Gg: AeBDiesbhdZ4fHuLUGlsglPMjI+rqiBeimFaMVmz2d9IA42/crL9s4Nj6akn8LB2IIP
	Qkiy26lJ6eeC1QGUT4yI2LoXLmguD5oQUPz/FZ4jjp/IVbIVVw5AEnX0XaKH7g8H3/4wI17OcG8
	xnx1mh+ljSb0zQWRLjF0VeDBoy4y+YwGV5ecg/XNI7Z85QPQEeSfYZGBAkLH88ro+9eaDy7FSeG
	q+Ool5Mp6wgoFC2Uq3Pmbc3iHfUPSiI9NnIBcJ1al/bSUXqdBhnnQur2+5H3gJO8d3G/31PpGIs
	x5wLWUBSl+82nhnxThNZejKhmeQzgjljMeWrfRddDxWc7IKG4L/6WTHFMyArNZFX/1jVkImr0Ki
	JGzIrI4dNegNraFQW99aQ0Hy0hado87oB8/SlTaj5g9/eeso13Lfl4UuV5/VpiNWDWYboQ+1ybm
	PSOLYUa+z3APIO+RvC3dgSjvfYCHP4G/kslB/WsAz2cX+oHpDww/IVik7A0CDkNk1+xjPFm7T8F
	1M=
X-Received: by 2002:a05:6122:2220:b0:56e:f071:d4ef with SMTP id 71dfb90a1353d-5750c8c55c2mr3446710e0c.8.1777886707062;
        Mon, 04 May 2026 02:25:07 -0700 (PDT)
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com. [209.85.221.182])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5749f7e8c25sm5692961e0c.2.2026.05.04.02.25.06
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 May 2026 02:25:06 -0700 (PDT)
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-5673804da95so1272018e0c.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 04 May 2026 02:25:06 -0700 (PDT)
X-Received: by 2002:a05:6122:2884:b0:56d:b639:5c0d with SMTP id
 71dfb90a1353d-5750ca1f022mr3391522e0c.13.1777886706296; Mon, 04 May 2026
 02:25:06 -0700 (PDT)
MIME-Version: 1.0
References: <20260419193718.133174-1-marek.vasut+renesas@mailbox.org>
 <20260419193718.133174-8-marek.vasut+renesas@mailbox.org> <CAMuHMdX17D3n_5vxsvmaSmionjOqrEdPygjPdYuu6a0DR7b83w@mail.gmail.com>
 <0875e4a1-f112-4619-a229-2f6f9197f21c@mailbox.org>
In-Reply-To: <0875e4a1-f112-4619-a229-2f6f9197f21c@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 4 May 2026 11:24:55 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXJvrsXitGagqZJ_STdTTh_s1cBAKf6+esihaVWjfn40g@mail.gmail.com>
X-Gm-Features: AVHnY4LakVD8SFWNnLvI5N41V0dwMs_sPKYjvoWQU3neqkGpISJJCy9fOpu_jcA
Message-ID: <CAMuHMdXJvrsXitGagqZJ_STdTTh_s1cBAKf6+esihaVWjfn40g@mail.gmail.com>
Subject: Re: [PATCH 7/7] arm64: dts: renesas: r8a779md: Add support for R-Car
 M3Le R8A779MD Geist
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, 
	Nguyen Tran <nguyen.tran.pz@bp.renesas.com>, Conor Dooley <conor+dt@kernel.org>, 
	David Airlie <airlied@gmail.com>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	Magnus Damm <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Simona Vetter <simona@ffwll.ch>, Stephen Boyd <sboyd@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, 
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, devicetree@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260504_022509_415244_14434EE9 
X-CRM114-Status: GOOD (  23.71  )
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

On Sun, 3 May 2026 at 04:50, Marek Vasut <marek.vasut@mailbox.org> wrote:
> On 4/29/26 3:59 PM, Geert Uytterhoeven wrote:
> >> +&avb {
> >> +       pinctrl-0 =3D <&avb_pins>;
> >> +       pinctrl-names =3D "default";
> >> +       phy-handle =3D <&phy0>;
> >> +       tx-internal-delay-ps =3D <2000>;
> >> +       status =3D "okay";
> >> +
> >> +       phy0: ethernet-phy@0 {
> >
> > compatible =3D "ethernet-phy-id0022.1622";
> >
> >> +               rxc-skew-ps =3D <1500>;
> >> +               reg =3D <0>;
> >> +               interrupt-parent =3D <&gpio2>;
> >> +               interrupts =3D <11 IRQ_TYPE_LEVEL_LOW>;
> >
> > interrupts-extended =3D <&gpio2 11 IRQ_TYPE_LEVEL_LOW>;
> >
> >> +               reset-gpios =3D <&gpio2 10 GPIO_ACTIVE_LOW>;
> >> +               reset-assert-us =3D <100>;
> >> +               reset-deassert-us =3D <100>;
> >
> > Do we need these two? We don't have them in e.g.
> > arch/arm64/boot/dts/renesas/salvator-common.dtsi
>
> I believe we should add them, the KSZ9031 PHY does require 100us delay
> after reset is deasserted and before MDIO access is possible:
>
> https://ww1.microchip.com/downloads/aemDocuments/documents/UNG/ProductDoc=
uments/DataSheets/KSZ9031RNX-Data-Sheet-DS00002117.pdf
>
> FIGURE 7-5: POWER-UP/POWER-DOWN/RESET TIMING
>
> "
> Note 2: After the de-assertion of reset, wait a minimum of 100 =C2=B5s be=
fore
> starting programming on the MIIM (MDC/MDIO)
> interface
> "

OK. So please add it to the other boards, too.

> [...]
>
> >> +       pwm2_pins: pwm2 {
> >> +               groups =3D "pwm2_a";
> >> +               function =3D "pwm2";
> >> +       };
> >
> > What is pwm2 used for?
>
> The signal is accessible on the EXIO connector D (LBSC) .
> It is up to user to use the pin for their purposes.

Usually we do not enable support for random user wirings on EXIO connectors=
.

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

