Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDF4EF8FA6D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Apr 2026 13:19:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4YGxx1230NUeqGUVgj7w7B9jvZFIjNcNxTgoavQYPX4=; b=KkPbF5vKBCbGW/gmrhzTtc8/E0
	TudLVEzX50Doz5JapMsHb5Q4wFz8sp0hH6AEAandY4V0ZawwF9jE5mLpBBP7Gv0k4SyX0zi6dkRuA
	/6N2TWFkhYvO2em3vvkcEw/a9WxnOV6voDLj4NrSW+q4rehICaImD1+zLs9QmMm4jGYXwx3DgInup
	801sOCcq221xYX5Pi3JwZ+hfg4BxzoIUD4VSu/IE6RQ2uSwwBukEUp1O+/juVYFnWl1tziLV3pOAx
	lwtO6pfdW8WMblRpaf7nnnBIjUIF0LtAnw005mB6xDzdDbJYI+3zXfWDhMk7Ab8Zb4X8pGM4c5lyM
	jJ7hGoQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFB0E-00000008eVu-1g4L;
	Tue, 21 Apr 2026 13:18:58 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFB0C-00000008eVY-0mJC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Apr 2026 13:18:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0377940DD0;
	Tue, 21 Apr 2026 13:18:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54D3FC2BCB0;
	Tue, 21 Apr 2026 13:18:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776777534;
	bh=4YGxx1230NUeqGUVgj7w7B9jvZFIjNcNxTgoavQYPX4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=q4H9NCS1wklFgmjG3fY7nQwgmC6y7es9bQm6jTUyEB7pb0KU8qFYkgLJJ+DR2whvN
	 j/G9gsVSHdb+BxBlMDVjCpFXiQtqCJitVKVK1ahJj3pCV3dg5CLpcNWK5oo2fCUJ5K
	 DlIJMohixGciaVZk3cvO64EqgMB3Ag98bQS7pKv7ObCZ/l6TK9TV68B/NPw9/nYBwg
	 rtFDfefPGUWPvhDVwl3UP9a/A0ejKvkmfvxPYrDtDlWHl1wncqKZOhKLS62DYz9cZb
	 I31H9HTV2NZ3Ci1mZGF23NTzsTRjD7X3THI/uSaQ7USYg6Sfrhra2owDzfhuuATxJl
	 ZHcbPuq976jwA==
Date: Tue, 21 Apr 2026 15:18:51 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Jyri Sarha <jyri.sarha@iki.fi>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
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
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: Re: [PATCH v2 03/20] drm/mode-config: Mention
 drm_mode_config_reset() culprits
Message-ID: <20260421-satisfied-teal-serval-640ded@houat>
References: <20260320-drm-mode-config-init-v2-0-c63f1134e76c@kernel.org>
 <20260320-drm-mode-config-init-v2-3-c63f1134e76c@kernel.org>
 <8f111841-bb88-4cbb-a3ae-b26ac2f252cb@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="rxrpmabyud4mqcjl"
Content-Disposition: inline
In-Reply-To: <8f111841-bb88-4cbb-a3ae-b26ac2f252cb@suse.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260421_061856_286665_7A1B3A69 
X-CRM114-Status: GOOD (  15.33  )
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


--rxrpmabyud4mqcjl
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 03/20] drm/mode-config: Mention
 drm_mode_config_reset() culprits
MIME-Version: 1.0

Hi Thomas,

On Tue, Apr 21, 2026 at 03:08:03PM +0200, Thomas Zimmermann wrote:
> Hi
>=20
> Am 20.03.26 um 17:27 schrieb Maxime Ripard:
> > drm_mode_config_reset() does not reset drm_private_states by design.
> >=20
> > This is especially significant for the DP MST and tunneling code that
> > expect to be preserved across a suspend/resume cycle, where
> > drm_mode_config_reset() is also used.
>=20
> Do we really? There's drm_mode_config_helper_suspend/resume(). Why would
> drivers do a drm_mode_config_reset().

drm_mode_config_helper_resume() will call drm_atomic_helper_resume()
that call drm_mode_config_reset(). So (most) drivers will not directly
call it, but it is going to be called still.

Maxime

--rxrpmabyud4mqcjl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaed5NwAKCRAnX84Zoj2+
dtw8AX9DojrL3WFaspDKRjToSW+vRmF412s3y1qGLFZcP0f9OtAIccAw3Fg7lizI
ZN8HewUBgIkwUv4pGG2YRPkReA/5dhaOtLMZCBDBHqvL/6jxd48ge3+cGst6w3AQ
TyATWnE3pw==
=dUtn
-----END PGP SIGNATURE-----

--rxrpmabyud4mqcjl--

