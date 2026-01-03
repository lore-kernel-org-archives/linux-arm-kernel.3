Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D400EFC6180
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  3 Jan 2026 13:53:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d9H7y6YgOMKmHV3+yZbIO63YJ0wpHijUok8tAbtehVI=; b=2+f2k7MqkNMu6V1EVLzbuoxlUE
	QEJIrwV4c5jM1jr7tmMSG61X2CKND0TddSiq68WpTgCzquVv/n8ADeerjUOaVE9KptIW8PzVS0FsL
	TR1eCKws78Atqss8mw/83br0oxPjzeW/BsnWKu6Ezlw+gKBq/uJGEi5ashfzCN8HoMd2pmjEccamX
	t+X90DZ+AGwJBfqxDU/QCmNu1ghnCFksBBK9Ji5piDFN4/GdDoQ6xgznrzojrpHkQCGwaH7IT471o
	A9VuykIuwehwN8dQ9qD50cLBCGKEb9LNu2uw6wEtj/zD/5fFFDcAarTXxzK0/b5gS8CFBf6I/Sr5Y
	NWTp/6BQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vc24J-00000009OFh-3Nc0;
	Sat, 03 Jan 2026 13:53:23 +0000
Received: from sender4-pp-g123.zoho.com ([136.143.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vc24G-00000009OF9-2TKJ;
	Sat, 03 Jan 2026 13:53:21 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1767448380; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=IDcuSeXH2CICFAdm65XISS6csPuDye1jA/nhxRiRK6YMQM12LYDxTaCVVQ4rbbIdp27i5JRf16TAhfu1JYS+zTQt/CIh03k2luJ3uVWsNuBM08iTOHxAvrDFSIrqDylrgxWGNJ1sjDAqJeOuojaWudVLknBaQmJ7yYY7DmXgdL8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1767448380; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=d9H7y6YgOMKmHV3+yZbIO63YJ0wpHijUok8tAbtehVI=; 
	b=DqtH6+e3u69ksoK5kcrZTy0bIIZw3+54+VHz34hV59f4WSuVCxPJ/W6DbiG6qqKlqpajswX3i5hv63fh92v+dJcO6x2yuDx+gNp4rNbEMBtqUFZcDJ5iNqq1dpxGKABGg80YOnHChy6mMuNU0LWy/yEjM4gX+FOlUCh4p0WW2DE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.reichel@collabora.com;
	dmarc=pass header.from=<sebastian.reichel@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1767448380;
	s=zohomail; d=collabora.com; i=sebastian.reichel@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=d9H7y6YgOMKmHV3+yZbIO63YJ0wpHijUok8tAbtehVI=;
	b=Sxq5VpntLYcVgyUsXFWqi2JLqQB6A3kAks8oO07M3eVS0R2IpY+LCS02nVEbZRL/
	U0NDdJSSazUI68G0BqabQ3XugbHJQ5J7Pk5tdUENmcXgSC4mh0tJD5/4s2bvyV4Ehv2
	3VLeUumbLQptuQKi8LgI/DpZ6K7XpKFqbaZjMe+Y=
Received: by mx.zohomail.com with SMTPS id 1767448375895378.81651063590607;
	Sat, 3 Jan 2026 05:52:55 -0800 (PST)
Received: by venus (Postfix, from userid 1000)
	id 7AB8F18054C; Sat, 03 Jan 2026 14:52:50 +0100 (CET)
Date: Sat, 3 Jan 2026 14:52:50 +0100
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Anand Moon <linux.amoon@gmail.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
	FUKAUMI Naoki <naoki@radxa.com>, Diederik de Haas <didi.debian@cknow.org>, 
	Yongbo Zhang <giraffesnn123@gmail.com>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, 
	"moderated list:ARM/Rockchip SoC support" <linux-arm-kernel@lists.infradead.org>, 
	"open list:ARM/Rockchip SoC support" <linux-rockchip@lists.infradead.org>, open list <linux-kernel@vger.kernel.org>, 
	"open list:USB TYPEC CLASS" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH v1 1/3] arm64: dts: rockchip: rk3588-rock-5b-5bp-5t:
 Correct Type-C pin bias settings
Message-ID: <aVke1kQnHJLqWGHi@venus>
References: <20260103083232.9510-1-linux.amoon@gmail.com>
 <20260103083232.9510-2-linux.amoon@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="j3clvygndka2x6e6"
Content-Disposition: inline
In-Reply-To: <20260103083232.9510-2-linux.amoon@gmail.com>
X-Zoho-Virus-Status: 1
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-1.4.3/267.430.24
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260103_055320_744348_93735A44 
X-CRM114-Status: GOOD (  18.63  )
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


--j3clvygndka2x6e6
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v1 1/3] arm64: dts: rockchip: rk3588-rock-5b-5bp-5t:
 Correct Type-C pin bias settings
MIME-Version: 1.0

Hi,

On Sat, Jan 03, 2026 at 02:01:17PM +0530, Anand Moon wrote:
> As pre FUSB302 datasheet interrupt line (INT_N) is an open-drain,
> active-low signal. It requires a pull-up resistor to maintain a stable
> high state when deasserted. Similarly, the TYPEC5V_PWREN_H enable signal
> requires a pull-down resistor to ensure it defaults to a low state,
> preventing unintended power delivery during the boot sequence.
>=20
> Update the pinctrl entries to use pcfg_pull_up for usbc0_int and
> pcfg_pull_down for vbus5v0_typec_en to align with the hardware's
> electrical requirements.
>=20
> Cc: Sebastian Reichel <sebastian.reichel@collabora.com>
> Fixes: 67b2c15d8fb3 ("arm64: dts: rockchip: add USB-C support for ROCK 5B=
/5B+/5T")
> Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> ---
> v1: As per the shematics CC_INT_L interrupt pin is GPIO3_B4_u
>     As per the shematics TYPEC5V_PWREN_H pin is GPIO2_B6_d
> ---

Checking the schematics:

5B v1.45 - CC_INT_L - R2613 10K pull-up resistor
5B v1.45 - TYPEC5V_PWREN_H - GPIO is effectively unused because R95035 is NC

5B+ v1.2 - CC_INT_L - R2613 10K pull-up resistor
5B+ v1.2 - TYPEC5V_PWREN_H - R163 100K pull-down resistor

5T v1.2 - CC_INT_L - R2613 10K pull-up resistor
5T v1.2 - TYPEC5V_PWREN_H - R163 100K pull-down resistor

TLDR: All GPIOs have pull resistors in discrete hardware and do not
need them muxed in the SoC.

Greetings,

-- Sebastian

>  arch/arm64/boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi b/ar=
ch/arm64/boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi
> index b3e76ad2d869..0cd8ac7bf538 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi
> @@ -537,11 +537,11 @@ pcie3_vcc3v3_en: pcie3-vcc3v3-en {
> =20
>  	usb {
>  		usbc0_int: usbc0-int {
> -			rockchip,pins =3D <3 RK_PB4 RK_FUNC_GPIO &pcfg_pull_none>;
> +			rockchip,pins =3D <3 RK_PB4 RK_FUNC_GPIO &pcfg_pull_up>;
>  		};
> =20
>  		vbus5v0_typec_en: vbus5v0-typec-en {
> -			rockchip,pins =3D <2 RK_PB6 RK_FUNC_GPIO &pcfg_pull_none>;
> +			rockchip,pins =3D <2 RK_PB6 RK_FUNC_GPIO &pcfg_pull_down>;
>  		};
>  	};
>  };
> --=20
> 2.50.1
>=20

--j3clvygndka2x6e6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmlZHy8ACgkQ2O7X88g7
+po4Og/9H83sPXhEoMq5arPCN6/ta/CDQCipwx6OZLyN6znuNtnhXP5yq7ymZ/wf
06Nuv4Abjr7/hl3DyyprGK8nSQiZ6BpFNzbqP/9VcVxdZHHbOrqRLLb8DllfhZeR
OgeIx5Lg1NkyyEIPLEUn72KuI7FD+jwfKzk1ptdYc8VW3woDefWwKVOCD1pFlyb0
jYbSI+4oVtq7sPLlH+Eu0H2ef7btVvmOFNFbuM0xgQQnL5jxHLux4fOd66hVJQb6
5PGzVQkppms6Srq34fF11/+pdCEAZFs3D1nIXsF46HkxILxHhObUkz21FIZ2MKOX
VaYyb0aFGxgqKnFMGFUXlvDWHZreHKZZHwTpaMABiQGp+4E/k0ORW3FmX3Djgu69
UPdPf16M1mZNYzj7N0iR36Jb6lGkeW0BAc4+qdEhuJc78t73kHObkM1KoNXXzFEx
fuANSDk/OAw6o8eCv0Jw3H/bPrwj2J67YLN1ZITxrWxWjuX3bPq2aorWWW5aBMPo
d3PXQwHz0r3bcvgsSY/DWa2xaQilt8w2iT/1OY49zkFty+1EDznqZExprL3TM8zG
4uOw9kMuk7+RvbZjZzgxlowzroN08ICWYhCgPld36DCb25YMQNeARU4/y+lBpnoA
XPy+YtUpDtM1I/JRXDsMdEIeyTK6GwgvoaS7xsnephRytgPosuQ=
=NzfA
-----END PGP SIGNATURE-----

--j3clvygndka2x6e6--

