Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFBCCE77188
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  4 Jan 2025 22:25:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=czvChNqrTnVqBrG36tMy4XATCviKEogNfCQw5FJmBGs=; b=Vspdv2b6/hfwfXOpN7u2D0JcsY
	depezu+BtmWnDiZUzuZXg+SbOdMUE3ER+hEQG0FRyv7MN9C6Ro0mf7U9yfe9rFF6Erl/ZI7TZli2m
	vsccRxvQVpUouuHMe7jzwWnmYQN9C8FCRKdgMgevDNubf4M1zBiRha3o+8mbpCW7YD/wgsclQUdjx
	bz4+Fezum2Ux8q9R+1UAGMeEFVCO6wB6pPcsnf5Wy7+E0c7GJBtN/+Ng14/bhz8m+U0YqT03+Wm4Q
	XtcKOkgY7aOjWrKH7eu6rxN9fd2TZ3VqD9o+ZGLyocHf59ev7OsGBFq1N3IwtdeXr5ETbw4ZQ5tdJ
	5g3c3qpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUCaD-0000000FirF-29Rp;
	Sat, 04 Jan 2025 22:25:25 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUCZ0-0000000FihL-3Ps9
	for linux-arm-kernel@lists.infradead.org;
	Sat, 04 Jan 2025 22:24:12 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 36F0260002;
	Sat,  4 Jan 2025 22:24:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1736029444;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=czvChNqrTnVqBrG36tMy4XATCviKEogNfCQw5FJmBGs=;
	b=dozAWfMDXRguNqllDMrxQa8OYymXUBIYiRVahigFVYfExjNGvrIpIRVnZat+EQZFoijqZD
	wnNyMFaf+ICZv/iuLiwg7GWT6KphiCRUZt3z7CRUrw8A8GeTYL1/OeShn1QRuyD2ppcDfy
	RyjDFmk9btDc3U542HVWQnCLxKsZswYuVDBB/AHGFigfl2GpPD6YPfg+xk8f6VcYvd3A4y
	AqfB/f53LSSdwIsBpU2IhgQDuK6Q/mJFEFt61eGTdka9xjrvgsVona0e9YTNhAgud+MPkV
	w2qz8QbMVx6N19cG2IkhgWXybXPiMMZCHW9dW8d+2y3uYqiFPXZM0IxCNwUF8g==
Date: Sat, 4 Jan 2025 23:23:59 +0100
From: Kory Maincent <kory.maincent@bootlin.com>
To: Oleksij Rempel <o.rempel@pengutronix.de>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>, davem@davemloft.net,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 thomas.petazzoni@bootlin.com, Andrew Lunn <andrew@lunn.ch>, Jakub Kicinski
 <kuba@kernel.org>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Russell King <linux@armlinux.org.uk>,
 linux-arm-kernel@lists.infradead.org, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Herve Codina <herve.codina@bootlin.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Heiner Kallweit
 <hkallweit1@gmail.com>, Vladimir Oltean <vladimir.oltean@nxp.com>, Marek
 =?UTF-8?B?QmVow7pu?= <kabel@kernel.org>, =?UTF-8?B?Tmljb2zDsg==?= Veronese
 <nicveronese@gmail.com>, Simon Horman <horms@kernel.org>,
 mwojtas@chromium.org, Antoine Tenart <atenart@kernel.org>
Subject: Re: [PATCH net-next RFC 0/5] net: phy: Introduce a port
 representation
Message-ID: <20250104232359.2c7a7090@kmaincent-XPS-13-7390>
In-Reply-To: <Z2hgbdeTXjqWKa14@pengutronix.de>
References: <20241220201506.2791940-1-maxime.chevallier@bootlin.com>
	<Z2g3b_t3KwMFozR8@pengutronix.de>
	<Z2hgbdeTXjqWKa14@pengutronix.de>
Organization: bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-GND-Sasl: kory.maincent@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250104_142411_258565_32CF0CCC 
X-CRM114-Status: GOOD (  11.14  )
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

On Sun, 22 Dec 2024 19:54:37 +0100
Oleksij Rempel <o.rempel@pengutronix.de> wrote:

>         transformer {
>             model =3D "ABC123"; /* Transformer model number */
>             manufacturer =3D "TransformerCo"; /* Manufacturer name */
>=20
>             pairs {
>                 pair@0 {
>                     name =3D "A"; /* Pair A */
>                     pins =3D <1 2>; /* Connector pins */
>                     phy-mapping =3D <PHY_TX0_P PHY_TX0_N>; /* PHY pin map=
ping */
>                     center-tap =3D "CT0"; /* Central tap identifier */
>                     /* if pse-positive and pse-negative are present -
> polarity is configurable */ pse-positive =3D <PSE_OUT0_0>; /* PSE-control=
led
> positive pin -> CT0 */ pse-negative =3D <PSE_OUT0_1>; /* PSE-controlled
> negative pin -> CT0 */ };
>                 pair@1 {
>                     name =3D "B"; /* Pair B */
>                     pins =3D <3 6>; /* Connector pins */
>                     phy-mapping =3D <PHY_RX0_P PHY_RX0_N>;
>                     center-tap =3D "CT1"; /* Central tap identifier */
>                     pse-positive =3D <PSE_OUT1_0>;
>                     pse-negative =3D <PSE_OUT1_1>;
>                 };
>                 pair@2 {
>                     name =3D "C"; /* Pair C */
>                     pins =3D <4 5>; /* Connector pins */
>                     phy-mapping =3D <PHY_TXRX1_P PHY_TXRX1_N>; /* PHY
> connection only */ center-tap =3D "CT2"; /* Central tap identifier */
>                     pse-positive =3D <PSE_OUT2_0>;
>                     pse-negative =3D <PSE_OUT2_1>;
>                 };
>                 pair@3 {
>                     name =3D "D"; /* Pair D */
>                     pins =3D <7 8>; /* Connector pins */
>                     phy-mapping =3D <PHY_TXRX2_P PHY_TXRX2_N>; /* PHY
> connection only */ center-tap =3D "CT3"; /* Central tap identifier */
>                     pse-positive =3D <PSE_OUT3_0>;
>                     pse-negative =3D <PSE_OUT3_1>;
>                 };
>             };
>         };
>=20
>         pse =3D <&pse1>; /* Reference to the attached PSE controller */

The PSE pairset and polarity are already described in the PSE bindings.
https://elixir.bootlin.com/linux/v6.12.6/source/Documentation/devicetree/bi=
ndings/net/pse-pd/pse-controller.yaml

I am not sure it is a good idea to have PSE information at two different pl=
aces.

>         leds {
>             ethernet-leds {
>                 link =3D <&eth_led0>; /* Link status LED */
>                 activity =3D <&eth_led1>; /* Activity LED */
>                 speed =3D <&eth_led2>; /* Speed indication LED */
>             };
>=20
>             poe-leds {
>                 power =3D <&poe_led0>; /* PoE power status LED */
>                 fault =3D <&poe_led1>; /* PoE fault indication LED */
>                 budget =3D <&poe_led2>; /* PoE budget usage LED */
>             };
>         };

Maybe the PoE leds should also land in our pse-pis binding.

> In case of PoDL, we will have something like this:
>=20
> pair@0 {
>     name =3D "A"; /* Single pair for 10BaseT1L */
>     pins =3D <1 2>; /* Connector pins */
>     phy-mapping =3D <PHY_TXRX0_P PHY_TXRX0_N>; /* PHY pin mapping */
>     podl-mapping =3D <PODL_OUT0_P PODL_OUT0_N>; /* PoDL mapping: Positive=
 and
> negative outputs */ };

We should do the same for PoDL. Put all information in the same place, the =
PSE
bindings.

Regards,
--=20
K=C3=B6ry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

