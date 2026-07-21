Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6788DC44532
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 15:15:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Am4FBLquimoXLofVW39R5TXiLDXR3ax8a+vHWlboXD8=; b=LXy8oNVEuoW087plFc32ITadLt
	pP/L6HS/dOi38IuTkfX3PvxmMfRtpaANeq74/sUr/vxhuNMD00Vky1zwaO3yi/Gd9gvI3n9pmaGsy
	G4Y1PGDLR2+QhqkLOc0oYik10De/nbbjY2h0cUkG8S09L9wZTQYTBGtR0z5xK6TzLVHgVBnruI8t2
	5K6EsIxvROB1Hf1V0scb5PUYEXzY6QqKqrIOzaOTdOIX7G2RK5hJqZkhWkhR6FgW7x4J9xo9KEW4R
	3nAbHWbPM2TxxTtvTKJNC8HErBHF/6a+GVB1hKB+1Pq0wsIc4zZyuVkIaBwcj5Y3KFYQD3Div+Hfe
	bXym46mA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmCBo-00000009mA8-3k6x;
	Tue, 21 Jul 2026 15:15:24 +0000
Received: from sender4-op-o11.zoho.com ([136.143.188.11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmCBm-00000009m9T-2owc;
	Tue, 21 Jul 2026 15:15:23 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1784646910; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=DVQQFaeaXJsErpXSmalKDRjp1wKLGpoTBMShl9q+/nye75MohNH2vJacaVILCqfr1zGO+0MfGqIXw3HyFytabBbyIBIfEvhPtXB8BhNR0R0WrrrrGOzIDpzKU5Rg5k0kQl0dolSQGGPBimFH35/1rw8MYMWSkDPApOGl8TLQ7f0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1784646910; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Am4FBLquimoXLofVW39R5TXiLDXR3ax8a+vHWlboXD8=; 
	b=GVdE9TgLfuxGwU5xYXs662IyQhf7y0C0Ae7WeaIAjeBq6SXSjxPlOsA8smbmhsQyE0lMK0S7xq1XetyGwwIV+EBWKpt0yEg0HRBtw+Y7TCKAcepXEb3WYiCMLxfTp77OFUDXAReixhD5o4KM05H95U+FTch55sOUeTCexXn+obo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.reichel@collabora.com;
	dmarc=pass header.from=<sebastian.reichel@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1784646910;
	s=zohomail; d=collabora.com; i=sebastian.reichel@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=Am4FBLquimoXLofVW39R5TXiLDXR3ax8a+vHWlboXD8=;
	b=XgYrilH0DhdO3/Apsdp2g/O94Wepv5AWFeY2GH3ivNF+yasnIYsV//q+IhhMT5bx
	/VuyhjGZlNp5DxV6ZYRpypl4J4TMBoW80UMpoKqPhX1ABTrnP+fba/GkG4uoDMCOOwH
	j5W1bQ4IdMOz3i2CfGUc3RL5OwfJTkzKWm0hLVhQ=
Received: by mx.zohomail.com with SMTPS id 178464690796118.531816677270967;
	Tue, 21 Jul 2026 08:15:07 -0700 (PDT)
Received: by venus (Postfix, from userid 1000)
	id 04A7C180765; Tue, 21 Jul 2026 17:15:04 +0200 (CEST)
Date: Tue, 21 Jul 2026 17:15:03 +0200
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Igor Paunovic <royalnet026@gmail.com>
Cc: Dmitry Osipenko <dmitry.osipenko@collabora.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, kernel@collabora.com, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 4/4] arm64: dts: rockchip: enable HDMI RX audio
 capture on Orange Pi 5 Plus
Message-ID: <al-M4gZ4cZwpEF_H@venus>
References: <20260721064115.64809-1-royalnet026@gmail.com>
 <20260721064115.64809-5-royalnet026@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="iv6yyu46n7brq5vz"
Content-Disposition: inline
In-Reply-To: <20260721064115.64809-5-royalnet026@gmail.com>
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-0.2.10.1.5.2/284.638.57
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_081522_860185_587A6345 
X-CRM114-Status: GOOD (  20.48  )
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


--iv6yyu46n7brq5vz
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v4 4/4] arm64: dts: rockchip: enable HDMI RX audio
 capture on Orange Pi 5 Plus
MIME-Version: 1.0

Hi,

On Tue, Jul 21, 2026 at 08:41:15AM +0200, Igor Paunovic wrote:
> Enable the shared HDMI RX sound card and the i2s7_8ch interface it
> uses. Together with the audio capture support in the snps_hdmirx
> driver this exposes a capture-only ALSA card fed by the HDMI input.
>=20
> Tested on the Orange Pi 5 Plus with multiple HDMI sources: capture
> follows the source sample rate and stays in sync via the FIFO-level
> clock tracking in the driver.
>=20
> Signed-off-by: Igor Paunovic <royalnet026@gmail.com>
> ---

Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>

-- Sebastian

> Changes in v4:
> - only enable the shared hdmi_receiver_sound card and i2s7_8ch, now
>   that the card definition lives in rk3588-extra.dtsi (Sebastian
>   Reichel)
>=20
> New in v3.
>  arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dts | 8 ++++++++
>  1 file changed, 8 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dts b/ar=
ch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dts
> index 9950d11..9f9a303 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dts
> @@ -171,6 +171,10 @@
>  	status =3D "okay";
>  };
> =20
> +&hdmi_receiver_sound {
> +	status =3D "okay";
> +};
> +
>  &hdptxphy0 {
>  	status =3D "okay";
>  };
> @@ -247,6 +251,10 @@
>  	status =3D "okay";
>  };
> =20
> +&i2s7_8ch {
> +	status =3D "okay";
> +};
> +
>  &led_blue_gpio {
>  	gpios =3D <&gpio3 RK_PA6 GPIO_ACTIVE_HIGH>;
>  	status =3D "okay";
> --=20
> 2.53.0
>=20

--iv6yyu46n7brq5vz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmpfjPcACgkQ2O7X88g7
+pqFLRAAkmIPl5/P8Z94H28WY+soiwfSEDNsLAiSGJlJVS8FgREkVhPImsKSVjR3
4o3c4JrrBdq9xWtsdrGrMq3CpCGJ1DJo9OtHO0XMVMWs9d9ubkjM0ob/usXXhjxU
OAzf5GLrUiNsMj8w149tKjXpYF1whrUVPN6ZXmhRpcKkzlsGPhFiD766yx//N0ty
yeh8uFvXqYA5IrRy0G3ZOnUl9bxnqJ/DumiW414ps5KGfdkx51psOGE7y5L//MhS
MhDrmU1MzPRNzo+GUaVahydIG8WA5LHI52fTRSeausAuuuzrgKlIyQWCnjAPxA5X
9MiD4rdNpUZRjPiddyT1AiezcSqHtL4e6KcRhnRjuMDne/32jNsBZnCfSeCdpk3A
5dWp60RnpVzYYGp93F7BRe25Urj3ik5HVmGVMUkSJ4bwSVP2RWSX+GiPTjlAe2IK
x63SwNOF++ZZSXd0VX2tP2mm1Ih2LvD5NI0R2Az8pzfmpwPST2UfgSvVfOfp7mMI
HSUOh6hFH8XlAg2rz8Ny4u25SzmyCa6wQbf6t9n1Fzoeam47sfuEcH9BaexoX/B4
RcU4y9M5N3ZmsQf0z2rhP6fkyFv/ifDrl7wMrCnScB0wtKoBluIt3wzJ+zKFn3z4
8pudmmYwXa7d6tb+SfCxNtEh7SbqGZWhHZmJtYy6V9uJdbBQk7w=
=d36M
-----END PGP SIGNATURE-----

--iv6yyu46n7brq5vz--

