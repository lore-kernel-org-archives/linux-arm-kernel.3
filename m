Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40EF0CCD199
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 17:58:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bfrtaS5PBiB5jXd9gBV9Ry8BnFhCKXLoc9Z08rdeakw=; b=ISe1K9NgpB191pnBbmvbMf3/Pe
	f/Xid06r1RSI3UHpz/hinYP1c+UoFJJ74kBuC3Vj0SmPJaKm9I6+sCnUpFQagBaB1CtGOlTfPFaZw
	EQVe0r7PHMx5Kp061PZOPX6H15BBBR7T5jbSkgU5zNzPlp+jYvi+ZNPgi5FogSd53rna2gINL2OIG
	YW9sgfAkIcaNWa32NuM8sFYYEhRp6xCAMd/+4dEn9zmT1yHj1SZQAgDp4SNIav45+yi35W5iWcB85
	Ed2aNy4KuObK5SrUlQ8bzIf5ZNtsnl9eTRoZM1PGsNwTSSRjQl/y/qIesZCdjIYtbfgLj1py16Irv
	SGr65y5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAu96-0000000EYnY-3zp1;
	Mon, 20 Oct 2025 17:58:12 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAu95-0000000EYn5-1odo
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Oct 2025 17:58:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1BCAB454B4;
	Mon, 20 Oct 2025 17:58:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 000F9C113D0;
	Mon, 20 Oct 2025 17:58:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760983091;
	bh=3eybZrHiTS9wZG23hXV62FCDJFtCcIIaUJqij9JPSCA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=txdlpjK24x3VCahUT9ZDmp1hV0WioZsFGhVrgeWjDL9cx419PRG+z1aKhv4F5V0L9
	 JapR/jG2vy2nXcja7HIJQuklXNawrWVBoUolmzXHNRskdSKILmpFmLNOHEd+Btk5Pd
	 qyn6a8t3q415LXmmbB0OmJ+br+Yk6RQ1zNWN7tT8gECh7sss9pQprEy62S4/LcnEEi
	 bzGWKnucEFvyT7CGRoAUWazf3X6ltNAtyfv4e0VnzA2dTCxa2eFGSqKKQxR/kr6l2F
	 ZCkJiMMNO3p8R/OE5SRiIEDOKEE+VOtTJOVUdsPeE+y1j3RcqM8+8331BV2BKQeHCp
	 idWOt9+MTZi2g==
Date: Mon, 20 Oct 2025 18:58:02 +0100
From: Conor Dooley <conor@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: devicetree@vger.kernel.org,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Chen-Yu Tsai <wens@csie.org>, Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
	Gatien Chevallier <gatien.chevallier@foss.st.com>,
	imx@lists.linux.dev, Jernej Skrabec <jernej.skrabec@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org, linux-spi@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-sunxi@lists.linux.dev, Liu Ying <victor.liu@nxp.com>,
	Mark Brown <broonie@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Maxime Ripard <mripard@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>, Samuel Holland <samuel@sholland.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>
Subject: Re: [PATCH 0/4] dt-bindings: treewide: don't check node names
Message-ID: <20251020-coroner-headstone-c8685f6e3868@spud>
References: <20251020060951.30776-6-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ifIYyPcG9nWKLWH/"
Content-Disposition: inline
In-Reply-To: <20251020060951.30776-6-wsa+renesas@sang-engineering.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_105811_489896_E139E781 
X-CRM114-Status: GOOD (  15.86  )
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


--ifIYyPcG9nWKLWH/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 20, 2025 at 08:09:49AM +0200, Wolfram Sang wrote:
> Node names are already and properly checked by the core schema. No need
> to do it again.
>=20
> These are all occurrences I found in linux-next as of 20251015. I did
> run dt_bindings_check successfully. I haven't done a way to run
> dtbs_check yet because I would need to identify the proper architecture
> first, right? Is there some tool which tests all DTs of a certain
> binding? At least build bot is happy, I don't know if it checks DTs as
> well, though.
>=20
> I'd suggest to give subsystems some time to pick these patches before
> Rob applies the remaining ones?
>=20
>=20
> Wolfram Sang (4):
>   dt-bindings: bus: don't check node names
>   dt-bindings: nvmem: don't check node names
>   ASoC: dt-bindings: don't check node names
>   dt-bindings: spi: don't check node names

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--ifIYyPcG9nWKLWH/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaPZ4KgAKCRB4tDGHoIJi
0nQOAP9zt58K2r6VVxQGAjEOeExklSakIE1QYNmtoG9DXBZsvAEAw5tz28SP3wVF
gblhCrRV4FJmV7bWABaDA6WjOT5AlAI=
=dLoT
-----END PGP SIGNATURE-----

--ifIYyPcG9nWKLWH/--

