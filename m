Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18C85CD4F21
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 May 2026 11:12:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bG0eB5K9Vd4NCC4uEk9ddMcNZV3zMNGNpavsO1Gi+AI=; b=K1sM9YLqRYe0chgLFRGG/xYkG7
	5JYCJVLXdi+P2qHqclj/oTlLtBEwK9Of/4dMYgz0DebqSH8d5VRjm5rNMSdsNqkVKN91GunCDDLVW
	09fwNgJ/7rh72NrBVDxy75Q1+DtMW5m2J8/9V6HcLns9mOIHB3LciuKPrXzPORFXtiyn4JoKHcLMr
	1UfnYe87A4yHsb0wHDV/YsWMZ/DdCrVv6Q9dbEfMWaMTB4jxDeJDvXuBAfa9FDweI9LyyHQBgdWot
	uGnaONhWZjQL+JLwI4Cv9VNad41MsKSxuWmnEgaFtryWR6B1QilWndz0PyhNiMeCR97ygSBauKgqj
	+maYsYQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMl26-0000000GWsc-21bA;
	Tue, 12 May 2026 11:12:14 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMl24-0000000GWsO-3vij
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 May 2026 11:12:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0CED36001A;
	Tue, 12 May 2026 11:12:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3210FC2BCB0;
	Tue, 12 May 2026 11:12:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778584331;
	bh=O7iu6+OHQt+UcCqoDQCwDlQvXcpD6wcdi/7smEjbNtk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YrT55/kJDMGUXJeFkWGNBK9FzoIl4HS2K6NQ40lshLexigxa5igujPnwY12XGUrdu
	 3oOa+gU1cmvJzjolELAzIxd1yfyzBMid+STDPGTAVRXPms6RXDWIpzMXF38HeWtyme
	 Ka4fvM+RMH0KUQI8fV+iGOT4B8dK8A4buH5UB0r4sTDQf1kgCzyFayooBEM7pzO/PJ
	 GoGMSrEhq+0uNzqLXoY1e31sUQOX3HcKOGlCi98r4NmTLZpXDf20q4FjJlcrWrtAdj
	 3zudKRjf0pgTQ9Q85TuX+CuSQUL1OfuEfr/+Uo0tklnbaK2GOoVSx1wYq74kryTblm
	 kMgb/SVWhPzKw==
Date: Tue, 12 May 2026 13:12:08 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Jyri Sarha <jyri.sarha@iki.fi>, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Simon Ser <contact@emersion.fr>, 
	Harry Wentland <harry.wentland@amd.com>, Melissa Wen <mwen@igalia.com>, 
	Sebastian Wick <sebastian.wick@redhat.com>, Alex Hung <alex.hung@amd.com>, 
	Jani Nikula <jani.nikula@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>, 
	Chen-Yu Tsai <wens@kernel.org>, Samuel Holland <samuel@sholland.org>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>, 
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Daniel Stone <daniels@collabora.com>, 
	intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v3 16/20] drm/mode-config: Create
 drm_mode_config_create_initial_state()
Message-ID: <20260512-thundering-premium-cassowary-8bfdb6@houat>
References: <20260424-drm-mode-config-init-v3-0-8b68d9db0d8b@kernel.org>
 <20260424-drm-mode-config-init-v3-16-8b68d9db0d8b@kernel.org>
 <20260504174148.GS1344263@killaraus.ideasonboard.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="4wqckenerejplylm"
Content-Disposition: inline
In-Reply-To: <20260504174148.GS1344263@killaraus.ideasonboard.com>
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


--4wqckenerejplylm
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 16/20] drm/mode-config: Create
 drm_mode_config_create_initial_state()
MIME-Version: 1.0

On Mon, May 04, 2026 at 08:41:48PM +0300, Laurent Pinchart wrote:
> > Historically, this was one
> > + *   of drm_mode_config_reset() job, so one might still encounter it in
> > + *   a driver.
> > + *
> > + * - at reset time, for example during suspend/resume,
> > + *   drm_mode_config_reset() will reset the software and hardware state
> > + *   to a known default and will store it in the object's state pointe=
r.
> > + *   Not all objects are affected by drm_mode_config_reset() though.
>=20
> Does the reset implementation store a new state in the object's state
> pointer, or does it reset the contents of the already allocated state ?
> I read the documentation here as meaning the former, if it's actually
> the latter it should be reworded.

It's undefined. Both approach works, most drivers will destroy the old
one and allocate a new one, but mediatek will just clear and
re-initialize the old one:

https://elixir.bootlin.com/linux/v7.1-rc3/source/drivers/gpu/drm/mediatek/m=
tk_plane.c#L28

Maxime

--4wqckenerejplylm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCagMK/gAKCRAnX84Zoj2+
dkDYAXsF9DsH6J/5fuYI/okfNgVOZH2InlN8hfiL7W1ViQhomunSdZTAPqO4sg2a
qYX3ht8BgPEsGsJ4a24dNbTDI8IuNZgDQ5B+kNfoyQNlBIPqgsydcK5kBH91+hEB
93znUn0Yeg==
=9Kyz
-----END PGP SIGNATURE-----

--4wqckenerejplylm--

