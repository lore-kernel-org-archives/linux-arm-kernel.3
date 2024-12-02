Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E381D78318
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 13:00:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VkSc1OtoaIn5i9sUO8D5w8KXAZHM0RoZXTyJeEmffRA=; b=sZtab5CVeAFMLGAHtISmk/z03U
	VuBFKcG3B8UlpTQpfrEmfMUp4HAqlJ6F3AUdWBU7cpSjS5JCdaayFI//2u1Y4PyetxHCZ6KoDuj22
	8ZYobjlDp0484E/er88+QFH+/fWLg73hUSodDqlKhm5+EY1t3Occ8fPtJsubl0ePaMr4zltcm1rqt
	j1mFTfMduO7kT+FRqbMzf/JPGBQ/n8H/v+K9tIHenB9n3Sq/o1psmruAbrsocKD4KAiR5PcsVtGFq
	+5bxQ+UMW1qXHFrVNXqRQ3XZOd9ykjKxgP53s0pitFLtvKqxi+cK4R3pbCYOYRZkU3Vw+8D2EmoS7
	Q2I4Umow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tI62V-00000006A2M-2laN;
	Mon, 02 Dec 2024 13:00:35 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tI61W-000000069r8-2uvl;
	Mon, 02 Dec 2024 12:59:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 31DA5A40C41;
	Mon,  2 Dec 2024 12:57:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B027C4CED1;
	Mon,  2 Dec 2024 12:59:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733144373;
	bh=VkSc1OtoaIn5i9sUO8D5w8KXAZHM0RoZXTyJeEmffRA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DuPBiKxEPZ8hNvu7XY/JeqC22rHjoWHz8J4L9ZjAqJtP/ZLUdfnH0N2+6JuEuZYNS
	 gjprWPIBrGlbdvouN6ch2AhZJMsdRbpxm/XHYH7Ho2mFhiflGP5NqBIWRyRQr63KY2
	 dyNZ68wkucnwrhDO/niHJsWMeQYK/FBimmPHVagPS++j3LqGQLD84gN2MFTKCcmPvF
	 SULgGPyKftHpxm0Puw/mC6m8e4zYDC68fIdm+wmU0/Zy+PXryK15FE7G1HF7Mzv9Dr
	 DsaxcNzS0UEF+9JnnxJwAPupFgzMBwuSdklY8POOK9d0BHjmTUZCn3XBYh6+RBj7nK
	 kPkHTUy0duybg==
Date: Mon, 2 Dec 2024 12:59:22 +0000
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
Message-ID: <0d4dfb60-e2e6-484a-993a-41d1229c62fb@sirena.org.uk>
References: <20241201-drm-bridge-hdmi-connector-v5-0-b5316e82f61a@linaro.org>
 <20241201-drm-bridge-hdmi-connector-v5-2-b5316e82f61a@linaro.org>
 <20241202-bald-just-guan-c5d41b@houat>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="26+IIHuKp7C8Awjo"
Content-Disposition: inline
In-Reply-To: <20241202-bald-just-guan-c5d41b@houat>
X-Cookie: (null cookie
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_045934_866026_1319DF71 
X-CRM114-Status: GOOD (  15.46  )
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


--26+IIHuKp7C8Awjo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Dec 02, 2024 at 01:06:09PM +0100, Maxime Ripard wrote:
> On Sun, Dec 01, 2024 at 02:44:06AM +0200, Dmitry Baryshkov wrote:

> > The no_capture_mute flag might differ from platform to platform,
> > especially in the case of the wrapping implementations, like the

> I appreciate it might be a dumb question, but I never really understood
> what no_capture_mute was all about. And in that context, why some
> drivers would need / use it, and some won't.

It's just what it says, it's a flag saying the device doesn't support
muting the capture side.

--26+IIHuKp7C8Awjo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmdNrykACgkQJNaLcl1U
h9BXlAf/b2RCOldUO9D2uv21dvLwptK8t/qpPmm6L0SGtwbwCyejExyCcRcXDK2J
6VM6BCDUGEH5VIKVo2XFEHzhQi8F4jLnCmdzgwi2kI4Lca8lWjQq/4OwiLPalaeg
0TNUGBy91LjyXlGGoUoweRt8oc0VbsYIr0gEQayLOLfYujv4RiiWYEyIcw1OPDf1
9MigRjCV1msQQXnBP2qTdZ1FrZQlZGD+syITQuFbYrmy+sqwEPxbY9/RYtHo4HBV
A8CBOIE2YuK7W8Dk9VXSPQsN1sSwT3Hj8xvMO0Ka3mK/WjSVva2P8/K3wnBXj9nC
6yKMam1wXDa8AU52tCUq2bS1snS2yA==
=5ZI+
-----END PGP SIGNATURE-----

--26+IIHuKp7C8Awjo--

