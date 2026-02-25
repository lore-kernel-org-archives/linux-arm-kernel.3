Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05636FD3773
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Feb 2026 16:58:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1UUJBaTxIHqlB8DyLOC24tnGMlzJ3zInPGqEl8rtHAA=; b=xSAyyHBIrbA6JCKv4nC9p4a6ZT
	9a/J/PcpKB4DTNrilIeqcSu+ZOX85Fgr8nE0icz/HA+PbIbTX26Qw8BzuQvNF5Ygx5WwcRHSOwkg1
	gPe6OtZITdhlsfrk4QSS87MviHdK61/XunWPGsrxULfG1RDmrA7ljqkfUXgm3OSpOEZgIWGafRgP0
	GUM73knZNs9XS7d442ZglGCYAn4UoEQIPtLUz9T7ryM8yt7njMUFeHKp/8MVNokwEUe+W3Q6pUxNk
	NnVaSOFxielrLyQaS4o/J8E0dg7YjZFRjVZneRhe0WpGJ75p+KeIcMzQGpuVSubSBem6G2k4ErDTk
	sh5JD+uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvICw-00000004aJ9-1Qt5;
	Wed, 25 Feb 2026 16:57:54 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvICt-00000004aIf-1Pg6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Feb 2026 16:57:52 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-48371bb515eso87563625e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Feb 2026 08:57:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772038669; x=1772643469; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1UUJBaTxIHqlB8DyLOC24tnGMlzJ3zInPGqEl8rtHAA=;
        b=NpjsCpnZaDmUn/8X99En7LkbPI/aEocMXUI6PBILKARFnF4UEaNQyf29v/Usub6PwZ
         KeQHq+LJVysDe/w16PtOpCtdkpBKli+rNiQdFn7/wTvUqYRdQ4zUrI8U5JZutm1OSTan
         Z4HophwdxoAK0PexOcrJA2SPH1Rd8nUk/vypsjPcMgmmdIUSqcCURiCx3T7vzNZZMdcH
         bQtkd36g4ZCnb1DGdjWygDlMmX3py70Y+YZkuKy0CtMOy5UKxmwihkLTZ+AVUIXYqwr+
         /TgDOrjGiVvjbCzxDJKx20TUbYAm12x/J1pu0ea5Tj9MTLDpguXCNGGd5RMNl8YDsCCS
         IzyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772038669; x=1772643469;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1UUJBaTxIHqlB8DyLOC24tnGMlzJ3zInPGqEl8rtHAA=;
        b=LcTM1GjEoMC1bZeZ6kb8Knw6lkOTf3NbS3yc539pzWV1RaKhzE/TuJGRLmjdVj3BFu
         iFmagz9bXea9sTEyiBqam3wD2bCMc0H1itWmqI4+t88tazr28+xvijulW7ryuZhSGfni
         dP/cjZ7cLPF+V+ydlcg1AbCzYbwBecIu+kwRfG5EC22t2LUVKG59u3eXefY6p0vd3+aU
         9IMz/0jSnPEGCnolQpDhEacF7PmN4n7/uCcuNFUczW97OWnnKTs4asB7yqC+6EaCMVmw
         Qj1PJuhLKqKHGCXCRJNmi+41KA1E81baRxXJAioq6dYL1g17BIlTJCGvPNaKbAQziJzz
         n7Sw==
X-Forwarded-Encrypted: i=1; AJvYcCV+rwRYpDT+KT3lIQfjIn773316Su+yN76/5U0WhhZnbc1DCyfbgc0FeHAR2dV+AmgJyfpkWlYCzdLRjBRoqIE8@lists.infradead.org
X-Gm-Message-State: AOJu0YyvhFSGfJdA2l2QhJG1Kk7rcTdH29PGaL/ail90uR7+pVBvRxPB
	pkEgX+hI9V/shjvenYr3rBRxVk9zxR67ICf7wBJYZKW4yzhezJxTG8HB
X-Gm-Gg: ATEYQzyRhF1DUtspkzSXE6jYxpv9TQXR6AwQaoRlSU+7eSF2rzzYcEZF87OZQNYhKwH
	AzefP49tk02ubzzSLwgZ21H8HVWpukGstHO3xD/SM+otZcGDEcDzpNNaI8LJtMQ/oUeFKXHEN3u
	ABCBBJtUyvAVQ5Szn9f99QioREYQxY21VYEMAIC+X8pdJjJ+Z6ncM++z+ghUJj8hLaem7vFAYCc
	sA3OVp597f06o56aKbtEoLsv1NATf/RO7vnqx4PV61Np7Op2mYj+7rdv3VGlJIxZ/0igYKlhgnT
	QB3fKgnyBVt/9m/yKG+XH4tWz2FOSnG89lLtR6XqC90OnxM5b9sPNGrIjuhFQtdPH4ztSis1MJ3
	ZUVBZJ7KCc23y9pmvU/47FvUR1v7wvFScog6B8ofJJXjjdLtsaPkmfD9mfNSCPgOrqHbgLCtKwB
	w2o2pjEHBeA6axTrrNgCR6VDrPKS/L/2O+ZVEM5eU7vaCCQB76cmXYxLBQbIy+HsW8NxFl+Mbgf
	YBqW78VYn3jWaEKqMwPCcQZZf3Y
X-Received: by 2002:a05:600c:a016:b0:477:fcb:2256 with SMTP id 5b1f17b1804b1-483a962e470mr290674845e9.17.1772038668640;
        Wed, 25 Feb 2026 08:57:48 -0800 (PST)
Received: from jernej-laptop.localnet (86-58-126-118.dynamic.telemach.net. [86.58.126.118])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bd7141e4sm86300175e9.7.2026.02.25.08.57.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 08:57:48 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej@kernel.org>,
 Samuel Holland <samuel@sholland.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 wens@kernel.org
Cc: devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-leds@vger.kernel.org
Subject: Re: [PATCH 2/3] arm64: dts: allwinner: sun55i-a523: Add LED controller
Date: Wed, 25 Feb 2026 17:57:46 +0100
Message-ID: <2818809.mvXUDI8C0e@jernej-laptop>
In-Reply-To: <CAGb2v675r8idb3MHyaPD6XNrDF3na-rH2342ET0TUm1kGsT20w@mail.gmail.com>
References: <20260225160828.1687643-1-wens@kernel.org>
 <20260225160828.1687643-3-wens@kernel.org>
 <CAGb2v675r8idb3MHyaPD6XNrDF3na-rH2342ET0TUm1kGsT20w@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_085751_391931_A486A2F0 
X-CRM114-Status: GOOD (  20.13  )
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

Dne sreda, 25. februar 2026 ob 17:14:51 Srednjeevropski standardni =C4=8Das=
 je Chen-Yu Tsai napisal(a):
> On Thu, Feb 26, 2026 at 12:08=E2=80=AFAM Chen-Yu Tsai <wens@kernel.org> w=
rote:
> >
> > The A523 SoC family features an LED controller that is identical to the
> > one found on previous SoCs.
> >
> > Add a device node for it, and one of the possible pinmux settings. This
> > setting is used on the Avaota A1.
> >
> > Signed-off-by: Chen-Yu Tsai <wens@kernel.org>
> > ---
> >  .../arm64/boot/dts/allwinner/sun55i-a523.dtsi | 22 +++++++++++++++++++
> >  1 file changed, 22 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi b/arch/arm6=
4/boot/dts/allwinner/sun55i-a523.dtsi
> > index 09bd149bbf51..b8263e2872af 100644
> > --- a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
> > +++ b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
> > @@ -170,6 +170,13 @@ i2s2_pi_pins: i2s2-pi-pins {
> >                                 bias-disable;
> >                         };
> >
> > +                       /omit-if-no-ref/
> > +                       ledc_ph_pin: ledc-ph-pin {
> > +                               pins =3D "PH19";
> > +                               function =3D "ledc";
> > +                               allwinner,pinmux =3D <5>;
> > +                       };
> > +
> >                         mmc0_pins: mmc0-pins {
> >                                 pins =3D "PF0" ,"PF1", "PF2", "PF3", "P=
=464", "PF5";
> >                                 allwinner,pinmux =3D <2>;
> > @@ -300,6 +307,21 @@ ccu: clock-controller@2001000 {
> >                         #reset-cells =3D <1>;
> >                 };
> >
> > +               ledc: led-controller@2008000 {
> > +                       compatible =3D "allwinner,sun55i-a523-ledc",
> > +                                    "allwinner,sun50i-a100-ledc";
> > +                       reg =3D <0x02008000 0x400>;
> > +                       interrupts =3D <GIC_SPI 28 IRQ_TYPE_LEVEL_HIGH>;
> > +                       clocks =3D <&ccu CLK_BUS_LEDC>, <&ccu CLK_LEDC>;
> > +                       clock-names =3D "bus", "mod";
> > +                       resets =3D <&ccu RST_BUS_LEDC>;
> > +                       dmas =3D <&dma 42>;
> > +                       dma-names =3D "tx";
> > +                       #address-cells =3D <1>;
> > +                       #size-cells =3D <0>;
> > +                       status =3D "disabled";
> > +               };
> > +
> >                 ths1: thermal-sensor@2009400 {
>=20
> I Forgot to rebase this patch before the thermal sensor one in my tree.
> I can fix this when applying, so please still review the patch.

Values are correct, so with a rebase this patch is:
Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

>=20
> ChenYu
>=20
> >                         compatible =3D "allwinner,sun55i-a523-ths1";
> >                         reg =3D <0x02009400 0x400>;
> > --
> > 2.47.3
> >
>=20





