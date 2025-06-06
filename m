Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58D97C5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Jun 2025 15:19:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SZEx9/PHTlU/AzqfimMF/aQJ07Zs92TCTW3A11T2ll8=; b=rZCaq8dW4PV7FoF8Yena965NIF
	z07UBGA2wGWwCCuTRCpsc+aUjnoFvk/JxWzcTz5cJwP6vh90voKnAgCS4JuNQGylCF+tyAKaZU389
	VdraTHLMSV3qIbLvQJscddLyktS1kCwQsqNlpV2elziCKIEJe5uCtXf8cuDcOaUv5yWTdAFJnvbrK
	+35Joo46PynwtQ81MdgNsucEWgN6Y2Y7mtqC4k3zhgzMGd4YIiaw/F7juC/9hpZ4d1Nmsau6jntEX
	uG5/dgxoI5UbFc87uw/mZDT8Wcr0NPbV9g05m1xk81UGiwupwG756qKnEWyDo5cGrxNsMtOq65Wrc
	H/AN+tZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNYqy-00000000VXk-3Fs1;
	Fri, 06 Jun 2025 15:19:32 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNYop-00000000VLD-2CjQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Jun 2025 15:17:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D81F7441D9;
	Fri,  6 Jun 2025 15:17:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD22CC4CEEB;
	Fri,  6 Jun 2025 15:17:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749223036;
	bh=SZEx9/PHTlU/AzqfimMF/aQJ07Zs92TCTW3A11T2ll8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=elql2HZ9+gtHvY35GtOiYx0rdbcugqG9COKyiBsqE5u6G+ZselZNyCQ8ifregkx4G
	 IRcbvbJ4gTPuV41LzVDKLVzMLjYd5y17Zkaipl7FmdbGRidLBFxthV9r/KJbMU+IfK
	 oYQ7dqeS3IMJHFI/PbkXxvWkNHAC69iRfdhkH2MTc9oqyNCBs9FtUYDho32eIzZ/NM
	 wxeLIT1CGY8ZZnFpjmD7SiWzphak9SvJuWRHhkmd6QvXRheckOHlqCQ6msL/mD2SVX
	 3OAyZTBpzNj5idhrC7qtgJqrLKwNvYHcr6zcZdHrgmsOMpWUJf0pnn4TIFZ6hnmCSg
	 cR2KpwDw/ocXg==
Date: Fri, 6 Jun 2025 16:17:11 +0100
From: Conor Dooley <conor@kernel.org>
To: Frank Li <Frank.li@nxp.com>
Cc: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Marek Vasut <marex@denx.de>,
	"open list:DMA GENERIC OFFLOAD ENGINE SUBSYSTEM" <dmaengine@vger.kernel.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	"open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>,
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/1] dt-bindings: dma: fsl-mxs-dma: allow interrupt-names
 for fsl,imx23-dma-apbx
Message-ID: <20250606-unending-rockband-fabcdaed87a4@spud>
References: <20250523213252.582366-1-Frank.Li@nxp.com>
 <20250526-plural-nifty-b43938d9f180@spud>
 <aDcw0sgN1ZX0kCCZ@lizhi-Precision-Tower-5810>
 <20250530-those-frequency-f8106275769f@spud>
 <aDnYpeViGvIsGCLD@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="LWyb0P04RKgeQbRs"
Content-Disposition: inline
In-Reply-To: <aDnYpeViGvIsGCLD@lizhi-Precision-Tower-5810>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250606_081719_584053_36C2DEDA 
X-CRM114-Status: GOOD (  19.38  )
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


--LWyb0P04RKgeQbRs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 30, 2025 at 12:11:17PM -0400, Frank Li wrote:
> On Fri, May 30, 2025 at 04:24:51PM +0100, Conor Dooley wrote:
> > On Wed, May 28, 2025 at 11:50:42AM -0400, Frank Li wrote:
> > > On Mon, May 26, 2025 at 04:28:07PM +0100, Conor Dooley wrote:
> > > > On Fri, May 23, 2025 at 05:32:52PM -0400, Frank Li wrote:
> > > > > Allow interrupt-names for fsl,imx23-dma-apbx and keep the same re=
striction
> > > > > for others.
> > > >
> > > > The content of the patch seems okay, but why are you doing this? Wh=
at is
> > > > the value on this particular platform but not the others?
> > >
> > > Actually it is not used in dma driver, i.MX23 is quite old chips (ove=
r 10year).
> >
> > If they provide no value, why not just delete them?
>=20
> The platform is too old. I have not hardware to test if it really unused.

oh well,
Acked-by: Conor Dooley <conor.dooley@microchip.com>

--LWyb0P04RKgeQbRs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaEMGdwAKCRB4tDGHoIJi
0rfRAP0d1c7CjpWwGCBbFeIXDYjKjS0gYWoeInijKrMbsrTAEwEA7zYVo1MkZANM
Jf3bucvpJep13y2QUVEkdnRbqqP5+A0=
=2oX8
-----END PGP SIGNATURE-----

--LWyb0P04RKgeQbRs--

