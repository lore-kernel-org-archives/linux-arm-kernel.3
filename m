Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 574BBCAC592
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Sep 2025 19:08:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mOcKglifOAvqAEKaljV+R1VfuCNhJpj8/RDZusYwW58=; b=19qt8CvIzd9Q+lHBeuzbQUT2Wa
	4NRYTkqSR8BVj5u/68P6ZJnmWoIaYLMneCdcshQSKGLr1vUnpTaaRlaqoTFFQnwokK7CVbjl6zOIc
	/YW9mAH0LXV3baglmAw2PxopwH3kGxcZJvcu0TsK/bO5Y0Mtz+G6RGg7p66bUOCMja76TiwQtB+L0
	a10mJ3Mn3Gow4Yg4lQQRqGXTkXS2Wt1KnnsWyjaAoW8U7emDFF06NODRty1kpoiWeGazpR6gSXd4L
	IwuOuEh764MmFKpsFKDdFL9hRN5vHfQWRJBCe53eUmtUhuOQJiCE83eaLC4AI3gXJpuo/luqSmEP5
	btn55x/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzgT8-00000003rom-1vsx;
	Fri, 19 Sep 2025 19:08:30 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzgT6-00000003rnv-0bzs
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Sep 2025 19:08:29 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mkl@pengutronix.de>)
	id 1uzgSv-0002ob-RX; Fri, 19 Sep 2025 21:08:17 +0200
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b] helo=bjornoya.blackshift.org)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mkl@pengutronix.de>)
	id 1uzgSs-0029dN-2q;
	Fri, 19 Sep 2025 21:08:14 +0200
Received: from pengutronix.de (ip-185-104-138-125.ptr.icomera.net [185.104.138.125])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: mkl-all@blackshift.org)
	by smtp.blackshift.org (Postfix) with ESMTPSA id 425AF4751ED;
	Fri, 19 Sep 2025 19:08:13 +0000 (UTC)
Date: Fri, 19 Sep 2025 21:08:12 +0200
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
Subject: Re: [PATCH v6 2/9] phy: phy-can-transceiver: Introduce
 can_transceiver_priv
Message-ID: <20250919-tall-speedy-parrot-8510db-mkl@pengutronix.de>
References: <20250909-can-v6-0-1cc30715224c@nxp.com>
 <20250909-can-v6-2-1cc30715224c@nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="cd3z7kopob7ivfax"
Content-Disposition: inline
In-Reply-To: <20250909-can-v6-2-1cc30715224c@nxp.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250919_120828_190397_758A2286 
X-CRM114-Status: GOOD (  16.74  )
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


--cd3z7kopob7ivfax
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v6 2/9] phy: phy-can-transceiver: Introduce
 can_transceiver_priv
MIME-Version: 1.0

On 09.09.2025 13:40:12, Peng Fan wrote:
> To prepare for dual-channel phy support, introduce can_transceiver_priv as
> a higher level encapsulation for phy and mux_state.
>=20
> No functional changes.
>=20
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/phy/phy-can-transceiver.c | 41 ++++++++++++++++++++++++++-------=
------
>  1 file changed, 27 insertions(+), 14 deletions(-)
>=20
> diff --git a/drivers/phy/phy-can-transceiver.c b/drivers/phy/phy-can-tran=
sceiver.c
> index f59caff4b3d4c267feca4220bf1547b6fad08f95..6415c6af0e8414a6cc8d15958=
a17ee749a3f28e9 100644
> --- a/drivers/phy/phy-can-transceiver.c
> +++ b/drivers/phy/phy-can-transceiver.c
> @@ -23,6 +23,11 @@ struct can_transceiver_phy {
>  	struct phy *generic_phy;
>  	struct gpio_desc *standby_gpio;
>  	struct gpio_desc *enable_gpio;
> +	struct can_transceiver_priv *priv;

Can you convert this into a flexible-array? This reduces the overhead of
a 2nd allocation.

Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--cd3z7kopob7ivfax
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEn/sM2K9nqF/8FWzzDHRl3/mQkZwFAmjNqhkACgkQDHRl3/mQ
kZwACgf/b5xzS9pWKSdkZcmVns9SIHHO1d1PGZP3mJEVq1zZWfnBMx0PSJCfosmF
Z6vfc8EMPd+XZhNRcltvC56VojbtsS8DQceTIuWGcShPDtN6gFp5N6MTUXGESNe5
F8ttf96l1LrLZoCsUW+TrBBdHNh6OWxZaOMALi7i3Y9xAqBALu1XAiVZE4VIRpcm
OPENZKma3l0f3nnG7jHqXditf4Uc8Vs0Pjon4iQAvMqOPogZvwwsfi1aV0aBaICA
EBpB5Uk48XiZnSCaOMU1KFnUF+xLqr4IBh0hI4ni/9pazDxJRxQf1790YzHZ2bkF
BnzXsTZF/syHHEADDEP2WXU4PfjefQ==
=4N72
-----END PGP SIGNATURE-----

--cd3z7kopob7ivfax--

