Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C56D9C3ABAA
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 May 2025 06:25:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iWn8JZShYjEU+YseGeqgP1A4WVhs4RXna/GZr56puvo=; b=HP6/7aZswbafVULHqKSvJwNO3w
	cqo7/eLVcKuIyOlQNlwBkwGSRR61sep1HklWR0c2KZwirQzx4dInKSYu89fY3tKPj3dyhU/BmrnhC
	7fcaW+TeOs+vpxSk8Pkg/joMZ4mqdxZ8k7J8rHe6LFBqLS3K1Tc+1wA8sxfxtyRlm/BWyPcY3EwZK
	vZU7hFtLIf7CdXyWrCEdLiaqaj40sNXiELXupccexHLR56nJ9//0cJGPhh3cd+MknIvVqrnrXEBG7
	Sfe6I4bGFJ4yQFnCHbRC0xoce8mepFelx8KtNoOXPuRenmbkOmrXfEGTk4o3teRyuEmy6v09cmyvr
	x8ame1Ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBpGh-00000006WDp-2VEi;
	Mon, 05 May 2025 06:25:35 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBpEh-00000006VyT-0bHD;
	Mon, 05 May 2025 06:23:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id ACAA06112E;
	Mon,  5 May 2025 06:22:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 076EFC4CEE4;
	Mon,  5 May 2025 06:23:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746426209;
	bh=blz46dfKcTkqUU1mdHuxtQzWM8gPcsEOF9yJwSPZQjo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=koamshTJSZ1WF/eCcwZGiyDpkwsaCADLfvS3QwjV5PotkB/YOwWC8XyuJVSsdLCIk
	 /4Jtd7bMz2vmYsMNWmf/X4Sis4kqCPIcH2Wo9nzKbUDCdEWEjPm99kDdRKffgOIfVC
	 GO8aK9v8GOt73LRnb9Tey6JAPxRlvzcCyhCmmdVLeIQZNUJGxNU4jtNLGVqIHj+dbm
	 MEpwGnq7vCW5rHYuMgB1xOP/tAAjfa3OIH4mb6zlf/o2UpzxgLckv3VDuOX+zXChXs
	 TEqMARo/LYFzdXeUg1+VrFmrPwI3ZjNDFpR2bMvYWKsJuqvZsxTYKkHx5l6dtCp9Kp
	 s2eAL5PrUzyBg==
Date: Mon, 5 May 2025 08:23:26 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Jagan Teki <jagan@amarulasolutions.com>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Douglas Anderson <dianders@chromium.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Anusha Srivatsa <asrivats@redhat.com>, 
	Paul Kocialkowski <paulk@sys-base.io>, Dmitry Baryshkov <lumag@kernel.org>, 
	Hui Pu <Hui.Pu@gehealthcare.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	dri-devel@lists.freedesktop.org, asahi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	chrome-platform@lists.linux.dev, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-renesas-soc@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH v2 34/34] drm/bridge: panel: convert to
 devm_drm_bridge_alloc() API
Message-ID: <20250505-beneficial-fossa-of-weather-67c676@houat>
References: <20250424-drm-bridge-convert-to-alloc-api-v2-0-8f91a404d86b@bootlin.com>
 <20250424-drm-bridge-convert-to-alloc-api-v2-34-8f91a404d86b@bootlin.com>
 <20250428-wild-condor-of-defiance-cadf60@houat>
 <20250428172516.79058e22@booty>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="fxb23j2izsboyssh"
Content-Disposition: inline
In-Reply-To: <20250428172516.79058e22@booty>
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


--fxb23j2izsboyssh
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 34/34] drm/bridge: panel: convert to
 devm_drm_bridge_alloc() API
MIME-Version: 1.0

On Mon, Apr 28, 2025 at 05:25:16PM +0200, Luca Ceresoli wrote:
> Hi Maxime,
>=20
> On Mon, 28 Apr 2025 13:39:23 +0200
> Maxime Ripard <mripard@kernel.org> wrote:
>=20
> > On Thu, Apr 24, 2025 at 10:05:49PM +0200, Luca Ceresoli wrote:
> > > This is the new API for allocating DRM bridges.
> > >=20
> > > The devm lifetime management of this driver is peculiar. The underlyi=
ng
> > > device for the panel_bridge is the panel, and the devm lifetime is ti=
ed the
> > > panel device (panel->dev). However the panel_bridge allocation is not
> > > performed by the panel driver, but rather by a separate entity (typic=
ally
> > > the previous bridge in the encoder chain).
> > >=20
> > > Thus when that separate entoty is destroyed, the panel_bridge is not
> > > removed automatically by devm, so it is rather done explicitly by cal=
ling
> > > drm_panel_bridge_remove(). This is the function that does devm_kfree(=
) the
> > > panel_bridge in current code, so update it as well to put the bridge
> > > reference instead.
> > >=20
> > > Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com> =20
> >=20
> > This looks fine, but we need a TODO entry to clean this up later on, and
> > a comment on devm_drm_put_bridge that this is inherently unsafe and
> > must not be used.
>=20
> Ah, I see, OK.
>=20
> Quick draft:
>=20
>  /**
>   * devm_drm_put_bridge - Release a bridge reference obtained via devm
>   * @dev: device that got the bridge via devm
>   * @bridge: pointer to a struct drm_bridge obtained via devm
>   *
>   * Same as drm_bridge_put() for bridge pointers obtained via devm functi=
ons
>   * such as devm_drm_bridge_alloc().
> + *
> + * This function is a temporary workaround and MUST NOT be used. Manual
> + * handling of bridge lifetime is inherently unsafe.
>   */

That part looks good to me

> and:
>=20
> -	devm_kfree(panel_bridge->panel->dev, bridge);
> +       /* TODO remove this after reworking panel_bridge lifetime */
> +	devm_drm_put_bridge(panel_bridge->panel->dev, bridge);
>  }
>=20
> Does it look good enough?

That too, but I was talking about an entry in
https://www.kernel.org/doc/html/latest/gpu/todo.html

Maxime

--fxb23j2izsboyssh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaBhZWgAKCRAnX84Zoj2+
dmbVAX4gMY0F9VXdFsIIKKBjn5Ev2tMwW+uv6doEaqoNJIEat9dVa/bvOYl9n6tm
ZNZ29HABeQEtltAKrypsuFB4FFzNPiZADC9MB5moran2psvsF2a1chXqCjrK2xyp
FQXpVqx4qw==
=pRS+
-----END PGP SIGNATURE-----

--fxb23j2izsboyssh--

