Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CEE7CA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Aug 2025 16:06:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RzMxFxwPoB4uooSAFKSo5C9uKTufXTRx8J/9OABSyi0=; b=EbxJmQvoI2jbf3YWa/qCyb9tD4
	nLwXY9LE8Nyf1GSvImPFFFjzBeKgF3GfSuNYmAR/ElebelsYR6TxarvGOnx1BzbtAVIM1YzwLmZp3
	sa9iNgyw5y9VdqqePmkjb66If4PjgEqE7UEJyzqLbuJGw0LZClpemanNIL2hQSrLYkMWcOn6jLVjF
	MXbMkJ2qBS5vl5+QQ4Kx9Cj4NU71e5RhLHCodFBWoFzp/ujv/KCReLeTAxX5ZrtcIaJofZHzd2tQ2
	eXFjLVRMUXfgY1iF1TXvjI1+0bLY7aFuaZ5IIUzKu+Sf+60qZuj2/Bf53IWXHNZ95RhSeCxLyq/CK
	61HuB+pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uolKA-0000000ELJ0-3npR;
	Wed, 20 Aug 2025 16:06:06 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uojhD-0000000E1Cb-0E6H;
	Wed, 20 Aug 2025 14:21:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 795005C5951;
	Wed, 20 Aug 2025 14:21:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 904EDC4CEEB;
	Wed, 20 Aug 2025 14:21:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755699706;
	bh=oqNZJj++AlZ8Ps0cc+9Vt/kMxVfjlJ3sjFH2mz3NPjA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ov7P0L6iXmWRO1R7kJepvTyesG5pqkN/+U63hvE3aS06vs/+MuKlOGUSKbiUytdEX
	 1St/UwrhmbGX0wW3k5WkXrBYONCPcPb8cMrq/0AsVTrn1GWopIH+BwKzcECfA94kp1
	 Y3vHSAIguM5zfjUCNu8AsQnOhVt35+lXf0gbS4CxX4JbNxZSAjb5voiJ0+PJ1sbUGO
	 lzqgwG5wURY5QhOynMMyZ4COgYjmwsGZmY8la+DF/OnNzbcU+XXsDaJe3jmXrFae+r
	 h8n4Fc+S+I6IyCUTiX/GUzRMn/nbY4JsCLM5UMZ4zlJ6oEoopeV2P8EUjBxpejyKJl
	 tJjudSu++++4Q==
Date: Wed, 20 Aug 2025 15:21:38 +0100
From: Mark Brown <broonie@kernel.org>
To: Julien Massot <julien.massot@collabora.com>
Cc: kernel@collabora.com, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Ikjoon Jang <ikjn@chromium.org>,
	Enric Balletbo i Serra <eballetbo@kernel.org>,
	Chen-Yu Tsai <wenst@chromium.org>, Weiyi Lu <weiyi.lu@mediatek.com>,
	Eugen Hristev <eugen.hristev@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Julien Massot <jmassot@collabora.com>,
	Sean Wang <sean.wang@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-sound@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2 0/6] MediaTek devicetree/bindings warnings
 sanitization second round
Message-ID: <d02d2a5f-b8d7-4fdb-b3c5-6e6d21127733@sirena.org.uk>
References: <20250820-mtk-dtb-warnings-v2-0-cf4721e58f4e@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="nGxggd7EixyA+X3k"
Content-Disposition: inline
In-Reply-To: <20250820-mtk-dtb-warnings-v2-0-cf4721e58f4e@collabora.com>
X-Cookie: Semper Fi, dude.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_072147_131655_4A5B52F3 
X-CRM114-Status: GOOD (  12.39  )
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


--nGxggd7EixyA+X3k
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 20, 2025 at 03:44:51PM +0200, Julien Massot wrote:
> This patch series continues the effort to address Device Tree validation =
warnings for MediaTek platforms, with a focus on MT8183. It follows the ini=
tial cleanup series by Angelo (https://www.spinics.net/lists/kernel/msg5780=
177.html)
>=20
> The patches in this set eliminate several of the remaining warnings by im=
proving or converting DT bindings to YAML, adding missing properties, and u=
pdating device tree files accordingly.

What's the story with interdepenencies between the patches in this
series?

Please fix your mail client to word wrap within paragraphs at something
substantially less than 80 columns.  Doing this makes your messages much
easier to read and reply to.

--nGxggd7EixyA+X3k
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmil2fIACgkQJNaLcl1U
h9AT6Qf+O4+Z7uHUog/4pJNkvJdaQakvVyleGl1rZZhFeiygjeRj7kGarSjQtJjP
/qh5Is7DkgUy+DiROexGk5Z+t9r0yFCkFK+qyvWWteOqiZjna3YsA7NGmssLswTN
DY6uF15lOVUK7f6cKAEzKoXlct2HK/wZ/l8/AFiIpRxuXxzXB5jyuK7P4dV2UtK4
bZKuj/3VVOuTrbIkfIJwvlewKhQ4OCswcJHO+8ltNCo1omKcdWZOfS2+4PzVhZju
XU68yXOWzxgbTWgjcXZQ4Ia/u7uzMOV7JZhSjPByMFRZVVcIfkPkW4D3lbctaggG
OsL5Gyzt77XUGtoCDX9CXoft9b5PiQ==
=S34d
-----END PGP SIGNATURE-----

--nGxggd7EixyA+X3k--

