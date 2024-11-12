Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AFEDD41D66
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Nov 2024 08:01:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jbCEbJtigEzrfzyGdDfeYhf12Y+BqR/lK0AjwtgVJuM=; b=VsB0E5CI5bzexE64MGA4M09DV8
	rw0anSccwZBYAdbWI+IwJ2Oh59Gx8H1EPCCD9LKd6BU8Sh2jmoWhxhPUlLLQQJE0sjNpER4Nwpf7G
	lLFcimzl7nA+D9rf91qfOAiT61SiM7uS9qvMOdFiu123cEGeKrYam4zOpvVYvFjkbD7O6mKP+DMDg
	SvCOZgy4jEZhl1mJjuDqg2//2aBYPnUo78wGEQ2rBaorfbY0l7egAiUZ/KTt/i5ZKIOEI2WGaVs0X
	AaKfFnsX5gHV5xUZ8cnljNZ6RPJeHWYUahzo2qgaHvopIi1E5Z5uJyTSGpL1maDuyTVNM7cseZp/n
	LUeKPghw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAlnY-00000002Yjg-0SxW;
	Tue, 12 Nov 2024 07:58:52 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAlk8-00000002Y3S-0QVV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Nov 2024 07:55:22 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mkl@pengutronix.de>)
	id 1tAljt-000840-0J; Tue, 12 Nov 2024 08:55:05 +0100
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b] helo=bjornoya.blackshift.org)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mkl@pengutronix.de>)
	id 1tAljp-000NFm-0Y;
	Tue, 12 Nov 2024 08:55:01 +0100
Received: from pengutronix.de (pd9e59fec.dip0.t-ipconnect.de [217.229.159.236])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: mkl-all@blackshift.org)
	by smtp.blackshift.org (Postfix) with ESMTPSA id A90A23712AA;
	Tue, 12 Nov 2024 07:55:00 +0000 (UTC)
Date: Tue, 12 Nov 2024 08:55:00 +0100
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Rosen Penev <rosenp@gmail.com>
Cc: netdev@vger.kernel.org, Vincent Mailhol <mailhol.vincent@wanadoo.fr>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Vladimir Oltean <olteanv@gmail.com>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Pantelis Antoniou <pantelis.antoniou@gmail.com>, Marcin Wojtas <marcin.s.wojtas@gmail.com>, 
	Byungho An <bh74.an@samsung.com>, Kevin Brace <kevinbrace@bracecomputerlab.com>, 
	Francois Romieu <romieu@fr.zoreil.com>, Michal Simek <michal.simek@amd.com>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	Zhao Qiang <qiang.zhao@nxp.com>, "open list:CAN NETWORK DRIVERS" <linux-can@vger.kernel.org>, 
	open list <linux-kernel@vger.kernel.org>, 
	"moderated list:ARM/Allwinner sunXi SoC support" <linux-arm-kernel@lists.infradead.org>, 
	"open list:ARM/Allwinner sunXi SoC support" <linux-sunxi@lists.linux.dev>, 
	"open list:FREESCALE SOC FS_ENET DRIVER" <linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCHv2 net-next] net: use pdev instead of OF funcs
Message-ID: <20241112-lush-beneficial-chicken-9a31f5-mkl@pengutronix.de>
References: <20241111210316.15357-1-rosenp@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wiafd67i2wzywtxu"
Content-Disposition: inline
In-Reply-To: <20241111210316.15357-1-rosenp@gmail.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_235520_165683_28D898E8 
X-CRM114-Status: GOOD (  15.38  )
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


--wiafd67i2wzywtxu
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCHv2 net-next] net: use pdev instead of OF funcs
MIME-Version: 1.0

On 11.11.2024 13:03:16, Rosen Penev wrote:
> np here is the node coming from platform_device. No children are used.
>=20
> I changed irq_of_parse_and_map to platform_get_irq to pass it directly.
>=20
> I changed of_address_to_resource to platform_get_resource for the same
> reason.
>=20
> It ends up being the same.

You should describe in an imperative way your changes. Something like:

Modernize IRQ resource acquisition.

Replace irq_of_parse_and_map() by platform_get_irq()

=2E..and list the other changes, too.

> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  v2: fixed compilation errors. Also removed non devm transformations.
>  Those will be handled separately. Also reworded description.
>  drivers/net/can/grcan.c                          |  2 +-
>  drivers/net/can/mscan/mpc5xxx_can.c              |  2 +-

Reviewed by: Marc Kleine-Budde <mkl@pengutronix.de> # for CAN

regards,
Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--wiafd67i2wzywtxu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEUEC6huC2BN0pvD5fKDiiPnotvG8FAmczCdEACgkQKDiiPnot
vG9P5Qf9GHBDogv141w23Ql4QYhPyQNOFBbAjfAmSaXZJQjwjI2/PT9uMOtwx1N3
xkyyFSufM0a+sr9Mn7vC+liJrlzO9Xmqq+53eTAvq2e2RPKAdVT/aPa21s05sWUI
u1r/6bgaTgg9stZMDtivo6HAYr69FexPGYKdk9bAcm4gANpW/Ih+NpLB4IwzqKv6
EHXEtt4AfiBCLNkq4BUwBO4D1CHsDbICmSZbC2RRZ5Jc85R9u+YYqwj7RN3EbDfL
fWarhFuRuoGubmHPg8gaauKa5/Cxjo9fsjn93QTzRbgEgLJEsii3Y85oI0LaN0U8
e9/zBSWu8p/gXjqOGAwOOYQ1WVxswA==
=3yO+
-----END PGP SIGNATURE-----

--wiafd67i2wzywtxu--

