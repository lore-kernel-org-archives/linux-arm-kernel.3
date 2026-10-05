Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DFBCCA5FF0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Oct 2026 10:30:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VCdtdx1IUP8ShAtMruchd0VuoPIMEYgJy8nEzHLCc7A=; b=jMKCBKmOBfmJkF6WOEdufefZAo
	oU4rGd9Gt9C1ySp5wY4L0LCCaVNRJksCFlnw0msrELYuSLcEDIfjZYZyDyyaltVHFMjUd3GKcdoh9
	CP5R6uUPodZ3okEHlZtwgL3KHdBlx0/5zcn/3ShD2t+gkLM9EGjyneRDRl8YSzZ0s90HT13roKJJX
	nUHkvGwHPLAMpleCWUjr7h+e/bPaszgnv8lulgTBqLOoq3ozjK2NDF0YXBuGevaat2ifrIQtyWGL1
	B2Uy3Rc9eGtFd3HfG0F94rAoer9RGnlzT0P13iocGI/HsssEtJkMKd6zaFLyq/8duDdimJwCBzM6D
	xUMK80Rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDfxG-0000000GBFq-0WGj;
	Mon, 05 Oct 2026 10:29:58 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDfxC-0000000GBFG-2b7p;
	Mon, 05 Oct 2026 10:29:54 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id F1B9B41E47;
	Mon,  5 Oct 2026 10:29:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D6B91F00893;
	Mon,  5 Oct 2026 10:29:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791196193;
	bh=VCdtdx1IUP8ShAtMruchd0VuoPIMEYgJy8nEzHLCc7A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=EdQS5stBnMbPXiRcjd4FuvNTHjketIOyyw9D0JFaCumzZVZiPnWrOaetdc0vwicTZ
	 4ecyytPDbThwviIHN3oPcSx7ugGG8y0+n3Q/LUP81tbL8TKA8vaD1sjs+YzooUfQkr
	 QEHqbcZY1L+tqfXgoHMx3QH6mexfus4vVuLQdiat3S3MRgvJTVs9x1rKucNaTyHOLZ
	 EsJj7+hSjix2AZc8cSImvumDcXgb2r4IZuFLVbqUonmICQ1030jKOs9wd9fCMtAvDJ
	 MAPeT2YO2zSUymyPUW7hae8tlv8bhEW/FzW24KWRF6xS8BUOdd1hbW9/yVaUTMnBq1
	 j1Hq7F9YL/EwQ==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 537931AC57CE; Mon, 05 Oct 2026 11:29:51 +0100 (BST)
Date: Mon, 5 Oct 2026 12:29:51 +0200
From: Mark Brown <broonie@kernel.org>
To: Bui Duc Phuc <phucduc.bui@gmail.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Trevor Wu <trevor.wu@mediatek.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	cassiogabrielcontato@gmail.com,
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Haotian Zhang <vulab@iscas.ac.cn>,
	HariKrishna Sagala <hariconscious@gmail.com>,
	linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 06/14] ASoC: mediatek: mt8195: Fix FE startup error
 handling
Message-ID: <asN8HzfxSHmBjfu1@sirena.co.uk>
References: <20260925044908.450775-1-phucduc.bui@gmail.com>
 <20260925044908.450775-7-phucduc.bui@gmail.com>
 <asKt42FgsbhSbQUP@sirena.org.uk>
 <CAABR9nFyEJBwXP=4SjuGNfGQJub2y_DPE87c6j6BPmqMBgjESA@mail.gmail.com>
 <asNbjSrPYVbeqSae@sirena.co.uk>
 <CAABR9nEXM1OSnV6L4=N1YCbtWn5yMNr+OMEZ4p8h3WMaQXbgmA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="cO30F3djDKDguik/"
Content-Disposition: inline
In-Reply-To: <CAABR9nEXM1OSnV6L4=N1YCbtWn5yMNr+OMEZ4p8h3WMaQXbgmA@mail.gmail.com>
X-Cookie: You will forget that you ever knew me.
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


--cO30F3djDKDguik/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Oct 05, 2026 at 04:36:37PM +0700, Bui Duc Phuc wrote:

> On the core side, snd_soc_dai_startup() only treats ret == 0 as success:
> it calls soc_dai_mark_push() only in that case.

> Is a positive return from startup intentional/allowed?

It shouldn't be, no.

--cO30F3djDKDguik/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQReagvpf3TrrA7BoYYv73Ows9A4iQUCasN8DAAKCRAv73Ows9A4
ia6oAPwKWuMtsVlLKHYETHbUSa6bMxHSYmnL0pqfug21qnTy2AEAm5OXh1XSYpqm
8UdNRFdnbnPy7SX5g/RLbguKIMWCBQA=
=Obcm
-----END PGP SIGNATURE-----

--cO30F3djDKDguik/--

