Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60680C44520
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 18:01:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PI5Oxb9HCfJR7oPD5XfJPeD09VaVWbnvfaj5lOSTQXI=; b=uR0gMS4Xr0mm5OKF1/afIEAs7M
	lvLKg7x3qKqnEL+iwMGZQH/ZmumYcbTGMlG4FkSTxH2tR6HwjAoRiXphsaE+Hr14NLokT7EkyO7uI
	Q6fyZfgtX8hmj0LKudFLSvslWhmTwFp7zs3GNjC8oxzcrwzcbzvSS8ap9cTT6NZnOyaGN26hndncr
	Bdtv/0A1CWBzNz4wSq1aSF7QNCC5b0UEo7C211G1UG0tNoQF5427do/CM/0nw0rc3OnmhJIDxnVIB
	boUKQrzXRxFWTSnlRlrinwQKg9IcKh30j4Rv+Mcl3LpuGfQGnrhKfiF8+sbXC5ICehsD6UJvZVnt8
	0x9L4aDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlsIZ-00000007b7r-2KQa;
	Mon, 20 Jul 2026 18:01:03 +0000
Received: from sender4-op-o11.zoho.com ([136.143.188.11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlsIV-00000007b6f-3L8v;
	Mon, 20 Jul 2026 18:01:01 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1784570401; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=RT/1oyKIMcGmM+6SQWFkdyVqHta/RRyy0Yu4g4mm2VfK93pSIopDF6QoHT41cPIbnPr7Hy9dMb4JYN0l9C+h3MeYgS6BCda64OY2r5L2u/L/ht2dBIDLPOt5PFzx6a4nrkAQFD9dkerk6zeq67tC8mrABV3OdCH9YNp+NTUWEv0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1784570401; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=PI5Oxb9HCfJR7oPD5XfJPeD09VaVWbnvfaj5lOSTQXI=; 
	b=i/mkP3SSxYV9S4bVnCbWrIBof1StGDfQlRgeCnXvGVBJAGkOqDaLIzvZd4/OzOOrTPfQBbeUsqtMMAoH2wB3GRl+3JaSSXMmZ5JgVNuXmXukC6VT/pluuNyx1YvvtvVdAb5HfNbNKNhsspzV5ZTiYjA8dK1vueh8M0zrwCYP+QE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.reichel@collabora.com;
	dmarc=pass header.from=<sebastian.reichel@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1784570401;
	s=zohomail; d=collabora.com; i=sebastian.reichel@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=PI5Oxb9HCfJR7oPD5XfJPeD09VaVWbnvfaj5lOSTQXI=;
	b=IQqR+m+U/mjAqGizVvFMly5QcjIIaE/3vePjAzA6K22TI7658slUzACY11LrIn7m
	edZZJ3OOCmrkW+Zp88L8qw86AYN/EMlgxSCqJPV4S33e6eFomYSt6mup8so6MjN0buj
	rTE1wUvmp1WrV7i93mJ+hhrZCZ2KdghDyrbpcswM=
Received: by mx.zohomail.com with SMTPS id 1784570399288490.3932171563042;
	Mon, 20 Jul 2026 10:59:59 -0700 (PDT)
Received: by venus (Postfix, from userid 1000)
	id 26FF41809C8; Mon, 20 Jul 2026 19:59:53 +0200 (CEST)
Date: Mon, 20 Jul 2026 19:59:53 +0200
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Chaoyi Chen <kernel@airkyi.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Sandy Huang <hjc@rock-chips.com>, 
	Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>, Andy Yan <andy.yan@rock-chips.com>, 
	Vinod Koul <vkoul@kernel.org>, Chaoyi Chen <chaoyi.chen@rock-chips.com>, 
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-phy@lists.infradead.org
Subject: Re: [PATCH v3 1/5] drm/bridge: Implement generic USB Type-C DP HPD
 bridge
Message-ID: <al5fYojQ0kJw2okg@venus>
References: <20260717072323.96-1-kernel@airkyi.com>
 <20260717072323.96-2-kernel@airkyi.com>
 <alpeAqKo72pwOEnX@venus>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qn43nqqaph5qazm4"
Content-Disposition: inline
In-Reply-To: <alpeAqKo72pwOEnX@venus>
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-0.2.10.1.5.2/284.544.97
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_110059_889660_F84CF393 
X-CRM114-Status: GOOD (  28.61  )
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


--qn43nqqaph5qazm4
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 1/5] drm/bridge: Implement generic USB Type-C DP HPD
 bridge
MIME-Version: 1.0

Hi,

On Fri, Jul 17, 2026 at 07:19:29PM +0200, Sebastian Reichel wrote:
> On Fri, Jul 17, 2026 at 03:23:19PM +0800, Chaoyi Chen wrote:
> > From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> >=20
> > The HPD function of Type-C DP is implemented through
> > drm_connector_oob_hotplug_event(). For embedded DP, it is required
> > that the DRM connector fwnode corresponds to the Type-C port fwnode.
> >=20
> > To describe the relationship between the DP controller and the Type-C
> > port device, we usually using drm_bridge to build a bridge chain.
> >=20
> > Now several USB-C controller drivers have already implemented the DP
> > HPD bridge function provided by aux-hpd-bridge.c, it will build a DP
> > HPD bridge on USB-C connector port device.
> >=20
> > But this requires the USB-C controller driver to manually register the
> > HPD bridge. If the driver does not implement this feature, the bridge
> > will not be create.
> >=20
> > So this patch implements a generic DP HPD bridge based on
> > aux-hpd-bridge.c. It will monitor Type-C bus events, and when a
> > Type-C port device containing the DP svid is registered, it will
> > create an HPD bridge for it without the need for the USB-C controller
> > driver to implement it.
> >=20
> > Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> > Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> > Reviewed-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> > ---
>=20
> Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> Tested-by: Sebastian Reichel <sebastian.reichel@collabora.com> # ArmSom S=
ige5
>=20
> I gave this a test together with the RK3588/RK3576 USB-C DP AltMode
> patches I'm working on. As the fusb302 does a manual registration
> for the DRM bridge in its probe function, the bridge is registered
> twice:
>=20
> root@sige5 # cat /sys/kernel/debug/dri/bridges
> ...
> bridge[1]: drm_aux_hpd_bridge_funcs
> 	refcount: 4
> 	type: [10] DP
> 	OF: /soc/i2c@2ac50000/typec-portc@22/connector:usb-c-connector
> 	ops: [0x4] hpd
> bridge[2]: drm_aux_hpd_bridge_funcs
> 	refcount: 2
> 	type: [10] DP
> 	OF: /soc/i2c@2ac50000/typec-portc@22/connector:usb-c-connector
> 	ops: [0x4] hpd
> ...
>=20
> Apparently the USB-C DP AltMode keeps working, so this just wastes
> a few CPU cycles and some memory. So this can land and then we can
> remove the manual code from the driver as a follow-up step. I also
> gave that a try and things keep working. I won't send the fusb302
> patch for now to ensure its not applied before this patch lands.

The above test was done with a kernel having all config options
built-in (i.e. no modules). Using arm64 defconfig one ends up with

CONFIG_DRM_AUX_HPD_TYPEC_BRIDGE=3Dm

But the resulting 'aux-hpd-typec-dp-bridge' module is not loaded
automatically resulting in missing bridge registration. Running
'modprobe aux-hpd-typec-dp-bridge' manually in the booted system
does not work either as the TypeC controller has already been
registered and no new BUS_NOTIFY_ADD_DEVICE is generated.

Greetings,

-- Sebastian

--qn43nqqaph5qazm4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmpeYgsACgkQ2O7X88g7
+pp+TQ//dO/L/gdv3kllo402Dewki5Weq5We6e9xzWhRnm2HCSo/GBdqWFfuxZhw
lQJeUcgDS7NJw/Btt1+oseitVUxklDA9U5tdh21nLt6lZ8xybUI4ejCM++GOgCbv
rd4Qm9QEsWBL5dSSL7REXU4QqoZMDf7SDO/JMWRyxki0WT4E1HFD1Rq0q/XWnD0/
zVWg01K10udFR7cMY9o8pAEXdqBvMiOncBGmHgHl/cx87yz7XPSDfhzN5y5bHPIs
UEZr8vv6nOrhGkOxMqBXs86AEvdkBlOHl02UA2RU5MSukt2qIFz7IXRDxmcTruvq
U9Q5ydGWrXNqOYvtaEgmjV844bmy4RVqRKyJTy/OlDLjLvMbdKbvo4s2v9vc1Q9a
JKlWr8NlaGUh6vcH/gPgRZVzWp0XrHez3bDxeHK/8cLhzmhB2s6Q587ToGrUuDSp
AryltU/IrpTYhOMdXt+hjIHRwo4fVYbKfMP/6ccgL3cVHwqncrhNSKSsoXgqXpsG
XnB8Ptw8j6khSsJYsvz7lknc+CEQnC5Xm/Ltg0o9+Co7pY3Elph1W4dM2wqGM+mA
xnYe7MtpRuA2wkMmBieyKremABtImf7OAyM6xY0qFJx925K46MwEbDJS+PMw+8PT
lpUfz3PvTPEY0UaKQhXusyDfWCQpftab5PHy+kH7BBVDWY1V0hY=
=yeQL
-----END PGP SIGNATURE-----

--qn43nqqaph5qazm4--

