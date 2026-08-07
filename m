Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B68BC5AD2B
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 23:05:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xbEIosNJCaP3EJaufvPQKfBBttV/sl6714LVS/JGpXw=; b=1vqjwcRBzHtQpQz29JfYc3CNSE
	bQAtJprpEjpq8NQDl+sHwUCvPQ9xzsU6ZFlYcAdBtOGMcYeufbWMlbac1fgHpUtKU6cyEXoemuPUU
	D5BqWlUzs0E64aSFGQzTKx15cZoLmKWXWCCulEX6CKjzJZA/uC98wH35lRZG4Hu2aiz1wlm6YG0wG
	74DtWOXeUPP4JR/1xKGFGCC1s+VgxA29KdTo2TgcZ92MdbfbU/y8N/9xcCkdzk29/hSYdUsRHAt2t
	nSNoISXFT1PuGMHsoTTKcmCNBcuAwv3i1+CBZU8ZFrwXw+1geEG5/IZ9gN94UcvbIWcvZHs9xSu1u
	DqC8wwYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsTcn-00000008quc-3r3z;
	Fri, 07 Aug 2026 23:05:13 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsTcn-00000008quT-0czh;
	Fri, 07 Aug 2026 23:05:13 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E29AE42ACA;
	Fri,  7 Aug 2026 23:05:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC6FE1F000E9;
	Fri,  7 Aug 2026 23:05:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786143912;
	bh=xbEIosNJCaP3EJaufvPQKfBBttV/sl6714LVS/JGpXw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=VwqO6m2qcciWO1XY1NfZtb2rO4Wi2HD/3rxLNplnQVdVr3HULoSTBgYytJgf5tpGD
	 X5+9/lTbvrH7wUmN9pt78eJdf7RF3RUjR86+eMhLHX8wm9MBpCflS6SP/QQnTLTMoe
	 henAyXF+wrDipKLLFdUh9Gw9I4400uvMTF4jjS776z/aZqijGqosP7pEwnPxY91Icz
	 PqI6qRYPq0hxtn0a4+LJOfrhxNLe5ciRIpaY7avuV8GP1tWRUc0K/g2KT0Wtk8NajX
	 JDIK58eFHSKt7qhigffnatg36d31+05ct1btkP0/etqSlhPFbKyJeWe8PG/ryy6pm9
	 wrkXOYIUUKnog==
Date: Sat, 8 Aug 2026 00:05:06 +0100
From: Mark Brown <broonie@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Cyril Chao <Cyril.Chao@mediatek.com>,
	Darren Ye <darren.ye@mediatek.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Rosen Penev <rosenp@gmail.com>,
	bui duc phuc <phucduc.bui@gmail.com>, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v5 4/4] ASoC: airoha: Add AFE and machine driver for
 Airoha AN7581
Message-ID: <645bcbb1-978b-40b9-84d0-a199b3a508d0@sirena.org.uk>
References: <20260807200936.201827-1-ansuelsmth@gmail.com>
 <20260807200936.201827-5-ansuelsmth@gmail.com>
 <8146f434-1e16-4ebd-80a4-b9c27bfa45af@sirena.org.uk>
 <6a7662b8.6220df5f.3c6b34.4460@mx.google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+3mYRGFLj7ilQ38p"
Content-Disposition: inline
In-Reply-To: <6a7662b8.6220df5f.3c6b34.4460@mx.google.com>
X-Cookie: 1 + 1 = 3, for large values of 1.
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


--+3mYRGFLj7ilQ38p
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Aug 08, 2026 at 12:56:53AM +0200, Christian Marangi wrote:
> On Fri, Aug 07, 2026 at 11:52:58PM +0100, Mark Brown wrote:

> > This should be more patches, the machine driver should be a separate
> > patch at a minimum.  Possibly PCM and ETDM drivers too.

> Sooo you are suggesting 3 patch? one for machine, one for basic pcm and one
> for etdm?

At least, yes.  Basically one driver per patch.

--+3mYRGFLj7ilQ38p
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmp2ZKEACgkQJNaLcl1U
h9DMrgf7BHtogqj4DSHF9g99FPOtRVrxmKPlNjM902FlH/JmKVE5cT5AUlEdMIQ7
tlb2+Cb8luOavgvtUzPhpSwp0lZGtxaZSrwYVDLQ/avH/L876i8ahADONr9XcJm9
fw9kzXqpPQn90bAqLJ5XXStskqeTBGfslEzZalKqyOPKbo1a/YukkhNyang7uhbr
UN6OQPbug8wEZ/xje38jzeeLDK9dsbnC+kp1npJ+hpjYSIc/hlOI7ya9nOQfOb5G
P9E2uaj0AieQJaWMS/3LE8BASMxYhczoUY0YCHqrhwnQur/I2uXJZ9u+yYB9RFaO
l9WJnfaItHWZy+vBcekpkTvFY4R/Xg==
=8gHJ
-----END PGP SIGNATURE-----

--+3mYRGFLj7ilQ38p--

