Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC11ACD6E4A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 14:05:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uvb5N2t0ImORcoosIY39Tpj5MtrUeKYq4hi4uWxUSeU=; b=cNZztTV4nprxwrzWHJo0Yafrtq
	UApwr59TUAUbxZSEbHNY07k1984yCAFm8xM1fFpYKVjip5f0oGdp9Bc/xEpsve3hUzDquvvSomJxK
	LcgyWbgEjM6B5g6QlWuNm2PdDRYlf9gPgFuFOd/h+mL6BrkxA+vaL/Z/GJbhz1I2b5ObXp0Jiku4C
	E4IhBNo6RPMqiyEZvOFj/gb312x2PQEeOgQ5xN5MyvPWTE8W4YMaQ4BgVO8+cxvmKd2BXmotPQ3G1
	hB5jXHr3/ks3NzTjWBBMyROGKYSVDXPZ+JwZ9ZV7sjcLpg5HVC7gwZ8Y1HbRfWpZigRopa1lZ7LFx
	b4hN3aMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSxpV-00000007U51-0uJO;
	Fri, 29 May 2026 14:04:53 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSxpS-00000007U4C-2TaF;
	Fri, 29 May 2026 14:04:51 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id BB16240B73;
	Fri, 29 May 2026 14:04:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E97FA1F00893;
	Fri, 29 May 2026 14:04:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780063489;
	bh=uvb5N2t0ImORcoosIY39Tpj5MtrUeKYq4hi4uWxUSeU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=PzF0txoYlN14C5R/lIRWeNek2EP4bG+AH1WlPwfb072fXV3CLH6nq3c2LNyM5bl+x
	 MPE8VuJmFglQF2ykVzaI+Q3QYY1oUXPPLMMWbYFrjrGjbnvxhmYmyRWVZBFK7QTKls
	 9f1aEeJMylDnsegbfl3ejKp77Q+9FZutTFtSEIOjlyUevHQMsFJpETzJbtd98nsjMk
	 CWQ7MkxmiivOJTUgd4ddF7VmVczKW3lXfh4AQPIJI0RADND+G+uavoXDjpUpiSNoRv
	 JO76wQoVwSZR5UyLm6wnAap0vfnQfGgLjHimxMZdvzN92VqZbBfdyjElIwDI24AgyR
	 XcAyoEiKW6k1Q==
Date: Fri, 29 May 2026 16:04:46 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Adrien Grassein <adrien.grassein@gmail.com>, 
	Jani Nikula <jani.nikula@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Rob Clark <robin.clark@oss.qualcomm.com>, 
	Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, 
	Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Pengyu Luo <mitltlatltl@gmail.com>, Nikita Travkin <nikita@trvn.ru>, 
	Yongxing Mou <yongxing.mou@oss.qualcomm.com>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
	linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH RESEND v3 1/6] drm/connector: report IRQ_HPD events to
 drm_connector_oob_hotplug_event()
Message-ID: <20260529-screeching-rugged-shellfish-4dcde3@houat>
References: <20260513-hpd-irq-events-v3-0-086857017f16@oss.qualcomm.com>
 <20260513-hpd-irq-events-v3-1-086857017f16@oss.qualcomm.com>
 <20260521-funny-astonishing-mackerel-cc5a01@penduick>
 <vpd5hyote5wspmlpad64kf5peoy5g7wv6c7xjn6ammcmjtai7r@q2tarmr5aoqn>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="igbxyj2yvssgkryc"
Content-Disposition: inline
In-Reply-To: <vpd5hyote5wspmlpad64kf5peoy5g7wv6c7xjn6ammcmjtai7r@q2tarmr5aoqn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_070450_694768_68193A9F 
X-CRM114-Status: GOOD (  36.59  )
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


--igbxyj2yvssgkryc
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH RESEND v3 1/6] drm/connector: report IRQ_HPD events to
 drm_connector_oob_hotplug_event()
MIME-Version: 1.0

On Thu, May 21, 2026 at 03:05:11PM +0300, Dmitry Baryshkov wrote:
> On Thu, May 21, 2026 at 09:47:29AM +0200, Maxime Ripard wrote:
> > On Wed, May 13, 2026 at 09:23:21PM +0300, Dmitry Baryshkov wrote:
> > > The DisplayPort standard defines a special kind of events called IRQ.
> > > These events are used to notify DP Source about the events on the Sink
> > > side. It is extremely important for DP MST handling, where the MST
> > > events are reported through this IRQ.
> > >=20
> > > In case of the USB-C DP AltMode there is no actual HPD pulse, but the
> > > events are ported through the bits in the AltMode VDOs.
> > >=20
> > > Extend the drm_connector_oob_hotplug_event() interface and report IRQ
> > > events to the DisplayPort Sink drivers.
> > >=20
> > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > > ---
> > >  drivers/gpu/drm/drm_connector.c          |  5 ++++-
> > >  drivers/usb/typec/altmodes/displayport.c | 15 +++++++++++----
> > >  include/drm/drm_connector.h              | 19 ++++++++++++++++++-
> > >  3 files changed, 33 insertions(+), 6 deletions(-)
> > >=20
> > > diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_co=
nnector.c
> > > index 47dc53c4a738..edee9daccd51 100644
> > > --- a/drivers/gpu/drm/drm_connector.c
> > > +++ b/drivers/gpu/drm/drm_connector.c
> > > @@ -3510,6 +3510,8 @@ struct drm_connector *drm_connector_find_by_fwn=
ode(struct fwnode_handle *fwnode)
> > >   * drm_connector_oob_hotplug_event - Report out-of-band hotplug even=
t to connector
> > >   * @connector_fwnode: fwnode_handle to report the event on
> > >   * @status: hot plug detect logical state
> > > + * @extra_status: additional information provided by the sink withou=
t changing
> > > + * the HPD state (or in addition to such a change).
> > >   *
> > >   * On some hardware a hotplug event notification may come from outsi=
de the display
> > >   * driver / device. An example of this is some USB Type-C setups whe=
re the hardware
> > > @@ -3520,7 +3522,8 @@ struct drm_connector *drm_connector_find_by_fwn=
ode(struct fwnode_handle *fwnode)
> > >   * a drm_connector reference through calling drm_connector_find_by_f=
wnode().
> > >   */
> > >  void drm_connector_oob_hotplug_event(struct fwnode_handle *connector=
_fwnode,
> > > -				     enum drm_connector_status status)
> > > +				     enum drm_connector_status status,
> > > +				     enum drm_connector_status_extra extra_status)
> > >  {
> > >  	struct drm_connector *connector;
> > > =20
> > > diff --git a/drivers/usb/typec/altmodes/displayport.c b/drivers/usb/t=
ypec/altmodes/displayport.c
> > > index 35d9c3086990..7182a8e2e710 100644
> > > --- a/drivers/usb/typec/altmodes/displayport.c
> > > +++ b/drivers/usb/typec/altmodes/displayport.c
> > > @@ -189,7 +189,9 @@ static int dp_altmode_status_update(struct dp_alt=
mode *dp)
> > >  	} else {
> > >  		drm_connector_oob_hotplug_event(dp->connector_fwnode,
> > >  						hpd ? connector_status_connected :
> > > -						      connector_status_disconnected);
> > > +						      connector_status_disconnected,
> > > +						(hpd && irq_hpd) ? DRM_CONNECTOR_DP_IRQ_HPD :
> > > +								   DRM_CONNECTOR_NO_EXTRA_STATUS);
> >=20
> > Since the extra status itself, and what the options mean, are DP specif=
ic, do we really want to
> > extend drm_connector_oob_hotplug_event()? I think I'd prefer to have a =
DP specific variant, with its
> > own set of parameters.
>=20
> I can try arguing that drm_connector_oob_hotplug_event() is DP-specific,
> there are no other users for it, only the DP AltMode driver.
>=20
> Anyway, do you just mean new API here or new API and a new connector
> callback?

If drm_connector_oob_hotplug_event is truly only used for DP, then I
don't mind keeping it as is but we should make it more obvious and
document it, both in the function documentation, but also by having a
better name for the extra status. drm_connector_dp_oob_status maybe?

Maxime

--igbxyj2yvssgkryc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCahmc9AAKCRAnX84Zoj2+
djO+AX9GD3UDymFlG73wL8mTckVK3mCkw2t3NcDn6047apScJWb1XRrN+lO8trM6
73C+84cBfRq9ZR8HId0E6cdzLBqaHSBYmjoTlzIx0kiwM44c3apdybiB2SfFjOBv
SX2rCZoICg==
=Fbz6
-----END PGP SIGNATURE-----

--igbxyj2yvssgkryc--

