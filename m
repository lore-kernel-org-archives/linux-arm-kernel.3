Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 745F1E81A25
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Feb 2026 14:41:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F2UA0yW+NVCi0Rj+zD3YngWiaGKgRpmAvZ4q7nxAizA=; b=SmQIFItebYGrIgXqW+vgqjXATg
	d9WoI/tJA+7FOWEVvu/xIwvoBe0kQZTy2HCbILkMEvvBkuMgrFigmseL6+MiEWoyfD+D+JmR4141A
	xPDiXuR+PezmvX7Av0aDsdPcMdieRQZMFK0AHZEzo9LpZEDzlFFPSN3zAMzru9lN+mTzRqZuXYRZJ
	Tne2tGOCMFviF5Jjg7EJI+E9KhX0BwQohgEFeu0FCebZQSV1WH5N3finoWWvyqO+LjWXA3/LzULsB
	PJDGbdJX0qe8Qjmd3F4Hq3xwVs20Yd1HwiftYR8fjALrob1VhiLjB3hwm+GiUynzh/rkUb8Ho3NV/
	zQa3G0Sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrzn8-00000006o85-1MWz;
	Mon, 16 Feb 2026 14:41:38 +0000
Received: from forward501a.mail.yandex.net ([178.154.239.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrzn4-00000006o7U-0PCG;
	Mon, 16 Feb 2026 14:41:36 +0000
Received: from mail-nwsmtp-smtp-production-main-84.vla.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-84.vla.yp-c.yandex.net [IPv6:2a02:6b8:c1f:1311:0:640:df31:0])
	by forward501a.mail.yandex.net (Yandex) with ESMTPS id 0B3A68095D;
	Mon, 16 Feb 2026 17:41:23 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-84.vla.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id 9fZpnRiGtW20-b1bTBWDR;
	Mon, 16 Feb 2026 17:41:21 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onurozkan.dev;
	s=mail; t=1771252882;
	bh=F2UA0yW+NVCi0Rj+zD3YngWiaGKgRpmAvZ4q7nxAizA=;
	h=Cc:Message-ID:Subject:Date:References:To:From:In-Reply-To;
	b=NyvCOl3o32x+iw1Q465tLwUlGI6/pT7B+o8ykON6zPRVCpP9TWHQVo66Dl0dXUpYO
	 XEjlGZ5m3fQsjtEv8rMvU1yImXWRtRnxzzZotGxdsv9PNj1r0BsVLrp8K4LdU+VB1L
	 ZfkUfT5iG17ey+b/r53LyB2iWI72kZkpO+NQZFKc=
Authentication-Results: mail-nwsmtp-smtp-production-main-84.vla.yp-c.yandex.net; dkim=pass header.i=@onurozkan.dev
Date: Mon, 16 Feb 2026 17:41:07 +0300
From: Onur =?UTF-8?B?w5Z6a2Fu?= <work@onurozkan.dev>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Matthias Brugger
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v1 2/2] drm/panthor: treat sram as mandatory except
 mt8196
Message-ID: <20260216174107.1b9c03a4@nimda>
In-Reply-To: <20260216103743.626c71e3@fedora>
References: <20260215100302.136719-1-work@onurozkan.dev>
	<20260215100302.136719-2-work@onurozkan.dev>
	<20260216103743.626c71e3@fedora>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260216_064134_337628_500F8D80 
X-CRM114-Status: GOOD (  25.47  )
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

On Mon, 16 Feb 2026 10:37:43 +0100
Boris Brezillon <boris.brezillon@collabora.com> wrote:

> On Sun, 15 Feb 2026 13:02:51 +0300
> Onur =C3=96zkan <work@onurozkan.dev> wrote:
>=20
> > If sram-supply is missing, Panthor falls back to a
> > dummy regulator with a warning. This implicit behavior
> > hides missing DT wiring behind regulator core fallback.
> >=20
> > Make SRAM handling explicit: require sram-supply for all
> > Panthor compatibles except mt8196-mali where GPU supplies
> > are intentionally managed outside Panthor and DT does not
> > model sram-supply for that compatible.
> >=20
> > This keeps DT power modeling explicit and avoids relying on
> > dummy-regulator fallback.
> >=20
> > Link: https://lore.kernel.org/all/20260213155937.6af75786@nimda/
> > Signed-off-by: Onur =C3=96zkan <work@onurozkan.dev>
> > ---
> >  drivers/gpu/drm/panthor/panthor_devfreq.c | 13 +++++++++----
> >  1 file changed, 9 insertions(+), 4 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/panthor/panthor_devfreq.c
> > b/drivers/gpu/drm/panthor/panthor_devfreq.c index
> > 2249b41ca4af..5f6075f18fe3 100644 ---
> > a/drivers/gpu/drm/panthor/panthor_devfreq.c +++
> > b/drivers/gpu/drm/panthor/panthor_devfreq.c @@ -206,12 +206,17 @@
> > int panthor_devfreq_init(struct panthor_device *ptdev)
> >  	 * But without knowing if it's beneficial or not (in term
> > of power
> >  	 * consumption), or how much it slows down the
> > suspend/resume steps,
> >  	 * let's just keep regulators enabled for the device
> > lifetime.
> > +	 *
> > +	 * Treat sram-supply as mandatory except for mt8196-mali.
> > It manages
> > +	 * SRAM outside Panthor so this driver must not require
> > direct control
> > +	 * over it.
> >  	 */
> > -	ret =3D devm_regulator_get_enable_optional(dev, "sram");
> > -	if (ret && ret !=3D -ENODEV) {
> > -		if (ret !=3D -EPROBE_DEFER)
> > +	if (!of_device_is_compatible(dev->of_node,
> > "mediatek,mt8196-mali")) {
>=20
> Rather than checking for specific compats here, let's go for
> a dont_need_sram_supply bool in panthor_soc_data.
>=20

Makes sense.

> > +		ret =3D devm_regulator_get_enable_optional(dev,
> > "sram");
>=20
> If we assume SRAM supply is mandatory, should this be
> devm_regulator_get_enable() instead?
>

That was the first thing I did but when I tested it, it didn't work as
expected because devm_regulator_get_enable() fell back to the dummy
regulator without returning an error.

Regards,
Onur
=20
> > +		if (ret) {
> >  			DRM_DEV_ERROR(dev, "Couldn't
> > retrieve/enable sram supply\n");
> > -		return ret;
> > +			return ret;
> > +		}
> >  	}
> > =20
> >  	opp =3D devfreq_recommended_opp(dev, &cur_freq, 0);
>=20


