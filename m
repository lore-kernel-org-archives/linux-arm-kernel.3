Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F650C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Mar 2025 18:26:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YDuPD6J5153l5GKFgDRheQSNLKlO1I3c+X1mkrW09bQ=; b=mMtKLYy5oBQ1nqrvCw/Xh+Pugq
	FWKdWVV8Zz9OUvV9eny7d/8Y6s/a7oL7PLD+kjzyb7ikg7oMVjo8wE272uk64RrQClrsDiKHHHcaJ
	dXCqapfBUi2GJiOi/7Q2uZgasJFkHNdkXG+b8KQ6JQaBpMhopP8B04wZ4TdORe+3fAjobcmwYs67G
	9HBhA3nzNAosbTaTI/8Moz2L2CokQBj2UFbamrWw31Lxqngq5u/lc6doVip4LjRWCr7HdxLs6F+ok
	lCap+RH/17xOCib6bxXoqbMjtNOVdYdmkcsPEYdwuhzDdOH01kupRqK/aO65qmuXKlFW+IBWER9zc
	hoo70WrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tt9jG-0000000F169-0WIz;
	Fri, 14 Mar 2025 18:25:54 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tt9Ub-0000000EzEg-1aq9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Mar 2025 18:10:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id AF11DA4885D;
	Fri, 14 Mar 2025 18:05:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACDEFC4CEE9;
	Fri, 14 Mar 2025 18:10:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741975844;
	bh=GUBpMm6oomjtS9UWURbwiJnVJD5A8VtOUo4HCzFBqOE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=V+CccntGTMKTSI08JPci1UF0sYzB5R0BMqvdDOmRb8mdn77ZEo9aRGjcNEJy3565m
	 q0t3ZFWr3HoSLznR0cfwy8bImJcgwa0vA+K4qzJDlkah9Uy/yuekVB4Dqnt4I3PDbM
	 Auye8C4tt03P717Sri/Y4yjyGBqAcJQE1fqzhEdYe5UJhNXv/TO7spHMH7qfq65Cz7
	 ytUKk5y01X3TjRFROLrShwrI9UjIsqPlypRgMeSbx4/1zPpGZYkbdzIrTzwr32hbeO
	 AWf/qJ5tMqFDsCcNqAxgzv5DI6P8rmf9p7kWYhFaiYq9kW7WEPYTMTkE34OZCr/sBP
	 /s3SvWINwXdHg==
Date: Fri, 14 Mar 2025 19:10:41 +0100
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
Subject: Re: [PATCH v7 06/11] drm/bridge: get the bridge returned by
 drm_bridge_chain_get_first_bridge()
Message-ID: <20250314-aspiring-myrtle-husky-a5f4ac@houat>
References: <20250314-drm-bridge-refcount-v7-0-152571f8c694@bootlin.com>
 <20250314-drm-bridge-refcount-v7-6-152571f8c694@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="isweh2hn5bnofcnk"
Content-Disposition: inline
In-Reply-To: <20250314-drm-bridge-refcount-v7-6-152571f8c694@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_111045_556181_A5FD621B 
X-CRM114-Status: GOOD (  20.59  )
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


--isweh2hn5bnofcnk
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v7 06/11] drm/bridge: get the bridge returned by
 drm_bridge_chain_get_first_bridge()
MIME-Version: 1.0

On Fri, Mar 14, 2025 at 11:31:19AM +0100, Luca Ceresoli wrote:
> drm_bridge_chain_get_first_bridge() returns a bridge pointer that the
> caller could hold for a long time. Increment the refcount of the returned
> bridge and document it must be put by the caller.
>=20
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
>=20
> ---
>=20
> This patch was added in v7.
> ---
>  include/drm/drm_bridge.h | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>=20
> diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
> index a5accd64c364ebb57903ae1e7459034ad9ebf4f3..d9777d5f2e9ef006f0062e450=
7bce99df4146cd9 100644
> --- a/include/drm/drm_bridge.h
> +++ b/include/drm/drm_bridge.h
> @@ -1105,6 +1105,9 @@ drm_bridge_get_prev_bridge(struct drm_bridge *bridg=
e)
>   * drm_bridge_chain_get_first_bridge() - Get the first bridge in the cha=
in
>   * @encoder: encoder object
>   *
> + * The refcount of the returned bridge is incremented. Use drm_bridge_pu=
t()
> + * when done with it.
> + *
>   * RETURNS:
>   * the first bridge in the chain, or NULL if @encoder has no bridge atta=
ched
>   * to it.
> @@ -1112,8 +1115,8 @@ drm_bridge_get_prev_bridge(struct drm_bridge *bridg=
e)
>  static inline struct drm_bridge *
>  drm_bridge_chain_get_first_bridge(struct drm_encoder *encoder)
>  {
> -	return list_first_entry_or_null(&encoder->bridge_chain,
> -					struct drm_bridge, chain_node);
> +	return drm_bridge_get(list_first_entry_or_null(&encoder->bridge_chain,
> +						       struct drm_bridge, chain_node));
>  }

We'll need to modify drm_bridge_get_next_bridge, drm_bridge_get_prev_bridge=
, and
drm_for_each_bridge_in_chain in a similar manner, but for this one

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Maxime

--isweh2hn5bnofcnk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ9RxIQAKCRAnX84Zoj2+
dpOTAX0S4kYV1tOUty+kqLjtPal9GsCYRFqXKFnFw8v/vOB6r9g6O1iB9NF6Fuei
eWtscfEBgNdNVATng2hmNpDKPKzMj3MJjHtfjcUN5zb7Je++I+OBx8qk+kLSKPcs
cymXEqjh8g==
=khjF
-----END PGP SIGNATURE-----

--isweh2hn5bnofcnk--

