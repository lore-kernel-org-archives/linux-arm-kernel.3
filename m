Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB5A8F94CD3
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Apr 2026 06:52:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F+k2j61BaRiqQdtTNTgqmqkRXzyWVzQqwf1yxx9Jl5Y=; b=3RLqoUzVDKhdl8dA09Xv9GXGVs
	RyFXG1MhtA65UkKOiIVhHyj0KDxEaIM8OW7Z9l6lhIMFYCQzD4mO+ldnU1hOfAzoL0Yd7UsGw+D67
	WO5j8VJu1Jshd5khEUcZAERwJd5ZsL/H6xzyzQa2QBDPOPw8Dun+ZxESXUpTzNl16NUASvvdLTBNT
	e43gWDP+c9Lcd95mT8ySg+j6MS/rqqxRv+iC3VINyFwBLFG12OyR2fpkVVECB1btnJKBrx35R/1Tr
	UaE09X+HH20us5pBMk28V/qN2tiDUsqSZeIglfFHh+YWNT6IHNV4gr+ro8O0tHRT5UPqbI0LGOAYr
	ypOQ8w+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFRRL-00000009gPk-20Di;
	Wed, 22 Apr 2026 06:52:03 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFRRK-00000009gPX-2IA9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Apr 2026 06:52:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5F70C60018;
	Wed, 22 Apr 2026 06:52:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C9AEC19425;
	Wed, 22 Apr 2026 06:52:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776840721;
	bh=F+k2j61BaRiqQdtTNTgqmqkRXzyWVzQqwf1yxx9Jl5Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uBI2YyHQ14xILWfOLl0M781/RFBZxHKsv77ZC0eXBHFwUqbPFiRATOVszWZUCkuoy
	 P8AsHN90clI5gEzB7QzrZq4mJrZ4zgAO8JLsI6oI8YqouSwk0t0Dgb3PIz3G2erBO7
	 gfHj0aU9d3+y+LdzG60/FGB3OnyhG4AuGHGGxVSdKByYp1bAJjSWJ/7z48Csc1C9Lb
	 +4B0hE6FXg5eWOEiUZBsCNh0TQK6AvpA4lO8XvJFvdAh900rmQ0FOV9vkoYibxG9qo
	 gudHD4vXrsQnwh9duF4E+0jCjD8KIYut7hNPttSsTAwGrdFr1ApLK4/ho+U5OnHKW/
	 5g5uCvXkkYfvA==
Date: Wed, 22 Apr 2026 08:51:58 +0200
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
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v2 02/20] drm/atomic: Drop drm_private_state.obj
 assignment from create_state
Message-ID: <20260422-poetic-malamute-of-greatness-ceee0f@houat>
References: <20260320-drm-mode-config-init-v2-0-c63f1134e76c@kernel.org>
 <20260320-drm-mode-config-init-v2-2-c63f1134e76c@kernel.org>
 <bbb554a6-2034-4f6e-9b48-fa9e10b4a95a@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="bcajdpsxzzkhkmjz"
Content-Disposition: inline
In-Reply-To: <bbb554a6-2034-4f6e-9b48-fa9e10b4a95a@suse.de>
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


--bcajdpsxzzkhkmjz
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 02/20] drm/atomic: Drop drm_private_state.obj
 assignment from create_state
MIME-Version: 1.0

On Tue, Apr 21, 2026 at 03:03:50PM +0200, Thomas Zimmermann wrote:
> Hi
>=20
> Am 20.03.26 um 17:27 schrieb Maxime Ripard:
> > The initial intent of the atomic_create_state helper was to simply
> > allocate a proper drm_private_state and returning it, without any side
> > effect.
> >=20
> > However, the __drm_atomic_helper_private_obj_create_state() introduces a
> > side effect by setting the drm_private_obj.state to the newly allocated
> > state.
> >=20
> > This assignment defeats the purpose, but is also redundant since
> > the only caller, drm_atomic_private_obj_init(), will also set this
> > pointer to the newly allocated state.
>=20
> Is this paragraph no longer up to date? Grepping for
> __drm_atomic_helper_private_obj_create_state returns plenty of callers.

No, it's still up to date but super confusing. I didn't mean that there
wase one single caller of __drm_atomic_helper_private_obj_create_state()
that would set obj->state, but rather that the
drm_private_state_funcs.atomic_create_state hook is called only by
drm_atomic_private_obj_init() and it will set obj->state.

So, you're right, there's plenty of drivers calling
__drm_atomic_helper_private_obj_create_state() but we always end up
there through drm_atomic_private_obj_init().

Maxime

--bcajdpsxzzkhkmjz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaehwDQAKCRAnX84Zoj2+
dpyKAXkBF+Uqrnq4REnKuA0OlvLZRGSTJJ2HUa7jCMcyxQLt/PBQx4V/BABYGfiY
yGO45+UBgIaXbaB8TXvhywyna7iuhl4sopx2bu7lqy0Hut5/L8CNhH/7RgZBQYhD
2HA5L3Ii3g==
=qp7L
-----END PGP SIGNATURE-----

--bcajdpsxzzkhkmjz--

