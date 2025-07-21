Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C72B1C83F25
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Jul 2025 17:54:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2fSI3cIv2IV1ql9qpP8K0ica/85tfrwCtH1iIhOev/8=; b=U/kfxwJcCnon76/H5bc2rMsgTI
	hTOzVvBYa4LxOxqdXb0W576wZ9qxV7EJ8SXrAvv/IxBK73S7iXLCF6fCmla77bXT/anIRSGq4lKj4
	h4JMctDYtNxPJv7K91w5S4xTrj4ljSlM9aluffAlfzc8OZSxXBejORxxKqzZx1hBg2Hlhrk5Lmx/M
	vsSRSJ0/am4TbOSXKBGetHwC/6AnZbXJdzdmVj7pqwrLOf6DUpXw07UnP0qT31XACe2a8wONiK8rn
	xnHYlm+R+80GwJDMLapv/v2pBu1nonuSRq343X2M+kesa2dywoE8ZI2478cYBCGB17FzfWxiwstWR
	0IvGehhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uduiK-00000000Myz-3GzR;
	Mon, 21 Jul 2025 17:54:12 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uduPY-00000000KVq-09OQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Jul 2025 17:34:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6A6BE5C6238;
	Mon, 21 Jul 2025 17:34:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2A63C4CEF4;
	Mon, 21 Jul 2025 17:34:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753119287;
	bh=V/CfjxoEsKYCsa9Ewp5zLHqhCdlau2qmxdYvbksj8K0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=M7diNgsZycI8nmdD1vqsLiLyvQW4lt3MSDPn42taIptUhJV3ffM3zqJMHttjZt3+u
	 nf/A/8luOCJRRFowuIDDdn4zdPBS4hZCv7Dg36XjWDsep4ZWov6Bb0mfT6rRrAO2p1
	 ThFPJkv20FUbw64XzqcdkXHnqHS5TxSD5Mhf+jWb88c4EqzT5eoeyCYQKn20KvcdjK
	 uMJjuz95HD3IgiWDH/iJwmir+eEq8QOnIk0ipej8m2x9s58y6wZ75f4sM0HshkuRuz
	 P4DzghlEEyXQXYqBOFFB3oGozWRnXFKZg7DKgBG69At9457gttbA237nC9+z8yjgHk
	 MeAaOKAPZ9JxQ==
Date: Mon, 21 Jul 2025 18:34:40 +0100
From: Mark Brown <broonie@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-spi@vger.kernel.org, Heiko Schocher <hs@denx.de>,
	linux-kernel@vger.kernel.org,
	Andrei Lalaev <andrey.lalaev@gmail.com>,
	Chanh Nguyen <chanh@os.amperecomputing.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Grant Peltier <grantpeltier93@gmail.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Michal Simek <michal.simek@amd.com>,
	Naresh Solanki <naresh.solanki@9elements.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: (subset) [PATCH v1 0/3] spidev: introduce trivial abb sensor
 device
Message-ID: <2a99b64a-b6d4-46de-acb1-8a9328b7d5f6@sirena.org.uk>
References: <20250719063355.73111-1-hs@denx.de>
 <175311337130.327079.7374455187420344577.b4-ty@kernel.org>
 <d677ecd9-42d6-43fe-8fe1-a5afd4d270e2@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="WCNX58Rd1dpGFNKG"
Content-Disposition: inline
In-Reply-To: <d677ecd9-42d6-43fe-8fe1-a5afd4d270e2@kernel.org>
X-Cookie: Microwaves frizz your heir.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_103448_112999_27CE6138 
X-CRM114-Status: GOOD (  11.15  )
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


--WCNX58Rd1dpGFNKG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jul 21, 2025 at 06:24:55PM +0200, Krzysztof Kozlowski wrote:
> On 21/07/2025 17:56, Mark Brown wrote:

> > [1/3] dt-bindings: trivial-devices: Document ABB sensors
> >       commit: aad2f87cbcab56b322109d26d7b11842a09df91f
> > [2/3] spi: spidev: Add an entry for the ABB spi sensors
> >       commit: d60f7cab7c04944a79af16caa43c141e780a59c6

> That's unexpected, Mark. Patches received two objections/comments and I
> don't think discussion was resolved.

Oh, sorry - I'd missed those (possibly due to only being CCed on part of
the series).  I guess I'll drop this then.

--WCNX58Rd1dpGFNKG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmh+ei8ACgkQJNaLcl1U
h9Ce3wf7Bhl+JzqbBICKswFFhvnGdkCuL1QR2PvMdJB/QjSKKq/6JpkPEt53OxqO
tBQJYCf6QNpcc+HJqlVumz4r4cwpyp8SXuwmwaxihthqVYRcCyiLA1d/RHFIJ9n9
CyAl/gGjzncNxEIe3trDjSvAzTjGadbAaqmLN54jvS0KPnWfK2S9lzr7r9mkRfqr
m6iikZoind5xRzssX5XFuiCmMxI3wY9StJ4LocjQB2GPD/aWOtNnIQFBUFiaAE4u
376S1CX9/m5tthTqMtLfHRICcz4nAFULDsfYmBPq638I5ZguqDiXhz0JoioTP+ka
SiTSXqIh1a/YSdVXjWkgt6fEzQV0Hw==
=Xbls
-----END PGP SIGNATURE-----

--WCNX58Rd1dpGFNKG--

