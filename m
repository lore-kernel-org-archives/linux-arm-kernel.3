Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22228E68960
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Oct 2024 09:34:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yxr4uhJhkKujIbCmn/2BlmBZDzUgZQRQwOInIgaY+OM=; b=YaZ5kcPBVj11IE8qjf/vrOeO7p
	HXqJNiVj5l3ADUrchBWZjec1co80d9Nm5S3Y3upXVFiI1y/s/Agf7GHjTJaizYg3wqVQlu2w+B5DW
	Sgsj/S1GyeHni1kMJjbQWMbIa5rmsrHuJh8eS9aoFa1I7UAlRFIQ6Um7jL7z+6ko/13wXAdw9heuy
	3S0HXi+CoOyomQKPEC26bhJMbns++uFRXnaU6iqroh0/E0ZlkdjCy1Q7AOeZEB4iygoofZMM9zc/a
	sF/JYu8ojWpzyetoNDtmwKSlHb4OU47yL7FOLkyaFAjPmByELLpRHvYO44rYmi727ZdfOryFzwTLd
	ekKaEoqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6RZ9-00000003618-2OR0;
	Thu, 31 Oct 2024 09:34:07 +0000
Received: from mail-yb1-f175.google.com ([209.85.219.175])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6RWG-000000035d9-2vQm
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Oct 2024 09:31:10 +0000
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-e2903a48ef7so640448276.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 31 Oct 2024 02:31:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730367066; x=1730971866;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yxr4uhJhkKujIbCmn/2BlmBZDzUgZQRQwOInIgaY+OM=;
        b=hnrZI94ym5zQIxYLX5u1d9xOBVSREp6vXgmk9MLiC/enF5W3Z0QcRE3DXBKroaSH7/
         kleDTV3YvUhRgoSARW+QUDdHNAsz+eYlxkQmfP4Z6rSKXqdQUUVUxchkTHYbCdDEgj/C
         2i7C4i4n5ykKxFbhADtxskF/Y+Fb0kLFDFfRSWqeQ9KRqPM/ac2frFE16lGmL9FpY5pW
         FLpOyvXLIMkan/eMW3+hvpU+134FTP89kdL/yhXHk3wQxiyZZ/nBAHECR+5/ukcO/orO
         Gpyhla5qWTTRugJFuDErWXcASFSNuqbO1KFBtqtBy3bqVgxWzFNYr3f8CQ84oWQiI9TW
         zRxA==
X-Forwarded-Encrypted: i=1; AJvYcCUT4gKUIrTKP8h9lRzZqDhqZMiAopQRMYr5aDTO0NmoRat6Ec/mypIHO4argl3zYwrJgpVyN6yny/iAyv1p5x/8@lists.infradead.org
X-Gm-Message-State: AOJu0YyVm4QUKgBioHli3EgC6tVIW7tGIiunD34mzfQ7T3zZx6QKTy+P
	esfdRD9d+u8a+HvffAQiT6RjMiEp5r5yfJWWmudq9u/9SJgMXuomJ5kMksE4
X-Google-Smtp-Source: AGHT+IHMXJsC/uTL6iqMXd+n6YQo1xLLUwLov8BF4c6x4m+bubmZ66ER9rpxrweLdZMchOBJdYwprA==
X-Received: by 2002:a05:6902:1582:b0:e2b:9967:6363 with SMTP id 3f1490d57ef6-e30e5b57792mr2370146276.37.1730367065918;
        Thu, 31 Oct 2024 02:31:05 -0700 (PDT)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com. [209.85.128.179])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e30e8acdba1sm223361276.42.2024.10.31.02.31.05
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 31 Oct 2024 02:31:05 -0700 (PDT)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-6ea15a72087so5649657b3.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 31 Oct 2024 02:31:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU2x27i6OacQulQhvm4kISpw0oimH2xeh7V/OYKIQeiKEhypY0yE5t1x4nFkByvZeJfKfn1NPWlkWaB1XpS9Z43@lists.infradead.org
X-Received: by 2002:a05:690c:6ac2:b0:6e7:d974:8cee with SMTP id
 00721157ae682-6ea52323519mr32131157b3.7.1730367064809; Thu, 31 Oct 2024
 02:31:04 -0700 (PDT)
MIME-Version: 1.0
References: <CAMuHMdX-1bBphfFmEy708MeBePb2pF6rWj0xOjR4d9S-KVgA3A@mail.gmail.com>
 <1f927944-30aa-4298-9bd0-d9d3ace3fc78@kernel.org> <CAMuHMdVN_xNLTvy9u6FvK=agSAUzSHxEuyBS37sOA7jpGLwddw@mail.gmail.com>
 <cd120c6b-e469-46d9-95b5-71a8cc6513cf@kernel.org>
In-Reply-To: <cd120c6b-e469-46d9-95b5-71a8cc6513cf@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 31 Oct 2024 10:30:52 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWfq4+gZcq6PzU=n0d2tTGEG3MV5c2tTQKLDysmj-g=kg@mail.gmail.com>
Message-ID: <CAMuHMdWfq4+gZcq6PzU=n0d2tTGEG3MV5c2tTQKLDysmj-g=kg@mail.gmail.com>
Subject: Re: BeagleBone Black Ethernet PHY issues
To: Roger Quadros <rogerq@kernel.org>
Cc: ext Tony Lindgren <tony@atomide.com>, Siddharth Vadapalli <s-vadapalli@ti.com>, 
	"open list:TI ETHERNET SWITCH DRIVER (CPSW)" <linux-omap@vger.kernel.org>, netdev <netdev@vger.kernel.org>, 
	Matti Vaittinen <mazziesaccount@gmail.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241031_023108_762414_E40EABE1 
X-CRM114-Status: GOOD (  34.35  )
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

On Thu, Oct 31, 2024 at 10:06=E2=80=AFAM Roger Quadros <rogerq@kernel.org> =
wrote:
> On 30/10/2024 17:08, Geert Uytterhoeven wrote:
> > On Wed, Oct 30, 2024 at 1:58=E2=80=AFPM Roger Quadros <rogerq@kernel.or=
g> wrote:
> >> On 29/10/2024 19:18, Geert Uytterhoeven wrote:
> >>> During the last few months, booting kernels on BeagleBone Black
> >>> sometimes fails with:
> >>>
> >>>     +SMSC LAN8710/LAN8720 4a101000.mdio:00: probe with driver SMSC
> >>> LAN8710/LAN8720 failed with error -5
> >
> > [...]
> >
> >> Just wondering if the Reset is happening correctly and it has settled
> >> before PHY access.
> >>
> >> From arch/arm/boot/dts/ti/omap/am335x-bone-common.dtsi
> >>
> >> &davinci_mdio_sw {
> >>         pinctrl-names =3D "default", "sleep";
> >>         pinctrl-0 =3D <&davinci_mdio_default>;
> >>         pinctrl-1 =3D <&davinci_mdio_sleep>;
> >>
> >>         ethphy0: ethernet-phy@0 {
> >>                 reg =3D <0>;
> >>                 /* Support GPIO reset on revision C3 boards */
> >>                 reset-gpios =3D <&gpio1 8 GPIO_ACTIVE_LOW>;
> >>                 reset-assert-us =3D <300>;
> >>                 reset-deassert-us =3D <13000>;
> >>         };
> >> };
> >>
> >> Do we need to increase reset-deassert-us for some reason?
> >
> > Thanks for the hint!
> >
> > This is indeed on Rev. C3 (my other boards are Rev. A5C or C, but
> > I don't test boot recent kernels on them, as they are in active use).
> >
> > Multiplying reset-deassert-us by 10 gives me a booting board.
> > More experiments reveal that I need a delay of 14 ms to boot
> > successfully, and 15 ms to avoid the early __mdiobus_read()
> > failure, too.
> >
> >> I couldn't find MII ready time after reset de-assert information form =
the
> >> PHY datasheet. except the following line [1].
> >> "For the first 16us after coming out of reset, the MII/RMII interface =
will run at 2.5 MHz. After this time, it will
> >> switch to 25 MHz if auto-negotiation is enabled"
> >>
> >> [1] 3.8.5 RESETS
> >> https://ww1.microchip.com/downloads/aemDocuments/documents/UNG/Product=
Documents/DataSheets/LAN8710A-LAN8710Ai-Data-Sheet-DS00002164.pdf
> >
> > 3.8.5.1 Hardware Reset
> > "A Hardware reset is asserted by driving the nRST input pin low. When
> >  driven, nRST should be held low for the minimum time detailed in
> >  Section 5.6.3, "Power-On nRST & Configuration Strap Timing," on page
> >  60 to ensure a proper transceiver reset."
> >
> > 5.6.3 POWER-ON NRST & CONFIGURATION STRAP TIMING
> > "For proper operation, nRST must be asserted for no less than trstia."
> >
> > TABLE 5-8: POWER-ON NRST & CONFIGURATION STRAP TIMING VALUES
> > "trstia nRST input assertion time min. 100 =C2=B5S"
> >
> > On Rev. C3, ETH_RESETn is controlled by an open-drain AND gate.
> > It is pulled high by a 10K resistor, and has a 4.7=C2=B5F capacitor to
> > ground.  That gives an RC constant of 47ms.  As you need 0.7RC to charg=
e
> > the capacitor above the threshold voltage of a CMOS input (VDD/2),
> > reset-deassert-us should be at least 33ms. Considering the typical
> > tolerance of 20% on capacitors, 40ms would be safer. Or perhaps
> > even 50ms?
>
> Super! Yes, I agree 50ms would be a good setting.

> > If you agree, I can send a patch.
> > Thanks!
>
> Much appreciated, thanks!

https://lore.kernel.org/9002a58daa1b2983f39815b748ee9d2f8dcc4829.1730366936=
.git.geert+renesas@glider.be

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

