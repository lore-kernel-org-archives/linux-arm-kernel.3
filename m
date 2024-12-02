Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC829D78321
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 13:41:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LPw13BPxd7XHqSIBSbW2aDnWNRRtsfeLNYIXzAdMOso=; b=n2otKWaDaM5Od7ygFpaSdFYno+
	0HqqyyPVEpEyL/sJsyNkh4mNNBW1wG7FQl2PSHzFsvhCF2grq1PZp6xPy2WFJTpCqUCyHFyOo4Gck
	Su9hlrmqgeQQUWkRw47VFiuBikFhH5Qf3NAYKJjqG8baziH1oQ8kJ5Wx8GKcBD7dM+dzz24aVGEEr
	TZa0ANKzB9Rzr3pRzuaW/P+iT6ACz3SEwfkJTutj6Z1Gb5HPl9jseZR8ZkUC1lQM/MjXXH408Sptw
	MWp0Px/QZBGD+Ed4hjM+L1ZVnov7gua6GQ5xsKneYVdZYdyqNCxb/XD1G6N5GgKV+MRhP71M5idHq
	bB8YXb7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tI6gB-00000006HFN-2Z53;
	Mon, 02 Dec 2024 13:41:35 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tI6eo-00000006GlL-1EEt;
	Mon, 02 Dec 2024 13:40:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id BB4B0A40D37;
	Mon,  2 Dec 2024 13:38:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB0F6C4CED1;
	Mon,  2 Dec 2024 13:40:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733146808;
	bh=LPw13BPxd7XHqSIBSbW2aDnWNRRtsfeLNYIXzAdMOso=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tdXrnYBH6FFjeIjzud5NsZpdsNDvf7MHSH5RpHzOAo2l3Mjux9miEWAJjdlNOMpo2
	 1Kz7jRB+lhXqqrQCQETXJ4wusDkwMnM1PEka/yW3pYyw/1ddv7bbFmcvG3eltuk9Oc
	 yW7oa8jioaRh6pIHhtQe7Z8bZJYdZrlQajiBlZcX3O6oyBcaCu/Is5cyi6EYA2h+7a
	 hMURtU/5Wn3d1sNE5u+EAcsjTBNoab74/oioao/sc3Yxlsartyy5U4xOPTSjAOf9X8
	 Yw1H3dyhAX1iLPR+q+Qzgi+2dnmLyR32975lUXdVlES7g0MSsrbG+AHLlgXGNV5KVc
	 cfuo68OLMh9ZA==
Date: Mon, 2 Dec 2024 13:39:58 +0000
From: Mark Brown <broonie@kernel.org>
To: Maxime Ripard <mripard@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
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
Subject: Re: [PATCH v5 2/9] ASoC: hdmi-codec: move no_capture_mute to struct
 hdmi_codec_pdata
Message-ID: <8a6bb3c4-73ee-4608-a59f-1590f52b8db4@sirena.org.uk>
References: <20241201-drm-bridge-hdmi-connector-v5-0-b5316e82f61a@linaro.org>
 <20241201-drm-bridge-hdmi-connector-v5-2-b5316e82f61a@linaro.org>
 <20241202-bald-just-guan-c5d41b@houat>
 <0d4dfb60-e2e6-484a-993a-41d1229c62fb@sirena.org.uk>
 <20241202-daft-fervent-grouse-2c0cf7@houat>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3+lNg7eZO9lVqR5n"
Content-Disposition: inline
In-Reply-To: <20241202-daft-fervent-grouse-2c0cf7@houat>
X-Cookie: (null cookie
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_054010_463773_9AF0FEE9 
X-CRM114-Status: GOOD (  21.71  )
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


--3+lNg7eZO9lVqR5n
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Dec 02, 2024 at 02:29:55PM +0100, Maxime Ripard wrote:
> On Mon, Dec 02, 2024 at 12:59:22PM +0000, Mark Brown wrote:
> > On Mon, Dec 02, 2024 at 01:06:09PM +0100, Maxime Ripard wrote:
> > > On Sun, Dec 01, 2024 at 02:44:06AM +0200, Dmitry Baryshkov wrote:

> > > > The no_capture_mute flag might differ from platform to platform,
> > > > especially in the case of the wrapping implementations, like the

> > > I appreciate it might be a dumb question, but I never really understood
> > > what no_capture_mute was all about. And in that context, why some
> > > drivers would need / use it, and some won't.

> > It's just what it says, it's a flag saying the device doesn't support
> > muting the capture side.

> Right, but then HDMI is output only, so it still doesn't really make
> sense to me why we'd want to mute the capture side?

This is an ASoC patch and you didn't mention where the flag was...
there's going to be HDMI capture hardware I guess?

--3+lNg7eZO9lVqR5n
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmdNuK0ACgkQJNaLcl1U
h9BdEAf9HK4EDgrVNfcv0E00Pk4tgBmushLydSQ4M197p6K6qrBg9uVaMSpUWEP3
haScBykJfEBLMuyzWn5Pt5DIQSL1snfw1LKSZcLI6rmjXj3gi2RR9as/xrdlqJzF
omrNsbXdAPCQtKk+HU4NAnhiARLKDFJ/SSF6J3exNcwro7WQl6+5BWF7ZOGr04GU
eGf8TTSw4whQBQQuDh287WvJNCPYNtptohaiFFAtxozv+gwI9ik6dE1el/l/3dAl
iO8/iyIxmHO32eJ4oRf2h5sExtYG36AdN96q9JnEGs712ZK+nX5tWeW0BGFqnict
SsAH3aFhLULXn2ijgLvXrqaH4A3kMA==
=HKwN
-----END PGP SIGNATURE-----

--3+lNg7eZO9lVqR5n--

