Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 030A3E77180
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Dec 2024 07:15:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vzNbXrzH5ENTMyecgc2wOrRCM3UCXYh0FFnOADAZtiM=; b=NTpNKrYMN5C2WK3glC7dX7bs4V
	3kcEDVfmwKHze7sEn79tP3WLiwfHDkdURslCEAAIghTUFNqQym20pg0iN27rP5nenBOnYik5Yi8Q3
	ZCMtD0Te0E9BVYId6lc1denDpFkJ0QXOmLU0fxxsiipaVuYLG1RTzgBm40Byj9Wbub+hQ4D8dsvKb
	JppRc35hFB8tdSpPluuEI64gmWzMaHmZzpD6Vu8FTV0j0IgzAvC7j2vXl1dpz1sdLOsTM5Uk0hApc
	4Z7GQdGg1MHP+Q2F5RuLyoDIt+RcB7KaIJqclx1bLBRKMU5CcSFWV6DbpqhVC5ct4HynqsAWJcbBv
	bVdTim/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tMMMT-00000005tCf-3MZG;
	Sat, 14 Dec 2024 07:14:49 +0000
Received: from sender4-op-o15.zoho.com ([136.143.188.15])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tMMLP-00000005t4I-02ao
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Dec 2024 07:13:44 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1734160415; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=GOu1rG+202vFzvdYqhjdzM3Cbe/zwQt2oiakhcFLydI4NhoNq8NHQWb/hVhIPxT5lmpK0IF93DZzg9aBMiKJ+vE1WCCQeb+qCn84HOR73sFAjIO0QAlqz3mhsXGWudTVyf1HT/R5RAxNYZRogHNWBLim3YA6YeYkhJwC+lvsYfo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1734160415; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=vzNbXrzH5ENTMyecgc2wOrRCM3UCXYh0FFnOADAZtiM=; 
	b=OFe521JuQvKuFmsH9pqR5n98FfqZQiXeEIBjQTTWDe84dYrh/2wypgqx1GeEOqU03D/Ip8PJPWXzzjSBKvoDmrZqnG6+JVRSwJuQmoOtW6HFDM1guRt7L/Mz6sN3LtToeKQaDjCTsNamhZY6deGTO221xf4D4LHtGqoOR2Ga8FA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1734160415;
	s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=vzNbXrzH5ENTMyecgc2wOrRCM3UCXYh0FFnOADAZtiM=;
	b=S7jNGMSJJOIGppb9JYpHVOxQriN8cTDc5ov0UI2eq39dSP6Ujr3Gwa85dIXd088a
	ynC5U4YZXUGSeJB8IW41x346k0p0HqIiohJzLaYFwn71WeD3B9VE9/Vo09w17Nmozed
	JBro5v6PIGuYuwO2W7lto0WNn+9/LaHbb6vFgYNJd4OZ2/F5SvEy3beJEX3vgC4J3BJ
	1gVuMrlojYzu0gqRDjTnoDekMdY0++WHzBv5xr4io8ZLa6Lx9VPxB02zyOjxsetbZGa
	pVWjly5chiEkND5FspCgMWtvC2HbjkoEwNYZiWjw7XcGb5UvvdNvYVVyaeyj/kGx4Vq
	Vx/1t7s6eQ==
Received: by mx.zohomail.com with SMTPS id 1734160413407334.39316723417164;
	Fri, 13 Dec 2024 23:13:33 -0800 (PST)
Message-ID: <e61c927a4dfe909f4ede4a07dffd9dcd762875be.camel@icenowy.me>
Subject: Re: [PATCH v2] ARM: dts: sun8i-r40: remove unused GPIO regulator
From: Icenowy Zheng <uwu@icenowy.me>
To: Andre Przywara <andre.przywara@arm.com>, Hermann.Lauer@uni-heidelberg.de
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Jernej
 Skrabec <jernej.skrabec@gmail.com>,  Samuel Holland <samuel@sholland.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Date: Sat, 14 Dec 2024 15:13:23 +0800
In-Reply-To: <20241214011612.4fd9e4bf@minigeek.lan>
References: <20241213195433.GA1568@lemon.iwr.uni-heidelberg.de>
	 <20241214011612.4fd9e4bf@minigeek.lan>
Organization: Anthon Open-Source Community
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4 
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241213_231343_125392_9F43116C 
X-CRM114-Status: GOOD (  22.35  )
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

=E5=9C=A8 2024-12-14=E6=98=9F=E6=9C=9F=E5=85=AD=E7=9A=84 01:16 +0000=EF=BC=
=8CAndre Przywara=E5=86=99=E9=81=93=EF=BC=9A
> On Fri, 13 Dec 2024 20:54:33 +0100
> Hermann.Lauer@uni-heidelberg.de=C2=A0wrote:
>=20
> Hi,
>=20
> CC:ing Icenowy, who added the regulator originally, with commit
> 0ca12c1ee43c ("ARM: sun8i: r40: add 5V regulator for Banana Pi M2
> Ultra").
>=20
> Icenowy: can you clarify what "newer" version this was referring to
> in
> that commit message? That commit in itself doesn't seem to do
> anything,
> as the regulator isn't referenced, and it's not always-on. It's only
> later when the USB nodes were added that it got used?
> So was PH23 really necessary? As Hermann reports, setting PH23 on a
> v1.1
> makes it reboot.

I am not sure, the schematics I have here (which says V1.0) have PH23
as NC... Well, the M2 Berry schematics have PH23 as 5V EN, maybe I
messed up M2U and M2B when developing?

Sorry but I think the data retention situation of my memory looks bad
here, maybe it needs a shorter refresh interval ;-)

>=20
> > Subject: [PATCH v2] ARM: dts: sun8i-r40: remove unused GPIO
> > regulator
>=20
> Hermann, this looks like an extra subject line here?
>=20
> > Banana Pi M2 Ultra V1.1 board resets immediately when the usb core
> > tries
> > to setup PH23 GPIO. It turned out that the V1.0 board USB-A ports
> > are
> > always power supplied and according to the board scheme PH23 is
> > simply
> > not connected.
> >=20
> > So remove the PH23 setup: Doesn't harm V1.0 (with R40) and let V1.1
> > (with A40i) start.
> >=20
> > Signed-off-by: Hermann Lauer <Hermann.Lauer@uni-heidelberg.de>
>=20
> The patch itself looks good to me, but it would be good to clarify
> the
> situation with the "older newer" version.
>=20
> Just in case:
> Reviewed-by: Andre Przywara <andre.przywara@arm.com>
>=20
> Cheers,
> Andre
> =C2=A0
> > ---
> > V2: shorten subject, rm dangerous PH23 regulator completely
> >=20
> > diff --git a/arch/arm/boot/dts/allwinner/sun8i-r40-bananapi-m2-
> > ultra.dts b/arch/arm/boot/dts/allwinner/sun8i-r40-bananapi-m2-
> > ultra.dts
> > --- a/arch/arm/boot/dts/allwinner/sun8i-r40-bananapi-m2-ultra.dts
> > +++ b/arch/arm/boot/dts/allwinner/sun8i-r40-bananapi-m2-ultra.dts
> > @@ -91,15 +91,6 @@
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0};
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0};
> > =C2=A0
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0reg_vcc5v0: vcc5v0 {
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0compatible =3D "regulator-fixed";
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0regulator-name =3D "vcc5v0";
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0regulator-min-microvolt =3D <5000000>;
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0regulator-max-microvolt =3D <5000000>;
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0gpio =3D <&pio 7 23 GPIO_ACTIVE_HIGH>; /* PH23 */
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0enable-active-high;
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0};
> > -
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0wifi_pwrseq: pwrseq {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0compatible =3D "mmc-pwrseq-simple";
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0reset-gpios =3D <&pio 6 10 GPIO_ACTIVE_LOW>; /* =
PG10
> > WIFI_EN */
> > @@ -347,7 +338,5 @@
> > =C2=A0};
> > =C2=A0
> > =C2=A0&usbphy {
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0usb1_vbus-supply =3D <&reg_v=
cc5v0>;
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0usb2_vbus-supply =3D <&reg_v=
cc5v0>;
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0status =3D "okay";
> > =C2=A0};
> >=20
>=20
>=20


