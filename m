Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CB2AD1950F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jan 2026 18:24:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BCcFyc82BL5NjswhEby+qpxccQGrfqrQSMirNpyrbzw=; b=ikQvdF+dqIVW/t+FfprA+i96Ve
	96tzcac/R2LDkKHC6Yl9L5i/q6jmzjEw41pWOb2d/CudVjLqlAdfj5qlsCfH4GsIQ2lVK1bNPRyPJ
	6tlypCLfAN90U7vprZGln20otZ14x80A6PPgcWwRFpDz9Sg0JbF3yWFm6oQm1Ec+WcCSYy/iUmmL8
	AhZCL3Ly0hYuV4mLMK7gJEOmJqHELhe9Q+lA8aMVPRC4b8Ty2aOxc1nco0CoFMQbLz76BB8XBvplw
	YR1O1Uy4IDC7gFGJpOEkzvsvSO0gEN5jLMhtXKEQyQCf/hAtnP/NbwmjjXFtCo9/ZxT6hGOSXP9NB
	M2x3eeSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkRFr-0000000D4aL-0Qqh;
	Mon, 26 Jan 2026 18:24:03 +0000
Received: from sender4-op-o10.zoho.com ([136.143.188.10])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkRFo-0000000D4Zx-2ldK;
	Mon, 26 Jan 2026 18:24:01 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1769451824; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=SARI57JCNzYUUJvgh5eiMna3J/xzOo986mBnMyrAONQhI5Ckq1wW+md4pBj1D04wWCFgQk+ASsX/JkWViCpLqa8+V75LsyVjSPilsQawwi0Xtndi5X94D+e6u9/S4+x2xtyeI06vlzxIEZgwx+Zi6tc94erz6MvOOLJxT26Sg2c=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1769451824; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=BCcFyc82BL5NjswhEby+qpxccQGrfqrQSMirNpyrbzw=; 
	b=NzZXtJEyPvI5ud8vMlfP/9ZgKDH/t2ffp68CjMpG8UGpyZSflFkvJFa1K2wyk/V/qTvudZu8j+JhGHcnX25rENNSrDJ1BoD0HjYoepXHybwB+UXYD9Lt/RnRQoIQcBouG8XKLI92QgtQ1VtO4qfbk9aT+ptTzdY9lo+FPQguJjw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nfraprado@collabora.com;
	dmarc=pass header.from=<nfraprado@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1769451824;
	s=zohomail; d=collabora.com; i=nfraprado@collabora.com;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=BCcFyc82BL5NjswhEby+qpxccQGrfqrQSMirNpyrbzw=;
	b=lMJVcvAPA4rxh1kwJCUc8CEOB2ucn9J16f4xqryuUecWSHSQ05a8RjLJ7VVfmpnM
	x4zAGt0gsDnHAsXY3WNm7f2sjzEejobAv+luekczVyTceEi1b8865LHIlOxl2Cs4KC0
	xKYI3BQKMVIjVuFFVD+l+dEOxI5BTunLnlAAhlRU=
Received: by mx.zohomail.com with SMTPS id 176945182249825.35003191071928;
	Mon, 26 Jan 2026 10:23:42 -0800 (PST)
Message-ID: <1425ed35a21bcd9633524d4fc747b71a17068363.camel@collabora.com>
Subject: Re: [PATCH v4 2/4] drm: Add CRTC background color property
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
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 Matt Roper <matthew.d.roper@intel.com>
Date: Mon, 26 Jan 2026 15:23:35 -0300
In-Reply-To: <20251219-rk3588-bgcolor-v4-2-2ff1127ea757@collabora.com>
References: <20251219-rk3588-bgcolor-v4-0-2ff1127ea757@collabora.com>
	 <20251219-rk3588-bgcolor-v4-2-2ff1127ea757@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-8 
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_102400_749863_BA54A99B 
X-CRM114-Status: GOOD (  20.76  )
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

On Fri, 2025-12-19 at 23:46 +0200, Cristian Ciocaltea wrote:
> Some display controllers can be hardware programmed to show non-black
> colors for pixels that are either not covered by any plane or are
> exposed through transparent regions of higher planes.=C2=A0 This feature
> can
> help reduce memory bandwidth usage, e.g. in compositors managing a UI
> with a solid background color while using smaller planes to render
> the
> remaining content.
>=20
> To support this capability, introduce the BACKGROUND_COLOR standard
> DRM
> mode property, which can be attached to a CRTC through the
> drm_crtc_attach_background_color_property() helper function.
>=20
> Additionally, define a 64-bit ARGB format value to be built with the
> help of a couple of dedicated DRM_ARGB64_PREP*() helpers.=C2=A0 Individua=
l
> color components can be extracted with desired precision using the
> corresponding DRM_ARGB64_GET*() macros.
>=20
> Co-developed-by: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---
> =C2=A0drivers/gpu/drm/drm_atomic_state_helper.c |=C2=A0 1 +
> =C2=A0drivers/gpu/drm/drm_atomic_uapi.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0 4 ++
> =C2=A0drivers/gpu/drm/drm_blend.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 39 ++++++++++++++++--
> =C2=A0drivers/gpu/drm/drm_mode_config.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0 6 +++
> =C2=A0include/drm/drm_blend.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 =
4 +-
> =C2=A0include/drm/drm_crtc.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 12 =
++++++
> =C2=A0include/drm/drm_mode_config.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 5 +++
> =C2=A0include/uapi/drm/drm_mode.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 67
> +++++++++++++++++++++++++++++++
> =C2=A08 files changed, 133 insertions(+), 5 deletions(-)

You should also add a dump for this property in
drm_atomic_crtc_print_state().

>=20
> diff --git a/include/drm/drm_crtc.h b/include/drm/drm_crtc.h
> index 66278ffeebd6..d99a74258d3d 100644
> --- a/include/drm/drm_crtc.h
> +++ b/include/drm/drm_crtc.h
> @@ -274,6 +274,18 @@ struct drm_crtc_state {
> =C2=A0	 */
> =C2=A0	struct drm_property_blob *gamma_lut;
> =C2=A0
> +	/**
> +	 * @background_color:
> +	 *
> +	 * RGB value representing the pipe's background color.=C2=A0 The
> background
> +	 * color (aka "canvas color") of a pipe is the color that
> will be used
> +	 * for pixels not covered by a plane, or covered by
> transparent pixels
> +	 * of a plane.=C2=A0 The value here should be built using
> DRM_ARGB64_PREP*()
> +	 * helpers, while the individual color components can be
> extracted with
> +	 * desired precision via the DRM_ARGB64_GET*() macros.
> +	 */
> +	u64 background_color;
> +

/s/pipe/CRTC/ . pipe is an intel term but this is a generic CRTC
property.


Other than that,

Reviewed-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>

--=20
Thanks,

N=C3=ADcolas

