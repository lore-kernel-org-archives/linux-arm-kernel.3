Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A50EE7BDBB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Feb 2026 13:19:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x17rKTV/AW+rXEnnYvuTgqqITgbkbFLoCGqLGcpPrVg=; b=V8oDhB50oGKMC3kIxeyQ3G6rm0
	5GX6vpDuVysTPbNgRzo8JFVw905790QneRqisvTiTir5rC5TKwFSWgm9iG8euhzxdieb4azCDb+6W
	R4Rp11tHjmtl1wX5d8HPWtaV6eul9AQgHVHBMF0dGFsYQg+cUpi4PpfAnIAKm+YHQh5sTUeBZ/lPu
	dmh33GmlOfB+Zud3f9ldo7CimAg1LRKtZZ2q/ObIc1UECwwrXQ6xGPhjyJKl/Z7FMc5LVDtLV8GoB
	aBVz72aauQ1npi/XDuNL0dEAiWBjB6ZcrWhu0WwuXStcNTWBtY7vIUxX6PdRR8bPbHAcY8q/7YpwH
	2I2unw7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vryV5-00000006dtO-3UOv;
	Mon, 16 Feb 2026 13:18:55 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vryV3-00000006dsc-0Iuj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Feb 2026 13:18:54 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vryUs-000740-AH; Mon, 16 Feb 2026 14:18:42 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vryUq-0014Zg-10;
	Mon, 16 Feb 2026 14:18:41 +0100
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vryUr-00000000C1Z-2OoU;
	Mon, 16 Feb 2026 14:18:41 +0100
Message-ID: <0b980d087bfe54262cef61821cbd70f5b71fc592.camel@pengutronix.de>
Subject: Re: [PATCH 2/2] drm/imx: ipuv3-plane: support underlay plane
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Michael Tretter <m.tretter@pengutronix.de>, Maarten Lankhorst	
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Shawn Guo	 <shawnguo@kernel.org>, Sascha
 Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team
 <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>
Cc: dri-devel@lists.freedesktop.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Date: Mon, 16 Feb 2026 14:18:41 +0100
In-Reply-To: <20260216-drm-imx-underlay-plane-v1-2-2dcbd1fd4ef5@pengutronix.de>
References: <20260216-drm-imx-underlay-plane-v1-0-2dcbd1fd4ef5@pengutronix.de>
	 <20260216-drm-imx-underlay-plane-v1-2-2dcbd1fd4ef5@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260216_051853_114172_BEB57A07 
X-CRM114-Status: GOOD (  15.61  )
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

On Mo, 2026-02-16 at 13:44 +0100, Michael Tretter wrote:
> The IPUv3 overlay plane may be placed over or under the primary plane.
> Use an immutable position of 1 for the primary plane and a mutable
> position including 0 and 2 for the overlay plane, to allow placing the
> overlay plane over and under the primary plane.
>=20
> Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
> ---
>  drivers/gpu/drm/imx/ipuv3/ipuv3-plane.c | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/imx/ipuv3/ipuv3-plane.c b/drivers/gpu/drm/im=
x/ipuv3/ipuv3-plane.c
> index dfd036f3195e..ddad5ea92aad 100644
> --- a/drivers/gpu/drm/imx/ipuv3/ipuv3-plane.c
> +++ b/drivers/gpu/drm/imx/ipuv3/ipuv3-plane.c
> @@ -890,7 +890,7 @@ struct ipu_plane *ipu_plane_init(struct drm_device *d=
ev, struct ipu_soc *ipu,
>  {
>  	struct ipu_plane *ipu_plane;
>  	const uint64_t *modifiers =3D ipu_format_modifiers;
> -	unsigned int zpos =3D (type =3D=3D DRM_PLANE_TYPE_PRIMARY) ? 0 : 1;
> +	unsigned int primary_zpos =3D 1;
>  	unsigned int format_count;
>  	const uint32_t *formats;
>  	int ret;
> @@ -928,12 +928,14 @@ struct ipu_plane *ipu_plane_init(struct drm_device =
*dev, struct ipu_soc *ipu,
>  	else
>  		drm_plane_helper_add(&ipu_plane->base, &ipu_plane_helper_funcs);
> =20
> -	if (dp =3D=3D IPU_DP_FLOW_SYNC_BG || dp =3D=3D IPU_DP_FLOW_SYNC_FG)
> -		ret =3D drm_plane_create_zpos_property(&ipu_plane->base, zpos, 0,
> -						     1);
> +	if ((dp =3D=3D IPU_DP_FLOW_SYNC_BG || dp =3D=3D IPU_DP_FLOW_SYNC_FG) &&

These checks is not necessary anymore. The only overlay plane is (dp =3D=3D
IPU_DP_FLOW_SYNC_FG).


regards
Philipp

