Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 964C7C88E73
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 19:43:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Dt5w1Pn+88+/6QbLVYWGwITkkmR85KAahvz0h2yQbyk=; b=1YjlhFWGWvmyvHAxkiLYmlWtmW
	HAeyRCvXEBmwIjdPAWhJOuoqQoJlYi8+hOUWHJAkk3ENgIfWFUtp/Oyf2RSCylZZEGNn55d9R3dAi
	h9ghUpCwhkhkCoVp3lxLbW9KlX/PeRQwkLRcF5jOZx3H99cD0Q6UPM33NuUUkZMu7AwLuqaApUuN6
	0Da0gMjzx5nYrDV/iuLQlXd6+qpovo5W20m5eH4EpRkkIb4ETdA2h9HxYSU0JP079+mN9vFGP97EB
	k9a2cP723UfGugFqBYG8XwHmwiuxJ6CAAuBnGX75tumxbvfcY6/pU/gTva6BlTW1/UysIoYrTYT9W
	Mlf2X1ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Bpd-00000004UdP-3GPW;
	Mon, 14 Sep 2026 18:55:09 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Bpc-00000004UdG-0di7;
	Mon, 14 Sep 2026 18:55:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 032AC60142;
	Mon, 14 Sep 2026 18:55:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 615D61F000FF;
	Mon, 14 Sep 2026 18:55:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789412106;
	bh=Dt5w1Pn+88+/6QbLVYWGwITkkmR85KAahvz0h2yQbyk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=avwicQJnNlv4NY+cCLzYzlQzvtXGDzbl0SG7/oFzAQKdUDlB8xcYXpO3FmXdq9VIe
	 zA3CmeKjc9Jdf5PEjbDCLE7bCZlIs2inTwCFif0kJic+F0O9hiUyISjRU+uelz1xYz
	 /dbsbWPxfkYVe5v/6m7mgo5+dy2XDTGTW9C+VdEWOd3OWsozb7A3kNlueXPo9UNoOS
	 4FP0ZIeq2WeYGUuuuCe76ybcZB/6lgLvwODHPefhsCpKQir+H3kp0xyZwY9O5pgem5
	 Aaq93jDqfXzQQZeW39jKcA0i+G2ukQo8j423D+NNHqdlHROAuxLeWWcsOWwTIxhD6T
	 GMYpdgv3oV6uQ==
Received: by traversing.sirena.org.uk (Postfix, from userid 1000)
	id 6BA11FF4DAC; Mon, 14 Sep 2026 19:54:39 +0100 (BST)
Date: Mon, 14 Sep 2026 19:54:39 +0100
From: Mark Brown <broonie@kernel.org>
To: Hemanth Selam <hemanth.selam@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Andrei Simion <andrei.simion@microchip.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Support Opensource <support.opensource@diasemi.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Oder Chiou <oder_chiou@realtek.com>,
	Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Srinivas Kandagatla <srini@kernel.org>,
	Jarkko Nikula <jarkko.nikula@bitmer.com>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	patches@opensource.cirrus.com, linux-mediatek@lists.infradead.org,
	linux-arm-msm@vger.kernel.org, linux-omap@vger.kernel.org
Subject: Re: [PATCH] ASoC: fix typos in comments
Message-ID: <aqhC72HtZg6vZwlb@sirena.org.uk>
References: <20260904110315.11650-1-hemanth.selam@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+R8ajydSb1j5T0kw"
Content-Disposition: inline
In-Reply-To: <20260904110315.11650-1-hemanth.selam@gmail.com>
X-Cookie: Orders subject to approval.
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


--+R8ajydSb1j5T0kw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Sep 04, 2026 at 04:33:01PM +0530, Hemanth Selam wrote:
> Fix typos in comments, reported by scripts/checkpatch.pl using the
> misspelling list in scripts/spelling.txt.  Only touches comments, no code
> changes.

This doesn't apply against current code, please check and resend.

--+R8ajydSb1j5T0kw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqoQu4ACgkQJNaLcl1U
h9BQngf+NrKbIDQswDCVtp+p2+16s8VA4komgI1mJwvGX/l3TCUsL9LCubDyEiJT
MFMcRlrtytBdb0B5Im6RKBIWJZaH+traqJYXu2n9J/Og95j4v42wm4LoXkXG+52n
hMDKyEctBPWrG9zn+kKJ1r5azQYZ+ZpyMVbJE2KO7wWOpHEXpBu1/x9nZMVl4JK1
ACL5+4S4QJlPc9rY0c3BhOi7nIHmBD67gjYbv3aQ2yTskcZrbwwRySAJgXXVEkuK
t/ekOauEuhMj3Kj4rslRddyVgJaulJSlC9TvCRdHsKUlVZ/a1+Zymt/MbzJWQNcb
FYQj7jL/7dJkHDDVC1Ah1qRWVbr/ow==
=ob1K
-----END PGP SIGNATURE-----

--+R8ajydSb1j5T0kw--

