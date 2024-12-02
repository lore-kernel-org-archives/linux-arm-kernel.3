Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BBDAD7831E
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 13:31:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IFuzJvH4PIMX+deaMZ+guaAibbzaO5zIO5oFh6tcLBU=; b=m0LzGypo4zhUAiXlVbADKnjCnM
	hOcvNBsUIBv2G+jDeCNaqOGtErEB+fTe/54hS6IaQWlppTMdv+jpgREgcG1O9DpHEm/fQPMmZuEZv
	K4x3cgkCRdZ9LcrOpW+RRSz6e3NCAeS3uAjlPtZZKVC0QGhadmVdNoB08h2x9IR+QxxxqGUoJC8YH
	k2MHwP5zMRASIh/utFv0TO5CgamBSJ9Y6ajq4CRAAB6NEfGgHb7WyzzE0vLHMh8x9b5946ZweB7bl
	DKOAOQa6uRrTkDvyDSMH2pA6+K39d15TCiC3Lhi5bYprEsVu+eTYLAkNz2VHH2IilJCSzitN8R7jd
	wbhlCWNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tI6Vv-00000006FOb-3q6c;
	Mon, 02 Dec 2024 13:30:59 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tI6Uw-00000006FDJ-3q85;
	Mon, 02 Dec 2024 13:30:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1371E5C6886;
	Mon,  2 Dec 2024 13:29:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51F02C4CED1;
	Mon,  2 Dec 2024 13:29:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733146197;
	bh=IFuzJvH4PIMX+deaMZ+guaAibbzaO5zIO5oFh6tcLBU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bHgcUypCfrdNLakH2bqYiW0ildDMpheWqzKCa+y62SAz4AghZVigt18hhtFsQ4rR2
	 dLHI7FjFrIohgxcVHpVpkwFHVEvr6CIZUG+Qj/ECiB5UA7vh4EMWRLdZwoyZ3PRQZF
	 RLv2DUenJd6vBudiuowwN2jD+rK0uQX/vei8CE430FvFyPVtnqBQd4mKDlp0MdwRw5
	 o4IBdH3iDdrPdMg/3VGnYmxUxvTnii8HUwfTX6IkiQ8QGAm2vGrnbVTCE98pSSXp94
	 WM3XTFca56jw5Ji5mKYDEApBEBGSVNLhYPf7dj0ynfoMMI80Twh9Sxc9J+uNl+nieP
	 hdPQIWBZESVZQ==
Date: Mon, 2 Dec 2024 14:29:55 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Phong LE <ple@baylibre.com>, Inki Dae <inki.dae@samsung.com>, 
	Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Russell King <linux@armlinux.org.uk>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Sandy Huang <hjc@rock-chips.com>, 
	Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>, Andy Yan <andy.yan@rock-chips.com>, 
	Alain Volmat <alain.volmat@foss.st.com>, Raphael Gallais-Pou <rgallaispou@gmail.com>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>, 
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, Jani Nikula <jani.nikula@linux.intel.com>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v5 2/9] ASoC: hdmi-codec: move no_capture_mute to struct
 hdmi_codec_pdata
Message-ID: <20241202-daft-fervent-grouse-2c0cf7@houat>
References: <20241201-drm-bridge-hdmi-connector-v5-0-b5316e82f61a@linaro.org>
 <20241201-drm-bridge-hdmi-connector-v5-2-b5316e82f61a@linaro.org>
 <20241202-bald-just-guan-c5d41b@houat>
 <0d4dfb60-e2e6-484a-993a-41d1229c62fb@sirena.org.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="it6ftflrlpkoff2s"
Content-Disposition: inline
In-Reply-To: <0d4dfb60-e2e6-484a-993a-41d1229c62fb@sirena.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_052959_039091_835D7423 
X-CRM114-Status: GOOD (  18.87  )
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


--it6ftflrlpkoff2s
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v5 2/9] ASoC: hdmi-codec: move no_capture_mute to struct
 hdmi_codec_pdata
MIME-Version: 1.0

On Mon, Dec 02, 2024 at 12:59:22PM +0000, Mark Brown wrote:
> On Mon, Dec 02, 2024 at 01:06:09PM +0100, Maxime Ripard wrote:
> > On Sun, Dec 01, 2024 at 02:44:06AM +0200, Dmitry Baryshkov wrote:
>=20
> > > The no_capture_mute flag might differ from platform to platform,
> > > especially in the case of the wrapping implementations, like the
>=20
> > I appreciate it might be a dumb question, but I never really understood
> > what no_capture_mute was all about. And in that context, why some
> > drivers would need / use it, and some won't.
>=20
> It's just what it says, it's a flag saying the device doesn't support
> muting the capture side.

Right, but then HDMI is output only, so it still doesn't really make
sense to me why we'd want to mute the capture side?

Maxime

--it6ftflrlpkoff2s
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ022UgAKCRAnX84Zoj2+
dqo4AYD2N8isoa7QGodj2IWhhurOmFyzUFECqoeZtskkYpcwNSXcD3Ao0MXvyu7A
r4DsjfcBf3I/z2HcpsZ3eAjHa8zXr+DoWRZcMXUqApl0GPwHPDRNUD7vsFt6ewd3
Szeh1zbX8Q==
=Nd/9
-----END PGP SIGNATURE-----

--it6ftflrlpkoff2s--

