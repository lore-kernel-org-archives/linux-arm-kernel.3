Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EE0DC44501
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 19:31:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hL1GS79qzyM0ipi8jemKvD9nfesfcOl399h19NOhaM8=; b=nqljKynx86+3/0gqEj/tdpnHfF
	gIaJFRAGCZUXgv9gjfNWjs1QiEVTaX+kTti9nLIlOuwWYKZXlazNlsaNpjbUVSoBLCCwPVripf2Tb
	xw31FCLMF9rUq1MlN6RSbt9JvnjZdRYLyd+1zUyAZhHZyJ+HM23ZOmU+rLrbnfqCQHMEgTEBOxBHi
	lLiKlj4KAj07MCfjue4MogceRjljQBBH/XXSzSy/swugf2TPeGqAcqdO5J+B9zb95kPCAGAJGQ9Ia
	ZbVkgmpFaFCH+RlOWZeVG1Zna0oNWRWZoSoLycS9InyFAt/pl98PMJ3gWC58OzxmQpZPlq+qHQGjg
	gdymQ0wA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk5Jp-0000000FmxT-37Xf;
	Wed, 15 Jul 2026 19:30:57 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk5Jn-0000000Fmwp-0rSp;
	Wed, 15 Jul 2026 19:30:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=hL1GS79qzyM0ipi8jemKvD9nfesfcOl399h19NOhaM8=; b=zb9QXW1XMG4YfPtNV3RG+62Zmd
	v8UvwL/ktHs4FtJ/TP0zlhZleTu7M3ckwlhFjD4fw+uytYiKG7LFVdi6L8rfGJpoUn9NXkCz66pN8
	/qJeCo+4hjVSn+09UJwGZkBRxCikUAhVFdv/Y9jHZhsRA7jr9+/oTwWrn4fM7+AzWXr5cTmo4EQlr
	fPpdq9Hyo1NSmaiNWEznadQPhH77OjmmymXNzamcUS3zD+zTNqb3owWxhn+mkg5Tv/Pndg4MN0jc+
	XA/8uJNplYQGHCcxu061mq29I4T0soEHVGDgIqoMeWlNxc6tMpWJkAUf+VeOvTW/IHgHRScOlzpOk
	uLO0XDIg==;
From: Heiko Stuebner <heiko@sntech.de>
To: Andy Yan <andyshrk@gmail.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Sandy Huang <hjc@rock-chips.com>, Andy Yan <andy.yan@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Damon Ding <damon.ding@rock-chips.com>, Dmitry Baryshkov <lumag@kernel.org>,
 Alexey Charkov <alchark@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, kernel@collabora.com,
 linux-arm-kernel@lists.infradead.org, yubing.zhang@rock-chips.com
Subject: Re: [PATCH v3 08/10] drm/rockchip: dw_dp: Add runtime PM support
Date: Wed, 15 Jul 2026 21:30:27 +0200
Message-ID: <2301403.NgBsaNRSFp@phil>
In-Reply-To: <alfV1691ZgZ6KylX@venus>
References: <20260612-synopsys-dw-dp-improvements-v3-0-dc61e6352508@collabora.com>
 <CANbgqATR-V0rRGfzj0hdJ2hsJex-iWzHMwD1L4vavTi2Jd79Kw@mail.gmail.com>
 <alfV1691ZgZ6KylX@venus>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_123055_248588_702D9D37 
X-CRM114-Status: GOOD (  21.05  )
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

Am Mittwoch, 15. Juli 2026, 21:00:12 Mitteleurop=C3=A4ische Sommerzeit schr=
ieb Sebastian Reichel:
> Hello Andy,
>=20
> On Tue, Jul 14, 2026 at 06:08:06PM +0800, Andy Yan wrote:
> > > @@ -58,6 +59,8 @@ static void dw_dp_rockchip_hpd_sw_sel(void *data, b=
ool
> > > force_hpd_from_sw)
> > >
> > >         dp->hpd_sel =3D force_hpd_from_sw;
> > >
> > > +       ACQUIRE(pm_runtime_active_auto, pm)(dp->dev);
> >=20
> > This can triger  HPD irq for USB-C DP AltMode, but for a standard
> > DP port, this is no way to acquire runtime, so there will no irq
> > when plug in.
>=20
> Right. I don't have any RK3588 or RK3576 system exposing a DP
> connector directly. This this is non-trivial to test for me :/
>=20
> I see the following options:
>=20
> 1. Only enable runtime PM when running in USB-C mode
> 2. Mux the HPD pin as GPIO to support waking up with the controller
>    being suspended; either remux when the controller is awake or use
>    the same mechanism as USB-C to do software based HPD on top of the
>    GPIO (which would allow using any GPIO as HPD).
> 3. Have a poll function, which wakes up the controller regularly to
>    check the status
>=20
> I consider going for option 1 for now, which allows option 2 to be
> implemented as a follow up. Mostly to avoid that the series becomes
> as big and messy as the USBDP PHY series became.

I'd agree with that solution.
I think we can all agree that option 3 is baaaad :-) .

So with 1, functionality keeps working, and then someone can put the
special HPD handling on top later - the Rock-5-ITX does expose the DP1
(on a hdmi port)


Heiko



