Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4191C88E50
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 12:07:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MXuvTorQodOS4EtPrn+Qo+LDicYNEi7CHhrrLuCObWw=; b=eqXOh1gEcRgmSQDVEp58udwNjl
	JmxoiPeYa7DWu7khNNRzINao8TYXcGTmx9EHAWDs3f+OmbfAZhgi4/JHOyYYz7a8axxObKurMAcjP
	xdibaw8oW9Bn6uuxQw+qVXuT9r/Hg/3OR3oW8CIzkJJGBcUtnNEzrG9FmyqkfI4PZiNwudbVk+OL5
	zw8KUc1e1lfGzvZvwpWLe9r+xigiubEYLImNfbqu7vIA7Fu3LEBTa5zYAaTO1KKRBkvX8illYmqIR
	B53djlRPjlaV8OwG5xi99E1k+++dMoNF/RSZnkTKqo8ZK88Auq/RBX3gi91XJSWPDcDOgEMSY03DR
	lUPkJluQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5029-0000000GZqs-1NuB;
	Fri, 11 Sep 2026 12:07:09 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5027-0000000GZqV-1LQm;
	Fri, 11 Sep 2026 12:07:07 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 76F5E60A57;
	Fri, 11 Sep 2026 12:07:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76E1F1F000FF;
	Fri, 11 Sep 2026 12:07:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789128426;
	bh=MXuvTorQodOS4EtPrn+Qo+LDicYNEi7CHhrrLuCObWw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=DmRGIjsh2aPIl/1QcnY120wrAXnsb894JdS/cgY8JAr7CBSnefcRCoZex1I5yutD6
	 JKb6ZlregLeDRytlnag7/8TtpGy+FuHdQ1Qyn/VjZ5kVID0oE+13UdgomMVhcd5xy7
	 LtZAuhYzqexYM0KgxqFCK9FyP/hIXylHF17dRaXqn2u/9DUoIS0HJy5BNFv5f2nqDJ
	 lM8zMs8xmZ65tX864dy9G6zrGWmTf+y29lq0b5JPlY44wknmOIxDIQUg8NPy+SMYBL
	 tfOJaPHHwpgBf2xTTkYnWoqpEw2RC8h4FhAQ7hWsSbbhB/gnkDOV4E4av9txvQSL3d
	 vKRCjUCDw9dcA==
Date: Fri, 11 Sep 2026 13:07:00 +0100
From: Mark Brown <broonie@kernel.org>
To: Bui Duc Phuc <phucduc.bui@gmail.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Cyril Chao <Cyril.Chao@mediatek.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Darren Ye <darren.ye@mediatek.com>, linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] ASoC: mediatek: common: Propagate control and DAPM
 errors
Message-ID: <3c0d7679-b352-496f-8254-9ed093b1753b@sirena.org.uk>
References: <20260910114338.142682-1-phucduc.bui@gmail.com>
 <2a553332-735e-4372-8d75-2ed7d095bfc0@sirena.org.uk>
 <CAABR9nGdsKvay_3Cd_Lm0DjU6MiFL0zaC+ftpgQGaX3YtVe+DQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5tR11EWl+LkcAth9"
Content-Disposition: inline
In-Reply-To: <CAABR9nGdsKvay_3Cd_Lm0DjU6MiFL0zaC+ftpgQGaX3YtVe+DQ@mail.gmail.com>
X-Cookie: Piece of cake!
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


--5tR11EWl+LkcAth9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Sep 11, 2026 at 10:00:39AM +0700, Bui Duc Phuc wrote:

> On a related note: do MediaTek or other hardware vendors typically
> provide development boards to independent upstream contributors for
> testing purposes? It would make it much easier for contributors like
> me to properly validate changes like this one.

Some might but it's not the norm.

--5tR11EWl+LkcAth9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqj7uQACgkQJNaLcl1U
h9BThAf9Fo+eBNlrnEZhwg4joxojjUQHlNk8Iq8KUhDWYkQFdP3nRgetm3zOyE2/
yz3VTHX6cVPMwbj/slZfi1iREPR+7nGCIxHQHBtYnBRJOUkR8CuiFffCTekyCn25
HgvR85pDb4sPjwMeIIkOYsJu3vltY6Qo12qcbFzxHpn8MuXpoF4L9nSPzXNwLfBn
aJ2OpyUUcj7ai0oHJxyJcPm2UYY1ILUIyNUbXKpJba+oQUPj85SHq2n/uxMq6Sxp
uIMfVeeJC0orUHrL1k/QtjUDnfnM2timr1a4EuWjSWrRrjT5IPabULX8a9fgv+Bu
5uNcGx8aEExMQWJvW9ke/aJps6F4rg==
=3Wkc
-----END PGP SIGNATURE-----

--5tR11EWl+LkcAth9--

