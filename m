Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75099EE20A4
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Feb 2026 14:03:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7h/m+OM+IZSrfWnlY71Nxs1XBfrAQxoSp8VocCjjCNo=; b=k43QsU+kt2MXkam5Q9H7dq+uOS
	VzGkOU5EBJUY2styH6RQpTZvvNcUXM6h5YyIJaChYuNxczGSFn+zJ4nx10CJoxGnr4wnMJFe3ktvq
	YVvWRHiz0YwE5htrazjq28tHWNGmMp9jJIsjb67oudKGM64F1UTx9+HvZ8vc6K/TzwZOPzpM4PQ2z
	1ilEynCuEPIlvh28YdSc2If0cGVqLjF1vZnAWPKOWblN5HLqfMAWcZaFjuruyY0L+aHY3mY1R6IPC
	P2i1JM2qMNaaB6lTNVuOmmpav94kMiV7zCmRABE+xrQMP9lYFSa7ZJ30T1K4K6ihIHi7J47ulIRvd
	sFdA+60A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voMQF-0000000BP89-17X4;
	Fri, 06 Feb 2026 14:02:59 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voMQC-0000000BP7W-0cDA;
	Fri, 06 Feb 2026 14:02:57 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1770386556; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=VR0eJx/pQ+e9fiD8Srp2mnUP05Y4jBuK6/X7+2iz3u8cS1uVVHAiFaNzqMxXmRMONOkza7x39xfM0bn/pAoAnfGdWhFn75EyXY26fzgSWPy6m3My7aea0ECemyFrl0KwxGMRZwZOmLJBEq51b9WmD6q57WJJqs5VXbVrMFXAZLI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1770386556; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=7h/m+OM+IZSrfWnlY71Nxs1XBfrAQxoSp8VocCjjCNo=; 
	b=e9R/Jw5DOGv0+XGxAIS1rb5XEipGrOqK++LC/CNAaX2a8SsBezkiow0N80G9nnLLy0o8OyRIVXwEdC6vDu3I9Nzn+ioKNpOOP4OcJBC9JBZtCFfFvaZBUHcNrtdQpp4zY+tDhBMQRF8wQBwGXh3bKXk/dB/rB5dAGSaC/zYI9SY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nfraprado@collabora.com;
	dmarc=pass header.from=<nfraprado@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1770386556;
	s=zohomail; d=collabora.com; i=nfraprado@collabora.com;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=7h/m+OM+IZSrfWnlY71Nxs1XBfrAQxoSp8VocCjjCNo=;
	b=j2wTubrDqNZt4Vkq343Qo2TSF2n/xtyUewmbCAT+/zj/uTPqgypQxgxzQAj1UDmG
	rraL+v7AhuR6OtWVECpz9hA3YtMTp/FNbjQoNV69NyCQypfS3SXviSQdaoazcKLhbQ5
	neR0R0fDJSBEyP5Q9snSiW8T9oMTfOrDxNXIgjT4=
Received: by mx.zohomail.com with SMTPS id 1770386554174417.2631923055201;
	Fri, 6 Feb 2026 06:02:34 -0800 (PST)
Message-ID: <45b44706a86046b795b3a29d3987b7764455b21d.camel@collabora.com>
Subject: Re: [PATCH 07/11] drm/colorop: Introduce HLG EOTF
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
Date: Fri, 06 Feb 2026 09:02:31 -0500
In-Reply-To: <20260206105102.1208fff9@eldfell>
References: <20251223-mtk-ovl-pre-blend-colorops-v1-0-0cb99bd0ab33@collabora.com>
		<20251223-mtk-ovl-pre-blend-colorops-v1-7-0cb99bd0ab33@collabora.com>
	 <20260206105102.1208fff9@eldfell>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-8 
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260206_060256_243426_A16ADE13 
X-CRM114-Status: GOOD (  24.51  )
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

On Fri, 2026-02-06 at 10:51 +0200, Pekka Paalanen wrote:
> On Tue, 23 Dec 2025 16:44:48 -0300
> N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com> wrote:
>=20
> > Introduce definition of a hybrid log-gamma electro-optical transfer
> > function for 1D Curve colorops.
> >=20
> > Signed-off-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>
> > ---
> > =C2=A0drivers/gpu/drm/drm_colorop.c |=C2=A0 1 +
> > =C2=A0include/drm/drm_colorop.h=C2=A0=C2=A0=C2=A0=C2=A0 | 10 ++++++++++
> > =C2=A02 files changed, 11 insertions(+)
> >=20
> > diff --git a/drivers/gpu/drm/drm_colorop.c
> > b/drivers/gpu/drm/drm_colorop.c
> > index fafe45b93ff8..a19e03fb9c7c 100644
> > --- a/drivers/gpu/drm/drm_colorop.c
> > +++ b/drivers/gpu/drm/drm_colorop.c
> > @@ -79,6 +79,7 @@ static const char * const
> > colorop_curve_1d_type_names[] =3D {
> > =C2=A0	[DRM_COLOROP_1D_CURVE_BT2020_OETF] =3D "BT.2020 OETF",
> > =C2=A0	[DRM_COLOROP_1D_CURVE_GAMMA22] =3D "Gamma 2.2",
> > =C2=A0	[DRM_COLOROP_1D_CURVE_GAMMA22_INV] =3D "Gamma 2.2 Inverse",
> > +	[DRM_COLOROP_1D_CURVE_HLG_EOTF] =3D "HLG",
> > =C2=A0};
> > =C2=A0
> > =C2=A0static const struct drm_prop_enum_list
> > drm_colorop_lut1d_interpolation_list[] =3D {
> > diff --git a/include/drm/drm_colorop.h b/include/drm/drm_colorop.h
> > index ee6454b08b2d..8ec98521607d 100644
> > --- a/include/drm/drm_colorop.h
> > +++ b/include/drm/drm_colorop.h
> > @@ -126,6 +126,16 @@ enum drm_colorop_curve_1d_type {
> > =C2=A0	 * The inverse of &DRM_COLOROP_1D_CURVE_GAMMA22
> > =C2=A0	 */
> > =C2=A0	DRM_COLOROP_1D_CURVE_GAMMA22_INV,
> > +
> > +	/**
> > +	 * @DRM_COLOROP_1D_CURVE_HLG_EOTF:
> > +	 *
> > +	 * enum string "HLG"
> > +	 *
> > +	 * Hybrid log-gamma transfer function.
> > +	 */
> > +	DRM_COLOROP_1D_CURVE_HLG_EOTF,
> > +
>=20
> Hi,
>=20
> if you read ITU-R BT.2100[1], you will see that the HLG EOTF has
> three
> parameters: the system gamma, the display nominal peak luminance, and
> the display black luminance. You cannot define a HLG EOTF or its
> inverse without these parameters. One might assume to derive the
> system
> gamma from the peak luminance, but I would like to leave that as a
> free
> parameter if possible, because I'm not convinced the formulas for it
> are
> universally applicable.
>=20
> The HLG OETF on the other hand is a fixed function. Did you mean that
> instead?

Thank you for the insights! But as it's obvious by now I don't have
enough information to answer that. Hopefully someone from MediaTek
could clarify what is the precise function implemented in hardware.

I didn't know about this difference between the HLG EOTF and OETF, but
what made me guess it would be the EOTF is that this curve is available
at the GAMMA block, which is right before blending the planes (the
pipeline topology I reverse-engineered from testing is on the cover-
letter), which I believe is usually done in the optical domain. But I
suppose one option would be that this curve really is the Inverse HLG
OETF, which wouldn't require additional parameters and also brings the
content to the optical domain.

--=20
Thanks,

N=C3=ADcolas

