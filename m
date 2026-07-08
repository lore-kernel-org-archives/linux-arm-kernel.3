Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3792C43602
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 06:47:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dda6EKnJcaA11GKqrW+DCxDvbZY1WLkxUaV4elPeMqA=; b=X4SYdnNXVjPFAXjk29S6GuOJqM
	7f8gtla8amVQwmieqycwZuXhbvtO/lOo9/+xNNAbWwLX3qmtogdfLBp6/s6N+YkmYH9Dd9VTUZ2iE
	Yn1wkQMBAITlPYRt98pOFucM+BesxjLMEyRxmDBftNnvoqzm8QjqSINXlKA2mGGDZAS6VFpdEGSYb
	uedoLRu+Gr7Ht8462dcfwrkTjrBVqulJerq/0de/6CKvf12wFEmZP4sEysMOHwrNYTz7zh/Y2X1mZ
	epZBm4mkiLf+XNXyn/dl87+LmFaMnf8IJWAiS78ZThimtnrmQKwwwGDpIsnwDr/4aSy1iStj6afMb
	sI+V6/9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whM3b-0000000GQor-0BxG;
	Wed, 08 Jul 2026 06:46:55 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whM3Z-0000000GQoO-2ORj;
	Wed, 08 Jul 2026 06:46:53 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id AF873404AB;
	Wed,  8 Jul 2026 06:46:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 208C21F00A3A;
	Wed,  8 Jul 2026 06:46:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783493212;
	bh=dda6EKnJcaA11GKqrW+DCxDvbZY1WLkxUaV4elPeMqA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=gdRHtWwmBpljYkDnbi+s0Po0ALJbs0er1Z1e6nbWh32zNXoqSX/HClNx2FsEaXrx+
	 PuL5GBym3trY+YYLRk3eDYc+vZnLg56n5WEWDMlPKGUTAf9jJLWGifLnFm3c9+f8dR
	 RZqoGE4M4NJwdfI9dMmoq0uEcc3tHE1I8cJuNY/0cPMfu/x8pYs4ICDM6yshTSYDMA
	 qhsPFFTPDzt5rxdggP2efSRCVfhM2kh3IJhPJCs2yEGFhgGcfF5l+6ENt/ib4jjNmE
	 +5652/kWuWR+D4WGiMZss3KtyB9jT3eryMUMdhyOCit025OIwjnNjH11k3xrmqyq2c
	 rnyNBnZWG4PgQ==
Date: Wed, 8 Jul 2026 08:46:50 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Luca Ceresoli <luca.ceresoli@bootlin.com>, Sandy Huang <hjc@rock-chips.com>, 
	Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>, Andy Yan <andy.yan@rock-chips.com>, 
	Daniel Stone <daniels@collabora.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	=?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>, Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
	kernel@collabora.com, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v8 03/39] drm/display: bridge_connector: Pass HDMI
 capabilities through caps struct
Message-ID: <20260708-bold-ruby-potoo-c6c949@houat>
References: <20260702-dw-hdmi-qp-scramb-v8-0-d79890d00b6a@collabora.com>
 <20260702-dw-hdmi-qp-scramb-v8-3-d79890d00b6a@collabora.com>
 <eqnr2hfclbdkry2jqe2kuufss5kus6qpjblewq35upnjwlhxhl@4awqxpwrnxk2>
 <f74ffd53-5776-4fae-a6fe-eeace5c3fc5f@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="u7g35xr4vgpqkhon"
Content-Disposition: inline
In-Reply-To: <f74ffd53-5776-4fae-a6fe-eeace5c3fc5f@collabora.com>
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


--u7g35xr4vgpqkhon
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v8 03/39] drm/display: bridge_connector: Pass HDMI
 capabilities through caps struct
MIME-Version: 1.0

On Fri, Jul 03, 2026 at 10:55:09PM +0300, Cristian Ciocaltea wrote:
> On 7/3/26 5:19 PM, Dmitry Baryshkov wrote:
> > On Thu, Jul 02, 2026 at 05:46:16PM +0300, Cristian Ciocaltea wrote:
> >> Switch drm_bridge_connector_init() to
> >> drmm_connector_hdmi_init_with_caps(), collecting the bridge's HDMI
> >> properties into a stack drm_connector_hdmi_caps so future HDMI 2.x
> >> capabilities can be plumbed without growing the argument list.
> >>
> >> Introduce struct drm_bridge::supported_hdmi_ver to let bridges declare
> >> the HDMI specification version they are conformant with, and forward it
> >> to the connector layer through the new caps struct so HDMI 2.x features
> >> can be gated on real source capability rather than guesswork.
> >=20
> > And it's left uninitialized by the bridges, which doesn't mean anything.
> > If you don't want to touch all bridge drivers in one commit, please
> > provide some migration path and hopefully get rid of it by the end of
> > the series.=20
>=20
> Sure, one question though: at the end of the migration, would it be fine =
to
> stick with drmm_connector_hdmi_init_with_caps() and just drop
> drmm_connector_hdmi_init()?  Otherwise I'll rename it back.

Absolutely, it doesn't make any sense to keep both variants.

Maxime

--u7g35xr4vgpqkhon
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCak3yUgAKCRAnX84Zoj2+
dgA6AYCyDFgGTxFn0SBcOkPBApbes4BuK+X5JHvKvEk7xiWbO93Vqka++5/XzGyT
Zz7K1j4BfipIdXYUQH8XNvCOMpkrfjeMlnCiCXrYlN9EsZpBqVIbnIalrv/UncdJ
krF4ykO6LA==
=4OYk
-----END PGP SIGNATURE-----

--u7g35xr4vgpqkhon--

