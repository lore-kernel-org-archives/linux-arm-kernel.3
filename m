Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C8EFC44507
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 19:01:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wx7zVh6+YVdbciHjwu98zS3vCnhsUo+yZKW7w0GKraQ=; b=xJ/xl1nwuH7AzffpDS55GqCxyX
	59fARlAY9owS4bDKO33QSbC3nXwFRMblQVDtl/XkHTHLV1Tp5YLYx1eb8j/10XvRIENHtp9ZmTlAl
	sXJ3EW0EaN2Uved/xy8bOraZFnwOZHyxmcW6oHrHvxS+/N+cVUJsFhI52Y4dxomjaqqkxR+tzG0Gr
	64R34UK68RhYKN9Y2wYOIzAqHzHOoq4bShn3qRds1592qKW/JdQ9CSnneaZIXKcXQ88OhJv8w5lI9
	XK6Su5f5mCcSVNCmpuWSqtspOaNxPFnqcExpObZdg1beKOgcFTAXo/ABOT9XkiCre5S4mGkiuUe87
	gTM9tfhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk4qn-0000000FkHX-2dn4;
	Wed, 15 Jul 2026 19:00:57 +0000
Received: from sender4-op-o11.zoho.com ([136.143.188.11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk4ql-0000000FkGw-1Nt3;
	Wed, 15 Jul 2026 19:00:56 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1784142021; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=HGclnZF4WMpho9f8V4+4GrYlMK3objtIhSbW17+1WNUQwDd/kYGpQsleFCCm/JeuxCvhC5l4/Q6rjvYeNggq/qv90UZgFiN+ssyU6JuyXpgk5gUikVbSoRm+WjWDcwuSUDe5hI8HPWEcyA5OKQIHfMAnVTQfzgGIlrmSXw90uZg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1784142021; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=wx7zVh6+YVdbciHjwu98zS3vCnhsUo+yZKW7w0GKraQ=; 
	b=kWbrsMBolZ8Zfd49lpKd4UdMZQsHUxhMJnme3IJOIYSgpYOd3trna9rOk001ngldl4jM1+egA96LKFE1c8GOX+xSM318lTCHmGxbEZO2aNNVSvQgsUHPDtIy0MQF/6DAtCuzqqqKOvHq18E6tzG93e2SBBkHfG7t4msK0EC18Wg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.reichel@collabora.com;
	dmarc=pass header.from=<sebastian.reichel@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1784142021;
	s=zohomail; d=collabora.com; i=sebastian.reichel@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=wx7zVh6+YVdbciHjwu98zS3vCnhsUo+yZKW7w0GKraQ=;
	b=VniaRhcF9Kv5Ccr1lpzh2sryx9dhlO7JBY9X1tBtK97Hi/EftXhhFR9/g9hKeOZV
	62ZCj4EGeocih9kVJgLoblFtMpmm/+yEgh+f9CIlEIcsin+Rh4XwkgskLCzY82ra6Se
	AVxGvsePHXkfiR6ZLCewtjbf+MSe5xpStpVIwafs=
Received: by mx.zohomail.com with SMTPS id 1784142018690682.4989574920343;
	Wed, 15 Jul 2026 12:00:18 -0700 (PDT)
Received: by venus (Postfix, from userid 1000)
	id 178E9180820; Wed, 15 Jul 2026 21:00:12 +0200 (CEST)
Date: Wed, 15 Jul 2026 21:00:12 +0200
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Andy Yan <andyshrk@gmail.com>
Cc: Sandy Huang <hjc@rock-chips.com>, 
	Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>, Andy Yan <andy.yan@rock-chips.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, Damon Ding <damon.ding@rock-chips.com>, 
	Dmitry Baryshkov <lumag@kernel.org>, Alexey Charkov <alchark@gmail.com>, 
	dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, kernel@collabora.com, linux-arm-kernel@lists.infradead.org, 
	yubing.zhang@rock-chips.com
Subject: Re: [PATCH v3 08/10] drm/rockchip: dw_dp: Add runtime PM support
Message-ID: <alfV1691ZgZ6KylX@venus>
References: <20260612-synopsys-dw-dp-improvements-v3-0-dc61e6352508@collabora.com>
 <20260612-synopsys-dw-dp-improvements-v3-8-dc61e6352508@collabora.com>
 <CANbgqATR-V0rRGfzj0hdJ2hsJex-iWzHMwD1L4vavTi2Jd79Kw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="m5xipsbap4cvs25e"
Content-Disposition: inline
In-Reply-To: <CANbgqATR-V0rRGfzj0hdJ2hsJex-iWzHMwD1L4vavTi2Jd79Kw@mail.gmail.com>
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-0.2.10.1.5.2/284.121.97
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_120055_399075_B314174C 
X-CRM114-Status: GOOD (  17.82  )
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


--m5xipsbap4cvs25e
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 08/10] drm/rockchip: dw_dp: Add runtime PM support
MIME-Version: 1.0

Hello Andy,

On Tue, Jul 14, 2026 at 06:08:06PM +0800, Andy Yan wrote:
> > @@ -58,6 +59,8 @@ static void dw_dp_rockchip_hpd_sw_sel(void *data, bool
> > force_hpd_from_sw)
> >
> >         dp->hpd_sel =3D force_hpd_from_sw;
> >
> > +       ACQUIRE(pm_runtime_active_auto, pm)(dp->dev);
>=20
> This can triger  HPD irq for USB-C DP AltMode, but for a standard
> DP port, this is no way to acquire runtime, so there will no irq
> when plug in.

Right. I don't have any RK3588 or RK3576 system exposing a DP
connector directly. This this is non-trivial to test for me :/

I see the following options:

1. Only enable runtime PM when running in USB-C mode
2. Mux the HPD pin as GPIO to support waking up with the controller
   being suspended; either remux when the controller is awake or use
   the same mechanism as USB-C to do software based HPD on top of the
   GPIO (which would allow using any GPIO as HPD).
3. Have a poll function, which wakes up the controller regularly to
   check the status

I consider going for option 1 for now, which allows option 2 to be
implemented as a follow up. Mostly to avoid that the series becomes
as big and messy as the USBDP PHY series became.

Greetings,

-- Sebastian

--m5xipsbap4cvs25e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmpX2LgACgkQ2O7X88g7
+pofLA/9Gk+Hgl5TYBlSBTTGDlszYL/ZEfUIjLTcafwMgKO2MWL3n75mkgEi13Js
0GT01J5veXw8MzGn/IQocRtb8S56feu/IYYUMOE10vlBAMoOfXbRjHrKgveqUcdO
MvnaVVgy59xFHrxkMBXAtEGW4ghJjWA2kpoN5wN3Xh6DEzFfedI+JaN//fqCYLBZ
syCPN/uKQzxnmyQFpLEb8Mn4SQZslnGCAzLjIC6krN0MeD0IpkdgaSsAyRHO7re8
BpEMCuIMjroeZqNSkotoVSd8ByCMLF8S0EV1KsyW5PIY5j50BC9uBKXvJiKWml3o
MduS/NpzM3ESfxxYdDwX/hD1jdaOHLJlyVcJXxHFir2kgqYvR+Eov/Uv+uKupeRt
j7NycFrW0kZzgY+uQ6AEPrNLQOXmKimhoIrn75HZoS2+4aezaQf26bmrdRg/9fEN
rLO9OgREMcIuebfZyyOGXiC6UoQmRvUu+OxcCPh8ILsi+80OfTXF8y8zmUY/PGJN
lLF+kTfiqKGNe+3Ka8mkXiGi5kVEJUUqEKqX+j75LL6kDEknWJC3sFWEds5Ep3hD
1/CJdhbeEAyFpzmJuJun5MXb0HN0yFkPau6I2kSL15m3nTDkvZ5gPj0FX6AMpodP
7sgketnrnf6at+yLz3v6Y1d4dUWgPJUsEp5PAQnWew5x1FJYgVI=
=LMCP
-----END PGP SIGNATURE-----

--m5xipsbap4cvs25e--

