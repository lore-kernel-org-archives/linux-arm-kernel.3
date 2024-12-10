Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B478E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 23:14:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gvq7gI8RNb3ICQbqC2EfSBDJrqnm4n1+J8nOiqfy3lQ=; b=27ii3LZe/NfV8Zh/g6+KQEdcgq
	mhD3laLszzl9fo56XYDn7M8k1uCzzirxHRxwFKZfv75YtkQEOzEuAmLWlKyi2qL1aoGIbk9bb3/ax
	sAoTA4YYwBsn/3QVPkmkbdbNSJzXoDBCfgpflXeVOKlABTNuzAI9CQ1bbdEBsVYQEgpUNHsixoeNN
	c+JIDp2DCzOi9u+C0U8ekp+ySYU3pGCarLBGV0LJeNmBDFr4xAPvDodEtoVKn6KL/WRizusjQNajl
	HsXix/CsaPo2M8GMHL7GvtNouONaiMhImi7kNG/Plx6CKn1WJ4TYXXxEDucjxNAtMP4cCx+bv+nqa
	nRIoLHHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tL9RD-0000000D8EY-1Yqe;
	Tue, 10 Dec 2024 23:14:43 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tL9Lg-0000000D6zL-0pkU;
	Tue, 10 Dec 2024 23:09:01 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1733872126; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Jmd+5/qbY5GUV3MOzpohOMMqts6u+ys1LDBxEUaltkIDYgMq6Tk0zL9WKl/Q9yS3OzgSdbI6XJuIuFk0bMDn/lqaDhYvWZ2knW8f6uNvTArj+s7gbmUmlK4SdommoJ4YwiYlRW0XfOJNYx4DJmuKdWaee39JLgZzycrJoi6n/dE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1733872126; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=gvq7gI8RNb3ICQbqC2EfSBDJrqnm4n1+J8nOiqfy3lQ=; 
	b=K6cGwSI4CbELl1l4nugQMy9xuXMiKrxN3Fl0To5rjaksYSwnMEKvgotQN41IVxvPt2Es7cBxYq15284bWWClBlx0Y0T1TZAv6sUxIc5bHPuxIjQvJHlVN0BBl5D3gTN/+PY+b1IBGTGR9mCVSWm9N+gGMByPcSlry5f9uiUSCSs=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.reichel@collabora.com;
	dmarc=pass header.from=<sebastian.reichel@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1733872126;
	s=zohomail; d=collabora.com; i=sebastian.reichel@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=gvq7gI8RNb3ICQbqC2EfSBDJrqnm4n1+J8nOiqfy3lQ=;
	b=FCCleR/WnMb963PKCB9u3gzKwI94hDrV38Lb8WuvG5CaGKwvUH0nRkfGOS+vBuZu
	mPL+ii5FLdLrCbb/51VEciawQU6EC5ty9RrrD0lj6xDAPgjcJRkM1a5sIWSAbTnj2vu
	T48zsW8qtMIungo+7xAIo+gPdr+t2hnkYmE9+4g4=
Received: by mx.zohomail.com with SMTPS id 1733872124346453.90991571903544;
	Tue, 10 Dec 2024 15:08:44 -0800 (PST)
Received: by mercury (Postfix, from userid 1000)
	id 2E0C110604B1; Wed, 11 Dec 2024 00:08:40 +0100 (CET)
Date: Wed, 11 Dec 2024 00:08:40 +0100
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: FUKAUMI Naoki <naoki@radxa.com>
Cc: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kernel@collabora.com
Subject: Re: [PATCH v1 1/1] arm64: dts: rockchip: Add USB-C support to ROCK 5B
Message-ID: <5mjjq3f3tqu4h2f7wbdcfon6csfsuxge5skr6mmgozvq65uods@66yx7yuefzqn>
References: <20241210163615.120594-1-sebastian.reichel@collabora.com>
 <6A24DF29AE2F3CDC+70602cc7-2c03-470d-955f-06b2db116e20@radxa.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="537dfqts2is22e64"
Content-Disposition: inline
In-Reply-To: <6A24DF29AE2F3CDC+70602cc7-2c03-470d-955f-06b2db116e20@radxa.com>
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-1.3.1/233.827.1
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_150900_285487_E084425F 
X-CRM114-Status: GOOD (  37.84  )
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


--537dfqts2is22e64
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v1 1/1] arm64: dts: rockchip: Add USB-C support to ROCK 5B
MIME-Version: 1.0

Hello Naoki,

On Wed, Dec 11, 2024 at 07:10:55AM +0900, FUKAUMI Naoki wrote:
> Hi Sebastian,
>=20
> Thank you very much for your work!
>=20
> $ cat /sys/class/power_supply/tcpm-source-psy-4-0022/{current_max,current=
_now,online,type,usb_type,voltage_max,voltage_min,voltage_now}
> 1500000
> 1500000
> 1
> USB
> C [PD] PD_PPS
> 20000000
> 20000000
> 20000000
>=20
> $ cat /sys/class/power_supply/tcpm-source-psy-4-0022/{current_max,current=
_now,online,type,usb_type,voltage_max,voltage_min,voltage_now}
> 5000000
> 5000000
> 1
> USB
> C PD [PD_PPS]
> 20000000
> 20000000
> 20000000
>=20
> $ ls /sys/class/udc/
> fc000000.usb
>=20
> I can configure it as CDC-NCM and host detects it.
> But I could not use it as a HOST port. How to use it?

You can switch between host and peripheral for Type-C ports like
this depending on the remote sides capabilities:

 * echo host > /sys/class/typec/<port>/data_role
 * echo device > /sys/class/typec/<port>/data_role

I tested this with a USB-C hub connected to the port, which works
in host mode.

> some minor nitpick is below:
>=20
> On 12/11/24 01:36, Sebastian Reichel wrote:
> > Add hardware description for the USB-C port in the Radxa Rock 5 Model B.
> > This describes the OHCI, EHCI and XHCI USB parts, but not yet the
> > DisplayPort AltMode (bindings are not yet upstream).
> >=20
> > The fusb302 node is marked with status "fail", since the board is usual=
ly
> > powered through the USB-C port. Handling of errors can result in hard
> > resets, which removed the bus power for some time resulting in a board
> > reset.
> >=20
> > The main problem is that devices are supposed to interact with the
> > power-supply within 5 seconds after the plug event according to the
> > USB PD specification. This is more or less impossible to achieve when
> > the kernel is the first software communicating with the power-supply.
> >=20
> > Recent U-Boot (v2025.01) will start doing USB-PD communication, which
> > solves this issue. Upstream U-Boot doing USB-PD communication will also
> > set the fusb302 node status to "okay". That way booting a kernel with
> > the updated DT on an old U-Boot avoids a reset loop.
> >=20
> > Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> > ---
> >   .../boot/dts/rockchip/rk3588-rock-5b.dts      | 121 ++++++++++++++++++
> >   1 file changed, 121 insertions(+)
> >=20
> > diff --git a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts b/arch/arm=
64/boot/dts/rockchip/rk3588-rock-5b.dts
> > index d597112f1d5b..cb5990df6ccb 100644
> > --- a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts
> > +++ b/arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts
> > @@ -5,6 +5,7 @@
> >   #include <dt-bindings/gpio/gpio.h>
> >   #include <dt-bindings/leds/common.h>
> >   #include <dt-bindings/soc/rockchip,vop2.h>
> > +#include <dt-bindings/usb/pd.h>
> >   #include "rk3588.dtsi"
> >   / {
> > @@ -84,6 +85,15 @@ rfkill-bt {
> >   		shutdown-gpios =3D <&gpio3 RK_PD5 GPIO_ACTIVE_HIGH>;
> >   	};
> > +	vcc12v_dcin: regulator-vcc12v-dcin {
> > +		compatible =3D "regulator-fixed";
> > +		regulator-name =3D "vcc12v_dcin";
>=20
> typec_vin by schematic.

Ack. Will update in v2.

> > +		regulator-always-on;
> > +		regulator-boot-on;
> > +		regulator-min-microvolt =3D <12000000>;
> > +		regulator-max-microvolt =3D <12000000>;
> > +	};
> > +
> >   	vcc3v3_pcie2x1l0: regulator-vcc3v3-pcie2x1l0 {
> >   		compatible =3D "regulator-fixed";
> >   		enable-active-high;
> > @@ -142,6 +152,7 @@ vcc5v0_sys: regulator-vcc5v0-sys {
> >   		regulator-boot-on;
> >   		regulator-min-microvolt =3D <5000000>;
> >   		regulator-max-microvolt =3D <5000000>;
> > +		vin-supply =3D <&vcc12v_dcin>;
>=20
> typec_vin.
>=20
> >   	};
> >   	vcc_1v1_nldo_s3: regulator-vcc-1v1-nldo-s3 {
> > @@ -264,6 +275,67 @@ regulator-state-mem {
> >   	};
> >   };
> > +&i2c4 {
> > +	pinctrl-names =3D "default";
> > +	pinctrl-0 =3D <&i2c4m1_xfer>;
> > +	status =3D "okay";
> > +
> > +	usbc0: usb-typec@22 {
>=20
> Is "usbc0" label necessary?

no, but does it hurt?

> > +		compatible =3D "fcs,fusb302";
> > +		reg =3D <0x22>;
> > +		interrupt-parent =3D <&gpio3>;
> > +		interrupts =3D <RK_PB4 IRQ_TYPE_LEVEL_LOW>;
> > +		pinctrl-names =3D "default";
> > +		pinctrl-0 =3D <&usbc0_int>;
>=20
> cc_int_l by schematic.

Ack. I intentionally switched away from this naming, since cc prefix
is imho a way worse prefix than usbc0. The _l suffix just means
active low, which is already encoded in DT.

But I don't have a strong opinion and can fix this in v2.

> > +		vbus-supply =3D <&vcc12v_dcin>;
>=20
> typec_vin
>=20
> > +		/*
> > +		 * When the board is starting to send power-delivery messages
> > +		 * too late (5 seconds according to the specification), the
> > +		 * power-supply reacts with a hard-reset. That removes the
> > +		 * power from VBUS for some time, which resets te whole board.
>=20
> ... resets "the" whole board.

Ack.

>=20
> > +		 */
> > +		status =3D "fail";
> > +
> > +		usb_con: connector {
>=20
> Is "usb_con" label necessary?

No. It should either be changed to "usbc0_con" or removed. In
general I tend to add some labels when they might be needed by
something in the future. They are more or less free anyways.

-- Sebastian

--537dfqts2is22e64
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmdYye4ACgkQ2O7X88g7
+po8DxAAh/1GXsz90nU45/Kz30iOTPZiGT1VVldlfDiY3WfjReQOG0Z/gUEOwwb/
cF+IqdzCUkdI96EPpWlrz9mAxKhpn/wSVSIWEmeRzQ66ynwSWrLHGjL8QkQyqsnX
gJvjTbhLr9NJNPqc7/iFX2NFpjIdCPqCnNOLcb2M68SQo5yyTYIc+3K+6b9PeUau
U5WOmbSSLa1GmSaG6OcYDZkc6YuntD66cY3Vn9UDVoaW0NWcvW92cqSHH5Gz3enU
jp9Ha+GiR2tHPqbtKUe1+H0mGZUMP5XqvnA4ychh0YH6tertPI8OLJiLAC1PaRnk
9X0AHlvTC7pF29KF87l6qyhFGliYb1KAc8hMewqcJhxKqPgV+PzlXIIPALanwQqX
YKmi0/JFCj1xvkXwuENAJe9LyqdIoAm2JRz7AclNnScsBhoZQpk8X3GAMp2eDHAy
1ucrC+yZslHmZiFZ/k5T9s4s0GuW7v/sM5tmRyz1w02fUI0q+7cm1VkJdNzpNBrZ
onEwZTvTxIAtaCzRnVWXb63xlu4PyYN2G5L5OXcVPlb9jP7eJwwHgVozmgu/e702
4sMnzuF+yBBK+C4+Sh6DXYjsCJF6lwI+Kqmfl010Ax6fqB4WzR4skDxUSmZlcuau
+L7mxsMwziz5ARmjjbiRn4KP3ObCc9/CsHICn8+hyyaKurLj3BI=
=2Cci
-----END PGP SIGNATURE-----

--537dfqts2is22e64--

