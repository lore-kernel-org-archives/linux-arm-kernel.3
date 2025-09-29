Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A10DCAC5B0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Sep 2025 16:02:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tBhdtn4WywjV8YX0pSLDWDcNcDkRLFjP5hlSSBzqSms=; b=D3yJoRnHFE58CZneP4a5fMeUi5
	1YpLh3/AVdgOt31hoNmZ829uNYV0h3dmMm37wo2O8uLQMZfzYVC42nCY+Vf0DowoF12OihpNDpk9L
	fxDHRuSZB2daxeYi32oDcimAKtu1aDiU6NHTRNHwcvzUSeOAfqzbUfmpr6SJIgk7LrCys0KxzTMP0
	k/TbyE2Vvx1kPPDe2piZEXlcVH2mLbCSGuAYT01kATTxt9fjAqmwbGoCk2KIiYxfuBjag/Wy4XVdV
	iOoRIutiINDBfcxdT6gA16g7VNSDWgGwxJqFmymnClrR5YUlJ3GynP2UZZ+KsD5HCgd5yEs/o3rBs
	1FXCX1Rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3GKC-00000002st5-42JI;
	Mon, 29 Sep 2025 16:02:04 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3GK9-00000002ssV-2zDE;
	Mon, 29 Sep 2025 16:02:02 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1759161649; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=lO4XkvatoUXQvbjF88NEo4GQV304NUsNzGnfLfpAGQJACgtdT6ns9sqamBDeq5T3rrLNKdsMf5rTsiniDa3tJWa/86fe0pQYx0iN0L5IDHhkJqeNA7IlkLDk/UNDQjKhz5/8rGOPQljktYtoDkNRPLtpPwyO4kdAEK/YNnxGO5I=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1759161649; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=tBhdtn4WywjV8YX0pSLDWDcNcDkRLFjP5hlSSBzqSms=; 
	b=lVLGTmETVkCIP0WKjmObmfrsZtGUq1ZYWjIVjC8VqJrB4aS4A5ggVHhmXiQIREqehiPffKh/8rJAxzL+50geybX9h7y5p84pJK2E31LxkhYaVa87FqJQhD8htU20NLiJWF+HYRbmrJE1EAF17YQXRe/JLlubBSh4bRbsimFGL68=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nfraprado@collabora.com;
	dmarc=pass header.from=<nfraprado@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1759161648;
	s=zohomail; d=collabora.com; i=nfraprado@collabora.com;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=tBhdtn4WywjV8YX0pSLDWDcNcDkRLFjP5hlSSBzqSms=;
	b=FVF4tF848aJT71bWiRy++xWwA9rP30861XDd6VJanlPKxOzcEwMkNT5gxumr/gid
	RGj1Z4ASg6BM+hhQSEj2Bbs32NY8JjgpZsmiJRz05Gpee1bJzyqwggVI8cMSCLp2Era
	LWQsvLIkjLNilz17UTXRFEFBYPa2wjDsDxtsIY4M=
Received: by mx.zohomail.com with SMTPS id 1759161645995986.0060307420077;
	Mon, 29 Sep 2025 09:00:45 -0700 (PDT)
Message-ID: <7307e84f9e4b0a8c67b82f7234f90bf83f201037.camel@collabora.com>
Subject: Re: [PATCH RFC v2 05/20] drm: Introduce
 DRM_CAP_POST_BLEND_COLOR_PIPELINE
From: =?ISO-8859-1?Q?N=EDcolas?= "F. R. A. Prado" <nfraprado@collabora.com>
To: Harry Wentland <harry.wentland@amd.com>, Louis Chauvet	
 <louis.chauvet@bootlin.com>, Maarten Lankhorst	
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,  Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Matthias Brugger	
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno	
 <angelogioacchino.delregno@collabora.com>, Haneen Mohammed	
 <hamohammed.sa@gmail.com>, Melissa Wen <melissa.srw@gmail.com>
Cc: Alex Hung <alex.hung@amd.com>, wayland-devel@lists.freedesktop.org, 
	leo.liu@amd.com, ville.syrjala@linux.intel.com,
 pekka.paalanen@collabora.com, 	contact@emersion.fr, mwen@igalia.com,
 jadahl@redhat.com, sebastian.wick@redhat.com, 	shashank.sharma@amd.com,
 agoins@nvidia.com, joshua@froggi.es, mdaenzer@redhat.com, 
	aleixpol@kde.org, xaver.hugl@gmail.com, victoria@system76.com, 
	uma.shankar@intel.com, quic_naseer@quicinc.com, quic_cbraga@quicinc.com, 
	quic_abhinavk@quicinc.com, marcan@marcan.st, Liviu.Dudau@arm.com, 
	sashamcintosh@google.com, chaitanya.kumar.borah@intel.com,
 mcanal@igalia.com, 	kernel@collabora.com, daniels@collabora.com,
 leandro.ribeiro@collabora.com, 	dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, 	linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,  Simona Vetter
 <simona.vetter@ffwll.ch>
Date: Mon, 29 Sep 2025 12:00:40 -0400
In-Reply-To: <52cce852-f4fb-4692-9318-1602fe878644@amd.com>
References: <20250917-mtk-post-blend-color-pipeline-v2-0-ac4471b44758@collabora.com>
	 <20250917-mtk-post-blend-color-pipeline-v2-5-ac4471b44758@collabora.com>
	 <ff53599d-fd7f-4791-a3e1-3269386c6b3e@bootlin.com>
	 <52cce852-f4fb-4692-9318-1602fe878644@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-2+b1 
MIME-Version: 1.0
X-ZohoMailClient: External
X-ZohoMail-Owner: <7307e84f9e4b0a8c67b82f7234f90bf83f201037.camel@collabora.com>+zmo_0_nfraprado@collabora.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250929_090201_803113_0351C6E0 
X-CRM114-Status: GOOD (  22.70  )
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

On Mon, 2025-09-29 at 05:40 -0400, Harry Wentland wrote:
>=20
>=20
> On 2025-09-19 08:42, Louis Chauvet wrote:
> >=20
> >=20
> > Le 18/09/2025 =C3=A0 02:43, N=C3=ADcolas F. R. A. Prado a =C3=A9crit=C2=
=A0:
> > > Add a new cap that drivers can set to signal they support post-
> > > blend
> > > color pipelines.
> > >=20
> > > Signed-off-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>
> >=20
> > Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
> >=20
> > > ---
> > > =C2=A0 drivers/gpu/drm/drm_ioctl.c | 3 +++
> > > =C2=A0 include/drm/drm_drv.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 6 =
++++++
> > > =C2=A0 include/uapi/drm/drm.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 6 +++++=
+
> > > =C2=A0 3 files changed, 15 insertions(+)
> > >=20
> > > diff --git a/drivers/gpu/drm/drm_ioctl.c
> > > b/drivers/gpu/drm/drm_ioctl.c
> > > index=20
> > > ff193155129e7e863888d8958458978566b144f8..01592d10e3465ddceddef94
> > > bc417f98d3ec12087 100644
> > > --- a/drivers/gpu/drm/drm_ioctl.c
> > > +++ b/drivers/gpu/drm/drm_ioctl.c
> > > @@ -304,6 +304,9 @@ static int drm_getcap(struct drm_device *dev,
> > > void=20
> > > *data, struct drm_file *file_
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 req->value =3D=
 drm_core_check_feature(dev, DRIVER_ATOMIC)
> > > &&
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev->mode_config.async_page_flip;
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
> > > +=C2=A0=C2=A0=C2=A0 case DRM_CAP_POST_BLEND_COLOR_PIPELINE:
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 req->value =3D drm_core_c=
heck_feature(dev,=20
> > > DRIVER_POST_BLEND_COLOR_PIPELINE);
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 default:
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -EINVAL=
;
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> > > diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
> > > index=20
> > > 42fc085f986dee9261f8b08c4fc7d93b8d6d9769..6b0f4904e69766232283d43
> > > 0c2540d30afef850f 100644
> > > --- a/include/drm/drm_drv.h
> > > +++ b/include/drm/drm_drv.h
> > > @@ -122,6 +122,12 @@ enum drm_driver_feature {
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * the cursor planes to work corr=
ectly).
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 DRIVER_CURSOR_HOTSPOT=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D BIT(9),
> > > +=C2=A0=C2=A0=C2=A0 /**
> > > +=C2=A0=C2=A0=C2=A0=C2=A0 * @DRIVER_POST_BLEND_COLOR_PIPELINE:
> > > +=C2=A0=C2=A0=C2=A0=C2=A0 *
> > > +=C2=A0=C2=A0=C2=A0=C2=A0 * Driver supports post-blend color pipeline=
.
> > > +=C2=A0=C2=A0=C2=A0=C2=A0 */
> > > +=C2=A0=C2=A0=C2=A0 DRIVER_POST_BLEND_COLOR_PIPELINE=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D BIT(10),
>=20
> Is this to let userspace know that the driver supports a
> post-blending color pipeline? Why couldn't userspace simply
> check whether crtc objects have "Color Pipeline" properties?

It is, and yes userspace could figure it out that way, though since the
property is only exposed after the client cap is set, it requires a
more involved setup: set the client cap, check for the property, if not
present unset the client cap.

With the driver cap introduced here, setting the client cap would fail
in the first place if the driver cap is not set, so in this case
userspace just tries to set the client cap, if it succeeds it knows it
can use color pipelines, if it fails it knows to use the legacy color
properties.

--=20
Thanks,

N=C3=ADcolas

>=20
> Harry
>=20
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* IMPORTANT: Below are all the legacy=
 flags, add new ones=20
> > > above. */
> > > diff --git a/include/uapi/drm/drm.h b/include/uapi/drm/drm.h
> > > index=20
> > > 27cc159c1d275c7a7fe057840ef792f30a582bb7..c6c53e57958e951204154ce
> > > 41a69696a6876f0e8 100644
> > > --- a/include/uapi/drm/drm.h
> > > +++ b/include/uapi/drm/drm.h
> > > @@ -812,6 +812,12 @@ struct drm_gem_change_handle {
> > > =C2=A0=C2=A0 * commits.
> > > =C2=A0=C2=A0 */
> > > =C2=A0 #define DRM_CAP_ATOMIC_ASYNC_PAGE_FLIP=C2=A0=C2=A0=C2=A0 0x15
> > > +/**
> > > + * DRM_CAP_POST_BLEND_COLOR_PIPELINE
> > > + *
> > > + * If set to 1, the driver supports post-blend color pipelines.
> > > + */
> > > +#define DRM_CAP_POST_BLEND_COLOR_PIPELINE=C2=A0=C2=A0=C2=A0 0x16
> > > =C2=A0 /* DRM_IOCTL_GET_CAP ioctl argument type */
> > > =C2=A0 struct drm_get_cap {
> > >=20
> >=20

