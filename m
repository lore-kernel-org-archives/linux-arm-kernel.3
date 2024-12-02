Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DB92D7830E
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 12:01:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uq6P50nPVqYzYznK6CDOgelQtYASy802lUz2VNa3X4k=; b=jJ7dJiu4AiXkMEcWKGi890gNiy
	/a0y9oVffaG75rjSC/XDBFEX9MjN8xjrJKOu4L6oxHpvZAxh/BpKkJhlUIuUxlsD/h72Spz8E67ZV
	U5k1X/Am3QD5Ym6gw0yT2V2+Jp2o4EL6fkK5n4FYvekxWo+CKT2Ie/SjVBstO7IH55we0ASqne8X4
	/44gy7z9nBzd+xDjDDXDMRKyIeZr6Pw5gaNRG3u7xy4izEtJ+eZdI867pnDU5WnMdwqvhMiBceLuq
	ViCoN7O/JUbwjIO57kFGUx3pDP4tbL5DUUhk7Eo7wmuQXyWV/DfJI2YRdxSf/jf62AMF3DEOR0F4Z
	sRp99wow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tI57I-00000005z8x-3t9F;
	Mon, 02 Dec 2024 12:01:28 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tI56J-00000005yu0-0vYZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Dec 2024 12:00:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7E8635C6468;
	Mon,  2 Dec 2024 11:59:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89875C4CED2;
	Mon,  2 Dec 2024 12:00:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733140826;
	bh=uq6P50nPVqYzYznK6CDOgelQtYASy802lUz2VNa3X4k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YNJkDSvbo8lkY9GLqT/hIrlkLQ08AZHdWUxs5r6bl3m2EBQ5pBgHM/mjPWR+I6JMf
	 WHkFLn1IDnuQbsHQe0nadbr8vKz3xRW21XdUSdb4xT+i2Zor5fgGmzAoSEMfYcJPEX
	 fwGe0wsbkhNxUqOwQeGiP8NfPPrneSL6Q9Sw24mlIlLforIDucg4Oz6evGeFxOliV0
	 MWA8nqkra3Zn8VhWEpF06jAI0MaT8iKhzitPgCHIdv1qO0FwMpYUOE7uBvzD2uekk0
	 +LA/RyRMTlyePXs6iJYth+3uw/OLHT4f3rvhAG9K2jgL+C9JqGuyzaknOpMmRTdq0t
	 0COIRkOoz/T+w==
Date: Mon, 2 Dec 2024 13:00:23 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Alain Volmat <alain.volmat@foss.st.com>, Alex Deucher <alexander.deucher@amd.com>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	David Airlie <airlied@gmail.com>, Harry Wentland <harry.wentland@amd.com>, 
	Inki Dae <inki.dae@samsung.com>, Jani Nikula <jani.nikula@linux.intel.com>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Kyungmin Park <kyungmin.park@samsung.com>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Leo Li <sunpeng.li@amd.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Marijn Suijten <marijn.suijten@somainline.org>, =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Phong LE <ple@baylibre.com>, 
	Raphael Gallais-Pou <rgallaispou@gmail.com>, Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
	Rob Clark <robdclark@gmail.com>, Robert Foss <rfoss@kernel.org>, 
	Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
	Sean Paul <sean@poorly.run>, Seung-Woo Kim <sw0312.kim@samsung.com>, 
	Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Tvrtko Ursulin <tursulin@ursulin.net>, Xinhui Pan <Xinhui.Pan@amd.com>
Subject: Re: [PATCH 00/10] drm/connector: add eld_mutex to protect
 connector->eld
Message-ID: <20241202-hummingbird-of-hypothetical-aptitude-646def@houat>
References: <20241201-drm-connector-eld-mutex-v1-0-ba56a6545c03@linaro.org>
 <77545786331df8bfaf5fdcb309437358@kernel.org>
 <ohbtatnn33jj6y3q4milf4txi4n7yirnny2eefdjddlkn2dnhp@eqjedetct4q3>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="rf5ewnb7ayc4e2uu"
Content-Disposition: inline
In-Reply-To: <ohbtatnn33jj6y3q4milf4txi4n7yirnny2eefdjddlkn2dnhp@eqjedetct4q3>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_040027_341999_A803ECBA 
X-CRM114-Status: GOOD (  18.03  )
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


--rf5ewnb7ayc4e2uu
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 00/10] drm/connector: add eld_mutex to protect
 connector->eld
MIME-Version: 1.0

On Mon, Dec 02, 2024 at 01:03:07PM +0200, Dmitry Baryshkov wrote:
> On Mon, Dec 02, 2024 at 10:19:41AM +0000, Maxime Ripard wrote:
> > On Sun, 1 Dec 2024 01:55:17 +0200, Dmitry Baryshkov wrote:
> > > The connector->eld is accessed by the .get_eld() callback. This access
> > > can collide with the drm_edid_to_eld() updating the data at the same
> > > time. Add drm_connector.eld_mutex to protect the data from concurrenct
> > > access.
> > >=20
> > >=20
> > > [ ... ]
> >=20
> > Reviewed-by: Maxime Ripard <mripard@kernel.org>
>=20
> Thanks!
>=20
> I'm going to post v2 to fix Jani's comment, but what should be the merge
> strategy? Merge patches 1-3, 5, 9-10 through drm-misc and the rest (AMD,
> i915, MSM, radeon) through the driver trees?

The easiest is probably to merge everything through drm-misc if everyone ag=
rees.

Maxime

--rf5ewnb7ayc4e2uu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ02hVgAKCRAnX84Zoj2+
did2AYCKqjIX2aHftKtybJaUPI3aEKi2s1lRBLYyjb1Uwicsybws1tIK08t+OLLX
OfIShgYBfiJJHZ+4Gj/u8uuAs91T4EvzTss9Zo2aF+YDFdrV47edIsjbVE2McJQO
YLEiS8Wy0Q==
=Idbn
-----END PGP SIGNATURE-----

--rf5ewnb7ayc4e2uu--

