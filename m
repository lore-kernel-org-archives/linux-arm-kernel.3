Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EED4D3B7EA
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Dec 2025 14:11:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BP2+Qr9UCX/ya10Zz25rhJNunRKGtU8ir6XCihiJVvs=; b=oe+hR6MFd11UrtKaaA1OQ6k/zt
	tClL/GNHzNNXv1hHduj4geEIED00FS3cnoPy2Wd5Q1oos6Sy3nTFl/XG9kuSUDuUlSUxT7vcQ2J15
	CcthrIbB6wzDst4J5W8uwMPnXf3z6HyJfRYjS+x9/WmfVXXgdjKGz5ZkNlIhRe52P/VT/r7PuSdad
	xarNcXda5H1qjTOx7euNFIqvIMt95I7YtWMWtn1RFa8nBpovRfNA8soTDkDnIsBS0mKQuz9NCbGas
	StPFObY5c1xc1/MwTr63S/rHN96pjkzA0Fn8mIBfN9AgK8WhIDWmfsiC29DSMfHZCSYKZ/RZ1rTqv
	XS8xQ+0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSyR4-0000000ENkx-04O3;
	Tue, 09 Dec 2025 14:11:26 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSyR1-0000000ENkm-4AlM;
	Tue, 09 Dec 2025 14:11:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 93A8B600B0;
	Tue,  9 Dec 2025 14:11:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C04F8C4CEF5;
	Tue,  9 Dec 2025 14:11:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765289482;
	bh=wKR6M3heNWDWgben29U6U09LDt6ie/nrp3hxYzAUbek=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=npz5d4O0CrdapJo0o6NJdOiCHFzhMkLMMVdLRp/dcDZKrV/FhAuf5fMKy52dgkDN/
	 /bnA/l5fbnBdKLBohLzES2idJj/UNpdncLONYwRy4nsJszm+f+VutpArhc5gQnzYf6
	 EHsAMKk8GVDoyusqLZ+T9yM4mGFDsNTTzFM57rPeelHww1nUffQxXB9QrTdb9Wm93d
	 ncIwthjTHH2GP8w1jojEZ3YrMC2rYFDy17DLf4QB+rfovrHlhmOvwDUzfWo4gKgFmG
	 pmJTnqh0lLVVHdOx1g3HEZpzm76QC9q8Y5Hyz3sVxWHIhn5EVnkvHK1UKv0tGPySq4
	 lEz9zwyjLvNjg==
Date: Tue, 9 Dec 2025 15:11:19 +0100
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
	Rob Herring <robh@kernel.org>, kernel@collabora.com, amd-gfx@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
	Andri Yngvason <andri@yngvason.is>, Werner Sembach <wse@tuxedocomputers.com>, 
	Marius Vlad <marius.vlad@collabora.com>
Subject: Re: [PATCH v5 02/17] drm: Add new general DRM property "color format"
Message-ID: <20251209-gifted-coyote-of-endurance-b81bf5@houat>
References: <20251128-color-format-v5-0-63e82f1db1e1@collabora.com>
 <20251128-color-format-v5-2-63e82f1db1e1@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="xmgtsad7bfjv2vcw"
Content-Disposition: inline
In-Reply-To: <20251128-color-format-v5-2-63e82f1db1e1@collabora.com>
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


--xmgtsad7bfjv2vcw
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v5 02/17] drm: Add new general DRM property "color format"
MIME-Version: 1.0

Hi,

On Fri, Nov 28, 2025 at 10:05:38PM +0100, Nicolas Frattaroli wrote:
> From: Andri Yngvason <andri@yngvason.is>
>=20
> Add a new general DRM property named "color format" which can be used by
> userspace to request the display driver to output a particular color
> format.
>=20
> Possible options are:
>     - auto (setup by default, driver internally picks the color format)

I'm not entirely sure that's how we should document it. i915, amdgpu,
and every driver using the hdmi helpers uses the same algorithm: first
try with RGB, then fallback to YUV420 if it doesn't work.

I think we should document that, and every driver exposing this property
should behave that way. It's going to be a mess otherwise.

Maxime

--xmgtsad7bfjv2vcw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaTguAQAKCRAnX84Zoj2+
duXEAX4/CZjEf/Vz9OyLVH222nBTa0uS2T+fskhBgao890YpCT1nvetsMg1D+aIo
gc27WY8Bf1WyDvIujAc3Iyfya9WQrPgrl28osjHsEQzd3REVZ5vzuOsRVp8IxnF2
E9P+eFkHmg==
=aoBp
-----END PGP SIGNATURE-----

--xmgtsad7bfjv2vcw--

