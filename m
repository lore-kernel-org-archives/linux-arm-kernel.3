Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56B58EA813F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Feb 2026 16:00:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zldcbNbjmj+RA7A3DZ3ZkdfjMPm277Yz7u9u9p4QqjQ=; b=HbisKvni8ovWe1VD/n9p1Mk2aF
	DCPUAL+V5x220SqJKCQbLU8oA2Zm09i0OXU2XBQPtbw7ZBUX3RjFwHP1P764sCdBbovW+ZZJUzR6q
	mTUXcZvFbNGJd3SSiOgrd1agaaA2bJytvvtsxCw5abeWFRYSblhZ0cAwQ1ik9VoTD4cs8n3IXcmmz
	FpMtvVjA1tB5c2KYXwgBFsYXYWlfkks0ZfHXzcZaRdHMgIdLVWOHZdPpBke/2L9uAVcFgKekE3o98
	y52wjIkuLODQT8xzlVs/OYwEFrkPG1kWqCHL9vKpqTtqX0ghKO5xLGBaBgOrlIHM9m+3i826bDxk5
	doK7YZdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpqA6-0000000HAoB-1nfl;
	Tue, 10 Feb 2026 16:00:26 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpq9p-0000000HAf7-0aa7;
	Tue, 10 Feb 2026 16:00:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 374C843EC3;
	Tue, 10 Feb 2026 16:00:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A011C116C6;
	Tue, 10 Feb 2026 16:00:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770739208;
	bh=zldcbNbjmj+RA7A3DZ3ZkdfjMPm277Yz7u9u9p4QqjQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RMyQYHYNpszMSJqmidkGX2NoEYtO7xOazdfZO2Q5iGJNTMCgJ+znXKLHV3wU+w5mU
	 81P544GiPydpylxVo/SCUj9yY6feDstrxgJOuMw/pWJJz9ndZsgEC2zR4EHbObdpi4
	 pfHL1KTzKa1NeezI3wv7aGc81F9plh/aKvv2RW9s5nFZ6rCp0yQ9DhjqSHhHQUn6L/
	 vVP41AcOWSjY2uwX18XpLxfND6DbM5L4o9zj0y/UV6PtcPdBVM3ih+N1X0kYONwg9e
	 3ymEssncp804w6MMxkU2DI6GfIPLf5S0gp9wgoKnhCAqL5W9wEcjZ0WXGGTtj4CcEz
	 EB95D+CLtTCiQ==
Date: Tue, 10 Feb 2026 17:00:05 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
	Rodrigo Siqueira <siqueira@igalia.com>, Alex Deucher <alexander.deucher@amd.com>, 
	Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Sandy Huang <hjc@rock-chips.com>, 
	Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>, Andy Yan <andy.yan@rock-chips.com>, 
	Jani Nikula <jani.nikula@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>, 
	Dmitry Baryshkov <lumag@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Rob Herring <robh@kernel.org>, Jonathan Corbet <corbet@lwn.net>, kernel@collabora.com, 
	amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v7 20/22] drm/tests: edid: Add __maybe_unused attribute
 to EDID definitions
Message-ID: <20260210-didactic-okapi-of-modernism-ff00d9@houat>
References: <20260121-color-format-v7-0-ef790dae780c@collabora.com>
 <20260121-color-format-v7-20-ef790dae780c@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="km3cw6v2t5aytgoz"
Content-Disposition: inline
In-Reply-To: <20260121-color-format-v7-20-ef790dae780c@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260210_080009_220319_BD4BFB9E 
X-CRM114-Status: GOOD (  13.36  )
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


--km3cw6v2t5aytgoz
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v7 20/22] drm/tests: edid: Add __maybe_unused attribute
 to EDID definitions
MIME-Version: 1.0

Hi,

On Wed, Jan 21, 2026 at 03:45:27PM +0100, Nicolas Frattaroli wrote:
> It's normal for a test suite to need an EDID, but not all EDIDs across
> every test. Silence compiler warnings caused by unused definitions by
> using the appropriate attribute.
>=20
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

It's not clear to me when the EDIDs could be compiled but the tests
wouldn't, and as far as I know it's all part of the same module.
Expanding a bit on how you can trigger that warning would be great.

With that fixed,
Reviewed-by: Maxime Ripard <mripard@kernel.org>

Maxime

--km3cw6v2t5aytgoz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaYtWAAAKCRAnX84Zoj2+
dt2nAX0UsXzuusEYCVBCqgJwtZ264lcQWo9yWUlALQWTVuR932yQyPhy8y6N7uQn
emUBNQgBf2NvmzdJa+lE7RXY5eWBX5awNF8H76g5vlBxZXvOQkVir9drD30JTaPa
AhXIei7HvQ==
=9Hue
-----END PGP SIGNATURE-----

--km3cw6v2t5aytgoz--

