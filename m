Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCCCAD1950F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jan 2026 18:30:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hVd6diwc3mTM+TJy/I3dVmE0Ngl9ll/ws0dV8fch0dw=; b=Cn7KDFlMKckQAJfxGmKLTLZctF
	Tp656p71oxWLKjVaVyYzfHhTmniax4op1DTYLaxUKYSBUnGfJORrQ6J9chY43z61Z/BfyY9cQHk08
	evam15Xl1nAUv4lT/Hoer68Zoc8qH207iPIyR9j+VQQidaPK1orymUw0t6APszLUIjRgEZ7hdmv8b
	9mQcjCCfnPH7sUP93fWzR7iTl+8HIT5wlsGPEd0S296xaLqpJTifOGWYEA4xNcQcMcqhXuvKQApgo
	d75s3x4kHmgQqVmsRtoOQWLUwTYbujWXimkWTlIRP5s4ukxjrlP7R/bmpb6V1k4SaBiuxj3v149as
	vLwNM2xQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkRMA-0000000D55S-0WZA;
	Mon, 26 Jan 2026 18:30:34 +0000
Received: from sender4-op-o10.zoho.com ([136.143.188.10])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkRM7-0000000D54a-15pG;
	Mon, 26 Jan 2026 18:30:32 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1769452215; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=nTShMgbUt3DXdgrTr8iXm4Y4DAOwXbPQU9MUY2TK0SxsMMgXv3PdAbEPwsbQUapdCyaXm4N4+HLA+ZlYOzC0m2k2tedIIeK7lwLTM0QFXB0OKm0Vgoj1JIyU4m0nMgxF1FAH+3/VicisnpIxq0Q1cwXg/XplCYn6iWCxZ07v28I=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1769452215; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=hVd6diwc3mTM+TJy/I3dVmE0Ngl9ll/ws0dV8fch0dw=; 
	b=lcTAcL1SKd8QSh1VmvxeHjesbMxCMrLMnNxOfHdmbXzx1HET4G9agqSleiWQVeX9V8BFNt4t45qvf9GKrkyuIApz9Uu6S6151GXZ6CrtUNfQ3tWJAvIh+QiMkWOvbKBQQvshFaiTGn44rra7RJQiOREcsAyP7CYBBMokqkO+DCk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nfraprado@collabora.com;
	dmarc=pass header.from=<nfraprado@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1769452215;
	s=zohomail; d=collabora.com; i=nfraprado@collabora.com;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=hVd6diwc3mTM+TJy/I3dVmE0Ngl9ll/ws0dV8fch0dw=;
	b=AcaowKzpQTCzeaB33CnHLyfNtNEUQwRSJaQc72i/QVBSZhd4ZuO11PF1wE3OY3EC
	LfAEjmuT+Pk43Ht3wyJKPX6B72EWLGqjUeaj8SoOxT+JUfDpnEus+IUIC0Vc335TQ5C
	Nwb8YuSs/OLWlMHMaIkQSXEyoD6kytPui3Gm0A08=
Received: by mx.zohomail.com with SMTPS id 1769452213766652.6163551638421;
	Mon, 26 Jan 2026 10:30:13 -0800 (PST)
Message-ID: <d85cf4b299e929770a1b7f5be7ae61d76306e7d1.camel@collabora.com>
Subject: Re: [PATCH v4 4/4] drm/rockchip: vop2: Support setting custom
 background color
From: =?ISO-8859-1?Q?N=EDcolas?= "F. R. A. Prado" <nfraprado@collabora.com>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, Maarten Lankhorst
	 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Sandy Huang	 <hjc@rock-chips.com>, Heiko
 =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>,  Andy Yan
 <andy.yan@rock-chips.com>, Louis Chauvet <louis.chauvet@bootlin.com>,
 Haneen Mohammed	 <hamohammed.sa@gmail.com>, Melissa Wen
 <melissa.srw@gmail.com>
Cc: Robert Mader <robert.mader@collabora.com>, kernel@collabora.com, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
Date: Mon, 26 Jan 2026 15:30:07 -0300
In-Reply-To: <20251219-rk3588-bgcolor-v4-4-2ff1127ea757@collabora.com>
References: <20251219-rk3588-bgcolor-v4-0-2ff1127ea757@collabora.com>
	 <20251219-rk3588-bgcolor-v4-4-2ff1127ea757@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-8 
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_103031_349945_A9F33B35 
X-CRM114-Status: GOOD (  16.18  )
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

On Fri, 2025-12-19 at 23:47 +0200, Cristian Ciocaltea wrote:
> The Rockchip VOP2 display controller allows configuring the
> background
> color of each video output port.
>=20
> Since a previous patch introduced the BACKGROUND_COLOR CRTC property,
> which defaults to solid black, make use of it when programming the
> hardware.
>=20
> Note the maximum precision allowed by the display controller is
> 10bpc,
> while the alpha component is not supported, hence ignored.
>=20
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---
> =C2=A0drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 13 ++++++++++++-
> =C2=A0drivers/gpu/drm/rockchip/rockchip_drm_vop2.h |=C2=A0 4 ++++
> =C2=A02 files changed, 16 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> index 498df0ce4680..3a232d0d4acb 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> @@ -1554,6 +1554,7 @@ static void vop2_post_config(struct drm_crtc
> *crtc)
> =C2=A0	struct vop2_video_port *vp =3D to_vop2_video_port(crtc);
> =C2=A0	struct vop2 *vop2 =3D vp->vop2;
> =C2=A0	struct drm_display_mode *mode =3D &crtc->state->adjusted_mode;
> +	u64 bgcolor =3D crtc->state->background_color;
> =C2=A0	u16 vtotal =3D mode->crtc_vtotal;
> =C2=A0	u16 hdisplay =3D mode->crtc_hdisplay;
> =C2=A0	u16 hact_st =3D mode->crtc_htotal - mode->crtc_hsync_start;
> @@ -1599,7 +1600,11 @@ static void vop2_post_config(struct drm_crtc
> *crtc)
> =C2=A0		vop2_vp_write(vp, RK3568_VP_POST_DSP_VACT_INFO_F1,
> val);
> =C2=A0	}
> =C2=A0
> -	vop2_vp_write(vp, RK3568_VP_DSP_BG, 0);
> +	/* Background color is programmed with 10 bits of precision
> */
> +	val =3D FIELD_PREP(RK3568_VP_DSP_BG__DSP_BG_RED,
> DRM_ARGB64_GETR(bgcolor) >> 6);
> +	val |=3D FIELD_PREP(RK3568_VP_DSP_BG__DSP_BG_GREEN,
> DRM_ARGB64_GETG(bgcolor) >> 6);
> +	val |=3D FIELD_PREP(RK3568_VP_DSP_BG__DSP_BG_BLUE,
> DRM_ARGB64_GETB(bgcolor) >> 6);

Why aren't the DRM_ARGB64_GET*_BPC() helpers used here to get the
values with a custom precision?

--=20
Thanks,

N=C3=ADcolas

