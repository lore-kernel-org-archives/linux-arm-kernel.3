Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9487AD6406B
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Nov 2024 17:10:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+Ud2Wm0N9rBWA5JqD8doezigwT2uqET+VTznhZjAgh0=; b=0VjBia1z7e4e3CsmW42YJdirJ/
	w7h+rZ5XDUOAY3OshQXrmLyemker78neWi2BhdGn3nIPkFqLKP9lpC2AYE1os0ddK5l8tvs5oVGFU
	c8BfXCkB9uLseUyhj0SOSwMCVrolFV0wAFVeprDS/luf+J1HjtBreZ7MHsQbVsb9hWcwuLI+VNmEL
	Duwg5VpDRZLxruIxHS6F4kAYQdIRjJpcg02OMXJYXjCFxTjvCTiof6i+u7NskqlHyy5e9b7WDP/Ya
	RzmmHrzySXn7cg43X9KwJQNK12TMN/TZfcgOcKRzcaeC3ILcuujP3TtppfMZtUzuzKcbBWBrG/MOE
	Ve+zkXrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9SVR-0000000BKmH-0cEB;
	Fri, 08 Nov 2024 17:10:45 +0000
Received: from sender4-op-o14.zoho.com ([136.143.188.14])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9SFY-0000000BIvp-1K2J;
	Fri, 08 Nov 2024 16:54:22 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1731084832; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=UggnLDiT8L9h57CG1XTcCfDiHQTXq+nrtR8IlMCdsDbCjMC12O0QmOUG5DYJ9hlBoxKSVzHlmb7SE5o+L9nIqBIELrBg4dKAvSs3vWYGwMTGLY7IAVxrFKlXHc41oR21rkGMi2NN4BZjIeZdO6D8NVkJQyo3N90gDqXBDrVHPcs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1731084832; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=+Ud2Wm0N9rBWA5JqD8doezigwT2uqET+VTznhZjAgh0=; 
	b=EyN1Pjj0KhgVMYXN5flONkrptqDwA4lmKqBXQmxOzULXNfFsUry8W/i0OULXyaqTGRLHHZOdblapSY34PXuJAqbliQihEPtdTDk40MSynfLuwZHdRPnXbC0C6VjQNf74BOZFdggtg8GwZhZdBWvKL7XHIVWKfOMkh/HYUROY8/0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=detlev.casanova@collabora.com;
	dmarc=pass header.from=<detlev.casanova@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1731084832;
	s=zohomail; d=collabora.com; i=detlev.casanova@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
	bh=+Ud2Wm0N9rBWA5JqD8doezigwT2uqET+VTznhZjAgh0=;
	b=EML1E7QNShCWastiTijne32mVrnn3qFFsmBIAi4841Os7zoO6t0f/jF16PUmmi+o
	2uLnjTKlfLxHBZ/9QWEw7YKcc3PFCo3mEIoHSiiv3cMGNTjXL/Msudldjy8cWnkF3Bn
	+cpN0tQ+AxU9Ye10reiLJRqJnMRMqfkpZQY5U51g=
Received: by mx.zohomail.com with SMTPS id 1731084830585742.5608083703597;
	Fri, 8 Nov 2024 08:53:50 -0800 (PST)
From: Detlev Casanova <detlev.casanova@collabora.com>
To: Andy Yan <andyshrk@163.com>
Cc: linux-kernel@vger.kernel.org, Sandy Huang <hjc@rock-chips.com>,
 Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Heiko Stuebner <heiko.stuebner@cherry.de>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Dragan Simic <dsimic@manjaro.org>, Chris Morgan <macromorgan@hotmail.com>,
 Diederik de Haas <didi.debian@cknow.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
 kernel@collabora.com
Subject: Re: [PATCH v2 1/3] vop2: Add clock resets support
Date: Fri, 08 Nov 2024 11:53:47 -0500
Message-ID: <1901885.tdWV9SEqCh@trenzalore>
In-Reply-To: <4605629.LvFx2qVVIh@trenzalore>
References: <20240522185924.461742-1-detlev.casanova@collabora.com>
 <6a3d3fb1.3755.18fa893239e.Coremail.andyshrk@163.com>
 <4605629.LvFx2qVVIh@trenzalore>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241108_085420_604499_04C51F7B 
X-CRM114-Status: GOOD (  26.15  )
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

On Friday, 8 November 2024 11:39:57 EST Detlev Casanova wrote:
> On Thursday, 23 May 2024 23:09:26 EST Andy Yan wrote:
> > Hi Detlev=EF=BC=8C
> >=20
> > At 2024-05-23 02:57:48, "Detlev Casanova" <detlev.casanova@collabora.co=
m>
>=20
> wrote:
> > >At the end of initialization, each VP clock needs to be reset before
> > >they can be used.
> > >
> > >Failing to do so can put the VOP in an undefined state where the
> > >generated HDMI signal is either lost or not matching the selected mode.
> >=20
> > Would you please provide a detailed description of your test case?
>=20
> The test case was to switch modes (using modetest) until the HDMI signal =
was
> lost on the TV side. It was also possible to detect the issue by tracking
> the HDMI TX Controller_VIDEO_MONITOR_STATUS[1-6] registers, especially at
> address 0x890, where the register would take the value `0x0000018c`.
>=20
> After adding these resets, the issue cannot be reproduced. I can share a
> script that reproduced this in the past (but this is an old patchset now,=
 so
> things could have changed)
>=20
> > >Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
> > >---
> > >
> > > drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 30 ++++++++++++++++++++
> > > 1 file changed, 30 insertions(+)
> > >
> > >diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> > >b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c index
> > >fdd768bbd487c..e81a67161d29a 100644
> > >--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> > >+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> > >@@ -17,6 +17,7 @@
> > >
> > > #include <linux/platform_device.h>
> > > #include <linux/pm_runtime.h>
> > > #include <linux/regmap.h>
> > >
> > >+#include <linux/reset.h>
> > >
> > > #include <linux/swab.h>
> > >=20
> > > #include <drm/drm.h>
> > >
> > >@@ -157,6 +158,7 @@ struct vop2_win {
> > >
> > > struct vop2_video_port {
> > >=20
> > > 	struct drm_crtc crtc;
> > > 	struct vop2 *vop2;
> > >
> > >+	struct reset_control *dclk_rst;
> > >
> > > 	struct clk *dclk;
> > > 	unsigned int id;
> > > 	const struct vop2_video_port_data *data;
> > >
> > >@@ -1915,6 +1917,26 @@ static int us_to_vertical_line(struct
> > >drm_display_mode *mode, int us)>
> > >
> > > 	return us * mode->clock / mode->htotal / 1000;
> > >=20
> > > }
> > >
> > >+static int vop2_clk_reset(struct vop2_video_port *vp)
> > >+{
> > >+	struct reset_control *rstc =3D vp->dclk_rst;
> > >+	struct vop2 *vop2 =3D vp->vop2;
> > >+	int ret;
> > >+
> > >+	if (!rstc)
> > >+		return 0;
> >=20
> > In fact, this check is not necessary here.  The following reset control
> > api
> > will check for NULL pointer
>=20
> Agreed, I'll do a rebased v3 and remove the check.

Actually, re-thinking about it, the check is done to avoid the udelay(10); =
if=20
there is no resets configured, so I'd rather keep it that way.

> > >+
> > >+	ret =3D reset_control_assert(rstc);
> > >+	if (ret < 0)
> > >+		drm_warn(vop2->drm, "failed to assert reset\n");
> > >+	udelay(10);
> > >+	ret =3D reset_control_deassert(rstc);
> > >+	if (ret < 0)
> > >+		drm_warn(vop2->drm, "failed to deassert reset\n");
> > >+
> > >+	return ret;
> > >+}
> > >+
> > >
> > > static void vop2_crtc_atomic_enable(struct drm_crtc *crtc,
> > >=20
> > > 				    struct drm_atomic_state
>=20
> *state)
>=20
> > > {
> > >
> > >@@ -2055,6 +2077,8 @@ static void vop2_crtc_atomic_enable(struct drm_c=
rtc
> > >*crtc,>
> > >
> > > 	vop2_vp_write(vp, RK3568_VP_DSP_CTRL, dsp_ctrl);
> > >
> > >+	vop2_clk_reset(vp);
> > >+
> > >
> > > 	drm_crtc_vblank_on(crtc);
> > > =09
> > > 	vop2_unlock(vop2);
> > >
> > >@@ -2706,6 +2730,12 @@ static int vop2_create_crtcs(struct vop2 *vop2)
> > >
> > > 		vp->data =3D vp_data;
> > > 	=09
> > > 		snprintf(dclk_name, sizeof(dclk_name), "dclk_vp%d", vp-
> >
> >id);
> >
> > >+		vp->dclk_rst =3D devm_reset_control_get_optional(vop2-
> >
> >dev, dclk_name);
> >
> > >+		if (IS_ERR(vp->dclk_rst)) {
> > >+		        drm_err(vop2->drm, "failed to get %s reset\n",
>=20
> dclk_name);
>=20
> > >+		        return PTR_ERR(vp->dclk_rst);
> > >+		}
> > >+
> > >
> > > 		vp->dclk =3D devm_clk_get(vop2->dev, dclk_name);
> > > 		if (IS_ERR(vp->dclk)) {
> > > 	=09
> > > 			drm_err(vop2->drm, "failed to get %s\n",
>=20
> dclk_name);





