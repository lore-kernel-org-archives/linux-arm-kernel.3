Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48DD7D3ABF4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Nov 2024 20:09:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ME9kM1M17sUoLRj/nIKdJANxeLIiyihYKpzTVz/L6PU=; b=GRMagcnO6nKlu6l3q7nRjeQcfS
	iYhbWKpAhQ/nQ+NRJpGovscOl9Q9+TFsZQwpwzuL9kYZmFhj+vq0KyYvMDXGKUgC6ogKX3CtSqiaQ
	7/7c3oW1/LLRgLridrzcvCvjy4h9KRaVI/jzx1pTUusBzVqxbDX87SRhRWLeYbvFX1wg/6XPyG9Bv
	2EdLwPPXujK+boC7uKwzYRSl7kOpLuJBlUj6BQQ17O4jU+6p+weWKVuP0TlCIcmTmW1J5fK9ZGMOq
	MPU9iIdEr8FMj12Ljny7FUxlp32LwMK3hNhtb0+8eaCLnaBz+MSmjoqpX+D/0llTGgDO/C4AWBoBL
	NlPWJeGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAajA-000000019Pc-42U8;
	Mon, 11 Nov 2024 20:09:36 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAagS-000000018mA-0rQJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Nov 2024 20:06:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4D4FF5C5CAD;
	Mon, 11 Nov 2024 20:06:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31931C4CECF;
	Mon, 11 Nov 2024 20:06:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731355607;
	bh=8Hq+tW3dAjqM4zX1c/kgHv6haEc0h8N2F9jRDiNygsA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lpGN5Kd2Y/nLGvgvrXtAZMi45Ndm8laZTz5FkkHrCsvZnyPkKMNevxE754z/AHX9V
	 6niA8GqYEKVGVGZAMN0jFEXuEnvJrKmLdEnGyrj0nQzYAEHnQ/u1Ro09sajig3O+Tb
	 nPMuqXWmOydOGYyfkp2X2zGkC1RlnDPAWNWO0u51weegndJU4DgBXvPwicCDGM8EjJ
	 oh9ZljbbY2CqavEtxEU+IgSXEEGF5Rs9IZ9MZhnxXb/0olbMHXODHaWnWVXLW5j92J
	 uOdbhGmPNy2R2R0+Jv8cgQMGhrx0tIxC/ZrY7ETna/gkJNSVZdu4R5yjGJS+8PLTOb
	 3wXp5U5mfwPSw==
Date: Mon, 11 Nov 2024 20:06:42 +0000
From: Conor Dooley <conor@kernel.org>
To: Ciprian Costea <ciprianmarian.costea@oss.nxp.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	NXP S32 Linux <s32@nxp.com>, Christophe Lizzi <clizzi@redhat.com>,
	Alberto Ruiz <aruizrui@redhat.com>,
	Enric Balletbo <eballetb@redhat.com>,
	Bogdan-Gabriel Roman <bogdan-gabriel.roman@nxp.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
Subject: Re: [PATCH v4 1/4] dt-bindings: rtc: add schema for NXP S32G2/S32G3
 SoCs
Message-ID: <20241111-manatee-decipher-fb3d20982109@spud>
References: <20241111135940.2534034-1-ciprianmarian.costea@oss.nxp.com>
 <20241111135940.2534034-2-ciprianmarian.costea@oss.nxp.com>
 <20241111-guidance-theft-9d49ded4d9a0@spud>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="UQyWMxaK+oqp1iq7"
Content-Disposition: inline
In-Reply-To: <20241111-guidance-theft-9d49ded4d9a0@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_120648_304201_4305C2A0 
X-CRM114-Status: GOOD (  10.71  )
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


--UQyWMxaK+oqp1iq7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 11, 2024 at 08:05:50PM +0000, Conor Dooley wrote:
> On Mon, Nov 11, 2024 at 03:59:37PM +0200, Ciprian Costea wrote:
> > +  clock-names:
> > +    minItems: 2
> > +    maxItems: 3
>=20
> You actually have to provide the clock-names, otherwise you can't rely
> on them

Oh, and drop the "rtc_" prefix while you're at it.

--UQyWMxaK+oqp1iq7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZzJj0gAKCRB4tDGHoIJi
0j2tAQDbKn1iW014icnEi6FZLhMjczdSymxpf7fLWOoh7+fSYgEA+jBT1hE2Auy8
reyQsc7xvFaqhuzwDN70yRWFKwYhywk=
=VSRa
-----END PGP SIGNATURE-----

--UQyWMxaK+oqp1iq7--

