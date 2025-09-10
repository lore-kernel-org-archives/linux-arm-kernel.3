Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9802FCA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Sep 2025 15:43:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XXY2jGWEtx9pkKnH7vZl4c1MOiJ0o9a1itSWnPhwtOw=; b=u9dCzznvJkSQIyR5D7KS7QPv1p
	64k/IZdkFOTkbeOwy70l0arSEuVp6WeQmAVBKLjIcNnjj6UalfkSEhziIvxJ+Yy90+DvVi+AaL141
	vR+g1ZVR8gxWYVUOM4WHMZFJpyy/5t7vROTOHiI4rywnTIHoj07pHmDqNFVBZsQrBIUM6qZCOOcY5
	bU0smoMr0nW+nAUf/M81hCnrsIVMUpjKPqiohdzdo9izRksj6Wzw/3S6K5ukQBNTtmkhTTDhw7UQR
	HdqkVmWo6hI99vaFD/KwoKbbwNzwR4SOgq6Bg0YQsu26ZzW5x0gar7LEpG3G3KuJ+IaLSRXO0SEwE
	yH+fKZKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwMyY-0000000FCJI-2kwm;
	Wed, 10 Sep 2025 15:43:14 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwMyX-0000000FCIl-3E3J
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Sep 2025 15:43:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 064DA601AB;
	Wed, 10 Sep 2025 15:43:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A0A8C4CEEB;
	Wed, 10 Sep 2025 15:43:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757518992;
	bh=1b/HZBCDSBjZnOsquRRI7/H8kIGM/UOD3l0APNCePus=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Zy2EXQLQpfYmmOEV6xbp8DMW+dbc+6Gj/MtHurit3ZbLJ9QHWEZbwAMKzf1WylQKg
	 dM/Dw8lHZ/nS/Sz7WpHj0WfhZcsQ+3cTfBzWI72o3iqcjAwuGlmiRnXgEhnixN8c78
	 qAaKdBAEHbJjJrskvpy3pKPKXFcR0tsUmK3D2HSWo1/GrXFh2+1WKzSF+3HAilOS8b
	 WGdhxIuiZV5ekKmKwVb3JkBxpzP1bwYJ7SHIGzot2MGCHh7EnTAlGyp1kUKbqCZMBE
	 PgVudAEWJeCge2KLcNhRlUUjTjhby7LsF4UaPVLKjE4+arfdp1RtjNC3fH3znCdkXy
	 bRVGCye4nX0/A==
Date: Wed, 10 Sep 2025 16:43:05 +0100
From: Mark Brown <broonie@kernel.org>
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: Marco Felsch <m.felsch@pengutronix.de>,
	Jonas Rebmann <jre@pengutronix.de>, Andrew Lunn <andrew@lunn.ch>,
	imx@lists.linux.dev, linux-kernel@vger.kernel.org,
	Eric Dumazet <edumazet@google.com>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>, linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Vladimir Oltean <olteanv@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	"David S. Miller" <davem@davemloft.net>
Subject: Re: [PATCH 1/4] dt-bindings: net: dsa: nxp,sja1105: Add reset-gpios
 property
Message-ID: <e5bb3ed5-be37-4bdd-ad42-c35d441a67a8@sirena.org.uk>
References: <20250910-imx8mp-prt8ml-v1-0-fd04aed15670@pengutronix.de>
 <20250910-imx8mp-prt8ml-v1-1-fd04aed15670@pengutronix.de>
 <20250910125611.wmyw2b4jjtxlhsqw@skbuf>
 <20250910143044.jfq5fsv2rlsrr5ku@pengutronix.de>
 <20250910144328.do6t5ilfeclm2xa4@skbuf>
 <693c3d1e-a65b-47ea-9b21-ce1d4a772066@sirena.org.uk>
 <20250910153454.ibh6w7ntxraqvftb@skbuf>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="B4AlsieOXZl/QDeJ"
Content-Disposition: inline
In-Reply-To: <20250910153454.ibh6w7ntxraqvftb@skbuf>
X-Cookie: I think my career is ruined!
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


--B4AlsieOXZl/QDeJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Sep 10, 2025 at 06:34:54PM +0300, Vladimir Oltean wrote:
> On Wed, Sep 10, 2025 at 04:09:05PM +0100, Mark Brown wrote:

> > after power on.  The above wording is pretty common in datasheets and I
> > know in a bunch of cases it was carried forward kind of blindly rather
> > than looking at the actual device requirements.

> No, it doesn't say that, and I had discussions with the application
> engineering team for this chip about this :-/

> I can't comment on anything extrapolated outside of the SJA1105/SJA1110.

Fair enough if this chip is unusually unstable, TBH I'm surprised to
see something currently available that's so fragile - internal POR
circuits aren't exactly new or exciting and do make things so much more
robust.

--B4AlsieOXZl/QDeJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmjBnIgACgkQJNaLcl1U
h9ArpQf/d28NFNL5lecDi1OX5w67IE7M+usOjz61mRz2Y53VAC79EU7VDXj0zn+P
BdWEf1RWecGZ60aHRhOd+nlLv5qp6GSu7zoQRWro1LehBeAViCfKXTkJOww4gXai
2hmEAn0iJXYfDtsNdEg7xhOM6eH+h2aR9OdbKM98mz70fHGJ1PF+g0JI2OaXT1t6
l2zW7l8cYRSRZFCwGKMpo3QRVXKVzZTbLuxtjMHOOFt1N456lcIBcxqjUlg5uOke
ycoER8pFDJUYh+PMVz1m0X4EvFN0VyG6EGw2e3OER7dWxkqlBoKzGQS5yEFoIC+q
t4PwZfOH4Q1znGetEzvF1HuZGpu+IQ==
=SMFl
-----END PGP SIGNATURE-----

--B4AlsieOXZl/QDeJ--

