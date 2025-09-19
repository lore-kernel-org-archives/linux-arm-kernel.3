Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3651CAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Sep 2025 19:18:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gy1Cwe3kFc9tkmIbIueoSIP6N6yz1yqU63v26XrbplQ=; b=ys1QRiCckCfd8T+1K3wDY5aiZT
	ex+You7X/qF/CisIwh39xeFS77QHbN8PbQU9ln2uVNkK/Ux+MF6p03/W2OTZRD9vWJafeHc281AFh
	vXGW/wq5mu1WC2f8Mg9PaSAKh3ZdJUsNZ2B/Hr+1W8fWUvMkSACFgQVCBqf7e9fOyFS+rJhkSFcRp
	i02LQ57xe6Od/aUQLHZfoPvwZW15BbC0VRyM5S2u4JCWDfYR1qkadfg8QkfqdjAsM2wGxBKXy4QBa
	mCAEW98SQ9X7bonyC6Ym7RD8o0PgpsLJzn/JlYAdE6GGeTkeUzymVmqdRByLluBqLG/mex2v8wb3T
	Jt8oZPJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzgd2-00000003tO2-0cMA;
	Fri, 19 Sep 2025 19:18:44 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzgd0-00000003tNO-1Z7p
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Sep 2025 19:18:43 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mkl@pengutronix.de>)
	id 1uzgcr-0004Qj-VG; Fri, 19 Sep 2025 21:18:33 +0200
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b] helo=bjornoya.blackshift.org)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mkl@pengutronix.de>)
	id 1uzgcq-0029eE-2e;
	Fri, 19 Sep 2025 21:18:32 +0200
Received: from pengutronix.de (ip-185-104-138-125.ptr.icomera.net [185.104.138.125])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: mkl-all@blackshift.org)
	by smtp.blackshift.org (Postfix) with ESMTPSA id B75A847520E;
	Fri, 19 Sep 2025 19:18:29 +0000 (UTC)
Date: Fri, 19 Sep 2025 21:18:21 +0200
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Peng Fan <peng.fan@nxp.com>
Cc: Vincent Mailhol <mailhol.vincent@wanadoo.fr>, 
	Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Aswath Govindraju <a-govindraju@ti.com>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Frank Li <frank.li@nxp.com>, 
	Haibo Chen <haibo.chen@nxp.com>, linux-can@vger.kernel.org, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v6 5/9] phy: phy-can-transceiver: Propagate return value
 of gpiod_set_value_cansleep
Message-ID: <20250919-lovely-amethyst-bullmastiff-5cef8b-mkl@pengutronix.de>
References: <20250909-can-v6-0-1cc30715224c@nxp.com>
 <20250909-can-v6-5-1cc30715224c@nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="t6u4zda4cx5kdnck"
Content-Disposition: inline
In-Reply-To: <20250909-can-v6-5-1cc30715224c@nxp.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250919_121842_414750_DAF113F6 
X-CRM114-Status: GOOD (  13.39  )
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


--t6u4zda4cx5kdnck
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v6 5/9] phy: phy-can-transceiver: Propagate return value
 of gpiod_set_value_cansleep
MIME-Version: 1.0

On 09.09.2025 13:40:15, Peng Fan wrote:
> gpiod_set_value_cansleep might return failure, propagate the return value
> of gpiod_set_value_cansleep to parent.

Are there any expectations of the phy framework from the driver if the
switch on or off fails? Do you have to roll back any changes in case of
an error?

Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--t6u4zda4cx5kdnck
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEn/sM2K9nqF/8FWzzDHRl3/mQkZwFAmjNrHoACgkQDHRl3/mQ
kZwqYQf/c1/IXd7aRBuqdaMALPyXhUQLb5zDa8xv15HZudLAlb4N3ZCTwnOa8WuR
6C1PiBoxg6JPbbcgfCADKc3ADq/+nxjr8fk1rU3bPf/9t3p+BNJFfX8jiwL7B42w
X/Yt9MEtmxWaOBWeNXedyM4pFB2qT+GJncKrl6lBIjyjIRkhABKaiNyt/M/DFenK
rA+xEFrZVljI5iLMktjI92K1FlNaRiaEyOvCSYrM33pHz8RQWPECEF0T4D9z9siI
XPy/dP9YRUkUszZ1kp+vh//bd2I8Z1R7fwNBWZf+ZwLMISDDx/lt06ohQQwTcLgs
fHVzHn541sJjrfMO6kikrs8r0W3FQg==
=qpEC
-----END PGP SIGNATURE-----

--t6u4zda4cx5kdnck--

