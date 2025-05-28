Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6ED1C5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 May 2025 12:33:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KuB6YiXUH5Cy1JleX5O5eP/e5BT3QeJ1hhc0fVYSO70=; b=BW/AcoWez90VkN9mr5B6E/rntg
	PIeq5SiJoamM29/koYff4btnL/bWyS/4gHPJHD2IB2PVfXVBQZr+4E06sNcuH2ZVh3P0rii2BfZa4
	0m0+mkqNv0Uyg02B2MtgbpcDMm/ylx8NI8lLMFQJDJ3bnDWMNXJcwiYuuCmMmkUpijwGsYAUzqATw
	/g92FUxieOGCnckkfBTEflBMaXpXfc6zadGIG1F6D6G3XGc8q19DhCIL7BNrKNm7rR8BK8faNIWdN
	pf9CBeb0qEN1urXVCoY0hAQXtpIa7f4+665hiabCCTaVKgovCA3c6IRG2vtEF1O8Sj/t+mzVhyrfk
	0mLvqdcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKFy7-0000000D7l7-30Ks;
	Wed, 28 May 2025 12:33:15 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKFnQ-0000000D6Se-34V3
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 28 May 2025 12:22:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=KuB6YiXUH5Cy1JleX5O5eP/e5BT3QeJ1hhc0fVYSO70=; b=YSAhahEvCmpsdErRcx3eJ1l9/U
	gYVlDN1Ik2sQ4AYNrsJCvBHyl5dJ1nJHz/8nM+u+a3OSzLd0J0lfrRKtbHmMcVoEi2X2PawmvRtoZ
	iUrS82lprQkJP4/aLaPIrwUllm6Ey2stBQnJS/Y1LbOx+hxrjIoAjty2cIMKfApkFeuU+uKpub2qs
	uskkBXubjLBmlWombEYMibLrbJ0uMefCnRLhmmP9NBqDPKWXTO0GPfsbtNYDV+n3AY6StOfIuVz/g
	bVrM2ocSEfoRAf9BrTArpgZpp7pC2Olp/puU3cvm+TptVn0o/Re//1q/mSnnAme1qVZknMExq+T4b
	g2BRfkpA==;
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKFnN-0000000DcIL-2ao2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 May 2025 12:22:11 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mkl@pengutronix.de>)
	id 1uKFn3-0002SH-Bf; Wed, 28 May 2025 14:21:49 +0200
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b] helo=bjornoya.blackshift.org)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mkl@pengutronix.de>)
	id 1uKFn2-000aSn-37;
	Wed, 28 May 2025 14:21:48 +0200
Received: from pengutronix.de (p5b1645f7.dip0.t-ipconnect.de [91.22.69.247])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: mkl-all@blackshift.org)
	by smtp.blackshift.org (Postfix) with ESMTPSA id 930EB41B601;
	Wed, 28 May 2025 12:21:48 +0000 (UTC)
Date: Wed, 28 May 2025 14:21:48 +0200
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, linux-amarula@amarulasolutions.com, 
	Sascha Hauer <s.hauer@pengutronix.de>, imx@lists.linux.dev, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, michael@amarulasolutions.com, Fabio Estevam <festevam@gmail.com>, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 4/4] ARM: dts: mxs: support i.MX28 Amarula rmm board
Message-ID: <20250528-toucanet-of-utter-conversion-2bb1c7-mkl@pengutronix.de>
References: <20250528121306.1464830-1-dario.binacchi@amarulasolutions.com>
 <20250528121306.1464830-5-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="d4u36iwafj365ic5"
Content-Disposition: inline
In-Reply-To: <20250528121306.1464830-5-dario.binacchi@amarulasolutions.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250528_132209_671950_AC19A713 
X-CRM114-Status: GOOD (  12.83  )
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


--d4u36iwafj365ic5
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 4/4] ARM: dts: mxs: support i.MX28 Amarula rmm board
MIME-Version: 1.0

On 28.05.2025 14:11:41, Dario Binacchi wrote:
> The board includes the following resources:
>  - 256 Mbytes NAND Flash
>  - 128 Mbytes DRAM DDR2
>  - CAN
>  - USB 2.0 high-speed/full-speed
>  - Ethernet MAC
>=20
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

[...]

> +	reg_3v3: regulator-3v3 {
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "3v3";
> +		regulator-min-microvolt =3D <3300000>;
> +		regulator-max-microvolt =3D <3300000>;
> +		regulator-always-on;
> +	};

[...]

> +&can0 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&can0_pins_a>;
> +	xceiver-supply =3D <&reg_3v3>;

The xceiver-supply "reg_3v3" is an always fixed regulator, that doesn't
switch a GPIO, so IMHO, you can remove it. Saves a bit of runtime mem.

> +	status =3D "okay";
> +};

regards,
Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--d4u36iwafj365ic5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEn/sM2K9nqF/8FWzzDHRl3/mQkZwFAmg2/9kACgkQDHRl3/mQ
kZyAngf+N7jzZFlLipBmBOA/ABOkh8i4xKnSDc8VZEjAK8pgExYn3GEOwfRnRwrE
EH6bJllykyHzbXfS9/xHs657upS0FW9caUJK2WrWj/8gUfJKVHYs1h0fRa5Cw3TC
6OPZRsWvOaarYXj7+EnnhyfJ79H3/00LwVBMqc3Arne0fz/iienfgPjW8OEDBHin
tibPVj8IDRdEoa7ZROykjv0xbfvCpuSXCKUqfCy8z60KH1m/a2yeWpjrgqDv4Pg0
pYMak6V2+BFkLpRvEzEQEG023ftbkb2FuizWwrFj+/B7K+D5iOefx3PFVblfWXwh
D2cgAu3iOjcjElKDelSSG2QRmdkD7A==
=LqyP
-----END PGP SIGNATURE-----

--d4u36iwafj365ic5--

