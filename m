Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E463CF6497
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Nov 2025 00:03:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WMsq9JPLlK4+BYdLQKsCM23nLYpa+wr3TXvDe6xxUfc=; b=SHmMb45pdYTDcDcUpOQB1kIZVe
	0TpnGfuo3JAPn9i0aaCrVbCydtEE9QJ4nQicutAtBv64aXWqbJbcQRzPJzki5laNz/Abt+oiJhRhr
	sUmcqNTw913V1mQWxBYlj3acSmUUUsLINygkbemXCEWxvK11D+O6/7/3KhvWP5qZx8s+brwe2VHnw
	syUQcg0WYYtuvbOWhTDMvwh9t+Z2L8lPt7/IaurmIMzX2nLdKX5qalIStID4qKjLHnalD/GleVIp0
	aiOKpW+PbWh+k1h0VuJ5Nc5Vu9LmDdCHeIrTkD3zGNr2xMPw8bPqec+MHCN0MC0W9uaioANsLC5aV
	rO+h/Abw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLs8i-00000005rMG-3y6S;
	Thu, 20 Nov 2025 00:03:08 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLs8g-00000005rLn-0U0f
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Nov 2025 00:03:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 07BC943E60;
	Thu, 20 Nov 2025 00:03:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FAD4C4CEF5;
	Thu, 20 Nov 2025 00:03:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763596981;
	bh=cVyPOnT/UBn71uhx+refF3VSlWZ4EZjVCMqRawXSxAM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nIbP0GBuOYzLLwjKfTQNUFmNriOakF0h4AhRoWeQv5l4W5ZGWjVpM7SDMAHhwwsfq
	 4+WNYNhf6tU3/qCISfEDI+fSPba7oAD5LoUYFq14bKtNXxHecDt5T2AF9OvKBypTyA
	 pFulrewuumd8hz74L53uXjuKnbE8NMmH8stFyShBLz/9TSnD0kf3F5RCGtPCE8JBkX
	 lLcDqFH11piEulLk9zz9O2CHPpflAJTpov3ZTGd/kYLoIusFTnyEQXgttuXg96JyZd
	 cSzPL55WxGvtYNNZjviujxHPlyRnc/WNrrJlFojiNLRM6UPXXB/1o6SzL4tFF4X9iN
	 8mixZr6N/wmZw==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 6C2CB1ACCCAB; Thu, 20 Nov 2025 00:02:56 +0000 (GMT)
Date: Thu, 20 Nov 2025 00:02:56 +0000
From: Mark Brown <broonie@kernel.org>
To: Frank Li <Frank.li@nxp.com>
Cc: Bough Chen <haibo.chen@nxp.com>, Han Xu <han.xu@nxp.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v3 2/2] spi: add driver for NXP XSPI controller
Message-ID: <aR5asBZpmtM_JiNt@sirena.co.uk>
References: <20251118-xspi-v3-0-6d3a91b68c7e@nxp.com>
 <20251118-xspi-v3-2-6d3a91b68c7e@nxp.com>
 <aRyfoXaTdL1gvPOY@lizhi-Precision-Tower-5810>
 <DU0PR04MB94965531DB74151BFE651BD690D7A@DU0PR04MB9496.eurprd04.prod.outlook.com>
 <aR3qK18c4/XJY8JW@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="AoC14FpgipN46l3S"
Content-Disposition: inline
In-Reply-To: <aR3qK18c4/XJY8JW@lizhi-Precision-Tower-5810>
X-Cookie: It's clever, but is it art?
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_160306_174461_AFBF9623 
X-CRM114-Status: GOOD (  13.91  )
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


--AoC14FpgipN46l3S
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 19, 2025 at 11:02:51AM -0500, Frank Li wrote:
> On Wed, Nov 19, 2025 at 07:02:21AM +0000, Bough Chen wrote:
> >
> >
> > > -----Original Message-----
> > > From: Frank Li <frank.li@nxp.com>
> > > Sent: 2025=E5=B9=B411=E6=9C=8819=E6=97=A5 0:33
> > > To: Bough Chen <haibo.chen@nxp.com>

Please delete unneeded context from mails when replying.  Doing this
makes it much easier to find your reply in the message, helping ensure
it won't be missed by people scrolling through the irrelevant quoted
material.

--AoC14FpgipN46l3S
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmkeWq8ACgkQJNaLcl1U
h9BQFgf+LoQSLm97OTEsjh3Y/QsqlCXXQ/uQKZ2jgf57X7sAtmHP+Az+6nK5yjjC
TlOdyDX3MDVs3hU7qC4tG74VhsBrIwXWQPMLpt4z/xuu7LvMi3X8UcS2LqFehTam
p385IAOJOCVqP1g9ZWBjPlIRGqQUz2Yh1iAD1/cIpEpbv9sFKWUHv+pRS2L5q6Km
esnCXXfmjwcthF0cCP2Ysi4BSndTB0xE1KubkK1ZlotxJv5BBMZC0gTuFSGWGzK/
+aqGv++vD0iE68KFsrfX3KQ92XvCNPTR5jFhDB3XiTWj7an96+5Iuo2cEYEfs6vd
rLyNDRRdYZbyoNeSVvfq0e/GSJ3pOQ==
=frvl
-----END PGP SIGNATURE-----

--AoC14FpgipN46l3S--

