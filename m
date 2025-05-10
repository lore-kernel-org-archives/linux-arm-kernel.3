Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5E0DC3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 May 2025 01:20:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yWNHjmwW9VsY6glrAg1UgBAK/oAU6eV1FZfNUgwyLLc=; b=vnGaGBjD6wruQ/9QIhev49YPXL
	FSLHhaaOVXFtAmFSxbVFNXviuTJFn/hHjSBhg51ZYCx8DqGg0q2ZigdUi9U6MYCCtpXBcjJNFDy8g
	haOXSiGpj705Pnu/zd2+vm5fkJxRHHJhUL/RUcrx2y4ae99OOB1Qj938jbwfnjdqlGzE5XOICv3cG
	4NuftgqF1/khRUdPsZdjQdpI8Rtfhizb+uD8vDuJPgz1reqZm1WHRhPMbNh4vpa4I+n+cxRJzFqJ/
	3TLRCBHyQiIbyVroe/WAr7BIUIFewF4J/are0FFwrwVhNOICPYcyxAr6JFdjVitmCIKsqmTFDXeH4
	+JPJSiyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDYtN-00000005FXE-3fP7;
	Sat, 10 May 2025 01:20:41 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDYrP-00000005FDx-1D9Z
	for linux-arm-kernel@lists.infradead.org;
	Sat, 10 May 2025 01:18:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 75093629F5;
	Sat, 10 May 2025 01:18:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89254C4CEE4;
	Sat, 10 May 2025 01:18:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746839918;
	bh=yWNHjmwW9VsY6glrAg1UgBAK/oAU6eV1FZfNUgwyLLc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CAHwqVpa+OPmYTeTOF3uAZyF2H4hAXRZ1spCaoMTnfu37b4Ot7eoz179At92w6cNg
	 jyHcLdEd8j3OBko28P1K7y4ea0boGTCzuhXLY/4N7cqoK5C6+YLjZ9Jmf+RKAen6di
	 e620rxLGMKANV5f/Uw9oYzjmygvGzy4ESypigdBGspB2jeJdtrTuNllH3yIN4xNLCp
	 o0Ij64Qynas8CmeOW3wCqcu3zf6n8yChNQCrqHxdAzM5HaEU8/Klrf4c5kTjouyjb9
	 ZnfJN+7lIQyTj0kN58918DGD6ZYGPKG7x+dPNariC5nDbWkJqHDIu3OH3fAmnzLUnv
	 U3kRJ+ceZQY6A==
Date: Sat, 10 May 2025 10:18:35 +0900
From: Mark Brown <broonie@kernel.org>
To: James Clark <james.clark@linaro.org>
Cc: Vladimir Oltean <olteanv@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Chester Lin <chester62515@gmail.com>,
	Matthias Brugger <mbrugger@suse.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
	NXP S32 Linux Team <s32@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, larisa.grigore@nxp.com,
	arnd@linaro.org, andrei.stefanescu@nxp.com,
	dan.carpenter@linaro.org, linux-spi@vger.kernel.org,
	imx@lists.linux.dev, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Andra-Teodora Ilie <andra.ilie@nxp.com>,
	Bogdan-Gabriel Roman <bogdan-gabriel.roman@nxp.com>
Subject: Re: [PATCH 10/14] spi: spi-fsl-dspi: Enable modified transfer
 protocol
Message-ID: <aB6pa9m0emX2vMH8@finisterre.sirena.org.uk>
References: <20250509-james-nxp-spi-v1-0-32bfcd2fea11@linaro.org>
 <20250509-james-nxp-spi-v1-10-32bfcd2fea11@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="eHDy/O/wzZPE7H4n"
Content-Disposition: inline
In-Reply-To: <20250509-james-nxp-spi-v1-10-32bfcd2fea11@linaro.org>
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


--eHDy/O/wzZPE7H4n
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 09, 2025 at 12:05:57PM +0100, James Clark wrote:
> From: Andra-Teodora Ilie <andra.ilie@nxp.com>
>=20
> Set MTFE bit in MCR register for frequencies higher than 25MHz.

Is this a bug fix?

--eHDy/O/wzZPE7H4n
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmgeqWoACgkQJNaLcl1U
h9ATVQf/ViujQ6wWUrilRw8LqA2oeHPk8LhY8ucw+I5me7zj0rDL8yKoaeNZtjCH
+wT0CIW70XthMVfnFJOXemdqWwGXOyy46igADLMlMDSo7YB04rzabrpjH2CPrg6b
SY99Rj5KOB9t8l+LRSpmDTwGwAnL8HXXNzPrT8pG/MC28XA+ISE7XBvSSW/5cSZL
Zih0iT1J6H4LuAWqbWXPU4s0OeutaTDwBvGhaP4JZhgrFc8r3jUoaZoDedIoM6rP
m7WV4Bb8KDWOPMBMa41Hl/xMr7YwTlCBGe4L/E1qxFNHnstcicFvF6vclJ6JIl8C
zkFVj+hpbFd5F2fRz5RHJm2blPrUpg==
=9NmH
-----END PGP SIGNATURE-----

--eHDy/O/wzZPE7H4n--

