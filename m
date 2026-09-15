Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 130E1C88E53
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 12:30:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TVtfbg9cLJPxe8CeCcpFkHFABq+D56AX0qqaWOp7cYg=; b=TZr22URqBJHmkrB0huB7oJfMiK
	fj4czqMe/l697kOo1ZCN4W3pSgFERNu5pwAlyHWe4l1H34pM6mqCnyvjJumiU7QVQF58noYrFWCrG
	Ms3a9/9MrUpWDwFNBvIpCULWGsUoN16xll7cqdw8MljLEmVh9Juqif11uOitV7gG78dY7wZ14qrfH
	liDKoQUe4HT8kCeJ0P9bBW5/BmEQvvjE1kDUS6t3/LNYshnXoQyI6f8WfaC+9A9Zpih1FT9qMeGHU
	Tok3AxUjGx54L3PCHHrpZOLYtQb4nznx1bxHHbvyuuiaAfYX2HkRDRHwCFE2jWdQMsii2INhjBA26
	N6h3BYeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6SJ0-00000006VUC-13wR;
	Tue, 15 Sep 2026 12:30:34 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6SIz-00000006VTm-1rGL;
	Tue, 15 Sep 2026 12:30:33 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E24B040E24;
	Tue, 15 Sep 2026 12:30:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF1401F000FF;
	Tue, 15 Sep 2026 12:30:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789475432;
	bh=TVtfbg9cLJPxe8CeCcpFkHFABq+D56AX0qqaWOp7cYg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dPT/trEtgWSwmvf4ssrot2pTPi+3EgP+7jA5SMylqsftSnb6kmNLGGkazcWzOosXn
	 2Vp9dIoTa0CGeivRWiRZ4hlOD2VqdxKcxSudldG/8P1XhIg97wh2pz23M9uJVMvEB7
	 ASJYBRFUgN1fzdHQpipXRRI5/LEKdxCMM0gEA/uGWM9OG0a4D8fU7Y+7+ZeYq2acLE
	 dOVIfk/G4mTIw4oiTQUQXmInZ7vyMxnafJMjD4hTtYqzoq2ZNKZlPvKZsSSKOaznzY
	 XI51RrUsrUic4xhyZKAv6MhvYZ5ItT2guPS0QlC0bSUhNYjVFAHqqoGLYCVM/6qLjS
	 mOs6uFUo48N2w==
Date: Tue, 15 Sep 2026 13:30:23 +0100
From: Mark Brown <broonie@kernel.org>
To: Hemanth Selam <hemanth.selam@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
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
	Masami Hiramatsu <mhiramat@kernel.org>, linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com, linux-mediatek@lists.infradead.org,
	linux-arm-msm@vger.kernel.org, linux-omap@vger.kernel.org
Subject: Re: [PATCH v2] ASoC: fix typos in comments
Message-ID: <63334ddf-5ddc-4a90-8244-98e38a0ea174@sirena.org.uk>
References: <20260904110315.11650-1-hemanth.selam@gmail.com>
 <20260915063206.519683-1-hemanth.selam@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="GiDgBwWwOzEOdFcQ"
Content-Disposition: inline
In-Reply-To: <20260915063206.519683-1-hemanth.selam@gmail.com>
X-Cookie: Void where prohibited by law.
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


--GiDgBwWwOzEOdFcQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Sep 15, 2026 at 12:02:00PM +0530, Hemanth Selam wrote:

> v2:
>  - Rebased onto asoc/for-next; v1 no longer applied against current code
>    (Mark Brown).

It's still not applying against my tree?

--GiDgBwWwOzEOdFcQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqpOl4ACgkQJNaLcl1U
h9Cpfgf/Q7YrQXQeaROc/u9unXenwWJLaxVPhJGgdjoufaOEw/YeQHHnC66FhF/H
n2skcounXBkPPvmeFnkoCeV+3ammQ+wWQv6HVL9CWdEYOKJYiesoS+u5WI9KNae1
hJyBQw0prpFKvyxuJKhv8aewBYknoowABWc/15HK8DjqQZPEw8gMzyCgZTJrb0IY
JxTznbOUKHxMr0U6Mi6HS0zVX1HIYkuzKJ3VlKK6IYUGpxtP8+ceFa9UXjg2p9oU
SrNghGQ8TeBx5GJ2h9Wkyv6bvXkX8ru2TV6WYgGo66bTvBCgV+1gAk3wrIWKPrdM
vkfSCtaDDZQT0SRZ7QrFHs8WOQJtaQ==
=0/I9
-----END PGP SIGNATURE-----

--GiDgBwWwOzEOdFcQ--

