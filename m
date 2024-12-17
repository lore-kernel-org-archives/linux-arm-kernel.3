Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B263BE77184
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 16:54:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PNGCj3qO41GS4cXYRVBXOzPOVUmBD/ROgttuhJ/6Vyk=; b=wNIOD+qMEqUeoUESZr39AQG8Eq
	TmHCPfYPv+yO3qyfndzg+oAtwqJQrVPIn26WFlTKriVsNaKD9oqmaO6hxpPV1XrWYbVoxFk0z/g8k
	mazBvSVFX4CBafJSCl6XVZ6Wz6kBe7HhrLQG9TJNN4w3gX7MuK4m0s174JtHEnkL16CU3MNwMB8ZY
	s/whD3Xs7hMWRw7i4oXO6vKuBjH7dc3rVV7M+24711MENoIwPBh1WGNGa92PZARSyjfGbZCdJDr1G
	8Pxrj/xDUSbg5y4jsuIC4DhX9moLUrC54zHeb3BN6fAXpHyhgUvsL316PySAmcVVuHmjGNFqwsjuN
	pwceh54g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNaqI-0000000EFpN-1QoG;
	Tue, 17 Dec 2024 16:54:42 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNapB-0000000EFjP-2UQM;
	Tue, 17 Dec 2024 16:53:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id A5A89A41D2C;
	Tue, 17 Dec 2024 16:51:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E537C4CED3;
	Tue, 17 Dec 2024 16:53:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734454412;
	bh=EOJspbm7MP7wG0IjvVUNU+l636arDNGqBCyTzRfpfbA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KlS7YtpFsL/gTqOzHFp9lpkcIkTrozL//Q/lMLNXbPW3Y6m2sgkt5CGABkkAjo0u2
	 es6xqBqUBVJ+EEjVk4ljZzWGXLhxrWbnql7aU1x/Gq+smMLm85OG8Q4XnOdNUdbKuJ
	 B9Kal/JswAvNPqnL3Fh80lNcUqkppz8sIqWUxhfVxzXvG+lxc+eHJf9YZXGWncIn1y
	 sB07MUtRE4rm4aIbIuWtq+9lB3CpP9P1A4+LvzRvIMVMluirSZAJ8DNP7m56yyYOgw
	 uesQmgEIrWcTGXVvI0gUxJdSoTfKoyJjYajgaslXGUBGUXTsPak061NnMfyBj6yWs1
	 CoVcBpdw3jrCw==
Date: Tue, 17 Dec 2024 17:53:29 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>, 
	Sandy Huang <hjc@rock-chips.com>, Andy Yan <andy.yan@rock-chips.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, kernel@collabora.com, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, FUKAUMI Naoki <naoki@radxa.com>
Subject: Re: [PATCH v2 3/5] drm/rockchip: vop2: Improve display modes
 handling on RK3588 HDMI0
Message-ID: <20241217-zealous-boisterous-llama-52bfcc@houat>
References: <20241211-vop2-hdmi0-disp-modes-v2-0-471cf5001e45@collabora.com>
 <1820767.5KxKD5qtyk@diego>
 <a4ex3s23r4k6wehyoaw3aylpcexfrclrxxykjpabhdfne2jgmu@ii6riiiga2zj>
 <1756448.izSxrag8PF@diego>
 <20241217-ubiquitous-refreshing-finch-aceade@houat>
 <c45ff74a-c9a4-4cf1-8530-04087e06b07a@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="j4mpk3mpmbzuirpe"
Content-Disposition: inline
In-Reply-To: <c45ff74a-c9a4-4cf1-8530-04087e06b07a@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_085333_781086_626DC007 
X-CRM114-Status: GOOD (  44.54  )
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


--j4mpk3mpmbzuirpe
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 3/5] drm/rockchip: vop2: Improve display modes
 handling on RK3588 HDMI0
MIME-Version: 1.0

On Tue, Dec 17, 2024 at 06:36:41PM +0200, Cristian Ciocaltea wrote:
> On 12/17/24 5:00 PM, Maxime Ripard wrote:
> > On Wed, Dec 11, 2024 at 07:01:15PM +0100, Heiko St=FCbner wrote:
> >> Am Mittwoch, 11. Dezember 2024, 18:47:44 CET schrieb Maxime Ripard:
> >>> On Wed, Dec 11, 2024 at 06:23:03PM +0100, Heiko St=FCbner wrote:
> >>>> Am Mittwoch, 11. Dezember 2024, 18:07:57 CET schrieb Maxime Ripard:
> >>>>> On Wed, Dec 11, 2024 at 12:15:07PM +0200, Cristian Ciocaltea wrote:
> >>>>>> The RK3588 specific implementation is currently quite limited in t=
erms
> >>>>>> of handling the full range of display modes supported by the conne=
cted
> >>>>>> screens, e.g. 2560x1440@75Hz, 2048x1152@60Hz, 1024x768@60Hz are ju=
st a
> >>>>>> few of them.
> >>>>>>
> >>>>>> Additionally, it doesn't cope well with non-integer refresh rates =
like
> >>>>>> 59.94, 29.97, 23.98, etc.
> >>>>>>
> >>>>>> Make use of HDMI0 PHY PLL as a more accurate DCLK source to handle
> >>>>>> all display modes up to 4K@60Hz.
> >>>>>>
> >>>>>> Tested-by: FUKAUMI Naoki <naoki@radxa.com>
> >>>>>> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.co=
m>
> >>>>>> ---
> >>>>>>  drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 34 +++++++++++++++=
+++++++++++++
> >>>>>>  1 file changed, 34 insertions(+)
> >>>>>>
> >>>>>> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/driver=
s/gpu/drm/rockchip/rockchip_drm_vop2.c
> >>>>>> index 8b2f53ffefdbf1cc8737b3a86e630a03a7fd9348..393fe6aa170aaee966=
3c4a6d98c1cd6a5ef79392 100644
> >>>>>> --- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> >>>>>> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> >>>>>> @@ -158,6 +158,7 @@ struct vop2_video_port {
> >>>>>>  	struct drm_crtc crtc;
> >>>>>>  	struct vop2 *vop2;
> >>>>>>  	struct clk *dclk;
> >>>>>> +	struct clk *dclk_src;
> >>>>>>  	unsigned int id;
> >>>>>>  	const struct vop2_video_port_data *data;
> >>>>>> =20
> >>>>>> @@ -212,6 +213,7 @@ struct vop2 {
> >>>>>>  	struct clk *hclk;
> >>>>>>  	struct clk *aclk;
> >>>>>>  	struct clk *pclk;
> >>>>>> +	struct clk *pll_hdmiphy0;
> >>>>>> =20
> >>>>>>  	/* optional internal rgb encoder */
> >>>>>>  	struct rockchip_rgb *rgb;
> >>>>>> @@ -220,6 +222,8 @@ struct vop2 {
> >>>>>>  	struct vop2_win win[];
> >>>>>>  };
> >>>>>> =20
> >>>>>> +#define VOP2_MAX_DCLK_RATE		600000 /* kHz */
> >>>>>> +
> >>>>>>  #define vop2_output_if_is_hdmi(x)	((x) =3D=3D ROCKCHIP_VOP2_EP_HD=
MI0 || \
> >>>>>>  					 (x) =3D=3D ROCKCHIP_VOP2_EP_HDMI1)
> >>>>>> =20
> >>>>>> @@ -1033,6 +1037,9 @@ static void vop2_crtc_atomic_disable(struct =
drm_crtc *crtc,
> >>>>>> =20
> >>>>>>  	vop2_crtc_disable_irq(vp, VP_INT_DSP_HOLD_VALID);
> >>>>>> =20
> >>>>>> +	if (vp->dclk_src)
> >>>>>> +		clk_set_parent(vp->dclk, vp->dclk_src);
> >>>>>> +
> >>>>>>  	clk_disable_unprepare(vp->dclk);
> >>>>>> =20
> >>>>>>  	vop2->enable_count--;
> >>>>>> @@ -2049,6 +2056,27 @@ static void vop2_crtc_atomic_enable(struct =
drm_crtc *crtc,
> >>>>>> =20
> >>>>>>  	vop2_vp_write(vp, RK3568_VP_MIPI_CTRL, 0);
> >>>>>> =20
> >>>>>> +	/*
> >>>>>> +	 * Switch to HDMI PHY PLL as DCLK source for display modes up
> >>>>>> +	 * to 4K@60Hz, if available, otherwise keep using the system CRU.
> >>>>>> +	 */
> >>>>>> +	if (vop2->pll_hdmiphy0 && mode->crtc_clock <=3D VOP2_MAX_DCLK_RA=
TE) {
> >>>>>> +		drm_for_each_encoder_mask(encoder, crtc->dev, crtc_state->encod=
er_mask) {
> >>>>>> +			struct rockchip_encoder *rkencoder =3D to_rockchip_encoder(enc=
oder);
> >>>>>> +
> >>>>>> +			if (rkencoder->crtc_endpoint_id =3D=3D ROCKCHIP_VOP2_EP_HDMI0)=
 {
> >>>>>> +				if (!vp->dclk_src)
> >>>>>> +					vp->dclk_src =3D clk_get_parent(vp->dclk);
> >>>>>> +
> >>>>>> +				ret =3D clk_set_parent(vp->dclk, vop2->pll_hdmiphy0);
> >>>>>> +				if (ret < 0)
> >>>>>> +					drm_warn(vop2->drm,
> >>>>>> +						 "Could not switch to HDMI0 PHY PLL: %d\n", ret);
> >>>>>> +				break;
> >>>>>> +			}
> >>>>>> +		}
> >>>>>> +	}
> >>>>>> +
> >>>>>
> >>>>> It seems pretty fragile to do it at atomic_enable time, even more so
> >>>>> since you don't lock the parent either.
> >>>>>
> >>>>> Any reason not to do it in the DRM or clock driver probe, and make =
sure
> >>>>> you never change the parent somehow?
> >>>>
> >>>> On rk3588 we have 3 dclk_s and 2 hdmi controllers. Each video-port c=
an
> >>>> use the clock generated from either the hdmi0phy or hdmi1phy, depend=
ing
> >>>> on which hdmi-controller it uses.
> >>>>
> >>>> So you actually need to know which vpX will output to which hdmiY to=
 then
> >>>> reparent that dclk to the hdmiphy output.
> >>>
> >>> The Rockchip nomenclature isn't super obvious to me, sorry. Is there a
> >>> datasheet for this somewhere? Also, does this vpX -> HDMI-Y mapping n=
eed
> >>> to be dynamic?
> >>
> >> VPs are CRTCs in drm-language and each of them can drive a differing
> >> number of output encoders. Those video-ports also have differing output
> >> characteristics in terms of supported resolution and other properties.
> >>
> >> The rk3588 TRM has leaked in a number of places, and if you find a
> >> TRM-part2, there is a section labeled "Display Output Interface Descri=
ption"
> >> that has a nice graphic for that.
> >>
> >> Or in short:
> >> - CRTC(VP)0 supports 8K resolution and can drive DP0+1, HDMI0+1, eDP0+1
> >>   [if I'm reading things correctly, 8K together with CRTC1 somehow)
> >> - CRTC(VP)1 supports 4K resolution and can drive DP0+1, HDMI0+1, eDP0+1
> >> - CRTC(VP)2 supports 4K resolution and can drive DP0+1, HDMI0+1, eDP01=
, DSI0+1
> >> - CRTC(VP)3 supports 2K resolution and can drive DSI0+1 and some BT112=
0,BT656
> >>
> >> so for the 3 higher resolution CRTCs there are essentially 6 or 8 outp=
ut options
> >> depending on the board design
> >=20
> > That's much clearer, thanks. I'm not entirely sure how that links to the
> > need for the PLL to change its parent depending on the ouput. Do you
> > need to always have all the outputs on the same PLL?
>=20
> One of the problems is that the PHY PLLs cannot be used as clock sources
> for resolutions above 4K@60Hz, while VOP2 on RK3588 supports up to 8K@60H=
z,
> which is supposed to be handled by the system CRU.

But can that system CRU drive resolutions lower than 4k@60? If so, why
do we bother with PHYs?

> Moreover, the 2 PLLs are shared between 3 out of the 4 video ports already
> mentioned by Heiko.  There is quite a bit of complexity in downstream
> driver to handle all possible usecases - see [1] for a brief description =
on
> how was that designed to work.

That's a generic allocation issue. Multiple drivers (vc4 for example)
has this issue for other components. It can be fairly easily dealt with
at atomic_check time.

Maxime

--j4mpk3mpmbzuirpe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ2GsgQAKCRAnX84Zoj2+
dujIAX96ph7wCOEKhEVEvFE7nIYDouKQ48JPrJAUDi5plPwo1A/2ruUYjui/h6aO
6e/R4ugBgM2dKMjhL2GPa78I2aqbjLCG/FGj4quQcjpkH3nmXDPHdkz5FaZJO0ee
9vQJK4Wzqw==
=+Pvw
-----END PGP SIGNATURE-----

--j4mpk3mpmbzuirpe--

