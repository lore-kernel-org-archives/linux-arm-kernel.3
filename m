Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDD59CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 12:53:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yPU3ARnnAjVb3Cwcbjg/PKv9T4SMSIAseW3HEinP1w8=; b=NboCo18DXXHYfqeiOV+qUbVxq7
	erOgbteIoOEw0HVoEmLlQPfzjct68aDmkG5EcJCG41ehDaxGAxvu3J1s15rS0/laaRsa6ZcyV7fJ0
	/Di2fK8quw9hSrDldcpQvFqWFbSGW0wk4DuHvK04uJaCV1zOTxc/GmEGeqIo9mAsaMZZeO/40ixtN
	ot30GNRNm6PQTBAiAyIhq7sIhsikCSO64xjS3mYTSl/1EdPqD8grKBMuqx+aztMh2gdldzNdLsOTG
	b7Eq51yixOF1WUd6KYD7scEAfPiKHuY92VlUKGKJ9J8MzT5XpCoztWGoG+FvG1M8kqzvIBaTB3jrx
	BnFK4lvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJAM5-00000008nwG-31nD;
	Wed, 12 Nov 2025 12:53:45 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJAM2-00000008nv4-1GYJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Nov 2025 12:53:43 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vJALm-0008Fb-P4; Wed, 12 Nov 2025 13:53:26 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vJALl-0005O1-10;
	Wed, 12 Nov 2025 13:53:25 +0100
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vJALl-000000006wU-0wU3;
	Wed, 12 Nov 2025 13:53:25 +0100
Message-ID: <782dd8af786ff402fa8b334264f189be2919d7a7.camel@pengutronix.de>
Subject: Re: [PATCH v2] drm/imx/ipuv3: Fix dumb-buffer allocation for
 non-RGB formats
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Thomas Zimmermann <tzimmermann@suse.de>, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, festevam@gmail.com,
 dmitry.baryshkov@oss.qualcomm.com, 	maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@gmail.com, 	simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, Pengutronix Kernel Team
	 <kernel@pengutronix.de>
Date: Wed, 12 Nov 2025 13:53:25 +0100
In-Reply-To: <20251104153832.189666-1-tzimmermann@suse.de>
References: <20251104153832.189666-1-tzimmermann@suse.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1-1+deb13u1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_045342_343320_37B9B710 
X-CRM114-Status: GOOD (  21.70  )
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

On Di, 2025-11-04 at 16:38 +0100, Thomas Zimmermann wrote:
> Align pitch to multiples of 8 pixels for bpp values that do not map
> to RGB formats. The call to drm_driver_color_mode_format() fails with
> DRM_INVALID_FORMAT in these cases. Fall back to manually computing
> the pitch alignment from which drm_mode_size_dumb() can compute the
> correct pitch.
>=20
> Fixes userspace that allocates dumb buffers for YUV formats, where
> bpp equals 12. A common example is the IGT kms_getfb test.
>
> v2:
> - ignore width in calculation
>=20
> Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Fixes: b1d0e470f881 ("drm/imx/ipuv3: Compute dumb-buffer sizes with drm_m=
ode_size_dumb()")
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Philipp Zabel <p.zabel@pengutronix.de>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Sascha Hauer <s.hauer@pengutronix.de>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: imx@lists.linux.dev
> Cc: linux-arm-kernel@lists.infradead.org
> ---
> This patch is based on Dmitry's fix for msm. [1] Please test.

Thank you,

[IGT] kms_getfb: finished subtest getfb2-accept-nv12, CRASH -> SUCCESS

Tested-by: Philipp Zabel <p.zabel@pengutronix.de>

> There could later be a helper to contain these aligmentment calculations
> in a single place.
>=20
> [1] https://lore.kernel.org/dri-devel/20251103-drm-msm-fix-nv12-v2-1-7510=
3b64576e@oss.qualcomm.com/
> ---
>  drivers/gpu/drm/imx/ipuv3/imx-drm-core.c | 16 +++++++++-------
>  1 file changed, 9 insertions(+), 7 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/imx/ipuv3/imx-drm-core.c b/drivers/gpu/drm/i=
mx/ipuv3/imx-drm-core.c
> index 465b5a6ad5bb..eddb471119c6 100644
> --- a/drivers/gpu/drm/imx/ipuv3/imx-drm-core.c
> +++ b/drivers/gpu/drm/imx/ipuv3/imx-drm-core.c
> @@ -144,7 +144,6 @@ static int imx_drm_dumb_create(struct drm_file *file_=
priv,
>  			       struct drm_mode_create_dumb *args)
>  {
>  	u32 fourcc;
> -	const struct drm_format_info *info;
>  	u64 pitch_align;
>  	int ret;
> =20
> @@ -156,12 +155,15 @@ static int imx_drm_dumb_create(struct drm_file *fil=
e_priv,
>  	 * the allocated buffer.
>  	 */
>  	fourcc =3D drm_driver_color_mode_format(drm, args->bpp);
> -	if (fourcc =3D=3D DRM_FORMAT_INVALID)
> -		return -EINVAL;
> -	info =3D drm_format_info(fourcc);
> -	if (!info)
> -		return -EINVAL;
> -	pitch_align =3D drm_format_info_min_pitch(info, 0, SZ_8);
> +	if (fourcc !=3D DRM_FORMAT_INVALID) {
> +		const struct drm_format_info *info =3D drm_format_info(fourcc);
> +
> +		if (!info)
> +			return -EINVAL;
> +		pitch_align =3D drm_format_info_min_pitch(info, 0, 8);
> +	} else {
> +		pitch_align =3D DIV_ROUND_UP(args->bpp, SZ_8) * 8;
> +	}
>  	if (!pitch_align || pitch_align > U32_MAX)
>  		return -EINVAL;
>  	ret =3D drm_mode_size_dumb(drm, args, pitch_align, 0);

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp

