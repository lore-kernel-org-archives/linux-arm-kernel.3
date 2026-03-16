Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDC7FF53D7F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Mar 2026 17:47:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dnDuwXGZ1btx0I9ScP/HNHG9vbVZo5zMOWlpux0W4WY=; b=DAh22We8xYPAazj9RK0Y/7jJ+Y
	ALX7wdLPNng6uFLlzMh6NBePAii5dYvxpJaNawrDN7GNdWwvZo15tSo2xaGl77kOWV2rRqcLxM2Qb
	bye7ydMm04t7zGdmnK2XguVrhLDFJ6pjpP/BuZ0TlYdBnq6Xmxg9so0r/dmOoZBsB5CH8Eed0mTbp
	IkDtKB7piFip7RCFyidw57ke6ZJXUqjERpJYddjTv9stuFAqah9a2zEEk4jMCH6aMshbwmF71zFH9
	1NcnvsSBAZp/XNy54830hLaFcCe0yEXp4NE/3APJk7auCV14VXpuR2zbOFI/mzOeD6BOmk9LEm6uU
	xQqhIv6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2C2B-00000004bnU-1qiv;
	Mon, 16 Mar 2026 17:47:19 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2C29-00000004bnE-2mFt;
	Mon, 16 Mar 2026 17:47:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E6CD96012B;
	Mon, 16 Mar 2026 17:47:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69BFCC19421;
	Mon, 16 Mar 2026 17:47:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773683236;
	bh=dnDuwXGZ1btx0I9ScP/HNHG9vbVZo5zMOWlpux0W4WY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sRBXa2ovvjPnWmoWwcUZlUb/RfNIKCBxJYUgGqWYE+olH5e/05xmKOMn3PMn3Bxq8
	 Sm0RPOKtJgrFA4Nkna/SfM63GmGOjUcqhNOYPE5XT8hDbTrlYcVkWZ5EzY+jprOrRV
	 l4Viqa7XAxFuU+rATnPUZYB48xFh6rMSI83W27iHNJjWLHREjypaENdzy/QzPBAdK3
	 qOABTEsGsrgj3ajoNm0Gg6WLlNHu9IvYa+UNT73TeY7utnqPEN+vZG0sDR9BaOi8QA
	 0XJU1kq/TxMTtEfK9n13gvkI74v1W4TiIWlCMY0nyY+YEx6zNL3h/lJ3umTM3hkX5Y
	 cEen2C1izEUvA==
Date: Mon, 16 Mar 2026 17:47:06 +0000
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
Subject: Re: [PATCH 04/15] dt-bindings: regulator: act8x: Use generic
 power-controller schema
Message-ID: <fd6b7103-2a72-4cae-8e92-44ee9586a953@sirena.org.uk>
References: <20260316-power-controller-v1-0-92c80e5e1744@nxp.com>
 <20260316-power-controller-v1-4-92c80e5e1744@nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xItI8zXtmIATo4FR"
Content-Disposition: inline
In-Reply-To: <20260316-power-controller-v1-4-92c80e5e1744@nxp.com>
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


--xItI8zXtmIATo4FR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 16, 2026 at 10:47:39PM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
>=20
> Convert the binding to use the generic power-controller schema instead by
> referencing power-controller.yaml and removing the local
> `system-power-controller` property definition.

Acked-by: Mark Brown <broonie@kernel.org>

--xItI8zXtmIATo4FR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmm4QhoACgkQJNaLcl1U
h9ACOQf+JqpHS2vvWDBGmTprNgfkrZ9Q44lgSNbWZMnktfJE13q21QKHK5kSnDrO
X40ZRgtewonmiGVIcifBtNjgoqkmY98pJvPnhgJjgP3fmBlFL/WCxYwUjF/JQCkg
LrlVyB6IdKDWWAmUUVULvowVdo1TyiYZ2dlrvVwjGuMZJDgRFAz85fobiqkW9hIb
5Z6Wdof4lcERkIE0dsbXctCTU4GJTupsC6duor8XTKC+wIL9sx02un+kINcyGwnP
FwEkgvpfw9H/r9/jBuxTEQh7QcJPvlx36Ub2mFuBlF3OCJApRlm+j+vz9btoTkX4
XZN3mowbqzv9xO9cSelYbJCV/FMs2Q==
=SWwQ
-----END PGP SIGNATURE-----

--xItI8zXtmIATo4FR--

