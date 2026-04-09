Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 336EAF31E39
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Apr 2026 15:36:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GaBsF253+7/0/7ERds0sHbzej0dAyfzmyKqbhi68H6c=; b=dCHZSHtTqljXp2pVsl/S5Lfywu
	DLgpiFJEIix2sKSkiY8uffuQWGz270ImVDLChxqwwx1wwwUaLWEzhS4Mxkw61u73dJ+KLSGVEetC5
	1fTd/CaLlETB+plGrOlYLE38gg9V9q126bA5Ak8OXrVug9XqRYZLlSPDQedUwaR7+UZfqYRHZZpXY
	+SOYHBI47SZ8qLx/bgOgXfKRhj+OMYWo6QfPpyPc9fxXE2w+ibzrnt5uy23BWjzVyU3XVUzOfMyJz
	knMz2Id7+/bwEsoOMq2eY973OnNXHNqOFRYwiJgHUKPjpwTTPO1xVlBDhNRJUABDrxj26wu6mDwHx
	5jPiXlSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wArQT-0000000AoAN-2xTD;
	Thu, 09 Apr 2026 15:36:13 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wArQS-0000000AoAF-2Q0T
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Apr 2026 15:36:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E5CCE600CB;
	Thu,  9 Apr 2026 15:36:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03943C4CEF7;
	Thu,  9 Apr 2026 15:36:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775748971;
	bh=GaBsF253+7/0/7ERds0sHbzej0dAyfzmyKqbhi68H6c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oFVh+w9B2ldMkOPGVl6bIKnn59TCHL0dytoqAX3A1iQs2ErGvYeLQmmpfm8lef8mq
	 VoExxPRoA8rQN0DeT+s+6uqcL7AXkMyTholVv57reE6JSRkV0P1YFJDvY/C/nJMt5b
	 VVnAXF9iLERirSIfpaoqcEcKGHJYoMrz5fz2hz17zxWlCEpWw2+yZMR5uQ5536BhpG
	 eTLofzn2Y+BROrNBOKopUwJ/n02Xrh5xBvCKFEyB+QQwRJRHMIcRpU2M/755+FVZMf
	 03FRvcgHnbYJU7CVHc1l5qU+cud+t4cFdzYiNLUPmY/ZMhNpFbNOiB3bDkUHaltkT1
	 LBuz7zpWpAlIA==
Date: Thu, 9 Apr 2026 16:36:04 +0100
From: Conor Dooley <conor@kernel.org>
To: Josua Mayer <josua@solid-run.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Yazan Shhady <yazan.shhady@solid-run.com>,
	Mikhail Anikin <mikhail.anikin@solid-run.com>,
	Alexander Dahl <ada@thorsis.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Krzysztof Kozlowski <krzk@kernel.org>, netdev@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: net: dsa: nxp,sja1105: make spi-cpol
 optional for sja1110
Message-ID: <20260409-afar-striving-d89022c8a2bc@spud>
References: <20260409-imx8dxl-sr-som-v2-0-83ff20629ba0@solid-run.com>
 <20260409-imx8dxl-sr-som-v2-1-83ff20629ba0@solid-run.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="FfoVPBWIp5Jpffvt"
Content-Disposition: inline
In-Reply-To: <20260409-imx8dxl-sr-som-v2-1-83ff20629ba0@solid-run.com>
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


--FfoVPBWIp5Jpffvt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 09, 2026 at 02:34:33PM +0200, Josua Mayer wrote:
> Currently, the binding requires 'spi-cpha' for SJA1105 and 'spi-cpol'
> for SJA1110.
>=20
> However, the SJA1110 supports both SPI modes 0 and 2. Mode 2
> (cpha=3D0, cpol=3D1) is used by the NXP LX2160 Bluebox 3.
>=20
> On the SolidRun i.MX8DXL HummingBoard Telematics, mode 0 is stable,
> while forcing mode 2 introduces CRC errors especially during bursts.
>=20
> Drop the requirement on spi-cpol for SJA1110.
>=20
> Fixes: af2eab1a8243 ("dt-bindings: net: nxp,sja1105: document spi-cpol/cp=
ha")
> Signed-off-by: Josua Mayer <josua@solid-run.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--FfoVPBWIp5Jpffvt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCadfHYQAKCRB4tDGHoIJi
0pHMAP4xcZs2F6zIRBAC+PvYt8NsWbZkNNOCtJhpauOF9O+jugD/dx95sKUe2Px2
XiwZrAPhK4i3PH2q0hqkv0eSMmaMNwY=
=I38d
-----END PGP SIGNATURE-----

--FfoVPBWIp5Jpffvt--

