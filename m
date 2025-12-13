Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5731D59F5C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 13 Dec 2025 03:16:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KOXoqXt5Xmrh921+CW5vaUGrvh86vh0stCQ6djrzqE4=; b=EkYij0s+dTE12ONfYlAqDJ0gUC
	u8nPp5xEyVIA5bRptzSz/ThLu/lcGyOXq3pwMNMc1yfAXRqvZ/rIgnPq+nw5VOQgP90EjNYYYMnCU
	SHJeVjJWU+WEtOFz6UFI6bMP5Ho/ZQIdQuMZNOlD/kLivGU77RXKxkx8ayBaZcNqWL9eLtZUVnIXj
	1HOcYgYa0dPY6oAzCwRS4Ke8HrSfRtXWM/44E4EOkm/KDUo5cs3T6mwiBSjw+sxKbKLuAPw3fTANm
	pX/5d6Y1Thiwv/fKopHZNBXPLwXpYNsNMnVmM68a8SA9BACMvJqXKZyI26/foZi60czs1HgyaIE+l
	PY8kYdPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUG7D-00000001MXj-3pI9;
	Sat, 13 Dec 2025 03:16:16 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUG7A-00000001MXB-1zkt;
	Sat, 13 Dec 2025 03:16:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 84C244174B;
	Sat, 13 Dec 2025 03:16:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F60BC4CEF7;
	Sat, 13 Dec 2025 03:16:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765595765;
	bh=KOXoqXt5Xmrh921+CW5vaUGrvh86vh0stCQ6djrzqE4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=m3I+s6WUp1W0mDBHh3cXyXcKGUScadcndF+cR3bgdkuVT8PtPMHZEyLDDCKB6/lvo
	 88P9PXI72Czg+bZKQlpV+eY9jQ1t7gDn5pPxgi77RX1wV1Cf43YTNwypRjgpbHjUsT
	 /XwvzDaMAMK3vmvKqVyrQYiPLhUgwOmqFodb/rtOHkt45fyTXRPLA1mAh8+sPEL0gx
	 cuIN66MjtHUbl3Raq6JnufW9dEwnQWqXOH3FNEKMClq9koFS9HG53PJGil0z+rP1hN
	 sWCKhvX/uF8pFTAUXBymg6e7qcSJYcw7pDIdRzTyWUUCOWB3nHatb/Q5WiS6y79fJe
	 L1+w9wqtxnhQw==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 9308C1AC5657; Sat, 13 Dec 2025 12:16:03 +0900 (JST)
Date: Sat, 13 Dec 2025 12:16:03 +0900
From: Mark Brown <broonie@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Michal Simek <michal.simek@amd.com>, Vinod Koul <vkoul@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>, Yong Wu <yong.wu@mediatek.com>,
	Peter Rosin <peda@axentia.se>, Linus Walleij <linusw@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	dmaengine@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-iio@vger.kernel.org, iommu@lists.linux.dev,
	linux-gpio@vger.kernel.org, linux-sunxi@lists.linux.dev,
	imx@lists.linux.dev, linux-sound@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: Remove unused includes
Message-ID: <aTzaczBfsrH2nY5w@sirena.co.uk>
References: <20251212231203.727227-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="8bHZTj54bYLdLiw+"
Content-Disposition: inline
In-Reply-To: <20251212231203.727227-1-robh@kernel.org>
X-Cookie: DYSLEXICS OF THE WORLD, UNTIE!
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251212_191614_453242_5BEBEF32 
X-CRM114-Status: GOOD (  10.05  )
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


--8bHZTj54bYLdLiw+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 12, 2025 at 05:11:52PM -0600, Rob Herring (Arm) wrote:
> Remove includes which are not referenced by either DTS files or drivers.
>=20
> There's a few more which are new, so they are excluded for now.

Acked-by: Mark Brown <broonie@kernel.org>

--8bHZTj54bYLdLiw+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmk82nAACgkQJNaLcl1U
h9AF0wf/RU9WagcpUCZ1sx0lAc8LqeClGvN8UmsUry3bwmzqht7//PCIqy9YES2b
YonKgjyQSc6jVAso760Vy8kMyVo3qmDtZh/+HhG+hKZKYjuWXTgNDZbcuHqLLC0n
VfP2g8L5ainnzUQn4d6fuC7yTPCemUe5LXXlfAXcsxgTzYp9lCOfPAzCQ8AXP8dR
3nfijzX8hDff/ZC7rmalUnnhx/RkrrAxxNALfZTo2xmgpP63cimXvuJt8oQEAPBU
Sl4lfIk/svMJjz8wkCP6p7YT9E2tyyrKpLCsduZAXCRi8+OSbV/EMEwVvn0DbsAO
zBEwV/somQyTbEe29Lzi683OStqqEg==
=3mYQ
-----END PGP SIGNATURE-----

--8bHZTj54bYLdLiw+--

