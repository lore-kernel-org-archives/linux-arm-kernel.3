Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2405D5CCB8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Oct 2024 15:10:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fwJLsP/X3bIPlA750OvhbizLaCKZ63BQRtUHuQ3kd0c=; b=rEWyOOk8lEiBR5Fou3huxYRBQM
	9KcVxO+8rHfoqhFMCW6ATN2OgGf3uSePl6m6DFuhobenVdLwWzAgJxEFEvg9oXP3FZaqfRWVFFU+N
	Bi65p8fYmdg66o7wLNB8JbXBCV54qM1PRZCARL/ykwzkSNWX8BKb2EP3POLxAN7fHBxyTbQOiBeDr
	NchqUovEbUMmfLj7h3u66sJyOK6dKXS8ByjOC7j0JCrIgX/AIrcY6JsjDRMmO6Ye6uh/apPpv4cDd
	1ZySY88Xv3MuTDVx0za3mNYmqyku46UQdlwNJI3sZIIPGuJ1UNhIfNb+cXEM3WhcE0eFilfS9lHKc
	fgxp9Ukg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6ALG-00000000mxv-1l6d;
	Wed, 30 Oct 2024 15:10:38 +0000
Received: from mail-yw1-f180.google.com ([209.85.128.180])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6AJY-00000000miX-3PYk
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Oct 2024 15:08:54 +0000
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-6e35bf59cf6so10127847b3.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Oct 2024 08:08:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730300930; x=1730905730;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fwJLsP/X3bIPlA750OvhbizLaCKZ63BQRtUHuQ3kd0c=;
        b=pLbWacqDhpxs5W8FGQQu8+GfF26e3Z35g+gqD/k42MYF8oyIivAb0roGsdPpgd1SXT
         Opk4P1QOuFRrXAwIJx5VrkIauVKfHCN2lfaCV0d0CUFEcvuNJfIqe9AJnsL5Gn6t7Lo5
         axPdlPLnNIwZ9z8mY4jz6aaqIgY8Bx1FL2JEhaex96dNEiIBwO7k1Hqzjaa/Hut0PvvR
         DG/xwaJhurATZqOjspYND2BGQ2e6y7KNdc1XPr9atf2IiwpUUjB4spIAC+z8GhEBKui4
         PY7gsqdsItwbYy7wSbQQXtr3Xvd6dim7GeIBG5Ggvmw5PD9r7MYcZhguOQzUHT018X/a
         lU4Q==
X-Forwarded-Encrypted: i=1; AJvYcCVR5LKzaPM+u0afgLWeNMQrDWei8sETjOQ6Tov1RwGkyuGpSjr/ZOQL/XrYBMXVNWlObyTQXbBxKOOqmRwrCM4a@lists.infradead.org
X-Gm-Message-State: AOJu0YwlbOpxTtDzHw7pAzWnfzNrLOA815jTbrQxf6MbVN+Czo+k5F/+
	FJQ2XRxV2+GlVqoWt5LGvQf00CUmpeJUwQhelrgyy3NY5+ggIf0zfgE8wwr8
X-Google-Smtp-Source: AGHT+IHYDkyANVvSqaDCI3BVRdPo1VHfOl1civ24oBKLCeJDxfKVWAgmb8U+C7kfobzEjOmT3a55UA==
X-Received: by 2002:a05:690c:c84:b0:6e2:611:7abd with SMTP id 00721157ae682-6ea2c218013mr54484797b3.20.1730300930137;
        Wed, 30 Oct 2024 08:08:50 -0700 (PDT)
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com. [209.85.219.178])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e9c6c95280sm24150857b3.104.2024.10.30.08.08.49
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Oct 2024 08:08:49 -0700 (PDT)
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-e2e444e355fso876170276.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Oct 2024 08:08:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWQKuidm6NNc7TamOCzevqLW2CTi9X2zWAH+ETdsAK7+AoUcR4ckTFeA1y2Cdk3KIPETo79cUXv90c53qZbFmO4@lists.infradead.org
X-Received: by 2002:a05:690c:e07:b0:6db:dee9:f6fb with SMTP id
 00721157ae682-6ea3e8fbba7mr22563157b3.11.1730300929652; Wed, 30 Oct 2024
 08:08:49 -0700 (PDT)
MIME-Version: 1.0
References: <CAMuHMdX-1bBphfFmEy708MeBePb2pF6rWj0xOjR4d9S-KVgA3A@mail.gmail.com>
 <1f927944-30aa-4298-9bd0-d9d3ace3fc78@kernel.org>
In-Reply-To: <1f927944-30aa-4298-9bd0-d9d3ace3fc78@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 30 Oct 2024 16:08:37 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVN_xNLTvy9u6FvK=agSAUzSHxEuyBS37sOA7jpGLwddw@mail.gmail.com>
Message-ID: <CAMuHMdVN_xNLTvy9u6FvK=agSAUzSHxEuyBS37sOA7jpGLwddw@mail.gmail.com>
Subject: Re: BeagleBone Black Ethernet PHY issues
To: Roger Quadros <rogerq@kernel.org>
Cc: ext Tony Lindgren <tony@atomide.com>, Siddharth Vadapalli <s-vadapalli@ti.com>, 
	"open list:TI ETHERNET SWITCH DRIVER (CPSW)" <linux-omap@vger.kernel.org>, netdev <netdev@vger.kernel.org>, 
	Matti Vaittinen <mazziesaccount@gmail.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241030_080852_879902_A489A2C0 
X-CRM114-Status: GOOD (  23.55  )
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

Hi Roger,

On Wed, Oct 30, 2024 at 1:58=E2=80=AFPM Roger Quadros <rogerq@kernel.org> w=
rote:
> On 29/10/2024 19:18, Geert Uytterhoeven wrote:
> > During the last few months, booting kernels on BeagleBone Black
> > sometimes fails with:
> >
> >     +SMSC LAN8710/LAN8720 4a101000.mdio:00: probe with driver SMSC
> > LAN8710/LAN8720 failed with error -5

[...]

> Just wondering if the Reset is happening correctly and it has settled
> before PHY access.
>
> From arch/arm/boot/dts/ti/omap/am335x-bone-common.dtsi
>
> &davinci_mdio_sw {
>         pinctrl-names =3D "default", "sleep";
>         pinctrl-0 =3D <&davinci_mdio_default>;
>         pinctrl-1 =3D <&davinci_mdio_sleep>;
>
>         ethphy0: ethernet-phy@0 {
>                 reg =3D <0>;
>                 /* Support GPIO reset on revision C3 boards */
>                 reset-gpios =3D <&gpio1 8 GPIO_ACTIVE_LOW>;
>                 reset-assert-us =3D <300>;
>                 reset-deassert-us =3D <13000>;
>         };
> };
>
> Do we need to increase reset-deassert-us for some reason?

Thanks for the hint!

This is indeed on Rev. C3 (my other boards are Rev. A5C or C, but
I don't test boot recent kernels on them, as they are in active use).

Multiplying reset-deassert-us by 10 gives me a booting board.
More experiments reveal that I need a delay of 14 ms to boot
successfully, and 15 ms to avoid the early __mdiobus_read()
failure, too.

> I couldn't find MII ready time after reset de-assert information form the
> PHY datasheet. except the following line [1].
> "For the first 16us after coming out of reset, the MII/RMII interface wil=
l run at 2.5 MHz. After this time, it will
> switch to 25 MHz if auto-negotiation is enabled"
>
> [1] 3.8.5 RESETS
> https://ww1.microchip.com/downloads/aemDocuments/documents/UNG/ProductDoc=
uments/DataSheets/LAN8710A-LAN8710Ai-Data-Sheet-DS00002164.pdf

3.8.5.1 Hardware Reset
"A Hardware reset is asserted by driving the nRST input pin low. When
 driven, nRST should be held low for the minimum time detailed in
 Section 5.6.3, "Power-On nRST & Configuration Strap Timing," on page
 60 to ensure a proper transceiver reset."

5.6.3 POWER-ON NRST & CONFIGURATION STRAP TIMING
"For proper operation, nRST must be asserted for no less than trstia."

TABLE 5-8: POWER-ON NRST & CONFIGURATION STRAP TIMING VALUES
"trstia nRST input assertion time min. 100 =C2=B5S"

On Rev. C3, ETH_RESETn is controlled by an open-drain AND gate.
It is pulled high by a 10K resistor, and has a 4.7=C2=B5F capacitor to
ground.  That gives an RC constant of 47ms.  As you need 0.7RC to charge
the capacitor above the threshold voltage of a CMOS input (VDD/2),
reset-deassert-us should be at least 33ms. Considering the typical
tolerance of 20% on capacitors, 40ms would be safer. Or perhaps
even 50ms?

If you agree, I can send a patch.
Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

