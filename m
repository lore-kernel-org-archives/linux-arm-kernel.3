Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E0ECC3DA4A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jan 2025 14:47:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jr+UhJKZsfyYjDO54OHmuicZ8YWvT6WtMPptE5N93Vo=; b=181vwWm26Oy/2Ab+y+ajOly61U
	l+hOCYeIIucnRztGT/RZUfyMSO9zvVQ57K4iH5y2r2VReFfKfrx8ixaRvYWgCkHcKNuRTW8cD98a4
	Pyp2HyWHFVomaBX1wvdGtIQFybE5y7peG61p48GTwfVA5jBpa49Bj1j5ycx28nKKaWVYftpLr8Kko
	SJ1m4xhqp7wWAkY3mUvJxd4fBC1VfG2/MLEqEqNhmoUlOUcfPyxHBlbvBtBcIm5UtGHkdR1o/b6+r
	R+3hfZkToUWKiL1DTLV+cz8+ZViIj0XXrQnGyS6MMcL8gAEAuptn7vsyVnua+ShrhpDfUb6ATNi4w
	gppPKoFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXiCj-00000008jbE-0Bbx;
	Tue, 14 Jan 2025 14:47:41 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXiAg-00000008j4L-1zwr;
	Tue, 14 Jan 2025 14:45:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id ED674A416A3;
	Tue, 14 Jan 2025 14:43:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96D8DC4CEE3;
	Tue, 14 Jan 2025 14:45:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736865932;
	bh=njLUbHodj+PkFFJbOpBXMJe/dUHzlPds6g689ssKjDA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ArLYPNP+SZ3jG9EoUmQe5FLLdIDakxwq6Q7RuSD32e73BsYYGiP0HGskwiYISsVk/
	 A4cN4oaepryylm2zcdyZvwXYmrLXtLEkSjmh3sypogzbKV5dGowGgn5utBYogoeqCQ
	 gGkaQY0DleA1JU9QhyMp3KQpXRHFHLHLiauaOSxLBjUzjflCEWHxRDD1Tr5JejWzfB
	 rDcIoXWLIpb1nRBKBBEyfnD3XWjNbkCB8L9qbqxDEpYrpu5k96LEAYFBhQj/kso8Re
	 cSId/vsSLtV+VWwQndcoz6njFJXIniqcEvPmIAynpF235AZiTHCOJKUOH9gpbPBxqK
	 RiYjQh2gbztFQ==
Date: Tue, 14 Jan 2025 14:45:22 +0000
From: Mark Brown <broonie@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Liam Girdwood <lgirdwood@gmail.com>, Phong LE <ple@baylibre.com>,
	Inki Dae <inki.dae@samsung.com>,
	Seung-Woo Kim <sw0312.kim@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Russell King <linux@armlinux.org.uk>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Sandy Huang <hjc@rock-chips.com>,
	Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>,
	Andy Yan <andy.yan@rock-chips.com>,
	Alain Volmat <alain.volmat@foss.st.com>,
	Raphael Gallais-Pou <rgallaispou@gmail.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	=?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>,
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: Re: (subset) [PATCH v10 00/10] drm: add DRM HDMI Codec framework
Message-ID: <078e2d2f-3bd1-47ed-b6f8-60f6913fdce9@sirena.org.uk>
References: <20241224-drm-bridge-hdmi-connector-v10-0-dc89577cd438@linaro.org>
 <173680655387.149204.17517246537828613856.b4-ty@kernel.org>
 <CAA8EJprDaOTEOYf5JHC7UYwqRn2vXUH9FT==HjZg1QNfDMmBcA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="nKWVI6A6JSkBavZP"
Content-Disposition: inline
In-Reply-To: <CAA8EJprDaOTEOYf5JHC7UYwqRn2vXUH9FT==HjZg1QNfDMmBcA@mail.gmail.com>
X-Cookie: Sauron is alive in Argentina!
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_064534_652197_F4AB836D 
X-CRM114-Status: GOOD (  13.75  )
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


--nKWVI6A6JSkBavZP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jan 14, 2025 at 03:45:15AM +0200, Dmitry Baryshkov wrote:
> On Tue, 14 Jan 2025 at 00:16, Mark Brown <broonie@kernel.org> wrote:

> > [01/10] ASoC: hdmi-codec: pass data to get_dai_id too
> >         commit: a8e792d3f0bbecb87ab05e9592cadf0b178ab952
> > [02/10] ASoC: hdmi-codec: move no_capture_mute to struct hdmi_codec_pdata
> >         commit: 5b0779ae13de345b405a67c71cbb63705cadb295

> Mark, they had your Acks, so they were picked into drm-misc-next.
> Would that be a problem?

No, the reason I applied them was because I was getting fed up of the
resends and figured it would be easier to just apply the patches so they
were in -rc1 and could be dropped.  I'll have missed any mail about this
being applied due to the drm: header.

--nKWVI6A6JSkBavZP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmeGeIIACgkQJNaLcl1U
h9BABAf/Rpl0QApU53vHkXku439fvk1W2JlcIkEhtO9wlYIsly+z2mnUMkCOSX4i
JLpb+GVB0L2TJAF1Y3HQ0ESBC6JzV7JzQiUqBkOTZEOQIXLdCu40xDg5coebNiS4
sw5DHqMiE7q3rAcXPCkkACdE+o+7S6CuIKgnMXuvMBcNUlNCcmbDEei/z3aSihs+
A/02s7UlSruEVd5UZv84abvqrMTVq963YEtAnbufnFJ/+xmJzqxzreVWOOMZFG3v
EmzqBpCq91RmV1JJ8gJe6RnmIfKn2PjesCresNQhoIQecqVkff5nZFIxu77C2vVF
UlobtBVzPrmFG8C//RkIpQUHCptnCQ==
=oDw/
-----END PGP SIGNATURE-----

--nKWVI6A6JSkBavZP--

