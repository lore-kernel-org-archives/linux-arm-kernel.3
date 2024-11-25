Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B184D3B7F5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Nov 2024 09:17:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9GV9acTwGZVF4LOThpVjy+zd4w+eaIwU3baLvbGzmrY=; b=y39prfpYF7JXqTN2Guhm+V9PoB
	Erz7mS92vl3zzH0RkxdKzwF59yDt/LMldSGMB/jGg5Vf3Sls7j4NmXtwa0tMgrzv89eEmCVxWNO7h
	4p1SSQAA995zQ0T6wGqh1UbR9hKT8G8rv0x60uZlmcDar4iQHl/p5FcTcxTDkZq6g/kj7efWCrO79
	C7Qdknukk9CWIbk1KBeJj4E2Ncikf9vMUfTowCPpkPLufE3RBXvqQpATEC7UXdNZ9d0/KotlcTWRA
	JtgRhfU3pSmoKpkvhrEf+p9of019m70/2TBTAkLnxTror9hXTMr5qK6vne6Cjrg6p/2KJpn9wfGAB
	7UqEyMHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFVDj-00000007X1b-2gl3;
	Mon, 25 Nov 2024 09:17:27 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFVBQ-00000007WTL-3vWf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 Nov 2024 09:15:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 2E05FA40EE0;
	Mon, 25 Nov 2024 09:13:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60842C4CECE;
	Mon, 25 Nov 2024 09:15:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732526103;
	bh=l2aVA8vVFVYNGR2zFgk1p6wGxiDGbMc6CYQeb4SKoOE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kl37uairFXYBbHHwAuIoo7e8D64bTeeB6knTN8A1trLOMdBpUtYBgYFtyfcdoVWsn
	 KZ3VBmmeHHFlSRdaS2cVFOBPoo2/imYXJUOutXGATw0ws2U8ELBoQJgkjc7noQJBSr
	 MwayUudDPpus4rsLnL3QCLiDH5rTHBYzGAtc8kN+v4xTZsFo4wmHqWOZNqaY+LgszC
	 O7ab83H6ZObm260B+cZoTijEaiRu7TLvj2kxCjdxzxLRE/2yKJEI5uHtjZ+sEQoDiJ
	 Xg/wyXNbnPhVsDnVY9aCeH6mYbSXx+URF+LSJuDTtG2duiwQ3+OumqtQzKDwbf/bXE
	 bnMYx/pnt2mHw==
Date: Mon, 25 Nov 2024 10:15:00 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>, 
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v4 02/10] drm/tests: hdmi: rename connector creation
 function
Message-ID: <20241125-keen-clever-quokka-c637b2@houat>
References: <20241122-hdmi-mode-valid-v4-0-2fee4a83ab79@linaro.org>
 <20241122-hdmi-mode-valid-v4-2-2fee4a83ab79@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="5nvxg2sjvsyk3e7c"
Content-Disposition: inline
In-Reply-To: <20241122-hdmi-mode-valid-v4-2-2fee4a83ab79@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241125_011505_101744_4786E5F3 
X-CRM114-Status: GOOD (  16.98  )
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


--5nvxg2sjvsyk3e7c
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v4 02/10] drm/tests: hdmi: rename connector creation
 function
MIME-Version: 1.0

On Fri, Nov 22, 2024 at 11:12:58AM +0200, Dmitry Baryshkov wrote:
> As pointed out by Maxime, the drm_atomic_helper_connector_hdmi_init()
> isn't a good name for a function inside KUnit tests. Rename it to
> drm_kunit_helper_connector_hdmi_init().
>=20
> Suggested-by: Maxime Ripard <mripard@kernel.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c | 58 +++++++++++-----=
------
>  1 file changed, 29 insertions(+), 29 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c b/drivers=
/gpu/drm/tests/drm_hdmi_state_helper_test.c
> index 1e77689af6549f162eb3026c7bd2bbd59516ed98..d81254d46975e8af0d7822499=
28217a1ebb7646e 100644
> --- a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
> +++ b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
> @@ -164,7 +164,7 @@ static const struct drm_connector_funcs dummy_connect=
or_funcs =3D {
> =20
>  static
>  struct drm_atomic_helper_connector_hdmi_priv *
> -drm_atomic_helper_connector_hdmi_init(struct kunit *test,
> +drm_kunit_helper_connector_hdmi_init(struct kunit *test,
>  				      unsigned int formats,
>  				      unsigned int max_bpc)
>  {
> @@ -247,7 +247,7 @@ static void drm_test_check_broadcast_rgb_crtc_mode_ch=
anged(struct kunit *test)
>  	struct drm_crtc *crtc;
>  	int ret;
> =20
> -	priv =3D drm_atomic_helper_connector_hdmi_init(test,
> +	priv =3D drm_kunit_helper_connector_hdmi_init(test,
>  						     BIT(HDMI_COLORSPACE_RGB),
>  						     8);

The alignment is off now. With that fixed,

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Maxime

--5nvxg2sjvsyk3e7c
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ0RAFAAKCRAnX84Zoj2+
dh+SAX9rgI2nb5O0z3ETsjtoX/QZlU3rBnbmhHEwAbJFUPMrzNJL44xVeCcncyF/
bnAChXcBf2C8MyZ3uQBADGQ2JpJlzrcAmW9SOPR3crnLIPFzw9SpjxX08GXSq9Fb
g9OOkGL/cw==
=MCsN
-----END PGP SIGNATURE-----

--5nvxg2sjvsyk3e7c--

