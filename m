Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B417CC3ABC0
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 11:31:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+myiwgE5IaBaXJzmpEL8CqSZA8uzkotePvS5m/azOWI=; b=gdisRGW/Rr9ed5wDubrOzeZlwY
	7spPyayO0DFcni5W5hb8qQt0+ZLKOEwBPrp0/dpDl8vbRxwAqHgbJBBgbmC1BGGdrcEn3tWba36kU
	AjEeraA7FVNjvEmDjkTFTNmVs1KjnDehrXg3i0SYo/CZIE3487MFTsPRkq7ArpNpiKQAxOqVSpEev
	Jlz3DyJ0vbbGrkC2ye5xN+F25kR1aS+T9WJhNeg6Vs/ueJgMfOhx1Vay0cyayXKjruEHCsrly8Gna
	+O3d5eCT2ts0yzD/McGSXKBIuNukJXn8B1uw0bJfivPg9a2PzcuIiazHvB3sIxarc2KRv9JluLdAU
	O72zVCaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCczx-0000000FEls-3yA8;
	Wed, 07 May 2025 11:31:37 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCcwZ-0000000FE8H-27oa
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 May 2025 11:28:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D8155629D4;
	Wed,  7 May 2025 11:28:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16050C4CEE7;
	Wed,  7 May 2025 11:28:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746617286;
	bh=+myiwgE5IaBaXJzmpEL8CqSZA8uzkotePvS5m/azOWI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=H9g7Uo3KF3gdhcH2ZEMV9V3wNqXA8tWVr4h+XSChpAk8ADpc3AiALZ4luZs+qiP11
	 Z/MMgQA+W8firplqY6wsfvaRlyKDnu2GwFBPbbSs260wPnfiIZNYS/X+7RgVASh77m
	 RpC/hLSnA/nsP75LVgIyB2iQqMj3uUQrguNMZM870ct6AHpi0KrvjkwwfISkMW7V3a
	 YOPAoo049AzlkO+K5zbADyxXnj6XpUO50IDuoOngkJTqfSy9VuxxdFuvsHaky5egwP
	 KzvfbiAMDQAUjIzdffkOIksa2UyWdR9eJyQ0Y56Uy3z2fvqMFG3OeJNxR8UwUZLFBh
	 Co6k62Ve2SILg==
Date: Wed, 7 May 2025 20:28:03 +0900
From: Mark Brown <broonie@kernel.org>
To: Herve Codina <herve.codina@bootlin.com>
Cc: Andrew Lunn <andrew@lunn.ch>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Peter Rosin <peda@axentia.se>,
	Derek Kiernan <derek.kiernan@amd.com>,
	Dragan Cvetic <dragan.cvetic@amd.com>,
	Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Bjorn Helgaas <bhelgaas@google.com>, Len Brown <lenb@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Wolfram Sang <wsa@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-spi@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	Allan Nielsen <allan.nielsen@microchip.com>,
	Horatiu Vultur <horatiu.vultur@microchip.com>,
	Steen Hegelund <steen.hegelund@microchip.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v2 01/26] Revert "treewide: Fix probing of devices in DT
 overlays"
Message-ID: <aBtDw-qXUCH9U-7l@finisterre.sirena.org.uk>
References: <20250507071315.394857-1-herve.codina@bootlin.com>
 <20250507071315.394857-2-herve.codina@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="oe+RepqPNVL4+bmX"
Content-Disposition: inline
In-Reply-To: <20250507071315.394857-2-herve.codina@bootlin.com>
X-Cookie: Well begun is half done.
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


--oe+RepqPNVL4+bmX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 07, 2025 at 09:12:43AM +0200, Herve Codina wrote:
> From: Saravana Kannan <saravanak@google.com>
>=20
> This reverts commit 1a50d9403fb90cbe4dea0ec9fd0351d2ecbd8924.

> While the commit fixed fw_devlink overlay handling for one case, it
> broke it for another case. So revert it and redo the fix in a separate
> patch.

Acked-by: Mark Brown <broonie@kernel.org>

Please include human readable descriptions of things like commits and
issues being discussed in e-mail in your mails, this makes them much
easier for humans to read especially when they have no internet access.
I do frequently catch up on my mail on flights or while otherwise
travelling so this is even more pressing for me than just being about
making things a bit easier to read.

--oe+RepqPNVL4+bmX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmgbQ8MACgkQJNaLcl1U
h9A3/wf8D6c+36MLT2mhvh2zxesAYWfdL1e5vpcKQk0H/bkk+8KQLEBRl9w9syn2
MFtk87xXOIdfli0pvEnP2cUrCHKDrD2ehLcNFcur8Vq6IOjjX2Gs3Iboe5CfqnoS
tPRSxFS31DY3g7DhUGmQ7fUUlPYGwpYIK1QgXrfiR+uhEbooIq6yN1/hcKL2rFS4
Y21v0te/hUxHTpeTMlcOkXqqu/1UExRszOly4m0YB9mZoswASG024vcrx4paZFjF
sJ6hXYEyI/PDpMSVthVLe0jK7jyBsiVGSSVDRcimNQj6nAokmye1VeKejWhV3Flv
7epg7YG5YuZjEXoQ3CaQaDdESm7PnA==
=5SSZ
-----END PGP SIGNATURE-----

--oe+RepqPNVL4+bmX--

