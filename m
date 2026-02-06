Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F097BEE20A6
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Feb 2026 14:05:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D7VRj+v7qEc06M4Xk9DWJiXeX8foMwNN9cX3WL7kVL4=; b=4i1fFkJakGFW0bVsfv49/WWJST
	kVvk15ivp2ETidZTCEVZs4KYAEHhN5q2Iiz2gFBVOwPBB1FBPOEEJOCkr5OY8UFNS0KvWirX5e4rZ
	WYR7h9qBdVVr5l+cvIIEBcTXylNDSC8UBFkmBqzVgOCLjrqz6BZzWlEQ00XZvJdY8riU4fA+4uLUE
	5txMrMHMIbFbZNpgJnQbqg5VG0CaD3KpwqKsAVFsa4P4WMtQI/oN7pX+BXGSTJziwyfEqwUkviK8X
	DOgAzRc8vsVtkSCc60S9Uf5qN3fc2Nwbj75wop24nGKxQqjyS1MD9MoGZDfu8MA8Db4aXf+ir2Y/Q
	1dAoj59Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voMSk-0000000BPTe-0WUi;
	Fri, 06 Feb 2026 14:05:34 +0000
Received: from sender4-pp-g120.zoho.com ([136.143.188.120])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voMSd-0000000BPRi-2mHy;
	Fri, 06 Feb 2026 14:05:31 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1770386715; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=H1SP3ZWZy2n98oO2VRMxJGvKxvpA1VEp5Apb33GV/zAYu2rb5ydXgKTDBQ1nfEb0ay8KXRn2ntPixct3OenOr69IgpxflVP8EfC9ikjC/xQ0HicpRrxXyvodS66fM8sIwAP5i1/bIBHcwrolRrSg0U6ljAd1FyG9gd0LwPBEUiI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1770386715; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=D7VRj+v7qEc06M4Xk9DWJiXeX8foMwNN9cX3WL7kVL4=; 
	b=nL/TljZpqzFHkcaqPnRJAemc20d3H7DJVZPgCCQXsisSIUPSt9PQq3/4GIfKI+uDsFqdBaOHUW9Rr2fuXIgax+0ZWir7N5a/YYw1wkwqV4xstHKSGRQpV7LVAYiQ7WVw8D+pbvX4sbmlPZotqgjn7JZ+4gRCLnjSwMEv/2NKHpg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nfraprado@collabora.com;
	dmarc=pass header.from=<nfraprado@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1770386715;
	s=zohomail; d=collabora.com; i=nfraprado@collabora.com;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=D7VRj+v7qEc06M4Xk9DWJiXeX8foMwNN9cX3WL7kVL4=;
	b=R3hWU0ey2b0XSdkkpcpslzY1kZSDT7TRQY2KMG+As2U7PZh3BKjqjbKvm0JXYHnI
	14L+DnBIZ6MEwy+gfQ3UiP7GCkJQU7Wh7TLZRiCySCZQtWldcRw3DJjlNap6XTZikN0
	gQZFuy1mF2Cjp71QPhmO/V/ilJKjb2E1kc8DDUsA=
Received: by mx.zohomail.com with SMTPS id 1770386713473881.7041592011303;
	Fri, 6 Feb 2026 06:05:13 -0800 (PST)
Message-ID: <2fc9635430e6af0c175d6d019b7cd1598034892c.camel@collabora.com>
Subject: Re: [PATCH 09/11] drm/colorop: Introduce 3x3 Matrix
From: =?ISO-8859-1?Q?N=EDcolas?= "F. R. A. Prado" <nfraprado@collabora.com>
To: Pekka Paalanen <pekka.paalanen@collabora.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard	
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
	 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Chun-Kuang Hu	
 <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, Matthias
 Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno	
 <angelogioacchino.delregno@collabora.com>, dri-devel@lists.freedesktop.org,
 	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, daniels@collabora.com, 
	ariel.dalessandro@collabora.com, kernel@collabora.com
Date: Fri, 06 Feb 2026 09:05:11 -0500
In-Reply-To: <20260206112702.4afdbc48@eldfell>
References: <20251223-mtk-ovl-pre-blend-colorops-v1-0-0cb99bd0ab33@collabora.com>
		<20251223-mtk-ovl-pre-blend-colorops-v1-9-0cb99bd0ab33@collabora.com>
	 <20260206112702.4afdbc48@eldfell>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-8 
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260206_060527_741415_9E0D1A36 
X-CRM114-Status: GOOD (  24.89  )
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

On Fri, 2026-02-06 at 11:27 +0200, Pekka Paalanen wrote:
> On Tue, 23 Dec 2025 16:44:50 -0300
> N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com> wrote:
>=20
> > Introduce a 3x3 Matrix colorop analogous to the 3x4 Matrix colorop,
> > with
> > the difference of not supporting offset coefficients.
> >=20
> > Signed-off-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>
> > ---
> > =C2=A0drivers/gpu/drm/drm_atomic.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=
=A0 1 +
> > =C2=A0drivers/gpu/drm/drm_atomic_uapi.c |=C2=A0 3 +++
> > =C2=A0drivers/gpu/drm/drm_colorop.c=C2=A0=C2=A0=C2=A0=C2=A0 | 21 ++++++=
+++++++++++++++
> > =C2=A0include/drm/drm_colorop.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0 3 +++
> > =C2=A0include/uapi/drm/drm_mode.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=
 16 ++++++++++++++++
> > =C2=A05 files changed, 44 insertions(+)
> >=20
> > diff --git a/drivers/gpu/drm/drm_atomic.c
> > b/drivers/gpu/drm/drm_atomic.c
> > index 6d3ea8056b60..bf4a31c02b70 100644
> > --- a/drivers/gpu/drm/drm_atomic.c
> > +++ b/drivers/gpu/drm/drm_atomic.c
> > @@ -802,6 +802,7 @@ static void
> > drm_atomic_colorop_print_state(struct drm_printer *p,
> > =C2=A0		drm_printf(p, "\tdata blob id=3D%d\n", state->data ?
> > state->data->base.id : 0);
> > =C2=A0		break;
> > =C2=A0	case DRM_COLOROP_CTM_3X4:
> > +	case DRM_COLOROP_CTM_3X3:
> > =C2=A0		drm_printf(p, "\tdata blob id=3D%d\n", state->data ?
> > state->data->base.id : 0);
> > =C2=A0		break;
> > =C2=A0	case DRM_COLOROP_MULTIPLIER:
> > diff --git a/drivers/gpu/drm/drm_atomic_uapi.c
> > b/drivers/gpu/drm/drm_atomic_uapi.c
> > index 7320db4b8489..7a70e894a2ef 100644
> > --- a/drivers/gpu/drm/drm_atomic_uapi.c
> > +++ b/drivers/gpu/drm/drm_atomic_uapi.c
> > @@ -709,6 +709,9 @@ static int
> > drm_atomic_color_set_data_property(struct drm_colorop *colorop,
> > =C2=A0		size =3D colorop->size * colorop->size * colorop-
> > >size *
> > =C2=A0		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sizeof(struct drm_color_lu=
t32);
> > =C2=A0		break;
> > +	case DRM_COLOROP_CTM_3X3:
> > +		size =3D sizeof(struct drm_color_ctm);
> > +		break;
> > =C2=A0	default:
> > =C2=A0		/* should never get here */
> > =C2=A0		return -EINVAL;
> > diff --git a/drivers/gpu/drm/drm_colorop.c
> > b/drivers/gpu/drm/drm_colorop.c
> > index a19e03fb9c7c..51c1a0726dfa 100644
> > --- a/drivers/gpu/drm/drm_colorop.c
> > +++ b/drivers/gpu/drm/drm_colorop.c
> > @@ -68,6 +68,7 @@ static const struct drm_prop_enum_list
> > drm_colorop_type_enum_list[] =3D {
> > =C2=A0	{ DRM_COLOROP_CTM_3X4, "3x4 Matrix"},
> > =C2=A0	{ DRM_COLOROP_MULTIPLIER, "Multiplier"},
> > =C2=A0	{ DRM_COLOROP_3D_LUT, "3D LUT"},
> > +	{ DRM_COLOROP_CTM_3X3, "3x3 Matrix"},
> > =C2=A0};
> > =C2=A0
> > =C2=A0static const char * const colorop_curve_1d_type_names[] =3D {
> > @@ -377,6 +378,26 @@ int drm_plane_colorop_ctm_3x4_init(struct
> > drm_device *dev, struct drm_colorop *c
> > =C2=A0}
> > =C2=A0EXPORT_SYMBOL(drm_plane_colorop_ctm_3x4_init);
> > =C2=A0
> > +int drm_plane_colorop_ctm_3x3_init(struct drm_device *dev, struct
> > drm_colorop *colorop,
> > +				=C2=A0=C2=A0 struct drm_plane *plane, const
> > struct drm_colorop_funcs *funcs,
> > +				=C2=A0=C2=A0 uint32_t flags)
> > +{
> > +	int ret;
> > +
> > +	ret =3D drm_plane_colorop_init(dev, colorop, plane, funcs,
> > DRM_COLOROP_CTM_3X3, flags);
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret =3D drm_colorop_create_data_prop(dev, colorop);
> > +	if (ret)
> > +		return ret;
> > +
> > +	drm_colorop_reset(colorop);
> > +
> > +	return 0;
> > +}
> > +EXPORT_SYMBOL(drm_plane_colorop_ctm_3x3_init);
> > +
> > =C2=A0/**
> > =C2=A0 * drm_plane_colorop_mult_init - Initialize a
> > DRM_COLOROP_MULTIPLIER
> > =C2=A0 *
> > diff --git a/include/drm/drm_colorop.h b/include/drm/drm_colorop.h
> > index 8ec98521607d..ee7fa0eb5dbf 100644
> > --- a/include/drm/drm_colorop.h
> > +++ b/include/drm/drm_colorop.h
> > @@ -426,6 +426,9 @@ int drm_plane_colorop_curve_1d_lut_init(struct
> > drm_device *dev, struct drm_color
> > =C2=A0int drm_plane_colorop_ctm_3x4_init(struct drm_device *dev, struct
> > drm_colorop *colorop,
> > =C2=A0				=C2=A0=C2=A0 struct drm_plane *plane, const
> > struct drm_colorop_funcs *funcs,
> > =C2=A0				=C2=A0=C2=A0 uint32_t flags);
> > +int drm_plane_colorop_ctm_3x3_init(struct drm_device *dev, struct
> > drm_colorop *colorop,
> > +				=C2=A0=C2=A0 struct drm_plane *plane, const
> > struct drm_colorop_funcs *funcs,
> > +				=C2=A0=C2=A0 uint32_t flags);
> > =C2=A0int drm_plane_colorop_mult_init(struct drm_device *dev, struct
> > drm_colorop *colorop,
> > =C2=A0				struct drm_plane *plane, const
> > struct drm_colorop_funcs *funcs,
> > =C2=A0				uint32_t flags);
> > diff --git a/include/uapi/drm/drm_mode.h
> > b/include/uapi/drm/drm_mode.h
> > index cbbbfc1dfe2b..b894b19eb9f8 100644
> > --- a/include/uapi/drm/drm_mode.h
> > +++ b/include/uapi/drm/drm_mode.h
> > @@ -964,6 +964,22 @@ enum drm_colorop_type {
> > =C2=A0	 *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 color =3D lut=
3d[index]
> > =C2=A0	 */
> > =C2=A0	DRM_COLOROP_3D_LUT,
> > +
> > +	/**
> > +	 * @DRM_COLOROP_CTM_3X3:
> > +	 *
> > +	 * enum string "3x3 Matrix"
> > +	 *
> > +	 * A 3x3 matrix. Its values are specified via the
> > +	 * &drm_color_ctm struct provided via the DATA property.
> > +	 *
> > +	 * The DATA blob is a float[9]:
> > +	 * out=C2=A0=C2=A0 matrix=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 in
> > +	 * | R |=C2=A0=C2=A0 | 0=C2=A0 1=C2=A0 2 |=C2=A0=C2=A0 | R |
> > +	 * | G | =3D | 3=C2=A0 4=C2=A0 5 | x | G |
> > +	 * | B |=C2=A0=C2=A0 | 6=C2=A0 7=C2=A0 8 |=C2=A0=C2=A0 | B |
> > +	 */
> > +	DRM_COLOROP_CTM_3X3,
> > =C2=A0};
> > =C2=A0
> > =C2=A0/**
> >=20
>=20
> Acked-by: Pekka Paalanen <pekka.paalanen@collabora.com>
>=20
> FWIW, the statement "The DATA blob is a float[9]" is incorrect, but
> the
> same wording exists already with the DRM_COLOROP_CTM_3X4. The data
> type
> is not a float, nor is it a float reinterpreted as __u64 (they are
> not
> even the same size). Documentation for the structs explains the
> correct
> type, which is a fixed-point number.
>=20
> The struct types document also the layout, so there is no need to
> repeat the layout here. It may be worth mentioning that the blob must
> contain exactly one instance of the struct.

Makes sense, thanks! I'll fix that in v2.

--=20
Thanks,

N=C3=ADcolas

