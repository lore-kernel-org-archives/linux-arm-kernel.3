Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A4E3E77184
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 17:29:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QXzUJkAz64sJ80IKvVtChQECu3WgfGbwg6qz2UoSbug=; b=mFhWr3sqKSJfxZgTE+04hI7kvR
	LgTvamFQsD9wHdHF5okkVIAtSCR3/M1BS2Yo3B8YSqa51X9sWZYgNup8o/B4UFfhC62JIUcaM9fBb
	2xobSZ6/3f1zBdXPnINp4Lwxx+6bOWHrrkP6Mo4xp12NukvuD7b0nMmRigZz1/UiUivFYa2m1LlEn
	16eACQ7ajiQ1gY7IHgQ+/ob8fqflAAOXwiz8UrZHYKMk550KE2T9Tqq9LWLeTymHLPoTIidUxrdc1
	PyFbdnQyOvdndL1SDWGa0jwIUWrBes/HHjVudeROaYyjff0y2bKFHUUXv68JtKAv6e0k2e94h1KG8
	n1mo12OA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNbNt-0000000EL4X-0tvD;
	Tue, 17 Dec 2024 17:29:25 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNbLT-0000000EKcR-3Fii;
	Tue, 17 Dec 2024 17:26:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 581E6A41EAC;
	Tue, 17 Dec 2024 17:25:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38FAFC4CEE1;
	Tue, 17 Dec 2024 17:26:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734456414;
	bh=QXzUJkAz64sJ80IKvVtChQECu3WgfGbwg6qz2UoSbug=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nx01bi8KPQ5AJUh6lfSaMQrMGjIyN+q1Qp6+yXCh7/Mxjb+e9bHvWRdzV01bcQ8y0
	 i8ie8Y/NujnlNqJR6Y9pQnvm4behKD90+LCnQbC7rjN6gAsUbcVHvZgt297Ygx/NSH
	 30GwVb6tMjglGjo9u4FXXLiexT9X6S37Id/RmjY443ItN75GMZqoxCIKhqxU5A6yFj
	 0+bxW/ndE2+NelqAMVC+iDVrSKoZx8v2aegJrGsfD17blbQlrsDDVfGKDwLo2PPwwZ
	 dCyxMXyalNc2iAForBQAY7TjKG2iI/uY7ShJXL1NPDXROQKWm0I644Vid7iSNOJELs
	 Ke78Dv/pbldFQ==
Date: Tue, 17 Dec 2024 18:26:52 +0100
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
Subject: Re: [PATCH v7 08/10] drm/vc4: hdmi: switch to using generic HDMI
 Codec infrastructure
Message-ID: <20241217-maize-jackrabbit-of-valor-3e7272@houat>
References: <20241217-drm-bridge-hdmi-connector-v7-0-cb9df2b6a515@linaro.org>
 <20241217-drm-bridge-hdmi-connector-v7-8-cb9df2b6a515@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="4ldlghaina2qyeiu"
Content-Disposition: inline
In-Reply-To: <20241217-drm-bridge-hdmi-connector-v7-8-cb9df2b6a515@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_092655_941903_F15616B2 
X-CRM114-Status: UNSURE (   9.91  )
X-CRM114-Notice: Please train this message.
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


--4ldlghaina2qyeiu
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v7 08/10] drm/vc4: hdmi: switch to using generic HDMI
 Codec infrastructure
MIME-Version: 1.0

On Tue, Dec 17, 2024 at 02:40:30AM +0200, Dmitry Baryshkov wrote:
> Drop driver-specific implementation and use the generic HDMI Codec
> framework in order to implement the HDMI audio support.
>=20
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Assuming it's been tested:

Acked-by: Maxime Ripard <mripard@kernel.org>

Maxime

--4ldlghaina2qyeiu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ2G0WwAKCRAnX84Zoj2+
djRwAX4lGsyzkJYk6ZmDuGmyZDppdqT1lnMIOP1B8pdj3PYKbBomfAOHn9pOprem
K1Sa8+oBfjriGqxsXserhLXCHtyjDN/PGYMspNa66DtZfqfMrAVAH3vy1OOE6Zc/
OH+fS4Gkbw==
=9Qa5
-----END PGP SIGNATURE-----

--4ldlghaina2qyeiu--

