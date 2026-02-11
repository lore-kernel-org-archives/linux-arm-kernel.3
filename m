Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EBC5E9E301
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Feb 2026 12:44:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9D5cLlmObdyEp9DVRdY3eYmxn5d6UgiShDaK78WFcWc=; b=C8JGaB009oKbgTfiaaeBVBA1UZ
	y5HNVAH52n3b2ytkeypKN41uV2s6cINktMucMQ9T4p8lMwxr9nPrq5rVxv1wcwx5gJCxyeNIfnzC/
	SUFlwcyoy3Txv3rt3e/DG/SQuyvcbKM642F7KnEhT7hE6FEw+6tboyhC3zp58RSf4DCW9bHnf2Xp1
	Xpwv1r82zSG1q2pW+vjMNH0uOMdLWRHU2NIUWm2fdqsHz5vO81dBAjK0X8hxyA/FD7ES4lHyKYxSa
	u6JwsEB0TrED7HfVw3gHw/FFK/XNgm+r/4wG1e2yla8xTwdeRoDwpogSVqKnb04mxDEqfNNxdINsz
	74YoJKUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vq9ZS-00000000dpW-2RXg;
	Wed, 11 Feb 2026 12:43:54 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vq9ZO-00000000dog-44cQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Feb 2026 12:43:52 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mkl@pengutronix.de>)
	id 1vq9Yu-0001Lh-0u; Wed, 11 Feb 2026 13:43:20 +0100
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b] helo=bjornoya.blackshift.org)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mkl@pengutronix.de>)
	id 1vq9Yr-000FHh-06;
	Wed, 11 Feb 2026 13:43:18 +0100
Received: from pengutronix.de (p54b15bf8.dip0.t-ipconnect.de [84.177.91.248])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: mkl-all@blackshift.org)
	by smtp.blackshift.org (Postfix) with ESMTPSA id E5CB54E67D3;
	Wed, 11 Feb 2026 12:43:17 +0000 (UTC)
Date: Wed, 11 Feb 2026 13:43:17 +0100
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Peter Chen <peter.chen@kernel.org>, 
	Pawel Laszczak <pawell@cadence.com>, Roger Quadros <rogerq@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Magnus Damm <magnus.damm@gmail.com>, Marek Vasut <marex@denx.de>, 
	Frank Li <Frank.Li@nxp.com>, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux@ew.tq-group.com
Subject: Re: [PATCH v2 4/5] arm64: dts: freescale: add initial device tree
 for TQMa8x
Message-ID: <20260211-futuristic-venomous-poodle-3b2708-mkl@pengutronix.de>
X-AI: stop_reason: "refusal"
References: <20260211123436.1077513-1-alexander.stein@ew.tq-group.com>
 <20260211123436.1077513-5-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7t2tirsdzj62jtz2"
Content-Disposition: inline
In-Reply-To: <20260211123436.1077513-5-alexander.stein@ew.tq-group.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_044351_005905_06BDBAFE 
X-CRM114-Status: GOOD (  12.65  )
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


--7t2tirsdzj62jtz2
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 4/5] arm64: dts: freescale: add initial device tree
 for TQMa8x
MIME-Version: 1.0

On 11.02.2026 13:34:31, Alexander Stein wrote:
> +&flexcan1 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pinctrl_flexcan1>;
> +	xceiver-supply =3D <&reg_mba8x_v3v3>;
        ^^^^^^^^^^^^^^
> +	status =3D "okay";
> +};
> +
> +&flexcan2 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pinctrl_flexcan2>;
> +	xceiver-supply =3D <&reg_mba8x_v3v3>;
        ^^^^^^^^^^^^^^
> +	status =3D "okay";
> +};

Can you use the PHY binding instead, see:

| https://elixir.bootlin.com/linux/v6.18.6/source/arch/arm64/boot/dts/frees=
cale/imx8mp-tx8p-ml81-moduline-display-106.dts#L180

regards,
Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--7t2tirsdzj62jtz2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSl+MghEFFAdY3pYJLMOmT6rpmt0gUCaYx5YwAKCRDMOmT6rpmt
0uZYAP9Mh/MD1BAbuW2LulGwhNS/BuC/0SSTPHlADyPndPoH1QEA7NcziSmdiwYc
clEEmCglt6MpfnzULfQqm+Pydj7PGAM=
=amdT
-----END PGP SIGNATURE-----

--7t2tirsdzj62jtz2--

