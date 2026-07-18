Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C49A0C44521
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 18 Jul 2026 23:32:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oMGvRNkuFyXaMYeP4ES+8jelR30jNKVF+YZjl8fjH+c=; b=QGrmciL/wUw+l0KJ+fEInZTjQc
	aIriXNJqzxLwZBUyGtn/kXkOfmZ4ovp7BG6EloeyE3keKXbXfSEukqXv1dITt3Ul91rbUeuWSOVyX
	tB+/fjBXBmhWwDxykjDtOs0SZ1uX3LL7/5rJ8MNcfAKyhHt5ui0Sbo3K8I6ovztlsrJvKRfwh60Eu
	y4QG7ZUF1j3LHre5MnEb8TcqDm2wBfATmGKNE2eLplrUWUJx72C9NWhNy8IsLXV4Jf/3hlPbVKVLs
	YK4eLcc46W3bwAOy6XbegNctE0kohLAuFHnk0dr8+aWfGn3zBgySaatcukXcr17C2pX1T+J6KtYTu
	lYEuTVDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlEVr-00000004bLk-41RT;
	Sat, 18 Jul 2026 23:32:07 +0000
Received: from sender4-op-o11.zoho.com ([136.143.188.11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlEVp-00000004bLK-08hg;
	Sat, 18 Jul 2026 23:32:06 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1784417506; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=mjlBT5fBOmj0puaOAj3NrQ4dZIxtuOA+NuCb2Yzp1io4uYKf/JLzyEvzPxyp6rpc1wznjzHszAc6K/k9XBPK9IYRPJpNKcqW9EeFoyUmzYdfXmJGYnUdPyBtti8FyWT/1duxip0xZ+Jdbm5BWJ8thayTrVTDNSZDEsos0oid4Po=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1784417506; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=oMGvRNkuFyXaMYeP4ES+8jelR30jNKVF+YZjl8fjH+c=; 
	b=TbfNsxKSpnNYMGfhpBfgeOqw7FcUXw62jOTFe/BZYXXiMdcvqp/HSlMIdMOl5yIckY69c1dXk/LiybPChgxtXLdAq1xBTCkMgk/6tl04QI4BAkfjCBzzzYFU19EdGkKMSmT2ntdnN5RLD/+SXe1m0S0yIFKIs8rNYhXmMYqxCFc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.reichel@collabora.com;
	dmarc=pass header.from=<sebastian.reichel@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1784417506;
	s=zohomail; d=collabora.com; i=sebastian.reichel@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=oMGvRNkuFyXaMYeP4ES+8jelR30jNKVF+YZjl8fjH+c=;
	b=aW8DOYx18xezxX/CNds+Jm5xao3XhXf0fOSTgrsWOjnRFZPS9yPLGz0G2STbaGGV
	SwdjbNK3dU0INwq+tHVxn5ZaaSIW9JhWVo246avHA7kdjEjND5cuOxR/hRhIMpnN3Me
	ZDffuyEhqnXqJEj8O/dh84qj58eb5Q9pYTHIoDUo=
Received: by mx.zohomail.com with SMTPS id 1784417504416910.5266533899085;
	Sat, 18 Jul 2026 16:31:44 -0700 (PDT)
Received: by venus (Postfix, from userid 1000)
	id 2C8CE1804CF; Sun, 19 Jul 2026 01:31:39 +0200 (CEST)
Date: Sun, 19 Jul 2026 01:31:39 +0200
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Igor Paunovic <royalnet026@gmail.com>
Cc: Dmitry Osipenko <dmitry.osipenko@collabora.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, kernel@collabora.com, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 4/4] arm64: dts: rockchip: enable HDMI RX audio
 capture on Orange Pi 5 Plus
Message-ID: <alwKdkNsMi9L4ZiY@venus>
References: <20260718085728.6797-1-royalnet026@gmail.com>
 <20260718085728.6797-5-royalnet026@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5auwkjfiihzxz3ef"
Content-Disposition: inline
In-Reply-To: <20260718085728.6797-5-royalnet026@gmail.com>
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-0.2.10.1.5.2/284.404.57
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260718_163205_153098_0C363D3B 
X-CRM114-Status: GOOD (  22.68  )
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


--5auwkjfiihzxz3ef
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 4/4] arm64: dts: rockchip: enable HDMI RX audio
 capture on Orange Pi 5 Plus
MIME-Version: 1.0

Hi,

On Sat, Jul 18, 2026 at 10:57:28AM +0200, Igor Paunovic wrote:
> Route the HDMI receiver audio to i2s7_8ch, the receive-only I2S
> interface dedicated to HDMI RX, through a simple-audio-card with the
> receiver as bitclock and frame master. Together with the audio
> capture support in the snps_hdmirx driver this exposes a capture-only
> ALSA card fed by the HDMI input.
>=20
> Tested on the Orange Pi 5 Plus with multiple HDMI sources: capture
> follows the source sample rate and stays in sync via the FIFO-level
> clock tracking in the driver.
>=20
> Signed-off-by: Igor Paunovic <royalnet026@gmail.com>
> ---
> New in v3.
>=20
>  .../dts/rockchip/rk3588-orangepi-5-plus.dts   | 20 +++++++++++++++++++
>  1 file changed, 20 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dts b/ar=
ch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dts
> index 9950d11..d5840e1 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dts
> @@ -37,6 +37,22 @@
>  		};
>  	};
> =20
> +	hdmiin-sound {
> +		compatible =3D "simple-audio-card";
> +		simple-audio-card,name =3D "rockchip,hdmiin";

The name is exposed to userspace and visible to the user (e.g.
in alsamixer), but also used by Alsa UCM2. I suggest to use
"RK3588 HDMI-IN".

> +		simple-audio-card,format =3D "i2s";
> +		simple-audio-card,bitclock-master =3D <&hdmiin_codec>;
> +		simple-audio-card,frame-master =3D <&hdmiin_codec>;
> +
> +		simple-audio-card,cpu {
> +			sound-dai =3D <&i2s7_8ch>;
> +		};
> +
> +		hdmiin_codec: simple-audio-card,codec {
> +			sound-dai =3D <&hdmi_receiver 0>;
> +		};
> +	};
> +

Move the whole card definition to rk3588-extra.dtsi with a new label
(e.g. hdmi_receiver_sound) and add status =3D "disabled"; Then just do

&hdmi_receiver_sound {
    status =3D "okay";
};

in the Orange Pi 5+ DT, i.e. just like the soundcards for HDMI
output. This reduces a lot of duplication as the soundcard is the
same on all boards considering there is a dedicated I2S channel for
it. It's disabled by default as some boards do not route the HDMI
receiver at all.

Greetings,

-- Sebastian

>  	ir-receiver {
>  		compatible =3D "gpio-ir-receiver";
>  		gpios =3D <&gpio4 RK_PB3 GPIO_ACTIVE_LOW>;
> @@ -247,6 +263,10 @@
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

--5auwkjfiihzxz3ef
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmpcDNYACgkQ2O7X88g7
+przAxAAmp27ahike5cooDDpLsXCvhfzlAUohPcO39nvyh7GFLDhdFywIckmqKXe
UQnJTwlqRZ2YQank3VipcBojKahUe+fvYFM5RSo1A7qc4eGHryFmNxBwGGh14qCm
A+3dpyh7baCzsOPI/2rYib6Uncb/G6cQ/udYhE6le1dll3XnGTNq2iuBnFzxZd0U
p1Wg8F/XLnrytXM6+1QAh5XoGPkjGUNjDqyrM+P+rvS46DR2UE2+bGvl8ggROL+e
1ClG2mLugtFeV2VPpsdexirwUgqv0y4tRTv9Dw+XwzvweBE7EVz4mvZOVTphcHjL
LjrTcKzLw2ZEUslgwXuyuVYNIUjs7Q1MgWDivPS8BFFI3YVruhHiAu0f6/sJUokL
8mTNpE2b0N6VV+s85/W20LsHHAzdnJE+lERY1Zxw1ZT9ii+XXIn+N1VB0xBIGzMc
7epiBSwb3N5Z7d+XwQtHCsma42JsGXFCBpgbIswphhoq0rLndqiT4dTUdn0yfL1h
Y5Gm4dBH4h+yKioxzIrm3NZ6drbX3Eyd9TY7v0thdycAIGtuXtmLTnP9Fha98lb3
jLXxlCBDtZ0kIV964HslAqBjOaV7Q1QSMRJ11+sy64p3GV6YMt0AevWRWua5w0fT
qvGboGN2P6KsR85rLJ5ryFeEilUivC2nu3F/eId0Wpu+fUuCHEQ=
=1b/t
-----END PGP SIGNATURE-----

--5auwkjfiihzxz3ef--

