Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C7C2E77188
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jan 2025 12:24:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oGYg4VihaN9XekRqQm/v8gi29KzPEeuneKq4SGL6rdA=; b=w+ffETFjkgkj76y5ZiqWNUQCav
	YsOkZFMMQtv2mvkgy3TM0ifFq86aQTtF1CfKKyixyDE1ciKiKiKn2AzTGtFsAQ8RPkPBdm8ih7Cfh
	5Dh0REngf68tZxMu8PubfbqldWaDeDbzo0LpRBLdRVrVSOmayL7MPB3Fwx7LrU4BBBNbyNZf1Lg80
	UoK8Zs7H+nTNL9DdP/qxGqE8OhtEeY4U3tZIkb1myhPUefaM2HlyBXveJRhOo/q6iM7GZ6rSyRRDg
	DKXERHh9bZZpJ9fBrGXFpu6roDOPTDNIYAre5zvkahj7pdUYN/t5B/shXvZa2KWGWRnzoHuLmBfrG
	m1UPEVCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUm9j-00000001CvI-2kxu;
	Mon, 06 Jan 2025 12:24:27 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUlyZ-00000001A8L-0nwu;
	Mon, 06 Jan 2025 12:12:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3CE765C060D;
	Mon,  6 Jan 2025 12:12:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E73A5C4CED2;
	Mon,  6 Jan 2025 12:12:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736165574;
	bh=oGYg4VihaN9XekRqQm/v8gi29KzPEeuneKq4SGL6rdA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=guOseR4UG0uXGKRR23FZgdM6BoLTyaxbU1wGbXA/2JTs6envVsy11jvxhXZE/xRhm
	 q+RTP46onPVsM5lZHKRVE5j9SNAT2b7QgxZIhJMIYOMzx2Lp8cFrgXw3GZiZW+hghR
	 ZWdSuZWF8GSQ7t4uIdMptKgtOCbUWggS0kUhON1qsnOVA9cMX0+m30ZbcFDU6BtFOJ
	 3A2KWtJiK+LnUcETVr7ZfeoKTob9ZCbHnm0Rjcj9j4GJlmTv0UZtrYQjdbe9qLBKwn
	 anGb12ucv9UmTbo3XAaCH5daqLX8F3a3IpzWguOba9vNJEuO4r+t6xyZWZ7UqWtxiw
	 FzCxZ8Ue+9P7w==
Date: Mon, 6 Jan 2025 12:12:45 +0000
From: Mark Brown <broonie@kernel.org>
To: Val Packett <val@packett.cool>
Cc: Fabien Parent <parent.f@gmail.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Sen Chu <sen.chu@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>, Lee Jones <lee@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Eddie Huang <eddie.huang@mediatek.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Javier Carrasco <javier.carrasco.cruz@gmail.com>,
	Yassine Oudjana <y.oudjana@protonmail.com>,
	Chen Zhong <chen.zhong@mediatek.com>, linux-input@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-rtc@vger.kernel.org
Subject: Re: [PATCH 6/9] regulator: mt6392: Add support for MT6392 regulator
Message-ID: <70a3dc99-4e2e-44f0-ab9d-7770d2df94c0@sirena.org.uk>
References: <20241226050205.30241-1-val@packett.cool>
 <20241226050205.30241-7-val@packett.cool>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/vYbwmcb+QbC4fzk"
Content-Disposition: inline
In-Reply-To: <20241226050205.30241-7-val@packett.cool>
X-Cookie: Do not pick the flowers.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_041255_290764_E23FE8C0 
X-CRM114-Status: GOOD (  10.61  )
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


--/vYbwmcb+QbC4fzk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 26, 2024 at 01:58:06AM -0300, Val Packett wrote:
> From: Fabien Parent <parent.f@gmail.com>
>=20
> The MT6392 is a regulator found on boards based on the MediaTek
> MT8167, MT8516, and probably other SoCs. It is a so called PMIC and
> connects as a slave to a SoC using SPI, wrapped inside PWRAP.

Acked-by: Mark Brown <broonie@kernel.org>

--/vYbwmcb+QbC4fzk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmd7yL0ACgkQJNaLcl1U
h9AoUgf9E5E6xhnmqTj1rf9LLDmAhOGp/lZ9yE5VY7gE1bCykncwvblk6l9QuC9X
fPYWdX6juy9GMMTcMVRyPojqI87AQ0/8/wNo4gPirl/B5Dd9Co7iExwWDmOLxPw5
a7ddRO2vZtowXdwfnKa3kMl/BY/GVSl1BveULOCiqQphB19siW68OROHgPQyDVEn
K1NowlyYiJkKqievI1RDhyHiOqwrniY+QIjDS2Umoka/PW+/dykRF2mvrGbkST1E
tDs2HQKZUwjffJxMKPKbyP37yM1v8XgmSTq8dy8WU3BQub+eGQS/SO+jINwv2kKx
v7DXLjDwH51s1Oxx01Rc14JvWpTRYQ==
=HUz0
-----END PGP SIGNATURE-----

--/vYbwmcb+QbC4fzk--

