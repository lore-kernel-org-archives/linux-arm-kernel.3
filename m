Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E08AE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 07:44:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qEQGDUcHqaQl3+MAk9zJRdPKW7FjBUTxyuaYs25BI8s=; b=SXMee94BSMiPpSyvfNsY8h2kQy
	MGxlavNnN/78tjhWyITqrO612E1LG1EReENGL4YO4Jn2XT2ufuKDqADyf4Ov73ZVeTjTVoh41Bpbb
	0reyIIRnU1ky5vIiPK8lsNjkprYuI+Kucp6yYuepCezQK0VVUNvVhmi1pX31C7XyhVgymsY9VM3Oz
	MTa6sqCEpXCoijhxrgKMEB/XQlX1Ruls4rLytDlt9ets2c7sYumeaQm/id7+rMHMQzgxMJrfmhRL6
	2B57i23XG2COBeKGcwZE5UI1qdcwBL0AYs4RpQIFWFVd91hTsaYcZMc2NtaI6Ii7mNiY8m8ri64g9
	8wxqVx8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNSFj-0000000Cc5f-1Ude;
	Tue, 17 Dec 2024 07:44:23 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNSEd-0000000Cbti-0SOV;
	Tue, 17 Dec 2024 07:43:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 22183A41E15;
	Tue, 17 Dec 2024 07:41:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A648EC4CED3;
	Tue, 17 Dec 2024 07:43:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734421393;
	bh=SFEB+1CioxLc5lMZKoURIeOpaioyZPe04X8yK/3CHYY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qgygh1jBZx5lw8SjMJZ9Rn89E9kJt7oapQfMySMCzPSBHCgBuwR0KzOWAzB51uN3c
	 DFJJcdWpUijv2S9WKbhoJTLFMnw/TcqLsu5f+u/7yuUVgx8eq6k1P3RVktd6ksDe9r
	 3KznClF/Fti3bWkP8h+V0dhDiQ7Kmfn+uvsey1jDZE5nv2DuAeGCNztZP5D18mHk93
	 EE6lfm4G8EkU3pUWUW93gmUoHmLrgxokZ7oLJWxRvx1PCwHnSvvTJa1WsGv2sBnKJ3
	 Di+eL1PIokZY3FnyLKS0DJF1ewNV7svRLMJRIZn0urB0dqfOOOgE7vxYn2sCjTERi+
	 5SngBCjqBp21A==
Date: Tue, 17 Dec 2024 08:43:10 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Phong LE <ple@baylibre.com>, 
	Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, 
	Kyungmin Park <kyungmin.park@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Russell King <linux@armlinux.org.uk>, 
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Sandy Huang <hjc@rock-chips.com>, 
	Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>, Andy Yan <andy.yan@rock-chips.com>, 
	Alain Volmat <alain.volmat@foss.st.com>, Raphael Gallais-Pou <rgallaispou@gmail.com>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>, 
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, Jani Nikula <jani.nikula@linux.intel.com>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v6 03/10] drm/connector: implement generic HDMI codec
 helpers
Message-ID: <20241217-heretic-hopeful-jaguar-aeabec@houat>
References: <20241206-drm-bridge-hdmi-connector-v6-0-50dc145a9c06@linaro.org>
 <20241206-drm-bridge-hdmi-connector-v6-3-50dc145a9c06@linaro.org>
 <20241216-heretic-mackerel-of-wholeness-fcfed7@houat>
 <exocd3b65cy6cy5w47cwx3ykn54ncf34hwyj7ffihs5jjzean5@y677uywnlah2>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="c4s3lijvuloytprp"
Content-Disposition: inline
In-Reply-To: <exocd3b65cy6cy5w47cwx3ykn54ncf34hwyj7ffihs5jjzean5@y677uywnlah2>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_234315_276823_CCE191D3 
X-CRM114-Status: GOOD (  17.45  )
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


--c4s3lijvuloytprp
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v6 03/10] drm/connector: implement generic HDMI codec
 helpers
MIME-Version: 1.0

Hi,

On Mon, Dec 16, 2024 at 07:47:32PM +0200, Dmitry Baryshkov wrote:
> On Mon, Dec 16, 2024 at 06:04:41PM +0100, Maxime Ripard wrote:
> > > +struct drm_connector_hdmi_codec_funcs {
> > > +	/**
> > > +	 * @audio_startup:
> > > +	 *
> > > +	 * Called when ASoC starts an audio stream setup. The
> > > +	 * @hdmi_audio_startup is optional.
> > > +	 *
> > > +	 * Returns:
> > > +	 * 0 on success, a negative error code otherwise
> > > +	 */
> > > +	int (*audio_startup)(struct drm_connector *connector);
> > > +
> > > +	/**
> > > +	 * @prepare:
> > > +	 * Configures HDMI-encoder for audio stream. Can be called
> > > +	 * multiple times for each setup. Mandatory.
> > > +	 *
> > > +	 * Returns:
> > > +	 * 0 on success, a negative error code otherwise
> > > +	 */
> > > +	int (*prepare)(struct drm_connector *connector,
> > > +		       struct hdmi_codec_daifmt *fmt,
> > > +		       struct hdmi_codec_params *hparms);
> >=20
> > Missing newline
> >=20
> > > +	/**
> > > +	 * @audio_shutdown:
> > > +	 *
> > > +	 * Shut down the audio stream. Mandatory.
> > > +	 *
> > > +	 * Returns:
> > > +	 * 0 on success, a negative error code otherwise
> > > +	 */
> > > +	void (*audio_shutdown)(struct drm_connector *connector);
> >=20
> > And thus we can probably just call that one shutdown?
>=20
> It should be called automatically by the sound system. I'd rather not
> call items directly that we are not supposed to call.

I meant that with my suggestion to call the function
drm_connector_hdmi_audio_init, that structure would be called
drm_connector_hdmi_audio_funcs, and thus the audio prefix in
audio_shutdown is redundant.

Maxime

--c4s3lijvuloytprp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ2EriQAKCRAnX84Zoj2+
dn+KAXsHF1Me3a69DjYay1zSH0/PHfBLCaIV8MGlbctx2pAUq5SnrvsJZ2avXBJl
7I+LlxABewcJcOkSen/hN0RxUNmpQaMQSHXReIonARDyzvaXra1BL1nAga4/ubzn
jeARugW3sQ==
=pdll
-----END PGP SIGNATURE-----

--c4s3lijvuloytprp--

