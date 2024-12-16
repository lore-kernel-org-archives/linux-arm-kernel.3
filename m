Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 445B5E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Dec 2024 15:25:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qwp7x4aJDUxarFTaEpzOHiBsU5haajJrQwtWnJXKDaM=; b=U5ogHNjW9CKyJLmn/rnwxZhG2l
	4l1qm0j6swe3jTt2n6ZeuEGDPBcoK9Ae5jr9mutVSzyP03hSD6HvFpNFAhLbVtupKhuKWdUXIVq4y
	XOvNTrbx460S71LAIFHFBN+GzEEEmYIoM/5nVzguCt7x2JuBsQW+SMSYNl8gM8rjeXUD+8HaqXo7C
	6FWpwitJbz9wIXwyzTKOXF25EckMb+ABUPWwxxNdnUU2LuChmhheyJIL3r3JYrrWK0vJWmaC7cPVY
	vCwjLiwvU4p3gJj8O8DWq2K06ltBd0sW7t+h7JTSlK4nRoosCCQWB7E41MOvQ0kvDkBUMeMTlXOEQ
	gKmUPVmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNCyZ-0000000AP5c-0YEG;
	Mon, 16 Dec 2024 15:25:39 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNCxS-0000000AOrK-0utt
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Dec 2024 15:24:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D0B555C6181;
	Mon, 16 Dec 2024 15:23:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4224EC4CED0;
	Mon, 16 Dec 2024 15:24:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734362668;
	bh=agePObKTKIqacVCU4rIa9k5erBpScbul3raudsvvu8Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=b8QilrikF4NVH5daF8JcBRrPWW47IJcOfuBDqzAMfQm21R3U9vJi2tRp0R2CDW5KU
	 5PerJeZDcm3voWMl8+EWYdNddW85QuUfUafcbTx+kTzNF4sUCjQ04UEDh3ph0PXAK1
	 Z1NHTk8NagW8X10YnpCm7uKgRzHBWxsZCPpk+vfi7gkeip02Qs/Q8sl/IQN5ggPRnQ
	 tiHqOSurdrARlgyv2rqjrH4jQgTA3uj8xMbUR/Tvgx4pm5Yzx2pKbbGLHs+Ow+FAJU
	 9K5AFnij63nj1RL4yi2Lsp6+ZMP3PJrfPu/BXSpKNpcMrIG6YSDc/i3Kquo7nCV5DK
	 MNuZMdT+4DpXQ==
Date: Mon, 16 Dec 2024 16:24:26 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Harry Wentland <harry.wentland@amd.com>, 
	Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, 
	Alex Deucher <alexander.deucher@amd.com>, Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, 
	Xinhui Pan <Xinhui.Pan@amd.com>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Phong LE <ple@baylibre.com>, Inki Dae <inki.dae@samsung.com>, 
	Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Jani Nikula <jani.nikula@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>, 
	Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	Alain Volmat <alain.volmat@foss.st.com>, Raphael Gallais-Pou <rgallaispou@gmail.com>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>, 
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	amd-gfx@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
	linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
	Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH v2 00/10] drm/connector: add eld_mutex to protect
 connector->eld
Message-ID: <20241216-observant-spiritual-wolf-564ee3@houat>
References: <20241206-drm-connector-eld-mutex-v2-0-c9bce1ee8bea@linaro.org>
 <xchjpeykkqwlpniaspbzitaozuoltoq7aturtu7jq6z4lcxh77@y7t5ge2sa4er>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="yj5x4y56pv6ag7wh"
Content-Disposition: inline
In-Reply-To: <xchjpeykkqwlpniaspbzitaozuoltoq7aturtu7jq6z4lcxh77@y7t5ge2sa4er>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_072430_349291_1AF0376F 
X-CRM114-Status: GOOD (  20.88  )
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


--yj5x4y56pv6ag7wh
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 00/10] drm/connector: add eld_mutex to protect
 connector->eld
MIME-Version: 1.0

On Mon, Dec 16, 2024 at 01:24:29PM +0200, Dmitry Baryshkov wrote:
> On Fri, Dec 06, 2024 at 11:43:03AM +0200, Dmitry Baryshkov wrote:
> > The connector->eld is accessed by the .get_eld() callback. This access
> > can collide with the drm_edid_to_eld() updating the data at the same
> > time. Add drm_connector.eld_mutex to protect the data from concurrenct
> > access.
> >=20
> > The individual drivers were just compile tested. I propose to merge the
> > drm_connector and bridge drivers through drm-misc, allowing other
> > maintainers either to ack merging through drm-misc or merging the
> > drm-misc into their tree and then picking up correcponding patch.
> >=20
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> > Changes in v2:
> > - Also take the mutex in clear_eld() (Jani)
> > - Rebased on top of linux-next + drm-misc-next to solve build error
> > - Link to v1: https://lore.kernel.org/r/20241201-drm-connector-eld-mute=
x-v1-0-ba56a6545c03@linaro.org
> >=20
> > ---
> > Dmitry Baryshkov (10):
> >       drm/connector: add mutex to protect ELD from concurrent access
> >       drm/bridge: anx7625: use eld_mutex to protect access to connector=
->eld
> >       drm/bridge: ite-it66121: use eld_mutex to protect access to conne=
ctor->eld
> >       drm/amd/display: use eld_mutex to protect access to connector->eld
> >       drm/exynos: hdmi: use eld_mutex to protect access to connector->e=
ld
> >       drm/i915/audio: use eld_mutex to protect access to connector->eld
> >       drm/msm/dp: use eld_mutex to protect access to connector->eld
> >       drm/radeon: use eld_mutex to protect access to connector->eld
> >       drm/sti: hdmi: use eld_mutex to protect access to connector->eld
> >       drm/vc4: hdmi: use eld_mutex to protect access to connector->eld
>=20
> Granted the lack of reviews from AMD maintainers and granted that the
> rest of the series was reviewed and acked, is it suitable to leave those
> two patches out and merge the rest through drm-misc-next?

Sounds reasonable to me

Maxime

--yj5x4y56pv6ag7wh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ2BGJAAKCRAnX84Zoj2+
dqCXAX9SjWwvOgFzh4mNa6iVP75JAzbqRH60uqV3o0fzLR0EpZr5ExXJlgdvDTJ1
pqDitiQBf0gV4LWjS6KxH0jldZncnMFDYupvJiMgktWoAluECsTRw5fKWW43ccUY
56/fJ5jxEg==
=4rTF
-----END PGP SIGNATURE-----

--yj5x4y56pv6ag7wh--

