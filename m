Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3A34F53D7F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Mar 2026 17:46:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wEHPyMu42lihqvWHgqVVNGPuEB9VrdUuNbdTcZKzmLY=; b=HE96jgXMbouviarmgcFIhYfHkN
	QwGRTep/zntW+7gim/lbKaiL+YttX30MmV8l6/qelo57twDft83BndsqDzZeop2BLe+O3bNTnBtXA
	Sdws5FviCnazILl4m8CDMBmydA6WLqWBX9WLSwx1Y2dRC0ee5J3cN8pmYxi2HXnbw/p03c0eV98Q7
	wH8vXJ0bfxdvy80dRoKe0+ipWAEAPUWJ5U9FEqbH5YD9xxfnCP1EZVcuHOxlzc9t7smulXMXh5I7q
	gRlB4+cShzbdgZn2arpnqgfka33VFCaWBCFyZICFtNC4xb71WAU9VXJA1gUxpGmWNz73Fj7vUzgka
	lyQk4iOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2C1Y-00000004bh2-0UDf;
	Mon, 16 Mar 2026 17:46:40 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2C1V-00000004bgi-2RDK;
	Mon, 16 Mar 2026 17:46:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 975596013E;
	Mon, 16 Mar 2026 17:46:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B24EC19425;
	Mon, 16 Mar 2026 17:46:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773683196;
	bh=wEHPyMu42lihqvWHgqVVNGPuEB9VrdUuNbdTcZKzmLY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hSJlQ6BrcpxYUk7JBEtBF9Qqe5d4jddMRs/BIYPXhpPeq2zSkrT1d7BDArBZojKWW
	 BKLlbp5f1keg+9VNpIOWgkIBIijWzUmue4HADCbTjzJnOVuwSErUxWlrchbV7aek/k
	 YL4Fz+hGFQ0alKzrJMsisaNWzjtXgr4Qjs4zOx0v4MuWkjCh4+uKgjvpAtIutxB2fm
	 V/l3yUflC1bUWuKJqOQf43X3PX/imfc5TIias6ybZRLFFbMRWwZztH+NfDeWxMC/EL
	 lfDdbpOMY/QxVqRDnnN9xRBiwYaM6qcWptv2b3NZoVJPWL8tv+1soDKh3FtqZiSf1Y
	 tDcGiBYLJGuaQ==
Date: Mon, 16 Mar 2026 17:46:26 +0000
From: Mark Brown <broonie@kernel.org>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Saenz Julienne <nsaenz@kernel.org>, Lee Jones <lee@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Shree Ramamoorthy <s-ramamoorthy@ti.com>,
	Jerome Neanne <jerome.neanne@baylibre.com>,
	Paul Cercueil <paul@crapouillou.net>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Dmitry Osipenko <digetx@gmail.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Joseph Chen <chenjh@rock-chips.com>,
	Chris Zhong <zyw@rock-chips.com>,
	Zhang Qing <zhangqing@rock-chips.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Andreas Kemnade <andreas@kemnade.info>,
	Jonathan =?iso-8859-1?Q?Neusch=E4fer?= <j.neuschaefer@gmx.net>,
	Lubomir Rintel <lkundrak@v3.sk>, Julien Panis <jpanis@baylibre.com>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	Alexander Kurz <akurz@blala.de>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH 03/15] dt-bindings: regulator: ti,tps65219: Use generic
 power-controller schema
Message-ID: <f0d6b252-370a-405c-b2b5-e02b8bc59bca@sirena.org.uk>
References: <20260316-power-controller-v1-0-92c80e5e1744@nxp.com>
 <20260316-power-controller-v1-3-92c80e5e1744@nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="8MjI/4wsRBNLAdgX"
Content-Disposition: inline
In-Reply-To: <20260316-power-controller-v1-3-92c80e5e1744@nxp.com>
X-Cookie: Excellent day to have a rotten day.
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


--8MjI/4wsRBNLAdgX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 16, 2026 at 10:47:38PM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
>=20
> Convert the binding to use the generic power-controller schema instead by
> referencing power-controller.yaml and removing the local
> `system-power-controller` property definition.

Acked-by: Mark Brown <broonie@kernel.org>

--8MjI/4wsRBNLAdgX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmm4QfEACgkQJNaLcl1U
h9BWOwf/RYua3madlI7scNf3qpDMzQZHgi+eqAl3g7Lq6pMKTkmLA/V4P37VJTPi
bB1VTwPRbNvxdczmeLgDust4Yi7d39Se6tX+OrgSXOhv+FMKnw621zdhZ9NLaI2Y
tsbOwANB98ZH+jnGwVRJirPiDuopbsmBHRd7JovirNpdNujPs0sss3Z/GfWVyjjZ
kZwF+6fEn7MKfHz8v0cVjdhDB/zKxJWyX6zlpSXToWVSvhiVnRmMW8tzvxax/kLa
NukR0cAOLKySPWir5+lkOD3Vr2as+vhfcBmfZOdOB1bNqGF8nWOUt6DJljvdw7Iu
wXg+QS+O0wGAQNLRmrZboAIyvnZQqA==
=igxU
-----END PGP SIGNATURE-----

--8MjI/4wsRBNLAdgX--

