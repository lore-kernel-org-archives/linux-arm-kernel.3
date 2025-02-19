Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3538C021AA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Feb 2025 22:40:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3CFR1KvYqGJu5XHi3W+uo1kT/GLaG+YUtUrdXZ244hc=; b=YvxeE3DWiz66rN33BxRbTzpeDx
	bKZ8mm7ghqqn9QeSio0dQ5j0rudeccAtHjztepoDMdJoNdsX91S1Lj1OepbpCx2Pveell4xAAa/KS
	uNJfaYEnb4+BRZVUogqmVXqwhSumYwGaMfUejJliNGNfxdL6UtoTMpyEebHZ5lf178prwB7cMiRxQ
	HdTkLoO5GYRAXb6mH+ELUM4TnVYTjyQ4gPS3OuF/5TK7gDH3BSMMZvn8aFgewGDsOGsus0Epl+Rsb
	vdV8P5RgYX7KNXzD7DQvGKpiiGvhARBKxpg/gUrRhw6sxKW3WALz62YaZwjx17cB81fdoUJObO2Hu
	JhIszYTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tksjp-0000000FUjs-44PH;
	Wed, 19 Feb 2025 22:40:18 +0000
Received: from mx.denx.de ([2a03:4000:64:cc:545d:19ff:fe05:8172])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkshm-0000000FU7I-3ERp
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Feb 2025 22:38:12 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 47E9D10382D3C;
	Wed, 19 Feb 2025 23:38:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1740004687;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3CFR1KvYqGJu5XHi3W+uo1kT/GLaG+YUtUrdXZ244hc=;
	b=cbs6+BBZgqDbJeBfk1zMSTh4bT5RYpQTKivyzc9qbOKAFLxWGjL3TWBCA9D7S4EudNO6QO
	1qK8+7uCSQIWKZsVeyTsNk1h4GWp0mi7RaTlWEuz/9zFjBT3AbKPsucqmCVq8iOYpbdWeK
	QhwSpUpOBMHGiLsLsU7mewNM8gqvkIe/ANVNoqDfSM+HyT3+WeA1K/OythlTpGSph/XPQU
	0MdJa0bsI6eXgWUAGKhfQHWSW6DZRJE2pLBedfhstcUc3kej22U0ClvICtL7w98kjvd2dK
	1uPh963Uoa5yWHVz9/02d+K3LySFYKySUs4L455EUDrna3RQImLLRhS/kVZaUA==
Date: Wed, 19 Feb 2025 23:38:02 +0100
From: Lukasz Majewski <lukma@denx.de>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, Michael
 Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Shawn
 Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam
 <festevam@gmail.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 linux-clk@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
Subject: Re: [PATCH] arm: clk: Add ETH switch clock description for vf610
 SoC
Message-ID: <20250219233802.20ec53e5@wsk>
In-Reply-To: <3cebe152-6326-454c-9da6-5cf5a64f71c9@lunn.ch>
References: <20250219114936.3546530-1-lukma@denx.de>
	<3cebe152-6326-454c-9da6-5cf5a64f71c9@lunn.ch>
Organization: denx.de
X-Mailer: Claws Mail 3.19.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/yVJIrYnQ4O8OFO2hSM.94j5";
 protocol="application/pgp-signature"; micalg=pgp-sha512
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_143810_966012_08CD6ACB 
X-CRM114-Status: GOOD (  26.02  )
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

--Sig_/yVJIrYnQ4O8OFO2hSM.94j5
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

> On Wed, Feb 19, 2025 at 12:49:36PM +0100, Lukasz Majewski wrote:
> > The NXP's vf610 soc is equipped with L2 switch IP block from More
> > Than IP (MTIP) vendor.
> >=20
> > It requires special clock (VF610_CLK_ESW) to be operational. =20
>=20
> So you have a driver for this switch? It has been talked about in the
> past, but nobody made any progress with it. Ah, it was you in 2020.

Yes, I'm going to try another time to upstream it.... :-)

> It
> will be interesting to see what you came up with in the end, pure
> switchdev or a DSA driver.

I think it would be:

1. Standalone driver, which would configure the L2 switch from the very
beginning to work (this is different from FEC on imx28/vf610 where
switch is bypassed)

2. It will use the in-switch registers to have two network interfaces
separated. As a result - it may be slower than the fec_main.c in this
use case.

3. When somebody call "bridge ..." on it - then the in-switch
separation would be disabled. This is the "normal" state of operation
for L2 switch, which would be a HW accelerator for bridging.

4. The switchdev would be used to manage it

5. This would be just a very simple driver - just bridging and startup
of the L2 switch.

After we would have a consensus (i.e. it would be pulled to mainline) -
I would proceed further.

I will try to not touch fec_main.c driver - just write standalone, new
for MoreThanIP L2 switch driver.

If somebody would like to use FEC, then he will insert the proper
module. If switch, another one can be inserted, depending o the target
use case.

>=20
> 	Andrew


Best regards,

Lukasz Majewski

--

DENX Software Engineering GmbH,      Managing Director: Erika Unter
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-59 Fax: (+49)-8142-66989-80 Email: lukma@denx.de

--Sig_/yVJIrYnQ4O8OFO2hSM.94j5
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEgAyFJ+N6uu6+XupJAR8vZIA0zr0FAme2XUoACgkQAR8vZIA0
zr0H2wf+LDKQ2icJROSHbE6zYeCAmI0xkhWHqIw6W8DD1l7o1QJMYLJEsgSp9yP/
UUWsmIh15IoamLIx3zCnhaiXns42Df+DUH7qsiAF8lLW0C11h9WAuVdJWSLNRLW7
GQAuXwPM58hOymK71Cu9Eo1eacZ7vkd3SgZLpUa+7xIPd6Pei10g2VCpFJiv3ICw
KM+lVEpZ93Orq35IGPAwAzTlhi4gGJPIsFez2+NtiW9vJ+KiodIfSb9mWw+bLqUn
u9OY2vKtfVnuX8fYkd+ERBljmSeyR0fzU2ZB1+CbElSwI61y09f+CFBoSNwK4DhA
Zoudj/6ZH6oCoKT6MoAO1nxGaCV49g==
=xb9S
-----END PGP SIGNATURE-----

--Sig_/yVJIrYnQ4O8OFO2hSM.94j5--

