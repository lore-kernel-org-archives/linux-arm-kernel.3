Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75296C79F89
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 08:48:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vD4jMxO/NmU/pHfxFJ8NQMuBlPLvKvFHeSpZFwyymkM=; b=XhjbWYYKD/v1l4oNFRGt1U5DHP
	MeKKl/ctVzfFvTcA9MeBMi7BeOwpZrG/1h+Wo/EcqdPBz1EtNMw0l4du7CcVVhpTCfYL63+hSHZ7f
	j9hpxo87bk2xMq5HrMh9wSVL7oQQ4jSpkyH+clRPeHaNfeDGqHjH8ph6nxbfK9Yiah7xXZN6i9iFM
	LyRCk5ARNbf5uKXBMbn0QZYlCZt50z4MfBxmlQq1h8DRuhgFLMZsRdnHNkXo5p0YyQQZv4xGFnvs9
	4mRQFJvBHaLPtpwps7EdvDznY9tCwk5prXu/tPhB4GuxSEE/8stqUaab9t+NnVP6dRn3RvPrTJxZ6
	6m5RtK2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3V11-00000006JBR-40cO;
	Mon, 07 Sep 2026 08:47:47 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3V0z-00000006JAx-1lpq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 08:47:46 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2d032846c95so36095725ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Sep 2026 01:47:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788770864; cv=none;
        d=google.com; s=arc-20260327;
        b=L8k+r7V7DXtzdS/HdTzXnz3f4kb7oSI33lVzp4gMb/UXtxH/fEITXsIeJ1ZvC4ZwJo
         wDa14KHk3UNMxSYjgi54QNqq8/nUzVbrxGwFVxvFGNQdYIBbZMJBPKqsmtiOEVZUr9ky
         z4m80jK1qKSUW4hE75eXnCyY7QCRZcw9TnDG/4KW+bPlMQbGdrg4ZnbJEHwc52BSLA32
         wZydNa3ycGBlGkYtkK32byBSGKxdlR004W+atKNo/ozXL9DcUJH6Q82SP8l8kpOpqT0s
         6vn31EYbYlDm5Sdcl6Y+f1Nm6+qByocRrNFzV2wbgoaNk7ViU3Un5JpSJbs4L027T3oT
         sGuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vD4jMxO/NmU/pHfxFJ8NQMuBlPLvKvFHeSpZFwyymkM=;
        fh=noBKNqCDSmeHNHzeEWbbgHm4vM443fSPNzClup+r2eY=;
        b=VVvN783fohe9T4uK7ObEYcB1MZ2KxVXZlnZzAxfBt9EKTWlVTemEbHCjQ7BBtnYUbe
         b1ZiXzZWF93JYJvCndiR1Py30vJt162bC9E39mzKRPATlH07Nrvj21QBWW/oMn+zGpjt
         HP831Qoc5evcDvClWPc1YG6nBUJPlvhiRud9j6yk2A7JrZ5E9AYLtszq8zXikhwr54lP
         mIBdVg6yhxleEScV7s/jZrICvdZH3SGCJ1EMx7qdiHqq15Wwso2KdzJHfUjJ2FKChPIL
         7INAiHVuP5RZZvAQTLFCH1oHNfT1lqKp1zdAuCuARlpLNxeOWSdAQoBGwxe54D/SaMZh
         557Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1788770864; x=1789375664; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vD4jMxO/NmU/pHfxFJ8NQMuBlPLvKvFHeSpZFwyymkM=;
        b=UbnBR0HbsVLcJefSRyNdnRNPggCaEaIPuXf3jKWn9BMOFjj2DXeRtO7UZ4n4Ml6IMv
         SBihn3qFGs5kWekbHnHOND9PrN1C6kxxuV5kKBGhgQZR0PZ6XfS/0/BgV9wwUgcK5/oy
         Q1OArsf2ZlDl41jmZ3QFy6DiPbkZ2RwzVRcg5fc8P3z1KuDOI3eFSPMmol16WLZaFT1Y
         OhNF354guqdK+4eNNwhZY+Zg8cBJbbjGhwFx3m6KrCki6bQTsYUZhbm3lkOkApKLHJsK
         F0HG+ReaUHF0ASbMuA0Okeg200k9oJCSHlLkKlu27gYduqOmqLAZP4uCvvvTXVEdmfcQ
         SLDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788770864; x=1789375664;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vD4jMxO/NmU/pHfxFJ8NQMuBlPLvKvFHeSpZFwyymkM=;
        b=UT+nigjGGkXfTCcHhEc8/77z2+ZD/ZiEwSy03dX5B022PsDAExPEHEzyaZWgfEX4uJ
         C3mZE/zX3uVL8gHv8qwEQIvyzc2h/aN1yj5Hg0b3FrZ9al7KaLry5nF2CPkLE/Je/Ox/
         RS6riM5Y06IT+s/jJREVM8lxi/AqTvigDILP7X+cE2+UrbhzDMH3t1hXHEYaqUNBWnML
         Pb7WmrsbDlaz6WOZWv6jP2e57hm/PjXdpG5ECikuLPGGK+wWgfGsyqQybvz8q7rkf8ls
         z9js3dqk+4mEmhaQfh0vCQfPw3kaRyOv13uJ4kibdiFRgmMtJbGuZAeZchAEpHsUPzG+
         KxQw==
X-Forwarded-Encrypted: i=1; AKwUvBz01qx2zJ9sXJdMzM/9ZNjL83YTKXHv3gb+Givkiv3gFlnDEvb2JuV+E6lLxPgIlyj94MWq4/YjQ1DI6Pu5kOaC@lists.infradead.org
X-Gm-Message-State: AFuF++k1D1kobk2apxBN8rNM5nMGnDZjvk1mT5YpJqefCGMfWyQH8BEq
	DYuACOfjN9QQXWvpDkymEQPkw3qprC/uTILsK0AV6U5j0eZZQOVYrEsc9oBMsaYGU5eY++M5BYM
	O72SK2ncmIjELi4fJULyfX38WFjW6sZ4fKUBFZepZhg==
X-Gm-Gg: AYBFou0Ybm8fLkWYdMxqrheOcQb9g3ow2iNscdJnTpqEVvxbQ40fDeW/ZHdS/vAdH8E
	NANL739S7Ph4z7dR2U+24AyPTNPK7iFJSwJisollcP6XP1w0aT5QobFJkmTcIim3WFi6fJTlrAr
	X8yrR9Le4CRBGRJa5qk8/ETgOjP+rp3fNqzZpYpbKxxfCh+tORh5gipzqYzFNj05eo+b6B5SKxO
	OEUaDXGqaZ5KXhc8enjI2uYi647FlyEeAKk+TGCG+OhrDojIVFUN3WwlWCnyp4MtVXXjYe37nbY
	AcPApb8ftWBntUjzjkeQ1QKEjImxBU9nynTE9UmgwQoE+K6oJ0VTzWrQRjJJYZ08+BaVeyJOtA/
	JC7ox7YvdIjobNoUOAt9yh2JT/Q==
X-Received: by 2002:a17:902:ba98:b0:2d6:fee6:65ae with SMTP id
 d9443c01a7336-2db1232e1c3mr208841035ad.4.1788770863774; Mon, 07 Sep 2026
 01:47:43 -0700 (PDT)
MIME-Version: 1.0
References: <20260824110432.1074136-1-robert.marko@sartura.hr>
 <20260824110432.1074136-2-robert.marko@sartura.hr> <0cc2d875-7aab-4091-816c-031f21f3cbac@microchip.com>
In-Reply-To: <0cc2d875-7aab-4091-816c-031f21f3cbac@microchip.com>
From: Robert Marko <robert.marko@sartura.hr>
Date: Mon, 7 Sep 2026 10:47:32 +0200
X-Gm-Features: AcwNN1UN3QTAaO3T5aX08ZJGRbzWUSCSQzk2RVV1wbUqXENm6k12pDenn8TnFIY
Message-ID: <CA+HBbNFdqjAJYduFukaZL4+EN12OrsT4qsso95tds828m_z0ag@mail.gmail.com>
Subject: Re: [PATCH 2/4] arm64: dts: microchip: lan969x: add SDMMC nodes
To: Aubin Constans <aubin.constans@microchip.com>
Cc: ulfh@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com, 
	claudiu.beznea@tuxon.dev, linux-mmc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, luka.perkov@sartura.hr
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_014745_476838_7F727364 
X-CRM114-Status: GOOD (  15.39  )
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

On Tue, Aug 25, 2026 at 7:14=E2=80=AFPM Aubin Constans
<aubin.constans@microchip.com> wrote:
>
> On 24/08/2026 12:56, Robert Marko wrote:
> > Add nodes for both SDMMC controllers.
> >
> > Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> > ---
> >   arch/arm64/boot/dts/microchip/lan9691.dtsi | 24 +++++++++++++++++++++=
+
> >   1 file changed, 24 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/microchip/lan9691.dtsi b/arch/arm64/bo=
ot/dts/microchip/lan9691.dtsi
> > index a8541c6a098d..2d943ea75768 100644
> > --- a/arch/arm64/boot/dts/microchip/lan9691.dtsi
> > +++ b/arch/arm64/boot/dts/microchip/lan9691.dtsi
> > @@ -414,6 +414,30 @@ qspi0: spi@e0804000 {
> >                          status =3D "disabled";
> >                  };
> >
> > +               sdmmc0: mmc@e0830000 {
> > +                       compatible =3D "microchip,lan9691-sdhci",
> > +                                    "microchip,sam9x60-sdhci";
> > +                       reg =3D <0xe0830000 0x00000300>;
> > +                       interrupts =3D <GIC_SPI 64 IRQ_TYPE_LEVEL_HIGH>=
;
> > +                       clocks =3D <&clks GCK_ID_SDMMC0>, <&clks GCK_ID=
_SDMMC0>;
> > +                       clock-names =3D "hclock", "multclk";
> > +                       assigned-clocks =3D <&clks GCK_ID_SDMMC0>;
> > +                       assigned-clock-rates =3D <100000000>;
>
> If always targeting an e.MMC, capped at the High Speed DDR mode, one migh=
t consider
> a multiple of 52 MHz here.

Hi Aubin,
The issue is that LAN969x cannot derive a 52MHz nor 104Mhz clock.
Requsting 104MHz would be around 111MHz, while with 100MHz the end
clock is 50MHz.

Regards,
Robert
>
> > +                       status =3D "disabled";
> > +               };
> > +
> > +               sdmmc1: mmc@e0838000 {
> > +                       compatible =3D "microchip,lan9691-sdhci",
> > +                                    "microchip,sam9x60-sdhci";
> > +                       reg =3D <0xe0838000 0x00000300>;
> > +                       interrupts =3D <GIC_SPI 50 IRQ_TYPE_LEVEL_HIGH>=
;
> > +                       clocks =3D <&clks GCK_ID_SDMMC1>, <&clks GCK_ID=
_SDMMC1>;
> > +                       clock-names =3D "hclock", "multclk";
> > +                       assigned-clocks =3D <&clks GCK_ID_SDMMC1>;
> > +                       assigned-clock-rates =3D <45000000>;
> > +                       status =3D "disabled";
> > +               };
> > +
> >                  qspi2: spi@e0834000 {
> >                          compatible =3D "microchip,lan9691-qspi";
> >                          reg =3D <0xe0834000 0x00000100>,
> > --
> > 2.55.0
> >
>


--=20
Robert Marko
Staff Embedded Linux Engineer
Sartura d.d.
Lendavska ulica 16a
10000 Zagreb, Croatia
Email: robert.marko@sartura.hr
Web: www.sartura.hr

