Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77560CA0FFD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Aug 2025 07:33:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DENKWc0ekq4UNDhRRQjwLrtYtoA+KfqAypfKZC86Eqk=; b=sT0kwefbdMgRm+74AjSwTAkXg4
	KJWKIm2IXD1b7ooMKkSTwmgWVhyjhMQkqJ+omviUlVpkbf2LlkbR4x+yEIzetNzevITxvFNQXV1Fp
	Dac5UaRDdMxs6ZvzjNmaxBWRkmLSN6dIqm/SyTkwYUIsgel0/+Qlt/tg3U0wEmehYbC6KFiEM5eCJ
	TF1M5FSxZiZ0zuW2F/H3IbBrt9ud4eTWVJr4Fj0pGy6x02GVLlxoOsuFBJu0L7tX+p8wM6wjG3ixn
	h6WEg4Tv3hn7I1sPwnDZQ/Yg/M3A3AxXFsyN8jDv0viOV0cBwk1HPH8pK4BrY0uFRIyj1ffp0OkM0
	bteSGl0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urAef-0000000ER05-1lpH;
	Wed, 27 Aug 2025 07:33:13 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urAbw-0000000EQRD-2Kf8;
	Wed, 27 Aug 2025 07:30:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3127E60254;
	Wed, 27 Aug 2025 07:30:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 587B4C4CEEB;
	Wed, 27 Aug 2025 07:30:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756279822;
	bh=DENKWc0ekq4UNDhRRQjwLrtYtoA+KfqAypfKZC86Eqk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RhxgsoN3lmna/+JExixoNPap1mGT+zqpO8/iUSe0edBRPqG+uoL1AosmqpeX5IHTh
	 2chWd0LuCV5uA/wGXzLmitAFUDvq/N2tsQO6PHg3VWq7FgO8gIIqA6TBaSckSJRa5K
	 D/wIP3nU5H/MFsycCY/pxU8O00LxnYf2Rf4sYeMrQNL1vszte/bHWROoYjh07yq76F
	 kCIXEhSsvJvRwHGh8TO3/KAScj63Tkf8THgvAMfGKLUc202xART5lI5zoNuiRyDqH6
	 WtSV8ls84DVWfVSwbVY0+Ak+yUFRK6mcWFzICNSG3mLbZJ206lIt7L0gtlMiPrZDHv
	 XNBqbnNQJS+Tw==
Date: Wed, 27 Aug 2025 09:30:20 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Sandy Huang <hjc@rock-chips.com>, 
	Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>, Andy Yan <andy.yan@rock-chips.com>, Chen-Yu Tsai <wens@csie.org>, 
	Samuel Holland <samuel@sholland.org>, Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	=?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>, Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
	Liu Ying <victor.liu@nxp.com>, Rob Clark <robin.clark@oss.qualcomm.com>, 
	Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, 
	Jessica Zhang <jessica.zhang@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH v2 1/8] drm/connector: let drivers declare infoframes as
 unsupported
Message-ID: <20250827-adorable-ocelot-of-adventure-ba88b7@houat>
References: <20250819-drm-limit-infoframes-v2-0-7595dda24fbd@oss.qualcomm.com>
 <20250819-drm-limit-infoframes-v2-1-7595dda24fbd@oss.qualcomm.com>
 <20250820-artichoke-silkworm-of-election-521b5e@houat>
 <v7w7xkefm6ap7delx7wsvxmc76fwptqhe4ehokzfh4baueb7hr@acrx36exv42v>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="wgcccbljqt4firco"
Content-Disposition: inline
In-Reply-To: <v7w7xkefm6ap7delx7wsvxmc76fwptqhe4ehokzfh4baueb7hr@acrx36exv42v>
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


--wgcccbljqt4firco
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 1/8] drm/connector: let drivers declare infoframes as
 unsupported
MIME-Version: 1.0

Hi,

On Wed, Aug 20, 2025 at 12:52:44PM +0300, Dmitry Baryshkov wrote:
> On Wed, Aug 20, 2025 at 09:15:36AM +0200, Maxime Ripard wrote:
> > Hi,
> >=20
> > On Tue, Aug 19, 2025 at 09:57:30PM +0300, Dmitry Baryshkov wrote:
> > > Currently DRM framework expects that the HDMI connector driver suppor=
ts
> > > all infoframe types: it generates the data as required and calls into
> > > the driver to program all of them, letting the driver to soft-fail if
> > > the infoframe is unsupported. This has a major drawback on userspace
> > > API: the framework also registers debugfs files for all Infoframe typ=
es,
> > > possibly surprising the users when infoframe is visible in the debugfs
> > > file, but it is not visible on the wire.
> > >=20
> > > Let drivers declare that they support only a subset of infoframes,
> > > creating a more consistent interface.
> > >=20
> > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> >=20
> > I'm not really convinced. Infoframes aren't really something you should
> > ignore, AVI is effectively mandatory, HDMI kind of is too, AUDIO is if
> > audio support is enabled, DRM is mandatory if HDR is used.
>=20
> Nevertheless, sun4i, innohdmi, adv7511, it6263 and rk3066 drivers
> provide support only for the AVI infoframe.

Yes, but it's still something we shouldn't paper over. The spec mandates
it, if drivers want to deviate from it it's something we should warn
about, not silence.

sun4i is a good example, to me at least since I have the doc. The
hardware supports AVI, Audio, ACP, and SPD. HDR isn't supported, so DRM
isn't either. The only missing one is HDMI, but the documentation isn't
the best so it might still be supported. In short, it's a driver issue.

adv7511 supports AVI, Audio, ACP, SPD, ACP, and looks to have a
mechanism to send any infoframe as is. So, again, driver issue.

I couldn't find the other datasheet, but I'd be very surprised if it
wasn't the case for these too.

> Some of them can be extended to support other infoframe kinds (e.g.
> ADV7511 has two spare infoframes which can be used for HDMI and SPD).
>=20
> > SPD is indeed optional though.
> >=20
> > So, it's really dynamic in essence, and not really something we should
> > expect drivers to ignore.
> >=20
> > I do acknowledge that a lot of drivers just silently ignore the
> > infoframes they don't support at the moment, which isn't great either.
> >=20
> > Maybe we should standardize and document what drivers should do when
> > they don't support a given infoframe type?
>=20
> The chips might be generating infoframes internally. This series was
> triggered by LT9611UXC, which does all HDMI work under the hood in the
> firmware. See [1]. The series I posted hooks HDMI audio directly into
> the bridge driver, but I'd really prefer to be able to use
> drm_atomic_helper_connector_hdmi_hotplug(), especially if I ever get to
> implementing CEC support for it.
>=20
> ADV7511 likewise generates audio infoframe without Linux
> help (audio-related fields are programmed, but it's not the
> infoframe itself).

Implementing the write_infoframe hooks as a nop with a comment in those
case is totally reasonable to me.

I'd still like to document that drivers should only return 0 if they
programmed the infoframe, and -ENOTSUPP (and the core logging a warning)
otherwise.

That way, we would be able to differentiate between the legimitate
LT9611UXC case, and the "driver is broken" sun4i (and others) case.

Maxime

--wgcccbljqt4firco
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaK60CAAKCRAnX84Zoj2+
dkbWAYCMfUjpHErZH+SQIgUybfgwR6GGsSh167v91iFWGWz8EJiwF3fqRZNLLMX0
Bs7dH+QBf3E+xTNLU4qS9e3zJulsSQ7EeLySYfsKG21vEhU0ndIesR3W4HshDPTR
mJeUGxkx9g==
=m9tf
-----END PGP SIGNATURE-----

--wgcccbljqt4firco--

