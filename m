Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E072AC43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 08:50:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5EA+lXj/K8xJbCSjJ8LN+mG6y6RHNdOMcGifVOFlxyU=; b=KAkFikvHESmBruGgX0bR7vvbxQ
	FV2IB454aGW76t9lHX8FghDq4zqeAYJ/ukFmAEw9guj6USFjOF+yq5vlp2ZFP+80hJn04sNENmum3
	7lqCe1/LRf39a47A+8900jJGV5RbKqdz55I1t93H2NBexDJeSqrl9Zmh/etw3QBkSQ93/OpAN8MuL
	2zBc0/5ykSKB1MsCMBQUkg94wCrm1qeozkYJtyGBhS1Sef+IN3djCLFIu8V99NXduIipEWBnXfQY0
	Ipq/6qlhEVGJLsA0TnMscsjDAhxOFYE2khqrg0K0krcojyP0Lc4BqfyT5MLoqF1uh+fiEqGiQWD1Y
	r3jOipRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjCMx-00000008dUM-22YL;
	Mon, 13 Jul 2026 08:50:31 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjCMv-00000008dTo-2wZf;
	Mon, 13 Jul 2026 08:50:29 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 1DDEA409AF;
	Mon, 13 Jul 2026 08:50:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A3A41F000E9;
	Mon, 13 Jul 2026 08:50:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783932629;
	bh=5EA+lXj/K8xJbCSjJ8LN+mG6y6RHNdOMcGifVOFlxyU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=GAfRK4RMYumLIlAlyNQT4Tx+dq6pl7jiQuPzDy+DiWIJODpVK5AIuBW2p4jq78wye
	 SSNgwu9BZX3OR1rI9dVAffgP1pnH+XcNGaJau8LdZ/E9NJlXF2WSIjWHjANfFgJsw1
	 9S0ebP8zQD37VgV0t4ebLmAV3XjSsatKfeg7R31HiA3Bg1zsWlx2C5nJ28lGHcYCX0
	 czgob1qUQarJUBA4ZHbtAi+dm+4iU8Ir3KzIOz4XD0RmIuVj7Ma8lomiKZFLkN0etT
	 gtN4FFulvMg5NhrnJW5N6YMpnHAbTszDQDSulW8c9hIKoZXCw/Pz6NkzvZ7YBaW4F1
	 NaAx0leZq+Nww==
Date: Mon, 13 Jul 2026 10:50:26 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Luca Ceresoli <luca.ceresoli@bootlin.com>, Sandy Huang <hjc@rock-chips.com>, 
	Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>, Andy Yan <andy.yan@rock-chips.com>, 
	Daniel Stone <daniels@collabora.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	=?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>, Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
	kernel@collabora.com, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v8 04/39] drm/connector: Add HDMI 2.0 scrambler
 infrastructure
Message-ID: <20260713-statuesque-nonchalant-seagull-b9c39d@houat>
References: <20260702-dw-hdmi-qp-scramb-v8-0-d79890d00b6a@collabora.com>
 <20260702-dw-hdmi-qp-scramb-v8-4-d79890d00b6a@collabora.com>
 <tjsidlnvswo2rdhqa6jybxrnb47lxgmxdlfrfbasuh67wjbqoy@3a45n3zawvnf>
 <17753a1c-824a-4835-ac2d-8b2796bba1eb@collabora.com>
 <534b921c-638c-4fc3-b89e-5dfc1f269f96@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="btsl2kbqtfweqxel"
Content-Disposition: inline
In-Reply-To: <534b921c-638c-4fc3-b89e-5dfc1f269f96@collabora.com>
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


--btsl2kbqtfweqxel
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v8 04/39] drm/connector: Add HDMI 2.0 scrambler
 infrastructure
MIME-Version: 1.0

On Thu, Jul 09, 2026 at 10:25:54PM +0300, Cristian Ciocaltea wrote:
> On 7/3/26 11:54 PM, Cristian Ciocaltea wrote:
> > On 7/3/26 5:34 PM, Dmitry Baryshkov wrote:
> >> On Thu, Jul 02, 2026 at 05:46:17PM +0300, Cristian Ciocaltea wrote:
> >>> Add the connector-level infrastructure to support HDMI 2.0 scrambling:
> >>>
> >>> - A scrambler_supported flag to indicate whether the source supports =
the
> >>>   scrambling capability, in which case the newly introduced
> >>>   .scrambler_{enable|disable}() callbacks in drm_connector_hdmi_funcs
> >>>   are mandatory
> >>
> >> Do we need a flag? What would it mean if the flag is set, but the
> >> callbacks are not? Can we drop the flag and use the presence of the
> >> callbacks as a way to identify that scrambler is enabled?
> >=20
> > The flag is intended to be set only within drmm_connector_hdmi_init_wit=
h_caps()
> > when drivers advertise HDMI 2.x capability, in which case it also ensur=
es the
> > callbacks are provided. =20
> >=20
> > We could drop the flag and instead have the init helper clear the callb=
acks if
> > they were provided for HDMI 1.x.  This might slightly reduce code reada=
bility,
> > as it relies on checking the presence of individual callbacks - especia=
lly since
> > we plan to extend this further with HDMI 2.1 support, providing four or=
 five
> > additional FRL-specific callbacks.
>=20
> I tried to replace the flag with a helper that checks the presence of (on=
e of)
> the callbacks, but it's not straightforward to unset those for non-HDMI 2=
=2Ex
> cases since the hdmi_funcs argument is immutable.

I'm not sure why we would need to unset them. If the driver states that
it support HDMI 2.0, then it needs to be there, if it doesn't, then who
cares? it's not going to be used. We can log a warning that it's
inconsistent I guess, but there's no need to actively remove it.

> Also, rejecting that use case is less than ideal, since we would restrict
> reusing the struct instance, e.g. to support HW revisions with varying
> scrambling capabilities.

We can have several structures instances in that case.

Maxime

--btsl2kbqtfweqxel
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCalSmyAAKCRAnX84Zoj2+
dqGdAYD5AllkwZ5KScpMKFfTsPXCYSRxrpnk5TeTUILBIQvpyckLo8DEtaScoJSo
4zq9u/kBf2kkB5P2HpvpZXnVt76fCSHC8hIJL+W0X8GmcJGPYgL00NN7UrBicM/Q
tOYFx0xZww==
=921J
-----END PGP SIGNATURE-----

--btsl2kbqtfweqxel--

