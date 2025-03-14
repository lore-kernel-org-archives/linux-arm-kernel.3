Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 500E4C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Mar 2025 18:24:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hrnWpD9hdS7a/vXI6PTT8VJAvBoP/N4LdNmB2LeHLhI=; b=34QEmgEdeSx4A1ncIQcbcWvT/V
	KK+xz87hYEKdUkCMYfFEarTcgqFhAUAOrs2H9HUOK8H2He1lGY6q1EjkSkB0lRkT7mlpaFCeZpDw+
	lmCspB9cWp+Irgjp3hUwvMFganacvgqWGTUO4DBrM9UOv9tCRX/VOoIxMw/1djqaDkuBv0dF4Ybc1
	fZx42BOAe93O4tDJLdsSIy1qukY7V9ZXjVJ1lcgIpiBVCq0k2qUoCyqv4/kt/c/gLq7HyU0wEixxG
	+Vvr064guh0taff1Vs03briJK0ClhP6L/mJU7z6AsmEp87/yTmA8aKlUP/dUodRStZXFCkmSBE03C
	6LoLC6Xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tt9hc-0000000F0x6-1cig;
	Fri, 14 Mar 2025 18:24:12 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tt9SM-0000000Eyut-29bc
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Mar 2025 18:08:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id C460FA48854;
	Fri, 14 Mar 2025 18:02:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDD0DC4CEE3;
	Fri, 14 Mar 2025 18:08:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741975705;
	bh=pMndPzOi39LiqdZDL0zZ2D/xV+aNKHKbxp2vkbYQzcY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EEGAuMioxwmMWMH7D1iLTaJ1TstHwcF5CkjS7V6l1SxaUPZEhUf7Qcw+g/XCFMVui
	 AmygB1SFx8T7kM8igKskWpBDTliayYSZ+Ly1JdSv5HYqyVDrp2rotsOEOA9JAE4+AQ
	 w72KM5ezEX1XdaDBL6Xy1l4SG6Mri7pt/x0Uqkszj/gcLL8Qlv+OmwVbxrfQEqD+GF
	 y0/0w80+BXczoAcY6Ar1YLjdk3sc11iNZr4lp0E+HgJVSnhEco4cCmHzzkwbCQSOPN
	 gJK6lcXQIyPHcxpmtskWzTLykqYKE9kiatCEYyynfZ65S+0rwBlmPl/6blwh8+QPgG
	 Z8k5MQCwq89iQ==
Date: Fri, 14 Mar 2025 19:08:22 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Marek Vasut <marex@denx.de>, Stefan Agner <stefan@agner.ch>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Inki Dae <inki.dae@samsung.com>, Jagan Teki <jagan@amarulasolutions.com>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	Anusha Srivatsa <asrivats@redhat.com>, Paul Kocialkowski <paulk@sys-base.io>, 
	Dmitry Baryshkov <lumag@kernel.org>, =?utf-8?B?SGVydsOp?= Codina <herve.codina@bootlin.com>, 
	Hui Pu <Hui.Pu@gehealthcare.com>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v7 05/11] drm/bridge: add a cleanup action for
 scope-based drm_bridge_put() invocation
Message-ID: <20250314-banana-toucanet-of-masquerade-8eeb4e@houat>
References: <20250314-drm-bridge-refcount-v7-0-152571f8c694@bootlin.com>
 <20250314-drm-bridge-refcount-v7-5-152571f8c694@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="nzqdgqjykuda4cgv"
Content-Disposition: inline
In-Reply-To: <20250314-drm-bridge-refcount-v7-5-152571f8c694@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_110826_677502_12220C56 
X-CRM114-Status: GOOD (  22.85  )
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


--nzqdgqjykuda4cgv
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v7 05/11] drm/bridge: add a cleanup action for
 scope-based drm_bridge_put() invocation
MIME-Version: 1.0

On Fri, Mar 14, 2025 at 11:31:18AM +0100, Luca Ceresoli wrote:
> Many functions get a drm_bridge pointer, only use it in the function body
> (or a smaller scope such as a loop body), and don't store it. In these
> cases they always need to drm_bridge_put() it before returning (or exiting
> the scope).
>=20
> Some of those functions have complex code paths with multiple return poin=
ts
> or loop break/continue. This makes adding drm_bridge_put() in the right
> places tricky, ugly and error prone in case of future code changes.
>=20
> Others use the bridge pointer in the return statement and would need to
> split the return line to fit the drm_bridge_put, which is a bit annoying:
>=20
>   -return some_thing(bridge);
>   +ret =3D some_thing(bridge);
>   +drm_bridge_put(bridge);
>   +return ret;
>=20
> To make it easier for all of them to put the bridge reference correctly
> without complicating code, define a scope-based cleanup action to be used
> with __free().
>=20
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
>=20
> ---
>=20
> This patch was added in v7.
> ---
>  include/drm/drm_bridge.h | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
> index 5c1e2b9cafb12eb429d1f5d3ef312e6cf9b54f47..a5accd64c364ebb57903ae1e7=
459034ad9ebf4f3 100644
> --- a/include/drm/drm_bridge.h
> +++ b/include/drm/drm_bridge.h
> @@ -23,6 +23,7 @@
>  #ifndef __DRM_BRIDGE_H__
>  #define __DRM_BRIDGE_H__
> =20
> +#include <linux/cleanup.h>
>  #include <linux/ctype.h>
>  #include <linux/list.h>
>  #include <linux/mutex.h>
> @@ -995,6 +996,9 @@ static inline struct drm_bridge *drm_bridge_put(struc=
t drm_bridge *bridge)
>  	return bridge;
>  }
> =20
> +/* Cleanup action for use with __free() */
> +DEFINE_FREE(drm_bridge_put, struct drm_bridge *, if (_T) drm_bridge_put(=
_T))
> +

IIRC, drm_bridge_put already checks for the pointer being null before
dereferencing it, right? Then we can probably simplify the macro here.

Either way,

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Maxime

--nzqdgqjykuda4cgv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ9RwlgAKCRAnX84Zoj2+
dnRWAYDqJA/VzvRJeITRDaiSnp2e56ZEkITDBPZ7/s3WFGqse2NghJmcSAfLhnuR
0TgauxABfA8DQKzCstRILIp+mDGDhAoLus6nq23qduwVcOmS4bwHSjtg2Al4L1qn
7TGVN2z+zg==
=GY7p
-----END PGP SIGNATURE-----

--nzqdgqjykuda4cgv--

