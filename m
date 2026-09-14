Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 770E8C88E64
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 10:17:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YgwMSL2DfS6Z71Ol2dt2Xh64k0FHnIYhlRjZmBPc0hg=; b=tt7Rdpt88ECExj1RNiuRpeUwHx
	Vvz4Sg3nxoCnY/PZLmaxYP9uWYtDv4IBfRmaNYb+iBuIj2In2jdV3ipR0gtJC9jpGl9Gu4/inE0Wh
	NwMwwK3wWrBHqxQGnpkhdAn58DI1lhUyyC6QGMfMhMSXqcoDiiILisA6A/BIhUT7KCrG1iW1A6gvo
	D80MAV6ejNHBDJqQlsPOWFWm095kE2tMQzZ0r6H59w+VQHnev3UmhmLj+IgRRyE7g3758dn3xqHDU
	922dA3SBFDKndt4m25YnLM9AaCZ31QdgY6XBv/OdOcrw7LtMAbpYMe5N/a0ZJcANP0pdfxPE8jbGu
	wPd8Ri/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x63kj-000000034sX-2woO;
	Mon, 14 Sep 2026 10:17:33 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x63kh-000000034sG-412p
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 10:17:32 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 51945601DB;
	Mon, 14 Sep 2026 10:17:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD7D91F000FF;
	Mon, 14 Sep 2026 10:17:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789381051;
	bh=YgwMSL2DfS6Z71Ol2dt2Xh64k0FHnIYhlRjZmBPc0hg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=lYDq+mGJqr9IgENqdrucgdgVBVO8BcmPTAGLx01IfET8Xw/MrpJTu8OLqtfTql80a
	 9WYWsD1y/tupjxF9WI8uuUuHBBlIs5EndFVgOL3SKxrqoXqJH1sIYXpKjV4n9Q/8Ic
	 4tqypts+zYeSQbcuyfbwUSHQGEdXAP5F+HoGDba6yXMRcB4WzfBl5ZwDpz+2yVH2Sy
	 c/Krj3PXqjzks5UNih2jJQNp/pkjtWNUfIJqWY+q3UHrV/hSSFPf4TpTjwmxIHI/e5
	 uXuwG4EncvwTu3gjbsngvHOmeXiylJf975/pj7GVjwOqnRkC/x7i1udR6YOmSzcU9x
	 TCpS6EUFzXJ4g==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 390AE1AC52F1; Mon, 14 Sep 2026 11:17:27 +0100 (BST)
Date: Mon, 14 Sep 2026 11:17:27 +0100
From: Mark Brown <broonie@kernel.org>
To: Carlos Song <carlos.song@nxp.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, Aisheng Dong <aisheng.dong@nxp.com>,
	Frank Li <frank.li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"moderated list:ARM/STM32 ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	LKML <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: regression in i2c-imx-lpi2c.c after rust-i2c-next
 merge (next-20260910)
Message-ID: <aqfJtxvw6MM6l9s-@sirena.co.uk>
References: <AM0PR04MB68023742F715A3BB3DEC1929E8BB2@AM0PR04MB6802.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="c6yA6j/BNL4mrRfs"
Content-Disposition: inline
In-Reply-To: <AM0PR04MB68023742F715A3BB3DEC1929E8BB2@AM0PR04MB6802.eurprd04.prod.outlook.com>
X-Cookie: My vaseline is RUNNING...
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


--c6yA6j/BNL4mrRfs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Sep 14, 2026 at 03:28:29AM +0000, Carlos Song wrote:

> The root cause is:
> Change to lpi2c_imx_probe() from this patch[1] was replaced back with the old logic during the merge conflict resolution(2edfbdfb8f9c).

> Could you help pick these missing codes back?

If you think there's a fixup needed for the merge please send me a patch
with that fixup.

--c6yA6j/BNL4mrRfs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqnybYACgkQJNaLcl1U
h9AZxAf/WfLXO+qKCuJZWHuf+qHA9f53nQcqvQKtj+NBJ4Eg7ut014zJbEMZBfAE
CXozba/agwGLQ1uUWk7qtmFuZlY6NKsutbJN4w1xyTYMgR9uJczv4D5rEouOcRPw
emAvd51FZrOUv5sN7Q7GYaGEHy+MZb16iU5Rvr52IMAZCW8mhks7VZQEWtoJ9juu
9RRsGZ31Cv1uZPN0v9nOrcIG9gVgENjW/SXuzcnkf8GfB92VF/VVK/F0zCERLahT
JCkQyCC2uvtASmkwMx7SYBiYJUGQbew6HwChABfS1cfTjTE62MjWi244Hp8+UNCF
X3UhcxFkhWtrwSDcbm4RZFnTKWvhpQ==
=j71t
-----END PGP SIGNATURE-----

--c6yA6j/BNL4mrRfs--

